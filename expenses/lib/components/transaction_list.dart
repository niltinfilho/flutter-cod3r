import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
          children: [
            Text(
              'Nenhuma transação cadastrada!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Container(
              height: 250,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
        : ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            final tr = transactions[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FittedBox(
                      child: Text(
                        'R\$${tr.value}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  tr.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  DateFormat('d MMM y').format(tr.date),
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: IconButton(
                  onPressed: () => onRemove(tr.id),
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
              ),
            );
          },
        );
  }
}
