import 'package:ewallet/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF3D538F)),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 132, 187, 232),
                borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              width: 35,
              height: 35,
              child: Center(
                child: Text(
                  transaction.to
                      .split(" ")
                      .map((e) => e.substring(0, 1))
                      .toList()
                      .join(),
                  style: const TextStyle(
                      color: Color(0xFF3D538F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(transaction.to,
                      style: const TextStyle(
                          color: Color(0xFF3D538F),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Text(transaction.date,
                    style: const TextStyle(
                      color: Color(0xFF3D538F),
                      fontSize: 14,
                    ))
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("Rp. ${transaction.to}",
                    style: const TextStyle(
                        color: Color(0xFFFA6D60),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              Text(transaction.description,
                  style: const TextStyle(
                    color: Color(0xFF3D538F),
                    fontSize: 12,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
