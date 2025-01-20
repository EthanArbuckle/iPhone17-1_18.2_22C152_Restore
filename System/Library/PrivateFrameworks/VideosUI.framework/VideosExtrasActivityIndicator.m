@interface VideosExtrasActivityIndicator
- (CGSize)intrinsicContentSize;
- (VideosExtrasActivityIndicator)initWithElement:(id)a3;
- (void)setAlpha:(double)a3;
@end

@implementation VideosExtrasActivityIndicator

- (VideosExtrasActivityIndicator)initWithElement:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)VideosExtrasActivityIndicator;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[VideosExtrasActivityIndicator initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  if (v9)
  {
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(VideosExtrasActivityIndicator *)v9 setBackgroundColor:v10];

    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v4 title];
        v12 = [v11 text];
        uint64_t v13 = [v12 length];

        if (v13)
        {
          uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
          titleLabel = v9->_titleLabel;
          v9->_titleLabel = (UILabel *)v14;

          [(UILabel *)v9->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
          v16 = v9->_titleLabel;
          v17 = [MEMORY[0x1E4FB1618] clearColor];
          [(UILabel *)v16 setBackgroundColor:v17];

          v18 = v9->_titleLabel;
          v19 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.7];
          [(UILabel *)v18 setTextColor:v19];

          uint64_t v20 = *MEMORY[0x1E4FB28C8];
          v21 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
          [(UILabel *)v9->_titleLabel configureForIKTextElement:v11 fontDescriptor:v21 textStyle:v20];
          [(UILabel *)v9->_titleLabel setAlpha:0.0];
          [(VideosExtrasActivityIndicator *)v9 addSubview:v9->_titleLabel];
        }
      }
    }
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:0];
    spinner = v9->_spinner;
    v9->_spinner = (UIActivityIndicatorView *)v22;

    [(UIActivityIndicatorView *)v9->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v9->_spinner setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)v9->_spinner startAnimating];
    [(UIActivityIndicatorView *)v9->_spinner setAlpha:0.0];
    [(VideosExtrasActivityIndicator *)v9 addSubview:v9->_spinner];
    v24 = [MEMORY[0x1E4F1CA48] array];
    v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_spinner attribute:9 relatedBy:0 toItem:v9 attribute:9 multiplier:1.0 constant:0.0];
    [v24 addObject:v25];
    v26 = v9->_spinner;
    if (v9->_titleLabel)
    {
      v27 = [MEMORY[0x1E4F28DC8] constraintWithItem:v26 attribute:3 relatedBy:0 toItem:v9 attribute:3 multiplier:1.0 constant:0.0];
      [v24 addObject:v27];
      v28 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_titleLabel attribute:3 relatedBy:0 toItem:v9->_spinner attribute:4 multiplier:1.0 constant:5.0];
      [v24 addObject:v28];
      v29 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_titleLabel attribute:9 relatedBy:0 toItem:v9->_spinner attribute:9 multiplier:1.0 constant:0.0];
      [v24 addObject:v29];
    }
    else
    {
      v27 = [MEMORY[0x1E4F28DC8] constraintWithItem:v26 attribute:10 relatedBy:0 toItem:v9 attribute:10 multiplier:1.0 constant:0.0];
      [v24 addObject:v27];
    }

    [(VideosExtrasActivityIndicator *)v9 addConstraints:v24];
  }

  return v9;
}

- (CGSize)intrinsicContentSize
{
  [(UIActivityIndicatorView *)self->_spinner intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(UILabel *)self->_titleLabel intrinsicContentSize];
  double v9 = v8 + 5.0;
  if (!self->_titleLabel) {
    double v9 = -0.0;
  }
  double v10 = v6 + v9;
  if (v4 >= v7) {
    double v7 = v4;
  }
  double v11 = v7 + 10.0;
  double v12 = v10 + 10.0;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setAlpha:(double)a3
{
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:");
  spinner = self->_spinner;
  [(UIActivityIndicatorView *)spinner setAlpha:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end