@interface TVPMediaItemPromoInfo
- (BOOL)isAddedToUpNext;
- (CGSize)_calculateImageSize;
- (CGSize)expectedImageSize;
- (NSString)addToUpNextLabelString;
- (NSString)addedToUpNextLabelString;
- (NSString)canonicalId;
- (NSString)genre;
- (NSString)movieRuntime;
- (NSString)ratingDisplayName;
- (NSString)ratingSystem;
- (NSString)title;
- (NSString)titleImageURLString;
- (TVImageProxy)imageProxy;
- (TVPMediaItemPromoInfo)initWithTitleImageURL:(id)a3 originalTitleImageWidth:(double)a4 originalTitleImageHeight:(double)a5 title:(id)a6 genre:(id)a7 ratingDisplayName:(id)a8 ratingSystem:(id)a9 movieRuntime:(id)a10 canonicalId:(id)a11 isAddedToUpNext:(BOOL)a12 addToUpNextLabelString:(id)a13 addedToUpNextLabelString:(id)a14;
- (UIImage)titleImage;
- (double)maxImageHeight;
- (double)originalTitleImageHeight;
- (double)originalTitleImageWidth;
- (double)promoViewWidth;
- (id)imageCompletionHandler;
- (void)_loadImage;
- (void)getTitleImageUsingCompletionHandler:(id)a3;
- (void)setExpectedImageSize:(CGSize)a3;
- (void)setImageCompletionHandler:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setIsAddedToUpNext:(BOOL)a3;
- (void)setMaxImageHeight:(double)a3;
- (void)setOriginalTitleImageHeight:(double)a3;
- (void)setOriginalTitleImageWidth:(double)a3;
- (void)setPromoViewWidth:(double)a3;
- (void)setTitleImage:(id)a3;
@end

@implementation TVPMediaItemPromoInfo

- (TVPMediaItemPromoInfo)initWithTitleImageURL:(id)a3 originalTitleImageWidth:(double)a4 originalTitleImageHeight:(double)a5 title:(id)a6 genre:(id)a7 ratingDisplayName:(id)a8 ratingSystem:(id)a9 movieRuntime:(id)a10 canonicalId:(id)a11 isAddedToUpNext:(BOOL)a12 addToUpNextLabelString:(id)a13 addedToUpNextLabelString:(id)a14
{
  id v35 = a3;
  id obj = a6;
  id v23 = a6;
  id v38 = a7;
  id v32 = a8;
  id v37 = a8;
  id v33 = a9;
  id v36 = a9;
  id v34 = a10;
  id v24 = a10;
  id v25 = a11;
  id v26 = a13;
  id v27 = a14;
  v39.receiver = self;
  v39.super_class = (Class)TVPMediaItemPromoInfo;
  v28 = [(TVPMediaItemPromoInfo *)&v39 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_titleImageURLString, a3);
    v29->_originalTitleImageWidth = a4;
    v29->_originalTitleImageHeight = a5;
    objc_storeStrong((id *)&v29->_title, obj);
    objc_storeStrong((id *)&v29->_genre, a7);
    objc_storeStrong((id *)&v29->_ratingDisplayName, v32);
    objc_storeStrong((id *)&v29->_ratingSystem, v33);
    objc_storeStrong((id *)&v29->_movieRuntime, v34);
    objc_storeStrong((id *)&v29->_canonicalId, a11);
    v29->_isAddedToUpNext = a12;
    objc_storeStrong((id *)&v29->_addToUpNextLabelString, a13);
    objc_storeStrong((id *)&v29->_addedToUpNextLabelString, a14);
    *(_OWORD *)&v29->_promoViewWidth = xmmword_23702FB60;
    [(TVPMediaItemPromoInfo *)v29 _loadImage];
  }

  return v29;
}

- (void)getTitleImageUsingCompletionHandler:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  v4 = [(TVPMediaItemPromoInfo *)self titleImage];

  if (v4)
  {
    v5 = [(TVPMediaItemPromoInfo *)self titleImage];
    v6[2](v6, v5);
  }
  else
  {
    [(TVPMediaItemPromoInfo *)self setImageCompletionHandler:v6];
  }
}

- (void)_loadImage
{
  [(TVPMediaItemPromoInfo *)self _calculateImageSize];
  double v4 = v3;
  double v6 = v5;
  -[TVPMediaItemPromoInfo setExpectedImageSize:](self, "setExpectedImageSize:");
  id v7 = objc_alloc(MEMORY[0x263F7C960]);
  v8 = [(TVPMediaItemPromoInfo *)self titleImageURLString];
  v9 = objc_msgSend(v7, "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v8, 0, @"png", v4, v6, 0.0);

  v10 = [MEMORY[0x263F7C978] imageURLWithDescription:v9];
  id v11 = objc_alloc(MEMORY[0x263F7C958]);
  v12 = [MEMORY[0x263F7C968] sharedInstance];
  v13 = (void *)[v11 initWithObject:v10 imageLoader:v12 groupType:0];

  if (v13)
  {
    objc_initWeak(&location, self);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __35__TVPMediaItemPromoInfo__loadImage__block_invoke;
    v17 = &unk_264CC5128;
    objc_copyWeak(&v18, &location);
    [v13 setCompletionHandler:&v14];
    -[TVPMediaItemPromoInfo setImageProxy:](self, "setImageProxy:", v13, v14, v15, v16, v17);
    [v13 load];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __35__TVPMediaItemPromoInfo__loadImage__block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6 = a2;
  id v7 = [v6 uiImage];

  if (v7 && a4)
  {
    v8 = [v6 uiImage];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__TVPMediaItemPromoInfo__loadImage__block_invoke_2;
    v10[3] = &unk_264CC5100;
    objc_copyWeak(&v12, (id *)(a1 + 32));
    id v11 = v8;
    id v9 = v8;
    dispatch_async(MEMORY[0x263EF83A0], v10);

    objc_destroyWeak(&v12);
  }
}

void __35__TVPMediaItemPromoInfo__loadImage__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setTitleImage:*(void *)(a1 + 32)];
  v2 = [WeakRetained imageCompletionHandler];

  if (v2)
  {
    double v3 = [WeakRetained imageCompletionHandler];
    v3[2](v3, *(void *)(a1 + 32));
  }
}

- (CGSize)_calculateImageSize
{
  [(TVPMediaItemPromoInfo *)self originalTitleImageWidth];
  double v4 = v3;
  [(TVPMediaItemPromoInfo *)self originalTitleImageHeight];
  double v6 = v4 / v5;
  [(TVPMediaItemPromoInfo *)self promoViewWidth];
  double v8 = v7 / v6;
  [(TVPMediaItemPromoInfo *)self maxImageHeight];
  if (v8 >= v9)
  {
    [(TVPMediaItemPromoInfo *)self maxImageHeight];
    double v11 = v6 * v12;
    [(TVPMediaItemPromoInfo *)self maxImageHeight];
    double v8 = v13;
  }
  else
  {
    [(TVPMediaItemPromoInfo *)self promoViewWidth];
    double v11 = v10;
  }
  double v14 = v11;
  double v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSString)titleImageURLString
{
  return self->_titleImageURLString;
}

- (double)originalTitleImageWidth
{
  return self->_originalTitleImageWidth;
}

- (void)setOriginalTitleImageWidth:(double)a3
{
  self->_originalTitleImageWidth = a3;
}

- (double)originalTitleImageHeight
{
  return self->_originalTitleImageHeight;
}

- (void)setOriginalTitleImageHeight:(double)a3
{
  self->_originalTitleImageHeight = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)ratingDisplayName
{
  return self->_ratingDisplayName;
}

- (NSString)ratingSystem
{
  return self->_ratingSystem;
}

- (NSString)movieRuntime
{
  return self->_movieRuntime;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (BOOL)isAddedToUpNext
{
  return self->_isAddedToUpNext;
}

- (void)setIsAddedToUpNext:(BOOL)a3
{
  self->_isAddedToUpNext = a3;
}

- (NSString)addToUpNextLabelString
{
  return self->_addToUpNextLabelString;
}

- (NSString)addedToUpNextLabelString
{
  return self->_addedToUpNextLabelString;
}

- (CGSize)expectedImageSize
{
  double width = self->_expectedImageSize.width;
  double height = self->_expectedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setExpectedImageSize:(CGSize)a3
{
  self->_expectedImageSize = a3;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (void)setImageProxy:(id)a3
{
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitleImage:(id)a3
{
}

- (double)promoViewWidth
{
  return self->_promoViewWidth;
}

- (void)setPromoViewWidth:(double)a3
{
  self->_promoViewWidth = a3;
}

- (double)maxImageHeight
{
  return self->_maxImageHeight;
}

- (void)setMaxImageHeight:(double)a3
{
  self->_maxImageHeight = a3;
}

- (id)imageCompletionHandler
{
  return self->_imageCompletionHandler;
}

- (void)setImageCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageCompletionHandler, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_addedToUpNextLabelString, 0);
  objc_storeStrong((id *)&self->_addToUpNextLabelString, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
  objc_storeStrong((id *)&self->_movieRuntime, 0);
  objc_storeStrong((id *)&self->_ratingSystem, 0);
  objc_storeStrong((id *)&self->_ratingDisplayName, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleImageURLString, 0);
}

@end