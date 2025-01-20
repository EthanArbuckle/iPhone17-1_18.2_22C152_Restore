@interface FilterCategoriesView
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (FilterCategoriesView)initWithFrame:(CGRect)a3;
- (FilterCategoriesViewDelegate)delegate;
- (NSArray)subCategories;
- (NSArray)visibleSuggestions;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)preferredFocusEnvironments;
- (unint64_t)selectedIndex;
- (void)initCurrentListSession;
- (void)layoutSubviews;
- (void)loadSubCategories;
- (void)resetData;
- (void)resetOffset;
- (void)safeAreaInsetsDidChange;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBackgroundAndTitleColorToButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastButtonTrailingPadding:(double)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setSubCategories:(id)a3;
- (void)setSubCategories:(id)a3 selectedIndex:(unint64_t)a4;
- (void)touchedAction:(id)a3;
- (void)updateSelectedVisibility;
- (void)updateTheme;
@end

@implementation FilterCategoriesView

- (void)updateTheme
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_subCategoriesViews;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[FilterCategoriesView setBackgroundAndTitleColorToButton:](self, "setBackgroundAndTitleColorToButton:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (FilterCategoriesView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FilterCategoriesView;
  v3 = -[FilterCategoriesView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(FilterCategoriesView *)v3 setAccessibilityIdentifier:@"FilterCategoriesView"];
    [(FilterCategoriesView *)v4 _setHostsLayoutEngine:1];
    LODWORD(v5) = 1148846080;
    [(FilterCategoriesView *)v4 setContentCompressionResistancePriority:1 forAxis:v5];
    uint64_t v6 = +[MapsTheme visualEffectViewAllowingBlur:1];
    blurView = v4->_blurView;
    v4->_blurView = (UIVisualEffectView *)v6;

    [(FilterCategoriesView *)v4 addSubview:v4->_blurView];
    long long v8 = [(UIScrollView *)[objc_alloc((Class)UIScrollView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
    scrollView = v4->_scrollView;
    v4->_scrollView = v8;

    [(UIScrollView *)v4->_scrollView setAccessibilityIdentifier:@"FilterCategoriesScrollView"];
    [(UIScrollView *)v4->_scrollView setDelegate:v4];
    [(UIScrollView *)v4->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v4->_scrollView setShowsVerticalScrollIndicator:0];
    [(FilterCategoriesView *)v4 addSubview:v4->_scrollView];
    [(UIScrollView *)v4->_scrollView _mapkit_addPointerInteractionWithDelegate:v4];
    id v10 = [(FilterCategoriesView *)v4 _maps_addHairlineAtTopWithMargin:0.0];
    v4->_lastButtonTrailingPadding = 16.0;
  }
  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat width = a3.width;
  [(FilterCategoriesView *)self intrinsicContentSize];
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(FilterCategoriesView *)self safeAreaInsets];
  double v3 = v2 + 49.0;
  double v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.CGFloat width = v4;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)FilterCategoriesView;
  [(FilterCategoriesView *)&v3 safeAreaInsetsDidChange];
  [(FilterCategoriesView *)self invalidateIntrinsicContentSize];
  [(FilterCategoriesView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)FilterCategoriesView;
  [(FilterCategoriesView *)&v12 layoutSubviews];
  [(FilterCategoriesView *)self bounds];
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  [(FilterCategoriesView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(FilterCategoriesView *)self safeAreaInsets];
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10 - v11);
}

- (void)setSubCategories:(id)a3
{
  double v5 = (NSArray *)a3;
  subCategories = self->_subCategories;
  if (subCategories != v5 && ([(NSArray *)subCategories isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subCategories, a3);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1006D70E4;
    v7[3] = &unk_1012E5D08;
    v7[4] = self;
    +[UIView performWithoutAnimation:v7];
  }
}

- (void)setSubCategories:(id)a3 selectedIndex:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 count] > a4)
  {
    [(FilterCategoriesView *)self setSubCategories:v6];
    [(FilterCategoriesView *)self setSelectedIndex:a4];
  }
}

- (void)resetData
{
}

- (void)touchedAction:(id)a3
{
  id v4 = [a3 tag];
  if (self->_selectedIndex != v4)
  {
    id v5 = v4;
    [(FilterCategoriesView *)self setSelectedIndex:v4];
    [(RefineSearchSession *)self->_refineSearchSession updateWithSelection:v5];
    id v6 = +[MKMapService sharedService];
    [v6 captureUserAction:2007 onTarget:619 eventValue:0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained filterView:self indexSelected:v5];
  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    if ((unint64_t)[(NSMutableArray *)self->_subCategoriesViews count] > a3)
    {
      [(UIButton *)self->_selected setSelected:0];
      id v5 = +[UIFont system15];
      id v6 = [(UIButton *)self->_selected titleLabel];
      [v6 setFont:v5];

      double v7 = +[UIColor clearColor];
      [(UIButton *)self->_selected setBackgroundColor:v7];

      double v8 = [(NSMutableArray *)self->_subCategoriesViews objectAtIndexedSubscript:a3];
      selected = self->_selected;
      self->_selected = v8;

      double v10 = +[UIFont system15Bold];
      double v11 = [(UIButton *)self->_selected titleLabel];
      [v11 setFont:v10];

      objc_super v12 = +[UIColor secondaryLabelColor];
      [(UIButton *)self->_selected setBackgroundColor:v12];

      [(UIButton *)self->_selected setSelected:1];
      [(FilterCategoriesView *)self layoutIfNeeded];
      [(FilterCategoriesView *)self updateSelectedVisibility];
    }
  }
}

- (NSArray)visibleSuggestions
{
  [(FilterCategoriesView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [(UIScrollView *)self->_scrollView contentOffset];
  CGFloat v10 = v9;
  double v11 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  objc_super v12 = self->_subCategoriesViews;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v17 setAccessibilityIdentifier:@"FilterCategoriesButton" v24];
        [v17 frame];
        v32.origin.x = v18;
        v32.origin.y = v19;
        v32.size.CGFloat width = v20;
        v32.size.height = v21;
        v30.origin.x = v10;
        v30.origin.y = v4;
        v30.size.CGFloat width = v6;
        v30.size.height = v8;
        CGRect v31 = CGRectIntersection(v30, v32);
        if (!CGRectIsEmpty(v31)) {
          [v11 addObject:v17];
        }
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  id v22 = [v11 copy];

  return (NSArray *)v22;
}

- (void)updateSelectedVisibility
{
  [(UIButton *)self->_selected frame];
  if (v5 != 0.0)
  {
    double v7 = v4;
    if (v4 >= 0.0)
    {
      double v8 = v3;
      double v9 = v5;
      double v10 = v6;
      [(FilterCategoriesView *)self bounds];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat rect = v15;
      [(UIScrollView *)self->_scrollView contentOffset];
      double v17 = v16;
      double v19 = v18;
      -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1, v8, v7, v9, v10);
      if ((-[UIScrollView _isRectFullyVisible:](self->_scrollView, "_isRectFullyVisible:", v8, v7, v9, v10) & 1) == 0)
      {
        double v24 = v19;
        double v20 = v17 - v8;
        v27.origin.x = v8;
        v27.origin.y = v7;
        v27.size.CGFloat width = v9;
        v27.size.height = v10;
        double MaxX = CGRectGetMaxX(v27);
        v28.origin.x = v17;
        v28.origin.y = v12;
        v28.size.CGFloat width = v14;
        v28.size.height = rect;
        double v22 = v17 + MaxX - CGRectGetMaxX(v28) + 10.0;
        if (v20 > 0.0) {
          double v22 = v17 - (v20 + 10.0);
        }
        scrollView = self->_scrollView;
        -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 1, v22, v24);
      }
    }
  }
}

- (void)loadSubCategories
{
  [(NSMutableArray *)self->_subCategoriesViews makeObjectsPerformSelector:"removeFromSuperview"];
  [(NSMutableArray *)self->_subCategoriesViews removeAllObjects];
  if (!self->_subCategoriesViews)
  {
    double v3 = +[NSMutableArray array];
    subCategoriesViews = self->_subCategoriesViews;
    self->_subCategoriesViews = v3;
  }
  uint64_t v5 = 80;
  self->_selectedIndex = -1;
  double v6 = +[NSMutableArray array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v7 = self->_subCategories;
  id v32 = [(NSArray *)v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v32)
  {
    double v8 = v7;
    goto LABEL_16;
  }
  uint64_t v29 = 80;
  obj = v7;
  double v8 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = *(void *)v36;
  do
  {
    double v9 = 0;
    double v10 = v8;
    do
    {
      if (*(void *)v36 != v31) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v9);
      CGFloat v12 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0, v29);
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v12 setTag:(char *)v9 + v33];
      double v13 = +[UIFont system15];
      CGFloat v14 = [v12 titleLabel];
      [v14 setFont:v13];

      [v12 setClipsToBounds:1];
      double v15 = [v12 layer];
      [v15 setCornerRadius:5.0];

      [v12 setContentEdgeInsets:2.0, 9.0, 2.0, 9.0];
      [v12 addTarget:self action:"touchedAction:" forControlEvents:0x2000];
      [v12 setTitle:v11 forState:0];
      [(FilterCategoriesView *)self setBackgroundAndTitleColorToButton:v12];
      [(UIScrollView *)self->_scrollView addSubview:v12];
      double v16 = [v12 centerYAnchor];
      double v17 = [(UIScrollView *)self->_scrollView centerYAnchor];
      double v18 = [v16 constraintEqualToAnchor:v17];
      v39 = v18;
      double v19 = +[NSArray arrayWithObjects:&v39 count:1];
      [v6 addObjectsFromArray:v19];

      double v20 = [v12 leadingAnchor];
      if (v10)
      {
        CGFloat v21 = [(NSArray *)v10 trailingAnchor];
        double v22 = 10.0;
      }
      else
      {
        CGFloat v21 = [(UIScrollView *)self->_scrollView leadingAnchor];
        double v22 = 16.0;
      }
      v23 = [v20 constraintEqualToAnchor:v21 constant:v22];
      [v6 addObject:v23];

      double v8 = v12;
      [(NSMutableArray *)self->_subCategoriesViews addObject:v8];

      double v9 = (char *)v9 + 1;
      double v10 = v8;
    }
    while (v32 != v9);
    id v32 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    v33 += (uint64_t)v9;
  }
  while (v32);

  uint64_t v5 = v29;
  if (v8)
  {
    double v24 = [(NSArray *)v8 trailingAnchor];
    long long v25 = [(UIScrollView *)self->_scrollView trailingAnchor];
    long long v26 = [v24 constraintEqualToAnchor:v25 constant:-self->_lastButtonTrailingPadding];
    lastButtonTrailingConstraint = self->_lastButtonTrailingConstraint;
    self->_lastButtonTrailingConstraint = v26;

    [v6 addObject:self->_lastButtonTrailingConstraint];
LABEL_16:
  }
  +[NSLayoutConstraint activateConstraints:v6];
  unint64_t v28 = *(unint64_t *)((char *)&self->super.super.super.super.isa + v5);
  if (v28 < (unint64_t)[(NSMutableArray *)self->_subCategoriesViews count]) {
    [(FilterCategoriesView *)self setSelectedIndex:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006D7B88;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setBackgroundAndTitleColorToButton:(id)a3
{
  id v3 = a3;
  double v4 = +[UIColor secondaryLabelColor];
  [v3 setTitleColor:v4 forState:0];

  id v5 = +[UIColor tertiarySystemBackgroundColor];
  [v3 setTitleColor:v5 forState:4];
}

- (void)resetOffset
{
}

- (void)setLastButtonTrailingPadding:(double)a3
{
  self->_lastButtonTrailingPadding = a3;
  -[NSLayoutConstraint setConstant:](self->_lastButtonTrailingConstraint, "setConstant:");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  id v7 = [(NSMutableArray *)self->_subCategoriesViews count];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      double v10 = [(NSMutableArray *)self->_subCategoriesViews objectAtIndexedSubscript:v9];
      [(UIScrollView *)self->_scrollView frame];
      double Height = CGRectGetHeight(v24);
      [v10 frame];
      double v12 = Height - CGRectGetHeight(v25);
      [v10 frame];
      CGRect v27 = CGRectInset(v26, -5.0, v12 * -0.5);
      double x = v27.origin.x;
      double y = v27.origin.y;
      double width = v27.size.width;
      double v16 = v27.size.height;
      [v6 location];
      v23.double x = v17;
      v23.double y = v18;
      v28.origin.double x = x;
      v28.origin.double y = y;
      v28.size.double width = width;
      v28.size.height = v16;
      if (CGRectContainsPoint(v28, v23)) {
        break;
      }

      if (v8 == (id)++v9) {
        goto LABEL_5;
      }
    }
    double v20 = +[NSNumber numberWithUnsignedInteger:v9];
    double v19 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v20, x, y, width, v16);
  }
  else
  {
LABEL_5:
    double v19 = 0;
  }

  return v19;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  id v6 = [v5 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v5 identifier];
    id v9 = [v8 unsignedIntegerValue];
    if (v9 >= [(NSMutableArray *)self->_subCategoriesViews count])
    {
      double v15 = 0;
    }
    else
    {
      double v10 = [(NSMutableArray *)self->_subCategoriesViews objectAtIndexedSubscript:v9];
      id v11 = [objc_alloc((Class)UITargetedPreview) initWithView:v10];
      if (v10 == self->_selected) {
        double v12 = (id *)UIPointerLiftEffect_ptr;
      }
      else {
        double v12 = (id *)UIPointerEffect_ptr;
      }
      double v13 = [*v12 effectWithPreview:v11];
      [(UIButton *)v10 frame];
      CGFloat v14 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
      double v15 = +[UIPointerStyle styleWithEffect:v13 shape:v14];
    }
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (id)preferredFocusEnvironments
{
  if (self->_selected)
  {
    selected = self->_selected;
    double v2 = +[NSArray arrayWithObjects:&selected count:1];
  }
  else
  {
    double v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  p_lastScrollViewContentOffset = &self->_lastScrollViewContentOffset;
  [a3 contentOffset];
  p_lastScrollViewContentOffset->double x = v4;
  p_lastScrollViewContentOffset->double y = v5;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6 = a3;
  double x = self->_lastScrollViewContentOffset.x;
  id v14 = v6;
  [v6 contentOffset];
  if (x <= v8)
  {
    double v12 = self->_lastScrollViewContentOffset.x;
    [v14 contentOffset];
    if (v12 >= v13) {
      goto LABEL_6;
    }
    id v9 = +[MKMapService sharedService];
    double v10 = v9;
    uint64_t v11 = 12;
  }
  else
  {
    id v9 = +[MKMapService sharedService];
    double v10 = v9;
    uint64_t v11 = 13;
  }
  [v9 captureUserAction:v11 onTarget:619 eventValue:0];

LABEL_6:
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)initCurrentListSession
{
  if (self->_refineSearchSession) {
    [(FilterCategoriesView *)self sendCurrentRefineSession];
  }
  id v3 = [RefineSearchSession alloc];
  subCategories = self->_subCategories;
  CGFloat v5 = [(FilterCategoriesView *)self delegate];
  id v6 = -[RefineSearchSession initWithObjects:forType:](v3, "initWithObjects:forType:", subCategories, [v5 refineSearchSessionType]);
  refineSearchSession = self->_refineSearchSession;
  self->_refineSearchSession = v6;

  double v8 = self->_refineSearchSession;

  [(RefineSearchSession *)v8 updateWithFilterView:self];
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSArray)subCategories
{
  return self->_subCategories;
}

- (FilterCategoriesViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FilterCategoriesViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subCategories, 0);
  objc_storeStrong((id *)&self->_lastButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_refineSearchSession, 0);
  objc_storeStrong((id *)&self->_selected, 0);
  objc_storeStrong((id *)&self->_subCategoriesViews, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end