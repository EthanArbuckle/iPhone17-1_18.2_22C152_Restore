@interface SearchUITLKImage
- (SearchUIImage)searchUIImage;
- (SearchUITLKImage)initWithSearchUIImage:(id)a3;
- (double)aspectRatio;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)setSearchUIImage:(id)a3;
@end

@implementation SearchUITLKImage

- (SearchUITLKImage)initWithSearchUIImage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUITLKImage;
  v5 = [(TLKImage *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SearchUITLKImage *)v5 setSearchUIImage:v4];
  }

  return v6;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = [(SearchUITLKImage *)self searchUIImage];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__SearchUITLKImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
  v11[3] = &unk_1E6E726E0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 loadImageWithScale:v5 isDarkStyle:v11 completionHandler:a3];
}

void __69__SearchUITLKImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) searchUIImage];
  int v7 = [v6 shouldReadTemplateStatusFromLoadedImage];

  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__SearchUITLKImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
    v8[3] = &unk_1E6E726B8;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    char v11 = a3;
    +[SearchUIUtilities dispatchMainIfNecessary:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __69__SearchUITLKImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsTemplate:", objc_msgSend(MEMORY[0x1E4FAE0C0], "isTemplateImage:", *(void *)(a1 + 40)));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (double)aspectRatio
{
  v2 = [(SearchUITLKImage *)self searchUIImage];
  [v2 aspectRatio];
  double v4 = v3;

  return v4;
}

- (SearchUIImage)searchUIImage
{
  return (SearchUIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSearchUIImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end