@interface PKDashboardMessagesView
- (BOOL)isActionPresentedAsButtonCellForMessage:(id)a3;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSOrderedSet)messages;
- (PKDashboardMessagesView)initWithFrame:(CGRect)a3;
- (PKDashboardMessagesView)initWithInsets:(UIEdgeInsets)a3;
- (PKDashboardMessagesViewDelegate)delegate;
- (double)_actionCellHeightForSize:(CGSize)a3;
- (double)_endOfItemAtIndex:(unint64_t)a3;
- (double)_maxHeightForSize:(CGSize)a3;
- (double)_startOfItemAtIndex:(unint64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_messageForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_indexAtContentOffset:(CGPoint)a3;
- (unint64_t)_primaryIndexAtOffset:(CGPoint)a3;
- (void)_configureActionCell:(id)a3 withMessage:(id)a4;
- (void)_configureEngagementCell:(id)a3 withMessage:(id)a4;
- (void)_configureMessageCell:(id)a3 withMessage:(id)a4 leftContentInset:(double)a5;
- (void)_pageControlChanged:(id)a3;
- (void)_reportCurrentMessageViewed;
- (void)_switchPrimaryIndexToIndex:(unint64_t)a3;
- (void)_updateSizeCacheIfNecessary;
- (void)layoutSubviews;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithMessages:(id)a3 currentIndex:(unint64_t)a4;
@end

@implementation PKDashboardMessagesView

- (PKDashboardMessagesView)initWithInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v7 = -[PKDashboardMessagesView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_insets.double top = top;
    v7->_insets.double left = left;
    v7->_insets.double bottom = bottom;
    v7->_insets.double right = right;
    -[UIScrollView setContentInset:](v7->_scrollView, "setContentInset:", top, left, bottom, right);
  }
  return v8;
}

- (PKDashboardMessagesView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)PKDashboardMessagesView;
  v3 = -[PKDashboardMessagesView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_primaryIndex = 0x7FFFFFFFFFFFFFFFLL;
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    v4->_insets.double top = 0.0;
    v4->_insets.double left = v5;
    v4->_insets.double bottom = 0.0;
    v4->_insets.double right = v5;
    id v6 = objc_alloc(MEMORY[0x1E4FB1BE0]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    scrollView = v4->_scrollView;
    v4->_scrollView = (UIScrollView *)v11;

    [(UIScrollView *)v4->_scrollView setDelegate:v4];
    [(UIScrollView *)v4->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v4->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v4->_scrollView setDirectionalLockEnabled:1];
    [(UIScrollView *)v4->_scrollView setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    -[UIScrollView setContentInset:](v4->_scrollView, "setContentInset:", v4->_insets.top, v4->_insets.left, v4->_insets.bottom, v4->_insets.right);
    [(PKDashboardMessagesView *)v4 addSubview:v4->_scrollView];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1A40]), "initWithFrame:", v7, v8, v9, v10);
    pageControl = v4->_pageControl;
    v4->_pageControl = (UIPageControl *)v13;

    v15 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIPageControl *)v4->_pageControl setCurrentPageIndicatorTintColor:v15];
    v16 = v4->_pageControl;
    v17 = [v15 colorWithAlphaComponent:0.3];
    [(UIPageControl *)v16 setPageIndicatorTintColor:v17];

    v18 = [(UIPageControl *)v4->_pageControl layer];
    [v18 setOpacity:0.0];

    [(UIPageControl *)v4->_pageControl addTarget:v4 action:sel__pageControlChanged_ forControlEvents:4096];
    [(PKDashboardMessagesView *)v4 addSubview:v4->_pageControl];
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tablesViews = v4->_tablesViews;
    v4->_tablesViews = v19;

    v4->_maxTableViewHeight = 0.0;
    v21 = [[PKDashboardMessageActionCell alloc] initWithStyle:0 reuseIdentifier:@"actionCellIdentifier"];
    sampleButtonCell = v4->_sampleButtonCell;
    v4->_sampleButtonCell = v21;

    v23 = [[PKDashboardMessageCell alloc] initWithStyle:0 reuseIdentifier:@"messageCellIdentifier"];
    sampleMessageCell = v4->_sampleMessageCell;
    v4->_sampleMessageCell = v23;

    v25 = [[PKAMSEnagementMessageCell alloc] initWithStyle:0 reuseIdentifier:@"engagementCellIdentifier"];
    sampleEngagementCell = v4->_sampleEngagementCell;
    v4->_sampleEngagementCell = v25;

    [(PKDashboardMessagesView *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85438]];
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PKDashboardMessagesView;
  [(PKDashboardMessagesView *)&v35 layoutSubviews];
  uint64_t v3 = [(PKDashboardMessagesView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  self->_currentWidth = v8;
  v12 = (void *)MEMORY[0x1A6224460](v3);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v13 = self->_messages;
  uint64_t v14 = [(NSOrderedSet *)v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    double v29 = v7;
    double v30 = v5;
    uint64_t v16 = *(void *)v32;
    double v17 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        tablesViews = self->_tablesViews;
        v20 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "identifier", *(void *)&v29, *(void *)&v30, (void)v31);
        v21 = [(NSMutableDictionary *)tablesViews objectForKey:v20];

        [v21 reloadData];
        double v22 = v9 - self->_insets.left - self->_insets.right;
        double v23 = v11 - self->_insets.top - self->_insets.bottom;
        if ([(NSOrderedSet *)self->_messages count] <= 1) {
          double v24 = 0.0;
        }
        else {
          double v24 = 39.0;
        }
        objc_msgSend(v21, "setFrame:", v17, 0.0, v22, v23 - v24);
        double v17 = v9 + -24.0 + v17;
      }
      uint64_t v15 = [(NSOrderedSet *)v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v15);
    double v25 = v17 + 24.0;
    double v7 = v29;
    double v5 = v30;
  }
  else
  {
    double v25 = 24.0;
  }

  NSUInteger v26 = [(NSOrderedSet *)self->_messages count];
  scrollView = self->_scrollView;
  if (v26 < 2)
  {
    -[UIScrollView setFrame:](scrollView, "setFrame:", v5, v7, v9, v11);
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v25, v11);
    double v28 = v7 + v11;
  }
  else
  {
    -[UIScrollView setFrame:](scrollView, "setFrame:", v5, v7, v9, v11 + -39.0);
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v25, v11 + -39.0);
    double v28 = v7 + v11 + -44.0;
  }
  -[UIPageControl setFrame:](self->_pageControl, "setFrame:", v5, v28, v9, 44.0);
  [(PKDashboardMessagesView *)self _updateSizeCacheIfNecessary];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PKDashboardMessagesView _maxHeightForSize:](self, "_maxHeightForSize:", a3.width, a3.height);
  double v6 = v5;
  if ([(NSOrderedSet *)self->_messages count] <= 1) {
    double v7 = v6;
  }
  else {
    double v7 = v6 + 39.0;
  }
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)_updateSizeCacheIfNecessary
{
  [(PKDashboardMessagesView *)self bounds];
  if (self->_widthForLastSizeCache != v3)
  {
    double v4 = v3;
    self->_widthForLastSizeCache = v3;
    -[PKDashboardMessagesView _actionCellHeightForSize:](self, "_actionCellHeightForSize:", v3, 1.79769313e308);
    self->_actionCellHeight = v5;
    -[PKDashboardMessagesView _maxHeightForSize:](self, "_maxHeightForSize:", v4, 1.79769313e308);
    self->_maxTableViewHeight = v6;
  }
}

- (double)_actionCellHeightForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v6 = (void *)MEMORY[0x1A6224460](self, a2);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v7 = self->_messages;
  uint64_t v8 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  double v9 = 0.0;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (-[PKDashboardMessagesView isActionPresentedAsButtonCellForMessage:](self, "isActionPresentedAsButtonCellForMessage:", v13, (void)v16))
        {
          [(PKDashboardMessagesView *)self _configureActionCell:self->_sampleButtonCell withMessage:v13];
          -[PKDashboardMessageActionCell sizeThatFits:](self->_sampleButtonCell, "sizeThatFits:", width, height);
          double v9 = v14;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (double)_maxHeightForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MEMORY[0x1A6224460](self, a2);
  double left = self->_insets.left;
  double v29 = (void *)v6;
  double right = self->_insets.right;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obj = self->_messages;
  uint64_t v9 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = width - (left + right);
    uint64_t v12 = *(void *)v32;
    double v13 = 0.0;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v16 type] == 2)
        {
          [(PKDashboardMessagesView *)self _configureEngagementCell:self->_sampleEngagementCell withMessage:v16];
        }
        else
        {
          tablesViews = self->_tablesViews;
          long long v18 = [v16 identifier];
          long long v19 = [(NSMutableDictionary *)tablesViews objectForKey:v18];

          sampleMessageCell = self->_sampleMessageCell;
          [v19 separatorInset];
          [(PKDashboardMessagesView *)self _configureMessageCell:sampleMessageCell withMessage:v16 leftContentInset:v21];
        }
        double v22 = 0.0;
        if ([(PKDashboardMessagesView *)self isActionPresentedAsButtonCellForMessage:v16])
        {
          if (v13 == 0.0)
          {
            [(PKDashboardMessagesView *)self _configureActionCell:self->_sampleButtonCell withMessage:v16];
            -[PKDashboardMessageActionCell sizeThatFits:](self->_sampleButtonCell, "sizeThatFits:", v11, height);
            double v13 = v23;
          }
          double v22 = v13 + 0.0;
        }
        if ([v16 type] == 2) {
          uint64_t v24 = 33;
        }
        else {
          uint64_t v24 = 32;
        }
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKDashboardMessageView__smallDevice[v24]), "sizeThatFits:", v11, height);
        if (v22 + v25 > v14) {
          double v14 = v22 + v25;
        }
      }
      uint64_t v10 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }
  else
  {
    double v14 = 0.0;
  }

  double top = self->_insets.top;
  double bottom = self->_insets.bottom;
  return v14 + top + bottom;
}

- (void)updateWithMessages:(id)a3 currentIndex:(unint64_t)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self->_widthForLastSizeCache = 0.0;
  [(PKDashboardMessagesView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  p_messages = &self->_messages;
  objc_storeStrong((id *)&self->_messages, a3);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v54;
    double v20 = *MEMORY[0x1E4FB2F28];
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(v16);
        }
        double v22 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "identifier", p_messages);
        [v15 addObject:v22];
        double v23 = [(NSMutableDictionary *)self->_tablesViews objectForKey:v22];
        if (!v23)
        {
          double v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", 0, v8, v10, v12, v14);
          objc_msgSend(v23, "pkui_setMaskType:", 3);
          [(UIScrollView *)self->_scrollView addSubview:v23];
          [(NSMutableDictionary *)self->_tablesViews setObject:v23 forKey:v22];
          [v23 setScrollEnabled:0];
          [v23 setDelegate:self];
          [v23 setDataSource:self];
          uint64_t v24 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
          [v23 setBackgroundColor:v24];

          [v23 setRowHeight:v20];
          [v23 setEstimatedRowHeight:60.0];
          [v23 setContentInsetAdjustmentBehavior:2];
          [v23 registerClass:objc_opt_class() forCellReuseIdentifier:@"messageCellIdentifier"];
          [v23 registerClass:objc_opt_class() forCellReuseIdentifier:@"actionCellIdentifier"];
          [v23 registerClass:objc_opt_class() forCellReuseIdentifier:@"engagementCellIdentifier"];
          [v23 _setDrawsSeparatorAtTopOfSections:0];
        }
        [v23 reloadData];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v18);
  }

  double v25 = [(NSMutableDictionary *)self->_tablesViews allKeys];
  NSUInteger v26 = (void *)MEMORY[0x1E4F28F60];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __59__PKDashboardMessagesView_updateWithMessages_currentIndex___block_invoke;
  v51[3] = &unk_1E59D1428;
  id v27 = v15;
  id v52 = v27;
  double v28 = [v26 predicateWithBlock:v51];
  double v29 = [v25 filteredArrayUsingPredicate:v28];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v30 = v29;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v48 != v33) {
          objc_enumerationMutation(v30);
        }
        objc_super v35 = -[NSMutableDictionary objectForKey:](self->_tablesViews, "objectForKey:", *(void *)(*((void *)&v47 + 1) + 8 * j), p_messages);
        [v35 removeFromSuperview];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v32);
  }

  [(NSMutableDictionary *)self->_tablesViews removeObjectsForKeys:v30];
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", (unint64_t)[v16 count] > 1);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v36 = 0;
  }
  else {
    unint64_t v36 = a4;
  }
  self->_primaryIndex = v36;
  unint64_t v37 = [(NSOrderedSet *)*p_messages count];
  if (self->_primaryIndex >= v37) {
    self->_primaryIndex = 0;
  }
  [(PKDashboardMessagesView *)self _reportCurrentMessageViewed];
  v38 = [(UIPageControl *)self->_pageControl layer];
  [v38 opacity];
  double v40 = *(float *)&v39;
  double v41 = 0.0;
  if (v37 >= 2)
  {
    [(UIPageControl *)self->_pageControl setNumberOfPages:v37];
    [(UIPageControl *)self->_pageControl setCurrentPage:self->_primaryIndex];
    double v41 = 1.0;
  }
  if (v41 != v40)
  {
    v42 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
    objc_msgSend(v42, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v40, v41);
    id v43 = (id)objc_msgSend(v38, "pkui_addAdditiveAnimation:", v42);
  }
  *(float *)&double v39 = v41;
  [v38 setOpacity:v39];
  [(PKDashboardMessagesView *)self setNeedsLayout];
  [(PKDashboardMessagesView *)self layoutIfNeeded];
  scrollView = self->_scrollView;
  [(PKDashboardMessagesView *)self _startOfItemAtIndex:self->_primaryIndex];
  -[UIScrollView setContentOffset:](scrollView, "setContentOffset:");
}

uint64_t __59__PKDashboardMessagesView_updateWithMessages_currentIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)_messageForTableView:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v5 = self->_messages;
  uint64_t v6 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        tablesViews = self->_tablesViews;
        double v12 = objc_msgSend(v10, "identifier", (void)v16);
        id v13 = [(NSMutableDictionary *)tablesViews objectForKey:v12];

        if (v13 == v4)
        {
          id v14 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (void)_reportCurrentMessageViewed
{
  v13[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NSOrderedSet *)self->_messages count];
  if (v3 >= 1 && self->_primaryIndex < v3)
  {
    id v4 = -[NSOrderedSet objectAtIndex:](self->_messages, "objectAtIndex:");
    double v5 = [(PKDashboardMessagesView *)self superview];
    uint64_t v6 = v5;
    if (v5 && v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v8 = [WeakRetained messagesView:self shouldEnqueueEventForView:v4];

      if (v8)
      {
        uint64_t v12 = *MEMORY[0x1E4F86308];
        v13[0] = *MEMORY[0x1E4F86390];
        double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        _ReportAnalyticsEventForMessage(v9, v4);

        uint64_t v10 = [v4 actionOnViewed];
        double v11 = (void *)v10;
        if (v10) {
          (*(void (**)(uint64_t))(v10 + 16))(v10);
        }
      }
    }
    else
    {
    }
  }
}

- (BOOL)isActionPresentedAsButtonCellForMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 actionOnButtonPress];
  if (v4) {
    BOOL v5 = [v3 type] != 2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(PKDashboardMessagesView *)self _messageForTableView:a3];
  int64_t v4 = v3 != 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v5 = -[PKDashboardMessagesView _messageForTableView:](self, "_messageForTableView:", a3, a4);
  if (v5)
  {
    if ([(PKDashboardMessagesView *)self isActionPresentedAsButtonCellForMessage:v5])
    {
      int64_t v6 = 2;
    }
    else
    {
      int64_t v6 = 1;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PKDashboardMessagesView *)self _messageForTableView:v6];
  if ([v8 type] == 2)
  {
    double v9 = [v6 dequeueReusableCellWithIdentifier:@"engagementCellIdentifier" forIndexPath:v7];
    [(PKDashboardMessagesView *)self _configureEngagementCell:v9 withMessage:v8];
  }
  else
  {
    uint64_t v10 = [v7 row];
    if (v10 == 1)
    {
      double v9 = [v6 dequeueReusableCellWithIdentifier:@"actionCellIdentifier" forIndexPath:v7];
      [(PKDashboardMessagesView *)self _configureActionCell:v9 withMessage:v8];
    }
    else if (v10)
    {
      double v9 = [v6 dequeueReusableCellWithIdentifier:@"messageCellIdentifier" forIndexPath:v7];
    }
    else
    {
      double v9 = [v6 dequeueReusableCellWithIdentifier:@"messageCellIdentifier" forIndexPath:v7];
      [v6 separatorInset];
      [(PKDashboardMessagesView *)self _configureMessageCell:v9 withMessage:v8 leftContentInset:v11];
    }
  }
  uint64_t v12 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [v9 setBackgroundColor:v12];

  return v9;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKDashboardMessagesView *)self _messageForTableView:a3];
  BOOL v8 = [(PKDashboardMessagesView *)self isActionPresentedAsButtonCellForMessage:v7];
  uint64_t v9 = [v6 row];

  if (v8)
  {
    LOBYTE(v9) = v9 > 0;
  }
  else if (v9)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    uint64_t v10 = [v7 actionOnMessagePress];
    uint64_t v9 = v10 != 0;
  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(PKDashboardMessagesView *)self _messageForTableView:v7];
  if ([v6 row] < 1)
  {
    long long v18 = [v8 actionOnMessagePress];
    v18[2]();

    [v7 deselectRowAtIndexPath:v6 animated:1];
    uint64_t v19 = *MEMORY[0x1E4F86380];
    uint64_t v20 = *MEMORY[0x1E4F86120];
    v22[0] = *MEMORY[0x1E4F86308];
    v22[1] = v20;
    uint64_t v21 = *MEMORY[0x1E4F86238];
    v23[0] = v19;
    v23[1] = v21;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    if (!v13) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v9 = [v8 actionOnButtonPress];
  v9[2]();

  [v7 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v10 = *MEMORY[0x1E4F86380];
  uint64_t v11 = *MEMORY[0x1E4F86120];
  v24[0] = *MEMORY[0x1E4F86308];
  v24[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F86220];
  v25[0] = v10;
  v25[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  id v14 = [v8 additionalEventAnalyticsOnButtonPress];

  if (v14)
  {
    id v15 = (void *)[v13 mutableCopy];
    long long v16 = [v8 additionalEventAnalyticsOnButtonPress];
    [v15 addEntriesFromDictionary:v16];

    uint64_t v17 = [v15 copy];
    id v13 = (void *)v17;
  }
  if (v13) {
LABEL_5:
  }
    _ReportAnalyticsEventForMessage(v13, v8);
LABEL_6:
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PKDashboardMessagesView *)self _updateSizeCacheIfNecessary];
  if ([v7 row])
  {
    if ([v7 row] == 1) {
      double actionCellHeight = self->_actionCellHeight;
    }
    else {
      double actionCellHeight = *MEMORY[0x1E4FB2F28];
    }
  }
  else
  {
    uint64_t v9 = [(PKDashboardMessagesView *)self _messageForTableView:v6];
    BOOL v10 = [(PKDashboardMessagesView *)self isActionPresentedAsButtonCellForMessage:v9];
    double actionCellHeight = self->_maxTableViewHeight;
    if (v10) {
      double actionCellHeight = actionCellHeight - self->_actionCellHeight;
    }
  }
  return actionCellHeight;
}

- (void)_configureEngagementCell:(id)a3 withMessage:(id)a4
{
}

- (void)_configureMessageCell:(id)a3 withMessage:(id)a4 leftContentInset:(double)a5
{
  id v7 = a4;
  id v8 = [a3 dashboardMessageView];
  [v8 setLeftContentInset:a5];
  [v8 updateWithMessage:v7];
}

- (void)_configureActionCell:(id)a3 withMessage:(id)a4
{
  id v5 = a4;
  id v6 = [a3 actionView];
  [v6 updateWithMessage:v5];
}

- (void)_switchPrimaryIndexToIndex:(unint64_t)a3
{
  if (self->_primaryIndex != a3)
  {
    self->_primaryIndex = a3;
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      int64_t v4 = [(NSOrderedSet *)self->_messages objectAtIndex:self->_primaryIndex];
      id v5 = [v4 identifier];
      [WeakRetained messagesView:self scrolledToMessageWithIdentifier:v5];
    }
    [(PKDashboardMessagesView *)self _reportCurrentMessageViewed];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  [(UIScrollView *)self->_scrollView contentOffset];
  unint64_t v9 = [(PKDashboardMessagesView *)self _indexAtContentOffset:v8 + self->_currentWidth * 0.5];
  unint64_t v10 = v9;
  if (v9 == self->_primaryIndex)
  {
    unint64_t v11 = v9;
    if (x <= 0.0 || (unint64_t v10 = v9 + 1, v9 + 1 >= [(NSMutableDictionary *)self->_tablesViews count]))
    {
      BOOL v13 = x < 0.0 && v11 != 0;
      unint64_t v10 = v11 - v13;
    }
  }
  [(PKDashboardMessagesView *)self _startOfItemAtIndex:v10];
  a5->double x = v14;
  a5->y = 0.0;

  [(PKDashboardMessagesView *)self _switchPrimaryIndexToIndex:v10];
}

- (unint64_t)_indexAtContentOffset:(CGPoint)a3
{
  float v3 = a3.x / (self->_currentWidth + -24.0);
  return vcvtms_u32_f32(v3);
}

- (double)_startOfItemAtIndex:(unint64_t)a3
{
  return -(self->_insets.left - (double)a3 * (self->_currentWidth + -24.0));
}

- (double)_endOfItemAtIndex:(unint64_t)a3
{
  [(PKDashboardMessagesView *)self _startOfItemAtIndex:a3];
  return v4 + self->_currentWidth;
}

- (unint64_t)_primaryIndexAtOffset:(CGPoint)a3
{
  return -[PKDashboardMessagesView _indexAtContentOffset:](self, "_indexAtContentOffset:", a3.x + self->_currentWidth * 0.5, a3.y);
}

- (void)_pageControlChanged:(id)a3
{
  unint64_t v4 = [(UIPageControl *)self->_pageControl currentPage];
  if (v4 < [(NSOrderedSet *)self->_messages count])
  {
    scrollView = self->_scrollView;
    [(PKDashboardMessagesView *)self _startOfItemAtIndex:v4];
    -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 1);
    [(PKDashboardMessagesView *)self _switchPrimaryIndexToIndex:v4];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDashboardMessagesView;
  [(PKDashboardMessagesView *)&v4 traitCollectionDidChange:a3];
  self->_maxTableViewHeight = 0.0;
  self->_double actionCellHeight = 0.0;
  self->_widthForLastSizeCache = 0.0;
  [(PKDashboardMessagesView *)self setNeedsLayout];
}

- (NSOrderedSet)messages
{
  return self->_messages;
}

- (PKDashboardMessagesViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDashboardMessagesViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_dismissImage, 0);
  objc_storeStrong((id *)&self->_sampleEngagementCell, 0);
  objc_storeStrong((id *)&self->_sampleMessageCell, 0);
  objc_storeStrong((id *)&self->_sampleButtonCell, 0);
  objc_storeStrong((id *)&self->_tablesViews, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_messages, 0);
}

@end