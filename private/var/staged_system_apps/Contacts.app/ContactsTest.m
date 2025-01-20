@interface ContactsTest
+ (id)testWithSplitViewController:(id)a3;
- (BOOL)isIPad;
- (BOOL)isRecap;
- (BOOL)prepareForTestWithOptions:(id)a3;
- (CNContactNavigationController)contactNavigationController;
- (ContactsSplitViewController)contactSplitViewController;
- (NSDictionary)testOptions;
- (void)performScrollTestWithScrollView:(id)a3 completionBlock:(id)a4;
- (void)setContactNavigationController:(id)a3;
- (void)setContactSplitViewController:(id)a3;
- (void)setIsIPad:(BOOL)a3;
- (void)setTestOptions:(id)a3;
- (void)showContactListWithCompletionBlock:(id)a3;
- (void)willStartTest;
@end

@implementation ContactsTest

- (BOOL)isRecap
{
  v2 = [(ContactsTest *)self testOptions];
  v3 = [v2 objectForKeyedSubscript:@"testType"];
  unsigned __int8 v4 = [v3 isEqual:@"recap"];

  return v4;
}

+ (id)testWithSplitViewController:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setContactSplitViewController:v4];
  v6 = [v4 contactNavigationController];

  [v5 setContactNavigationController:v6];
  v7 = +[UIDevice currentDevice];
  objc_msgSend(v5, "setIsIPad:", objc_msgSend(v7, "userInterfaceIdiom") == (id)1);

  return v5;
}

- (BOOL)prepareForTestWithOptions:(id)a3
{
  return 1;
}

- (void)willStartTest
{
  v2 = (void *)UIApp;
  id v4 = [(ContactsTest *)self testOptions];
  v3 = [v4 objectForKeyedSubscript:@"testName"];
  [v2 startedTest:v3];
}

- (void)showContactListWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(ContactsTest *)self isIPad])
  {
    id v5 = [(ContactsTest *)self contactSplitViewController];
    [v5 showColumn:1];

    v6 = [(ContactsTest *)self contactSplitViewController];
    v7 = [v6 transitionCoordinator];

    if (v7)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100009948;
      v15[3] = &unk_10001C6A8;
      v16 = v4;
      [v7 animateAlongsideTransition:0 completion:v15];
    }
    else if (v4)
    {
      v4[2](v4);
    }
  }
  else
  {
    v8 = (void *)UIApp;
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_100009960;
    v13 = &unk_10001C5C0;
    v14 = v4;
    [v8 installCACommitCompletionBlock:&v10];
    v9 = [(ContactsTest *)self contactSplitViewController];
    [v9 showContactList];

    v7 = v14;
  }
}

- (void)performScrollTestWithScrollView:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ContactsTest *)self isRecap])
  {
    if (+[RPTTestRunner isRecapAvailable])
    {
      id v8 = objc_alloc((Class)RPTScrollViewTestParameters);
      v9 = [(ContactsTest *)self testOptions];
      v10 = [v9 objectForKeyedSubscript:@"testName"];
      id v11 = [v8 initWithTestName:v10 scrollView:v6 completionHandler:v7];

      +[RPTTestRunner runTestWithParameters:v11];
LABEL_19:

      goto LABEL_20;
    }
    v16 = CNUILogTesting();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000F1F0(v16);
    }
  }
  else
  {
    v12 = [(ContactsTest *)self testOptions];
    v13 = [v12 objectForKeyedSubscript:@"delta"];
    v14 = v13;
    if (v13)
    {
      unsigned int v15 = [v13 intValue];
    }
    else
    {
      v17 = [(ContactsTest *)self testOptions];
      v18 = [v17 objectForKeyedSubscript:@"offset"];
      unsigned int v15 = [v18 intValue];
    }
    if (v15) {
      uint64_t v19 = v15;
    }
    else {
      uint64_t v19 = 20;
    }
    id v11 = [(ContactsTest *)self testOptions];
    v20 = [v11 objectForKeyedSubscript:@"testName"];
    v21 = [(ContactsTest *)self testOptions];
    v22 = [v21 objectForKeyedSubscript:@"iterations"];
    int v23 = [v22 intValue];

    if (v23 <= 1) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = v23;
    }
    [v6 contentSize];
    uint64_t v26 = (int)v25;
    if (!v7)
    {
      [v6 _performScrollTest:v20 iterations:v24 delta:v19 length:(int)v25];

      goto LABEL_19;
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100009C14;
    v27[3] = &unk_10001C6D0;
    id v28 = v7;
    [v6 _performScrollTest:v20 iterations:v24 delta:v19 length:v26 scrollAxis:2 extraResultsBlock:0 completionBlock:v27];
  }
LABEL_20:
}

- (NSDictionary)testOptions
{
  return self->_testOptions;
}

- (void)setTestOptions:(id)a3
{
}

- (CNContactNavigationController)contactNavigationController
{
  return self->_contactNavigationController;
}

- (void)setContactNavigationController:(id)a3
{
}

- (ContactsSplitViewController)contactSplitViewController
{
  return self->_contactSplitViewController;
}

- (void)setContactSplitViewController:(id)a3
{
}

- (BOOL)isIPad
{
  return self->_isIPad;
}

- (void)setIsIPad:(BOOL)a3
{
  self->_isIPad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSplitViewController, 0);
  objc_storeStrong((id *)&self->_contactNavigationController, 0);

  objc_storeStrong((id *)&self->_testOptions, 0);
}

@end