@interface PHFrecentNavigationController
- (void)viewDidLoad;
@end

@implementation PHFrecentNavigationController

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PHFrecentNavigationController;
  [(PHFrecentNavigationController *)&v15 viewDidLoad];
  [(PHFrecentNavigationController *)self _setClipUnderlapWhileTransitioning:1];
  v3 = [(PHFrecentNavigationController *)self navigationBar];
  [v3 setBarStyle:1];

  v4 = [(PHFrecentNavigationController *)self navigationBar];
  [v4 setTranslucent:1];

  v5 = [(PHFrecentNavigationController *)self navigationBar];
  [v5 _setHidesShadow:1];

  id v6 = objc_alloc_init((Class)UIImage);
  v7 = [(PHFrecentNavigationController *)self navigationBar];
  [v7 setBackgroundImage:v6 forBarPosition:0 barMetrics:0];

  v8 = +[UIBlurEffect effectWithStyle:2];
  v16[0] = v8;
  v9 = [UIApp rootViewController];
  v10 = [v9 backdropView];
  v11 = [v10 captureGroup];
  v12 = +[UIVisualEffect _effectCopyingFromCaptureGroup:v11];
  v16[1] = v12;
  v13 = +[NSArray arrayWithObjects:v16 count:2];
  v14 = [(PHFrecentNavigationController *)self navigationBar];
  [v14 setBackgroundEffects:v13];
}

@end