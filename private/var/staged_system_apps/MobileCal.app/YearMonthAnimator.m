@interface YearMonthAnimator
- (BOOL)reverse;
- (CUIKCalendarModel)model;
- (EKCalendarDate)selectedDate;
- (PaletteView)paletteView;
- (YearMonthAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5;
- (YearMonthTransitionView)transitionView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setModel:(id)a3;
- (void)setPaletteView:(id)a3;
- (void)setReverse:(BOOL)a3;
- (void)setSelectedDate:(id)a3;
- (void)setTransitionView:(id)a3;
@end

@implementation YearMonthAnimator

- (YearMonthAnimator)initWithModel:(id)a3 paletteView:(id)a4 reverse:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)YearMonthAnimator;
  v11 = [(YearMonthAnimator *)&v15 init];
  if (v11)
  {
    v12 = -[YearMonthTransitionView initWithFrame:]([YearMonthTransitionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
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
  v3 = [(YearMonthAnimator *)self transitionView];
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
  v57 = (void *)v8;
  v58 = (void *)v7;
  if ([(YearMonthAnimator *)self reverse]) {
    [v9 addSubview:v8];
  }
  else {
    [v9 insertSubview:v8 belowSubview:v7];
  }
  id v10 = [(YearMonthAnimator *)self transitionView];
  [v9 addSubview:v10];

  v11 = [(YearMonthAnimator *)self transitionView];
  [v9 bringSubviewToFront:v11];

  [v4 finalFrameForViewController:v6];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v6 view];
  [v20 setFrame:v13, v15, v17, v19];

  v59 = [(YearMonthAnimator *)self transitionView];
  unsigned int v21 = [(YearMonthAnimator *)self reverse];
  BOOL v22 = v21 == 0;
  if (v21) {
    v23 = v6;
  }
  else {
    v23 = v5;
  }
  if (v22) {
    v24 = v6;
  }
  else {
    v24 = v5;
  }
  v25 = [v23 currentChildViewController];
  v26 = [v24 currentChildViewController];
  v27 = [(YearMonthAnimator *)self model];
  v28 = [v27 selectedDate];
  uint64_t v29 = [v28 date];

  if ([(YearMonthAnimator *)self reverse]) {
    v30 = v25;
  }
  else {
    v30 = v26;
  }
  v55 = (void *)v29;
  [v30 showDate:v29 animated:0];
  [v26 forceUpdateListView];
  id v31 = [v6 view];
  [v6 viewWillLayoutSubviews];
  v32 = [v6 view];
  [v32 layoutSubviews];

  [v6 viewDidLayoutSubviews];
  v33 = [(YearMonthAnimator *)self selectedDate];
  if (v33) {
    goto LABEL_19;
  }
  if ([(YearMonthAnimator *)self reverse])
  {
    v33 = [v26 dateForCurrentMonthOnScreen];
    if (v33) {
      goto LABEL_19;
    }
  }
  else
  {
    v34 = [(YearMonthAnimator *)self model];
    v33 = [v34 selectedDate];

    if (v33) {
      goto LABEL_19;
    }
  }
  v35 = CUIKTodayComponents();
  v56 = [(YearMonthAnimator *)self model];
  v54 = [v56 eventStore];
  v36 = [v54 timeZone];
  v33 = +[EKCalendarDate calendarDateWithDateComponents:v35 timeZone:v36];

LABEL_19:
  [v9 bounds];
  [v59 setFrame:];
  v37 = [(YearMonthAnimator *)self model];
  v38 = [v37 calendar];
  [v59 prepareWithYearViewController:v25 monthViewController:v26 selectedDate:v33 calendar:v38 yearToMonth:!self->_reverse paletteView:self->_paletteView];

  v39 = [v25 view];
  [v39 setHidden:0];

  v40 = [v26 view];
  [v40 setHidden:0];

  [v59 setHidden:0];
  [v5 setAnimatingViewTransition:1];
  [v6 setAnimatingViewTransition:1];
  LODWORD(v38) = [(YearMonthAnimator *)self reverse];
  v41 = [(YearMonthAnimator *)self transitionView];
  if (v38)
  {
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10009D130;
    v67[3] = &unk_1001D3BA0;
    v42 = (id *)v68;
    v68[0] = v25;
    v68[1] = self;
    v69 = v5;
    id v70 = v6;
    id v71 = v4;
    id v72 = v26;
    id v43 = v4;
    id v44 = v6;
    id v45 = v5;
    id v46 = v26;
    id v47 = v25;
    [v41 animateToYearViewWithCompletion:v67];

    v48 = v69;
  }
  else
  {
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10009D204;
    v60[3] = &unk_1001D3BA0;
    v42 = &v61;
    v61 = v25;
    v62 = v26;
    v63 = self;
    id v64 = v5;
    id v65 = v6;
    id v66 = v4;
    id v49 = v4;
    id v50 = v6;
    id v51 = v5;
    id v52 = v26;
    id v53 = v25;
    [v41 animateToMonthViewWithCompletion:v60];

    v48 = v62;
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

- (YearMonthTransitionView)transitionView
{
  return self->_transitionView;
}

- (void)setTransitionView:(id)a3
{
}

- (EKCalendarDate)selectedDate
{
  return self->_selectedDate;
}

- (void)setSelectedDate:(id)a3
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
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end