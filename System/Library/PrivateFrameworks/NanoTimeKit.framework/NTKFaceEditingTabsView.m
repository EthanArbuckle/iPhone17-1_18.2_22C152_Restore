@interface NTKFaceEditingTabsView
+ (id)labelFont;
- (NSArray)orderedTabs;
- (double)_containerOffsetForLabelAtIndex:(int64_t)a3;
- (unint64_t)selectedTab;
- (void)_addOrRemoveLabelsAsNeeded;
- (void)_applyOrderedTabsAndLayout;
- (void)_applySelectedTab:(unint64_t)a3;
- (void)applyTransitionFraction:(double)a3 fromTab:(unint64_t)a4 toTab:(unint64_t)a5;
- (void)layoutSubviews;
- (void)setOrderedTabs:(id)a3;
- (void)setSelectedTab:(unint64_t)a3;
@end

@implementation NTKFaceEditingTabsView

+ (id)labelFont
{
  v2 = (void *)MEMORY[0x1E4F19A50];
  double v3 = NTKFaceEditingTabsTextSize();
  double v4 = *MEMORY[0x1E4FB09B8];

  return (id)[v2 systemFontOfSize:v3 weight:v4];
}

- (void)setOrderedTabs:(id)a3
{
  objc_storeStrong((id *)&self->_orderedTabs, a3);

  [(NTKFaceEditingTabsView *)self _applyOrderedTabsAndLayout];
}

- (void)_applyOrderedTabsAndLayout
{
  [(NTKFaceEditingTabsView *)self _addOrRemoveLabelsAsNeeded];
  uint64_t v9 = 0;
  v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  orderedTabs = self->_orderedTabs;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NTKFaceEditingTabsView__applyOrderedTabsAndLayout__block_invoke;
  v8[3] = &unk_1E62C6CE8;
  v8[4] = self;
  v8[5] = &v9;
  [(NSArray *)orderedTabs enumerateObjectsUsingBlock:v8];
  [(UIView *)self->_labelContainer frame];
  double v5 = v4;
  double v7 = v6;
  [(NTKFaceEditingTabsView *)self frame];
  -[UIView setFrame:](self->_labelContainer, "setFrame:", v5, v7, v10[3]);
  if ([(NSMutableArray *)self->_labels count]) {
    [(NTKFaceEditingTabsView *)self _applySelectedTab:self->_selectedTab];
  }
  _Block_object_dispose(&v9, 8);
}

void __52__NTKFaceEditingTabsView__applyOrderedTabsAndLayout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(*(void *)(a1 + 32) + 408);
  id v6 = a2;
  id v10 = [v5 objectAtIndexedSubscript:a3];
  [v10 setText:v6];

  [v10 sizeToFit];
  if (a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
  }
                                                                            + 24)
                                                                + 14.0;
  [v10 frame];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  double v8 = *(double *)(v7 + 24);
  *(double *)(v7 + 24) = v9 + v8;
  objc_msgSend(v10, "setFrame:", v8, 0.0);
}

- (void)_addOrRemoveLabelsAsNeeded
{
  if (!self->_labels)
  {
    double v3 = (NSMutableArray *)objc_opt_new();
    labels = self->_labels;
    self->_labels = v3;
  }
  if (!self->_labelContainer)
  {
    double v5 = (UIView *)objc_opt_new();
    labelContainer = self->_labelContainer;
    self->_labelContainer = v5;

    [(NTKFaceEditingTabsView *)self addSubview:self->_labelContainer];
  }
  NSUInteger v7 = [(NSArray *)self->_orderedTabs count];
  unint64_t v8 = [(NSMutableArray *)self->_labels count];
  NSUInteger v9 = [(NSArray *)self->_orderedTabs count];
  unint64_t v10 = [(NSMutableArray *)self->_labels count];
  if (v7 <= v8)
  {
    if (v9 < v10)
    {
      while (1)
      {
        unint64_t v14 = [(NSArray *)self->_orderedTabs count];
        if (v14 >= [(NSMutableArray *)self->_labels count]) {
          break;
        }
        v15 = [(NSMutableArray *)self->_labels lastObject];
        [v15 removeFromSuperview];
        [(NSMutableArray *)self->_labels removeLastObject];
      }
    }
  }
  else if (v9 > v10)
  {
    do
    {
      uint64_t v11 = objc_opt_new();
      [v11 setNumberOfLines:1];
      uint64_t v12 = +[NTKFaceEditingTabsView labelFont];
      [v11 setFont:v12];

      [(UIView *)self->_labelContainer addSubview:v11];
      [(NSMutableArray *)self->_labels addObject:v11];

      unint64_t v13 = [(NSArray *)self->_orderedTabs count];
    }
    while (v13 > [(NSMutableArray *)self->_labels count]);
  }
}

- (void)setSelectedTab:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_selectedTab = a3;
  if ([(NSMutableArray *)self->_labels count] >= a3)
  {
    [(NTKFaceEditingTabsView *)self _applySelectedTab:a3];
  }
  else
  {
    double v5 = _NTKLoggingObjectForDomain(11, (uint64_t)"NTKLoggingDomainFaceLibraryViewController");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(NSMutableArray *)self->_labels count];
      int v7 = 134218240;
      unint64_t v8 = a3;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Set selected tab (%lu) outside of label count (%lu)", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_applySelectedTab:(unint64_t)a3
{
  -[NSMutableArray objectAtIndexedSubscript:](self->_labels, "objectAtIndexedSubscript:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(NTKFaceEditingTabsView *)self _containerOffsetForLabelAtIndex:a3];
  double v6 = v5;
  [(UIView *)self->_labelContainer frame];
  [(UIView *)self->_labelContainer setFrame:v6];
  [(NSMutableArray *)self->_labels enumerateObjectsUsingBlock:&__block_literal_global_121];
  int v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [v8 setColor:v7];
}

void __44__NTKFaceEditingTabsView__applySelectedTab___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  id v3 = a2;
  id v4 = [v2 colorWithWhite:0.2 alpha:1.0];
  [v3 setColor:v4];
}

- (void)applyTransitionFraction:(double)a3 fromTab:(unint64_t)a4 toTab:(unint64_t)a5
{
  if (a3 != 0.0 && a4 != a5)
  {
    [(UIView *)self->_labelContainer frame];
    [(NTKFaceEditingTabsView *)self _containerOffsetForLabelAtIndex:a4];
    [(NTKFaceEditingTabsView *)self _containerOffsetForLabelAtIndex:a5];
    CLKInterpolateBetweenFloatsUnclipped();
    -[UIView setFrame:](self->_labelContainer, "setFrame:");
    id v13 = [(NSMutableArray *)self->_labels objectAtIndexedSubscript:a4];
    CLKInterpolateBetweenFloatsClipped();
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:");
    [v13 setColor:v10];

    uint64_t v11 = [(NSMutableArray *)self->_labels objectAtIndexedSubscript:a5];
    CLKInterpolateBetweenFloatsClipped();
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:");
    [v11 setColor:v12];
  }
}

- (double)_containerOffsetForLabelAtIndex:(int64_t)a3
{
  if (![(NSMutableArray *)self->_labels count]) {
    return 0.0;
  }
  labels = self->_labels;
  if (a3 < 0)
  {
    id v8 = [(NSMutableArray *)labels firstObject];
    [v8 frame];
    double MidX = -CGRectGetMidX(v14);
  }
  else
  {
    unint64_t v6 = [(NSMutableArray *)labels count];
    int v7 = self->_labels;
    if (v6 >= a3)
    {
      id v8 = [(NSMutableArray *)v7 objectAtIndexedSubscript:a3];
      [v8 frame];
      double MidX = CGRectGetMidX(v15);
    }
    else
    {
      id v8 = [(NSMutableArray *)v7 lastObject];
      [v8 frame];
      double MaxX = CGRectGetMaxX(v12);
      [v8 frame];
      double MidX = MaxX + CGRectGetWidth(v13) * 0.5;
    }
  }

  [(NTKFaceEditingTabsView *)self bounds];
  return CGRectGetMidX(v16) - MidX;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceEditingTabsView;
  [(NTKFaceEditingTabsView *)&v3 layoutSubviews];
  [(NTKFaceEditingTabsView *)self _applyOrderedTabsAndLayout];
  [(NTKFaceEditingTabsView *)self setSelectedTab:[(NTKFaceEditingTabsView *)self selectedTab]];
}

- (NSArray)orderedTabs
{
  return self->_orderedTabs;
}

- (unint64_t)selectedTab
{
  return self->_selectedTab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedTabs, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);

  objc_storeStrong((id *)&self->_labels, 0);
}

@end