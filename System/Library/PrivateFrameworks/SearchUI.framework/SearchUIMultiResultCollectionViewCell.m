@interface SearchUIMultiResultCollectionViewCell
- (BOOL)isExpandable;
- (BOOL)needsInternalFocus;
- (BOOL)setupManualFocus;
- (CGSize)sizeCollectionViewWithSize:(CGSize)a3;
- (SearchUIMultiResultCollectionView)multiCollectionView;
- (SearchUIMultiResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (TLKAuxilliaryTextView)folderLabelView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)viewForForcedFocus;
- (id)visibleResults;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)removeManualFocus;
- (void)returnKeyPressed;
- (void)setDelegate:(id)a3;
- (void)setFolderLabelView:(id)a3;
- (void)setMultiCollectionView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIMultiResultCollectionViewCell

- (id)visibleResults
{
  v2 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  v3 = [v2 visibleResults];

  return v3;
}

- (void)updateExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  [v7 setIsExpanded:v5 animated:v4];

  [(SearchUIMultiResultCollectionViewCell *)self invalidateIntrinsicContentSize];
  id v8 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  [v8 invalidateIntrinsicContentSize];
}

- (CGSize)sizeCollectionViewWithSize:(CGSize)a3
{
  CGFloat width = a3.width;
  BOOL v4 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  [v4 frame];
  objc_msgSend(v4, "setFrame:");
  BOOL v5 = [v4 collectionViewLayout];
  [v5 invalidateLayout];

  [v4 layoutBelowIfNeeded];
  v6 = [v4 collectionViewLayout];
  [v6 collectionViewContentSize];
  double v8 = v7;

  double v9 = width;
  double v10 = v8;
  result.height = v10;
  result.CGFloat width = v9;
  return result;
}

- (SearchUIMultiResultCollectionView)multiCollectionView
{
  return (SearchUIMultiResultCollectionView *)objc_getProperty(self, a2, 1008, 1);
}

- (void)removeManualFocus
{
  id v2 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  [v2 setHighlightFirstCell:0];
}

- (BOOL)isExpandable
{
  id v2 = [(SearchUICollectionViewCell *)self rowModel];
  v3 = [v2 results];
  unint64_t v4 = [v3 count];
  LOBYTE(v4) = v4 > +[SearchUIAppIconUtilities numberOfAppIconsPerRow];

  return v4;
}

- (SearchUIMultiResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  v3 = -[SearchUICollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  unint64_t v4 = v3;
  if (v3)
  {
    [(SearchUIMultiResultCollectionViewCell *)v3 setClipsToBounds:1];
    BOOL v5 = objc_opt_new();
    +[SearchUIAppIconUtilities appIconItemSize];
    objc_msgSend(v5, "setItemSize:");
    [v5 setMinimumInteritemSpacing:22.0];
    +[SearchUIAppIconUtilities distanceToTopOfAppIconsForMultiResultCell];
    objc_msgSend(v5, "setMinimumLineSpacing:");
    v6 = [SearchUIMultiResultCollectionView alloc];
    double v7 = -[SearchUIMultiResultCollectionView initWithFrame:collectionViewLayout:](v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(SearchUIMultiResultCollectionViewCell *)v4 setMultiCollectionView:v7];

    double v8 = [(SearchUIMultiResultCollectionViewCell *)v4 contentView];
    double v9 = [(SearchUIMultiResultCollectionViewCell *)v4 multiCollectionView];
    [v8 addSubview:v9];
  }
  return v4;
}

- (void)setMultiCollectionView:(id)a3
{
}

- (BOOL)needsInternalFocus
{
  return 1;
}

- (void)updateWithRowModel:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  id v4 = a3;
  [(SearchUICollectionViewCell *)&v22 updateWithRowModel:v4];
  BOOL v5 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  [v5 updateWithRowModel:v4];

  v6 = [v4 results];

  if ([v6 count] == 1
    && ([v6 firstObject],
        double v7 = objc_claimAutoreleasedReturnValue(),
        [v7 auxiliaryTopText],
        double v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v7,
        v9))
  {
    double v10 = [(SearchUIMultiResultCollectionViewCell *)self folderLabelView];

    if (!v10)
    {
      objc_super v11 = objc_opt_new();
      [(SearchUIMultiResultCollectionViewCell *)self setFolderLabelView:v11];

      v12 = [(SearchUIMultiResultCollectionViewCell *)self contentView];
      v13 = [(SearchUIMultiResultCollectionViewCell *)self folderLabelView];
      [v12 addSubview:v13];
    }
    v14 = (void *)MEMORY[0x1E4FAE128];
    v15 = [v6 firstObject];
    v16 = [v15 auxiliaryTopText];
    v17 = [v14 textWithString:v16];
    v18 = [(SearchUIMultiResultCollectionViewCell *)self folderLabelView];
    [v18 setTopText:v17];

    v19 = [(SearchUIMultiResultCollectionViewCell *)self folderLabelView];
    v20 = v19;
    uint64_t v21 = 0;
  }
  else
  {
    v19 = [(SearchUIMultiResultCollectionViewCell *)self folderLabelView];
    v20 = v19;
    uint64_t v21 = 1;
  }
  [v19 setHidden:v21];
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  id v4 = a3;
  [(SearchUICollectionViewCell *)&v6 setDelegate:v4];
  BOOL v5 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  [v5 setFeedbackDelegate:v4];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  [(SearchUICollectionViewCell *)&v37 layoutSubviews];
  [(SearchUIMultiResultCollectionViewCell *)self bounds];
  -[SearchUIMultiResultCollectionViewCell sizeCollectionViewWithSize:](self, "sizeCollectionViewWithSize:", v3, v4);
  uint64_t v5 = [(SearchUIMultiResultCollectionViewCell *)self folderLabelView];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    double v7 = [(SearchUIMultiResultCollectionViewCell *)self folderLabelView];
    char v8 = [v7 isHidden];

    if ((v8 & 1) == 0)
    {
      int v9 = [MEMORY[0x1E4FAE100] isLTR];
      double v10 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
      objc_super v11 = [v10 visibleCells];
      v12 = [v11 firstObject];
      [v12 frame];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;

      if (v9)
      {
        [(SearchUIMultiResultCollectionViewCell *)self bounds];
        double Width = CGRectGetWidth(v38);
        v39.origin.x = v14;
        v39.origin.y = v16;
        v39.size.CGFloat width = v18;
        v39.size.height = v20;
        double v22 = Width - CGRectGetMaxX(v39);
        v40.origin.x = v14;
        v40.origin.y = v16;
        v40.size.CGFloat width = v18;
        v40.size.height = v20;
        double MinX = CGRectGetMinX(v40);
      }
      else
      {
        v41.origin.x = v14;
        v41.origin.y = v16;
        v41.size.CGFloat width = v18;
        v41.size.height = v20;
        double v22 = CGRectGetMinX(v41);
        [(SearchUIMultiResultCollectionViewCell *)self bounds];
        double MaxX = CGRectGetMaxX(v42);
        v43.origin.x = v14;
        v43.origin.y = v16;
        v43.size.CGFloat width = v18;
        v43.size.height = v20;
        double MinX = MaxX - CGRectGetMaxX(v43);
      }
      double v25 = v22 - MinX;
      [(SearchUIMultiResultCollectionViewCell *)self bounds];
      double Height = CGRectGetHeight(v44);
      v27 = (void *)MEMORY[0x1E4FAE100];
      [(SearchUIMultiResultCollectionViewCell *)self bounds];
      CGFloat v28 = (CGRectGetHeight(v45) - Height) * 0.5;
      v29 = [(SearchUIMultiResultCollectionViewCell *)self contentView];
      [v27 deviceScaledRoundedValue:v29 forView:v28];
      double v31 = v30;

      v32 = (void *)MEMORY[0x1E4FAE100];
      if (v9)
      {
        [(SearchUIMultiResultCollectionViewCell *)self bounds];
        double MinX = CGRectGetWidth(v46) - v25 - MinX;
      }
      v33 = [(SearchUIMultiResultCollectionViewCell *)self contentView];
      [v32 deviceScaledRoundedValue:v33 forView:MinX];
      double v35 = v34;

      v36 = [(SearchUIMultiResultCollectionViewCell *)self folderLabelView];
      objc_msgSend(v36, "setFrame:", v35, v31, v25, Height);
    }
  }
}

- (TLKAuxilliaryTextView)folderLabelView
{
  return (TLKAuxilliaryTextView *)objc_getProperty(self, a2, 1016, 1);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  uint64_t v5 = -[SearchUICollectionViewCell hitTest:withEvent:](&v14, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if ([v5 isDescendantOfView:self]
    && ([(SearchUICollectionViewCell *)self rowModel],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        [v6 results],
        double v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8 == 1))
  {
    int v9 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
    double v10 = [v9 visibleCells];
    objc_super v11 = [v10 firstObject];
    id v12 = [v11 appIconView];
  }
  else
  {
    id v12 = v5;
  }

  return v12;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(SearchUICollectionViewCell *)self rowModel];
  uint64_t v5 = [v8 results];
  if ([v5 count] != 1)
  {
LABEL_4:

    return;
  }
  objc_super v6 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  if ([v6 highlightFirstCell])
  {

    goto LABEL_4;
  }
  double v7 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];

  if (!v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIMultiResultCollectionViewCell;
    [(SearchUICollectionViewCell *)&v9 setSelected:v3];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIMultiResultCollectionViewCell;
  [(SearchUICollectionViewCell *)&v12 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  double v7 = [(SearchUICollectionViewCell *)self rowModel];
  id v8 = [v7 results];
  uint64_t v9 = [v8 count];

  if (v9 == 1)
  {
    double v10 = [v6 nextFocusedView];
    objc_super v11 = [(SearchUIMultiResultCollectionViewCell *)self viewForForcedFocus];

    if (v10 == v11) {
      [(SearchUIMultiResultCollectionViewCell *)self setupManualFocus];
    }
    else {
      [(SearchUIMultiResultCollectionViewCell *)self removeManualFocus];
    }
  }
}

- (BOOL)setupManualFocus
{
  id v2 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  [v2 setHighlightFirstCell:1];

  return 1;
}

- (void)returnKeyPressed
{
  id v5 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  id v2 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  BOOL v3 = [v5 cellForItemAtIndexPath:v2];
  double v4 = [v3 appIconView];
  [v4 launchIcon];
}

- (id)viewForForcedFocus
{
  id v2 = [(SearchUIMultiResultCollectionViewCell *)self multiCollectionView];
  BOOL v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  double v4 = [v2 cellForItemAtIndexPath:v3];
  id v5 = [v4 appIconView];

  return v5;
}

- (void)setFolderLabelView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderLabelView, 0);
  objc_storeStrong((id *)&self->_multiCollectionView, 0);
}

@end