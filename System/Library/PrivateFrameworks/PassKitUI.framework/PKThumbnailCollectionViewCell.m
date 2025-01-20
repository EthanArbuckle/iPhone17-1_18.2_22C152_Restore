@interface PKThumbnailCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNAvatarView)avatarView;
- (NSString)identifier;
- (NSString)title;
- (PKThumbnailCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_resetFonts;
- (void)_setupImageView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setStrokeImage:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)showAvatarView:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKThumbnailCollectionViewCell

- (PKThumbnailCollectionViewCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PKThumbnailCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKThumbnailCollectionViewCell *)v3 contentView];
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    [(PKThumbnailCollectionViewCell *)v4 _setupImageView:v4->_imageView];
    [v5 addSubview:v4->_imageView];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    labelTitle = v4->_labelTitle;
    v4->_labelTitle = v8;

    [(UILabel *)v4->_labelTitle setNumberOfLines:2];
    [(UILabel *)v4->_labelTitle setTextAlignment:1];
    LODWORD(v10) = 1036831949;
    [(UILabel *)v4->_labelTitle _setHyphenationFactor:v10];
    [(UILabel *)v4->_labelTitle setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v5 addSubview:v4->_labelTitle];
    uint64_t v11 = objc_msgSend(objc_alloc(getCNAvatarViewClass_2()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    avatarView = v4->_avatarView;
    v4->_avatarView = (CNAvatarView *)v11;

    [(CNAvatarView *)v4->_avatarView setUserInteractionEnabled:0];
    [(CNAvatarView *)v4->_avatarView setAsynchronousRendering:1];
    [(CNAvatarView *)v4->_avatarView setShowsContactOnTap:0];
    [(CNAvatarView *)v4->_avatarView setHidden:1];
    [v5 addSubview:v4->_avatarView];
    [(PKThumbnailCollectionViewCell *)v4 _resetFonts];
    [(PKThumbnailCollectionViewCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F853C0]];
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKThumbnailCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v4 prepareForReuse];
  identifier = self->_identifier;
  self->_identifier = 0;
}

- (void)_resetFonts
{
  labelTitle = self->_labelTitle;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4F24858], (NSString *)*MEMORY[0x1E4FB27B8]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)labelTitle setFont:v3];
}

- (void)_setupImageView:(id)a3
{
  id v4 = a3;
  [v4 setContentMode:1];
  id v7 = [v4 layer];

  [v7 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [v7 setCornerRadius:6.0];
  [v7 setMasksToBounds:1];
  id v5 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  objc_msgSend(v7, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  if (self->_strokeImage) {
    double v6 = PKUIPixelLength();
  }
  else {
    double v6 = 0.0;
  }
  [v7 setBorderWidth:v6];
}

- (void)setStrokeImage:(BOOL)a3
{
  if (((!self->_strokeImage ^ a3) & 1) == 0)
  {
    self->_strokeImage = a3;
    imageView = self->_imageView;
    if (imageView)
    {
      id v6 = [(UIImageView *)imageView layer];
      if (self->_strokeImage) {
        double v5 = PKUIPixelLength();
      }
      else {
        double v5 = 0.0;
      }
      [v6 setBorderWidth:v5];
    }
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKThumbnailCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v12 layoutSubviews];
  [(PKThumbnailCollectionViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[CNAvatarView setFrame:](self->_avatarView, "setFrame:", v4, v6, v8, v8);
  -[UILabel sizeThatFits:](self->_labelTitle, "sizeThatFits:", v8, v10 - v8 + -6.0);
  -[UILabel setFrame:](self->_labelTitle, "setFrame:", v4, v6 + v8 + 6.0, v8, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(UILabel *)self->_labelTitle font];
  [v5 lineHeight];
  double v7 = width + 6.0 + v6 * 2.0;

  double v8 = fmin(v7, height);
  double v9 = width;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (void)showAvatarView:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNAvatarView *)self->_avatarView setHidden:!a3];
  imageView = self->_imageView;

  [(UIImageView *)imageView setHidden:v3];
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v7)
  {
    objc_storeStrong((id *)&self->_image, a3);
    if (*p_image)
    {
      [(PKThumbnailCollectionViewCell *)self showAvatarView:0];
      imageView = self->_imageView;
      if (imageView)
      {
        if (v4)
        {
          double v10 = imageView;
          double v11 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_image];
          objc_super v12 = self->_imageView;
          self->_imageView = v11;

          [(PKThumbnailCollectionViewCell *)self _setupImageView:self->_imageView];
          [(UIImageView *)self->_imageView setImage:*p_image];
          [(UIImageView *)self->_imageView setAlpha:0.0];
          v13 = (void *)MEMORY[0x1E4FB1EB0];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __51__PKThumbnailCollectionViewCell_setImage_animated___block_invoke;
          v25[3] = &unk_1E59CA870;
          v25[4] = self;
          v26 = v10;
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __51__PKThumbnailCollectionViewCell_setImage_animated___block_invoke_2;
          v23[3] = &unk_1E59CB6D8;
          v24 = v26;
          objc_super v14 = v26;
          objc_msgSend(v13, "pkui_animateUsingOptions:animations:completion:", 4, v25, v23);
        }
        else
        {
          objc_super v14 = [(UIImageView *)imageView image];
          [(UIImageView *)self->_imageView setImage:*p_image];
          v18 = [(UIImageView *)self->_imageView image];

          if (v18 == v14)
          {
            v19 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_image];
            v20 = self->_imageView;
            self->_imageView = v19;

            [(PKThumbnailCollectionViewCell *)self _setupImageView:self->_imageView];
          }
        }
      }
      else
      {
        v16 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_image];
        v17 = self->_imageView;
        self->_imageView = v16;

        [(PKThumbnailCollectionViewCell *)self _setupImageView:self->_imageView];
      }
      v21 = [(UIImageView *)self->_imageView superview];

      if (!v21)
      {
        v22 = [(PKThumbnailCollectionViewCell *)self contentView];
        [v22 addSubview:self->_imageView];

        goto LABEL_14;
      }
    }
    else
    {
      v15 = [(UIImageView *)self->_imageView superview];

      if (v15)
      {
        [(UIImageView *)self->_imageView removeFromSuperview];
LABEL_14:
        [(PKThumbnailCollectionViewCell *)self setNeedsLayout];
      }
    }
  }
}

uint64_t __51__PKThumbnailCollectionViewCell_setImage_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 728) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __51__PKThumbnailCollectionViewCell_setImage_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  double v6 = self->_title;
  double v7 = (NSString *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_title, a3);
    [(UILabel *)self->_labelTitle setText:v9];
    [(PKThumbnailCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKThumbnailCollectionViewCell;
  [(PKThumbnailCollectionViewCell *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKThumbnailCollectionViewCell *)self traitCollection];
  double v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      double v7 = [v4 preferredContentSizeCategory];
      BOOL v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9) {
        [(PKThumbnailCollectionViewCell *)self _resetFonts];
      }
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_labelTitle, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end