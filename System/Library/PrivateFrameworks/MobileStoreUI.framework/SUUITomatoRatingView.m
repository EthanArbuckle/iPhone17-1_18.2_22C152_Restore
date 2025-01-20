@interface SUUITomatoRatingView
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

@implementation SUUITomatoRatingView

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
  id v11 = [a1 _attributedStringForRating:v9 context:v8];
  v10 = [v8 labelLayoutCache];

  [v10 requestLayoutForViewElement:v9 attributedString:v11 width:(uint64_t)a4];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = objc_msgSend(a1, "_tomatoImageForFreshness:", objc_msgSend(v9, "freshness"));
  [v10 size];
  double v12 = v11;
  double v14 = v13;
  v15 = [v8 labelLayoutCache];

  v16 = [v15 layoutForWidth:(uint64_t)a3 viewElement:v9];

  if (v16)
  {
    [v16 boundingSize];
    if (v14 < v18) {
      double v14 = v18;
    }
    double v12 = v12 + v17 + 3.0;
  }

  double v19 = v12;
  double v20 = v14;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v22 = a3;
  id v8 = a5;
  imageView = self->_imageView;
  if (!imageView)
  {
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    double v11 = self->_imageView;
    self->_imageView = v10;

    double v12 = self->_imageView;
    double v13 = [(SUUITomatoRatingView *)self backgroundColor];
    [(UIImageView *)v12 setBackgroundColor:v13];

    [(SUUITomatoRatingView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }
  double v14 = objc_msgSend((id)objc_opt_class(), "_tomatoImageForFreshness:", objc_msgSend(v22, "freshness"));
  [(UIImageView *)imageView setImage:v14];

  labelView = self->_labelView;
  if (!labelView)
  {
    v16 = objc_alloc_init(SUUIAttributedStringView);
    double v17 = self->_labelView;
    self->_labelView = v16;

    double v18 = self->_labelView;
    double v19 = [(SUUITomatoRatingView *)self backgroundColor];
    [(SUUIAttributedStringView *)v18 setBackgroundColor:v19];

    [(SUUIAttributedStringView *)self->_labelView setUserInteractionEnabled:0];
    [(SUUITomatoRatingView *)self addSubview:self->_labelView];
    labelView = self->_labelView;
  }
  double v20 = [v8 labelLayoutCache];
  v21 = [v20 layoutForWidth:(uint64_t)a4 viewElement:v22];
  [(SUUIAttributedStringView *)labelView setLayout:v21];

  [(SUUITomatoRatingView *)self setNeedsLayout];
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

- (void)layoutSubviews
{
  [(SUUITomatoRatingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = *MEMORY[0x263F001A8];
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v3, v5);
  double v9 = v8;
  CGFloat v11 = v10;
  *(float *)&double v8 = (v6 - v10) * 0.5;
  CGFloat v12 = floorf(*(float *)&v8);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v7, v12, v9, v10);
  -[SUUIAttributedStringView sizeThatFits:](self->_labelView, "sizeThatFits:", v4, v6);
  v15.origin.x = v7;
  v15.origin.y = v12;
  v15.size.width = v9;
  v15.size.height = v11;
  CGRectGetMaxX(v15);
  labelView = self->_labelView;
  -[SUUIAttributedStringView setFrame:](labelView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [(UIImageView *)imageView setBackgroundColor:v5];
  [(SUUIAttributedStringView *)self->_labelView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUITomatoRatingView;
  [(SUUITomatoRatingView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  -[SUUIAttributedStringView sizeThatFits:](self->_labelView, "sizeThatFits:", width, height);
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

  double v9 = SUUIViewElementFontWithStyle(v8);
  if (!v9)
  {
    double v9 = SUUIFontForTextStyle(10);
  }
  double v10 = [v5 tintColor];
  double v11 = SUUIViewElementPlainColorWithStyle(v8, v10);

  if (!v11)
  {
    double v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
  }
  double v12 = [v7 attributedStringWithDefaultFont:v9 foregroundColor:v11 style:v8];

  return v12;
}

+ (id)_tomatoImageForFreshness:(int64_t)a3
{
  if (a3 == 2)
  {
    double v4 = (void *)MEMORY[0x263F827E8];
    id v5 = SUUIBundle();
    id v6 = @"rottenTomatoesRotten";
  }
  else if (a3 == 1)
  {
    double v4 = (void *)MEMORY[0x263F827E8];
    id v5 = SUUIBundle();
    id v6 = @"rottenTomatoesFresh";
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    double v4 = (void *)MEMORY[0x263F827E8];
    id v5 = SUUIBundle();
    id v6 = @"rottenTomatoesCertified";
  }
  double v3 = [v4 imageNamed:v6 inBundle:v5];

LABEL_8:
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end