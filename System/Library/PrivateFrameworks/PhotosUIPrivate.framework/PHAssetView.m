@interface PHAssetView
+ (CGRect)preferredContentsRectForAsset:(id)a3 targetSize:(CGSize)a4;
+ (id)localizedTitleForAsset:(id)a3;
- (BOOL)allowsDragging;
- (BOOL)allowsTextSelection;
- (NSArray)audioIdentifiersToHighlight;
- (NSArray)humanActionIdentifiersToHighlight;
- (NSArray)personLocalIdentifiersToHighlight;
- (NSArray)sceneIdentifiersToHighlight;
- (NSArray)stringsToHighlight;
- (PHAsset)asset;
- (PHAssetView)initWithCoder:(id)a3;
- (PHAssetView)initWithFrame:(CGRect)a3;
- (PXPhotoKitAssetView)impl;
- (int64_t)preferredImageDynamicRange;
- (void)_commonPHAssetViewInit;
- (void)layoutSubviews;
- (void)setAllowsDragging:(BOOL)a3;
- (void)setAllowsTextSelection:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setAudioIdentifiersToHighlight:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setHumanActionIdentifiersToHighlight:(id)a3;
- (void)setImpl:(id)a3;
- (void)setPersonLocalIdentifiersToHighlight:(id)a3;
- (void)setPreferredImageDynamicRange:(int64_t)a3;
- (void)setSceneIdentifiersToHighlight:(id)a3;
- (void)setStringsToHighlight:(id)a3;
@end

@implementation PHAssetView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setImpl:(id)a3
{
}

- (PXPhotoKitAssetView)impl
{
  return self->_impl;
}

- (void)setAllowsDragging:(BOOL)a3
{
  self->_allowsDragging = a3;
}

- (BOOL)allowsDragging
{
  return self->_allowsDragging;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)layoutSubviews
{
  [(PHAssetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(PHAssetView *)self impl];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  id v4 = [(PHAssetView *)self impl];
  [v4 setPreferredImageDynamicRange:a3];
}

- (int64_t)preferredImageDynamicRange
{
  v2 = [(PHAssetView *)self impl];
  int64_t v3 = [v2 preferredImageDynamicRange];

  return v3;
}

- (void)setPersonLocalIdentifiersToHighlight:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set person identifiers to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  double v6 = [(PHAssetView *)self impl];
  [v6 setPersonLocalIdentifiersToHighlight:v4];
}

- (NSArray)personLocalIdentifiersToHighlight
{
  v2 = [(PHAssetView *)self impl];
  int64_t v3 = [v2 personLocalIdentifiersToHighlight];

  return (NSArray *)v3;
}

- (void)setHumanActionIdentifiersToHighlight:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set human action identifiers to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  double v6 = [(PHAssetView *)self impl];
  [v6 setHumanActionIdentifiersToHighlight:v4];
}

- (NSArray)humanActionIdentifiersToHighlight
{
  v2 = [(PHAssetView *)self impl];
  int64_t v3 = [v2 humanActionIdentifiersToHighlight];

  return (NSArray *)v3;
}

- (void)setAudioIdentifiersToHighlight:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set audio identifiers to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  double v6 = [(PHAssetView *)self impl];
  [v6 setAudioIdentifiersToHighlight:v4];
}

- (NSArray)audioIdentifiersToHighlight
{
  v2 = [(PHAssetView *)self impl];
  int64_t v3 = [v2 audioIdentifiersToHighlight];

  return (NSArray *)v3;
}

- (void)setSceneIdentifiersToHighlight:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set scene identifiers to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  double v6 = [(PHAssetView *)self impl];
  [v6 setSceneIdentifiersToHighlight:v4];
}

- (NSArray)sceneIdentifiersToHighlight
{
  v2 = [(PHAssetView *)self impl];
  int64_t v3 = [v2 sceneIdentifiersToHighlight];

  return (NSArray *)v3;
}

- (void)setStringsToHighlight:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "PHAssetView: Set strings to highlight: %@", (uint8_t *)&v7, 0xCu);
  }

  double v6 = [(PHAssetView *)self impl];
  [v6 setStringsToHighlight:v4];
}

- (NSArray)stringsToHighlight
{
  v2 = [(PHAssetView *)self impl];
  int64_t v3 = [v2 stringsToHighlight];

  return (NSArray *)v3;
}

- (void)setAllowsTextSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PHAssetView *)self impl];
  [v4 setAllowsTextSelection:v3];
}

- (BOOL)allowsTextSelection
{
  v2 = [(PHAssetView *)self impl];
  char v3 = [v2 allowsTextSelection];

  return v3;
}

- (void)setContentMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHAssetView;
  -[PHAssetView setContentMode:](&v6, sel_setContentMode_);
  double v5 = [(PHAssetView *)self impl];
  [v5 setContentMode:a3];
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
  id v5 = a3;
  id v6 = [(PHAssetView *)self impl];
  [v6 setAsset:v5];
}

- (void)_commonPHAssetViewInit
{
  char v3 = (PXPhotoKitAssetView *)objc_alloc_init(MEMORY[0x1E4F90458]);
  impl = self->_impl;
  self->_impl = v3;

  [(PHAssetView *)self addSubview:self->_impl];
  uint64_t v5 = [(PXPhotoKitAssetView *)self->_impl contentMode];
  [(PHAssetView *)self setContentMode:v5];
}

- (PHAssetView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHAssetView;
  char v3 = [(PHAssetView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(PHAssetView *)v3 _commonPHAssetViewInit];
  }
  return v4;
}

- (PHAssetView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHAssetView;
  char v3 = -[PHAssetView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PHAssetView *)v3 _commonPHAssetViewInit];
  }
  return v4;
}

+ (CGRect)preferredContentsRectForAsset:(id)a3 targetSize:(CGSize)a4
{
  objc_msgSend(MEMORY[0x1E4F900F0], "preferredContentsRectForAsset:targetSize:", a3, a4.width, a4.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (id)localizedTitleForAsset:(id)a3
{
  return (id)[MEMORY[0x1E4F90458] localizedTitleForAsset:a3];
}

@end