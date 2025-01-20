@interface _ANEProgramCache
+ (id)programForConnection:(id)a3 model:(id)a4 bundleID:(id)a5;
+ (unint64_t)programCountForConnection:(id)a3;
+ (void)initialize;
+ (void)removeAllProgramsForConnection:(id)a3;
+ (void)removeProgramForConnection:(id)a3 model:(id)a4 bundleID:(id)a5;
@end

@implementation _ANEProgramCache

+ (void)initialize
{
  id v2 = [&__NSDictionary0__struct mutableCopy];
  v3 = (void *)qword_100032BC0;
  qword_100032BC0 = (uint64_t)v2;

  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.ane.program", v6);
  v5 = (void *)qword_100032BC8;
  qword_100032BC8 = (uint64_t)v4;
}

+ (id)programForConnection:(id)a3 model:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1000021F0;
  v27 = sub_100002200;
  id v28 = 0;
  v11 = qword_100032BC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002208;
  block[3] = &unk_10002C5B8;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v14 = v8;
  id v20 = v14;
  v21 = &v23;
  SEL v22 = a2;
  dispatch_sync(v11, block);
  [(id)v24[5] addCachedReference];
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v15;
}

+ (void)removeProgramForConnection:(id)a3 model:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = qword_100032BC8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100002530;
  v15[3] = &unk_10002C5E0;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  SEL v19 = a2;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(v11, v15);
}

+ (void)removeAllProgramsForConnection:(id)a3
{
  id v4 = a3;
  v5 = qword_100032BC8;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000029BC;
  v7[3] = &unk_10002C648;
  id v8 = v4;
  SEL v9 = a2;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (unint64_t)programCountForConnection:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v4 = qword_100032BC8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002BB8;
  v8[3] = &unk_10002C670;
  id v9 = v3;
  id v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end