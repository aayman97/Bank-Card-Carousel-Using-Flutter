import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bank_card_model.dart';
import 'constants.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {


    final PageController _pg = PageController(
    viewportFraction: .8,
    initialPage: 1,
  );

  double page = 1;
  double pageClamp = 1;

  String cardNumber = "";
  

    @override
  void initState() {
    _pg.addListener((){
       setState(() {
      page = _pg.page!;
      pageClamp = page.clamp(0, 1);
    });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     print(pageClamp);

     if(page >= 1){
       setState(() {
         cardNumber="";
       });
     }
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top :  pageClamp* size.height * .275,
              bottom : pageClamp * size.height * .225,
              left : pageClamp* size.width * .1,
              right: pageClamp* size.width * .2,
              child: Transform.translate(
                offset: Offset(  page < 1 ? 0 : (-1 * page * size.width + size.width), 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                    pageClamp* Constants.radius,
                    ),
                  ),
                 
                ),
              ),
            
            ),


            Positioned(
                top :  page == 0 ? 0 :size.height * .25,
              bottom : page == 0 ? 0 : size.height * .2,
              left : size.width * 0,
              right: size.width * .01,
              child: Transform.translate(
                offset: Offset((-30*pageClamp ) +30,
                              0),
                child: PageView.builder(
                  controller: _pg,
                  itemCount: cards.length,  
                  itemBuilder: (context,index){

                    if(cards[index] != null){
                      return SizedBox(
                        
                        child: Stack(
                        children: [
                          BankCards(cards[index]!.image,size),
                          Container(
                            padding: EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                ClipOval(
                                  child: Image.asset(cards[index]!.icon,width :size.width*0.15 ),
                                ),
                                Text(cards[index]!.number,style:GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white.withOpacity(0.5),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:30)) )

                              ],

                            ),
                          ),
  
                          Positioned(
                            top :  380,
                            left : 30,
                            child: Text(cards[index]!.balance.toString()+"\$", style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:30))  
                            ))
                        ],
                      ));
                    }
                    else{
                      return Container(
                        margin: const EdgeInsets.symmetric(
        horizontal: Constants.padding,
      ),
                   decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                  Constants.radius,
                  ),

                  
                ),
                
              );
                    }
                  }
                
                )
              )
            ),
            

            Positioned(
              bottom : size.height*0.7 +(pageClamp*size.height*0.7),
              left : size.width*0.28,
              child: Opacity(
                opacity : -pageClamp + 1,
                child: Center(
                  child:  Text("Your card number",style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:20)),
                          ) ,
                ),
                
               ),
            ) , 

            AnimatedPositioned(
              duration: Duration(milliseconds: 50),
              bottom : size.height*0.64+-(pageClamp*size.height*0.65),
              left : cardNumber.length <= 1 ? size.width*0.5 : size.width*(0.5 - (cardNumber.length -1)*0.015),
              child: Opacity(opacity : -pageClamp + 1, 
            
                child: Text(cardNumber, style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:20))
                          ),
              ),
            ),

           Positioned(
               top : size.height*0.4  + (pageClamp *size.height*0.82),
              left : size.width*0.15,
             child: Opacity(opacity : -pageClamp + 1,
             child:   Container(
                            width : size.width*0.7,
                            height : size.height*0.4,
                            decoration: BoxDecoration(
                              color : Colors.transparent
                            ),
                            padding: EdgeInsets.all(10),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      NumberButtons(number : 1),
                                      NumberButtons(number : 2),
                                      NumberButtons(number: 3)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      NumberButtons(number : 4),
                                      NumberButtons(number : 5),
                                      NumberButtons(number: 6)
                                    ],
                                  ),
                                ),
              
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      NumberButtons(number :7),
                                      NumberButtons(number : 8),
                                      NumberButtons(number: 9)
                                    ],
                                  ),
                                ),
              
                                 Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Icon(Icons.qr_code_scanner_rounded, size: 25,color: Colors.white, ),
                                      NumberButtons(number : 0),
                                     GestureDetector(
                                       onTap:() {
                                         setState(() {
                                           if(cardNumber.length > 0){
                                              cardNumber = cardNumber.substring(0,cardNumber.length-1);
                                           }
                                          
                                         });
                                       },
                                       onLongPress: () {
                                         setState(() {
                                           cardNumber ="";
                                         });
                                       },
                                       
                                       child: Icon(Icons.backspace_rounded, size: 25, color: Colors.white,))
                                    ],
                                  ),
                                ),
                              ],
                            ) ,
                          ),
              
             ),
           ),

          Positioned(
               top : size.height*0.82 + (pageClamp *size.height*0.82),
              left : size.width*0.1,
            child: Opacity(opacity : -pageClamp + 1,
          
            child:  GestureDetector(
              child: Container(
                            width : size.width*0.8,
                            height: size.height*0.08,
                            decoration: BoxDecoration(
                              color : Colors.indigo.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text("Add card", style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:20)
                                                  )
                                                  ),
                            )
                            ),
                          ),
            ),
            ),
        
            



          ],
        ),
      );
  }

  GestureDetector NumberButtons({required int number}) {
    return GestureDetector(

                              onTap: () {
                                setState(() {
                                  cardNumber = cardNumber + number.toString();
                                });
                              },
                                  child: Text(number.toString(), style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:30))
                                                  ),
                                  
                                );
  }

  Container BankCards(String pathoftheimage,Size size) {
    return Container(
      height: size.height*0.7,
        margin: const EdgeInsets.symmetric(
        horizontal: Constants.padding,
      ),
                   decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(
                  Constants.radius,
                  ),
                ),
                child: ClipRRect(
                  borderRadius : BorderRadius.circular(Constants.radius,),
                  child: Image.asset(pathoftheimage,fit: BoxFit.fill,)
                  ),
              );
  }
}