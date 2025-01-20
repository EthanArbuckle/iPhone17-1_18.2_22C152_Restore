@interface SearchUIImage
+ (SearchUIImage)imageWithSFImage:(id)a3;
+ (SearchUIImage)imageWithSFImage:(id)a3 variantForAppIcon:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemplate;
- (BOOL)needsTinting;
- (BOOL)shouldCropToCircle;
- (BOOL)shouldReadTemplateStatusFromLoadedImage;
- (BOOL)supportsFastPathShadow;
- (CGSize)size;
- (SFImage)sfImage;
- (SFImageContext)lastLoadedContext;
- (SearchUIImage)initWithImage:(id)a3;
- (SearchUIImage)initWithSFImage:(id)a3;
- (UIImage)uiImage;
- (double)aspectRatio;
- (double)cornerRadius;
- (double)scale;
- (id)badgingImage;
- (id)imageData;
- (id)loadImageWithImageData:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5;
- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4;
- (int)cornerRoundingStyle;
- (int)defaultCornerRoundingStyle;
- (unint64_t)hash;
- (void)decodeImageData:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5 completionHandler:(id)a6;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)setLastLoadedContext:(id)a3;
- (void)setNeedsTinting:(BOOL)a3;
- (void)setSfImage:(id)a3;
- (void)setShouldReadTemplateStatusFromLoadedImage:(BOOL)a3;
- (void)setSupportsFastPathShadow:(BOOL)a3;
- (void)setUiImage:(id)a3;
@end

@implementation SearchUIImage

+ (SearchUIImage)imageWithSFImage:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = +[SearchUIAppIconImage bestVariantForSize:sanitizeSFImage(v4)];
  }
  else {
    unint64_t v5 = 4;
  }
  v6 = [a1 imageWithSFImage:v4 variantForAppIcon:v5];

  return (SearchUIImage *)v6;
}

+ (SearchUIImage)imageWithSFImage:(id)a3 variantForAppIcon:(unint64_t)a4
{
  id v5 = a3;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = (SearchUIAvatarImage *)v5;
LABEL_12:
    v7 = (SearchUIDefaultBrowserAppIconImage *)v6;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[SearchUIAvatarImage alloc] initWithMonogramImage:v5];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[SearchUIAvatarImage alloc] initWithContactImage:v5];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = SearchUIQuickLookThumbnailImage;
LABEL_11:
    v6 = (SearchUIAvatarImage *)[[v8 alloc] initWithSFImage:v5];
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v7 = [(SearchUIImage *)[SearchUILocalImage alloc] initWithSFImage:v5]) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v5;
      if ([v10 iconType] == 1)
      {
        v7 = [[SearchUIDefaultBrowserAppIconImage alloc] initWithVariant:a4];
      }
      else
      {
        v11 = [v10 bundleIdentifier];
        v12 = [v10 contentType];
        v7 = +[SearchUIAppIconImage appIconForBundleIdentifier:v11 variant:a4 contentType:v12];
      }
      [(SearchUIImage *)v7 setSfImage:v10];
      if (sanitizeSFImage(v10) != *MEMORY[0x1E4F1DB30] || v13 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
        -[SearchUIDefaultBrowserAppIconImage setSize:](v7, "setSize:");
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = SearchUISymbolImage;
        goto LABEL_11;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = SearchUIPhotosLibraryImage;
        goto LABEL_11;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8 = SearchUIMediaArtworkImage;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v6 = [[SearchUIClockImage alloc] initWithClockImage:v5 variant:a4];
            goto LABEL_12;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v8 = SearchUIShortcutsImage;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v6 = [[SearchUIDefaultPunchoutAppIconImage alloc] initWithSFImage:v5 variant:a4];
              goto LABEL_12;
            }
            v8 = SearchUIImage;
          }
        }
        goto LABEL_11;
      }
      v14 = [SearchUICalendarIconImage alloc];
      id v10 = [v5 date];
      v7 = [(SearchUICalendarIconImage *)v14 initWithDate:v10 variant:a4];
    }
  }
LABEL_13:

  return (SearchUIImage *)v7;
}

- (SearchUIImage)initWithSFImage:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  v6 = [(SearchUIImage *)&v8 init];
  if (v6)
  {
    sanitizeSFImage(v5);
    objc_storeStrong((id *)&v6->_sfImage, a3);
  }

  return v6;
}

- (SearchUIImage)initWithImage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  id v5 = [(SearchUIImage *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SearchUIImage *)v5 setUiImage:v4];
    [v4 size];
    -[SearchUIImage setSize:](v6, "setSize:");
    -[SearchUIImage setIsTemplate:](v6, "setIsTemplate:", [v4 renderingMode] == 2);
  }

  return v6;
}

- (int)cornerRoundingStyle
{
  v3 = [(SearchUIImage *)self sfImage];
  int v4 = [v3 cornerRoundingStyle];
  if (!v3 || (int v5 = v4) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIImage;
    if ([(SearchUIImage *)&v9 cornerRoundingStyle])
    {
      v8.receiver = self;
      v8.super_class = (Class)SearchUIImage;
      unsigned int v6 = [(SearchUIImage *)&v8 cornerRoundingStyle];
    }
    else
    {
      unsigned int v6 = [(SearchUIImage *)self defaultCornerRoundingStyle];
    }
    int v5 = v6;
  }

  return v5;
}

- (int)defaultCornerRoundingStyle
{
  if ([(SearchUIImage *)self shouldCropToCircle]) {
    return 4;
  }
  [(SearchUIImage *)self cornerRadius];
  if (v4 <= 6.0) {
    return 2;
  }
  else {
    return 3;
  }
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  objc_super v8 = (void (**)(id, void *, uint64_t))a5;
  objc_super v9 = [(SearchUIImage *)self uiImage];
  if (v9)
  {
    v8[2](v8, v9, 1);
  }
  else
  {
    id v10 = objc_opt_new();
    [v10 setUiScale:a3];
    [v10 setHasDarkAppearance:v5];
    v11 = [(SearchUIImage *)self lastLoadedContext];
    v12 = [(SearchUIImage *)self sfImage];
    if (v11)
    {
      [v11 uiScale];
      if (v13 != a3 || [v11 hasDarkAppearance] != v5) {
        [v12 setImageData:0];
      }
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
    v16[3] = &unk_1E6E739F0;
    v16[4] = self;
    double v20 = a3;
    BOOL v21 = v5;
    id v18 = v10;
    v19 = v8;
    id v17 = v12;
    id v14 = v10;
    id v15 = v12;
    +[SearchUIUtilities dispatchAsyncIfNecessary:v16];
  }
}

void __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadImageWithScale:*(unsigned __int8 *)(a1 + 72) isDarkStyle:*(double *)(a1 + 64)];
  if (v2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_3:
    v3();
    goto LABEL_12;
  }
  double v4 = *(void **)(a1 + 40);
  if (!v4)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_3;
  }
  uint64_t v5 = [v4 methodForSelector:sel_loadImageDataWithCompletionAndErrorHandler_];
  uint64_t v6 = [MEMORY[0x1E4F9A128] instanceMethodForSelector:sel_loadImageDataWithCompletionAndErrorHandler_];
  v7 = *(void **)(a1 + 40);
  if (v5 == v6)
  {
    uint64_t v9 = [*(id *)(a1 + 40) methodForSelector:sel_loadImageDataWithCompletionHandler_];
    if (v9 == [MEMORY[0x1E4F9A128] instanceMethodForSelector:sel_loadImageDataWithCompletionHandler_])
    {
      [*(id *)(a1 + 32) setLastLoadedContext:*(void *)(a1 + 48)];
      v11 = *(void **)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_4;
      v13[3] = &unk_1E6E739A0;
      v13[4] = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 64);
      char v16 = *(unsigned char *)(a1 + 72);
      id v14 = *(id *)(a1 + 56);
      [v11 loadImageDataWithContext:v12 completionHandler:v13];
      objc_super v8 = v14;
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3;
      v17[3] = &unk_1E6E739C8;
      id v10 = *(void **)(a1 + 40);
      v17[4] = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 64);
      char v20 = *(unsigned char *)(a1 + 72);
      id v18 = *(id *)(a1 + 56);
      [v10 loadImageDataWithCompletionHandler:v17];
      objc_super v8 = v18;
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
    v21[3] = &unk_1E6E739A0;
    v21[4] = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 64);
    char v24 = *(unsigned char *)(a1 + 72);
    id v22 = *(id *)(a1 + 56);
    [v7 loadImageDataWithCompletionAndErrorHandler:v21];
    objc_super v8 = v22;
  }

LABEL_12:
}

uint64_t __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) decodeImageData:a2 scale:*(unsigned __int8 *)(a1 + 56) isDarkStyle:*(void *)(a1 + 40) completionHandler:*(double *)(a1 + 48)];
}

uint64_t __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) decodeImageData:a2 scale:*(unsigned __int8 *)(a1 + 56) isDarkStyle:*(void *)(a1 + 40) completionHandler:*(double *)(a1 + 48)];
}

void __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) decodeImageData:a2 scale:*(unsigned __int8 *)(a1 + 56) isDarkStyle:*(void *)(a1 + 40) completionHandler:*(double *)(a1 + 48)];
  v3 = [*(id *)(a1 + 32) sfImage];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_5;
    v5[3] = &unk_1E6E72730;
    v5[4] = *(void *)(a1 + 32);
    [MEMORY[0x1E4FAE198] dispatchAsync:v5];
  }
}

void __66__SearchUIImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sfImage];
  [v1 setImageData:0];
}

- (void)decodeImageData:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__SearchUIImage_decodeImageData_scale_isDarkStyle_completionHandler___block_invoke;
  v14[3] = &unk_1E6E73808;
  v14[4] = self;
  id v15 = v10;
  double v17 = a4;
  BOOL v18 = a5;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v14];
}

void __69__SearchUIImage_decodeImageData_scale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) loadImageWithImageData:*(void *)(a1 + 40) scale:*(unsigned __int8 *)(a1 + 64) isDarkStyle:*(double *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(SearchUIImage *)self imageData];
  objc_super v8 = [(SearchUIImage *)self loadImageWithImageData:v7 scale:v4 isDarkStyle:a3];

  return v8;
}

- (id)loadImageWithImageData:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5
{
  id v6 = a3;
  v7 = [(SearchUIImage *)self uiImage];
  objc_super v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v6];
  }
  id v10 = v9;

  return v10;
}

- (CGSize)size
{
  v13.receiver = self;
  v13.super_class = (Class)SearchUIImage;
  [(SearchUIImage *)&v13 size];
  double v5 = v4;
  double v6 = v3;
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    objc_super v8 = [(SearchUIImage *)self sfImage];
    [v8 size];
    double v5 = v9;
    double v6 = v10;
  }
  double v11 = v5;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)cornerRadius
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  [(SearchUIImage *)&v8 cornerRadius];
  if (v3 != 0.0) {
    return v3;
  }
  double v4 = [(SearchUIImage *)self sfImage];
  [v4 cornerRadius];
  double v6 = v5;

  return v6;
}

- (BOOL)shouldCropToCircle
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIImage;
  if ([(SearchUIImage *)&v6 shouldCropToCircle]) {
    return 1;
  }
  double v4 = [(SearchUIImage *)self sfImage];
  char v3 = [v4 shouldCropToCircle];

  return v3;
}

- (BOOL)isTemplate
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIImage;
  if ([(SearchUIImage *)&v6 isTemplate]) {
    return 1;
  }
  double v4 = [(SearchUIImage *)self sfImage];
  char v3 = [v4 isTemplate];

  return v3;
}

- (id)badgingImage
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  char v3 = [(SearchUIImage *)&v8 badgingImage];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_super v6 = [(SearchUIImage *)self sfImage];
    id v5 = [v6 badgingImage];
  }
  return v5;
}

- (double)scale
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  [(SearchUIImage *)&v8 scale];
  if (v3 != 0.0) {
    return v3;
  }
  double v4 = [(SearchUIImage *)self sfImage];
  [v4 scale];
  double v6 = v5;

  return v6;
}

- (id)imageData
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIImage;
  double v3 = [(SearchUIImage *)&v8 imageData];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(SearchUIImage *)self sfImage];
    id v5 = [v6 imageData];
  }
  return v5;
}

- (double)aspectRatio
{
  [(SearchUIImage *)self size];
  double result = v2 / v3;
  if (v3 == 0.0) {
    return 0.0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SearchUIImage *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    if ([(SearchUIImage *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = [(SearchUIImage *)self sfImage];
      if (v5)
      {
      }
      else
      {
        v7 = [(SearchUIImage *)v4 sfImage];

        if (!v7)
        {
          objc_super v8 = [(SearchUIImage *)self uiImage];
          double v9 = [(SearchUIImage *)v4 uiImage];
          if (![v8 isEqual:v9])
          {
            BOOL v6 = 0;
            goto LABEL_10;
          }
          v12.receiver = self;
          v12.super_class = (Class)SearchUIImage;
          unsigned __int8 v10 = [(SearchUIImage *)&v12 isEqual:v4];
LABEL_9:
          BOOL v6 = v10;
LABEL_10:

          goto LABEL_11;
        }
      }
      objc_super v8 = [(SearchUIImage *)self sfImage];
      double v9 = [(SearchUIImage *)v4 sfImage];
      unsigned __int8 v10 = [v8 isEqual:v9];
      goto LABEL_9;
    }
    BOOL v6 = 0;
  }
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  double v3 = [(SearchUIImage *)self sfImage];
  if (v3)
  {
    double v4 = [(SearchUIImage *)self sfImage];
    id v5 = (id)[v4 hash];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIImage;
    id v5 = [(SearchUIImage *)&v7 hash];
  }

  return (unint64_t)v5;
}

- (UIImage)uiImage
{
  return self->_uiImage;
}

- (void)setUiImage:(id)a3
{
}

- (SFImageContext)lastLoadedContext
{
  return (SFImageContext *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLastLoadedContext:(id)a3
{
}

- (SFImage)sfImage
{
  return self->_sfImage;
}

- (void)setSfImage:(id)a3
{
}

- (BOOL)supportsFastPathShadow
{
  return self->_supportsFastPathShadow;
}

- (void)setSupportsFastPathShadow:(BOOL)a3
{
  self->_supportsFastPathShadow = a3;
}

- (BOOL)needsTinting
{
  return self->_needsTinting;
}

- (void)setNeedsTinting:(BOOL)a3
{
  self->_needsTinting = a3;
}

- (BOOL)shouldReadTemplateStatusFromLoadedImage
{
  return self->_shouldReadTemplateStatusFromLoadedImage;
}

- (void)setShouldReadTemplateStatusFromLoadedImage:(BOOL)a3
{
  self->_shouldReadTemplateStatusFromLoadedImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfImage, 0);
  objc_storeStrong((id *)&self->_lastLoadedContext, 0);
  objc_storeStrong((id *)&self->_uiImage, 0);
}

@end