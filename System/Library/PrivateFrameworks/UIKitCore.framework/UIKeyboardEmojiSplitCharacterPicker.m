@interface UIKeyboardEmojiSplitCharacterPicker
+ (BOOL)wantsScreenTraits;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIKeyboardEmojiSplitCharacterPicker)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)snappedYOffsetForOffset:(double)a3;
- (id)category;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCategory:(id)a3;
- (void)updateToCategory:(int64_t)a3;
@end

@implementation UIKeyboardEmojiSplitCharacterPicker

+ (BOOL)wantsScreenTraits
{
  return 0;
}

- (UIKeyboardEmojiSplitCharacterPicker)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v43.receiver = self;
  v43.super_class = (Class)UIKeyboardEmojiSplitCharacterPicker;
  v13 = -[UIView initWithFrame:](&v43, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    v14 = +[UIKeyboardImpl keyboardScreen];
    v15 = +[UIKeyboard activeKeyboard];
    v16 = +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v14, [v15 interfaceOrientation]);

    uint64_t v17 = +[UIKeyboardEmojiGraphicsTraits emojiGraphicsTraitsWithScreenTraits:v16];
    emojiGraphicsTraits = v13->super._emojiGraphicsTraits;
    v13->super._emojiGraphicsTraits = (UIKeyboardEmojiGraphicsTraits *)v17;

    v19 = +[UIColor clearColor];
    [(UIView *)v13 setBackgroundColor:v19];

    [(UIView *)v13 setOpaque:0];
    [(UIKBKeyView *)v13 updateForKeyplane:v11 key:v12];
    v13->super._isDraggingInputView = 0;
    v20 = [(UIKeyboardEmojiKeyView *)v13 emojiKeyManager];
    v21 = [v20 lastViewedCategory];
    objc_storeWeak((id *)&v13->_category, v21);

    v22 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
    v23 = NSNumber;
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_category);
    v25 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(WeakRetained, "categoryType"));
    char v26 = [v22 containsObject:v25];

    if ((v26 & 1) == 0)
    {
      v27 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
      v28 = [v27 firstObject];
      uint64_t v29 = [v28 integerValue];

      v30 = +[UIKeyboardEmojiCategory categoryForType:v29];
      objc_storeWeak((id *)&v13->_category, v30);
    }
    v31 = objc_alloc_init(UICollectionViewFlowLayout);
    flowLayout = v13->super._flowLayout;
    v13->super._flowLayout = v31;

    [(UICollectionViewFlowLayout *)v13->super._flowLayout setScrollDirection:0];
    v33 = v13->super._flowLayout;
    [(UIKeyboardEmojiGraphicsTraits *)v13->super._emojiGraphicsTraits emojiKeyWidth];
    double v35 = v34;
    [(UIKeyboardEmojiGraphicsTraits *)v13->super._emojiGraphicsTraits emojiKeyWidth];
    -[UICollectionViewFlowLayout setItemSize:](v33, "setItemSize:", v35, v36);
    [(UICollectionViewFlowLayout *)v13->super._flowLayout setMinimumInteritemSpacing:0.0];
    [(UICollectionViewFlowLayout *)v13->super._flowLayout setMinimumLineSpacing:0.0];
    v37 = [UIKeyboardEmojiCollectionView alloc];
    [(UIView *)v13 bounds];
    uint64_t v38 = -[UIKeyboardEmojiCollectionView initWithFrame:collectionViewLayout:emojiGraphicsTraits:](v37, "initWithFrame:collectionViewLayout:emojiGraphicsTraits:", v13->super._flowLayout, v13->super._emojiGraphicsTraits);
    collectionView = v13->super._collectionView;
    v13->super._collectionView = (UIKeyboardEmojiCollectionView *)v38;

    v40 = v13->super._collectionView;
    v41 = +[UIColor clearColor];
    [(UICollectionView *)v40 setBackgroundColor:v41];

    [(UIView *)v13->super._collectionView setAutoresizingMask:18];
    [(UICollectionView *)v13->super._collectionView setDelegate:v13];
    [(UICollectionView *)v13->super._collectionView setDataSource:v13];
    [(UIScrollView *)v13->super._collectionView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v13->super._collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)v13->super._collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withReuseIdentifier:@"kEmojiCategoryTitleIdentifier"];
    [(UICollectionView *)v13->super._collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kEmojiCellIdentifier"];
    [(UIView *)v13 addSubview:v13->super._collectionView];
  }
  return v13;
}

- (void)dealloc
{
  self->super._isDraggingInputView = 0;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardEmojiSplitCharacterPicker;
  [(UIKeyboardEmojiCollectionInputView *)&v2 dealloc];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7 = -[UICollectionView numberOfItemsInSection:](self->super._collectionView, "numberOfItemsInSection:", 0, a4);
  if ((a5 || v7 <= 0) && (a5 != 1 || v7))
  {
    NSInteger v12 = [(UICollectionView *)self->super._collectionView numberOfSections] - 1;
    emojiGraphicsTraits = self->super._emojiGraphicsTraits;
    if (v12 == a5) {
      [(UIKeyboardEmojiGraphicsTraits *)emojiGraphicsTraits inputViewRightMostPadding];
    }
    else {
      [(UIKeyboardEmojiGraphicsTraits *)emojiGraphicsTraits sectionOffset];
    }
    double v11 = v14;
    double v9 = 0.0;
  }
  else
  {
    [(UIKeyboardEmojiGraphicsTraits *)self->super._emojiGraphicsTraits inputViewLeftMostPadding];
    double v9 = v8;
    [(UIKeyboardEmojiGraphicsTraits *)self->super._emojiGraphicsTraits sectionOffset];
    double v11 = v10;
  }
  double v15 = 8.0;
  double v16 = 8.0;
  double v17 = v9;
  result.right = v16;
  result.bottom = v11;
  result.left = v15;
  result.top = v17;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 12.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 6.0;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  self->super._isDraggingInputView = 1;
  -[UIKeyboardEmojiSplitCharacterPicker snappedYOffsetForOffset:](self, "snappedYOffsetForOffset:", a3, a5->y, a4.y);
  a5->double y = v6;
}

- (double)snappedYOffsetForOffset:(double)a3
{
  [(UIScrollView *)self->super._collectionView contentSize];
  double v6 = v5;
  [(UIView *)self->super._collectionView bounds];
  double v8 = v6 - v7;
  double v9 = [(UIKeyboardEmojiCollectionView *)self->super._collectionView emojiGraphicsTraits];
  [v9 inputViewRightMostPadding];
  double v11 = v8 - v10;

  collectionView = self->super._collectionView;
  if (v11 >= a3)
  {
    v20 = [(UIKeyboardEmojiCollectionView *)collectionView emojiGraphicsTraits];
    [v20 inputViewLeftMostPadding];
    double v22 = v21;

    if (v22 <= a3)
    {
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x3032000000;
      objc_super v43 = __Block_byref_object_copy__130;
      v44 = __Block_byref_object_dispose__130;
      id v45 = 0;
      [(UIView *)self->super._collectionView bounds];
      double v25 = v24;
      char v26 = [(UIKeyboardEmojiCollectionView *)self->super._collectionView emojiGraphicsTraits];
      [v26 emojiKeyWidth];
      double v28 = v27;
      uint64_t v29 = [(UIKeyboardEmojiCollectionView *)self->super._collectionView emojiGraphicsTraits];
      [v29 columnOffset];
      double v31 = v30;

      v32 = [(UICollectionView *)self->super._collectionView collectionViewLayout];
      v33 = objc_msgSend(v32, "layoutAttributesForElementsInRect:", 0.0, a3, v25, v28 + v31);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __63__UIKeyboardEmojiSplitCharacterPicker_snappedYOffsetForOffset___block_invoke;
      v39[3] = &unk_1E52FBB40;
      v39[4] = &v40;
      [v33 enumerateObjectsWithOptions:2 usingBlock:v39];

      double v34 = [(UICollectionView *)self->super._collectionView layoutAttributesForItemAtIndexPath:v41[5]];
      [v34 frame];
      double v36 = v35;
      [(UIKeyboardEmojiGraphicsTraits *)self->super._emojiGraphicsTraits columnOffset];
      double v19 = v36 - v37;

      _Block_object_dispose(&v40, 8);
      return v19;
    }
    double v17 = [(UIKeyboardEmojiCollectionView *)self->super._collectionView emojiGraphicsTraits];
    [v17 inputViewLeftMostPadding];
    double v19 = -v23;
  }
  else
  {
    [(UIScrollView *)collectionView contentSize];
    double v14 = v13;
    [(UIView *)self->super._collectionView bounds];
    double v16 = v14 - v15;
    double v17 = [(UIKeyboardEmojiCollectionView *)self->super._collectionView emojiGraphicsTraits];
    [v17 inputViewRightMostPadding];
    double v19 = v16 + v18;
  }

  return v19;
}

void __63__UIKeyboardEmojiSplitCharacterPicker_snappedYOffsetForOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (![v9 representedElementCategory])
  {
    uint64_t v6 = [v9 indexPath];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (void)didMoveToWindow
{
  v22.receiver = self;
  v22.super_class = (Class)UIKeyboardEmojiSplitCharacterPicker;
  [(UIKeyboardEmojiCollectionInputView *)&v22 didMoveToWindow];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_category);
  unint64_t v4 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", [WeakRetained categoryType]);

  collectionView = self->super._collectionView;
  uint64_t v6 = (void *)MEMORY[0x1E4F28D58];
  id v7 = objc_loadWeakRetained((id *)&self->_category);
  double v8 = objc_msgSend(v6, "indexPathForItem:inSection:", -[UIKeyboardEmojiCollectionInputView indexForPrettyCategoryDisplay:](self, "indexForPrettyCategoryDisplay:", v7), v4);
  id v9 = [(UICollectionView *)collectionView layoutAttributesForItemAtIndexPath:v8];
  [v9 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  double v18 = self->super._collectionView;
  v23.origin.double x = v11;
  v23.origin.double y = v13;
  v23.size.double width = v15;
  v23.size.double height = v17;
  double MinY = CGRectGetMinY(v23);
  v20 = [(UIKeyboardEmojiCollectionView *)self->super._collectionView emojiGraphicsTraits];
  [v20 inputViewLeftMostPadding];
  -[UICollectionView setContentOffset:animated:](v18, "setContentOffset:animated:", 0, 0.0, MinY - v21);

  [(UIView *)self->super._collectionView layoutIfNeeded];
}

- (void)updateToCategory:(int64_t)a3
{
  double v5 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
  [v5 deactivateActiveKey];

  if ([(UICollectionView *)self->super._collectionView numberOfItemsInSection:+[UIKeyboardEmojiCategory categoryIndexForCategoryType:a3]] >= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_category);
    uint64_t v7 = [WeakRetained categoryType];

    if (v7 == a3)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_category);
      [v8 setLastVisibleFirstEmojiIndex:0];

      id obj = objc_loadWeakRetained((id *)&self->_category);
      int64_t v9 = 0;
    }
    else
    {
      id obj = +[UIKeyboardEmojiCategory categoryForType:a3];
      double v10 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
      objc_msgSend(obj, "setLastVisibleFirstEmojiIndex:", objc_msgSend(v10, "lastVisibleFirstEmojiIndexforCategory:", obj));

      id v11 = objc_storeWeak((id *)&self->_category, obj);
      int64_t v9 = [(UIKeyboardEmojiCollectionInputView *)self indexForPrettyCategoryDisplay:obj];
    }
    id v12 = objc_loadWeakRetained((id *)&self->_category);
    unint64_t v13 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", [v12 categoryType]);

    collectionView = self->super._collectionView;
    CGFloat v15 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:v13];
    double v16 = [(UICollectionView *)collectionView layoutAttributesForItemAtIndexPath:v15];
    [v16 frame];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    double v25 = self->super._collectionView;
    [(UIScrollView *)v25 contentOffset];
    double v27 = v26;
    v34.origin.double x = v18;
    v34.origin.double y = v20;
    v34.size.double width = v22;
    v34.size.double height = v24;
    double MinY = CGRectGetMinY(v34);
    uint64_t v29 = [(UIKeyboardEmojiCollectionView *)self->super._collectionView emojiGraphicsTraits];
    [v29 inputViewLeftMostPadding];
    -[UICollectionView setContentOffset:animated:](v25, "setContentOffset:animated:", 0, v27, MinY - v30);

    double v31 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
    [v31 setLastViewedCategory:obj];
  }
}

- (id)category
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_category);
  return WeakRetained;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end