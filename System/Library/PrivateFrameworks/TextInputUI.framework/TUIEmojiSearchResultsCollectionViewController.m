@interface TUIEmojiSearchResultsCollectionViewController
+ (double)emojiFontSize;
+ (id)emojiTextAttributes;
- (BOOL)_isSelectableEmojiTokenAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)displayingNoResultsLabel;
- (BOOL)displayingVerbatimResults;
- (BOOL)isCellHighlightFrozen;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)displayedEmojis;
- (TUIEmojiSearchResultsCollectionViewController)init;
- (TUIEmojiSearchResultsCollectionViewControllerDelegate)delegate;
- (UICollectionViewDiffableDataSource)dataSource;
- (UILabel)noResultsLabel;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (_InvertibleFlowLayout)flowLayout;
- (id)_userPreferredEmojiStringVariantForToken:(id)a3;
- (id)configuredEmojiCollectionViewCellForCollectionView:(id)a3 atIndexPath:(id)a4 forEmojiString:(id)a5;
- (void)_didRecognizeLongPressGesture:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)resetScrollPositionAnimated:(BOOL)a3;
- (void)setCellHighlightFrozen:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedEmojis:(id)a3;
- (void)setDisplayedEmojis:(id)a3 verbatimSkinTones:(BOOL)a4 animated:(BOOL)a5;
- (void)setDisplayingNoResultsLabel:(BOOL)a3;
- (void)setDisplayingNoResultsLabel:(BOOL)a3 animated:(BOOL)a4;
- (void)setDisplayingVerbatimResults:(BOOL)a3;
- (void)setFlowLayout:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setNoResultsLabel:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TUIEmojiSearchResultsCollectionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_noResultsLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderIdentifiers, 0);
  objc_storeStrong((id *)&self->_displayedEmojis, 0);
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setFlowLayout:(id)a3
{
}

- (_InvertibleFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setNoResultsLabel:(id)a3
{
}

- (UILabel)noResultsLabel
{
  return self->_noResultsLabel;
}

- (BOOL)displayingNoResultsLabel
{
  return self->_displayingNoResultsLabel;
}

- (void)setDisplayingVerbatimResults:(BOOL)a3
{
  self->_displayingVerbatimResults = a3;
}

- (BOOL)displayingVerbatimResults
{
  return self->_displayingVerbatimResults;
}

- (NSArray)displayedEmojis
{
  return self->_displayedEmojis;
}

- (BOOL)isCellHighlightFrozen
{
  return self->_cellHighlightFrozen;
}

- (void)setDelegate:(id)a3
{
}

- (TUIEmojiSearchResultsCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIEmojiSearchResultsCollectionViewControllerDelegate *)WeakRetained;
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(TUIEmojiSearchResultsCollectionViewController *)self isCellHighlightFrozen])
  {
    v7 = [v8 cellForItemAtIndexPath:v6];
    [v7 setHighlighted:1];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v11 = a4;
  v5 = [(TUIEmojiSearchResultsCollectionViewController *)self dataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v11];

  v7 = -[NSArray objectAtIndex:](self->_displayedEmojis, "objectAtIndex:", [v6 unsignedIntegerValue]);
  id v8 = [v7 string];
  if (!self->_displayingVerbatimResults)
  {
    uint64_t v9 = [(TUIEmojiSearchResultsCollectionViewController *)self _userPreferredEmojiStringVariantForToken:v7];

    id v8 = (void *)v9;
  }
  v10 = [(TUIEmojiSearchResultsCollectionViewController *)self delegate];
  [v10 emojiSearchResultsController:self didSelectEmoji:v8 indexPath:v11];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return [(TUIEmojiSearchResultsCollectionViewController *)self _isSelectableEmojiTokenAtIndexPath:a4];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return [(TUIEmojiSearchResultsCollectionViewController *)self _isSelectableEmojiTokenAtIndexPath:a4];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__TUIEmojiSearchResultsCollectionViewController_collectionView_layout_sizeForItemAtIndexPath___block_invoke;
  block[3] = &unk_1E55941A8;
  block[4] = self;
  if (collectionView_layout_sizeForItemAtIndexPath__onceToken != -1) {
    dispatch_once(&collectionView_layout_sizeForItemAtIndexPath__onceToken, block);
  }
  id v6 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
  [v6 bounds];
  CGFloat Height = CGRectGetHeight(v12);

  double v8 = *(double *)&collectionView_layout_sizeForItemAtIndexPath__emojiWidth;
  double v9 = Height;
  result.height = v9;
  result.width = v8;
  return result;
}

void __94__TUIEmojiSearchResultsCollectionViewController_collectionView_layout_sizeForItemAtIndexPath___block_invoke()
{
  id v1 = [(id)objc_opt_class() emojiTextAttributes];
  [@"😀" sizeWithAttributes:v1];
  collectionView_layout_sizeForItemAtIndexPath__emojiWidth = ceil(v0);
}

- (void)_didRecognizeLongPressGesture:(id)a3
{
  id v4 = a3;
  v5 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  v10 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
  uint64_t v27 = objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9);

  if (v27
    && [(TUIEmojiSearchResultsCollectionViewController *)self _isSelectableEmojiTokenAtIndexPath:v27])
  {
    id v11 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v27];
    CGRect v12 = -[NSArray objectAtIndex:](self->_displayedEmojis, "objectAtIndex:", [v11 unsignedIntegerValue]);
    if ([v12 supportsSkinToneVariants])
    {
      v13 = (void *)MEMORY[0x1E4F610B8];
      v14 = [v12 string];
      v15 = [v13 _baseStringForEmojiString:v14];

      if (([MEMORY[0x1E4F61068] _isCoupleMultiSkinToneEmoji:v15] & 1) == 0)
      {
        v16 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
        v17 = [v16 layoutAttributesForItemAtIndexPath:v27];
        [v17 frame];
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;

        v26 = [(TUIEmojiSearchResultsCollectionViewController *)self delegate];
        objc_msgSend(v26, "emojiSearchResultsController:didRequestVariantSelectorForEmojiToken:fromRect:", self, v12, v19, v21, v23, v25);
      }
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TUIEmojiSearchResultsCollectionViewController;
  id v5 = a4;
  [(TUIEmojiSearchResultsCollectionViewController *)&v7 viewDidLayoutSubviews];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__TUIEmojiSearchResultsCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v6[3] = &unk_1E5593EC8;
  v6[4] = self;
  [v5 animateAlongsideTransition:v6 completion:0];
}

void __100__TUIEmojiSearchResultsCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) flowLayout];
  [v1 invalidateLayout];
}

- (BOOL)_isSelectableEmojiTokenAtIndexPath:(id)a3
{
  unint64_t v4 = [a3 row];
  return v4 < [(NSArray *)self->_displayedEmojis count];
}

- (void)setCellHighlightFrozen:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_cellHighlightFrozen = a3;
  if (!a3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
    unint64_t v4 = [v3 visibleCells];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) setHighlighted:0];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)resetScrollPositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
  objc_msgSend(v4, "setContentOffset:animated:", v3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)setDisplayedEmojis:(id)a3
{
}

- (void)setDisplayingNoResultsLabel:(BOOL)a3 animated:(BOOL)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  if (self->_displayingNoResultsLabel != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_displayingNoResultsLabel = a3;
    if (a3 && !self->_noResultsLabel)
    {
      id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
      double v8 = (UILabel *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      noResultsLabel = self->_noResultsLabel;
      self->_noResultsLabel = v8;

      [(UILabel *)self->_noResultsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      long long v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v11 = [v10 localizedStringInDeviceLanguageForKey:@"NO_RESULTS"];
      [(UILabel *)self->_noResultsLabel setText:v11];

      long long v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
      [(UILabel *)self->_noResultsLabel setFont:v12];

      [(UILabel *)self->_noResultsLabel setTextAlignment:1];
      v13 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_417];
      [(UILabel *)self->_noResultsLabel setTextColor:v13];

      uint64_t v14 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
      v15 = [v14 superview];
      v16 = self->_noResultsLabel;
      v17 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
      [v15 insertSubview:v16 belowSubview:v17];

      uint64_t v27 = (void *)MEMORY[0x1E4F28DC8];
      v29 = [(UILabel *)self->_noResultsLabel centerXAnchor];
      v30 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
      v28 = [v30 centerXAnchor];
      double v18 = [v29 constraintEqualToAnchor:v28];
      v33[0] = v18;
      double v19 = [(UILabel *)self->_noResultsLabel centerYAnchor];
      double v20 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
      double v21 = [v20 centerYAnchor];
      double v22 = [v19 constraintEqualToAnchor:v21];
      v33[1] = v22;
      double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      [v27 activateConstraints:v23];

      [(UILabel *)self->_noResultsLabel setAlpha:0.0];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__TUIEmojiSearchResultsCollectionViewController_setDisplayingNoResultsLabel_animated___block_invoke_2;
    aBlock[3] = &unk_1E55942B0;
    aBlock[4] = self;
    BOOL v32 = v5;
    double v24 = _Block_copy(aBlock);
    double v25 = v24;
    if (v4)
    {
      double v26 = 0.2;
      if (v5) {
        double v26 = 0.33;
      }
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v24 animations:v26];
    }
    else
    {
      (*((void (**)(void *))v24 + 2))(v24);
    }
  }
}

uint64_t __86__TUIEmojiSearchResultsCollectionViewController_setDisplayingNoResultsLabel_animated___block_invoke_2(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1072) setAlpha:v1];
}

id __86__TUIEmojiSearchResultsCollectionViewController_setDisplayingNoResultsLabel_animated___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 1) {
    [MEMORY[0x1E4FB1618] colorWithRed:0.518 green:0.553 blue:0.6 alpha:1.0];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  return v2;
}

- (void)setDisplayingNoResultsLabel:(BOOL)a3
{
}

- (void)setDisplayedEmojis:(id)a3 verbatimSkinTones:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  self->_animatingCellUpdates = v5;
  self->_animationBeginOffset = -1;
  self->_displayingVerbatimResults = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v9 appendSectionsWithIdentifiers:&unk_1EDC79B18];
  long long v10 = (void *)MEMORY[0x1E4F1CA48];
  long long v11 = (NSArray *)v8;
  long long v12 = [v10 array];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __AsIdentifiers_block_invoke;
  v38[3] = &unk_1E5593388;
  id v39 = v12;
  id v13 = v12;
  [(NSArray *)v11 enumerateObjectsUsingBlock:v38];

  [v9 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:&unk_1EDC798F0];
  if (self->_placeholderIdentifiers)
  {
    objc_msgSend(v9, "deleteItemsWithIdentifiers:");
    placeholderIdentifiers = self->_placeholderIdentifiers;
    self->_placeholderIdentifiers = 0;
  }
  v15 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
  v16 = [v15 visibleCells];
  uint64_t v17 = [v16 count];
  uint64_t v18 = v17 - [v9 numberOfItems];

  if (v18 >= 1)
  {
    if (AnimationPlaceholderCellIdentifiersWithCount_onceToken != -1) {
      dispatch_once(&AnimationPlaceholderCellIdentifiersWithCount_onceToken, &__block_literal_global_312);
    }
    if ((unint64_t)v18 >= 0x14) {
      uint64_t v19 = 20;
    }
    else {
      uint64_t v19 = v18;
    }
    objc_msgSend((id)AnimationPlaceholderCellIdentifiersWithCount_placeholderIdentifiers, "subarrayWithRange:", 0, v19);
    double v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    double v21 = self->_placeholderIdentifiers;
    self->_placeholderIdentifiers = v20;

    [v9 appendItemsWithIdentifiers:self->_placeholderIdentifiers];
  }
  displayedEmojis = self->_displayedEmojis;
  self->_displayedEmojis = v11;
  double v23 = v11;

  double v24 = [(TUIEmojiSearchResultsCollectionViewController *)self dataSource];
  [v24 applySnapshotUsingReloadData:v9];

  [(TUIEmojiSearchResultsCollectionViewController *)self setDisplayingNoResultsLabel:[(NSArray *)v23 count] == 0 animated:v5];
  unint64_t v25 = [(NSArray *)v23 count];

  self->_lastAnimatedCellCount = v25;
  self->_animatingCellUpdates = 0;
  double v26 = [(TUIEmojiSearchResultsCollectionViewController *)self flowLayout];
  [v26 collectionViewContentSize];
  double v28 = v27;
  double v30 = v29;

  if (v28 > 0.0)
  {
    v31 = [(TUIEmojiSearchResultsCollectionViewController *)self flowLayout];
    [v31 minimumLineSpacing];
    double v33 = v32;
    v34 = [(TUIEmojiSearchResultsCollectionViewController *)self flowLayout];
    [v34 itemSize];
    double v36 = v28 - (v33 + v35) * (double)v18;

    v37 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
    objc_msgSend(v37, "setContentSize:", v36, v30);
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)TUIEmojiSearchResultsCollectionViewController;
  [(TUIEmojiSearchResultsCollectionViewController *)&v6 viewDidLoad];
  for (uint64_t i = 0; i != 20; ++i)
  {
    BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"emojistr__%lu", i);
    BOOL v5 = [(TUIEmojiSearchResultsCollectionViewController *)self collectionView];
    [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:v4];
  }
}

- (id)configuredEmojiCollectionViewCellForCollectionView:(id)a3 atIndexPath:(id)a4 forEmojiString:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v9 integerValue] < 0)
  {
    long long v11 = 0;
    v16 = 0;
  }
  else
  {
    long long v11 = -[NSArray objectAtIndex:](self->_displayedEmojis, "objectAtIndex:", [v9 unsignedIntegerValue]);
    long long v12 = [v11 string];
    if (!self->_displayingVerbatimResults)
    {
      uint64_t v13 = [(TUIEmojiSearchResultsCollectionViewController *)self _userPreferredEmojiStringVariantForToken:v11];

      long long v12 = (void *)v13;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    v15 = +[TUIEmojiSearchResultsCollectionViewController emojiTextAttributes];
    v16 = (void *)[v14 initWithString:v12 attributes:v15];
  }
  unint64_t v17 = [v8 row];
  uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"emojistr__%lu", v17 % 0x14);
  uint64_t v19 = [v10 dequeueReusableCellWithReuseIdentifier:v18 forIndexPath:v8];

  if ([v8 row] >= self->_lastAnimatedCellCount) {
    [v19 setDisplayedEmojiString:0];
  }
  if (!self->_animatingCellUpdates)
  {
    unint64_t v23 = [v8 row];
    goto LABEL_13;
  }
  double v20 = [v19 displayedEmojiString];
  if ([v20 length])
  {
    double v21 = [v19 displayedEmojiString];
    char v22 = [v16 isEqualToAttributedString:v21];

    unint64_t v23 = [v8 row];
    if ((v22 & 1) == 0) {
      goto LABEL_15;
    }
LABEL_13:
    uint64_t v24 = 0;
    goto LABEL_18;
  }

  unint64_t v23 = [v8 row];
LABEL_15:
  unint64_t animationBeginOffset = self->_animationBeginOffset;
  if (v23 < animationBeginOffset)
  {
    self->_unint64_t animationBeginOffset = v23;
    unint64_t animationBeginOffset = v23;
  }
  v23 -= animationBeginOffset;
  uint64_t v24 = 1;
LABEL_18:
  if (_os_feature_enabled_impl()) {
    uint64_t v26 = [v11 supportsSkinToneVariants] ^ 1;
  }
  else {
    uint64_t v26 = 0;
  }
  [v19 setDragEnabled:v26];
  [v19 setDisplayedEmojiString:v16 animated:v24 withAnimationOffset:v23];

  return v19;
}

- (id)_userPreferredEmojiStringVariantForToken:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4FB18F8];
  id v4 = a3;
  BOOL v5 = [v3 sharedInstance];
  objc_super v6 = [v4 string];

  id v7 = [v5 lastUsedVariantEmojiForEmojiString:v6];

  return v7;
}

- (TUIEmojiSearchResultsCollectionViewController)init
{
  BOOL v3 = objc_alloc_init(_InvertibleFlowLayout);
  v25.receiver = self;
  v25.super_class = (Class)TUIEmojiSearchResultsCollectionViewController;
  id v4 = [(TUIEmojiSearchResultsCollectionViewController *)&v25 initWithCollectionViewLayout:v3];
  BOOL v5 = v4;
  if (v4)
  {
    [(TUIEmojiSearchResultsCollectionViewController *)v4 setFlowLayout:v3];
    id v6 = objc_alloc(MEMORY[0x1E4FB1598]);
    id v7 = [(TUIEmojiSearchResultsCollectionViewController *)v5 collectionView];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __53__TUIEmojiSearchResultsCollectionViewController_init__block_invoke;
    v23[3] = &unk_1E5593360;
    id v8 = v5;
    uint64_t v24 = v8;
    id v9 = (void *)[v6 initWithCollectionView:v7 cellProvider:v23];
    [(TUIEmojiSearchResultsCollectionViewController *)v8 setDataSource:v9];

    id v10 = [(TUIEmojiSearchResultsCollectionViewController *)v8 dataSource];
    long long v11 = [v10 snapshot];

    [v11 appendSectionsWithIdentifiers:&unk_1EDC79B00];
    long long v12 = [(TUIEmojiSearchResultsCollectionViewController *)v8 dataSource];
    [v12 applySnapshotUsingReloadData:v11];

    uint64_t v13 = [MEMORY[0x1E4FB1618] clearColor];
    id v14 = [(TUIEmojiSearchResultsCollectionViewController *)v8 collectionView];
    [v14 setBackgroundColor:v13];

    v15 = [(TUIEmojiSearchResultsCollectionViewController *)v8 collectionView];
    [v15 setShowsHorizontalScrollIndicator:0];

    v16 = [(TUIEmojiSearchResultsCollectionViewController *)v8 collectionView];
    [v16 setShowsVerticalScrollIndicator:0];

    unint64_t v17 = [(TUIEmojiSearchResultsCollectionViewController *)v8 collectionView];
    [v17 setDelegate:v8];

    [(UICollectionViewFlowLayout *)v3 setScrollDirection:1];
    [(UICollectionViewFlowLayout *)v3 setSectionInsetReference:2];
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v8 action:sel__didRecognizeLongPressGesture_];
    [(TUIEmojiSearchResultsCollectionViewController *)v8 setLongPressGestureRecognizer:v18];

    uint64_t v19 = [(TUIEmojiSearchResultsCollectionViewController *)v8 collectionView];
    double v20 = [(TUIEmojiSearchResultsCollectionViewController *)v8 longPressGestureRecognizer];
    [v19 addGestureRecognizer:v20];

    v8->_unint64_t animationBeginOffset = -1;
    v8->_lastAnimatedCellCount = -1;
    v8->_animatingCellUpdates = 0;
    displayedEmojis = v8->_displayedEmojis;
    v8->_displayedEmojis = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

uint64_t __53__TUIEmojiSearchResultsCollectionViewController_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) configuredEmojiCollectionViewCellForCollectionView:a2 atIndexPath:a3 forEmojiString:a4];
}

+ (id)emojiTextAttributes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  v2 = [MEMORY[0x1E4FB08E0] systemFontOfSize:38.0];
  v6[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (double)emojiFontSize
{
  return 38.0;
}

@end