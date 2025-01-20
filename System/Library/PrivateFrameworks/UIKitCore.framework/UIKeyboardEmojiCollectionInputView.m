@interface UIKeyboardEmojiCollectionInputView
+ (BOOL)shouldHighlightEmoji:(id)a3;
+ (BOOL)wantsScreenTraits;
- (BOOL)_handleBaseKeySelectionEvent:(id)a3;
- (BOOL)_handleInitialSelectionEvent:(id)a3;
- (BOOL)_handleVariantSelectionEvent:(id)a3;
- (BOOL)_shouldShowRecentlyUsedMedia;
- (BOOL)_userHasSelectedSkinToneEmoji;
- (BOOL)baseStringIsCoupleEmoji:(id)a3;
- (BOOL)cellShouldScrollWhenSelectedAtIndexPath:(id)a3;
- (BOOL)genderEmojiBaseStringNeedVariantSelector:(id)a3;
- (BOOL)handleKeyEvent:(id)a3;
- (BOOL)handleKeyInputForCollectionViewNavigation:(id)a3;
- (BOOL)handleKeyInputForFamilySelector:(id)a3;
- (BOOL)handleKeyInputForVariantSelector:(id)a3;
- (BOOL)handleSelectionEvent:(id)a3;
- (BOOL)isDraggingInputView;
- (BOOL)isSearching;
- (BOOL)keySupportsVariants:(id)a3;
- (BOOL)showingRecents;
- (BOOL)skinToneWasUsedForEmoji:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)searchResults;
- (NSIndexPath)selectedIndexPath;
- (NSIndexPath)tappedSkinToneEmoji;
- (TUIEmojiSearchInputViewController)emojiSearchInputViewController;
- (TUIEmojiSearchTextField)emojiSearchField;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIKBEmojiHitTestResponder)hitTestResponder;
- (UIKeyboardEmojiCategory)category;
- (UIKeyboardEmojiCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (UIKeyboardEmojiCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6;
- (double)_recentlyUsedMediaRoundedOffset:(double)a3 recentlyUsedMediaCellWidth:(double)a4;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)distanceInScrollingDirection:(CGSize)a3;
- (double)pointInScrollingDirection:(CGPoint)a3;
- (double)scrollingEndPoint;
- (double)scrollingStartPoint;
- (double)snappedXOffsetForOffset:(double)a3 scrubbing:(BOOL)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)completionBlock;
- (id)emojiBaseFirstCharacterString:(id)a3;
- (id)emojiBaseString:(id)a3;
- (id)firstFullyVisibleHeader;
- (id)itemInRect:(CGRect)a3;
- (id)selectedChildSkinToneEmoji:(id)a3;
- (id)subTreeHitTest:(CGPoint)a3;
- (id)treeForCell:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)didInputSubTree:(id)a3;
- (int64_t)emojiCategoryTypeForSection:(int64_t)a3;
- (int64_t)indexForPrettyCategoryDisplay:(id)a3;
- (int64_t)keyCodeForCurrentEnvironmentFromKeyCode:(int64_t)a3;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)updateToCategoryWithOffsetPercentage:(double)a3;
- (void)_setUserHasSelectedSkinToneEmoji:(BOOL)a3;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didDismissCardForKeyboardMediaController:(id)a3;
- (void)didInsertMediaForKeyboardMediaController:(id)a3;
- (void)didMoveToWindow;
- (void)didPresentCardForKeyboardMediaController:(id)a3;
- (void)didTearDownRecentsViewForKeyboardMediaController:(id)a3;
- (void)dimKeys:(id)a3;
- (void)emojiSearchDidReceiveResults:(id)a3 forExactQuery:(id)a4 autocorrectedQuery:(id)a5;
- (void)emojiSearchTextFieldDidBecomeActive:(id)a3;
- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3;
- (void)emojiSearchTextFieldDidReset:(id)a3;
- (void)emojiSearchTextFieldWillBecomeActive:(id)a3;
- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3;
- (void)emojiSearchTextFieldWillClear:(id)a3;
- (void)insertSelectedEmoji:(id)a3 shouldDismissPopover:(BOOL)a4;
- (void)resetSelectionIfNeeded;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCategory:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setEmojiSearchField:(id)a3;
- (void)setEmojiSearchInputViewController:(id)a3;
- (void)setHitTestResponder:(id)a3;
- (void)setIsSearching:(BOOL)a3;
- (void)setSearchResults:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTappedSkinToneEmoji:(id)a3;
- (void)shouldDismissModalDisplayView:(id)a3;
- (void)updateHighlightForIndexPath:(id)a3 scrollIfNeeded:(BOOL)a4 animateScroll:(BOOL)a5;
- (void)updateLastSeenItemForIndexPath:(id)a3;
- (void)updateOffsetForSearchResults;
- (void)updatePreferencesForSelectedEmoji:(id)a3;
- (void)updateToCategory:(int64_t)a3;
- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5;
@end

@implementation UIKeyboardEmojiCollectionInputView

+ (BOOL)wantsScreenTraits
{
  return 1;
}

- (UIKeyboardEmojiCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  v15 = a6;
  uint64_t v16 = [v15 orientation];
  if (v15)
  {
    uint64_t v17 = v16;
  }
  else
  {
    v18 = +[UIKeyboard activeKeyboard];
    uint64_t v17 = [v18 interfaceOrientation];

    v19 = +[UIKeyboardImpl keyboardScreen];
    v15 = +[UIKBScreenTraits traitsWithScreen:v19 orientation:v17];
  }
  unint64_t v20 = v17 - 3;
  BOOL v21 = (unint64_t)(v17 - 3) <= 1 && [v15 idiom] != 1;
  self->_useWideAnimojiCell = v21;
  [v13 frame];
  double v22 = 0.0;
  if (width != v23 && (!v15 || !v15[35]))
  {
    [v13 frame];
    CGFloat v25 = (width - v24) * 0.5;
    v56.origin.double x = x;
    v56.origin.double y = y;
    v56.size.double width = width;
    v56.size.double height = height;
    CGRect v57 = CGRectInset(v56, v25, 0.0);
    double x = v57.origin.x;
    double y = v57.origin.y;
    double width = v57.size.width;
    double height = v57.size.height;
    [v15 bounds];
    if (v26 >= 812.0)
    {
      v27 = +[UIScreen mainScreen];
      [v27 bounds];
      double v29 = v28;
      double v31 = v30;

      if (v29 <= v31) {
        double v32 = v31;
      }
      else {
        double v32 = v29;
      }
      if (v29 >= v31) {
        double v33 = v31;
      }
      else {
        double v33 = v29;
      }
      if (v20 >= 2) {
        double v32 = v33;
      }
      double v22 = (width - v32) * 0.5;
      v58.origin.double x = x;
      v58.origin.double y = y;
      v58.size.double width = width;
      v58.size.double height = height;
      CGRect v59 = CGRectInset(v58, v22, 0.0);
      double x = v59.origin.x;
      double y = v59.origin.y;
      double width = v59.size.width;
      double height = v59.size.height;
    }
  }
  v55.receiver = self;
  v55.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  v34 = -[UIView initWithFrame:](&v55, sel_initWithFrame_, x, y, width, height);
  v35 = v34;
  if (v34)
  {
    v34->_frameInset = v22;
    uint64_t v36 = +[UIKeyboardEmojiGraphicsTraits emojiGraphicsTraitsWithScreenTraits:v15];
    emojiGraphicsTraits = v35->_emojiGraphicsTraits;
    v35->_emojiGraphicsTraits = (UIKeyboardEmojiGraphicsTraits *)v36;

    v38 = +[UIColor clearColor];
    [(UIView *)v35 setBackgroundColor:v38];

    [(UIView *)v35 setOpaque:0];
    [(UIKBKeyView *)v35 updateForKeyplane:v13 key:v14];
    v35->_isDraggingInputView = 0;
    v39 = objc_alloc_init(UIKeyboardEmojiLayout);
    flowLayout = v35->_flowLayout;
    v35->_flowLayout = &v39->super;

    [(UICollectionViewFlowLayout *)v35->_flowLayout setMinimumInteritemSpacing:0.0];
    [(UICollectionViewFlowLayout *)v35->_flowLayout setMinimumLineSpacing:0.0];
    -[UICollectionViewFlowLayout setScrollDirection:](v35->_flowLayout, "setScrollDirection:", [v15 isEmojiScrollingDirectionVertical] ^ 1);
    v41 = [UIKeyboardEmojiCollectionView alloc];
    [(UIView *)v35 bounds];
    uint64_t v42 = -[UIKeyboardEmojiCollectionView initWithFrame:collectionViewLayout:emojiGraphicsTraits:](v41, "initWithFrame:collectionViewLayout:emojiGraphicsTraits:", v35->_flowLayout, v35->_emojiGraphicsTraits);
    collectionView = v35->_collectionView;
    v35->_collectionView = (UIKeyboardEmojiCollectionView *)v42;

    [(UICollectionView *)v35->_collectionView setPrefetchingEnabled:1];
    v44 = v35->_collectionView;
    v45 = +[UIColor clearColor];
    [(UICollectionView *)v44 setBackgroundColor:v45];

    [(UIView *)v35->_collectionView setAutoresizingMask:18];
    [(UIView *)v35 contentScaleFactor];
    -[UIView setContentScaleFactor:](v35->_collectionView, "setContentScaleFactor:");
    [(UICollectionView *)v35->_collectionView setDelegate:v35];
    [(UICollectionView *)v35->_collectionView setDataSource:v35];
    [(UIScrollView *)v35->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v35->_collectionView setShowsVerticalScrollIndicator:0];
    v46 = [(UIScrollView *)v35->_collectionView panGestureRecognizer];
    [v46 setMaximumNumberOfTouches:1];

    v47 = [(UIScrollView *)v35->_collectionView panGestureRecognizer];
    [v47 setMinimumNumberOfTouches:1];

    v48 = [(UIScrollView *)v35->_collectionView panGestureRecognizer];
    [v48 setFailsPastMaxTouches:1];

    [(UICollectionView *)v35->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withReuseIdentifier:@"kEmojiCategoryTitleIdentifier"];
    [(UICollectionView *)v35->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kEmojiCellIdentifier"];
    [(UICollectionView *)v35->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kMediaCellIdentifier"];
    kdebug_trace();
    v49 = perfLog();
    if (os_signpost_enabled(v49))
    {
      *(_WORD *)v54 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v49, OS_SIGNPOST_INTERVAL_BEGIN, 0x33uLL, "recents-bringup", "enableTelemetry=YES", v54, 2u);
    }

    v50 = +[UIKeyboardImpl activeInstance];
    v35->_inputDelegateCanSupportAnimoji = [v50 canPasteImage];

    v51 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v52 = [v51 valueForKey:@"com.apple.Animoji.StickerRecents.SplashVersion"];
    v35->_hasShownAnimojiFirstTimeExperience = v52 != 0;

    v35->_shouldRetryFetchingAnimojiRecents = 1;
    [(UIView *)v35 addSubview:v35->_collectionView];
  }

  return v35;
}

- (UIKeyboardEmojiCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  return -[UIKeyboardEmojiCollectionInputView initWithFrame:keyplane:key:screenTraits:](self, "initWithFrame:keyplane:key:screenTraits:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  v3 = +[UIKeyboardMediaController sharedKeyboardMediaController];
  [v3 setDelegate:0];

  [(UICollectionView *)self->_collectionView setDataSource:0];
  [(UICollectionView *)self->_collectionView setDelegate:0];
  self->_isDraggingInputView = 0;
  self->_showingVariants = 0;
  v4 = +[UIKeyboardEmojiPreferences sharedInstance];
  [v4 clearEmojiKeyboardPreferenceClient];

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  [(UIKBKeyView *)&v5 dealloc];
}

- (void)setContentScaleFactor:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  -[UIView setContentScaleFactor:](&v5, sel_setContentScaleFactor_);
  [(UIView *)self->_collectionView setContentScaleFactor:a3];
}

- (void)dimKeys:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  [(UIKBKeyView *)&v7 dimKeys:v4];
  objc_super v5 = [(UIView *)self subviews];

  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__UIKeyboardEmojiCollectionInputView_dimKeys___block_invoke;
    v6[3] = &unk_1E52E6590;
    v6[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __46__UIKeyboardEmojiCollectionInputView_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if (([a2 integerValue] & 4) != 0)
  {
    [v7 doubleValue];
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
    *a4 = 1;
  }
}

- (void)setHitTestResponder:(id)a3
{
  p_hitTestResponder = &self->_hitTestResponder;
  id v5 = a3;
  objc_storeWeak((id *)p_hitTestResponder, v5);
  [(UIKeyboardEmojiCollectionView *)self->_collectionView setHitTestResponder:v5];
}

- (BOOL)_userHasSelectedSkinToneEmoji
{
  v3 = +[UIKeyboardImpl activeInstance];
  char v4 = [v3 isEmojiPopoverPresented];

  id v5 = +[UIKeyboardEmojiPreferences sharedInstance];
  BOOL isFirstPartyStickers = 1;
  if (([v5 hasDisplayedSkinToneHelp] & 1) == 0 && (v4 & 1) == 0)
  {
    emojiGraphicsTraits = self->_emojiGraphicsTraits;
    if (emojiGraphicsTraits) {
      BOOL isFirstPartyStickers = emojiGraphicsTraits->_isFirstPartyStickers;
    }
    else {
      BOOL isFirstPartyStickers = 0;
    }
  }

  return isFirstPartyStickers;
}

- (void)_setUserHasSelectedSkinToneEmoji:(BOOL)a3
{
  if (a3)
  {
    id v3 = +[UIKeyboardEmojiPreferences sharedInstance];
    [v3 didDisplaySkinToneHelp];
  }
}

- (id)emojiBaseFirstCharacterString:(id)a3
{
  id v3 = NSString;
  uint64_t v4 = [a3 _firstLongCharacter];
  return (id)[v3 _stringWithUnichar:v4];
}

- (id)emojiBaseString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [getEMFStringUtilitiesClass() _baseStringForEmojiString:v3];

  return v4;
}

- (BOOL)skinToneWasUsedForEmoji:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  int v6 = [v5 hasLastUsedVariantForEmojiString:v4];

  if (v6)
  {
    emojiGraphicsTraits = self->_emojiGraphicsTraits;
    if (emojiGraphicsTraits) {
      BOOL v8 = !emojiGraphicsTraits->_isFirstPartyStickers;
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)baseStringIsCoupleEmoji:(id)a3
{
  id v3 = a3;
  id v4 = [getEMFStringUtilitiesClass() _baseStringForEmojiString:v3];

  LOBYTE(v3) = [getEMFEmojiCategoryClass_0() _isCoupleMultiSkinToneEmoji:v4];
  return (char)v3;
}

- (id)subTreeHitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = 0;
  if (-[UIView pointInside:forEvent:](self, "pointInside:forEvent:", 0))
  {
    collectionView = self->_collectionView;
    -[UIView convertPoint:fromView:](collectionView, "convertPoint:fromView:", self, x, y);
    BOOL v8 = -[UIKeyboardEmojiCollectionView closestCellForPoint:](collectionView, "closestCellForPoint:");
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v6 = [v8 emoji];

      if (v6)
      {
        int v6 = [(UIKeyboardEmojiCollectionInputView *)self treeForCell:v8];
      }
    }
    else
    {
      int v6 = 0;
    }
  }
  return v6;
}

- (id)treeForCell:(id)a3
{
  uint64_t v260 = *MEMORY[0x1E4F143B8];
  id v238 = a3;
  collectionView = self->_collectionView;
  [v238 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v239 = self;
  id v13 = [(UIView *)self superview];
  -[UIView convertRect:toView:](collectionView, "convertRect:toView:", v13, v6, v8, v10, v12);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  double v22 = v238;
  [v238 frame];
  double v24 = v23;
  double v237 = v25;
  double v27 = v26;
  double v29 = v28;
  v262.origin.double x = v15;
  v262.origin.double y = v17;
  v262.size.double width = v19;
  v262.size.double height = v21;
  double MidX = CGRectGetMidX(v262);
  [(UIView *)v239 frame];
  if (MidX < CGRectGetMinX(v263)) {
    goto LABEL_75;
  }
  v264.origin.double x = v15;
  v264.origin.double y = v17;
  v264.size.double width = v19;
  v264.size.double height = v21;
  double v31 = CGRectGetMidX(v264);
  [(UIView *)v239 frame];
  if (v31 > CGRectGetMaxX(v265)) {
    goto LABEL_75;
  }
  v266.origin.double x = v15;
  v266.origin.double y = v17;
  v266.size.double width = v19;
  v266.size.double height = v21;
  double MidY = CGRectGetMidY(v266);
  [(UIView *)v239 frame];
  if (MidY < CGRectGetMinY(v267)) {
    goto LABEL_75;
  }
  v268.origin.double x = v15;
  v268.origin.double y = v17;
  v268.size.double width = v19;
  v268.size.double height = v21;
  double v33 = CGRectGetMidY(v268);
  [(UIView *)v239 frame];
  if (v33 > CGRectGetMaxY(v269)) {
    goto LABEL_75;
  }
  double v234 = v29;
  double v235 = v27;
  BOOL v34 = +[UIKeyboardImpl isSplit];
  CGFloat v35 = v15;
  CGFloat v36 = v17;
  CGFloat v37 = v19;
  CGFloat v38 = v21;
  if (v34)
  {
    double MaxY = CGRectGetMaxY(*(CGRect *)&v35);
    v40 = [(UIView *)v239 superview];
    [v40 frame];
    double v41 = CGRectGetMaxY(v270);

    if (MaxY > v41)
    {
      uint64_t v42 = v239->_collectionView;
      [(UIScrollView *)v42 contentOffset];
      double v44 = v43;
      [(UIScrollView *)v239->_collectionView contentOffset];
      double v46 = v45;
      v271.origin.double x = v15;
      v271.origin.double y = v17;
      v271.size.double width = v19;
      v271.size.double height = v21;
      double v47 = CGRectGetMaxY(v271);
      v48 = [(UIView *)v239 superview];
      [v48 frame];
      double v49 = v47 - CGRectGetMaxY(v272);

      if (v49 < 0.0) {
        double v49 = -v49;
      }
      p_emojiGraphicsTraits = (id *)&v239->_emojiGraphicsTraits;
      [(UIKeyboardEmojiGraphicsTraits *)v239->_emojiGraphicsTraits minimumLineSpacing];
      -[UICollectionView setContentOffset:animated:](v42, "setContentOffset:animated:", 1, v44, v46 + v49 + v51);
      v273.origin.double x = v15;
      v273.origin.double y = v17;
      v273.size.double width = v19;
      v273.size.double height = v21;
      double v52 = CGRectGetMaxY(v273);
      v53 = [(UIView *)v239 superview];
      [v53 frame];
      double v54 = v52 - CGRectGetMaxY(v274);

      if (v54 >= 0.0) {
        double v55 = v54;
      }
      else {
        double v55 = -v54;
      }
      [*p_emojiGraphicsTraits minimumLineSpacing];
      double v57 = v56;
      v275.origin.double x = v15;
      v275.origin.double y = v17;
      v275.size.double width = v19;
      v275.size.double height = v21;
      double v58 = CGRectGetMaxY(v275);
      CGRect v59 = [(UIView *)v239 superview];
      double v60 = v55 + v57;
      [v59 frame];
      double v61 = v58 - CGRectGetMaxY(v276);

      if (v61 < 0.0) {
        double v61 = -v61;
      }
      [*p_emojiGraphicsTraits minimumLineSpacing];
      double v24 = v24 + 0.0;
      double v237 = v237 - v60;
      double v63 = v61 + v62 - v60;
LABEL_33:
      double v234 = v234 - v63;
      goto LABEL_44;
    }
    v284.origin.double x = v15;
    v284.origin.double y = v17;
    v284.size.double width = v19;
    v284.size.double height = v21;
    double MinY = CGRectGetMinY(v284);
    v90 = [(UIView *)v239 superview];
    [v90 frame];
    double v91 = CGRectGetMinY(v285);

    if (MinY < v91)
    {
      v92 = v239->_collectionView;
      [(UIScrollView *)v92 contentOffset];
      double v94 = v93;
      [(UIScrollView *)v239->_collectionView contentOffset];
      id obj = v95;
      v286.origin.double x = v15;
      v286.origin.double y = v17;
      v286.size.double width = v19;
      v286.size.double height = v21;
      double v96 = CGRectGetMinY(v286);
      v97 = [(UIView *)v239 superview];
      [v97 frame];
      double v98 = CGRectGetMinY(v287);

      BOOL v99 = v96 < v98;
      double v100 = 0.0;
      double v101 = 1.0;
      if (!v99) {
        double v101 = 0.0;
      }
      double v102 = *(double *)&obj - v101;
      v103 = (id *)&v239->_emojiGraphicsTraits;
      [(UIKeyboardEmojiGraphicsTraits *)v239->_emojiGraphicsTraits minimumLineSpacing];
      -[UICollectionView setContentOffset:animated:](v92, "setContentOffset:animated:", 1, v94, v102 - v104);
      v288.origin.double x = v15;
      v288.origin.double y = v17;
      v288.size.double width = v19;
      v288.size.double height = v21;
      double v105 = CGRectGetMinY(v288);
      v106 = [(UIView *)v239 superview];
      [v106 frame];
      double v107 = CGRectGetMinY(v289);

      if (v105 < v107) {
        double v100 = 1.0;
      }
      [*v103 minimumLineSpacing];
      double v109 = v108;
      v290.origin.double x = v15;
      v290.origin.double y = v17;
      v290.size.double width = v19;
      v290.size.double height = v21;
      double v110 = CGRectGetMinY(v290);
      v111 = [(UIView *)v239 superview];
      double v112 = v109 + v100;
      [v111 frame];
      double v113 = CGRectGetMinY(v291);

      if (v110 >= v113) {
        double v114 = 0.0;
      }
      else {
        double v114 = -1.0;
      }
      [*v103 minimumLineSpacing];
      double v24 = v24 + 0.0;
      double v237 = v237 + v112;
      double v63 = v112 + v114 - v115;
      goto LABEL_33;
    }
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v35);
    v65 = [(UIView *)v239 superview];
    [v65 frame];
    double v66 = CGRectGetMaxX(v277);

    if (MaxX <= v66)
    {
      v292.origin.double x = v15;
      v292.origin.double y = v17;
      v292.size.double width = v19;
      v292.size.double height = v21;
      double MinX = CGRectGetMinX(v292);
      v117 = [(UIView *)v239 superview];
      [v117 frame];
      double v118 = CGRectGetMinX(v293);

      v119 = v239;
      if (MinX >= v118) {
        goto LABEL_45;
      }
      v120 = v239->_collectionView;
      [(UIScrollView *)v120 contentOffset];
      double v122 = v121;
      v294.origin.double x = v15;
      v294.origin.double y = v17;
      v294.size.double width = v19;
      v294.size.double height = v21;
      double v123 = CGRectGetMinX(v294);
      v124 = [(UIView *)v239 superview];
      [v124 frame];
      double v125 = v123 - CGRectGetMinX(v295);

      double v126 = -v125;
      if (v125 >= 0.0) {
        double v126 = v125;
      }
      double v127 = v122 - v126;
      v128 = (id *)&v239->_emojiGraphicsTraits;
      [(UIKeyboardEmojiGraphicsTraits *)v239->_emojiGraphicsTraits minimumLineSpacing];
      double v130 = v127 - v129;
      [(UIScrollView *)v239->_collectionView contentOffset];
      [(UICollectionView *)v120 setContentOffset:1 animated:v130];
      v296.origin.double x = v15;
      v296.origin.double y = v17;
      v296.size.double width = v19;
      v296.size.double height = v21;
      double v131 = CGRectGetMinX(v296);
      v132 = [(UIView *)v239 superview];
      [v132 frame];
      double v133 = v131 - CGRectGetMinX(v297);

      if (v133 >= 0.0) {
        double v134 = -v133;
      }
      else {
        double v134 = v133;
      }
      [*v128 minimumLineSpacing];
      double v136 = v135;
      v298.origin.double x = v15;
      v298.origin.double y = v17;
      v298.size.double width = v19;
      v298.size.double height = v21;
      double v137 = CGRectGetMinX(v298);
      v138 = [(UIView *)v239 superview];
      double v139 = v134 - v136;
      [v138 frame];
      double v140 = v137 + CGRectGetMinX(v299);

      if (v140 < 0.0) {
        double v140 = -v140;
      }
      [*v128 minimumLineSpacing];
      double v142 = v140 + v141;
      double v24 = v24 + v142;
      double v88 = v139 + v142;
    }
    else
    {
      v67 = v239->_collectionView;
      [(UIScrollView *)v67 contentOffset];
      double v69 = v68;
      v278.origin.double x = v15;
      v278.origin.double y = v17;
      v278.size.double width = v19;
      v278.size.double height = v21;
      double v70 = CGRectGetMaxX(v278);
      v71 = [(UIView *)v239 superview];
      [v71 frame];
      double v72 = v70 - CGRectGetMaxX(v279);

      if (v72 < 0.0) {
        double v72 = -v72;
      }
      v73 = (id *)&v239->_emojiGraphicsTraits;
      [(UIKeyboardEmojiGraphicsTraits *)v239->_emojiGraphicsTraits minimumLineSpacing];
      double v75 = v69 + v72 + v74;
      [(UIScrollView *)v239->_collectionView contentOffset];
      [(UICollectionView *)v67 setContentOffset:1 animated:v75];
      v280.origin.double x = v15;
      v280.origin.double y = v17;
      v280.size.double width = v19;
      v280.size.double height = v21;
      double v76 = CGRectGetMaxX(v280);
      v77 = [(UIView *)v239 superview];
      [v77 frame];
      double v78 = v76 - CGRectGetMaxX(v281);

      if (v78 >= 0.0) {
        double v79 = v78;
      }
      else {
        double v79 = -v78;
      }
      [*v73 minimumLineSpacing];
      double v81 = v80;
      v282.origin.double x = v15;
      v282.origin.double y = v17;
      v282.size.double width = v19;
      v282.size.double height = v21;
      double v82 = CGRectGetMaxX(v282);
      v83 = [(UIView *)v239 superview];
      double v84 = v79 + v81;
      [v83 frame];
      double v85 = v82 - CGRectGetMaxX(v283);

      if (v85 < 0.0) {
        double v85 = -v85;
      }
      [*v73 minimumLineSpacing];
      double v87 = v85 + v86;
      double v24 = v24 - v87;
      double v88 = v84 - v87;
    }
    double v235 = v235 - v88;
    double v237 = v237 + 0.0;
  }
LABEL_44:
  v119 = v239;
LABEL_45:
  v143 = [(UICollectionView *)v119->_collectionView indexPathForCell:v238];
  [(UIKeyboardEmojiCollectionInputView *)v239 setTappedSkinToneEmoji:v143];

  double v22 = v238;
  if (!v238)
  {
LABEL_75:
    v144 = 0;
    goto LABEL_76;
  }
  v236 = [v238 emoji];
  v144 = +[UIKBTree treeOfType:8];
  [v144 setState:2];
  [v144 setName:@"EmojiPopupKey"];
  v232 = [v236 emojiString];
  [v144 setDisplayString:v232];
  [v144 setRepresentedString:v232];
  [v144 setDisplayType:0];
  [v144 setInteractionType:2];
  location = (id *)&v239->_selectedPopupKey;
  if (v239->_selectedPopupKey) {
    [(UIKeyboardEmojiCollectionInputView *)v239 resetSelectionIfNeeded];
  }
  if (+[UIDictationController isRunning])
  {
    v145 = +[UIDictationController sharedInstance];
    v146 = [v145 dictationTipController];
    v147 = [v236 emojiString];
    [v146 signalDictationInsertionTip:v147];
  }
  uint64_t v255 = 0;
  v256 = &v255;
  uint64_t v257 = 0x2050000000;
  v148 = (void *)getEMFEmojiTokenClass_softClass;
  uint64_t v258 = getEMFEmojiTokenClass_softClass;
  if (!getEMFEmojiTokenClass_softClass)
  {
    uint64_t v250 = MEMORY[0x1E4F143A8];
    uint64_t v251 = 3221225472;
    uint64_t v252 = (uint64_t)__getEMFEmojiTokenClass_block_invoke_1;
    uint64_t v253 = (uint64_t)&unk_1E52D9900;
    v254 = &v255;
    __getEMFEmojiTokenClass_block_invoke_1((uint64_t)&v250);
    v148 = (void *)v256[3];
  }
  id v149 = v148;
  _Block_object_dispose(&v255, 8);
  v150 = [v236 emojiString];
  v233 = [v149 emojiTokenWithString:v150 localeData:0];

  if (![v233 supportsSkinToneVariants]) {
    goto LABEL_92;
  }
  v151 = [v233 _skinToneVariantStrings];
  v240 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v151, "count") + 1);
  long long v248 = 0u;
  long long v249 = 0u;
  long long v246 = 0u;
  long long v247 = 0u;
  id obja = v151;
  uint64_t v152 = [obja countByEnumeratingWithState:&v246 objects:v259 count:16];
  if (v152)
  {
    uint64_t v153 = *(void *)v247;
    do
    {
      for (uint64_t i = 0; i != v152; ++i)
      {
        if (*(void *)v247 != v153) {
          objc_enumerationMutation(obja);
        }
        uint64_t v155 = *(void *)(*((void *)&v246 + 1) + 8 * i);
        v156 = (void *)[v144 copy];
        [v156 setRepresentedString:v155];
        v157 = [v156 representedString];
        [v156 setDisplayString:v157];

        [v156 setDisplayType:0];
        v158 = NSString;
        v159 = [v144 name];
        v160 = [v156 representedString];
        v161 = [v158 stringWithFormat:@"%@/%@", v159, v160, location];
        [v156 setName:v161];

        [v156 setOverrideDisplayString:0];
        [v240 addObject:v156];
        v162 = [obja firstObject];
        LODWORD(v160) = [v162 isEqualToString:v155];

        if (v160)
        {
          v163 = +[UIKBTree treeOfType:8];
          [v163 setDisplayType:50];
          [v163 setInteractionType:0];
          v164 = NSString;
          v165 = [v144 name];
          v166 = [v164 stringWithFormat:@"%@/Divider", v165];
          [v163 setName:v166];

          [v163 setState:1];
          [v240 addObject:v163];
        }
      }
      uint64_t v152 = [obja countByEnumeratingWithState:&v246 objects:v259 count:16];
    }
    while (v152);
  }

  v167 = [v236 emojiString];
  BOOL v168 = [(UIKeyboardEmojiCollectionInputView *)v239 baseStringIsCoupleEmoji:v167];

  if (v168)
  {
    v169 = (void *)[v144 copy];
    id EMFStringUtilitiesClass = getEMFStringUtilitiesClass();
    v171 = [v236 emojiString];
    v172 = [EMFStringUtilitiesClass _baseStringForEmojiString:v171];
    [v169 setRepresentedString:v172];

    v173 = [v169 representedString];
    [v169 setDisplayString:v173];

    [v169 setDisplayType:0];
    v174 = NSString;
    v175 = [v144 name];
    v176 = [v169 representedString];
    v177 = [v174 stringWithFormat:@"%@/%@", v175, v176, location];
    [v169 setName:v177];

    [v169 setOverrideDisplayString:0];
    [v240 insertObject:v169 atIndex:0];
  }
  v178 = [v236 emojiString];
  BOOL v179 = [(UIKeyboardEmojiCollectionInputView *)v239 skinToneWasUsedForEmoji:v178];

  if (v179)
  {
    uint64_t v250 = 0;
    uint64_t v251 = (uint64_t)&v250;
    uint64_t v252 = 0x2020000000;
    uint64_t v253 = 0x7FFFFFFFFFFFFFFFLL;
    v243[0] = MEMORY[0x1E4F143A8];
    v243[1] = 3221225472;
    v243[2] = __50__UIKeyboardEmojiCollectionInputView_treeForCell___block_invoke;
    v243[3] = &unk_1E52F5468;
    id v244 = v236;
    v245 = &v250;
    [v240 enumerateObjectsUsingBlock:v243];
    [v144 setSelectedVariantIndex:*(void *)(v251 + 24)];

    _Block_object_dispose(&v250, 8);
  }
  uint64_t v180 = [(UIView *)v239 effectiveUserInterfaceLayoutDirection];
  v181 = UIKBAttributeValueFixedLeftStr;
  if (v180 != 1) {
    v181 = UIKBAttributeValueFixedRightStr;
  }
  [v144 setVariantPopupBias:*v181];
  [v144 setSubtrees:v240];
  v182 = [v236 emojiString];
  BOOL v183 = [(UIKeyboardEmojiCollectionInputView *)v239 baseStringIsCoupleEmoji:v182];

  v184 = [v236 emojiString];
  if (![(UIKeyboardEmojiCollectionInputView *)v239 skinToneWasUsedForEmoji:v184])
  {
    v190 = [(UIKeyboardEmojiCollectionInputView *)v239 tappedSkinToneEmoji];
    if ([v190 section]
      || ![(UIKeyboardEmojiCollectionInputView *)v239 _userHasSelectedSkinToneEmoji])
    {

      goto LABEL_85;
    }
    emojiGraphicsTraits = v239->_emojiGraphicsTraits;
    if (emojiGraphicsTraits)
    {
      BOOL v192 = !emojiGraphicsTraits->_isFirstPartyStickers;

      if (v192) {
        goto LABEL_71;
      }
LABEL_85:
      if (v183) {
        uint64_t v187 = 12;
      }
      else {
        uint64_t v187 = 10;
      }
      uint64_t v188 = 16;
      goto LABEL_89;
    }

LABEL_105:
    goto LABEL_71;
  }
  v185 = v239->_emojiGraphicsTraits;
  if (!v185) {
    goto LABEL_105;
  }
  BOOL v186 = !v185->_isFirstPartyStickers;

  if (!v186) {
    goto LABEL_85;
  }
LABEL_71:
  if (v183) {
    uint64_t v187 = 13;
  }
  else {
    uint64_t v187 = 11;
  }
  uint64_t v188 = 4;
LABEL_89:
  [v144 setVariantType:v187];
  [v144 setState:v188];
  v193 = +[UIKeyboardImpl activeInstance];
  int v194 = [v193 isEmojiPopoverPresented];

  if (v194)
  {
    objc_storeStrong(location, v144);
    v239->_showingVariants = 1;
    v239->_currentVariantRow = 0;
    v195 = [(UIKeyboardEmojiCollectionInputView *)v239 tappedSkinToneEmoji];
    v196 = (void *)[v195 copy];
    [(UIKeyboardEmojiCollectionInputView *)v239 setSelectedIndexPath:v196];
  }
LABEL_92:
  v197 = v239->_collectionView;
  v198 = [(UIView *)v239 superview];
  -[UIView convertRect:toView:](v197, "convertRect:toView:", v198, v24 + 0.0, v237 + 1.0, v235, v234);
  double v200 = v199;
  double v202 = v201;
  double v204 = v203;
  double v206 = v205;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || +[UIKeyboardImpl isFloating])
  {
    [(UIKeyboardEmojiGraphicsTraits *)v239->_emojiGraphicsTraits fakeEmojiKeySize];
    double v216 = v202 - (v215 - v206) * 0.5;
    double v212 = v200 - (v214 - v204) * 0.5 + 0.0;
    double v208 = v214 + 1.0;
    double v213 = v216 + -2.0;
    double v210 = v215 + 3.0;
    v300.origin.double x = v212;
    v300.origin.double y = v216 + -2.0;
    v300.size.double width = v208;
    v300.size.double height = v210;
    double v217 = CGRectGetMaxX(v300);
    [(UIView *)v239->_collectionView bounds];
    if (v217 > v218)
    {
      if ([v236 supportsSkinToneVariants])
      {
        v219 = v239->_emojiGraphicsTraits;
        if (!v219 || !v219->_isFirstPartyStickers)
        {
          p_collectionView = (id *)&v239->_collectionView;
          [(UIView *)v239->_collectionView bounds];
          double v222 = v221;
          v301.origin.double x = v212;
          v301.origin.double y = v213;
          v301.size.double width = v208;
          v301.size.double height = v210;
          double v223 = CGRectGetMaxX(v301);
          [(UIView *)v239->_collectionView bounds];
          if (v223 - v224 >= 0.0) {
            double v225 = v223 - v224;
          }
          else {
            double v225 = -(v223 - v224);
          }
          id v226 = *p_collectionView;
          [*p_collectionView contentOffset];
          double v228 = v227;
          [*p_collectionView contentOffset];
          [v226 setContentOffset:1 animated:v228 + v225];
          double v212 = v222 - v208;
        }
      }
    }
  }
  else
  {
    [(UIKeyboardEmojiGraphicsTraits *)v239->_emojiGraphicsTraits fakeEmojiKeySize];
    double v208 = v207;
    double v210 = v209;
    double v211 = (v209 - v206) * 0.5;
    double v212 = v200 - (v207 - v204) * 0.5;
    double v213 = v202 - v211;
  }
  v229 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v212, v213, v208, v210, v212, v213, v208, v210);
  [v144 setShape:v229];

  v230 = [(UIKBKeyView *)v239 key];
  [v144 setParentKey:v230];

  [v144 setObject:v236 forProperty:@"UIKBAssociatedEmoji"];
  double v22 = v238;
LABEL_76:

  return v144;
}

void __50__UIKeyboardEmojiCollectionInputView_treeForCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v7 = [a2 representedString];
  double v8 = [*(id *)(a1 + 32) emojiString];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)genderEmojiBaseStringNeedVariantSelector:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"⛹"] & 1) != 0
    || ([v3 isEqualToString:@"🏋"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"🕵"];
  }

  return v4;
}

- (id)selectedChildSkinToneEmoji:(id)a3
{
  id v3 = a3;
  if ([v3 selectedVariantIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  char v4 = [v3 subtrees];
  double v5 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v3, "selectedVariantIndex"));

  double v6 = [v5 displayString];

  if (!v6)
  {
LABEL_4:
    double v8 = [v3 objectForProperty:@"UIKBAssociatedEmoji"];
  }
  else
  {
    double v7 = [v3 objectForProperty:@"UIKBAssociatedEmoji"];
    double v8 = +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v6, [v7 variantMask]);
  }
  return v8;
}

- (int64_t)didInputSubTree:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  int64_t v5 = [(UIKBKeyView *)&v43 didInputSubTree:v4];
  double v6 = [v4 objectForProperty:@"UIKBAssociatedEmoji"];
  if (v6)
  {
    double v7 = v6;
    if ([v6 supportsSkinToneVariants])
    {
      if ([v4 state] == 16)
      {
        unint64_t v8 = [v4 selectedVariantIndex];
        int v9 = [v4 subtrees];
        BOOL v10 = v8 < [v9 count];
      }
      else
      {
        BOOL v10 = 0;
      }
      if (![(UIKeyboardEmojiCollectionInputView *)self _userHasSelectedSkinToneEmoji]) {
        int64_t v5 = 1;
      }
      int64_t v42 = v5;
      double v11 = [(UIKeyboardEmojiCollectionInputView *)self selectedChildSkinToneEmoji:v4];

      if (v10)
      {
        double v12 = [v4 subtrees];
        id v13 = [v12 objectAtIndex:0];
        double v14 = [v13 representedString];

        CGFloat v15 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
        double v16 = [v11 emojiString];
        [v15 updateSkinToneBaseKey:v14 variantUsed:v16];
      }
      collectionView = self->_collectionView;
      double v18 = [(UIKeyboardEmojiCollectionInputView *)self tappedSkinToneEmoji];
      CGFloat v19 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v18];

      double v20 = [v19 emoji];
      CGFloat v21 = [v20 emojiString];
      double v22 = [(UIKeyboardEmojiCollectionInputView *)self emojiBaseString:v21];
      double v23 = [v11 emojiString];
      double v24 = [(UIKeyboardEmojiCollectionInputView *)self emojiBaseString:v23];
      int v25 = [v22 isEqualToString:v24];

      if (v25)
      {
        [v19 setEmoji:v11];
        if (os_variant_has_internal_diagnostics())
        {
          v40 = objc_opt_class();
          double v41 = [v11 emojiString];
          objc_msgSend(v19, "setUnreleasedHighlight:", objc_msgSend(v40, "shouldHighlightEmoji:", v41));
        }
      }

      int64_t v5 = v42;
    }
    else
    {
      double v11 = v7;
    }
    double v26 = +[UIKeyboardInputModeController sharedInputModeController];
    double v27 = [v26 lastUsedInputModeForCurrentContext];
    double v28 = [v27 primaryLanguage];
    uint64_t v29 = [v28 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    if (v29) {
      double v30 = (__CFString *)v29;
    }
    else {
      double v30 = @"en_US";
    }
    double v31 = +[UIKeyboardImpl activeInstance];
    int v32 = [v31 isEmojiPopoverVisibleOrDismissing];

    if (!v32) {
      goto LABEL_25;
    }
    double v33 = [(UIKeyboardEmojiCollectionInputView *)self emojiSearchField];
    BOOL v34 = [v33 text];
    if ([v34 length])
    {
      CGFloat v35 = [(UIKeyboardEmojiCollectionInputView *)self tappedSkinToneEmoji];
      uint64_t v36 = [v35 section];

      if (!v36)
      {
        CGFloat v37 = UIKBAnalyticsEmojiInputTypePopoverSearch;
LABEL_24:
        +[UIKBAnalyticsDispatcher emojiInsertedByMethod:@"Touch" inputType:*v37];
LABEL_25:
        CGFloat v38 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
        [v38 emojiUsed:v11 language:v30];

        goto LABEL_26;
      }
    }
    else
    {
    }
    CGFloat v37 = UIKBAnalyticsEmojiInputTypePopover;
    goto LABEL_24;
  }
LABEL_26:
  [v4 setObject:0 forProperty:@"UIKBAssociatedEmoji"];

  return v5;
}

- (void)shouldDismissModalDisplayView:(id)a3
{
  [(UIKeyboardEmojiCollectionInputView *)self _setUserHasSelectedSkinToneEmoji:1];
  id v4 = [(UIKeyboardEmojiCollectionInputView *)self completionBlock];
  if (v4)
  {
    int64_t v5 = v4;
    v4[2]();
    [(UIKeyboardEmojiCollectionInputView *)self setCompletionBlock:0];
    id v4 = v5;
  }
}

- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5
{
  v82[2] = *MEMORY[0x1E4F143B8];
  id v77 = a4;
  id v8 = a3;
  [(UIKeyboardEmojiCollectionInputView *)self setCompletionBlock:a5];
  int v9 = [MEMORY[0x1E4F1CA48] array];
  BOOL v10 = [(UIKBKeyView *)self renderConfig];
  int v11 = [v10 whiteText];

  if (v11)
  {
    id v12 = +[UIColor whiteColor];
    uint64_t v13 = (uint64_t)v12;
  }
  else
  {
    uint64_t v13 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBEmojiLightControlSymbolColor")];
    id v12 = +[UIColor systemBlueColor];
  }
  double v78 = v12;
  BOOL v14 = +[UIKeyboardImpl isSplit];
  if (+[UIKeyboardImpl isFloating])
  {
    int v75 = 0;
  }
  else
  {
    CGFloat v15 = [(UIKBKeyView *)self renderConfig];
    int v75 = [v15 isFloating] ^ 1;
  }
  BOOL v74 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v71 = self;
  unint64_t v16 = [(UIView *)self _keyboardOrientation] - 3;
  CGFloat v17 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v18 = [v17 preferencesActions];
  [v18 rivenSizeFactor:1.0];
  double v20 = v19;

  double v21 = 1.67;
  if (v16 < 2) {
    double v21 = 1.75;
  }
  if (v14) {
    double v22 = 0.423;
  }
  else {
    double v22 = 0.366;
  }
  if (v14) {
    double v23 = 50.0;
  }
  else {
    double v23 = 0.0;
  }
  if (!v14) {
    double v21 = 1.0;
  }
  double v24 = 0.96;
  if (v20 <= 1.0) {
    double v24 = 1.0;
  }
  double v25 = v21 * v24;
  double v26 = objc_alloc_init(UIView);
  [(UIView *)v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addSubview:v26];
  double v27 = [MEMORY[0x1E4F5B268] constraintWithItem:v26 attribute:3 relatedBy:0 toItem:v8 attribute:3 multiplier:1.0 constant:0.0];
  [v9 addObject:v27];

  double v28 = [MEMORY[0x1E4F5B268] constraintWithItem:v26 attribute:1 relatedBy:0 toItem:v8 attribute:1 multiplier:1.0 constant:0.0];
  [v9 addObject:v28];

  uint64_t v29 = [MEMORY[0x1E4F5B268] constraintWithItem:v26 attribute:2 relatedBy:0 toItem:v8 attribute:2 multiplier:1.0 constant:0.0];
  [v9 addObject:v29];

  double v30 = [MEMORY[0x1E4F5B268] constraintWithItem:v26 attribute:8 relatedBy:0 toItem:v8 attribute:8 multiplier:v22 constant:0.0];
  [v9 addObject:v30];

  double v31 = objc_alloc_init(UILabel);
  [(UIView *)v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v31 setUserInteractionEnabled:0];
  double v76 = (void *)v13;
  uint64_t v32 = *(void *)off_1E52D2040;
  v81[0] = *(void *)off_1E52D2048;
  uint64_t v69 = v81[0];
  v81[1] = v32;
  v82[0] = v13;
  double v33 = [off_1E52D39B8 systemFontOfSize:13.0];
  v82[1] = v33;
  v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];

  id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
  CGFloat v35 = [getEMFEmojiCategoryClass_0() localizedSkinToneEmojiDescription];
  double v72 = (void *)[v34 initWithString:v35 attributes:v73];

  [(UILabel *)v31 setNumberOfLines:0];
  [(UILabel *)v31 setTextAlignment:1];
  [(UILabel *)v31 setAttributedText:v72];
  [(UIView *)v26 addSubview:v31];
  uint64_t v36 = [MEMORY[0x1E4F5B268] constraintWithItem:v31 attribute:9 relatedBy:0 toItem:v26 attribute:9 multiplier:v25 constant:0.0];
  [v9 addObject:v36];

  CGFloat v37 = [MEMORY[0x1E4F5B268] constraintWithItem:v31 attribute:3 relatedBy:0 toItem:v26 attribute:3 multiplier:1.0 constant:0.0];
  [v9 addObject:v37];

  CGFloat v38 = [MEMORY[0x1E4F5B268] constraintWithItem:v31 attribute:4 relatedBy:0 toItem:v26 attribute:4 multiplier:1.0 constant:0.0];
  [v9 addObject:v38];

  v39 = (void *)MEMORY[0x1E4F5B268];
  [(UIKeyboardEmojiGraphicsTraits *)v71->_emojiGraphicsTraits alertTextWidth];
  double v41 = [v39 constraintWithItem:v31 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v40 - v23];
  [v9 addObject:v41];

  int64_t v42 = objc_alloc_init(UIView);
  [(UIView *)v42 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addSubview:v42];
  objc_super v43 = [MEMORY[0x1E4F5B268] constraintWithItem:v42 attribute:4 relatedBy:0 toItem:v8 attribute:4 multiplier:1.0 constant:0.0];
  [v9 addObject:v43];

  v67 = v42;
  double v44 = [MEMORY[0x1E4F5B268] constraintWithItem:v42 attribute:8 relatedBy:0 toItem:v8 attribute:8 multiplier:0.086 constant:0.0];
  [v9 addObject:v44];

  double v45 = +[UIButton buttonWithType:1];
  [v45 setTranslatesAutoresizingMaskIntoConstraints:0];
  v79[1] = v32;
  v80[0] = v78;
  v79[0] = v69;
  double v46 = [off_1E52D39B8 systemFontOfSize:16.0];
  v80[1] = v46;
  double v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];

  id v47 = objc_alloc(MEMORY[0x1E4F28B18]);
  v48 = _UILocalizedStringInSystemLanguage(@"OK", @"OK");
  double v68 = (void *)[v47 initWithString:v48 attributes:v70];

  [v45 setAttributedTitle:v68 forState:0];
  [v45 addTarget:v71 action:sel_shouldDismissModalDisplayView_ forControlEvents:64];
  [v8 addSubview:v45];
  double v49 = [MEMORY[0x1E4F5B268] constraintWithItem:v45 attribute:9 relatedBy:0 toItem:v8 attribute:9 multiplier:v25 constant:0.0];
  [v9 addObject:v49];

  v50 = [MEMORY[0x1E4F5B268] constraintWithItem:v45 attribute:4 relatedBy:0 toItem:v42 attribute:3 multiplier:1.0 constant:6.0];
  [v9 addObject:v50];

  double v51 = [MEMORY[0x1E4F5B268] constraintWithItem:v45 attribute:7 relatedBy:0 toItem:v31 attribute:7 multiplier:1.0 constant:0.0];
  [v9 addObject:v51];

  double v52 = [v77 snapshotViewAfterScreenUpdates:1];

  [v52 setUserInteractionEnabled:0];
  v53 = [[UIKBEmojiSnapshotSizingView alloc] initWithSnapshotView:v52];
  [(UIView *)v53 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ((v74 & v75) != 0) {
    double v54 = -25.0;
  }
  else {
    double v54 = 0.0;
  }
  [v8 addSubview:v53];
  LODWORD(v55) = 1148829696;
  [(UIView *)v53 setContentHuggingPriority:1 forAxis:v55];
  double v56 = [MEMORY[0x1E4F5B268] constraintWithItem:v53 attribute:9 relatedBy:0 toItem:v8 attribute:9 multiplier:v25 constant:0.0];
  [v9 addObject:v56];

  double v57 = [MEMORY[0x1E4F5B268] constraintWithItem:v53 attribute:3 relatedBy:0 toItem:v31 attribute:4 multiplier:1.0 constant:v54];
  [v9 addObject:v57];

  double v58 = objc_alloc_init(UILayoutGuide);
  [v8 addLayoutGuide:v58];

  CGRect v59 = [(UILayoutGuide *)v58 topAnchor];
  double v60 = [(UIView *)v53 bottomAnchor];
  double v61 = [v59 constraintEqualToAnchor:v60];
  [v9 addObject:v61];

  double v62 = [(UILayoutGuide *)v58 bottomAnchor];
  double v63 = [v45 topAnchor];
  v64 = [v62 constraintEqualToAnchor:v63];
  [v9 addObject:v64];

  v65 = [(UILayoutGuide *)v58 heightAnchor];
  double v66 = [v65 constraintGreaterThanOrEqualToConstant:6.0];
  [v9 addObject:v66];

  [MEMORY[0x1E4F5B268] activateConstraints:v9];
}

- (BOOL)_shouldShowRecentlyUsedMedia
{
  if ([(UIKeyboardEmojiCollectionInputView *)self isSearching]
    || ![(UIKeyboardEmojiCollectionInputView *)self showingRecents])
  {
    return 0;
  }
  id v3 = +[UIKeyboardEmojiPreferences sharedInstance];
  if ([v3 deviceSupportsMemoji])
  {
    id v4 = +[UIKeyboardEmojiPreferences sharedInstance];
    BOOL v5 = [v4 memojiSettingEnabled]
      && self->_inputDelegateCanSupportAnimoji
      && self->_shouldRetryFetchingAnimojiRecents;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)didTearDownRecentsViewForKeyboardMediaController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__UIKeyboardEmojiCollectionInputView_didTearDownRecentsViewForKeyboardMediaController___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __87__UIKeyboardEmojiCollectionInputView_didTearDownRecentsViewForKeyboardMediaController___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) shouldRetryFetchingRecents];
  *(unsigned char *)(*(void *)(a1 + 32) + 642) = result;
  return result;
}

- (void)didInsertMediaForKeyboardMediaController:(id)a3
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 dismissEmojiPopoverIfNecessaryWithCompletion:0];
}

- (void)didPresentCardForKeyboardMediaController:(id)a3
{
  id v4 = [(UIKeyboardEmojiCollectionInputView *)self emojiSearchField];
  int v5 = [v4 isActive];

  if (v5)
  {
    double v6 = [(UIKeyboardEmojiCollectionInputView *)self emojiSearchField];
    [v6 resignFirstResponder];
  }
  id v7 = +[UIKeyboardImpl activeInstance];
  [v7 didPresentMemojiCard];
}

- (void)didDismissCardForKeyboardMediaController:(id)a3
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 didDismissMemojiCard];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  int64_t v5 = [v4 count];

  if (![(UIKeyboardEmojiCollectionInputView *)self showingRecents]) {
    v5 += [(UIKeyboardEmojiCollectionInputView *)self isSearching];
  }
  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
LABEL_2:
    id v7 = +[UIKeyboardEmojiCategory categoryForType:[(UIKeyboardEmojiCollectionInputView *)self emojiCategoryTypeForSection:a4]];
    id v8 = [v7 emoji];
    unint64_t v9 = [v8 count];

LABEL_3:
    goto LABEL_4;
  }
  if (![(UIKeyboardEmojiCollectionInputView *)self isSearching])
  {
    if ([(UIKeyboardEmojiCollectionInputView *)self showingRecents])
    {
      int64_t v15 = [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits prepolulatedRecentCount];
      unint64_t v9 = v15
         + [(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia];
      goto LABEL_4;
    }
    goto LABEL_2;
  }
  int v11 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    unint64_t v9 = 1;
    goto LABEL_4;
  }
  unint64_t v9 = [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits prepolulatedRecentCount];
  uint64_t v13 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
  unint64_t v14 = [v13 count];

  if (v14 > v9)
  {
    id v7 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
    unint64_t v9 = [v7 count];
    goto LABEL_3;
  }
LABEL_4:

  return v9;
}

+ (BOOL)shouldHighlightEmoji:(id)a3
{
  return +[UIKeyboardEmoji shouldHighlightEmoji:a3];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  unint64_t v7 = [v5 item];
  BOOL v8 = [(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia];
  collectionView = self->_collectionView;
  if (v8 && !v6 && !v7)
  {
    BOOL v10 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:@"kMediaCellIdentifier" forIndexPath:v5];

    int v11 = +[UIKeyboardMediaController sharedKeyboardMediaController];
    uint64_t v12 = [v10 contentView];
    [v11 showRecentlyUsedMediaInView:v12];

    goto LABEL_32;
  }
  BOOL v10 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:@"kEmojiCellIdentifier" forIndexPath:v5];

  if (v6) {
    goto LABEL_6;
  }
  if (![(UIKeyboardEmojiCollectionInputView *)self isSearching]
    || ([(UIKeyboardEmojiCollectionInputView *)self searchResults],
        double v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        !v19))
  {
    if ([(UIKeyboardEmojiCollectionInputView *)self showingRecents])
    {
      unint64_t v25 = v7 - v8;
      uint64_t v37 = 0;
      double v26 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
      unint64_t v14 = [v26 recentEmojiAtIndex:v25 size:&v37];

      if (v14)
      {
        int64_t v15 = +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v14, +[UIKeyboardEmojiCategory hasVariantsForEmoji:v14]);
      }
      else
      {
        double v27 = +[UIKeyboardEmojiCategory categoryForType:9];
        double v28 = [v27 emoji];

        uint64_t v29 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
        double v30 = [v29 emojiWithoutDuplicateRecents:v28];

        unint64_t v31 = v25 - v37;
        if (v31 >= [v30 count])
        {
          int64_t v15 = 0;
        }
        else
        {
          int64_t v15 = [v30 objectAtIndex:v31];
        }
      }
      [v15 setIsFromRecentsCategory:1];
      goto LABEL_28;
    }
LABEL_6:
    uint64_t v13 = +[UIKeyboardEmojiCategory categoryForType:[(UIKeyboardEmojiCollectionInputView *)self emojiCategoryTypeForSection:v6]];
    unint64_t v14 = [v13 emoji];

    if (!v14)
    {
      int64_t v15 = 0;
      goto LABEL_28;
    }
    int64_t v15 = [v14 objectAtIndex:v7];
    if (v15)
    {
      unint64_t v16 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
      CGFloat v17 = [v15 emojiString];
      double v18 = [v16 lastUsedVariantEmojiForEmojiString:v17];
      [v15 setEmojiString:v18];

LABEL_9:
    }
LABEL_28:

    if (v15)
    {
      [v10 setEmoji:v15];
      uint64_t v32 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
      [v32 emojiKeyWidth];
      [v10 setEmojiFontSize:(uint64_t)v33];

      if (os_variant_has_internal_diagnostics())
      {
        CGFloat v35 = objc_opt_class();
        uint64_t v36 = [v15 emojiString];
        objc_msgSend(v10, "setUnreleasedHighlight:", objc_msgSend(v35, "shouldHighlightEmoji:", v36));
      }
    }
    goto LABEL_31;
  }
  double v20 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    double v22 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
    unint64_t v23 = [v22 count];

    if (v7 < v23)
    {
      double v24 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
      unint64_t v14 = [v24 objectAtIndex:v7];

      unint64_t v16 = [v14 string];
      if (v16)
      {
        int64_t v15 = +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v16, +[UIKeyboardEmojiCategory hasVariantsForEmoji:v16]);
      }
      else
      {
        int64_t v15 = 0;
      }
      goto LABEL_9;
    }
    [v10 setEmoji:0];
  }
  else
  {
    [v10 setEmoji:0];
    [v10 setNoResultsCell:1];
  }
  int64_t v15 = 0;
LABEL_31:

LABEL_32:
  return v10;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = v10;
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (emojiGraphicsTraits && emojiGraphicsTraits->_isFirstPartyStickers && ![v10 section])
  {
    uint64_t v13 = 0;
    goto LABEL_21;
  }
  uint64_t v13 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"kEmojiCategoryTitleIdentifier" forIndexPath:v11];
  if ([(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection] == UICollectionViewScrollDirectionVertical)
  {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewLeftMostPadding];
    double v15 = v14;
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewRightMostPadding];
    objc_msgSend(v13, "setInsets:", 0.0, v15, 0.0, v16);
  }
  uint64_t v17 = [v11 section];
  int64_t v18 = [(UIKeyboardEmojiCollectionInputView *)self emojiCategoryTypeForSection:v17];
  if (v17 || ![(UIKeyboardEmojiCollectionInputView *)self isSearching])
  {
    uint64_t v19 = +[UIKeyboardEmojiCategory displayName:v18];
  }
  else
  {
    uint64_t v19 = _UILocalizedStringInSystemLanguage(@"Results", @"Results");
  }
  double v20 = (void *)v19;
  [v13 setHeaderName:v19];
  uint64_t v21 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
  [v21 categoryHeaderFontSize];
  objc_msgSend(v13, "setHeaderFontSize:");

  double v22 = +[UIDevice currentDevice];
  uint64_t v23 = [v22 _keyboardGraphicsQuality];

  double v24 = [(UIKBKeyView *)self renderConfig];
  char v25 = [v24 whiteText];
  if (v23 == 10)
  {
    if ((v25 & 1) == 0)
    {
      double v26 = 0.51372549;
      double v27 = 0.517647059;
      double v28 = 0.529411765;
LABEL_17:
      uint64_t v29 = +[UIColor colorWithRed:v26 green:v27 blue:v28 alpha:1.0];
      goto LABEL_18;
    }
  }
  else if ((v25 & 1) == 0)
  {
    double v26 = 0.647;
    double v27 = 0.651;
    double v28 = 0.663;
    goto LABEL_17;
  }
  uint64_t v29 = +[UIColor whiteColor];
LABEL_18:
  double v30 = (void *)v29;
  [v13 setHeaderTextColor:v29];

  unint64_t v31 = [(UIKBKeyView *)self renderConfig];
  int v32 = [v31 whiteText];
  double v33 = 0.4;
  if (!v32) {
    double v33 = 1.0;
  }
  [v13 setHeaderOpacity:v33];

  id v34 = [(UIKBKeyView *)self renderConfig];
  objc_msgSend(v13, "setUseVibrantBlend:", objc_msgSend(v34, "whiteText"));

LABEL_21:
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  double v10 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    double v11 = 0.0;
    if (![v9 scrollDirection])
    {
      emojiGraphicsTraits = self->_emojiGraphicsTraits;
      if (emojiGraphicsTraits && !a5 && emojiGraphicsTraits->_isFirstPartyStickers)
      {
        double v10 = *MEMORY[0x1E4F1DB30];
        double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      else
      {
        [v8 bounds];
        double v10 = v15;
        [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categoryHeaderHeight];
        double v11 = v16;
      }
    }
  }
  else
  {
    double v11 = 0.0;
  }

  double v13 = v10;
  double v14 = v11;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)showingRecents
{
  v2 = +[UIKeyboardEmojiPreferences sharedInstance];
  char v3 = [v2 shouldShowRecents];

  return v3;
}

- (int64_t)emojiCategoryTypeForSection:(int64_t)a3
{
  if (![(UIKeyboardEmojiCollectionInputView *)self showingRecents])
  {
    BOOL v5 = [(UIKeyboardEmojiCollectionInputView *)self isSearching];
    uint64_t v6 = a3 > 0 && v5;
    a3 -= v6;
  }
  return +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:a3];
}

- (BOOL)handleKeyEvent:(id)a3
{
  id v4 = a3;
  if ([v4 keyCode])
  {
    BOOL v5 = [(UIKeyboardEmojiCollectionInputView *)self emojiSearchField];
    uint64_t v6 = [v5 markedTextRange];

    if (!v6)
    {
      if (([v4 keyCode] == 44 || objc_msgSend(v4, "keyCode") == 40)
        && [(UIKeyboardEmojiCollectionInputView *)self handleSelectionEvent:v4])
      {
        goto LABEL_13;
      }
      if (self->_showingVariants)
      {
        selectedPopupKedouble y = self->_selectedPopupKey;
        if (selectedPopupKey)
        {
          if ([(UIKBTree *)selectedPopupKey variantType] == 12
            || [(UIKBTree *)self->_selectedPopupKey variantType] == 13)
          {
            if ([(UIKeyboardEmojiCollectionInputView *)self handleKeyInputForFamilySelector:v4])
            {
LABEL_13:
              BOOL v7 = 1;
              goto LABEL_4;
            }
          }
          else if ([(UIKeyboardEmojiCollectionInputView *)self handleKeyInputForVariantSelector:v4])
          {
            goto LABEL_13;
          }
        }
      }
      BOOL v7 = [(UIKeyboardEmojiCollectionInputView *)self handleKeyInputForCollectionViewNavigation:v4];
      goto LABEL_4;
    }
  }
  BOOL v7 = 0;
LABEL_4:

  return v7;
}

- (BOOL)handleKeyInputForVariantSelector:(id)a3
{
  id v4 = a3;
  if ([v4 modifiersEqual:0])
  {
    switch(-[UIKeyboardEmojiCollectionInputView keyCodeForCurrentEnvironmentFromKeyCode:](self, "keyCodeForCurrentEnvironmentFromKeyCode:", [v4 keyCode]))
    {
      case 'O':
        if ([(UIKBTree *)self->_selectedPopupKey selectedVariantIndex] == 0x7FFFFFFFFFFFFFFFLL
          || (unint64_t selectedVariant = self->_selectedVariant,
              [(UIKBTree *)self->_selectedPopupKey subtrees],
              uint64_t v6 = objc_claimAutoreleasedReturnValue(),
              unint64_t v7 = [v6 count] - 1,
              v6,
              selectedVariant >= v7))
        {
          int64_t v8 = 0;
        }
        else
        {
          int64_t v8 = self->_selectedVariant + 1;
        }
        self->_unint64_t selectedVariant = v8;
        double v14 = [(UIKBTree *)self->_selectedPopupKey subtrees];
        double v15 = [v14 objectAtIndex:self->_selectedVariant];
        int v16 = [v15 interactionType];

        int64_t v17 = self->_selectedVariant;
        if (v16) {
          goto LABEL_25;
        }
        ++v17;
        goto LABEL_24;
      case 'P':
        if ([(UIKBTree *)self->_selectedPopupKey selectedVariantIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_unint64_t selectedVariant = 0;
        }
        else
        {
          int64_t v18 = self->_selectedVariant;
          BOOL v19 = v18 < 1;
          int64_t v20 = v18 - 1;
          if (v19)
          {
            uint64_t v23 = [(UIKBTree *)self->_selectedPopupKey subtrees];
            self->_unint64_t selectedVariant = [v23 count] - 1;
          }
          else
          {
            self->_unint64_t selectedVariant = v20;
          }
        }
        double v24 = [(UIKBTree *)self->_selectedPopupKey subtrees];
        char v25 = [v24 objectAtIndex:self->_selectedVariant];
        int v26 = [v25 interactionType];

        int64_t v17 = self->_selectedVariant;
        if (!v26)
        {
          --v17;
LABEL_24:
          self->_unint64_t selectedVariant = v17;
        }
LABEL_25:
        [(UIKBTree *)self->_selectedPopupKey setSelectedVariantIndex:v17];
        uint64_t v21 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
        id v9 = v21;
        selectedPopupKedouble y = self->_selectedPopupKey;
        goto LABEL_26;
      case 'Q':
        double v11 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
        [v11 updateState:2 forKey:self->_selectedPopupKey];

        self->_showingVariants = 0;
        uint64_t v12 = self->_selectedPopupKey;
        self->_selectedPopupKedouble y = 0;

        id v9 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
        [(UIKeyboardEmojiCollectionInputView *)self updateHighlightForIndexPath:v9 scrollIfNeeded:0 animateScroll:0];
        goto LABEL_27;
      case 'R':
        if ([(UIKBTree *)self->_selectedPopupKey selectedVariantIndex] == 0x7FFFFFFFFFFFFFFFLL) {
          int64_t v13 = 0;
        }
        else {
          int64_t v13 = [(UIKBTree *)self->_selectedPopupKey selectedVariantIndex];
        }
        self->_unint64_t selectedVariant = v13;
        -[UIKBTree setSelectedVariantIndex:](self->_selectedPopupKey, "setSelectedVariantIndex:");
        uint64_t v21 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
        id v9 = v21;
        selectedPopupKedouble y = self->_selectedPopupKey;
LABEL_26:
        [v21 updateState:16 forKey:selectedPopupKey];
LABEL_27:
        BOOL v10 = 1;
        break;
      default:
        if (!self->_selectedPopupKey) {
          goto LABEL_8;
        }
        id v9 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
        [v9 updateState:2 forKey:self->_selectedPopupKey];
        BOOL v10 = 0;
        break;
    }
  }
  else
  {
LABEL_8:
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)handleKeyInputForCollectionViewNavigation:(id)a3
{
  id v4 = a3;
  if (([v4 unmodifiedKeyCodeEquals:44] & 1) != 0
    || ([v4 unmodifiedKeyCodeEquals:158] & 1) != 0)
  {
    goto LABEL_3;
  }
  if ([v4 unmodifiedKeyCodeEquals:79]) {
    int v7 = 1;
  }
  else {
    int v7 = [v4 equalsKeyCode:79 modifiers:0x100000];
  }
  if ([v4 unmodifiedKeyCodeEquals:80]) {
    int v8 = 1;
  }
  else {
    int v8 = [v4 equalsKeyCode:80 modifiers:0x100000];
  }
  if ([v4 unmodifiedKeyCodeEquals:82]) {
    int v9 = 1;
  }
  else {
    int v9 = [v4 equalsKeyCode:82 modifiers:0x100000];
  }
  if ([v4 unmodifiedKeyCodeEquals:81]) {
    int v10 = 1;
  }
  else {
    int v10 = [v4 equalsKeyCode:81 modifiers:0x100000];
  }
  UICollectionViewScrollDirection v11 = [(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection];
  UIUserInterfaceLayoutDirection v12 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft) {
    int v13 = v7;
  }
  else {
    int v13 = v8;
  }
  if (v12 == UIUserInterfaceLayoutDirectionRightToLeft) {
    int v7 = v8;
  }
  if (v11) {
    int v14 = v13;
  }
  else {
    int v14 = v9;
  }
  if (v11) {
    int v15 = v7;
  }
  else {
    int v15 = v10;
  }
  int v100 = v15;
  if (v11) {
    int v16 = v9;
  }
  else {
    int v16 = v13;
  }
  if (v11) {
    char v17 = v10;
  }
  else {
    char v17 = v7;
  }
  int64_t v18 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];

  if (v18)
  {
    double v96 = v18;
    char v19 = v16;
    int64_t v20 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
    uint64_t v21 = self;
    char v22 = v17;
    uint64_t v23 = [v20 section];

    double v24 = [(UIKeyboardEmojiCollectionInputView *)v21 selectedIndexPath];
    unint64_t v25 = [v24 item];

    int v26 = v21;
    p_collectionView = (id *)&v21->_collectionView;
    collectionView = v21->_collectionView;
    uint64_t v29 = v23;
    uint64_t v30 = [(UICollectionView *)collectionView numberOfItemsInSection:v23];
    if (v22)
    {
      uint64_t v31 = v25;
      int v99 = v14;
      if (v25 >= v30 - 1)
      {
        int v32 = 0;
        if (v23 < [*p_collectionView numberOfSections] - 1)
        {
          uint64_t v31 = 0;
          uint64_t v29 = v23 + 1;
        }
      }
      else
      {
        int v32 = 0;
        uint64_t v31 = v25 + 1;
      }
      char v46 = 1;
      uint64_t v45 = 1;
      self = v26;
      goto LABEL_142;
    }
    unint64_t v98 = v25;
    if (v11) {
      uint64_t v42 = 5;
    }
    else {
      uint64_t v42 = 8;
    }
    if (v19)
    {
      self = v26;
      BOOL v43 = [(UIKeyboardEmojiCollectionInputView *)v26 _shouldShowRecentlyUsedMedia];
      unint64_t v44 = v29 < 2 && v43;
      uint64_t v31 = v25;
      if (v25 > v44)
      {
        int v32 = 0;
        uint64_t v31 = v25 - 1;
        int v99 = 1;
        uint64_t v45 = 1;
        char v46 = v100;
LABEL_142:
        if (![(UIKeyboardEmojiCollectionInputView *)self isSearching] || v29) {
          goto LABEL_152;
        }
        v89 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
        int v90 = v31 < (unint64_t)[v89 count];

        if ((v90 & 1) == 0) {
          uint64_t v31 = 0;
        }
        uint64_t v29 = ~v90 & 1;
        if ((v90 | v46) & 1) != 0 || ((v99 ^ 1)) {
          goto LABEL_152;
        }
        double v91 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
        uint64_t v92 = [v91 count];

        if (v92)
        {
          double v93 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
          uint64_t v31 = [v93 count] - 1;

          uint64_t v29 = 0;
LABEL_152:
          double v94 = [MEMORY[0x1E4F28D58] indexPathForItem:v31 inSection:v29];
          [(UIKeyboardEmojiCollectionInputView *)self updateHighlightForIndexPath:v94 scrollIfNeeded:v45 animateScroll:v45 & v32];

          BOOL v5 = 1;
          goto LABEL_4;
        }
        uint64_t v31 = 0;
LABEL_151:
        uint64_t v29 = 1;
        goto LABEL_152;
      }
      uint64_t v56 = v29 - 1;
      char v46 = v100;
      if (v29 >= 1)
      {
        int v32 = 0;
        uint64_t v31 = [*p_collectionView numberOfItemsInSection:v29 - 1] - 1;
        int v99 = 1;
        uint64_t v45 = 1;
LABEL_80:
        uint64_t v29 = v56;
        goto LABEL_142;
      }
      int v32 = 0;
      goto LABEL_94;
    }
    uint64_t v47 = v42;
    int64_t v18 = v96;
    self = v26;
    double v41 = (UIKeyboardEmojiCollectionView **)p_collectionView;
    if (v100) {
      goto LABEL_61;
    }
  }
  else
  {
    if ([(UIKeyboardEmojiCollectionInputView *)self isSearching] && ((v7 | v13) & 1) != 0) {
      goto LABEL_3;
    }
    int v95 = v16;
    int v99 = v14;
    double v33 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
    id v34 = [v33 sortedArrayUsingSelector:sel_compare_];

    CGFloat v35 = [v34 firstObject];
    uint64_t v29 = [v35 section];
    uint64_t v36 = [v35 item];
    if (!(v29 | v36)) {
      uint64_t v36 = [(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia];
    }
    unint64_t v98 = v36;
    if ([(UIKeyboardEmojiCollectionInputView *)self isSearching])
    {
      uint64_t v37 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
      CGFloat v38 = v34;
      uint64_t v39 = [v37 count];

      BOOL v75 = v39 == 0;
      id v34 = v38;
      uint64_t v36 = v98;
      if (v75) {
        uint64_t v29 = 1;
      }
    }
    double v40 = [MEMORY[0x1E4F28D58] indexPathForItem:v36 inSection:v29];
    [(UIKeyboardEmojiCollectionInputView *)self setSelectedIndexPath:v40];

    double v41 = &self->_collectionView;
    uint64_t v30 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:v29];
    if (v17)
    {
      int v32 = 0;
LABEL_71:
      char v46 = 1;
LABEL_72:
      uint64_t v45 = 1;
LABEL_77:
      uint64_t v31 = v98;
      goto LABEL_142;
    }
    uint64_t v47 = 8;
    if (v11) {
      uint64_t v47 = 5;
    }
    if (v95)
    {
      [(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia];
      int v32 = 0;
      int v99 = 1;
      uint64_t v45 = 1;
      char v46 = v100;
      goto LABEL_77;
    }
    uint64_t v42 = 0;
    int v14 = v99;
    if (v100)
    {
LABEL_61:
      unint64_t v48 = v30;
      unint64_t v101 = v47;
      int v99 = v14;
      v97 = (id *)v41;
      int v49 = ![(UIScrollView *)*v41 isScrollAnimating];
      int v50 = [v4 modifiersEqual:0x100000];
      int v51 = v50;
      uint64_t v52 = 40;
      if (v11 == UICollectionViewScrollDirectionVertical) {
        uint64_t v52 = 56;
      }
      int v32 = v50 | v49;
      if (v50) {
        uint64_t v53 = v52;
      }
      else {
        uint64_t v53 = v42;
      }
      BOOL v54 = [(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia];
      if (v29) {
        BOOL v55 = 0;
      }
      else {
        BOOL v55 = v54;
      }
      if (v18 || v51)
      {
        unint64_t v57 = v53 + v98 - v48;
        if (v53 + v98 < v48)
        {
          char v46 = 1;
          uint64_t v45 = 1;
          uint64_t v31 = v53 + v98;
          goto LABEL_142;
        }
        uint64_t v56 = v29 + 1;
        if (v29 + 1 < [*v97 numberOfSections])
        {
          unint64_t v62 = v101;
          unint64_t v63 = v48 % v101;
          if (v55) {
            unint64_t v62 = 0;
          }
          unint64_t v64 = v63 - v62;
          if (v63) {
            unint64_t v65 = v64;
          }
          else {
            unint64_t v65 = 0;
          }
          uint64_t v66 = v65 + v57;
          if ((uint64_t)(v65 + v57) >= [*v97 numberOfItemsInSection:v56] || v66 < 0) {
            uint64_t v66 = v98 % v101;
          }
          if (v55)
          {
            if (v66) {
              uint64_t v31 = v66 - 1;
            }
            else {
              uint64_t v31 = v98 % v101;
            }
            [(UIKeyboardEmojiCollectionInputView *)self isSearching];
            uint64_t v45 = 1;
            goto LABEL_151;
          }
          char v46 = 1;
          uint64_t v45 = 1;
          uint64_t v31 = v66;
          goto LABEL_80;
        }
        uint64_t v31 = v48 - 1;
        char v46 = 1;
LABEL_141:
        uint64_t v45 = 1;
        goto LABEL_142;
      }
      goto LABEL_71;
    }
  }
  if (v14)
  {
    unint64_t v102 = v47;
    int v58 = ![(UIScrollView *)*v41 isScrollAnimating];
    int v59 = [v4 modifiersEqual:0x100000];
    int v32 = v59 | v58;
    if (v18 || v59)
    {
      v67 = (id *)v41;
      uint64_t v68 = 40;
      if (v11 == UICollectionViewScrollDirectionVertical) {
        uint64_t v68 = 56;
      }
      if (v59) {
        uint64_t v69 = v68;
      }
      else {
        uint64_t v69 = v102;
      }
      uint64_t v70 = v98 - v69;
      BOOL v71 = [(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia];
      if (v29) {
        uint64_t v31 = 0;
      }
      else {
        uint64_t v31 = v71;
      }
      if (v70 >= v31)
      {
        char v46 = 0;
        int v99 = 1;
        uint64_t v45 = 1;
        uint64_t v31 = v70;
        goto LABEL_142;
      }
      if (v29 >= 1)
      {
        BOOL v72 = v71;
        uint64_t v73 = [*v67 numberOfItemsInSection:v29 - 1];
        BOOL v74 = v29 == 1;
        BOOL v75 = !v74 || !v72;
        if (v74 && v72) {
          uint64_t v76 = 1;
        }
        else {
          uint64_t v76 = v31;
        }
        unint64_t v77 = v102 + v73 / v102 * v102 - v73;
        if (!v75) {
          unint64_t v77 = 0;
        }
        unint64_t v78 = v77 + v73;
        if ((uint64_t)(v78 + v70) >= v73) {
          unint64_t v79 = v102;
        }
        else {
          unint64_t v79 = 0;
        }
        uint64_t v80 = v78 + v70 - v79;
        unint64_t v81 = v78 + v98;
        unint64_t v82 = v79 + v69;
        char v46 = 0;
        if (v76 <= v80) {
          uint64_t v76 = v80;
        }
        unint64_t v83 = v76 + v82;
        BOOL v75 = v83 == v81;
        unint64_t v84 = (v83 - v81 - (v83 != v81)) / v102;
        if (!v75) {
          ++v84;
        }
        uint64_t v31 = v81 - v82 + v84 * v102;
        int v99 = 1;
        uint64_t v45 = 1;
        --v29;
        goto LABEL_142;
      }
      char v46 = 0;
LABEL_94:
      int v99 = 1;
      goto LABEL_141;
    }
    char v46 = 0;
    int v99 = 1;
    goto LABEL_72;
  }
  char v60 = [v4 unmodifiedKeyCodeEquals:43];
  int v61 = [v4 equalsKeyCode:43 modifiers:0x20000];
  if ((v60 & 1) != 0 || v61)
  {
    if (v61)
    {
      if (v29 <= 0)
      {
        char v46 = 0;
        int v99 = 0;
        int v32 = 0;
        uint64_t v29 = 0;
        uint64_t v31 = [(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia];
        goto LABEL_141;
      }
      --v29;
    }
    else
    {
      if (v29 >= [(UICollectionView *)*v41 numberOfSections] - 1)
      {
        uint64_t v29 = [(UICollectionView *)*v41 numberOfSections] - 1;
        uint64_t v88 = [(UICollectionView *)*v41 numberOfItemsInSection:v29];
        char v46 = 0;
        int v99 = 0;
        int v32 = 0;
        uint64_t v31 = v88 - 1;
        goto LABEL_141;
      }
      ++v29;
    }
    int64_t v85 = [(UIKeyboardEmojiCollectionInputView *)self emojiCategoryTypeForSection:v29];
    double v86 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
    [v86 reloadForCategory:v85 withSender:self];

    [(UIKeyboardEmojiCollectionInputView *)self updateToCategory:v85];
    double v87 = [(UIKeyboardEmojiCollectionInputView *)self category];
    uint64_t v31 = [v87 lastVisibleFirstEmojiIndex];

    char v46 = 0;
    int v99 = 0;
    uint64_t v45 = 0;
    int v32 = 0;
    if (!(v31 | v29))
    {
      uint64_t v29 = 0;
      uint64_t v31 = [(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia];
    }
    goto LABEL_142;
  }
LABEL_3:
  BOOL v5 = 0;
LABEL_4:

  return v5;
}

- (BOOL)handleKeyInputForFamilySelector:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 modifiersEqual:0];
  if (v5)
  {
    uint64_t v6 = [(UIKBTree *)self->_selectedPopupKey selectedVariantIndices];
    int v7 = (void *)[v6 mutableCopy];

    if (!v7) {
      int v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1ED3F07A8];
    }
    unint64_t currentVariantRow = self->_currentVariantRow;
    if (currentVariantRow <= [v7 count] - 1)
    {
      int64_t v9 = self->_currentVariantRow;
    }
    else
    {
      int64_t v9 = 0;
      self->_unint64_t currentVariantRow = 0;
    }
    int v10 = [v7 objectAtIndex:v9];
    self->_int64_t selectedVariant = [v10 integerValue];

    switch(-[UIKeyboardEmojiCollectionInputView keyCodeForCurrentEnvironmentFromKeyCode:](self, "keyCodeForCurrentEnvironmentFromKeyCode:", [v4 keyCode]))
    {
      case 'O':
        int64_t selectedVariant = self->_selectedVariant;
        if (selectedVariant == 0x7FFFFFFFFFFFFFFFLL) {
          int64_t v12 = 0;
        }
        else {
          int64_t v12 = selectedVariant + 1;
        }
        goto LABEL_28;
      case 'P':
        int64_t v13 = self->_selectedVariant;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v12 = 0;
        }
        else
        {
          if (v13 < 1) {
            goto LABEL_29;
          }
          int64_t v12 = v13 - 1;
        }
LABEL_28:
        self->_int64_t selectedVariant = v12;
LABEL_29:
        int64_t v23 = self->_currentVariantRow;
        double v24 = NSNumber;
        goto LABEL_30;
      case 'Q':
        int64_t v14 = [(UIKBTree *)self->_selectedPopupKey popupDirection];
        unint64_t v15 = self->_currentVariantRow;
        if (v15 >= [v7 count]
          || self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL
          && [(UIKBTree *)self->_selectedPopupKey popupDirection] != 2)
        {
          goto LABEL_50;
        }
        int64_t v16 = [(UIKBTree *)self->_selectedPopupKey popupDirection];
        int64_t v17 = self->_currentVariantRow;
        if (v16 == 2 && !v17)
        {
          if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
          {
            int64_t v17 = -1;
            self->_unint64_t currentVariantRow = -1;
          }
          else
          {
            int64_t v17 = 0;
          }
        }
        if (v17 == [v7 count] - 1) {
          [v7 addObject:&unk_1ED3F5220];
        }
        ++self->_currentVariantRow;
        uint64_t v31 = objc_msgSend(v7, "objectAtIndex:");
        self->_int64_t selectedVariant = [v31 integerValue];

        if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_int64_t selectedVariant = 0;
          int64_t v32 = self->_currentVariantRow;
          double v33 = [NSNumber numberWithInteger:0];
          [v7 replaceObjectAtIndex:v32 withObject:v33];
        }
        [(UIKBTree *)self->_selectedPopupKey setSelectedVariantIndices:v7];
        id v34 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
        [v34 updateState:16 forKey:self->_selectedPopupKey];

        if (v14 == 1)
        {
          unint64_t v35 = [v7 count];
          uint64_t v36 = [(UIKBTree *)self->_selectedPopupKey selectedVariantIndices];
          unint64_t v37 = [v36 count];

          if (v35 > v37) {
            goto LABEL_50;
          }
        }
        goto LABEL_52;
      case 'R':
        int64_t v18 = [(UIKBTree *)self->_selectedPopupKey popupDirection];
        int64_t v19 = self->_currentVariantRow;
        if (v18 == 2 && v19 == 0)
        {
LABEL_50:
          CGFloat v38 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
          [v38 updateState:2 forKey:self->_selectedPopupKey];

          self->_showingVariants = 0;
          selectedPopupKedouble y = self->_selectedPopupKey;
          self->_selectedPopupKedouble y = 0;

          int v26 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
          [(UIKeyboardEmojiCollectionInputView *)self updateHighlightForIndexPath:v26 scrollIfNeeded:0 animateScroll:0];
          goto LABEL_51;
        }
        BOOL v21 = v19 < 1;
        int64_t v22 = v19 - 1;
        if (!v21)
        {
          self->_unint64_t currentVariantRow = v22;
          goto LABEL_56;
        }
        if ([(UIKBTree *)self->_selectedPopupKey popupDirection] != 1) {
          goto LABEL_56;
        }
        int64_t v42 = [(UIKBTree *)self->_selectedPopupKey selectedVariantIndex];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id obj = [(UIKBTree *)self->_selectedPopupKey selectedVariantIndices];
        uint64_t v27 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (!v27) {
          goto LABEL_41;
        }
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v45;
        break;
      default:
        goto LABEL_31;
    }
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(obj);
        }
        if ([*(id *)(*((void *)&v44 + 1) + 8 * i) integerValue] == 0x7FFFFFFFFFFFFFFFLL)
        {

          goto LABEL_55;
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v28) {
        continue;
      }
      break;
    }
LABEL_41:

    if (v42)
    {
      self->_unint64_t currentVariantRow = [v7 count];
      [v7 addObject:&unk_1ED3F5220];
      goto LABEL_56;
    }
LABEL_55:
    self->_unint64_t currentVariantRow = 0;
LABEL_56:
    double v41 = [v7 objectAtIndex:self->_currentVariantRow];
    self->_int64_t selectedVariant = [v41 integerValue];

    if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_int64_t selectedVariant = 0;
      int64_t v23 = self->_currentVariantRow;
      double v24 = NSNumber;
LABEL_30:
      unint64_t v25 = objc_msgSend(v24, "numberWithInteger:");
      [v7 replaceObjectAtIndex:v23 withObject:v25];
    }
LABEL_31:
    [(UIKBTree *)self->_selectedPopupKey setSelectedVariantIndices:v7];
    int v26 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
    [v26 updateState:16 forKey:self->_selectedPopupKey];
LABEL_51:

LABEL_52:
  }

  return v5;
}

- (BOOL)_handleInitialSelectionEvent:(id)a3
{
  id v4 = a3;
  int v5 = [(UIKeyboardEmojiCollectionInputView *)self emojiSearchField];
  uint64_t v6 = [v5 text];

  if ([v4 unmodifiedKeyCodeEquals:44] && !objc_msgSend(v6, "length")
    || [v4 unmodifiedKeyCodeEquals:40]
    && [v6 length]
    && ([(UIKeyboardEmojiCollectionInputView *)self searchResults],
        int v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    int64_t v9 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
    int v10 = [v9 sortedArrayUsingSelector:sel_compare_];

    uint64_t v11 = [v10 firstObject];
    if (!v11)
    {
      BOOL v14 = 0;
      goto LABEL_15;
    }
    int64_t v12 = (void *)v11;
    if ([(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia]
      && ![v12 section]
      && ![v12 item])
    {
      uint64_t v13 = [MEMORY[0x1E4F28D58] indexPathForItem:1 inSection:0];

      int64_t v12 = (void *)v13;
    }
    [(UIKeyboardEmojiCollectionInputView *)self updateHighlightForIndexPath:v12 scrollIfNeeded:0 animateScroll:0];
  }
  else
  {
    if (![v4 unmodifiedKeyCodeEquals:40])
    {
      BOOL v14 = 0;
      goto LABEL_17;
    }
    [(UIKeyboardEmojiCollectionInputView *)self setIsSearching:0];
    int v10 = +[UIKeyboardImpl activeInstance];
    [v10 dismissEmojiPopoverIfNecessaryWithCompletion:&__block_literal_global_344];
  }
  BOOL v14 = 1;
LABEL_15:

LABEL_17:
  return v14;
}

void __67__UIKeyboardEmojiCollectionInputView__handleInitialSelectionEvent___block_invoke()
{
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 clearForwardingInputDelegateAndResign:0];
}

- (BOOL)_handleVariantSelectionEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 unmodifiedKeyCodeEquals:44];
  int v6 = [v4 unmodifiedKeyCodeEquals:40];

  char v7 = v5 | v6;
  if ((v5 | v6) == 1)
  {
    collectionView = self->_collectionView;
    int64_t v9 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
    int v10 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v9];

    uint64_t v11 = [(UIKeyboardEmojiCollectionInputView *)self selectedChildSkinToneEmoji:self->_selectedPopupKey];
    int64_t v12 = [(UIKBTree *)self->_selectedPopupKey selectedVariantIndices];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      BOOL v14 = [(UIKBTree *)self->_selectedPopupKey selectedVariantIndices];
      unint64_t v15 = [v14 lastObject];
      uint64_t v16 = [v15 integerValue];

      if (!v16)
      {
        [(UIKBTree *)self->_selectedPopupKey setSelectedVariantIndex:0];
        uint64_t v17 = [(UIKeyboardEmojiCollectionInputView *)self selectedChildSkinToneEmoji:self->_selectedPopupKey];

        uint64_t v11 = (void *)v17;
      }
    }
    [(UIKBTree *)self->_selectedPopupKey setObject:v11 forProperty:@"UIKBAssociatedEmoji"];
    [v10 setEmoji:v11];
    int64_t v18 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
    [v18 updateState:2 forKey:self->_selectedPopupKey];

    [(UIKeyboardEmojiCollectionInputView *)self didInputSubTree:self->_selectedPopupKey];
    if (v5)
    {
      int64_t v19 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
      [(UIKeyboardEmojiCollectionInputView *)self updateHighlightForIndexPath:v19 scrollIfNeeded:0 animateScroll:0];
    }
    else if (!v6)
    {
LABEL_9:

      return v7;
    }
    [(UIKeyboardEmojiCollectionInputView *)self insertSelectedEmoji:v11 shouldDismissPopover:v5 ^ 1u];
    goto LABEL_9;
  }
  return v7;
}

- (BOOL)_handleBaseKeySelectionEvent:(id)a3
{
  id v4 = a3;
  collectionView = self->_collectionView;
  int v6 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
  char v7 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 emoji];
    int64_t v9 = [(UIKeyboardEmojiCollectionInputView *)self treeForCell:v7];
    int v10 = [v4 unmodifiedKeyCodeEquals:44];
    int v11 = [v4 equalsKeyCode:44 modifiers:0x80000];
    int v12 = [v4 unmodifiedKeyCodeEquals:40];
    int v13 = [v4 equalsKeyCode:40 modifiers:0x80000];
    if ([(UIKeyboardEmojiCollectionInputView *)self keySupportsVariants:v9])
    {
      BOOL v14 = v8;
      unint64_t v15 = [(UIKBKeyView *)self factory];
      if ([v15 popupKeyUsesCustomKeyContentView:v9])
      {
        if ([v9 selectedVariantIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {

LABEL_12:
          self->_unint64_t currentVariantRow = 0;
          int64_t v18 = [v9 selectedVariantIndices];
          int64_t v19 = v18;
          uint64_t v8 = v14;
          if (v18)
          {
            int64_t v20 = [v18 firstObject];
            uint64_t v21 = [v20 integerValue];

            if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
              int64_t v22 = 0;
            }
            else {
              int64_t v22 = v21;
            }
            self->_int64_t selectedVariant = v22;
          }
          [v7 setSelected:0];
          objc_storeStrong((id *)&self->_selectedPopupKey, v9);
          BOOL v17 = 1;
          self->_showingVariants = 1;
          int64_t v23 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
          [v23 updateState:16 forKey:v9];

          goto LABEL_29;
        }
        char v30 = [v4 modifiersEqual:0x80000];

        if (v30) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      uint64_t v24 = [v9 selectedVariantIndex];
      int v25 = v10 | v12;
      if (v24 != 0x7FFFFFFFFFFFFFFFLL) {
        int v25 = 0;
      }
      uint64_t v8 = v14;
      if ((v25 | v11 | v13) == 1)
      {
        [v7 setSelected:0];
        if ([v9 selectedVariantIndex] != 0x7FFFFFFFFFFFFFFFLL) {
          self->_int64_t selectedVariant = [v9 selectedVariantIndex];
        }
        objc_storeStrong((id *)&self->_selectedPopupKey, v9);
        BOOL v17 = 1;
        self->_showingVariants = 1;
        int v26 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
        [v26 updateState:16 forKey:v9];

        goto LABEL_29;
      }
    }
    if (v10)
    {
      uint64_t v27 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
      [(UIKeyboardEmojiCollectionInputView *)self updateHighlightForIndexPath:v27 scrollIfNeeded:0 animateScroll:0];

      [(UIKeyboardEmojiCollectionInputView *)self insertSelectedEmoji:v8 shouldDismissPopover:0];
      BOOL v17 = 1;
    }
    else if (v12)
    {
      BOOL v17 = 1;
      [(UIKeyboardEmojiCollectionInputView *)self insertSelectedEmoji:v8 shouldDismissPopover:1];
    }
    else
    {
      BOOL v17 = 0;
    }
LABEL_29:

    goto LABEL_30;
  }
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v29 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int64_t v32 = 0;
      _os_log_fault_impl(&dword_1853B0000, v29, OS_LOG_TYPE_FAULT, "Memoji cell is selected. Unsupported.", v32, 2u);
    }
  }
  else
  {
    uint64_t v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_handleBaseKeySelectionEvent____s_category) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Memoji cell is selected. Unsupported.", buf, 2u);
    }
  }
  BOOL v17 = 1;
LABEL_30:

  return v17;
}

- (BOOL)handleSelectionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 modifierFlags] && !objc_msgSend(v4, "modifiersEqual:", 0x80000))
  {
    BOOL v7 = 0;
  }
  else
  {
    int v5 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];

    if (v5)
    {
      if (self->_showingVariants) {
        BOOL v6 = [(UIKeyboardEmojiCollectionInputView *)self _handleVariantSelectionEvent:v4];
      }
      else {
        BOOL v6 = [(UIKeyboardEmojiCollectionInputView *)self _handleBaseKeySelectionEvent:v4];
      }
    }
    else
    {
      BOOL v6 = [(UIKeyboardEmojiCollectionInputView *)self _handleInitialSelectionEvent:v4];
    }
    BOOL v7 = v6;
  }

  return v7;
}

- (void)updateHighlightForIndexPath:(id)a3 scrollIfNeeded:(BOOL)a4 animateScroll:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v19 = a3;
  uint64_t v8 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
  uint64_t v9 = [v8 section];
  uint64_t v10 = [v19 section];

  if (v9 != v10)
  {
    int64_t v11 = -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", [v19 section]);
    int v12 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
    [v12 reloadForCategory:v11 withSender:self];

    int v13 = +[UIKeyboardEmojiCategory categoryForType:v11];
    [(UIKeyboardEmojiCollectionInputView *)self setCategory:v13];
  }
  [(UIKeyboardEmojiCollectionInputView *)self setSelectedIndexPath:v19];
  collectionView = self->_collectionView;
  unint64_t v15 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
  [(UICollectionView *)collectionView selectItemAtIndexPath:v15 animated:0 scrollPosition:0];

  if ([(UIKeyboardEmojiCollectionInputView *)self cellShouldScrollWhenSelectedAtIndexPath:v19]&& v6)
  {
    uint64_t v16 = self->_collectionView;
    BOOL v17 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
    if ([(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection]) {
      uint64_t v18 = 16;
    }
    else {
      uint64_t v18 = 2;
    }
    [(UICollectionView *)v16 scrollToItemAtIndexPath:v17 atScrollPosition:v18 animated:v5];
  }
  [(UIKeyboardEmojiCollectionInputView *)self updateLastSeenItemForIndexPath:v19];
}

- (void)insertSelectedEmoji:(id)a3 shouldDismissPopover:(BOOL)a4
{
  BOOL v4 = a4;
  id v20 = a3;
  [(UIKeyboardEmojiCollectionInputView *)self updatePreferencesForSelectedEmoji:v20];
  BOOL v6 = [(UIKeyboardEmojiCollectionInputView *)self emojiSearchInputViewController];
  BOOL v7 = [v6 textDocumentProxy];
  uint64_t v8 = [v20 emojiString];
  [v7 insertText:v8];

  uint64_t v9 = [(UIKeyboardEmojiCollectionInputView *)self emojiSearchField];
  uint64_t v10 = [v9 text];

  if ([v10 length]
    && ([(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath],
        int64_t v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 section],
        v11,
        !v12))
  {
    BOOL v14 = +[UIKeyboardImpl activeInstance];
    uint64_t v16 = [v20 emojiString];
    BOOL v17 = UIKBAnalyticsEmojiSelectionMethodReturnKey;
    if (!v4) {
      BOOL v17 = UIKBAnalyticsEmojiSelectionMethodSpaceBar;
    }
    [v14 emojiSearchWillInsertEmoji:v16 forSearchQuery:v10 selectionMethod:*v17 inputType:@"PopoverSearch"];
  }
  else
  {
    int v13 = +[UIKeyboardImpl activeInstance];
    BOOL v14 = v13;
    unint64_t v15 = UIKBAnalyticsEmojiSelectionMethodReturnKey;
    if (!v4) {
      unint64_t v15 = UIKBAnalyticsEmojiSelectionMethodSpaceBar;
    }
    [v13 insertedEmojiFromPopover:v20 selectionMethod:*v15];
  }

  if (v4)
  {
    [(UIKeyboardEmojiCollectionInputView *)self resetSelectionIfNeeded];
    uint64_t v18 = +[UIKeyboardImpl activeInstance];
    [v18 dismissEmojiPopoverIfNecessaryWithCompletion:&__block_literal_global_173_2];
  }
  selectedPopupKedouble y = self->_selectedPopupKey;
  self->_selectedPopupKedouble y = 0;

  self->_showingVariants = 0;
}

void __79__UIKeyboardEmojiCollectionInputView_insertSelectedEmoji_shouldDismissPopover___block_invoke()
{
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 clearForwardingInputDelegateAndResign:0];
}

- (int64_t)keyCodeForCurrentEnvironmentFromKeyCode:(int64_t)a3
{
  UIUserInterfaceLayoutDirection v4 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
  int64_t v5 = 80;
  int64_t v6 = 79;
  if (a3 != 80) {
    int64_t v6 = a3;
  }
  if (a3 != 79) {
    int64_t v5 = v6;
  }
  if (v4 == UIUserInterfaceLayoutDirectionRightToLeft) {
    return v5;
  }
  else {
    return a3;
  }
}

- (void)updatePreferencesForSelectedEmoji:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[UIKeyboardInputModeController sharedInputModeController];
  int64_t v6 = [v5 lastUsedInputModeForCurrentContext];
  BOOL v7 = [v6 primaryLanguage];
  uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  if (v8) {
    uint64_t v9 = (__CFString *)v8;
  }
  else {
    uint64_t v9 = @"en_US";
  }
  int v13 = v9;
  uint64_t v10 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  [v10 emojiUsed:v4 language:v13];

  int64_t v11 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];

  if (v11)
  {
    uint64_t v12 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
    [(UIKeyboardEmojiCollectionInputView *)self updateLastSeenItemForIndexPath:v12];
  }
}

- (void)updateLastSeenItemForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", [v4 section]));
  [(UIKeyboardEmojiCollectionInputView *)self setCategory:v5];

  uint64_t v6 = [v4 item];
  BOOL v7 = [(UIKeyboardEmojiCollectionInputView *)self category];
  [v7 setLastVisibleFirstEmojiIndex:v6];

  id v9 = [(UIKeyboardEmojiCollectionInputView *)self category];
  uint64_t v8 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  [v8 setLastViewedCategory:v9];
}

- (void)resetSelectionIfNeeded
{
  char v3 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];

  if (v3)
  {
    collectionView = self->_collectionView;
    int64_t v5 = [(UIKeyboardEmojiCollectionInputView *)self selectedIndexPath];
    [(UICollectionView *)collectionView deselectItemAtIndexPath:v5 animated:0];

    selectedIndexPath = self->_selectedIndexPath;
    self->_selectedIndexPath = 0;

    selectedPopupKedouble y = self->_selectedPopupKey;
    self->_selectedPopupKedouble y = 0;

    self->_showingVariants = 0;
  }
}

- (BOOL)keySupportsVariants:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 variantType] == 10
    || [v3 variantType] == 12
    || [v3 variantType] == 11
    || [v3 variantType] == 13;

  return v4;
}

- (BOOL)cellShouldScrollWhenSelectedAtIndexPath:(id)a3
{
  collectionView = self->_collectionView;
  id v5 = a3;
  [(UIView *)collectionView bounds];
  CGRect v22 = CGRectInset(v21, 10.0, 0.0);
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  uint64_t v10 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v5];

  int64_t v11 = self->_collectionView;
  [v10 bounds];
  -[UIView convertRect:fromView:](v11, "convertRect:fromView:", v10);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  v25.origin.CGFloat x = v13;
  v25.origin.CGFloat y = v15;
  v25.size.CGFloat width = v17;
  v25.size.CGFloat height = v19;
  CGRect v26 = CGRectIntersection(v23, v25);
  v24.origin.CGFloat x = v13;
  v24.origin.CGFloat y = v15;
  v24.size.CGFloat width = v17;
  v24.size.CGFloat height = v19;
  LOBYTE(v11) = !CGRectEqualToRect(v24, v26);

  return (char)v11;
}

- (void)emojiSearchTextFieldWillBecomeActive:(id)a3
{
  BOOL v4 = [(UIKeyboardEmojiCollectionInputView *)self emojiSearchField];
  id v5 = [(UIKBKeyView *)self renderConfig];
  [v4 _setRenderConfig:v5];

  collectionView = self->_collectionView;
  [(UIKeyboardEmojiCollectionView *)collectionView setIsInSearchPopover:1];
}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  [v4 changePreferredEmojiSearchInputModeForInputDelegate:v3];
}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  [(UIKeyboardEmojiCollectionInputView *)self setIsSearching:0];
  [(UIKeyboardEmojiCollectionView *)self->_collectionView setIsInSearchPopover:0];
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 clearForwardingInputDelegateAndResign:0];
}

- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 updateAssistantView];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"UIKeyboardSwitchedAwayFromEmoji" object:0];

  id v7 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v6 = [v5 hardwareInputMode];
  [v7 setCurrentInputMode:v6];
}

- (void)emojiSearchTextFieldWillClear:(id)a3
{
  [(UIKeyboardEmojiCollectionInputView *)self setIsSearching:0];
  [(UIKeyboardEmojiCollectionInputView *)self setSearchResults:MEMORY[0x1E4F1CBF0]];
  [(UIKeyboardEmojiCollectionInputView *)self resetSelectionIfNeeded];
}

- (void)emojiSearchTextFieldDidReset:(id)a3
{
  BOOL v4 = [(UIKeyboardEmojiCollectionInputView *)self isSearching];
  [(UIKeyboardEmojiCollectionInputView *)self setIsSearching:0];
  [(UIKeyboardEmojiCollectionInputView *)self resetSelectionIfNeeded];
  if (v4)
  {
    [(UIKeyboardEmojiCollectionInputView *)self setSearchResults:MEMORY[0x1E4F1CBF0]];
    if (![(UIKeyboardEmojiCollectionInputView *)self showingRecents])
    {
      collectionView = self->_collectionView;
      v6[4] = self;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke;
      v7[3] = &unk_1E52D9F70;
      v7[4] = self;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_2;
      v6[3] = &unk_1E52DC3A0;
      [(UICollectionView *)collectionView performBatchUpdates:v7 completion:v6];
    }
  }
}

void __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 600);
  id v2 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v1 deleteSections:v2];
}

uint64_t __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_3;
  v2[3] = &unk_1E52D9F70;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v2];
}

uint64_t __67__UIKeyboardEmojiCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 600) reloadData];
}

- (void)emojiSearchDidReceiveResults:(id)a3 forExactQuery:(id)a4 autocorrectedQuery:(id)a5
{
  id v7 = a3;
  if ([a4 length])
  {
    uint64_t v8 = [(UIKeyboardEmojiCollectionInputView *)self emojiSearchField];
    id v9 = [v8 text];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      if ([(UIKeyboardEmojiCollectionInputView *)self isSearching])
      {
        int v11 = 0;
      }
      else
      {
        int v11 = ![(UIKeyboardEmojiCollectionInputView *)self showingRecents];
        [(UIKeyboardEmojiCollectionInputView *)self setIsSearching:1];
        [(UIKeyboardEmojiCollectionInputView *)self updateOffsetForSearchResults];
      }
      [(UIKeyboardEmojiCollectionInputView *)self resetSelectionIfNeeded];
      CGFloat v15 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
      uint64_t v16 = [v15 count];
      uint64_t v17 = [v7 count];

      if (v16 == v17)
      {
        if ([v7 count])
        {
          double v18 = [v7 firstObject];
          CGFloat v19 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
          id v20 = [v19 firstObject];
          int v21 = [v18 isEqual:v20] ^ 1;
        }
        else
        {
          int v21 = 0;
        }
      }
      else
      {
        int v21 = 1;
      }
      CGRect v22 = (void *)[v7 copy];
      [(UIKeyboardEmojiCollectionInputView *)self setSearchResults:v22];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke;
      aBlock[3] = &unk_1E52D9F70;
      aBlock[4] = self;
      CGRect v23 = _Block_copy(aBlock);
      double v14 = v23;
      if (v11)
      {
        collectionView = self->_collectionView;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_2;
        v31[3] = &unk_1E52DA160;
        v31[4] = self;
        id v32 = v23;
        [(UICollectionView *)collectionView performBatchUpdates:v31 completion:0];
        CGRect v25 = v32;
      }
      else if (v21 && [(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection])
      {
        CGRect v26 = self->_collectionView;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_3;
        v29[3] = &unk_1E52DA040;
        id v30 = v14;
        [(UICollectionView *)v26 performBatchUpdates:v29 completion:0];
        CGRect v25 = v30;
      }
      else
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_4;
        v27[3] = &unk_1E52DA040;
        id v28 = v14;
        +[UIView performWithoutAnimation:v27];
        CGRect v25 = v28;
      }

      goto LABEL_20;
    }
  }
  [(UIKeyboardEmojiCollectionInputView *)self setIsSearching:0];
  [(UIKeyboardEmojiCollectionInputView *)self resetSelectionIfNeeded];
  [(UIKeyboardEmojiCollectionInputView *)self setSearchResults:MEMORY[0x1E4F1CBF0]];
  if ([(UIKeyboardEmojiCollectionInputView *)self showingRecents])
  {
    double v12 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
    objc_msgSend(v12, "reloadForCategory:withSender:", -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", 0), self);

    CGFloat v13 = self->_collectionView;
    double v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [(UICollectionView *)v13 reloadSections:v14];
LABEL_20:
  }
}

void __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateOffsetForSearchResults];
  id v2 = [*(id *)(a1 + 32) emojiKeyManager];
  [v2 reloadForCategory:0 withSender:*(void *)(a1 + 32)];

  id v3 = *(void **)(*(void *)(a1 + 32) + 600);
  id v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v3 reloadSections:v4];
}

uint64_t __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 600);
  id v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v2 insertSections:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

uint64_t __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__UIKeyboardEmojiCollectionInputView_emojiSearchDidReceiveResults_forExactQuery_autocorrectedQuery___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(UIKeyboardEmojiCollectionInputView *)self isSearching])
  {
    id v9 = [(UIKeyboardEmojiCollectionInputView *)self searchResults];
    if ([v9 count])
    {
    }
    else
    {
      uint64_t v10 = [v8 section];

      if (!v10)
      {
        [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits emojiKeyWidth];
        double v18 = v17;
        [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumInteritemSpacing];
        double v20 = (v18 + v19 + 1.0) * 6.0;
        [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
        double v12 = v20 + v21 + v21;
        [v7 bounds];
        double Height = CGRectGetHeight(v36);
        [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categoryHeaderHeight];
        double v24 = Height - v23;
        [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits bottomPadding];
        double v14 = v24 - v25;
        goto LABEL_9;
      }
    }
  }
  if (![(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia]
    || [v8 section]
    || [v8 item])
  {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits emojiKeyWidth];
    double v12 = v11;
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits emojiKeyWidth];
    double v14 = v13;
  }
  else
  {
    [v7 bounds];
    double v26 = CGRectGetHeight(v37);
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categoryHeaderHeight];
    double v28 = v27;
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits bottomPadding];
    double v30 = v29;
    if ([(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection])
    {
      double v14 = v26 - v28 - v30;
      if (self->_useWideAnimojiCell) {
        double v12 = v14 + v14;
      }
      else {
        double v12 = v14;
      }
    }
    else
    {
      [v7 bounds];
      double Width = CGRectGetWidth(v38);
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewLeftMostPadding];
      double v33 = Width - v32;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewRightMostPadding];
      double v12 = v33 - v34;
      [v7 bounds];
      double v14 = CGRectGetWidth(v39) * 0.166666667;
    }
  }
LABEL_9:

  double v15 = v12;
  double v16 = v14;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  NSInteger v7 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0, a4);
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits sectionOffset];
  double v9 = v8;
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits bottomPadding];
  double v11 = v10;
  UICollectionViewScrollDirection v12 = [(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection];
  if (a5) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v7 <= 0;
  }
  char v14 = !v13;
  if (v12 == UICollectionViewScrollDirectionVertical)
  {
    if ((v14 & 1) != 0 || a5 == 1 && !v7)
    {
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits topPadding];
      double v18 = v21;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewLeftMostPadding];
      double v20 = v22;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewRightMostPadding];
      double v11 = v9;
    }
    else
    {
      NSInteger v28 = [(UICollectionView *)self->_collectionView numberOfSections] - 1;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits topPadding];
      double v18 = v29;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewLeftMostPadding];
      double v20 = v30;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewRightMostPadding];
      if (v28 != a5) {
        double v11 = v9;
      }
    }
    goto LABEL_20;
  }
  if ((v14 & 1) == 0 && (a5 != 1 || v7))
  {
    NSInteger v24 = [(UICollectionView *)self->_collectionView numberOfSections] - 1;
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits topPadding];
    double v26 = v25;
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categoryHeaderHeight];
    double v18 = v26 + v27;
    double v20 = 0.0;
    if (v24 != a5) {
      goto LABEL_21;
    }
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewRightMostPadding];
LABEL_20:
    double v9 = v23;
    goto LABEL_21;
  }
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits topPadding];
  double v16 = v15;
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categoryHeaderHeight];
  double v18 = v16 + v17;
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewLeftMostPadding];
  double v20 = v19;
LABEL_21:
  double v31 = v18;
  double v32 = v20;
  double v33 = v11;
  double v34 = v9;
  result.right = v34;
  result.bottom = v33;
  result.left = v32;
  result.top = v31;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 || ![(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia]) {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
  }
  else {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumInteritemSpacing];
  }
  double v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 || ![(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia]) {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumInteritemSpacing];
  }
  else {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
  }
  double v11 = v10;

  return v11;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a5;
  if (!self->_hasShownAnimojiCell)
  {
    double v10 = v6;
    BOOL v7 = [(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia];
    id v6 = v10;
    if (v7)
    {
      uint64_t v8 = [v10 item];
      id v6 = v10;
      if (!v8)
      {
        uint64_t v9 = [v10 section];
        id v6 = v10;
        if (!v9)
        {
          self->_hasShownAnimojiCell = 1;
          ADClientAddValueForScalarKey();
          id v6 = v10;
        }
      }
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isDraggingInputView = 1;
  [(UIKeyboardEmojiCollectionInputView *)self resetSelectionIfNeeded];
}

- (void)scrollViewDidScroll:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_UIApplicationIsFirstPartyStickers())
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v15 = @"contentOffsetY";
    id v6 = NSNumber;
    [v4 contentOffset];
    uint64_t v8 = [v6 numberWithDouble:v7];
    v16[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [v5 postNotificationName:@"UIKeyboardEmojiCollectionInputViewDidScroll" object:0 userInfo:v9];
  }
  double v10 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
  [v10 deactivateActiveKey];

  double v11 = [(UIKeyboardEmojiCollectionInputView *)self firstFullyVisibleHeader];
  unint64_t v12 = [v11 section];
  if (self->_currentSection != v12)
  {
    unint64_t v13 = v12;
    self->_currentSection = v12;
    if (self->_isDraggingInputView)
    {
      char v14 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
      objc_msgSend(v14, "reloadForCategory:withSender:", -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v13), self);
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  self->_isDraggingInputView = 1;
  -[UIKeyboardEmojiCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 0, a5->x, a4.y);
  a5->CGFloat x = v6;
}

- (id)itemInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__129;
  double v16 = __Block_byref_object_dispose__129;
  id v17 = 0;
  double v7 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  uint64_t v8 = objc_msgSend(v7, "layoutAttributesForElementsInRect:", x, y, width, height);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__UIKeyboardEmojiCollectionInputView_itemInRect___block_invoke;
  v11[3] = &unk_1E52FBB40;
  v11[4] = &v12;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __49__UIKeyboardEmojiCollectionInputView_itemInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (![v9 representedElementCategory])
  {
    uint64_t v6 = [v9 indexPath];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (id)firstFullyVisibleHeader
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__129;
  double v11 = __Block_byref_object_dispose__129;
  id v12 = [MEMORY[0x1E4F28D58] indexPathWithIndex:self->_currentSection];
  id v3 = [(UICollectionView *)self->_collectionView indexPathsForVisibleSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__UIKeyboardEmojiCollectionInputView_firstFullyVisibleHeader__block_invoke;
  v6[3] = &unk_1E52FBB68;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__UIKeyboardEmojiCollectionInputView_firstFullyVisibleHeader__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 600), "supplementaryViewForElementKind:atIndexPath:", @"UICollectionElementKindSectionHeader");
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 608) scrollDirection];
  [v7 origin];
  double v10 = v9;
  double v12 = v11;
  [*(id *)(*(void *)(a1 + 32) + 600) contentOffset];
  if (v8) {
    double v15 = v10;
  }
  else {
    double v15 = v12;
  }
  if (!v8) {
    double v13 = v14;
  }
  if (v15 > v13)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  self->_isDraggingInputView = 0;
  id v5 = [(UIKeyboardEmojiCollectionInputView *)self firstFullyVisibleHeader];
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__129;
  double v18 = __Block_byref_object_dispose__129;
  id v19 = 0;
  uint64_t v6 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __67__UIKeyboardEmojiCollectionInputView_scrollViewDidEndDecelerating___block_invoke;
  double v11 = &unk_1E52FBB68;
  id v7 = v5;
  id v12 = v7;
  double v13 = &v14;
  [v6 enumerateObjectsUsingBlock:&v8];

  -[UIKeyboardEmojiCollectionInputView updateLastSeenItemForIndexPath:](self, "updateLastSeenItemForIndexPath:", v15[5], v8, v9, v10, v11);
  _Block_object_dispose(&v14, 8);
}

void __67__UIKeyboardEmojiCollectionInputView_scrollViewDidEndDecelerating___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v4 = [v10 section];
  BOOL v5 = v4 == [*(id *)(a1 + 32) section];
  uint64_t v6 = v10;
  if (v5)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(void *)(v7 + 40))
    {
      uint64_t v8 = [v10 item];
      BOOL v9 = v8 < [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) item];
      uint64_t v6 = v10;
      if (!v9) {
        goto LABEL_8;
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    objc_storeStrong((id *)(v7 + 40), a2);
    uint64_t v6 = v10;
  }
LABEL_8:
}

- (double)_recentlyUsedMediaRoundedOffset:(double)a3 recentlyUsedMediaCellWidth:(double)a4
{
  uint64_t v7 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
  [v7 inputViewLeftMostPadding];
  double v9 = v8;
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits columnOffset];
  double v11 = v10;

  unint64_t v12 = 3;
  if (self->_useWideAnimojiCell) {
    unint64_t v12 = 4;
  }
  double v13 = a4 / (double)v12;
  if (v13 > a3) {
    return a4 / (double)v12;
  }
  for (unint64_t i = 2; i != v12; ++i)
  {
    double result = v13 * (double)i;
    if (result > a3) {
      break;
    }
  }
  if (i >= v12) {
    return v11 - v9 + a4;
  }
  return result;
}

- (double)snappedXOffsetForOffset:(double)a3 scrubbing:(BOOL)a4
{
  [(UIScrollView *)self->_collectionView contentSize];
  -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:");
  double v8 = v7;
  [(UIView *)self->_collectionView bounds];
  -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:", v9, v10);
  double v12 = v8 - v11;
  [(UIKeyboardEmojiCollectionInputView *)self scrollingEndPoint];
  if (v12 - v13 < a3)
  {
    [(UIScrollView *)self->_collectionView contentSize];
    -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:");
    double v15 = v14;
    [(UIView *)self->_collectionView bounds];
    -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:", v16, v17);
    double v19 = v15 - v18;
    [(UIKeyboardEmojiCollectionInputView *)self scrollingEndPoint];
    return v19 + v20;
  }
  [(UIKeyboardEmojiCollectionInputView *)self scrollingStartPoint];
  if (v22 > a3)
  {
    [(UIKeyboardEmojiCollectionInputView *)self scrollingStartPoint];
    return -v23;
  }
  [(UIView *)self->_collectionView bounds];
  double Height = CGRectGetHeight(v54);
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categoryHeaderHeight];
  double v26 = Height - v25;
  if (self->_useWideAnimojiCell) {
    double v27 = v26 + v26;
  }
  else {
    double v27 = v26;
  }
  if (![(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia]
    || v27 <= a3
    || a4)
  {
    if ([(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection])
    {
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categoryHeaderHeight];
      double v30 = v29;
      double v31 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
      [v31 emojiKeyWidth];
      double v33 = v32;
      double v34 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
      [v34 columnOffset];
      double v36 = v33 + v35;
      [(UIView *)self->_collectionView bounds];
      double v38 = v37;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categoryHeaderHeight];
      double v40 = v38 - v39;
      double v41 = a3;
      a3 = v30;
    }
    else
    {
      [(UIView *)self->_collectionView bounds];
      double v36 = v42;
      double v31 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
      [v31 emojiKeyWidth];
      double v44 = v43;
      double v34 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
      [v34 columnOffset];
      double v40 = v44 + v45;
      double v41 = 0.0;
    }

    long long v46 = -[UIKeyboardEmojiCollectionInputView itemInRect:](self, "itemInRect:", v41, a3, v36, v40);
    long long v47 = [(UICollectionView *)self->_collectionView layoutAttributesForItemAtIndexPath:v46];
    [v47 frame];
    -[UIKeyboardEmojiCollectionInputView pointInScrollingDirection:](self, "pointInScrollingDirection:");
    double v49 = v48;
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits columnOffset];
    double v51 = v49 - v50;
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits scrollSnapOffset];
    double v21 = v51 + v52;

    return v21;
  }
  [(UIKeyboardEmojiCollectionInputView *)self _recentlyUsedMediaRoundedOffset:a3 recentlyUsedMediaCellWidth:v27];
  return result;
}

- (int64_t)indexForPrettyCategoryDisplay:(id)a3
{
  id v4 = a3;
  if (self->_collectionView
    && ([(UIKeyboardEmojiCollectionInputView *)self category],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 categoryType],
        v5,
        uint64_t v7 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", v6)), [v4 lastVisibleFirstEmojiIndex] >= v7))
  {
    int64_t v8 = v7 - 1;
  }
  else
  {
    int64_t v8 = [v4 lastVisibleFirstEmojiIndex];
  }

  return v8;
}

- (void)didMoveToWindow
{
  id v2 = self;
  v38.receiver = self;
  v38.super_class = (Class)UIKeyboardEmojiCollectionInputView;
  [(UIView *)&v38 didMoveToWindow];
  [(UIView *)v2->_collectionView layoutIfNeeded];
  id v3 = [(UIKeyboardEmojiKeyView *)v2 emojiKeyManager];
  id v4 = [v3 lastViewedCategory];
  objc_storeWeak((id *)&v2->_category, v4);

  BOOL v5 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  uint64_t v6 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_category);
  int64_t v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(WeakRetained, "categoryType"));
  char v9 = [v5 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    double v10 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
    double v11 = [v10 firstObject];
    uint64_t v12 = [v11 integerValue];

    double v13 = +[UIKeyboardEmojiCategory categoryForType:v12];
    objc_storeWeak((id *)&v2->_category, v13);
  }
  id v14 = objc_loadWeakRetained((id *)&v2->_category);
  v2->_currentSection = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", [v14 categoryType]);

  double v15 = [(UIView *)v2 window];

  if (v15)
  {
    if (v2->_inputDelegateCanSupportAnimoji
      && !v2->_hasShownAnimojiFirstTimeExperience
      && [(UIKeyboardEmojiCollectionInputView *)v2 _shouldShowRecentlyUsedMedia])
    {
      double v16 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    }
    else
    {
      double v17 = [(UIKeyboardEmojiCollectionInputView *)v2 category];
      unint64_t v18 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", [v17 categoryType]);

      double v19 = (void *)MEMORY[0x1E4F28D58];
      double v20 = [(UIKeyboardEmojiCollectionInputView *)v2 category];
      double v16 = objc_msgSend(v19, "indexPathForItem:inSection:", -[UIKeyboardEmojiCollectionInputView indexForPrettyCategoryDisplay:](v2, "indexForPrettyCategoryDisplay:", v20), v18);
    }
    double v21 = [(UICollectionView *)v2->_collectionView layoutAttributesForItemAtIndexPath:v16];
    [v21 frame];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    v39.origin.double x = v23;
    v39.origin.double y = v25;
    v39.size.double width = v27;
    v39.size.double height = v29;
    double MinX = CGRectGetMinX(v39);
    double v31 = [(UIKeyboardEmojiCollectionView *)v2->_collectionView emojiGraphicsTraits];
    [v31 inputViewLeftMostPadding];
    double v33 = MinX - v32;

    [(UIKeyboardEmojiCollectionInputView *)v2 snappedXOffsetForOffset:0 scrubbing:v33];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __53__UIKeyboardEmojiCollectionInputView_didMoveToWindow__block_invoke;
    v37[3] = &unk_1E52D9CD0;
    v37[4] = v2;
    v37[5] = v34;
    +[UIView performWithoutAnimation:v37];
  }
  double v35 = [(UIView *)v2 window];
  if (!v35) {
    id v2 = 0;
  }
  double v36 = +[UIKeyboardMediaController sharedKeyboardMediaController];
  [v36 setDelegate:v2];
}

uint64_t __53__UIKeyboardEmojiCollectionInputView_didMoveToWindow__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 600);
  double v3 = *(double *)(a1 + 40);
  [v2 contentOffset];
  double v5 = v4;
  [*(id *)(*(void *)(a1 + 32) + 600) bounds];
  double v7 = v6;
  [*(id *)(*(void *)(a1 + 32) + 600) bounds];
  return objc_msgSend(v2, "scrollRectToVisible:animated:", 0, v3, v5, v7);
}

- (void)updateToCategory:(int64_t)a3
{
  double v5 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
  [v5 deactivateActiveKey];

  [(UIKeyboardEmojiCollectionInputView *)self resetSelectionIfNeeded];
  double v6 = [(UIKeyboardEmojiCollectionInputView *)self category];
  uint64_t v7 = [v6 categoryType];

  if (v7 == a3)
  {
    if (!a3)
    {
      int64_t v8 = [(UIKeyboardEmojiCollectionInputView *)self category];
      if ([v8 lastVisibleFirstEmojiIndex] == 1)
      {
        int64_t isDraggingInputView = self->_isDraggingInputView;

LABEL_11:
        double v13 = [(UIKeyboardEmojiCollectionInputView *)self category];
        [v13 setLastVisibleFirstEmojiIndex:isDraggingInputView];

        uint64_t v12 = [(UIKeyboardEmojiCollectionInputView *)self category];
        goto LABEL_12;
      }
    }
    int64_t isDraggingInputView = 1;
    goto LABEL_11;
  }
  id v50 = +[UIKeyboardEmojiCategory categoryForType:a3];
  double v10 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  objc_msgSend(v50, "setLastVisibleFirstEmojiIndex:", objc_msgSend(v10, "lastVisibleFirstEmojiIndexforCategory:", v50));

  if (!a3 && ![v50 lastVisibleFirstEmojiIndex]) {
    [v50 setLastVisibleFirstEmojiIndex:1];
  }
  [(UIKeyboardEmojiCollectionInputView *)self setCategory:v50];
  double v11 = [(UIKeyboardEmojiCollectionInputView *)self category];
  int64_t isDraggingInputView = [(UIKeyboardEmojiCollectionInputView *)self indexForPrettyCategoryDisplay:v11];

  uint64_t v12 = v50;
LABEL_12:
  id v51 = v12;
  unint64_t v14 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", [v12 categoryType]);
  collectionView = self->_collectionView;
  double v16 = [MEMORY[0x1E4F28D58] indexPathForItem:isDraggingInputView inSection:v14];
  double v17 = [(UICollectionView *)collectionView layoutAttributesForItemAtIndexPath:v16];
  [v17 frame];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;

  UICollectionViewScrollDirection v26 = [(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection];
  uint64_t v27 = v19;
  uint64_t v28 = v21;
  uint64_t v29 = v23;
  uint64_t v30 = v25;
  if (v26)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v27);
    double v32 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
    [v32 inputViewLeftMostPadding];
    double v34 = MinX - v33;

    [(UIKeyboardEmojiCollectionInputView *)self snappedXOffsetForOffset:0 scrubbing:v34];
    double v36 = v35;
    [(UIScrollView *)self->_collectionView contentOffset];
    double v38 = v37;
  }
  else
  {
    double MinY = CGRectGetMinY(*(CGRect *)&v27);
    double v40 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
    [v40 categoryHeaderHeight];
    double v42 = MinY - v41;
    double v43 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
    [v43 sectionOffset];
    double v38 = v42 - v44;

    [(UIScrollView *)self->_collectionView contentOffset];
    double v36 = v45;
  }
  [(UIView *)self->_collectionView bounds];
  double v47 = v46;
  [(UIView *)self->_collectionView bounds];
  -[UIScrollView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", 0, v36, v38, v47);
  double v48 = [(UIKeyboardEmojiCollectionInputView *)self category];
  double v49 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  [v49 setLastViewedCategory:v48];
}

- (void)updateOffsetForSearchResults
{
  double v3 = [(UIKeyboardEmojiCollectionInputView *)self hitTestResponder];
  [v3 deactivateActiveKey];

  [(UIKeyboardEmojiCollectionInputView *)self resetSelectionIfNeeded];
  id v28 = +[UIKeyboardEmojiCategory categoryForType:[(UIKeyboardEmojiCollectionInputView *)self emojiCategoryTypeForSection:0]];
  [v28 setLastVisibleFirstEmojiIndex:1];
  [(UIKeyboardEmojiCollectionInputView *)self setCategory:v28];
  collectionView = self->_collectionView;
  double v5 = [MEMORY[0x1E4F28D58] indexPathForItem:1 inSection:0];
  double v6 = [(UICollectionView *)collectionView layoutAttributesForItemAtIndexPath:v5];
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v30.origin.double x = v8;
  v30.origin.double y = v10;
  v30.size.double width = v12;
  v30.size.double height = v14;
  double MinX = CGRectGetMinX(v30);
  double v16 = [(UIKeyboardEmojiCollectionView *)self->_collectionView emojiGraphicsTraits];
  [v16 inputViewLeftMostPadding];
  double v18 = MinX - v17;

  [(UIKeyboardEmojiCollectionInputView *)self snappedXOffsetForOffset:0 scrubbing:v18];
  double v20 = v19;
  uint64_t v21 = self->_collectionView;
  [(UIScrollView *)v21 contentOffset];
  double v23 = v22;
  [(UIView *)self->_collectionView bounds];
  double v25 = v24;
  [(UIView *)self->_collectionView bounds];
  -[UIScrollView scrollRectToVisible:animated:](v21, "scrollRectToVisible:animated:", 0, v20, v23, v25);
  UICollectionViewScrollDirection v26 = [(UIKeyboardEmojiCollectionInputView *)self category];
  uint64_t v27 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  [v27 setLastViewedCategory:v26];
}

- (double)pointInScrollingDirection:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection]) {
    return x;
  }
  else {
    return y;
  }
}

- (double)distanceInScrollingDirection:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection]) {
    return width;
  }
  else {
    return height;
  }
}

- (double)scrollingStartPoint
{
  if ([(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection] == UICollectionViewScrollDirectionVertical) {
    return 0.0;
  }
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  [(UIKeyboardEmojiGraphicsTraits *)emojiGraphicsTraits inputViewLeftMostPadding];
  return result;
}

- (double)scrollingEndPoint
{
  UICollectionViewScrollDirection v3 = [(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection];
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (v3)
  {
    [(UIKeyboardEmojiGraphicsTraits *)emojiGraphicsTraits inputViewRightMostPadding];
  }
  else
  {
    [(UIKeyboardEmojiGraphicsTraits *)emojiGraphicsTraits bottomPadding];
  }
  return result;
}

- (int64_t)updateToCategoryWithOffsetPercentage:(double)a3
{
  UICollectionViewScrollDirection v5 = [(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection];
  [(UIView *)self->_collectionView bounds];
  double Height = CGRectGetHeight(v34);
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits categoryHeaderHeight];
  double v8 = v7;
  double v9 = 0.0;
  double v10 = 0.0;
  if ([(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia])
  {
    if (self->_useWideAnimojiCell) {
      double v10 = Height - v8 + Height - v8;
    }
    else {
      double v10 = Height - v8;
    }
  }
  if ([(UIKeyboardEmojiCollectionInputView *)self _shouldShowRecentlyUsedMedia])
  {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits sectionOffset];
    double v9 = v10 + v11 - self->_frameInset;
  }
  [(UIScrollView *)self->_collectionView contentSize];
  -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:");
  double v13 = v12 - v9;
  [(UIView *)self->_collectionView bounds];
  -[UIKeyboardEmojiCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:", v14, v15);
  double v17 = v16 * 0.5 * round(ceil(v13 / (v16 * 0.5)) * a3);
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits emojiKeyWidth];
  double v19 = v18;
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits columnOffset];
  [(UIKeyboardEmojiCollectionInputView *)self snappedXOffsetForOffset:1 scrubbing:(v19 + v20 + v20) * round(v17 / (v19 + v20 + v20))];
  double v22 = v9 + v21;
  [(UIScrollView *)self->_collectionView contentOffset];
  if (v5) {
    double v25 = v22;
  }
  else {
    double v25 = v23;
  }
  if (v5) {
    double v22 = v24;
  }
  collectionView = self->_collectionView;
  [(UIView *)collectionView bounds];
  double v28 = v27;
  [(UIView *)self->_collectionView bounds];
  -[UIScrollView scrollRectToVisible:animated:](collectionView, "scrollRectToVisible:animated:", 0, v25, v22, v28);
  uint64_t v29 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
  CGRect v30 = [v29 sortedArrayUsingSelector:sel_compare_];

  if ([v30 count])
  {
    double v31 = [v30 objectAtIndex:0];
    int64_t v32 = -[UIKeyboardEmojiCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", [v31 section]);
  }
  else
  {
    int64_t v32 = 0;
  }

  return v32;
}

- (UIKeyboardEmojiCategory)category
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_category);
  return (UIKeyboardEmojiCategory *)WeakRetained;
}

- (void)setCategory:(id)a3
{
}

- (BOOL)isDraggingInputView
{
  return self->_isDraggingInputView;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (UIKBEmojiHitTestResponder)hitTestResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestResponder);
  return (UIKBEmojiHitTestResponder *)WeakRetained;
}

- (NSIndexPath)tappedSkinToneEmoji
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tappedSkinToneEmoji);
  return (NSIndexPath *)WeakRetained;
}

- (void)setTappedSkinToneEmoji:(id)a3
{
}

- (TUIEmojiSearchInputViewController)emojiSearchInputViewController
{
  return self->_emojiSearchInputViewController;
}

- (void)setEmojiSearchInputViewController:(id)a3
{
}

- (TUIEmojiSearchTextField)emojiSearchField
{
  return self->_emojiSearchField;
}

- (void)setEmojiSearchField:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (void)setIsSearching:(BOOL)a3
{
  self->_isSearching = a3;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_emojiSearchField, 0);
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, 0);
  objc_destroyWeak((id *)&self->_tappedSkinToneEmoji);
  objc_destroyWeak((id *)&self->_hitTestResponder);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_category);
  objc_storeStrong((id *)&self->_selectedPopupKey, 0);
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end