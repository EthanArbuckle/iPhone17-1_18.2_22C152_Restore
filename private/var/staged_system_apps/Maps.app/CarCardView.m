@interface CarCardView
- ($3A137947DC24AF6DB667847AA8BD3130)cornerMaskForCarCardLayout:(SEL)a3;
- ($B1874A4E4729613F071A632570863A63)layout;
- (BOOL)accessibilityPerformEscape;
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isTransitioning;
- (BOOL)staysOnTop;
- (CarCardContent)content;
- (CarCardStyleProviding)styleProvider;
- (CarCardView)initWithContent:(id)a3;
- (CarCardView)initWithFrame:(CGRect)a3;
- (CarCardViewDelegate)delegate;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (NSDictionary)collisionLayoutGuides;
- (NSString)title;
- (UIImageView)focusRingImageView;
- (UILabel)titleView;
- (UILayoutGuide)contentLayoutGuide;
- (UIView)accessoryButtonView;
- (UIView)accessoryContainerView;
- (UIView)accessoryView;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)maskingView;
- (id)_bottomConstraintForAccessoryView:(id)a3;
- (id)_createAccessoryButtonViewForAccessory:(unint64_t)a3;
- (id)_createAccessoryTitleView;
- (id)_focusRingImage;
- (id)_horizontalConstraintForAccessoryView:(id)a3 isLeadingView:(BOOL)a4;
- (id)_styleProviderOrSelf;
- (id)_topConstraintForAccessoryView:(id)a3;
- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5;
- (id)selectionHandler;
- (int64_t)titleNumberOfLines;
- (unint64_t)accessory;
- (unint64_t)roundedCorners;
- (void)_applyCornerMask;
- (void)_chevronButtonTapped:(id)a3;
- (void)_closeButtonTapped:(id)a3;
- (void)_refreshAccessories;
- (void)_refreshBackgroundView;
- (void)_setFocusable:(BOOL)a3;
- (void)_setHighlighted:(BOOL)a3;
- (void)_setLayout:(id *)a3;
- (void)_updateFocusRing;
- (void)_updateHuggingCompressionPriorities;
- (void)_updateInterfaceStyleRelatedViews;
- (void)_updateTransitioning;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)handlePress:(id)a3;
- (void)setAccessory:(unint64_t)a3;
- (void)setAccessoryButtonView:(id)a3;
- (void)setAccessoryContainerView:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCollisionLayoutGuides:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentLayoutGuide:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusRingImageView:(id)a3;
- (void)setLayout:(id *)a3;
- (void)setMaskingView:(id)a3;
- (void)setRoundedCorners:(unint64_t)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setStaysOnTop:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleNumberOfLines:(int64_t)a3;
- (void)setTitleView:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarCardView

- (CarCardView)initWithFrame:(CGRect)a3
{
  v62.receiver = self;
  v62.super_class = (Class)CarCardView;
  v3 = -[CarCardView initWithFrame:](&v62, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CarCardView *)v3 setClipsToBounds:0];
    [(CarCardView *)v4 setAccessibilityIdentifier:@"CarCardView"];
    title = v4->_title;
    v4->_title = 0;

    v4->_accessory = 0;
    *(_OWORD *)&v4->_layout.edgePosition = xmmword_100F6F1C0;
    *(_OWORD *)&v4->_layout.primaryAxis = xmmword_100F67600;
    v4->_layout.primaryAxisFillMode = 3;
    *(void *)&v4->_layout.primaryAxisFillModePriority = 1148846080;
    v4->_layout.secondaryAxisFillMode = 2;
    v4->_layout.secondaryAxisFillModePriority = 1000.0;
    primaryAxisFillLimit = v4->_layout.primaryAxisFillLimit;
    v4->_layout.primaryAxisFillLimit = 0;

    secondaryAxisFillLimit = v4->_layout.secondaryAxisFillLimit;
    v4->_layout.secondaryAxisFillLimit = 0;

    __asm { FMOV            V0.2D, #8.0 }
    *(_OWORD *)&v4->_layout.margins.top = _Q0;
    *(_OWORD *)&v4->_layout.margins.bottom = _Q0;
    v4->_layout.flipForRightHandDrive = 1;
    *(_DWORD *)(&v4->_layout.flipForRightHandDrive + 1) = 0;
    *((_DWORD *)&v4->_layout.flipForRightHandDrive + 1) = 0;
    v4->_layout.edgesAffectingMapInsets = 8;
    v4->_layout.horizontallyCenterMapInsets = 0;
    v4->_roundedCorners = sub_10077F0A4(v4->_layout.pinnedEdges);
    id v13 = objc_alloc((Class)UIView);
    [(CarCardView *)v4 bounds];
    id v61 = [v13 initWithFrame:];
    [v61 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarCardView *)v4 addSubview:v61];
    [(CarCardView *)v4 setMaskingView:v61];
    id v14 = objc_alloc((Class)UIView);
    [(CarCardView *)v4 bounds];
    id v59 = [v14 initWithFrame:];
    [v59 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v61 addSubview:v59];
    [(CarCardView *)v4 setContainerView:v59];
    id v15 = objc_alloc((Class)UIView);
    [(CarCardView *)v4 bounds];
    id v60 = [v15 initWithFrame:];
    [v60 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [v60 heightAnchor];
    LODWORD(v17) = 1132068864;
    v18 = [v16 constraintEqualToConstant:44.0 priority:v17];
    [v60 addConstraint:v18];

    v19 = [v60 heightAnchor];
    v20 = [v19 constraintGreaterThanOrEqualToConstant:44.0];
    [v60 addConstraint:v20];

    LODWORD(v21) = 1148846080;
    [v60 setContentHuggingPriority:1 forAxis:v21];
    LODWORD(v22) = 1148846080;
    [v60 setContentCompressionResistancePriority:1 forAxis:v22];
    [v59 addSubview:v60];
    [(CarCardView *)v4 setAccessoryContainerView:v60];
    [(CarCardView *)v4 _updateHuggingCompressionPriorities];
    v57 = [v61 topAnchor];
    v55 = [(CarCardView *)v4 topAnchor];
    v53 = [v57 constraintEqualToAnchor:v55];
    v64[0] = v53;
    v51 = [v61 leftAnchor];
    v23 = [(CarCardView *)v4 leftAnchor];
    v24 = [v51 constraintEqualToAnchor:v23];
    v64[1] = v24;
    v25 = [v61 bottomAnchor];
    v26 = [(CarCardView *)v4 bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v64[2] = v27;
    v28 = [v61 rightAnchor];
    v29 = [(CarCardView *)v4 rightAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v64[3] = v30;
    v31 = +[NSArray arrayWithObjects:v64 count:4];
    [(CarCardView *)v4 addConstraints:v31];

    [(CarCardView *)v4 _refreshAccessories];
    v58 = [v59 topAnchor];
    v56 = [v61 topAnchor];
    v54 = [v58 constraintEqualToAnchor:v56];
    v63[0] = v54;
    v52 = [v59 leftAnchor];
    v50 = [v61 leftAnchor];
    v49 = [v52 constraintEqualToAnchor:v50];
    v63[1] = v49;
    v48 = [v59 bottomAnchor];
    v47 = [v61 bottomAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v63[2] = v46;
    v45 = [v59 rightAnchor];
    v32 = [v61 rightAnchor];
    v33 = [v45 constraintEqualToAnchor:v32];
    v63[3] = v33;
    v34 = [v60 leftAnchor];
    v35 = [v59 leftAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v63[4] = v36;
    v37 = [v60 rightAnchor];
    v38 = [v59 rightAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v63[5] = v39;
    v40 = +[NSArray arrayWithObjects:v63 count:6];
    [v61 addConstraints:v40];

    v41 = [(CarCardView *)v4 layer];
    [v41 setShadowPathIsBounds:1];

    v42 = [[CarDynamicBlurView alloc] initWithBlurViewContext:0 delegate:0];
    dynamicBlurView = v4->_dynamicBlurView;
    v4->_dynamicBlurView = v42;
  }
  return v4;
}

- (CarCardView)initWithContent:(id)a3
{
  id v4 = a3;
  v5 = -[CarCardView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5) {
    [(CarCardView *)v5 setContent:v4];
  }

  return v6;
}

- (void)setContent:(id)a3
{
  v5 = (CarCardContent *)a3;
  if (self->_content != v5)
  {
    id v6 = [(CarCardView *)self content];
    objc_storeStrong((id *)&self->_content, a3);
    if (v6)
    {
      if ([v6 isViewLoaded])
      {
        v7 = [v6 view];
        v8 = [v7 superview];
        v9 = [(CarCardView *)self containerView];

        if (v8 == v9)
        {
          v10 = [v6 view];
          [v10 removeFromSuperview];
        }
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_styleProvider);

    if (WeakRetained == v6) {
      [(CarCardView *)self setStyleProvider:0];
    }
    if (v5)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10077F2C8;
      v12[3] = &unk_1012E5D58;
      v12[4] = self;
      id v13 = v5;
      +[UIView performWithoutAnimation:v12];
    }
  }
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)CarCardView;
  [(CarCardView *)&v6 didMoveToWindow];
  v3 = [(CarCardView *)self window];

  if (v3)
  {
    [(CarCardView *)self _applyCornerMask];
    [(CarCardView *)self _refreshAccessories];
    [(CarCardView *)self _updateInterfaceStyleRelatedViews];
  }
  else
  {
    focusRingImage = self->_focusRingImage;
    self->_focusRingImage = 0;

    v5 = [(CarCardView *)self focusRingImageView];
    [v5 removeFromSuperview];

    [(CarCardView *)self setFocusRingImageView:0];
  }
}

- (void)setLayout:(id *)a3
{
  v5 = [(CarCardView *)self styleProvider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CarCardView *)self styleProvider];
    long long v8 = *(_OWORD *)&a3->var2;
    v35[0] = *(_OWORD *)&a3->var0;
    v35[1] = v8;
    v36[0] = *(_OWORD *)&a3->var4;
    *(_OWORD *)((char *)v36 + 12) = *(_OWORD *)(&a3->var5 + 1);
    id v9 = a3->var8;
    id v37 = v9;
    id v10 = a3->var9;
    id v38 = v10;
    long long v11 = *(_OWORD *)&a3->var10.bottom;
    long long v39 = *(_OWORD *)&a3->var10.top;
    long long v40 = v11;
    long long v41 = *(_OWORD *)&a3->var11;
    BOOL var13 = a3->var13;
    if (v7)
    {
      [v7 validateCarCardLayout:v35];
      v12 = (void *)v46;
    }
    else
    {
      id v13 = v10;

      v12 = 0;
      BOOL v50 = 0;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      memset(v45, 0, sizeof(v45));
      long long v43 = 0u;
      long long v44 = 0u;
    }
    long long v14 = v44;
    *(_OWORD *)&a3->var0 = v43;
    *(_OWORD *)&a3->var2 = v14;
    *(_OWORD *)&a3->var4 = v45[0];
    *(_OWORD *)(&a3->var5 + 1) = *(_OWORD *)((char *)v45 + 12);
    *(void *)&long long v46 = 0;
    id var8 = a3->var8;
    a3->id var8 = v12;

    v16 = (void *)*((void *)&v46 + 1);
    *((void *)&v46 + 1) = 0;
    id var9 = a3->var9;
    a3->id var9 = v16;

    long long v18 = v48;
    *(_OWORD *)&a3->var10.top = v47;
    *(_OWORD *)&a3->var10.bottom = v18;
    *(_OWORD *)&a3->var11 = v49;
    a3->BOOL var13 = v50;
  }
  primaryAxisFillLimit = self->_layout.primaryAxisFillLimit;
  secondaryAxisFillLimit = self->_layout.secondaryAxisFillLimit;
  p_var10 = &a3->var10;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->_layout.edgePosition, *(int64x2_t *)&a3->var0), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->_layout.primaryAxis, *(int64x2_t *)&a3->var2))), 0xFuLL))) & 1) != 0&& self->_layout.primaryAxisFillMode == a3->var4&& self->_layout.secondaryAxisFillMode == a3->var6&& self->_layout.edgesAffectingMapInsets == a3->var12&& self->_layout.flipForRightHandDrive == a3->var11&& self->_layout.primaryAxisFillModePriority == a3->var5&& self->_layout.secondaryAxisFillModePriority == a3->var7)
  {
    char v22 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layout.margins.top, *(float64x2_t *)&p_var10->top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layout.margins.bottom, *(float64x2_t *)&a3->var10.bottom))), 0xFuLL)));
    v23 = secondaryAxisFillLimit;

    if (v22) {
      goto LABEL_17;
    }
  }
  else
  {
    v24 = secondaryAxisFillLimit;
  }
  long long v25 = *(_OWORD *)&a3->var2;
  v27[0] = *(_OWORD *)&a3->var0;
  v27[1] = v25;
  v28[0] = *(_OWORD *)&a3->var4;
  *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)(&a3->var5 + 1);
  id v29 = a3->var8;
  id v30 = a3->var9;
  long long v26 = *(_OWORD *)&a3->var10.bottom;
  float64x2_t v31 = *(float64x2_t *)&p_var10->top;
  long long v32 = v26;
  long long v33 = *(_OWORD *)&a3->var11;
  BOOL v34 = a3->var13;
  [(CarCardView *)self _setLayout:v27];
LABEL_17:
}

- (void)_setLayout:(id *)a3
{
  p_layout = &self->_layout;
  [(CarCardView *)self _updateHuggingCompressionPriorities];
  unint64_t v6 = sub_10077F0A4(p_layout->pinnedEdges);
  if (self->_roundedCorners != v6)
  {
    self->_roundedCorners = v6;
    [(CarCardView *)self _applyCornerMask];
  }

  id var9 = a3->var9;
}

- (void)_updateHuggingCompressionPriorities
{
  if (self->_layout.primaryAxis == 1) {
    *(float *)&double v2 = 751.0;
  }
  else {
    *(float *)&double v2 = 999.0;
  }
  if (self->_layout.primaryAxis == 1) {
    float v4 = 999.0;
  }
  else {
    float v4 = 751.0;
  }
  [(CarCardView *)self setContentHuggingPriority:0 forAxis:v2];
  *(float *)&double v5 = v4;

  [(CarCardView *)self setContentHuggingPriority:1 forAxis:v5];
}

- (NSArray)preferredFocusEnvironments
{
  v3 = [(CarCardView *)self content];
  if (v3)
  {
    float v4 = [(CarCardView *)self content];
    double v5 = [v4 preferredFocusEnvironments];
  }
  else
  {
    double v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (NSArray)focusOrderSubItems
{
  if ([(CarCardView *)self isHidden])
  {
    id v3 = &__NSArray0__struct;
  }
  else
  {
    float v4 = +[NSMutableArray array];
    if ([(CarCardView *)self canBecomeFocused]) {
      [v4 addObject:self];
    }
    double v5 = [(CarCardView *)self accessoryButtonView];

    if (v5)
    {
      unint64_t v6 = [(CarCardView *)self accessoryButtonView];
      [v4 addObject:v6];
    }
    v7 = [(CarCardView *)self content];
    long long v8 = [v7 focusOrderSubItems];
    [v4 addObjectsFromArray:v8];

    id v3 = [v4 copy];
  }

  return (NSArray *)v3;
}

- (void)setSelectionHandler:(id)a3
{
  id v4 = [a3 copy];
  id selectionHandler = self->_selectionHandler;
  self->_id selectionHandler = v4;

  BOOL v6 = self->_selectionHandler != 0;

  [(CarCardView *)self _setFocusable:v6];
}

- (BOOL)canBecomeFocused
{
  id v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 chromeViewController];
  if (([v4 isAutohidingContentHiddenForCurrentContext] & 1) != 0 || !self->_focusable) {
    LOBYTE(v5) = 0;
  }
  else {
    unsigned int v5 = [(CarCardView *)self isHidden] ^ 1;
  }

  return v5;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v9 = a3;
  [(CarCardView *)self _updateFocusRing];
  unsigned int v5 = [(CarCardView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CarCardView *)self delegate];
    long long v8 = [v9 nextFocusedItem];
    [v7 carCardView:self didChangeFocus:v8 == self];
  }
}

- (void)_setFocusable:(BOOL)a3
{
  if (self->_focusable != a3)
  {
    self->_focusable = a3;
    if (a3)
    {
      id v4 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handlePress:"];
      buttonRecognizer = self->_buttonRecognizer;
      self->_buttonRecognizer = v4;

      [(UILongPressGestureRecognizer *)self->_buttonRecognizer setDelegate:self];
      [(UILongPressGestureRecognizer *)self->_buttonRecognizer setMinimumPressDuration:0.0];
      [(UILongPressGestureRecognizer *)self->_buttonRecognizer setAllowedPressTypes:&off_1013ADF50];
      [(CarCardView *)self addGestureRecognizer:self->_buttonRecognizer];
      char v6 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handlePress:"];
      tapRecognizer = self->_tapRecognizer;
      self->_tapRecognizer = v6;

      [(UILongPressGestureRecognizer *)self->_tapRecognizer setDelegate:self];
      [(UILongPressGestureRecognizer *)self->_tapRecognizer setMinimumPressDuration:0.0];
      [(UILongPressGestureRecognizer *)self->_tapRecognizer setAllowedTouchTypes:&off_1013ADF68];
      long long v8 = self->_tapRecognizer;
      [(CarCardView *)self addGestureRecognizer:v8];
    }
    else
    {
      [(CarCardView *)self removeGestureRecognizer:self->_buttonRecognizer];
      id v9 = self->_tapRecognizer;
      [(CarCardView *)self removeGestureRecognizer:v9];
    }
  }
}

- (void)handlePress:(id)a3
{
  id v4 = a3;
  if ([v4 state] == (id)1)
  {
    unsigned int v5 = self;
    uint64_t v6 = 1;
LABEL_8:
    [(CarCardView *)v5 _setHighlighted:v6];
    goto LABEL_9;
  }
  if ([v4 state] == (id)3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100780088;
    v9[3] = &unk_1012E5D08;
    v9[4] = self;
    +[UIView animateWithDuration:v9 animations:0.25];
    v7 = [(CarCardView *)self selectionHandler];

    if (v7)
    {
      long long v8 = [(CarCardView *)self selectionHandler];
      [v4 locationInView:self];
      v8[2](v8);
    }
  }
  else if ([v4 state] != (id)2)
  {
    unsigned int v5 = self;
    uint64_t v6 = 0;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (a3) {
      double v3 = 0.800000012;
    }
    else {
      double v3 = 1.0;
    }
    id v4 = [(CarCardView *)self backgroundView];
    [v4 setAlpha:v3];
  }
}

- (void)_updateFocusRing
{
  double v3 = [(CarCardView *)self window];

  if (v3)
  {
    BOOL focusable = self->_focusable;
    unsigned int v5 = [(CarCardView *)self focusRingImageView];
    uint64_t v6 = v5;
    if (focusable)
    {

      if (!v6)
      {
        id v7 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        [(CarCardView *)self setFocusRingImageView:v7];

        long long v8 = [(CarCardView *)self focusRingImageView];
        [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

        id v9 = [(CarCardView *)self focusRingImageView];
        [(CarCardView *)self addSubview:v9];

        id v30 = [(CarCardView *)self focusRingImageView];
        id v29 = [v30 centerXAnchor];
        v28 = [(CarCardView *)self centerXAnchor];
        v27 = [v29 constraintEqualToAnchor:v28];
        v31[0] = v27;
        long long v26 = [(CarCardView *)self focusRingImageView];
        long long v25 = [v26 centerYAnchor];
        v24 = [(CarCardView *)self centerYAnchor];
        v23 = [v25 constraintEqualToAnchor:v24];
        v31[1] = v23;
        id v10 = [(CarCardView *)self focusRingImageView];
        long long v11 = [v10 widthAnchor];
        v12 = [(CarCardView *)self widthAnchor];
        id v13 = [v11 constraintEqualToAnchor:v12];
        v31[2] = v13;
        long long v14 = [(CarCardView *)self focusRingImageView];
        id v15 = [v14 heightAnchor];
        v16 = [(CarCardView *)self heightAnchor];
        double v17 = [v15 constraintEqualToAnchor:v16];
        v31[3] = v17;
        long long v18 = +[NSArray arrayWithObjects:v31 count:4];
        +[NSLayoutConstraint activateConstraints:v18];
      }
      v19 = [(CarCardView *)self _focusRingImage];
      v20 = [(CarCardView *)self focusRingImageView];
      [v20 setImage:v19];

      uint64_t v21 = [(CarCardView *)self isFocused] ^ 1;
      char v22 = [(CarCardView *)self focusRingImageView];
      [v22 setHidden:v21];
    }
    else
    {
      [v5 removeFromSuperview];

      [(CarCardView *)self setFocusRingImageView:0];
    }
  }
}

- (id)_focusRingImage
{
  focusRingImage = self->_focusRingImage;
  if (!focusRingImage)
  {
    double v4 = sub_1005F7D78();
    double v5 = v4 * ceil(13.757985 / v4);
    double v6 = sub_1005F7D78();
    double v7 = v6 * ceil(13.757985 / v6);
    v25.origin.double x = 0.0;
    v25.origin.double y = 0.0;
    v25.size.double width = v5 * 2.0 + 1.0;
    v25.size.double height = v7 * 2.0 + 1.0;
    CGRect v26 = CGRectInset(v25, 3.0, 3.0);
    double x = v26.origin.x;
    double y = v26.origin.y;
    double width = v26.size.width;
    double height = v26.size.height;
    v12 = [(CarCardView *)self traitCollection];
    [v12 displayScale];
    CGFloat v14 = v13;
    v24.double width = v5 * 2.0 + 1.0;
    v24.double height = v7 * 2.0 + 1.0;
    UIGraphicsBeginImageContextWithOptions(v24, 0, v14);

    id v15 = [(CarCardView *)self traitCollection];
    if ([v15 userInterfaceStyle] == (id)1) {
      +[UIColor systemBlueColor];
    }
    else {
    v16 = +[UIColor systemTealColor];
    }

    [v16 setStroke];
    double v17 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, x, y, width, height, 6.0, 6.0);
    [v17 setLineWidth:1.5];
    [v17 stroke];
    long long v18 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v19 = [v18 imageWithRenderingMode:1];

    [v19 resizableImageWithCapInsets:v7, v5, v7, v5];
    v20 = (UIImage *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = self->_focusRingImage;
    self->_focusRingImage = v20;

    focusRingImage = self->_focusRingImage;
  }

  return focusRingImage;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v4 = [a4 view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)setTitle:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    [(CarCardView *)self _refreshAccessories];
    double v5 = v6;
  }
}

- (void)setTitleNumberOfLines:(int64_t)a3
{
  if (self->_titleNumberOfLines != a3)
  {
    self->_titleNumberOfLines = a3;
    [(CarCardView *)self _refreshAccessories];
  }
}

- (id)_createAccessoryTitleView
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setAccessibilityIdentifier:@"TitleLabel"];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v4 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout traits:32770];
  [v3 setFont:v4];
  LODWORD(v5) = 1132068864;
  [v3 setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v3 setContentHuggingPriority:1 forAxis:v6];
  LODWORD(v7) = 1144750080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v7];
  LODWORD(v8) = 1144750080;
  [v3 setContentCompressionResistancePriority:1 forAxis:v8];
  [v3 setLineBreakMode:4];
  if ([(CarCardView *)self titleNumberOfLines]
    && [(CarCardView *)self titleNumberOfLines] <= 3)
  {
    int64_t v9 = [(CarCardView *)self titleNumberOfLines];
  }
  else
  {
    int64_t v9 = 3;
  }
  [v3 setNumberOfLines:v9];
  id v10 = +[UIColor labelColor];
  [v3 setTextColor:v10];

  long long v11 = [(CarCardView *)self title];
  if (v11)
  {
    LODWORD(v12) = 1036831949;
    double v13 = +[NSParagraphStyle _maps_paragraphStyleForHandlingExcessiveHeightString:v11 withHyphenationFactor:v12];
    id v14 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v18 = NSParagraphStyleAttributeName;
    v19 = v13;
    id v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v16 = [v14 initWithString:v11 attributes:v15];

    [v3 setAttributedText:v16];
  }
  else
  {
    [v3 setText:0];
  }

  return v3;
}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessordouble y = a3;
    [(CarCardView *)self _refreshAccessories];
  }
}

- (void)setAccessoryView:(id)a3
{
  double v5 = (UIView *)a3;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    double v7 = v5;
    [(UIView *)accessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(CarCardView *)self _refreshAccessories];
    double v5 = v7;
  }
}

- (void)_refreshAccessories
{
  id v3 = [(CarCardView *)self window];

  if (v3)
  {
    double v4 = [(CarCardView *)self accessoryButtonView];
    [v4 removeFromSuperview];

    double v5 = [(CarCardView *)self _createAccessoryButtonViewForAccessory:[(CarCardView *)self accessory]];
    [(CarCardView *)self setAccessoryButtonView:v5];

    double v6 = [(CarCardView *)self titleView];
    [v6 removeFromSuperview];

    double v7 = [(CarCardView *)self _createAccessoryTitleView];
    [(CarCardView *)self setTitleView:v7];

    double v8 = [(CarCardView *)self accessoryView];
    [v8 removeFromSuperview];

    int64_t v9 = [(CarCardView *)self title];
    if (v9) {
      [(CarCardView *)self titleView];
    }
    else {
    id v10 = [(CarCardView *)self accessoryView];
    }

    long long v11 = [(CarCardView *)self accessoryButtonView];
    double v12 = +[NSMutableArray array];
    if (v10)
    {
      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v13 = [(CarCardView *)self accessoryContainerView];
      [v13 addSubview:v10];

      id v14 = [v10 trailingAnchor];
      id v15 = [(CarCardView *)self accessoryContainerView];
      [v15 trailingAnchor];
      double v17 = v16 = v10;
      NSAttributedStringKey v18 = [v14 constraintEqualToAnchor:v17];

      LODWORD(v19) = 1144750080;
      v64 = v18;
      [v18 setPriority:v19];
      [v12 addObject:v18];
      v63 = [(CarCardView *)self _topConstraintForAccessoryView:v16];
      v70[0] = v63;
      v20 = [(CarCardView *)self _horizontalConstraintForAccessoryView:v16 isLeadingView:1];
      v70[1] = v20;
      uint64_t v21 = [v16 trailingAnchor];
      [(CarCardView *)self accessoryContainerView];
      v23 = char v22 = v12;
      [v23 trailingAnchor];
      CGSize v24 = v66 = v11;
      CGRect v25 = [v21 constraintLessThanOrEqualToAnchor:v24];
      v70[2] = v25;
      CGRect v26 = [(CarCardView *)self _bottomConstraintForAccessoryView:v16];
      v70[3] = v26;
      v27 = +[NSArray arrayWithObjects:v70 count:4];
      [v22 addObjectsFromArray:v27];

      long long v11 = v66;
      double v12 = v22;
      v28 = GEOResultRefinementSort_ptr;

      id v10 = v16;
      id v29 = (_DWORD *)&unk_100F6F000;

      if (!v66)
      {
LABEL_11:
        long long v48 = [(CarCardView *)self accessoryContainerView];
        [v48 addConstraints:v12];

        [(CarCardView *)self removeConstraint:self->_constraintAccessoryBarPosition];
        long long v49 = [(CarCardView *)self accessoryContainerView];
        BOOL v50 = [v49 topAnchor];
        v51 = [(CarCardView *)self containerView];
        v52 = [v51 topAnchor];
        v53 = [v50 constraintEqualToAnchor:v52];
        constraintAccessoryBarPosition = self->_constraintAccessoryBarPosition;
        self->_constraintAccessoryBarPosition = v53;

        [(CarCardView *)self addConstraint:self->_constraintAccessoryBarPosition];
        if (!self->_accessoryFocusContainerGuide)
        {
          v55 = [(UIView *)self->_accessoryContainerView _mapsCar_insertFocusContainerGuide];
          accessoryFocusContainerGuide = self->_accessoryFocusContainerGuide;
          self->_accessoryFocusContainerGuide = v55;
        }
        goto LABEL_14;
      }
    }
    else
    {
      v28 = GEOResultRefinementSort_ptr;
      id v29 = &unk_100F6F000;
      if (!v11)
      {
        [(CarCardView *)self removeConstraint:self->_constraintAccessoryBarPosition];
        v57 = [(CarCardView *)self accessoryContainerView];
        v58 = [v57 bottomAnchor];
        id v59 = [(CarCardView *)self containerView];
        id v60 = [v59 topAnchor];
        id v61 = [v58 constraintEqualToAnchor:v60];
        objc_super v62 = self->_constraintAccessoryBarPosition;
        self->_constraintAccessoryBarPosition = v61;

        [(CarCardView *)self addConstraint:self->_constraintAccessoryBarPosition];
        [(CarCardView *)self removeLayoutGuide:self->_accessoryFocusContainerGuide];
LABEL_14:

        return;
      }
    }
    v68 = v10;
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v30 = [(CarCardView *)self accessoryContainerView];
    [v30 addSubview:v11];

    float64x2_t v31 = [v11 leadingAnchor];
    long long v32 = [(CarCardView *)self accessoryContainerView];
    long long v33 = [v32 leadingAnchor];
    BOOL v34 = [v31 constraintEqualToAnchor:v33];

    LODWORD(v35) = v29[106];
    v67 = v34;
    [v34 setPriority:v35];
    [v12 addObject:v34];
    v65 = [(CarCardView *)self _topConstraintForAccessoryView:v11];
    v69[0] = v65;
    v36 = [v11 leadingAnchor];
    id v37 = [(CarCardView *)self accessoryContainerView];
    [v37 leadingAnchor];
    v39 = id v38 = v12;
    long long v40 = [v36 constraintGreaterThanOrEqualToAnchor:v39];
    v69[1] = v40;
    long long v41 = [(CarCardView *)self _horizontalConstraintForAccessoryView:v11 isLeadingView:0];
    v69[2] = v41;
    v42 = [(CarCardView *)self _bottomConstraintForAccessoryView:v11];
    v69[3] = v42;
    [v28[501] arrayWithObjects:v69 count:4];
    v44 = long long v43 = v11;
    [v38 addObjectsFromArray:v44];

    long long v11 = v43;
    double v12 = v38;

    id v10 = v68;
    if (v68)
    {
      v45 = [v43 leadingAnchor];
      long long v46 = [v68 trailingAnchor];
      long long v47 = [v45 constraintGreaterThanOrEqualToAnchor:v46 constant:10.0];
      [v38 addObject:v47];
    }
    goto LABEL_11;
  }
}

- (id)_topConstraintForAccessoryView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CarCardView *)self titleView];
  if ((id)v5 == v4)
  {

    goto LABEL_5;
  }
  double v6 = (void *)v5;
  id v7 = [(CarCardView *)self accessoryButtonView];

  if (v7 == v4)
  {
LABEL_5:
    id v13 = [(CarCardView *)self titleView];
    if (v13 == v4) {
      double v14 = 28.0;
    }
    else {
      double v14 = 29.0;
    }

    double v8 = [v4 firstBaselineAnchor];
    int64_t v9 = [(CarCardView *)self accessoryContainerView];
    id v10 = [v9 topAnchor];
    uint64_t v12 = [v8 constraintEqualToAnchor:v10 constant:v14];
    goto LABEL_9;
  }
  double v8 = [v4 topAnchor];
  int64_t v9 = [(CarCardView *)self accessoryContainerView];
  id v10 = [v9 topAnchor];
  LODWORD(v11) = 1144750080;
  uint64_t v12 = [v8 constraintEqualToAnchor:v10 constant:0.0 priority:v11];
LABEL_9:
  id v15 = (void *)v12;

  return v15;
}

- (id)_bottomConstraintForAccessoryView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CarCardView *)self titleView];
  if ((id)v5 == v4)
  {

    goto LABEL_5;
  }
  double v6 = (void *)v5;
  id v7 = [(CarCardView *)self accessoryButtonView];

  if (v7 == v4)
  {
LABEL_5:
    id v14 = [(CarCardView *)self titleView];

    double v8 = [(CarCardView *)self accessoryContainerView];
    int64_t v9 = [v8 bottomAnchor];
    id v10 = [v4 lastBaselineAnchor];
    if (v14 == v4)
    {
      LODWORD(v11) = 1148829696;
      double v12 = 16.0;
    }
    else
    {
      LODWORD(v11) = 1144733696;
      double v12 = 15.0;
    }
    id v13 = v9;
    goto LABEL_9;
  }
  double v8 = [v4 bottomAnchor];
  int64_t v9 = [(CarCardView *)self accessoryContainerView];
  id v10 = [v9 bottomAnchor];
  LODWORD(v11) = 1144750080;
  double v12 = 0.0;
  id v13 = v8;
LABEL_9:
  id v15 = [v13 constraintEqualToAnchor:v10 constant:v12 priority:v11];

  return v15;
}

- (id)_horizontalConstraintForAccessoryView:(id)a3 isLeadingView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    double v8 = [v6 leadingAnchor];
    int64_t v9 = [(CarCardView *)self accessoryContainerView];
    [v9 leadingAnchor];
  }
  else
  {
    double v8 = [v6 trailingAnchor];
    int64_t v9 = [(CarCardView *)self accessoryContainerView];
    [v9 trailingAnchor];
  id v10 = };

  double v11 = [(CarCardView *)self accessoryButtonView];

  if (v11 == v7) {
    double v12 = 8.5;
  }
  else {
    double v12 = 10.0;
  }

  double v13 = -v12;
  if (v4) {
    double v13 = v12;
  }
  id v14 = [v8 constraintEqualToAnchor:v10 constant:v13];

  return v14;
}

- (id)_createAccessoryButtonViewForAccessory:(unint64_t)a3
{
  unint64_t v4 = [(CarCardView *)self accessory];
  if (v4 == 2)
  {
    uint64_t v5 = +[CarFocusableButton buttonWithType:0];
    [v5 setAccessibilityIdentifier:@"ChevronButton"];
    id v6 = +[UIColor _carSystemFocusColor];
    [v5 setFocusedTintColor:v6];

    id v7 = +[UIColor _carSystemTertiaryColor];
    [v5 setNonFocusedTintColor:v7];

    double v8 = [v5 imageView];
    [v8 setContentMode:1];

    LODWORD(v9) = 1148846080;
    [v5 setContentHuggingPriority:0 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [v5 setContentCompressionResistancePriority:0 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [v5 setContentCompressionResistancePriority:1 forAxis:v11];
    double v12 = +[UIImage _mapsCar_systemImageNamed:@"chevron.down.circle.fill" textStyle:UIFontTextStyleTitle3 weight:6];
    double v13 = +[UIImage _mapsCar_systemImageNamed:@"chevron.up.circle.fill" textStyle:UIFontTextStyleTitle3 weight:6];
    [v5 setImage:v12 forState:0];
    [v5 setImage:v12 forState:8];
    [v5 setImage:v12 forState:1];
    [v5 setImage:v12 forState:9];
    [v5 setImage:v13 forState:4];
    [v5 setImage:v13 forState:12];
    [v5 setImage:v13 forState:5];
    [v5 setImage:v13 forState:13];
    [v5 addTarget:self action:"_chevronButtonTapped:" forControlEvents:64];
    [v5 setTouchInsets:-10.0, -10.0, -10.0, -10.0];
  }
  else if (v4 == 1)
  {
    uint64_t v5 = +[CarFocusableButton closeButton];
    [v5 setAccessibilityIdentifier:@"CloseButton"];
    [v5 addTarget:self action:"_closeButtonTapped:" forControlEvents:64];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_closeButtonTapped:(id)a3
{
  unint64_t v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will close the current context.", v8, 2u);
  }

  uint64_t v5 = [(CarCardView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CarCardView *)self delegate];
    [v7 carCardViewCloseButtonTapped:self];
  }
}

- (void)_chevronButtonTapped:(id)a3
{
  id v7 = a3;
  [v7 setSelected:[v7 isSelected] ^ 1];
  unint64_t v4 = [(CarCardView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CarCardView *)self delegate];
    [v6 carCardView:self chevronButtonSelected:v7];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarCardView;
  id v4 = a3;
  [(CarCardView *)&v8 traitCollectionDidChange:v4];
  char v5 = [(CarCardView *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(CarCardView *)self _updateInterfaceStyleRelatedViews];
  }
}

- (void)_updateInterfaceStyleRelatedViews
{
  focusRingImage = self->_focusRingImage;
  self->_focusRingImage = 0;

  id v4 = [(CarCardView *)self focusRingImageView];
  [v4 removeFromSuperview];

  [(CarCardView *)self setFocusRingImageView:0];
  [(CarCardView *)self _updateFocusRing];
  [(CarCardView *)self _mapsCar_updateShadow];

  [(CarCardView *)self _refreshBackgroundView];
}

- (void)setStyleProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleProvider);

  char v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_styleProvider, obj);
    [(CarCardView *)self _applyCornerMask];
    [(CarCardView *)self _refreshBackgroundView];
    [(CarCardView *)self _updateTransitioning];
    char v5 = obj;
  }
}

- (id)_styleProviderOrSelf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleProvider);
  id v4 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = self;
  }
  id v5 = WeakRetained;

  return v5;
}

- (void)_refreshBackgroundView
{
  id v3 = [(CarCardView *)self window];

  if (v3)
  {
    id v4 = [(CarCardView *)self _styleProviderOrSelf];
    [(CarCardView *)self layout];
    id v5 = [(CarCardView *)self traitCollection];
    [v5 displayScale];
    double v7 = v6;
    objc_super v8 = [(CarCardView *)self traitCollection];
    id v9 = [v8 userInterfaceStyle];
    if (v4)
    {
      double v10 = [v4 backgroundViewForCarCardLayout:v11 scale:v9 userInterfaceStyle:v7];
    }
    else
    {

      double v10 = 0;
    }
    [(CarCardView *)self setBackgroundView:v10];
  }
}

- (void)setBackgroundView:(id)a3
{
  id v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    id v12 = v5;
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(UIView *)*p_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v8 = [(CarCardView *)self maskingView];
    [v8 insertSubview:*p_backgroundView atIndex:0];

    id v9 = *p_backgroundView;
    double v10 = [(CarCardView *)self maskingView];
    double v11 = [(UIView *)v9 _maps_constraintsForCenteringInView:v10];
    +[NSLayoutConstraint activateConstraints:v11];

    id v5 = v12;
  }
}

- (void)_applyCornerMask
{
  id v3 = [(CarCardView *)self window];

  if (v3)
  {
    id v4 = [(CarCardView *)self styleProvider];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      double v6 = [(CarCardView *)self _styleProviderOrSelf];
      [(CarCardView *)self layout];
      if (v6)
      {
        [v6 cornerMaskForCarCardLayout:v23];
        uint64_t v7 = v26;
        double v8 = v27;
        id v9 = v28;
      }
      else
      {

        id v9 = 0;
        uint64_t v7 = 0;
        double v8 = 0.0;
      }
    }
    else
    {
      [(CarCardView *)self layout];
      if (self)
      {
        [(CarCardView *)self cornerMaskForCarCardLayout:v20];
        uint64_t v7 = v26;
        double v8 = v27;
        id v9 = v28;
      }
      else
      {

        id v9 = 0;
        uint64_t v7 = 0;
        double v8 = 0.0;
      }
    }
    double v10 = [(CarCardView *)self maskingView];
    double v11 = [v10 layer];
    [v11 setCornerRadius:v8];

    id v12 = [(CarCardView *)self maskingView];
    id v13 = [v12 layer];
    [v13 setCornerCurve:v9];

    id v14 = [(CarCardView *)self maskingView];
    id v15 = [v14 layer];
    [v15 setMaskedCorners:v7];

    id v16 = [(CarCardView *)self maskingView];
    double v17 = [v16 layer];
    [v17 setMasksToBounds:1];

    NSAttributedStringKey v18 = [(CarCardView *)self maskingView];
    double v19 = [v18 layer];
    [v19 setShadowPathIsBounds:1];
  }
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  double v6 = self->_dynamicBlurView;

  return v6;
}

- ($3A137947DC24AF6DB667847AA8BD3130)cornerMaskForCarCardLayout:(SEL)a3
{
  retstr->var0 = 0;
  retstr->var1 = 0.0;
  retstr->var2 = 0;
  retstr->var0 = [(CarCardView *)self roundedCorners] & 0xF;
  retstr->var1 = 9.0;
  retstr->var2 = kCACornerCurveContinuous;

  id var9 = a4->var9;

  return result;
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    [(CarCardView *)self _updateTransitioning];
  }
}

- (void)_updateTransitioning
{
  id v3 = [(CarCardView *)self styleProvider];

  if (v3)
  {
    id v4 = [(CarCardView *)self containerView];
    [v4 setAlpha:1.0];

    char v5 = [(CarCardView *)self styleProvider];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v9 = [(CarCardView *)self styleProvider];
    [v9 setTransitioning:[self isTransitioning]];
  }
  else
  {
    BOOL transitioning = self->_transitioning;
    id v9 = [(CarCardView *)self containerView];
    if (transitioning) {
      double v8 = 0.0;
    }
    else {
      double v8 = 1.0;
    }
    [v9 setAlpha:v8];
  }
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (CarCardContent)content
{
  return self->_content;
}

- ($B1874A4E4729613F071A632570863A63)layout
{
  p_layout = &self->_layout;
  long long v5 = *(_OWORD *)&self->_layout.primaryAxis;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_layout.edgePosition;
  *(_OWORD *)&retstr->var2 = v5;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_layout.primaryAxisFillMode;
  *(_OWORD *)(&retstr->var5 + 1) = *(_OWORD *)(&self->_layout.primaryAxisFillModePriority + 1);
  retstr->id var8 = self->_layout.primaryAxisFillLimit;
  result = p_layout->secondaryAxisFillLimit;
  retstr->id var9 = result;
  long long v7 = *(_OWORD *)&p_layout->margins.bottom;
  *(_OWORD *)&retstr->var10.top = *(_OWORD *)&p_layout->margins.top;
  *(_OWORD *)&retstr->var10.bottom = v7;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&p_layout->flipForRightHandDrive;
  retstr->BOOL var13 = p_layout->horizontallyCenterMapInsets;
  return result;
}

- (BOOL)staysOnTop
{
  return self->_staysOnTop;
}

- (void)setStaysOnTop:(BOOL)a3
{
  self->_staysOnTop = a3;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)titleNumberOfLines
{
  return self->_titleNumberOfLines;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (CarCardStyleProviding)styleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleProvider);

  return (CarCardStyleProviding *)WeakRetained;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (CarCardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarCardViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)collisionLayoutGuides
{
  return self->_collisionLayoutGuides;
}

- (void)setCollisionLayoutGuides:(id)a3
{
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (void)setContentLayoutGuide:(id)a3
{
}

- (UIView)accessoryContainerView
{
  return self->_accessoryContainerView;
}

- (void)setAccessoryContainerView:(id)a3
{
}

- (UIView)maskingView
{
  return self->_maskingView;
}

- (void)setMaskingView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIImageView)focusRingImageView
{
  return self->_focusRingImageView;
}

- (void)setFocusRingImageView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UIView)accessoryButtonView
{
  return self->_accessoryButtonView;
}

- (void)setAccessoryButtonView:(id)a3
{
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  self->_roundedCorners = a3;
}

- (void).cxx_destruct
{
  p_layout = &self->_layout;

  objc_storeStrong((id *)&self->_accessoryButtonView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_focusRingImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_maskingView, 0);
  objc_storeStrong((id *)&self->_accessoryContainerView, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_collisionLayoutGuides, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_styleProvider);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_dynamicBlurView, 0);
  objc_storeStrong((id *)&self->_accessoryFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_constraintAccessoryBarPosition, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonRecognizer, 0);

  objc_storeStrong((id *)&self->_focusRingImage, 0);
}

@end