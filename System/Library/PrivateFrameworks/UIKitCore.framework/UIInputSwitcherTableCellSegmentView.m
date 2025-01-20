@interface UIInputSwitcherTableCellSegmentView
+ (id)_fontForBiasLabel;
- (BOOL)isSelected;
- (BOOL)usesDarkTheme;
- (CGSize)intrinsicContentSize;
- (UIImageView)imageView;
- (UIInputSwitcherTableCellBackgroundView)backgroundView;
- (UIInputSwitcherTableCellSegmentView)initWithFrame:(CGRect)a3;
- (UILabel)label;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)setUsesDarkTheme:(BOOL)a3;
@end

@implementation UIInputSwitcherTableCellSegmentView

+ (id)_fontForBiasLabel
{
  return (id)[off_1E52D39B8 boldSystemFontOfSize:14.0];
}

- (UIInputSwitcherTableCellSegmentView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)UIInputSwitcherTableCellSegmentView;
  v3 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIInputSwitcherTableCellBackgroundView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIInputSwitcherTableCellBackgroundView *)v9;

    [(UIView *)v3->_backgroundView setOpaque:0];
    v11 = +[UIColor clearColor];
    [(UIView *)v3->_backgroundView setBackgroundColor:v11];

    [(UIView *)v3->_backgroundView setUserInteractionEnabled:0];
    [(UIView *)v3 addSubview:v3->_backgroundView];
    v12 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v5, v6, v7, v8);
    label = v3->_label;
    v3->_label = v12;

    v14 = [(id)objc_opt_class() _fontForBiasLabel];
    [(UILabel *)v3->_label setFont:v14];

    v15 = +[UIColor clearColor];
    [(UIView *)v3->_label setBackgroundColor:v15];

    [(UIView *)v3 addSubview:v3->_label];
    v16 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v5, v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = v16;

    [(UIView *)v3 addSubview:v3->_imageView];
    v18 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v18];
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selected = a3;
  double v5 = [(UIInputSwitcherTableCellSegmentView *)self backgroundView];
  [v5 setSelected:v3];

  if (v3 || [(UIInputSwitcherTableCellSegmentView *)self usesDarkTheme])
  {
    uint64_t v6 = +[UIColor whiteColor];
  }
  else
  {
    uint64_t v6 = +[UIColor blackColor];
  }
  id v9 = (id)v6;
  double v7 = [(UIInputSwitcherTableCellSegmentView *)self label];
  [v7 setTextColor:v9];

  double v8 = [(UIInputSwitcherTableCellSegmentView *)self imageView];
  [v8 setTintColor:v9];
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)UIInputSwitcherTableCellSegmentView;
  [(UIView *)&v28 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_backgroundView, "setFrame:", round(v4 + (v3 + -64.0) * 0.5), round(v6 + (v5 + -39.0) * 0.5), 64.0, 39.0);
  [(UIView *)self->_label sizeToFit];
  [(UIView *)self->_label frame];
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self bounds];
  -[UILabel setFrame:](self->_label, "setFrame:", round(v12 + (v11 - v8) * 0.5), round(v14 + (v13 - v10) * 0.5), v8, v10);
  v15 = [(UIImageView *)self->_imageView image];

  imageView = self->_imageView;
  if (v15)
  {
    [(UIImageView *)imageView setHidden:0];
    v17 = [(UIImageView *)self->_imageView image];
    [v17 size];
    double v19 = v18;
    double v21 = v20;

    [(UIView *)self bounds];
    double v24 = round(v23 + (v22 - v19) * 0.5);
    double v27 = round(v26 + (v25 - v21) * 0.5);
  }
  else
  {
    double v24 = *MEMORY[0x1E4F1DB28];
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    [(UIImageView *)imageView setHidden:1];
  }
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v24, v27, v19, v21);
}

- (CGSize)intrinsicContentSize
{
  double v2 = 64.0;
  double v3 = 39.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIInputSwitcherTableCellBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end