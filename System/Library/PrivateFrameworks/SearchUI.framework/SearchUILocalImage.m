@interface SearchUILocalImage
- (BOOL)shouldReadTemplateStatusFromLoadedImage;
- (int)defaultCornerRoundingStyle;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation SearchUILocalImage

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = [(SearchUIImage *)self sfImage];
  int v8 = [v7 localImageType];

  if (v8 == 3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__SearchUILocalImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
    v9[3] = &unk_1E6E72D58;
    id v10 = v6;
    +[SearchUICalculateUIUtilities currencyConversionProviderImageWithCompletionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, 1);
  }
}

uint64_t __71__SearchUILocalImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)defaultCornerRoundingStyle
{
  return 1;
}

- (BOOL)shouldReadTemplateStatusFromLoadedImage
{
  return 1;
}

@end