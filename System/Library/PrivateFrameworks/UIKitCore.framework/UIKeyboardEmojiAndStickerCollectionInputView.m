@interface UIKeyboardEmojiAndStickerCollectionInputView
+ (BOOL)shouldHighlightEmoji:(id)a3;
+ (BOOL)wantsScreenTraits;
- (BOOL)_handleBaseKeySelectionEvent:(id)a3;
- (BOOL)_handleInitialSelectionEvent:(id)a3;
- (BOOL)_handleVariantSelectionEvent:(id)a3;
- (BOOL)_shouldShowRecentlyUsedMedia;
- (BOOL)_userHasSelectedSkinToneEmoji;
- (BOOL)baseStringIsCoupleEmoji:(id)a3;
- (BOOL)cellShouldScrollWhenSelectedAtIndexPath:(id)a3;
- (BOOL)datasourceIsReady;
- (BOOL)doesShowMemoji;
- (BOOL)doesShowStickers;
- (BOOL)doesSupportImageGlyph;
- (BOOL)genderEmojiBaseStringNeedVariantSelector:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)handleKeyEvent:(id)a3;
- (BOOL)handleKeyInputForCollectionViewNavigation:(id)a3;
- (BOOL)handleKeyInputForFamilySelector:(id)a3;
- (BOOL)handleKeyInputForVariantSelector:(id)a3;
- (BOOL)handleSelectionEvent:(id)a3;
- (BOOL)hasVerticalScrolling;
- (BOOL)isCellMostlyOffscreen:(CGRect)a3;
- (BOOL)isDraggingInputView;
- (BOOL)isEmojiCategory:(int64_t)a3;
- (BOOL)isMemojiCategory:(int64_t)a3;
- (BOOL)isRearrangingAllowed;
- (BOOL)isRecentCategory:(int64_t)a3;
- (BOOL)isSearchCategory:(int64_t)a3;
- (BOOL)isSearching;
- (BOOL)isStickersCategory:(int64_t)a3;
- (BOOL)keySupportsVariants:(id)a3;
- (BOOL)showingRecents;
- (BOOL)skinToneWasUsedForEmoji:(id)a3;
- (BOOL)supportsDatasourceIsReady;
- (CGRect)cellRectToRevealFullCell:(CGRect)a3;
- (CGRect)targetRectForIndexPath:(id)a3 atScrollPosition:(unint64_t)a4;
- (CGRect)targetRectForSectionIndex:(int64_t)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)searchResults;
- (NSIndexPath)selectedIndexPath;
- (NSIndexPath)tappedSkinToneEmoji;
- (NSIndexPath)unavailableLaunchPath;
- (STKImageGlyphDataSource)imageGlyphDataSource;
- (TUIEmojiSearchInputViewController)emojiSearchInputViewController;
- (TUIEmojiSearchTextField)emojiSearchField;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIKBEmojiHitTestResponder)hitTestResponder;
- (UIKeyboardEmojiAndStickerCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (UIKeyboardEmojiAndStickerCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6;
- (UIKeyboardEmojiCategory)category;
- (double)categoryHeaderFontSize;
- (double)categoryHeaderHeight;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)distanceInScrollingDirection:(CGSize)a3;
- (double)emojiKeyWidth;
- (double)pointInScrollingDirection:(CGPoint)a3;
- (double)scrollingEndPoint;
- (double)scrollingStartPoint;
- (double)topPadding;
- (id)accessibilityIdentifier;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)completionBlock;
- (id)currentlyFocusedIndexPath;
- (id)emojiBaseFirstCharacterString:(id)a3;
- (id)emojiBaseString:(id)a3;
- (id)getIAGenmojiImageTypeFromImageGlyph:(id)a3;
- (id)itemInRect:(CGRect)a3;
- (id)recentsIndexPath;
- (id)selectedChildSkinToneEmoji:(id)a3;
- (id)stickerCellForIndexPath:(id)a3;
- (id)subTreeHitTest:(CGPoint)a3;
- (id)treeForCell:(id)a3;
- (id)treeForStickerCell:(id)a3;
- (id)trulyVisibleIndexPaths;
- (id)verticalNeighborForIndexPath:(id)a3 up:(BOOL)a4 byPage:(BOOL)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)currentlyFocusedSectionIndex;
- (int64_t)didInputSubTree:(id)a3;
- (int64_t)emojiCategoryIndex;
- (int64_t)emojiCategoryTypeForSection:(int64_t)a3;
- (int64_t)emojiSectionIndex;
- (int64_t)indexForPrettyCategoryDisplay:(id)a3;
- (int64_t)keyCodeForCurrentEnvironmentFromKeyCode:(int64_t)a3;
- (int64_t)memojiCategoryIndex;
- (int64_t)memojiSectionIndex;
- (int64_t)numberOfPrefixCategories;
- (int64_t)numberOfPrefixSections;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)recentCategoryIndex;
- (int64_t)recentSectionIndex;
- (int64_t)rowsInSection:(int64_t)a3;
- (int64_t)sectionForCategoryType:(int64_t)a3;
- (int64_t)stickersCategoryIndex;
- (int64_t)stickersSectionIndex;
- (int64_t)translatedEmojiCategoryForSection:(int64_t)a3;
- (int64_t)updateToCategoryWithOffsetPercentage:(double)a3;
- (void)_addDelegate:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_notifyDelegatesRearrangeModeChanged:(BOOL)a3;
- (void)_removeDelegate:(id)a3;
- (void)_setRearrangeMode:(BOOL)a3;
- (void)_setUserHasSelectedSkinToneEmoji:(BOOL)a3;
- (void)_setupLongPressGestureRecognizer;
- (void)_setupTapGestureRecognizer;
- (void)_updateRearrangeModeForCell:(id)a3 atIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureDataSource;
- (void)dealloc;
- (void)deleteImageGlyph:(id)a3 atPath:(id)a4;
- (void)didDismissCardForKeyboardMediaController:(id)a3;
- (void)didInsertMediaForKeyboardMediaController:(id)a3;
- (void)didMoveToWindow;
- (void)didPresentCardForKeyboardMediaController:(id)a3;
- (void)didTearDownRecentsViewForKeyboardMediaController:(id)a3;
- (void)dimKeys:(id)a3;
- (void)emojiSearchTextFieldDidBecomeActive:(id)a3;
- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3;
- (void)emojiSearchTextFieldDidReset:(id)a3;
- (void)emojiSearchTextFieldWillBecomeActive:(id)a3;
- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3;
- (void)emojiSearchTextFieldWillClear:(id)a3;
- (void)handleScrollViewDynamicPagination:(id)a3;
- (void)insertImageGlyph:(id)a3 dismiss:(BOOL)a4;
- (void)insertSelectedEmoji:(id)a3 shouldDismissPopover:(BOOL)a4;
- (void)rearrangeStateChanged:(BOOL)a3;
- (void)resetSelectionIfNeeded;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCategory:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setEmojiSearchField:(id)a3;
- (void)setEmojiSearchInputViewController:(id)a3;
- (void)setHitTestResponder:(id)a3;
- (void)setImageGlyphDataSource:(id)a3;
- (void)setIsSearching:(BOOL)a3;
- (void)setSearchResults:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTappedSkinToneEmoji:(id)a3;
- (void)setUnavailableLaunchPath:(id)a3;
- (void)shouldDismissModalDisplayView:(id)a3;
- (void)updateDataSourceSnapshot;
- (void)updateDataSourceSnapshotAnimated:(BOOL)a3;
- (void)updateDataSourceWithSnapshot:(id)a3 animated:(BOOL)a4;
- (void)updateHighlightForIndexPath:(id)a3 scrollIfNeeded:(BOOL)a4 animateScroll:(BOOL)a5;
- (void)updateLastSeenItemForIndexPath:(id)a3;
- (void)updateOffsetForSearchResultsAnimated:(BOOL)a3;
- (void)updatePreferencesForSelectedEmoji:(id)a3;
- (void)updateToCategory:(int64_t)a3;
- (void)updateToIndexPath:(id)a3;
- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5;
@end

@implementation UIKeyboardEmojiAndStickerCollectionInputView

+ (BOOL)wantsScreenTraits
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return @"UIKeyboardEmojiAndStickerCollectionInputView Preview";
}

- (UIKeyboardEmojiAndStickerCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
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
    id v15 = +[UIKBScreenTraits traitsWithScreen:v19 orientation:v17];
  }
  BOOL v20 = (unint64_t)(v17 - 3) <= 1 && [v15 idiom] != 1;
  self->_useWideAnimojiCell = v20;
  v56.receiver = self;
  v56.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  v21 = -[UIView initWithFrame:](&v56, sel_initWithFrame_, x, y, width, height);
  if (!v21) {
    goto LABEL_21;
  }
  os_log_t v22 = os_log_create("com.apple.uikit", "StickerCollectionInputView");
  logger = v21->_logger;
  v21->_logger = (OS_os_log *)v22;

  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2050000000;
  v24 = (void *)getSTKImageGlyphDataSourceClass_softClass_0;
  uint64_t v62 = getSTKImageGlyphDataSourceClass_softClass_0;
  if (!getSTKImageGlyphDataSourceClass_softClass_0)
  {
    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __getSTKImageGlyphDataSourceClass_block_invoke_0;
    location[3] = &unk_1E52D9900;
    v58 = &v59;
    StickerKitLibraryCore_1();
    Class Class = objc_getClass("STKImageGlyphDataSource");
    *(void *)(v58[1] + 24) = Class;
    getSTKImageGlyphDataSourceClass_softClass_0 = *(void *)(v58[1] + 24);
    v24 = (void *)v60[3];
  }
  id v26 = v24;
  _Block_object_dispose(&v59, 8);
  if (v26)
  {
    uint64_t v27 = [v26 sharedInstance];
    imageGlyphDataSource = v21->_imageGlyphDataSource;
    v21->_imageGlyphDataSource = (STKImageGlyphDataSource *)v27;

    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v21 selector:sel_updateDataSourceSnapshot name:@"com.apple.stickerkit.ImageGlyphDataSourceDidUpdate" object:0];
  }
  else
  {
    v29 = v21->_imageGlyphDataSource;
    v21->_imageGlyphDataSource = 0;
  }

  +[UIKeyboardEmojiCategory setDoesShowStickers:[(UIKeyboardEmojiAndStickerCollectionInputView *)v21 doesShowStickers]];
  v21->_frameInset = 0.0;
  uint64_t v30 = +[UIKeyboardEmojiGraphicsTraits emojiGraphicsTraitsWithScreenTraits:v15];
  emojiGraphicsTraits = v21->_emojiGraphicsTraits;
  v21->_emojiGraphicsTraits = (UIKeyboardEmojiGraphicsTraits *)v30;

  v32 = +[UIColor clearColor];
  [(UIView *)v21 setBackgroundColor:v32];

  [(UIView *)v21 setOpaque:0];
  [(UIKBKeyView *)v21 updateForKeyplane:v13 key:v14];
  v21->_isDraggingInputView = 0;
  unavailableLaunchPath = v21->_unavailableLaunchPath;
  v21->_unavailableLaunchPath = 0;

  v34 = objc_alloc_init(UIKeyboardEmojiLayout);
  flowLayout = v21->_flowLayout;
  v21->_flowLayout = &v34->super;

  [(UICollectionViewFlowLayout *)v21->_flowLayout setMinimumInteritemSpacing:0.0];
  [(UICollectionViewFlowLayout *)v21->_flowLayout setMinimumLineSpacing:0.0];
  -[UICollectionViewFlowLayout setScrollDirection:](v21->_flowLayout, "setScrollDirection:", [v15 isEmojiScrollingDirectionVertical] ^ 1);
  v36 = v21->_flowLayout;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v37 = [(STKImageGlyphDataSource *)v21->_imageGlyphDataSource imageGlyphCompositionalLayout];
LABEL_17:

    v36 = (UICollectionViewFlowLayout *)v37;
    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector())
  {
    v38 = objc_alloc_init(UICollectionViewCompositionalLayoutConfiguration);
    -[UICollectionViewCompositionalLayoutConfiguration setScrollDirection:](v38, "setScrollDirection:", [v15 isEmojiScrollingDirectionVertical] ^ 1);
    objc_initWeak(location, v21);
    v39 = [UICollectionViewCompositionalLayout alloc];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __88__UIKeyboardEmojiAndStickerCollectionInputView_initWithFrame_keyplane_key_screenTraits___block_invoke;
    v54[3] = &unk_1E5300C98;
    objc_copyWeak(&v55, location);
    uint64_t v37 = [(UICollectionViewCompositionalLayout *)v39 initWithSectionProvider:v54 configuration:v38];

    objc_destroyWeak(&v55);
    objc_destroyWeak(location);
    v36 = (UICollectionViewFlowLayout *)v38;
    goto LABEL_17;
  }
LABEL_18:
  v40 = [UIKeyboardEmojiAndStickerCollectionView alloc];
  [(UIView *)v21 bounds];
  uint64_t v41 = -[UIKeyboardEmojiAndStickerCollectionView initWithFrame:collectionViewLayout:emojiGraphicsTraits:](v40, "initWithFrame:collectionViewLayout:emojiGraphicsTraits:", v36, v21->_emojiGraphicsTraits);
  collectionView = v21->_collectionView;
  v21->_collectionView = (UIKeyboardEmojiAndStickerCollectionView *)v41;

  [(UICollectionView *)v21->_collectionView setPrefetchingEnabled:1];
  v43 = v21->_collectionView;
  v44 = +[UIColor clearColor];
  [(UICollectionView *)v43 setBackgroundColor:v44];

  [(UIView *)v21->_collectionView setAutoresizingMask:18];
  [(UIView *)v21 contentScaleFactor];
  -[UIView setContentScaleFactor:](v21->_collectionView, "setContentScaleFactor:");
  [(UICollectionView *)v21->_collectionView setDelegate:v21];
  [(UIScrollView *)v21->_collectionView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)v21->_collectionView setShowsVerticalScrollIndicator:0];
  v45 = [(UIScrollView *)v21->_collectionView panGestureRecognizer];
  [v45 setMaximumNumberOfTouches:1];

  v46 = [(UIScrollView *)v21->_collectionView panGestureRecognizer];
  [v46 setMinimumNumberOfTouches:1];

  v47 = [(UIScrollView *)v21->_collectionView panGestureRecognizer];
  [v47 setFailsPastMaxTouches:1];

  [(UICollectionView *)v21->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withReuseIdentifier:@"kEmojiCategoryTitleIdentifier"];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)v21 configureDataSource];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)v21 updateDataSourceSnapshotAnimated:0];
  v21->_hasCompletedInitialDispladouble y = 0;
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)v21 supportsDatasourceIsReady]) {
    [(UIView *)v21->_collectionView setHidden:1];
  }
  v48 = +[UIKeyboardImpl activeInstance];
  v21->_inputDelegateCanSupportAnimoji = [v48 canPasteImage];

  v49 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v50 = [v49 valueForKey:@"com.apple.Animoji.StickerRecents.SplashVersion"];
  v21->_hasShownAnimojiFirstTimeExperience = v50 != 0;

  v21->_shouldRetryFetchingAnimojiRecents = 0;
  [(UIView *)v21 addSubview:v21->_collectionView];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)v21 _setupLongPressGestureRecognizer];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)v21 _setupTapGestureRecognizer];
  v51 = [[UIKeyboardEmojiAndStickerCollectionInputViewKeylineView alloc] initWithSuperview:v21];
  keylineView = v21->_keylineView;
  v21->_keylineView = v51;

LABEL_21:
  return v21;
}

id __88__UIKeyboardEmojiAndStickerCollectionInputView_initWithFrame_keyplane_key_screenTraits___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained[103] sectionLayoutForSectionIndex:a2 environment:v5];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_addDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    delegates = self->_delegates;
    id v8 = v4;
    if (!delegates)
    {
      v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v7 = self->_delegates;
      self->_delegates = v6;

      delegates = self->_delegates;
    }
    [(NSHashTable *)delegates addObject:v8];
    id v4 = v8;
  }
}

- (void)_removeDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_delegates removeObject:v4];
    NSUInteger v5 = [(NSHashTable *)self->_delegates count];
    id v4 = v7;
    if (!v5)
    {
      delegates = self->_delegates;
      self->_delegates = 0;

      id v4 = v7;
    }
  }
}

- (void)_notifyDelegatesRearrangeModeChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_delegates copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 rearrangeStateChanged:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)rearrangeStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1853B0000, logger, OS_LOG_TYPE_DEFAULT, "Rearrange state changed to: %{BOOL}d", (uint8_t *)v6, 8u);
  }
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self _setRearrangeMode:v3];
}

- (BOOL)isRearrangingAllowed
{
  return !self->_isSearching;
}

- (void)_setupLongPressGestureRecognizer
{
  if (self->_longPressRecognizer) {
    -[UIView removeGestureRecognizer:](self->_collectionView, "removeGestureRecognizer:");
  }
  BOOL v3 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__handleLongPress_];
  longPressRecognizer = self->_longPressRecognizer;
  self->_longPressRecognizer = v3;

  [(UIGestureRecognizer *)self->_longPressRecognizer setDelegate:self];
  [(UIGestureRecognizer *)self->_longPressRecognizer setEnabled:0];
  collectionView = self->_collectionView;
  uint64_t v6 = self->_longPressRecognizer;
  [(UIView *)collectionView addGestureRecognizer:v6];
}

- (void)_handleLongPress:(id)a3
{
  id v4 = (UILongPressGestureRecognizer *)a3;
  if (self->_longPressRecognizer == v4 && self->_isRearranging)
  {
    v18 = v4;
    uint64_t v5 = [(UIGestureRecognizer *)v4 state] - 1;
    id v4 = v18;
    switch(v5)
    {
      case 0:
        collectionView = self->_collectionView;
        [(UILongPressGestureRecognizer *)v18 locationInView:collectionView];
        uint64_t v7 = -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
        if (v7)
        {
          [(UICollectionView *)self->_collectionView beginInteractiveMovementForItemAtIndexPath:v7];
          uint64_t v8 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v7];
          if (v8)
          {
            [(UILongPressGestureRecognizer *)v18 locationInView:v8];
            double v10 = v9;
            double v12 = v11;
            [v8 frame];
            double v14 = v13 * 0.5;
            [v8 frame];
            self->_touchOffsetForMovingCell.double x = v14 - v10;
            self->_touchOffsetForMovingCell.double y = v15 * 0.5 - v12;
          }
          else
          {
            self->_touchOffsetForMovingCell = (CGPoint)*MEMORY[0x1E4F1DAD8];
          }
        }
        else
        {
          [(UIKeyboardEmojiAndStickerCollectionInputView *)self _setRearrangeMode:0];
        }

        goto LABEL_14;
      case 1:
        [(UILongPressGestureRecognizer *)v18 locationInView:self->_collectionView];
        -[UICollectionView updateInteractiveMovementTargetPosition:](self->_collectionView, "updateInteractiveMovementTargetPosition:", v16 + self->_touchOffsetForMovingCell.x, v17 + self->_touchOffsetForMovingCell.y);
        goto LABEL_14;
      case 2:
        [(UICollectionView *)self->_collectionView endInteractiveMovement];
        goto LABEL_14;
      case 3:
        [(UICollectionView *)self->_collectionView cancelInteractiveMovement];
LABEL_14:
        id v4 = v18;
        break;
      default:
        break;
    }
  }
}

- (void)_setupTapGestureRecognizer
{
  if (self->_tapRecognizer) {
    -[UIView removeGestureRecognizer:](self->_collectionView, "removeGestureRecognizer:");
  }
  BOOL v3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__handleTap_];
  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v3;

  [(UIGestureRecognizer *)self->_tapRecognizer setEnabled:0];
  [(UIGestureRecognizer *)self->_tapRecognizer setDelegate:self];
  collectionView = self->_collectionView;
  uint64_t v6 = self->_tapRecognizer;
  [(UIView *)collectionView addGestureRecognizer:v6];
}

- (void)_handleTap:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  if (self->_tapRecognizer == v4 && self->_isRearranging)
  {
    collectionView = self->_collectionView;
    uint64_t v7 = v4;
    [(UITapGestureRecognizer *)v4 locationInView:collectionView];
    uint64_t v6 = -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
    if (!-[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", [v6 section])&& -[UIGestureRecognizer state](v7, "state") == UIGestureRecognizerStateEnded)
    {
      [(UIKeyboardEmojiAndStickerCollectionInputView *)self _setRearrangeMode:0];
    }

    id v4 = v7;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    isKindOfClass Class = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass Class = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();
  }
  else
  {
    char v8 = 0;
  }
  char v9 = isKindOfClass | v8;

  return v9 & 1;
}

- (void)_setRearrangeMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isRearranging != a3)
  {
    self->_isRearranging = a3;
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self _notifyDelegatesRearrangeModeChanged:a3];
  }
  if (v3)
  {
    id v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
    [v5 deactivateActiveKey];
  }
  else
  {
    [(UICollectionView *)self->_collectionView endInteractiveMovement];
  }
  [(UIGestureRecognizer *)self->_tapRecognizer setEnabled:v3];
  longPressRecognizer = self->_longPressRecognizer;
  [(UIGestureRecognizer *)longPressRecognizer setEnabled:v3];
}

- (void)_updateRearrangeModeForCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  LODWORD(a4) = -[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", [a4 section]);
  id v7 = v6;
  if (a4)
  {
    [v7 setDelegate:self];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self _addDelegate:v7];
  }
  else
  {
    [v7 setDelegate:0];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self _removeDelegate:v7];
  }
  [v7 setRearrangeMode:self->_isRearranging];
}

- (void)configureDataSource
{
  objc_initWeak(location, self);
  uint64_t v3 = objc_opt_class();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke;
  v34[3] = &unk_1E5300CC0;
  objc_copyWeak(&v35, location);
  v34[4] = self;
  id v4 = +[UICollectionViewCellRegistration registrationWithCellClass:v3 configurationHandler:v34];
  uint64_t v5 = objc_opt_class();
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_2;
  v32[3] = &unk_1E5300CE8;
  objc_copyWeak(&v33, location);
  id v6 = +[UICollectionViewCellRegistration registrationWithCellClass:v5 configurationHandler:v32];
  id v7 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_3;
  v29[3] = &unk_1E5300D10;
  id v9 = v6;
  id v30 = v9;
  id v10 = v4;
  id v31 = v10;
  double v11 = [(UICollectionViewDiffableDataSource *)v7 initWithCollectionView:collectionView cellProvider:v29];
  dataSource = self->_dataSource;
  self->_dataSource = v11;

  double v13 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:@"UICollectionElementKindSectionHeader" configurationHandler:&__block_literal_global_437];
  double v14 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:@"UICollectionElementKindStickerButton" configurationHandler:&__block_literal_global_139_2];
  double v15 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:@"UICollectionElementKindStickerEmptyContent" configurationHandler:&__block_literal_global_143_0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_7;
  v25[3] = &unk_1E5300D98;
  id v16 = v14;
  id v26 = v16;
  id v17 = v15;
  id v27 = v17;
  id v18 = v13;
  id v28 = v18;
  [(UICollectionViewDiffableDataSource *)self->_dataSource setSupplementaryViewProvider:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_8;
  v23[3] = &unk_1E5300DC0;
  objc_copyWeak(&v24, location);
  v19 = [(UICollectionViewDiffableDataSource *)self->_dataSource reorderingHandlers];
  [v19 setCanReorderItemHandler:v23];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_146;
  v21[3] = &unk_1E5300DE8;
  objc_copyWeak(&v22, location);
  BOOL v20 = [(UICollectionViewDiffableDataSource *)self->_dataSource reorderingHandlers];
  [v20 setDidReorderHandler:v21];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(location);
}

void __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v10 setImageGlyph:v8];
    [v10 setCellDelegate:*(void *)(a1 + 32)];
    [WeakRetained _updateRearrangeModeForCell:v10 atIndexPath:v7];
  }
}

void __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v15 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = [v6 toString];
    if ([v8 length])
    {
      if ([v6 stickerSourceType] != 2)
      {
        id v9 = [WeakRetained emojiKeyManager];
        uint64_t v10 = [v9 lastUsedVariantEmojiForEmojiString:v8];

        id v8 = (void *)v10;
      }
      double v11 = +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v8, +[UIKeyboardEmojiCategory hasVariantsForEmoji:v8]);
      [v15 setEmoji:v11];
      if (v11)
      {
        [WeakRetained emojiKeyWidth];
        [v15 setEmojiFontSize:(uint64_t)v12];
        [v15 setHighlightPadding:0.0];
        if (os_variant_has_internal_diagnostics())
        {
          double v13 = objc_opt_class();
          double v14 = [v11 emojiString];
          objc_msgSend(v15, "setUnreleasedHighlight:", objc_msgSend(v13, "shouldHighlightEmoji:", v14));
        }
        goto LABEL_10;
      }
    }
    else
    {
      [v15 setEmoji:0];
    }
    [v15 setNoResultsCell:1];
    double v11 = 0;
LABEL_10:
  }
}

id __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [getSTKImageGlyphClass() imageGlyphForGlyphIdentifier:v9];

  if ([v10 type] == 3 || !objc_msgSend(v10, "type")) {
    double v11 = (void *)(a1 + 32);
  }
  else {
    double v11 = (void *)(a1 + 40);
  }
  double v12 = [v7 dequeueConfiguredReusableCellWithRegistration:*v11 forIndexPath:v8 item:v10];

  return v12;
}

id __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_7(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"UICollectionElementKindStickerButton"])
  {
    uint64_t v10 = a1 + 4;
  }
  else
  {
    int v11 = [v8 isEqualToString:@"UICollectionElementKindStickerEmptyContent"];
    uint64_t v10 = a1 + 6;
    if (v11) {
      uint64_t v10 = a1 + 5;
    }
  }
  double v12 = [v7 dequeueConfiguredReusableSupplementaryViewWithRegistration:*v10 forIndexPath:v9];

  return v12;
}

uint64_t __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*((unsigned char *)WeakRetained + 744))
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [getSTKImageGlyphClass() imageGlyphForGlyphIdentifier:v3];
    id v7 = [*((id *)WeakRetained + 103) indexPathForItem:v6];
    unsigned int v8 = objc_msgSend(WeakRetained, "isStickersCategory:", objc_msgSend(v7, "section"));
    unsigned int v9 = v8;
    if (*((unsigned char *)WeakRetained + 646)) {
      uint64_t v5 = v8;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v10 = *((void *)WeakRetained + 91);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138413058;
      id v13 = v3;
      __int16 v14 = 1024;
      unsigned int v15 = v9;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Attempted to reorder item identifier: %@, isSticker: %{BOOL}d, canReorder: %{BOOL}d, path:%@", (uint8_t *)&v12, 0x22u);
    }
  }
  return v5;
}

void __67__UIKeyboardEmojiAndStickerCollectionInputView_configureDataSource__block_invoke_146(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [v3 difference];
    id v6 = [v5 insertions];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (![v11 changeType])
          {
            uint64_t v12 = [v11 associatedIndex];
            uint64_t v13 = [v11 index];
            if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_16;
            }
            uint64_t v15 = v13;
            if (objc_opt_respondsToSelector()) {
              [WeakRetained[103] moveItemFromIndex:v12 toIndex:v15 completionHandler:&__block_literal_global_152_0];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
LABEL_16:
  }
}

- (void)updateDataSourceSnapshot
{
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateDataSourceSnapshotAnimated:self->_hasCompletedInitialDisplay];
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self supportsDatasourceIsReady])
  {
    if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self datasourceIsReady]) {
      self->_hasCompletedInitialDispladouble y = 1;
    }
  }
  else
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceSnapshot__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __72__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceSnapshot__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 645) = 1;
  return result;
}

- (void)updateDataSourceSnapshotAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching])
  {
    id v5 = [(STKImageGlyphDataSource *)self->_imageGlyphDataSource snapshot];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateDataSourceWithSnapshot:v5 animated:v3];
  }
}

- (void)updateDataSourceWithSnapshot:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (pthread_main_np() == 1)
  {
    if (self->_unavailableLaunchPath)
    {
      if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self supportsDatasourceIsReady]) {
        BOOL v7 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self datasourceIsReady];
      }
      else {
        BOOL v7 = 0;
      }
      unavailableLaunchPath = self->_unavailableLaunchPath;
      if (unavailableLaunchPath)
      {
        uint64_t v9 = [(NSIndexPath *)unavailableLaunchPath section];
        if ([v6 numberOfSections] <= v9
          || ([NSNumber numberWithInteger:v9],
              uint64_t v10 = objc_claimAutoreleasedReturnValue(),
              uint64_t v11 = [v6 numberOfItemsInSection:v10],
              int64_t v12 = [(NSIndexPath *)self->_unavailableLaunchPath item],
              v10,
              v11 <= v12))
        {
          long long v17 = 0;
        }
        else
        {
          uint64_t v13 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
          int64_t v14 = -[UIKeyboardEmojiAndStickerCollectionInputView sectionForCategoryType:](self, "sectionForCategoryType:", [v13 categoryType]);

          uint64_t v15 = (void *)MEMORY[0x1E4F28D58];
          long long v16 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
          long long v17 = objc_msgSend(v15, "indexPathForItem:inSection:", -[UIKeyboardEmojiAndStickerCollectionInputView indexForPrettyCategoryDisplay:](self, "indexForPrettyCategoryDisplay:", v16), v14);

          BOOL v4 = 0;
        }
        long long v18 = self->_unavailableLaunchPath;
        self->_unavailableLaunchPath = 0;

        goto LABEL_15;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
    long long v17 = 0;
LABEL_15:
    dataSource = self->_dataSource;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __86__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceWithSnapshot_animated___block_invoke;
    v26[3] = &unk_1E52DC3D0;
    id v27 = v17;
    id v28 = self;
    BOOL v29 = v7;
    id v20 = v17;
    [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v6 animatingDifferences:v4 completion:v26];

    goto LABEL_16;
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceWithSnapshot_animated___block_invoke_2;
  block[3] = &unk_1E52EAD18;
  objc_copyWeak(&v23, &location);
  id v22 = v6;
  BOOL v24 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
LABEL_16:
}

uint64_t __86__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceWithSnapshot_animated___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "updateToIndexPath:");
    v2 = [*(id *)(a1 + 40) emojiKeyManager];
    [v2 reloadCategoryForIndexPath:*(void *)(a1 + 32) withSender:*(void *)(a1 + 40)];

    BOOL v3 = [*(id *)(a1 + 40) emojiKeyManager];
    objc_msgSend(v3, "reloadForCategory:withSender:", objc_msgSend(*(id *)(a1 + 40), "emojiCategoryTypeForSection:", objc_msgSend(*(id *)(a1 + 32), "section")), *(void *)(a1 + 40));
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 816);
    *(void *)(v4 + 816) = 0;
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 600) isHidden];
  if (result)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (!*(void *)(v7 + 816))
    {
      uint64_t v8 = *(void **)(v7 + 600);
      return [v8 setHidden:0];
    }
  }
  return result;
}

void __86__UIKeyboardEmojiAndStickerCollectionInputView_updateDataSourceWithSnapshot_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained updateDataSourceWithSnapshot:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

- (BOOL)supportsDatasourceIsReady
{
  return objc_opt_respondsToSelector() & 1;
}

- (BOOL)datasourceIsReady
{
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self supportsDatasourceIsReady]) {
    return 1;
  }
  imageGlyphDataSource = self->_imageGlyphDataSource;
  return [(STKImageGlyphDataSource *)imageGlyphDataSource isReady];
}

- (UIKeyboardEmojiAndStickerCollectionInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  return -[UIKeyboardEmojiAndStickerCollectionInputView initWithFrame:keyplane:key:screenTraits:](self, "initWithFrame:keyplane:key:screenTraits:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  id v3 = +[UIKeyboardMediaController sharedKeyboardMediaController];
  [v3 setDelegate:0];

  [(UICollectionView *)self->_collectionView setDataSource:0];
  [(UICollectionView *)self->_collectionView setDelegate:0];
  self->_isDraggingInputView = 0;
  self->_showingVariants = 0;
  uint64_t v4 = +[UIKeyboardEmojiPreferences sharedInstance];
  [v4 clearEmojiKeyboardPreferenceClient];

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  [(UIKBKeyView *)&v5 dealloc];
}

- (void)setContentScaleFactor:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  -[UIView setContentScaleFactor:](&v5, sel_setContentScaleFactor_);
  [(UIView *)self->_collectionView setContentScaleFactor:a3];
}

- (void)dimKeys:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  [(UIKBKeyView *)&v7 dimKeys:v4];
  objc_super v5 = [(UIView *)self subviews];

  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __56__UIKeyboardEmojiAndStickerCollectionInputView_dimKeys___block_invoke;
    v6[3] = &unk_1E52E6590;
    v6[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __56__UIKeyboardEmojiAndStickerCollectionInputView_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
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
  [(UIKeyboardEmojiAndStickerCollectionView *)self->_collectionView setHitTestResponder:v5];
}

- (BOOL)_userHasSelectedSkinToneEmoji
{
  id v3 = +[UIKeyboardImpl activeInstance];
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
  uint64_t v4 = [getEMFStringUtilitiesClass_0() _baseStringForEmojiString:v3];

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
  id v4 = [getEMFStringUtilitiesClass_0() _baseStringForEmojiString:v3];

  LOBYTE(v3) = [getEMFEmojiCategoryClass_2() _isCoupleMultiSkinToneEmoji:v4];
  return (char)v3;
}

- (id)subTreeHitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = 0;
  if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", 0))
  {
    if (self->_isRearranging)
    {
      int v6 = 0;
      goto LABEL_13;
    }
    collectionView = self->_collectionView;
    -[UIView convertPoint:fromView:](collectionView, "convertPoint:fromView:", self, x, y);
    BOOL v8 = -[UIKeyboardEmojiAndStickerCollectionView closestCellForPoint:](collectionView, "closestCellForPoint:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self treeForStickerCell:v8];
    }
    else
    {
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        int v6 = 0;
        goto LABEL_12;
      }
      int v6 = [v8 emoji];

      if (!v6)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self treeForCell:v8];
    }
    int v6 = (void *)v9;
    goto LABEL_12;
  }
LABEL_13:
  return v6;
}

- (BOOL)isCellMostlyOffscreen:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  [(UIView *)self frame];
  if (MidX < CGRectGetMinX(v13)) {
    return 1;
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGRectGetMidX(v14);
  [(UIView *)self frame];
  if (v9 > CGRectGetMaxX(v15)) {
    return 1;
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v16);
  [(UIView *)self frame];
  if (MidY < CGRectGetMinY(v17)) {
    return 1;
  }
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v12 = CGRectGetMidY(v18);
  [(UIView *)self frame];
  return v12 > CGRectGetMaxY(v19);
}

- (CGRect)cellRectToRevealFullCell:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  collectionView = self->_collectionView;
  double v9 = [(UIView *)self superview];
  double v125 = x;
  double v126 = y;
  -[UIView convertRect:toView:](collectionView, "convertRect:toView:", v9, x, y, width, height);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  BOOL v18 = +[UIKeyboardImpl isSplit];
  CGFloat v19 = v11;
  CGFloat v20 = v13;
  CGFloat v21 = v15;
  CGFloat v22 = v17;
  if (!v18)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v19);
    v51 = [(UIView *)self superview];
    [v51 frame];
    double v52 = CGRectGetMaxX(v134);

    if (MaxX <= v52)
    {
      v149.origin.double x = v11;
      v149.origin.double y = v13;
      v149.size.double width = v15;
      v149.size.double height = v17;
      double MinX = CGRectGetMinX(v149);
      v97 = [(UIView *)self superview];
      [v97 frame];
      double v98 = CGRectGetMinX(v150);

      if (MinX >= v98) {
        goto LABEL_38;
      }
      v99 = self->_collectionView;
      [(UIScrollView *)v99 contentOffset];
      double v101 = v100;
      v151.origin.double x = v11;
      v151.origin.double y = v13;
      v151.size.double width = v15;
      v151.size.double height = v17;
      double v102 = CGRectGetMinX(v151);
      v103 = [(UIView *)self superview];
      [v103 frame];
      double v104 = v102 - CGRectGetMinX(v152);

      double v105 = -v104;
      if (v104 >= 0.0) {
        double v105 = v104;
      }
      double v106 = v101 - v105;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
      double v108 = v106 - v107;
      [(UIScrollView *)self->_collectionView contentOffset];
      [(UICollectionView *)v99 setContentOffset:1 animated:v108];
      v153.origin.double x = v11;
      v153.origin.double y = v13;
      v153.size.double width = v15;
      v153.size.double height = v17;
      double v109 = CGRectGetMinX(v153);
      v110 = [(UIView *)self superview];
      [v110 frame];
      double v111 = v109 - CGRectGetMinX(v154);

      if (v111 >= 0.0) {
        double v111 = -v111;
      }
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
      double v113 = v111 - v112;
      v155.origin.double x = v11;
      v155.origin.double y = v13;
      v155.size.double width = v15;
      v155.size.double height = v17;
      double v114 = CGRectGetMinX(v155);
      v115 = [(UIView *)self superview];
      [v115 frame];
      double v116 = v114 + CGRectGetMinX(v156);

      if (v116 < 0.0) {
        double v116 = -v116;
      }
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
      double v118 = v116 + v117;
      double v47 = v125 + v118;
      double v71 = v113 + v118;
    }
    else
    {
      v53 = self->_collectionView;
      [(UIScrollView *)v53 contentOffset];
      double v55 = v54;
      v135.origin.double x = v11;
      v135.origin.double y = v13;
      v135.size.double width = v15;
      v135.size.double height = v17;
      double v56 = CGRectGetMaxX(v135);
      v57 = [(UIView *)self superview];
      [v57 frame];
      double v58 = v56 - CGRectGetMaxX(v136);

      if (v58 < 0.0) {
        double v58 = -v58;
      }
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
      double v60 = v55 + v58 + v59;
      [(UIScrollView *)self->_collectionView contentOffset];
      [(UICollectionView *)v53 setContentOffset:1 animated:v60];
      v137.origin.double x = v11;
      v137.origin.double y = v13;
      v137.size.double width = v15;
      v137.size.double height = v17;
      double v61 = CGRectGetMaxX(v137);
      uint64_t v62 = [(UIView *)self superview];
      [v62 frame];
      double v63 = v61 - CGRectGetMaxX(v138);

      if (v63 < 0.0) {
        double v63 = -v63;
      }
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
      double v65 = v63 + v64;
      v139.origin.double x = v11;
      v139.origin.double y = v13;
      v139.size.double width = v15;
      v139.size.double height = v17;
      double v66 = CGRectGetMaxX(v139);
      v67 = [(UIView *)self superview];
      [v67 frame];
      double v68 = v66 - CGRectGetMaxX(v140);

      if (v68 < 0.0) {
        double v68 = -v68;
      }
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
      double v70 = v68 + v69;
      double v47 = v125 - v70;
      double v71 = v65 - v70;
    }
    double width = width - v71;
    double v48 = v126 + 0.0;
    goto LABEL_39;
  }
  double MaxY = CGRectGetMaxY(*(CGRect *)&v19);
  BOOL v24 = [(UIView *)self superview];
  [v24 frame];
  double v25 = CGRectGetMaxY(v127);

  if (MaxY <= v25)
  {
    v141.origin.double x = v11;
    v141.origin.double y = v13;
    v141.size.double width = v15;
    v141.size.double height = v17;
    double MinY = CGRectGetMinY(v141);
    v73 = [(UIView *)self superview];
    [v73 frame];
    double v74 = CGRectGetMinY(v142);

    if (MinY < v74)
    {
      v75 = self->_collectionView;
      [(UIScrollView *)v75 contentOffset];
      double v122 = v76;
      [(UIScrollView *)self->_collectionView contentOffset];
      double v78 = v77;
      v143.origin.double x = v11;
      v143.origin.double y = v13;
      v143.size.double width = v15;
      v143.size.double height = v17;
      double v124 = height;
      double v79 = CGRectGetMinY(v143);
      v80 = [(UIView *)self superview];
      [v80 frame];
      double v81 = CGRectGetMinY(v144);

      double v82 = 0.0;
      if (v79 < v81) {
        double v82 = 1.0;
      }
      double v83 = v78 - v82;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
      -[UICollectionView setContentOffset:animated:](v75, "setContentOffset:animated:", 1, v122, v83 - v84);
      v145.origin.double x = v11;
      v145.origin.double y = v13;
      v145.size.double width = v15;
      v145.size.double height = v17;
      double v85 = CGRectGetMinY(v145);
      v86 = [(UIView *)self superview];
      [v86 frame];
      double v87 = CGRectGetMinY(v146);

      if (v85 >= v87) {
        double v88 = 0.0;
      }
      else {
        double v88 = 1.0;
      }
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
      double v90 = v89 + v88;
      v147.origin.double x = v11;
      v147.origin.double y = v13;
      v147.size.double width = v15;
      v147.size.double height = v17;
      double v91 = CGRectGetMinY(v147);
      v92 = [(UIView *)self superview];
      [v92 frame];
      double v93 = CGRectGetMinY(v148);

      if (v91 >= v93) {
        double v94 = 0.0;
      }
      else {
        double v94 = -1.0;
      }
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
      double v47 = v125 + 0.0;
      double v48 = v126 + v90;
      double v49 = v90 + v94 - v95;
      double v37 = v124;
      goto LABEL_28;
    }
LABEL_38:
    double v47 = v125;
    double v48 = v126;
    goto LABEL_39;
  }
  id v26 = self->_collectionView;
  [(UIScrollView *)v26 contentOffset];
  double v123 = v27;
  [(UIScrollView *)self->_collectionView contentOffset];
  double v29 = v28;
  v128.origin.double x = v11;
  v128.origin.double y = v13;
  v128.size.double width = v15;
  v128.size.double height = v17;
  double v30 = width;
  double v31 = height;
  double v32 = CGRectGetMaxY(v128);
  id v33 = [(UIView *)self superview];
  [v33 frame];
  double v34 = v32 - CGRectGetMaxY(v129);

  if (v34 < 0.0) {
    double v34 = -v34;
  }
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
  double v36 = v34 + v35;
  double v37 = v31;
  double width = v30;
  -[UICollectionView setContentOffset:animated:](v26, "setContentOffset:animated:", 1, v123, v29 + v36);
  v130.origin.double x = v11;
  v130.origin.double y = v13;
  v130.size.double width = v15;
  v130.size.double height = v17;
  double v38 = CGRectGetMaxY(v130);
  v39 = [(UIView *)self superview];
  [v39 frame];
  double v40 = v38 - CGRectGetMaxY(v131);

  if (v40 < 0.0) {
    double v40 = -v40;
  }
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
  double v42 = v40 + v41;
  v132.origin.double x = v11;
  v132.origin.double y = v13;
  v132.size.double width = v15;
  v132.size.double height = v17;
  double v43 = CGRectGetMaxY(v132);
  v44 = [(UIView *)self superview];
  [v44 frame];
  double v45 = v43 - CGRectGetMaxY(v133);

  if (v45 < 0.0) {
    double v45 = -v45;
  }
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
  double v47 = v125 + 0.0;
  double v48 = v126 - v42;
  double v49 = v45 + v46 - v42;
LABEL_28:
  double height = v37 - v49;
LABEL_39:
  double v119 = v47;
  double v120 = width;
  double v121 = height;
  result.size.double height = v121;
  result.size.double width = v120;
  result.origin.double y = v48;
  result.origin.double x = v119;
  return result;
}

- (id)treeForStickerCell:(id)a3
{
  id v4 = a3;
  collectionView = self->_collectionView;
  [v4 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(UIView *)self superview];
  -[UIView convertRect:toView:](collectionView, "convertRect:toView:", v14, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  if (-[UIKeyboardEmojiAndStickerCollectionInputView isCellMostlyOffscreen:](self, "isCellMostlyOffscreen:", v16, v18, v20, v22)|| ([v4 frame], -[UIKeyboardEmojiAndStickerCollectionInputView cellRectToRevealFullCell:](self, "cellRectToRevealFullCell:"), !v4))
  {
    double v38 = 0;
  }
  else
  {
    double v27 = v23;
    double v28 = v24;
    double v29 = v25;
    double v30 = v26;
    double v31 = [v4 contentView];
    double v32 = [UIGraphicsImageRenderer alloc];
    [v31 bounds];
    double v35 = -[UIGraphicsImageRenderer initWithSize:](v32, "initWithSize:", v33, v34);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __67__UIKeyboardEmojiAndStickerCollectionInputView_treeForStickerCell___block_invoke;
    v57[3] = &unk_1E52DD280;
    id v36 = v31;
    id v58 = v36;
    double v37 = [(UIGraphicsImageRenderer *)v35 imageWithActions:v57];
    double v38 = +[UIKBTree treeOfType:8];
    [v38 setState:2];
    [v38 setDisplayImage:v37];
    [v38 setName:@"EmojiPopupKey"];
    [v38 setDisplayType:57];
    [v38 setInteractionType:2];
    if (self->_selectedPopupKey) {
      [(UIKeyboardEmojiAndStickerCollectionInputView *)self resetSelectionIfNeeded];
    }
    v39 = self->_collectionView;
    double v40 = [(UIView *)self superview];
    -[UIView convertRect:toView:](v39, "convertRect:toView:", v40, v27, v28, v29, v30);
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;

    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      +[UIKeyboardImpl isFloating];
    }
    v60.origin.double y = v44 - (v48 - v48) * 0.5;
    v60.origin.double x = v42 - (v46 - v46) * 0.5;
    v60.size.double width = v46;
    v60.size.double height = v48;
    CGRect v61 = CGRectInset(v60, -2.0, -2.0);
    double x = v61.origin.x;
    double y = v61.origin.y;
    double width = v61.size.width;
    double height = v61.size.height;
    CGRect v62 = CGRectInset(v61, -1.0, -1.0);
    v53 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, x, y, width, height, v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
    [v38 setShape:v53];

    double v54 = [(UIKBKeyView *)self key];
    [v38 setParentKey:v54];

    double v55 = [v4 imageGlyph];
    [v38 setObject:v55 forProperty:@"UIKBAssociatedImageGlyph"];
  }
  return v38;
}

uint64_t __67__UIKeyboardEmojiAndStickerCollectionInputView_treeForStickerCell___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 bounds];
  return objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

- (id)treeForCell:(id)a3
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  collectionView = self->_collectionView;
  id v123 = v4;
  [v4 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v124 = self;
  double v14 = [(UIView *)self superview];
  -[UIView convertRect:toView:](collectionView, "convertRect:toView:", v14, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  if (!-[UIKeyboardEmojiAndStickerCollectionInputView isCellMostlyOffscreen:](v124, "isCellMostlyOffscreen:", v16, v18, v20, v22))
  {
    [v123 frame];
    -[UIKeyboardEmojiAndStickerCollectionInputView cellRectToRevealFullCell:](v124, "cellRectToRevealFullCell:");
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v32 = [(UICollectionView *)v124->_collectionView indexPathForCell:v123];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)v124 setTappedSkinToneEmoji:v32];

    double v33 = v123;
    if (!v123)
    {
      double v23 = 0;
      goto LABEL_60;
    }
    double v122 = [v123 emoji];
    double v23 = +[UIKBTree treeOfType:8];
    [v23 setState:2];
    [v23 setName:@"EmojiPopupKey"];
    double v120 = [v122 emojiString];
    [v23 setDisplayString:v120];
    [v23 setRepresentedString:v120];
    [v23 setDisplayType:0];
    [v23 setInteractionType:2];
    if (v124->_selectedPopupKey) {
      [(UIKeyboardEmojiAndStickerCollectionInputView *)v124 resetSelectionIfNeeded];
    }
    if (+[UIDictationController isRunning])
    {
      double v34 = +[UIDictationController sharedInstance];
      double v35 = [v34 dictationTipController];
      id v36 = [v122 emojiString];
      [v35 signalDictationInsertionTip:v36];
    }
    uint64_t v139 = 0;
    CGRect v140 = &v139;
    uint64_t v141 = 0x2050000000;
    double v37 = (void *)getEMFEmojiTokenClass_softClass_2;
    uint64_t v142 = getEMFEmojiTokenClass_softClass_2;
    if (!getEMFEmojiTokenClass_softClass_2)
    {
      uint64_t v134 = MEMORY[0x1E4F143A8];
      uint64_t v135 = 3221225472;
      uint64_t v136 = (uint64_t)__getEMFEmojiTokenClass_block_invoke_4;
      uint64_t v137 = (uint64_t)&unk_1E52D9900;
      CGRect v138 = &v139;
      __getEMFEmojiTokenClass_block_invoke_4((uint64_t)&v134);
      double v37 = (void *)v140[3];
    }
    id v38 = v37;
    _Block_object_dispose(&v139, 8);
    v39 = [v122 emojiString];
    double v121 = [v38 emojiTokenWithString:v39 localeData:0];

    if (![v121 supportsSkinToneVariants]) {
      goto LABEL_47;
    }
    double v40 = [v121 _skinToneVariantStrings];
    double v125 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v40, "count") + 1);
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id obj = v40;
    uint64_t v41 = [obj countByEnumeratingWithState:&v130 objects:v143 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v131;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v131 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = *(void *)(*((void *)&v130 + 1) + 8 * i);
          double v45 = (void *)[v23 copy];
          [v45 setRepresentedString:v44];
          double v46 = [v45 representedString];
          [v45 setDisplayString:v46];

          [v45 setDisplayType:0];
          double v47 = NSString;
          double v48 = [v23 name];
          double v49 = [v45 representedString];
          v50 = [v47 stringWithFormat:@"%@/%@", v48, v49];
          [v45 setName:v50];

          [v45 setOverrideDisplayString:0];
          [v125 addObject:v45];
          v51 = [obj firstObject];
          LODWORD(v49) = [v51 isEqualToString:v44];

          if (v49)
          {
            double v52 = +[UIKBTree treeOfType:8];
            [v52 setDisplayType:50];
            [v52 setInteractionType:0];
            v53 = NSString;
            double v54 = [v23 name];
            double v55 = [v53 stringWithFormat:@"%@/Divider", v54];
            [v52 setName:v55];

            [v52 setState:1];
            [v125 addObject:v52];
          }
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v130 objects:v143 count:16];
      }
      while (v41);
    }

    double v56 = [v122 emojiString];
    BOOL v57 = [(UIKeyboardEmojiAndStickerCollectionInputView *)v124 baseStringIsCoupleEmoji:v56];

    if (v57)
    {
      id v58 = (void *)[v23 copy];
      id EMFStringUtilitiesClass_0 = getEMFStringUtilitiesClass_0();
      CGRect v60 = [v122 emojiString];
      CGRect v61 = [EMFStringUtilitiesClass_0 _baseStringForEmojiString:v60];
      [v58 setRepresentedString:v61];

      CGRect v62 = [v58 representedString];
      [v58 setDisplayString:v62];

      [v58 setDisplayType:0];
      double v63 = NSString;
      double v64 = [v23 name];
      double v65 = [v58 representedString];
      double v66 = [v63 stringWithFormat:@"%@/%@", v64, v65];
      [v58 setName:v66];

      [v58 setOverrideDisplayString:0];
      [v125 insertObject:v58 atIndex:0];
    }
    v67 = [v122 emojiString];
    BOOL v68 = [(UIKeyboardEmojiAndStickerCollectionInputView *)v124 skinToneWasUsedForEmoji:v67];

    if (v68)
    {
      uint64_t v134 = 0;
      uint64_t v135 = (uint64_t)&v134;
      uint64_t v136 = 0x2020000000;
      uint64_t v137 = 0x7FFFFFFFFFFFFFFFLL;
      v127[0] = MEMORY[0x1E4F143A8];
      v127[1] = 3221225472;
      v127[2] = __60__UIKeyboardEmojiAndStickerCollectionInputView_treeForCell___block_invoke;
      v127[3] = &unk_1E52F5468;
      id v128 = v122;
      CGRect v129 = &v134;
      [v125 enumerateObjectsUsingBlock:v127];
      [v23 setSelectedVariantIndex:*(void *)(v135 + 24)];

      _Block_object_dispose(&v134, 8);
    }
    uint64_t v69 = [(UIView *)v124 effectiveUserInterfaceLayoutDirection];
    double v70 = UIKBAttributeValueFixedLeftStr;
    if (v69 != 1) {
      double v70 = UIKBAttributeValueFixedRightStr;
    }
    [v23 setVariantPopupBias:*v70];
    [v23 setSubtrees:v125];
    double v71 = [v122 emojiString];
    BOOL v72 = [(UIKeyboardEmojiAndStickerCollectionInputView *)v124 baseStringIsCoupleEmoji:v71];

    v73 = [v122 emojiString];
    if ([(UIKeyboardEmojiAndStickerCollectionInputView *)v124 skinToneWasUsedForEmoji:v73])
    {
      emojiGraphicsTraits = v124->_emojiGraphicsTraits;
      if (emojiGraphicsTraits)
      {
        BOOL v75 = !emojiGraphicsTraits->_isFirstPartyStickers;

        if (v75)
        {
LABEL_29:
          if (v72) {
            uint64_t v76 = 13;
          }
          else {
            uint64_t v76 = 11;
          }
          uint64_t v77 = 4;
LABEL_44:
          [v23 setVariantType:v76];
          [v23 setState:v77];
          double v81 = +[UIKeyboardImpl activeInstance];
          int v82 = [v81 isEmojiPopoverPresented];

          if (v82)
          {
            objc_storeStrong((id *)&v124->_selectedPopupKey, v23);
            v124->_showingVariants = 1;
            v124->_currentVariantRow = 0;
            double v83 = [(UIKeyboardEmojiAndStickerCollectionInputView *)v124 tappedSkinToneEmoji];
            double v84 = (void *)[v83 copy];
            [(UIKeyboardEmojiAndStickerCollectionInputView *)v124 setSelectedIndexPath:v84];
          }
LABEL_47:
          double v85 = v124->_collectionView;
          v86 = [(UIView *)v124 superview];
          -[UIView convertRect:toView:](v85, "convertRect:toView:", v86, v25 + 0.0, v27 + 1.0, v29, v31);
          double v88 = v87;
          double v90 = v89;
          double v92 = v91;
          double v94 = v93;

          if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
            || +[UIKeyboardImpl isFloating])
          {
            [(UIKeyboardEmojiGraphicsTraits *)v124->_emojiGraphicsTraits fakeEmojiKeySize];
            double v104 = v90 - (v103 - v94) * 0.5;
            double v100 = v88 - (v102 - v92) * 0.5 + 0.0;
            double v96 = v102 + 1.0;
            double v101 = v104 + -2.0;
            double v98 = v103 + 3.0;
            v146.origin.double x = v100;
            v146.origin.double y = v104 + -2.0;
            v146.size.double width = v96;
            v146.size.double height = v98;
            double MaxX = CGRectGetMaxX(v146);
            [(UIView *)v124->_collectionView bounds];
            if (MaxX > v106)
            {
              if ([v122 supportsSkinToneVariants])
              {
                double v107 = v124->_emojiGraphicsTraits;
                if (!v107 || !v107->_isFirstPartyStickers)
                {
                  p_collectionView = (id *)&v124->_collectionView;
                  [(UIView *)v124->_collectionView bounds];
                  double v110 = v109;
                  v147.origin.double x = v100;
                  v147.origin.double y = v101;
                  v147.size.double width = v96;
                  v147.size.double height = v98;
                  double v111 = CGRectGetMaxX(v147);
                  [(UIView *)v124->_collectionView bounds];
                  if (v111 - v112 >= 0.0) {
                    double v113 = v111 - v112;
                  }
                  else {
                    double v113 = -(v111 - v112);
                  }
                  id v114 = *p_collectionView;
                  [*p_collectionView contentOffset];
                  double v116 = v115;
                  [*p_collectionView contentOffset];
                  [v114 setContentOffset:1 animated:v116 + v113];
                  double v100 = v110 - v96;
                }
              }
            }
          }
          else
          {
            [(UIKeyboardEmojiGraphicsTraits *)v124->_emojiGraphicsTraits fakeEmojiKeySize];
            double v96 = v95;
            double v98 = v97;
            double v99 = (v97 - v94) * 0.5;
            double v100 = v88 - (v95 - v92) * 0.5;
            double v101 = v90 - v99;
          }
          double v117 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v100, v101, v96, v98, v100, v101, v96, v98);
          [v23 setShape:v117];

          double v118 = [(UIKBKeyView *)v124 key];
          [v23 setParentKey:v118];

          [v23 setObject:v122 forProperty:@"UIKBAssociatedEmoji"];
          goto LABEL_59;
        }
LABEL_40:
        if (v72) {
          uint64_t v76 = 12;
        }
        else {
          uint64_t v76 = 10;
        }
        uint64_t v77 = 16;
        goto LABEL_44;
      }
    }
    else
    {
      double v78 = [(UIKeyboardEmojiAndStickerCollectionInputView *)v124 tappedSkinToneEmoji];
      if ([v78 section]
        || ![(UIKeyboardEmojiAndStickerCollectionInputView *)v124 _userHasSelectedSkinToneEmoji])
      {

        goto LABEL_40;
      }
      double v79 = v124->_emojiGraphicsTraits;
      if (v79)
      {
        BOOL v80 = !v79->_isFirstPartyStickers;

        if (v80) {
          goto LABEL_29;
        }
        goto LABEL_40;
      }
    }
    goto LABEL_29;
  }
  double v23 = 0;
LABEL_59:
  double v33 = v123;
LABEL_60:

  return v23;
}

void __60__UIKeyboardEmojiAndStickerCollectionInputView_treeForCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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
  id v5 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v3, "selectedVariantIndex"));

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

- (id)getIAGenmojiImageTypeFromImageGlyph:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 type];
  uint64_t v5 = [v3 stickerSourceType];

  double v6 = _UISignalAnalyticsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218240;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "getIAGenmojiImageTypeFromImageGlyph type:%lu stickerSourceType:%lu", (uint8_t *)&v9, 0x16u);
  }

  switch(v4)
  {
    case 3:
LABEL_10:
      double v7 = +[_UISignalAnalytics getIAPayloadValueGenmojiImageTypeEmoji];
      break;
    case 2:
LABEL_9:
      double v7 = +[_UISignalAnalytics getIAPayloadValueGenmojiImageTypeMemoji];
      break;
    case 1:
      switch(v5)
      {
        case 1:
          double v7 = +[_UISignalAnalytics getIAPayloadValueGenmojiImageTypeStickers1P];
          break;
        case 3:
          goto LABEL_9;
        case 4:
          goto LABEL_10;
        case 5:
          double v7 = +[_UISignalAnalytics getIAPayloadValueGenmojiImageTypeStickers3P];
          break;
        case 6:
          double v7 = +[_UISignalAnalytics getIAPayloadValueGenmojiImageTypeGenmoji];
          break;
        default:
          goto LABEL_8;
      }
      break;
    default:
LABEL_8:
      double v7 = +[_UISignalAnalytics getIAPayloadValueGenmojiUnspecified];
      break;
  }
  return v7;
}

- (int64_t)didInputSubTree:(id)a3
{
  v57[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  int64_t v5 = [(UIKBKeyView *)&v55 didInputSubTree:v4];
  double v6 = [v4 objectForProperty:@"UIKBAssociatedEmoji"];
  uint64_t v7 = [v4 objectForProperty:@"UIKBAssociatedImageGlyph"];
  double v8 = (void *)v7;
  if (v6)
  {
    if ([v6 supportsSkinToneVariants])
    {
      if ([v4 state] == 16)
      {
        unint64_t v9 = [v4 selectedVariantIndex];
        uint64_t v10 = [v4 subtrees];
        BOOL v11 = v9 < [v10 count];
      }
      else
      {
        BOOL v11 = 0;
      }
      double v52 = v8;
      if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self _userHasSelectedSkinToneEmoji])int64_t v5 = 1; {
      int64_t v54 = v5;
      }
      double v19 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedChildSkinToneEmoji:v4];

      if (v11)
      {
        double v20 = [v4 subtrees];
        double v21 = [v20 objectAtIndex:0];
        double v22 = [v21 representedString];

        double v23 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
        double v24 = [v19 emojiString];
        [v23 updateSkinToneBaseKey:v22 variantUsed:v24];
      }
      collectionView = self->_collectionView;
      double v26 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self tappedSkinToneEmoji];
      double v27 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v26];

      double v28 = [v27 emoji];
      double v29 = [v28 emojiString];
      double v30 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiBaseString:v29];
      double v31 = [v19 emojiString];
      double v32 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiBaseString:v31];
      int v33 = [v30 isEqualToString:v32];

      if (v33)
      {
        [v27 setEmoji:v19];
        if (os_variant_has_internal_diagnostics())
        {
          double v48 = objc_opt_class();
          double v49 = [v19 emojiString];
          objc_msgSend(v27, "setUnreleasedHighlight:", objc_msgSend(v48, "shouldHighlightEmoji:", v49));
        }
      }

      double v8 = v52;
      int64_t v5 = v54;
    }
    else
    {
      double v19 = v6;
    }
    double v34 = +[UIKeyboardInputModeController sharedInputModeController];
    double v35 = [v34 lastUsedInputModeForCurrentContext];
    id v36 = [v35 primaryLanguage];
    uint64_t v37 = [v36 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    if (v37) {
      id v38 = (__CFString *)v37;
    }
    else {
      id v38 = @"en_US";
    }
    v39 = +[UIKeyboardImpl activeInstance];
    int v40 = [v39 isEmojiPopoverVisibleOrDismissing];

    if (!v40) {
      goto LABEL_27;
    }
    uint64_t v41 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiSearchField];
    uint64_t v42 = [v41 text];
    if ([v42 length])
    {
      double v43 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self tappedSkinToneEmoji];
      uint64_t v44 = [v43 section];

      if (!v44)
      {
        double v45 = UIKBAnalyticsEmojiInputTypePopoverSearch;
LABEL_26:
        +[UIKBAnalyticsDispatcher emojiInsertedByMethod:@"Touch" inputType:*v45];
LABEL_27:
        double v46 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
        [v46 emojiUsed:v19 language:v38];

        goto LABEL_28;
      }
    }
    else
    {
    }
    double v45 = UIKBAnalyticsEmojiInputTypePopover;
    goto LABEL_26;
  }
  if (v7)
  {
    v50 = +[_UISignalAnalytics getIASignalGenmojiUsage];
    v51 = +[_UISignalAnalytics getIAPayloadKeyGenmojiImageType];
    v56[0] = v51;
    uint64_t v12 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self getIAGenmojiImageTypeFromImageGlyph:v8];
    v57[0] = v12;
    +[_UISignalAnalytics getIAPayloadKeyGenmojiUsageSource];
    uint64_t v13 = v53 = v5;
    v56[1] = v13;
    double v14 = +[_UISignalAnalytics getIAPayloadValueGenmojiUnspecified];
    v57[1] = v14;
    double v15 = +[_UISignalAnalytics getIAPayloadKeyGenmojiUsageType];
    v56[2] = v15;
    +[_UISignalAnalytics getIAPayloadValueGenmojiUsageTypeTap];
    v17 = double v16 = v8;
    v57[2] = v17;
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
    +[_UISignalAnalytics sendGenmojiSignal:v50 payload:v18];

    double v8 = v16;
    int64_t v5 = v53;

    [(UIKeyboardEmojiAndStickerCollectionInputView *)self insertImageGlyph:v16 dismiss:1];
  }
LABEL_28:
  [v4 setObject:0 forProperty:@"UIKBAssociatedImageGlyph"];
  [v4 setObject:0 forProperty:@"UIKBAssociatedEmoji"];

  return v5;
}

- (void)insertImageGlyph:(id)a3 dismiss:(BOOL)a4
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__UIKeyboardEmojiAndStickerCollectionInputView_insertImageGlyph_dismiss___block_invoke;
    v9[3] = &unk_1E5300E10;
    v9[4] = self;
    BOOL v10 = a4;
    [v6 createUIStickerWithLoadAllRepresentations:1 completionHandler:v9];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__UIKeyboardEmojiAndStickerCollectionInputView_insertImageGlyph_dismiss___block_invoke_2;
    v7[3] = &__block_descriptor_33_e20_v16__0___UISticker_8l;
    BOOL v8 = a4;
    [v6 createUIStickerWithCompletionHandler:v7];
  }
}

void __73__UIKeyboardEmojiAndStickerCollectionInputView_insertImageGlyph_dismiss___block_invoke(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = (void *)MEMORY[0x1E4F28EB8];
    id v4 = a2;
    int64_t v5 = [v3 defaultCenter];
    v10[0] = @"UIEmojiAndStickerShouldInsertNotificationUserInfoSceneKey";
    id v6 = [*(id *)(a1 + 32) window];
    uint64_t v7 = [v6 windowScene];
    v10[1] = @"UIEmojiAndStickerShouldInsertNotificationUserInfoShouldDismissKey";
    v11[0] = v7;
    BOOL v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    v11[1] = v8;
    unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    [v5 postNotificationName:@"UIEmojiAndStickerShouldInsertNotification" object:v4 userInfo:v9];
  }
}

void __73__UIKeyboardEmojiAndStickerCollectionInputView_insertImageGlyph_dismiss___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = (void *)MEMORY[0x1E4F28EB8];
    id v4 = a2;
    int64_t v5 = [v3 defaultCenter];
    BOOL v8 = @"UIEmojiAndStickerShouldInsertNotificationUserInfoShouldDismissKey";
    id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v5 postNotificationName:@"UIEmojiAndStickerShouldInsertNotification" object:v4 userInfo:v7];
  }
}

- (void)shouldDismissModalDisplayView:(id)a3
{
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self _setUserHasSelectedSkinToneEmoji:1];
  id v4 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self completionBlock];
  if (v4)
  {
    int64_t v5 = v4;
    v4[2]();
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self setCompletionBlock:0];
    id v4 = v5;
  }
}

- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5
{
  v82[2] = *MEMORY[0x1E4F143B8];
  id v77 = a4;
  id v8 = a3;
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self setCompletionBlock:a5];
  unint64_t v9 = [MEMORY[0x1E4F1CA48] array];
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
    double v15 = [(UIKBKeyView *)self renderConfig];
    int v75 = [v15 isFloating] ^ 1;
  }
  BOOL v74 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  double v71 = self;
  unint64_t v16 = [(UIView *)self _keyboardOrientation] - 3;
  double v17 = +[UIKeyboardPreferencesController sharedPreferencesController];
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

  double v29 = [MEMORY[0x1E4F5B268] constraintWithItem:v26 attribute:2 relatedBy:0 toItem:v8 attribute:2 multiplier:1.0 constant:0.0];
  [v9 addObject:v29];

  double v30 = [MEMORY[0x1E4F5B268] constraintWithItem:v26 attribute:8 relatedBy:0 toItem:v8 attribute:8 multiplier:v22 constant:0.0];
  [v9 addObject:v30];

  double v31 = objc_alloc_init(UILabel);
  [(UIView *)v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v31 setUserInteractionEnabled:0];
  uint64_t v76 = (void *)v13;
  uint64_t v32 = *(void *)off_1E52D2040;
  v81[0] = *(void *)off_1E52D2048;
  uint64_t v69 = v81[0];
  v81[1] = v32;
  v82[0] = v13;
  int v33 = [off_1E52D39B8 systemFontOfSize:13.0];
  v82[1] = v33;
  v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];

  id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v35 = [getEMFEmojiCategoryClass_2() localizedSkinToneEmojiDescription];
  BOOL v72 = (void *)[v34 initWithString:v35 attributes:v73];

  [(UILabel *)v31 setNumberOfLines:0];
  [(UILabel *)v31 setTextAlignment:1];
  [(UILabel *)v31 setAttributedText:v72];
  [(UIView *)v26 addSubview:v31];
  id v36 = [MEMORY[0x1E4F5B268] constraintWithItem:v31 attribute:9 relatedBy:0 toItem:v26 attribute:9 multiplier:v25 constant:0.0];
  [v9 addObject:v36];

  uint64_t v37 = [MEMORY[0x1E4F5B268] constraintWithItem:v31 attribute:3 relatedBy:0 toItem:v26 attribute:3 multiplier:1.0 constant:0.0];
  [v9 addObject:v37];

  id v38 = [MEMORY[0x1E4F5B268] constraintWithItem:v31 attribute:4 relatedBy:0 toItem:v26 attribute:4 multiplier:1.0 constant:0.0];
  [v9 addObject:v38];

  v39 = (void *)MEMORY[0x1E4F5B268];
  [(UIKeyboardEmojiGraphicsTraits *)v71->_emojiGraphicsTraits alertTextWidth];
  uint64_t v41 = [v39 constraintWithItem:v31 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v40 - v23];
  [v9 addObject:v41];

  uint64_t v42 = objc_alloc_init(UIView);
  [(UIView *)v42 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addSubview:v42];
  double v43 = [MEMORY[0x1E4F5B268] constraintWithItem:v42 attribute:4 relatedBy:0 toItem:v8 attribute:4 multiplier:1.0 constant:0.0];
  [v9 addObject:v43];

  v67 = v42;
  uint64_t v44 = [MEMORY[0x1E4F5B268] constraintWithItem:v42 attribute:8 relatedBy:0 toItem:v8 attribute:8 multiplier:0.086 constant:0.0];
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
  double v48 = _UILocalizedStringInSystemLanguage(@"OK", @"OK");
  BOOL v68 = (void *)[v47 initWithString:v48 attributes:v70];

  [v45 setAttributedTitle:v68 forState:0];
  [v45 addTarget:v71 action:sel_shouldDismissModalDisplayView_ forControlEvents:64];
  [v8 addSubview:v45];
  double v49 = [MEMORY[0x1E4F5B268] constraintWithItem:v45 attribute:9 relatedBy:0 toItem:v8 attribute:9 multiplier:v25 constant:0.0];
  [v9 addObject:v49];

  v50 = [MEMORY[0x1E4F5B268] constraintWithItem:v45 attribute:4 relatedBy:0 toItem:v42 attribute:3 multiplier:1.0 constant:6.0];
  [v9 addObject:v50];

  v51 = [MEMORY[0x1E4F5B268] constraintWithItem:v45 attribute:7 relatedBy:0 toItem:v31 attribute:7 multiplier:1.0 constant:0.0];
  [v9 addObject:v51];

  double v52 = [v77 snapshotViewAfterScreenUpdates:1];

  [v52 setUserInteractionEnabled:0];
  int64_t v53 = [[UIKBEmojiAndStickerSnapshotSizingView alloc] initWithSnapshotView:v52];
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

  BOOL v57 = [MEMORY[0x1E4F5B268] constraintWithItem:v53 attribute:3 relatedBy:0 toItem:v31 attribute:4 multiplier:1.0 constant:v54];
  [v9 addObject:v57];

  id v58 = objc_alloc_init(UILayoutGuide);
  [v8 addLayoutGuide:v58];

  double v59 = [(UILayoutGuide *)v58 topAnchor];
  CGRect v60 = [(UIView *)v53 bottomAnchor];
  CGRect v61 = [v59 constraintEqualToAnchor:v60];
  [v9 addObject:v61];

  CGRect v62 = [(UILayoutGuide *)v58 bottomAnchor];
  double v63 = [v45 topAnchor];
  double v64 = [v62 constraintEqualToAnchor:v63];
  [v9 addObject:v64];

  double v65 = [(UILayoutGuide *)v58 heightAnchor];
  double v66 = [v65 constraintGreaterThanOrEqualToConstant:6.0];
  [v9 addObject:v66];

  [MEMORY[0x1E4F5B268] activateConstraints:v9];
}

- (BOOL)_shouldShowRecentlyUsedMedia
{
  return 0;
}

- (void)didTearDownRecentsViewForKeyboardMediaController:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__UIKeyboardEmojiAndStickerCollectionInputView_didTearDownRecentsViewForKeyboardMediaController___block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __97__UIKeyboardEmojiAndStickerCollectionInputView_didTearDownRecentsViewForKeyboardMediaController___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 642) = 0;
  return result;
}

- (void)didInsertMediaForKeyboardMediaController:(id)a3
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 dismissEmojiPopoverIfNecessaryWithCompletion:0];
}

- (void)didPresentCardForKeyboardMediaController:(id)a3
{
  id v4 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiSearchField];
  int v5 = [v4 isActive];

  if (v5)
  {
    id v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiSearchField];
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

- (BOOL)doesSupportImageGlyph
{
  return self->_imageGlyphDataSource != 0;
}

- (int64_t)numberOfPrefixCategories
{
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph]) {
    return 0;
  }
  imageGlyphDataSource = self->_imageGlyphDataSource;
  return [(STKImageGlyphDataSource *)imageGlyphDataSource emojiCategoryIndex];
}

- (int64_t)numberOfPrefixSections
{
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph]) {
    return 0;
  }
  imageGlyphDataSource = self->_imageGlyphDataSource;
  return [(STKImageGlyphDataSource *)imageGlyphDataSource emojiPrefixSectionCount];
}

- (BOOL)doesShowMemoji
{
  int v3 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph];
  if (v3)
  {
    imageGlyphDataSource = self->_imageGlyphDataSource;
    LOBYTE(v3) = [(STKImageGlyphDataSource *)imageGlyphDataSource canShowMemoji];
  }
  return v3;
}

- (BOOL)doesShowStickers
{
  int v3 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph];
  if (v3)
  {
    imageGlyphDataSource = self->_imageGlyphDataSource;
    LOBYTE(v3) = [(STKImageGlyphDataSource *)imageGlyphDataSource canShowStickers];
  }
  return v3;
}

- (BOOL)isMemojiCategory:(int64_t)a3
{
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph]
    || [(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching])
  {
    return 0;
  }
  imageGlyphDataSource = self->_imageGlyphDataSource;
  return [(STKImageGlyphDataSource *)imageGlyphDataSource isMemojiSection:a3];
}

- (BOOL)isStickersCategory:(int64_t)a3
{
  int v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph];
  if (v5)
  {
    imageGlyphDataSource = self->_imageGlyphDataSource;
    LOBYTE(v5) = [(STKImageGlyphDataSource *)imageGlyphDataSource isStickerSection:a3];
  }
  return v5;
}

- (BOOL)isSearchCategory:(int64_t)a3
{
  BOOL v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching];
  if (v5) {
    LOBYTE(v5) = [(UIKeyboardEmojiAndStickerCollectionInputView *)self numberOfPrefixSections] == a3;
  }
  return v5;
}

- (BOOL)isRecentCategory:(int64_t)a3
{
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }
  imageGlyphDataSource = self->_imageGlyphDataSource;
  return [(STKImageGlyphDataSource *)imageGlyphDataSource isRecentSection:a3];
}

- (BOOL)isEmojiCategory:(int64_t)a3
{
  BOOL v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph];
  BOOL v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearchCategory:a3];
  if (!v5) {
    return !v6;
  }
  if (v6) {
    return 0;
  }
  imageGlyphDataSource = self->_imageGlyphDataSource;
  return [(STKImageGlyphDataSource *)imageGlyphDataSource isEmojiSection:a3];
}

- (int64_t)memojiCategoryIndex
{
  return [(STKImageGlyphDataSource *)self->_imageGlyphDataSource memojiCategoryIndex];
}

- (int64_t)stickersCategoryIndex
{
  return [(STKImageGlyphDataSource *)self->_imageGlyphDataSource stickersCategoryIndex];
}

- (int64_t)recentCategoryIndex
{
  return [(STKImageGlyphDataSource *)self->_imageGlyphDataSource recentCategoryIndex];
}

- (int64_t)emojiCategoryIndex
{
  return [(STKImageGlyphDataSource *)self->_imageGlyphDataSource emojiCategoryIndex];
}

- (int64_t)memojiSectionIndex
{
  v2 = [(STKImageGlyphDataSource *)self->_imageGlyphDataSource indexPathForCategoryIndex:[(UIKeyboardEmojiAndStickerCollectionInputView *)self memojiCategoryIndex]];
  int v3 = v2;
  if (v2) {
    int64_t v4 = [v2 section];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)stickersSectionIndex
{
  int v3 = [(STKImageGlyphDataSource *)self->_imageGlyphDataSource indexPathForCategoryIndex:[(UIKeyboardEmojiAndStickerCollectionInputView *)self stickersCategoryIndex]];
  int64_t v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 section];
  }
  else
  {
    uint64_t v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self numberOfPrefixSections];
    uint64_t v7 = 2;
    if (v6 > 2) {
      uint64_t v7 = v6;
    }
    int64_t v5 = v7 - 2;
  }

  return v5;
}

- (int64_t)recentSectionIndex
{
  int v3 = [(STKImageGlyphDataSource *)self->_imageGlyphDataSource indexPathForCategoryIndex:[(UIKeyboardEmojiAndStickerCollectionInputView *)self recentCategoryIndex]];
  int64_t v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 section];
  }
  else
  {
    uint64_t v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self numberOfPrefixSections];
    if (v6 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v6;
    }
    int64_t v5 = v7 - 1;
  }

  return v5;
}

- (int64_t)emojiSectionIndex
{
  int v3 = [(STKImageGlyphDataSource *)self->_imageGlyphDataSource indexPathForCategoryIndex:[(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiCategoryIndex]];
  int64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 section];
  }
  else {
    uint64_t v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self numberOfPrefixSections];
  }
  int64_t v6 = v5;

  return v6;
}

- (id)recentsIndexPath
{
  v2 = (void *)MEMORY[0x1E4F28D58];
  int64_t v3 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self recentSectionIndex];
  return (id)[v2 indexPathForItem:0 inSection:v3];
}

- (double)categoryHeaderHeight
{
  return 0.0;
}

- (double)categoryHeaderFontSize
{
  return 0.0;
}

- (double)emojiKeyWidth
{
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits emojiKeyWidth];
  double v4 = v3;
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits screenToNativeScaleRatio];
  if (v5 < 1.0) {
    double v5 = 1.0;
  }
  return v4 * v5;
}

- (double)topPadding
{
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph])
  {
    imageGlyphDataSource = self->_imageGlyphDataSource;
    return [(STKImageGlyphDataSource *)imageGlyphDataSource numberOfSections];
  }
  else
  {
    int64_t v6 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
    int64_t v7 = [v6 count];

    if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self showingRecents]) {
      v7 += [(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching];
    }
    return v7;
  }
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = -[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", [v11 section]);
  uint64_t v13 = v11;
  if (!v12)
  {
    if (-[UIKeyboardEmojiAndStickerCollectionInputView isStickersCategory:](self, "isStickersCategory:", [v10 section]))
    {
      uint64_t v13 = v10;
    }
    else
    {
      uint64_t v13 = v9;
    }
  }
  id v14 = v13;

  return v14;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearchCategory:a4]
    && [(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching])
  {
    int64_t v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
    uint64_t v7 = [v6 count];

    if (!v7) {
      return 1;
    }
    unint64_t v8 = [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits prepolulatedRecentCount];
    id v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
    unint64_t v10 = [v9 count];

    if (v10 > v8)
    {
      id v11 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
      unint64_t v8 = [v11 count];
    }
    return v8;
  }
  else if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph])
  {
    imageGlyphDataSource = self->_imageGlyphDataSource;
    return [(STKImageGlyphDataSource *)imageGlyphDataSource numberOfItemsInSection:a4];
  }
  else
  {
    id v14 = +[UIKeyboardEmojiCategory categoryForType:[(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiCategoryTypeForSection:a4]];
    double v15 = [v14 emoji];
    int64_t v16 = [v15 count];

    return v16;
  }
}

- (BOOL)hasVerticalScrolling
{
  return [(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection] == UICollectionViewScrollDirectionVertical;
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
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearchCategory:v6]
    && ![(UIKeyboardEmojiAndStickerCollectionInputView *)self isEmojiCategory:v6])
  {
    uint64_t v32 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self stickerCellForIndexPath:v5];
    goto LABEL_31;
  }
  unint64_t v8 = [(UICollectionView *)self->_collectionView dequeueReusableCellWithReuseIdentifier:@"kEmojiCellIdentifier" forIndexPath:v5];
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearchCategory:v6])
  {
    id v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];

    if (v9)
    {
      id v10 = [(UICollectionView *)self->_collectionView dequeueReusableCellWithReuseIdentifier:@"kEmojiCellIdentifier" forIndexPath:v5];

      id v11 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
      uint64_t v12 = [v11 count];

      if (!v12)
      {
        [v10 setEmoji:0];
        [v10 setNoResultsCell:1];
        goto LABEL_25;
      }
      uint64_t v13 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
      unint64_t v14 = [v13 count];

      if (v7 >= v14)
      {
        [v10 setEmoji:0];
        goto LABEL_25;
      }
      double v15 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
      int64_t v16 = [v15 objectAtIndex:v7];

      if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v16 type];
        if (v17 == 1)
        {
          uint64_t v32 = [(UICollectionView *)self->_collectionView dequeueReusableCellWithReuseIdentifier:@"kStickerCellIdentifier" forIndexPath:v5];
          [v32 setImageGlyph:v16];
          goto LABEL_30;
        }
        if (v17 == 3)
        {
          uint64_t v18 = [v16 toString];
          if (v18)
          {
            double v19 = (void *)v18;
            double v20 = +[UIKeyboardEmoji emojiWithString:withVariantMask:](UIKeyboardEmoji, "emojiWithString:withVariantMask:", v18, +[UIKeyboardEmojiCategory hasVariantsForEmoji:v18]);
            goto LABEL_15;
          }

LABEL_25:
          double v20 = 0;
          goto LABEL_29;
        }
      }
      unint64_t v8 = v10;
LABEL_27:

      double v20 = 0;
LABEL_28:
      id v10 = v8;
      goto LABEL_29;
    }
  }
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph])
  {
    double v24 = +[UIKeyboardEmojiCategory categoryForType:[(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiCategoryTypeForSection:v6]];
    int64_t v16 = [v24 emoji];

    if (v16)
    {
      uint64_t v25 = [v16 objectAtIndex:v7];
      if (v25)
      {
        double v20 = (void *)v25;
        double v26 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
        double v27 = [v20 emojiString];
        double v28 = [v26 lastUsedVariantEmojiForEmojiString:v27];
        [v20 setEmojiString:v28];

LABEL_20:
        [v8 setEmoji:v20];
        [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiKeyWidth];
        [v8 setEmojiFontSize:(uint64_t)v29];
        if (os_variant_has_internal_diagnostics())
        {
          double v30 = objc_opt_class();
          double v31 = [v20 emojiString];
          objc_msgSend(v8, "setUnreleasedHighlight:", objc_msgSend(v30, "shouldHighlightEmoji:", v31));
        }
        goto LABEL_28;
      }
    }
    goto LABEL_27;
  }
  double v21 = [(STKImageGlyphDataSource *)self->_imageGlyphDataSource itemAtIndexPath:v5];
  int64_t v16 = v21;
  if (!v21) {
    goto LABEL_27;
  }
  double v19 = [v21 toString];
  double v22 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  double v23 = [v22 lastUsedVariantEmojiForEmojiString:v19];
  double v20 = +[UIKeyboardEmoji emojiWithString:v19 withVariantMask:v23];

  id v10 = v8;
LABEL_15:

  if (v20)
  {
    unint64_t v8 = v10;
    goto LABEL_20;
  }
LABEL_29:
  id v10 = v10;
  int64_t v16 = v20;
  uint64_t v32 = v10;
LABEL_30:

LABEL_31:
  return v32;
}

- (id)stickerCellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(UICollectionView *)self->_collectionView dequeueReusableCellWithReuseIdentifier:@"kStickerCellIdentifier" forIndexPath:v4];
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph])
  {
    uint64_t v6 = [(STKImageGlyphDataSource *)self->_imageGlyphDataSource itemAtIndexPath:v4];
    [v5 setImageGlyph:v6];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self _updateRearrangeModeForCell:v5 atIndexPath:v4];
  }
  return v5;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (emojiGraphicsTraits && emojiGraphicsTraits->_isFirstPartyStickers && ![v10 section])
  {
    uint64_t v13 = 0;
    goto LABEL_24;
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
  int64_t v18 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiCategoryTypeForSection:v17];
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isMemojiCategory:v17])
  {
    double v19 = @"Memoji";
LABEL_13:
    uint64_t v20 = _UILocalizedStringInSystemLanguage(v19, v19);
    goto LABEL_14;
  }
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isStickersCategory:v17])
  {
    double v19 = @"Stickers";
    goto LABEL_13;
  }
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearchCategory:v17])
  {
    double v19 = @"Results";
    goto LABEL_13;
  }
  uint64_t v20 = +[UIKeyboardEmojiCategory displayName:v18];
LABEL_14:
  double v21 = (void *)v20;
  [v13 setHeaderName:v20];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self categoryHeaderFontSize];
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
LABEL_20:
      uint64_t v29 = +[UIColor colorWithRed:v26 green:v27 blue:v28 alpha:1.0];
      goto LABEL_21;
    }
  }
  else if ((v25 & 1) == 0)
  {
    double v26 = 0.647;
    double v27 = 0.651;
    double v28 = 0.663;
    goto LABEL_20;
  }
  uint64_t v29 = +[UIColor whiteColor];
LABEL_21:
  double v30 = (void *)v29;
  [v13 setHeaderTextColor:v29];

  double v31 = [(UIKBKeyView *)self renderConfig];
  int v32 = [v31 whiteText];
  double v33 = 0.4;
  if (!v32) {
    double v33 = 1.0;
  }
  [v13 setHeaderOpacity:v33];

  id v34 = [(UIKBKeyView *)self renderConfig];
  objc_msgSend(v13, "setUseVibrantBlend:", objc_msgSend(v34, "whiteText"));

LABEL_24:
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
        [(UIKeyboardEmojiAndStickerCollectionInputView *)self categoryHeaderHeight];
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

- (void)deleteImageGlyph:(id)a3 atPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v7];
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __72__UIKeyboardEmojiAndStickerCollectionInputView_deleteImageGlyph_atPath___block_invoke;
    v9[3] = &unk_1E52D9960;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    [v8 performDeleteWithCompletionHandler:v9];

    objc_destroyWeak(&v11);
  }

  objc_destroyWeak(&location);
}

void __72__UIKeyboardEmojiAndStickerCollectionInputView_deleteImageGlyph_atPath___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[103] deleteItem:*(void *)(a1 + 32) completionHandler:&__block_literal_global_247];
}

- (BOOL)showingRecents
{
  return 0;
}

- (int64_t)emojiCategoryTypeForSection:(int64_t)a3
{
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isMemojiCategory:](self, "isMemojiCategory:")) {
    return 13;
  }
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isStickersCategory:a3]) {
    return 14;
  }
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isRecentCategory:a3]) {
    return 0;
  }
  return [(UIKeyboardEmojiAndStickerCollectionInputView *)self translatedEmojiCategoryForSection:a3];
}

- (int64_t)translatedEmojiCategoryForSection:(int64_t)a3
{
  int64_t v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self numberOfPrefixSections];
  int64_t v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self numberOfPrefixCategories];
  return +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:(a3 - v5 + v6) & ~((a3 - v5 + v6) >> 63)];
}

- (int64_t)sectionForCategoryType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 14)
    {
      return [(UIKeyboardEmojiAndStickerCollectionInputView *)self stickersSectionIndex];
    }
    else if (a3 == 13)
    {
      return [(UIKeyboardEmojiAndStickerCollectionInputView *)self memojiSectionIndex];
    }
    else
    {
      unint64_t v5 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:");
      int64_t v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiSectionIndex];
      return v6
           + v5
           - [(UIKeyboardEmojiAndStickerCollectionInputView *)self numberOfPrefixCategories];
    }
  }
  else
  {
    return [(UIKeyboardEmojiAndStickerCollectionInputView *)self recentSectionIndex];
  }
}

- (BOOL)handleKeyEvent:(id)a3
{
  id v4 = a3;
  if ([v4 keyCode])
  {
    unint64_t v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiSearchField];
    int64_t v6 = [v5 markedTextRange];

    if (!v6)
    {
      if (([v4 keyCode] == 44 || objc_msgSend(v4, "keyCode") == 40)
        && [(UIKeyboardEmojiAndStickerCollectionInputView *)self handleSelectionEvent:v4])
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
            if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self handleKeyInputForFamilySelector:v4])
            {
LABEL_13:
              BOOL v7 = 1;
              goto LABEL_4;
            }
          }
          else if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self handleKeyInputForVariantSelector:v4])
          {
            goto LABEL_13;
          }
        }
      }
      BOOL v7 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self handleKeyInputForCollectionViewNavigation:v4];
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
    switch(-[UIKeyboardEmojiAndStickerCollectionInputView keyCodeForCurrentEnvironmentFromKeyCode:](self, "keyCodeForCurrentEnvironmentFromKeyCode:", [v4 keyCode]))
    {
      case 'O':
        if ([(UIKBTree *)self->_selectedPopupKey selectedVariantIndex] == 0x7FFFFFFFFFFFFFFFLL
          || (unint64_t selectedVariant = self->_selectedVariant,
              [(UIKBTree *)self->_selectedPopupKey subtrees],
              int64_t v6 = objc_claimAutoreleasedReturnValue(),
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
        double v21 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
        id v9 = v21;
        selectedPopupKedouble y = self->_selectedPopupKey;
        goto LABEL_26;
      case 'Q':
        id v11 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
        [v11 updateState:2 forKey:self->_selectedPopupKey];

        self->_showingVariants = 0;
        uint64_t v12 = self->_selectedPopupKey;
        self->_selectedPopupKedouble y = 0;

        id v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
        [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateHighlightForIndexPath:v9 scrollIfNeeded:0 animateScroll:0];
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
        double v21 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
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
        id v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
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

- (id)verticalNeighborForIndexPath:(id)a3 up:(BOOL)a4 byPage:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(UICollectionView *)self->_collectionView layoutAttributesForItemAtIndexPath:v8];
  [v9 frame];
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;

  double v18 = v13 + v17 * 0.5;
  [(UIView *)self->_collectionView frame];
  uint64_t v21 = v20;
  if (v6) {
    double v22 = -1.0;
  }
  else {
    double v22 = 1.0;
  }
  if (v5) {
    double v23 = v19;
  }
  else {
    double v23 = v17;
  }
  double v63 = v23;
  double v64 = v15;
  double v24 = v18 + v22 * v19 + v22 * v19;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  double v65 = v11;
  v73.origin.double x = v11;
  v73.origin.double y = v13;
  v73.size.double width = v15;
  v73.size.double height = v17;
  CGRect v74 = CGRectUnion(v73, *(CGRect *)(&v21 - 2));
  double x = v74.origin.x;
  double y = v74.origin.y;
  double width = v74.size.width;
  double height = v74.size.height;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  double v31 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  int v32 = objc_msgSend(v31, "layoutAttributesForElementsInRect:", x, y, width, height);

  uint64_t v33 = [v32 countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    id v35 = 0;
    double v36 = v65 + v64 * 0.5;
    double v37 = v18 + v22 * v63;
    uint64_t v38 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v67 != v38) {
          objc_enumerationMutation(v32);
        }
        double v40 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        [v40 frame];
        if (v41 != v13)
        {
          if (v35)
          {
            [v40 frame];
            double v43 = v42;
            double v45 = v44;
            double v48 = v47 + v46 * 0.5;
            [v35 frame];
            double v53 = v52 + v51 * 0.5;
            double v54 = v37 - v48;
            if (v37 - v48 < 0.0) {
              double v54 = -(v37 - v48);
            }
            double v55 = v37 - v53;
            if (v55 < 0.0) {
              double v55 = -v55;
            }
            double v56 = v54 - v55;
            if (v56 < 0.0) {
              goto LABEL_25;
            }
            double v57 = v49 + v50 * 0.5;
            double v58 = v36 - (v43 + v45 * 0.5);
            if (v58 < 0.0) {
              double v58 = -v58;
            }
            double v59 = v36 - v57;
            if (v59 < 0.0) {
              double v59 = -v59;
            }
            if (v56 == 0.0 && v58 - v59 < 0.0)
            {
LABEL_25:
              id v60 = v40;

              id v35 = v60;
            }
          }
          else
          {
            id v35 = v40;
          }
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v66 objects:v70 count:16];
    }
    while (v34);
  }
  else
  {
    id v35 = 0;
  }

  CGRect v61 = [v35 indexPath];

  return v61;
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
  BOOL v11 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling];
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
  BOOL v14 = !v11;
  if (v11) {
    unsigned int v15 = v9;
  }
  else {
    unsigned int v15 = v13;
  }
  unsigned int v64 = v15;
  if (v11) {
    int v16 = v10;
  }
  else {
    int v16 = v7;
  }
  if (v11) {
    int v17 = v13;
  }
  else {
    int v17 = v9;
  }
  if (v14) {
    int v18 = v10;
  }
  else {
    int v18 = v7;
  }
  double v19 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];

  if (v19)
  {
    int v63 = v17;
    uint64_t v20 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
    NSInteger v21 = [v20 section];

    double v22 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
    unint64_t v23 = [v22 item];
  }
  else
  {
    if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching] && ((v7 | v13) & 1) != 0) {
      goto LABEL_3;
    }
    double v24 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
    uint64_t v25 = [v24 sortedArrayUsingSelector:sel_compare_];

    id v60 = v25;
    uint64_t v26 = [v25 firstObject];
    uint64_t v27 = [v26 section];
    unint64_t v23 = [v26 item];
    int64_t v62 = v27;
    if (!(v27 | v23)) {
      unint64_t v23 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self _shouldShowRecentlyUsedMedia];
    }
    int v61 = v16;
    int v63 = v17;
    if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching])
    {
      double v28 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
      uint64_t v29 = [v28 count];

      double v30 = v60;
      if (!v29) {
        int64_t v62 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self recentSectionIndex] + 1;
      }
    }
    else
    {
      double v30 = v60;
    }
    double v31 = [MEMORY[0x1E4F28D58] indexPathForItem:v23 inSection:v62];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self setSelectedIndexPath:v31];

    NSInteger v21 = v62;
    int v16 = v61;
  }
  NSInteger v32 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:v21];
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph])
  {
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
    int v33 = v18;
    id v35 = v34 = v21;
    -[UIKeyboardEmojiAndStickerCollectionInputView rowsInSection:](self, "rowsInSection:", [v35 section]);

    NSInteger v21 = v34;
    int v18 = v33;
  }
  if (v18)
  {
    if (v19)
    {
      if (v23 >= v32 - 1)
      {
        int v36 = 0;
        if (v21 < [(UICollectionView *)self->_collectionView numberOfSections] - 1)
        {
          unint64_t v23 = 0;
          ++v21;
        }
      }
      else
      {
        int v36 = 0;
        ++v23;
      }
    }
    else
    {
      int v36 = 0;
    }
    char v39 = 1;
    goto LABEL_77;
  }
  if (v63)
  {
    BOOL v37 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self _shouldShowRecentlyUsedMedia];
    if (!v19) {
      goto LABEL_75;
    }
    unint64_t v38 = v21 < 2 && v37;
    if (v23 > v38)
    {
      char v39 = v16;
      int v36 = 0;
      --v23;
LABEL_76:
      unsigned int v64 = 1;
LABEL_77:
      uint64_t v49 = 1;
      goto LABEL_78;
    }
    if (v21 < 1)
    {
LABEL_75:
      char v39 = v16;
      int v36 = 0;
      goto LABEL_76;
    }
    char v39 = v16;
    int v36 = 0;
    unint64_t v23 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:v21 - 1] - 1;
    unsigned int v64 = 1;
    uint64_t v49 = 1;
    --v21;
LABEL_78:
    if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching]
      && v21 == [(UIKeyboardEmojiAndStickerCollectionInputView *)self recentSectionIndex])
    {
      double v50 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
      BOOL v51 = v23 < [v50 count];

      if (v51)
      {
        uint64_t v52 = v21;
      }
      else
      {
        unint64_t v23 = 0;
        uint64_t v52 = 1;
      }
      if ((v51 | v39) & 1) != 0 || ((v64 ^ 1)) {
        goto LABEL_88;
      }
      double v53 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
      unint64_t v23 = [v53 count];

      if (!v23)
      {
        uint64_t v52 = 1;
        goto LABEL_88;
      }
      double v54 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
      unint64_t v23 = [v54 count] - 1;
    }
    uint64_t v52 = v21;
LABEL_88:
    double v55 = [MEMORY[0x1E4F28D58] indexPathForItem:v23 inSection:v52];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateHighlightForIndexPath:v55 scrollIfNeeded:v49 animateScroll:v49 & v36];

    BOOL v5 = 1;
    goto LABEL_4;
  }
  if ((v16 | v64) == 1)
  {
    char v39 = v16;
    int v40 = ![(UIScrollView *)self->_collectionView isScrollAnimating];
    uint64_t v41 = [v4 modifiersEqual:0x100000];
    int v36 = v41 | v40;
    if (v19)
    {
      uint64_t v42 = v41;
      double v43 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];

      if (v43)
      {
        [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
        double v45 = v44 = v21;
        double v46 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self verticalNeighborForIndexPath:v45 up:v64 byPage:v42];

        NSInteger v21 = v44;
        if (v46)
        {
          NSInteger v21 = [v46 section];
          unint64_t v23 = [v46 item];
        }
      }
    }
    goto LABEL_77;
  }
  char v47 = [v4 unmodifiedKeyCodeEquals:43];
  int v48 = [v4 equalsKeyCode:43 modifiers:0x20000];
  if ((v47 & 1) != 0 || v48)
  {
    if (v48)
    {
      if (v21 <= 0)
      {
        char v39 = 0;
        unsigned int v64 = 0;
        int v36 = 0;
        NSInteger v21 = 0;
        unint64_t v23 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self _shouldShowRecentlyUsedMedia];
        goto LABEL_77;
      }
      --v21;
    }
    else
    {
      if (v21 >= [(UICollectionView *)self->_collectionView numberOfSections] - 1)
      {
        NSInteger v21 = [(UICollectionView *)self->_collectionView numberOfSections] - 1;
        char v39 = 0;
        unsigned int v64 = 0;
        int v36 = 0;
        unint64_t v23 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:v21] - 1;
        goto LABEL_77;
      }
      ++v21;
    }
    int64_t v56 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiCategoryTypeForSection:v21];
    double v57 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
    [v57 reloadForCategory:v56 withSender:self];

    double v58 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v21];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateToIndexPath:v58];

    double v59 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
    unint64_t v23 = [v59 lastVisibleFirstEmojiIndex];

    char v39 = 0;
    unsigned int v64 = 0;
    uint64_t v49 = 0;
    int v36 = 0;
    if (!(v23 | v21))
    {
      NSInteger v21 = 0;
      unint64_t v23 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self _shouldShowRecentlyUsedMedia];
    }
    goto LABEL_78;
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
    BOOL v6 = [(UIKBTree *)self->_selectedPopupKey selectedVariantIndices];
    int v7 = (void *)[v6 mutableCopy];

    if (!v7) {
      int v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:&unk_1ED3F0D00];
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

    switch(-[UIKeyboardEmojiAndStickerCollectionInputView keyCodeForCurrentEnvironmentFromKeyCode:](self, "keyCodeForCurrentEnvironmentFromKeyCode:", [v4 keyCode]))
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
          [v7 addObject:&unk_1ED3F5A18];
        }
        ++self->_currentVariantRow;
        double v31 = objc_msgSend(v7, "objectAtIndex:");
        self->_int64_t selectedVariant = [v31 integerValue];

        if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_int64_t selectedVariant = 0;
          int64_t v32 = self->_currentVariantRow;
          int v33 = [NSNumber numberWithInteger:0];
          [v7 replaceObjectAtIndex:v32 withObject:v33];
        }
        [(UIKBTree *)self->_selectedPopupKey setSelectedVariantIndices:v7];
        NSInteger v34 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
        [v34 updateState:16 forKey:self->_selectedPopupKey];

        if (v14 == 1)
        {
          unint64_t v35 = [v7 count];
          int v36 = [(UIKBTree *)self->_selectedPopupKey selectedVariantIndices];
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
          unint64_t v38 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
          [v38 updateState:2 forKey:self->_selectedPopupKey];

          self->_showingVariants = 0;
          selectedPopupKedouble y = self->_selectedPopupKey;
          self->_selectedPopupKedouble y = 0;

          uint64_t v26 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
          [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateHighlightForIndexPath:v26 scrollIfNeeded:0 animateScroll:0];
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
      [v7 addObject:&unk_1ED3F5A18];
      goto LABEL_56;
    }
LABEL_55:
    self->_unint64_t currentVariantRow = 0;
LABEL_56:
    uint64_t v41 = [v7 objectAtIndex:self->_currentVariantRow];
    self->_int64_t selectedVariant = [v41 integerValue];

    if (self->_selectedVariant == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_int64_t selectedVariant = 0;
      int64_t v23 = self->_currentVariantRow;
      double v24 = NSNumber;
LABEL_30:
      uint64_t v25 = objc_msgSend(v24, "numberWithInteger:");
      [v7 replaceObjectAtIndex:v23 withObject:v25];
    }
LABEL_31:
    [(UIKBTree *)self->_selectedPopupKey setSelectedVariantIndices:v7];
    uint64_t v26 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
    [v26 updateState:16 forKey:self->_selectedPopupKey];
LABEL_51:

LABEL_52:
  }

  return v5;
}

- (BOOL)_handleInitialSelectionEvent:(id)a3
{
  id v4 = a3;
  int v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiSearchField];
  BOOL v6 = [v5 text];

  if ([v4 unmodifiedKeyCodeEquals:44] && !objc_msgSend(v6, "length")
    || [v4 unmodifiedKeyCodeEquals:40]
    && [v6 length]
    && ([(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults],
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
    if (-[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia")&& ![v12 section]&& !objc_msgSend(v12, "item"))
    {
      uint64_t v13 = [MEMORY[0x1E4F28D58] indexPathForItem:1 inSection:0];

      int64_t v12 = (void *)v13;
    }
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateHighlightForIndexPath:v12 scrollIfNeeded:0 animateScroll:0];
  }
  else
  {
    if (![v4 unmodifiedKeyCodeEquals:40])
    {
      BOOL v14 = 0;
      goto LABEL_17;
    }
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self setIsSearching:0];
    int v10 = +[UIKeyboardImpl activeInstance];
    [v10 dismissEmojiPopoverIfNecessaryWithCompletion:&__block_literal_global_255];
  }
  BOOL v14 = 1;
LABEL_15:

LABEL_17:
  return v14;
}

void __77__UIKeyboardEmojiAndStickerCollectionInputView__handleInitialSelectionEvent___block_invoke()
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
    int64_t v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
    int v10 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v9];

    uint64_t v11 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedChildSkinToneEmoji:self->_selectedPopupKey];
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
        uint64_t v17 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedChildSkinToneEmoji:self->_selectedPopupKey];

        uint64_t v11 = (void *)v17;
      }
    }
    [(UIKBTree *)self->_selectedPopupKey setObject:v11 forProperty:@"UIKBAssociatedEmoji"];
    [v10 setEmoji:v11];
    int64_t v18 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
    [v18 updateState:2 forKey:self->_selectedPopupKey];

    [(UIKeyboardEmojiAndStickerCollectionInputView *)self didInputSubTree:self->_selectedPopupKey];
    if (v5)
    {
      int64_t v19 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
      [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateHighlightForIndexPath:v19 scrollIfNeeded:0 animateScroll:0];
    }
    else if (!v6)
    {
LABEL_9:

      return v7;
    }
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self insertSelectedEmoji:v11 shouldDismissPopover:v5 ^ 1u];
    goto LABEL_9;
  }
  return v7;
}

- (BOOL)_handleBaseKeySelectionEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 unmodifiedKeyCodeEquals:44];
  int v6 = [v4 equalsKeyCode:44 modifiers:0x80000];
  uint64_t v7 = [v4 unmodifiedKeyCodeEquals:40];
  int v8 = [v4 equalsKeyCode:40 modifiers:0x80000];
  collectionView = self->_collectionView;
  int v10 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
  uint64_t v11 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v10];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
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
        uint64_t v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_handleBaseKeySelectionEvent____s_category_0) + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Memoji cell is selected. Unsupported.", buf, 2u);
        }
      }
      goto LABEL_12;
    }
    uint64_t v13 = [v11 emoji];
    BOOL v14 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self treeForCell:v11];
    if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self keySupportsVariants:v14])
    {
      unint64_t v15 = [(UIKBKeyView *)self factory];
      if ([v15 popupKeyUsesCustomKeyContentView:v14])
      {
        if ([v14 selectedVariantIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {

LABEL_15:
          self->_unint64_t currentVariantRow = 0;
          int64_t v18 = [v14 selectedVariantIndices];
          int64_t v19 = v18;
          if (v18)
          {
            uint64_t v20 = [v18 firstObject];
            uint64_t v21 = [v20 integerValue];

            if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
              int64_t v22 = 0;
            }
            else {
              int64_t v22 = v21;
            }
            self->_int64_t selectedVariant = v22;
          }
          [v11 setSelected:0];
          objc_storeStrong((id *)&self->_selectedPopupKey, v14);
          BOOL v17 = 1;
          self->_showingVariants = 1;
          int64_t v23 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
          [v23 updateState:16 forKey:v14];

          goto LABEL_32;
        }
        char v30 = [v4 modifiersEqual:0x80000];

        if (v30) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      uint64_t v24 = [v14 selectedVariantIndex];
      int v25 = v5 | v7;
      if (v24 != 0x7FFFFFFFFFFFFFFFLL) {
        int v25 = 0;
      }
      if ((v25 | v6 | v8) == 1)
      {
        [v11 setSelected:0];
        if ([v14 selectedVariantIndex] != 0x7FFFFFFFFFFFFFFFLL) {
          self->_int64_t selectedVariant = [v14 selectedVariantIndex];
        }
        objc_storeStrong((id *)&self->_selectedPopupKey, v14);
        BOOL v17 = 1;
        self->_showingVariants = 1;
        uint64_t v26 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
        [v26 updateState:16 forKey:v14];

        goto LABEL_32;
      }
    }
    if (v5)
    {
      uint64_t v27 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
      [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateHighlightForIndexPath:v27 scrollIfNeeded:0 animateScroll:0];

      [(UIKeyboardEmojiAndStickerCollectionInputView *)self insertSelectedEmoji:v13 shouldDismissPopover:0];
      BOOL v17 = 1;
    }
    else if (v7)
    {
      BOOL v17 = 1;
      [(UIKeyboardEmojiAndStickerCollectionInputView *)self insertSelectedEmoji:v13 shouldDismissPopover:1];
    }
    else
    {
      BOOL v17 = 0;
    }
LABEL_32:

    goto LABEL_33;
  }
  if ((v5 | v7) == 1)
  {
    int64_t v12 = [v11 imageGlyph];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self insertImageGlyph:v12 dismiss:v7];
  }
LABEL_12:
  BOOL v17 = 1;
LABEL_33:

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
    int v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];

    if (v5)
    {
      if (self->_showingVariants) {
        BOOL v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self _handleVariantSelectionEvent:v4];
      }
      else {
        BOOL v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self _handleBaseKeySelectionEvent:v4];
      }
    }
    else
    {
      BOOL v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self _handleInitialSelectionEvent:v4];
    }
    BOOL v7 = v6;
  }

  return v7;
}

- (void)updateHighlightForIndexPath:(id)a3 scrollIfNeeded:(BOOL)a4 animateScroll:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v21 = a3;
  int v8 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
  uint64_t v9 = [v8 section];
  uint64_t v10 = [v21 section];

  if (v9 != v10)
  {
    int64_t v11 = -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", [v21 section]);
    int64_t v12 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
    [v12 reloadCategoryForIndexPath:v21 withSender:self];

    uint64_t v13 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
    [v13 reloadForCategory:v11 withSender:self];

    BOOL v14 = +[UIKeyboardEmojiCategory categoryForType:v11];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self setCategory:v14];
  }
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self setSelectedIndexPath:v21];
  uint64_t v15 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", [v21 section]);
  if (v15 > [v21 item])
  {
    collectionView = self->_collectionView;
    BOOL v17 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
    [(UICollectionView *)collectionView selectItemAtIndexPath:v17 animated:0 scrollPosition:0];

    if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self cellShouldScrollWhenSelectedAtIndexPath:v21]&& v6)
    {
      int64_t v18 = self->_collectionView;
      int64_t v19 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
      if ([(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection]) {
        uint64_t v20 = 16;
      }
      else {
        uint64_t v20 = 2;
      }
      [(UICollectionView *)v18 scrollToItemAtIndexPath:v19 atScrollPosition:v20 animated:v5];
    }
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateLastSeenItemForIndexPath:v21];
  }
}

- (void)insertSelectedEmoji:(id)a3 shouldDismissPopover:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self updatePreferencesForSelectedEmoji:v27];
  BOOL v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiSearchInputViewController];
  BOOL v7 = [v6 textDocumentProxy];
  int v8 = [v27 emojiString];
  [v7 insertText:v8];

  uint64_t v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiSearchField];
  uint64_t v10 = [v9 text];

  int64_t v11 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
  uint64_t v12 = [v11 section];

  uint64_t v13 = +[UIKeyboardImpl activeInstance];
  BOOL v14 = v13;
  if (v12)
  {
    uint64_t v15 = UIKBAnalyticsEmojiSelectionMethodReturnKey;
    if (!v4) {
      uint64_t v15 = UIKBAnalyticsEmojiSelectionMethodSpaceBar;
    }
    [v13 insertedEmojiFromPopover:v27 selectionMethod:*v15];
  }
  else
  {
    uint64_t v16 = [v27 emojiString];
    BOOL v17 = UIKBAnalyticsEmojiSelectionMethodReturnKey;
    if (!v4) {
      BOOL v17 = UIKBAnalyticsEmojiSelectionMethodSpaceBar;
    }
    [v14 emojiSearchWillInsertEmoji:v16 forSearchQuery:v10 selectionMethod:*v17 inputType:@"PopoverSearch"];
  }
  int64_t v18 = +[UIKeyboardImpl activeInstance];
  int64_t v19 = [v18 activeLayout];

  uint64_t v20 = [v19 delegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    int64_t v22 = [v27 emojiString];
    int64_t v23 = [v19 createKeyEventForStringAction:v22 forKey:0 inputFlags:0];

    uint64_t v24 = [v19 delegate];
    [v24 handleKeyUIEvent:v23 dismiss:v4];
  }
  if (v4)
  {
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self resetSelectionIfNeeded];
    int v25 = +[UIKeyboardImpl activeInstance];
    [v25 dismissEmojiPopoverIfNecessaryWithCompletion:&__block_literal_global_260_0];
  }
  selectedPopupKedouble y = self->_selectedPopupKey;
  self->_selectedPopupKedouble y = 0;

  self->_showingVariants = 0;
}

void __89__UIKeyboardEmojiAndStickerCollectionInputView_insertSelectedEmoji_shouldDismissPopover___block_invoke()
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
  uint64_t v13 = v9;
  uint64_t v10 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  [v10 emojiUsed:v4 language:v13];

  int64_t v11 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];

  if (v11)
  {
    uint64_t v12 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateLastSeenItemForIndexPath:v12];
  }
}

- (void)updateLastSeenItemForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", [v4 section]));
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self setCategory:v5];

  uint64_t v6 = [v4 item];
  BOOL v7 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
  [v7 setLastVisibleFirstEmojiIndex:v6];

  id v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
  uint64_t v8 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  [v8 setLastViewedCategory:v9];
}

- (void)resetSelectionIfNeeded
{
  double v3 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];

  if (v3)
  {
    collectionView = self->_collectionView;
    int64_t v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self selectedIndexPath];
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
  CGRect v22 = CGRectInset(v21, 0.0, -1.0);
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
  BOOL v4 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiSearchField];
  id v5 = [(UIKBKeyView *)self renderConfig];
  [v4 _setRenderConfig:v5];

  collectionView = self->_collectionView;
  [(UIKeyboardEmojiAndStickerCollectionView *)collectionView setIsInSearchPopover:1];
}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  [v4 changePreferredEmojiSearchInputModeForInputDelegate:v3];
}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self setIsSearching:0];
  [(UIKeyboardEmojiAndStickerCollectionView *)self->_collectionView setIsInSearchPopover:0];
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
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self setIsSearching:0];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self setSearchResults:MEMORY[0x1E4F1CBF0]];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self resetSelectionIfNeeded];
}

- (void)emojiSearchTextFieldDidReset:(id)a3
{
  BOOL v4 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self setIsSearching:0];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self resetSelectionIfNeeded];
  if (v4)
  {
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self setSearchResults:MEMORY[0x1E4F1CBF0]];
    if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self showingRecents])
    {
      collectionView = self->_collectionView;
      v6[4] = self;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke;
      v7[3] = &unk_1E52D9F70;
      void v7[4] = self;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      _DWORD v6[2] = __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_2;
      v6[3] = &unk_1E52DC3A0;
      [(UICollectionView *)collectionView performBatchUpdates:v7 completion:v6];
    }
  }
}

void __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 600);
  id v2 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v1 deleteSections:v2];
}

uint64_t __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_3;
  v2[3] = &unk_1E52D9F70;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v2];
}

uint64_t __77__UIKeyboardEmojiAndStickerCollectionInputView_emojiSearchTextFieldDidReset___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 600) reloadData];
}

- (void)setSearchResults:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self _setRearrangeMode:0];
  BOOL v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching];
  BOOL v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      [(UIKeyboardEmojiAndStickerCollectionInputView *)self setIsSearching:1];
      id v7 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
      uint64_t v8 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self recentsIndexPath];
      [v7 reloadCategoryForIndexPath:v8 withSender:self];

      [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateOffsetForSearchResultsAnimated:1];
    }
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self resetSelectionIfNeeded];
    id v9 = (NSArray *)[v4 copy];
    searchResults = self->_searchResults;
    self->_searchResults = v9;

    int64_t v11 = [(STKImageGlyphDataSource *)self->_imageGlyphDataSource snapshot];
    double v12 = objc_msgSend(NSNumber, "numberWithInt:", -[UIKeyboardEmojiAndStickerCollectionInputView recentSectionIndex](self, "recentSectionIndex"));
    CGFloat v13 = objc_msgSend(NSNumber, "numberWithInt:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiSectionIndex](self, "emojiSectionIndex"));
    v21[0] = v12;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v11 deleteSectionsWithIdentifiers:v14];

    uint64_t v20 = v12;
    CGFloat v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v11 insertSectionsWithIdentifiers:v15 beforeSectionWithIdentifier:v13];

    if ([v4 count])
    {
      uint64_t v16 = objc_msgSend(v4, "bs_compactMap:", &__block_literal_global_268_0);
    }
    else
    {
      CGFloat v19 = @"emoji:::";
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    }
    double v18 = (void *)v16;
    [v11 appendItemsWithIdentifiers:v16 intoSectionWithIdentifier:v12];

    [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateDataSourceWithSnapshot:v11 animated:0];
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateOffsetForSearchResultsAnimated:0];

    goto LABEL_10;
  }
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self setIsSearching:0];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self resetSelectionIfNeeded];
  CGFloat v17 = self->_searchResults;
  self->_searchResults = (NSArray *)MEMORY[0x1E4F1CBF0];

  [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateDataSourceSnapshotAnimated:0];
  if (v6)
  {
    int64_t v11 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
    double v12 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self recentsIndexPath];
    [v11 reloadCategoryForIndexPath:v12 withSender:self];
LABEL_10:
  }
}

id __65__UIKeyboardEmojiAndStickerCollectionInputView_setSearchResults___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 identifier];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self topPadding];
  double v10 = v9;
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self categoryHeaderHeight];
  double v12 = v11;
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isSearching])
  {
    CGFloat v13 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self searchResults];
    if ([v13 count])
    {
    }
    else
    {
      uint64_t v14 = [v8 section];

      if (!v14)
      {
        [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiKeyWidth];
        double v25 = v24;
        [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumInteritemSpacing];
        double v27 = (v25 + v26 + 1.0) * 6.0;
        [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
        double v18 = v27 + v28 + v28;
        [v7 bounds];
        CGFloat v29 = CGRectGetHeight(v40) - v12;
        [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits bottomPadding];
        double v19 = v29 - v30;
        goto LABEL_11;
      }
    }
  }
  if (!-[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia")|| [v8 section]|| objc_msgSend(v8, "item"))
  {
    if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph])
    {
      double v15 = (double)-[UIKeyboardEmojiAndStickerCollectionInputView rowsInSection:](self, "rowsInSection:", [v8 section]);
      [v7 bounds];
      CGFloat v16 = (CGRectGetHeight(v39) - v12) / v15;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits bottomPadding];
      double v18 = v16 - v17 - v10;
      double v19 = v18;
    }
    else
    {
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits emojiKeyWidth];
      double v18 = v20;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits emojiKeyWidth];
      double v19 = v21;
    }
  }
  else
  {
    [v7 bounds];
    double Height = CGRectGetHeight(v41);
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits bottomPadding];
    double v33 = v32;
    if ([(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection])
    {
      double v19 = Height - v12 - v33;
      if (self->_useWideAnimojiCell) {
        double v18 = v19 + v19;
      }
      else {
        double v18 = v19;
      }
    }
    else
    {
      [v7 bounds];
      double Width = CGRectGetWidth(v42);
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewLeftMostPadding];
      double v36 = Width - v35;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewRightMostPadding];
      double v18 = v36 - v37;
      [v7 bounds];
      double v19 = CGRectGetWidth(v43) * 0.166666667;
    }
  }
LABEL_11:

  double v22 = v18;
  double v23 = v19;
  result.CGFloat height = v23;
  result.CGFloat width = v22;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  NSInteger v7 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0, a4);
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits sectionOffset];
  double v9 = v8;
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits bottomPadding];
  double v11 = v10;
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self topPadding];
  double v13 = v12;
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self categoryHeaderHeight];
  double v15 = v14;
  UICollectionViewScrollDirection v16 = [(UICollectionViewFlowLayout *)self->_flowLayout scrollDirection];
  if (a5) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v7 <= 0;
  }
  char v18 = !v17;
  if (v16 == UICollectionViewScrollDirectionVertical)
  {
    if ((v18 & 1) != 0 || a5 == 1 && !v7)
    {
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewLeftMostPadding];
      double v20 = v21;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewRightMostPadding];
      double v11 = v9;
    }
    else
    {
      NSInteger v23 = [(UICollectionView *)self->_collectionView numberOfSections] - 1;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewLeftMostPadding];
      double v20 = v24;
      [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewRightMostPadding];
      if (v23 != a5) {
        double v11 = v9;
      }
    }
    goto LABEL_20;
  }
  if ((v18 & 1) == 0 && (a5 != 1 || v7))
  {
    double v13 = v13 + v15;
    double v20 = 0.0;
    if ([(UICollectionView *)self->_collectionView numberOfSections] - 1 != a5) {
      goto LABEL_21;
    }
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewRightMostPadding];
LABEL_20:
    double v9 = v22;
    goto LABEL_21;
  }
  double v13 = v13 + v15;
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits inputViewLeftMostPadding];
  double v20 = v19;
LABEL_21:
  double v25 = v13;
  double v26 = v20;
  double v27 = v11;
  double v28 = v9;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5
    && [(UIKeyboardEmojiAndStickerCollectionInputView *)self _shouldShowRecentlyUsedMedia])
  {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumInteritemSpacing];
LABEL_6:
    double v11 = v10;
    goto LABEL_7;
  }
  double v11 = 0.0;
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self isMemojiCategory:a5])
  {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5
    && [(UIKeyboardEmojiAndStickerCollectionInputView *)self _shouldShowRecentlyUsedMedia])
  {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumLineSpacing];
LABEL_6:
    double v11 = v10;
    goto LABEL_7;
  }
  double v11 = 0.0;
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self isMemojiCategory:a5])
  {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits minimumInteritemSpacing];
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 willDisplay];
  }
  if (!self->_hasShownAnimojiCell
    && -[UIKeyboardEmojiAndStickerCollectionInputView _shouldShowRecentlyUsedMedia](self, "_shouldShowRecentlyUsedMedia")&& ![v7 item]&& !objc_msgSend(v7, "section"))
  {
    self->_hasShownAnimojiCell = 1;
    ADClientAddValueForScalarKey();
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 didEndDisplaying];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isDraggingInputView = 1;
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self resetSelectionIfNeeded];
}

- (void)scrollViewDidScroll:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self handleScrollViewDynamicPagination:v4];
  if (_UIApplicationIsFirstPartyStickers())
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    char v18 = @"contentOffsetY";
    BOOL v6 = NSNumber;
    [v4 contentOffset];
    id v8 = [v6 numberWithDouble:v7];
    v19[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v5 postNotificationName:@"UIKeyboardEmojiCollectionInputViewDidScroll" object:0 userInfo:v9];
  }
  if (!self->_isRearranging)
  {
    double v10 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
    [v10 deactivateActiveKey];
  }
  double v11 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self currentlyFocusedIndexPath];
  unint64_t v12 = [v11 section];
  if (self->_currentSection != v12)
  {
    unint64_t v13 = v12;
    self->_currentSection = v12;
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self _setRearrangeMode:0];
    if (self->_isDraggingInputView)
    {
      double v14 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
      [v14 reloadCategoryForIndexPath:v11 withSender:self];

      double v15 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
      objc_msgSend(v15, "reloadForCategory:withSender:", -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", v13), self);
    }
  }
  keylineView = self->_keylineView;
  [v4 contentOffset];
  [(UIKeyboardEmojiAndStickerCollectionInputViewKeylineView *)keylineView updateAlphaForScrollDistance:v17];
}

- (void)handleScrollViewDynamicPagination:(id)a3
{
  id v8 = a3;
  id v4 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  if (objc_opt_respondsToSelector())
  {
    [v8 contentOffset];
    id v5 = objc_msgSend(v4, "paginationOriginForCurrentOffset:");
    if (v5)
    {
      [v8 setPagingEnabled:1];
      [v5 CGPointValue];
    }
    else
    {
      [v8 setPagingEnabled:0];
      double v6 = *MEMORY[0x1E4F1DAD8];
      double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    objc_msgSend(v8, "_setPagingOrigin:", v6, v7);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  self->_isDraggingInputView = 1;
  -[UIKeyboardEmojiAndStickerCollectionInputView snappedXOffsetForOffset:scrubbing:](self, "snappedXOffsetForOffset:scrubbing:", 0, a5->x, a4.y);
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
  double v15 = __Block_byref_object_copy__160;
  UICollectionViewScrollDirection v16 = __Block_byref_object_dispose__160;
  id v17 = 0;
  double v7 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  id v8 = objc_msgSend(v7, "layoutAttributesForElementsInRect:", x, y, width, height);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__UIKeyboardEmojiAndStickerCollectionInputView_itemInRect___block_invoke;
  void v11[3] = &unk_1E52FBB40;
  v11[4] = &v12;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __59__UIKeyboardEmojiAndStickerCollectionInputView_itemInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (![v9 representedElementCategory])
  {
    uint64_t v6 = [v9 indexPath];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (int64_t)currentlyFocusedSectionIndex
{
  id v3 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  if (objc_opt_respondsToSelector())
  {
    int64_t v4 = [v3 currentlyFocusedSectionIndex];
  }
  else
  {
    id v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self currentlyFocusedIndexPath];
    int64_t v4 = [v5 section];
  }
  return v4;
}

- (id)currentlyFocusedIndexPath
{
  id v3 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  if (objc_opt_respondsToSelector())
  {
    int64_t v4 = [v3 currentlyFocusedIndexPath];
  }
  else
  {
    int64_t v4 = [MEMORY[0x1E4F28D58] indexPathWithIndex:self->_currentSection];
    id v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self trulyVisibleIndexPaths];
    if ([v5 count])
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", (unint64_t)((2* ((5 * objc_msgSend(v5, "count")) & 0x1FFFFFFFFFFFFFFFuLL)* (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64) >> 2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v7 = [v5 firstObject];
      if ([v7 section] || objc_msgSend(v7, "item"))
      {
        NSInteger v8 = [(UICollectionView *)self->_collectionView numberOfSections] - 1;
        NSInteger v9 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:v8];
        double v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 - 1 inSection:v8];
        double v11 = [v5 lastObject];

        if (v10 == v11)
        {
          uint64_t v12 = [v5 lastObject];

          id v6 = (id)v12;
        }
      }
      else
      {
        double v10 = v6;
        id v6 = v7;
      }

      int64_t v4 = v6;
    }
  }
  return v4;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_isDraggingInputView = 0;
  int64_t v4 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self currentlyFocusedIndexPath];
  id v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self trulyVisibleIndexPaths];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __77__UIKeyboardEmojiAndStickerCollectionInputView_scrollViewDidEndDecelerating___block_invoke;
  v9[3] = &unk_1E5300E78;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "bs_filter:", v9);
  NSInteger v8 = [v7 firstObject];

  [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateLastSeenItemForIndexPath:v8];
}

BOOL __77__UIKeyboardEmojiAndStickerCollectionInputView_scrollViewDidEndDecelerating___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 section];
  return v3 == [*(id *)(a1 + 32) section];
}

- (id)trulyVisibleIndexPaths
{
  [(UIScrollView *)self->_collectionView contentOffset];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  [(UIView *)self->_collectionView bounds];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  double v11 = [(UICollectionView *)self->_collectionView visibleCells];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__UIKeyboardEmojiAndStickerCollectionInputView_trulyVisibleIndexPaths__block_invoke;
  v15[3] = &unk_1E5300EA0;
  v15[5] = v4;
  v15[6] = v6;
  v15[7] = v8;
  v15[8] = v10;
  v15[4] = self;
  uint64_t v12 = objc_msgSend(v11, "bs_compactMap:", v15);
  unint64_t v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_282_5];

  return v13;
}

id __70__UIKeyboardEmojiAndStickerCollectionInputView_trulyVisibleIndexPaths__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  CGRect v8 = CGRectIntersection(v7, *(CGRect *)(a1 + 40));
  if (CGRectIsNull(v8))
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 600) indexPathForCell:v3];
  }

  return v4;
}

uint64_t __70__UIKeyboardEmojiAndStickerCollectionInputView_trulyVisibleIndexPaths__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 section];
  if (v6 == [v5 section])
  {
    uint64_t v7 = [v4 item];
    if (v7 == [v5 item])
    {
      uint64_t v8 = 0;
      goto LABEL_9;
    }
    uint64_t v9 = [v4 item];
    uint64_t v10 = [v5 item];
  }
  else
  {
    uint64_t v9 = [v4 section];
    uint64_t v10 = [v5 section];
  }
  if (v9 < v10) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = 1;
  }
LABEL_9:

  return v8;
}

- (int64_t)indexForPrettyCategoryDisplay:(id)a3
{
  id v4 = a3;
  if (self->_collectionView
    && ([(UIKeyboardEmojiAndStickerCollectionInputView *)self category],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 categoryType],
        v5,
        v7 = -[UIKeyboardEmojiAndStickerCollectionInputView sectionForCategoryType:](self, "sectionForCategoryType:", v6), v7 < -[UICollectionView numberOfSections](self->_collectionView, "numberOfSections"))&& (uint64_t v8 = -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", v7), [v4 lastVisibleFirstEmojiIndex] >= v8))
  {
    int64_t v9 = v8 - 1;
  }
  else
  {
    int64_t v9 = [v4 lastVisibleFirstEmojiIndex];
  }

  return v9;
}

- (int64_t)rowsInSection:(int64_t)a3
{
  if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self doesSupportImageGlyph]) {
    return 4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (![(UIKeyboardEmojiAndStickerCollectionInputView *)self isEmojiCategory:a3])
    {
      if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self isRecentCategory:a3]) {
        return 4;
      }
      else {
        return 3;
      }
    }
    return 4;
  }
  imageGlyphDataSource = self->_imageGlyphDataSource;
  return [(STKImageGlyphDataSource *)imageGlyphDataSource numberOfRowsInSection:a3];
}

- (void)didMoveToWindow
{
  id v2 = self;
  v35.receiver = self;
  v35.super_class = (Class)UIKeyboardEmojiAndStickerCollectionInputView;
  [(UIView *)&v35 didMoveToWindow];
  [(UIView *)v2->_collectionView layoutIfNeeded];
  id v3 = [(UIKeyboardEmojiKeyView *)v2 emojiKeyManager];
  id v4 = [v3 lastViewedCategory];
  p_categordouble y = (id *)&v2->_category;
  objc_storeWeak((id *)&v2->_category, v4);

  uint64_t v6 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
  unint64_t v7 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_category);
  int64_t v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(WeakRetained, "categoryType"));
  char v10 = [v6 containsObject:v9];

  if ((v10 & 1) == 0)
  {
    double v11 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
    uint64_t v12 = [v11 firstObject];
    uint64_t v13 = [v12 integerValue];

    uint64_t v14 = +[UIKeyboardEmojiCategory categoryForType:v13];
    objc_storeWeak(p_category, v14);
  }
  id v15 = objc_loadWeakRetained(p_category);
  v2->_currentSection = -[UIKeyboardEmojiAndStickerCollectionInputView sectionForCategoryType:](v2, "sectionForCategoryType:", [v15 categoryType]);

  UICollectionViewScrollDirection v16 = [(UIView *)v2 window];

  if (v16)
  {
    if (v2->_inputDelegateCanSupportAnimoji
      && !v2->_hasShownAnimojiFirstTimeExperience
      && [(UIKeyboardEmojiAndStickerCollectionInputView *)v2 _shouldShowRecentlyUsedMedia])
    {
      id v17 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    }
    else
    {
      char v18 = [(UIKeyboardEmojiAndStickerCollectionInputView *)v2 category];
      uint64_t v19 = -[UIKeyboardEmojiAndStickerCollectionInputView sectionForCategoryType:](v2, "sectionForCategoryType:", [v18 categoryType]);

      double v20 = (void *)MEMORY[0x1E4F28D58];
      double v21 = [(UIKeyboardEmojiAndStickerCollectionInputView *)v2 category];
      id v17 = objc_msgSend(v20, "indexPathForItem:inSection:", -[UIKeyboardEmojiAndStickerCollectionInputView indexForPrettyCategoryDisplay:](v2, "indexForPrettyCategoryDisplay:", v21), v19);
    }
    double v22 = [(UICollectionView *)v2->_collectionView layoutAttributesForItemAtIndexPath:v17];
    [v22 frame];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;

    if (v2->_hasCompletedInitialDisplay
      && (v36.origin.double x = v24,
          v36.origin.double y = v26,
          v36.size.double width = v28,
          v36.size.double height = v30,
          !CGRectEqualToRect(v36, *MEMORY[0x1E4F1DB28])))
    {
      [(UIKeyboardEmojiAndStickerCollectionInputView *)v2 updateToIndexPath:v17];
      unavailableLaunchPath = [(UIKeyboardEmojiKeyView *)v2 emojiKeyManager];
      [unavailableLaunchPath reloadCategoryForIndexPath:v17 withSender:v2];
    }
    else
    {
      double v31 = v17;
      unavailableLaunchPath = v2->_unavailableLaunchPath;
      v2->_unavailableLaunchPath = v31;
    }
  }
  double v33 = [(UIView *)v2 window];
  if (!v33) {
    id v2 = 0;
  }
  NSInteger v34 = +[UIKeyboardMediaController sharedKeyboardMediaController];
  [v34 setDelegate:v2];
}

- (void)updateToCategory:(int64_t)a3
{
  id v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
  [v5 deactivateActiveKey];

  [(UIKeyboardEmojiAndStickerCollectionInputView *)self resetSelectionIfNeeded];
  uint64_t v6 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
  uint64_t v7 = [v6 categoryType];

  if (v7 == a3)
  {
    if (!a3)
    {
      uint64_t v8 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
      if ([v8 lastVisibleFirstEmojiIndex] == 1)
      {
        int64_t isDraggingInputView = self->_isDraggingInputView;

LABEL_11:
        uint64_t v13 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
        [v13 setLastVisibleFirstEmojiIndex:isDraggingInputView];

        uint64_t v12 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
        goto LABEL_12;
      }
    }
    int64_t isDraggingInputView = 1;
    goto LABEL_11;
  }
  id v49 = +[UIKeyboardEmojiCategory categoryForType:a3];
  char v10 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  objc_msgSend(v49, "setLastVisibleFirstEmojiIndex:", objc_msgSend(v10, "lastVisibleFirstEmojiIndexforCategory:", v49));

  if (!a3 && ![v49 lastVisibleFirstEmojiIndex]) {
    [v49 setLastVisibleFirstEmojiIndex:1];
  }
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self setCategory:v49];
  double v11 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
  int64_t isDraggingInputView = [(UIKeyboardEmojiAndStickerCollectionInputView *)self indexForPrettyCategoryDisplay:v11];

  uint64_t v12 = v49;
LABEL_12:
  id v50 = v12;
  unint64_t v14 = +[UIKeyboardEmojiCategory categoryIndexForCategoryType:](UIKeyboardEmojiCategory, "categoryIndexForCategoryType:", [v12 categoryType]);
  collectionView = self->_collectionView;
  UICollectionViewScrollDirection v16 = [MEMORY[0x1E4F28D58] indexPathForItem:isDraggingInputView inSection:v14];
  id v17 = [(UICollectionView *)collectionView layoutAttributesForItemAtIndexPath:v16];
  [v17 frame];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;

  BOOL v26 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling];
  uint64_t v27 = v19;
  uint64_t v28 = v21;
  uint64_t v29 = v23;
  uint64_t v30 = v25;
  if (v26)
  {
    double MinY = CGRectGetMinY(*(CGRect *)&v27);
    [(UIKeyboardEmojiAndStickerCollectionInputView *)self categoryHeaderHeight];
    double v33 = MinY - v32;
    NSInteger v34 = [(UIKeyboardEmojiAndStickerCollectionView *)self->_collectionView emojiGraphicsTraits];
    [v34 sectionOffset];
    double v36 = v33 - v35;

    [(UIScrollView *)self->_collectionView contentOffset];
    double v38 = v37;
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v27);
    CGRect v40 = [(UIKeyboardEmojiAndStickerCollectionView *)self->_collectionView emojiGraphicsTraits];
    [v40 inputViewLeftMostPadding];
    double v42 = MinX - v41;

    [(UIKeyboardEmojiAndStickerCollectionInputView *)self snappedXOffsetForOffset:0 scrubbing:v42];
    double v38 = v43;
    [(UIScrollView *)self->_collectionView contentOffset];
    double v36 = v44;
  }
  [(UIView *)self->_collectionView bounds];
  double v46 = v45;
  [(UIView *)self->_collectionView bounds];
  -[UIScrollView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", 0, v38, v36, v46);
  long long v47 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self category];
  int v48 = [(UIKeyboardEmojiKeyView *)self emojiKeyManager];
  [v48 setLastViewedCategory:v47];
}

- (void)updateToIndexPath:(id)a3
{
  id v6 = a3;
  [(UIView *)self effectiveUserInterfaceLayoutDirection];
  if (-[UIKeyboardEmojiAndStickerCollectionInputView isEmojiCategory:](self, "isEmojiCategory:", [v6 section])|| -[UIKeyboardEmojiAndStickerCollectionInputView isRecentCategory:](self, "isRecentCategory:", objc_msgSend(v6, "section")))
  {
    uint64_t v4 = 8;
  }
  else
  {
    uint64_t v4 = 32;
  }
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self targetRectForIndexPath:v6 atScrollPosition:v5];
  -[UIScrollView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", 0);
  self->_currentSection = [v6 section];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self updateLastSeenItemForIndexPath:v6];
}

- (CGRect)targetRectForIndexPath:(id)a3 atScrollPosition:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(UICollectionView *)self->_collectionView layoutAttributesForItemAtIndexPath:v6];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v48.origin.double x = v9;
  v48.origin.double y = v11;
  v48.size.double width = v13;
  v48.size.double height = v15;
  if (CGRectEqualToRect(v48, *MEMORY[0x1E4F1DB28]))
  {
    -[UIKeyboardEmojiAndStickerCollectionInputView targetRectForSectionIndex:](self, "targetRectForSectionIndex:", [v6 section]);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
  }
  else
  {
    BOOL v23 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling];
    CGFloat v24 = v9;
    CGFloat v25 = v11;
    CGFloat v26 = v13;
    CGFloat v27 = v15;
    if (v23)
    {
      double MinY = CGRectGetMinY(*(CGRect *)&v24);
      uint64_t v29 = [(UIKeyboardEmojiAndStickerCollectionView *)self->_collectionView emojiGraphicsTraits];
      [v29 sectionOffset];
      double v20 = MinY - v30;

      [(UIScrollView *)self->_collectionView contentOffset];
      double v18 = v31;
    }
    else
    {
      if (a4 == 32)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v24);
        double v33 = [(UIKeyboardEmojiAndStickerCollectionView *)self->_collectionView emojiGraphicsTraits];
        [v33 inputViewRightMostPadding];
        double v35 = MaxX + v34;
        [(UIView *)self->_collectionView bounds];
        double v37 = v35 - v36;
      }
      else
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v24);
        double v33 = [(UIKeyboardEmojiAndStickerCollectionView *)self->_collectionView emojiGraphicsTraits];
        [v33 inputViewLeftMostPadding];
        double v37 = MinX - v39;
      }

      [(UIKeyboardEmojiAndStickerCollectionInputView *)self snappedXOffsetForOffset:0 scrubbing:v37];
      double v18 = v40;
      [(UIScrollView *)self->_collectionView contentOffset];
      double v20 = v41;
    }
    [(UIView *)self->_collectionView bounds];
    double v22 = v42;
    [(UIView *)self->_collectionView bounds];
  }
  double v43 = v16;

  double v44 = v18;
  double v45 = v20;
  double v46 = v22;
  double v47 = v43;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

- (CGRect)targetRectForSectionIndex:(int64_t)a3
{
  uint64_t v4 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  if (objc_opt_respondsToSelector())
  {
    [v4 targetRectForSectionIndex:a3];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)updateOffsetForSearchResultsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hitTestResponder];
  [v5 deactivateActiveKey];

  [(UIKeyboardEmojiAndStickerCollectionInputView *)self resetSelectionIfNeeded];
  if ([(UIView *)self effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft) {
    uint64_t v6 = 32;
  }
  else {
    uint64_t v6 = 8;
  }
  uint64_t v7 = v6 | [(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling];
  collectionView = self->_collectionView;
  id v9 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self recentsIndexPath];
  [(UICollectionView *)collectionView scrollToItemAtIndexPath:v9 atScrollPosition:v7 animated:v3];
}

- (double)pointInScrollingDirection:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling]) {
    return y;
  }
  else {
    return x;
  }
}

- (double)distanceInScrollingDirection:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling]) {
    return height;
  }
  else {
    return width;
  }
}

- (double)scrollingStartPoint
{
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling]) {
    return 0.0;
  }
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  [(UIKeyboardEmojiGraphicsTraits *)emojiGraphicsTraits inputViewLeftMostPadding];
  return result;
}

- (double)scrollingEndPoint
{
  BOOL v3 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling];
  emojiGraphicsTraits = self->_emojiGraphicsTraits;
  if (v3)
  {
    [(UIKeyboardEmojiGraphicsTraits *)emojiGraphicsTraits bottomPadding];
  }
  else
  {
    [(UIKeyboardEmojiGraphicsTraits *)emojiGraphicsTraits inputViewRightMostPadding];
  }
  return result;
}

- (int64_t)updateToCategoryWithOffsetPercentage:(double)a3
{
  [(UIView *)self->_collectionView bounds];
  double Height = CGRectGetHeight(v34);
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self categoryHeaderHeight];
  double v7 = v6;
  double v8 = 0.0;
  double v9 = 0.0;
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self _shouldShowRecentlyUsedMedia])
  {
    if (self->_useWideAnimojiCell) {
      double v9 = Height - v7 + Height - v7;
    }
    else {
      double v9 = Height - v7;
    }
  }
  if ([(UIKeyboardEmojiAndStickerCollectionInputView *)self _shouldShowRecentlyUsedMedia])
  {
    [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits sectionOffset];
    double v8 = v9 + v10 - self->_frameInset;
  }
  [(UIScrollView *)self->_collectionView contentSize];
  -[UIKeyboardEmojiAndStickerCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:");
  double v12 = v11 - v8;
  [(UIView *)self->_collectionView bounds];
  -[UIKeyboardEmojiAndStickerCollectionInputView distanceInScrollingDirection:](self, "distanceInScrollingDirection:", v13, v14);
  double v16 = v15 * 0.5 * round(ceil(v12 / (v15 * 0.5)) * a3);
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self emojiKeyWidth];
  double v18 = v17;
  [(UIKeyboardEmojiGraphicsTraits *)self->_emojiGraphicsTraits columnOffset];
  [(UIKeyboardEmojiAndStickerCollectionInputView *)self snappedXOffsetForOffset:1 scrubbing:(v18 + v19 + v19) * round(v16 / (v18 + v19 + v19))];
  double v21 = v8 + v20;
  BOOL v22 = [(UIKeyboardEmojiAndStickerCollectionInputView *)self hasVerticalScrolling];
  [(UIScrollView *)self->_collectionView contentOffset];
  if (v22) {
    double v25 = v23;
  }
  else {
    double v25 = v21;
  }
  if (!v22) {
    double v21 = v24;
  }
  collectionView = self->_collectionView;
  [(UIView *)collectionView bounds];
  double v28 = v27;
  [(UIView *)self->_collectionView bounds];
  -[UIScrollView scrollRectToVisible:animated:](collectionView, "scrollRectToVisible:animated:", 0, v25, v21, v28);
  uint64_t v29 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
  double v30 = [v29 sortedArrayUsingSelector:sel_compare_];

  if ([v30 count])
  {
    double v31 = [v30 objectAtIndex:0];
    int64_t v32 = -[UIKeyboardEmojiAndStickerCollectionInputView emojiCategoryTypeForSection:](self, "emojiCategoryTypeForSection:", [v31 section]);
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

- (NSArray)searchResults
{
  return self->_searchResults;
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

- (NSIndexPath)unavailableLaunchPath
{
  return self->_unavailableLaunchPath;
}

- (void)setUnavailableLaunchPath:(id)a3
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

- (STKImageGlyphDataSource)imageGlyphDataSource
{
  return self->_imageGlyphDataSource;
}

- (void)setImageGlyphDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_imageGlyphDataSource, 0);
  objc_storeStrong((id *)&self->_unavailableLaunchPath, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_emojiSearchField, 0);
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_destroyWeak((id *)&self->_tappedSkinToneEmoji);
  objc_destroyWeak((id *)&self->_hitTestResponder);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_category);
  objc_storeStrong((id *)&self->_keylineView, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedPopupKey, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_emojiGraphicsTraits, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end