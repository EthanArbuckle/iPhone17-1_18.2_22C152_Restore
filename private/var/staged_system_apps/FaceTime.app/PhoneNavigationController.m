@interface PhoneNavigationController
+ ($1FF454C5B48E436092D281DABF654916)badge;
+ (id)defaultPNGName;
+ (id)tabBarIconImage;
+ (id)tabBarIconName;
+ (int)tabViewType;
- (BOOL)shouldSnapshot;
- (MPVoicemailController)voicemailController;
- (PhoneNavigationController)initWithRootViewController:(id)a3;
- (VMPlayerController)playerController;
- (id)rootViewController;
- (void)_updateRootViewController;
- (void)dealloc;
- (void)handleURL:(id)a3;
- (void)prepareForSnapshot;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setViewControllers:(id)a3;
- (void)setVoicemailController:(id)a3;
@end

@implementation PhoneNavigationController

+ (int)tabViewType
{
  return 0;
}

+ ($1FF454C5B48E436092D281DABF654916)badge
{
  BOOL v2 = 1;
  unint64_t v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (id)tabBarIconName
{
  return 0;
}

+ (id)tabBarIconImage
{
  return 0;
}

+ (id)defaultPNGName
{
  return @"Default";
}

- (PhoneNavigationController)initWithRootViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PhoneNavigationController;
  unint64_t v3 = [(PhoneNavigationController *)&v9 initWithRootViewController:a3];
  if (v3)
  {
    if ([UIApp userInterfaceStyle] == 1)
    {
      id v4 = objc_alloc_init((Class)UIImage);
      v5 = [(PhoneNavigationController *)v3 navigationBar];
      [v5 setBackgroundImage:v4 forBarPosition:0 barMetrics:0];

      v6 = [(PhoneNavigationController *)v3 navigationBar];
      [v6 setBarStyle:1];

      v7 = [(PhoneNavigationController *)v3 navigationBar];
      [v7 setTranslucent:1];

      [(PhoneNavigationController *)v3 _setClipUnderlapWhileTransitioning:1];
    }
    [(PhoneNavigationController *)v3 setDefinesPresentationContext:0];
  }
  return v3;
}

- (void)dealloc
{
  unint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PhoneNavigationController;
  [(PhoneNavigationController *)&v4 dealloc];
}

- (void)_updateRootViewController
{
  id v5 = [(PhoneNavigationController *)self viewControllers];
  if (![v5 count]) {
    goto LABEL_5;
  }
  unint64_t v3 = [v5 objectAtIndex:0];
  objc_super v4 = v3;
  if (v3
    && ([(PhoneTabViewController *)v3 conformsToProtocol:&OBJC_PROTOCOL___PhoneTabViewController] & 1) == 0)
  {

LABEL_5:
    objc_super v4 = 0;
  }
  if (v4 != self->_rootController) {
    objc_storeStrong((id *)&self->_rootController, v4);
  }
}

- (id)rootViewController
{
  return self->_rootController;
}

- (void)setViewControllers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PhoneNavigationController;
  [(PhoneNavigationController *)&v4 setViewControllers:a3];
  [(PhoneNavigationController *)self _updateRootViewController];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([UIApp userInterfaceStyle] == 1) {
    [v6 setEdgesForExtendedLayout:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)PhoneNavigationController;
  [(PhoneNavigationController *)&v9 pushViewController:v6 animated:v4];
  v7 = [(PhoneNavigationController *)self viewControllers];
  id v8 = [v7 count];

  if (v8 == (id)1) {
    [(PhoneNavigationController *)self _updateRootViewController];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([UIApp userInterfaceStyle] == 1) {
    [v8 setEdgesForExtendedLayout:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)PhoneNavigationController;
  [(PhoneNavigationController *)&v10 presentViewController:v8 animated:v6 completion:v9];
}

- (BOOL)shouldSnapshot
{
  unint64_t v3 = [(PhoneNavigationController *)self rootViewController];
  BOOL v4 = [(PhoneNavigationController *)self visibleViewController];
  if (v4 == v3) {
    unsigned __int8 v5 = [v3 shouldSnapshot];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)prepareForSnapshot
{
  id v2 = [(PhoneNavigationController *)self rootViewController];
  [v2 prepareForSnapshot];
}

- (void)handleURL:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(PhoneNavigationController *)self rootViewController];
  if (objc_opt_respondsToSelector()) {
    [v4 handleURL:v5];
  }
}

- (MPVoicemailController)voicemailController
{
  return self->_voicemailController;
}

- (void)setVoicemailController:(id)a3
{
}

- (VMPlayerController)playerController
{
  return self->_playerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_voicemailController, 0);

  objc_storeStrong((id *)&self->_rootController, 0);
}

@end