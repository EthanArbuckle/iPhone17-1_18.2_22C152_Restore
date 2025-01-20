@interface SKUITrailersCell
- (CGRect)imageFrame;
- (NSString)subtitle;
- (NSString)title;
- (SKUITrailersCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUITrailersCell

- (SKUITrailersCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITrailersCell initWithFrame:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUITrailersCell;
  v8 = -[SKUITrailersCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v8->_imageView;
    v8->_imageView = v9;

    [(SKUITrailersCell *)v8 addSubview:v8->_imageView];
  }
  return v8;
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
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v9 = self->_titleLabel;
        self->_titleLabel = v8;

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_titleLabel setNumberOfLines:1];
        objc_super v12 = self->_titleLabel;
        v13 = [(SKUITrailersCell *)self backgroundColor];
        [(UILabel *)v12 setBackgroundColor:v13];

        [(SKUITrailersCell *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setText:v15];
      uint64_t v5 = [(SKUITrailersCell *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v14 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    id v6 = v15;
  }

  MEMORY[0x1F41817F8](v5, v6);
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
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v9 = self->_subtitleLabel;
        self->_subtitleLabel = v8;

        v10 = self->_subtitleLabel;
        v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_subtitleLabel setNumberOfLines:1];
        objc_super v12 = self->_subtitleLabel;
        v13 = [(SKUITrailersCell *)self backgroundColor];
        [(UILabel *)v12 setBackgroundColor:v13];

        [(SKUITrailersCell *)self addSubview:self->_subtitleLabel];
        subtitleLabel = self->_subtitleLabel;
      }
      [(UILabel *)subtitleLabel setText:v15];
      uint64_t v5 = [(SKUITrailersCell *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)subtitleLabel removeFromSuperview];
      v14 = self->_subtitleLabel;
      self->_subtitleLabel = 0;
    }
    id v6 = v15;
  }

  MEMORY[0x1F41817F8](v5, v6);
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
    [(SKUITrailersCell *)self setNeedsLayout];
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
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SKUITrailersCell;
  [(SKUITrailersCell *)&v28 layoutSubviews];
  [(SKUITrailersCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [MEMORY[0x1E4FB16C8] currentDevice];
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
  [(SKUITrailersCell *)self bounds];
  double v17 = floor((v16 - v13) * 0.5);
  v18 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v10 = 15.0;
  }
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v17, v10, v13, v15);
  v29.origin.double x = v17;
  v29.origin.double y = v10;
  v29.size.double width = v13;
  v29.size.double height = v15;
  double MaxY = CGRectGetMaxY(v29);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v4, v6);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v11, MaxY, v21, v23);
  v30.origin.double x = v11;
  v30.origin.double y = MaxY;
  v30.size.double width = v22;
  v30.size.double height = v24;
  double v25 = CGRectGetMaxY(v30);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v4, v6);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v11, v25, v26, v27);
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUITrailersCell;
  id v4 = a3;
  [(SKUITrailersCell *)&v5 setBackgroundColor:v4];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITrailersCell initWithFrame:]";
}

@end