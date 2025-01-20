@interface UIKBRecentInputsView
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)recentInputStrings;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)flowLayout;
- (UIKBRecentInputsView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)selectedRecentInputString;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)focusableVariantCount;
- (void)refreshSelectedRecent;
- (void)scrollViewDidChangeContentSize:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setRecentInputStrings:(id)a3;
- (void)setRecentInputs:(id)a3;
- (void)setVerticalLayout:(BOOL)a3;
- (void)setupCollectionView;
@end

@implementation UIKBRecentInputsView

- (UIKBRecentInputsView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBRecentInputsView;
  v5 = -[UIKBKeyView initWithFrame:keyplane:key:](&v8, sel_initWithFrame_keyplane_key_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(UIView *)v5 setUserInteractionEnabled:1];
    [(UIKBRecentInputsView *)v6 setupCollectionView];
  }
  return v6;
}

- (void)refreshSelectedRecent
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(UIKBKeyView *)self key];
  unint64_t v4 = [v3 selectedVariantIndex];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [(UIKBRecentInputsView *)self collectionView];
    v6 = [v5 indexPathsForSelectedItems];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v13 = [(UIKBRecentInputsView *)self collectionView];
          [v13 deselectItemAtIndexPath:v12 animated:1];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v14 = [(UIKBRecentInputsView *)self recentInputStrings];
    unint64_t v15 = [v14 count];

    if (v4 >= v15)
    {
      v16 = [(UIKBRecentInputsView *)self recentInputStrings];
      unint64_t v4 = [v16 count] - 1;
    }
    id v18 = [(UIKBRecentInputsView *)self collectionView];
    v17 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:0];
    [v18 selectItemAtIndexPath:v17 animated:1 scrollPosition:16];
  }
}

- (id)selectedRecentInputString
{
  v3 = [(UIKBKeyView *)self key];
  uint64_t v4 = [v3 selectedVariantIndex];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(UIKBKeyView *)self key];
    uint64_t v7 = [v6 selectedVariantIndex];
    uint64_t v8 = [(UIKBRecentInputsView *)self recentInputStrings];
    uint64_t v9 = [v8 count] - 1;

    if (v7 == v9)
    {
      v5 = @"⊗";
    }
    else
    {
      uint64_t v10 = [(UIKBRecentInputsView *)self recentInputStrings];
      v11 = [(UIKBKeyView *)self key];
      objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v11, "selectedVariantIndex"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (unint64_t)focusableVariantCount
{
  v2 = [(UIKBRecentInputsView *)self recentInputStrings];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)setVerticalLayout:(BOOL)a3
{
  BOOL v3 = a3;
  self->_verticalLayout = a3;
  id v4 = [(UIKBRecentInputsView *)self flowLayout];
  [v4 setScrollDirection:!v3];
}

- (void)setRecentInputs:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  uint64_t v7 = [v5 entries];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__UIKBRecentInputsView_setRecentInputs___block_invoke;
  v11[3] = &unk_1E52F9F88;
  id v8 = v6;
  id v12 = v8;
  [v7 enumerateObjectsUsingBlock:v11];

  if (self->_verticalLayout)
  {
    uint64_t v9 = UIKeyboardLocalizedString(@"UI-ClearRecentInputs", 0, 0, 0);
    [v8 addObject:v9];
  }
  else
  {
    [v8 addObject:@"⊗"];
  }
  [(UIKBRecentInputsView *)self setRecentInputStrings:v8];
  uint64_t v10 = [(UIKBRecentInputsView *)self collectionView];
  [v10 reloadData];
}

void __40__UIKBRecentInputsView_setRecentInputs___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 documentText];
  [v2 addObject:v3];
}

- (void)setupCollectionView
{
  id v3 = objc_alloc_init(UICollectionViewFlowLayout);
  [(UIKBRecentInputsView *)self setFlowLayout:v3];

  [(UIKBRecentInputsView *)self setVerticalLayout:0];
  id v4 = [UICollectionView alloc];
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(UIKBRecentInputsView *)self flowLayout];
  v14 = -[UICollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);

  [(UICollectionView *)v14 setDataSource:self];
  [(UICollectionView *)v14 setDelegate:self];
  [(UICollectionView *)v14 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"recentInputCell"];
  [(UIScrollView *)v14 setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)v14 setShowsVerticalScrollIndicator:0];
  [(UIView *)v14 setClipsToBounds:0];
  [(UIView *)self addSubview:v14];
  [(UIKBRecentInputsView *)self setCollectionView:v14];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(UIKBRecentInputsView *)self recentInputStrings];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"recentInputCell" forIndexPath:v6];
  double v8 = [(UIKBRecentInputsView *)self recentInputStrings];
  uint64_t v9 = [v6 row];

  double v10 = [v8 objectAtIndex:v9];

  [v7 setInputText:v10];
  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  double v7 = [(UIKBRecentInputsView *)self recentInputStrings];
  uint64_t v8 = [v6 row];

  uint64_t v9 = [v7 objectAtIndex:v8];

  double v10 = [(UIView *)self _inheritedRenderConfig];
  double v11 = +[UIKBRecentInputCell titleAttributesForRenderConfig:v10];
  [v9 sizeWithAttributes:v11];
  double v13 = v12;
  uint64_t v15 = v14;

  if (self->_verticalLayout)
  {
    [(UIView *)self bounds];
    double v17 = v16;
  }
  else
  {
    if (v13 + 40.0 <= 1400.0) {
      double v17 = v13 + 40.0;
    }
    else {
      double v17 = 1400.0;
    }
    *(double *)&uint64_t v15 = 60.0;
  }

  double v18 = v17;
  double v19 = *(double *)&v15;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)scrollViewDidChangeContentSize:(id)a3
{
  id v20 = a3;
  [v20 contentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [v20 contentSize];
  double v10 = v9;
  [v20 frame];
  double v11 = 0.0;
  BOOL v13 = v10 < v12;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  if (v13)
  {
    objc_msgSend(v20, "frame", 0.0, 0.0, 0.0, 0.0);
    double v18 = v17;
    [v20 contentSize];
    double v14 = (v18 - v19) * 0.5;
    double v11 = v4;
    double v15 = v6;
    double v16 = v8;
  }
  objc_msgSend(v20, "setContentInset:", v11, v14, v15, v16);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSArray)recentInputStrings
{
  return self->_recentInputStrings;
}

- (void)setRecentInputStrings:(id)a3
{
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_recentInputStrings, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end