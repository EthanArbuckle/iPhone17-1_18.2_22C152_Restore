@interface SUUIDownloadsCellView
- (BOOL)isPad;
- (NSAttributedString)attributedTitle;
- (NSString)subtitle;
- (SUUIDownloadsCellView)init;
- (UIButton)button;
- (UIImage)image;
- (double)progress;
- (int64_t)buttonType;
- (void)layoutSubviews;
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setIsPad:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation SUUIDownloadsCellView

- (SUUIDownloadsCellView)init
{
  v28.receiver = self;
  v28.super_class = (Class)SUUIDownloadsCellView;
  v2 = [(SUUIDownloadsCellView *)&v28 init];
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    [(SUUIDownloadsCellView *)v2 addSubview:v2->_titleLabel];
    [(SUUIDownloadsCellView *)v2 setAttributedTitle:0];
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    subtitleLabel = v2->_subtitleLabel;
    v2->_subtitleLabel = v5;

    v7 = v2->_subtitleLabel;
    v8 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    [(UILabel *)v7 setFont:v8];

    v9 = v2->_subtitleLabel;
    v10 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v9 setTextColor:v10];

    [(SUUIDownloadsCellView *)v2 addSubview:v2->_subtitleLabel];
    [(SUUIDownloadsCellView *)v2 setSubtitle:0];
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v2->_imageView;
    v2->_imageView = v11;

    [(UIImageView *)v2->_imageView setContentMode:1];
    v13 = [(UIImageView *)v2->_imageView layer];
    id v14 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    objc_msgSend(v13, "setBorderColor:", objc_msgSend(v14, "CGColor"));

    v15 = [(UIImageView *)v2->_imageView layer];
    v16 = [MEMORY[0x263F82B60] mainScreen];
    [v16 scale];
    [v15 setBorderWidth:1.0 / v17];

    v18 = v2->_imageView;
    v19 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
    [(UIImageView *)v18 setBackgroundColor:v19];

    [(SUUIDownloadsCellView *)v2 addSubview:v2->_imageView];
    uint64_t v20 = [MEMORY[0x263F824E8] buttonWithType:0];
    button = v2->_button;
    v2->_button = (UIButton *)v20;

    [(UIButton *)v2->_button setUserInteractionEnabled:0];
    [(SUUIDownloadsCellView *)v2 addSubview:v2->_button];
    v22 = (UISlider *)objc_alloc_init(MEMORY[0x263F82BD8]);
    progressSlider = v2->_progressSlider;
    v2->_progressSlider = v22;

    [(UISlider *)v2->_progressSlider setUserInteractionEnabled:0];
    v24 = v2->_progressSlider;
    id v25 = objc_alloc_init(MEMORY[0x263F827E8]);
    [(UISlider *)v24 setThumbImage:v25 forState:0];

    [(SUUIDownloadsCellView *)v2 addSubview:v2->_progressSlider];
    v26 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(SUUIDownloadsCellView *)v2 setBackgroundColor:v26];
  }
  return v2;
}

- (void)setAttributedTitle:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
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
      id v7 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v11 = *MEMORY[0x263F814F0];
      v8 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
      v12[0] = v8;
      v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
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
    [(SUUIDownloadsCellView *)self setNeedsLayout];
    v5 = v6;
  }
}

- (void)setIsPad:(BOOL)a3
{
  if (self->_isPad != a3)
  {
    self->_isPad = a3;
    [(SUUIDownloadsCellView *)self setNeedsLayout];
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
    id v4 = (void *)MEMORY[0x263F827E8];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = @"DownloadsResumeIcon";
  }
  else
  {
    if (a3 != 1)
    {
      id v7 = 0;
      goto LABEL_8;
    }
    id v4 = (void *)MEMORY[0x263F827E8];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = @"DownloadsPauseIcon";
  }
  id v7 = [v4 imageNamed:v6 inBundle:v5];

LABEL_8:
  [(UIButton *)self->_button setHidden:self->_buttonType == 0];
  v8 = [(SUUIDownloadsCellView *)self tintColor];
  id v9 = [v7 _flatImageWithColor:v8];

  [(UIButton *)self->_button setImage:v9 forState:0];
  [(SUUIDownloadsCellView *)self setNeedsLayout];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIDownloadsCellView;
  id v4 = a3;
  [(SUUIDownloadsCellView *)&v5 setBackgroundColor:v4];
  -[UISlider setBackgroundColor:](self->_progressSlider, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  [(UIButton *)self->_button setBackgroundColor:v4];
  [(UILabel *)self->_titleLabel setBackgroundColor:v4];
  [(UILabel *)self->_subtitleLabel setBackgroundColor:v4];
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)SUUIDownloadsCellView;
  [(SUUIDownloadsCellView *)&v50 layoutSubviews];
  [(SUUIDownloadsCellView *)self bounds];
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
    id v14 = [(UIImageView *)self->_imageView image];
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

@end