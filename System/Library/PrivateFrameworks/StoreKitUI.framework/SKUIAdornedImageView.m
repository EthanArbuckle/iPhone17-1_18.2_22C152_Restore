@interface SKUIAdornedImageView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUIAdornedImageView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 cacheKey:(id)a4 context:(id)a5;
- (void)updatePlayButonBlur:(id)a3 context:(id)a4 image:(id)a5 cacheKey:(id)a6;
@end

@implementation SKUIAdornedImageView

- (SKUIAdornedImageView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIAdornedImageView;
  v3 = -[SKUIAdornedImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SKUIAdornedImageViewReuseView);
    reuseView = v3->_reuseView;
    v3->_reuseView = v4;

    v6 = v3->_reuseView;
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIViewReuseView *)v6 setBackgroundColor:v7];

    [(SKUIAdornedImageView *)v3 addSubview:v3->_reuseView];
    [(SKUIAdornedImageView *)v3 setUserInteractionEnabled:1];
  }
  return v3;
}

- (void)setImage:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIAdornedImageView;
  [(SKUIImageView *)&v3 setImage:a3];
}

- (void)setImage:(id)a3 cacheKey:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(SKUIAdornedImageView *)self setImage:a3];
  id v11 = [(SKUIAdornedImageViewReuseView *)self->_reuseView playButton];
  v10 = [(SKUIAdornedImageView *)self image];
  [(SKUIAdornedImageView *)self updatePlayButonBlur:v11 context:v8 image:v10 cacheKey:v9];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SKUIAdornedImageViewReuseView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  +[SKUIAdornedImageViewReuseView preferredSizeForViewElement:a3 context:a4];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SKUIAdornedImageViewReuseView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v18 = a3;
  id v8 = a5;
  [(SKUIAdornedImageViewReuseView *)self->_reuseView reloadWithViewElement:v18 width:v8 context:a4];
  id v9 = [v8 imageResourceCacheKeyForViewElement:v18];
  if (v9)
  {
    v10 = [(SKUIAdornedImageViewReuseView *)self->_reuseView playButton];
    id v11 = [(SKUIAdornedImageView *)self image];
    [(SKUIAdornedImageView *)self updatePlayButonBlur:v10 context:v8 image:v11 cacheKey:v9];
  }
  [v18 layerShadowRadius];
  if (v12 != 0.0)
  {
    v13 = [(SKUIAdornedImageView *)self layer];
    [v13 setMasksToBounds:0];

    v14 = [(SKUIAdornedImageView *)self layer];
    [v18 layerShadowRadius];
    objc_msgSend(v14, "setShadowRadius:");

    v15 = [(SKUIAdornedImageView *)self layer];
    [v18 layerShadowOffset];
    objc_msgSend(v15, "setShadowOffset:");
  }
  [v18 layerShadowOpacity];
  if (v16 != 0.0)
  {
    v17 = [(SKUIAdornedImageView *)self layer];
    [v18 layerShadowOpacity];
    objc_msgSend(v17, "setShadowOpacity:");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SKUIAdornedImageViewReuseView *)self->_reuseView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SKUIAdornedImageViewReuseView *)self->_reuseView updateWithItemState:a3 context:a4 animated:a5];
}

- (void)updatePlayButonBlur:(id)a3 context:(id)a4 image:(id)a5 cacheKey:(id)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12 && v10 && v19 && v11)
  {
    v13 = [v10 blurColorForCacheKey:v12];
    if (!v13)
    {
      [(SKUIAdornedImageView *)self bounds];
      [(SKUIAdornedImageViewReuseView *)self->_reuseView frameForView:v19];
      CGFloat x = v21.origin.x;
      CGFloat y = v21.origin.y;
      CGFloat width = v21.size.width;
      CGFloat height = v21.size.height;
      CGRectGetMaxX(v21);
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGRectGetMaxY(v22);
      [v19 buttonSize];
      uint64_t v18 = +[SKUIPlayButtonControl blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:](SKUIPlayButtonControl, "blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:", v11);
      if (v18)
      {
        v13 = (void *)v18;
        [v10 setBlurColor:v18 cacheKey:v12];
      }
      else
      {
        v13 = [v19 defaultBackgroundColor];
        [v10 setBlurColor:v13 cacheKey:v12];
        if (!v13) {
          goto LABEL_10;
        }
      }
    }
    [v19 setControlColor:v13];
  }
LABEL_10:
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SKUIAdornedImageViewReuseView *)self->_reuseView viewForElementIdentifier:a3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIAdornedImageView;
  [(SKUIImageView *)&v3 layoutSubviews];
  [(SKUIAdornedImageView *)self bounds];
  -[SKUIAdornedImageViewReuseView setFrame:](self->_reuseView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end