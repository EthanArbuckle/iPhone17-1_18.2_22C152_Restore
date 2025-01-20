@interface SUUIBadgeTextAttachment
- (BOOL)isEqual:(id)a3;
- (CGSize)badgeSize;
- (NSURL)imageURL;
- (OS_dispatch_semaphore)imageLoadingSemaphore;
- (SUUIBadgeTextAttachment)initWithViewElement:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_ensureImageIsLoaded;
- (void)_loadImageWithResourceName:(id)a3 fallbackImage:(id)a4 styleColor:(id)a5;
- (void)setImageLoadingSemaphore:(id)a3;
@end

@implementation SUUIBadgeTextAttachment

- (SUUIBadgeTextAttachment)initWithViewElement:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SUUIBadgeTextAttachment;
  v5 = [(SUUIBadgeTextAttachment *)&v24 init];
  if (v5)
  {
    if ([v4 badgeType])
    {
      v6 = v5;
      v5 = 0;
    }
    else
    {
      v6 = [v4 fallbackImage];
      v7 = [v4 resourceName];
      v8 = [v4 style];
      v9 = [v8 ikColor];
      v10 = [v9 color];

      uint64_t v11 = [v4 URL];
      imageURL = v5->_imageURL;
      v5->_imageURL = (NSURL *)v11;

      double v13 = *MEMORY[0x263F001A8];
      double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
      [v4 size];
      -[SUUIBadgeTextAttachment setBounds:](v5, "setBounds:", v13, v14, v15, v16);
      if (v7 && ![MEMORY[0x263F08B88] isMainThread])
      {
        dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
        [(SUUIBadgeTextAttachment *)v5 setImageLoadingSemaphore:v17];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __47__SUUIBadgeTextAttachment_initWithViewElement___block_invoke;
        v19[3] = &unk_265401E78;
        v20 = v5;
        id v21 = v7;
        id v22 = v6;
        id v23 = v10;
        dispatch_async(MEMORY[0x263EF83A0], v19);
      }
      else
      {
        [(SUUIBadgeTextAttachment *)v5 _loadImageWithResourceName:v7 fallbackImage:v6 styleColor:v10];
      }
    }
  }

  return v5;
}

uint64_t __47__SUUIBadgeTextAttachment_initWithViewElement___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadImageWithResourceName:*(void *)(a1 + 40) fallbackImage:*(void *)(a1 + 48) styleColor:*(void *)(a1 + 56)];
}

- (unint64_t)hash
{
  [(SUUIBadgeTextAttachment *)self _ensureImageIsLoaded];
  unint64_t v3 = [(NSURL *)self->_imageURL hash];
  [(SUUIBadgeTextAttachment *)self bounds];
  unint64_t v8 = (unint64_t)((double)(unint64_t)((double)(unint64_t)((double)(unint64_t)((double)v3 + v4 * 10.0)
                                                                              + v5 * 100.0)
                                                   + v6 * 1000.0)
                        + v7 * 10000.0);
  v9 = [(SUUIBadgeTextAttachment *)self image];
  unint64_t v10 = v8 + 100000 * [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SUUIBadgeTextAttachment *)a3;
  if (self == v4)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      imageURL = self->_imageURL;
      if (imageURL != v5->_imageURL && !-[NSURL isEqual:](imageURL, "isEqual:")) {
        goto LABEL_10;
      }
      [(SUUIBadgeTextAttachment *)self bounds];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [(SUUIBadgeTextAttachment *)v5 bounds];
      v24.origin.x = v15;
      v24.origin.y = v16;
      v24.size.width = v17;
      v24.size.height = v18;
      v23.origin.x = v8;
      v23.origin.y = v10;
      v23.size.width = v12;
      v23.size.height = v14;
      if (CGRectEqualToRect(v23, v24))
      {
        [(SUUIBadgeTextAttachment *)self _ensureImageIsLoaded];
        [(SUUIBadgeTextAttachment *)v5 _ensureImageIsLoaded];
        v19 = [(SUUIBadgeTextAttachment *)self image];
        v20 = [(SUUIBadgeTextAttachment *)v5 image];
        if (v19 == v20) {
          char v21 = 1;
        }
        else {
          char v21 = [v19 isEqual:v20];
        }
      }
      else
      {
LABEL_10:
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  [(SUUIBadgeTextAttachment *)self _ensureImageIsLoaded];
  double v4 = objc_alloc_init(SUUIBadgeTextAttachment);
  objc_storeStrong((id *)&v4->_imageURL, self->_imageURL);
  [(SUUIBadgeTextAttachment *)self bounds];
  -[SUUIBadgeTextAttachment setBounds:](v4, "setBounds:");
  double v5 = [(SUUIBadgeTextAttachment *)self image];
  [(SUUIBadgeTextAttachment *)v4 setImage:v5];

  return v4;
}

- (CGSize)badgeSize
{
  [(SUUIBadgeTextAttachment *)self bounds];
  double v5 = v4;
  double v6 = v3;
  if (v4 == *MEMORY[0x263F001B0] && v3 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    CGFloat v8 = [(SUUIBadgeTextAttachment *)self image];
    double v9 = v8;
    if (v8)
    {
      [v8 size];
      double v5 = v10;
      double v6 = v11;
    }
  }
  double v12 = v5;
  double v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_ensureImageIsLoaded
{
  v2 = [(SUUIBadgeTextAttachment *)self imageLoadingSemaphore];
  if (v2)
  {
    double v3 = v2;
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    v2 = v3;
  }
}

- (void)_loadImageWithResourceName:(id)a3 fallbackImage:(id)a4 styleColor:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v15) {
    goto LABEL_16;
  }
  double v10 = SUUIImageWithResourceName(v15);
  id v11 = v10;
  if (v9 && [v10 renderingMode] == 2)
  {
    uint64_t v12 = [v11 _flatImageWithColor:v9];

    id v11 = (id)v12;
  }
  if (!v11)
  {
LABEL_16:
    if (self->_imageURL) {
      id v11 = 0;
    }
    else {
      id v11 = v8;
    }
  }
  [(SUUIBadgeTextAttachment *)self setImage:v11];
  double v13 = [(SUUIBadgeTextAttachment *)self imageLoadingSemaphore];
  CGFloat v14 = v13;
  if (v13)
  {
    dispatch_semaphore_signal(v13);
    [(SUUIBadgeTextAttachment *)self setImageLoadingSemaphore:0];
  }
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (OS_dispatch_semaphore)imageLoadingSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 128, 1);
}

- (void)setImageLoadingSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoadingSemaphore, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end