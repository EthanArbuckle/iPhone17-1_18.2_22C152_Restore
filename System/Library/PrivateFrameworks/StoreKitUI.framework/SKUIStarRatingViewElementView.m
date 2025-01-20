@interface SKUIStarRatingViewElementView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringWithViewElement:(id)a3 context:(id)a4;
+ (id)textPropertiesForViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIStarRatingViewElementView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)elementSpacing;
- (void)drawRect:(CGRect)a3;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setElementSpacing:(int64_t)a3;
@end

@implementation SKUIStarRatingViewElementView

- (SKUIStarRatingViewElementView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        -[SKUIStarRatingViewElementView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIStarRatingViewElementView;
  v16 = -[SKUIStarRatingViewElementView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    v16->_elementSpacing = 3;
    [(SKUIStarRatingViewElementView *)v16 setContentMode:3];
  }
  return v17;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIStarRatingViewElementView prefetchResourcesForViewElement:reason:context:]();
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIStarRatingViewElementView preferredSizeForViewElement:context:]();
  }
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v5;
  result.double width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIStarRatingViewElementView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = [a1 _attributedStringWithViewElement:v9 context:v8];
  objc_super v19 = [v8 labelLayoutCache];

  [v19 requestLayoutForViewElement:v9 attributedString:v18 width:(uint64_t)a4];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIStarRatingViewElementView sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = +[SKUIRatingStarsCache cacheWithProperties:1];
  [v8 ratingValue];
  objc_super v19 = [v17 ratingStarsImageForRating:v18];

  [v19 size];
  double v21 = v20;
  double v23 = v22;
  v24 = [v7 labelLayoutCache];

  [v24 sizeForViewElement:v8 width:a3];
  double v26 = v25;
  double v28 = v27;

  if (v23 < v28 && v26 > 0.00000011920929) {
    double v23 = v28;
  }
  double v30 = -0.0;
  if (v26 > 0.00000011920929) {
    double v30 = v26 + 3.0;
  }
  double v31 = v21 + v30;

  double v32 = v31;
  double v33 = v23;
  result.double height = v33;
  result.double width = v32;
  return result;
}

+ (id)textPropertiesForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIStarRatingViewElementView textPropertiesForViewElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = [v8 labelLayoutCache];
  float v18 = [v17 layoutForWidth:(uint64_t)a4 viewElement:v7];

  if (v18)
  {
    objc_super v19 = [[SKUIViewTextProperties alloc] initWithStringLayout:v18];
    double v20 = +[SKUIRatingStarsCache cacheWithProperties:1];
    [v7 ratingValue];
    double v22 = [v20 ratingStarsImageForRating:v21];

    [v18 boundingSize];
    double v24 = v23;
    [v22 size];
    if (v24 < v25)
    {
      [(SKUIViewTextProperties *)v19 setBaselineOffsetFromBottom:0.0];
      [(SKUIViewTextProperties *)v19 setFirstBaselineOffset:0.0];
    }
  }
  else
  {
    objc_super v19 = 0;
  }

  return v19;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  BOOL v9 = +[SKUIRatingStarsCache cacheWithProperties:1];
  [v14 ratingValue];
  uint64_t v11 = [v9 ratingStarsImageForRating:v10];

  if (self->_starRatingImage != v11)
  {
    objc_storeStrong((id *)&self->_starRatingImage, v11);
    [(SKUIStarRatingViewElementView *)self setNeedsDisplay];
  }
  uint64_t v12 = [v8 labelLayoutCache];
  uint64_t v13 = [v12 layoutForWidth:(uint64_t)a4 viewElement:v14];

  if (v13 != self->_textLayout)
  {
    objc_storeStrong((id *)&self->_textLayout, v13);
    [(SKUIStarRatingViewElementView *)self setNeedsDisplay];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUIStarRatingViewElementView *)self setNeedsDisplay];
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

- (void)drawRect:(CGRect)a3
{
  [(SKUIStarRatingViewElementView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  id v8 = (double *)MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  starRatingImage = self->_starRatingImage;
  double v14 = v11;
  double v15 = v9;
  double v16 = v10;
  if (starRatingImage)
  {
    [(UIImage *)starRatingImage size];
    double v14 = v17;
    *(float *)&double v17 = (v7 - v17 + 2.0) * 0.5;
    double v16 = floorf(*(float *)&v17);
  }
  CGFloat rect = v15;
  double v18 = *v8;
  textLayout = self->_textLayout;
  if (textLayout
    && ([(SKUIAttributedStringLayout *)textLayout boundingSize],
        double v9 = v20,
        double v11 = v21,
        *(float *)&double v20 = (v7 - v21) * 0.5,
        double v10 = floorf(*(float *)&v20),
        self->_starRatingImage))
  {
    double v22 = v18;
    if ((ShouldReverseLayoutDirection & 1) == 0)
    {
      v33.origin.double x = v18;
      v33.origin.double y = v16;
      v33.size.double width = rect;
      v33.size.double height = v14;
      double v22 = CGRectGetMaxX(v33) + (double)self->_elementSpacing;
    }
    if (v9 >= v5 - v22) {
      double v9 = v5 - v22;
    }
    if (v14 < v11)
    {
      [(SKUIAttributedStringLayout *)self->_textLayout baselineOffset];
      *(float *)&double v23 = v23 + v10 - v14 + 2.0;
      double v16 = ceilf(*(float *)&v23);
    }
  }
  else
  {
    double v22 = v18;
  }
  if (ShouldReverseLayoutDirection && self->_starRatingImage)
  {
    v34.origin.double x = v22;
    v34.origin.double y = v10;
    v34.size.double width = v9;
    v34.size.double height = v11;
    double v18 = CGRectGetMaxX(v34) + (double)self->_elementSpacing;
  }
  id v31 = [(SKUIAttributedStringLayout *)self->_textLayout attributedString];
  if (v31)
  {
    double v24 = [(SKUIAttributedStringLayout *)self->_textLayout stringDrawingContext];
    objc_msgSend(v31, "drawWithRect:options:context:", 33, v24, v22, v10, v9, v11);
  }
  if (storeShouldReverseLayoutDirection())
  {
    double v25 = (void *)MEMORY[0x1E4FB1818];
    double v26 = [(UIImage *)self->_starRatingImage CGImage];
    [(UIImage *)self->_starRatingImage scale];
    objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v26, 4);
    double v27 = (UIImage *)objc_claimAutoreleasedReturnValue();
    double v28 = self->_starRatingImage;
    self->_starRatingImage = v27;
  }
  -[UIImage drawInRect:blendMode:alpha:](self->_starRatingImage, "drawInRect:blendMode:alpha:", 0, v18, v16, recta, v14, 1.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  starRatingImage = self->_starRatingImage;
  if (starRatingImage)
  {
    [(UIImage *)starRatingImage size];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  textLayout = self->_textLayout;
  if (textLayout)
  {
    [(SKUIAttributedStringLayout *)textLayout boundingSize];
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_starRatingImage)
  {
    if (self->_textLayout)
    {
      double v10 = v10 + v6 + (double)self->_elementSpacing;
      if (v8 >= v11) {
        double v11 = v8;
      }
    }
    else
    {
      double v10 = v6;
      double v11 = v8;
    }
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

+ (id)_attributedStringWithViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  double v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    uint64_t v9 = [v6 containerViewElementType];
    if (v9 == 134 || v9 == 104)
    {
      uint64_t v10 = SKUIFontPreferredFontForTextStyle(21);
    }
    else
    {
      uint64_t v10 = SKUIFontForTextStyle(10);
    }
    double v8 = (void *)v10;
  }
  double v11 = [v6 tintColor];
  uint64_t v12 = SKUIViewElementPlainColorWithStyle(v7, v11);

  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  }
  uint64_t v13 = [v5 text];
  double v14 = [v13 attributedStringWithDefaultFont:v8 foregroundColor:v12 style:v7];

  return v14;
}

- (int64_t)elementSpacing
{
  return self->_elementSpacing;
}

- (void)setElementSpacing:(int64_t)a3
{
  self->_elementSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayout, 0);

  objc_storeStrong((id *)&self->_starRatingImage, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:reason:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIStarRatingViewElementView prefetchResourcesForViewElement:reason:context:]";
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIStarRatingViewElementView preferredSizeForViewElement:context:]";
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)textPropertiesForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end