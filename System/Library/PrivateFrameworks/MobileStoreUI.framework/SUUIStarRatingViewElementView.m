@interface SUUIStarRatingViewElementView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringWithViewElement:(id)a3 context:(id)a4;
+ (id)textPropertiesForViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIStarRatingViewElementView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)elementSpacing;
- (void)drawRect:(CGRect)a3;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setElementSpacing:(int64_t)a3;
@end

@implementation SUUIStarRatingViewElementView

- (SUUIStarRatingViewElementView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIStarRatingViewElementView;
  v3 = -[SUUIStarRatingViewElementView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_elementSpacing = 3;
    [(SUUIStarRatingViewElementView *)v3 setContentMode:3];
  }
  return v4;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = [a1 _attributedStringWithViewElement:v9 context:v8];
  v10 = [v8 labelLayoutCache];

  [v10 requestLayoutForViewElement:v9 attributedString:v11 width:(uint64_t)a4];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[SUUIRatingStarsCache cacheWithProperties:1];
  [v8 ratingValue];
  id v11 = [v9 ratingStarsImageForRating:v10];

  [v11 size];
  double v13 = v12;
  double v15 = v14;
  v16 = [v7 labelLayoutCache];

  [v16 sizeForViewElement:v8 width:a3];
  double v18 = v17;
  double v20 = v19;

  if (v15 < v20 && v18 > 0.00000011920929) {
    double v15 = v20;
  }
  double v22 = -0.0;
  if (v18 > 0.00000011920929) {
    double v22 = v18 + 3.0;
  }
  double v23 = v13 + v22;

  double v24 = v23;
  double v25 = v15;
  result.height = v25;
  result.width = v24;
  return result;
}

+ (id)textPropertiesForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = [a5 labelLayoutCache];
  id v9 = [v8 layoutForWidth:(uint64_t)a4 viewElement:v7];

  if (v9)
  {
    float v10 = [[SUUIViewTextProperties alloc] initWithStringLayout:v9];
    id v11 = +[SUUIRatingStarsCache cacheWithProperties:1];
    [v7 ratingValue];
    double v13 = [v11 ratingStarsImageForRating:v12];

    [v9 boundingSize];
    double v15 = v14;
    [v13 size];
    if (v15 < v16)
    {
      [(SUUIViewTextProperties *)v10 setBaselineOffsetFromBottom:0.0];
      [(SUUIViewTextProperties *)v10 setFirstBaselineOffset:0.0];
    }
  }
  else
  {
    float v10 = 0;
  }

  return v10;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  id v9 = +[SUUIRatingStarsCache cacheWithProperties:1];
  [v14 ratingValue];
  id v11 = [v9 ratingStarsImageForRating:v10];

  if (self->_starRatingImage != v11)
  {
    objc_storeStrong((id *)&self->_starRatingImage, v11);
    [(SUUIStarRatingViewElementView *)self setNeedsDisplay];
  }
  float v12 = [v8 labelLayoutCache];
  double v13 = [v12 layoutForWidth:(uint64_t)a4 viewElement:v14];

  if (v13 != self->_textLayout)
  {
    objc_storeStrong((id *)&self->_textLayout, v13);
    [(SUUIStarRatingViewElementView *)self setNeedsDisplay];
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
    [(SUUIStarRatingViewElementView *)self setNeedsDisplay];
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
  [(SUUIStarRatingViewElementView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  id v8 = (double *)MEMORY[0x263F001A8];
  double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
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
    && ([(SUUIAttributedStringLayout *)textLayout boundingSize],
        double v9 = v20,
        double v11 = v21,
        *(float *)&double v20 = (v7 - v21) * 0.5,
        double v10 = floorf(*(float *)&v20),
        self->_starRatingImage))
  {
    double v22 = v18;
    if ((ShouldReverseLayoutDirection & 1) == 0)
    {
      v33.origin.x = v18;
      v33.origin.y = v16;
      v33.size.width = rect;
      v33.size.height = v14;
      double v22 = CGRectGetMaxX(v33) + (double)self->_elementSpacing;
    }
    if (v9 >= v5 - v22) {
      double v9 = v5 - v22;
    }
    if (v14 < v11)
    {
      [(SUUIAttributedStringLayout *)self->_textLayout baselineOffset];
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
    v34.origin.x = v22;
    v34.origin.y = v10;
    v34.size.width = v9;
    v34.size.height = v11;
    double v18 = CGRectGetMaxX(v34) + (double)self->_elementSpacing;
  }
  id v31 = [(SUUIAttributedStringLayout *)self->_textLayout attributedString];
  if (v31)
  {
    double v24 = [(SUUIAttributedStringLayout *)self->_textLayout stringDrawingContext];
    objc_msgSend(v31, "drawWithRect:options:context:", 33, v24, v22, v10, v9, v11);
  }
  if (storeShouldReverseLayoutDirection())
  {
    double v25 = (void *)MEMORY[0x263F827E8];
    v26 = [(UIImage *)self->_starRatingImage CGImage];
    [(UIImage *)self->_starRatingImage scale];
    objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v26, 4);
    v27 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v28 = self->_starRatingImage;
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
    double v6 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  textLayout = self->_textLayout;
  if (textLayout)
  {
    [(SUUIAttributedStringLayout *)textLayout boundingSize];
  }
  else
  {
    double v10 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
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
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)_attributedStringWithViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  double v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    uint64_t v9 = [v6 containerViewElementType];
    if (v9 == 134 || v9 == 104)
    {
      uint64_t v10 = SUUIFontPreferredFontForTextStyle(21);
    }
    else
    {
      uint64_t v10 = SUUIFontForTextStyle(10);
    }
    double v8 = (void *)v10;
  }
  double v11 = [v6 tintColor];
  float v12 = SUUIViewElementPlainColorWithStyle(v7, v11);

  if (!v12)
  {
    float v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
  }
  double v13 = [v5 text];
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

@end