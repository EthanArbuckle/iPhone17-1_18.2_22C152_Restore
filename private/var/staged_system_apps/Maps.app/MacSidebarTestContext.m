@interface MacSidebarTestContext
- (BOOL)shouldResetStateAfterResigning;
- (BOOL)showsMapView;
- (BOOL)wantsSidebarControl;
- (ChromeViewController)chromeViewController;
- (MacSidebarTestContext)init;
- (id)_createContainee;
- (id)desiredSidebarContentControllers;
- (void)_pop;
- (void)_popSidebarController;
- (void)_pushSidebarController;
- (void)_toggleWantsControl;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
@end

@implementation MacSidebarTestContext

- (MacSidebarTestContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)MacSidebarTestContext;
  v2 = [(MacSidebarTestContext *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    controllers = v2->_controllers;
    v2->_controllers = v3;
  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (BOOL)wantsSidebarControl
{
  return [(MKCatalystButton *)self->_wantsControlButton isSelected];
}

- (id)desiredSidebarContentControllers
{
  return self->_controllers;
}

- (id)_createContainee
{
  v3 = objc_alloc_init(ContaineeViewController);
  id v4 = [(NSMutableArray *)self->_controllers count];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_controllers count];
  unint64_t v6 = v5 % 0xA;
  if ((unint64_t)v4 <= 0xA) {
    unint64_t v6 = v5;
  }
  v7 = +[UIColor colorWithHue:(float)((float)v6 * 0.1) saturation:1.0 brightness:0.800000012 alpha:1.0];
  v8 = [(ContaineeViewController *)v3 view];
  [v8 setBackgroundColor:v7];

  return v3;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a4;
  [a3 viewport];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100747B18;
  v8[3] = &unk_1012E5D58;
  v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  [v6 addPreparation:v8];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100747FDC;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [a4 addAnimations:v4];
}

- (void)_pop
{
  id v2 = [(MacSidebarTestContext *)self macChromeViewController];
  [v2 popContextAnimated:1 completion:0];
}

- (void)_toggleWantsControl
{
  [(MKCatalystButton *)self->_wantsControlButton setSelected:[(MKCatalystButton *)self->_wantsControlButton isSelected] ^ 1];
  id v3 = [(MacSidebarTestContext *)self macChromeViewController];
  [v3 setNeedsUpdateComponent:@"sidebar" animated:1];
}

- (void)_pushSidebarController
{
  controllers = self->_controllers;
  id v4 = [(MacSidebarTestContext *)self _createContainee];
  [(NSMutableArray *)controllers addObject:v4];

  id v5 = [(MacSidebarTestContext *)self macChromeViewController];
  [v5 setNeedsUpdateComponent:@"sidebar" animated:1];
}

- (void)_popSidebarController
{
  [(NSMutableArray *)self->_controllers removeLastObject];
  id v3 = [(MacSidebarTestContext *)self macChromeViewController];
  [v3 setNeedsUpdateComponent:@"sidebar" animated:1];
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_wantsControlButton, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);

  objc_storeStrong((id *)&self->_controllers, 0);
}

@end