@interface NTKAlbumEmptyView
- (NSString)bodyLabelText;
- (NSString)headerLabelText;
- (id)initForDevice:(id)a3;
- (void)layoutSubviews;
- (void)setBodyLabelText:(id)a3;
@end

@implementation NTKAlbumEmptyView

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKAlbumEmptyView;
  v6 = -[NTKAlbumEmptyView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
    NTKImageNamed(@"LargeIconPhoto");
  }

  return 0;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)NTKAlbumEmptyView;
  [(NTKAlbumEmptyView *)&v15 layoutSubviews];
  [(NTKAlbumEmptyView *)self bounds];
  -[UIImageView setCenter:](self->_iconImageView, "setCenter:", v3 * 0.5, *(double *)&qword_1E9FA1558 + *(double *)&qword_1E9FA1560 * 0.5);
  double v4 = *(double *)&layout;
  bodyLabel = self->_bodyLabel;
  [(NTKAlbumEmptyView *)self bounds];
  -[UILabel sizeThatFits:](bodyLabel, "sizeThatFits:", v6 + v4 * -2.0, 1.79769313e308);
  -[UILabel setBounds:](self->_bodyLabel, "setBounds:", 0.0, 0.0, v7, v8);
  [(NTKAlbumEmptyView *)self bounds];
  double v10 = v9 * 0.5;
  double v11 = *(double *)&qword_1E9FA1568;
  [(UILabel *)self->_bodyLabel _firstBaselineOffsetFromTop];
  double v13 = v11 - v12;
  [(UILabel *)self->_bodyLabel bounds];
  -[UILabel setCenter:](self->_bodyLabel, "setCenter:", v10, v13 + v14 * 0.5);
}

- (void)setBodyLabelText:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_bodyLabelText, a3);
  bodyLabelText = self->_bodyLabelText;
  if (bodyLabelText)
  {
    double v6 = attributedBodyLabelText(bodyLabelText);
    [(UILabel *)self->_bodyLabel setAttributedText:v6];

    [(UILabel *)self->_bodyLabel setTextAlignment:1];
    [(NTKAlbumEmptyView *)self setNeedsLayout];
  }
}

- (NSString)headerLabelText
{
  return self->_headerLabelText;
}

- (NSString)bodyLabelText
{
  return self->_bodyLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabelText, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabelText, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end