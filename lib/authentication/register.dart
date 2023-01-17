import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/widgets/custom_text_field.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();


  //profile picture
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  //location
  Position? position;
  List<Placemark>? placemarks;


  Future<void> getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {//this is to refresh the image
      imageXFile;
    });
  }

  //get current location
  getCurrentLocation() async {
    Position newPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    position = newPosition;

    placemarks = await placemarkFromCoordinates(
        position!.latitude,
        position!.longitude
    );

    Placemark pMark = placemarks![0];
    //get text address from longitude and latitude
    String completeAddress = '${pMark.subThoroughfare}, ${pMark.thoroughfare}, ${pMark.subLocality}, ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea}, ${pMark.postalCode}, ${pMark.country}';

    locationController.text = completeAddress;

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              getImage();
            },
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.20,
              backgroundColor: Colors.white,
              backgroundImage:
                  imageXFile == null ? null : FileImage(File(imageXFile!.path)),
              child: imageXFile == null
                  ? Icon(
                      Icons.add_photo_alternate,
                      size: MediaQuery.of(context).size.width * 0.20,
                      color: Colors.grey,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 10,),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: nameController,
                  hintText: "Name",
                  data: Icons.person,
                  isObscure: false,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  data: Icons.email,
                  isObscure: false,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  data: Icons.lock,
                  isObscure: true,
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  data: Icons.lock,
                  isObscure: true,
                ),
                CustomTextField(
                  controller: phoneController,
                  hintText: "Phone",
                  data: Icons.phone,
                  isObscure: false,
                ),
                CustomTextField(
                  controller: locationController,
                  hintText: "Cafe/Restaurant Address",
                  data: Icons.location_on,
                  isObscure: false,
                  enabled: false,
                ),
                Container(
                  width:400,
                  height: 40,
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                     label: const Text("Get my Current Location", style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.location_on, color: Colors.white,
                      ),
                      onPressed: (){
                       //onclick of the location button call the function
                        getCurrentLocation();
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),),
                    ),

                  ),

                ),

              ],
            ),
          ),
          const SizedBox(height: 30,),//adds space between the form and the button
          ElevatedButton(
            child: const Text(
              "SIGN UP",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 1),
              backgroundColor: Colors.cyan,

              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            ),
            onPressed: ()=>print("clicked"),
          ),
          const SizedBox(height: 30,),

        ],
      ),
    ),
    );
  }
}

// Center(
// child: CustomTextField(
// controller: anyController,
// data: Icons.phone,
// hintText: "Phone",
// isObscure: false,
// ),
// );
