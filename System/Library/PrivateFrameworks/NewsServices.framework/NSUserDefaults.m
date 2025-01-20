@interface NSUserDefaults
+ (id)nanoNewsSyncDefaults;
- (void)nn_synchronizeKeys:(id)a3;
@end

@implementation NSUserDefaults

+ (id)nanoNewsSyncDefaults
{
  if (qword_1000175B0 != -1) {
    dispatch_once(&qword_1000175B0, &stru_100010358);
  }
  v2 = (void *)qword_1000175A8;
  return v2;
}

- (void)nn_synchronizeKeys:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v4 = (void *)qword_1000175B8;
  uint64_t v11 = qword_1000175B8;
  if (!qword_1000175B8)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100001810;
    v7[3] = &unk_100010380;
    v7[4] = &v8;
    sub_100001810((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  v6 = objc_opt_new();
  [v6 synchronizeUserDefaultsDomain:@"com.apple.nanonews.sync" keys:v3];
}

@end