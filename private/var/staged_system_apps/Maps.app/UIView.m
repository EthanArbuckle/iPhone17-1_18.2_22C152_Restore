@interface UIView
+ (BOOL)_maps_shouldAdoptImplicitAnimationParameters;
+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4;
+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4 completion:(id)a5;
- (BOOL)_maps_isVisible;
- (CGAffineTransform)_maps_transformScaledToLeadingAtScale:(SEL)a3;
- (CGAffineTransform)_maps_transformScaledToTopAndLeadingAtScale:(SEL)a3;
- (CGAffineTransform)_maps_transformScaledToTopAndTrailingAtScale:(SEL)a3;
- (CGAffineTransform)_maps_transformScaledToTopAtScale:(SEL)a3;
- (CGRect)_maps_centeringFrameForView:(id)a3 fit:(BOOL)a4 constrain:(BOOL)a5 inRect:(CGRect)a6;
- (CGRect)_maps_centeringFrameForView:(id)a3 inRect:(CGRect)a4 options:(int64_t)a5;
- (CGRect)_maps_centeringFrameForView:(id)a3 size:(CGSize)a4 inRect:(CGRect)a5;
- (CGSize)_maps_compressedSizeForWidth:(double)a3 withBlock:(id)a4;
- (CarCardView)_cardView;
- (MapsTheme)theme;
- (NSLayoutXAxisAnchor)_maps_leftRHDAnchor;
- (NSLayoutXAxisAnchor)_maps_rightRHDAnchor;
- (NSString)sceneIdentifierForLogging;
- (double)_car_dynamicPixelScaleValue;
- (double)_car_dynamicPointScaleValue;
- (double)_maps_maxConstraintConstantForAxis:(int64_t)a3;
- (id)_addHairlineAtBottom:(BOOL)a3 leadingMargin:(double)a4 trailingMargin:(double)a5;
- (id)_addHairlineAtLeadingWithTopMargin:(double)a3 bottomMargin:(double)a4;
- (id)_addHairlineAtTrailing:(BOOL)a3 topMargin:(double)a4 bottomMargin:(double)a5;
- (id)_addHairlineAtTrailingWithTopMargin:(double)a3 bottomMargin:(double)a4;
- (id)_mapsCar_injectBlurView;
- (id)_mapsCar_insertFocusContainerGuide;
- (id)_mapsCar_insertFocusGuideWithOriginView:(id)a3 toDestinationFocusEnvironments:(id)a4 forDirection:(unint64_t)a5;
- (id)_mapsCar_recursiveSubviewsWithClass:(Class)a3;
- (id)_maps_addHairlineAtBottomWithLeadingMargin:(double)a3 trailingMargin:(double)a4;
- (id)_maps_addHairlineAtBottomWithMargin:(double)a3;
- (id)_maps_addHairlineAtLeadingWithMargin:(double)a3;
- (id)_maps_addHairlineAtTopWithLeadingMargin:(double)a3 trailingMargin:(double)a4;
- (id)_maps_addHairlineAtTopWithMargin:(double)a3;
- (id)_maps_addHairlineAtTrailingWithMargin:(double)a3;
- (id)_maps_carSceneDelegate;
- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5;
- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 priority:(float)a4;
- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5;
- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 priority:(float)a4;
- (id)_maps_constraintsForCenteringInView:(id)a3;
- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4;
- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4 priorities:(id)a5;
- (id)_maps_constraintsForCenteringInView:(id)a3 priorities:(id)a4;
- (id)_maps_mapsSceneDelegate;
- (id)_maps_sceneIdentifierString;
- (void)_mapsCar_updateShadow;
- (void)_maps_alignTopToView:(id)a3;
- (void)_maps_annotateViewForAvoidBusyRoadsInCycling;
- (void)_maps_annotateViewForAvoidBusyRoadsInWalking;
- (void)_maps_annotateViewForAvoidHighways;
- (void)_maps_annotateViewForAvoidHillsInCycling;
- (void)_maps_annotateViewForAvoidHillsInWalking;
- (void)_maps_annotateViewForAvoidStairs;
- (void)_maps_annotateViewForAvoidTolls;
- (void)_maps_annotateViewForTransitPreferenceMode:(unint64_t)a3;
- (void)_maps_annotateViewWithPlaceCardViewController:(id)a3;
- (void)_maps_initializeWithAutolayoutCompressedSize;
- (void)_maps_recursivelySetAllowsGroupOpacity:(BOOL)a3;
- (void)_maps_setAllContentHuggingAndCompressionResistancePriorities:(float)a3;
@end

@implementation UIView

- (CGSize)_maps_compressedSizeForWidth:(double)a3 withBlock:(id)a4
{
  if (a4) {
    (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  }
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v4, v5);
  double v9 = a3;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4 priorities:(id)a5
{
  float var3 = a5.var3;
  float var2 = a5.var2;
  float var1 = a5.var1;
  float var0 = a5.var0;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v14 = a3;
  v32 = [(UIView *)self topAnchor];
  v31 = [v14 topAnchor];
  *(float *)&double v15 = var0;
  v30 = [v32 constraintEqualToAnchor:v31 constant:top priority:v15];
  v33[0] = v30;
  v16 = [(UIView *)self leftAnchor];
  v17 = [v14 leftAnchor];
  *(float *)&double v18 = var2;
  v19 = [v16 constraintEqualToAnchor:v17 constant:left priority:v18];
  v33[1] = v19;
  v20 = [v14 bottomAnchor];
  v21 = [(UIView *)self bottomAnchor];
  *(float *)&double v22 = var1;
  v23 = [v20 constraintEqualToAnchor:v21 constant:bottom priority:v22];
  v33[2] = v23;
  v24 = [v14 rightAnchor];

  v25 = [(UIView *)self rightAnchor];
  *(float *)&double v26 = var3;
  v27 = [v24 constraintEqualToAnchor:v25 constant:right priority:v26];
  v33[3] = v27;
  v28 = +[NSArray arrayWithObjects:v33 count:4];

  return v28;
}

- (NSString)sceneIdentifierForLogging
{
  v2 = [(UIView *)self window];
  v3 = [v2 windowScene];
  double v4 = [v3 delegate];

  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___SceneIdentifierProviding])
  {
    double v5 = [v4 sceneIdentifier];
  }
  else if (v4)
  {
    double v5 = @"iOS";
  }
  else
  {
    double v5 = @"Unknown";
  }

  return (NSString *)v5;
}

- (id)_maps_mapsSceneDelegate
{
  v2 = [(UIView *)self window];
  v3 = [v2 windowScene];
  double v4 = [v3 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5
{
  if (a3)
  {
    double right = a4.right;
    double bottom = a4.bottom;
    double left = a4.left;
    double top = a4.top;
    id v11 = a3;
    v29 = [(UIView *)self topAnchor];
    v28 = [v11 topAnchor];
    *(float *)&double v12 = a5;
    v13 = [v29 constraintEqualToAnchor:v28 constant:top priority:v12];
    v27 = [(UIView *)self leadingAnchor];
    id v14 = [v11 leadingAnchor];
    *(float *)&double v15 = a5;
    v16 = [v27 constraintEqualToAnchor:v14 constant:left priority:v15];
    v17 = [v11 bottomAnchor];
    double v18 = [(UIView *)self bottomAnchor];
    *(float *)&double v19 = a5;
    v20 = [v17 constraintEqualToAnchor:v18 constant:bottom priority:v19];
    v21 = [v11 trailingAnchor];

    double v22 = [(UIView *)self trailingAnchor];
    *(float *)&double v23 = a5;
    v24 = [v21 constraintEqualToAnchor:v22 constant:right priority:v23];
    v25 = +[MapsEdgeConstraints edgeConstraintsWithTop:v13 leading:v16 bottom:v20 trailing:v24];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 insets:(UIEdgeInsets)a4 priority:(float)a5
{
  if (a3)
  {
    double right = a4.right;
    double bottom = a4.bottom;
    double left = a4.left;
    double top = a4.top;
    id v11 = a3;
    v29 = [(UIView *)self topAnchor];
    v28 = [v11 topAnchor];
    *(float *)&double v12 = a5;
    v13 = [v29 constraintEqualToAnchor:v28 constant:top priority:v12];
    v27 = [(UIView *)self leadingAnchor];
    id v14 = [v11 leadingAnchor];
    *(float *)&double v15 = a5;
    v16 = [v27 constraintEqualToAnchor:v14 constant:left priority:v15];
    v17 = [v11 bottomAnchor];
    double v18 = [(UIView *)self bottomAnchor];
    *(float *)&double v19 = a5;
    v20 = [v17 constraintEqualToAnchor:v18 constant:bottom priority:v19];
    v21 = [v11 trailingAnchor];

    double v22 = [(UIView *)self trailingAnchor];
    *(float *)&double v23 = a5;
    v24 = [v21 constraintEqualToAnchor:v22 constant:right priority:v23];
    v25 = +[MapsEdgeConstraints edgeConstraintsWithTop:v13 leading:v16 bottom:v20 trailing:v24];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_addHairlineAtBottom:(BOOL)a3 leadingMargin:(double)a4 trailingMargin:(double)a5
{
  BOOL v7 = a3;
  double v9 = objc_alloc_init(HairlineView);
  [(HairlineView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self addSubview:v9];
  id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  id v11 = [(HairlineView *)v9 leadingAnchor];
  double v12 = [(UIView *)self leadingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:a4];
  [(HairlineView *)v9 setLeadingMarginConstraint:v13];

  id v14 = [(HairlineView *)v9 leadingMarginConstraint];
  [v10 addObject:v14];

  double v15 = [(UIView *)self trailingAnchor];
  v16 = [(HairlineView *)v9 trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:a5];
  [(HairlineView *)v9 setTrailingMarginConstraint:v17];

  double v18 = [(HairlineView *)v9 trailingMarginConstraint];
  [v10 addObject:v18];

  if (v7)
  {
    double v19 = [(HairlineView *)v9 bottomAnchor];
    [(UIView *)self bottomAnchor];
  }
  else
  {
    double v19 = [(HairlineView *)v9 topAnchor];
    [(UIView *)self topAnchor];
  v20 = };
  v21 = [v19 constraintEqualToAnchor:v20];
  [v10 addObject:v21];

  +[NSLayoutConstraint activateConstraints:v10];

  return v9;
}

- (MapsTheme)theme
{
  v3 = [(UIView *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4)
  {
    double v5 = [(UIView *)self traitCollection];
    BOOL v6 = [v5 userInterfaceStyle] != (id)1;

    BOOL v7 = +[MapsTheme sharedTheme];
    [v7 setMapsThemeStyle:v6];
  }

  return (MapsTheme *)+[MapsTheme sharedTheme];
}

- (id)_maps_constraintsForCenteringInView:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1148846080;
  return -[UIView _maps_constraintsForCenteringInView:edgeInsets:priorities:](self, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", a3, a4.top, a4.left, a4.bottom, a4.right, v4, v5, v6, v7);
}

- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 priority:(float)a4
{
  *(float *)&double v4 = a4;
  return -[UIView _maps_constraintsEqualToEdgesOfView:insets:priority:](self, "_maps_constraintsEqualToEdgesOfView:insets:priority:", a3, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v4);
}

- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 priority:(float)a4
{
  *(float *)&double v4 = a4;
  return -[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](self, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", a3, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v4);
}

- (id)_maps_addHairlineAtTopWithMargin:(double)a3
{
  return [(UIView *)self _maps_addHairlineAtTopWithLeadingMargin:a3 trailingMargin:a3];
}

- (id)_maps_addHairlineAtTopWithLeadingMargin:(double)a3 trailingMargin:(double)a4
{
  return [(UIView *)self _addHairlineAtBottom:0 leadingMargin:a3 trailingMargin:a4];
}

- (id)_maps_addHairlineAtBottomWithMargin:(double)a3
{
  return [(UIView *)self _maps_addHairlineAtBottomWithLeadingMargin:a3 trailingMargin:a3];
}

- (id)_maps_addHairlineAtBottomWithLeadingMargin:(double)a3 trailingMargin:(double)a4
{
  return [(UIView *)self _addHairlineAtBottom:1 leadingMargin:a3 trailingMargin:a4];
}

- (void)_maps_annotateViewWithPlaceCardViewController:(id)a3
{
  double v4 = (PlaceCardViewController *)a3;
  double v5 = self;
  UIView.annotateView(placeCardViewController:)(v4);
}

- (void)_maps_annotateViewForAvoidTolls
{
  v2 = self;
  UIView.annotateViewForAvoidTolls()();
}

- (void)_maps_annotateViewForAvoidHighways
{
  v2 = self;
  UIView.annotateViewForAvoidHighways()();
}

- (void)_maps_annotateViewForAvoidHillsInWalking
{
  v2 = self;
  UIView.annotateViewForAvoidHillsInWalking()();
}

- (void)_maps_annotateViewForAvoidBusyRoadsInWalking
{
  v2 = self;
  UIView.annotateViewForAvoidBusyRoadsInWalking()();
}

- (void)_maps_annotateViewForAvoidStairs
{
  v2 = self;
  UIView.annoateViewForAvoidStairs()();
}

- (void)_maps_annotateViewForAvoidHillsInCycling
{
  v2 = self;
  UIView.annotateViewForAvoidHillsInCycling()();
}

- (void)_maps_annotateViewForAvoidBusyRoadsInCycling
{
  v2 = self;
  UIView.annotateViewForAvoidBusyRoadsInCycling()();
}

- (void)_maps_annotateViewForTransitPreferenceMode:(unint64_t)a3
{
  double v4 = self;
  UIView.annotateViewForTransitPreferenceMode(mode:)(a3);
}

- (void)_maps_recursivelySetAllowsGroupOpacity:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIView *)self layer];
  [v5 setAllowsGroupOpacity:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = [(UIView *)self subviews];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) _maps_recursivelySetAllowsGroupOpacity:v3];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_maps_initializeWithAutolayoutCompressedSize
{
  double y = CGRectZero.origin.y;
  -[UIView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[UIView setBounds:](self, "setBounds:", CGRectZero.origin.x, y, v4, v5);

  [(UIView *)self layoutIfNeeded];
}

- (CGRect)_maps_centeringFrameForView:(id)a3 fit:(BOOL)a4 constrain:(BOOL)a5 inRect:(CGRect)a6
{
  if (a5) {
    -[UIView _maps_centeringFrameForView:inRect:options:](self, "_maps_centeringFrameForView:inRect:options:", a3, a4 | 4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  }
  else {
    -[UIView _maps_centeringFrameForView:inRect:options:](self, "_maps_centeringFrameForView:inRect:options:", a3, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.double y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_maps_centeringFrameForView:(id)a3 inRect:(CGRect)a4 options:(int64_t)a5
{
  char v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  long long v12 = v11;
  if ((v5 & 8) != 0)
  {
    [v11 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v12 layoutMargins];
    v46.origin.double x = v14 + v21;
    v46.origin.double y = v16 + v22;
    v46.size.double width = v18 - (v21 + v23);
    v46.size.double height = v20 - (v22 + v24);
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    CGRect v44 = CGRectIntersection(v43, v46);
    double x = v44.origin.x;
    double y = v44.origin.y;
    double width = v44.size.width;
    double height = v44.size.height;
  }
  if ((v5 & 2) != 0)
  {
    [v12 systemLayoutSizeFittingSize:width height];
  }
  else if (v5)
  {
    [v12 sizeThatFits:width, height];
  }
  else
  {
    [v12 frame];
    double v26 = v25;
    double v28 = v27;
  }
  BOOL v29 = (v5 & 4) == 0;
  if (v26 >= width && (v5 & 4) != 0) {
    double v26 = width;
  }
  if (v28 < height) {
    BOOL v29 = 1;
  }
  if (!v29) {
    double v28 = height;
  }
  -[UIView _maps_centeringFrameForView:size:inRect:](self, "_maps_centeringFrameForView:size:inRect:", v12, v26, v28, x, y, width, height);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  double v39 = v32;
  double v40 = v34;
  double v41 = v36;
  double v42 = v38;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (CGRect)_maps_centeringFrameForView:(id)a3 size:(CGSize)a4 inRect:(CGRect)a5
{
  double height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v9 = a4.height;
  CGFloat v10 = a4.width;
  CGFloat v11 = (a5.size.width - a4.width) * 0.5 + CGRectGetMinX(a5);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.double height = height;
  double v12 = (height - v9) * 0.5 + CGRectGetMinY(v17);
  CGFloat v13 = v11;
  CGFloat v14 = v10;
  double v15 = v9;

  return CGRectIntegral(*(CGRect *)&v13);
}

+ (BOOL)_maps_shouldAdoptImplicitAnimationParameters
{
  unsigned int v2 = +[UIView _isInAnimationBlock];
  if (v2)
  {
    LOBYTE(v2) = +[UIView areAnimationsEnabled];
  }
  return v2;
}

- (BOOL)_maps_isVisible
{
  if ([(UIView *)self isHidden]) {
    return 0;
  }
  double v4 = [(UIView *)self window];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)_maps_alignTopToView:(id)a3
{
  id v4 = a3;
  [(UIView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v4 frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v21.origin.CGFloat x = v12;
  v21.origin.CGFloat y = v14;
  v21.size.CGFloat width = v16;
  v21.size.double height = v18;
  double MinY = CGRectGetMinY(v21);

  -[UIView setFrame:](self, "setFrame:", v6, MinY, v8, v10);
}

- (id)_maps_constraintsForCenteringInView:(id)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1148846080;
  return -[UIView _maps_constraintsForCenteringInView:edgeInsets:priorities:](self, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", a3, 0.0, 0.0, 0.0, 0.0, v3, v4, v5, v6);
}

- (id)_maps_constraintsForCenteringInView:(id)a3 priorities:(id)a4
{
  *(float *)&double v7 = a4.var3;
  *(float *)&double v6 = a4.var2;
  *(float *)&double v5 = a4.var1;
  *(float *)&double v4 = a4.var0;
  return -[UIView _maps_constraintsForCenteringInView:edgeInsets:priorities:](self, "_maps_constraintsForCenteringInView:edgeInsets:priorities:", a3, 0.0, 0.0, 0.0, 0.0, v4, v5, v6, v7);
}

- (CGAffineTransform)_maps_transformScaledToLeadingAtScale:(SEL)a3
{
  if (a4 == 1.0 || a4 == 0.0)
  {
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    [(CGAffineTransform *)self bounds];
    double v7 = v6;
    double v8 = +[UIApplication sharedApplication];
    id v9 = [v8 userInterfaceLayoutDirection];

    double v10 = v7 - v7 * a4;
    if (v9 == (id)1)
    {
      CGAffineTransformMakeScale(&v15, a4, a4);
      double v11 = v10 * 0.5 / a4;
      CGFloat v12 = &v15;
    }
    else
    {
      CGAffineTransformMakeScale(&v14, a4, a4);
      double v11 = v10 * -0.5 / a4;
      CGFloat v12 = &v14;
    }
    return CGAffineTransformTranslate(retstr, v12, v11, 0.0);
  }
  return self;
}

- (CGAffineTransform)_maps_transformScaledToTopAtScale:(SEL)a3
{
  if (a4 == 1.0 || a4 == 0.0)
  {
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    [(CGAffineTransform *)self bounds];
    double v7 = v6;
    CGAffineTransformMakeScale(&v9, a4, a4);
    return CGAffineTransformTranslate(retstr, &v9, 0.0, (v7 - v7 * a4) * -0.5 / a4);
  }
  return self;
}

- (CGAffineTransform)_maps_transformScaledToTopAndLeadingAtScale:(SEL)a3
{
  if (a4 == 1.0 || a4 == 0.0)
  {
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    [(CGAffineTransform *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v10 = +[UIApplication sharedApplication];
    id v11 = [v10 userInterfaceLayoutDirection];

    double v12 = v7 - v7 * a4;
    if (v11 == (id)1)
    {
      CGAffineTransformMakeScale(&v17, a4, a4);
      double v13 = v12 * 0.5 / a4;
      CGAffineTransform v14 = &v17;
    }
    else
    {
      CGAffineTransformMakeScale(&v16, a4, a4);
      double v13 = v12 * -0.5 / a4;
      CGAffineTransform v14 = &v16;
    }
    return CGAffineTransformTranslate(retstr, v14, v13, (v9 - v9 * a4) * -0.5 / a4);
  }
  return self;
}

- (CGAffineTransform)_maps_transformScaledToTopAndTrailingAtScale:(SEL)a3
{
  if (a4 == 1.0 || a4 == 0.0)
  {
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    [(CGAffineTransform *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v10 = +[UIApplication sharedApplication];
    id v11 = [v10 userInterfaceLayoutDirection];

    double v12 = v7 - v7 * a4;
    if (v11 == (id)1)
    {
      CGAffineTransformMakeScale(&v17, a4, a4);
      double v13 = v12 * -0.5 / a4;
      CGAffineTransform v14 = &v17;
    }
    else
    {
      CGAffineTransformMakeScale(&v16, a4, a4);
      double v13 = v12 * 0.5 / a4;
      CGAffineTransform v14 = &v16;
    }
    return CGAffineTransformTranslate(retstr, v14, v13, (v9 - v9 * a4) * -0.5 / a4);
  }
  return self;
}

- (double)_maps_maxConstraintConstantForAxis:(int64_t)a3
{
  double v5 = [(UIView *)self window];
  if (v5) {
    [(UIView *)self window];
  }
  else {
  double v6 = +[UIScreen mainScreen];
  }
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  if (a3 == 1) {
    return v10;
  }
  else {
    return v8;
  }
}

- (void)_maps_setAllContentHuggingAndCompressionResistancePriorities:(float)a3
{
  -[UIView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0);
  *(float *)&double v5 = a3;
  [(UIView *)self setContentHuggingPriority:1 forAxis:v5];
  *(float *)&double v6 = a3;
  [(UIView *)self setContentCompressionResistancePriority:0 forAxis:v6];
  *(float *)&double v7 = a3;

  [(UIView *)self setContentCompressionResistancePriority:1 forAxis:v7];
}

+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4
{
}

+ (void)_maps_animateForAndromeda:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!a3 && !+[UIView areAnimationsEnabled])
  {
    double v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"BacklightLuminanceDidChangeNotification" object:a1];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003E564C;
  v12[3] = &unk_1012E8B30;
  BOOL v15 = a3;
  id v13 = v9;
  id v14 = a1;
  id v11 = v9;
  +[UIView animateWithDuration:0x10000 delay:v8 options:v12 animations:0.25 completion:0.0];
}

- (id)_mapsCar_injectBlurView
{
  double v3 = [CarDynamicBlurView alloc];
  double v4 = self;
  if ([(UIView *)v4 conformsToProtocol:&OBJC_PROTOCOL___CarDynamicBlurViewDelegate])double v5 = v4; {
  else
  }
    double v5 = 0;
  double v6 = v5;

  double v7 = [(CarDynamicBlurView *)v3 initWithBlurViewContext:0 delegate:v6];
  [(CarDynamicBlurView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CarDynamicBlurView *)v7 setUserInteractionEnabled:0];
  [(UIView *)v4 insertSubview:v7 atIndex:0];
  id v8 = [(CarDynamicBlurView *)v7 _maps_constraintsForCenteringInView:v4];
  [(UIView *)v4 addConstraints:v8];

  id v9 = [(CarDynamicBlurView *)v7 layer];
  [v9 setShadowPathIsBounds:1];

  return v7;
}

- (void)_mapsCar_updateShadow
{
  double v3 = [(UIView *)self traitCollection];
  int v4 = dword_100F70050[[v3 userInterfaceStyle] == (id)1];

  id v5 = +[UIColor colorWithWhite:0.0 alpha:1.0];
  id v6 = [v5 CGColor];
  double v7 = [(UIView *)self layer];
  [v7 setShadowColor:v6];

  id v8 = [(UIView *)self layer];
  [v8 setShadowOffset:0.0, 2.0];

  id v9 = [(UIView *)self layer];
  [v9 setShadowRadius:4.0];

  double v10 = [(UIView *)self layer];
  LODWORD(v11) = v4;
  [v10 setShadowOpacity:v11];

  id v12 = [(UIView *)self layer];
  [v12 setShadowPathIsBounds:1];
}

- (NSLayoutXAxisAnchor)_maps_leftRHDAnchor
{
  double v3 = [(UIView *)self window];
  if (objc_msgSend(v3, "_car_isHybridInstrumentCluster"))
  {
    int v4 = [(UIView *)self window];
    BOOL v5 = [v4 _car_hybridInstrumentClusterAlignment] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  id v6 = +[MapsExternalDevice sharedInstance];
  unsigned __int8 v7 = [v6 rightHandDrive];

  if ((v7 & 1) != 0 || v5)
  {
    id v8 = [(UIView *)self rightAnchor];
  }
  else
  {
    id v8 = [(UIView *)self leftAnchor];
  }

  return (NSLayoutXAxisAnchor *)v8;
}

- (NSLayoutXAxisAnchor)_maps_rightRHDAnchor
{
  double v3 = [(UIView *)self window];
  if (objc_msgSend(v3, "_car_isHybridInstrumentCluster"))
  {
    int v4 = [(UIView *)self window];
    BOOL v5 = [v4 _car_hybridInstrumentClusterAlignment] == (id)2;
  }
  else
  {
    BOOL v5 = 0;
  }

  id v6 = +[MapsExternalDevice sharedInstance];
  unsigned __int8 v7 = [v6 rightHandDrive];

  if ((v7 & 1) != 0 || v5)
  {
    id v8 = [(UIView *)self leftAnchor];
  }
  else
  {
    id v8 = [(UIView *)self rightAnchor];
  }

  return (NSLayoutXAxisAnchor *)v8;
}

- (id)_maps_addHairlineAtLeadingWithMargin:(double)a3
{
  return [(UIView *)self _addHairlineAtTrailing:0 topMargin:a3 bottomMargin:a3];
}

- (id)_addHairlineAtLeadingWithTopMargin:(double)a3 bottomMargin:(double)a4
{
  return [(UIView *)self _addHairlineAtTrailing:0 topMargin:a3 bottomMargin:a4];
}

- (id)_maps_addHairlineAtTrailingWithMargin:(double)a3
{
  return [(UIView *)self _addHairlineAtTrailing:1 topMargin:a3 bottomMargin:a3];
}

- (id)_addHairlineAtTrailingWithTopMargin:(double)a3 bottomMargin:(double)a4
{
  return [(UIView *)self _addHairlineAtTrailing:1 topMargin:a3 bottomMargin:a4];
}

- (id)_addHairlineAtTrailing:(BOOL)a3 topMargin:(double)a4 bottomMargin:(double)a5
{
  BOOL v7 = a3;
  id v9 = objc_alloc_init(HairlineView);
  [(HairlineView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HairlineView *)v9 setVertical:1];
  [(UIView *)self addSubview:v9];
  id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  double v11 = [(HairlineView *)v9 topAnchor];
  id v12 = [(UIView *)self topAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12 constant:a4];
  [(HairlineView *)v9 setLeadingMarginConstraint:v13];

  id v14 = [(HairlineView *)v9 leadingMarginConstraint];
  [v10 addObject:v14];

  BOOL v15 = [(UIView *)self bottomAnchor];
  CGAffineTransform v16 = [(HairlineView *)v9 bottomAnchor];
  CGAffineTransform v17 = [v15 constraintEqualToAnchor:v16 constant:a5];
  [(HairlineView *)v9 setTrailingMarginConstraint:v17];

  CGFloat v18 = [(HairlineView *)v9 trailingMarginConstraint];
  [v10 addObject:v18];

  if (v7)
  {
    double v19 = [(HairlineView *)v9 trailingAnchor];
    [(UIView *)self trailingAnchor];
  }
  else
  {
    double v19 = [(HairlineView *)v9 leadingAnchor];
    [(UIView *)self leadingAnchor];
  double v20 = };
  CGRect v21 = [v19 constraintEqualToAnchor:v20];
  [v10 addObject:v21];

  +[NSLayoutConstraint activateConstraints:v10];

  return v9;
}

- (CarCardView)_cardView
{
  id v2 = [(UIView *)self superview];
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      id v2 = (id)v3;
      if (!v3) {
        goto LABEL_6;
      }
    }
    id v2 = v2;
  }
LABEL_6:

  return (CarCardView *)v2;
}

- (id)_mapsCar_insertFocusGuideWithOriginView:(id)a3 toDestinationFocusEnvironments:(id)a4 forDirection:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 isDescendantOfView:self] & 1) == 0)
  {
    id v14 = sub_100577BD4();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_24:
      id v10 = 0;
      goto LABEL_25;
    }
    CGRect v21 = self;
    if (!v21)
    {
      double v26 = @"<nil>";
      goto LABEL_23;
    }
    double v22 = (objc_class *)objc_opt_class();
    double v23 = NSStringFromClass(v22);
    if (objc_opt_respondsToSelector())
    {
      double v24 = [(UIView *)v21 performSelector:"accessibilityIdentifier"];
      double v25 = v24;
      if (v24 && ![v24 isEqualToString:v23])
      {
        double v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

        goto LABEL_19;
      }
    }
    double v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_19:

LABEL_23:
    *(_DWORD *)buf = 138543362;
    v30 = v26;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Tried to insert focus guide along a originView, but originView and focusGuide don't share a common superview", buf, 0xCu);

    goto LABEL_24;
  }
  id v10 = [[CarFocusGuide alloc] initWithOriginView:v8 toDestinationFocusEnvironments:v9 forDirection:a5];
  [(UIView *)self addLayoutGuide:v10];
  double v11 = [(CarFocusGuide *)v10 debugView];

  if (v11)
  {
    id v12 = [(CarFocusGuide *)v10 debugView];
    [(UIView *)self addSubview:v12];
  }
  id v13 = [(CarFocusGuide *)v10 activationConstraints];
  +[NSLayoutConstraint activateConstraints:v13];

  id v14 = sub_100577BD4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    BOOL v15 = self;
    if (!v15)
    {
      double v20 = @"<nil>";
      goto LABEL_21;
    }
    CGAffineTransform v16 = (objc_class *)objc_opt_class();
    CGAffineTransform v17 = NSStringFromClass(v16);
    if (objc_opt_respondsToSelector())
    {
      CGFloat v18 = [(UIView *)v15 performSelector:"accessibilityIdentifier"];
      double v19 = v18;
      if (v18 && ![v18 isEqualToString:v17])
      {
        double v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v17, v15, v19];

        goto LABEL_11;
      }
    }
    double v20 = +[NSString stringWithFormat:@"%@<%p>", v17, v15];
LABEL_11:

LABEL_21:
    double v27 = [(CarFocusGuide *)v10 description];
    *(_DWORD *)buf = 138543618;
    v30 = v20;
    __int16 v31 = 2112;
    double v32 = v27;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding focus guide: %@", buf, 0x16u);
  }
LABEL_25:

  return v10;
}

- (id)_mapsCar_insertFocusContainerGuide
{
  uint64_t v3 = +[CarFocusContainerGuide focusContainerGuideInstalledInView:self];
  [(UIView *)self addLayoutGuide:v3];
  int v4 = [v3 debugView];

  if (v4)
  {
    BOOL v5 = [v3 debugView];
    [(UIView *)self insertSubview:v5 atIndex:0];
  }
  id v6 = [v3 activationConstraints];
  +[NSLayoutConstraint activateConstraints:v6];

  BOOL v7 = sub_100577BD4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = self;
    if (!v8)
    {
      id v13 = @"<nil>";
      goto LABEL_12;
    }
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      double v11 = [(UIView *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        id v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_10;
      }
    }
    id v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_10:

LABEL_12:
    id v14 = [v3 description];
    *(_DWORD *)buf = 138543618;
    CGAffineTransform v17 = v13;
    __int16 v18 = 2112;
    double v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding focus guide: %@", buf, 0x16u);
  }

  return v3;
}

- (id)_maps_sceneIdentifierString
{
  id v2 = [(UIView *)self window];
  uint64_t v3 = [v2 windowScene];
  int v4 = [v3 _sceneIdentifier];

  return v4;
}

- (id)_maps_carSceneDelegate
{
  id v2 = [(UIView *)self window];
  uint64_t v3 = [v2 windowScene];
  int v4 = [v3 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (double)_car_dynamicPointScaleValue
{
  uint64_t v3 = [(UIView *)self window];
  uint64_t v4 = [v3 screen];
  if (!v4)
  {
    double v8 = 1.0;
    goto LABEL_5;
  }
  BOOL v5 = (void *)v4;
  id v6 = [(UIView *)self window];
  unsigned int v7 = [v6 _car_isHybridInstrumentCluster];

  double v8 = 1.0;
  if (v7)
  {
    uint64_t v3 = [(UIView *)self window];
    id v9 = [v3 screen];
    [v9 _car_dynamicPointScaleValue];
    double v8 = v10;

LABEL_5:
  }
  return v8;
}

- (double)_car_dynamicPixelScaleValue
{
  uint64_t v3 = [(UIView *)self window];
  uint64_t v4 = [v3 screen];
  if (!v4)
  {
    double v8 = 1.0;
    goto LABEL_5;
  }
  BOOL v5 = (void *)v4;
  id v6 = [(UIView *)self window];
  unsigned int v7 = [v6 _car_isHybridInstrumentCluster];

  double v8 = 1.0;
  if (v7)
  {
    uint64_t v3 = [(UIView *)self window];
    id v9 = [v3 screen];
    [v9 _car_dynamicPixelScaleValue];
    double v8 = v10;

LABEL_5:
  }
  return v8;
}

- (id)_mapsCar_recursiveSubviewsWithClass:(Class)a3
{
  BOOL v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(UIView *)self subviews];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 _mapsCar_recursiveSubviewsWithClass:a3];
        [v5 addObjectsFromArray:v12];

        if (objc_opt_isKindOfClass()) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [v5 copy];

  return v13;
}

@end