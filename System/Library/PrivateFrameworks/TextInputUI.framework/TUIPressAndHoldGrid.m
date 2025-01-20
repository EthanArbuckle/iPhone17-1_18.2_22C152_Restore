@interface TUIPressAndHoldGrid
- (BOOL)handleNumberKey:(unint64_t)a3;
- (BOOL)handleSelection;
- (BOOL)hasAccentVariantInForwardDirection:(BOOL)a3;
- (BOOL)indexPathIsValid:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)contentSize;
- (NSArray)accentVariants;
- (NSIndexPath)firstIndexPath;
- (NSIndexPath)lastIndexPath;
- (NSIndexPath)selectedIndexPath;
- (NSString)selectedAccentVariant;
- (TUIPressAndHoldGrid)initWithFrame:(CGRect)a3 accentVariants:(id)a4;
- (TUIPressAndHoldGridDelegate)delegate;
- (UICollectionView)collectionView;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (id)accentAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForAccentVariantNumber:(unint64_t)a3;
- (id)indexPathInForwardDirection:(BOOL)a3;
- (id)showAccentVariantInForwardDirection:(BOOL)a3;
- (id)visibleAttributes;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)accentVariantNumberForIndexPath:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)forceUpdateVisibleCells;
- (void)layoutSubviews;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
@end

@implementation TUIPressAndHoldGrid

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_accentVariants, 0);
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setDelegate:(id)a3
{
}

- (TUIPressAndHoldGridDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIPressAndHoldGridDelegate *)WeakRetained;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (NSArray)accentVariants
{
  return self->_accentVariants;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TUIPressAndHoldGrid *)self accentAtIndexPath:v6];
  v9 = +[TUIPressAndHoldViewCell reuseIdentifier];
  v10 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

  [v10 setAccentVariant:v8];
  v11 = [(TUIPressAndHoldGrid *)self selectedIndexPath];
  uint64_t v12 = [v6 isEqual:v11];

  [v10 setSelected:v12];
  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(TUIPressAndHoldGrid *)self accentVariants];
  int64_t v5 = [v4 count];

  return v5;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 5.0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    v11 = [v13 layoutAttributesForItemAtIndexPath:v9];
    uint64_t v12 = [(TUIPressAndHoldGrid *)self selectedIndexPath];
    objc_msgSend(v10, "setSelected:", objc_msgSend(v12, "isEqual:", v9));

    objc_msgSend(v10, "setAccentVariantNumber:", -[TUIPressAndHoldGrid accentVariantNumberForIndexPath:](self, "accentVariantNumberForIndexPath:", v9));
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v9 = a4;
  int64_t v5 = [(TUIPressAndHoldGrid *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(TUIPressAndHoldGrid *)self delegate];
    id v8 = [(TUIPressAndHoldGrid *)self accentAtIndexPath:v9];
    [v7 pressAndHoldGridDidAcceptAccentVariant:v8 atIndexPath:v9];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5 = 46.0;
  double v6 = 30.0;
  result.double height = v5;
  result.double width = v6;
  return result;
}

- (void)forceUpdateVisibleCells
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(TUIPressAndHoldGrid *)self collectionView];
  v4 = [v3 indexPathsForVisibleItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = [(TUIPressAndHoldGrid *)self collectionView];
        v11 = [v10 cellForItemAtIndexPath:v9];

        uint64_t v12 = [(TUIPressAndHoldGrid *)self collectionView];
        [(TUIPressAndHoldGrid *)self collectionView:v12 willDisplayCell:v11 forItemAtIndexPath:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (BOOL)handleSelection
{
  BOOL v3 = [(TUIPressAndHoldGrid *)self indexPathIsValid:self->_selectedIndexPath];
  if (v3)
  {
    v4 = [(TUIPressAndHoldGrid *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = [(TUIPressAndHoldGrid *)self delegate];
      uint64_t v7 = [(TUIPressAndHoldGrid *)self accentAtIndexPath:self->_selectedIndexPath];
      [v6 pressAndHoldGridDidAcceptAccentVariant:v7 atIndexPath:self->_selectedIndexPath];
    }
  }
  return v3;
}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  v4 = [(TUIPressAndHoldGrid *)self indexPathForAccentVariantNumber:a3];
  BOOL v5 = [(TUIPressAndHoldGrid *)self indexPathIsValid:v4];
  if (v5)
  {
    uint64_t v6 = [(TUIPressAndHoldGrid *)self accentAtIndexPath:v4];
    [(TUIPressAndHoldGrid *)self setSelectedIndexPath:v4];
    uint64_t v7 = [(TUIPressAndHoldGrid *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      uint64_t v9 = [(TUIPressAndHoldGrid *)self delegate];
      [v9 pressAndHoldGridDidAcceptAccentVariant:v6 atIndexPath:v4];
    }
  }

  return v5;
}

- (id)indexPathForAccentVariantNumber:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 - 1 > 8)
  {
    uint64_t v12 = 0;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v5 = [(TUIPressAndHoldGrid *)self collectionView];
    uint64_t v6 = [v5 visibleCells];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 accentVariantNumber] == a3)
          {
            uint64_t v12 = [(UICollectionView *)self->_collectionView indexPathForCell:v11];
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v12 = 0;
LABEL_13:
  }
  return v12;
}

- (id)visibleAttributes
{
  BOOL v3 = [(TUIPressAndHoldGrid *)self collectionView];
  [v3 visibleBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(TUIPressAndHoldGrid *)self collectionView];
  long long v13 = [v12 collectionViewLayout];
  long long v14 = objc_msgSend(v13, "layoutAttributesForElementsInRect:", v5, v7, v9, v11);

  long long v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_4816];
  long long v16 = [v14 filteredArrayUsingPredicate:v15];

  long long v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_12];

  return v17;
}

uint64_t __40__TUIPressAndHoldGrid_visibleAttributes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 indexPath];
  double v6 = [v4 indexPath];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __40__TUIPressAndHoldGrid_visibleAttributes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 representedElementCategory] == 0;
}

- (unint64_t)accentVariantNumberForIndexPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TUIPressAndHoldGrid *)self visibleAttributes];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "indexPath", (void)v15);
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          uint64_t v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_12:

  return v11 + 1;
}

- (id)showAccentVariantInForwardDirection:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[TUIPressAndHoldGrid indexPathInForwardDirection:](self, "indexPathInForwardDirection:");
  if (v5)
  {
LABEL_2:
    [(TUIPressAndHoldGrid *)self setSelectedIndexPath:v5 animated:0 scrollPosition:0];
    goto LABEL_5;
  }
  uint64_t v6 = [(TUIPressAndHoldGrid *)self selectedIndexPath];

  if (!v6)
  {
    if (v3) {
      [(TUIPressAndHoldGrid *)self firstIndexPath];
    }
    else {
    id v5 = [(TUIPressAndHoldGrid *)self lastIndexPath];
    }
    if (!v5) {
      goto LABEL_5;
    }
    goto LABEL_2;
  }
  id v5 = 0;
LABEL_5:
  uint64_t v7 = [(TUIPressAndHoldGrid *)self accentAtIndexPath:v5];

  return v7;
}

- (BOOL)hasAccentVariantInForwardDirection:(BOOL)a3
{
  BOOL v3 = [(TUIPressAndHoldGrid *)self accentVariants];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)indexPathInForwardDirection:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TUIPressAndHoldGrid *)self selectedIndexPath];
  if ([(TUIPressAndHoldGrid *)self indexPathIsValid:v5])
  {
    uint64_t v6 = [v5 section];
    uint64_t v7 = [v5 row];
    if (v3) {
      unint64_t v8 = v7 + 1;
    }
    else {
      unint64_t v8 = v7 - 1;
    }
    if ((v8 & 0x8000000000000000) == 0)
    {
      uint64_t v9 = [(TUIPressAndHoldGrid *)self accentVariants];
      unint64_t v10 = [v9 count];

      if (v8 < v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:v6];
        goto LABEL_10;
      }
    }
    [(TUIPressAndHoldGrid *)self setSelectedIndexPath:0];
  }
  uint64_t v11 = 0;
LABEL_10:

  return v11;
}

- (NSString)selectedAccentVariant
{
  return (NSString *)[(TUIPressAndHoldGrid *)self accentAtIndexPath:self->_selectedIndexPath];
}

- (BOOL)indexPathIsValid:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || [v4 section] || objc_msgSend(v5, "row") < 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    unint64_t v8 = [(TUIPressAndHoldGrid *)self accentVariants];
    unint64_t v9 = [v8 count];
    BOOL v6 = v9 > [v5 row];
  }
  return v6;
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  unint64_t v9 = (NSIndexPath *)a3;
  unint64_t v10 = v9;
  if (self->_selectedIndexPath != v9 || [(NSIndexPath *)v9 isEqual:v9])
  {
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    if (v10 && [(TUIPressAndHoldGrid *)self indexPathIsValid:v10])
    {
      uint64_t v11 = [(TUIPressAndHoldGrid *)self collectionView];
      [v11 selectItemAtIndexPath:v10 animated:v6 scrollPosition:a5];

      uint64_t v12 = [(TUIPressAndHoldGrid *)self collectionView];
      char v13 = [v12 layoutAttributesForItemAtIndexPath:v10];
    }
    else
    {
      long long v14 = [(TUIPressAndHoldGrid *)self collectionView];
      long long v15 = [v14 indexPathsForSelectedItems];
      char v13 = [v15 firstObject];

      if (!v13)
      {
LABEL_9:

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __68__TUIPressAndHoldGrid_setSelectedIndexPath_animated_scrollPosition___block_invoke;
        v16[3] = &unk_1E55941A8;
        v16[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v16];
        goto LABEL_10;
      }
      uint64_t v12 = [(TUIPressAndHoldGrid *)self collectionView];
      [v12 deselectItemAtIndexPath:v13 animated:0];
    }

    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __68__TUIPressAndHoldGrid_setSelectedIndexPath_animated_scrollPosition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceUpdateVisibleCells];
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)lastIndexPath
{
  BOOL v3 = [(TUIPressAndHoldGrid *)self accentVariants];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28D58];
    BOOL v6 = [(TUIPressAndHoldGrid *)self accentVariants];
    uint64_t v7 = objc_msgSend(v5, "indexPathForRow:inSection:", objc_msgSend(v6, "count") - 1, 0);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (NSIndexPath *)v7;
}

- (NSIndexPath)firstIndexPath
{
  v2 = [(TUIPressAndHoldGrid *)self accentVariants];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSIndexPath *)v4;
}

- (id)accentAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(TUIPressAndHoldGrid *)self indexPathIsValid:v4])
  {
    id v5 = [(TUIPressAndHoldGrid *)self accentVariants];
    BOOL v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)TUIPressAndHoldGrid;
  [(TUIPressAndHoldGrid *)&v12 layoutSubviews];
  [(TUIPressAndHoldGrid *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TUIPressAndHoldGrid *)self collectionView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (TUIPressAndHoldGrid)initWithFrame:(CGRect)a3 accentVariants:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TUIPressAndHoldGrid;
  uint64_t v11 = -[TUIPressAndHoldGrid initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accentVariants, a4);
    id v13 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
    [v13 setMinimumInteritemSpacing:0.0];
    objc_msgSend(v13, "setSectionInset:", 5.0, 5.0, 5.0, 5.0);
    id v14 = objc_alloc(MEMORY[0x1E4FB1568]);
    [(TUIPressAndHoldGrid *)v12 bounds];
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:collectionViewLayout:", v13);
    collectionView = v12->_collectionView;
    v12->_collectionView = (UICollectionView *)v15;

    [(UICollectionView *)v12->_collectionView setDelegate:v12];
    [(UICollectionView *)v12->_collectionView setDataSource:v12];
    long long v17 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v12->_collectionView setBackgroundColor:v17];

    long long v18 = v12->_collectionView;
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = +[TUIPressAndHoldViewCell reuseIdentifier];
    [(UICollectionView *)v18 registerClass:v19 forCellWithReuseIdentifier:v20];

    -[UICollectionView setContentInset:](v12->_collectionView, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
    [(TUIPressAndHoldGrid *)v12 addSubview:v12->_collectionView];
  }
  return v12;
}

@end