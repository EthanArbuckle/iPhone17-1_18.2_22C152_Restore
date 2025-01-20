@interface ContactsTestingManager
+ (id)contactToShowForLaunchTestWithStore:(id)a3;
+ (id)defaultTestingManager;
- (BOOL)runTest:(id)a3 options:(id)a4 splitViewController:(id)a5;
- (id)currentTest;
- (void)setCurrentTest:(id)a3;
@end

@implementation ContactsTestingManager

+ (id)defaultTestingManager
{
  if (qword_100025B98 != -1) {
    dispatch_once(&qword_100025B98, &stru_10001C7C0);
  }
  v2 = (void *)qword_100025B90;

  return v2;
}

- (BOOL)runTest:(id)a3 options:(id)a4 splitViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ContactsTestingManager *)self currentTest];
  [v11 prepareForNextTest];

  [(ContactsTestingManager *)self setCurrentTest:0];
  v12 = [v9 objectForKeyedSubscript:@"testClass"];
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v14 = [v8 stringByAppendingString:@"Test"];
  }
  v15 = v14;

  v16 = [NSClassFromString(v15) testWithSplitViewController:v10];

  [(ContactsTestingManager *)self setCurrentTest:v16];
  unsigned __int8 v17 = [v16 prepareForTestWithOptions:v9];

  return v17;
}

+ (id)contactToShowForLaunchTestWithStore:(id)a3
{
  id v3 = a3;
  v4 = (void *)CFPreferencesCopyValue(@"LaunchToCard", @"com.apple.PeoplePicker", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = (void *)CFPreferencesCopyValue(@"ContactToShow", @"com.apple.PeoplePicker", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    if (v6)
    {
      v7 = +[CNContactViewController descriptorForRequiredKeys];
      v11 = v7;
      id v8 = +[NSArray arrayWithObjects:&v11 count:1];
      id v9 = [v3 unifiedContactWithIdentifier:v6 keysToFetch:v8 error:0];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)currentTest
{
  return self->_currentTest;
}

- (void)setCurrentTest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end