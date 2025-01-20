@interface BSUINavigationController
+ (NSDictionary)navigationBarFontAttributes;
+ (id)largeNavigationBarFontAttributesWithTraitCollection:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)bc_analyticsVisibilityOfChild:(id)a3;
- (BOOL)bc_analyticsVisibilityOfSelf;
- (BOOL)isRoot;
- (BSUINavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (BSUINavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (BSUINavigationController)initWithOptions:(id)a3;
- (BSUINavigationController)initWithRootViewController:(id)a3;
- (UIView)wrapperView;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateLayoutMarginsForViewController:(id)a3;
- (void)_updateLayoutMarginsForViewController:(id)a3 forInteractiveTransition:(BOOL)a4;
- (void)_updateManualScrollEdgeAppearanceProgressForScrollView:(id)a3 navigationItem:(id)a4;
- (void)applyThemeBasedOnCurrentUserInterfaceStyle;
- (void)bc_analyticsVisibilityDidAppear;
- (void)bc_analyticsVisibilityWillDisappear;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setIsRoot:(BOOL)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)updateLayoutMetrics;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation BSUINavigationController

- (BSUINavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BSUINavigationController;
  v4 = [(BSUINavigationController *)&v8 initWithNavigationBarClass:a3 toolbarClass:a4];
  if (v4)
  {
    v5 = +[UITraitCollection bc_allAPITraits];
    id v6 = [(BSUINavigationController *)v4 registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (BSUINavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v4 = [(BSUINavigationController *)self initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
  v5 = v4;
  if (v4)
  {
    id v6 = [(BSUINavigationController *)v4 navigationBar];
    [v6 setPrefersLargeTitles:1];
  }
  return v5;
}

- (BSUINavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v5 = [(BSUINavigationController *)self init];
  id v6 = v5;
  if (v5) {
    [(BSUINavigationController *)v5 pushViewController:v4 animated:0];
  }

  return v6;
}

- (BSUINavigationController)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(BSUINavigationController *)self init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"prefersLargeTitles"];
    if (objc_opt_respondsToSelector())
    {
      id v7 = [v6 BOOLValue];
      objc_super v8 = [(BSUINavigationController *)v5 navigationBar];
      [v8 setPrefersLargeTitles:v7];
    }
  }

  return v5;
}

- (UIView)wrapperView
{
  wrapperView = self->_wrapperView;
  if (!wrapperView)
  {
    id v4 = [(BSUINavigationController *)self view];
    id v5 = objc_alloc((Class)UIView);
    [v4 frame];
    id v6 = [v5 initWithFrame:];
    id v7 = self->_wrapperView;
    self->_wrapperView = v6;

    [(UIView *)self->_wrapperView setAutoresizingMask:18];
    [(UIView *)self->_wrapperView bounds];
    [v4 setFrame:];
    [v4 setAutoresizingMask:18];
    [(UIView *)self->_wrapperView addSubview:v4];

    wrapperView = self->_wrapperView;
  }

  return wrapperView;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v4 viewDidAppear:a3];
  [(BSUINavigationController *)self bc_analyticsVisibilityUpdateSubtree];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v4 viewWillDisappear:a3];
  [(BSUINavigationController *)self bc_analyticsVisibilitySubtreeWillDisappear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v4 viewDidDisappear:a3];
  [(BSUINavigationController *)self bc_analyticsVisibilitySubtreeDidDisappear];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v4 viewDidLoad];
  v3 = [(BSUINavigationController *)self view];
  [v3 setAutoresizingMask:0];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v4 viewWillLayoutSubviews];
  [(BSUINavigationController *)self applyThemeBasedOnCurrentUserInterfaceStyle];
  v3 = [(BSUINavigationController *)self topViewController];
  [(BSUINavigationController *)self _updateLayoutMarginsForViewController:v3];
}

- (void)viewSafeAreaInsetsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v5 viewSafeAreaInsetsDidChange];
  objc_opt_class();
  v3 = [(BSUINavigationController *)self presentedViewController];
  objc_super v4 = BUDynamicCast();

  [v4 presentingViewControllerSafeAreaInsetsDidChange:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad()) {
    id v3 = &dword_1C + 2;
  }
  else {
    id v3 = &dword_0 + 2;
  }
  objc_super v4 = [(BSUINavigationController *)self presentedViewController];
  objc_super v5 = objc_opt_new();
  if (v4)
  {
    do
    {
      [v5 addObject:v4];
      uint64_t v6 = [v4 presentedViewController];

      objc_super v4 = (void *)v6;
    }
    while (v6);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v5 reverseObjectEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&OBJC_PROTOCOL___BCOrientationControlling])
        {
          id v3 = [v11 supportedInterfaceOrientations];
          LOBYTE(v8) = 1;
          goto LABEL_16;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  v12 = [(BSUINavigationController *)self topViewController];
  v13 = v12;
  if ((v8 & 1) == 0)
  {
    if (v12)
    {
      id v14 = [v12 supportedInterfaceOrientations];
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)BSUINavigationController;
      id v14 = [(BSUINavigationController *)&v16 supportedInterfaceOrientations];
    }
    id v3 = v14;
  }

  return (unint64_t)v3;
}

- (void)applyThemeBasedOnCurrentUserInterfaceStyle
{
  id v3 = [(BSUINavigationController *)self view];
  unsigned int v4 = [v3 im_isStyleDark];

  if (v4
    && ([(BSUINavigationController *)self _isInPopoverPresentation] & 1) != 0)
  {
    uint64_t v5 = +[UIColor bc_booksSecondaryBackground];
  }
  else
  {
    uint64_t v5 = +[UIColor bc_booksBackground];
  }
  id v23 = (id)v5;
  uint64_t v6 = [(BSUINavigationController *)self navigationBar];
  id v7 = [v6 standardAppearance];
  id v8 = [v7 copy];

  uint64_t v9 = +[BSUINavigationController navigationBarFontAttributes];
  [v8 setTitleTextAttributes:v9];

  v10 = [(BSUINavigationController *)self traitCollection];
  v11 = +[BSUINavigationController largeNavigationBarFontAttributesWithTraitCollection:v10];
  [v8 setLargeTitleTextAttributes:v11];

  v12 = [(BSUINavigationController *)self navigationBar];
  [v12 setStandardAppearance:v8];

  v13 = [(BSUINavigationController *)self topViewController];
  id v14 = BUProtocolCast();

  v15 = [v14 preferredNavigationBarTintColor];
  objc_super v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = +[UIColor bc_booksKeyColor];
  }
  long long v18 = v17;

  long long v19 = [(BSUINavigationController *)self navigationBar];
  [v19 setBarStyle:v4];

  long long v20 = [(BSUINavigationController *)self navigationBar];
  [v20 setBarTintColor:v23];

  v21 = [(BSUINavigationController *)self navigationBar];
  [v21 setTintColor:v18];

  v22 = [(BSUINavigationController *)self toolbar];
  [v22 setBarStyle:v4];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(BSUINavigationController *)self applyThemeBasedOnCurrentUserInterfaceStyle];
}

- (void)_updateLayoutMarginsForViewController:(id)a3
{
}

- (void)_updateLayoutMarginsForViewController:(id)a3 forInteractiveTransition:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = [(BSUINavigationController *)self viewIfLoaded];
  id v8 = [v7 window];

  if (v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_29E8C;
    v16[3] = &unk_38E3D8;
    v16[4] = self;
    id v17 = v6;
    uint64_t v9 = objc_retainBlock(v16);
    v10 = [(BSUINavigationController *)self transitionCoordinator];
    v11 = v10;
    if (v10 && [v10 isInteractive] == v4)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_2A034;
      v14[3] = &unk_38EED8;
      v15 = v9;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_2A048;
      v12[3] = &unk_38EED8;
      v13 = v15;
      [v11 animateAlongsideTransition:v14 completion:v12];
    }
    else
    {
      ((void (*)(void *, void))v9[2])(v9, 0);
    }
  }
}

- (void)updateLayoutMetrics
{
  id v2 = [(BSUINavigationController *)self viewIfLoaded];
  [v2 setNeedsLayout];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(BSUINavigationController *)self _updateLayoutMarginsForViewController:v6];
  v7.receiver = self;
  v7.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v7 pushViewController:v6 animated:v4];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BSUINavigationController;
  BOOL v4 = [(BSUINavigationController *)&v7 popViewControllerAnimated:a3];
  objc_super v5 = [(BSUINavigationController *)self topViewController];
  [(BSUINavigationController *)self _updateLayoutMarginsForViewController:v5];

  return v4;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BSUINavigationController;
  objc_super v5 = [(BSUINavigationController *)&v8 popToViewController:a3 animated:a4];
  id v6 = [(BSUINavigationController *)self topViewController];
  [(BSUINavigationController *)self _updateLayoutMarginsForViewController:v6];

  return v5;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BSUINavigationController;
  BOOL v4 = [(BSUINavigationController *)&v7 popToRootViewControllerAnimated:a3];
  objc_super v5 = [(BSUINavigationController *)self topViewController];
  [(BSUINavigationController *)self _updateLayoutMarginsForViewController:v5];

  return v4;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v6 setViewControllers:a3 animated:a4];
  objc_super v5 = [(BSUINavigationController *)self topViewController];
  [(BSUINavigationController *)self _updateLayoutMarginsForViewController:v5];
}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  id v4 = a3;
  id v5 = [(BSUINavigationController *)self topViewController];

  return v5 == v4;
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = [(BSUINavigationController *)self viewControllers];
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2) {
    [(BSUINavigationController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else {
    id v5 = [(BSUINavigationController *)self popViewControllerAnimated:1];
  }
  return 1;
}

- (void)_updateManualScrollEdgeAppearanceProgressForScrollView:(id)a3 navigationItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  objc_super v8 = BUDynamicCast();
  [v8 setIsUpdatingManualScrollEdgeAppearanceProgress:1];
  v9.receiver = self;
  v9.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v9 _updateManualScrollEdgeAppearanceProgressForScrollView:v7 navigationItem:v6];

  [v8 setIsUpdatingManualScrollEdgeAppearanceProgress:0];
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  id v2 = [(BSUINavigationController *)self visibleViewController];
  if (v2)
  {
    objc_opt_class();
    id v3 = BUDynamicCast();
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)bc_analyticsVisibilityDidAppear
{
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v5 bc_analyticsVisibilityDidAppear];
  if ([(BSUINavigationController *)self isRoot])
  {
    id v3 = +[NSDate date];
    appearDate = self->_appearDate;
    self->_appearDate = v3;
  }
}

- (void)bc_analyticsVisibilityWillDisappear
{
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationController;
  [(BSUINavigationController *)&v5 bc_analyticsVisibilityWillDisappear];
  if ([(BSUINavigationController *)self isRoot])
  {
    id v3 = [(BSUINavigationController *)self ba_analyticsTracker];
    if (v3)
    {
      BOOL v4 = +[BAEventReporter sharedReporter];
      [v4 emitTabViewEventWithTracker:v3 startDate:self->_appearDate];
    }
  }
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (void)setIsRoot:(BOOL)a3
{
  self->_isRoot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapperView, 0);

  objc_storeStrong((id *)&self->_appearDate, 0);
}

+ (NSDictionary)navigationBarFontAttributes
{
  id v2 = self;
  id v3 = UIFontDescriptorSystemDesignSerif;
  id v6 = [v2 bc_booksKeyColor];
  TextAttributesBuilder.build()();
  swift_bridgeObjectRelease();

  type metadata accessor for Key(0);
  sub_FE4B8();
  v4.super.isa = sub_2E4330().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v4.super.isa;
}

+ (id)largeNavigationBarFontAttributesWithTraitCollection:(id)a3
{
  id v3 = a3;
  _s11BookStoreUI21ToolKitTextAttributesV13toolbarHeader4withSDySo21NSAttributedStringKeyaypGSo17UITraitCollectionC_tFZ_0(v3);
  id v6 = [self bc_booksKeyColor];
  TextAttributesBuilder.build()();

  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_FE4B8();
  v4.super.isa = sub_2E4330().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

@end