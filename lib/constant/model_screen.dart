import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../cubit/app_cubit.dart';
import 'constant_screen.dart';

Widget builedtItem(dynamic model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        dismissdleFun(direction, context, model['id'], model);
        //AppCubit.get(context).deleteDatabase(id: model['id']);
      },
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0),
        color: Colors.redAccent,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color3,
              radius: 35.0,
              // the time in note
              child: Text(
                '${model['time']}',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: color1,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'archive',
                  id: model['id'],
                );
              },
              icon: Icon(
                Icons.archive,
                color: HexColor('#49beb7'),
              ),
            ),
          ],
        ),
      ),
    );

// the function for deriction in screen

void dismissdleFun(
  DismissDirection direction,
  BuildContext context,
  int index,
  dynamic task,
) {
  switch (direction) {
    case DismissDirection.endToStart:
      break;
    case DismissDirection.startToEnd:
      AppCubit.get(context).deleteDatabase(id: index);
      break;
    case DismissDirection.vertical:
      break;
    case DismissDirection.horizontal:
      break;
    case DismissDirection.up:
      break;
    case DismissDirection.down:
      break;
    case DismissDirection.none:
      break;
  }
}
