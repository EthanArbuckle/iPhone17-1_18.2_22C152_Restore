@interface ICGalleryAttachmentView
+ (BOOL)collectionViewShouldPeek;
+ (CGSize)sizeOfViewForAttachment:(id)a3 textViewContentWidth:(double)a4 existingView:(id)a5;
+ (double)collectionViewLeftRightMargins;
+ (double)collectionViewMaxHeight;
+ (double)collectionViewMinHeight;
+ (double)collectionViewTopBottomMargins;
+ (double)effectiveAspectRatioForWidth:(double)a3 height:(double)a4;
+ (double)topButtonHeight;
+ (id)subAttachmentItemsForGalleryAttachment:(id)a3;
+ (id)titleForGalleryAttachment:(id)a3;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldAddMenuLongPressGesture;
- (BOOL)shouldAddTapGesture;
- (BOOL)updateItems;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (ICAttachmentPresenter)iPhoneSystemPaperAttachmentPresenter;
- (ICCollapsibleActivityView)activityView;
- (ICGalleryAttachmentEditorController)galleryEditorController;
- (ICGalleryAttachmentViewCollectionViewLayout)collectionViewLayout;
- (ICThumbnailDataCache)collectionViewCache;
- (NSArray)subAttachmentItems;
- (NSIndexPath)indexPathForPreviewing;
- (NSIndexPath)indexPathForZoomTransition;
- (NSIndexPath)movingIndexPath;
- (NSObject)attachmentDidLoadObserver;
- (NSObject)previewImagesDidUpdateObserver;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UILabel)titleLabel;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)collectionViewItemHeight;
- (double)galleryAttachmentViewItemHeight;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4;
- (id)attachmentPresenter:(id)a3 transitionViewForIndexPath:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForItemClosestToPoint:(CGPoint)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)dealloc;
- (void)didChangeAttachmentTitle;
- (void)didChangeMergeableData;
- (void)didTapTopOfGalleryView:(id)a3;
- (void)didUpdatePreviewImages;
- (void)didUpdateSubAttachmentAtIndex:(int64_t)a3 sizeDidChange:(BOOL)a4;
- (void)didUpdateSubAttachmentItems;
- (void)galleryAttachmentEditorControllerDeleteAttachment;
- (void)galleryAttachmentEditorControllerDidDismiss;
- (void)handleDeleteAttachmentFromPresenter:(id)a3;
- (void)invalidateCollectionViewLayout;
- (void)invalidateCollectionViewLayoutWithNewItemHeight:(double)a3;
- (void)openAttachment;
- (void)openAttachmentAtIndex:(unint64_t)a3;
- (void)respondToLongPressReorderingGesture:(id)a3;
- (void)scrollCollectionViewToIndexPath:(id)a3;
- (void)setActivityView:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAttachmentDidLoadObserver:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewCache:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGalleryEditorController:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setIPhoneSystemPaperAttachmentPresenter:(id)a3;
- (void)setIndexPathForPreviewing:(id)a3;
- (void)setIndexPathForZoomTransition:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setMovingIndexPath:(id)a3;
- (void)setPreviewImagesDidUpdateObserver:(id)a3;
- (void)setSubAttachmentItems:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupCollectionViewIfNecessary;
- (void)updateActivityView;
- (void)updateAttachmentTitleLabel;
- (void)updateItemForObjectID:(id)a3;
- (void)updateItemsAndLayout;
@end

@implementation ICGalleryAttachmentView

- (void)dealloc
{
  v3 = [(ICGalleryAttachmentView *)self attachmentDidLoadObserver];

  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    v5 = [(ICGalleryAttachmentView *)self attachmentDidLoadObserver];
    [v4 removeObserver:v5];

    [(ICGalleryAttachmentView *)self setAttachmentDidLoadObserver:0];
  }
  v6 = [(ICGalleryAttachmentView *)self previewImagesDidUpdateObserver];

  if (v6)
  {
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    v8 = [(ICGalleryAttachmentView *)self previewImagesDidUpdateObserver];
    [v7 removeObserver:v8];

    [(ICGalleryAttachmentView *)self setPreviewImagesDidUpdateObserver:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)ICGalleryAttachmentView;
  [(ICAttachmentView *)&v9 dealloc];
}

+ (double)effectiveAspectRatioForWidth:(double)a3 height:(double)a4
{
  double result = 0.75;
  if (a3 != 0.0 && a4 != 0.0)
  {
    double result = a3 / a4;
    if (a3 / a4 < *MEMORY[0x263F5B0B8]) {
      double result = *MEMORY[0x263F5B0B8];
    }
    if (result >= *MEMORY[0x263F5B0B0]) {
      return *MEMORY[0x263F5B0B0];
    }
  }
  return result;
}

+ (CGSize)sizeOfViewForAttachment:(id)a3 textViewContentWidth:(double)a4 existingView:(id)a5
{
  id v8 = a3;
  objc_super v9 = [a5 subAttachmentItems];
  if (!v9)
  {
    objc_super v9 = [a1 subAttachmentItemsForGalleryAttachment:v8];
  }
  double v10 = floor(a4);
  [a1 collectionViewLeftRightMargins];
  double v12 = v11;
  [a1 topButtonHeight];
  double v14 = v13;
  [a1 collectionViewTopBottomMargins];
  double v16 = v15;
  uint64_t v17 = [v9 count];
  if (v10 <= 0.0 || v17 == 0)
  {
    double v19 = 160.0;
    double v20 = 160.0;
  }
  else
  {
    [a1 collectionViewLeftRightMargins];
    double v22 = v21;
    [a1 collectionViewLeftRightMargins];
    double v24 = v23;
    v25 = [v9 firstObject];
    [v25 size];
    double v27 = v26;
    [v25 size];
    [(id)objc_opt_class() effectiveAspectRatioForWidth:v28 height:v27];
    double v30 = v29;
    [a1 collectionViewMaxHeight];
    if (v27 >= v31) {
      double v27 = v31;
    }
    [a1 collectionViewMinHeight];
    if (v27 < v32) {
      double v27 = v32;
    }
    int v33 = [a1 collectionViewShouldPeek];
    uint64_t v34 = [v9 count];
    if (v33 && ((unint64_t v35 = v34, v36 = objc_msgSend(MEMORY[0x263F82670], "ic_isiPad"), v10 < 500.0) || !v36))
    {
      double v39 = v12 + v12;
      double v40 = v10 + v24 * -2.0;
      double v41 = round(v30 * v27);
      uint64_t v42 = 2;
      if (v35 < 2) {
        uint64_t v42 = v35;
      }
      if (v10 <= 640.0) {
        unint64_t v43 = v35 != 0;
      }
      else {
        unint64_t v43 = v42;
      }
      if (v43 >= 2)
      {
        for (uint64_t i = 1; i != v43; ++i)
        {
          double v39 = v22 + v39;
          double v40 = v40 - v22;
          v45 = [v9 objectAtIndexedSubscript:i];
          [v45 size];
          double v47 = v46;
          [v45 size];
          objc_msgSend(a1, "effectiveAspectRatioForWidth:height:", v47);
          double v41 = v41 + round(v27 * v48);
        }
      }
      double v49 = 2.0;
      if (v41 >= 160.0) {
        double v50 = v41;
      }
      else {
        double v50 = 160.0;
      }
      if (v50 > v40)
      {
        if (v35 >= v43) {
          unint64_t v51 = v43;
        }
        else {
          unint64_t v51 = v35;
        }
        if (v51)
        {
          uint64_t v52 = 0;
          double v53 = 0.0;
          do
          {
            v54 = [v9 objectAtIndexedSubscript:v52];
            [v54 size];
            double v56 = v55;
            [v54 size];
            objc_msgSend(a1, "effectiveAspectRatioForWidth:height:", v56);
            double v53 = v53 + v57;

            ++v52;
          }
          while (v51 != v52);
        }
        else
        {
          double v53 = 0.0;
        }
        double v27 = round(v40 / v53);
        double v50 = v40;
        double v49 = 2.0;
      }
      double v58 = v14 + v16 * v49;
      if (v35 <= v43 || (double v50 = v22 + 50.0 + v50, v50 <= v40)) {
        double v40 = v50;
      }
      else {
        double v27 = round(v40 / (v50 / v27));
      }
      double v20 = v39 + v40;
      double v19 = v58 + v27;
    }
    else
    {
      [MEMORY[0x263F5B318] sizeOfViewForAttachment:v8 textViewContentWidth:v10];
      double v20 = v37;
      double v19 = v38;
    }
  }
  double v59 = v20;
  double v60 = v19;
  result.height = v60;
  result.width = v59;
  return result;
}

+ (id)titleForGalleryAttachment:(id)a3
{
  id v3 = a3;
  v4 = [v3 title];
  if ([v4 length]) {
    [v3 title];
  }
  else {
  v5 = [v3 defaultTitle];
  }

  if ([v3 needsInitialFetchFromCloud])
  {
    v6 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"Downloading…" value:&stru_26C10E100 table:0];

    v5 = (void *)v7;
  }

  return v5;
}

- (double)collectionViewItemHeight
{
  [(ICGalleryAttachmentView *)self bounds];
  double v3 = v2;
  [(id)objc_opt_class() collectionViewTopBottomMargins];
  double v5 = v4;
  [(id)objc_opt_class() topButtonHeight];
  return fmax(v3 - (v6 + v5 * 2.0), 16.0);
}

- (void)invalidateCollectionViewLayout
{
  [(ICGalleryAttachmentView *)self collectionViewItemHeight];

  [(ICGalleryAttachmentView *)self invalidateCollectionViewLayoutWithNewItemHeight:"invalidateCollectionViewLayoutWithNewItemHeight:"];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(ICGalleryAttachmentView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)ICGalleryAttachmentView;
  -[ICGalleryAttachmentView setFrame:](&v14, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(ICGalleryAttachmentView *)self invalidateCollectionViewLayout];
  }
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  if (!CGRectIsNull(v15))
  {
    v16.origin.double x = x;
    v16.origin.double y = y;
    v16.size.double width = width;
    v16.size.double height = height;
    if (!CGRectIsInfinite(v16))
    {
      double v13 = [(ICGalleryAttachmentView *)self attachment];

      if (v13) {
        [(ICGalleryAttachmentView *)self setupCollectionViewIfNecessary];
      }
    }
  }
}

- (void)setAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [(ICGalleryAttachmentView *)self attachment];

  if (v5 != v4)
  {
    v23.receiver = self;
    v23.super_class = (Class)ICGalleryAttachmentView;
    [(ICGalleryAttachmentView *)&v23 setAttachment:v4];
    [(ICGalleryAttachmentView *)self invalidateCollectionViewLayout];
    double v6 = [(ICGalleryAttachmentView *)self attachmentDidLoadObserver];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
      double v8 = [(ICGalleryAttachmentView *)self attachmentDidLoadObserver];
      [v7 removeObserver:v8];

      [(ICGalleryAttachmentView *)self setAttachmentDidLoadObserver:0];
    }
    double v9 = [(ICGalleryAttachmentView *)self previewImagesDidUpdateObserver];

    if (v9)
    {
      double v10 = [MEMORY[0x263F08A00] defaultCenter];
      double v11 = [(ICGalleryAttachmentView *)self previewImagesDidUpdateObserver];
      [v10 removeObserver:v11];

      [(ICGalleryAttachmentView *)self setPreviewImagesDidUpdateObserver:0];
    }
    if (v4)
    {
      [(ICGalleryAttachmentView *)self updateItems];
      objc_initWeak(&location, self);
      double v12 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v13 = *MEMORY[0x263F5A948];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __41__ICGalleryAttachmentView_setAttachment___block_invoke;
      v20[3] = &unk_2640B80F0;
      objc_copyWeak(&v21, &location);
      objc_super v14 = [v12 addObserverForName:v13 object:0 queue:0 usingBlock:v20];
      [(ICGalleryAttachmentView *)self setAttachmentDidLoadObserver:v14];

      CGRect v15 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v16 = *MEMORY[0x263F5A978];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __41__ICGalleryAttachmentView_setAttachment___block_invoke_2;
      v18[3] = &unk_2640B80F0;
      objc_copyWeak(&v19, &location);
      uint64_t v17 = [v15 addObserverForName:v16 object:0 queue:0 usingBlock:v18];
      [(ICGalleryAttachmentView *)self setPreviewImagesDidUpdateObserver:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __41__ICGalleryAttachmentView_setAttachment___block_invoke(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_opt_class();
  id v4 = [v3 object];

  id v5 = ICCheckedDynamicCast();
  [WeakRetained updateItemForObjectID:v5];
}

void __41__ICGalleryAttachmentView_setAttachment___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_opt_class();
  id v4 = [v3 object];

  id v5 = ICCheckedDynamicCast();
  [WeakRetained updateItemForObjectID:v5];
}

- (void)setHighlightColor:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICGalleryAttachmentView;
  id v4 = a3;
  [(ICGalleryAttachmentView *)&v10 setHighlightColor:v4];
  if (v4) {
    double v5 = *MEMORY[0x263F5B058];
  }
  else {
    double v5 = 0.0;
  }
  double v6 = [(ICGalleryAttachmentView *)self layer];
  [v6 setBorderWidth:v5];

  id v7 = v4;
  uint64_t v8 = [v7 CGColor];

  double v9 = [(ICGalleryAttachmentView *)self layer];
  [v9 setBorderColor:v8];
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICGalleryAttachmentView;
  [(ICGalleryAttachmentView *)&v4 setHighlightPatternRegexFinder:a3];
  [(ICGalleryAttachmentView *)self updateAttachmentTitleLabel];
}

+ (id)subAttachmentItemsForGalleryAttachment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  objc_super v4 = [v3 attachmentModel];
  double v5 = ICCheckedDynamicCast();

  double v6 = (void *)MEMORY[0x263EFF980];
  id v7 = [v3 subAttachments];
  uint64_t v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  CGRect v15 = __66__ICGalleryAttachmentView_subAttachmentItemsForGalleryAttachment___block_invoke;
  uint64_t v16 = &unk_2640B8118;
  id v17 = v3;
  id v18 = v8;
  id v9 = v8;
  id v10 = v3;
  [v5 enumerateSubAttachmentsWithBlock:&v13];
  double v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v11;
}

void __66__ICGalleryAttachmentView_subAttachmentItemsForGalleryAttachment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = [ICGalleryAttachmentViewSubAttachmentItem alloc];
  double v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v7 = [(ICGalleryAttachmentViewSubAttachmentItem *)v5 initWithAttachmentIdentifier:v4 context:v6];

  [*(id *)(a1 + 40) addObject:v7];
}

- (BOOL)updateItems
{
  id v3 = objc_opt_class();
  id v4 = [(ICGalleryAttachmentView *)self attachment];
  double v5 = [v3 subAttachmentItemsForGalleryAttachment:v4];

  double v6 = [(ICGalleryAttachmentView *)self subAttachmentItems];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0) {
    [(ICGalleryAttachmentView *)self setSubAttachmentItems:v5];
  }

  return v7 ^ 1;
}

- (void)didChangeMergeableData
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICGalleryAttachmentView_didChangeMergeableData__block_invoke;
  block[3] = &unk_2640B8140;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__ICGalleryAttachmentView_didChangeMergeableData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateItemsAndLayout];
}

- (void)didUpdatePreviewImages
{
  v3.receiver = self;
  v3.super_class = (Class)ICGalleryAttachmentView;
  [(ICGalleryAttachmentView *)&v3 didUpdatePreviewImages];
  [(ICGalleryAttachmentView *)self didChangeSize];
}

- (void)updateItemsAndLayout
{
  if ([(ICGalleryAttachmentView *)self updateItems])
  {
    [(ICGalleryAttachmentView *)self didUpdateSubAttachmentItems];
    [(ICGalleryAttachmentView *)self didChangeSize];
  }
}

- (void)updateItemForObjectID:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x263F5AB78];
  double v6 = [(ICGalleryAttachmentView *)self attachment];
  char v7 = [v6 managedObjectContext];
  uint64_t v8 = objc_msgSend(v5, "ic_existingObjectWithID:context:", v4, v7);

  id v9 = [v8 parentAttachment];
  id v10 = [(ICGalleryAttachmentView *)self attachment];

  if (v9 == v10)
  {
    double v11 = [(ICGalleryAttachmentView *)self subAttachmentItems];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = [(ICGalleryAttachmentView *)self subAttachmentItems];
        CGRect v15 = [v14 objectAtIndexedSubscript:v13];

        uint64_t v16 = [v15 attachment];

        if (v16 == v8) {
          break;
        }

        ++v13;
        id v17 = [(ICGalleryAttachmentView *)self subAttachmentItems];
        unint64_t v18 = [v17 count];

        if (v13 >= v18) {
          goto LABEL_2;
        }
      }
      id v19 = [v8 managedObjectContext];
      objc_msgSend(v19, "ic_refreshObject:mergeChanges:", v8, 0);

      char v20 = [v15 updateSize];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__ICGalleryAttachmentView_updateItemForObjectID___block_invoke;
      block[3] = &unk_2640B7F68;
      char v22 = v20;
      block[4] = self;
      void block[5] = v13;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
LABEL_2:
}

uint64_t __49__ICGalleryAttachmentView_updateItemForObjectID___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) didChangeSize];
    BOOL v2 = *(unsigned char *)(a1 + 48) != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 didUpdateSubAttachmentAtIndex:v4 sizeDidChange:v2];
}

- (NSArray)subAttachmentItems
{
  return self->_subAttachmentItems;
}

- (void)setSubAttachmentItems:(id)a3
{
}

- (NSObject)attachmentDidLoadObserver
{
  return self->_attachmentDidLoadObserver;
}

- (void)setAttachmentDidLoadObserver:(id)a3
{
}

- (NSObject)previewImagesDidUpdateObserver
{
  return self->_previewImagesDidUpdateObserver;
}

- (void)setPreviewImagesDidUpdateObserver:(id)a3
{
}

- (NSIndexPath)indexPathForPreviewing
{
  return self->_indexPathForPreviewing;
}

- (void)setIndexPathForPreviewing:(id)a3
{
}

- (ICGalleryAttachmentViewCollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (ICCollapsibleActivityView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (ICThumbnailDataCache)collectionViewCache
{
  return self->_collectionViewCache;
}

- (void)setCollectionViewCache:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (NSIndexPath)movingIndexPath
{
  return self->_movingIndexPath;
}

- (void)setMovingIndexPath:(id)a3
{
}

- (NSIndexPath)indexPathForZoomTransition
{
  return self->_indexPathForZoomTransition;
}

- (void)setIndexPathForZoomTransition:(id)a3
{
}

- (ICGalleryAttachmentEditorController)galleryEditorController
{
  return self->_galleryEditorController;
}

- (void)setGalleryEditorController:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (ICAttachmentPresenter)iPhoneSystemPaperAttachmentPresenter
{
  return self->_iPhoneSystemPaperAttachmentPresenter;
}

- (void)setIPhoneSystemPaperAttachmentPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iPhoneSystemPaperAttachmentPresenter, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_galleryEditorController, 0);
  objc_storeStrong((id *)&self->_indexPathForZoomTransition, 0);
  objc_storeStrong((id *)&self->_movingIndexPath, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collectionViewCache, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_indexPathForPreviewing, 0);
  objc_storeStrong((id *)&self->_previewImagesDidUpdateObserver, 0);
  objc_storeStrong((id *)&self->_attachmentDidLoadObserver, 0);

  objc_storeStrong((id *)&self->_subAttachmentItems, 0);
}

+ (double)topButtonHeight
{
  return 21.0;
}

+ (double)collectionViewMinHeight
{
  return 200.0;
}

+ (double)collectionViewMaxHeight
{
  return 456.0;
}

+ (double)collectionViewLeftRightMargins
{
  return 9.0;
}

+ (double)collectionViewTopBottomMargins
{
  return 9.0;
}

+ (BOOL)collectionViewShouldPeek
{
  return 1;
}

- (BOOL)shouldAddTapGesture
{
  return 0;
}

- (BOOL)shouldAddMenuLongPressGesture
{
  return 1;
}

- (void)openAttachment
{
  objc_super v3 = [(ICGalleryAttachmentView *)self indexPathForPreviewing];
  if (v3)
  {
    uint64_t v4 = [(ICGalleryAttachmentView *)self indexPathForPreviewing];
    unint64_t v5 = [v4 row];
    double v6 = [(ICGalleryAttachmentView *)self subAttachmentItems];
    unint64_t v7 = [v6 count];

    if (v5 >= v7)
    {
      objc_super v3 = 0;
    }
    else
    {
      uint64_t v8 = [(ICGalleryAttachmentView *)self indexPathForPreviewing];
      objc_super v3 = (void *)[v8 row];

      [(ICGalleryAttachmentView *)self setIndexPathForPreviewing:0];
    }
  }

  [(ICGalleryAttachmentView *)self openAttachmentAtIndex:v3];
}

- (id)indexPathForItemClosestToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v36 = *MEMORY[0x263EF8340];
  double v6 = [(ICGalleryAttachmentView *)self collectionView];
  unint64_t v7 = objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);

  if (!v7)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [(ICGalleryAttachmentView *)self collectionView];
    id v9 = [v8 indexPathsForVisibleItems];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v7 = 0;
      uint64_t v12 = *(void *)v32;
      double v13 = INFINITY;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          CGRect v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v16 = [(ICGalleryAttachmentView *)self collectionView];
          id v17 = [v16 cellForItemAtIndexPath:v15];

          [v17 bounds];
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;
          double v26 = [(ICGalleryAttachmentView *)self collectionView];
          objc_msgSend(v17, "convertRect:toView:", v26, v19, v21, v23, v25);

          TSDDistanceToRect();
          if (v27 < v13)
          {
            double v28 = v27;
            id v29 = v15;

            double v13 = v28;
            unint64_t v7 = v29;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v11);
    }
    else
    {
      unint64_t v7 = 0;
    }
  }

  return v7;
}

- (void)invalidateCollectionViewLayoutWithNewItemHeight:(double)a3
{
  unint64_t v5 = [(ICGalleryAttachmentView *)self collectionViewLayout];
  [v5 itemHeight];
  double v7 = v6;

  double v8 = round(a3);
  if (v8 - v7 >= 0.0) {
    double v9 = v8 - v7;
  }
  else {
    double v9 = -(v8 - v7);
  }
  uint64_t v10 = [(ICGalleryAttachmentView *)self collectionViewLayout];
  [v10 invalidateLayoutWithNewItemHeight:v8];

  if (v7 == 0.0 || v9 > 20.0)
  {
    uint64_t v12 = [(ICGalleryAttachmentView *)self galleryAttachmentViewCellImageCache];
    [v12 removeAllThumbnailData];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __106__ICGalleryAttachmentView_PlatformSpecificResponsibilty__invalidateCollectionViewLayoutWithNewItemHeight___block_invoke;
    block[3] = &unk_2640B8140;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __106__ICGalleryAttachmentView_PlatformSpecificResponsibilty__invalidateCollectionViewLayoutWithNewItemHeight___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];

  id v5 = [*(id *)(a1 + 32) collectionView];
  objc_super v3 = [*(id *)(a1 + 32) collectionView];
  uint64_t v4 = [v3 indexPathsForVisibleItems];
  [v5 reloadItemsAtIndexPaths:v4];
}

- (void)setupCollectionViewIfNecessary
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    [(ICGalleryAttachmentView *)self setOverrideUserInterfaceStyle:1];
  }
  id v78 = [MEMORY[0x263EFF980] array];
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    [MEMORY[0x263F825C8] secondarySystemFillColor];
  }
  else {
  objc_super v3 = [MEMORY[0x263F825C8] systemFillColor];
  }
  [(ICGalleryAttachmentView *)self setBackgroundColor:v3];

  uint64_t v4 = [(ICGalleryAttachmentView *)self titleLabel];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F828E0]);
    [(ICGalleryAttachmentView *)self setTitleLabel:v5];

    double v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
    double v7 = [(ICGalleryAttachmentView *)self titleLabel];
    [v7 setTextColor:v6];

    double v8 = [MEMORY[0x263F81708] systemFontOfSize:14.0 weight:*MEMORY[0x263F81840]];
    double v9 = objc_msgSend(v8, "ic_fontWithSingleLineA");
    uint64_t v10 = [(ICGalleryAttachmentView *)self titleLabel];
    [v10 setFont:v9];

    uint64_t v11 = [(ICGalleryAttachmentView *)self titleLabel];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v12 = [(ICGalleryAttachmentView *)self titleLabel];
    [v12 setUserInteractionEnabled:0];

    double v13 = [(ICGalleryAttachmentView *)self titleLabel];
    [(ICGalleryAttachmentView *)self addSubview:v13];

    id v14 = objc_alloc_init(MEMORY[0x263F5B2F8]);
    [(ICGalleryAttachmentView *)self setActivityView:v14];

    CGRect v15 = [(ICGalleryAttachmentView *)self activityView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v16 = [(ICGalleryAttachmentView *)self activityView];
    [v16 setLeadingSpace:8.0];

    id v17 = [(ICGalleryAttachmentView *)self activityView];
    [v17 setTrailingSpace:8.0];

    double v18 = [(ICGalleryAttachmentView *)self activityView];
    [v18 setCollapsed:1];

    double v19 = [(ICGalleryAttachmentView *)self activityView];
    [(ICGalleryAttachmentView *)self addSubview:v19];

    double v20 = [(ICGalleryAttachmentView *)self titleLabel];
    double v21 = [v20 leadingAnchor];
    double v22 = [(ICGalleryAttachmentView *)self leadingAnchor];
    double v23 = [v21 constraintEqualToAnchor:v22 constant:9.0];
    [v78 addObject:v23];

    double v24 = [(ICGalleryAttachmentView *)self titleLabel];
    double v25 = [v24 trailingAnchor];
    double v26 = [(ICGalleryAttachmentView *)self activityView];
    double v27 = [v26 leadingAnchor];
    double v28 = [v25 constraintEqualToAnchor:v27];
    [v78 addObject:v28];

    id v29 = [(ICGalleryAttachmentView *)self activityView];
    double v30 = [v29 centerYAnchor];
    long long v31 = [(ICGalleryAttachmentView *)self titleLabel];
    long long v32 = [v31 centerYAnchor];
    long long v33 = [v30 constraintEqualToAnchor:v32];
    [v78 addObject:v33];

    long long v34 = [(ICGalleryAttachmentView *)self activityView];
    unint64_t v35 = [v34 trailingAnchor];
    uint64_t v36 = [(ICGalleryAttachmentView *)self trailingAnchor];
    double v37 = [v35 constraintLessThanOrEqualToAnchor:v36];

    [v78 addObject:v37];
    [(ICGalleryAttachmentView *)self didChangeAttachmentTitle];
  }
  double v38 = [(ICGalleryAttachmentView *)self tapGestureRecognizer];

  if (!v38)
  {
    double v39 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_didTapTopOfGalleryView_];
    [(ICGalleryAttachmentView *)self setTapGestureRecognizer:v39];

    double v40 = [(ICGalleryAttachmentView *)self tapGestureRecognizer];
    [v40 setDelegate:self];

    double v41 = [(ICGalleryAttachmentView *)self tapGestureRecognizer];
    [(ICGalleryAttachmentView *)self addGestureRecognizer:v41];
  }
  uint64_t v42 = [(ICGalleryAttachmentView *)self collectionView];

  if (!v42)
  {
    objc_opt_class();
    unint64_t v43 = [(ICGalleryAttachmentView *)self attachment];
    v44 = [v43 attachmentModel];
    v45 = ICCheckedDynamicCast();

    id v46 = objc_alloc_init(MEMORY[0x263F5ABA0]);
    [(ICGalleryAttachmentView *)self setCollectionViewCache:v46];

    double v47 = [ICGalleryAttachmentViewCollectionViewLayout alloc];
    [(ICGalleryAttachmentView *)self collectionViewItemHeight];
    double v48 = -[ICGalleryAttachmentViewCollectionViewLayout initWithAttachmentGalleryModel:itemHeight:itemSpacing:margins:](v47, "initWithAttachmentGalleryModel:itemHeight:itemSpacing:margins:", v45);
    [(ICGalleryAttachmentView *)self setCollectionViewLayout:v48];

    id v49 = objc_alloc(MEMORY[0x263F82528]);
    double v50 = [(ICGalleryAttachmentView *)self collectionViewLayout];
    unint64_t v51 = objc_msgSend(v49, "initWithFrame:collectionViewLayout:", v50, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    [(ICGalleryAttachmentView *)self setCollectionView:v51];

    uint64_t v52 = [(ICGalleryAttachmentView *)self collectionView];
    double v53 = (void *)MEMORY[0x263F829D0];
    v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v55 = [v53 nibWithNibName:@"ICGalleryAttachmentViewCell" bundle:v54];
    [v52 registerNib:v55 forCellWithReuseIdentifier:@"ICGalleryViewCollectionViewCell"];

    double v56 = [(ICGalleryAttachmentView *)self collectionView];
    [v56 setDelegate:self];

    double v57 = [(ICGalleryAttachmentView *)self collectionView];
    [v57 setDataSource:self];

    double v58 = [MEMORY[0x263F825C8] clearColor];
    double v59 = [(ICGalleryAttachmentView *)self collectionView];
    [v59 setBackgroundColor:v58];

    double v60 = [(ICGalleryAttachmentView *)self collectionView];
    [v60 setTranslatesAutoresizingMaskIntoConstraints:0];

    v61 = [(ICGalleryAttachmentView *)self collectionView];
    [v61 setAlwaysBounceVertical:0];

    v62 = [(ICGalleryAttachmentView *)self collectionView];
    [v62 setShowsVerticalScrollIndicator:0];

    v63 = [(ICGalleryAttachmentView *)self collectionView];
    [v63 setScrollsToTop:0];

    v64 = [(ICGalleryAttachmentView *)self collectionView];
    [(ICGalleryAttachmentView *)self addSubview:v64];

    v65 = [(ICGalleryAttachmentView *)self collectionView];
    v66 = _NSDictionaryOfVariableBindings(&cfstr_Collectionview.isa, v65, 0);
    v67 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-0@900-[collectionView]-0@900-|" options:0 metrics:0 views:v66];
    [v78 addObjectsFromArray:v67];

    v68 = (void *)MEMORY[0x263F08938];
    v69 = objc_msgSend(NSString, "stringWithFormat:", @"V:|-%g-[collectionView]-0-|", 0x4035000000000000);
    v70 = [v68 constraintsWithVisualFormat:v69 options:0 metrics:0 views:v66];
    [v78 addObjectsFromArray:v70];

    v71 = [(ICGalleryAttachmentView *)self titleLabel];
    v72 = [v71 firstBaselineAnchor];
    v73 = [(ICGalleryAttachmentView *)self collectionView];
    v74 = [v73 topAnchor];
    v75 = [v72 constraintEqualToAnchor:v74];
    [v78 addObject:v75];

    v76 = [(ICGalleryAttachmentView *)self layer];
    [v76 setCornerRadius:9.0];

    v77 = [(ICGalleryAttachmentView *)self layer];
    [v77 setMasksToBounds:1];
  }
  [MEMORY[0x263F08938] activateConstraints:v78];
  [(ICGalleryAttachmentView *)self updateActivityView];
}

- (void)respondToLongPressReorderingGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(ICGalleryAttachmentView *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(ICGalleryAttachmentView *)self collectionView];
  objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentView setMovingIndexPath:](self, "setMovingIndexPath:");

  uint64_t v11 = [v4 state];
  if (v11 == 3)
  {
    id v14 = [(ICGalleryAttachmentView *)self collectionView];
    [v14 endInteractiveMovement];
LABEL_9:

    [(ICGalleryAttachmentView *)self setMovingIndexPath:0];
LABEL_10:
    uint64_t v12 = v20;
    if (!v20) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (v11 == 2)
  {
    CGRect v15 = [(ICGalleryAttachmentView *)self collectionView];
    objc_msgSend(v15, "updateInteractiveMovementTargetPosition:", v7, v9);

    goto LABEL_10;
  }
  if (v11 != 1)
  {
    id v14 = [(ICGalleryAttachmentView *)self collectionView];
    [v14 cancelInteractiveMovement];
    goto LABEL_9;
  }
  uint64_t v12 = v20;
  if (!v20) {
    goto LABEL_14;
  }
  double v13 = [(ICGalleryAttachmentView *)self collectionView];
  [v13 beginInteractiveMovementForItemAtIndexPath:v20];

LABEL_11:
  uint64_t v16 = [(ICGalleryAttachmentView *)self collectionView];
  id v17 = [v16 cellForItemAtIndexPath:v20];

  double v18 = [(ICGalleryAttachmentView *)self movingIndexPath];
  double v19 = 0.5;
  if (!v18) {
    double v19 = 1.0;
  }
  [v17 setAlpha:v19];

  uint64_t v12 = v20;
LABEL_14:
}

- (void)didTapTopOfGalleryView:(id)a3
{
}

- (void)didChangeAttachmentTitle
{
  objc_super v3 = [(ICGalleryAttachmentView *)self galleryEditorController];
  [v3 attachmentTitleDidChange];

  [(ICGalleryAttachmentView *)self updateAttachmentTitleLabel];
}

- (void)updateAttachmentTitleLabel
{
  v20[2] = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F825C8] secondaryLabelColor];
  id v4 = [(ICGalleryAttachmentView *)self titleLabel];
  [v4 setTextColor:v3];

  id v5 = objc_opt_class();
  double v6 = [(ICGalleryAttachmentView *)self attachment];
  double v7 = [v5 titleForGalleryAttachment:v6];

  double v8 = [(ICGalleryAttachmentView *)self highlightPatternRegexFinder];

  if (v8 && v7)
  {
    v19[0] = *MEMORY[0x263F81500];
    double v9 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v20[0] = v9;
    v19[1] = *MEMORY[0x263F814F0];
    uint64_t v10 = [MEMORY[0x263F81708] systemFontOfSize:14.0 weight:*MEMORY[0x263F81840]];
    uint64_t v11 = objc_msgSend(v10, "ic_fontWithSingleLineA");
    v20[1] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

    double v13 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v12];
    if (v13)
    {
      id v14 = [(ICGalleryAttachmentView *)self highlightPatternRegexFinder];
      CGRect v15 = [MEMORY[0x263F825C8] ICTintColor];
      uint64_t v16 = objc_msgSend(v13, "ic_attributedStringByHighlightingRegexFinderMatches:withHighlightColor:", v14, v15);

      id v17 = [(ICGalleryAttachmentView *)self titleLabel];
      [v17 setAttributedText:v16];
    }
  }
  else
  {
    double v18 = [(ICGalleryAttachmentView *)self titleLabel];
    [v18 setText:v7];
  }
}

- (void)didUpdateSubAttachmentItems
{
  objc_super v3 = [(ICGalleryAttachmentView *)self collectionViewLayout];
  [v3 invalidateLayout];

  id v4 = [(ICGalleryAttachmentView *)self collectionView];
  [v4 reloadData];

  id v5 = [(ICGalleryAttachmentView *)self galleryEditorController];
  [v5 updateDocumentViewControllerFromModel];

  [(ICGalleryAttachmentView *)self updateActivityView];
}

- (void)didUpdateSubAttachmentAtIndex:(int64_t)a3 sizeDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  double v7 = [(ICGalleryAttachmentView *)self collectionView];
  int64_t v8 = [v7 numberOfItemsInSection:0];

  if (v8 > a3)
  {
    double v9 = [(ICGalleryAttachmentView *)self collectionView];
    uint64_t v10 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [v9 reloadItemsAtIndexPaths:v11];

    if (v4)
    {
      uint64_t v12 = [(ICGalleryAttachmentView *)self collectionViewLayout];
      [v12 invalidateLayout];
    }
  }
  [(ICGalleryAttachmentView *)self updateActivityView];
}

- (void)updateActivityView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = [(ICGalleryAttachmentView *)self attachment];
  char v4 = [v3 needsInitialFetchFromCloud];

  char v5 = 1;
  if ((v4 & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v6 = [(ICGalleryAttachmentView *)self subAttachmentItems];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v5 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) attachment];
          BOOL v12 = v11 == 0;

          v5 |= v12;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    else
    {
      char v5 = 0;
    }
  }
  double v13 = [(ICGalleryAttachmentView *)self activityView];
  [v13 setCollapsed:(v5 & 1) == 0];
}

- (void)openAttachmentAtIndex:(unint64_t)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  if (![(ICAttachmentView *)self showRecoverNoteAlertIfNecessary])
  {
    objc_opt_class();
    char v5 = [(ICGalleryAttachmentView *)self attachment];
    double v6 = [v5 attachmentModel];
    uint64_t v7 = ICCheckedDynamicCast();

    if ([v7 subAttachmentCount])
    {
      uint64_t v8 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
      [(ICGalleryAttachmentView *)self setIndexPathForZoomTransition:v8];

      uint64_t v9 = [(ICGalleryAttachmentView *)self galleryEditorController];

      if (!v9)
      {
        uint64_t v10 = [ICGalleryAttachmentEditorController alloc];
        uint64_t v11 = [(ICGalleryAttachmentView *)self attachment];
        BOOL v12 = [(ICGalleryAttachmentEditorController *)v10 initWithGalleryAttachment:v11 browserMode:0 delegate:self];
        [(ICGalleryAttachmentView *)self setGalleryEditorController:v12];
      }
      double v13 = [v7 singleSubAttachmentAtIndex:a3];
      if (_UIApplicationIsExtension())
      {
        long long v14 = [ICAttachmentPresenter alloc];
        long long v15 = [(ICGalleryAttachmentView *)self attachment];
        v26[0] = v15;
        long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
        long long v17 = [(ICGalleryAttachmentView *)self attachment];
        uint64_t v18 = [v17 isReadOnly] ^ 1;
        uint64_t v19 = [(ICGalleryAttachmentView *)self window];
        id v20 = [v19 rootViewController];
        double v21 = [(ICAttachmentPresenter *)v14 initWithViewControllerManager:0 attachments:v16 startingAtIndex:0 delegate:self displayShowInNote:0 editable:v18 presentingViewController:v20];
        [(ICGalleryAttachmentView *)self setIPhoneSystemPaperAttachmentPresenter:v21];

        double v22 = [(ICGalleryAttachmentView *)self iPhoneSystemPaperAttachmentPresenter];
        [v22 presentAttachmentWithSelectedSubAttachment:v13];
      }
      else
      {
        double v23 = [(ICGalleryAttachmentView *)self ic_viewControllerManager];
        double v24 = [(ICGalleryAttachmentView *)self attachment];
        double v25 = [(ICGalleryAttachmentView *)self attachment];
        objc_msgSend(v23, "presentAttachment:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:", v24, self, 0, objc_msgSend(v25, "isReadOnly") ^ 1, v13, 0);
      }
    }
  }
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(ICGalleryAttachmentView *)self galleryEditorController];
  uint64_t v9 = [v8 row];

  uint64_t v10 = [v7 row];
  [v11 movePageFromIndex:v9 toIndex:v10];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  char v4 = [(ICGalleryAttachmentView *)self subAttachmentItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  double v6 = [(ICGalleryAttachmentView *)self collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"ICGalleryViewCollectionViewCell" forIndexPath:v5];
  id v8 = ICCheckedDynamicCast();

  unint64_t v9 = [v5 row];
  uint64_t v10 = [(ICGalleryAttachmentView *)self subAttachmentItems];
  unint64_t v11 = [v10 count];

  if (v9 >= v11)
  {
    long long v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ICGalleryAttachmentView(PlatformSpecificResponsibilty) collectionView:cellForItemAtIndexPath:]((uint64_t)v5, self, v16);
    }
  }
  else
  {
    [v8 setDelegate:self];
    BOOL v12 = [(ICGalleryAttachmentView *)self subAttachmentItems];
    double v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    long long v14 = [v13 attachment];
    [v8 setAttachment:v14];

    long long v15 = [MEMORY[0x263F825C8] clearColor];
    [v8 setBackgroundColor:v15];
  }

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "item", a3);

  [(ICGalleryAttachmentView *)self openAttachmentAtIndex:v5];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(ICGalleryAttachmentView *)self collectionViewLayout];
  [v7 itemSize];
  double v9 = v8;
  double v11 = v10;

  unint64_t v12 = [v6 item];
  double v13 = [(ICGalleryAttachmentView *)self subAttachmentItems];
  unint64_t v14 = [v13 count];

  if (v12 < v14)
  {
    long long v15 = [(ICGalleryAttachmentView *)self subAttachmentItems];
    long long v16 = [v15 objectAtIndexedSubscript:v12];

    long long v17 = [v16 attachment];

    if (v17)
    {
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = [v16 attachment];
      [v19 sizeWidth];
      double v21 = v20;
      double v22 = [v16 attachment];
      [v22 sizeHeight];
      [v18 effectiveAspectRatioForWidth:v21 height:v23];
      double v25 = v24;

      double v26 = [(ICGalleryAttachmentView *)self collectionViewLayout];
      [v26 itemHeight];
      double v9 = round(v25 * v27);

      double v28 = [(ICGalleryAttachmentView *)self collectionViewLayout];
      [v28 itemHeight];
      double v11 = v29;
    }
  }
  double v30 = v9;
  double v31 = v11;
  result.double height = v31;
  result.double width = v30;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 9.0;
  double v6 = 9.0;
  double v7 = 9.0;
  double v8 = 9.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)galleryAttachmentViewItemHeight
{
  BOOL v2 = [(ICGalleryAttachmentView *)self collectionViewLayout];
  [v2 itemHeight];
  double v4 = v3;

  return v4;
}

- (void)galleryAttachmentEditorControllerDidDismiss
{
}

- (void)galleryAttachmentEditorControllerDeleteAttachment
{
}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  double v5 = [(ICGalleryAttachmentView *)self collectionView];
  double v6 = [(ICGalleryAttachmentView *)self indexPathForZoomTransition];
  double v7 = [v5 cellForItemAtIndexPath:v6];

  return v7;
}

- (id)attachmentPresenter:(id)a3 transitionViewForIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(ICGalleryAttachmentView *)self collectionView];
  double v7 = [v6 cellForItemAtIndexPath:v5];

  return v7;
}

- (void)scrollCollectionViewToIndexPath:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 section];
  id v5 = [(ICGalleryAttachmentView *)self collectionView];
  if (v4 < [v5 numberOfSections])
  {
    uint64_t v6 = [v10 item];
    double v7 = [(ICGalleryAttachmentView *)self collectionView];
    uint64_t v8 = objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(v10, "section"));

    if (v6 >= v8) {
      goto LABEL_5;
    }
    double v9 = [(ICGalleryAttachmentView *)self collectionView];
    [v9 scrollToItemAtIndexPath:v10 atScrollPosition:8 animated:0];

    id v5 = [(ICGalleryAttachmentView *)self collectionView];
    [v5 layoutIfNeeded];
  }

LABEL_5:
}

- (void)handleDeleteAttachmentFromPresenter:(id)a3
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(ICGalleryAttachmentView *)self tapGestureRecognizer];

  if (v5 == v4)
  {
    double v7 = [(ICGalleryAttachmentView *)self attachment];

    if (v7)
    {
      [v4 locationInView:self];
      double v9 = v8;
      id v10 = [(ICGalleryAttachmentView *)self collectionView];
      [v10 frame];
      double v12 = v11;

      unsigned __int8 v6 = v9 < v12;
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICGalleryAttachmentView;
    unsigned __int8 v6 = [(ICGalleryAttachmentView *)&v14 gestureRecognizerShouldBegin:v4];
  }

  return v6;
}

- (id)accessibilityLabel
{
  BOOL v2 = [MEMORY[0x263F086E0] mainBundle];
  double v3 = [v2 localizedStringForKey:@"Scanned document attachment" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityValue
{
  v20.receiver = self;
  v20.super_class = (Class)ICGalleryAttachmentView;
  double v3 = [(ICAttachmentView *)&v20 accessibilityValue];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 localizedStringForKey:@"%lu scans" value:&stru_26C10E100 table:0];

  unsigned __int8 v6 = NSString;
  double v7 = [(ICGalleryAttachmentView *)self subAttachmentItems];
  double v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, objc_msgSend(v7, "count"));

  double v9 = [(ICGalleryAttachmentView *)self subAttachmentItems];
  id v10 = [v9 firstObject];
  double v11 = [v10 attachment];
  double v12 = [v11 ocrSummary];
  double v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  objc_super v14 = [v12 stringByTrimmingCharactersInSet:v13];

  if ([v14 length])
  {
    long long v15 = [MEMORY[0x263F086E0] mainBundle];
    long long v16 = [v15 localizedStringForKey:@"Possible text for first scan: %@" value:&stru_26C10E100 table:0];

    long long v17 = objc_msgSend(NSString, "localizedStringWithFormat:", v16, v14);
  }
  else
  {
    long long v17 = 0;
  }
  uint64_t v18 = __ICAccessibilityStringForVariables();

  return v18;
}

@end