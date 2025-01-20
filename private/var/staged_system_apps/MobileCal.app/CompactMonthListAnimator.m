@interface CompactMonthListAnimator
- (BOOL)animating;
- (BOOL)reverse;
- (CGPoint)listViewNormalLocation;
- (CGPoint)monthViewSplittingLocation;
- (CGRect)monthSplittingCutOutArea;
- (CGRect)weekDayInitialsMonth;
- (CUIKCalendarModel)model;
- (CompactListViewController)listViewController;
- (CompactMonthListAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5;
- (CompactWidthMonthViewController)monthViewController;
- (PaletteView)paletteView;
- (double)transitionDuration:(id)a3;
- (void)_haltAnimations;
- (void)_terminateAnimationsAfterDelay;
- (void)animateToListWithCompletion:(id)a3 inContext:(id)a4;
- (void)animateToMonthWithCompletion:(id)a3 inContext:(id)a4;
- (void)animateTransition:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setListViewController:(id)a3;
- (void)setListViewNormalLocation:(CGPoint)a3;
- (void)setModel:(id)a3;
- (void)setMonthSplittingCutOutArea:(CGRect)a3;
- (void)setMonthViewController:(id)a3;
- (void)setMonthViewSplittingLocation:(CGPoint)a3;
- (void)setPaletteView:(id)a3;
- (void)setReverse:(BOOL)a3;
- (void)setWeekDayInitialsMonth:(CGRect)a3;
@end

@implementation CompactMonthListAnimator

- (CompactMonthListAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CompactMonthListAnimator;
  v11 = [(CompactMonthListAnimator *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_reverse = a5;
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v12->_paletteView, a4);
    CGSize size = CGRectNull.size;
    v12->_monthSplittingCutOutArea.origin = CGRectNull.origin;
    v12->_monthSplittingCutOutArea.CGSize size = size;
    CGPoint v14 = CGPointZero;
    v12->_listViewNormalLocation = CGPointZero;
    v12->_monthViewSplittingLocation = v14;
  }

  return v12;
}

- (double)transitionDuration:(id)a3
{
  return 0.65;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  v7 = [v5 view];
  uint64_t v8 = [v6 view];
  id v9 = [v4 containerView];
  v44 = (void *)v8;
  if ([(CompactMonthListAnimator *)self reverse]) {
    [v9 addSubview:v8];
  }
  else {
    [v9 insertSubview:v8 belowSubview:v7];
  }
  unsigned int v10 = [(CompactMonthListAnimator *)self reverse];
  BOOL v11 = v10 == 0;
  if (v10) {
    v12 = v6;
  }
  else {
    v12 = v5;
  }
  if (v11) {
    v13 = v6;
  }
  else {
    v13 = v5;
  }
  CGPoint v14 = [v12 currentChildViewController];
  v15 = [v13 currentChildViewController];
  objc_storeStrong((id *)&self->_monthViewController, v14);
  objc_storeStrong((id *)&self->_listViewController, v15);
  [v4 finalFrameForViewController:v6];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [v6 view];
  [v24 setFrame:v17, v19, v21, v23];

  [v6 viewWillLayoutSubviews];
  v25 = [v6 view];
  [v25 layoutSubviews];

  [v6 viewDidLayoutSubviews];
  [(PaletteView *)self->_paletteView layoutSubviews];
  v26 = [(CUIKCalendarModel *)self->_model selectedDate];
  v27 = [v26 date];
  v43 = v9;
  if ([(CompactMonthListAnimator *)self reverse]) {
    [v14 showDate:v27 animated:0];
  }
  else {
    [v15 selectDate:v26 animated:0];
  }
  v28 = [v6 currentChildViewController];

  if (v14 == v28)
  {
    v42 = v7;
    v29 = [(CUIKCalendarModel *)self->_model selectedDate];
    v30 = [v14 subviewForDate:v29];

    if (!v30)
    {
      v31 = [v14 view];
      [v31 layoutBelowIfNeeded];

      v32 = [(CUIKCalendarModel *)self->_model selectedDate];
      v30 = [v14 subviewForDate:v32];
    }
    [v30 layoutSubviews];

    v7 = v42;
  }
  [v14 frameForWeekContainingDate:v27];
  self->_monthSplittingCutOutArea.origin.x = v35;
  self->_monthSplittingCutOutArea.origin.y = v33 + v34;
  self->_monthSplittingCutOutArea.size.width = v36;
  self->_monthSplittingCutOutArea.size.height = 1.0;
  self->_monthViewSplittingLocation = self->_monthSplittingCutOutArea.origin;
  v37 = [(CompactListViewController *)self->_listViewController view];
  [v37 frame];
  self->_listViewNormalLocation.x = v38;
  self->_listViewNormalLocation.y = v39;

  [v14 updatePalette:self->_paletteView];
  [(PaletteView *)self->_paletteView layoutSubviews];
  v40 = [(PaletteView *)self->_paletteView dayInitialsHeaderView];
  [v40 frame];
  -[CompactMonthListAnimator setWeekDayInitialsMonth:](self, "setWeekDayInitialsMonth:");

  self->_animating = 1;
  if ([(CompactMonthListAnimator *)self reverse])
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100047EA0;
    v47[3] = &unk_1001D2740;
    v41 = &v48;
    id v48 = v4;
    [(CompactMonthListAnimator *)self animateToMonthWithCompletion:v47 inContext:v4];
  }
  else
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100047F00;
    v45[3] = &unk_1001D2740;
    v41 = &v46;
    id v46 = v4;
    [(CompactMonthListAnimator *)self animateToListWithCompletion:v45 inContext:v4];
  }
}

- (void)_terminateAnimationsAfterDelay
{
  dispatch_time_t v3 = dispatch_time(0, 600000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047FF0;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)animateToListWithCompletion:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  if ([(CompactMonthListAnimator *)self animating]) {
    [(CompactMonthListAnimator *)self _haltAnimations];
  }
  v6 = [(CompactMonthListAnimator *)self monthViewController];
  [(CompactMonthListAnimator *)self monthSplittingCutOutArea];
  [v6 enterAnimationSplitStateWithCutOutArea:topBoundary:];

  v7 = [(CompactMonthListAnimator *)self listViewController];
  uint64_t v8 = [v7 navigationController];
  id v9 = [v8 navigationBar];
  [v9 frame];
  double v11 = v10;

  [(CompactMonthListAnimator *)self monthViewSplittingLocation];
  double v13 = v12;
  double v15 = v14 - v11;
  double v16 = [(CompactMonthListAnimator *)self monthViewController];
  [v16 setSplitStateOpen:0];

  double v17 = [(CompactMonthListAnimator *)self monthViewController];
  double v18 = [v17 view];
  [v18 setAlpha:1.0];

  double v19 = [(CompactMonthListAnimator *)self listViewController];
  double v20 = [v19 view];
  [v20 frame];
  double v22 = v21;
  double v24 = v23;

  v25 = [(CompactMonthListAnimator *)self listViewController];
  v26 = [v25 view];
  [v26 setFrame:v13, v15, v22, v24];

  v27 = [(CompactMonthListAnimator *)self listViewController];
  v28 = [v27 view];
  [v28 setAlpha:0.0];

  springAnimationDuration();
  double v30 = v29;
  v31 = +[SpringFactory sharedFactory];
  v62[5] = _NSConcreteStackBlock;
  v62[6] = 3221225472;
  v62[7] = sub_100048484;
  v62[8] = &unk_1001D2740;
  v62[9] = self;
  v32 = navigationAnimationsPreferringFRR();
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1000485C0;
  v62[3] = &unk_1001D27D8;
  v62[4] = self;
  +[UIView _animateWithDuration:393216 delay:v31 options:v32 factory:v62 animations:v30 completion:0.0];

  [(CompactMonthListAnimator *)self weekDayInitialsMonth];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  v41 = [(CompactMonthListAnimator *)self paletteView];
  v42 = [v41 dayInitialsHeaderView];
  [v42 setFrame:v34, v36, v38, v40];

  v43 = [(CompactMonthListAnimator *)self paletteView];
  v44 = [v43 dayInitialsHeaderView];
  [v44 setAlpha:1.0];

  v45 = [(CompactMonthListAnimator *)self paletteView];
  id v46 = [v45 dateLabel];
  [v46 setHidden:1];

  v47 = [(CompactMonthListAnimator *)self paletteView];
  id v48 = [v47 animatableDateLabel];
  [v48 setAlpha:1.0];

  v49 = [(CompactMonthListAnimator *)self paletteView];
  [v49 setSuppressLayout:1];

  springAnimationDuration();
  double v51 = v50;
  v52 = +[SpringFactory sharedFactory];
  v57 = _NSConcreteStackBlock;
  uint64_t v58 = 3221225472;
  v59 = sub_1000486B4;
  v60 = &unk_1001D2740;
  v61 = self;
  v53 = navigationAnimationsPreferringFRR();
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1000487B8;
  v55[3] = &unk_1001D2F08;
  v55[4] = self;
  id v56 = v5;
  id v54 = v5;
  +[UIView _animateWithDuration:393216 delay:v52 options:v53 factory:v55 animations:v51 completion:0.0];
}

- (void)animateToMonthWithCompletion:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  if ([(CompactMonthListAnimator *)self animating]) {
    [(CompactMonthListAnimator *)self _haltAnimations];
  }
  v6 = [(CompactMonthListAnimator *)self monthViewController];
  [(CompactMonthListAnimator *)self monthSplittingCutOutArea];
  [v6 enterAnimationSplitStateWithCutOutArea:topBoundary:];

  v7 = [(CompactMonthListAnimator *)self listViewController];
  uint64_t v8 = [v7 navigationController];
  id v9 = [v8 navigationBar];
  [v9 frame];
  double v11 = v10;

  [(CompactMonthListAnimator *)self monthViewSplittingLocation];
  uint64_t v13 = v12;
  double v15 = v14 - v11;
  double v16 = [(CompactMonthListAnimator *)self monthViewController];
  [v16 setSplitStateOpen:1];

  double v17 = [(CompactMonthListAnimator *)self monthViewController];
  double v18 = [v17 view];
  [v18 setAlpha:0.0];

  double v19 = [(CompactMonthListAnimator *)self listViewController];
  double v20 = [v19 view];
  [v20 frame];
  double v22 = v21;
  double v24 = v23;

  [(CompactMonthListAnimator *)self listViewNormalLocation];
  double v26 = v25;
  double v28 = v27;
  double v29 = [(CompactMonthListAnimator *)self listViewController];
  double v30 = [v29 view];
  [v30 setFrame:v26, v28, v22, v24];

  v31 = [(CompactMonthListAnimator *)self listViewController];
  v32 = [v31 view];
  [v32 setAlpha:1.0];

  springAnimationDuration();
  double v34 = v33;
  double v35 = +[SpringFactory sharedFactory];
  v64 = _NSConcreteStackBlock;
  uint64_t v65 = 3221225472;
  v66 = sub_100048D3C;
  v67 = &unk_1001D2A18;
  v68 = self;
  uint64_t v69 = v13;
  double v70 = v15;
  double v36 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v35 options:v36 factory:0 animations:v34 completion:0.0];

  double v37 = [(CompactMonthListAnimator *)self paletteView];
  double v38 = [v37 dateLabel];
  [v38 setHidden:1];

  double v39 = [(CompactMonthListAnimator *)self paletteView];
  double v40 = [v39 animatableDateLabel];
  [v40 setAlpha:0.0];

  v41 = [(CompactMonthListAnimator *)self paletteView];
  v42 = [v41 dayInitialsHeaderView];
  [v42 setAlpha:0.0];

  [(CompactMonthListAnimator *)self weekDayInitialsMonth];
  double v44 = v43;
  [(CompactMonthListAnimator *)self weekDayInitialsMonth];
  double v46 = v45;
  [(CompactMonthListAnimator *)self weekDayInitialsMonth];
  double v48 = v47;
  v49 = [(CompactMonthListAnimator *)self paletteView];
  double v50 = [v49 dayInitialsHeaderView];
  [v50 setFrame:v44, 0.0, v46, v48];

  double v51 = [(CompactMonthListAnimator *)self paletteView];
  [v51 setSuppressLayout:1];

  springAnimationDuration();
  double v53 = v52;
  id v54 = +[SpringFactory sharedFactory];
  v59 = _NSConcreteStackBlock;
  uint64_t v60 = 3221225472;
  v61 = sub_100048E6C;
  v62 = &unk_1001D2740;
  v63 = self;
  v55 = navigationAnimationsPreferringFRR();
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100048F64;
  v57[3] = &unk_1001D2F08;
  v57[4] = self;
  id v58 = v5;
  id v56 = v5;
  +[UIView _animateWithDuration:393216 delay:v54 options:v55 factory:v57 animations:v53 completion:0.0];
}

- (void)_haltAnimations
{
  dispatch_time_t v3 = [(CompactWidthMonthViewController *)self->_monthViewController view];
  id v4 = [v3 window];
  id v5 = [v4 layer];
  [v5 removeAllAnimations];

  [(CompactWidthMonthViewController *)self->_monthViewController endAnimationSplitState];
  v6 = [(CompactListViewController *)self->_listViewController view];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  double x = self->_listViewNormalLocation.x;
  double y = self->_listViewNormalLocation.y;
  uint64_t v13 = [(CompactListViewController *)self->_listViewController view];
  [v13 setFrame:x, y, v8, v10];

  self->_animating = 0;
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (CompactWidthMonthViewController)monthViewController
{
  return self->_monthViewController;
}

- (void)setMonthViewController:(id)a3
{
}

- (CompactListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
}

- (CGPoint)listViewNormalLocation
{
  double x = self->_listViewNormalLocation.x;
  double y = self->_listViewNormalLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setListViewNormalLocation:(CGPoint)a3
{
  self->_listViewNormalLocation = a3;
}

- (CGPoint)monthViewSplittingLocation
{
  double x = self->_monthViewSplittingLocation.x;
  double y = self->_monthViewSplittingLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMonthViewSplittingLocation:(CGPoint)a3
{
  self->_monthViewSplittingLocation = a3;
}

- (CGRect)monthSplittingCutOutArea
{
  double x = self->_monthSplittingCutOutArea.origin.x;
  double y = self->_monthSplittingCutOutArea.origin.y;
  double width = self->_monthSplittingCutOutArea.size.width;
  double height = self->_monthSplittingCutOutArea.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMonthSplittingCutOutArea:(CGRect)a3
{
  self->_monthSplittingCutOutArea = a3;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (PaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
}

- (CGRect)weekDayInitialsMonth
{
  double x = self->_weekDayInitialsMonth.origin.x;
  double y = self->_weekDayInitialsMonth.origin.y;
  double width = self->_weekDayInitialsMonth.size.width;
  double height = self->_weekDayInitialsMonth.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setWeekDayInitialsMonth:(CGRect)a3
{
  self->_weekDayInitialsMonth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_listViewController, 0);

  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end