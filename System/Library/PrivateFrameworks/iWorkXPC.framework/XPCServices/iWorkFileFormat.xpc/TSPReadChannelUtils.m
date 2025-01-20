@interface TSPReadChannelUtils
+ (id)dataFromReadChannel:(id)a3;
@end

@implementation TSPReadChannelUtils

+ (id)dataFromReadChannel:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v17 = 0;
  v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100052574;
  v21 = sub_100052584;
  id v22 = 0;
  if (v4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = sub_100052574;
    v15 = sub_100052584;
    id v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005258C;
    v10[3] = &unk_1001C91F8;
    v10[4] = &v11;
    v10[5] = &v17;
    v10[6] = a1;
    [v4 readWithHandlerAndWait:v10];
    v6 = (void *)v12[5];
    if (v6) {
      objc_storeStrong(v18 + 5, v6);
    }
    _Block_object_dispose(&v11, 8);

    id v7 = v18[5];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v17, 8);

  return v8;
}

@end