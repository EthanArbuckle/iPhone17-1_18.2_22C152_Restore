@interface RCPlaybackView
- (BOOL)_shouldConstrainCenterContentContainerToWindow;
- (BOOL)_showsEditingToolbar;
- (BOOL)disablesActionButtons;
- (BOOL)isFavorite;
- (BOOL)isRecentlyDeleted;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)bottomControlsContainerViewBottomConstraint;
- (NSLayoutConstraint)centerContentContainerTopAnchorToWindowConstraint;
- (NSLayoutConstraint)overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint;
- (NSLayoutConstraint)virtualNavigationToolbarTopConstraint;
- (RCPlaybackView)initWithFrame:(CGRect)a3;
- (RCRecordingDescriptionView)descriptionView;
- (UIBarButtonItem)deleteOrUndeleteButtonItem;
- (UIBarButtonItem)editButtonItem;
- (UIBarButtonItem)shareButtonItem;
- (UIToolbar)virtualNavigationToolbar;
- (UIView)descriptionContainerView;
- (double)_shuttleBarWidth;
- (id)_insertSpacingBetweenElements:(id)a3;
- (void)_applyFixedOverviewWaveformViewConstraints;
- (void)_classSpecificInit;
- (void)_classSpecificLayout;
- (void)_classSpecificSyncTranscriptViewState;
- (void)_clearWindowConstraints;
- (void)_constrainBottomControlsContainerViewToWindowIfNeeded;
- (void)_constrainCenterContentContainerViewToWindowIfNeeded;
- (void)_constrainDescriptionContainerViewToVirtualNavigationBar;
- (void)_constrainViewsToWindowIfNeeded;
- (void)_constrainVirtualNavigationToolbarToWindowIfNeeded;
- (void)_createOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint;
- (void)_createShuttleBarIfNeeded;
- (void)_setupConstraints;
- (void)_setupShuttleBarConstraints;
- (void)_setupVirtualNavigationBarConstraints;
- (void)_updateAccessibilityStateForContentUnavailable:(BOOL)a3;
- (void)didMoveToWindow;
- (void)restyle;
- (void)setBottomControlsContainerViewBottomConstraint:(id)a3;
- (void)setCenterContentContainerTopAnchorToWindowConstraint:(id)a3;
- (void)setDeleteOrUndeleteButtonItem:(id)a3;
- (void)setDescriptionContainerView:(id)a3;
- (void)setDisablesActionButtons:(BOOL)a3;
- (void)setEditButtonItem:(id)a3;
- (void)setEditingInFlight:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsRecentlyDeleted:(BOOL)a3;
- (void)setOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint:(id)a3;
- (void)setShareButtonItem:(id)a3;
- (void)setSubviewsHidden:(BOOL)a3;
- (void)setVirtualNavigationToolbar:(id)a3;
- (void)setVirtualNavigationToolbarTopConstraint:(id)a3;
- (void)updateColors;
- (void)updateShuttleBarControlsColor;
- (void)updateToolbarWithLeadingItems:(id)a3 trailingItems:(id)a4;
- (void)updateUIForContentUnavailable:(BOOL)a3;
@end

@implementation RCPlaybackView

- (RCRecordingDescriptionView)descriptionView
{
  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackView;
  v2 = [(RCRecordingView *)&v4 descriptionView];

  return (RCRecordingDescriptionView *)v2;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackView;
  -[RCPlaybackView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(RCPlaybackView *)self setNeedsLayout];
}

- (void)setDisablesActionButtons:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disablesActionButtons = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = [(RCPlaybackView *)self virtualNavigationToolbar];
  v5 = [v4 items];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    BOOL v9 = !v3;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setEnabled:v9];
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setEditingInFlight:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RCPlaybackView;
  -[RCRecordingView setEditingInFlight:](&v6, "setEditingInFlight:");
  v5 = [(RCPlaybackView *)self virtualNavigationToolbar];
  [v5 setHidden:v3];
}

- (RCPlaybackView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCPlaybackView;
  BOOL v3 = -[RCRecordingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3) {
    [(RCPlaybackView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v4;
}

- (void)_applyFixedOverviewWaveformViewConstraints
{
  id v11 = [(RCRecordingView *)self fixedOverviewWaveformView];
  BOOL v3 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
  objc_super v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v4 playbackViewWaveformOverviewSidePadding];
  double v6 = v5;
  [v4 playbackViewVerticalSpacingAboveOverviewWaveform];
  double v8 = v7;
  [v4 playbackViewVerticalSpacingBelowOverviewWaveform];
  double v10 = v9;
  [v11 alignCenterTopToCenterTopOfView:v3 padding:v8];
  [v11 alignCenterBottomToCenterBottomOfView:v3 padding:-v10];
  [v11 constrainWidthWithView:v3 padding:v6 * -2.0];
}

- (BOOL)_showsEditingToolbar
{
  return 0;
}

- (void)_classSpecificInit
{
  id v29 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v29 showsVirtualNavBarInPlaybackView])
  {
    BOOL v3 = objc_opt_new();
    [(RCPlaybackView *)self setVirtualNavigationToolbar:v3];
    [(RCPlaybackView *)self addSubview:v3];
    objc_super v4 = objc_opt_new();
    [v3 setBackgroundImage:v4 forToolbarPosition:0 barMetrics:0];
    double v5 = +[UIColor clearColor];
    [v3 setBackgroundColor:v5];

    [v3 setShadowImage:v4 forToolbarPosition:0];
  }
  [(RCPlaybackView *)self setTranslatesAutoresizingMaskIntoConstraints:1];
  [(RCRecordingView *)self setDisplayStyle:1];
  if ([v29 presentsTitleAndAdditionalEditingControlsInPlaybackCard])
  {
    double v6 = objc_opt_new();
    [(RCPlaybackView *)self setDescriptionContainerView:v6];
    [(RCPlaybackView *)self addSubview:v6];
    double v7 = +[RCRecordingDescriptionView descriptionViewWithStyle:1];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RCRecordingView *)self setDescriptionView:v7];
    [v6 addSubview:v7];
    [v7 constrainSizeAndAlignCenterToCenterOfView:v6];
    [v7 setRecordingDescriptionViewDelegate:self];
    [v29 fullScreenDescriptionHeight];
    [v6 setFrame:0.0, 0.0, 100.0, v8];
  }
  double v9 = objc_alloc_init(SettableIntrinsicSizeView);
  [(RCRecordingView *)self setCenterContentContainerView:v9];
  [(RCPlaybackView *)self addSubview:v9];
  double v10 = objc_opt_new();
  [(RCRecordingView *)self setFixedOverviewWaveformContainerView:v10];
  [(RCPlaybackView *)self addSubview:v10];
  if ([v29 hasBeginAndEndTimeLabelAtOverviewWaveform])
  {
    id v11 = objc_opt_new();
    [(RCRecordingView *)self setOverviewBeginTimeLabel:v11];

    long long v12 = [v29 beginEndLabelsPlaybackColor];
    long long v13 = [(RCRecordingView *)self overviewBeginTimeLabel];
    [v13 setTextColor:v12];

    long long v14 = [(RCRecordingView *)self overviewBeginTimeLabel];
    [v14 setTextAlignment:4];

    v15 = [(RCRecordingView *)self overviewBeginTimeLabel];
    [v15 setNumberOfLines:0];

    v16 = [v29 beginEndLabelsFont];
    v17 = [(RCRecordingView *)self overviewBeginTimeLabel];
    [v17 setFont:v16];

    v18 = objc_opt_new();
    [(RCRecordingView *)self setOverviewEndTimeLabel:v18];

    v19 = [v29 beginEndLabelsPlaybackColor];
    v20 = [(RCRecordingView *)self overviewEndTimeLabel];
    [v20 setTextColor:v19];

    v21 = [(RCRecordingView *)self overviewEndTimeLabel];
    [v21 setTextAlignment:4];

    v22 = [(RCRecordingView *)self overviewEndTimeLabel];
    [v22 setNumberOfLines:0];

    v23 = [v29 beginEndLabelsFont];
    v24 = [(RCRecordingView *)self overviewEndTimeLabel];
    [v24 setFont:v23];
  }
  v25 = objc_opt_new();
  [(RCRecordingView *)self setBottomControlsContainerView:v25];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RCPlaybackView *)self addSubview:v25];
  v26 = objc_opt_new();
  [(RCRecordingView *)self setCurrentTimeLabel:v26];
  v27 = [v29 playbackViewTimeLabelFont];
  [v26 setFont:v27];

  v28 = [v29 playbackCardTimeLabelFontColor];
  [v26 setTextColor:v28];

  [v26 setTextAlignment:1];
  [(RCPlaybackView *)self addSubview:v26];
  [(RCRecordingView *)self setRecordingViewState:0 animated:0 force:1];
  [(RCPlaybackView *)self _setupConstraints];
}

- (void)_setupConstraints
{
  id v70 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v70 showsVirtualNavBarInPlaybackView]) {
    [(RCPlaybackView *)self _setupVirtualNavigationBarConstraints];
  }
  BOOL v3 = [(RCPlaybackView *)self descriptionContainerView];
  objc_super v4 = v3;
  if (v3)
  {
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v5 = [v4 leadingAnchor];
    double v6 = [(RCPlaybackView *)self leadingAnchor];
    double v7 = [v5 constraintEqualToAnchor:v6];
    [v7 setActive:1];

    double v8 = [v4 trailingAnchor];
    double v9 = [(RCPlaybackView *)self trailingAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    [(RCPlaybackView *)self _constrainDescriptionContainerViewToVirtualNavigationBar];
  }
  id v11 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v11 playbackViewControlSectionHeight];
  double v13 = v12;

  long long v14 = [(RCRecordingView *)self bottomControlsContainerView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [v14 leadingAnchor];
  v16 = [(RCPlaybackView *)self leadingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [v14 trailingAnchor];
  v19 = [(RCPlaybackView *)self trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  v21 = [v14 heightAnchor];
  v22 = [v21 constraintEqualToConstant:v13];
  [v22 setActive:1];

  [(RCPlaybackView *)self _constrainBottomControlsContainerViewToWindowIfNeeded];
  [v70 playbackViewTimeSectionBottomPadding];
  double v24 = v23;
  v25 = [(RCRecordingView *)self currentTimeLabel];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [v25 centerXAnchor];
  v27 = [(RCPlaybackView *)self centerXAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  id v29 = [v25 bottomAnchor];
  v30 = [(RCRecordingView *)self bottomControlsContainerView];
  v31 = [v30 topAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:-v24];
  [v32 setActive:1];

  if ([v70 playbackViewTimeSectionNeedsHeightPadding])
  {
    [v70 playbackViewTimeSectionHeight];
    double v34 = v33;
    v35 = [v25 heightAnchor];
    v36 = [v35 constraintEqualToConstant:v34];
    [v36 setActive:1];
  }
  v37 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
  v38 = [v37 leadingAnchor];
  v39 = [(RCPlaybackView *)self leadingAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v40 setActive:1];

  v41 = [v37 trailingAnchor];
  v42 = [(RCPlaybackView *)self trailingAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v43 setActive:1];

  v44 = [v37 bottomAnchor];
  v45 = [(RCRecordingView *)self currentTimeLabel];
  v46 = [v45 topAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  [v47 setActive:1];

  [v70 playbackViewVerticalSpacingAboveOverviewWaveform];
  double v49 = v48;
  [v70 overviewWaveformHeight];
  double v51 = v50;
  [v70 playbackViewVerticalSpacingBelowOverviewWaveform];
  double v53 = v49 + v51 + v52;
  v54 = [v37 heightAnchor];
  v55 = [v54 constraintEqualToConstant:v53];
  [v55 setActive:1];

  v56 = [(RCRecordingView *)self centerContentContainerView];
  [v56 setTranslatesAutoresizingMaskIntoConstraints:0];
  v57 = [v56 leadingAnchor];
  v58 = [(RCPlaybackView *)self leadingAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  [v59 setActive:1];

  v60 = [v56 trailingAnchor];
  v61 = [(RCPlaybackView *)self trailingAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  [v62 setActive:1];

  unsigned __int8 v63 = [(RCPlaybackView *)self _shouldConstrainCenterContentContainerToWindow];
  if (v4 && (v63 & 1) == 0)
  {
    v64 = [v56 topAnchor];
    v65 = [v4 bottomAnchor];
    v66 = [v64 constraintEqualToAnchor:v65];
    [v66 setActive:1];
  }
  v67 = [v56 bottomAnchor];
  v68 = [v37 topAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  [v69 setActive:1];
}

- (void)_setupVirtualNavigationBarConstraints
{
  id v9 = [(RCPlaybackView *)self virtualNavigationToolbar];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v3 = [v9 leadingAnchor];
  objc_super v4 = [(RCPlaybackView *)self leadingAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4];
  [v5 setActive:1];

  double v6 = [v9 trailingAnchor];
  double v7 = [(RCPlaybackView *)self trailingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  [(RCPlaybackView *)self _constrainVirtualNavigationToolbarToWindowIfNeeded];
}

- (void)_setupShuttleBarConstraints
{
  BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v3 playbackViewControlSectionHeight];
  double v5 = v4;

  [(RCPlaybackView *)self _shuttleBarWidth];
  double v7 = v6;
  id v16 = [(RCRecordingView *)self shuttleBar];
  [v16 setCenterClusterWidthCard:v7];
  [v16 setIntrinsicHeight:v5];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v8 = [v16 centerXAnchor];
  id v9 = [(RCRecordingView *)self bottomControlsContainerView];
  double v10 = [v9 centerXAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  double v12 = [v16 bottomAnchor];
  double v13 = [(RCRecordingView *)self bottomControlsContainerView];
  long long v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];
}

- (void)_constrainDescriptionContainerViewToVirtualNavigationBar
{
  id v10 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v10 playbackViewTopPadding];
  double v4 = v3;
  double v5 = [(RCPlaybackView *)self descriptionContainerView];
  double v6 = [v5 topAnchor];
  double v7 = [(RCPlaybackView *)self virtualNavigationToolbar];
  double v8 = [v7 bottomAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8 constant:v4];
  [v9 setActive:1];
}

- (void)_constrainBottomControlsContainerViewToWindowIfNeeded
{
  double v3 = [(RCPlaybackView *)self window];
  id v10 = [v3 safeAreaLayoutGuide];

  double v4 = [(RCPlaybackView *)self bottomControlsContainerViewBottomConstraint];

  if (!v4 && v10)
  {
    double v5 = [(RCRecordingView *)self bottomControlsContainerView];
    double v6 = [v5 bottomAnchor];
    double v7 = [v10 bottomAnchor];
    double v8 = [v6 constraintEqualToAnchor:v7];
    [(RCPlaybackView *)self setBottomControlsContainerViewBottomConstraint:v8];

    id v9 = [(RCPlaybackView *)self bottomControlsContainerViewBottomConstraint];
    [v9 setActive:1];
  }
}

- (void)_constrainVirtualNavigationToolbarToWindowIfNeeded
{
  double v3 = [(RCPlaybackView *)self window];
  id v13 = [v3 safeAreaLayoutGuide];

  double v4 = [(RCPlaybackView *)self virtualNavigationToolbarTopConstraint];

  double v5 = v13;
  if (!v4 && v13)
  {
    double v6 = +[RCRecorderStyleProvider sharedStyleProvider];
    double v7 = [(RCPlaybackView *)self virtualNavigationToolbar];
    if ([v6 showsVirtualNavBarInPlaybackView])
    {
      double v8 = [v7 superview];

      if (v8)
      {
        id v9 = [v7 topAnchor];
        id v10 = [v13 topAnchor];
        id v11 = [v9 constraintEqualToAnchor:v10];
        [(RCPlaybackView *)self setVirtualNavigationToolbarTopConstraint:v11];

        double v12 = [(RCPlaybackView *)self virtualNavigationToolbarTopConstraint];
        [v12 setActive:1];
      }
    }

    double v5 = v13;
  }
}

- (void)_constrainCenterContentContainerViewToWindowIfNeeded
{
  double v3 = [(RCPlaybackView *)self window];
  id v15 = [v3 safeAreaLayoutGuide];

  unsigned int v4 = [(RCPlaybackView *)self _shouldConstrainCenterContentContainerToWindow];
  double v5 = [(RCPlaybackView *)self centerContentContainerTopAnchorToWindowConstraint];

  double v6 = v15;
  if (v4 && !v5 && v15)
  {
    double v7 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v7 playbackViewTopPadding];
    double v9 = v8;

    id v10 = [(RCRecordingView *)self centerContentContainerView];
    id v11 = [v10 topAnchor];
    double v12 = [v15 topAnchor];
    id v13 = [v11 constraintEqualToAnchor:v12 constant:v9];
    [(RCPlaybackView *)self setCenterContentContainerTopAnchorToWindowConstraint:v13];

    long long v14 = [(RCPlaybackView *)self centerContentContainerTopAnchorToWindowConstraint];
    [v14 setActive:1];

    double v6 = v15;
  }
}

- (void)_createOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint
{
  double v3 = [(RCPlaybackView *)self window];
  id v12 = [v3 safeAreaLayoutGuide];

  unsigned int v4 = [(RCPlaybackView *)self overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint];

  if (!v4 && v12)
  {
    double v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v5 recordingViewExpandedTranscriptAdditionalSpaceBetweenOverviewAndTimeLabel];
    double v7 = v6;

    double v8 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
    double v9 = [v8 bottomAnchor];
    id v10 = [v12 bottomAnchor];
    id v11 = [v9 constraintEqualToAnchor:v10 constant:-v7];
    [(RCPlaybackView *)self setOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint:v11];
  }
}

- (BOOL)_shouldConstrainCenterContentContainerToWindow
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  char v3 = [v2 presentsTitleAndAdditionalEditingControlsInPlaybackCard] ^ 1;

  return v3;
}

- (void)didMoveToWindow
{
  char v3 = [(RCPlaybackView *)self window];

  if (v3)
  {
    [(RCPlaybackView *)self _constrainViewsToWindowIfNeeded];
  }
  else
  {
    [(RCPlaybackView *)self _clearWindowConstraints];
  }
}

- (void)_constrainViewsToWindowIfNeeded
{
  [(RCPlaybackView *)self _constrainBottomControlsContainerViewToWindowIfNeeded];
  [(RCPlaybackView *)self _constrainVirtualNavigationToolbarToWindowIfNeeded];
  [(RCPlaybackView *)self _constrainCenterContentContainerViewToWindowIfNeeded];

  [(RCPlaybackView *)self _createOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint];
}

- (void)_clearWindowConstraints
{
  [(RCPlaybackView *)self setBottomControlsContainerViewBottomConstraint:0];
  [(RCPlaybackView *)self setVirtualNavigationToolbarTopConstraint:0];
  [(RCPlaybackView *)self setCenterContentContainerTopAnchorToWindowConstraint:0];

  [(RCPlaybackView *)self setOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint:0];
}

- (void)_createShuttleBarIfNeeded
{
  char v3 = [(RCRecordingView *)self shuttleBar];
  if (!v3)
  {
    unsigned int v4 = [[RCShuttleBar alloc] initWithShuttleBarStyle:1];
    [(RCRecordingView *)self setShuttleBar:v4];
    [(RCShuttleBar *)v4 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(RCShuttleBar *)v4 setPresentedControlsOptions:0];
    [(RCShuttleBar *)v4 setActionDelegate:self];
    [(RCShuttleBar *)v4 setEnabled:1];
    [(RCPlaybackView *)self updateColors];
    double v5 = [(RCRecordingView *)self bottomControlsContainerView];
    [v5 addSubview:v4];

    [(RCPlaybackView *)self _setupShuttleBarConstraints];
    char v3 = 0;
  }
}

- (void)_classSpecificSyncTranscriptViewState
{
  BOOL v3 = [(RCRecordingView *)self _shouldHideBottomElements];
  BOOL v4 = v3;
  if (v3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  uint64_t v6 = v3 ^ 1;
  double v7 = [(RCPlaybackView *)self bottomControlsContainerViewBottomConstraint];
  [v7 setActive:v6];

  double v8 = [(RCPlaybackView *)self overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint];
  [v8 setActive:v4];

  double v9 = [(RCRecordingView *)self currentTimeLabel];
  [v9 setUserInteractionEnabled:v6];

  id v10 = [(RCRecordingView *)self bottomControlsContainerView];
  [v10 setUserInteractionEnabled:v6];

  id v11 = [(RCRecordingView *)self createTranscriptViewExpansionAnimator];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10009A864;
  v12[3] = &unk_100221D90;
  v12[4] = self;
  *(double *)&v12[5] = v5;
  [v11 addAnimations:v12];
  [v11 startAnimation];
}

- (double)_shuttleBarWidth
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 playbackViewShuttleBarWidth];
  double v4 = v3;

  return v4;
}

- (void)_classSpecificLayout
{
  [(RCPlaybackView *)self frame];
  if (v4 >= 10.0 && v3 >= 10.0)
  {
    uint64_t v6 = [(RCRecordingView *)self shuttleBar];
    [(RCPlaybackView *)self bringSubviewToFront:v6];

    id v7 = [(RCRecordingView *)self progressOverlay];
    [(RCPlaybackView *)self bringSubviewToFront:v7];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)updateToolbarWithLeadingItems:(id)a3 trailingItems:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v7 showsVirtualNavBarInPlaybackView])
  {
    double v8 = [(RCPlaybackView *)self _insertSpacingBetweenElements:v13];
    double v9 = [(RCPlaybackView *)self _insertSpacingBetweenElements:v6];
    id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    id v11 = +[NSMutableArray arrayWithArray:v8];
    [v11 addObject:v10];
    [v11 addObjectsFromArray:v9];
    id v12 = [(RCPlaybackView *)self virtualNavigationToolbar];
    [v12 setItems:v11];
  }
}

- (id)_insertSpacingBetweenElements:(id)a3
{
  id v3 = a3;
  double v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v4 virtualNavBarButtonItemSpacing];
  double v6 = v5;

  id v7 = +[NSMutableArray array];
  if ([v3 count])
  {
    double v8 = 0;
    do
    {
      double v9 = [v3 objectAtIndexedSubscript:v8];
      [v7 addObject:v9];
      if (v8 < (char *)[v3 count] - 1)
      {
        id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
        [v10 setWidth:v6];
        [v7 addObject:v10];
      }
      ++v8;
    }
    while (v8 < [v3 count]);
  }

  return v7;
}

- (void)setSubviewsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [(RCPlaybackView *)self subviews];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setHidden:v3];
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)updateUIForContentUnavailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    [(RCPlaybackView *)self _createShuttleBarIfNeeded];
  }

  [(RCPlaybackView *)self _updateAccessibilityStateForContentUnavailable:v3];
}

- (void)_updateAccessibilityStateForContentUnavailable:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !a3;
  id v6 = [(RCRecordingView *)self currentTimeLabel];
  [v6 setIsAccessibilityElement:v5];

  uint64_t v7 = [(RCRecordingView *)self centerContentContainerView];
  [v7 setAccessibilityElementsHidden:v3];

  double v8 = [(RCRecordingView *)self shuttleBar];
  [v8 setAccessibilityElementsHidden:v3];

  id v9 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
  [v9 setAccessibilityElementsHidden:v3];
}

- (void)updateColors
{
  id v10 = +[RCRecorderStyleProvider sharedStyleProvider];
  BOOL v3 = [v10 beginEndLabelsPlaybackColor];
  double v4 = [(RCRecordingView *)self overviewBeginTimeLabel];
  [v4 setTextColor:v3];

  BOOL v5 = [v10 beginEndLabelsPlaybackColor];
  id v6 = [(RCRecordingView *)self overviewEndTimeLabel];
  [v6 setTextColor:v5];

  uint64_t v7 = [v10 playbackViewBackgroundColor];
  [(RCPlaybackView *)self setBackgroundColor:v7];

  double v8 = [v10 playbackCardTimeLabelFontColor];
  id v9 = [(RCRecordingView *)self currentTimeLabel];
  [v9 setTextColor:v8];

  [(RCPlaybackView *)self updateShuttleBarControlsColor];
}

- (void)updateShuttleBarControlsColor
{
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  BOOL v3 = [v5 transportControlsColorForPlaybackCard];
  double v4 = [(RCRecordingView *)self shuttleBar];
  [v4 setControlsColor:v3];
}

- (void)restyle
{
  [(RCPlaybackView *)self setNeedsLayout];
  [(RCRecordingView *)self _applyDimmingColorToProgressOverlay];
  BOOL v3 = [(RCRecordingView *)self progressOverlay];
  [v3 restyle];

  id v4 = [(RCRecordingView *)self shuttleBar];
  [v4 restyle];
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)isRecentlyDeleted
{
  return self->_isRecentlyDeleted;
}

- (void)setIsRecentlyDeleted:(BOOL)a3
{
  self->_isRecentlyDeleted = a3;
}

- (BOOL)disablesActionButtons
{
  return self->_disablesActionButtons;
}

- (NSLayoutConstraint)centerContentContainerTopAnchorToWindowConstraint
{
  return self->_centerContentContainerTopAnchorToWindowConstraint;
}

- (void)setCenterContentContainerTopAnchorToWindowConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomControlsContainerViewBottomConstraint
{
  return self->_bottomControlsContainerViewBottomConstraint;
}

- (void)setBottomControlsContainerViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)virtualNavigationToolbarTopConstraint
{
  return self->_virtualNavigationToolbarTopConstraint;
}

- (void)setVirtualNavigationToolbarTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint
{
  return self->_overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint;
}

- (void)setOverviewWaveformContainerBottomToWindowSafeAreaBottomConstraint:(id)a3
{
}

- (UIToolbar)virtualNavigationToolbar
{
  return self->_virtualNavigationToolbar;
}

- (void)setVirtualNavigationToolbar:(id)a3
{
}

- (UIBarButtonItem)shareButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareButtonItem);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setShareButtonItem:(id)a3
{
}

- (UIBarButtonItem)deleteOrUndeleteButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteOrUndeleteButtonItem);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setDeleteOrUndeleteButtonItem:(id)a3
{
}

- (UIBarButtonItem)editButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editButtonItem);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setEditButtonItem:(id)a3
{
}

- (UIView)descriptionContainerView
{
  return self->_descriptionContainerView;
}

- (void)setDescriptionContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionContainerView, 0);
  objc_destroyWeak((id *)&self->_editButtonItem);
  objc_destroyWeak((id *)&self->_deleteOrUndeleteButtonItem);
  objc_destroyWeak((id *)&self->_shareButtonItem);
  objc_storeStrong((id *)&self->_virtualNavigationToolbar, 0);
  objc_storeStrong((id *)&self->_overviewWaveformContainerBottomToWindowSafeAreaBottomConstraint, 0);
  objc_storeStrong((id *)&self->_virtualNavigationToolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomControlsContainerViewBottomConstraint, 0);

  objc_storeStrong((id *)&self->_centerContentContainerTopAnchorToWindowConstraint, 0);
}

@end