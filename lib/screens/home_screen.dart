import 'package:ewallet/models/transaction.dart';
import 'package:ewallet/widgets/menu_box.dart';
import 'package:ewallet/widgets/transaction_detail.dart';
import 'package:ewallet/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade800, Colors.white60],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blueGrey,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage('https://i.pravatar.cc/150?img=11'),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Eren Yeager',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Stack(
                      children: const [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Icon(
                              Icons.brightness_1,
                              size: 8,
                              color: Colors.redAccent,
                            ))
                      ],
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: Column(children: const [
              Text(
                'Saldo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Rp. 2,000,000',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                MenuWidget(
                  icon: Icons.send_rounded,
                  text: "Kirim",
                ),
                MenuWidget(
                  icon: Icons.account_balance_wallet,
                  text: "Terima",
                ),
                MenuWidget(
                  icon: Icons.payment,
                  text: "Bayar",
                ),
                MenuWidget(
                  icon: Icons.more_horiz,
                  text: "lainnya",
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(45))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 25),
                    child: Row(children: [
                      const Expanded(
                          child: Text(
                        "Transaksi Terakhir",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3D538F)),
                      )),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const TransactionDetail(),
                          );
                        },
                        child: const Text(
                          "Lihat Semua",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF3D538F)),
                        ),
                      )
                    ]),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return TransactionItem(
                            transaction: transactions[index]);
                      },
                      itemCount: transactions.length,
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
