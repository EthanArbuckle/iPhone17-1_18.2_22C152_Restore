@interface FMDMteStatusUtil
+ (void)fetchMteStatusWithCompletion:(id)a3;
@end

@implementation FMDMteStatusUtil

+ (void)fetchMteStatusWithCompletion:(id)a3
{
  v3 = (void (**)(id, const __CFString *, void *))a3;
  id v17 = 0;
  v4 = +[CKKSControl CKKSControlObject:0 error:&v17];
  id v5 = v17;
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100242FA8((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }

    v14 = [v5 description];
    v3[2](v3, @"controlObjCreationError", v14);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B2E74;
    v15[3] = &unk_1002DCD18;
    v16 = v3;
    [v4 rpcStatus:@"Manatee" reply:v15];
    v14 = v16;
  }
}

@end