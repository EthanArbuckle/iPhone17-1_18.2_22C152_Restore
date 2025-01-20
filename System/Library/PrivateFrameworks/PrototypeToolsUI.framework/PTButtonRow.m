@interface PTButtonRow
+ (id)rowWithTitle:(id)a3 actionHandler:(id)a4;
@end

@implementation PTButtonRow

+ (id)rowWithTitle:(id)a3 actionHandler:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007C2C;
  v11[3] = &unk_100018B50;
  id v12 = a4;
  id v6 = v12;
  id v7 = a3;
  v8 = +[PTRowAction actionWithHandler:v11];
  v9 = [a1 rowWithTitle:v7 action:v8];

  return v9;
}

@end