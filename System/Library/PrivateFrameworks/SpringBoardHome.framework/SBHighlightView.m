@interface SBHighlightView
+ (id)_highlightImageWithHeight:(double)a3 alpha:(double)a4;
+ (id)imageCache;
- (SBHighlightView)initWithFrame:(CGRect)a3 highlightAlpha:(double)a4 highlightHeight:(double)a5;
- (double)highlightAlpha;
- (double)highlightHeight;
- (void)layoutSubviews;
@end

@implementation SBHighlightView

+ (id)imageCache
{
  if ([(id)*MEMORY[0x1E4FB2608] isFrontBoard])
  {
    id v3 = [MEMORY[0x1E4FA5F78] systemAppPersistenteCache];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__SBHighlightView_imageCache__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (imageCache_onceToken != -1) {
      dispatch_once(&imageCache_onceToken, block);
    }
    id v3 = (id)imageCache_specialCache;
  }
  return v3;
}

void __29__SBHighlightView_imageCache__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FA5F78]);
  NSStringFromClass(*(Class *)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 initWithUniqueIdentifier:v5];
  v4 = (void *)imageCache_specialCache;
  imageCache_specialCache = v3;
}

+ (id)_highlightImageWithHeight:(double)a3 alpha:(double)a4
{
  v7 = [NSString stringWithFormat:@"highlight-%.2fa-%.1fh", *(void *)&a4, *(void *)&a3];
  v8 = [a1 imageCache];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__SBHighlightView__highlightImageWithHeight_alpha___block_invoke;
  v11[3] = &__block_descriptor_48_e18___UIImage_16__0_Q8l;
  *(double *)&v11[4] = a3;
  *(double *)&v11[5] = a4;
  v9 = [v8 imageForKey:v7 generatingIfNecessaryWithBlock:v11];

  return v9;
}

id __51__SBHighlightView__highlightImageWithHeight_alpha___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 32) + 2.0;
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", 1.0, v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  v7[2] = __51__SBHighlightView__highlightImageWithHeight_alpha___block_invoke_2;
  v7[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v7[5] = 0x3FF0000000000000;
  *(double *)&v7[6] = v2;
  v7[7] = v4;
  id v5 = [v3 imageWithActions:v7];

  return v5;
}

void __51__SBHighlightView__highlightImageWithHeight_alpha___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (CGContext *)[a2 CGContext];
  uint64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 set];

  CGContextSetAlpha(v3, *(CGFloat *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = 0;
  double v8 = 1.0;
  CGContextFillRect(v3, *(CGRect *)&v7);
}

- (SBHighlightView)initWithFrame:(CGRect)a3 highlightAlpha:(double)a4 highlightHeight:(double)a5
{
  v15.receiver = self;
  v15.super_class = (Class)SBHighlightView;
  uint64_t v7 = -[SBHighlightView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v8 = v7;
  if (v7)
  {
    v7->_highlightAlpha = fmin(fmax(a4, 0.0), 1.0);
    v7->_highlightHeight = a5;
    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    v10 = [(id)objc_opt_class() _highlightImageWithHeight:a5 alpha:a4];
    uint64_t v11 = [v9 initWithImage:v10];
    highlight = v8->_highlight;
    v8->_highlight = (UIImageView *)v11;

    v13 = v8->_highlight;
    [(SBHighlightView *)v8 bounds];
    -[UIImageView setFrame:](v13, "setFrame:");
    [(SBHighlightView *)v8 addSubview:v8->_highlight];
  }
  return v8;
}

- (void)layoutSubviews
{
  highlight = self->_highlight;
  [(SBHighlightView *)self bounds];
  -[UIImageView setFrame:](highlight, "setFrame:");
}

- (double)highlightAlpha
{
  return self->_highlightAlpha;
}

- (double)highlightHeight
{
  return self->_highlightHeight;
}

- (void).cxx_destruct
{
}

@end