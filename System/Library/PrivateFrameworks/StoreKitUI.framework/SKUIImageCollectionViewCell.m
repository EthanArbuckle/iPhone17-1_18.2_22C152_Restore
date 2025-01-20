@interface SKUIImageCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)showsReflectionImage;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (id)viewForElementIdentifier:(id)a3;
- (void)_reloadHighlightImageView;
- (void)layoutSubviews;
- (void)reloadWithCarouselItem:(id)a3 size:(CGSize)a4 context:(id)a5;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowsReflectionImage:(BOOL)a3;
@end

@implementation SKUIImageCollectionViewCell

- (void)reloadWithCarouselItem:(id)a3 size:(CGSize)a4 context:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIImageCollectionViewCell reloadWithCarouselItem:size:context:]();
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__SKUIImageCollectionViewCell_reloadWithCarouselItem_size_context___block_invoke;
  v13[3] = &unk_1E6422358;
  CGFloat v17 = width;
  CGFloat v18 = height;
  id v14 = v9;
  id v15 = v10;
  v16 = self;
  id v11 = v10;
  id v12 = v9;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v13];
}

void __67__SKUIImageCollectionViewCell_reloadWithCarouselItem_size_context___block_invoke(uint64_t a1, void *a2)
{
  id v25 = [a2 addReusableViewWithReuseIdentifier:0x1F1C94728];
  v3 = [*(id *)(a1 + 32) accessibilityLabel];
  [v25 setAccessibilityLabel:v3];

  [v25 setEnabled:0];
  objc_msgSend(v25, "setImageSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = objc_alloc_init(SKUIStyledImageDataConsumer);
  double v5 = 0.0;
  v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  [(SKUIStyledImageDataConsumer *)v4 setBorderColor:v6];

  v7 = [*(id *)(a1 + 40) aggregateValueForKey:@"SKUICIBWK"];
  v8 = v7;
  if (v7)
  {
    [v7 UIEdgeInsetsValue];
    double v5 = v12;
  }
  else
  {
    double v10 = 1.0;
    double v9 = 0.0;
    double v11 = 0.0;
  }
  -[SKUIStyledImageDataConsumer setBorderWidths:](v4, "setBorderWidths:", v5, v9, v10, v11);
  v13 = objc_msgSend(*(id *)(a1 + 32), "artworkForSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v14 = [*(id *)(a1 + 40) imageResourceCacheKeyForArtwork:v13];
  uint64_t v15 = *(void *)(a1 + 48);
  v16 = *(void **)(v15 + 824);
  *(void *)(v15 + 824) = v14;

  CGFloat v17 = [*(id *)(a1 + 40) requestIdentifierForArtwork:v13];
  CGFloat v18 = *(void **)(a1 + 40);
  if (v17)
  {
    v19 = [v18 resourceLoader];
    uint64_t v20 = objc_msgSend(v19, "cachedResourceForRequestIdentifier:", objc_msgSend(v17, "unsignedIntegerValue"));
    if (v20)
    {
      v21 = (void *)v20;

      goto LABEL_12;
    }
    [*(id *)(a1 + 40) loadImageForArtwork:v13 dataConsumer:v4 reason:1];
  }
  else
  {
    [v18 loadImageForArtwork:v13 dataConsumer:v4 reason:1];
  }
  BOOL v22 = [(SKUIStyledImageDataConsumer *)v4 isImagePlaceholderAvailable];
  v23 = *(void **)(a1 + 40);
  if (v22)
  {
    v24 = [v23 placeholderColor];
    v21 = [(SKUIStyledImageDataConsumer *)v4 imagePlaceholderForColor:v24];
  }
  else
  {
    v21 = objc_msgSend(v23, "placeholderImageForSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
LABEL_12:
  [v25 setContents:v21];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIImageCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  CGFloat v17 = [v8 requestIdentifierForViewElement:v7];

  if (!v17)
  {
    id v18 = v7;
    if ([v18 elementType] == 152)
    {
      uint64_t v19 = [v18 thumbnailImage];

      id v18 = (id)v19;
    }
    [v8 loadImageForImageElement:v18 reason:a4];
  }
  return v17 == 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIImageCollectionViewCell preferredSizeForViewElement:context:]();
  }
  [v6 sizeForViewElement:v5 width:1.79769313e308];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIImageCollectionViewCell requestLayoutForViewElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  +[SKUIAdornedImageView requestLayoutForViewElement:v7 width:v8 context:a4];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIImageCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  [v8 sizeForViewElement:v7 width:a3];
  double v19 = v18;
  if (v17 > 0.00000011920929)
  {
    float v20 = v18 * (a3 / v17);
    double v19 = floorf(v20);
  }

  double v21 = a3;
  double v22 = v19;
  result.CGFloat height = v22;
  result.CGFloat width = v21;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [v8 imageResourceCacheKeyForViewElement:v7];
  id imageRequestCacheKey = self->_imageRequestCacheKey;
  self->_id imageRequestCacheKey = v9;

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__SKUIImageCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v13[3] = &unk_1E6422380;
  id v14 = v7;
  id v15 = v8;
  uint64_t v16 = self;
  id v11 = v8;
  id v12 = v7;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v13];
}

void __67__SKUIImageCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) elementType];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v3 == 152)
  {
    id v6 = (id)[v10 addImageViewWithVideoElement:v4 context:v5];
    if (*(unsigned char *)(*(void *)(a1 + 48) + 832)) {
      id v7 = (id)[v10 addImageViewWithVideoElement:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v8 = (id)[v10 addImageViewWithElement:v4 context:v5];
    if (*(unsigned char *)(*(void *)(a1 + 48) + 832)) {
      id v9 = (id)[v10 addImageViewWithElement:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
    }
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [a5 requestIdentifierForResourceCacheKey:self->_imageRequestCacheKey];
  id v11 = v10;
  if (v10 && (uint64_t v12 = [v10 unsignedIntegerValue], v12 == objc_msgSend(v9, "requestIdentifier")))
  {
    uint64_t v13 = [(SKUIViewReuseCollectionViewCell *)self allExistingViews];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) setImage:v8];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SKUIImageCollectionViewCell;
  [(SKUICollectionViewCell *)&v22 layoutSubviews];
  uint64_t v3 = [(SKUIImageCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(SKUIViewReuseCollectionViewCell *)self allExistingViews];
  uint64_t v13 = [v12 firstObject];
  if (v13)
  {
    [(SKUIViewReuseCollectionViewCell *)self contentInset];
    if (self->_showsReflectionImage)
    {
      float v18 = v11 * 0.5;
      double v14 = v14 + floorf(v18);
    }
    objc_msgSend(v13, "setFrame:", v5 + v15, v7 + v14, v9 - (v15 + v17), v11 - (v16 + v14));
  }
  if ([v12 count] == 2)
  {
    double v19 = [v12 objectAtIndex:1];
    long long v20 = v19;
    if (self->_showsReflectionImage)
    {
      [v13 frame];
      objc_msgSend(v20, "setFrame:");
      [v20 setHidden:0];
      CGAffineTransformMakeScale(&v21, -1.0, -1.0);
      [v20 setTransform:&v21];
    }
    else
    {
      [v19 setHidden:1];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIImageCollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setHighlighted:a3];
  [(SKUIImageCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIImageCollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setSelected:a3];
  [(SKUIImageCollectionViewCell *)self _reloadHighlightImageView];
}

- (void)_reloadHighlightImageView
{
  if (([(SKUIImageCollectionViewCell *)self isHighlighted] & 1) == 0
    && ![(SKUIImageCollectionViewCell *)self isSelected])
  {
    highlightImageView = self->_highlightImageView;
    if (!highlightImageView) {
      return;
    }
    float v18 = highlightImageView;
    double v19 = self->_highlightImageView;
    self->_highlightImageView = 0;

    [MEMORY[0x1E4F39CF8] begin];
    long long v20 = (void *)MEMORY[0x1E4F39CF8];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__SKUIImageCollectionViewCell__reloadHighlightImageView__block_invoke;
    v21[3] = &unk_1E6422020;
    objc_super v22 = v18;
    objc_super v4 = v18;
    [v20 setCompletionBlock:v21];
    [(SKUIImageView *)v4 setAlpha:0.0];
    [MEMORY[0x1E4F39CF8] commit];
    double v16 = v22;
    goto LABEL_9;
  }
  uint64_t v3 = [(SKUIViewReuseCollectionViewCell *)self allExistingViews];
  objc_super v4 = [v3 firstObject];

  if (v4)
  {
    double v5 = self->_highlightImageView;
    if (!v5)
    {
      double v6 = objc_alloc_init(SKUIImageView);
      double v7 = self->_highlightImageView;
      self->_highlightImageView = v6;

      [(SKUIImageView *)self->_highlightImageView setAlpha:0.300000012];
      double v8 = self->_highlightImageView;
      double v9 = [MEMORY[0x1E4FB1618] clearColor];
      [(SKUIImageView *)v8 setBackgroundColor:v9];

      double v5 = self->_highlightImageView;
    }
    [(SKUIImageView *)v4 bounds];
    -[SKUIImageView setBounds:](v5, "setBounds:");
    double v10 = self->_highlightImageView;
    [(SKUIImageView *)v4 center];
    -[SKUIImageView setCenter:](v10, "setCenter:");
    double v11 = self->_highlightImageView;
    uint64_t v12 = [(SKUIImageView *)v4 image];
    uint64_t v13 = [MEMORY[0x1E4FB1618] blackColor];
    double v14 = [v12 _flatImageWithColor:v13];
    [(SKUIImageView *)v11 setImage:v14];

    double v15 = self->_highlightImageView;
    [(SKUIImageView *)v4 transform];
    [(SKUIImageView *)v15 setTransform:v23];
    double v16 = [(SKUIImageCollectionViewCell *)self contentView];
    [v16 insertSubview:self->_highlightImageView aboveSubview:v4];
LABEL_9:
  }
}

uint64_t __56__SKUIImageCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (BOOL)showsReflectionImage
{
  return self->_showsReflectionImage;
}

- (void)setShowsReflectionImage:(BOOL)a3
{
  self->_showsReflectionImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageRequestCacheKey, 0);

  objc_storeStrong((id *)&self->_highlightImageView, 0);
}

- (void)reloadWithCarouselItem:size:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIImageCollectionViewCell reloadWithCarouselItem:size:context:]";
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIImageCollectionViewCell preferredSizeForViewElement:context:]";
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end