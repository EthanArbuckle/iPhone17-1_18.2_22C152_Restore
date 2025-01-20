@interface MISLaunchWarningDatabase
- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 withError:(id *)a5;
- (id)queryForBundle:(id)a3 withError:(id *)a4;
- (id)queryForExecutableURL:(id)a3 withError:(id *)a4;
@end

@implementation MISLaunchWarningDatabase

- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 withError:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    v8 = objc_opt_new();
    id v14 = 0;
    [v8 setUserOverride:v9 forBundle:v6 error:&v14];
    id v10 = v14;
    v11 = v10;
    BOOL v12 = v10 == 0;
    if (a5 && v10) {
      *a5 = v10;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (id)queryForExecutableURL:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    BOOL v6 = objc_opt_new();
    v8 = [v6 queryExecutableURL:v7 error:a4];
  }
  else
  {
    v9 = [MISLaunchWarningQueryResult alloc];
    v8 = [v9 initWithWarningState:v10 userOverridden:0 kbURL:0];
  }

  return v8;
}

- (id)queryForBundle:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    BOOL v6 = objc_opt_new();
    v8 = [v6 queryAppBundle:v7 error:(NSError **)a4];
  }
  else
  {
    v9 = [MISLaunchWarningQueryResult alloc];
    v8 = [v9 initWithWarningState:v10 userOverridden:0 KBURL:0];
  }

  return v8;
}

@end