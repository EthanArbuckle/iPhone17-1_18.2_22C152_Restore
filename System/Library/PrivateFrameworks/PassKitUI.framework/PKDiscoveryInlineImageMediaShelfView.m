@interface PKDiscoveryInlineImageMediaShelfView
- (PKDiscoveryInlineImageMediaShelfView)initWithShelf:(id)a3;
- (id)imageMediaView;
- (void)_loadImageFromBundle;
- (void)_loadImageFromFileURL;
- (void)setImage:(id)a3 animated:(BOOL)a4;
@end

@implementation PKDiscoveryInlineImageMediaShelfView

- (PKDiscoveryInlineImageMediaShelfView)initWithShelf:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FB1838];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithImage:0];
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryInlineImageMediaShelfView;
  v7 = [(PKDiscoveryInlineCaptionedMediaShelfView *)&v9 initWithShelf:v5 mediaView:v6];

  if (v7)
  {
    if ([(PKDiscoveryMedia *)v7->super._media type] == 3)
    {
      [(PKDiscoveryInlineImageMediaShelfView *)v7 _loadImageFromBundle];
    }
    else if ([(PKDiscoveryMedia *)v7->super._media type] == 4)
    {
      [(PKDiscoveryInlineImageMediaShelfView *)v7 _loadImageFromFileURL];
    }
  }

  return v7;
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E4FB1EB0];
    v8 = [(PKDiscoveryInlineImageMediaShelfView *)self imageMediaView];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__PKDiscoveryInlineImageMediaShelfView_setImage_animated___block_invoke;
    v10[3] = &unk_1E59CA870;
    v10[4] = self;
    id v11 = v6;
    [v7 transitionWithView:v8 duration:5242880 options:v10 animations:0 completion:0.300000012];
  }
  else
  {
    objc_super v9 = [(PKDiscoveryInlineImageMediaShelfView *)self imageMediaView];
    [v9 setImage:v6];
  }
}

void __58__PKDiscoveryInlineImageMediaShelfView_setImage_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) imageMediaView];
  [v2 setImage:*(void *)(a1 + 40)];
}

- (void)_loadImageFromBundle
{
  v3 = [(PKDiscoveryMedia *)self->super._media passKitUIImageName];
  BOOL v4 = v3;
  if (v3)
  {
    PKUIImageNamed(v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  id v5 = [(PKDiscoveryInlineImageMediaShelfView *)self imageMediaView];
  [v5 setImage:v6];
}

- (void)_loadImageFromFileURL
{
  v3 = [(PKDiscoveryMedia *)self->super._media localAssetURL];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1E4FB1818];
    id v6 = [v3 path];
    id v8 = [v5 imageWithContentsOfFile:v6];
  }
  else
  {
    id v8 = 0;
  }
  v7 = [(PKDiscoveryInlineImageMediaShelfView *)self imageMediaView];
  [v7 setImage:v8];
}

- (id)imageMediaView
{
  return self->super._mediaView;
}

@end