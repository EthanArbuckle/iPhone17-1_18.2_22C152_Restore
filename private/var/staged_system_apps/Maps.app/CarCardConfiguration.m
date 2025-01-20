@interface CarCardConfiguration
- ($B1874A4E4729613F071A632570863A63)layout;
- (BOOL)isHidden;
- (BOOL)isTransitioning;
- (BOOL)isValid;
- (BOOL)staysOnTop;
- (CGRect)collisionLayoutGuideFrameForEdge:(unint64_t)a3;
- (CarCardConfiguration)initWithKey:(id)a3 carSceneType:(int64_t)a4;
- (CarCardContainerView)containerView;
- (CarCardContent)content;
- (CarCardContent)previousContent;
- (CarCardView)cardView;
- (NSArray)collisionConstraints;
- (NSArray)hidingConstraints;
- (NSArray)mapInsetsConstraints;
- (NSArray)showingConstraints;
- (NSArray)viewportConstraints;
- (NSDictionary)collisionLayoutGuides;
- (NSString)description;
- (NSString)key;
- (NSString)title;
- (UIEdgeInsets)effectiveMargins;
- (UILayoutGuide)contentLayoutGuide;
- (UIView)accessoryView;
- (id)_cardToContainerLayoutConstraints;
- (id)_collisionConstraintsForHost:(id)a3;
- (id)_collisionLayoutGuidesForHost:(id)a3;
- (id)_hidingLayoutConstraintsForHost:(id)a3 withLayoutGuide:(id)a4;
- (id)_mapInsetsConstraintsForHost:(id)a3;
- (id)_sharedLayoutConstraintsForHost:(id)a3 withLayoutGuide:(id)a4;
- (id)_showingLayoutConstraintsForHost:(id)a3 withLayoutGuide:(id)a4;
- (id)_viewportConstraintsForHost:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)selectionHandler;
- (int64_t)titleNumberOfLines;
- (unint64_t)accessory;
- (unint64_t)effectiveCornerPosition;
- (unint64_t)effectiveEdgePosition;
- (unint64_t)effectiveEdgesAffectingMapInsets;
- (unint64_t)focusSortValue;
- (unint64_t)invalidationState;
- (void)_applyToCardView;
- (void)_prepareConstraintsForHost:(id)a3 withLayoutGuide:(id)a4;
- (void)_resetConstraints;
- (void)_setShowContainerVisualisation:(BOOL)a3;
- (void)_startIgnoringContainerBoundsChanges;
- (void)_stopIgnoringContainerBoundsChanges;
- (void)_updateAvailableCardSize;
- (void)_updateCardContainerPriorities;
- (void)clear;
- (void)dealloc;
- (void)layoutInHost:(id)a3 withLayoutGuide:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reset;
- (void)setAccessory:(unint64_t)a3;
- (void)setAccessoryView:(id)a3;
- (void)setContent:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLayout:(id *)a3;
- (void)setPreviousContent:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setStaysOnTop:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleNumberOfLines:(int64_t)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)updateVisibility;
@end

@implementation CarCardConfiguration

- (CarCardConfiguration)initWithKey:(id)a3 carSceneType:(int64_t)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CarCardConfiguration;
  v7 = [(CarCardConfiguration *)&v24 init];
  v8 = v7;
  if (v7)
  {
    v7->_carSceneType = a4;
    if (!v6)
    {
      v9 = +[NSUUID UUID];
      id v6 = [v9 UUIDString];
    }
    v10 = (NSString *)[v6 copy];
    kedouble y = v8->_key;
    v8->_kedouble y = v10;

    title = v8->_title;
    v8->_title = 0;

    v8->_titleNumberOfLines = 3;
    v8->_hidden = 1;
    v13 = [CarCardView alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v17 = -[CarCardView initWithFrame:](v13, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    cardView = v8->_cardView;
    v8->_cardView = v17;

    [(CarCardView *)v8->_cardView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = -[CarCardContainerView initWithFrame:]([CarCardContainerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    containerView = v8->_containerView;
    v8->_containerView = v19;

    [(CarCardContainerView *)v8->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarCardContainerView *)v8->_containerView setUserInteractionEnabled:0];
    [(CarCardContainerView *)v8->_containerView setClipsToBounds:0];
    LODWORD(v21) = 1148846080;
    [(CarCardContainerView *)v8->_containerView setContentHuggingPriority:1 forAxis:v21];
    LODWORD(v22) = 1148846080;
    [(CarCardContainerView *)v8->_containerView setContentHuggingPriority:0 forAxis:v22];
    [(CarCardContainerView *)v8->_containerView setContentCompressionResistancePriority:1 forAxis:0.0];
    [(CarCardContainerView *)v8->_containerView setContentCompressionResistancePriority:0 forAxis:0.0];
    [(CarCardContainerView *)v8->_containerView addObserver:v8 forKeyPath:@"bounds" options:1 context:off_1015F4728];
  }

  return v8;
}

- (NSString)description
{
  v17.receiver = self;
  v17.super_class = (Class)CarCardConfiguration;
  v3 = [(CarCardConfiguration *)&v17 description];
  v4 = [(CarCardConfiguration *)self key];
  v5 = [(CarCardConfiguration *)self content];
  id v6 = (id)objc_opt_class();
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_7;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_7:

    goto LABEL_9;
  }
  v11 = @"<nil>";
LABEL_9:

  if ([(CarCardConfiguration *)self isHidden]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v13 = v12;
  if ([(CarCardConfiguration *)self isValid]) {
    CFStringRef v14 = @"YES";
  }
  else {
    CFStringRef v14 = @"NO";
  }
  v15 = +[NSString stringWithFormat:@"%@ (key:%@, content:%@, hidden:%@, valid:%@)", v3, v4, v11, v13, v14];

  return (NSString *)v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 22, self->_content);
  sub_10077FA04((uint64_t)(v4 + 39), (long long *)&self->_layout);
  objc_storeStrong(v4 + 23, self->_title);
  v4[24] = self->_titleNumberOfLines;
  v4[25] = self->_accessory;
  objc_storeStrong(v4 + 26, self->_accessoryView);
  id v5 = objc_retainBlock(self->_selectionHandler);
  id v6 = v4[27];
  v4[27] = v5;

  *((unsigned char *)v4 + 168) = self->_ignoreContainerBoundsChanges;
  *((unsigned char *)v4 + 170) = self->_hidden;
  objc_storeStrong(v4 + 32, self->_hidingConstraints);
  objc_storeStrong(v4 + 31, self->_showingConstraints);
  objc_storeStrong(v4 + 33, self->_viewportConstraints);
  objc_storeStrong(v4 + 34, self->_mapInsetsConstraints);
  objc_storeStrong(v4 + 35, self->_collisionConstraints);
  objc_storeStrong(v4 + 36, self->_collisionLayoutGuides);
  objc_storeStrong(v4 + 37, self->_contentLayoutGuide);
  return v4;
}

- (void)dealloc
{
  [(CarCardContainerView *)self->_containerView removeObserver:self forKeyPath:@"bounds" context:off_1015F4728];
  [(CarCardContainerView *)self->_containerView removeFromSuperview];
  containerView = self->_containerView;
  self->_containerView = 0;

  [(CarCardView *)self->_cardView removeFromSuperview];
  cardView = self->_cardView;
  self->_cardView = 0;

  v5.receiver = self;
  v5.super_class = (Class)CarCardConfiguration;
  [(CarCardConfiguration *)&v5 dealloc];
}

- (void)clear
{
  HIDWORD(v18) = 0;
  *(_DWORD *)((char *)&v18 + 1) = 0;
  long long v8 = xmmword_100F6F1C0;
  long long v9 = xmmword_100F67600;
  uint64_t v10 = 3;
  uint64_t v11 = 1148846080;
  uint64_t v12 = 2;
  LODWORD(v13) = 1148846080;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  long long v16 = _Q0;
  long long v17 = _Q0;
  LOBYTE(v18) = 1;
  uint64_t v19 = 8;
  LOBYTE(v20) = 0;
  if (self) {
    [(CarCardConfiguration *)self setLayout:&v8];
  }
  -[CarCardConfiguration setPreviousContent:](self, "setPreviousContent:", self->_content, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  [(CarCardConfiguration *)self setContent:0];
  [(CarCardConfiguration *)self setTitle:0];
  [(CarCardConfiguration *)self setTitleNumberOfLines:3];
  [(CarCardConfiguration *)self setAccessory:0];
  [(CarCardConfiguration *)self setAccessoryView:0];
  [(CarCardConfiguration *)self setSelectionHandler:0];
}

- (void)reset
{
  if (self->_cardView)
  {
    *(_WORD *)&self->_hidden = 1;
    [(CarCardConfiguration *)self clear];
    [(CarCardContainerView *)self->_containerView removeFromSuperview];
    containerView = self->_containerView;
    self->_containerView = 0;

    [(CarCardView *)self->_cardView removeFromSuperview];
    cardView = self->_cardView;
    self->_cardView = 0;

    [(CarCardConfiguration *)self _resetConstraints];
  }
}

- (BOOL)isValid
{
  return self->_cardView != 0;
}

- (unint64_t)focusSortValue
{
  v19[0] = &off_1013AA720;
  v19[1] = &off_1013AA750;
  v20[0] = &off_1013AA738;
  v20[1] = &off_1013AA768;
  v19[2] = &off_1013AA780;
  v19[3] = &off_1013AA7B0;
  v20[2] = &off_1013AA798;
  v20[3] = &off_1013AA7C8;
  v3 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v17[0] = &off_1013AA720;
  v17[1] = &off_1013AA780;
  v18[0] = &off_1013AA7E0;
  v18[1] = &off_1013AA7F8;
  v17[2] = &off_1013AA7B0;
  v17[3] = &off_1013AA750;
  v18[2] = &off_1013AA810;
  v18[3] = &off_1013AA828;
  v4 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  if ([(CarCardConfiguration *)self effectiveCornerPosition] == -1)
  {
    [(CarCardConfiguration *)self layout];
    objc_super v5 = (id *)v14;
    id v6 = (id *)&v13;
    v7 = +[NSNumber numberWithUnsignedInteger:v12];
    long long v8 = [v4 objectForKeyedSubscript:v7];
    id v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    [(CarCardConfiguration *)self layout];
    objc_super v5 = (id *)&v16;
    id v6 = (id *)&v15;
    v7 = +[NSNumber numberWithUnsignedInteger:v14[9]];
    long long v8 = [v3 objectForKeyedSubscript:v7];
    id v9 = [v8 unsignedIntegerValue];
  }
  unint64_t v10 = (unint64_t)v9;

  return v10;
}

- (void)layoutInHost:(id)a3 withLayoutGuide:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(CarCardConfiguration *)self isValid])
  {
    uint64_t v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315906;
      uint64_t v18 = "-[CarCardConfiguration layoutInHost:withLayoutGuide:]";
      __int16 v19 = 2080;
      uint64_t v20 = "CarCardsOverlay.m";
      __int16 v21 = 1024;
      int v22 = 323;
      __int16 v23 = 2080;
      objc_super v24 = "self.isValid";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = +[NSThread callStackSymbols];
        int v17 = 138412290;
        uint64_t v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  if ((self->_invalidationState & 2) != 0)
  {
    uint64_t v8 = [(CarCardConfiguration *)self previousContent];
    if (v8)
    {
      id v9 = (void *)v8;
      unint64_t v10 = [(CarCardConfiguration *)self previousContent];
      uint64_t v11 = [v10 parentViewController];
      uint64_t v12 = [v6 containingViewController];

      if (v11 == v12)
      {
        uint64_t v13 = [(CarCardConfiguration *)self previousContent];
        [v13 removeFromParentViewController];
      }
    }
  }
  [(CarCardConfiguration *)self _prepareConstraintsForHost:v6 withLayoutGuide:v7];
  [(CarCardConfiguration *)self _applyToCardView];
  self->_invalidationState = 0;
  [(CarCardConfiguration *)self updateVisibility];
}

- (void)_applyToCardView
{
  v3 = sub_100577A0C();
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  v4 = self;
  if (!v4)
  {
    id v9 = @"<nil>";
    goto LABEL_10;
  }
  objc_super v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(CarCardConfiguration *)v4 performSelector:"accessibilityIdentifier"];
    uint64_t v8 = v7;
    if (v7 && ![v7 isEqualToString:v6])
    {
      id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

      goto LABEL_8;
    }
  }
  id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v51 = v9;
  __int16 v52 = 2112;
  v53 = v4;
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Will apply to card view (%@)", buf, 0x16u);

LABEL_11:
  unint64_t v10 = [(CarCardConfiguration *)self collisionLayoutGuides];
  uint64_t v11 = [(CarCardConfiguration *)self cardView];
  [v11 setCollisionLayoutGuides:v10];

  uint64_t v12 = [(CarCardConfiguration *)self contentLayoutGuide];
  uint64_t v13 = [(CarCardConfiguration *)self cardView];
  [v13 setContentLayoutGuide:v12];

  BOOL v14 = [(CarCardConfiguration *)self isTransitioning];
  uint64_t v15 = [(CarCardConfiguration *)self cardView];
  [v15 setTransitioning:v14];

  [(CarCardConfiguration *)self layout];
  uint64_t v16 = [(CarCardConfiguration *)self cardView];
  v33[0] = v41;
  v33[1] = v42;
  v34[0] = v43[0];
  *(_OWORD *)((char *)v34 + 12) = *(_OWORD *)((char *)v43 + 12);
  id v17 = v44;
  id v35 = v17;
  id v18 = v45;
  id v36 = v18;
  long long v37 = v46;
  long long v38 = v47;
  long long v39 = v48;
  char v40 = v49;
  if (v16)
  {
    [v16 setLayout:v33];
  }
  else
  {
    __int16 v19 = v18;
  }
  uint64_t v20 = [(CarCardConfiguration *)self title];
  __int16 v21 = [(CarCardConfiguration *)self cardView];
  [v21 setTitle:v20];

  int64_t v22 = [(CarCardConfiguration *)self titleNumberOfLines];
  __int16 v23 = [(CarCardConfiguration *)self cardView];
  [v23 setTitleNumberOfLines:v22];

  unint64_t v24 = [(CarCardConfiguration *)self accessory];
  v25 = [(CarCardConfiguration *)self cardView];
  [v25 setAccessory:v24];

  v26 = [(CarCardConfiguration *)self accessoryView];
  v27 = [(CarCardConfiguration *)self cardView];
  [v27 setAccessoryView:v26];

  v28 = [(CarCardConfiguration *)self selectionHandler];
  v29 = [(CarCardConfiguration *)self cardView];
  [v29 setSelectionHandler:v28];

  v30 = [(CarCardConfiguration *)self content];
  v31 = [(CarCardConfiguration *)self cardView];
  [v31 setContent:v30];

  v32 = [(CarCardConfiguration *)self cardView];
  [v32 setNeedsLayout];

  [(CarCardConfiguration *)self _updateAvailableCardSize];
}

- (void)_resetConstraints
{
  if (self->_showingConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  if (self->_hidingConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  if (self->_viewportConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  if (self->_mapInsetsConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  if (self->_collisionConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  hidingConstraints = self->_hidingConstraints;
  self->_hidingConstraints = 0;

  showingConstraints = self->_showingConstraints;
  self->_showingConstraints = 0;

  viewportConstraints = self->_viewportConstraints;
  self->_viewportConstraints = 0;

  mapInsetsConstraints = self->_mapInsetsConstraints;
  self->_mapInsetsConstraints = 0;

  collisionConstraints = self->_collisionConstraints;
  self->_collisionConstraints = 0;

  collisionLayoutGuides = self->_collisionLayoutGuides;
  self->_collisionLayoutGuides = 0;

  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = 0;
}

- (void)_prepareConstraintsForHost:(id)a3 withLayoutGuide:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 overlayContentView];
  long long v46 = [v6 viewportLayoutGuide];
  id v45 = [v6 mapInsetsLayoutGuide];
  if (v7 && v8 && v46 && v45)
  {
    id v9 = [(CarCardContainerView *)self->_containerView superview];

    if (v9 != v8)
    {
      [(CarCardContainerView *)self->_containerView removeFromSuperview];
      [v8 addSubview:self->_containerView];
      [(CarCardView *)self->_cardView removeFromSuperview];
      [v8 addSubview:self->_cardView];
      [(CarCardConfiguration *)self _resetConstraints];
    }
    uint64_t v55 = 0;
    float64x2_t v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    float64x2_t v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    int64x2_t v47 = 0u;
    int64x2_t v48 = 0u;
    [(CarCardConfiguration *)self layout];
    BOOL v44 = [(CarCardConfiguration *)self staysOnTop];
    if (self->_showingConstraints
      && self->_hidingConstraints
      && self->_viewportConstraints
      && self->_mapInsetsConstraints
      && self->_collisionConstraints)
    {
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v47, *(int64x2_t *)&self->_lastLayout.edgePosition), (int32x4_t)vceqq_s64(v48, *(int64x2_t *)&self->_lastLayout.primaryAxis))), 0xFuLL))) & 1) != 0&& (void)v49 == self->_lastLayout.primaryAxisFillMode&& (void)v50 == self->_lastLayout.secondaryAxisFillMode&& *((void *)&v54 + 1) == self->_lastLayout.edgesAffectingMapInsets&& v54 == self->_lastLayout.flipForRightHandDrive&& *((float *)&v49 + 2) == self->_lastLayout.primaryAxisFillModePriority&& *((float *)&v50 + 2) == self->_lastLayout.secondaryAxisFillModePriority)
      {
        float64x2_t v42 = *(float64x2_t *)&self->_lastLayout.margins.bottom;
        float64x2_t v43 = *(float64x2_t *)&self->_lastLayout.margins.top;
        id v10 = *((id *)&v51 + 1);

        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v52, v43), (int32x4_t)vceqq_f64(v53, v42))), 0xFuLL))) & 1) != 0&& self->_lastStaysOnTop == v44)
        {
          goto LABEL_39;
        }
      }
      else
      {
        id v11 = *((id *)&v51 + 1);
      }
    }
    uint64_t v12 = sub_100577A0C();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_38:

      [v8 removeConstraints:self->_hidingConstraints];
      [v8 removeConstraints:self->_showingConstraints];
      [(CarCardConfiguration *)self _resetConstraints];
      v28 = [(CarCardConfiguration *)self _hidingLayoutConstraintsForHost:v6 withLayoutGuide:v7];
      hidingConstraints = self->_hidingConstraints;
      self->_hidingConstraints = v28;

      v30 = [(CarCardConfiguration *)self _showingLayoutConstraintsForHost:v6 withLayoutGuide:v7];
      showingConstraints = self->_showingConstraints;
      self->_showingConstraints = v30;

      v32 = [(CarCardConfiguration *)self _viewportConstraintsForHost:v6];
      viewportConstraints = self->_viewportConstraints;
      self->_viewportConstraints = v32;

      v34 = [(CarCardConfiguration *)self _mapInsetsConstraintsForHost:v6];
      mapInsetsConstraints = self->_mapInsetsConstraints;
      self->_mapInsetsConstraints = v34;

      id v36 = [(CarCardConfiguration *)self _collisionConstraintsForHost:v6];
      collisionConstraints = self->_collisionConstraints;
      self->_collisionConstraints = v36;

      long long v38 = [(CarCardConfiguration *)self _collisionLayoutGuidesForHost:v6];
      collisionLayoutGuides = self->_collisionLayoutGuides;
      self->_collisionLayoutGuides = v38;

      char v40 = [v6 contentLayoutGuide];
      contentLayoutGuide = self->_contentLayoutGuide;
      self->_contentLayoutGuide = v40;

      [(CarCardConfiguration *)self _updateCardContainerPriorities];
      sub_10077FA04((uint64_t)&self->_lastLayout, (long long *)v47.i8);
      self->_lastStaysOnTop = v44;
LABEL_39:

      goto LABEL_40;
    }
    uint64_t v13 = self;
    BOOL v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    char v16 = objc_opt_respondsToSelector();
    id v17 = NSCollectionLayoutEdgeSpacing_ptr;
    if (v16)
    {
      id v18 = [(CarCardConfiguration *)v13 performSelector:"accessibilityIdentifier"];
      __int16 v19 = v18;
      if (v18 && ([v18 isEqualToString:v15] & 1) == 0)
      {
        uint64_t v20 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v19];

LABEL_29:
        id v21 = v20;
        id v22 = v6;
        if (!v22)
        {
          v27 = @"<nil>";
          goto LABEL_37;
        }
        __int16 v23 = (objc_class *)objc_opt_class();
        unint64_t v24 = NSStringFromClass(v23);
        if (objc_opt_respondsToSelector())
        {
          v25 = [v22 performSelector:"accessibilityIdentifier"];
          v26 = v25;
          if (v25 && ([v25 isEqualToString:v24] & 1) == 0)
          {
            v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

            goto LABEL_35;
          }
        }
        v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_35:

LABEL_37:
        *(_DWORD *)buf = 138543618;
        id v57 = v21;
        __int16 v58 = 2112;
        v59 = v27;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] Will prepare card constraints (%@)", buf, 0x16u);

        goto LABEL_38;
      }

      id v17 = NSCollectionLayoutEdgeSpacing_ptr;
    }
    uint64_t v20 = [v17[75] stringWithFormat:@"%@<%p>", v15, v13];
    goto LABEL_29;
  }
LABEL_40:
}

- (id)_cardToContainerLayoutConstraints
{
  v3 = +[NSMutableArray array];
  if ((self->_layout.primaryAxisFillMode > 1 || self->_layout.primaryAxis != 1)
    && (self->_layout.secondaryAxisFillMode > 1 || self->_layout.primaryAxis))
  {
    goto LABEL_5;
  }
  unint64_t cornerPosition = self->_layout.cornerPosition;
  id v7 = self->_layout.primaryAxisFillLimit;
  uint64_t v8 = self->_layout.secondaryAxisFillLimit;
  if (self->_layout.flipForRightHandDrive)
  {
    id v9 = +[MapsExternalDevice sharedInstance];
    unsigned int v10 = [v9 rightHandDrive];

    if (v10)
    {
      switch(cornerPosition)
      {
        case 1uLL:
          unint64_t cornerPosition = 2;
          break;
        case 2uLL:
          unint64_t cornerPosition = 1;
          break;
        case 4uLL:
          unint64_t cornerPosition = 8;
          break;
        case 8uLL:
          unint64_t cornerPosition = 4;
          break;
      }
    }
  }

  unint64_t edgePosition = self->_layout.edgePosition;
  uint64_t v12 = self->_layout.primaryAxisFillLimit;
  uint64_t v13 = self->_layout.secondaryAxisFillLimit;
  if (self->_layout.flipForRightHandDrive)
  {
    BOOL v14 = +[MapsExternalDevice sharedInstance];
    unsigned int v15 = [v14 rightHandDrive];

    if (v15)
    {
      if (edgePosition == 2)
      {
        unint64_t edgePosition = 8;
      }
      else if (edgePosition == 8)
      {
        unint64_t edgePosition = 2;
      }
    }
  }

  if (cornerPosition - 1 < 2 || edgePosition == 1)
  {
    char v16 = [(CarCardView *)self->_cardView bottomAnchor];
    id v17 = [(CarCardContainerView *)self->_containerView bottomAnchor];
    uint64_t v18 = [v16 constraintLessThanOrEqualToAnchor:v17];
    v4 = 0;
    objc_super v5 = (void *)v18;
  }
  else
  {
    if (edgePosition != 4 && cornerPosition != 8 && cornerPosition != 4)
    {
LABEL_5:
      v4 = 0;
      objc_super v5 = 0;
      goto LABEL_30;
    }
    char v16 = [(CarCardView *)self->_cardView topAnchor];
    id v17 = [(CarCardContainerView *)self->_containerView topAnchor];
    uint64_t v18 = [v16 constraintGreaterThanOrEqualToAnchor:v17];
    objc_super v5 = 0;
    v4 = (void *)v18;
  }

  [v3 addObject:v18];
LABEL_30:
  if (self->_layout.primaryAxisFillMode <= 1 && !self->_layout.primaryAxis
    || self->_layout.secondaryAxisFillMode <= 1 && self->_layout.primaryAxis == 1)
  {
    unint64_t v19 = self->_layout.cornerPosition;
    uint64_t v20 = self->_layout.primaryAxisFillLimit;
    id v21 = self->_layout.secondaryAxisFillLimit;
    if (self->_layout.flipForRightHandDrive)
    {
      id v22 = +[MapsExternalDevice sharedInstance];
      unsigned int v23 = [v22 rightHandDrive];

      if (v23)
      {
        switch(v19)
        {
          case 1uLL:
            unint64_t v19 = 2;
            break;
          case 2uLL:
            unint64_t v19 = 1;
            break;
          case 4uLL:
            unint64_t v19 = 8;
            break;
          case 8uLL:
            unint64_t v19 = 4;
            break;
        }
      }
    }

    unint64_t v24 = self->_layout.edgePosition;
    v25 = self->_layout.secondaryAxisFillLimit;
    if (self->_layout.flipForRightHandDrive
      && (+[MapsExternalDevice sharedInstance],
          v26 = objc_claimAutoreleasedReturnValue(),
          unsigned int v27 = [v26 rightHandDrive],
          v26,
          v27))
    {
      if (v24 == 8)
      {
        unint64_t v24 = 2;
      }
      else if (v24 == 2)
      {

LABEL_55:
        v28 = [(CarCardView *)self->_cardView leftAnchor];
        v29 = [(CarCardContainerView *)self->_containerView leftAnchor];
        v30 = [v28 constraintGreaterThanOrEqualToAnchor:v29];
        v31 = 0;
        v32 = v30;
LABEL_56:

        [v3 addObject:v30];
        goto LABEL_62;
      }
    }
    else
    {

      if (v24 == 8) {
        goto LABEL_55;
      }
    }
    if (v19 == 8 || v19 == 2) {
      goto LABEL_55;
    }
    if (v24 == 2 || v19 == 4 || v19 == 1)
    {
      v28 = [(CarCardView *)self->_cardView rightAnchor];
      v29 = [(CarCardContainerView *)self->_containerView rightAnchor];
      v30 = [v28 constraintLessThanOrEqualToAnchor:v29];
      v32 = 0;
      v31 = v30;
      goto LABEL_56;
    }
  }
  v32 = 0;
  v31 = 0;
LABEL_62:
  v33 = [(CarCardView *)self->_cardView topAnchor];
  v34 = [(CarCardContainerView *)self->_containerView topAnchor];
  if (v4) {
    *(float *)&double v35 = 50.0;
  }
  else {
    *(float *)&double v35 = 1000.0;
  }
  id v36 = [v33 constraintEqualToAnchor:v34 constant:0.0 priority:v35];
  [v3 addObject:v36];

  long long v37 = [(CarCardView *)self->_cardView leftAnchor];
  long long v38 = [(CarCardContainerView *)self->_containerView leftAnchor];
  if (v32) {
    *(float *)&double v39 = 50.0;
  }
  else {
    *(float *)&double v39 = 1000.0;
  }
  char v40 = [v37 constraintEqualToAnchor:v38 constant:0.0 priority:v39];
  [v3 addObject:v40];

  long long v41 = [(CarCardView *)self->_cardView bottomAnchor];
  float64x2_t v42 = [(CarCardContainerView *)self->_containerView bottomAnchor];
  if (v5) {
    *(float *)&double v43 = 50.0;
  }
  else {
    *(float *)&double v43 = 1000.0;
  }
  BOOL v44 = [v41 constraintEqualToAnchor:v42 constant:0.0 priority:v43];
  [v3 addObject:v44];

  id v45 = [(CarCardView *)self->_cardView rightAnchor];
  long long v46 = [(CarCardContainerView *)self->_containerView rightAnchor];
  if (v31) {
    *(float *)&double v47 = 50.0;
  }
  else {
    *(float *)&double v47 = 1000.0;
  }
  int64x2_t v48 = [v45 constraintEqualToAnchor:v46 constant:0.0 priority:v47];
  [v3 addObject:v48];

  id v49 = [v3 copy];

  return v49;
}

- (void)_updateCardContainerPriorities
{
  if (self->_layout.primaryAxisFillMode > 1)
  {
    float v4 = 250.0;
    LODWORD(v2) = 1148846080;
  }
  else
  {
    float v4 = (float)((float)(self->_layout.primaryAxisFillModePriority / 1000.0) * 998.0) + 1.0;
    *(float *)&double v2 = 1000.0 - v4;
  }
  if (self->_layout.secondaryAxisFillMode > 1)
  {
    float v6 = 1000.0;
    float v5 = 250.0;
  }
  else
  {
    float v5 = (float)((float)(self->_layout.secondaryAxisFillModePriority / 1000.0) * 998.0) + 1.0;
    float v6 = 1000.0 - v5;
  }
  BOOL v7 = self->_layout.primaryAxis != 1;
  -[CarCardContainerView setContentHuggingPriority:forAxis:](self->_containerView, "setContentHuggingPriority:forAxis:", v2);
  *(float *)&double v8 = v6;
  [(CarCardContainerView *)self->_containerView setContentHuggingPriority:v7 forAxis:v8];
  *(float *)&double v9 = v4;
  [(CarCardView *)self->_cardView setContentCompressionResistancePriority:self->_layout.primaryAxis forAxis:v9];
  cardView = self->_cardView;
  *(float *)&double v11 = v5;

  [(CarCardView *)cardView setContentCompressionResistancePriority:v7 forAxis:v11];
}

- (id)_sharedLayoutConstraintsForHost:(id)a3 withLayoutGuide:(id)a4
{
  id v42 = a3;
  id v47 = a4;
  int64x2_t v48 = +[NSMutableArray array];
  [(CarCardConfiguration *)self layout];
  [(CarCardConfiguration *)self effectiveMargins];
  double v44 = v6;
  double v45 = v7;
  double v9 = v8;
  double v11 = v10;
  switch([(CarCardConfiguration *)self effectiveEdgePosition])
  {
    case 1uLL:
      long long v46 = [(CarCardContainerView *)self->_containerView rightAnchor];
      uint64_t v12 = [v47 rightAnchor];
      uint64_t v13 = [v46 constraintLessThanOrEqualToAnchor:v12 constant:-v45];
      v52[0] = v13;
      BOOL v14 = [(CarCardContainerView *)self->_containerView leftAnchor];
      unsigned int v15 = [v47 leftAnchor];
      char v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15 constant:v44];
      v52[1] = v16;
      id v17 = [(CarCardContainerView *)self->_containerView centerXAnchor];
      uint64_t v18 = [v47 centerXAnchor];
      LODWORD(v19) = 1148829696;
      uint64_t v20 = [v17 constraintEqualToAnchor:v18 constant:0.0 priority:v19];
      v52[2] = v20;
      id v21 = +[NSArray arrayWithObjects:v52 count:3];
      [v48 addObjectsFromArray:v21];
      goto LABEL_6;
    case 2uLL:
      long long v46 = [(CarCardContainerView *)self->_containerView bottomAnchor];
      uint64_t v12 = [v47 bottomAnchor];
      uint64_t v13 = [v46 constraintLessThanOrEqualToAnchor:v12 constant:-v11];
      v51[0] = v13;
      BOOL v14 = [(CarCardContainerView *)self->_containerView topAnchor];
      unsigned int v15 = [v47 topAnchor];
      char v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15 constant:v9];
      v51[1] = v16;
      id v17 = [(CarCardContainerView *)self->_containerView centerYAnchor];
      uint64_t v18 = [v47 centerYAnchor];
      LODWORD(v22) = 1148829696;
      uint64_t v20 = [v17 constraintEqualToAnchor:v18 constant:0.0 priority:v22];
      v51[2] = v20;
      id v21 = +[NSArray arrayWithObjects:v51 count:3];
      [v48 addObjectsFromArray:v21];
      goto LABEL_6;
    case 4uLL:
      long long v46 = [(CarCardContainerView *)self->_containerView rightAnchor];
      uint64_t v12 = [v47 rightAnchor];
      uint64_t v13 = [v46 constraintLessThanOrEqualToAnchor:v12 constant:-v45];
      v50[0] = v13;
      BOOL v14 = [(CarCardContainerView *)self->_containerView leftAnchor];
      unsigned int v15 = [v47 leftAnchor];
      char v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15 constant:v44];
      v50[1] = v16;
      id v17 = [(CarCardContainerView *)self->_containerView centerXAnchor];
      uint64_t v18 = [v47 centerXAnchor];
      LODWORD(v23) = 1148829696;
      uint64_t v20 = [v17 constraintEqualToAnchor:v18 constant:0.0 priority:v23];
      v50[2] = v20;
      id v21 = +[NSArray arrayWithObjects:v50 count:3];
      [v48 addObjectsFromArray:v21];
      goto LABEL_6;
    case 8uLL:
      long long v46 = [(CarCardContainerView *)self->_containerView bottomAnchor];
      uint64_t v12 = [v47 bottomAnchor];
      uint64_t v13 = [v46 constraintLessThanOrEqualToAnchor:v12 constant:-v11];
      v49[0] = v13;
      BOOL v14 = [(CarCardContainerView *)self->_containerView topAnchor];
      unsigned int v15 = [v47 topAnchor];
      char v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15 constant:v9];
      v49[1] = v16;
      id v17 = [(CarCardContainerView *)self->_containerView centerYAnchor];
      uint64_t v18 = [v47 centerYAnchor];
      LODWORD(v24) = 1148829696;
      uint64_t v20 = [v17 constraintEqualToAnchor:v18 constant:0.0 priority:v24];
      v49[2] = v20;
      id v21 = +[NSArray arrayWithObjects:v49 count:3];
      [v48 addObjectsFromArray:v21];
LABEL_6:

      break;
    default:
      break;
  }
  v26 = [(CarCardContainerView *)self->_containerView widthAnchor];
  unsigned int v27 = [v47 widthAnchor];
  v25 = [v26 constraintLessThanOrEqualToAnchor:v27 constant:-(v44 + v45)];
  [v48 addObject:v25];

  secondaryAxisFillModePrioritdouble y = self->_layout.secondaryAxisFillModePriority;
  *(float *)&unsigned int v29 = (float)((float)(self->_layout.primaryAxisFillModePriority / 1000.0) * 502.0) + 249.0;
  v31 = [(CarCardContainerView *)self->_containerView widthAnchor];
  v32 = [v47 widthAnchor];
  v30 = [v31 constraintEqualToAnchor:v32 constant:-(v44 + v45) priority:COERCE_DOUBLE(__PAIR64__(HIDWORD(v45), v29))];
  [v48 addObject:v30];

  *(float *)&double v33 = secondaryAxisFillModePriority / 1000.0;
  double v35 = [(CarCardContainerView *)self->_containerView heightAnchor];
  id v36 = [v47 heightAnchor];
  *(float *)&double v37 = (float)((float)(secondaryAxisFillModePriority / 1000.0) * 502.0) + 249.0;
  v34 = [v35 constraintEqualToAnchor:v36 constant:-(v9 + v11) priority:v37];
  [v48 addObject:v34];

  double v39 = [(CarCardConfiguration *)self _cardToContainerLayoutConstraints];
  [v48 addObjectsFromArray:v39];

  id v40 = [v48 copy];

  return v40;
}

- (id)_showingLayoutConstraintsForHost:(id)a3 withLayoutGuide:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[NSMutableArray array];
  [(CarCardConfiguration *)self effectiveMargins];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  unint64_t v17 = [(CarCardConfiguration *)self effectiveEdgePosition];
  unint64_t v18 = [(CarCardConfiguration *)self effectiveCornerPosition];
  switch(v17)
  {
    case 0uLL:
      switch(v18)
      {
        case 0uLL:
          double v19 = [(CarCardContainerView *)self->_containerView centerYAnchor];
          uint64_t v20 = [v7 centerYAnchor];
          id v21 = [v19 constraintEqualToAnchor:v20];
          [v8 addObject:v21];

          double v22 = [(CarCardContainerView *)self->_containerView centerXAnchor];
          double v23 = [v7 centerXAnchor];
          uint64_t v24 = [v22 constraintEqualToAnchor:v23];
          goto LABEL_16;
        case 1uLL:
          v28 = [(CarCardContainerView *)self->_containerView topAnchor];
          unsigned int v29 = [v7 topAnchor];
          v30 = v28;
          v31 = v29;
          double v32 = v10;
          goto LABEL_9;
        case 2uLL:
          double v33 = [(CarCardContainerView *)self->_containerView topAnchor];
          v34 = [v7 topAnchor];
          double v35 = v33;
          id v36 = v34;
          double v37 = v10;
          goto LABEL_12;
        case 4uLL:
          v28 = [(CarCardContainerView *)self->_containerView bottomAnchor];
          unsigned int v29 = [v7 bottomAnchor];
          double v32 = -v14;
          v30 = v28;
          v31 = v29;
LABEL_9:
          double v38 = [v30 constraintEqualToAnchor:v31 constant:v32];
          [v8 addObject:v38];

          goto LABEL_10;
        case 8uLL:
          double v33 = [(CarCardContainerView *)self->_containerView bottomAnchor];
          v34 = [v7 bottomAnchor];
          double v37 = -v14;
          double v35 = v33;
          id v36 = v34;
LABEL_12:
          double v39 = [v35 constraintEqualToAnchor:v36 constant:v37];
          [v8 addObject:v39];

          goto LABEL_13;
        default:
          goto LABEL_17;
      }
    case 1uLL:
      double v22 = [(CarCardContainerView *)self->_containerView topAnchor];
      double v23 = [v7 topAnchor];
      v25 = v22;
      v26 = v23;
      double v27 = v10;
      goto LABEL_15;
    case 2uLL:
LABEL_10:
      double v22 = [(CarCardContainerView *)self->_containerView leftAnchor];
      double v23 = [v7 leftAnchor];
      v25 = v22;
      v26 = v23;
      double v27 = v12;
      goto LABEL_15;
    case 4uLL:
      double v22 = [(CarCardContainerView *)self->_containerView bottomAnchor];
      double v23 = [v7 bottomAnchor];
      double v27 = -v14;
      goto LABEL_14;
    case 8uLL:
LABEL_13:
      double v22 = [(CarCardContainerView *)self->_containerView rightAnchor];
      double v23 = [v7 rightAnchor];
      double v27 = -v16;
LABEL_14:
      v25 = v22;
      v26 = v23;
LABEL_15:
      uint64_t v24 = [v25 constraintEqualToAnchor:v26 constant:v27];
LABEL_16:
      id v40 = (void *)v24;
      [v8 addObject:v24];

      break;
    default:
      break;
  }
LABEL_17:
  long long v41 = [(CarCardConfiguration *)self _sharedLayoutConstraintsForHost:v6 withLayoutGuide:v7];
  [v8 addObjectsFromArray:v41];

  id v42 = [v8 copy];

  return v42;
}

- (id)_hidingLayoutConstraintsForHost:(id)a3 withLayoutGuide:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[NSMutableArray array];
  [(CarCardConfiguration *)self layout];
  [(CarCardConfiguration *)self effectiveMargins];
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(CarCardConfiguration *)self effectiveEdgePosition];
  unint64_t v14 = [(CarCardConfiguration *)self effectiveCornerPosition];
  switch(v13)
  {
    case 0uLL:
      switch(v14)
      {
        case 1uLL:
          id v21 = [(CarCardContainerView *)self->_containerView topAnchor];
          double v22 = [v7 topAnchor];
          double v23 = [v21 constraintEqualToAnchor:v22 constant:v10];
          [v8 addObject:v23];

          double v15 = [(CarCardContainerView *)self->_containerView rightAnchor];
          double v16 = [v7 leftAnchor];
          [v15 constraintEqualToAnchor:v16];
          goto LABEL_11;
        case 2uLL:
          uint64_t v24 = [(CarCardContainerView *)self->_containerView topAnchor];
          v25 = [v7 topAnchor];
          v26 = [v24 constraintEqualToAnchor:v25 constant:v10];
          [v8 addObject:v26];

          double v15 = [(CarCardContainerView *)self->_containerView leftAnchor];
          double v16 = [v7 rightAnchor];
          [v15 constraintEqualToAnchor:v16];
          goto LABEL_11;
        case 4uLL:
          double v27 = [(CarCardContainerView *)self->_containerView bottomAnchor];
          v28 = [v7 bottomAnchor];
          unsigned int v29 = [v27 constraintEqualToAnchor:v28 constant:-v12];
          [v8 addObject:v29];

          double v15 = [(CarCardView *)self->_cardView rightAnchor];
          double v16 = [v7 leftAnchor];
          [v15 constraintEqualToAnchor:v16];
          goto LABEL_11;
        case 8uLL:
          v30 = [(CarCardContainerView *)self->_containerView bottomAnchor];
          v31 = [v7 bottomAnchor];
          double v32 = [v30 constraintEqualToAnchor:v31 constant:-v12];
          [v8 addObject:v32];

          double v15 = [(CarCardContainerView *)self->_containerView leftAnchor];
          double v16 = [v7 rightAnchor];
          [v15 constraintEqualToAnchor:v16];
          unint64_t v17 = LABEL_11:;
          [v8 addObject:v17];
          goto LABEL_7;
        default:
          goto LABEL_8;
      }
    case 1uLL:
      double v15 = [(CarCardContainerView *)self->_containerView bottomAnchor];
      double v16 = [v7 topAnchor];
      unint64_t v17 = [v15 constraintEqualToAnchor:v16];
      [v8 addObject:v17];
      goto LABEL_7;
    case 2uLL:
      double v15 = [(CarCardContainerView *)self->_containerView rightAnchor];
      double v16 = [v7 leftAnchor];
      unint64_t v17 = [v15 constraintEqualToAnchor:v16];
      [v8 addObject:v17];
      goto LABEL_7;
    case 4uLL:
      double v15 = [(CarCardContainerView *)self->_containerView topAnchor];
      double v16 = [v7 bottomAnchor];
      unint64_t v17 = [v15 constraintEqualToAnchor:v16];
      [v8 addObject:v17];
      goto LABEL_7;
    case 8uLL:
      double v15 = [(CarCardContainerView *)self->_containerView leftAnchor];
      double v16 = [v7 rightAnchor];
      unint64_t v17 = [v15 constraintEqualToAnchor:v16];
      [v8 addObject:v17];
LABEL_7:

      break;
    default:
      break;
  }
LABEL_8:
  unint64_t v18 = [(CarCardConfiguration *)self _sharedLayoutConstraintsForHost:v6 withLayoutGuide:v7];
  [v8 addObjectsFromArray:v18];

  id v19 = [v8 copy];

  return v19;
}

- (id)_viewportConstraintsForHost:(id)a3
{
  id v4 = a3;
  float v5 = [v4 viewportLayoutGuide];
  if (v5)
  {
    id v6 = +[NSMutableArray array];
    [(CarCardConfiguration *)self layout];
    unint64_t v7 = [(CarCardConfiguration *)self effectiveEdgePosition];
    unint64_t v8 = [(CarCardConfiguration *)self effectiveCornerPosition];
    switch(v7)
    {
      case 0uLL:
        switch(v8)
        {
          case 1uLL:
          case 2uLL:
            goto LABEL_15;
          case 4uLL:
            cardView = self->_cardView;
            goto LABEL_16;
          case 8uLL:
            cardView = self->_cardView;
LABEL_16:
            double v10 = [(CarCardView *)cardView topAnchor];
            double v11 = [v5 bottomAnchor];
            double v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11];
            [v6 addObject:v12];
            goto LABEL_8;
          default:
            goto LABEL_9;
        }
      case 1uLL:
LABEL_15:
        double v10 = [(CarCardView *)self->_cardView bottomAnchor];
        double v11 = [v5 topAnchor];
        double v12 = [v10 constraintLessThanOrEqualToAnchor:v11];
        [v6 addObject:v12];
        goto LABEL_8;
      case 2uLL:
        double v10 = [(CarCardView *)self->_cardView rightAnchor];
        double v11 = [v5 leftAnchor];
        double v12 = [v10 constraintLessThanOrEqualToAnchor:v11];
        [v6 addObject:v12];
        goto LABEL_8;
      case 4uLL:
        double v10 = [(CarCardView *)self->_cardView topAnchor];
        double v11 = [v5 bottomAnchor];
        double v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11];
        [v6 addObject:v12];
        goto LABEL_8;
      case 8uLL:
        double v10 = [(CarCardView *)self->_cardView leftAnchor];
        double v11 = [v5 rightAnchor];
        double v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11];
        [v6 addObject:v12];
LABEL_8:

        break;
      default:
        break;
    }
LABEL_9:
    id v9 = [v6 copy];
  }
  else
  {
    id v9 = &__NSArray0__struct;
  }

  return v9;
}

- (id)_mapInsetsConstraintsForHost:(id)a3
{
  id v4 = a3;
  float v5 = [v4 contentLayoutGuide];
  id v6 = [v4 mapInsetsLayoutGuide];
  if (v6
    && (unint64_t v7 = [(CarCardConfiguration *)self effectiveEdgesAffectingMapInsets]) != 0)
  {
    char v8 = v7;
    double v16 = +[NSMutableArray array];
    [(CarCardConfiguration *)self layout];
    unint64_t v9 = [(CarCardConfiguration *)self effectiveEdgePosition];
    unint64_t v10 = [(CarCardConfiguration *)self effectiveCornerPosition];
    switch(v9)
    {
      case 0uLL:
        switch(v10)
        {
          case 1uLL:
            if ((v8 & 4) != 0) {
              goto LABEL_22;
            }
            break;
          case 2uLL:
            if ((v8 & 4) != 0) {
              goto LABEL_22;
            }
            break;
          case 4uLL:
            if (v8) {
              goto LABEL_26;
            }
            break;
          case 8uLL:
            if (v8) {
              goto LABEL_26;
            }
            break;
          default:
            goto LABEL_15;
        }
        break;
      case 1uLL:
        if ((v8 & 4) != 0)
        {
LABEL_22:
          unint64_t v13 = [(CarCardView *)self->_cardView bottomAnchor];
          unint64_t v14 = [v6 topAnchor];
          double v15 = [v13 constraintLessThanOrEqualToAnchor:v14];
          [v16 addObject:v15];
          goto LABEL_14;
        }
        break;
      case 2uLL:
        if ((v8 & 8) != 0)
        {
          unint64_t v13 = [(CarCardView *)self->_cardView rightAnchor];
          unint64_t v14 = [v6 leftAnchor];
          double v15 = [v13 constraintLessThanOrEqualToAnchor:v14];
          [v16 addObject:v15];
          goto LABEL_14;
        }
        break;
      case 4uLL:
        if (v8)
        {
LABEL_26:
          unint64_t v13 = [(CarCardView *)self->_cardView topAnchor];
          unint64_t v14 = [v6 bottomAnchor];
          double v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14];
          [v16 addObject:v15];
          goto LABEL_14;
        }
        break;
      case 8uLL:
        if ((v8 & 2) != 0)
        {
          unint64_t v13 = [(CarCardView *)self->_cardView leftAnchor];
          unint64_t v14 = [v6 rightAnchor];
          double v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14];
          [v16 addObject:v15];
LABEL_14:
        }
        break;
      default:
        break;
    }
LABEL_15:
    id v11 = [v16 copy];
  }
  else
  {
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

- (id)_collisionConstraintsForHost:(id)a3
{
  id v4 = a3;
  if ([(CarCardConfiguration *)self staysOnTop])
  {
    id v5 = &__NSArray0__struct;
  }
  else
  {
    id v6 = +[NSMutableArray array];
    unint64_t v7 = [(CarCardConfiguration *)self effectiveEdgePosition];
    unint64_t v8 = [(CarCardConfiguration *)self effectiveCornerPosition];
    switch(v7)
    {
      case 0uLL:
        switch(v8)
        {
          case 1uLL:
            unint64_t v9 = [v4 collisionGuideForEdge:2];
            if (v9)
            {
              unint64_t v10 = [(CarCardContainerView *)self->_containerView bottomAnchor];
              id v11 = [v9 topAnchor];
              double v12 = [v10 constraintEqualToAnchor:v11];
              [v6 addObject:v12];
            }
            unint64_t v13 = v4;
            uint64_t v14 = 1;
            goto LABEL_46;
          case 2uLL:
            unint64_t v9 = [v4 collisionGuideForEdge:8];
            if (v9)
            {
              __int16 v58 = [(CarCardContainerView *)self->_containerView bottomAnchor];
              v59 = [v9 topAnchor];
              v60 = [v58 constraintEqualToAnchor:v59];
              [v6 addObject:v60];
            }
            v61 = v4;
            uint64_t v62 = 1;
            goto LABEL_51;
          case 4uLL:
            unint64_t v9 = [v4 collisionGuideForEdge:2];
            if (v9)
            {
              v63 = [(CarCardContainerView *)self->_containerView topAnchor];
              v64 = [v9 bottomAnchor];
              v65 = [v63 constraintEqualToAnchor:v64];
              [v6 addObject:v65];
            }
            unint64_t v13 = v4;
            uint64_t v14 = 4;
LABEL_46:
            id v21 = [v13 collisionGuideForEdge:v14];
            if (!v21) {
              goto LABEL_35;
            }
            v25 = [(CarCardContainerView *)self->_containerView rightAnchor];
            uint64_t v66 = [v21 leftAnchor];
            goto LABEL_53;
          case 8uLL:
            unint64_t v9 = [v4 collisionGuideForEdge:8];
            if (v9)
            {
              v67 = [(CarCardContainerView *)self->_containerView topAnchor];
              v68 = [v9 bottomAnchor];
              v69 = [v67 constraintEqualToAnchor:v68];
              [v6 addObject:v69];
            }
            v61 = v4;
            uint64_t v62 = 4;
LABEL_51:
            id v21 = [v61 collisionGuideForEdge:v62];
            if (!v21) {
              goto LABEL_35;
            }
            v25 = [(CarCardContainerView *)self->_containerView leftAnchor];
            uint64_t v66 = [v21 rightAnchor];
LABEL_53:
            v26 = (void *)v66;
            uint64_t v55 = [v25 constraintEqualToAnchor:v66];
            [v6 addObject:v55];
            break;
          default:
            goto LABEL_36;
        }
        goto LABEL_33;
      case 1uLL:
        unint64_t v9 = [v4 collisionGuideForEdge:1];
        if (v9)
        {
          v28 = [(CarCardContainerView *)self->_containerView leftAnchor];
          unsigned int v29 = [v9 leftAnchor];
          v30 = [v28 constraintEqualToAnchor:v29];
          [v6 addObject:v30];

          v31 = [(CarCardContainerView *)self->_containerView rightAnchor];
          double v32 = [v9 rightAnchor];
          double v33 = [v31 constraintEqualToAnchor:v32];
          [v6 addObject:v33];
        }
        id v21 = [v4 collisionGuideForEdge:2];
        if (v21)
        {
          v34 = [(CarCardContainerView *)self->_containerView bottomAnchor];
          double v35 = [v21 topAnchor];
          id v36 = [v34 constraintEqualToAnchor:v35];
          [v6 addObject:v36];
        }
        v25 = [v4 collisionGuideForEdge:8];
        if (!v25) {
          goto LABEL_34;
        }
        v26 = [(CarCardContainerView *)self->_containerView bottomAnchor];
        uint64_t v27 = [v25 topAnchor];
        break;
      case 2uLL:
        unint64_t v9 = [v4 collisionGuideForEdge:2];
        if (v9)
        {
          double v15 = [(CarCardContainerView *)self->_containerView topAnchor];
          double v16 = [v9 topAnchor];
          unint64_t v17 = [v15 constraintEqualToAnchor:v16];
          [v6 addObject:v17];

          unint64_t v18 = [(CarCardContainerView *)self->_containerView bottomAnchor];
          id v19 = [v9 bottomAnchor];
          uint64_t v20 = [v18 constraintEqualToAnchor:v19];
          [v6 addObject:v20];
        }
        id v21 = [v4 collisionGuideForEdge:4];
        if (v21)
        {
          double v22 = [(CarCardContainerView *)self->_containerView rightAnchor];
          double v23 = [v21 leftAnchor];
          uint64_t v24 = [v22 constraintEqualToAnchor:v23];
          [v6 addObject:v24];
        }
        v25 = [v4 collisionGuideForEdge:1];
        if (!v25) {
          goto LABEL_34;
        }
        v26 = [(CarCardContainerView *)self->_containerView rightAnchor];
        uint64_t v27 = [v25 leftAnchor];
        break;
      case 4uLL:
        unint64_t v9 = [v4 collisionGuideForEdge:4];
        if (v9)
        {
          double v37 = [(CarCardContainerView *)self->_containerView leftAnchor];
          double v38 = [v9 leftAnchor];
          double v39 = [v37 constraintEqualToAnchor:v38];
          [v6 addObject:v39];

          id v40 = [(CarCardContainerView *)self->_containerView rightAnchor];
          long long v41 = [v9 rightAnchor];
          id v42 = [v40 constraintEqualToAnchor:v41];
          [v6 addObject:v42];
        }
        id v21 = [v4 collisionGuideForEdge:2];
        if (v21)
        {
          id v43 = [(CarCardContainerView *)self->_containerView topAnchor];
          double v44 = [v21 bottomAnchor];
          double v45 = [v43 constraintEqualToAnchor:v44];
          [v6 addObject:v45];
        }
        v25 = [v4 collisionGuideForEdge:8];
        if (!v25) {
          goto LABEL_34;
        }
        v26 = [(CarCardContainerView *)self->_containerView topAnchor];
        uint64_t v27 = [v25 bottomAnchor];
        break;
      case 8uLL:
        unint64_t v9 = [v4 collisionGuideForEdge:8];
        if (v9)
        {
          long long v46 = [(CarCardContainerView *)self->_containerView topAnchor];
          id v47 = [v9 topAnchor];
          int64x2_t v48 = [v46 constraintEqualToAnchor:v47];
          [v6 addObject:v48];

          id v49 = [(CarCardContainerView *)self->_containerView bottomAnchor];
          long long v50 = [v9 bottomAnchor];
          long long v51 = [v49 constraintEqualToAnchor:v50];
          [v6 addObject:v51];
        }
        id v21 = [v4 collisionGuideForEdge:4];
        if (v21)
        {
          float64x2_t v52 = [(CarCardContainerView *)self->_containerView leftAnchor];
          float64x2_t v53 = [v21 rightAnchor];
          long long v54 = [v52 constraintEqualToAnchor:v53];
          [v6 addObject:v54];
        }
        v25 = [v4 collisionGuideForEdge:1];
        if (!v25) {
          goto LABEL_34;
        }
        v26 = [(CarCardContainerView *)self->_containerView leftAnchor];
        uint64_t v27 = [v25 rightAnchor];
        break;
      default:
        goto LABEL_36;
    }
    uint64_t v55 = (void *)v27;
    v56 = [v26 constraintEqualToAnchor:v27];
    [v6 addObject:v56];

LABEL_33:
LABEL_34:

LABEL_35:
LABEL_36:
    id v5 = [v6 copy];
  }

  return v5;
}

- (id)_collisionLayoutGuidesForHost:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [&off_1013AE700 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(&off_1013AE700);
        }
        unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v10 = [v3 collisionGuideForEdge:[v9 unsignedIntegerValue]];
        [v4 setObject:v10 forKeyedSubscript:v9];
      }
      id v6 = [&off_1013AE700 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

- (CGRect)collisionLayoutGuideFrameForEdge:(unint64_t)a3
{
  id v4 = [(CarCardConfiguration *)self collisionLayoutGuides];
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  [v6 layoutFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    BOOL v3 = a3;
    self->_hidden = a3;
    [(CarCardConfiguration *)self updateVisibility];
    id v5 = sub_100577A0C();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      return;
    }
    id v6 = self;
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      double v9 = [(CarCardConfiguration *)v6 performSelector:"accessibilityIdentifier"];
      double v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        double v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    double v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    double v12 = @"NO";
    if (v3) {
      double v12 = @"YES";
    }
    double v13 = v12;
    *(_DWORD *)buf = 138543874;
    double v15 = v11;
    __int16 v16 = 2112;
    double v17 = v13;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Did set hidden (hidden:%@, configuration:%@)", buf, 0x20u);

    goto LABEL_11;
  }
}

- (void)updateVisibility
{
  cardView = self->_cardView;
  if (!cardView)
  {
    double v11 = sub_100577A0C();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    double v12 = self;
    double v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      double v15 = [(CarCardConfiguration *)v12 performSelector:"accessibilityIdentifier"];
      __int16 v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        double v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_15;
      }
    }
    double v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_15:

    *(_DWORD *)buf = 138543362;
    v26 = v17;
    __int16 v18 = "[%{public}@] Will not update visibility constraints, no card view";
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

    goto LABEL_25;
  }
  id v4 = [(CarCardView *)cardView window];
  uint64_t v5 = [v4 windowScene];
  if (!v5)
  {

LABEL_17:
    double v11 = sub_100577A0C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v19 = self;
      uint64_t v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      if (objc_opt_respondsToSelector())
      {
        double v22 = [(CarCardConfiguration *)v19 performSelector:"accessibilityIdentifier"];
        double v23 = v22;
        if (v22 && ![v22 isEqualToString:v21])
        {
          double v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v21, v19, v23];

          goto LABEL_23;
        }
      }
      double v17 = +[NSString stringWithFormat:@"%@<%p>", v21, v19];
LABEL_23:

      *(_DWORD *)buf = 138543362;
      v26 = v17;
      __int16 v18 = "[%{public}@] Will not update visibility constraints, no window or window detached for card view";
      goto LABEL_24;
    }
LABEL_25:

    return;
  }
  id v6 = (void *)v5;
  double v7 = [(CarCardView *)self->_cardView window];
  double v8 = [v7 windowScene];
  id v9 = [v8 activationState];

  if (v9 == (id)-1) {
    goto LABEL_17;
  }
  if ([(CarCardConfiguration *)self isHidden])
  {
    +[NSLayoutConstraint deactivateConstraints:self->_showingConstraints];
    +[NSLayoutConstraint activateConstraints:self->_hidingConstraints];
    if (![(CarCardConfiguration *)self isTransitioning])
    {
      +[NSLayoutConstraint deactivateConstraints:self->_viewportConstraints];
      +[NSLayoutConstraint deactivateConstraints:self->_mapInsetsConstraints];
      collisionConstraints = self->_collisionConstraints;
      +[NSLayoutConstraint deactivateConstraints:collisionConstraints];
    }
  }
  else
  {
    +[NSLayoutConstraint deactivateConstraints:self->_hidingConstraints];
    +[NSLayoutConstraint activateConstraints:self->_showingConstraints];
    if (![(CarCardConfiguration *)self isTransitioning])
    {
      +[NSLayoutConstraint activateConstraints:self->_viewportConstraints];
      +[NSLayoutConstraint activateConstraints:self->_mapInsetsConstraints];
      uint64_t v24 = self->_collisionConstraints;
      +[NSLayoutConstraint activateConstraints:v24];
    }
  }
}

- (void)setAccessoryView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    uint64_t v5 = v6;
    self->_invalidationState |= 2uLL;
  }
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  title = self->_title;
  unint64_t v10 = (unint64_t)v5;
  id v7 = title;
  double v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    unsigned __int8 v9 = [(id)v10 isEqual:v7];

    double v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_title, a3);
      double v8 = (void *)v10;
      self->_invalidationState |= 4uLL;
    }
  }
}

- (void)setTitleNumberOfLines:(int64_t)a3
{
  if (self->_titleNumberOfLines != a3)
  {
    self->_titleNumberOfLines = a3;
    self->_invalidationState |= 4uLL;
  }
}

- (void)setContent:(id)a3
{
  id v5 = (CarCardContent *)a3;
  if (self->_content != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_content, a3);
    id v5 = v6;
    self->_invalidationState |= 2uLL;
  }
}

- (void)setLayout:(id *)a3
{
  p_layout = &self->_layout;
  primaryAxisFillLimit = self->_layout.primaryAxisFillLimit;
  secondaryAxisFillLimit = self->_layout.secondaryAxisFillLimit;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->_layout.edgePosition, *(int64x2_t *)&a3->var0), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->_layout.primaryAxis, *(int64x2_t *)&a3->var2))), 0xFuLL))) & 1) != 0&& self->_layout.primaryAxisFillMode == a3->var4&& self->_layout.secondaryAxisFillMode == a3->var6&& self->_layout.edgesAffectingMapInsets == a3->var12&& self->_layout.flipForRightHandDrive == a3->var11&& self->_layout.primaryAxisFillModePriority == a3->var5&& self->_layout.secondaryAxisFillModePriority == a3->var7)
  {
    char v8 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layout.margins.top, *(float64x2_t *)&a3->var10.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layout.margins.bottom, *(float64x2_t *)&a3->var10.bottom))), 0xFuLL)));
    unsigned __int8 v9 = secondaryAxisFillLimit;

    if (v8) {
      goto LABEL_21;
    }
  }
  else
  {
    unint64_t v10 = secondaryAxisFillLimit;
  }
  BOOL v11 = self->_layout.primaryAxis != a3->var2
     || self->_layout.primaryAxisFillMode != a3->var4
     || self->_layout.secondaryAxisFillMode != a3->var6;
  BOOL v12 = self->_layout.cornerPosition != a3->var1 || p_layout->edgePosition != a3->var0;
  if (self->_layout.primaryAxisFillModePriority != a3->var5
    || v11
    || v12
    || self->_layout.secondaryAxisFillModePriority != a3->var7)
  {
    self->_invalidationState |= 1uLL;
  }
  sub_10077FA04((uint64_t)p_layout, (long long *)a3);
LABEL_21:

  id var9 = a3->var9;
}

- (void)setStaysOnTop:(BOOL)a3
{
  if (self->_staysOnTop != a3)
  {
    self->_staysOnTop = a3;
    self->_invalidationState |= 4uLL;
  }
}

- (void)setSelectionHandler:(id)a3
{
  if (self->_selectionHandler != a3)
  {
    id v4 = objc_retainBlock(a3);
    id selectionHandler = self->_selectionHandler;
    self->_id selectionHandler = v4;

    self->_invalidationState |= 4uLL;
  }
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    -[CarCardView setTransitioning:](self->_cardView, "setTransitioning:");
  }
}

- (unint64_t)effectiveEdgePosition
{
  [(CarCardConfiguration *)self layout];
  unint64_t v2 = v8;
  if (v11)
  {
    BOOL v3 = +[MapsExternalDevice sharedInstance];
    unsigned int v4 = [v3 rightHandDrive];

    uint64_t v5 = 8;
    uint64_t v6 = 2;
    if (v8 != 8) {
      uint64_t v6 = v8;
    }
    if (v8 != 2) {
      uint64_t v5 = v6;
    }
    if (v4) {
      unint64_t v2 = v5;
    }
  }

  return v2;
}

- (unint64_t)effectiveCornerPosition
{
  [(CarCardConfiguration *)self layout];
  unint64_t v2 = v6;
  if (v9)
  {
    BOOL v3 = +[MapsExternalDevice sharedInstance];
    unsigned int v4 = [v3 rightHandDrive];

    if (v4)
    {
      switch(v6)
      {
        case 1uLL:
          unint64_t v2 = 2;
          break;
        case 2uLL:
          unint64_t v2 = 1;
          break;
        case 4uLL:
          unint64_t v2 = 8;
          break;
        case 8uLL:
          unint64_t v2 = 4;
          break;
      }
    }
  }

  return v2;
}

- (UIEdgeInsets)effectiveMargins
{
  [(CarCardConfiguration *)self layout];

  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)effectiveEdgesAffectingMapInsets
{
  [(CarCardConfiguration *)self layout];
  unint64_t v3 = v12;

  [(CarCardConfiguration *)self layout];
  if (v9)
  {
    double v4 = +[MapsExternalDevice sharedInstance];
    unsigned int v5 = [v4 rightHandDrive];

    if (v5) {
      return (v12 >> 2) & 2 | (8 * ((v12 >> 1) & 1)) | v12;
    }
  }
  else
  {
  }
  return v3;
}

- (void)_setShowContainerVisualisation:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CarCardContainerView *)self->_containerView viewWithTag:1234];
  id v6 = v5;
  if (v3)
  {
    if (!v5)
    {
      id v6 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v6 setTag:1234];
      [v6 setUserInteractionEnabled:0];
      [(CarCardContainerView *)self->_containerView addSubview:v6];
      id v21 = [v6 widthAnchor];
      uint64_t v20 = [v6 heightAnchor];
      id v19 = [v21 constraintEqualToAnchor:v20];
      v23[0] = v19;
      __int16 v18 = [v6 widthAnchor];
      id v7 = [v18 constraintEqualToConstant:4.0];
      v23[1] = v7;
      unint64_t v8 = [v6 rightAnchor];
      char v9 = [(CarCardContainerView *)self->_containerView leftAnchor];
      unint64_t v10 = [v8 constraintEqualToAnchor:v9 constant:-2.0];
      v23[2] = v10;
      char v11 = [v6 topAnchor];
      unint64_t v12 = [(CarCardContainerView *)self->_containerView topAnchor];
      double v13 = [v11 constraintEqualToAnchor:v12 constant:2.0];
      v23[3] = v13;
      double v14 = +[NSArray arrayWithObjects:v23 count:4];
      +[NSLayoutConstraint activateConstraints:v14];
    }
    double v15 = (double)(arc4random() % 0xA) / 10.0;
    __int16 v16 = +[UIColor colorWithHue:v15 saturation:0.800000012 brightness:0.600000024 alpha:0.300000012];
    [(CarCardContainerView *)self->_containerView setBackgroundColor:v16];

    double v17 = +[UIColor colorWithHue:v15 saturation:0.800000012 brightness:0.600000024 alpha:0.800000012];
    [v6 setBackgroundColor:v17];
  }
  else
  {
    [v5 removeFromSuperview];

    id v22 = +[UIColor clearColor];
    -[CarCardContainerView setBackgroundColor:](self->_containerView, "setBackgroundColor:");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1015F4728 != a6)
  {
    v21.receiver = self;
    v21.super_class = (Class)CarCardConfiguration;
    [(CarCardConfiguration *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_13;
  }
  if (!self->_ignoreContainerBoundsChanges && [v10 isEqualToString:@"bounds"])
  {
    double v13 = sub_100577A0C();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      [(CarCardConfiguration *)self _updateAvailableCardSize];
      goto LABEL_13;
    }
    double v14 = self;
    double v15 = (objc_class *)objc_opt_class();
    __int16 v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      double v17 = [(CarCardConfiguration *)v14 performSelector:"accessibilityIdentifier"];
      __int16 v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        id v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_11;
      }
    }
    id v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_11:

    uint64_t v20 = [(CarCardConfiguration *)v14 key];
    *(_DWORD *)buf = 138543618;
    double v23 = v19;
    __int16 v24 = 2112;
    v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] %@ notified of container bounds change", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:
}

- (void)_updateAvailableCardSize
{
  BOOL v3 = [(CarCardConfiguration *)self content];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    [(CarCardContainerView *)self->_containerView bounds];
    double v6 = v5;
    double v8 = v7;
    id v9 = [(CarCardConfiguration *)self content];
    [v9 setAvailableCardSize:v6, v8];
  }
}

- (void)_startIgnoringContainerBoundsChanges
{
  BOOL v3 = sub_100577A0C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    char v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    double v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      double v7 = [(CarCardConfiguration *)v4 performSelector:"accessibilityIdentifier"];
      double v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    id v10 = [(CarCardConfiguration *)v4 key];
    *(_DWORD *)buf = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    double v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] %@ will start ignoring container bounds changes", buf, 0x16u);
  }
  self->_ignoreContainerBoundsChanges = 1;
}

- (void)_stopIgnoringContainerBoundsChanges
{
  BOOL ignoreContainerBoundsChanges = self->_ignoreContainerBoundsChanges;
  char v4 = sub_100577A0C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (ignoreContainerBoundsChanges)
  {
    if (!v5)
    {
LABEL_9:

      self->_BOOL ignoreContainerBoundsChanges = 0;
      [(CarCardConfiguration *)self _updateAvailableCardSize];
      return;
    }
    double v6 = self;
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(CarCardConfiguration *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        id v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    id v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    id v12 = [(CarCardConfiguration *)v6 key];
    *(_DWORD *)buf = 138543618;
    objc_super v21 = v11;
    __int16 v22 = 2112;
    double v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %@ will stop ignoring container bounds changes", buf, 0x16u);

    goto LABEL_9;
  }
  if (v5)
  {
    __int16 v13 = self;
    double v14 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      __int16 v16 = [(CarCardConfiguration *)v13 performSelector:"accessibilityIdentifier"];
      double v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_16;
      }
    }
    __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_16:

    id v19 = [(CarCardConfiguration *)v13 key];
    *(_DWORD *)buf = 138543618;
    objc_super v21 = v18;
    __int16 v22 = 2112;
    double v23 = v19;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %@ told to stop ignoring container bounds changes, but wasn't", buf, 0x16u);
  }
}

- (CarCardContent)content
{
  return self->_content;
}

- ($B1874A4E4729613F071A632570863A63)layout
{
  long long v5 = *(_OWORD *)&self->_layout.primaryAxis;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_layout.edgePosition;
  *(_OWORD *)&retstr->var2 = v5;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_layout.primaryAxisFillMode;
  *(_OWORD *)(&retstr->var5 + 1) = *(_OWORD *)(&self->_layout.primaryAxisFillModePriority + 1);
  retstr->var8 = self->_layout.primaryAxisFillLimit;
  UIEdgeInsets result = self->_layout.secondaryAxisFillLimit;
  retstr->id var9 = result;
  long long v7 = *(_OWORD *)&self->_layout.margins.bottom;
  *(_OWORD *)&retstr->var10.top = *(_OWORD *)&self->_layout.margins.top;
  *(_OWORD *)&retstr->var10.bottom = v7;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self->_layout.flipForRightHandDrive;
  retstr->var13 = self->_layout.horizontallyCenterMapInsets;
  return result;
}

- (BOOL)staysOnTop
{
  return self->_staysOnTop;
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

- (void)setAccessory:(unint64_t)a3
{
  self->_accessordouble y = a3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (NSString)key
{
  return self->_key;
}

- (CarCardView)cardView
{
  return self->_cardView;
}

- (CarCardContainerView)containerView
{
  return self->_containerView;
}

- (NSArray)showingConstraints
{
  return self->_showingConstraints;
}

- (NSArray)hidingConstraints
{
  return self->_hidingConstraints;
}

- (NSArray)viewportConstraints
{
  return self->_viewportConstraints;
}

- (NSArray)mapInsetsConstraints
{
  return self->_mapInsetsConstraints;
}

- (NSArray)collisionConstraints
{
  return self->_collisionConstraints;
}

- (NSDictionary)collisionLayoutGuides
{
  return self->_collisionLayoutGuides;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (unint64_t)invalidationState
{
  return self->_invalidationState;
}

- (CarCardContent)previousContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousContent);

  return (CarCardContent *)WeakRetained;
}

- (void)setPreviousContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousContent);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_collisionLayoutGuides, 0);
  objc_storeStrong((id *)&self->_collisionConstraints, 0);
  objc_storeStrong((id *)&self->_mapInsetsConstraints, 0);
  objc_storeStrong((id *)&self->_viewportConstraints, 0);
  objc_storeStrong((id *)&self->_hidingConstraints, 0);
  objc_storeStrong((id *)&self->_showingConstraints, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);

  secondaryAxisFillLimit = self->_lastLayout.secondaryAxisFillLimit;
}

@end