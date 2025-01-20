@interface BCLayoutConfigurationEnvironment
- (BCLayoutConfigurationEnvironment)initWithViewController:(id)a3;
- (BOOL)isCompactHeight;
- (BOOL)isCompactWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLayoutConfigurationEnvironment:(id)a3;
- (BOOL)isLandscape;
- (BOOL)isPortrait;
- (BOOL)isScrubberDisabled;
- (BOOL)opening;
- (CGRect)scrubberContainerBounds;
- (CGRect)scrubberInscribedRect:(CGRect)a3;
- (CGSize)screenSize;
- (CGSize)size;
- (IMEnvironmentOverrideProvider)overrideProvider;
- (UIEdgeInsets)safeAreaInsets;
- (UIEdgeInsets)safeAreaInsetsAdjustingForNotch:(BOOL)a3;
- (UITraitCollection)traitCollection;
- (UIView)view;
- (double)backgroundExtension;
- (double)defaultStatusBarHeight;
- (double)statusBarHeight;
- (id)_targetViewTraitEnvironment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)targetView;
- (int64_t)scrubberLayoutDirection;
- (void)freeze;
- (void)setOpening:(BOOL)a3;
- (void)setOverrideProvider:(id)a3;
- (void)setView:(id)a3;
- (void)unfreeze;
@end

@implementation BCLayoutConfigurationEnvironment

- (BOOL)isScrubberDisabled
{
  v2 = [(BCLayoutConfigurationEnvironment *)self overrideProvider];
  unsigned __int8 v3 = [v2 isScrubberDisabled];

  return v3;
}

- (CGRect)scrubberInscribedRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(BCLayoutConfigurationEnvironment *)self view];
  [v7 _inscribedRectInBoundingPathByInsettingRect:10 onEdges:1 x:x y:y width:width height:height];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (int64_t)scrubberLayoutDirection
{
  v2 = [(BCLayoutConfigurationEnvironment *)self view];
  id v3 = [v2 effectiveUserInterfaceLayoutDirection];

  return (int64_t)v3;
}

- (CGRect)scrubberContainerBounds
{
  v2 = [(BCLayoutConfigurationEnvironment *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BCLayoutConfigurationEnvironment)initWithViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BCLayoutConfigurationEnvironment;
  double v5 = [(BCLayoutConfigurationEnvironment *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_viewController, v4);
  }

  return v6;
}

- (double)statusBarHeight
{
  double v3 = [(BCLayoutConfigurationEnvironment *)self targetView];
  objc_opt_class();
  id v4 = BUDynamicCast();
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 window];
  }
  double v7 = v6;

  objc_super v8 = [v7 windowScene];
  double v9 = [v8 statusBarManager];

  double v10 = 0.0;
  if (![(BCLayoutConfigurationEnvironment *)self isCompactHeight])
  {
    [v9 statusBarHeight];
    double v10 = v11;
  }

  return v10;
}

- (double)defaultStatusBarHeight
{
  double v3 = [(BCLayoutConfigurationEnvironment *)self targetView];
  objc_opt_class();
  id v4 = BUDynamicCast();
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 window];
  }
  double v7 = v6;

  objc_super v8 = [v7 windowScene];
  double v9 = [v8 statusBarManager];

  double v10 = 0.0;
  if (![(BCLayoutConfigurationEnvironment *)self isCompactHeight])
  {
    [v9 defaultStatusBarHeight];
    double v10 = v11;
  }

  return v10;
}

- (double)backgroundExtension
{
  unsigned __int8 v3 = [(BCLayoutConfigurationEnvironment *)self isCompactHeight];
  double result = 0.0;
  if ((v3 & 1) == 0)
  {
    [(BCLayoutConfigurationEnvironment *)self safeAreaInsets];
    if (fabs(result) < 2.22044605e-16)
    {
      [(BCLayoutConfigurationEnvironment *)self statusBarHeight];
    }
  }
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  [(BCLayoutConfigurationEnvironment *)self safeAreaInsetsAdjustingForNotch:1];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if (*(double *)&qword_3495E8 != v4
    || *(double *)&qword_3495E0 != v3
    || *(double *)&qword_3495F8 != v6
    || *(double *)&qword_3495F0 != v5)
  {
    qword_3495E0 = *(void *)&v3;
    qword_3495E8 = *(void *)&v4;
    qword_3495F0 = *(void *)&v5;
    qword_3495F8 = *(void *)&v6;
    double v14 = BKSemanticLayoutInternalLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24.top = v7;
      v24.left = v8;
      v24.bottom = v9;
      v24.right = v10;
      double v15 = NSStringFromUIEdgeInsets(v24);
      int v20 = 134218242;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&def_7D91C, v14, OS_LOG_TYPE_DEFAULT, "Environment %p safe insets %@", (uint8_t *)&v20, 0x16u);
    }
  }
  double v16 = v7;
  double v17 = v8;
  double v18 = v9;
  double v19 = v10;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsAdjustingForNotch:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[UIApplication jsa_sharedApplicationIfNotExtension];
  double v6 = [(BCLayoutConfigurationEnvironment *)self view];
  CGFloat v7 = [v6 window];

  if (!v7)
  {
    CGFloat v8 = [v5 delegate];
    CGFloat v7 = [v8 window];
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  if (WeakRetained
    || ([v7 rootViewController], (WeakRetained = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v10 = [WeakRetained _appearState];
    double v11 = [WeakRetained presentedViewController];
    id v12 = v11;
    if (v11 && (v10 == 3 || !v10))
    {
      double v13 = [v11 presentedViewController];

      if (v13)
      {
        do
        {
          double v14 = [v12 presentedViewController];

          double v15 = [v14 presentedViewController];

          id v12 = v14;
        }
        while (v15);
      }
      else
      {
        double v14 = v12;
      }
      id v12 = v14;

      WeakRetained = v12;
    }
  }
  if ([(BCLayoutConfigurationEnvironment *)self opening])
  {
    double v16 = [v7 rootViewController];
    double v17 = [v16 view];
    [v17 safeAreaInsets];
    double top = v18;
    double left = v20;
    CGFloat bottom = v22;
    double right = v24;
  }
  else
  {
    v26 = [WeakRetained viewIfLoaded];
    double v16 = v26;
    if (v26)
    {
      [v26 safeAreaInsets];
      double top = v27;
      double left = v28;
      CGFloat bottom = v29;
      double right = v30;
    }
    else
    {
      double top = UIEdgeInsetsZero.top;
      double left = UIEdgeInsetsZero.left;
      CGFloat bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
    }
  }

  double v31 = fabs(top);
  if ([v5 isStatusBarHidden] && v31 < 2.22044605e-16)
  {
    [(BCLayoutConfigurationEnvironment *)self statusBarHeight];
    double top = top + v32;
    double v31 = fabs(top);
  }
  unsigned int v33 = [(BCLayoutConfigurationEnvironment *)self isCompactHeight];
  unsigned int v34 = v33;
  if (v31 >= 2.22044605e-16
    || (v33 & 1) != 0
    || ([(BCLayoutConfigurationEnvironment *)self statusBarHeight], fabs(v35) >= 2.22044605e-16))
  {
    if ((v34 & (top != 0.0)) != 0) {
      double top = 0.0;
    }
  }
  else
  {
    v36 = [v7 windowScene];
    v37 = [v36 statusBarManager];
    [v37 bc_defaultPortraitStatusBarHeight];
    double top = v38;
  }
  if ((v3 & v34) == 1 && [(BCLayoutConfigurationEnvironment *)self isLandscape] && left == 44.0)
  {
    double right = right + -13.0;
    double left = 31.0;
  }

  double v39 = top;
  double v40 = left;
  double v41 = bottom;
  double v42 = right;
  result.double right = v42;
  result.CGFloat bottom = v41;
  result.double left = v40;
  result.double top = v39;
  return result;
}

- (CGSize)size
{
  double width = self->_viewSize.width;
  if (width == 0.0 || (double height = self->_viewSize.height, height == 0.0))
  {
    double v4 = [(BCLayoutConfigurationEnvironment *)self targetView];
    [v4 frame];
    double width = v5;
    double height = v6;
  }
  double v7 = width;
  double v8 = height;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)screenSize
{
  double width = self->_screenSize.width;
  if (width == 0.0 || (double height = self->_screenSize.height, height == 0.0))
  {
    double v4 = +[UIScreen mainScreen];
    [v4 bounds];
    double width = v5;
    double height = v6;
  }
  double v7 = width;
  double v8 = height;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)isCompactWidth
{
  trait = self->_trait;
  if (trait)
  {
    double v4 = [(UITraitCollection *)trait horizontalSizeClass];
  }
  else
  {
    double v5 = [(BCLayoutConfigurationEnvironment *)self _targetViewTraitEnvironment];
    double v6 = [v5 traitCollection];
    double v4 = (char *)[v6 horizontalSizeClass];
  }
  return v4 == (unsigned char *)&def_7D91C + 1;
}

- (BOOL)isCompactHeight
{
  trait = self->_trait;
  if (trait)
  {
    double v4 = [(UITraitCollection *)trait verticalSizeClass];
  }
  else
  {
    double v5 = [(BCLayoutConfigurationEnvironment *)self _targetViewTraitEnvironment];
    double v6 = [v5 traitCollection];
    double v4 = (char *)[v6 verticalSizeClass];
  }
  return v4 == (unsigned char *)&def_7D91C + 1;
}

- (BOOL)isLandscape
{
  [(BCLayoutConfigurationEnvironment *)self size];
  return v2 > v3;
}

- (BOOL)isPortrait
{
  [(BCLayoutConfigurationEnvironment *)self size];
  return v2 < v3;
}

- (void)freeze
{
  double v3 = [(BCLayoutConfigurationEnvironment *)self targetView];
  [v3 frame];
  self->_viewSize.double width = v4;
  self->_viewSize.double height = v5;

  double v6 = +[UIWindow _applicationKeyWindow];
  double v7 = [v6 windowScene];
  self->_interfaceOrientation = (int64_t)[v7 interfaceOrientation];

  double v8 = [(BCLayoutConfigurationEnvironment *)self _targetViewTraitEnvironment];
  CGFloat v9 = [v8 traitCollection];
  trait = self->_trait;
  self->_trait = v9;

  id v13 = +[UIScreen mainScreen];
  [v13 bounds];
  self->_screenSize.double width = v11;
  self->_screenSize.double height = v12;
}

- (void)unfreeze
{
  CGSize v4 = CGSizeZero;
  self->_viewSize = CGSizeZero;
  trait = self->_trait;
  self->_interfaceOrientation = 0;
  self->_trait = 0;

  self->_screenSize = v4;
}

- (UITraitCollection)traitCollection
{
  trait = self->_trait;
  if (trait)
  {
    double v3 = trait;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    double v3 = [WeakRetained traitCollection];
  }

  return v3;
}

- (id)targetView
{
  double v2 = [(BCLayoutConfigurationEnvironment *)self view];
  if (!v2)
  {
    double v2 = +[UIWindow _applicationKeyWindow];
  }

  return v2;
}

- (id)description
{
  double v3 = (objc_class *)objc_opt_class();
  CGSize v4 = NSStringFromClass(v3);
  double width = self->_viewSize.width;
  if (self->_viewSize.height == CGSizeZero.height && width == CGSizeZero.width) {
    CFStringRef v7 = @"NO";
  }
  else {
    CFStringRef v7 = @"YES";
  }
  [(BCLayoutConfigurationEnvironment *)self size];
  v25[0] = v8;
  v25[1] = v9;
  unsigned int v10 = +[NSValue valueWithBytes:v25 objCType:"{CGSize=dd}"];
  [(BCLayoutConfigurationEnvironment *)self screenSize];
  v24[0] = v11;
  v24[1] = v12;
  id v13 = +[NSValue valueWithBytes:v24 objCType:"{CGSize=dd}"];
  [(BCLayoutConfigurationEnvironment *)self safeAreaInsets];
  v23[0] = v14;
  v23[1] = v15;
  v23[2] = v16;
  v23[3] = v17;
  double v18 = +[NSValue valueWithBytes:v23 objCType:"{UIEdgeInsets=dddd}"];
  double v19 = +[NSNumber numberWithInteger:self->_interfaceOrientation];
  double v20 = [(BCLayoutConfigurationEnvironment *)self traitCollection];
  v21 = +[NSString stringWithFormat:@"<%@:%p, frozen:%@, size:%@, screenSize:%@, safeAreaInsets:%@, interfaceOrientation:%@, traitCollection:%@>", v4, self, v7, v10, v13, v18, v19, v20];

  return v21;
}

- (id)_targetViewTraitEnvironment
{
  id v2 = [(BCLayoutConfigurationEnvironment *)self targetView];
  id v3 = v2;
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    CGSize v4 = [v2 _viewDelegate];
    CGFloat v5 = BUDynamicCast();

    id v3 = v2;
    if (v5)
    {
      id v3 = v5;
    }
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class() allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  CFStringRef v7 = (char *)[v5 initWithViewController:WeakRetained];

  uint64_t v8 = [(BCLayoutConfigurationEnvironment *)self view];
  [v7 setView:v8];

  *(CGSize *)(v7 + 8) = self->_viewSize;
  *((void *)v7 + 5) = self->_interfaceOrientation;
  id v9 = [(UITraitCollection *)self->_trait copyWithZone:a3];
  unsigned int v10 = (void *)*((void *)v7 + 6);
  *((void *)v7 + 6) = v9;

  *(CGSize *)(v7 + 24) = self->_screenSize;
  id v11 = objc_loadWeakRetained((id *)&self->_overrideProvider);
  objc_storeWeak((id *)v7 + 10, v11);

  return v7;
}

- (BOOL)isEqualToLayoutConfigurationEnvironment:(id)a3
{
  id v5 = (id *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v7 = objc_loadWeakRetained(v5 + 7);
  if (WeakRetained == v7)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_view);
    id v10 = objc_loadWeakRetained(v5 + 9);
    if (v9 != v10) {
      goto LABEL_8;
    }
    if (self->_viewSize.width != *((double *)v5 + 1) || self->_viewSize.height != *((double *)v5 + 2)) {
      goto LABEL_8;
    }
    [(BCLayoutConfigurationEnvironment *)self size];
    double v14 = v13;
    double v16 = v15;
    [v5 size];
    BOOL v8 = 0;
    if (v14 != v18) {
      goto LABEL_9;
    }
    if (v16 != v17) {
      goto LABEL_9;
    }
    BOOL v8 = 0;
    if (self->_screenSize.width != *((double *)v5 + 3)) {
      goto LABEL_9;
    }
    if (self->_screenSize.height != *((double *)v5 + 4)) {
      goto LABEL_9;
    }
    [(BCLayoutConfigurationEnvironment *)self screenSize];
    double v20 = v19;
    double v22 = v21;
    [v5 screenSize];
    BOOL v8 = 0;
    if (v20 != v24 || v22 != v23) {
      goto LABEL_9;
    }
    if (self->_interfaceOrientation != v5[5]
      || (trait = self->_trait, trait != v5[6]) && !-[UITraitCollection isEqual:](trait, "isEqual:"))
    {
LABEL_8:
      BOOL v8 = 0;
LABEL_9:

      goto LABEL_10;
    }
    v26 = [(BCLayoutConfigurationEnvironment *)self traitCollection];
    double v27 = [v5 traitCollection];
    if (v26 == v27
      || ([(BCLayoutConfigurationEnvironment *)self traitCollection],
          double v28 = objc_claimAutoreleasedReturnValue(),
          [v5 traitCollection],
          id v3 = objc_claimAutoreleasedReturnValue(),
          double v31 = v28,
          [v28 isEqual:v3]))
    {
      id v29 = objc_loadWeakRetained((id *)&self->_overrideProvider);
      id v30 = objc_loadWeakRetained(v5 + 10);
      BOOL v8 = v29 == v30;

      if (v26 == v27)
      {
LABEL_25:

        goto LABEL_9;
      }
    }
    else
    {
      BOOL v8 = 0;
    }

    goto LABEL_25;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CGSize v4 = (BCLayoutConfigurationEnvironment *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(BCLayoutConfigurationEnvironment *)self isEqualToLayoutConfigurationEnvironment:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (IMEnvironmentOverrideProvider)overrideProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideProvider);

  return (IMEnvironmentOverrideProvider *)WeakRetained;
}

- (void)setOverrideProvider:(id)a3
{
}

- (BOOL)opening
{
  return self->_opening;
}

- (void)setOpening:(BOOL)a3
{
  self->_opening = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overrideProvider);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_viewController);

  objc_storeStrong((id *)&self->_trait, 0);
}

@end