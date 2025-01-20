@interface PricePopoverBar
- (PricePopoverBar)initWithBackgroundImage:(id)a3;
- (UIColor)imageMaskColor;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setChangeImage:(id)a3;
- (void)setImageMaskColor:(id)a3;
- (void)setPercentChange:(id)a3;
- (void)setPriceString:(id)a3;
- (void)sizeToFit;
@end

@implementation PricePopoverBar

- (PricePopoverBar)initWithBackgroundImage:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PricePopoverBar;
  v6 = [(PricePopoverBar *)&v31 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    priceLabel = v6->_priceLabel;
    v6->_priceLabel = (UILabel *)v7;

    v9 = v6->_priceLabel;
    v10 = +[StocksStyle sharedStyle];
    v11 = [v10 fontOfSize:22.0];
    [(UILabel *)v9 setFont:v11];

    v12 = v6->_priceLabel;
    v13 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v12 setTextColor:v13];

    v14 = v6->_priceLabel;
    v15 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v14 setBackgroundColor:v15];

    [(PricePopoverBar *)v6 addSubview:v6->_priceLabel];
    uint64_t v16 = objc_opt_new();
    percentChangeLabel = v6->_percentChangeLabel;
    v6->_percentChangeLabel = (UILabel *)v16;

    v18 = v6->_percentChangeLabel;
    v19 = +[StocksStyle sharedStyle];
    v20 = [v19 fontOfSize:22.0];
    [(UILabel *)v18 setFont:v20];

    v21 = v6->_percentChangeLabel;
    v22 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v21 setTextColor:v22];

    v23 = v6->_percentChangeLabel;
    v24 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v23 setBackgroundColor:v24];

    [(PricePopoverBar *)v6 addSubview:v6->_percentChangeLabel];
    v25 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    priceChangeSignView = v6->_priceChangeSignView;
    v6->_priceChangeSignView = v25;

    [(PricePopoverBar *)v6 addSubview:v6->_priceChangeSignView];
    v27 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    percentChangeSignView = v6->_percentChangeSignView;
    v6->_percentChangeSignView = v27;

    [(PricePopoverBar *)v6 addSubview:v6->_percentChangeSignView];
    objc_storeStrong((id *)&v6->_backgroundImage, a3);
    v29 = [MEMORY[0x263F1C550] clearColor];
    [(PricePopoverBar *)v6 setBackgroundColor:v29];
  }
  return v6;
}

- (void)sizeToFit
{
  [(UIImageView *)self->_priceChangeSignView sizeToFit];
  [(UIImageView *)self->_percentChangeSignView sizeToFit];
  v3 = [(UILabel *)self->_priceLabel text];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    [(UILabel *)self->_priceLabel sizeToFit];
    id v5 = [(UIImageView *)self->_priceChangeSignView image];
    if (v5)
    {
      [(UIImageView *)self->_priceChangeSignView bounds];
      double v7 = v6 + 4.0;
    }
    else
    {
      double v7 = 0.0;
    }

    [(UILabel *)self->_priceLabel bounds];
    double v8 = v7 + v9 + 16.0;
    v10 = [(UILabel *)self->_percentChangeLabel text];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      [(UILabel *)self->_percentChangeLabel sizeToFit];
      v12 = [(UIImageView *)self->_percentChangeSignView image];
      if (v12)
      {
        [(UIImageView *)self->_percentChangeSignView bounds];
        double v14 = v13 + 4.0 + 15.0;
      }
      else
      {
        double v14 = 15.0;
      }

      [(UILabel *)self->_percentChangeLabel bounds];
      double v8 = v8 + v14 + v15 + 1.0;
    }
  }
  else
  {
    double v8 = 0.0;
  }
  [(UIImage *)self->_backgroundImage size];
  if (v16 >= v8) {
    double v8 = v16;
  }
  [(UIImage *)self->_backgroundImage size];

  -[PricePopoverBar setBounds:](self, "setBounds:", 0.0, 0.0, v8, v17);
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(PricePopoverBar *)self bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  -[UIImage drawInRect:](self->_backgroundImage, "drawInRect:");
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceIn);
  [(UIColor *)self->_imageMaskColor set];
  uint64_t v13 = v6;
  uint64_t v14 = v8;
  uint64_t v15 = v10;
  uint64_t v16 = v12;

  CGContextFillRect(CurrentContext, *(CGRect *)&v13);
}

- (void)layoutSubviews
{
  v3 = [(UILabel *)self->_priceLabel text];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    [(PricePopoverBar *)self sizeToFit];
    [(PricePopoverBar *)self bounds];
    double v6 = v5;
    uint64_t v7 = +[StocksPreferences sharedPreferences];
    int v8 = [v7 textAttachmentDirectionIsRightToLeft];

    [(UIImageView *)self->_priceChangeSignView frame];
    double v10 = v9;
    CGFloat v12 = v11;
    double v13 = RoundToPixel((v6 - v11) * 0.5);
    [(UILabel *)self->_priceLabel frame];
    double v16 = v14;
    double v17 = v15;
    float v18 = (v6 - v15) * 0.5;
    double v19 = floorf(v18);
    double v55 = v6;
    if (v8)
    {
      double v20 = 8.0;
      double v56 = 8.0;
      double v21 = v19;
      double v22 = v13;
      double v23 = v10;
      double v24 = CGRectGetMaxX(*(CGRect *)(&v14 - 2)) + 4.0;
      double v25 = v22;
      double v26 = v23;
      CGFloat v27 = v12;
      double v28 = v12;
      double v29 = v24;
    }
    else
    {
      CGFloat rect = v13;
      double v23 = v10;
      v30 = [(UIImageView *)self->_priceChangeSignView image];
      double v24 = 8.0;
      if (v30)
      {
        v58.origin.x = 8.0;
        v58.origin.y = rect;
        v58.size.width = v23;
        v58.size.height = v12;
        double v24 = CGRectGetMaxX(v58) + 4.0;
      }

      double v25 = v19;
      double v26 = v16;
      CGFloat v27 = v17;
      double v56 = v24;
      double v22 = rect;
      double v28 = v12;
      double v29 = 8.0;
    }
    double v31 = v24;
    double MaxX = CGRectGetMaxX(*(CGRect *)(&v25 - 1));
    -[UILabel setFrame:](self->_priceLabel, "setFrame:", v56, v19, v16, v17);
    -[UIImageView setFrame:](self->_priceChangeSignView, "setFrame:", v29, v22, v23, v28);
    v33 = [(UILabel *)self->_percentChangeLabel text];
    uint64_t v34 = [v33 length];

    if (v34)
    {
      [(UIImageView *)self->_percentChangeSignView frame];
      double v36 = v35;
      double v38 = v37;
      double v39 = RoundToPixel((v55 - v37) * 0.5);
      [(UILabel *)self->_percentChangeLabel frame];
      double v42 = v40;
      double v43 = v41;
      float v44 = (v55 - v41) * 0.5;
      double v45 = floorf(v44);
      double v46 = MaxX + 15.0;
      if (v8)
      {
        double v47 = MaxX + 15.0;
        double v48 = v45;
        double v49 = CGRectGetMaxX(*(CGRect *)(&v40 - 2)) + 4.0;
      }
      else
      {
        double v49 = MaxX + 15.0;
        v59.origin.x = v46;
        v59.origin.y = v39;
        v59.size.width = v36;
        v59.size.height = v38;
        double v50 = CGRectGetMaxX(v59);
        v51 = [(UIImageView *)self->_percentChangeSignView image];
        double v52 = 4.0;
        if (!v51) {
          double v52 = 0.0;
        }
        double v46 = v50 + v52;
      }
      -[UIImageView setFrame:](self->_percentChangeSignView, "setFrame:", v49, v39, v36, v38);
      percentChangeLabel = self->_percentChangeLabel;
      -[UILabel setFrame:](percentChangeLabel, "setFrame:", v46, v45, v42, v43);
    }
  }
}

- (void)setPriceString:(id)a3
{
  [(UILabel *)self->_priceLabel setText:a3];

  [(PricePopoverBar *)self setNeedsLayout];
}

- (void)setPercentChange:(id)a3
{
  [(UILabel *)self->_percentChangeLabel setText:a3];

  [(PricePopoverBar *)self setNeedsLayout];
}

- (void)setImageMaskColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_imageMaskColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageMaskColor, a3);
    [(PricePopoverBar *)self setNeedsDisplay];
  }
}

- (void)setChangeImage:(id)a3
{
  priceChangeSignView = self->_priceChangeSignView;
  id v5 = a3;
  [(UIImageView *)priceChangeSignView setImage:v5];
  [(UIImageView *)self->_percentChangeSignView setImage:v5];

  [(PricePopoverBar *)self setNeedsLayout];
}

- (UIColor)imageMaskColor
{
  return self->_imageMaskColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageMaskColor, 0);
  objc_storeStrong((id *)&self->_percentChangeSignView, 0);
  objc_storeStrong((id *)&self->_priceChangeSignView, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_percentChangeLabel, 0);

  objc_storeStrong((id *)&self->_priceLabel, 0);
}

@end