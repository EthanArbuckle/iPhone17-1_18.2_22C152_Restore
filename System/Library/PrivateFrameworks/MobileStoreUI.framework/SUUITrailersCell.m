@interface SUUITrailersCell
- (CGRect)imageFrame;
- (NSString)subtitle;
- (NSString)title;
- (SUUITrailersCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUITrailersCell

- (SUUITrailersCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUITrailersCell;
  v3 = -[SUUITrailersCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(SUUITrailersCell *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];

  id v6 = v15;
  if (v4 != v15)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v9 = self->_titleLabel;
        self->_titleLabel = v8;

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x263F81708] boldSystemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_titleLabel setNumberOfLines:1];
        v12 = self->_titleLabel;
        v13 = [(SUUITrailersCell *)self backgroundColor];
        [(UILabel *)v12 setBackgroundColor:v13];

        [(SUUITrailersCell *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setText:v15];
      uint64_t v5 = [(SUUITrailersCell *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v14 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    id v6 = v15;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setSubtitle:(id)a3
{
  id v15 = a3;
  id v4 = [(UILabel *)self->_subtitleLabel text];

  id v6 = v15;
  if (v4 != v15)
  {
    subtitleLabel = self->_subtitleLabel;
    if (v15)
    {
      if (!subtitleLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v9 = self->_subtitleLabel;
        self->_subtitleLabel = v8;

        v10 = self->_subtitleLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_subtitleLabel setNumberOfLines:1];
        v12 = self->_subtitleLabel;
        v13 = [(SUUITrailersCell *)self backgroundColor];
        [(UILabel *)v12 setBackgroundColor:v13];

        [(SUUITrailersCell *)self addSubview:self->_subtitleLabel];
        subtitleLabel = self->_subtitleLabel;
      }
      [(UILabel *)subtitleLabel setText:v15];
      uint64_t v5 = [(SUUITrailersCell *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)subtitleLabel removeFromSuperview];
      v14 = self->_subtitleLabel;
      self->_subtitleLabel = 0;
    }
    id v6 = v15;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  id v4 = [(UIImageView *)self->_imageView image];

  uint64_t v5 = v6;
  if (v4 != v6)
  {
    [(UIImageView *)self->_imageView setImage:v6];
    [(UIImageView *)self->_imageView sizeToFit];
    [(SUUITrailersCell *)self setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (CGRect)imageFrame
{
  [(UIImageView *)self->_imageView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SUUITrailersCell;
  [(SUUITrailersCell *)&v28 layoutSubviews];
  [(SUUITrailersCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  objc_super v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  double v9 = 7.5;
  double v10 = 10.0;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v9 = 10.0;
  }
  double v11 = floor(v9);
  [(UIImageView *)self->_imageView frame];
  double v13 = v12;
  double v15 = v14;
  [(SUUITrailersCell *)self bounds];
  double v17 = floor((v16 - v13) * 0.5);
  v18 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v10 = 15.0;
  }
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v17, v10, v13, v15);
  v29.origin.x = v17;
  v29.origin.y = v10;
  v29.size.width = v13;
  v29.size.height = v15;
  double MaxY = CGRectGetMaxY(v29);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v4, v6);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v11, MaxY, v21, v23);
  v30.origin.x = v11;
  v30.origin.y = MaxY;
  v30.size.width = v22;
  v30.size.height = v24;
  double v25 = CGRectGetMaxY(v30);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v4, v6);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v11, v25, v26, v27);
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUITrailersCell;
  id v4 = a3;
  [(SUUITrailersCell *)&v5 setBackgroundColor:v4];
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  [(UILabel *)self->_titleLabel setBackgroundColor:v4];
  [(UILabel *)self->_subtitleLabel setBackgroundColor:v4];
}

- (void)prepareForReuse
{
  [(UIImageView *)self->_imageView setImage:0];
  [(UILabel *)self->_titleLabel setText:0];
  subtitleLabel = self->_subtitleLabel;
  [(UILabel *)subtitleLabel setText:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end