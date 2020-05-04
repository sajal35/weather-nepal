import 'package:flutter/material.dart';
import 'package:weatherapp/model/service.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Service service = new Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: service.getWeather(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                      var mydata = snapshot.data[index];
                      return ListTile(
                        title: Text('Place: ' + mydata['place']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Max: ' + mydata['max']),
                            Text('Min: ' + mydata['min']),
                            Text('Rain: ' + mydata['rain']),

                          ],
                        ),
                      );
                    },
                  );
                }else{
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}