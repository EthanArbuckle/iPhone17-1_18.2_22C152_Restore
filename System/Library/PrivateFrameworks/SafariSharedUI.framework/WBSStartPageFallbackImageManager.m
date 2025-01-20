@interface WBSStartPageFallbackImageManager
+ (WBSStartPageFallbackImageManager)sharedManager;
- (WBSStartPageFallbackImageManager)init;
- (id)displayableImageForImage:(id)a3 withRequiredImageSize:(CGSize)a4;
- (id)displayableImageForImage:(id)a3 withRequiredImageSize:(CGSize)a4 fallbackImageSize:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 cornerRadius:(double)a11 title:(id)a12 url:(id)a13 shouldGenerateGlyph:(BOOL)a14;
- (id)displayableImageForImage:(id)a3 withRequiredImageSize:(CGSize)a4 fontSize:(double)a5 fontWeight:(int64_t)a6 fontDesign:(int64_t)a7 baselineOffset:(double)a8 backgroundColor:(id)a9 cornerRadius:(double)a10 title:(id)a11 url:(id)a12;
@end

@implementation WBSStartPageFallbackImageManager

+ (WBSStartPageFallbackImageManager)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_29);
  }
  v2 = (void *)sharedManager_sharedManager_0;
  return (WBSStartPageFallbackImageManager *)v2;
}

void __49__WBSStartPageFallbackImageManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSStartPageFallbackImageManager);
  v1 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v0;
}

- (WBSStartPageFallbackImageManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSStartPageFallbackImageManager;
  v2 = [(WBSStartPageFallbackImageManager *)&v9 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    identifiersToCachedImages = v2->_identifiersToCachedImages;
    v2->_identifiersToCachedImages = v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    identifiersToLiveCachedImages = v2->_identifiersToLiveCachedImages;
    v2->_identifiersToLiveCachedImages = (NSMapTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)displayableImageForImage:(id)a3 withRequiredImageSize:(CGSize)a4 fontSize:(double)a5 fontWeight:(int64_t)a6 fontDesign:(int64_t)a7 baselineOffset:(double)a8 backgroundColor:(id)a9 cornerRadius:(double)a10 title:(id)a11 url:(id)a12
{
  LOBYTE(v13) = 1;
  return -[WBSStartPageFallbackImageManager displayableImageForImage:withRequiredImageSize:fallbackImageSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:title:url:shouldGenerateGlyph:](self, "displayableImageForImage:withRequiredImageSize:fallbackImageSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:title:url:shouldGenerateGlyph:", a3, a6, a7, a9, a11, a12, a4.width, a4.height, a4.width, a4.height, a5, a8, a10, v13);
}

- (id)displayableImageForImage:(id)a3 withRequiredImageSize:(CGSize)a4 fallbackImageSize:(CGSize)a5 fontSize:(double)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 baselineOffset:(double)a9 backgroundColor:(id)a10 cornerRadius:(double)a11 title:(id)a12 url:(id)a13 shouldGenerateGlyph:(BOOL)a14
{
  double height = a5.height;
  double width = a5.width;
  double v24 = a4.height;
  double v25 = a4.width;
  v44[1] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v28 = a10;
  id v29 = a12;
  id v30 = a13;
  v31 = -[WBSStartPageFallbackImageManager displayableImageForImage:withRequiredImageSize:](self, "displayableImageForImage:withRequiredImageSize:", v27, v25, v24);

  if (v31)
  {
    id v32 = v27;
  }
  else
  {
    v33 = +[WBSTemplateIconMonogramConfiguration configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:](WBSTemplateIconMonogramConfiguration, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", a7, a8, v28, width, height, a6, a9, a11);
    v34 = -[_WBSStartPageFallbackIconCacheIdentifier initWithConfiguration:imageSize:title:url:baseImage:]([_WBSStartPageFallbackIconCacheIdentifier alloc], "initWithConfiguration:imageSize:title:url:baseImage:", v33, v29, v30, v27, width, height);
    uint64_t v35 = [(NSMapTable *)self->_identifiersToLiveCachedImages objectForKey:v34];
    if (v35)
    {
      v36 = (void *)v35;
      [(NSCache *)self->_identifiersToCachedImages setObject:v35 forKey:v34];
    }
    else
    {
      if (v27)
      {
        uint64_t v37 = +[WBSSiteIconKeyColorExtractor keyColorForIcon:v27];

        id v28 = (id)v37;
      }
      uint64_t v38 = +[WBSTemplateIconMonogramConfiguration configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:](WBSTemplateIconMonogramConfiguration, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", a7, a8, v28, width, height, a6, a9, a11);

      v36 = +[WBSTemplateIconMonogramGenerator monogramWithTitle:v29 url:v30 monogramConfiguration:v38 shouldRemoveGrammaticalArticles:1];
      if (!v36 && a14)
      {
        v39 = (void *)MEMORY[0x1E4F42A98];
        v40 = [MEMORY[0x1E4F428B8] systemFillColor];
        v44[0] = v40;
        v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
        v42 = [v39 configurationWithPaletteColors:v41];

        v36 = [MEMORY[0x1E4F42A80] systemImageNamed:@"safari" withConfiguration:v42];
      }
      if (v36)
      {
        [(NSCache *)self->_identifiersToCachedImages setObject:v36 forKey:v34];
        [(NSMapTable *)self->_identifiersToLiveCachedImages setObject:v36 forKey:v34];
      }
      v33 = (void *)v38;
    }
    id v32 = v36;
  }
  return v32;
}

- (id)displayableImageForImage:(id)a3 withRequiredImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 size];
  if (!v6) {
    goto LABEL_13;
  }
  if (v7 < width && v8 < height) {
    goto LABEL_13;
  }
  if (v7 >= v8) {
    double v10 = v8;
  }
  else {
    double v10 = v7;
  }
  if (v7 <= v8) {
    double v7 = v8;
  }
  if (v10 / v7 <= 0.3) {
LABEL_13:
  }
    id v11 = 0;
  else {
    id v11 = v6;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToLiveCachedImages, 0);
  objc_storeStrong((id *)&self->_identifiersToCachedImages, 0);
}

@end