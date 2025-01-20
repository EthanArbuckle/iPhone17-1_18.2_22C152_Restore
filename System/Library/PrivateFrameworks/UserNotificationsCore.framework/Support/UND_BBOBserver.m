@interface UND_BBOBserver
+ (id)gatewayWithQueue:(id)a3 calloutQueue:(id)a4 name:(id)a5 priority:(unint64_t)a6;
@end

@implementation UND_BBOBserver

+ (id)gatewayWithQueue:(id)a3 calloutQueue:(id)a4 name:(id)a5 priority:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v12 = (void *)qword_10000CAE0;
  uint64_t v20 = qword_10000CAE0;
  if (!qword_10000CAE0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000020B4;
    v16[3] = &unk_1000085B0;
    v16[4] = &v17;
    sub_1000020B4((uint64_t)v16);
    v12 = (void *)v18[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v17, 8);
  v14 = [v13 gatewayWithQueue:v9 calloutQueue:v10 name:v11 priority:a6];

  return v14;
}

@end