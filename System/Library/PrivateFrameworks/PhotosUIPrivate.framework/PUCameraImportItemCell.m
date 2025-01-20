@interface PUCameraImportItemCell
+ (double)alphaForSelectedCells;
- (BOOL)isAccessibilityElement;
- (BOOL)needsBadgeUpdate;
- (BOOL)needsThumbnailRefresh;
- (BOOL)selectable;
- (BOOL)shouldBeginGestureForPoint:(CGPoint)a3;
- (CGRect)_filledPhotosRectForImage:(id)a3;
- (CGRect)scaledDisplayRect;
- (PUCameraImportItemCell)initWithFrame:(CGRect)a3;
- (PUCameraImportItemCellDelegate)delegate;
- (PUPhotoView)photoView;
- (PXImportItemViewModel)representedImportItem;
- (UIActivityIndicatorView)spinner;
- (UITextField)debugTextField;
- (UIView)badgeContainerView;
- (UIView)badgeView;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (int64_t)badgeType;
- (int64_t)dragState;
- (int64_t)thumbnailRequestID;
- (unint64_t)accessibilityTraits;
- (void)_enterOneUpAction;
- (void)_fetchThumbnailReady;
- (void)_selectAction;
- (void)accessibilityElementDidBecomeFocused;
- (void)cancelThumbnailLoadIfActive;
- (void)clearImage;
- (void)dealloc;
- (void)handleTapGesture:(id)a3;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)refreshThumbnail;
- (void)setBadgeContainerView:(id)a3;
- (void)setBadgeType:(int64_t)a3;
- (void)setBadgeView:(id)a3;
- (void)setCachedImage:(id)a3 isPlaceholder:(BOOL)a4;
- (void)setDebugTextField:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsBadgeUpdate:(BOOL)a3;
- (void)setPhotoImage:(id)a3 withSize:(CGSize)a4 fillMode:(int64_t)a5 videoDuration:(double)a6 isPlaceholder:(BOOL)a7;
- (void)setPhotoView:(id)a3;
- (void)setRepresentedImportItem:(id)a3;
- (void)setScaledDisplayRect:(CGRect)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setThumbnailRequestID:(int64_t)a3;
- (void)showActivityBadge:(BOOL)a3;
- (void)updateBadgeUIIfNeeded;
- (void)updateDebugLabel:(id)a3;
@end

@implementation PUCameraImportItemCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugTextField, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_badgeContainerView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_representedImportItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setThumbnailRequestID:(int64_t)a3
{
  self->_thumbnailRequestID = a3;
}

- (int64_t)thumbnailRequestID
{
  return self->_thumbnailRequestID;
}

- (void)setScaledDisplayRect:(CGRect)a3
{
  self->_scaledDisplayRect = a3;
}

- (CGRect)scaledDisplayRect
{
  double x = self->_scaledDisplayRect.origin.x;
  double y = self->_scaledDisplayRect.origin.y;
  double width = self->_scaledDisplayRect.size.width;
  double height = self->_scaledDisplayRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNeedsBadgeUpdate:(BOOL)a3
{
  self->_needsBadgeUpdate = a3;
}

- (BOOL)needsBadgeUpdate
{
  return self->_needsBadgeUpdate;
}

- (void)setDebugTextField:(id)a3
{
}

- (UITextField)debugTextField
{
  return self->_debugTextField;
}

- (void)setSpinner:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setBadgeView:(id)a3
{
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeContainerView:(id)a3
{
}

- (UIView)badgeContainerView
{
  return self->_badgeContainerView;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (void)setPhotoView:(id)a3
{
}

- (PUPhotoView)photoView
{
  return self->_photoView;
}

- (BOOL)needsThumbnailRefresh
{
  return self->_needsThumbnailRefresh;
}

- (PXImportItemViewModel)representedImportItem
{
  return self->_representedImportItem;
}

- (void)setDelegate:(id)a3
{
}

- (PUCameraImportItemCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUCameraImportItemCellDelegate *)WeakRetained;
}

- (void)updateDebugLabel:(id)a3
{
  v4 = (__CFString *)a3;
  v10 = v4;
  if (v4)
  {
    v5 = v4;
    if (!self->_debugTextField)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1D70]);
      v7 = (UITextField *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      debugTextField = self->_debugTextField;
      self->_debugTextField = v7;

      [(UITextField *)self->_debugTextField setTextAlignment:1];
      [(UITextField *)self->_debugTextField setAdjustsFontSizeToFitWidth:1];
      v9 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UITextField *)self->_debugTextField setBackgroundColor:v9];

      [(UITextField *)self->_debugTextField setEnabled:0];
      [(PUCameraImportItemCell *)self addSubview:self->_debugTextField];
      [(PUCameraImportItemCell *)self setNeedsLayout];
      v4 = v10;
      v5 = v10;
    }
  }
  else
  {
    v5 = &stru_1F06BE7B8;
  }
  [(UITextField *)self->_debugTextField setHidden:[(__CFString *)v4 length] == 0];
  [(UITextField *)self->_debugTextField setText:v5];
}

- (id)accessibilityCustomActions
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PUCameraImportItemCell *)self representedImportItem];
  [v3 isSelected];
  v4 = PLLocalizedFrameworkString();

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB13B8]) initWithName:v4 target:self selector:sel__selectAction];
  id v6 = [(PUCameraImportItemCell *)self representedImportItem];
  int v7 = [v6 isMediaAsset];

  if (v7)
  {
    uint64_t v8 = PLLocalizedFrameworkString();

    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB13B8]) initWithName:v8 target:self selector:sel__enterOneUpAction];
    v10 = [(PUCameraImportItemCell *)self representedImportItem];
    int v11 = [v10 isSelectable];

    if (v11)
    {
      v22[0] = v9;
      v22[1] = v5;
      v12 = (void *)MEMORY[0x1E4F1C978];
      v13 = (void **)v22;
      uint64_t v14 = 2;
    }
    else
    {
      v21 = v9;
      v12 = (void *)MEMORY[0x1E4F1C978];
      v13 = &v21;
      uint64_t v14 = 1;
    }
    v18 = [v12 arrayWithObjects:v13 count:v14];

    v4 = (void *)v8;
  }
  else
  {
    v15 = [(PUCameraImportItemCell *)self representedImportItem];
    v16 = [v15 kind];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F90F08]];

    if (v17)
    {
      v20 = v5;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v4 = [(PUCameraImportItemCell *)self superview];
  v3 = [v4 indexPathForCell:self];
  [v4 scrollToItemAtIndexPath:v3 atScrollPosition:18 animated:0];

  UIAccessibilityPostNotification(*MEMORY[0x1E4FB2470], self);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB2590];
}

- (id)accessibilityLabel
{
  v2 = [(PUCameraImportItemCell *)self representedImportItem];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)dragState
{
  return 0;
}

- (void)_selectAction
{
  id v3 = [(PUCameraImportItemCell *)self delegate];
  [v3 handleTouchEvent:0 forCell:self];
}

- (void)_enterOneUpAction
{
  id v3 = [(PUCameraImportItemCell *)self delegate];
  [v3 handleTouchEvent:1 forCell:self];
}

- (void)handleTapGesture:(id)a3
{
  p_badgeTapZone = &self->_badgeTapZone;
  [a3 locationInView:self];
  v10.double x = v5;
  v10.double y = v6;
  if (CGRectContainsPoint(*p_badgeTapZone, v10) && [(PUCameraImportItemCell *)self selectable])
  {
    int v7 = [(PUCameraImportItemCell *)self representedImportItem];
    uint64_t v8 = [v7 state];

    if (v8 != 1)
    {
      [(PUCameraImportItemCell *)self _selectAction];
    }
  }
  else
  {
    [(PUCameraImportItemCell *)self _enterOneUpAction];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PUCameraImportItemCell.m" lineNumber:330 description:@"Expecting main thread only for cell signals"];
  }
  v9 = _importGridLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315394;
    v19 = "-[PUCameraImportItemCell observable:didChange:context:]";
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    _os_log_debug_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "%s: message %llu", (uint8_t *)&v18, 0x16u);
  }

  if ((void *)PXImportItemViewModelContext == a5)
  {
    if ((a4 & 4) != 0)
    {
      CGPoint v10 = [(PUCameraImportItemCell *)self representedImportItem];
      -[PUCameraImportItemCell setSelectable:](self, "setSelectable:", [v10 isSelectable]);
    }
    BOOL v11 = (a4 & 5) != 0;
    if ((a4 & 8) != 0)
    {
      v12 = [(PUCameraImportItemCell *)self representedImportItem];
      int v13 = [v12 isDuplicate];

      if ((a4 & 5) != 0) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v13;
      }
    }
    int v14 = (a4 & 0x12) != 0 || v11;
    if ((a4 & 0x80) != 0)
    {
      v15 = _importGridLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 136315138;
        v19 = "-[PUCameraImportItemCell observable:didChange:context:]";
        _os_log_debug_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEBUG, "%s: Cell has been told to remove itself from the grid", (uint8_t *)&v18, 0xCu);
      }

      [(PUCameraImportItemCell *)self cancelThumbnailLoadIfActive];
    }
    if (v14)
    {
      v16 = [(PUCameraImportItemCell *)self representedImportItem];
      -[PUCameraImportItemCell setBadgeType:](self, "setBadgeType:", [v16 badgeType]);

      [(PUCameraImportItemCell *)self updateBadgeUIIfNeeded];
    }
  }
}

- (CGRect)_filledPhotosRectForImage:(id)a3
{
  [a3 size];
  double v5 = v4;
  double v7 = v6;
  [(PUCameraImportItemCell *)self bounds];
  if (v5 >= v7)
  {
    double v12 = (v9 - v7 * (*(double *)&PUCameraImportItemBadgeSize_1 * 3.0 / v7)) * 0.5;
    double v11 = 0.0;
    double v10 = v8;
    double v9 = v7 * (*(double *)&PUCameraImportItemBadgeSize_1 * 3.0 / v7);
  }
  else
  {
    double v10 = v5 * (*(double *)&PUCameraImportItemBadgeSize_0 * 3.0 / v5);
    double v11 = (v8 - v10) * 0.5;
    double v12 = 0.0;
  }
  double v13 = v10;
  result.size.double height = v9;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)clearImage
{
  id v3 = [(PUPhotoView *)self->_photoView contentHelper];
  [v3 setFillMode:0];
  objc_msgSend(v3, "setPhotoSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [v3 setPhotoImage:0];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F91308] + 16);
  v5[0] = *MEMORY[0x1E4F91308];
  v5[1] = v4;
  [v3 setBadgeInfo:v5];
  [v3 setBadgeStyle:0];
  [(PUCameraImportItemCell *)self setNeedsLayout];
}

- (void)cancelThumbnailLoadIfActive
{
  if ([(PUCameraImportItemCell *)self thumbnailRequestID])
  {
    id v3 = [(PUCameraImportItemCell *)self delegate];
    objc_msgSend(v3, "importCell:didRequestCancellationOfThumbnailRequestWithID:", self, -[PUCameraImportItemCell thumbnailRequestID](self, "thumbnailRequestID"));
  }
  [(PUCameraImportItemCell *)self setThumbnailRequestID:0];
}

- (void)setPhotoImage:(id)a3 withSize:(CGSize)a4 fillMode:(int64_t)a5 videoDuration:(double)a6 isPlaceholder:(BOOL)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  uint64_t v14 = MEMORY[0x1E4F91308];
  uint64_t v15 = *MEMORY[0x1E4F91308];
  if (objc_msgSend(MEMORY[0x1E4F902C0], "hasPanoramaImageDimensions:", width, height))
  {
    if (a5 != 1)
    {
      [(PUCameraImportItemCell *)self _filledPhotosRectForImage:v13];
      -[PUCameraImportItemCell setScaledDisplayRect:](self, "setScaledDisplayRect:");
    }
    v15 |= 2uLL;
    a5 = 1;
  }
  v16 = [(PUPhotoView *)self->_photoView contentHelper];
  [v16 setFillMode:a5];
  objc_msgSend(v16, "setPhotoSize:", width, height);
  [v16 setPhotoImage:v13];
  v18[0] = v15;
  *(double *)&v18[1] = a6;
  long long v19 = *(_OWORD *)(v14 + 16);
  [v16 setBadgeInfo:v18];
  [v16 setBadgeStyle:7];
  if (a7)
  {
    int v17 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [v16 setBackgroundColor:v17];
  }
  else
  {
    [v16 setBackgroundColor:0];
  }
  [(PUCameraImportItemCell *)self setNeedsLayout];
  self->_needsThumbnailRefresh = 0;
}

- (void)setCachedImage:(id)a3 isPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  double v6 = [(PUCameraImportItemCell *)self representedImportItem];
  [v6 duration];

  double v7 = [(PUCameraImportItemCell *)self delegate];
  uint64_t v8 = [v7 contentFillModeForImportCell:self];

  [v9 size];
  -[PUCameraImportItemCell setPhotoImage:withSize:fillMode:videoDuration:isPlaceholder:](self, "setPhotoImage:withSize:fillMode:videoDuration:isPlaceholder:", v9, v8, v4);
}

- (void)_fetchThumbnailReady
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  BOOL v4 = _importGridLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 136315138;
    *(id *)((char *)location + 4) = "-[PUCameraImportItemCell _fetchThumbnailReady]";
    _os_log_debug_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)location, 0xCu);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PUCameraImportItemCell.m" lineNumber:225 description:@"Expecting main thread only"];
  }
  double v5 = [(PUCameraImportItemCell *)self delegate];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PUCameraImportItemCell.m" lineNumber:226 description:@"Missing thumbnail provider"];
  }
  double v7 = [(PUCameraImportItemCell *)self representedImportItem];
  char v8 = [v7 isDeleted];

  if ((v8 & 1) == 0)
  {
    id v9 = [(PUCameraImportItemCell *)self representedImportItem];
    objc_initWeak(location, self);
    double v10 = [(PUCameraImportItemCell *)self delegate];
    double v11 = [(PUCameraImportItemCell *)self representedImportItem];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    int v18 = __46__PUCameraImportItemCell__fetchThumbnailReady__block_invoke;
    long long v19 = &unk_1E5F24360;
    objc_copyWeak(&v21, location);
    id v12 = v9;
    id v20 = v12;
    uint64_t v13 = [v10 importCell:self requestImageForImportItem:v11 ofSize:0 completion:&v16];
    -[PUCameraImportItemCell setThumbnailRequestID:](self, "setThumbnailRequestID:", v13, v16, v17, v18, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
}

void __46__PUCameraImportItemCell__fetchThumbnailReady__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (v6)
  {
    double v7 = (id *)(a1 + 40);
    id v12 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [WeakRetained representedImportItem];
    double v10 = *(void **)(a1 + 32);

    id v6 = v12;
    if (v9 == v10)
    {
      id v11 = objc_loadWeakRetained(v7);
      [v11 setCachedImage:v12 isPlaceholder:a4];

      id v6 = v12;
    }
  }
}

- (void)refreshThumbnail
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUCameraImportItemCell *)self representedImportItem];
  int v4 = [v3 isMediaAsset];

  if (v4)
  {
    double v5 = _importGridLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [(PUCameraImportItemCell *)self representedImportItem];
      int v7 = 136315394;
      char v8 = "-[PUCameraImportItemCell refreshThumbnail]";
      __int16 v9 = 2112;
      double v10 = v6;
      _os_log_debug_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "%s: public interfacing callig for thumbnail: %@", (uint8_t *)&v7, 0x16u);
    }
    [(PUCameraImportItemCell *)self _fetchThumbnailReady];
  }
}

- (void)updateBadgeUIIfNeeded
{
  if ([(PUCameraImportItemCell *)self needsBadgeUpdate])
  {
    [(PUCameraImportItemCell *)self setNeedsBadgeUpdate:0];
    int64_t v3 = [(PUCameraImportItemCell *)self badgeType];
    double v4 = 1.0;
    if ([(PUCameraImportItemCell *)self badgeType] == 1)
    {
      +[PUCameraImportItemCell alphaForSelectedCells];
      double v4 = v5;
    }
    id v6 = [(PUCameraImportItemCell *)self badgeView];
    [v6 removeFromSuperview];

    [(PUCameraImportItemCell *)self setBadgeView:0];
    [(PUCameraImportItemCell *)self badgeType];
    [(PUCameraImportItemCell *)self selectable];
    PXImportBadgeViewForTypeAndSelectable();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      int v7 = [(PUCameraImportItemCell *)self badgeContainerView];
      [v7 addSubview:v10];

      [(PUCameraImportItemCell *)self setBadgeView:v10];
    }
    [(PUCameraImportItemCell *)self showActivityBadge:v3 == 2];
    char v8 = [(PUCameraImportItemCell *)self photoView];
    __int16 v9 = [v8 contentHelper];
    [v9 setContentAlpha:v4];

    [(PUCameraImportItemCell *)self setNeedsLayout];
  }
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
  [(PUCameraImportItemCell *)self setNeedsBadgeUpdate:1];
}

- (void)setBadgeType:(int64_t)a3
{
  self->_badgeType = a3;
  [(PUCameraImportItemCell *)self setNeedsBadgeUpdate:1];
}

- (void)setRepresentedImportItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v5 = (PXImportItemViewModel *)a3;
  id v6 = _importGridLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[PUCameraImportItemCell setRepresentedImportItem:]";
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_debug_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v12, 0x16u);
  }

  p_representedImportItem = &self->_representedImportItem;
  representedImportItem = self->_representedImportItem;
  if (representedImportItem != v5)
  {
    [(PXImportItemViewModel *)representedImportItem unregisterChangeObserver:self context:PXImportItemViewModelContext];
    objc_storeStrong((id *)&self->_representedImportItem, a3);
    [(PXImportItemViewModel *)*p_representedImportItem registerChangeObserver:self context:PXImportItemViewModelContext];
    [(PUCameraImportItemCell *)self setSelectable:[(PXImportItemViewModel *)v5 isSelectable]];
    [(PUCameraImportItemCell *)self setBadgeType:[(PXImportItemViewModel *)v5 badgeType]];
    self->_needsThumbnailRefresh = 1;
    if (*p_representedImportItem)
    {
      if (([(PXImportItemViewModel *)*p_representedImportItem isMediaAsset] & 1) == 0)
      {
        __int16 v9 = [(PXImportItemViewModel *)*p_representedImportItem kind];
        int v10 = [v9 isEqualToString:*MEMORY[0x1E4F90F08]];

        if (v10)
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"ImportEllipsis");
          [v11 size];
          -[PUCameraImportItemCell setPhotoImage:withSize:fillMode:videoDuration:isPlaceholder:](self, "setPhotoImage:withSize:fillMode:videoDuration:isPlaceholder:", v11, 0, 0);
        }
        else
        {
          [(PUCameraImportItemCell *)self clearImage];
        }
        self->_needsThumbnailRefresh = 0;
      }
    }
  }
}

- (void)prepareForReuse
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v3 = _importGridLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(PUCameraImportItemCell *)self representedImportItem];
    *(_DWORD *)buf = 136315394;
    __int16 v9 = "-[PUCameraImportItemCell prepareForReuse]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_debug_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "%s: clearing item from cell: %@", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)PUCameraImportItemCell;
  [(PUCameraImportItemCell *)&v7 prepareForReuse];
  [(PUCameraImportItemCell *)self setBadgeType:0];
  double v4 = [(PUCameraImportItemCell *)self badgeView];
  [v4 removeFromSuperview];

  [(PUCameraImportItemCell *)self setBadgeView:0];
  double v5 = [(PUCameraImportItemCell *)self representedImportItem];
  [v5 unregisterChangeObserver:self context:PXImportItemViewModelContext];

  [(PUCameraImportItemCell *)self cancelThumbnailLoadIfActive];
  [(PUCameraImportItemCell *)self setRepresentedImportItem:0];
  -[PUCameraImportItemCell setScaledDisplayRect:](self, "setScaledDisplayRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)showActivityBadge:(BOOL)a3
{
  spinner = self->_spinner;
  if (a3)
  {
    if (!spinner)
    {
      double v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      id v6 = self->_spinner;
      self->_spinner = v5;

      objc_super v7 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIActivityIndicatorView *)self->_spinner setColor:v7];

      char v8 = self->_spinner;
      __int16 v9 = [(PUCameraImportItemCell *)self badgeContainerView];
      [(PUCameraImportItemCell *)self insertSubview:v8 aboveSubview:v9];

      spinner = self->_spinner;
    }
    [(UIActivityIndicatorView *)spinner startAnimating];
  }
  else
  {
    [(UIActivityIndicatorView *)spinner stopAnimating];
  }
}

- (BOOL)shouldBeginGestureForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PUCameraImportItemCell *)self bounds];
  CGFloat v9 = x;
  CGFloat v10 = y;
  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)PUCameraImportItemCell;
  [(PUCameraImportItemCell *)&v44 layoutSubviews];
  [(PUCameraImportItemCell *)self updateBadgeUIIfNeeded];
  [(PUCameraImportItemCell *)self scaledDisplayRect];
  BOOL v3 = NSIsEmptyRect(v45);
  photoView = self->_photoView;
  if (v3) {
    [(PUCameraImportItemCell *)self bounds];
  }
  else {
    [(PUCameraImportItemCell *)self scaledDisplayRect];
  }
  -[PUPhotoView setFrame:](photoView, "setFrame:");
  [(PUCameraImportItemCell *)self scaledDisplayRect];
  if (NSIsEmptyRect(v46))
  {
    uint64_t v5 = [(PUPhotoView *)self->_photoView contentHelper];
    [v5 imageContentFrame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
  }
  else
  {
    [(PUCameraImportItemCell *)self scaledDisplayRect];
    CGFloat v7 = v14;
    CGFloat v9 = v15;
    CGFloat v11 = v16;
    CGFloat v13 = v17;
  }
  CGFloat v40 = v13;
  CGFloat v41 = v11;
  CGFloat v42 = v9;
  CGFloat v43 = v7;
  v47.origin.CGFloat x = v7;
  v47.origin.CGFloat y = v9;
  v47.size.double width = v11;
  v47.size.double height = v13;
  double MaxX = CGRectGetMaxX(v47);
  v48.origin.CGFloat x = v7;
  v48.origin.CGFloat y = v9;
  v48.size.double width = v11;
  v48.size.double height = v13;
  CGFloat MaxY = CGRectGetMaxY(v48);
  double v20 = *(double *)&PUCameraImportItemBadgeSize_0;
  CGFloat v21 = MaxX - *(double *)&PUCameraImportItemBadgeSize_0 + -6.0;
  double v22 = *(double *)&PUCameraImportItemBadgeSize_1;
  CGFloat v23 = MaxY - *(double *)&PUCameraImportItemBadgeSize_1 + -6.0;
  v24 = [(PUCameraImportItemCell *)self badgeContainerView];
  objc_msgSend(v24, "setFrame:", v21, v23, v20, v22);

  v25 = [(PUCameraImportItemCell *)self badgeView];
  [v25 frame];
  double v27 = v26;
  double v29 = v28;

  double v30 = *MEMORY[0x1E4F1DAD8];
  double v31 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v32 = [(PUCameraImportItemCell *)self badgeView];
  objc_msgSend(v32, "setFrame:", v30, v31, v27, v29);

  v49.origin.CGFloat x = v21;
  v49.origin.CGFloat y = v23;
  v49.size.double width = v20;
  v49.size.double height = v22;
  double MidX = CGRectGetMidX(v49);
  v50.origin.CGFloat x = v21;
  v50.origin.CGFloat y = v23;
  v50.size.double width = v20;
  v50.size.double height = v22;
  double MidY = CGRectGetMidY(v50);
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", MidX, MidY);
  spinner = self->_spinner;
  [(UIActivityIndicatorView *)spinner frame];
  CGRect v52 = CGRectIntegral(v51);
  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
  v53.origin.CGFloat x = v43;
  v53.origin.CGFloat y = v42;
  v53.size.double width = v41;
  v53.size.double height = v40;
  CGFloat v36 = CGRectGetMidX(v53);
  v54.origin.CGFloat x = v43;
  v54.origin.CGFloat y = v42;
  v54.size.double width = v41;
  v54.size.double height = v40;
  CGFloat v37 = CGRectGetMidY(v54);
  v55.origin.CGFloat x = v43;
  v55.origin.CGFloat y = v42;
  v55.size.double width = v41;
  v55.size.double height = v40;
  CGFloat v38 = CGRectGetWidth(v55) * 0.5;
  v56.origin.CGFloat x = v43;
  v56.origin.CGFloat y = v42;
  v56.size.double width = v41;
  v56.size.double height = v40;
  CGFloat Height = CGRectGetHeight(v56);
  self->_badgeTapZone.origin.CGFloat x = v36;
  self->_badgeTapZone.origin.CGFloat y = v37;
  self->_badgeTapZone.size.double width = v38;
  self->_badgeTapZone.size.double height = Height * 0.5;
  if (self->_debugTextField)
  {
    [(PUCameraImportItemCell *)self frame];
    -[UITextField setFrame:](self->_debugTextField, "setFrame:", 0.0, 0.0, CGRectGetWidth(v57), 18.0);
  }
}

- (void)dealloc
{
  [(PUCameraImportItemCell *)self cancelThumbnailLoadIfActive];
  v3.receiver = self;
  v3.super_class = (Class)PUCameraImportItemCell;
  [(PUCameraImportItemCell *)&v3 dealloc];
}

- (PUCameraImportItemCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUCameraImportItemCell;
  objc_super v3 = -[PUCameraImportItemCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (initWithFrame__onceToken != -1) {
      dispatch_once(&initWithFrame__onceToken, &__block_literal_global_18374);
    }
    double v4 = [PUPhotoView alloc];
    [(PUCameraImportItemCell *)v3 bounds];
    uint64_t v5 = -[PUPhotoView initWithFrame:](v4, "initWithFrame:");
    photoView = v3->_photoView;
    v3->_photoView = (PUPhotoView *)v5;

    [(PUCameraImportItemCell *)v3 addSubview:v3->_photoView];
    CGFloat v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    badgeContainerView = v3->_badgeContainerView;
    v3->_badgeContainerView = v7;

    [(PUCameraImportItemCell *)v3 insertSubview:v3->_badgeContainerView aboveSubview:v3->_photoView];
    v3->_thumbnailRequestID = 0;
  }
  return v3;
}

void __40__PUCameraImportItemCell_initWithFrame___block_invoke()
{
  PXImportBadgeViewForTypeAndSelectable();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 frame];
  PUCameraImportItemBadgeSize_0 = v0;
  PUCameraImportItemBadgeSize_1 = v1;
}

+ (double)alphaForSelectedCells
{
  return 0.6;
}

@end