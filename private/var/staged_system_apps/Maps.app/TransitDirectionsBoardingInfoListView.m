@interface TransitDirectionsBoardingInfoListView
+ (id)defaultFinalButtonTitle;
- (BOOL)_shouldIncludeEntry:(id)a3;
- (CGPoint)_targetContentOffsetForView:(id)a3;
- (TransitDirectionsBoardingInfoListView)initWithFrame:(CGRect)a3;
- (double)_contentBottomAnchorAdjustment;
- (id)_closestViewToPoint:(CGPoint)a3 fromEdge:(unint64_t)a4;
- (id)_scrollView;
- (id)_viewForEntry:(id)a3;
- (id)_viewForInstruction:(id)a3;
- (void)_applyUpdatedInfoViewsIfNeeded:(id)a3;
- (void)_dropPastDepartures;
- (void)_processUpcomingInfoViews:(id)a3;
- (void)_rebuildListView;
- (void)_refreshAllInfoViews;
- (void)_updateFixedWidthConstraints;
- (void)layoutSubviews;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBoardingInfo:(id)a3;
- (void)setDropPastDepartures:(BOOL)a3;
- (void)setFinalButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setHighlighted:(BOOL)a3;
- (void)setPreboardingStrings:(id)a3;
- (void)setTargetForAnalytics:(int)a3;
@end

@implementation TransitDirectionsBoardingInfoListView

+ (id)defaultFinalButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Transit Boarding Info] More" value:@"localized string not found" table:0];

  return v3;
}

- (double)_contentBottomAnchorAdjustment
{
  if (sub_1000BBB44(self) == 5) {
    +[UIFont system15];
  }
  else {
  v2 = +[UIFont system17];
  }
  [v2 descender];
  double v4 = v3;

  return v4;
}

- (TransitDirectionsBoardingInfoListView)initWithFrame:(CGRect)a3
{
  v48.receiver = self;
  v48.super_class = (Class)TransitDirectionsBoardingInfoListView;
  double v3 = -[TransitDirectionsBoardingInfoListView initWithFrame:](&v48, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(TransitDirectionsBoardingInfoListView *)v3 setAccessibilityIdentifier:v5];

    uint64_t v6 = [(id)objc_opt_class() defaultFinalButtonTitle];
    buttonTitle = v3->_buttonTitle;
    v3->_buttonTitle = (NSString *)v6;

    v3->_scrollBehavior = 1;
    v8 = [objc_alloc((Class)UIScrollView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    scrollView = v3->_scrollView;
    v3->_scrollView = v8;

    [(UIScrollView *)v3->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)v3->_scrollView setDelegate:v3];
    [(UIScrollView *)v3->_scrollView setDirectionalLockEnabled:1];
    [(UIScrollView *)v3->_scrollView setAlwaysBounceVertical:0];
    [(UIScrollView *)v3->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v3->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v3->_scrollView setClipsToBounds:0];
    LODWORD(v10) = 1148846080;
    [(UIScrollView *)v3->_scrollView setContentCompressionResistancePriority:1 forAxis:v10];
    [(TransitDirectionsBoardingInfoListView *)v3 addSubview:v3->_scrollView];
    v11 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:&__NSArray0__struct];
    stackView = v3->_stackView;
    v3->_stackView = v11;

    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView setAxis:0];
    [(UIStackView *)v3->_stackView setAlignment:1];
    [(UIStackView *)v3->_stackView setDistribution:3];
    uint64_t v13 = sub_1000BBB44(v3);
    double v14 = 32.0;
    if (v13 == 5) {
      double v14 = 0.0;
    }
    [(UIStackView *)v3->_stackView setSpacing:v14];
    LODWORD(v15) = 1132068864;
    [(UIStackView *)v3->_stackView setContentHuggingPriority:0 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [(UIStackView *)v3->_stackView setContentHuggingPriority:1 forAxis:v16];
    LODWORD(v17) = 1132068864;
    [(UIStackView *)v3->_stackView setContentCompressionResistancePriority:0 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(UIStackView *)v3->_stackView setContentCompressionResistancePriority:1 forAxis:v18];
    [(UIScrollView *)v3->_scrollView addSubview:v3->_stackView];
    v47 = [(UIScrollView *)v3->_scrollView topAnchor];
    v46 = [(TransitDirectionsBoardingInfoListView *)v3 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v49[0] = v45;
    v44 = [(UIScrollView *)v3->_scrollView leadingAnchor];
    v43 = [(TransitDirectionsBoardingInfoListView *)v3 leadingAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v49[1] = v42;
    v41 = [(UIScrollView *)v3->_scrollView bottomAnchor];
    v40 = [(TransitDirectionsBoardingInfoListView *)v3 bottomAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v49[2] = v39;
    v38 = [(UIScrollView *)v3->_scrollView trailingAnchor];
    v37 = [(TransitDirectionsBoardingInfoListView *)v3 trailingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v49[3] = v36;
    v35 = [(UIStackView *)v3->_stackView topAnchor];
    v34 = [(UIScrollView *)v3->_scrollView topAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v49[4] = v33;
    v32 = [(UIStackView *)v3->_stackView bottomAnchor];
    v31 = [(UIScrollView *)v3->_scrollView bottomAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v49[5] = v30;
    v29 = [(UIStackView *)v3->_stackView leadingAnchor];
    v19 = [(UIScrollView *)v3->_scrollView leadingAnchor];
    v20 = [v29 constraintEqualToAnchor:v19];
    v49[6] = v20;
    v21 = [(UIStackView *)v3->_stackView trailingAnchor];
    v22 = [(UIScrollView *)v3->_scrollView trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v49[7] = v23;
    v24 = [(UIScrollView *)v3->_scrollView heightAnchor];
    v25 = [(UIStackView *)v3->_stackView heightAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v49[8] = v26;
    v27 = +[NSArray arrayWithObjects:v49 count:9];
    +[NSLayoutConstraint activateConstraints:v27];
  }
  return v3;
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBoardingInfoListView;
  [(TransitDirectionsBoardingInfoListView *)&v5 layoutSubviews];
  if (self->_needsResetContentOffset)
  {
    self->_needsResetContentOffset = 0;
    [(UIStackView *)self->_stackView setNeedsLayout];
    [(UIStackView *)self->_stackView layoutIfNeeded];
    double v3 = [(UIStackView *)self->_stackView arrangedSubviews];
    double v4 = [v3 firstObject];
    [(TransitDirectionsBoardingInfoListView *)self _targetContentOffsetForView:v4];
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:");
  }
}

- (void)setBoardingInfo:(id)a3
{
  id v5 = a3;
  boardingInfo = self->_boardingInfo;
  unint64_t v10 = (unint64_t)v5;
  id v7 = boardingInfo;
  if (v10 | (unint64_t)v7
    && (unsigned int v8 = [(id)v10 isEqual:v7], v7, (id)v10, !v8))
  {
    objc_storeStrong((id *)&self->_boardingInfo, a3);
    preboardingStrings = self->_preboardingStrings;
    self->_preboardingStrings = 0;

    [(TransitDirectionsBoardingInfoListView *)self _rebuildListView];
  }
  else if (self->_boardingInfo)
  {
    [(TransitDirectionsBoardingInfoListView *)self _dropPastDepartures];
    [(TransitDirectionsBoardingInfoListView *)self _refreshAllInfoViews];
  }
}

- (void)setPreboardingStrings:(id)a3
{
  id v5 = a3;
  preboardingStrings = self->_preboardingStrings;
  unint64_t v10 = (unint64_t)v5;
  id v7 = preboardingStrings;
  if (v10 | (unint64_t)v7
    && (unsigned int v8 = [(id)v10 isEqual:v7], v7, (id)v10, !v8))
  {
    objc_storeStrong((id *)&self->_preboardingStrings, a3);
    boardingInfo = self->_boardingInfo;
    self->_boardingInfo = 0;

    [(TransitDirectionsBoardingInfoListView *)self _rebuildListView];
  }
  else if (self->_preboardingStrings)
  {
    [(TransitDirectionsBoardingInfoListView *)self _refreshAllInfoViews];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(UIStackView *)self->_stackView arrangedSubviews];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      unsigned int v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v12 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v10 = v9;
        }
        else {
          unint64_t v10 = 0;
        }
        id v11 = v10;

        [v11 setHighlighted:v3];
        unsigned int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_dropPastDepartures
{
  id v3 = objc_alloc((Class)NSMutableArray);
  double v4 = [(UIStackView *)self->_stackView arrangedSubviews];
  id v5 = [v3 initWithArray:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(UIStackView *)self->_stackView arrangedSubviews];
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
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = [v11 entry];

        if (v12)
        {
          long long v13 = [v11 entry];
          unsigned __int8 v14 = [(TransitDirectionsBoardingInfoListView *)self _shouldIncludeEntry:v13];

          if ((v14 & 1) == 0)
          {
            [v5 removeObject:v11];
            [(UIStackView *)self->_stackView removeArrangedSubview:v11];
            [v11 removeFromSuperview];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(TransitDirectionsBoardingInfoListView *)self _processUpcomingInfoViews:v5];
  [(TransitDirectionsBoardingInfoListView *)self _applyUpdatedInfoViewsIfNeeded:v5];
}

- (BOOL)_shouldIncludeEntry:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dropsPastDepartures)
  {
    if ([v4 hasExpectedDepartureTime])
    {
      id v6 = +[MKTransitItemReferenceDateUpdater referenceDate];
      id v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)[v5 expectedDepartureTime]);
      [v7 timeIntervalSinceDate:v6];
      double v9 = v8;
      char IsImminentDepartureTimeInterval = GEOTransitDepartureIsImminentDepartureTimeInterval();
      if (v9 >= 0.0) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = IsImminentDepartureTimeInterval;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (id)_viewForEntry:(id)a3
{
  id v4 = a3;
  id v5 = -[TransitDirectionsBoardingInfoView initWithFrame:]([TransitDirectionsBoardingInfoView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if ([v4 hasClearExitPlanInfo]
    && ([v4 clearExitPlanInfo] & 1) != 0)
  {
    id v6 = 0;
  }
  else
  {
    if ([v4 hasExitPlanInfoOverride]) {
      [v4 exitPlanInfoOverride];
    }
    else {
    id v6 = [(GEOTransitBoardingInfo *)self->_boardingInfo exitPlanInfo];
    }
  }
  [(TransitDirectionsBoardingInfoView *)v5 setBoardingInfoEntry:v4 exitPlan:v6];

  return v5;
}

- (id)_viewForInstruction:(id)a3
{
  id v3 = a3;
  id v4 = -[TransitDirectionsBoardingInfoView initWithFrame:]([TransitDirectionsBoardingInfoView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  if ([v3 hasPrimaryText])
  {
    id v6 = objc_alloc((Class)GEOComposedString);
    id v7 = [v3 primaryText];
    id v8 = [v6 initWithGeoFormattedString:v7];
    [v5 addObject:v8];
  }
  if ([v3 hasSecondaryText])
  {
    id v9 = objc_alloc((Class)GEOComposedString);
    unint64_t v10 = [v3 secondaryText];
    id v11 = [v9 initWithGeoFormattedString:v10];
    [v5 addObject:v11];
  }
  id v12 = [v5 copy];
  [(TransitDirectionsBoardingInfoView *)v4 setPreboardingStrings:v12];

  return v4;
}

- (void)_rebuildListView
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  boardingInfo = self->_boardingInfo;
  if (boardingInfo)
  {
    id v5 = [(GEOTransitBoardingInfo *)boardingInfo entrys];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(TransitDirectionsBoardingInfoView *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if ([(TransitDirectionsBoardingInfoListView *)self _shouldIncludeEntry:v10])
          {
            id v11 = [(TransitDirectionsBoardingInfoListView *)self _viewForEntry:v10];
            [v3 addObject:v11];
          }
        }
        id v7 = [(TransitDirectionsBoardingInfoView *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    goto LABEL_14;
  }
  if (self->_preboardingStrings)
  {
    id v5 = -[TransitDirectionsBoardingInfoView initWithFrame:]([TransitDirectionsBoardingInfoView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(TransitDirectionsBoardingInfoView *)v5 setPreboardingStrings:self->_preboardingStrings];
    [v3 addObject:v5];
LABEL_14:
  }
  [(TransitDirectionsBoardingInfoListView *)self _processUpcomingInfoViews:v3];
  [(TransitDirectionsBoardingInfoListView *)self _applyUpdatedInfoViewsIfNeeded:v3];
}

- (void)_processUpcomingInfoViews:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSSet);
  id v6 = sub_100099700(v4, &stru_101318390);
  id v7 = [v5 initWithArray:v6];

  if (![v7 count]
    && [(GEOTransitBoardingInfo *)self->_boardingInfo hasSummaryTimeInstruction])
  {
    uint64_t v8 = +[GEOPlatform sharedPlatform];
    if ([v8 isInternalInstall])
    {
      id v9 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v10 = [v9 BOOLForKey:@"__internal_MapsTransitDebugSuppressSummaryBoardingInfo"];

      if (v10)
      {
        if (![v4 count]) {
          goto LABEL_13;
        }
LABEL_8:
        if (![(GEOTransitBoardingInfo *)self->_boardingInfo hasEndTimeInstruction])goto LABEL_15; {
        id v11 = [v4 lastObject];
        }
        id v12 = [v11 entryType];

        if (v12 == (id)2) {
          goto LABEL_15;
        }
        long long v13 = [(GEOTransitBoardingInfo *)self->_boardingInfo endTimeInstruction];
        long long v14 = [(TransitDirectionsBoardingInfoListView *)self _viewForInstruction:v13];

        [v14 setEntryType:2];
        goto LABEL_14;
      }
    }
    else
    {
    }
    long long v15 = [(GEOTransitBoardingInfo *)self->_boardingInfo summaryTimeInstruction];
    long long v16 = [(TransitDirectionsBoardingInfoListView *)self _viewForInstruction:v15];
    [v16 setEntryType:1];
    [v4 removeAllObjects];
    [v4 addObject:v16];

    if ([v4 count]) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if ([v4 count]) {
    goto LABEL_8;
  }
LABEL_13:
  long long v17 = [(GEOTransitBoardingInfo *)self->_boardingInfo entrys];
  long long v18 = [v17 firstObject];
  long long v14 = [(TransitDirectionsBoardingInfoListView *)self _viewForEntry:v18];

LABEL_14:
  [v4 addObject:v14];

LABEL_15:
  id v19 = [v7 count];
  if ([v4 count]) {
    v20 = (char *)[v4 count] - 1;
  }
  else {
    v20 = 0;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100B206B0;
  v21[3] = &unk_1013183B8;
  BOOL v22 = (unint64_t)v19 > 1;
  v21[4] = self;
  v21[5] = v20;
  [v4 enumerateObjectsUsingBlock:v21];
}

- (void)_applyUpdatedInfoViewsIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(UIStackView *)self->_stackView arrangedSubviews];
  unint64_t v8 = (unint64_t)v4;
  unint64_t v6 = v5;
  if (v8 | v6)
  {
    unsigned __int8 v7 = [(id)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(UIStackView *)self->_stackView _maps_setArrangedSubviews:v8];
      [(TransitDirectionsBoardingInfoListView *)self _updateFixedWidthConstraints];
      -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", (unint64_t)[(id)v8 count] > 1);
      self->_needsResetContentOffset = 1;
      [(TransitDirectionsBoardingInfoListView *)self setNeedsLayout];
    }
  }
}

- (void)setDropPastDepartures:(BOOL)a3
{
  if (self->_dropsPastDepartures != a3)
  {
    self->_dropsPastDepartures = a3;
    [(TransitDirectionsBoardingInfoListView *)self _rebuildListView];
  }
}

- (void)_refreshAllInfoViews
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UIStackView *)self->_stackView arrangedSubviews];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      unint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) _refreshContent];
        unint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setFinalButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  long long v8 = (NSString *)a3;
  id obj = a4;
  buttonTitle = self->_buttonTitle;
  self->_buttonTitle = v8;
  long long v10 = v8;

  objc_storeWeak(&self->_buttonTarget, obj);
  if (a5) {
    id v11 = a5;
  }
  else {
    id v11 = 0;
  }
  self->_buttonAction = v11;
  id v12 = [(UIStackView *)self->_stackView arrangedSubviews];
  long long v13 = [v12 lastObject];

  [v13 setButtonTitle:v10 target:obj action:a5];
}

- (void)_updateFixedWidthConstraints
{
  id v3 = [(UIStackView *)self->_stackView arrangedSubviews];
  id v4 = [v3 count];

  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
  BOOL v6 = sub_1000BBB44(self) == 5;
  long long v7 = [(UIStackView *)self->_stackView arrangedSubviews];
  long long v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100B20BE8;
  id v12 = &unk_1013183E0;
  BOOL v16 = v6;
  id v14 = v5;
  id v15 = v4;
  long long v13 = self;
  id v8 = v5;
  [v7 enumerateObjectsUsingBlock:&v9];

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8, v9, v10, v11, v12, v13);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (self->_scrollBehavior == 1)
  {
    [a3 contentOffset];
    -[TransitDirectionsBoardingInfoListView _closestViewToPoint:fromEdge:](self, "_closestViewToPoint:fromEdge:", 0);
    id v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    closestViewWhenDragBegan = self->_closestViewWhenDragBegan;
    self->_closestViewWhenDragBegan = v4;
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  double v8 = a5->x;
  double y = a5->y;
  unsigned int v10 = [(TransitDirectionsBoardingInfoListView *)self _mapkit_isRTL];
  unint64_t scrollBehavior = self->_scrollBehavior;
  if (scrollBehavior == 1)
  {
    unsigned int v18 = [(UIStackView *)self->_stackView _mapkit_isRTL];
    id v19 = [(UIStackView *)self->_stackView arrangedSubviews];
    v20 = v19;
    if (v18)
    {
      v21 = [v19 reverseObjectEnumerator];
      uint64_t v22 = [v21 allObjects];

      v20 = (void *)v22;
    }
    v23 = (char *)[v20 indexOfObject:self->_closestViewWhenDragBegan];
    if (v23 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      long long v13 = 0;
    }
    else
    {
      v24 = v23;
      if (x < 0.0 || v23 >= (char *)[v20 count] - 1)
      {
        uint64_t v27 = x < 0.0 && v24 != 0;
        uint64_t v25 = v27 << 63 >> 63;
      }
      else
      {
        uint64_t v25 = 1;
      }
      long long v13 = [v20 objectAtIndexedSubscript:&v24[v25]];
    }
    closestViewWhenDragBegan = self->_closestViewWhenDragBegan;
    self->_closestViewWhenDragBegan = 0;

    if (v13) {
      goto LABEL_7;
    }
  }
  else if (!scrollBehavior)
  {
    uint64_t v12 = x < 0.0 ? 2 : 8;
    long long v13 = -[TransitDirectionsBoardingInfoListView _closestViewToPoint:fromEdge:](self, "_closestViewToPoint:fromEdge:", v12, v8, y);
    if (v13)
    {
LABEL_7:
      [(TransitDirectionsBoardingInfoListView *)self _targetContentOffsetForView:v13];
      a5->double x = v14;
      a5->double y = v15;
    }
  }
  double v16 = -x;
  if (!v10) {
    double v16 = x;
  }
  if (v16 < 0.0) {
    uint64_t v17 = 227;
  }
  else {
    uint64_t v17 = 236;
  }
  id v29 = +[MKMapService sharedService];
  [v29 captureUserAction:v17 onTarget:self->_targetForAnalytics eventValue:0];
}

- (CGPoint)_targetContentOffsetForView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 frame];
    double x = v6;
    CGFloat y = v8;
    if ([(UIStackView *)self->_stackView _mapkit_isRTL])
    {
      [(UIScrollView *)self->_scrollView bounds];
      double Width = CGRectGetWidth(v17);
      [v5 bounds];
      double v11 = Width - CGRectGetWidth(v18);
      double v12 = 0.0;
      if (v11 >= 0.0)
      {
        [(UIScrollView *)self->_scrollView bounds];
        double v13 = CGRectGetWidth(v19);
        [v5 bounds];
        double v12 = v13 - CGRectGetWidth(v20);
      }
      double x = x - v12;
    }
  }
  else
  {
    double x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
  }

  double v14 = x;
  double v15 = y;
  result.CGFloat y = v15;
  result.double x = v14;
  return result;
}

- (id)_closestViewToPoint:(CGPoint)a3 fromEdge:(unint64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (a4 == 8 || a4 == 2) {
    unint64_t v8 = a4;
  }
  else {
    unint64_t v8 = 8;
  }
  unsigned int v9 = [(UIStackView *)self->_stackView _mapkit_isRTL];
  if (v8 == 8) {
    int v10 = v9;
  }
  else {
    int v10 = 1;
  }
  if (v8 == 2) {
    unsigned int v11 = v9;
  }
  else {
    unsigned int v11 = 0;
  }
  double v12 = [(UIStackView *)self->_stackView arrangedSubviews];
  double v13 = v12;
  if (v10 == 1 && v11 == 0) {
    [v12 reverseObjectEnumerator];
  }
  else {
  double v15 = [v12 objectEnumerator];
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    id v18 = v17;
    id v19 = 0;
    uint64_t v20 = *(void *)v31;
LABEL_21:
    v21 = 0;
    uint64_t v22 = v19;
    while (1)
    {
      if (*(void *)v31 != v20) {
        objc_enumerationMutation(v16);
      }
      id v19 = *(id *)(*((void *)&v30 + 1) + 8 * (void)v21);

      [v19 frame:v30];
      double v23 = v37.origin.x;
      CGFloat v24 = v37.origin.y;
      CGFloat width = v37.size.width;
      CGFloat height = v37.size.height;
      double v27 = CGRectGetWidth(v37) * 0.349999994;
      double v28 = -v27;
      if (v8 != 8) {
        double v28 = v27;
      }
      v38.origin.CGFloat x = v23 + v28;
      v38.origin.CGFloat y = v24;
      v38.size.CGFloat width = width;
      v38.size.CGFloat height = height;
      v36.CGFloat x = x;
      v36.CGFloat y = y;
      if (CGRectContainsPoint(v38, v36)) {
        break;
      }
      v21 = (char *)v21 + 1;
      uint64_t v22 = v19;
      if (v18 == v21)
      {
        id v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v18) {
          goto LABEL_21;
        }
        break;
      }
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)setTargetForAnalytics:(int)a3
{
  self->_targetForAnalytics = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_buttonTarget);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_preboardingStrings, 0);
  objc_storeStrong((id *)&self->_boardingInfo, 0);
  objc_storeStrong((id *)&self->_closestViewWhenDragBegan, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end