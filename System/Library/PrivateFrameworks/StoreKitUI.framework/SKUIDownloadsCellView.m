@interface SKUIDownloadsCellView
- (BOOL)isPad;
- (NSAttributedString)attributedTitle;
- (NSString)subtitle;
- (SKUIDownloadsCellView)init;
- (UIButton)button;
- (UIImage)image;
- (double)progress;
- (int64_t)buttonType;
- (void)init;
- (void)layoutSubviews;
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setIsPad:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation SKUIDownloadsCellView

- (SKUIDownloadsCellView)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDownloadsCellView init]();
  }
  v29.receiver = self;
  v29.super_class = (Class)SKUIDownloadsCellView;
  v3 = [(SKUIDownloadsCellView *)&v29 init];
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    [(SKUIDownloadsCellView *)v3 addSubview:v3->_titleLabel];
    [(SKUIDownloadsCellView *)v3 setAttributedTitle:0];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v6;

    v8 = v3->_subtitleLabel;
    v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [(UILabel *)v8 setFont:v9];

    v10 = v3->_subtitleLabel;
    v11 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
    [(UILabel *)v10 setTextColor:v11];

    [(SKUIDownloadsCellView *)v3 addSubview:v3->_subtitleLabel];
    [(SKUIDownloadsCellView *)v3 setSubtitle:0];
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v12;

    [(UIImageView *)v3->_imageView setContentMode:1];
    v14 = [(UIImageView *)v3->_imageView layer];
    id v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    v16 = [(UIImageView *)v3->_imageView layer];
    v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    [v16 setBorderWidth:1.0 / v18];

    v19 = v3->_imageView;
    v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
    [(UIImageView *)v19 setBackgroundColor:v20];

    [(SKUIDownloadsCellView *)v3 addSubview:v3->_imageView];
    uint64_t v21 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    button = v3->_button;
    v3->_button = (UIButton *)v21;

    [(UIButton *)v3->_button setUserInteractionEnabled:0];
    [(SKUIDownloadsCellView *)v3 addSubview:v3->_button];
    v23 = (UISlider *)objc_alloc_init(MEMORY[0x1E4FB1C38]);
    progressSlider = v3->_progressSlider;
    v3->_progressSlider = v23;

    [(UISlider *)v3->_progressSlider setUserInteractionEnabled:0];
    v25 = v3->_progressSlider;
    id v26 = objc_alloc_init(MEMORY[0x1E4FB1818]);
    [(UISlider *)v25 setThumbImage:v26 forState:0];

    [(SKUIDownloadsCellView *)v3 addSubview:v3->_progressSlider];
    v27 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
    [(SKUIDownloadsCellView *)v3 setBackgroundColor:v27];
  }
  return v3;
}

- (void)setAttributedTitle:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = (NSAttributedString *)a3;
  if (self->_attributedTitle != v5)
  {
    objc_storeStrong((id *)&self->_attributedTitle, a3);
    titleLabel = self->_titleLabel;
    if (v5)
    {
      [(UILabel *)titleLabel setAttributedText:v5];
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v11 = *MEMORY[0x1E4FB06F8];
      v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
      v12[0] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      v10 = (void *)[v7 initWithString:@" " attributes:v9];
      [(UILabel *)titleLabel setAttributedText:v10];
    }
  }
}

- (void)setSubtitle:(id)a3
{
  v6 = (NSString *)a3;
  if (self->_subtitle != v6)
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    if (v6) {
      v5 = (__CFString *)v6;
    }
    else {
      v5 = @" ";
    }
    [(UILabel *)self->_subtitleLabel setText:v5];
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  id v4 = [(UIImageView *)self->_imageView image];

  v5 = v6;
  if (v4 != v6)
  {
    [(UIImageView *)self->_imageView setImage:v6];
    [(SKUIDownloadsCellView *)self setNeedsLayout];
    v5 = v6;
  }
}

- (void)setIsPad:(BOOL)a3
{
  if (self->_isPad != a3)
  {
    self->_isPad = a3;
    [(SKUIDownloadsCellView *)self setNeedsLayout];
  }
}

- (double)progress
{
  [(UISlider *)self->_progressSlider value];
  return v2;
}

- (void)setProgress:(double)a3
{
  *(float *)&a3 = a3;
  [(UISlider *)self->_progressSlider setValue:a3];
}

- (void)setButtonType:(int64_t)a3
{
  if (self->_buttonType == a3) {
    return;
  }
  self->_buttonType = a3;
  if (a3 == 2)
  {
    id v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = @"DownloadsResumeIcon";
  }
  else
  {
    if (a3 != 1)
    {
      id v7 = 0;
      goto LABEL_8;
    }
    id v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = @"DownloadsPauseIcon";
  }
  id v7 = [v4 imageNamed:v6 inBundle:v5];

LABEL_8:
  [(UIButton *)self->_button setHidden:self->_buttonType == 0];
  v8 = [(SKUIDownloadsCellView *)self tintColor];
  id v9 = [v7 _flatImageWithColor:v8];

  [(UIButton *)self->_button setImage:v9 forState:0];
  [(SKUIDownloadsCellView *)self setNeedsLayout];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIDownloadsCellView;
  id v4 = a3;
  [(SKUIDownloadsCellView *)&v5 setBackgroundColor:v4];
  -[UISlider setBackgroundColor:](self->_progressSlider, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  [(UIButton *)self->_button setBackgroundColor:v4];
  [(UILabel *)self->_titleLabel setBackgroundColor:v4];
  [(UILabel *)self->_subtitleLabel setBackgroundColor:v4];
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)SKUIDownloadsCellView;
  [(SKUIDownloadsCellView *)&v50 layoutSubviews];
  [(SKUIDownloadsCellView *)self bounds];
  double v7 = v6;
  if (self->_isPad) {
    double v8 = 15.0;
  }
  else {
    double v8 = 10.0;
  }
  double v9 = v3 + v8;
  double v49 = v4;
  double v10 = v7;
  double MaxX = CGRectGetMaxX(*(CGRect *)&v3);
  if (self->_isPad) {
    double v12 = 15.0;
  }
  else {
    double v12 = 10.0;
  }
  v13 = [(UIImageView *)self->_imageView image];

  if (v13)
  {
    v14 = [(UIImageView *)self->_imageView image];
    [v14 size];
    double v16 = v15;
    double v18 = v17;

    double v19 = 75.0;
    if (!self->_isPad) {
      double v19 = 44.0;
    }
    double v20 = v19 / v16;
    if (v19 / v16 >= v19 / v18) {
      double v20 = v19 / v18;
    }
    double v21 = v16 * v20;
    double v22 = v18 * v20;
  }
  else
  {
    double v19 = 75.0;
    if (!self->_isPad) {
      double v19 = 44.0;
    }
    double v21 = v19;
    double v22 = v19;
  }
  double v23 = MaxX - v12;
  float v24 = (v7 - v22) * 0.5;
  float v25 = v9 + (v19 - v21) * 0.5;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", roundf(v25), roundf(v24));
  BOOL isPad = self->_isPad;
  v27 = [(UIButton *)self->_button imageForState:0];

  if (v27)
  {
    [(UIButton *)self->_button sizeToFit];
    [(UIButton *)self->_button frame];
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    float v32 = (v7 - v30) * 0.5;
    CGFloat v33 = roundf(v32);
    CGFloat v34 = v23 - v28;
    -[UIButton setFrame:](self->_button, "setFrame:", v34, v33);
    v51.origin.x = v34;
    v51.origin.y = v33;
    v51.size.width = v29;
    v51.size.height = v31;
    double MinX = CGRectGetMinX(v51);
    double v36 = 15.0;
    if (!self->_isPad) {
      double v36 = 10.0;
    }
    double v23 = MinX - v36;
  }
  double v37 = 90.0;
  if (!isPad) {
    double v37 = 54.0;
  }
  CGFloat v38 = v9 + v37;
  CGFloat v39 = v23 - (v9 + v37);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v39, v7);
  double v41 = v40;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v39, v7);
  double v43 = v42;
  double v48 = v42;
  -[UISlider sizeThatFits:](self->_progressSlider, "sizeThatFits:", v39, v7);
  double v45 = v44;
  *(float *)&double v44 = (v7 - (v43 + v41 + -4.0 + -3.0 + 10.0 + v44 + 10.0 + -3.0 + -3.0)) * 0.5;
  CGFloat v46 = v49 + roundf(*(float *)&v44) + -4.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v38, v46, v39, v41);
  v52.origin.x = v38;
  v52.origin.y = v46;
  v52.size.width = v39;
  v52.size.height = v41;
  CGFloat v47 = CGRectGetMaxY(v52) + -3.0 + 10.0;
  -[UISlider setFrame:](self->_progressSlider, "setFrame:", v38, v47, v39, v45);
  v53.origin.x = v38;
  v53.origin.y = v47;
  v53.size.width = v39;
  v53.size.height = v45;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v38, CGRectGetMaxY(v53) + 10.0 + -3.0, v39, v48);
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (UIButton)button
{
  return self->_button;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_progressSlider, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDownloadsCellView init]";
}

@end