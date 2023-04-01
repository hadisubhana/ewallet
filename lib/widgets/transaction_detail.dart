import 'package:ewallet/models/transaction.dart';
import 'package:ewallet/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionDetail extends StatelessWidget {
  const TransactionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 10),
          child: Row(children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios)),
            const Text(
              "Histori Transaksi",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF3D538F),
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(transaction: transactions[index]);
            },
            itemCount: transactions.length,
          ),
        )
      ],
    );
  }
}
