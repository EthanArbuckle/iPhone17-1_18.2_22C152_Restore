@interface FMDOctStatusUtil
+ (void)fetchOctStatusWithCompletion:(id)a3;
@end

@implementation FMDOctStatusUtil

+ (void)fetchOctStatusWithCompletion:(id)a3
{
  v3 = (void (**)(id, const __CFString *, void *))a3;
  id v12 = 0;
  v4 = +[OTControl controlObject:1 error:&v12];
  id v5 = v12;
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
      sub_100240538((uint64_t)v5, v7);
    }

    v9 = [v5 description];
    v3[2](v3, @"controlObjCreationError", v9);
  }
  else
  {
    uint64_t v8 = OTDefaultContext;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10007A580;
    v10[3] = &unk_1002DB2E8;
    v11 = v3;
    [v4 status:0 context:v8 reply:v10];
    v9 = v11;
  }
}

@end