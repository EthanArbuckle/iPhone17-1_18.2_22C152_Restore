@interface RoutePlanningRefinementBarView
- (CGPoint)_targetContentOffsetForView:(id)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)refinements;
- (RoutePlanningRefinementBarView)initWithDelegate:(id)a3 refinements:(id)a4;
- (RoutePlanningRefinementDelegate)delegate;
- (UIScrollView)scrollView;
- (UIView)containerView;
- (void)_applyRefinements;
- (void)_buttonMenuTriggered:(id)a3;
- (void)_touchUpInsideButton:(id)a3;
- (void)resetScrollPosition;
- (void)setContainerView:(id)a3;
- (void)setRefinements:(id)a3;
- (void)setScrollView:(id)a3;
@end

@implementation RoutePlanningRefinementBarView

- (RoutePlanningRefinementBarView)initWithDelegate:(id)a3 refinements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)RoutePlanningRefinementBarView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[RoutePlanningRefinementBarView initWithFrame:](&v55, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v6);
    v13 = (NSArray *)[v7 copy];
    refinements = v12->_refinements;
    v12->_refinements = v13;

    v15 = [objc_alloc((Class)UIScrollView) initWithFrame:CGRectZero.origin.x, y, width, height];
    id v53 = v7;
    scrollView = v12->_scrollView;
    v12->_scrollView = v15;

    [(UIScrollView *)v12->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)v12->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v12->_scrollView setShowsVerticalScrollIndicator:0];
    [(RoutePlanningRefinementBarView *)v12 addSubview:v12->_scrollView];
    v17 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    id v54 = v6;
    containerView = v12->_containerView;
    v12->_containerView = v17;

    [(UIView *)v12->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v19) = 1148846080;
    [(UIView *)v12->_containerView setContentHuggingPriority:1 forAxis:v19];
    [(UIScrollView *)v12->_scrollView addSubview:v12->_containerView];
    v52 = [(UIScrollView *)v12->_scrollView leadingAnchor];
    v51 = [(RoutePlanningRefinementBarView *)v12 leadingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v56[0] = v50;
    v49 = [(UIScrollView *)v12->_scrollView trailingAnchor];
    v48 = [(RoutePlanningRefinementBarView *)v12 trailingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v56[1] = v47;
    v46 = [(UIScrollView *)v12->_scrollView topAnchor];
    v45 = [(RoutePlanningRefinementBarView *)v12 topAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v56[2] = v44;
    v43 = [(UIScrollView *)v12->_scrollView bottomAnchor];
    v42 = [(RoutePlanningRefinementBarView *)v12 bottomAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v56[3] = v41;
    v40 = [(UIView *)v12->_containerView leadingAnchor];
    v39 = [(UIScrollView *)v12->_scrollView leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v56[4] = v38;
    v37 = [(UIView *)v12->_containerView trailingAnchor];
    v36 = [(UIScrollView *)v12->_scrollView trailingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v56[5] = v35;
    v34 = [(UIView *)v12->_containerView topAnchor];
    v33 = [(UIScrollView *)v12->_scrollView topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v56[6] = v32;
    v31 = [(UIView *)v12->_containerView bottomAnchor];
    v20 = [(UIScrollView *)v12->_scrollView bottomAnchor];
    v21 = [v31 constraintEqualToAnchor:v20];
    v56[7] = v21;
    v22 = [(UIView *)v12->_containerView widthAnchor];
    v23 = [(UIScrollView *)v12->_scrollView widthAnchor];
    v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];
    v56[8] = v24;
    v25 = [(UIView *)v12->_containerView heightAnchor];
    v26 = [(UIScrollView *)v12->_scrollView heightAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v56[9] = v27;
    v28 = +[NSArray arrayWithObjects:v56 count:10];
    +[NSLayoutConstraint activateConstraints:v28];

    id v7 = v53;
    id v6 = v54;

    v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:v12 selector:"_contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(RoutePlanningRefinementBarView *)v12 setAccessibilityIdentifier:@"RoutePlanningRefinementBar"];
    [(RoutePlanningRefinementBarView *)v12 _applyRefinements];
  }

  return v12;
}

- (CGSize)intrinsicContentSize
{
  if ([(NSArray *)self->_buttons count])
  {
    if ([(NSArray *)self->_buttons count])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v3 = self->_buttons;
      id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v15;
        double v7 = 34.0;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v15 != v6) {
              objc_enumerationMutation(v3);
            }
            v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) textLabel];
            [v9 sizeThatFits:1.79769313e308, 100.0];
            double v11 = ceil(v10);

            if (v11 + 6.0 + 6.0 > v7) {
              double v7 = v11 + 6.0 + 6.0;
            }
          }
          id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v5);
      }
      else
      {
        double v7 = 34.0;
      }
    }
    else
    {
      double v7 = 34.0;
    }
  }
  else
  {
    double v7 = 0.0;
  }
  double v12 = UIViewNoIntrinsicMetric;
  double v13 = v7;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)setRefinements:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  refinements = self->_refinements;
  self->_refinements = v4;

  [(RoutePlanningRefinementBarView *)self invalidateIntrinsicContentSize];

  [(RoutePlanningRefinementBarView *)self _applyRefinements];
}

- (void)resetScrollPosition
{
  v3 = [(NSArray *)self->_buttons firstObject];
  [(RoutePlanningRefinementBarView *)self _targetContentOffsetForView:v3];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(RoutePlanningRefinementBarView *)self scrollView];
  [v8 setContentOffset:v5, v7];
}

- (void)_applyRefinements
{
  if (self->_buttonConstraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    buttonConstraints = self->_buttonConstraints;
    self->_buttonConstraints = 0;
  }
  double v4 = [(RoutePlanningRefinementBarView *)self refinements];
  uint64_t v37 = 8;
  buttons = self->_buttons;
  if (buttons) {
    id v6 = [(NSArray *)buttons mutableCopy];
  }
  else {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100C47A64;
  v41[3] = &unk_10131C330;
  id v7 = v6;
  id v42 = v7;
  v43 = self;
  [v4 enumerateObjectsUsingBlock:v41];
  id v8 = [v7 count];
  if (v8 > [v4 count])
  {
    id v9 = [v4 count];
    double v10 = [v7 count];
    int64_t v11 = v10 - (unsigned char *)[v4 count];
    double v12 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v9, v11);
    [v7 enumerateObjectsAtIndexes:v12 options:0 usingBlock:&stru_10131C370];

    [v7 removeObjectsInRange:v9, v11];
  }
  v39 = v4;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  if ([v7 count])
  {
    unint64_t v14 = 0;
    long long v15 = 0;
    do
    {
      long long v16 = [v7 objectAtIndexedSubscript:v14, v37];
      long long v17 = [v16 leadingAnchor];
      if (v14)
      {
        v18 = [v15 trailingAnchor];
        double v19 = [v17 constraintEqualToAnchor:v18 constant:8.0];
        [v13 addObject:v19];
      }
      else
      {
        v18 = [(RoutePlanningRefinementBarView *)self containerView];
        double v19 = [v18 leadingAnchor];
        v20 = [v17 constraintEqualToAnchor:v19 constant:16.0];
        [v13 addObject:v20];
      }
      v21 = [v16 centerYAnchor];
      v22 = [(RoutePlanningRefinementBarView *)self containerView];
      v23 = [v22 centerYAnchor];
      v24 = [v21 constraintEqualToAnchor:v23];
      [v13 addObject:v24];

      v25 = [v16 heightAnchor];
      v26 = [(RoutePlanningRefinementBarView *)self containerView];
      v27 = [v26 heightAnchor];
      v28 = [v25 constraintEqualToAnchor:v27];
      [v13 addObject:v28];

      ++v14;
      long long v15 = v16;
    }
    while (v14 < (unint64_t)[v7 count]);
    if (v16)
    {
      v29 = [v16 trailingAnchor];
      v30 = [(RoutePlanningRefinementBarView *)self containerView];
      v31 = [v30 trailingAnchor];
      v32 = [v29 constraintLessThanOrEqualToAnchor:v31 constant:-16.0];
      [v13 addObject:v32];
    }
  }
  v33 = [v7 copy];
  v34 = *(Class *)((char *)&self->super.super.super.isa + v38);
  *(Class *)((char *)&self->super.super.super.isa + v38) = v33;

  v35 = (NSArray *)[v13 copy];
  v36 = self->_buttonConstraints;
  self->_buttonConstraints = v35;

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100C47BB8;
  v40[3] = &unk_1012E5D08;
  v40[4] = self;
  +[UIView performWithoutAnimation:v40];
}

- (void)_buttonMenuTriggered:(id)a3
{
  id v4 = a3;
  double v5 = [v4 refinement];
  [v5 _resetForMenuPresentation];

  id v7 = [(RoutePlanningRefinementBarView *)self delegate];
  id v6 = [v4 refinement];

  [v7 pressedRefinementModel:v6];
}

- (void)_touchUpInsideButton:(id)a3
{
  id v6 = a3;
  if (([v6 showsMenuAsPrimaryAction] & 1) == 0)
  {
    id v4 = [(RoutePlanningRefinementBarView *)self delegate];
    double v5 = [v6 refinement];
    [v4 selectedRefinementModel:v5];
  }
}

- (CGPoint)_targetContentOffsetForView:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    [v4 frame];
    double x = v6;
    CGFloat y = v8;
    double v10 = [(RoutePlanningRefinementBarView *)self scrollView];
    unsigned int v11 = [v10 _mapkit_isRTL];

    if (v11)
    {
      double v12 = [(RoutePlanningRefinementBarView *)self scrollView];
      [v12 bounds];
      double Width = CGRectGetWidth(v21);
      [v5 bounds];
      double v14 = Width - CGRectGetWidth(v22);
      double v15 = 0.0;
      if (v14 >= 0.0)
      {
        long long v16 = [(RoutePlanningRefinementBarView *)self scrollView];
        [v16 bounds];
        double v17 = CGRectGetWidth(v23);
        [v5 bounds];
        double v15 = v17 - CGRectGetWidth(v24);
      }
      double x = x - v15;
    }
  }
  else
  {
    double x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
  }

  double v18 = x;
  double v19 = y;
  result.CGFloat y = v19;
  result.double x = v18;
  return result;
}

- (RoutePlanningRefinementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutePlanningRefinementDelegate *)WeakRetained;
}

- (NSArray)refinements
{
  return self->_refinements;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_refinements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);

  objc_storeStrong((id *)&self->_buttons, 0);
}

@end