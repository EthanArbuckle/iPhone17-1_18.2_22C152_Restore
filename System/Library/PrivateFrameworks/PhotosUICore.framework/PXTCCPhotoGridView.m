@interface PXTCCPhotoGridView
+ (id)photoGridViewForAlertPromptWithWidth:(double)a3;
+ (id)photoGridViewForSettings;
- (CGSize)_layoutItemsAndCalculateTotalSizeForTargetWidth:(double)a3;
- (NSMutableArray)imageViews;
- (PXTCCPhotoGridView)initWithColumns:(int64_t)a3 proposedRows:(int64_t)a4 width:(double)a5;
- (int64_t)totalColumns;
- (int64_t)totalRows;
- (void)_setUpViewsWithImages:(id)a3 maximumItemCount:(int64_t)a4;
- (void)layoutSubviews;
- (void)setTotalColumns:(int64_t)a3;
- (void)setTotalRows:(int64_t)a3;
@end

@implementation PXTCCPhotoGridView

- (void).cxx_destruct
{
}

- (void)setTotalRows:(int64_t)a3
{
  self->_totalRows = a3;
}

- (int64_t)totalRows
{
  return self->_totalRows;
}

- (void)setTotalColumns:(int64_t)a3
{
  self->_totalColumns = a3;
}

- (int64_t)totalColumns
{
  return self->_totalColumns;
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (CGSize)_layoutItemsAndCalculateTotalSizeForTargetWidth:(double)a3
{
  uint64_t v5 = [(PXTCCPhotoGridView *)self totalColumns];
  uint64_t v6 = [(PXTCCPhotoGridView *)self totalRows];
  double v7 = (a3 - (double)(v5 - 1) * 2.0) / (double)v5;
  if (v6 * v5 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      v9 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:v8];
      objc_msgSend(v9, "setFrame:", (v7 + 2.0) * (double)(v8 + -v5 * (v8 / v5)), (v7 + 2.0) * (double)(v8 / v5), v7, v7);

      ++v8;
    }
    while (v6 * v5 != v8);
  }
  double v10 = (double)(v6 - 1) + (double)(v6 - 1) + (double)v6 * v7;
  double v11 = a3;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)_setUpViewsWithImages:(id)a3 maximumItemCount:(int64_t)a4
{
  id v11 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  imageViews = self->_imageViews;
  self->_imageViews = v6;

  if (a4 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      [v9 setContentMode:2];
      [v9 setClipsToBounds:1];
      double v10 = [v11 objectAtIndexedSubscript:v8];
      [v9 setImage:v10];

      [(PXTCCPhotoGridView *)self addSubview:v9];
      [(NSMutableArray *)self->_imageViews addObject:v9];

      ++v8;
    }
    while (a4 != v8);
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXTCCPhotoGridView;
  [(PXTCCPhotoGridView *)&v4 layoutSubviews];
  [(PXTCCPhotoGridView *)self frame];
  [(PXTCCPhotoGridView *)self _layoutItemsAndCalculateTotalSizeForTargetWidth:v3];
}

- (PXTCCPhotoGridView)initWithColumns:(int64_t)a3 proposedRows:(int64_t)a4 width:(double)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)PXTCCPhotoGridView;
  double v7 = [(PXTCCPhotoGridView *)&v34 init];
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  id v9 = [MEMORY[0x1E4F8E860] fetchCuratedAssetsForTCCWithLimit:a4 * a3 seed:0 library:v8];

  double v10 = _SynchronousThumbnailImagesForAssets(v9);
  unint64_t v11 = [v10 count];
  if (v11 < a3)
  {
    v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[PXTCCPhotoGridView initWithColumns:proposedRows:width:]";
      v13 = "%s: Not enough images to return a settings photo grid";
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 12;
LABEL_8:
      _os_log_impl(&dword_1A9AE7000, v14, v15, v13, buf, v16);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v7->_totalColumns = a3;
  v7->_totalRows = v11 / a3;
  unint64_t v17 = v11 / a3 * a3;
  if ([v10 count] >= v17)
  {
    double Helper_x8__OBJC_CLASS___APApplication = gotLoadHelper_x8__OBJC_CLASS___APApplication(v18);
    v23 = objc_msgSend(*(id *)(v22 + 2016), "applicationWithBundleIdentifier:", @"com.apple.mobileslideshow", Helper_x8__OBJC_CLASS___APApplication);
    double Helper_x8__OBJC_CLASS___APGuard = gotLoadHelper_x8__OBJC_CLASS___APGuard(v24);
    v27 = objc_msgSend(*(id *)(v26 + 2024), "sharedGuard", Helper_x8__OBJC_CLASS___APGuard);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57__PXTCCPhotoGridView_initWithColumns_proposedRows_width___block_invoke;
    v30[3] = &unk_1E5DC63E8;
    v31 = v7;
    id v32 = v10;
    unint64_t v33 = v17;
    id v28 = v10;
    [v27 initiateAuthenticationWithShieldingForSubject:v23 completion:v30];

LABEL_11:
    v20 = v7;
    goto LABEL_12;
  }
  v12 = PLUIGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = [v10 count];
    *(_DWORD *)buf = 136315650;
    v36 = "-[PXTCCPhotoGridView initWithColumns:proposedRows:width:]";
    __int16 v37 = 2048;
    uint64_t v38 = v19;
    __int16 v39 = 2048;
    unint64_t v40 = v17;
    v13 = "%s: Not enough images provided (%ld) to hit target count (%ld)";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 32;
    goto LABEL_8;
  }
LABEL_9:

  v20 = 0;
LABEL_12:

  return v20;
}

void __57__PXTCCPhotoGridView_initWithColumns_proposedRows_width___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PXTCCPhotoGridView_initWithColumns_proposedRows_width___block_invoke_2;
    block[3] = &unk_1E5DD0D90;
    double v10 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v11 = v6;
    uint64_t v12 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);

    uint64_t v8 = v10;
  }
  else
  {
    uint64_t v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "APGuard failed to intialize with error: %@", buf, 0xCu);
    }
  }
}

uint64_t __57__PXTCCPhotoGridView_initWithColumns_proposedRows_width___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUpViewsWithImages:*(void *)(a1 + 40) maximumItemCount:*(void *)(a1 + 48)];
}

+ (id)photoGridViewForSettings
{
  v2 = (void *)[objc_alloc((Class)a1) initWithColumns:4 proposedRows:2 width:0.0];
  [v2 _layoutItemsAndCalculateTotalSizeForTargetWidth:300.0];
  double v4 = v3;
  double v6 = v5;
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = [v2 heightAnchor];
  uint64_t v8 = [v2 widthAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8 multiplier:v6 / v4];
  [v9 setActive:1];

  return v2;
}

+ (id)photoGridViewForAlertPromptWithWidth:(double)a3
{
  double v4 = (void *)[objc_alloc((Class)a1) initWithColumns:4 proposedRows:2 width:a3];
  [v4 _layoutItemsAndCalculateTotalSizeForTargetWidth:a3];
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v5, v6);
  return v4;
}

@end