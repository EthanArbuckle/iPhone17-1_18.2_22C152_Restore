@interface PKAccountInvitationAccessLevelContentView
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKAccountInvitationAccessLevelContentView)initWithConfiguration:(id)a3;
- (PKAccountInvitationAccessLevelContentView)initWithFrame:(CGRect)a3;
- (UIContentConfiguration)configuration;
- (UIImageView)imageView;
- (UILabel)secondarySubtitleLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)_applyConfiguration:(id)a3;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
@end

@implementation PKAccountInvitationAccessLevelContentView

- (PKAccountInvitationAccessLevelContentView)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = -[PKAccountInvitationAccessLevelContentView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    [(PKAccountInvitationAccessLevelContentView *)v5 _applyConfiguration:v4];
  }

  return v6;
}

- (PKAccountInvitationAccessLevelContentView)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)PKAccountInvitationAccessLevelContentView;
  v3 = -[PKAccountInvitationAccessLevelContentView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v9;

    [(PKAccountInvitationAccessLevelContentView *)v3 addSubview:v3->_imageView];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v11;

    v13 = v3->_titleLabel;
    v14 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], 0, 2, 0);
    [(UILabel *)v13 setFont:v14];

    v15 = v3->_titleLabel;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(PKAccountInvitationAccessLevelContentView *)v3 addSubview:v3->_titleLabel];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v17;

    v19 = v3->_subtitleLabel;
    v20 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    [(UILabel *)v19 setFont:v20];

    v21 = v3->_subtitleLabel;
    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v3->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(PKAccountInvitationAccessLevelContentView *)v3 addSubview:v3->_subtitleLabel];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    secondarySubtitleLabel = v3->_secondarySubtitleLabel;
    v3->_secondarySubtitleLabel = (UILabel *)v23;

    v25 = v3->_secondarySubtitleLabel;
    v26 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D8], 0);
    [(UILabel *)v25 setFont:v26];

    v27 = v3->_secondarySubtitleLabel;
    v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v27 setTextColor:v28];

    [(UILabel *)v3->_secondarySubtitleLabel setNumberOfLines:0];
    [(UILabel *)v3->_secondarySubtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
    [(PKAccountInvitationAccessLevelContentView *)v3 addSubview:v3->_secondarySubtitleLabel];
    [(PKAccountInvitationAccessLevelContentView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85178]];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKAccountInvitationAccessLevelContentView;
  [(PKAccountInvitationAccessLevelContentView *)&v3 layoutSubviews];
  [(PKAccountInvitationAccessLevelContentView *)self bounds];
  [(PKAccountInvitationAccessLevelContentView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKAccountInvitationAccessLevelContentView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PKAccountInvitationAccessLevelContentView *)self _applyConfiguration:v4];
  }
}

- (void)_applyConfiguration:(id)a3
{
  id v13 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    imageView = self->_imageView;
    double v6 = [v13 image];
    [(UIImageView *)imageView setImage:v6];

    titleLabel = self->_titleLabel;
    double v8 = [v13 title];
    [(UILabel *)titleLabel setText:v8];

    subtitleLabel = self->_subtitleLabel;
    v10 = [v13 subtitle];
    [(UILabel *)subtitleLabel setText:v10];

    secondarySubtitleLabel = self->_secondarySubtitleLabel;
    v12 = [v13 secondarySubtitle];
    [(UILabel *)secondarySubtitleLabel setText:v12];

    [(PKAccountInvitationAccessLevelContentView *)self setNeedsLayout];
  }
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PKAccountInvitationAccessLevelContentView *)self _shouldReverseLayoutDirection])CGRectEdge v8 = CGRectMaxXEdge; {
  else
  }
    CGRectEdge v8 = CGRectMinXEdge;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  v24.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  remainder.origin.double x = x + 14.0;
  remainder.origin.double y = y + 14.0;
  remainder.size.double width = width + -28.0;
  remainder.size.double height = height + -28.0;
  v10 = [(UIImageView *)self->_imageView image];

  if (v10)
  {
    v27.origin.double x = x + 14.0;
    v27.origin.double y = y + 14.0;
    v27.size.double width = width + -28.0;
    v27.size.double height = height + -28.0;
    CGRectDivide(v27, &v24, &remainder, 46.0, v8);
    if (!self->_isTemplateLayout)
    {
      imageView = self->_imageView;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](imageView, "setFrame:");
    }
    CGRectDivide(remainder, &v24, &remainder, 10.0, v8);
  }
  else if (!self->_isTemplateLayout)
  {
    -[UIImageView setFrame:](self->_imageView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v12 = [(UILabel *)self->_titleLabel text];

  if (v12)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    double v14 = v13;
    CGRectDivide(remainder, &v24, &remainder, v13, CGRectMinYEdge);
    if (!self->_isTemplateLayout) {
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size);
    }
    double v15 = v14 + 0.0;
  }
  else
  {
    double v15 = 0.0;
    if (!self->_isTemplateLayout) {
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
  }
  v16 = [(UILabel *)self->_subtitleLabel text];

  if (v16)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGFloat v18 = v17;
    CGRectDivide(remainder, &v24, &remainder, 5.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v24, &remainder, v18, CGRectMinYEdge);
    if (!self->_isTemplateLayout) {
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size);
    }
    double v15 = v15 + v18 + 5.0;
  }
  else if (!self->_isTemplateLayout)
  {
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v19 = [(UILabel *)self->_secondarySubtitleLabel text];

  if (v19)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondarySubtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGFloat v21 = v20;
    CGRectDivide(remainder, &v24, &remainder, 14.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v24, &remainder, v21, CGRectMinYEdge);
    if (!self->_isTemplateLayout) {
      -[UILabel setFrame:](self->_secondarySubtitleLabel, "setFrame:", *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size);
    }
    double v15 = v15 + v21 + 14.0;
  }
  else if (!self->_isTemplateLayout)
  {
    -[UILabel setFrame:](self->_secondarySubtitleLabel, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  double v22 = CGRectGetWidth(v28);
  double v23 = fmax(v15, 46.0) + 28.0;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (UIContentConfiguration)configuration
{
  return self->_configuration;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)secondarySubtitleLabel
{
  return self->_secondarySubtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end