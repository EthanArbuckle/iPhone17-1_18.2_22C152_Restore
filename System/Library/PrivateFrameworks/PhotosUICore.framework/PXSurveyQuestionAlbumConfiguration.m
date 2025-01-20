@interface PXSurveyQuestionAlbumConfiguration
- (BOOL)isStale;
- (BOOL)needsDisplayRefreshForChange:(id)a3;
- (BOOL)needsQuestionInvalidationForChange:(id)a3;
- (CGRect)contentRectForOneUp;
- (NSString)title;
- (PHAsset)keyAsset;
- (PHAssetCollection)album;
- (PXSurveyQuestionAlbumConfiguration)init;
- (PXSurveyQuestionAlbumConfiguration)initWithTitle:(id)a3 album:(id)a4;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (UIImage)contentImageForOneUp;
- (UIView)contentView;
- (id)_getTitleSubtitleLabelSpec;
- (void)_handleDidSelectAlbumView;
- (void)dealloc;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)setHandlers:(id)a3;
- (void)setIsStale:(BOOL)a3;
@end

@implementation PXSurveyQuestionAlbumConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (PHAssetCollection)album
{
  return self->_album;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setHandlers:(id)a3
{
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)needsDisplayRefreshForChange:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  album = self->_album;
  if (!album) {
    return 0;
  }
  v5 = [(PHAssetCollection *)album title];
  v6 = [(PHAssetCollection *)self->_album photoLibrary];
  v7 = [v6 librarySpecificFetchOptions];

  v8 = (void *)MEMORY[0x1E4F38EE8];
  v9 = [(PHAssetCollection *)self->_album localIdentifier];
  v24[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v11 = [v8 fetchAssetCollectionsWithLocalIdentifiers:v10 options:v7];
  v12 = [v11 firstObject];
  v13 = [v12 title];

  if (v5 && ![v5 isEqualToString:v13])
  {
    BOOL v16 = 1;
  }
  else
  {
    v14 = [(PHAssetCollection *)self->_album photoLibrary];
    v15 = [v14 librarySpecificFetchOptions];

    uint64_t v23 = *MEMORY[0x1E4F394A8];
    BOOL v16 = 1;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v15 setFetchPropertySets:v17];

    v18 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:self->_album options:v15];
    int v19 = [v18 containsObject:self->_keyAsset];
    if (!self->_keyAsset || v19)
    {
      v20 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:self->_album options:v15];
      uint64_t v21 = [(PHAssetCollection *)self->_album approximateCount];
      BOOL v16 = v21 != [v20 count];
    }
  }

  return v16;
}

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  album = self->_album;
  if (!album) {
    return 0;
  }
  v5 = [a3 changeDetailsForObject:album];
  if ([v5 objectWasDeleted])
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [(PHAssetCollection *)self->_album photoLibrary];
    v8 = [v7 librarySpecificFetchOptions];

    v12[0] = *MEMORY[0x1E4F394A8];
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v8 setFetchPropertySets:v9];

    v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:self->_album options:v8];
    BOOL v6 = [v10 count] == 0;
  }
  return v6;
}

- (void)_handleDidSelectAlbumView
{
  v3 = (void *)MEMORY[0x1E4F38EB8];
  album = self->_album;
  v5 = [(PHAssetCollection *)album photoLibrary];
  BOOL v6 = [v5 librarySpecificFetchOptions];
  id v13 = [v3 fetchAssetsInAssetCollection:album options:v6];

  v7 = +[PXPhotosDetailsContext photosDetailsContextForAssetCollection:self->_album assets:v13 viewSourceOrigin:7];
  v8 = [[PXPhotosDetailsUIViewController alloc] initWithContext:v7 options:0];
  v9 = [(PXSurveyQuestionAlbumConfiguration *)self handlers];
  v10 = [v9 pushViewControllerHandler];

  if (v10)
  {
    v11 = [(PXSurveyQuestionAlbumConfiguration *)self handlers];
    v12 = [v11 pushViewControllerHandler];
    ((void (**)(void, PXPhotosDetailsUIViewController *, PHAssetCollection *))v12)[2](v12, v8, self->_album);
  }
}

- (id)_getTitleSubtitleLabelSpec
{
  memset(v28, 0, sizeof(v28));
  [(PXDisplayAssetContentView *)self->_contentView bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(PXDisplayAssetContentView *)self->_contentView layoutMargins];
  int64x2_t v17 = vdupq_n_s64(1uLL);
  uint64_t v18 = 0;
  uint64_t v19 = v4;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;
  uint64_t v23 = v11;
  uint64_t v24 = v12;
  uint64_t v25 = v13;
  uint64_t v26 = v14;
  char v27 = 1;
  v15 = [off_1E5DA9618 memoriesTitleSubtitleSpecForContext:&v17];
  return v15;
}

- (CGRect)contentRectForOneUp
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[PXDisplayAssetContentView setFrame:](self->_contentView, "setFrame:");
  label = self->_label;
  -[PXTitleSubtitleUILabel setFrame:](label, "setFrame:", x, y, width, height);
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    double v4 = +[PXDisplayAssetContentView checkOutViewForAsset:self->_keyAsset withPlaybackStyle:1];
    double v5 = self->_contentView;
    self->_contentView = v4;

    +[PXSurveyQuestionAssetConfiguration configureViewForAsset:self->_contentView];
    uint64_t v6 = [PXTitleSubtitleUILabel alloc];
    [(PXDisplayAssetContentView *)self->_contentView bounds];
    uint64_t v7 = -[PXTitleSubtitleUILabel initWithFrame:](v6, "initWithFrame:");
    label = self->_label;
    self->_label = v7;

    uint64_t v9 = [(PHAssetCollection *)self->_album title];
    [(PXTitleSubtitleUILabel *)self->_label setTitleText:v9];

    uint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAssetCollection approximateCount](self->_album, "approximateCount"));
    uint64_t v12 = [v10 localizedStringFromNumber:v11 numberStyle:1];

    uint64_t v13 = [NSString stringWithFormat:@"(%@)", v12];
    [(PXTitleSubtitleUILabel *)self->_label setSubtitleText:v13];

    uint64_t v14 = [(PXSurveyQuestionAlbumConfiguration *)self _getTitleSubtitleLabelSpec];
    [(PXTitleSubtitleUILabel *)self->_label setSpec:v14];

    [(PXDisplayAssetContentView *)self->_contentView addSubview:self->_label];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDidSelectAlbumView];
    [(PXDisplayAssetContentView *)self->_contentView addGestureRecognizer:v15];

    contentView = self->_contentView;
  }
  return (UIView *)contentView;
}

- (void)dealloc
{
  double v3 = self->_contentView;
  [(PXTitleSubtitleUILabel *)self->_label removeFromSuperview];
  if (v3)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __45__PXSurveyQuestionAlbumConfiguration_dealloc__block_invoke;
    uint64_t v8 = &unk_1E5DD36F8;
    uint64_t v9 = v3;
    px_dispatch_on_main_queue();
  }

  v4.receiver = self;
  v4.super_class = (Class)PXSurveyQuestionAlbumConfiguration;
  [(PXSurveyQuestionAlbumConfiguration *)&v4 dealloc];
}

uint64_t __45__PXSurveyQuestionAlbumConfiguration_dealloc__block_invoke(uint64_t a1)
{
  return +[PXDisplayAssetContentView checkInView:*(void *)(a1 + 32)];
}

- (PXSurveyQuestionAlbumConfiguration)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionAlbumConfiguration.m", 43, @"%s is not available as initializer", "-[PXSurveyQuestionAlbumConfiguration init]");

  abort();
}

- (PXSurveyQuestionAlbumConfiguration)initWithTitle:(id)a3 album:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXSurveyQuestionAlbumConfiguration;
  uint64_t v9 = [(PXSurveyQuestionAlbumConfiguration *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_album, a4);
    uint64_t v11 = (void *)MEMORY[0x1E4F38EB8];
    uint64_t v12 = [(PHAssetCollection *)v10->_album photoLibrary];
    uint64_t v13 = [v12 librarySpecificFetchOptions];
    uint64_t v14 = [v11 fetchKeyAssetsInAssetCollection:v8 options:v13];
    uint64_t v15 = [v14 firstObject];
    keyAsset = v10->_keyAsset;
    v10->_keyAsset = (PHAsset *)v15;

    v10->_isStale = 0;
  }

  return v10;
}

@end