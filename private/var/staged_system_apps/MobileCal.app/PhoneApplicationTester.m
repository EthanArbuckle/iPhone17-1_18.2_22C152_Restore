@interface PhoneApplicationTester
- (id)extendedLaunchTestName;
@end

@implementation PhoneApplicationTester

- (id)extendedLaunchTestName
{
  v2 = +[CUIKPreferences sharedPreferences];
  v3 = [v2 lastViewMode];
  id v4 = [v3 integerValue];

  unint64_t v5 = 3;
  if (v4 != (id)-1) {
    unint64_t v5 = (unint64_t)v4;
  }
  if (v5 < 4) {
    return (id)qword_1001D5E50[v5];
  }
  v7 = kCalUILogTestHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unknown view type encountered while trying to determine 'extendedLaunchTestName'", v8, 2u);
  }
  return 0;
}

@end