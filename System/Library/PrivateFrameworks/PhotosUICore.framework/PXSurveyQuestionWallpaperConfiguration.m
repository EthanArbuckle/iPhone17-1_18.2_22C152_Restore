@interface PXSurveyQuestionWallpaperConfiguration
- (BOOL)isStale;
- (BOOL)needsQuestionInvalidationForChange:(id)a3;
- (CGRect)contentRectForOneUp;
- (NSString)title;
- (PXDisplayAsset)asset;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (PXSurveyQuestionWallpaperConfiguration)init;
- (PXSurveyQuestionWallpaperConfiguration)initWithTitle:(id)a3 asset:(id)a4;
- (UIImage)contentImageForOneUp;
- (UIView)contentView;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)setHandlers:(id)a3;
- (void)setIsStale:(BOOL)a3;
@end

@implementation PXSurveyQuestionWallpaperConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

- (PXDisplayAsset)asset
{
  return self->_asset;
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

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  v3 = [a3 changeDetailsForObject:self->_asset];
  char v4 = [v3 objectWasDeleted];

  return v4;
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
  return (UIImage *)[(PXWallpaperSuggestionView *)self->_wallpaperView image];
}

- (void)layoutContentViewInRect:(CGRect)a3
{
}

- (UIView)contentView
{
  wallpaperView = self->_wallpaperView;
  if (!wallpaperView)
  {
    double v4 = objc_alloc_init(PXWallpaperSuggestionView);
    double v5 = self->_wallpaperView;
    self->_wallpaperView = v4;

    [(PXWallpaperSuggestionView *)self->_wallpaperView setShowClockOverlay:0];
    v6 = [(PXSurveyQuestionWallpaperConfiguration *)self asset];
    [(PXWallpaperSuggestionView *)self->_wallpaperView setAsset:v6];

    wallpaperView = self->_wallpaperView;
  }
  return (UIView *)wallpaperView;
}

- (PXSurveyQuestionWallpaperConfiguration)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionWallpaperConfiguration.m", 34, @"%s is not available as initializer", "-[PXSurveyQuestionWallpaperConfiguration init]");

  abort();
}

- (PXSurveyQuestionWallpaperConfiguration)initWithTitle:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSurveyQuestionWallpaperConfiguration;
  v8 = [(PXSurveyQuestionWallpaperConfiguration *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_asset, a4);
    v8->_isStale = 0;
  }

  return v8;
}

@end