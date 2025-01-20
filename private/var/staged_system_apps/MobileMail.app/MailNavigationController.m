@interface MailNavigationController
- (BOOL)_shouldCrossFadeNavigationBar;
- (BOOL)_viewControllerUnderlapsStatusBar;
- (BOOL)_willPerformCustomNavigationTransitionForPop;
- (BOOL)_willPerformCustomNavigationTransitionForPush;
- (BOOL)shouldAutorotate;
- (MailNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (MailNavigationController)initWithRootViewController:(id)a3;
- (void)_commonInit;
- (void)doubleTappedNavbar:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MailNavigationController

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MailNavigationController;
  [(MailNavigationController *)&v10 viewDidAppear:a3];
  v4 = +[NSUserDefaults em_userDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"EnableDoubleTapToShowSpec"];

  if (v5)
  {
    if (!self->_navbarDoubleTapRecognizer)
    {
      v6 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"doubleTappedNavbar:"];
      navbarDoubleTapRecognizer = self->_navbarDoubleTapRecognizer;
      self->_navbarDoubleTapRecognizer = v6;

      [(UITapGestureRecognizer *)self->_navbarDoubleTapRecognizer setNumberOfTapsRequired:2];
    }
    v8 = [(MailNavigationController *)self navigationBar];
    [v8 addGestureRecognizer:self->_navbarDoubleTapRecognizer];
  }
  else
  {
    v9 = [(MailNavigationController *)self navigationBar];
    [v9 removeGestureRecognizer:self->_navbarDoubleTapRecognizer];

    v8 = self->_navbarDoubleTapRecognizer;
    self->_navbarDoubleTapRecognizer = 0;
  }
}

- (MailNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MailNavigationController;
  v4 = [(MailNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
  unsigned int v5 = v4;
  if (v4) {
    [(MailNavigationController *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  v3 = +[UIColor clearColor];
  v4 = [(MailNavigationController *)self view];
  [v4 setBackgroundColor:v3];

  unsigned int v5 = [(MailNavigationController *)self view];
  [v5 setOpaque:0];

  [(MailNavigationController *)self _setClipUnderlapWhileTransitioning:1];
}

- (BOOL)_viewControllerUnderlapsStatusBar
{
  return 1;
}

- (MailNavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailNavigationController;
  unsigned int v5 = [(MailNavigationController *)&v8 initWithRootViewController:v4];
  v6 = v5;
  if (v5) {
    [(MailNavigationController *)v5 _commonInit];
  }

  return v6;
}

- (BOOL)shouldAutorotate
{
  v2 = [(MailNavigationController *)self topViewController];
  unsigned __int8 v3 = [v2 shouldAutorotate];

  return v3;
}

- (BOOL)_willPerformCustomNavigationTransitionForPop
{
  v8.receiver = self;
  v8.super_class = (Class)MailNavigationController;
  unsigned __int8 v3 = [(MailNavigationController *)&v8 _willPerformCustomNavigationTransitionForPop];
  id v4 = [(MailNavigationController *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(MailNavigationController *)self topViewController];
    unsigned __int8 v3 = [v6 _willPerformCustomNavigationTransitionForPop];
  }
  return v3;
}

- (BOOL)_willPerformCustomNavigationTransitionForPush
{
  v8.receiver = self;
  v8.super_class = (Class)MailNavigationController;
  unsigned __int8 v3 = [(MailNavigationController *)&v8 _willPerformCustomNavigationTransitionForPush];
  id v4 = [(MailNavigationController *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(MailNavigationController *)self topViewController];
    unsigned __int8 v3 = [v6 _willPerformCustomNavigationTransitionForPush];
  }
  return v3;
}

- (BOOL)_shouldCrossFadeNavigationBar
{
  v8.receiver = self;
  v8.super_class = (Class)MailNavigationController;
  unsigned __int8 v3 = [(MailNavigationController *)&v8 _shouldCrossFadeNavigationBar];
  id v4 = [(MailNavigationController *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(MailNavigationController *)self topViewController];
    unsigned __int8 v3 = [v6 _shouldCrossFadeNavigationBar];
  }
  return v3;
}

- (void)doubleTappedNavbar:(id)a3
{
  id v4 = objc_alloc_init((Class)UIImagePickerController);
  [v4 setSourceType:0];
  [v4 setDelegate:self];
  [v4 setAllowsEditing:0];
  [(MailNavigationController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011940C;
  v6[3] = &unk_100604618;
  id v7 = a4;
  objc_super v8 = self;
  id v5 = v7;
  [(MailNavigationController *)self dismissViewControllerAnimated:1 completion:v6];
}

- (void).cxx_destruct
{
}

@end