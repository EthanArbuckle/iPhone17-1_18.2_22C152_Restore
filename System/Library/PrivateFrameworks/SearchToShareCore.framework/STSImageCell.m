@interface STSImageCell
- (BOOL)showDownloadIndicator;
- (CGRect)imageFrame;
- (NSString)category;
- (STSAnimatedImageInfo)imageInfo;
- (STSImageCell)initWithFrame:(CGRect)a3;
- (UIColor)placeholderColor;
- (UIEdgeInsets)imageInsets;
- (UIImage)badge;
- (UIImage)debugBadge;
- (UIImage)image;
- (double)downloadProgress;
- (double)imageAspectRatio;
- (void)_updateBadgeAnimated:(BOOL)a3;
- (void)_updatePlaceholderViewAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBadge:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDebugBadge:(id)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setImageInfo:(id)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setShowDownloadIndicator:(BOOL)a3;
- (void)setShowDownloadIndicator:(double)a3 animated:(BOOL)a4;
@end

@implementation STSImageCell

- (STSImageCell)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)STSImageCell;
  v3 = -[STSImageCell initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82828]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v9;

    v11 = v3->_imageView;
    v12 = [MEMORY[0x263F825C8] whiteColor];
    [(UIImageView *)v11 setBackgroundColor:v12];

    [(UIImageView *)v3->_imageView setContentMode:2];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    [(UIImageView *)v3->_imageView setAlpha:0.0];
    [(UIImageView *)v3->_imageView setOpaque:1];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
    labelView = v3->_labelView;
    v3->_labelView = (UILabel *)v13;

    v15 = v3->_labelView;
    v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v15 setFont:v16];

    v17 = v3->_labelView;
    v18 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v17 setTextColor:v18];

    [(UILabel *)v3->_labelView setTextAlignment:0];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v5, v6, v7, v8);
    labelBackgroundView = v3->_labelBackgroundView;
    v3->_labelBackgroundView = (UIView *)v19;

    v21 = v3->_labelBackgroundView;
    v22 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [(UIView *)v21 setBackgroundColor:v22];

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v5, v6, v7, v8);
    placeholderColorView = v3->_placeholderColorView;
    v3->_placeholderColorView = (UIView *)v23;

    [(UIView *)v3->_placeholderColorView setAlpha:0.0];
    v25 = [(STSImageCell *)v3 contentView];
    [v25 addSubview:v3->_imageView];

    v26 = [(STSImageCell *)v3 contentView];
    [v26 addSubview:v3->_placeholderColorView];

    v27 = [(STSImageCell *)v3 contentView];
    [v27 addSubview:v3->_labelBackgroundView];

    v28 = [(STSImageCell *)v3 contentView];
    [v28 addSubview:v3->_labelView];
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)STSImageCell;
  [(STSImageCell *)&v3 prepareForReuse];
  [(STSImageCell *)self setShowDownloadIndicator:0 animated:0.0];
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)STSImageCell;
  [(STSImageCell *)&v24 layoutSubviews];
  objc_super v3 = [(STSImageCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  double Width = CGRectGetWidth(v25);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  double Height = CGRectGetHeight(v26);
  [(STSImageCell *)self imageAspectRatio];
  UIFloorToViewScale();
  double v15 = v14;
  -[UIImageView sizeThatFits:](self->_badgeView, "sizeThatFits:", v9, v11);
  double v17 = v16;
  double v23 = v18;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  CGFloat v22 = CGRectGetMaxX(v27) - v17 + -5.0;
  double v19 = Height + -24.0;
  -[STSCellDownloadOverlayView setFrame:](self->_downloadProgressView, "setFrame:", v5, v7, v9, v11);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, Width, v15);
  -[UIView setFrame:](self->_placeholderColorView, "setFrame:", 0.0, 0.0, Width, v15);
  -[UIImageView setFrame:](self->_badgeView, "setFrame:", v22, 5.0, v17, v23);
  -[UIView setFrame:](self->_labelBackgroundView, "setFrame:", 0.0, v19, Width, 24.0);
  -[UILabel setFrame:](self->_labelView, "setFrame:", 6.0, v19, Width + -12.0, 24.0);
  if (STSIsInternalInstall())
  {
    -[UIImageView sizeThatFits:](self->_debugBadgeView, "sizeThatFits:", v9, v11);
    -[UIImageView setFrame:](self->_debugBadgeView, "setFrame:", 5.0, 5.0, v20, v21);
  }
}

- (double)imageAspectRatio
{
  return 1.0;
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

- (UIEdgeInsets)imageInsets
{
  [(STSImageCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat rect = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIImageView *)self->_imageView frame];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  CGFloat rect_16 = CGRectGetMinY(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat rect_8 = CGRectGetMinX(v26);
  v27.origin.CGFloat x = v4;
  v27.origin.CGFloat y = v6;
  v27.size.CGFloat width = v8;
  v27.size.CGFloat height = v10;
  double v15 = CGRectGetHeight(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v16 = v15 - CGRectGetMaxY(v28);
  v29.origin.CGFloat x = rect;
  v29.origin.CGFloat y = v6;
  v29.size.CGFloat width = v8;
  v29.size.CGFloat height = v10;
  double v17 = CGRectGetWidth(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double v18 = v17 - CGRectGetMaxX(v30);
  double v20 = rect_8;
  double v19 = rect_16;
  double v21 = v16;
  result.right = v18;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)setCategory:(id)a3
{
  id v4 = a3;
  uint64_t v13 = v4;
  if (v4)
  {
    BOOL v5 = [(NSString *)self->_category isEqualToString:v4];
    CGFloat v6 = v13;
    if (v5) {
      goto LABEL_6;
    }
    double v7 = (NSString *)[v13 copy];
    categorCGFloat y = self->_category;
    self->_categorCGFloat y = v7;

    [(UILabel *)self->_labelView setText:self->_category];
    labelView = self->_labelView;
    CGFloat v10 = [(STSImageCell *)self image];
    [(UILabel *)labelView setHidden:v10 == 0];

    labelBackgroundView = self->_labelBackgroundView;
    v12 = [(STSImageCell *)self image];
    [(UIView *)labelBackgroundView setHidden:v12 == 0];
  }
  else
  {
    [(UILabel *)self->_labelView setHidden:1];
    [(UIView *)self->_labelBackgroundView setHidden:1];
    v12 = self->_category;
    self->_categorCGFloat y = 0;
  }

  CGFloat v6 = v13;
LABEL_6:

  MEMORY[0x270F9A758](v5, v6);
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  CGFloat v6 = [(UIImageView *)self->_imageView image];
  char v7 = [v6 isEqual:v14];

  id v9 = v14;
  if ((v7 & 1) == 0)
  {
    [(UIImageView *)self->_imageView setImage:v14];
    double v10 = 1.0;
    if (!v14) {
      double v10 = 0.0;
    }
    [(UIImageView *)self->_imageView setAlpha:v10];
    uint64_t v11 = [(STSImageCell *)self category];
    if (v11)
    {
      v12 = (void *)v11;
      uint64_t v13 = [(UIImageView *)self->_imageView image];

      if (v13)
      {
        [(UILabel *)self->_labelView setHidden:0];
        [(UIView *)self->_labelBackgroundView setHidden:0];
      }
    }
    [(STSImageCell *)self _updateBadgeAnimated:v4];
    uint64_t v8 = [(STSImageCell *)self _updatePlaceholderViewAnimated:v4];
    id v9 = v14;
  }

  MEMORY[0x270F9A758](v8, v9);
}

- (void)setPlaceholderColor:(id)a3
{
  BOOL v5 = (UIColor *)a3;
  p_placeholderColor = &self->_placeholderColor;
  if (self->_placeholderColor != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_placeholderColor, a3);
    p_placeholderColor = (UIColor **)[(STSImageCell *)self _updatePlaceholderViewAnimated:0];
    BOOL v5 = v7;
  }

  MEMORY[0x270F9A758](p_placeholderColor, v5);
}

- (UIImage)badge
{
  return [(UIImageView *)self->_badgeView image];
}

- (void)setBadge:(id)a3
{
  id v13 = a3;
  BOOL v4 = [(UIImageView *)self->_badgeView image];
  char v5 = [v13 isEqual:v4];

  id v6 = v13;
  if ((v5 & 1) == 0)
  {
    badgeView = self->_badgeView;
    if (v13)
    {
      if (!badgeView)
      {
        id v8 = objc_alloc(MEMORY[0x263F82828]);
        id v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        double v10 = self->_badgeView;
        self->_badgeView = v9;

        [(UIImageView *)self->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
        uint64_t v11 = [(STSImageCell *)self contentView];
        [v11 insertSubview:self->_badgeView aboveSubview:self->_imageView];

        id v6 = v13;
        badgeView = self->_badgeView;
      }
      [(UIImageView *)badgeView setImage:v6];
      [(STSImageCell *)self setNeedsLayout];
    }
    else
    {
      [(UIImageView *)badgeView removeFromSuperview];
      v12 = self->_badgeView;
      self->_badgeView = 0;
    }
    [(STSImageCell *)self _updateBadgeAnimated:0];
  }

  MEMORY[0x270F9A790]();
}

- (UIImage)debugBadge
{
  return [(UIImageView *)self->_debugBadgeView image];
}

- (void)setDebugBadge:(id)a3
{
  id v13 = a3;
  if (STSIsInternalInstall())
  {
    BOOL v4 = [(UIImageView *)self->_debugBadgeView image];
    char v5 = [v13 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      debugBadgeView = self->_debugBadgeView;
      id v7 = v13;
      if (v13)
      {
        if (!debugBadgeView)
        {
          id v8 = objc_alloc(MEMORY[0x263F82828]);
          id v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
          double v10 = self->_debugBadgeView;
          self->_debugBadgeView = v9;

          [(UIImageView *)self->_debugBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
          uint64_t v11 = [(STSImageCell *)self contentView];
          [v11 insertSubview:self->_debugBadgeView aboveSubview:self->_placeholderColorView];

          id v7 = v13;
          debugBadgeView = self->_debugBadgeView;
        }
        [(UIImageView *)debugBadgeView setImage:v7];
        [(STSImageCell *)self setNeedsLayout];
      }
      else
      {
        [(UIImageView *)debugBadgeView removeFromSuperview];
        v12 = self->_debugBadgeView;
        self->_debugBadgeView = 0;
      }
    }
  }
}

- (void)setShowDownloadIndicator:(BOOL)a3
{
}

- (void)setShowDownloadIndicator:(double)a3 animated:(BOOL)a4
{
  LOBYTE(v4) = self->_showDownloadIndicator;
  if ((double)v4 != a3)
  {
    BOOL v6 = a4;
    self->_showDownloadIndicator = a3 != 0.0;
    if (a3 == 0.0)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke_2;
      v17[3] = &unk_264A053F0;
      v17[4] = self;
      v12 = (void (**)(void))MEMORY[0x230FB7F40](v17, a2);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke_3;
      v16[3] = &unk_264A057A0;
      v16[4] = self;
      id v13 = (void (**)(void, void))MEMORY[0x230FB7F40](v16);
      double v14 = 0.0;
      if (v6)
      {
LABEL_9:
        [MEMORY[0x263F82E00] animateWithDuration:4 delay:v12 options:v13 animations:0.2 completion:v14];
LABEL_15:

        return;
      }
    }
    else
    {
      if (!self->_downloadProgressView)
      {
        id v7 = [STSCellDownloadOverlayView alloc];
        id v8 = -[STSCellDownloadOverlayView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        downloadProgressView = self->_downloadProgressView;
        self->_downloadProgressView = v8;

        [(STSCellDownloadOverlayView *)self->_downloadProgressView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(STSCellDownloadOverlayView *)self->_downloadProgressView setAlpha:0.0];
        double v10 = [(STSImageCell *)self contentView];
        [v10 addSubview:self->_downloadProgressView];
      }
      [(STSImageCell *)self setNeedsLayout];
      uint64_t v11 = [(STSCellDownloadOverlayView *)self->_downloadProgressView progressView];
      [v11 setProgress:self->_downloadProgress];

      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke;
      v18[3] = &unk_264A053F0;
      v18[4] = self;
      v12 = (void (**)(void))MEMORY[0x230FB7F40](v18);
      id v13 = 0;
      double v14 = 0.2;
      if (v6) {
        goto LABEL_9;
      }
    }
    if (v12) {
      v12[2](v12);
    }
    if (v13) {
      v13[2](v13, 1);
    }
    goto LABEL_15;
  }
  id v15 = [(STSCellDownloadOverlayView *)self->_downloadProgressView progressView];
  [v15 setProgress:self->_downloadProgress];
}

uint64_t __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 664) setAlpha:1.0];
}

uint64_t __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 664) setAlpha:0.0];
}

void __50__STSImageCell_setShowDownloadIndicator_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 696))
  {
    [*(id *)(v1 + 664) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    unint64_t v4 = *(void **)(v3 + 664);
    *(void *)(v3 + 664) = 0;
  }
}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
  id v4 = [(STSCellDownloadOverlayView *)self->_downloadProgressView progressView];
  [v4 setProgress:a3];
}

- (void)_updateBadgeAnimated:(BOOL)a3
{
  id v4 = [(STSImageCell *)self image];
  double v5 = 1.0;
  if (!v4)
  {
    BOOL v6 = [(STSImageCell *)self imageInfo];
    if (v6) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.0;
    }
  }
  badgeView = self->_badgeView;

  [(UIImageView *)badgeView setAlpha:v5];
}

- (void)_updatePlaceholderViewAnimated:(BOOL)a3
{
  if (self->_placeholderColor)
  {
    id v4 = [(UIImageView *)self->_imageView image];
    double v5 = 0.0;
    if (!v4)
    {
      if (self->_imageInfo) {
        double v5 = 0.0;
      }
      else {
        double v5 = 1.0;
      }
    }
  }
  else
  {
    double v5 = 0.0;
  }
  [(UIView *)self->_placeholderColorView alpha];
  if (v5 != v6
    || (placeholderColor = self->_placeholderColor,
        [(UIView *)self->_placeholderColorView backgroundColor],
        id v8 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(placeholderColor) = [(UIColor *)placeholderColor isEqual:v8],
        v8,
        (placeholderColor & 1) == 0))
  {
    [(UIView *)self->_placeholderColorView setBackgroundColor:self->_placeholderColor];
    placeholderColorView = self->_placeholderColorView;
    [(UIView *)placeholderColorView setAlpha:v5];
  }
}

- (STSAnimatedImageInfo)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (BOOL)showDownloadIndicator
{
  return self->_showDownloadIndicator;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_imageInfo, 0);
  objc_storeStrong((id *)&self->_debugBadgeView, 0);
  objc_storeStrong((id *)&self->_labelBackgroundView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_downloadProgressView, 0);
  objc_storeStrong((id *)&self->_placeholderColorView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end