@interface PRLikenessView
+ (void)initialize;
- (BOOL)_isLikenessEqual:(id)a3;
- (BOOL)_shouldRenderStaticRepresentation;
- (BOOL)highlighted;
- (BOOL)isCircular;
- (BOOL)shouldDecode;
- (PRLikeness)likeness;
- (PRLikenessView)initWithFrame:(CGRect)a3;
- (PRLikenessView)initWithLikeness:(id)a3;
- (id)_imageView;
- (id)_monogramView;
- (void)_imageForLikeness:(id)a3 completion:(id)a4;
- (void)_setDisplayedView:(id)a3;
- (void)_updateViewForLikeness:(BOOL)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCircular:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLikeness:(id)a3;
- (void)setNeedsRedraw;
- (void)setShouldDecode:(BOOL)a3;
@end

@implementation PRLikenessView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (const void *)_PRLikenessViewMainQueueKey;
    v3 = MEMORY[0x263EF83A0];
    v4 = (void *)_PRLikenessViewMainQueueKey;
    dispatch_queue_set_specific(v3, v2, v4, 0);
  }
}

- (PRLikenessView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PRLikenessView;
  v3 = -[PRLikenessView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    likeness = v3->_likeness;
    v3->_likeness = 0;

    v4->_circular = 1;
    v4->_shouldDecode = 1;
  }
  return v4;
}

- (PRLikenessView)initWithLikeness:(id)a3
{
  id v5 = a3;
  v6 = -[PRLikenessView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_likeness, a3);
    [(PRLikenessView *)v7 _updateViewForLikeness:0];
  }

  return v7;
}

- (void)dealloc
{
  staticRepresentation = self->_staticRepresentation;
  if (staticRepresentation) {
    CFRelease(staticRepresentation);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRLikenessView;
  [(PRLikenessView *)&v4 dealloc];
}

- (void)_updateViewForLikeness:(BOOL)a3
{
  if (a3 || [(PRLikenessView *)self _shouldRenderStaticRepresentation])
  {
    objc_super v4 = [(PRLikenessView *)self _imageView];
    [(PRLikenessView *)self _setDisplayedView:v4];
    likeness = self->_likeness;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__PRLikenessView__updateViewForLikeness___block_invoke;
    v15[3] = &unk_264254018;
    v15[4] = self;
    id v16 = v4;
    id v6 = v4;
    [(PRLikenessView *)self _imageForLikeness:likeness completion:v15];
  }
  else
  {
    objc_super v7 = [(PRLikenessView *)self likeness];
    uint64_t v8 = [v7 type];

    if (v8 == 1)
    {
      v9 = [(PRLikenessView *)self likeness];
      v10 = [v9 recipe];
      id v14 = +[PRMonogram monogramWithData:v10];

      v11 = [(PRLikenessView *)self _monogramView];
      [v11 setMonogram:v14];
      [(PRLikenessView *)self _setDisplayedView:v11];
    }
    else
    {
      v12 = [(PRLikenessView *)self likeness];
      uint64_t v13 = [v12 type];

      if (v13 != 3)
      {
        [(PRLikenessView *)self _setDisplayedView:0];
      }
    }
  }
}

void __41__PRLikenessView__updateViewForLikeness___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = _PRGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      v15 = "-[PRLikenessView _updateViewForLikeness:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 127;
      __int16 v18 = 2112;
      id v19 = v9;
      v11 = "%s (%d) \"Likeness cache returned an error: %@\"";
      v12 = v10;
      uint32_t v13 = 28;
LABEL_4:
      _os_log_impl(&dword_21566D000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
  }
  else
  {
    if (!v7 || ([v7 isEqual:*(void *)(*(void *)(a1 + 32) + 496)] & 1) != 0)
    {
      [*(id *)(a1 + 40) setImage:v8];
      goto LABEL_9;
    }
    v10 = _PRGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      v15 = "-[PRLikenessView _updateViewForLikeness:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 129;
      v11 = "%s (%d) \"Likeness image came back but client set new likeness!\"";
      v12 = v10;
      uint32_t v13 = 18;
      goto LABEL_4;
    }
  }

LABEL_9:
}

- (BOOL)_shouldRenderStaticRepresentation
{
  v3 = [(PRLikenessView *)self likeness];
  uint64_t v4 = [v3 type];

  if (v4 == 2) {
    return 1;
  }
  id v6 = [(PRLikenessView *)self likeness];
  id v7 = [v6 recipe];
  if (v7)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v8 = [(PRLikenessView *)self likeness];
    if ([v8 staticRepresentation])
    {
      BOOL v5 = 1;
    }
    else
    {
      id v9 = [(PRLikenessView *)self likeness];
      v10 = [v9 staticRepresentationData];
      BOOL v5 = v10 != 0;
    }
  }

  return v5;
}

- (id)_monogramView
{
  monogramView = self->_monogramView;
  if (!monogramView)
  {
    uint64_t v4 = [PRMonogramView alloc];
    [(PRLikenessView *)self bounds];
    BOOL v5 = -[PRMonogramView initWithFrame:](v4, "initWithFrame:");
    id v6 = self->_monogramView;
    self->_monogramView = v5;

    [(PRMonogramView *)self->_monogramView setCircular:[(PRLikenessView *)self isCircular]];
    [(PRLikenessView *)self addSubview:self->_monogramView];
    monogramView = self->_monogramView;
  }
  return monogramView;
}

- (id)_imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    uint64_t v4 = [PRImageView alloc];
    [(PRLikenessView *)self bounds];
    BOOL v5 = -[PRImageView initWithFrame:](v4, "initWithFrame:");
    id v6 = self->_imageView;
    self->_imageView = v5;

    [(PRImageView *)self->_imageView setCircular:[(PRLikenessView *)self isCircular]];
    [(PRImageView *)self->_imageView setContentMode:2];
    [(PRLikenessView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)_imageForLikeness:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void *, void))a4;
  if ([v6 staticRepresentation])
  {
    id v8 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v9 = [v6 staticRepresentation];
    [v6 cropRect];
    v10 = objc_msgSend(v8, "pr_imageWithCGImage:cropRect:", v9);
    v7[2](v7, v6, v10, 0);
  }
  else
  {
    [(PRLikenessView *)self bounds];
    v10 = +[PRLikenessCacheContext contextWithCacheSize:PRLikenessCacheSizeClosestToSize(v11, v12)];
    [v10 setForceDecode:1];
    uint32_t v13 = [MEMORY[0x263F1C920] mainScreen];
    [v13 scale];
    objc_msgSend(v10, "setScale:");

    int v14 = +[PRLikenessCache sharedInstance];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__PRLikenessView__imageForLikeness_completion___block_invoke;
    v15[3] = &unk_264254068;
    int v17 = v7;
    id v16 = v6;
    [v14 imageForLikeness:v16 context:v10 completion:v15];
  }
}

void __47__PRLikenessView__imageForLikeness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dispatch_get_specific((const void *)_PRLikenessViewMainQueueKey))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__PRLikenessView__imageForLikeness_completion___block_invoke_2;
    v7[3] = &unk_264254040;
    id v11 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __47__PRLikenessView__imageForLikeness_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)setLikeness:(id)a3
{
  id v14 = a3;
  if (!-[PRLikenessView _isLikenessEqual:](self, "_isLikenessEqual:"))
  {
    objc_storeStrong((id *)&self->_likeness, a3);
    self->_likenessType = [v14 type];
    id v5 = [v14 recipe];
    id v6 = (NSData *)[v5 copy];
    recipe = self->_recipe;
    self->_recipe = v6;

    [v14 cropRect];
    self->_cropRect.origin.x = v8;
    self->_cropRect.origin.y = v9;
    self->_cropRect.size.width = v10;
    self->_cropRect.size.height = v11;
    staticRepresentation = self->_staticRepresentation;
    if (staticRepresentation) {
      CFRelease(staticRepresentation);
    }
    uint32_t v13 = (CGImage *)[v14 staticRepresentation];
    self->_staticRepresentation = v13;
    if (v13) {
      CFRetain(v13);
    }
    if (v14) {
      [(PRLikenessView *)self _updateViewForLikeness:0];
    }
    else {
      [(PRLikenessView *)self _setDisplayedView:0];
    }
  }
}

- (BOOL)_isLikenessEqual:(id)a3
{
  uint64_t v4 = (PRLikeness *)a3;
  id v5 = v4;
  if (self->_likeness == v4)
  {
    if (!v4)
    {
      BOOL v6 = 1;
      goto LABEL_3;
    }
    unint64_t likenessType = self->_likenessType;
    if (likenessType == [(PRLikeness *)v4 type])
    {
      staticRepresentation = self->_staticRepresentation;
      if (staticRepresentation == (CGImage *)[(PRLikeness *)v5 staticRepresentation])
      {
        [(PRLikeness *)v5 cropRect];
        v16.origin.x = v10;
        v16.origin.y = v11;
        v16.size.width = v12;
        v16.size.height = v13;
        if (CGRectEqualToRect(self->_cropRect, v16))
        {
          recipe = self->_recipe;
          v15 = [(PRLikeness *)v5 recipe];
          [(NSData *)recipe isEqual:v15];
        }
      }
    }
  }
  BOOL v6 = 0;
LABEL_3:

  return v6;
}

- (void)setCircular:(BOOL)a3
{
  if (self->_circular != a3)
  {
    self->_circular = a3;
    -[PRMonogramView setCircular:](self->_monogramView, "setCircular:");
    [(PRImageView *)self->_imageView setCircular:[(PRLikenessView *)self isCircular]];
    [(PRLikenessView *)self setNeedsLayout];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[PRMonogramView setHighlighted:](self->_monogramView, "setHighlighted:");
  }
}

- (void)_setDisplayedView:(id)a3
{
  uint64_t v4 = (PRImageView *)a3;
  imageView = self->_imageView;
  id v7 = (PRMonogramView *)v4;
  if (imageView == v4)
  {
    [(PRImageView *)v4 setHidden:0];
  }
  else
  {
    [(PRImageView *)imageView setHidden:1];
    [(PRImageView *)self->_imageView setImage:0];
  }
  monogramView = self->_monogramView;
  if (monogramView == v7)
  {
    [(PRMonogramView *)v7 setHidden:0];
  }
  else
  {
    [(PRMonogramView *)monogramView setHidden:1];
    [(PRMonogramView *)self->_monogramView setMonogram:0];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PRLikenessView;
  [(PRLikenessView *)&v3 layoutSubviews];
  [(PRLikenessView *)self bounds];
  -[PRMonogramView setFrame:](self->_monogramView, "setFrame:");
  [(PRLikenessView *)self bounds];
  -[PRImageView setFrame:](self->_imageView, "setFrame:");
}

- (void)setNeedsRedraw
{
}

- (PRLikeness)likeness
{
  return self->_likeness;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)shouldDecode
{
  return self->_shouldDecode;
}

- (void)setShouldDecode:(BOOL)a3
{
  self->_shouldDecode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likeness, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_monogramView, 0);
}

@end