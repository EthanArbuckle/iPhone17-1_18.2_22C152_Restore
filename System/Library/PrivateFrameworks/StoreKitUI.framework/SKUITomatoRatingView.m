@interface SKUITomatoRatingView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForRating:(id)a3 context:(id)a4;
+ (id)_tomatoImageForFreshness:(int64_t)a3;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SKUITomatoRatingView

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUITomatoRatingView prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUITomatoRatingView preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
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
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUITomatoRatingView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = [a1 _attributedStringForRating:v9 context:v8];
  v19 = [v8 labelLayoutCache];

  [v19 requestLayoutForViewElement:v9 attributedString:v18 width:(uint64_t)a4];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUITomatoRatingView sizeThatFitsWidth:viewElement:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = objc_msgSend(a1, "_tomatoImageForFreshness:", objc_msgSend(v9, "freshness"));
  [v18 size];
  double v20 = v19;
  double v22 = v21;
  v23 = [v8 labelLayoutCache];

  v24 = [v23 layoutForWidth:(uint64_t)a3 viewElement:v9];

  if (v24)
  {
    [v24 boundingSize];
    if (v22 < v26) {
      double v22 = v26;
    }
    double v20 = v20 + v25 + 3.0;
  }

  double v27 = v20;
  double v28 = v22;
  result.height = v28;
  result.width = v27;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUITomatoRatingView reloadWithViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  imageView = self->_imageView;
  if (!imageView)
  {
    double v19 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    double v20 = self->_imageView;
    self->_imageView = v19;

    double v21 = self->_imageView;
    double v22 = [(SKUITomatoRatingView *)self backgroundColor];
    [(UIImageView *)v21 setBackgroundColor:v22];

    [(SKUITomatoRatingView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }
  v23 = objc_msgSend((id)objc_opt_class(), "_tomatoImageForFreshness:", objc_msgSend(v8, "freshness"));
  [(UIImageView *)imageView setImage:v23];

  labelView = self->_labelView;
  if (!labelView)
  {
    double v25 = objc_alloc_init(SKUIAttributedStringView);
    double v26 = self->_labelView;
    self->_labelView = v25;

    double v27 = self->_labelView;
    double v28 = [(SKUITomatoRatingView *)self backgroundColor];
    [(SKUIAttributedStringView *)v27 setBackgroundColor:v28];

    [(SKUIAttributedStringView *)self->_labelView setUserInteractionEnabled:0];
    [(SKUITomatoRatingView *)self addSubview:self->_labelView];
    labelView = self->_labelView;
  }
  v29 = [v9 labelLayoutCache];
  v30 = [v29 layoutForWidth:(uint64_t)a4 viewElement:v8];
  [(SKUIAttributedStringView *)labelView setLayout:v30];

  [(SKUITomatoRatingView *)self setNeedsLayout];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUITomatoRatingView setImage:forArtworkRequest:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUITomatoRatingView updateWithItemState:context:animated:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUITomatoRatingView viewForElementIdentifier:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [(UIImageView *)imageView setBackgroundColor:v5];
  [(SKUIAttributedStringView *)self->_labelView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUITomatoRatingView;
  [(SKUITomatoRatingView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  -[SKUIAttributedStringView sizeThatFits:](self->_labelView, "sizeThatFits:", width, height);
  double v12 = v7 + 3.0 + v11;
  if (v9 >= v10) {
    double v10 = v9;
  }
  result.double height = v10;
  result.double width = v12;
  return result;
}

+ (id)_attributedStringForRating:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v6 ratingText];
  double v8 = [v6 style];

  double v9 = SKUIViewElementFontWithStyle(v8);
  if (!v9)
  {
    double v9 = SKUIFontForTextStyle(10);
  }
  double v10 = [v5 tintColor];
  double v11 = SKUIViewElementPlainColorWithStyle(v8, v10);

  if (!v11)
  {
    double v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  }
  double v12 = [v7 attributedStringWithDefaultFont:v9 foregroundColor:v11 style:v8];

  return v12;
}

+ (id)_tomatoImageForFreshness:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1818];
    id v5 = SKUIBundle();
    id v6 = @"rottenTomatoesRotten";
  }
  else if (a3 == 1)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1818];
    id v5 = SKUIBundle();
    id v6 = @"rottenTomatoesFresh";
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    uint64_t v4 = (void *)MEMORY[0x1E4FB1818];
    id v5 = SKUIBundle();
    id v6 = @"rottenTomatoesCertified";
  }
  BOOL v3 = [v4 imageNamed:v6 inBundle:v5];

LABEL_8:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadWithViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithItemState:(uint64_t)a3 context:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end