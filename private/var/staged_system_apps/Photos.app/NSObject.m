@interface NSObject
- (void)ppt_startIterationWithBlock:(id)a3 completion:(id)a4;
@end

@implementation NSObject

- (void)ppt_startIterationWithBlock:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100025F84;
  v26 = sub_100025FB0;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100025F84;
  v20 = sub_100025FB0;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003E348;
  v12[3] = &unk_1000644D0;
  v14 = &v22;
  v15 = &v16;
  id v6 = a4;
  id v13 = v6;
  v7 = objc_retainBlock(v12);
  id v8 = [v5 copy];
  v9 = (void *)v23[5];
  v23[5] = (uint64_t)v8;

  id v10 = [v7 copy];
  v11 = (void *)v17[5];
  v17[5] = (uint64_t)v10;

  (*(void (**)(void))(v23[5] + 16))();
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

@end