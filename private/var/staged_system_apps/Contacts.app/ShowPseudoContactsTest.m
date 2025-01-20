@interface ShowPseudoContactsTest
- (BOOL)animate;
- (BOOL)prepareForTestWithOptions:(id)a3;
- (CNTestNavigationControllerDelegate)navControllerDelegate;
- (NSArray)allSearchQueries;
- (NSMutableDictionary)extraResults;
- (int)maxContactIndex;
- (int)nextContactIndex;
- (unint64_t)currentDirectoryIndex;
- (unint64_t)currentQueryIndex;
- (void)didShow:(id)a3;
- (void)iterateContact;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)prepareForNextTest;
- (void)resetDelegate;
- (void)setAllSearchQueries:(id)a3;
- (void)setAnimate:(BOOL)a3;
- (void)setCurrentDirectoryIndex:(unint64_t)a3;
- (void)setCurrentQueryIndex:(unint64_t)a3;
- (void)setExtraResults:(id)a3;
- (void)setMaxContactIndex:(int)a3;
- (void)setNavControllerDelegate:(id)a3;
- (void)setNextContactIndex:(int)a3;
- (void)showNextContact;
- (void)showPseudoContactsListForIPhone;
- (void)startSearchQuery;
@end

@implementation ShowPseudoContactsTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ShowPseudoContactsTest;
  BOOL v5 = [(ContactsTest *)&v25 prepareForTestWithOptions:v4];
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
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000CF94;
      v22[3] = &unk_10001C510;
      objc_copyWeak(&v23, &location);
      v12 = +[CNTestNavigationControllerDelegate delegateWithDelegate:v11 willShowViewControllerHandler:0 didShowViewControllerHandler:v22];
      [(ShowPseudoContactsTest *)self setNavControllerDelegate:v12];

      v13 = [(ShowPseudoContactsTest *)self navControllerDelegate];
      [v10 setDelegate:v13];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    else
    {
      [v8 setDelegate:self];
    }
    v14 = +[NSMutableDictionary dictionary];
    [(ShowPseudoContactsTest *)self setExtraResults:v14];

    v15 = [v4 objectForKey:@"animate"];
    -[ShowPseudoContactsTest setAnimate:](self, "setAnimate:", [v15 BOOLValue]);

    v16 = [v4 objectForKey:@"searchQueries"];
    v17 = [v16 componentsSeparatedByString:@"%"];
    [(ShowPseudoContactsTest *)self setAllSearchQueries:v17];
    [(ShowPseudoContactsTest *)self setCurrentQueryIndex:0];
    [(ShowPseudoContactsTest *)self setNextContactIndex:0];
    v18 = [v4 objectForKey:@"iterations"];
    -[ShowPseudoContactsTest setMaxContactIndex:](self, "setMaxContactIndex:", [v18 intValue]);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000CFF0;
    v21[3] = &unk_10001C488;
    v21[4] = self;
    v19 = objc_retainBlock(v21);
    [(ContactsTest *)self showContactListWithCompletionBlock:v19];
  }
  return v5;
}

- (void)prepareForNextTest
{
  [(ShowPseudoContactsTest *)self resetDelegate];
  v3.receiver = self;
  v3.super_class = (Class)ShowPseudoContactsTest;
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
    v6 = [(ShowPseudoContactsTest *)self navControllerDelegate];
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
    [(ShowPseudoContactsTest *)self performSelector:"iterateContact"];
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000D220;
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
  v7[2] = sub_10000D378;
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
  v11 = sub_10000D68C;
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

- (void)showPseudoContactsListForIPhone
{
  objc_super v3 = (void *)UIApp;
  id v4 = [(ContactsTest *)self testOptions];
  BOOL v5 = [v4 objectForKeyedSubscript:@"testName"];
  id v6 = +[NSArray arrayWithObject:@"time"];
  [v3 startedSubTest:@"Close Contact" forTest:v5 withMetrics:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D9C4;
  v8[3] = &unk_10001C488;
  v8[4] = self;
  [UIApp installCACommitCompletionBlock:v8];
  id v7 = [(ContactsTest *)self contactSplitViewController];
  [v7 showContactList];
}

- (void)startSearchQuery
{
  objc_super v3 = [(ShowPseudoContactsTest *)self allSearchQueries];
  id v4 = [v3 objectAtIndex:[self currentQueryIndex]];

  BOOL v5 = [(ContactsTest *)self contactNavigationController];
  id v6 = [v5 contactListViewController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DB2C;
  v7[3] = &unk_10001C488;
  v7[4] = self;
  [v6 searchForString:v4 animated:[self animate] completionBlock:v7];
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

- (NSMutableDictionary)extraResults
{
  return self->_extraResults;
}

- (void)setExtraResults:(id)a3
{
}

- (unint64_t)currentDirectoryIndex
{
  return self->_currentDirectoryIndex;
}

- (void)setCurrentDirectoryIndex:(unint64_t)a3
{
  self->_currentDirectoryIndex = a3;
}

- (BOOL)animate
{
  return self->_animate;
}

- (void)setAnimate:(BOOL)a3
{
  self->_animate = a3;
}

- (NSArray)allSearchQueries
{
  return self->_allSearchQueries;
}

- (void)setAllSearchQueries:(id)a3
{
}

- (unint64_t)currentQueryIndex
{
  return self->_currentQueryIndex;
}

- (void)setCurrentQueryIndex:(unint64_t)a3
{
  self->_currentQueryIndex = a3;
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
  objc_storeStrong((id *)&self->_navControllerDelegate, 0);
  objc_storeStrong((id *)&self->_allSearchQueries, 0);

  objc_storeStrong((id *)&self->_extraResults, 0);
}

@end