@interface SKUIActivityIndicatorView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)_activityIndicatorSize;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringWithLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)_isAnimating;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_startAnimating;
- (void)_stopAnimating;
- (void)_updateSpinnerAnimation;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation SKUIActivityIndicatorView

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        +[SKUIActivityIndicatorView prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIActivityIndicatorView preferredSizeForViewElement:context:]();
  }
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIActivityIndicatorView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = [v8 text];
  if (v18)
  {
    v19 = [a1 _attributedStringWithLabel:v18 context:v9];
    v20 = [v9 labelLayoutCache];
    [v20 requestLayoutForLabel:v18 attributedString:v19 width:(uint64_t)a4];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIActivityIndicatorView sizeThatFitsWidth:viewElement:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  [a1 _activityIndicatorSize];
  double v19 = v18;
  double v21 = v20;
  v22 = [v9 text];

  if (v22)
  {
    [v8 sizeForViewElement:v22 width:a3];
    double v21 = v21 + v24;
    if (v19 < v23) {
      double v19 = v23;
    }
  }

  double v25 = v19;
  double v26 = v21;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __65__SKUIActivityIndicatorView_reloadWithViewElement_width_context___block_invoke;
  uint64_t v15 = &unk_1E64234F8;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  double v19 = a4;
  id v10 = v9;
  id v11 = v8;
  [(SKUIViewReuseView *)self modifyUsingBlock:&v12];
  [(SKUIActivityIndicatorView *)self _updateSpinnerAnimation];
}

void __65__SKUIActivityIndicatorView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  v3 = [*(id *)(a1 + 32) style];
  v4 = [v3 ikColor];
  BOOL v5 = [v4 color];

  id v6 = [*(id *)(a1 + 32) image];
  if (v6)
  {
    uint64_t v7 = [v22 addImageViewWithElement:v6 context:*(void *)(a1 + 48)];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v8 + 472);
    *(void *)(v8 + 472) = v7;

    if (v5) {
      id v10 = v5;
    }
    else {
      id v10 = 0;
    }
    [*(id *)(*(void *)(a1 + 40) + 472) setTintColor:v10];
    [*(id *)(a1 + 32) period];
    if (v15 <= 0.0) {
      double v15 = 1.0;
    }
    *(double *)(*(void *)(a1 + 40) + 496) = v15;
  }
  else
  {
    uint64_t v11 = [v22 addReusableViewWithReuseIdentifier:0x1F1C94568];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(v12 + 480);
    *(void *)(v12 + 480) = v11;

    [*(id *)(*(void *)(a1 + 40) + 480) setActivityIndicatorViewStyle:100];
    uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 480);
    if (v5)
    {
      [v14 setColor:v5];
    }
    else
    {
      double v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v14 setColor:v21];
    }
  }
  id v16 = [*(id *)(a1 + 32) text];
  if (v16)
  {
    uint64_t v17 = [v22 addLabelViewWithElement:v16 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
    uint64_t v18 = *(void *)(a1 + 40);
    double v19 = *(void **)(v18 + 488);
    *(void *)(v18 + 488) = v17;
  }
  double v20 = [*(id *)(a1 + 32) style];
  *(void *)(*(void *)(a1 + 40) + 424) = SKUIViewElementAlignmentForStyle(v20);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUIActivityIndicatorView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIActivityIndicatorView;
  [(SKUIActivityIndicatorView *)&v3 didMoveToSuperview];
  [(SKUIActivityIndicatorView *)self _updateSpinnerAnimation];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIActivityIndicatorView;
  [(SKUIActivityIndicatorView *)&v3 didMoveToWindow];
  [(SKUIActivityIndicatorView *)self _updateSpinnerAnimation];
}

- (void)layoutSubviews
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(SKUIActivityIndicatorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(SKUIViewReuseView *)self allExistingViews];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "sizeThatFits:", v4, v6);
        objc_msgSend(v14, "setFrame:", v11, v12, v15, v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  double top = self->_contentInset.top;
  imageView = self->_imageView;
  if (imageView || (imageView = self->_indicatorView) != 0)
  {
    id v19 = imageView;
    [v19 frame];
    float v21 = (v4 - v20) * 0.5;
    objc_msgSend(v19, "setFrame:", floorf(v21), top);
  }
  else
  {
    id v19 = 0;
  }
  stringView = self->_stringView;
  if (stringView)
  {
    [(SKUIAttributedStringView *)stringView frame];
    float v24 = (v4 - v23) * 0.5;
    -[SKUIAttributedStringView setFrame:](self->_stringView, "setFrame:", floorf(v24), v6 - v25);
  }
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIActivityIndicatorView;
  [(SKUIActivityIndicatorView *)&v4 setHidden:a3];
  [(SKUIActivityIndicatorView *)self _updateSpinnerAnimation];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  imageView = self->_imageView;
  if (imageView || (imageView = self->_indicatorView) != 0)
  {
    objc_msgSend(imageView, "sizeThatFits:", a3.width, a3.height);
    double v7 = v7 + v10;
    if (v9 >= v6) {
      double v6 = v9;
    }
  }
  stringView = self->_stringView;
  if (stringView)
  {
    -[SKUIAttributedStringView sizeThatFits:](stringView, "sizeThatFits:", width, height);
    double v7 = v7 + 18.0;
    if (v12 >= v6) {
      double v6 = v12;
    }
  }
  double v13 = v7 + self->_contentInset.bottom + self->_contentInset.top;
  double v14 = v6 + self->_contentInset.left + self->_contentInset.right;
  result.double height = v13;
  result.double width = v14;
  return result;
}

+ (CGSize)_activityIndicatorSize
{
  if (_activityIndicatorSize_sOnce != -1) {
    dispatch_once(&_activityIndicatorSize_sOnce, &__block_literal_global_59);
  }
  double v2 = *(double *)&_activityIndicatorSize_sIndicatorSize_0;
  double v3 = *(double *)&_activityIndicatorSize_sIndicatorSize_1;
  result.double height = v3;
  result.double width = v2;
  return result;
}

void __51__SKUIActivityIndicatorView__activityIndicatorSize__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:1];
  objc_msgSend(v2, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  _activityIndicatorSize_sIndicatorSize_0 = v0;
  _activityIndicatorSize_sIndicatorSize_1 = v1;
}

+ (id)_attributedStringWithLabel:(id)a3 context:(id)a4
{
  id v4 = a3;
  double v5 = [v4 style];
  double v6 = SKUIViewElementFontWithStyle(v5);
  if (!v6)
  {
    double v7 = SKUIFontPreferredFontForTextStyle(8);
    double v6 = [v7 fontWithSize:11.0];
  }
  uint64_t v8 = [v5 ikColor];
  double v9 = [v8 color];

  if (!v9)
  {
    double v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  double v10 = [v4 text];
  double v11 = [v10 attributedStringWithDefaultFont:v6 foregroundColor:v9 style:v5];

  return v11;
}

- (BOOL)_isAnimating
{
  if (self->_indicatorView) {
    return [(UIActivityIndicatorView *)self->_indicatorView isAnimating];
  }
  else {
    return self->_animating;
  }
}

- (void)_startAnimating
{
  if (![(SKUIActivityIndicatorView *)self _isAnimating])
  {
    indicatorView = self->_indicatorView;
    if (indicatorView)
    {
      [(UIActivityIndicatorView *)indicatorView startAnimating];
    }
    else
    {
      self->_animating = 1;
      id v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation.z"];
      [v8 setDuration:self->_period];
      LODWORD(v4) = 2139095040;
      [v8 setRepeatCount:v4];
      double v5 = (void *)[objc_alloc(NSNumber) initWithDouble:0.0];
      [v8 setFromValue:v5];
      double v6 = (void *)[objc_alloc(NSNumber) initWithDouble:6.28318531];
      [v8 setToValue:v6];
      double v7 = [(UIImageView *)self->_imageView layer];
      [v7 addAnimation:v8 forKey:@"transform"];
    }
  }
}

- (void)_stopAnimating
{
  if ([(SKUIActivityIndicatorView *)self _isAnimating])
  {
    indicatorView = self->_indicatorView;
    if (indicatorView)
    {
      [(UIActivityIndicatorView *)indicatorView stopAnimating];
    }
    else
    {
      self->_animating = 0;
      id v4 = [(UIImageView *)self->_imageView layer];
      [v4 removeAnimationForKey:@"transform"];
    }
  }
}

- (void)_updateSpinnerAnimation
{
  uint64_t v3 = [(SKUIActivityIndicatorView *)self window];
  if (v3
    && (v4 = (void *)v3, char v5 = [(SKUIActivityIndicatorView *)self isHidden], v4, (v5 & 1) == 0))
  {
    [(SKUIActivityIndicatorView *)self _startAnimating];
  }
  else
  {
    [(SKUIActivityIndicatorView *)self _stopAnimating];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "+[SKUIActivityIndicatorView preferredSizeForViewElement:context:]";
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end