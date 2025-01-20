@interface YearMonthTransitionView
+ (double)_monthHeaderHeight;
- (BOOL)_canFastSnapshotMonth;
- (BOOL)_canFastSnapshotYear;
- (CGRect)_calculateMonthFrameForYearViewZoom;
- (CGRect)_calculateYearFrameForYearViewZoom;
- (CGRect)_monthFrameForMonthAfter:(id)a3 anchorMonth:(id)a4;
- (CGRect)_monthFrameForMonthBefore:(id)a3 anchorMonth:(id)a4;
- (YearMonthTransitionView)initWithFrame:(CGRect)a3;
- (double)animationDuration;
- (id)_captureImageOfMonthInYearView;
- (id)_createLabelWithFont:(id)a3;
- (id)_getMonthViewMonthContainingDate:(id)a3 hideMonthLabel:(BOOL)a4;
- (id)_getWeekContainingDate:(id)a3 prevDate:(id)a4;
- (id)_setUpMonthViewInMonthViewFrame;
- (void)_animateView:(id)a3 toAlpha:(double)a4;
- (void)_animateView:(id)a3 toBounds:(CGRect)a4;
- (void)_animateView:(id)a3 toFrame:(CGRect)a4;
- (void)_animateView:(id)a3 toPosition:(CGPoint)a4;
- (void)_animateZoomToMonthState;
- (void)_animateZoomToYearState;
- (void)_animationComplete;
- (void)_basicAnimateView:(id)a3 toAlpha:(double)a4 duration:(double)a5;
- (void)_captureImagesForSlidingPiecesFromMonthViewController:(id)a3 selectedDate:(id)a4 calendar:(id)a5;
- (void)_haltAnimations;
- (void)_setToMonthState;
- (void)_setToYearState;
- (void)animateToMonthViewWithCompletion:(id)a3;
- (void)animateToYearViewWithCompletion:(id)a3;
- (void)prepareWithYearViewController:(id)a3 monthViewController:(id)a4 selectedDate:(id)a5 calendar:(id)a6 yearToMonth:(BOOL)a7 paletteView:(id)a8;
@end

@implementation YearMonthTransitionView

- (YearMonthTransitionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)YearMonthTransitionView;
  v3 = -[YearMonthTransitionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(YearMonthTransitionView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (id)_createLabelWithFont:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)UILabel);
  [v5 setFont:v4];

  objc_super v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];

  [(YearMonthTransitionView *)self addSubview:v5];

  return v5;
}

- (void)prepareWithYearViewController:(id)a3 monthViewController:(id)a4 selectedDate:(id)a5 calendar:(id)a6 yearToMonth:(BOOL)a7 paletteView:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v144 = a5;
  id v142 = a8;
  objc_storeStrong((id *)&self->_yearViewController, a3);
  id v141 = a6;
  p_monthViewController = &self->_monthViewController;
  objc_storeStrong((id *)&self->_monthViewController, a4);
  self->_yearToMonth = a7;
  p_paletteView = &self->_paletteView;
  objc_storeStrong((id *)&self->_paletteView, a8);
  if (!a7) {
    [v16 setSuspendEventLoading:1];
  }
  v19 = +[CUIKPreferences sharedPreferences];
  unsigned int v20 = [v19 showWeekNumbers];
  double v21 = 0.0;
  if (v20) {
    double v21 = 4.0;
  }
  self->_monthWeekViewExtent = v21;

  objc_storeStrong((id *)&self->_monthViewController, a4);
  v22 = [(YearMonthTransitionView *)self _getMonthViewMonthContainingDate:v144 hideMonthLabel:1];
  objc_storeStrong((id *)&self->_monthViewInMonthView, v22);
  v23 = [v15 monthViewForCalendarDate:v144];
  objc_storeStrong((id *)&self->_monthViewInYearView, v23);
  [(id)objc_opt_class() _monthHeaderHeight];
  self->_monthHeaderHeight = v24;
  v143 = v15;
  if ([v16 dividedListMode])
  {
    v25 = (UIView *)objc_alloc_init((Class)UIView);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v25;

    [(YearMonthTransitionView *)self bounds];
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
    [(UIView *)self->_backgroundView setAlpha:0.0];
    *(void *)buf = 0;
    uint64_t v145 = 0;
    v27 = [v16 scrollView];
    v28 = [v27 backgroundColor];

    if (([v16 dividedListMode] & 1) != 0
      || ![v28 getWhite:buf alpha:&v145])
    {
      [(UIView *)self->_backgroundView setBackgroundColor:v28];
    }
    else
    {
      self->_backgroundViewMonthAlpha = 1.0 - *(double *)buf;
      v29 = +[UIColor blackColor];
      [(UIView *)self->_backgroundView setBackgroundColor:v29];
    }
    [(YearMonthTransitionView *)self addSubview:self->_backgroundView];
  }
  if ([v16 dividedListMode])
  {
    double v30 = 0.0;
    if (self->_yearToMonth
      && ([(PaletteView *)*p_paletteView frame],
          double v32 = v31,
          v33 = *p_paletteView,
          [(PaletteView *)*p_paletteView frame],
          -[PaletteView sizeThatFits:](v33, "sizeThatFits:", v34, v35),
          v36 > v32))
    {
      double v30 = v32 - v36;
      [(PaletteView *)*p_paletteView layoutSubviews];
      [(InfiniteScrollViewController *)*p_monthViewController viewWillLayoutSubviews];
      v37 = [(CompactWidthMonthViewController *)*p_monthViewController view];
      [v37 layoutSubviews];

      [(CompactMonthViewController *)*p_monthViewController viewDidLayoutSubviews];
      int v38 = 1;
    }
    else
    {
      int v38 = 0;
    }
    [v16 frameOfListView];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    v47 = [v16 view];
    -[YearMonthTransitionView convertRect:fromView:](self, "convertRect:fromView:", v47, v40, v42, v44, v46);
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;

    v56 = [v16 view];
    [v16 frameOfListView];
    createImageViewFromView();
    v57 = (UIView *)objc_claimAutoreleasedReturnValue();
    monthListView = self->_monthListView;
    self->_monthListView = v57;

    -[UIView setFrame:](self->_monthListView, "setFrame:", v49, v51, v53, v55);
    if (v38)
    {
      [(PaletteView *)*p_paletteView setExtraPaletteHeight:v30];
      [(PaletteView *)*p_paletteView layoutSubviews];
      [(PaletteView *)*p_paletteView setExtraPaletteHeight:0.0];
    }
  }
  [v15 monthFrameForCalendarDate:v144 adjustHeightUp:0];
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  v67 = [v15 view];
  -[YearMonthTransitionView convertRect:fromView:](self, "convertRect:fromView:", v67, v60, v62, v64, v66);
  self->_monthInYearViewFrame.origin.x = v68;
  self->_monthInYearViewFrame.origin.y = v69;
  self->_monthInYearViewFrame.size.width = v70;
  self->_monthInYearViewFrame.size.height = v71;

  [v22 monthFrame];
  self->_monthInMonthViewFrame.origin.x = v72;
  self->_monthInMonthViewFrame.origin.y = v73;
  self->_monthInMonthViewFrame.size.width = v74;
  self->_monthInMonthViewFrame.size.height = v75;
  [v15 monthHeaderLocationForCalendarDate:v144];
  double v77 = v76;
  double v79 = v78;
  v80 = [v15 view];
  -[YearMonthTransitionView convertPoint:fromView:](self, "convertPoint:fromView:", v80, v77, v79);
  double v82 = v81;
  double v84 = v83;

  [(YearMonthTransitionView *)self addSubview:v22];
  [v22 monthLabelFrame];
  -[YearMonthTransitionView convertPoint:fromView:](self, "convertPoint:fromView:", v22);
  double v86 = v85;
  double v88 = v87;
  [v22 removeFromSuperview];
  v89 = [v23 headerFont];
  v90 = [(YearMonthTransitionView *)self _createLabelWithFont:v89];

  v91 = +[CompactMonthViewController monthNameFont];
  v92 = [(YearMonthTransitionView *)self _createLabelWithFont:v91];

  uint64_t v93 = [v23 headerFont];
  uint64_t v94 = [v23 monthString];
  v140 = (void *)v93;
  if (v93)
  {
    id v95 = objc_alloc((Class)NSAttributedString);
    v146[0] = NSFontAttributeName;
    v146[1] = NSKernAttributeName;
    v147[0] = v93;
    [v23 headerFontKerning];
    v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v147[1] = v96;
    v97 = +[NSDictionary dictionaryWithObjects:v147 forKeys:v146 count:2];
    id v98 = [v95 initWithString:v94 attributes:v97];

    [v90 setAttributedText:v98];
  }
  else
  {
    v99 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "yearMonthViewHeaderFont is nil. yearMonthView = %@", buf, 0xCu);
    }
    [v90 setText:v94];
  }
  v100 = [v22 monthLabelText];
  [v92 setText:v100];

  uint64_t v138 = v94;
  if ([v23 isCurrentMonth]) {
    CalendarAppTintColor();
  }
  else {
  v101 = +[UIColor labelColor];
  }
  [v90 setTextColor:v101, v138];
  [v92 setTextColor:v101];

  [v90 sizeToFit];
  *(void *)buf = 0;
  uint64_t v145 = 0;
  v102 = [v90 font];
  CTFontGetLanguageAwareOutsets();

  [v90 frame];
  double v104 = v103;
  double v106 = v105;
  double v108 = v107;
  CalInterfaceIsLeftToRight();
  CalCeilToScreenScale();
  [v90 setFrame:v104, v106, v109, ceil(v108 + 0.0 + 0.0)];
  v110 = [v22 monthLabel];
  [v110 frame];
  [v92 setFrame:];
  [v22 monthLabelFrame];
  double v112 = v111;
  double v114 = v113;
  [v92 bounds];
  double v115 = v86 + (v112 - CGRectGetWidth(v149)) * 0.5;
  [v92 bounds];
  double v116 = self->_monthWeekViewExtent + v88 + (v114 - CGRectGetHeight(v150)) * 0.5;
  [v90 bounds];
  double v118 = v117;
  double v120 = v119;
  double v121 = v84 - ceil((0.0 + 0.0) * 0.5);
  if (EKUICurrentWindowSizeParadigmForViewHierarchy() != 16) {
    double v121 = v121 + -0.5;
  }
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    v151.origin.x = v82;
    v151.origin.y = v121;
    v151.size.width = v118;
    v151.size.height = v120;
    double v82 = v82 - CGRectGetWidth(v151);
  }
  [v92 bounds];
  double v123 = v122;
  double v125 = v124;
  [v90 frame];
  v126 = createImageViewFromView();
  v127 = [objc_alloc((Class)CrossFadeView) initWithStartView:v92 endView:v126 startFrame:v115 endFrame:v116 startAlpha:v123 endAlpha:v125 startDelay:v82 endDelay:v121 duration:v118];
  monthLabel = self->_monthLabel;
  self->_monthLabel = v127;

  [(YearMonthTransitionView *)self addSubview:self->_monthLabel];
  v129 = [(UIViewController *)self->_yearViewController view];
  [v129 frame];
  self->_yearViewOriginalFrame.origin.x = v130;
  self->_yearViewOriginalFrame.origin.y = v131;
  self->_yearViewOriginalFrame.size.width = v132;
  self->_yearViewOriginalFrame.size.height = v133;

  [v16 setSuspendEventLoading:1];
  v134 = [(YearMonthTransitionView *)self _captureImageOfMonthInYearView];
  monthTransitionViewInYearState = self->_monthTransitionViewInYearState;
  self->_monthTransitionViewInYearState = v134;

  [(YearMonthTransitionView *)self _captureImagesForSlidingPiecesFromMonthViewController:v16 selectedDate:v144 calendar:v141];
  v136 = [(YearMonthTransitionView *)self _setUpMonthViewInMonthViewFrame];
  monthTransitionViewInMonthState = self->_monthTransitionViewInMonthState;
  self->_monthTransitionViewInMonthState = v136;

  [(YearMonthTransitionView *)self addSubview:self->_monthTransitionViewInYearState];
  [(YearMonthTransitionView *)self addSubview:self->_monthTransitionViewInMonthState];
  if (self->_monthBottomSlidingPiece) {
    -[YearMonthTransitionView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
  if (self->_monthBottomSlidingPiece2) {
    -[YearMonthTransitionView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
  [v16 setSuspendEventLoading:0];
  [(YearMonthTransitionView *)self bringSubviewToFront:self->_monthLabel];
  [(YearMonthTransitionView *)self addSubview:self->_monthListView];
}

- (void)animateToMonthViewWithCompletion:(id)a3
{
  id v4 = a3;
  [(YearMonthTransitionView *)self _setToYearState];
  id v5 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  [v5 setAlpha:0.0];

  [(YearMonthTransitionView *)self _animateZoomToMonthState];
  UIAnimationDragCoefficient();
  if (v6 <= 1.5)
  {
    int64_t v8 = 750000000;
  }
  else
  {
    UIAnimationDragCoefficient();
    int64_t v8 = (uint64_t)(v7 * 0.9 * 1000000000.0);
  }
  dispatch_time_t v9 = dispatch_time(0, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001112E0;
  v11[3] = &unk_1001D2F88;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)animateToYearViewWithCompletion:(id)a3
{
  id v4 = a3;
  [(YearMonthTransitionView *)self _setToMonthState];
  id v5 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  [v5 setAlpha:0.0];

  [(YearMonthTransitionView *)self _animateZoomToYearState];
  UIAnimationDragCoefficient();
  if (v6 <= 1.5)
  {
    int64_t v8 = 750000000;
  }
  else
  {
    UIAnimationDragCoefficient();
    int64_t v8 = (uint64_t)(v7 * 0.9 * 1000000000.0);
  }
  dispatch_time_t v9 = dispatch_time(0, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011144C;
  v11[3] = &unk_1001D2F88;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v11);
}

- (double)animationDuration
{
  return 0.75;
}

- (void)_animationComplete
{
  [(YearMonthTransitionView *)self _haltAnimations];
  v3 = [(UIViewController *)self->_yearViewController view];
  [v3 setAlpha:1.0];

  id v4 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  [v4 setAlpha:1.0];

  [(UIView *)self->_monthViewInYearView setHidden:0];
  id v5 = [(UIViewController *)self->_yearViewController view];
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v5 setTransform:v12];

  double x = self->_yearViewOriginalFrame.origin.x;
  double y = self->_yearViewOriginalFrame.origin.y;
  double width = self->_yearViewOriginalFrame.size.width;
  double height = self->_yearViewOriginalFrame.size.height;
  v11 = [(UIViewController *)self->_yearViewController view];
  [v11 setFrame:x, y, width, height];
}

- (void)_setToYearState
{
  [(CrossFadeView *)self->_monthLabel setToEndState];
  [(UIView *)self->_monthViewInYearView setHidden:1];
  v3 = [(UIViewController *)self->_yearViewController view];
  [(YearMonthTransitionView *)self _calculateYearFrameForYearViewZoom];
  scaleViewToFrame();

  p_monthInYearViewFrame = &self->_monthInYearViewFrame;
  scaleViewToFrame();
  scaleViewToFrame();
  id v5 = [(UIViewController *)self->_yearViewController view];
  [v5 setAlpha:1.0];

  [(UIView *)self->_monthTransitionViewInYearState setAlpha:1.0];
  [(UIView *)self->_monthTransitionViewInMonthState setAlpha:0.0];
  double width = self->_monthInYearViewFrame.size.width;
  double v7 = width / width;
  if (width == 0.0) {
    double v7 = 0.0;
  }
  CGFloat x = p_monthInYearViewFrame->origin.x;
  v13.origin.double y = self->_monthInYearViewFrame.origin.y;
  double v9 = v7 * self->_bottomSlidingStartFrame.size.height;
  v13.origin.CGFloat x = p_monthInYearViewFrame->origin.x;
  v13.size.double width = self->_monthInYearViewFrame.size.width;
  v13.size.double height = self->_monthInYearViewFrame.size.height;
  CGFloat MaxY = CGRectGetMaxY(v13);
  scaleViewToFrame();
  scaleViewToFrame();
  if (self->_monthBottomSlidingPiece2)
  {
    v14.origin.CGFloat x = x;
    v14.origin.double y = MaxY;
    v14.size.double width = width;
    v14.size.double height = v9;
    CGRectGetMaxY(v14);
    scaleViewToFrame();
    [(UIView *)self->_monthBottomSlidingPiece2 setAlpha:0.0];
  }
  [(UIView *)self->_monthTopSlidingPiece setAlpha:0.0];
  [(UIView *)self->_monthBottomSlidingPiece setAlpha:0.0];
  [(UIView *)self->_backgroundView setAlpha:0.0];
  [(CompactWidthMonthViewController *)self->_monthViewController updatePalette:self->_paletteView];
  paletteView = self->_paletteView;

  [(PaletteView *)paletteView setAlpha:0.0];
}

- (void)_setToMonthState
{
  [(CrossFadeView *)self->_monthLabel setToStartState];
  [(UIView *)self->_monthViewInYearView setHidden:1];
  v3 = [(UIViewController *)self->_yearViewController view];
  [(YearMonthTransitionView *)self _calculateMonthFrameForYearViewZoom];
  scaleViewToFrame();

  scaleViewToFrame();
  scaleViewToFrame();
  id v4 = [(UIViewController *)self->_yearViewController view];
  [v4 setAlpha:0.0];

  [(UIView *)self->_monthTransitionViewInYearState setAlpha:0.0];
  [(UIView *)self->_monthTransitionViewInMonthState setAlpha:1.0];
  scaleViewToFrame();
  scaleViewToFrame();
  if (self->_monthBottomSlidingPiece2)
  {
    scaleViewToFrame();
    [(UIView *)self->_monthBottomSlidingPiece setAlpha:1.0];
  }
  [(UIView *)self->_monthTopSlidingPiece setAlpha:1.0];
  [(UIView *)self->_monthBottomSlidingPiece setAlpha:1.0];
  [(UIView *)self->_backgroundView setAlpha:self->_backgroundViewMonthAlpha];
  paletteView = self->_paletteView;

  [(PaletteView *)paletteView setAlpha:1.0];
}

- (void)_animateZoomToYearState
{
  v13[17] = _NSConcreteStackBlock;
  v13[18] = 3221225472;
  v13[19] = sub_100111BE8;
  v13[20] = &unk_1001D2740;
  v13[21] = self;
  animateNavigationPreferringFRR();
  monthListView = self->_monthListView;
  if (monthListView)
  {
    [(UIView *)monthListView frame];
    uint64_t v5 = v4;
    [(YearMonthTransitionView *)self frame];
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = 0;
  }
  springAnimationDuration();
  double v9 = v8;
  id v10 = +[SpringFactory sharedFactory];
  v13[10] = _NSConcreteStackBlock;
  v13[11] = 3221225472;
  v13[12] = sub_100111C00;
  v13[13] = &unk_1001D2A18;
  v13[14] = self;
  v13[15] = v5;
  v13[16] = v7;
  v11 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v10 options:v11 factory:0 animations:v9 completion:0.0];

  v13[5] = _NSConcreteStackBlock;
  v13[6] = 3221225472;
  v13[7] = sub_100111DF4;
  v13[8] = &unk_1001D2740;
  v13[9] = self;
  id v12 = navigationAnimationsPreferringFRR();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100111E80;
  v13[3] = &unk_1001D27D8;
  v13[4] = self;
  +[UIView animateWithDuration:327680 delay:v12 options:v13 animations:0.25 completion:0.15];
}

- (void)_animateZoomToMonthState
{
  v22[22] = _NSConcreteStackBlock;
  v22[23] = 3221225472;
  v22[24] = sub_10011216C;
  v22[25] = &unk_1001D2740;
  v22[26] = self;
  animateNavigationPreferringFRR();
  monthListView = self->_monthListView;
  if (monthListView)
  {
    [(UIView *)monthListView frame];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    [(UIView *)self->_monthListView frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(YearMonthTransitionView *)self frame];
    -[UIView setFrame:](self->_monthListView, "setFrame:", v9, v14, v11, v13);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = 0;
  }
  springAnimationDuration();
  double v16 = v15;
  v17 = +[SpringFactory sharedFactory];
  v22[17] = _NSConcreteStackBlock;
  v22[18] = 3221225472;
  v22[19] = sub_100112184;
  v22[20] = &unk_1001D2740;
  v22[21] = self;
  v18 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v17 options:v18 factory:0 animations:v16 completion:0.0];

  v19 = +[SpringFactory sharedFactory];
  v22[10] = _NSConcreteStackBlock;
  v22[11] = 3221225472;
  v22[12] = sub_100112314;
  v22[13] = &unk_1001D2A18;
  v22[14] = self;
  v22[15] = v5;
  v22[16] = v7;
  unsigned int v20 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v19 options:v20 factory:0 animations:0.75 completion:0.0];

  v22[5] = _NSConcreteStackBlock;
  v22[6] = 3221225472;
  v22[7] = sub_100112374;
  v22[8] = &unk_1001D2740;
  v22[9] = self;
  double v21 = navigationAnimationsPreferringFRR();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100112430;
  v22[3] = &unk_1001D27D8;
  v22[4] = self;
  +[UIView animateWithDuration:327680 delay:v21 options:v22 animations:0.25 completion:0.0];
}

- (CGRect)_calculateMonthFrameForYearViewZoom
{
  double x = self->_monthInYearViewFrame.origin.x;
  double y = self->_monthInYearViewFrame.origin.y;
  double height = self->_monthInYearViewFrame.size.height;
  double v5 = self->_monthInMonthViewFrame.origin.x;
  double v6 = self->_monthInMonthViewFrame.origin.y;
  double v7 = self->_monthInMonthViewFrame.size.height;
  [(YearMonthTransitionView *)self _calculateYearFrameForYearViewZoom];
  double v12 = v7 / height;
  if (height == 0.0) {
    double v12 = 0.0;
  }
  double v13 = v12 * v10;
  double v14 = v12 * v11;
  double v15 = v5 - v12 * (x - v8);
  double v16 = v6 - v12 * (y - v9);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)_calculateYearFrameForYearViewZoom
{
  double x = self->_yearViewOriginalFrame.origin.x;
  double y = self->_yearViewOriginalFrame.origin.y;
  double width = self->_yearViewOriginalFrame.size.width;
  double height = self->_yearViewOriginalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_setUpMonthViewInMonthViewFrame
{
  [(YearMonthTransitionMonthView *)self->_monthViewInMonthView monthFrameInMonthView];
  double v4 = v3;
  double v6 = v5;
  id v9 = [objc_alloc((Class)UIView) initWithFrame:v3, v5, v7, v8];
  [v9 setClipsToBounds:1];
  [v9 addSubview:self->_monthViewInMonthView];
  [(YearMonthTransitionMonthView *)self->_monthViewInMonthView frame];
  -[YearMonthTransitionMonthView setFrame:](self->_monthViewInMonthView, "setFrame:", -v4, -v6);

  return v9;
}

- (id)_captureImageOfMonthInYearView
{
  -[UIView convertRect:fromView:](self->_monthViewInYearView, "convertRect:fromView:", self, self->_monthInYearViewFrame.origin.x, self->_monthInYearViewFrame.origin.y, self->_monthInYearViewFrame.size.width, self->_monthInYearViewFrame.size.height);

  return (id)createImageViewFromView();
}

- (void)_captureImagesForSlidingPiecesFromMonthViewController:(id)a3 selectedDate:(id)a4 calendar:(id)a5
{
  id v37 = a5;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSDateComponents);
  id v9 = [v7 date];

  [v8 setMonth:1];
  uint64_t v10 = [v37 dateByAddingComponents:v8 toDate:v9 options:0];
  [v8 setMonth:-1];
  uint64_t v11 = [v37 dateByAddingComponents:v8 toDate:v9 options:0];
  double v12 = [v37 timeZone];
  double v36 = (void *)v10;
  uint64_t v13 = +[EKCalendarDate calendarDateWithDate:v10 timeZone:v12];

  double v14 = [v37 timeZone];
  double v35 = (void *)v11;
  double v15 = +[EKCalendarDate calendarDateWithDate:v11 timeZone:v14];

  double v16 = [(YearMonthTransitionView *)self _getMonthViewMonthContainingDate:v15 hideMonthLabel:0];
  double v34 = (void *)v13;
  v17 = [(YearMonthTransitionView *)self _getMonthViewMonthContainingDate:v13 hideMonthLabel:0];
  [(YearMonthTransitionView *)self _monthFrameForMonthBefore:v16 anchorMonth:self->_monthViewInMonthView];
  [v16 setFrame:];
  [(YearMonthTransitionView *)self _monthFrameForMonthAfter:v17 anchorMonth:self->_monthViewInMonthView];
  [v17 setFrame:];
  if (v16)
  {
    [v16 frame];
    self->_topSlidingStartFrame.origin.double x = v18;
    self->_topSlidingStartFrame.origin.double y = v19;
    self->_topSlidingStartFrame.size.double width = v20;
    self->_topSlidingStartFrame.size.double height = v21;
    objc_storeStrong((id *)&self->_monthTopSlidingPiece, v16);
    [(YearMonthTransitionView *)self addSubview:self->_monthTopSlidingPiece];
  }
  if (v17)
  {
    [v17 frame];
    self->_bottomSlidingStartFrame.origin.double x = v22;
    self->_bottomSlidingStartFrame.origin.double y = v23;
    self->_bottomSlidingStartFrame.size.double width = v24;
    self->_bottomSlidingStartFrame.size.double height = v25;
    objc_storeStrong((id *)&self->_monthBottomSlidingPiece, v17);
    [(YearMonthTransitionView *)self addSubview:self->_monthBottomSlidingPiece];
  }
  [v8 setMonth:2];
  v26 = [v37 dateByAddingComponents:v8 toDate:v9 options:0];
  v27 = [v37 timeZone];
  v28 = +[EKCalendarDate calendarDateWithDate:v26 timeZone:v27];

  v29 = [(YearMonthTransitionView *)self _getMonthViewMonthContainingDate:v28 hideMonthLabel:0];
  if (v29)
  {
    [(YearMonthTransitionView *)self _monthFrameForMonthAfter:v29 anchorMonth:v17];
    [v29 setFrame:];
    [v29 frame];
    self->_bottomSliding2StartFrame.origin.double x = v30;
    self->_bottomSliding2StartFrame.origin.double y = v31;
    self->_bottomSliding2StartFrame.size.double width = v32;
    self->_bottomSliding2StartFrame.size.double height = v33;
    self->_bottomSliding2StartFrame.origin.double y = CGRectGetMaxY(self->_bottomSlidingStartFrame);
    objc_storeStrong((id *)&self->_monthBottomSlidingPiece2, v29);
    [(YearMonthTransitionView *)self addSubview:self->_monthBottomSlidingPiece2];
  }
}

- (void)_haltAnimations
{
  [(CrossFadeView *)self->_monthLabel haltAnimation];
  double v3 = [(YearMonthTransitionView *)self window];
  double v4 = [v3 layer];
  recursiveAnimationRemove();

  double v5 = [(UIViewController *)self->_yearViewController view];
  double v6 = [v5 layer];
  [v6 removeAllAnimations];

  id v7 = [(UIView *)self->_monthTransitionViewInYearState layer];
  [v7 removeAllAnimations];

  id v8 = [(UIView *)self->_monthTransitionViewInMonthState layer];
  [v8 removeAllAnimations];

  id v9 = [(UIView *)self->_monthTopSlidingPiece layer];
  [v9 removeAllAnimations];

  uint64_t v10 = [(UIView *)self->_monthBottomSlidingPiece layer];
  [v10 removeAllAnimations];

  id v11 = [(UIView *)self->_monthBottomSlidingPiece2 layer];
  [v11 removeAllAnimations];
}

- (void)_animateView:(id)a3 toFrame:(CGRect)a4
{
  id v4 = (id)springAnimateViewFrame();
}

- (void)_animateView:(id)a3 toPosition:(CGPoint)a4
{
  id v4 = (id)springAnimateViewPosition();
}

- (void)_animateView:(id)a3 toBounds:(CGRect)a4
{
  id v4 = (id)springAnimateViewBounds();
}

- (void)_animateView:(id)a3 toAlpha:(double)a4
{
  id v4 = (id)springAnimateViewAlpha();
}

- (void)_basicAnimateView:(id)a3 toAlpha:(double)a4 duration:(double)a5
{
  id v7 = a3;
  id v12 = objc_alloc_init((Class)CABasicAnimation);
  [v12 setKeyPath:@"opacity"];
  [v7 alpha];
  id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v12 setFromValue:v8];

  id v9 = +[NSNumber numberWithDouble:a4];
  [v12 setToValue:v9];

  UIAnimationDragCoefficient();
  [v12 setDuration:v10 * a5];
  id v11 = [v7 layer];
  [v11 addAnimation:v12 forKey:@"opacity"];

  [v7 setAlpha:a4];
}

- (BOOL)_canFastSnapshotYear
{
  return self->_yearToMonth;
}

- (BOOL)_canFastSnapshotMonth
{
  return !self->_yearToMonth;
}

- (CGRect)_monthFrameForMonthBefore:(id)a3 anchorMonth:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v5 frame];
  double v14 = v13;
  [v6 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v30.origin.double x = v16;
  v30.origin.double y = v18;
  v30.size.double width = v20;
  v30.size.double height = v22;
  double v23 = v14 - CGRectGetHeight(v30);
  [v5 topInset];
  double v25 = v24;

  double v26 = v23 + v25;
  double v27 = v8;
  double v28 = v10;
  double v29 = v12;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v26;
  result.origin.double x = v27;
  return result;
}

- (CGRect)_monthFrameForMonthAfter:(id)a3 anchorMonth:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v5 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v28.origin.double x = v14;
  v28.origin.double y = v16;
  v28.size.double width = v18;
  v28.size.double height = v20;
  double MaxY = CGRectGetMaxY(v28);
  [v6 topInset];
  double v23 = v22;

  double v24 = MaxY - v23;
  double v25 = v8;
  double v26 = v10;
  double v27 = v12;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v24;
  result.origin.double x = v25;
  return result;
}

- (id)_getMonthViewMonthContainingDate:(id)a3 hideMonthLabel:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = objc_opt_new();
  [v7 setClipsToBounds:1];
  v91 = objc_opt_new();
  double v8 = objc_opt_new();
  id v90 = v6;
  double v9 = [v6 calendarDateForMonth];
  id v10 = [v9 copy];

  id v11 = v10;
  double y = CGRectNull.origin.y;
  id v13 = [v11 month];
  id v93 = v11;
  id v95 = self;
  if (v13 == [v11 month])
  {
    CGFloat v14 = 0;
    uint64_t v15 = 0;
    int v92 = !v4;
    uint64_t v16 = -1;
    double v17 = 0.0;
    CGFloat v18 = v11;
    v97 = 0;
    while (1)
    {
      id v98 = v14;
      double v19 = [(InfiniteScrollViewController *)self->_monthViewController subviewForDate:v18];
      CGFloat v20 = v19;
      if (v19)
      {
        [v19 layoutIfNeeded];
        if (v16 < 0)
        {
          [v20 frame];
          double v22 = v21;
          double v24 = v23;
          double v26 = v25;
          double v28 = v27;
          double v29 = [v20 superview];
          -[YearMonthTransitionView convertRect:fromView:](self, "convertRect:fromView:", v29, v22, v24, v26, v28);
          CGFloat v31 = v30;
          CGFloat v33 = v32;
          CGFloat v35 = v34;
          CGFloat v37 = v36;

          v111.origin.double x = v31;
          v111.origin.double y = v33;
          v111.size.double width = v35;
          v111.size.double height = v37;
          if (!CGRectIsNull(v111))
          {
            double y = v33;
            uint64_t v16 = v15;
          }
        }
        [v20 bounds];
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        [v20 setBounds:v38, v40 - self->_monthWeekViewExtent];
        objc_opt_class();
        double v46 = v18;
        if (objc_opt_isKindOfClass()) {
          id v47 = v20;
        }
        else {
          id v47 = 0;
        }
        double v48 = [v47 monthNameLabel];
        unsigned int v49 = [v48 isHidden];

        if ((v92 | v49) == 1)
        {
          double v50 = [v20 snapshotViewAfterScreenUpdates:v95->_yearToMonth];
        }
        else
        {
          double v51 = [v47 monthNameLabel];
          [v51 setHidden:1];

          [v20 bounds];
          double v50 = createSnapshotFromView();
          double v52 = [v47 monthNameLabel];
          [v52 setHidden:0];
        }
        CGFloat v18 = v46;
        [v20 setBounds:v39, v41, v43, v45];
        self = v95;
        if (v50)
        {
          [v20 frame];
          [v50 setFrame:];
          [v91 addObject:v50];
          double v53 = v18;
          [v20 topInset];
          *(float *)&double v54 = v54;
          double v55 = +[NSNumber numberWithFloat:v54];
          [v8 addObject:v55];

          CGFloat v18 = v53;
        }

        id v11 = v93;
      }
      if (!v97)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v97 = 0;
          if (v15) {
            goto LABEL_21;
          }
LABEL_20:
          [v20 topInset];
          double v17 = v56;
          goto LABEL_21;
        }
        v97 = [v20 monthNameLabel];
      }
      if (!v15) {
        goto LABEL_20;
      }
LABEL_21:
      id v57 = v18;

      CGFloat v18 = [(MonthViewController *)self->_monthViewController calendarDateForSubviewBelowSubviewWithCalendarDate:v57];

      ++v15;
      v58 = v57;
      id v59 = [v18 month];
      id v60 = [v11 month];
      CGFloat v14 = v58;
      if (v59 != v60) {
        goto LABEL_26;
      }
    }
  }
  v97 = 0;
  v58 = 0;
  double v17 = 0.0;
  uint64_t v16 = -1;
  CGFloat v18 = v11;
LABEL_26:
  double v61 = v91;
  if ([v91 count])
  {
    double v62 = [v91 firstObject];
    v96 = v58;
    uint64_t v94 = v62;
    if (v62)
    {
      [v62 frame];
      CGRectGetMinY(v112);
    }
    double width = CGRectZero.size.width;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v64 = v91;
    id v65 = [v64 countByEnumeratingWithState:&v104 objects:v109 count:16];
    v99 = v18;
    if (v65)
    {
      id v66 = v65;
      uint64_t v67 = 0;
      uint64_t v68 = *(void *)v105;
      double v69 = 0.0;
      do
      {
        for (i = 0; i != v66; i = (char *)i + 1)
        {
          if (*(void *)v105 != v68) {
            objc_enumerationMutation(v64);
          }
          CGFloat v71 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          [v71 frame];
          [v71 setFrame:];
          if ((uint64_t)i + v67 < v16)
          {
            CGFloat v72 = [v8 objectAtIndex:(char *)i + v67];
            [v72 floatValue];
            double v74 = v73;

            [v71 bounds];
            double v69 = v69 + CGRectGetHeight(v113) - v74;
          }
          [v71 frame];
          double MaxY = CGRectGetMaxY(v114);
          [v71 bounds];
          double v76 = CGRectGetWidth(v115);
          if (v76 >= width) {
            double width = v76;
          }
        }
        id v66 = [v64 countByEnumeratingWithState:&v104 objects:v109 count:16];
        v67 += (uint64_t)i;
      }
      while (v66);
      double v61 = v91;
      id v11 = v93;
    }
    else
    {
      double MaxY = CGRectZero.size.height;
      double v69 = 0.0;
    }

    double v78 = v90;
    v58 = v96;
    if (v16 < 0)
    {
      double x = CGRectZero.origin.x;
      double v79 = CGRectZero.origin.y;
    }
    else
    {
      double v79 = y - v69;
      [v7 setHasValidOrigin:1];
      double x = 0.0;
    }
    if ([(CompactWidthMonthViewController *)v95->_monthViewController dividedListMode])
    {
      [(CompactWidthMonthViewController *)v95->_monthViewController showDateVerticalOffsetForDate:v90];
      double MaxY = MaxY + v81;
    }
    double v82 = [(InfiniteScrollViewController *)v95->_monthViewController scrollView];
    double v83 = [v82 backgroundColor];
    [v7 setBackgroundColor:v83];

    [v7 setTopInset:v17];
    [v7 setFrame:CGRectMake(x, v79, width, MaxY)];
    [v7 setMonthLabel:v97];
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v84 = v64;
    id v85 = [v84 countByEnumeratingWithState:&v100 objects:v108 count:16];
    if (v85)
    {
      id v86 = v85;
      uint64_t v87 = *(void *)v101;
      do
      {
        for (j = 0; j != v86; j = (char *)j + 1)
        {
          if (*(void *)v101 != v87) {
            objc_enumerationMutation(v84);
          }
          [v7 addSubview:*(void *)(*((void *)&v100 + 1) + 8 * (void)j)];
        }
        id v86 = [v84 countByEnumeratingWithState:&v100 objects:v108 count:16];
      }
      while (v86);
    }

    [v7 setWeekViews:v84];
    id v77 = v7;

    CGFloat v18 = v99;
  }
  else
  {
    id v77 = 0;
    double v78 = v90;
  }

  return v77;
}

- (id)_getWeekContainingDate:(id)a3 prevDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  monthViewController = self->_monthViewController;
  if (v7)
  {
    id v9 = [(CompactWidthMonthViewController *)monthViewController newBottomViewBelowViewWithCalendarDate:v7];
  }
  else
  {
    id v9 = [(CompactWidthMonthViewController *)monthViewController createInitialViewForDate:v6];
  }
  id v10 = v9;
  [v9 sizeToFit];
  [v10 bounds];
  if (fabs(CGRectGetWidth(v18)) < 2.22044605e-16)
  {
    [v10 frame];
    double v12 = v11;
    double v14 = v13;
    [(YearMonthTransitionView *)self bounds];
    double Width = CGRectGetWidth(v19);
    [v10 bounds];
    [v10 setFrame:v12, v14, Width, CGRectGetWidth(v20)];
  }
  [v10 layoutIfNeeded];

  return v10;
}

+ (double)_monthHeaderHeight
{
  +[CompactMonthWeekView headerHeight];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthListView, 0);
  objc_storeStrong((id *)&self->_yearInMonthCoveringView, 0);
  objc_storeStrong((id *)&self->_monthViewInYearView, 0);
  objc_storeStrong((id *)&self->_monthViewInMonthView, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_monthViewController, 0);
  objc_storeStrong((id *)&self->_yearViewController, 0);
  objc_storeStrong((id *)&self->_monthLabel, 0);
  objc_storeStrong((id *)&self->_monthBottomSlidingPiece2, 0);
  objc_storeStrong((id *)&self->_monthBottomSlidingPiece, 0);
  objc_storeStrong((id *)&self->_monthTopSlidingPiece, 0);
  objc_storeStrong((id *)&self->_monthTransitionViewInMonthState, 0);
  objc_storeStrong((id *)&self->_monthTransitionViewInYearState, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end