import 'package:flutter/material.dart';
import 'package:betebet/main.dart';

class RateAndReviewDialog extends StatefulWidget {
  @override
  _RateAndReviewDialogState createState() => _RateAndReviewDialogState();
}

class _RateAndReviewDialogState extends State<RateAndReviewDialog> {
  double _rating = 0.0;
  String _review = '';

  void _submitReview() {
    if (_rating != 0.0 && _review.isNotEmpty) {
      // Save the review and rating

      // Clear the input fields
      _rating = 0.0;
      _review = '';

      // Close the dialog
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Rate and Review'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 8.0),
              Expanded(
                child: Slider(
                  value: _rating,
                  min: 0.0,
                  max: 5.0,
                  divisions: 5,
                  onChanged: (value) {
                    setState(() {
                      _rating = value;
                    });
                  },
                ),
              ),
              SizedBox(width: 8.0),
              Text(_rating.toStringAsFixed(1)),
            ],
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 300.0),
            child: TextField(
              maxLines: 3,
              onChanged: (value) {
                setState(() {
                  _review = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Write a review',
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitReview,
          child: Text('Submit'),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Row(
            children: [
              FlutterLogo(size: 24),
              SizedBox(width: 8),
              Text(
                'BetEbet',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // handle
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width *
                          0.9, // Adjust height as needed
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(
                                    context); // Close the overlay widget
                              },
                            ),
                          ),
                          Text(
                            'Name: John Doe',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            'Balance: \$1000',
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              ); //  logout
                            },
                            child: Text('Logout'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Text(
                "Explore an exhilarating world of online gambling where luck and skill intertwine, offering endless opportunities to win big.",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/image1.png',
                            width: 100, height: 200),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle play button pressed
                                    // Add your custom functionality here
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Play',
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon:
                                    Icon(Icons.more_vert, color: Colors.amber),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RateAndReviewDialog();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/image2.png',
                            width: 100, height: 100),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Play',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon:
                                    Icon(Icons.more_vert, color: Colors.amber),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RateAndReviewDialog();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/image1.png',
                            width: 100, height: 200),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle play button pressed
                                    // Add your custom functionality here
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Play',
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon:
                                    Icon(Icons.more_vert, color: Colors.amber),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RateAndReviewDialog();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/image2.png',
                            width: 100, height: 100),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Play',
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon:
                                    Icon(Icons.more_vert, color: Colors.amber),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RateAndReviewDialog();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
