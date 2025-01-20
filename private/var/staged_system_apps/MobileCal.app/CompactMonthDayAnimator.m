@interface CompactMonthDayAnimator
+ (Class)monthDayTransitionViewClass;
- (BOOL)reverse;
- (CUIKCalendarModel)model;
- (CompactMonthDayAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5;
- (MonthDayTransitionView)transitionView;
- (PaletteView)paletteView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setModel:(id)a3;
- (void)setPaletteView:(id)a3;
- (void)setReverse:(BOOL)a3;
- (void)setTransitionView:(id)a3;
@end

@implementation CompactMonthDayAnimator

+ (Class)monthDayTransitionViewClass
{
  return (Class)objc_opt_class();
}

- (CompactMonthDayAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CompactMonthDayAnimator;
  v11 = [(CompactMonthDayAnimator *)&v15 init];
  if (v11)
  {
    v12 = (MonthDayTransitionView *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "monthDayTransitionViewClass")), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    transitionView = v11->_transitionView;
    v11->_transitionView = v12;

    v11->_reverse = a5;
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v11->_paletteView, a4);
  }

  return v11;
}

- (double)transitionDuration:(id)a3
{
  v3 = [(CompactMonthDayAnimator *)self transitionView];
  [v3 animationDuration];
  double v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  double v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  uint64_t v7 = [v5 view];
  uint64_t v8 = [v6 view];
  id v9 = [v4 containerView];
  v56 = (void *)v7;
  if ([(CompactMonthDayAnimator *)self reverse]) {
    [v9 addSubview:v8];
  }
  else {
    [v9 insertSubview:v8 belowSubview:v7];
  }
  id v10 = [(CompactMonthDayAnimator *)self transitionView];
  [v9 addSubview:v10];

  v11 = [(CompactMonthDayAnimator *)self transitionView];
  [v9 bringSubviewToFront:v11];

  v12 = [(CompactMonthDayAnimator *)self transitionView];
  unsigned int v13 = [(CompactMonthDayAnimator *)self reverse];
  BOOL v14 = v13 == 0;
  if (v13) {
    objc_super v15 = v6;
  }
  else {
    objc_super v15 = v5;
  }
  v50 = v5;
  if (v14) {
    v16 = v6;
  }
  else {
    v16 = v5;
  }
  v17 = [v15 currentChildViewController];
  v18 = [v16 currentChildViewController];
  [v6 viewWillLayoutSubviews];
  v19 = [v6 view];
  [v19 layoutSubviews];

  [v6 viewDidLayoutSubviews];
  [(PaletteView *)self->_paletteView layoutSubviews];
  v20 = [(CompactMonthDayAnimator *)self model];
  v21 = [v20 selectedDate];

  v22 = v21;
  v23 = [v21 date];
  v55 = (void *)v8;
  v51 = v22;
  v52 = v4;
  if ([(CompactMonthDayAnimator *)self reverse])
  {
    v24 = [v17 view];
    [v24 layoutIfNeeded];

    [v17 showDate:v23 animated:0];
  }
  else
  {
    [v18 selectDate:v22 animated:0];
  }
  v54 = v9;
  [v9 bounds];
  [v12 setFrame:];
  v25 = [v17 view];
  v26 = [v18 view];
  v27 = [v18 allDayView];
  [v18 topLabelsContainer];
  v29 = v28 = v12;
  [v28 prepareTransitionWithTopView:v25 bottomView:v26 allDayView:v27 topLabelsContainer:v29];

  v30 = [v6 currentChildViewController];

  if (v17 == v30)
  {
    v31 = [(CompactMonthDayAnimator *)self model];
    v32 = [v31 selectedDate];
    v33 = [v17 subviewForDate:v32];

    if (!v33)
    {
      v34 = [v17 view];
      [v34 layoutBelowIfNeeded];

      v35 = [(CompactMonthDayAnimator *)self model];
      v36 = [v35 selectedDate];
      v33 = [v17 subviewForDate:v36];
    }
    [v33 layoutSubviews];
  }
  v37 = CUIKTodayDate();
  [v28 prepareTransitionScrubberWithSelectedDate:v23 todayDate:v37 dayViewController:v18 monthViewController:v17 paletteView:self->_paletteView reverse:[self reverse]];

  v53 = v28;
  [v28 setHidden:0];
  [v6 updatePalette:self->_paletteView];
  [v50 setAnimatingViewTransition:1];
  [v6 setAnimatingViewTransition:1];
  unsigned int v38 = [(CompactMonthDayAnimator *)self reverse];
  v39 = [(CompactMonthDayAnimator *)self transitionView];
  if (v38)
  {
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100129B04;
    v61[3] = &unk_1001D2E90;
    v40 = &v62;
    v41 = (id *)v63;
    v62 = v50;
    v63[0] = v6;
    v42 = &v64;
    v43 = v52;
    v63[1] = self;
    v64 = v52;
    id v44 = v52;
    id v45 = v6;
    id v46 = v50;
    [v39 animateToMonthWithCompletion:v61];
  }
  else
  {
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100129BA0;
    v57[3] = &unk_1001D2E90;
    v40 = &v58;
    v41 = (id *)v59;
    v58 = v50;
    v59[0] = v6;
    v42 = &v60;
    v43 = v52;
    v59[1] = self;
    v60 = v52;
    id v47 = v52;
    id v48 = v6;
    id v49 = v50;
    [v39 animateToDayWithCompletion:v57];
  }
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (MonthDayTransitionView)transitionView
{
  return self->_transitionView;
}

- (void)setTransitionView:(id)a3
{
}

- (PaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end