@interface NavPrimaryDrivingSignView
- (BOOL)animatingToHideLaneGuidanceView;
- (BOOL)debugHighlightLanes;
- (BOOL)highlightedLanesNotInVisibleRange;
- (NSLayoutConstraint)laneGuidanceViewLeadingMarginConstraint;
- (NSLayoutConstraint)laneGuidanceViewMajorLabelConstraint;
- (NSLayoutConstraint)laneGuidanceViewTopMarginConstraint;
- (NSLayoutConstraint)laneGuidanceViewTrailingMarginConstraint;
- (NavSignLaneGuidanceInfo)laneGuidanceInfo;
- (NavSignLaneGuidanceView)laneGuidanceView;
- (UIView)viewForSecondarySignTextToAlignLeading;
- (id)_defaultSignLayoutDelegate;
- (id)accessibilityIdentifier;
- (id)debugDescription;
- (void)_animateShowingLaneGuidanceView;
- (void)_animateTransitioningFromOldLaneGuidance:(id)a3;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateConstraints;
- (void)_updateLabelText;
- (void)clearContent;
- (void)hideLaneGuidanceAnimated:(BOOL)a3;
- (void)refreshSign;
- (void)setAnimatingToHideLaneGuidanceView:(BOOL)a3;
- (void)setDebugHighlightLanes:(BOOL)a3;
- (void)setLaneGuidanceInfo:(id)a3;
- (void)showLaneGuidance:(id)a3 animated:(BOOL)a4;
- (void)updateLaneGuidance:(id)a3;
@end

@implementation NavPrimaryDrivingSignView

- (id)_defaultSignLayoutDelegate
{
  return +[NavSignLayoutDelegateManager defaultLayoutDelegateForDriving];
}

- (void)_setupSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)NavPrimaryDrivingSignView;
  [(NavManeuverSignView *)&v6 _setupSubviews];
  v3 = [[NavSignLaneGuidanceView alloc] initWithLaneStyle:0];
  laneGuidanceView = self->_laneGuidanceView;
  self->_laneGuidanceView = v3;

  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v5) = 1148846080;
  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setContentCompressionResistancePriority:1 forAxis:v5];
  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setHidden:1];
  [(NavPrimaryDrivingSignView *)self addSubview:self->_laneGuidanceView];
}

- (void)refreshSign
{
  v3 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
  v4 = [v3 lanes];
  double v5 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v5 setLanes:v4];

  v6.receiver = self;
  v6.super_class = (Class)NavPrimaryDrivingSignView;
  [(NavManeuverSignView *)&v6 refreshSign];
}

- (void)_setupConstraints
{
  v33.receiver = self;
  v33.super_class = (Class)NavPrimaryDrivingSignView;
  [(NavManeuverSignView *)&v33 _setupConstraints];
  v3 = +[NSMutableArray array];
  v4 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  double v5 = [v4 topAnchor];
  objc_super v6 = [(NavPrimaryDrivingSignView *)self topAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  laneGuidanceViewTopMarginConstraint = self->_laneGuidanceViewTopMarginConstraint;
  self->_laneGuidanceViewTopMarginConstraint = v7;

  v9 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  v10 = [v9 leadingAnchor];
  v11 = [(NavPrimaryDrivingSignView *)self leadingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  laneGuidanceViewLeadingMarginConstraint = self->_laneGuidanceViewLeadingMarginConstraint;
  self->_laneGuidanceViewLeadingMarginConstraint = v12;

  v14 = [(NavPrimaryDrivingSignView *)self trailingAnchor];
  v15 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  laneGuidanceViewTrailingMarginConstraint = self->_laneGuidanceViewTrailingMarginConstraint;
  self->_laneGuidanceViewTrailingMarginConstraint = v17;

  v19 = [(NavSignView *)self majorLabel];
  v20 = [v19 topAnchor];
  v21 = [(NavPrimaryDrivingSignView *)self topAnchor];
  v22 = [v20 constraintGreaterThanOrEqualToAnchor:v21];
  laneGuidanceViewMajorLabelConstraint = self->_laneGuidanceViewMajorLabelConstraint;
  self->_laneGuidanceViewMajorLabelConstraint = v22;

  v24 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewTopMarginConstraint];
  v34[0] = v24;
  v25 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewLeadingMarginConstraint];
  v34[1] = v25;
  v26 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewTrailingMarginConstraint];
  v34[2] = v26;
  v27 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewMajorLabelConstraint];
  v34[3] = v27;
  v28 = [(NavPrimaryDrivingSignView *)self bottomAnchor];
  v29 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  v30 = [v29 bottomAnchor];
  v31 = [v28 constraintGreaterThanOrEqualToAnchor:v30];
  v34[4] = v31;
  v32 = +[NSArray arrayWithObjects:v34 count:5];
  [v3 addObjectsFromArray:v32];

  +[NSLayoutConstraint activateConstraints:v3];
}

- (void)_updateConstraints
{
  v41.receiver = self;
  v41.super_class = (Class)NavPrimaryDrivingSignView;
  [(NavManeuverSignView *)&v41 _updateConstraints];
  v3 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
  if (v3)
  {
    v4 = [(NavSignView *)self signLayoutDelegate];
    unsigned int v5 = [v4 forceHideLaneGuidanceViewForSign:self] ^ 1;
  }
  else
  {
    unsigned int v5 = 0;
  }

  objc_super v6 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v6 setHidden:v5 ^ 1];

  if ([(NavPrimaryDrivingSignView *)self animatingToHideLaneGuidanceView])
  {
    v7 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
    [v7 setHidden:0];
  }
  v8 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v8 frame];
  double Height = CGRectGetHeight(v42);

  v10 = [(NavSignView *)self signLayoutDelegate];
  [v10 laneGuidanceViewTopMarginForSign:self];
  double v12 = v11;

  if (!v5) {
    double v12 = -Height;
  }
  v13 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewTopMarginConstraint];
  [v13 setConstant:v12];

  v14 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewMajorLabelConstraint];
  v15 = v14;
  if (v5)
  {
    [v14 setConstant:Height];

    v16 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewMajorLabelConstraint];
    v17 = v16;
    uint64_t v18 = 1;
  }
  else
  {
    [v14 setConstant:0.0];

    v16 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewMajorLabelConstraint];
    v17 = v16;
    uint64_t v18 = 0;
  }
  [v16 setActive:v18];

  v19 = [(NavSignView *)self signLayoutDelegate];
  [v19 laneGuidanceViewSideMarginForSign:self];
  double v21 = v20;

  v22 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewLeadingMarginConstraint];
  [v22 setConstant:v21];

  v23 = [(NavPrimaryDrivingSignView *)self laneGuidanceViewTrailingMarginConstraint];
  [v23 setConstant:v21];

  v24 = [(NavSignView *)self signLayoutDelegate];
  [v24 laneGuidanceViewInternalEdgeInsetsForSign:self];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  objc_super v33 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v33 setEdgeInsets:v26, v28, v30, v32];

  v34 = [(NavSignView *)self signLayoutDelegate];
  id v35 = [v34 shouldTransformLaneViewsForSign:self];

  v36 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v36 setShouldTransformWithVerticalScale:v35];

  v37 = [(NavSignView *)self signLayoutDelegate];
  [v37 laneGuidanceViewVerticalScaleForSign:self];
  double v39 = v38;

  v40 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v40 setVerticalScale:v39];
}

- (void)_updateLabelText
{
  v3 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
  unsigned int v4 = [v3 isForMidStep];

  if (v4)
  {
    unsigned int v5 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
    objc_super v6 = [v5 midStepTitles];
    id v7 = [v6 count];

    if (v7)
    {
      v8 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
      [v8 midStepTitles];
    }
    else
    {
      v8 = [(NavManeuverSignView *)self maneuverGuidanceInfo];
      [v8 majorTextAlternatives];
    v9 = };
    v10 = [(NavSignView *)self majorLabel];
    [v10 setTextAlternatives:v9];

    id v13 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
    double v11 = [v13 textAlternatives];
    double v12 = [(NavSignView *)self minorLabel];
    [v12 setTextAlternatives:v11];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NavPrimaryDrivingSignView;
    [(NavManeuverSignView *)&v14 _updateLabelText];
  }
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)clearContent
{
  v4.receiver = self;
  v4.super_class = (Class)NavPrimaryDrivingSignView;
  [(NavManeuverSignView *)&v4 clearContent];
  [(NavPrimaryDrivingSignView *)self setLaneGuidanceInfo:0];
  v3 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v3 setLanes:0];
}

- (BOOL)debugHighlightLanes
{
  v2 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  unsigned __int8 v3 = [v2 debugHighlightLanes];

  return v3;
}

- (void)setDebugHighlightLanes:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v4 setDebugHighlightLanes:v3];
}

- (UIView)viewForSecondarySignTextToAlignLeading
{
  BOOL v3 = [(NavManeuverSignView *)self maneuverView];
  if ([v3 isHidden])
  {

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (self->_laneGuidanceInfo)
  {
    unsigned __int8 v4 = [(NavPrimaryDrivingSignView *)self highlightedLanesNotInVisibleRange];

    if ((v4 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  unsigned int v5 = [(NavSignView *)self majorLabel];
  unsigned __int8 v6 = [v5 isHidden];

  if (v6)
  {
    id v7 = [(NavSignView *)self minorLabel];
    unsigned __int8 v8 = [v7 isHidden];

    if (v8) {
      goto LABEL_9;
    }
    v9 = [(NavSignView *)self minorLabel];
  }
  else
  {
    v9 = [(NavSignView *)self majorLabel];
  }
LABEL_10:

  return (UIView *)v9;
}

- (BOOL)highlightedLanesNotInVisibleRange
{
  BOOL v3 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
  if (v3)
  {
    unsigned __int8 v4 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
    unsigned __int8 v5 = [v4 highlightedLanesNotInVisibleRange];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)updateLaneGuidance:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);

  [(NavPrimaryDrivingSignView *)self refreshSign];
}

- (void)showLaneGuidance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [v7 lanes];
  id v9 = [v8 count];

  if (v9)
  {
    v10 = [v7 laneInfoId];
    double v11 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
    double v12 = [v11 laneInfoId];
    unsigned int v13 = [v10 isEqual:v12];

    if (v13)
    {
      objc_super v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v28 = 138412290;
        *(void *)double v29 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Lane guidance %@ already showing.", (uint8_t *)&v28, 0xCu);
      }
      goto LABEL_16;
    }
    objc_super v14 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
    v15 = [v14 lanes];
    if ([v15 count])
    {
      v16 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
      unsigned int v17 = [v16 isHidden] ^ 1;
    }
    else
    {
      unsigned int v17 = 0;
    }

    objc_storeStrong((id *)&self->_laneGuidanceInfo, a3);
    if (v4)
    {
      uint64_t v18 = [v7 lanes];
      v19 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
      [v19 setLanes:v18];

      [(NavPrimaryDrivingSignView *)self _updateLabelText];
      if (![(NavPrimaryDrivingSignView *)self highlightedLanesNotInVisibleRange])
      {
        if (v17) {
          [(NavPrimaryDrivingSignView *)self _animateTransitioningFromOldLaneGuidance:v14];
        }
        else {
          [(NavPrimaryDrivingSignView *)self _animateShowingLaneGuidanceView];
        }
        goto LABEL_16;
      }
    }
    else
    {
      [(NavPrimaryDrivingSignView *)self refreshSign];
      if (![(NavPrimaryDrivingSignView *)self highlightedLanesNotInVisibleRange])
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    double v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      double v21 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
      v22 = [v21 lanes];
      unsigned int v23 = [v22 count];
      v24 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
      v32.location = (NSUInteger)[v24 highlightedLaneRange];
      double v25 = NSStringFromRange(v32);
      double v26 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
      v33.location = (NSUInteger)[v26 visibleLaneRange];
      double v27 = NSStringFromRange(v33);
      int v28 = 67109634;
      *(_DWORD *)double v29 = v23;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v25;
      __int16 v30 = 2112;
      double v31 = v27;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Visual lane guidance suppressed: %d total lanes, highlighted lanes range = %@, visible lanes range = %@", (uint8_t *)&v28, 0x1Cu);
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)hideLaneGuidanceAnimated:(BOOL)a3
{
  if (self->_laneGuidanceInfo)
  {
    unsigned int v5 = [(NavPrimaryDrivingSignView *)self highlightedLanesNotInVisibleRange];
    laneGuidanceInfo = self->_laneGuidanceInfo;
    self->_laneGuidanceInfo = 0;

    if (a3)
    {
      [(NavPrimaryDrivingSignView *)self _updateLabelText];
      if (v5)
      {
        id v7 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
        [v7 setLanes:0];
      }
      else
      {
        [(NavPrimaryDrivingSignView *)self setAnimatingToHideLaneGuidanceView:1];
        [(NavPrimaryDrivingSignView *)self setNeedsLayout];
        v8[4] = self;
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1008C2644;
        v9[3] = &unk_1012E5D08;
        v9[4] = self;
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_1008C264C;
        v8[3] = &unk_1012E7D28;
        +[UIView animateWithDuration:v9 animations:v8 completion:0.699999988];
      }
    }
    else
    {
      [(NavPrimaryDrivingSignView *)self refreshSign];
    }
  }
}

- (void)_animateShowingLaneGuidanceView
{
  BOOL v3 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v3 setHidden:0];

  BOOL v4 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v4 setNeedsLayout];

  unsigned int v5 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v5 layoutIfNeeded];

  [(NavManeuverSignView *)self setAnimatingToHideManeuverView:1];
  [(NavPrimaryDrivingSignView *)self frame];
  double MaxY = CGRectGetMaxY(v18);
  id v7 = [(NavManeuverSignView *)self maneuverView];
  [v7 frame];
  double v8 = MaxY - CGRectGetMaxY(v19);

  id v9 = [(NavManeuverSignView *)self maneuverView];
  v10 = [v9 bottomAnchor];
  double v11 = [(NavPrimaryDrivingSignView *)self bottomAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11 constant:-v8];

  [v12 setActive:1];
  [(NavPrimaryDrivingSignView *)self setNeedsLayout];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1008C28AC;
  v17[3] = &unk_1012E5D08;
  v17[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1008C28B4;
  v14[3] = &unk_1012E6160;
  id v15 = v12;
  v16 = self;
  id v13 = v12;
  +[UIView animateWithDuration:v17 animations:v14 completion:0.699999988];
}

- (void)_animateTransitioningFromOldLaneGuidance:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  unsigned __int8 v6 = [v5 duplicateLaneGuidanceView];

  id v7 = [v4 lanes];

  [v6 setLanes:v7];
  [v6 setNeedsLayout];
  [v6 layoutIfNeeded];
  [(NavPrimaryDrivingSignView *)self addSubview:v6];
  double v8 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v8 setNeedsLayout];

  id v9 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v9 layoutIfNeeded];

  v10 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v10 setAlpha:0.0];

  [v6 frame];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  double v16 = v15;
  uint64_t v18 = v17;
  CGRect v19 = [v6 numberOfVisibleLanes];
  double v20 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  double v21 = (double)(unint64_t)(v19 - (unsigned char *)[v20 numberOfVisibleLanes]);
  v22 = [(NavPrimaryDrivingSignView *)self laneGuidanceView];
  [v22 availableLaneWidth];
  double v24 = v23 * v21;

  double v25 = v16 + v24;
  if (v24 == 0.0) {
    double v26 = 0.0;
  }
  else {
    double v26 = 0.5;
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1008C2B64;
  v31[3] = &unk_1012E9418;
  id v32 = v6;
  uint64_t v33 = v12;
  uint64_t v34 = v14;
  double v35 = v25;
  uint64_t v36 = v18;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1008C2B74;
  v28[3] = &unk_1012E6160;
  id v29 = v32;
  __int16 v30 = self;
  id v27 = v32;
  +[UIView animateWithDuration:v31 animations:v28 completion:v26];
}

- (id)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)NavPrimaryDrivingSignView;
  BOOL v3 = [(NavManeuverSignView *)&v7 debugDescription];
  id v4 = [(NavPrimaryDrivingSignView *)self laneGuidanceInfo];
  unsigned int v5 = +[NSString stringWithFormat:@"%@\nLane Guidance: [%@]", v3, v4];

  return v5;
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (void)setLaneGuidanceInfo:(id)a3
{
}

- (NavSignLaneGuidanceView)laneGuidanceView
{
  return self->_laneGuidanceView;
}

- (NSLayoutConstraint)laneGuidanceViewTopMarginConstraint
{
  return self->_laneGuidanceViewTopMarginConstraint;
}

- (NSLayoutConstraint)laneGuidanceViewLeadingMarginConstraint
{
  return self->_laneGuidanceViewLeadingMarginConstraint;
}

- (NSLayoutConstraint)laneGuidanceViewTrailingMarginConstraint
{
  return self->_laneGuidanceViewTrailingMarginConstraint;
}

- (NSLayoutConstraint)laneGuidanceViewMajorLabelConstraint
{
  return self->_laneGuidanceViewMajorLabelConstraint;
}

- (BOOL)animatingToHideLaneGuidanceView
{
  return self->_animatingToHideLaneGuidanceView;
}

- (void)setAnimatingToHideLaneGuidanceView:(BOOL)a3
{
  self->_animatingToHideLaneGuidanceView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laneGuidanceViewMajorLabelConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceViewTrailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceViewLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceViewTopMarginConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceView, 0);

  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
}

@end