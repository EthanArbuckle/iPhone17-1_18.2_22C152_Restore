@interface SUUIActivityIndicatorView
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

@implementation SUUIActivityIndicatorView

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
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
  id v11 = a5;
  double v8 = [a3 text];
  if (v8)
  {
    double v9 = [a1 _attributedStringWithLabel:v8 context:v11];
    double v10 = [v11 labelLayoutCache];
    [v10 requestLayoutForLabel:v8 attributedString:v9 width:(uint64_t)a4];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [a1 _activityIndicatorSize];
  double v11 = v10;
  double v13 = v12;
  v14 = [v9 text];

  if (v14)
  {
    [v8 sizeForViewElement:v14 width:a3];
    double v13 = v13 + v16;
    if (v11 < v15) {
      double v11 = v15;
    }
  }

  double v17 = v11;
  double v18 = v13;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __65__SUUIActivityIndicatorView_reloadWithViewElement_width_context___block_invoke;
  double v15 = &unk_265400C88;
  id v16 = v8;
  double v17 = self;
  id v18 = v9;
  double v19 = a4;
  id v10 = v9;
  id v11 = v8;
  [(SUUIViewReuseView *)self modifyUsingBlock:&v12];
  [(SUUIActivityIndicatorView *)self _updateSpinnerAnimation];
}

void __65__SUUIActivityIndicatorView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  v3 = [*(id *)(a1 + 32) style];
  v4 = [v3 ikColor];
  v5 = [v4 color];

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
    uint64_t v11 = [v22 addReusableViewWithReuseIdentifier:0x2704F9690];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(v12 + 480);
    *(void *)(v12 + 480) = v11;

    [*(id *)(*(void *)(a1 + 40) + 480) setActivityIndicatorViewStyle:100];
    v14 = *(void **)(*(void *)(a1 + 40) + 480);
    if (v5)
    {
      [v14 setColor:v5];
    }
    else
    {
      v21 = [MEMORY[0x263F825C8] secondaryLabelColor];
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
  v20 = [*(id *)(a1 + 32) style];
  *(void *)(*(void *)(a1 + 40) + 424) = SUUIViewElementAlignmentForStyle(v20);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIActivityIndicatorView *)self setNeedsLayout];
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
  v3.super_class = (Class)SUUIActivityIndicatorView;
  [(SUUIActivityIndicatorView *)&v3 didMoveToSuperview];
  [(SUUIActivityIndicatorView *)self _updateSpinnerAnimation];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIActivityIndicatorView;
  [(SUUIActivityIndicatorView *)&v3 didMoveToWindow];
  [(SUUIActivityIndicatorView *)self _updateSpinnerAnimation];
}

- (void)layoutSubviews
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  [(SUUIActivityIndicatorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(SUUIViewReuseView *)self allExistingViews];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    double v11 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
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
    [(SUUIAttributedStringView *)stringView frame];
    float v24 = (v4 - v23) * 0.5;
    -[SUUIAttributedStringView setFrame:](self->_stringView, "setFrame:", floorf(v24), v6 - v25);
  }
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIActivityIndicatorView;
  [(SUUIActivityIndicatorView *)&v4 setHidden:a3];
  [(SUUIActivityIndicatorView *)self _updateSpinnerAnimation];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
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
    -[SUUIAttributedStringView sizeThatFits:](stringView, "sizeThatFits:", width, height);
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
    dispatch_once(&_activityIndicatorSize_sOnce, &__block_literal_global_64);
  }
  double v2 = *(double *)&_activityIndicatorSize_sIndicatorSize_0;
  double v3 = *(double *)&_activityIndicatorSize_sIndicatorSize_1;
  result.double height = v3;
  result.double width = v2;
  return result;
}

void __51__SUUIActivityIndicatorView__activityIndicatorSize__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:1];
  objc_msgSend(v2, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  _activityIndicatorSize_sIndicatorSize_0 = v0;
  _activityIndicatorSize_sIndicatorSize_1 = v1;
}

+ (id)_attributedStringWithLabel:(id)a3 context:(id)a4
{
  id v4 = a3;
  double v5 = [v4 style];
  double v6 = SUUIViewElementFontWithStyle(v5);
  if (!v6)
  {
    double v7 = SUUIFontPreferredFontForTextStyle(8);
    double v6 = [v7 fontWithSize:11.0];
  }
  uint64_t v8 = [v5 ikColor];
  double v9 = [v8 color];

  if (!v9)
  {
    double v9 = [MEMORY[0x263F825C8] secondaryLabelColor];
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
  if (![(SUUIActivityIndicatorView *)self _isAnimating])
  {
    indicatorView = self->_indicatorView;
    if (indicatorView)
    {
      [(UIActivityIndicatorView *)indicatorView startAnimating];
    }
    else
    {
      self->_animating = 1;
      id v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.z"];
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
  if ([(SUUIActivityIndicatorView *)self _isAnimating])
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
  uint64_t v3 = [(SUUIActivityIndicatorView *)self window];
  if (v3
    && (id v4 = (void *)v3, v5 = [(SUUIActivityIndicatorView *)self isHidden], v4, (v5 & 1) == 0))
  {
    [(SUUIActivityIndicatorView *)self _startAnimating];
  }
  else
  {
    [(SUUIActivityIndicatorView *)self _stopAnimating];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end