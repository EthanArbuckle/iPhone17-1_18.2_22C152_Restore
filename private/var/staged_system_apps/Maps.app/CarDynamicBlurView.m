@interface CarDynamicBlurView
- (CarDynamicBlurView)initWithBlurViewContext:(int64_t)a3 delegate:(id)a4;
- (UIView)contentView;
- (int)currentMode;
- (int64_t)correctedUserInterfaceStyle;
- (void)_changeVisualEffect;
- (void)_createContentView;
- (void)_recalculateBlurModeWithInterfaceStyle:(int64_t)a3;
- (void)_redraw;
- (void)_setCornerRadius:(double)a3 continuous:(BOOL)a4 maskedCorners:(unint64_t)a5;
- (void)_updateCornerValues;
- (void)dealloc;
- (void)didAddSubview:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4;
- (void)setCurrentMode:(int)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarDynamicBlurView

- (CarDynamicBlurView)initWithBlurViewContext:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarDynamicBlurView;
  v7 = -[CarDynamicBlurView initWithFrame:](&v14, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    [(CarDynamicBlurView *)v8 setUserInteractionEnabled:0];
    v8->_context = a3;
    v9 = [[MapsLightLevelController alloc] initWithWindowScene:0];
    lightLevelController = v8->_lightLevelController;
    v8->_lightLevelController = v9;

    [(MapsLightLevelController *)v8->_lightLevelController addObserver:v8];
    v11 = +[MapsLightLevelController sharedController];
    v8->_shouldUseNightMode = [v11 shouldUseNightMode];

    [(CarDynamicBlurView *)v8 _createContentView];
    [(CarDynamicBlurView *)v8 _redraw];
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v8 selector:"_redraw" name:@"CarDisplayDidUpdateTraitCollectionNotification" object:0];
  }
  return v8;
}

- (void)dealloc
{
  [(MapsLightLevelController *)self->_lightLevelController removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CarDynamicBlurView;
  [(CarDynamicBlurView *)&v3 dealloc];
}

- (void)_createContentView
{
  objc_super v3 = (UIView *)[objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  contentView = self->_contentView;
  self->_contentView = v3;

  v5 = self->_contentView;

  [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)didAddSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarDynamicBlurView;
  id v3 = a3;
  [(CarDynamicBlurView *)&v4 didAddSubview:v3];
  NSClassFromString(@"_UIDebugColorBoundsView");
  objc_opt_isKindOfClass();
}

- (void)_setCornerRadius:(double)a3 continuous:(BOOL)a4 maskedCorners:(unint64_t)a5
{
  self->_hasCornerValues = 1;
  self->_cornerRadius = a3;
  self->_continuous = a4;
  self->_maskedCorners = a5;
  [(CarDynamicBlurView *)self _updateCornerValues];
}

- (void)_updateCornerValues
{
  if (self->_hasCornerValues) {
    [(CarVisualEffectView *)self->_visualEffectView _setCornerRadius:self->_continuous continuous:self->_maskedCorners maskedCorners:self->_cornerRadius];
  }
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  unsigned int v5 = [a3 shouldUseNightMode];
  if (self->_shouldUseNightMode != v5)
  {
    self->_shouldUseNightMode = v5;
    [(CarDynamicBlurView *)self _redraw];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CarDynamicBlurView;
  [(CarDynamicBlurView *)&v7 traitCollectionDidChange:a3];
  objc_super v4 = [(CarDynamicBlurView *)self traitCollection];
  id v5 = [v4 userInterfaceStyle];
  int64_t handledUserInterfaceStyle = self->_handledUserInterfaceStyle;

  if (v5 != (id)handledUserInterfaceStyle) {
    [(CarDynamicBlurView *)self _redraw];
  }
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)CarDynamicBlurView;
  [(CarDynamicBlurView *)&v6 didMoveToWindow];
  id v3 = [(CarDynamicBlurView *)self window];

  if (v3)
  {
    objc_super v4 = [(CarDynamicBlurView *)self window];
    id v5 = [v4 windowScene];
    [(MapsLightLevelController *)self->_lightLevelController setWindowScene:v5];

    [(CarDynamicBlurView *)self _redraw];
  }
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)CarDynamicBlurView;
  [(CarDynamicBlurView *)&v4 didMoveToSuperview];
  id v3 = [(CarDynamicBlurView *)self superview];

  if (v3) {
    [(CarDynamicBlurView *)self _redraw];
  }
}

- (int64_t)correctedUserInterfaceStyle
{
  id v3 = [(CarDynamicBlurView *)self superview];

  if (v3)
  {
    objc_super v4 = [(CarDynamicBlurView *)self superview];
    id v5 = [v4 traitCollection];
    id v6 = [v5 userInterfaceStyle];
  }
  else
  {
    objc_super v4 = [(CarDynamicBlurView *)self traitCollection];
    id v6 = [v4 userInterfaceStyle];
  }

  return (int64_t)v6;
}

- (void)_redraw
{
  int64_t v3 = [(CarDynamicBlurView *)self correctedUserInterfaceStyle];

  [(CarDynamicBlurView *)self _recalculateBlurModeWithInterfaceStyle:v3];
}

- (void)_recalculateBlurModeWithInterfaceStyle:(int64_t)a3
{
  if (self->_shouldUseNightMode)
  {
    uint64_t v3 = 3;
  }
  else if (a3 == 2)
  {
    uint64_t v3 = 2;
  }
  else if (a3 == 1)
  {
    if (self->_context == 1) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  self->_int64_t handledUserInterfaceStyle = a3;
  [(CarDynamicBlurView *)self setCurrentMode:v3];
}

- (void)setCurrentMode:(int)a3
{
  if (self->_currentMode != a3)
  {
    uint64_t v3 = *(void *)&a3;
    id v5 = sub_100577974();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      self->_uint64_t currentMode = v3;
      [(CarDynamicBlurView *)self _changeVisualEffect];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained dynamicBlurViewDidChangeBlurMode:self->_currentMode];

      return;
    }
    id v6 = self;
    objc_super v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(CarDynamicBlurView *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    id v12 = v11;
    id v13 = objc_loadWeakRetained((id *)&v6->_delegate);
    objc_super v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t currentMode = self->_currentMode;
    if (currentMode >= 4)
    {
      v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_currentMode];
    }
    else
    {
      v17 = *(&off_101314C40 + currentMode);
    }
    id v18 = v17;
    if (v3 >= 4)
    {
      v19 = +[NSString stringWithFormat:@"(unknown: %i)", v3];
    }
    else
    {
      v19 = *(&off_101314C40 + (int)v3);
    }
    *(_DWORD *)buf = 138544386;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v15;
    __int16 v25 = 2048;
    v26 = v6;
    __int16 v27 = 2112;
    id v28 = v18;
    __int16 v29 = 2112;
    v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] CarBlur for %@ (%p) changed from %@ to %@", buf, 0x34u);

    goto LABEL_15;
  }
}

- (void)_changeVisualEffect
{
  uint64_t v3 = sub_100577974();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    goto LABEL_14;
  }
  objc_super v4 = self;
  if (!v4)
  {
    v9 = @"<nil>";
    goto LABEL_10;
  }
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  if (objc_opt_respondsToSelector())
  {
    objc_super v7 = [(CarDynamicBlurView *)v4 performSelector:"accessibilityIdentifier"];
    v8 = v7;
    if (v7 && ![v7 isEqualToString:v6])
    {
      v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

      goto LABEL_8;
    }
  }
  v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
  v10 = v9;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t currentMode = v4->_currentMode;
  if (currentMode >= 4)
  {
    objc_super v14 = +[NSString stringWithFormat:@"(unknown: %i)", v4->_currentMode];
  }
  else
  {
    objc_super v14 = *(&off_101314C40 + currentMode);
  }
  *(_DWORD *)buf = 138544130;
  *(void *)&uint8_t buf[4] = v10;
  *(_WORD *)&buf[12] = 2112;
  *(void *)&buf[14] = v12;
  *(_WORD *)&buf[22] = 2048;
  v47 = v4;
  __int16 v48 = 2112;
  v49 = v14;
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] %@ (%p) effect changed to %@", buf, 0x2Au);

LABEL_14:
  int v15 = self->_currentMode;
  if (v15 == 3)
  {
    v26 = +[UIColorEffect colorEffectSaturate:0.800000012];
    __int16 v27 = +[UIBlurEffect effectWithBlurRadius:30.0];
    unsigned int v28 = +[CarVisualEffectView isDisablingBlur];
    double v29 = 1.0;
    if (!v28) {
      double v29 = 0.939999998;
    }
    v30 = +[UIColor colorWithWhite:0.109803922 alpha:v29];
    v31 = +[UIVisualEffect effectCompositingColor:v30];

    *(void *)buf = v27;
    *(void *)&buf[8] = v26;
    *(void *)&buf[16] = v31;
    v32 = +[NSArray arrayWithObjects:buf count:3];
    v33 = +[UIVisualEffect effectCombiningEffects:v32];

    goto LABEL_30;
  }
  if (v15 != 2)
  {
    if (v15 == 1)
    {
LABEL_35:
      uint64_t v34 = sub_100A2B7CC();
      goto LABEL_36;
    }
    v16 = sub_100577974();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_34:

      goto LABEL_35;
    }
    v17 = self;
    id v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      v20 = [(CarDynamicBlurView *)v17 performSelector:"accessibilityIdentifier"];
      v21 = v20;
      if (v20 && ![v20 isEqualToString:v19])
      {
        id v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_23;
      }
    }
    id v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_23:

    id v23 = v22;
    uint64_t v24 = self->_currentMode;
    if (v24 >= 4)
    {
      __int16 v25 = +[NSString stringWithFormat:@"(unknown: %i)", self->_currentMode];
    }
    else
    {
      __int16 v25 = *(&off_101314C40 + v24);
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v25;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}@] _blurEffectForMode called with invalid mode %@", buf, 0x16u);

    goto LABEL_34;
  }
  if (+[CarVisualEffectView isDisablingBlur])
  {
    v26 = +[UIColor colorWithRed:0.266666681 green:0.298039228 blue:0.313725501 alpha:1.0];
    v33 = +[UIVisualEffect effectCompositingColor:v26];
LABEL_30:

    goto LABEL_37;
  }
  uint64_t v34 = +[UIBlurEffect effectWithStyle:18];
LABEL_36:
  v33 = (void *)v34;
LABEL_37:
  [(CarVisualEffectView *)self->_visualEffectView removeFromSuperview];
  v35 = [[CarVisualEffectView alloc] initWithEffect:v33];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v35;

  [(CarVisualEffectView *)self->_visualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v37 = self->_currentMode;
  if (v37 >= 4)
  {
    v38 = +[NSString stringWithFormat:@"(unknown: %i)", self->_currentMode];
  }
  else
  {
    v38 = *(&off_101314C40 + v37);
  }
  [(CarVisualEffectView *)self->_visualEffectView _setGroupName:v38];

  v39 = [(CarVisualEffectView *)self->_visualEffectView contentView];
  [v39 setClipsToBounds:1];

  v40 = [(CarVisualEffectView *)self->_visualEffectView contentView];
  [v40 addSubview:self->_contentView];

  [(CarDynamicBlurView *)self _updateCornerValues];
  [(CarDynamicBlurView *)self addSubview:self->_visualEffectView];
  v41 = +[NSMutableArray array];
  v42 = [(CarVisualEffectView *)self->_visualEffectView _maps_constraintsForCenteringInView:self];
  [v41 addObjectsFromArray:v42];

  contentView = self->_contentView;
  v44 = [(CarVisualEffectView *)self->_visualEffectView contentView];
  v45 = [(UIView *)contentView _maps_constraintsForCenteringInView:v44];
  [v41 addObjectsFromArray:v45];

  +[NSLayoutConstraint activateConstraints:v41];
}

- (int)currentMode
{
  return self->_currentMode;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_lightLevelController, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end