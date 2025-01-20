@interface CompactMonthMultiDayAnimator
+ (Class)monthMultiDayTransitionViewClass;
- (BOOL)reverse;
- (CUIKCalendarModel)model;
- (CompactMonthMultiDayAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5;
- (MonthDayTransitionView)transitionView;
- (PaletteView)paletteView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setModel:(id)a3;
- (void)setPaletteView:(id)a3;
- (void)setReverse:(BOOL)a3;
- (void)setTransitionView:(id)a3;
@end

@implementation CompactMonthMultiDayAnimator

+ (Class)monthMultiDayTransitionViewClass
{
  return (Class)objc_opt_class();
}

- (CompactMonthMultiDayAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CompactMonthMultiDayAnimator;
  v11 = [(CompactMonthMultiDayAnimator *)&v15 init];
  if (v11)
  {
    v12 = (MonthDayTransitionView *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "monthMultiDayTransitionViewClass")), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
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
  v3 = [(CompactMonthMultiDayAnimator *)self transitionView];
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
  v49 = (void *)v7;
  if ([(CompactMonthMultiDayAnimator *)self reverse]) {
    [v9 addSubview:v8];
  }
  else {
    [v9 insertSubview:v8 belowSubview:v7];
  }
  id v10 = [(CompactMonthMultiDayAnimator *)self transitionView];
  [v9 addSubview:v10];

  v11 = [(CompactMonthMultiDayAnimator *)self transitionView];
  [v9 bringSubviewToFront:v11];

  v52 = [(CompactMonthMultiDayAnimator *)self transitionView];
  unsigned int v12 = [(CompactMonthMultiDayAnimator *)self reverse];
  BOOL v13 = v12 == 0;
  if (v12) {
    v14 = v6;
  }
  else {
    v14 = v5;
  }
  if (v13) {
    objc_super v15 = v6;
  }
  else {
    objc_super v15 = v5;
  }
  v16 = [v14 currentChildViewController];
  v17 = [v15 currentChildViewController];
  [v6 viewWillLayoutSubviews];
  v18 = [v6 view];
  [v18 layoutSubviews];

  [v6 viewDidLayoutSubviews];
  [(PaletteView *)self->_paletteView layoutSubviews];
  v19 = [(CompactMonthMultiDayAnimator *)self model];
  v20 = [v19 selectedDate];

  v21 = v20;
  uint64_t v22 = [v20 date];
  v48 = (void *)v8;
  v51 = (void *)v22;
  if ([(CompactMonthMultiDayAnimator *)self reverse])
  {
    v23 = [v16 view:v21];
    [v23 layoutIfNeeded];

    [v16 showDate:v22 animated:0];
  }
  else
  {
    [v17 selectDate:v21 animated:0];
  }
  [v9 bounds];
  v24 = v52;
  [v52 setFrame:];
  v25 = [v16 view];
  v26 = [v17 view];
  [v52 prepareTransitionWithTopView:v25 bottomView:v26 allDayView:0 topLabelsContainer:0];

  v27 = [v6 currentChildViewController];

  v50 = v17;
  if (v16 == v27)
  {
    v28 = [(CompactMonthMultiDayAnimator *)self model];
    v29 = [v28 selectedDate];
    v30 = [v16 subviewForDate:v29];

    if (!v30)
    {
      v31 = [v16 view];
      [v31 layoutBelowIfNeeded];

      v32 = [(CompactMonthMultiDayAnimator *)self model];
      v33 = [v32 selectedDate];
      v30 = [v16 subviewForDate:v33];
    }
    [v30 layoutSubviews];

    v17 = v50;
    v24 = v52;
  }
  v47 = v9;
  v34 = CUIKTodayDate();
  [v24 prepareTransitionScrubberWithSelectedDate:v51 todayDate:v34 dayViewController:v17 monthViewController:v16 paletteView:self->_paletteView reverse:[self reverse]];

  [v24 setHidden:0];
  [v6 updatePalette:self->_paletteView];
  [v5 setAnimatingViewTransition:1];
  [v6 setAnimatingViewTransition:1];
  unsigned int v35 = [(CompactMonthMultiDayAnimator *)self reverse];
  v36 = [(CompactMonthMultiDayAnimator *)self transitionView];
  if (v35)
  {
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000BCE90;
    v57[3] = &unk_1001D2E90;
    v37 = &v58;
    v38 = (id *)v59;
    v58 = v5;
    v59[0] = v6;
    v39 = &v60;
    v59[1] = self;
    id v60 = v4;
    id v40 = v4;
    id v41 = v6;
    id v42 = v5;
    [v36 animateToMonthWithCompletion:v57];
  }
  else
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000BCEF8;
    v53[3] = &unk_1001D2E90;
    v37 = &v54;
    v38 = (id *)v55;
    v54 = v5;
    v55[0] = v6;
    v39 = &v56;
    v55[1] = self;
    id v56 = v4;
    id v43 = v4;
    id v44 = v6;
    id v45 = v5;
    [v36 animateToDayWithCompletion:v53];
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