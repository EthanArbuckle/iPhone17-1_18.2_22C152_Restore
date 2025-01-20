@interface CCDAuthKitUtilities
+ (BOOL)shouldActivateAnisette;
+ (void)midWithCompletion:(id)a3;
@end

@implementation CCDAuthKitUtilities

+ (BOOL)shouldActivateAnisette
{
  id v9 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v2 = (void (*)(id *))off_100025590;
  v13 = off_100025590;
  if (!off_100025590)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v15 = sub_100004910;
    v16 = &unk_10001C620;
    v17 = &v10;
    sub_100004910((uint64_t)&buf);
    v2 = (void (*)(id *))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v2) {
    sub_100011E24();
  }
  v3 = v2(&v9);
  id v4 = v9;
  if (v4 || !v3)
  {
    v7 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to load activation record when activating anisette with error: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    BOOL v6 = 0;
  }
  else
  {
    v5 = [v3 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
    BOOL v6 = (~(unint64_t)[v5 integerValue] & 0x21) == 0;
  }
  return v6;
}

+ (void)midWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v4 = (void *)qword_1000255A0;
  uint64_t v14 = qword_1000255A0;
  if (!qword_1000255A0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004AC4;
    v10[3] = &unk_10001C620;
    v10[4] = &v11;
    sub_100004AC4((uint64_t)v10);
    id v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  BOOL v6 = objc_opt_new();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004800;
  v8[3] = &unk_10001C5F8;
  id v9 = v3;
  id v7 = v3;
  [v6 anisetteDataWithCompletion:v8];
}

@end