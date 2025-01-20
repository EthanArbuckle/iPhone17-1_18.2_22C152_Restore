@interface NavAudioControlView
+ (unint64_t)navAudioTypeForGuidanceLevel:(unint64_t)a3;
- (BOOL)isExpanded;
- (CGSize)intrinsicContentSize;
- (EventTap)eventTap;
- (NSArray)availableAudioTypes;
- (NSArray)buttons;
- (NSLayoutConstraint)containerViewTopConstraint;
- (NSLayoutConstraint)highlightViewTopConstraint;
- (NavAudioControlView)initWithDelegate:(id)a3;
- (NavAudioControlViewDelegate)delegate;
- (UIView)containerView;
- (UIView)highlightView;
- (UIView)maps_maskView;
- (double)collapsedDimension;
- (double)containerTopPositionWhenCollapsedForAudioType:(unint64_t)a3;
- (double)expandedHeight;
- (double)fullHeight;
- (double)highlightTopPosition;
- (double)highlightWidth;
- (id)_accessibilityIdenfifierPrefixForAudioType:(unint64_t)a3;
- (id)_accessibilityTextForAudioType:(unint64_t)a3;
- (id)_accessibilityUserInputLabelsForAudioType:(unint64_t)a3;
- (id)_imageForAudioType:(unint64_t)a3;
- (id)createBackgroundView;
- (id)createButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)preferredSymbolConfigurationForImage;
- (int)analyticsTarget;
- (unint64_t)currentAudioType;
- (void)_animateContentUpdate;
- (void)_handleEvent:(id)a3;
- (void)_pressedAudioTypeButton:(id)a3;
- (void)_rescheduleCollapse;
- (void)_selectAudioType:(unint64_t)a3;
- (void)_setup;
- (void)_updateButtons;
- (void)_updateContent;
- (void)didMoveToWindow;
- (void)setAvailableAudioTypes:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCurrentAudioType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEventTap:(id)a3;
- (void)setExpanded:(BOOL)a3;
@end

@implementation NavAudioControlView

- (NavAudioControlView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavAudioControlView;
  v5 = -[NavAudioControlView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(NavAudioControlView *)v5 setAccessibilityIdentifier:v7];

    objc_storeWeak((id *)&v5->_delegate, v4);
    [(NavAudioControlView *)v5 _setup];
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  [(NavAudioControlView *)self collapsedDimension];
  double v4 = v3;
  if ([(NavAudioControlView *)self isExpanded]) {
    [(NavAudioControlView *)self expandedHeight];
  }
  else {
    [(NavAudioControlView *)self collapsedDimension];
  }
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)collapsedDimension
{
  return 60.0;
}

- (double)fullHeight
{
  return 188.0;
}

- (double)highlightWidth
{
  [(NavAudioControlView *)self collapsedDimension];
  return v2 + -6.0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v26.receiver = self;
  v26.super_class = (Class)NavAudioControlView;
  -[NavAudioControlView hitTest:withEvent:](&v26, "hitTest:withEvent:", a4);
  double v7 = (NavAudioControlView *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    objc_super v9 = [(NavAudioControlView *)self containerView];
    [v9 convertPoint:self x:y];
    double v11 = v10;

    if (v11 <= 0.0)
    {
      v8 = [(NSArray *)self->_buttons firstObject];
      goto LABEL_17;
    }
    v12 = [(NavAudioControlView *)self containerView];
    [v12 frame];
    double Height = CGRectGetHeight(v29);

    if (v11 >= Height)
    {
      v8 = [(NSArray *)self->_buttons lastObject];
      goto LABEL_17;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v14 = self->_buttons;
    id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v19 frame:v22];
          if (v11 <= CGRectGetMaxY(v30))
          {
            [v19 frame];
            if (v11 >= CGRectGetMinY(v31))
            {
              v20 = v19;

              goto LABEL_18;
            }
          }
        }
        id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  v8 = v7;
LABEL_17:
  v20 = v8;
LABEL_18:

  return v20;
}

- (void)_setup
{
  [(NavAudioControlView *)self collapsedDimension];
  double v4 = v3 * 0.5;
  double v5 = [(NavAudioControlView *)self layer];
  [v5 setCornerRadius:v4];

  double v6 = [(NavAudioControlView *)self layer];
  LODWORD(v7) = 1045220557;
  [v6 setShadowOpacity:v7];

  double height = CGSizeZero.height;
  objc_super v9 = [(NavAudioControlView *)self layer];
  [v9 setShadowOffset:CGSizeZero.width, height];

  double v10 = [(NavAudioControlView *)self layer];
  [v10 setShadowRadius:1.0];

  double v11 = [(NavAudioControlView *)self layer];
  [v11 setShadowPathIsBounds:1];

  objc_initWeak(&location, self);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100B0FFA8;
  v65[3] = &unk_101318020;
  objc_copyWeak(&v66, &location);
  v12 = +[EventTap eventTapWithHandler:v65];
  [(NavAudioControlView *)self setEventTap:v12];

  v13 = objc_opt_new();
  v14 = (UIView *)objc_opt_new();
  maps_maskView = self->_maps_maskView;
  self->_maps_maskView = v14;

  [(UIView *)self->_maps_maskView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_maps_maskView setClipsToBounds:1];
  [(NavAudioControlView *)self collapsedDimension];
  double v17 = v16;
  v18 = [(UIView *)self->_maps_maskView layer];
  [v18 setCornerRadius:v17 * 0.5];

  [(UIView *)self->_maps_maskView setAccessibilityIdentifier:@"NavAudioControlMaskView"];
  [(NavAudioControlView *)self addSubview:self->_maps_maskView];
  v19 = [(UIView *)self->_maps_maskView leadingAnchor];
  v20 = [(NavAudioControlView *)self leadingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v13 addObject:v21];

  long long v22 = [(UIView *)self->_maps_maskView trailingAnchor];
  long long v23 = [(NavAudioControlView *)self trailingAnchor];
  long long v24 = [v22 constraintEqualToAnchor:v23];
  [v13 addObject:v24];

  long long v25 = [(UIView *)self->_maps_maskView topAnchor];
  objc_super v26 = [(NavAudioControlView *)self topAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v13 addObject:v27];

  v28 = [(UIView *)self->_maps_maskView bottomAnchor];
  CGRect v29 = [(NavAudioControlView *)self bottomAnchor];
  CGRect v30 = [v28 constraintEqualToAnchor:v29];
  [v13 addObject:v30];

  CGRect v31 = (UIView *)objc_opt_new();
  containerView = self->_containerView;
  self->_containerView = v31;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView setAccessibilityIdentifier:@"NavAudioControlContainerView"];
  [(UIView *)self->_maps_maskView addSubview:self->_containerView];
  v33 = self->_containerView;
  v34 = [(NavAudioControlView *)self createBackgroundView];
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v33 addSubview:v34];
  v35 = [v34 _maps_constraintsForCenteringInView:v33];
  [v13 addObjectsFromArray:v35];

  v36 = [(UIView *)self->_containerView topAnchor];
  v37 = [(NavAudioControlView *)self topAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  containerViewTopConstraint = self->_containerViewTopConstraint;
  self->_containerViewTopConstraint = v38;

  v40 = [(UIView *)self->_containerView leadingAnchor];
  v41 = [(NavAudioControlView *)self leadingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v13 addObject:v42];

  v43 = [(UIView *)self->_containerView trailingAnchor];
  v44 = [(NavAudioControlView *)self trailingAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v13 addObject:v45];

  [v13 addObject:self->_containerViewTopConstraint];
  v46 = [(UIView *)self->_containerView heightAnchor];
  [(NavAudioControlView *)self fullHeight];
  v47 = [v46 constraintEqualToConstant:];
  [v13 addObject:v47];

  v48 = (UIView *)objc_opt_new();
  highlightView = self->_highlightView;
  self->_highlightView = v48;

  [(UIView *)self->_highlightView setTranslatesAutoresizingMaskIntoConstraints:0];
  v50 = +[UIColor tertiarySystemFillColor];
  [(UIView *)self->_highlightView setBackgroundColor:v50];

  [(NavAudioControlView *)self highlightWidth];
  double v52 = v51;
  v53 = [(UIView *)self->_highlightView layer];
  [v53 setCornerRadius:v52 * 0.5];

  [(UIView *)v33 addSubview:self->_highlightView];
  v54 = [(UIView *)self->_highlightView topAnchor];
  v55 = [(UIView *)v33 topAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  highlightViewTopConstraint = self->_highlightViewTopConstraint;
  self->_highlightViewTopConstraint = v56;

  v58 = [(UIView *)self->_highlightView widthAnchor];
  [(NavAudioControlView *)self highlightWidth];
  v59 = [v58 constraintEqualToConstant:];
  [v13 addObject:v59];

  v60 = [(UIView *)self->_highlightView centerXAnchor];
  v61 = [(UIView *)v33 centerXAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  [v13 addObject:v62];

  [v13 addObject:self->_highlightViewTopConstraint];
  v63 = [(UIView *)self->_highlightView heightAnchor];
  [(NavAudioControlView *)self highlightWidth];
  v64 = [v63 constraintEqualToConstant:];
  [v13 addObject:v64];

  +[NSLayoutConstraint activateConstraints:v13];
  [(NavAudioControlView *)self _updateContent];

  objc_destroyWeak(&v66);
  objc_destroyWeak(&location);
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)NavAudioControlView;
  [(NavAudioControlView *)&v7 didMoveToWindow];
  double v3 = [(NavAudioControlView *)self window];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___EventSourceHandler];

  if (v4)
  {
    double v5 = [(NavAudioControlView *)self window];
    double v6 = [(NavAudioControlView *)self eventTap];
    [v5 _maps_registerEventTap:v6];
  }
}

- (id)createBackgroundView
{
  double v2 = objc_opt_new();
  double v3 = +[UIColor colorNamed:@"NavigationMaterialColor"];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (id)createButton
{
  double v2 = objc_opt_new();

  return v2;
}

- (void)_updateButtons
{
  [(NSArray *)self->_buttons makeObjectsPerformSelector:"removeFromSuperview"];
  double v3 = objc_opt_new();
  v34 = (NSArray *)objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(NavAudioControlView *)self availableAudioTypes];
  id v35 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v37;
    double leading = NSDirectionalEdgeInsetsZero.leading;
    double bottom = NSDirectionalEdgeInsetsZero.bottom;
    double trailing = NSDirectionalEdgeInsetsZero.trailing;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        id v8 = [*(id *)(*((void *)&v36 + 1) + 8 * i) unsignedIntegerValue];
        objc_super v9 = +[UIButtonConfiguration borderlessButtonConfiguration];
        [v9 setContentInsets:NSDirectionalEdgeInsetsZero.top, leading, bottom, trailing];
        double v10 = [(NavAudioControlView *)self preferredSymbolConfigurationForImage];
        [v9 setPreferredSymbolConfigurationForImage:v10];

        double v11 = [(NavAudioControlView *)self _imageForAudioType:v8];
        [v9 setImage:v11];

        v12 = [(NavAudioControlView *)self createButton];
        [(NSArray *)v34 addObject:v12];
        [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v12 setTag:v8];
        [v12 setConfiguration:v9];
        v13 = [v12 traitOverrides];
        [v13 setLayoutDirection:0];

        v14 = [(NavAudioControlView *)self _accessibilityTextForAudioType:v8];
        [v12 setAccessibilityLabel:v14];

        id v15 = [(NavAudioControlView *)self _accessibilityIdenfifierPrefixForAudioType:v8];
        double v16 = [v15 stringByAppendingString:@"Button"];
        [v12 setAccessibilityIdentifier:v16];

        double v17 = [(NavAudioControlView *)self _accessibilityUserInputLabelsForAudioType:v8];
        [v12 setAccessibilityUserInputLabels:v17];

        [v12 addTarget:self action:"_pressedAudioTypeButton:" forControlEvents:64];
        [(UIView *)self->_containerView addSubview:v12];
        v18 = [v12 leadingAnchor];
        v19 = [(UIView *)self->_containerView leadingAnchor];
        v20 = [v18 constraintEqualToAnchor:v19];
        [v3 addObject:v20];

        v21 = [v12 trailingAnchor];
        long long v22 = [(UIView *)self->_containerView trailingAnchor];
        long long v23 = [v21 constraintEqualToAnchor:v22];
        [v3 addObject:v23];

        long long v24 = [v12 topAnchor];
        long long v25 = [(UIView *)self->_containerView topAnchor];
        [(NavAudioControlView *)self containerTopPositionWhenCollapsedForAudioType:v8];
        v27 = [v24 constraintEqualToAnchor:v25 constant:-v26];
        [v3 addObject:v27];

        v28 = [v12 heightAnchor];
        [(NavAudioControlView *)self collapsedDimension];
        CGRect v29 = [v28 constraintEqualToConstant:];
        [v3 addObject:v29];
      }
      id v35 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v35);
  }

  buttons = self->_buttons;
  self->_buttons = v34;
  CGRect v31 = v34;

  +[NSLayoutConstraint activateConstraints:v3];
}

- (id)preferredSymbolConfigurationForImage
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:22.0];
}

- (id)_imageForAudioType:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      CFStringRef v3 = @"speaker.slash.fill";
      goto LABEL_6;
    case 1uLL:
      uint64_t v4 = +[UIImage imageNamed:@"AudioAlertsOnly"];
      goto LABEL_8;
    case 0uLL:
      CFStringRef v3 = @"speaker.wave.2.fill";
LABEL_6:
      uint64_t v4 = +[UIImage systemImageNamed:v3];
LABEL_8:
      double v5 = (void *)v4;
      goto LABEL_10;
  }
  double v5 = 0;
LABEL_10:
  double v6 = [v5 imageFlippedForRightToLeftLayoutDirection];

  return v6;
}

- (id)_accessibilityIdenfifierPrefixForAudioType:(unint64_t)a3
{
  CFStringRef v3 = @"AllGuidance";
  if (a3 == 1) {
    CFStringRef v3 = @"AlertsOnly";
  }
  if (a3 == 2) {
    return @"NoGuidance";
  }
  else {
    return (id)v3;
  }
}

- (id)_accessibilityTextForAudioType:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v4 = +[NSBundle mainBundle];
    double v5 = v4;
    CFStringRef v6 = @"[Audio] No guidance";
  }
  else if (a3 == 1)
  {
    uint64_t v4 = +[NSBundle mainBundle];
    double v5 = v4;
    CFStringRef v6 = @"[Audio] Alerts only";
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    uint64_t v4 = +[NSBundle mainBundle];
    double v5 = v4;
    CFStringRef v6 = @"[Audio] All guidance";
  }
  CFStringRef v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

LABEL_8:

  return v3;
}

- (id)_accessibilityUserInputLabelsForAudioType:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      CFStringRef v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"[Audio] No guidance" value:@"localized string not found" table:0];
      v10[0] = v4;
      double v5 = +[NSBundle mainBundle];
      CFStringRef v6 = [v5 localizedStringForKey:@"CarPlay_Mute" value:@"localized string not found" table:0];
      v10[1] = v6;
      objc_super v7 = v10;
      goto LABEL_7;
    case 1uLL:
      CFStringRef v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"[Audio] Alerts only" value:@"localized string not found" table:0];
      v11[0] = v4;
      double v5 = +[NSBundle mainBundle];
      CFStringRef v6 = [v5 localizedStringForKey:@"Alert" value:@"localized string not found" table:0];
      v11[1] = v6;
      objc_super v7 = v11;
      goto LABEL_7;
    case 0uLL:
      CFStringRef v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"[Audio] All guidance" value:@"localized string not found" table:0];
      v12[0] = v4;
      double v5 = +[NSBundle mainBundle];
      CFStringRef v6 = [v5 localizedStringForKey:@"CarPlay_Speaker" value:@"localized string not found" table:0];
      v12[1] = v6;
      objc_super v7 = v12;
LABEL_7:
      id v8 = +[NSArray arrayWithObjects:v7 count:2];

      goto LABEL_9;
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

- (void)_pressedAudioTypeButton:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [(NavAudioControlView *)self availableAudioTypes];
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 2)
  {
    CFStringRef v6 = [(NavAudioControlView *)self availableAudioTypes];
    id v7 = [v6 count];

    if (v7 == (id)2)
    {
      id v8 = [(NavAudioControlView *)self availableAudioTypes];
      objc_super v9 = [v8 firstObject];
      double v10 = +[NSNumber numberWithUnsignedInteger:self->_currentAudioType];
      unsigned int v11 = [v9 isEqual:v10];

      v12 = [(NavAudioControlView *)self availableAudioTypes];
      v13 = v12;
      if (v11) {
        [v12 lastObject];
      }
      else {
      id v15 = [v12 firstObject];
      }
      -[NavAudioControlView _selectAudioType:](self, "_selectAudioType:", [v15 unsignedIntegerValue]);

      [(NavAudioControlView *)self _animateContentUpdate];
    }
    else
    {
      if ([(NavAudioControlView *)self isExpanded])
      {
        id v14 = [v16 tag];
        if (self->_currentAudioType != v14) {
          [(NavAudioControlView *)self _selectAudioType:v14];
        }
      }
      [(NavAudioControlView *)self setExpanded:[(NavAudioControlView *)self isExpanded] ^ 1];
    }
  }
}

- (void)_selectAudioType:(unint64_t)a3
{
  id v5 = sub_1005774B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = self;
    if (!v6)
    {
      unsigned int v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      objc_super v9 = [(NavAudioControlView *)v6 performSelector:"accessibilityIdentifier"];
      double v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        unsigned int v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    unsigned int v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Changing audioType to %lu", buf, 0x16u);
  }
  self->_unint64_t currentAudioType = a3;
  v12 = [(NavAudioControlView *)self delegate];
  [v12 audioControlView:self didSelectAudioType:self->_currentAudioType];

  unint64_t currentAudioType = self->_currentAudioType;
  if (currentAudioType <= 2) {
    +[GEOAPPortal captureUserAction:dword_100F73600[currentAudioType] target:[(NavAudioControlView *)self analyticsTarget] value:0];
  }
  +[MapsAnalyticStateProvider updateSettingsInformation];
  id v14 = +[NavigationFeedbackCollector sharedFeedbackCollector];
  [v14 updateAudioPreferences];
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_1005774B4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    CFStringRef v6 = self;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      objc_super v9 = [(NavAudioControlView *)v6 performSelector:"accessibilityIdentifier"];
      double v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        unsigned int v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    unsigned int v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    BOOL expanded = self->_expanded;
    *(_DWORD *)buf = 138543874;
    id v15 = v11;
    __int16 v16 = 1024;
    BOOL v17 = expanded;
    __int16 v18 = 1024;
    BOOL v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Changing expansion from %d to %d", buf, 0x18u);

LABEL_9:
    self->_BOOL expanded = v3;
    [(NavAudioControlView *)self _animateContentUpdate];
    if (v3)
    {
      [(NavAudioControlView *)self _rescheduleCollapse];
      +[GEOAPPortal captureUserAction:139 target:[(NavAudioControlView *)self analyticsTarget] value:0];
    }
    else
    {
      timer = self->_timer;
      self->_timer = 0;
    }
  }
}

- (void)_rescheduleCollapse
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B11004;
  v6[3] = &unk_1012E7638;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v6 block:5.0];
  timer = self->_timer;
  self->_timer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_animateContentUpdate
{
  id v3 = objc_alloc_init(SpringGroupAnimation);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B111E0;
  v9[3] = &unk_1012E5D08;
  v9[4] = self;
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B1123C;
  v8[3] = &unk_1012E5D08;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B112AC;
  v7[3] = &unk_1012E7D28;
  [(GroupAnimation *)v3 addPreparation:v9 animations:v8 completion:v7];
  uint64_t v4 = [(NavAudioControlView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    CFStringRef v6 = [(NavAudioControlView *)self delegate];
    [v6 audioControlView:self willChangeSizeWithAnimation:v3];
  }
  [(SpringGroupAnimation *)v3 runWithDuration:6 delay:1.0 options:0.0 mass:3.0 stiffness:1000.0 damping:500.0 initialVelocity:0.0];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
}

- (double)expandedHeight
{
  id v3 = [(NavAudioControlView *)self availableAudioTypes];
  id v4 = [v3 count];

  if (v4 == (id)3)
  {
    [(NavAudioControlView *)self fullHeight];
  }
  else if (v4 == (id)2)
  {
    return 122.0;
  }
  else if (v4 == (id)1)
  {
    [(NavAudioControlView *)self collapsedDimension];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (void)setAvailableAudioTypes:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_availableAudioTypes;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    unsigned __int8 v7 = [(id)v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = (NSArray *)[(id)v6 copy];
      availableAudioTypes = self->_availableAudioTypes;
      self->_availableAudioTypes = v8;

      double v10 = sub_1005774B4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 138543362;
        unint64_t v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Available audio types changed to %{public}@", (uint8_t *)&v14, 0xCu);
      }

      [(NavAudioControlView *)self setExpanded:0];
      [(NavAudioControlView *)self _updateButtons];
      [(NavAudioControlView *)self containerTopPositionWhenCollapsedForAudioType:self->_currentAudioType];
      double v12 = v11;
      v13 = [(NavAudioControlView *)self containerViewTopConstraint];
      [v13 setConstant:v12];

      [(NavAudioControlView *)self invalidateIntrinsicContentSize];
    }
  }
}

- (void)setCurrentAudioType:(unint64_t)a3
{
  if (self->_currentAudioType != a3)
  {
    unint64_t v5 = sub_1005774B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t currentAudioType = self->_currentAudioType;
      int v10 = 134218240;
      unint64_t v11 = currentAudioType;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changing audio type from %lu to %lu", (uint8_t *)&v10, 0x16u);
    }

    self->_unint64_t currentAudioType = a3;
    [(NavAudioControlView *)self setExpanded:0];
    [(NavAudioControlView *)self containerTopPositionWhenCollapsedForAudioType:a3];
    double v8 = v7;
    objc_super v9 = [(NavAudioControlView *)self containerViewTopConstraint];
    [v9 setConstant:v8];
  }
}

- (double)containerTopPositionWhenCollapsedForAudioType:(unint64_t)a3
{
  id v4 = [(NavAudioControlView *)self availableAudioTypes];
  unint64_t v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 indexOfObject:v5];

  double result = -62.0;
  if (v6 != (id)1) {
    double result = 0.0;
  }
  if (v6 == (id)2) {
    return -128.0;
  }
  return result;
}

- (double)highlightTopPosition
{
  id v3 = [(NavAudioControlView *)self availableAudioTypes];
  id v4 = +[NSNumber numberWithUnsignedInteger:self->_currentAudioType];
  id v5 = [v3 indexOfObject:v4];

  double result = 65.0;
  if (v5 != (id)1) {
    double result = 3.0;
  }
  if (v5 == (id)2) {
    return 131.0;
  }
  return result;
}

- (void)_updateContent
{
  double v3 = 0.0;
  if (![(NavAudioControlView *)self isExpanded])
  {
    [(NavAudioControlView *)self containerTopPositionWhenCollapsedForAudioType:self->_currentAudioType];
    double v3 = v4;
  }
  id v5 = [(NavAudioControlView *)self containerViewTopConstraint];
  [v5 setConstant:v3];

  [(NavAudioControlView *)self highlightTopPosition];
  double v7 = v6;
  double v8 = [(NavAudioControlView *)self highlightViewTopConstraint];
  [v8 setConstant:v7];

  if ([(NavAudioControlView *)self isExpanded]) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  id v10 = [(NavAudioControlView *)self highlightView];
  [v10 setAlpha:v9];
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type])
  {
    if ([v4 type] == (id)7 && self->_timer) {
      [(NavAudioControlView *)self _rescheduleCollapse];
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(NavAudioControlView *)self window];
    double v6 = [v4 touchesForWindow:v5];

    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          unint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 type] == (id)1 && self->_timer)
          {
            [(NavAudioControlView *)self _rescheduleCollapse];
LABEL_18:

            goto LABEL_19;
          }
          if ([v11 phase] != (id)3) {
            goto LABEL_18;
          }
          [v11 locationInView:self];
          __int16 v12 = -[NavAudioControlView hitTest:withEvent:](self, "hitTest:withEvent:", v4);

          if (v12) {
            goto LABEL_18;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    [(NavAudioControlView *)self setExpanded:0];
  }
LABEL_19:
}

+ (unint64_t)navAudioTypeForGuidanceLevel:(unint64_t)a3
{
  if (a3 == -1)
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    id v7 = sub_1005774B4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Invalid guidance level \"NoOverride\" in NavAudioControlView.", v8, 2u);
    }

    return 2;
  }
  else
  {
    unint64_t v5 = 2;
    if (a3 == 1) {
      unint64_t v5 = 1;
    }
    if (a3 == 2) {
      return 0;
    }
    else {
      return v5;
    }
  }
}

- (int)analyticsTarget
{
  return 505;
}

- (NavAudioControlViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavAudioControlViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)availableAudioTypes
{
  return self->_availableAudioTypes;
}

- (unint64_t)currentAudioType
{
  return self->_currentAudioType;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (EventTap)eventTap
{
  return self->_eventTap;
}

- (void)setEventTap:(id)a3
{
}

- (UIView)maps_maskView
{
  return self->_maps_maskView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (NSLayoutConstraint)containerViewTopConstraint
{
  return self->_containerViewTopConstraint;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (NSLayoutConstraint)highlightViewTopConstraint
{
  return self->_highlightViewTopConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_containerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_maps_maskView, 0);
  objc_storeStrong((id *)&self->_eventTap, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_availableAudioTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end