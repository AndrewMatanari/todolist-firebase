import 'package:flutter/material.dart';
import 'package:todolist/const/color.dart';
import 'package:todolist/data/auth_data.dart';


class LoginScreen extends StatefulWidget{
  final VoidCallback show;
  const LoginScreen(this.show, {super.key});

  @override
  State<LoginScreen> createState()=> _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
      });
    super.initState();
      _focusNode2.addListener((){
        setState(() {});
      });
    }
    
    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: backgroundColors,
        body : SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [const SizedBox(height: 20),
            image(),
            const SizedBox(height: 20),
            textfield(email, _focusNode1, 'Email', Icons.email),
            const SizedBox(height: 20),
            textfield(password, _focusNode2, 'Password', Icons.password),
            const SizedBox(height: 20),
            account(),
            const SizedBox(height: 20),
            Login_bottom(),
            ],
            ),
          )
        )
      );
    }

    Widget account(){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal:15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Belum punya akun?",
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: widget.show,
              child: const Text(
                'Daftar',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      );
    }

    Widget Login_bottom(){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
          onTap: () {
            AuthenticationRemote().login(email.text, password.text);
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: custom_green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      );
    }

    Widget textfield(TextEditingController controller, FocusNode focusNode, String typeName, IconData iconss ) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: Icon(
                iconss,
                color: focusNode.hasFocus ? custom_green : const Color(0xffc5c5c5),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                hintText: typeName,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide : const BorderSide(
                    color: Color(0xffc5c5c5),
                    width: 2.0
                  ),
                ),
            ),
          ),
        ),
      );
    }

    Widget image(){
      return Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color : backgroundColors,
          image : const DecorationImage(image: AssetImage('images/7.png'),
          fit: BoxFit.fitWidth,
          ),
        ),
      ),
      );
    }


    }
