@interface ShowContactsTest
- (BOOL)prepareForTestWithOptions:(id)a3;
- (CNTestNavigationControllerDelegate)navControllerDelegate;
- (int)maxContactIndex;
- (int)nextContactIndex;
- (void)didShow:(id)a3;
- (void)iterateContact;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)prepareForNextTest;
- (void)resetDelegate;
- (void)setMaxContactIndex:(int)a3;
- (void)setNavControllerDelegate:(id)a3;
- (void)setNextContactIndex:(int)a3;
- (void)showContactsListForIPhone;
- (void)showNextContact;
@end

@implementation ShowContactsTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ShowContactsTest;
  BOOL v5 = [(ContactsTest *)&v22 prepareForTestWithOptions:v4];
  if (v5)
  {
    v6 = [(ContactsTest *)self contactSplitViewController];
    v7 = [v6 navigationControllerForPPT];

    objc_opt_class();
    id v8 = v7;
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      objc_initWeak(&location, self);
      v11 = [v10 delegate];
      v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_10000A6EC;
      v19 = &unk_10001C510;
      objc_copyWeak(&v20, &location);
      v12 = +[CNTestNavigationControllerDelegate delegateWithDelegate:v11 willShowViewControllerHandler:0 didShowViewControllerHandler:&v16];
      -[ShowContactsTest setNavControllerDelegate:](self, "setNavControllerDelegate:", v12, v16, v17, v18, v19);

      v13 = [(ShowContactsTest *)self navControllerDelegate];
      [v10 setDelegate:v13];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {
      [v8 setDelegate:self];
    }
    [(ShowContactsTest *)self setNextContactIndex:0];
    v14 = [v4 objectForKey:@"iterations"];
    -[ShowContactsTest setMaxContactIndex:](self, "setMaxContactIndex:", [v14 intValue]);

    [(ContactsTest *)self willStartTest];
    [(ShowContactsTest *)self showNextContact];
  }
  return v5;
}

- (void)prepareForNextTest
{
  [(ShowContactsTest *)self resetDelegate];
  v3.receiver = self;
  v3.super_class = (Class)ShowContactsTest;
  [(ContactsTest *)&v3 prepareForNextTest];
}

- (void)resetDelegate
{
  objc_super v3 = [(ContactsTest *)self contactSplitViewController];
  id v9 = [v3 navigationControllerForPPT];

  id v4 = [(ContactsTest *)self contactNavigationController];

  BOOL v5 = v9;
  if (v9 == v4)
  {
    v6 = [(ShowContactsTest *)self navControllerDelegate];
    v7 = [v6 delegate];
    id v8 = [(ContactsTest *)self contactNavigationController];
    [v8 setDelegate:v7];

    BOOL v5 = v9;
  }
}

- (void)didShow:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(ShowContactsTest *)self performSelector:"iterateContact"];
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A93C;
    v6[3] = &unk_10001C488;
    v6[4] = self;
    [UIApp installCACommitCompletionBlock:v6];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)iterateContact
{
  objc_super v3 = [(ContactsTest *)self contactNavigationController];
  id v4 = [v3 dataSource];

  BOOL v5 = (void *)UIApp;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AAB0;
  v7[3] = &unk_10001C538;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 installCACommitCompletionBlock:v7];
}

- (void)showNextContact
{
  objc_super v3 = [(ContactsTest *)self contactNavigationController];
  id v4 = [v3 dataSource];

  BOOL v5 = [v4 contacts];
  id v6 = [v5 objectAtIndexedSubscript:[self nextContactIndex]];

  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_10000AD3C;
  v12 = &unk_10001C538;
  v13 = self;
  id v14 = v6;
  id v7 = v6;
  id v8 = objc_retainBlock(&v9);
  if ([(ContactsTest *)self isIPad]) {
    [(ContactsTest *)self showContactListWithCompletionBlock:v8];
  }
  else {
    ((void (*)(void ***))v8[2])(v8);
  }
}

- (void)showContactsListForIPhone
{
  objc_super v3 = (void *)UIApp;
  id v4 = [(ContactsTest *)self testOptions];
  BOOL v5 = [v4 objectForKeyedSubscript:@"testName"];
  id v6 = +[NSArray arrayWithObject:@"time"];
  [v3 startedSubTest:@"Close Contact" forTest:v5 withMetrics:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000AFDC;
  v8[3] = &unk_10001C488;
  v8[4] = self;
  [UIApp installCACommitCompletionBlock:v8];
  id v7 = [(ContactsTest *)self contactSplitViewController];
  [v7 showContactList];
}

- (int)nextContactIndex
{
  return self->_nextContactIndex;
}

- (void)setNextContactIndex:(int)a3
{
  self->_nextContactIndex = a3;
}

- (int)maxContactIndex
{
  return self->_maxContactIndex;
}

- (void)setMaxContactIndex:(int)a3
{
  self->_maxContactIndex = a3;
}

- (CNTestNavigationControllerDelegate)navControllerDelegate
{
  return self->_navControllerDelegate;
}

- (void)setNavControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end