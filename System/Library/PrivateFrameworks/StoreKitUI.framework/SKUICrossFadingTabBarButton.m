@interface SKUICrossFadingTabBarButton
- (NSString)title;
- (SKUICrossFadingTabBarButton)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImage)selectedImage;
- (double)selectionProgress;
- (void)_positionBadge;
- (void)_setBadgeValue:(id)a3;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setSelectedImage:(id)a3;
- (void)setSelectionProgress:(double)a3;
- (void)setTitle:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SKUICrossFadingTabBarButton

- (SKUICrossFadingTabBarButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICrossFadingTabBarButton initWithFrame:]();
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUICrossFadingTabBarButton;
  v8 = -[SKUICrossFadingTabBarButton initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    standardTitleLabel = v8->_standardTitleLabel;
    v8->_standardTitleLabel = v9;

    v11 = v8->_standardTitleLabel;
    v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)v8->_standardTitleLabel setOpaque:0];
    v13 = v8->_standardTitleLabel;
    v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.57254902 alpha:1.0];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v8->_standardTitleLabel setBackgroundColor:0];
    [(SKUICrossFadingTabBarButton *)v8 addSubview:v8->_standardTitleLabel];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    selectedTitleLabel = v8->_selectedTitleLabel;
    v8->_selectedTitleLabel = v15;

    [(UILabel *)v8->_selectedTitleLabel setAlpha:0.0];
    v17 = v8->_selectedTitleLabel;
    v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
    [(UILabel *)v17 setFont:v18];

    [(UILabel *)v8->_selectedTitleLabel setOpaque:0];
    v19 = v8->_selectedTitleLabel;
    v20 = [(SKUICrossFadingTabBarButton *)v8 tintColor];
    [(UILabel *)v19 setTextColor:v20];

    [(UILabel *)v8->_selectedTitleLabel setBackgroundColor:0];
    [(SKUICrossFadingTabBarButton *)v8 addSubview:v8->_selectedTitleLabel];
    [(UILabel *)v8->_standardTitleLabel setAdjustsLetterSpacingToFitWidth:1];
    [(UILabel *)v8->_selectedTitleLabel setAdjustsLetterSpacingToFitWidth:1];
    v21 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    standardImageView = v8->_standardImageView;
    v8->_standardImageView = v21;

    [(SKUICrossFadingTabBarButton *)v8 addSubview:v8->_standardImageView];
    v23 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    selectedImageView = v8->_selectedImageView;
    v8->_selectedImageView = v23;

    [(UIImageView *)v8->_selectedImageView setAlpha:0.0];
    [(SKUICrossFadingTabBarButton *)v8 addSubview:v8->_selectedImageView];
    [(UILabel *)v8->_standardTitleLabel _setDrawsAsBackdropOverlayWithBlendMode:1];
    [(UIImageView *)v8->_standardImageView _setDrawsAsBackdropOverlayWithBlendMode:1];
    v25 = [(SKUICrossFadingTabBarButton *)v8 layer];
    [v25 setAllowsGroupOpacity:0];
  }
  return v8;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)SKUICrossFadingTabBarButton;
  [(SKUICrossFadingTabBarButton *)&v41 layoutSubviews];
  [(SKUICrossFadingTabBarButton *)self bounds];
  CGRect v43 = CGRectInset(v42, 0.0, 2.0);
  CGFloat x = v43.origin.x;
  CGFloat rect_24 = v43.origin.y;
  double width = v43.size.width;
  double height = v43.size.height;
  -[UILabel sizeThatFits:](self->_standardTitleLabel, "sizeThatFits:", v43.size.width, v43.size.height);
  double v7 = v6;
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_selectedTitleLabel, "sizeThatFits:", width, height);
  CGFloat v12 = *MEMORY[0x1E4F1DB28];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  if (v7 < v10) {
    double v7 = v10;
  }
  if (v9 >= v11) {
    double v14 = v9;
  }
  else {
    double v14 = v11;
  }
  CGFloat v36 = v14;
  CGFloat rect = *MEMORY[0x1E4F1DB28];
  v44.origin.CGFloat x = x;
  CGFloat rect_8 = width;
  CGFloat rect_16 = x;
  v44.origin.double y = rect_24;
  v44.size.double width = width;
  v44.size.double height = height;
  double v15 = CGRectGetWidth(v44);
  v45.origin.CGFloat x = v12;
  v45.origin.double y = v13;
  v45.size.double width = v7;
  v45.size.double height = v36;
  CGFloat v16 = (v15 - CGRectGetWidth(v45)) * 0.5;
  v46.origin.CGFloat x = x;
  v46.origin.double y = rect_24;
  v46.size.double width = width;
  v46.size.double height = height;
  CGRectGetMaxY(v46);
  v47.origin.CGFloat x = v16;
  v47.origin.double y = v13;
  CGFloat v17 = v13;
  v47.size.double width = v7;
  v47.size.double height = v36;
  CGRectGetHeight(v47);
  UICeilToViewScale();
  double v19 = v18;
  UICeilToViewScale();
  double v21 = v20;
  UIFloorToViewScale();
  double v23 = v22;
  UIFloorToViewScale();
  double v25 = v24;
  -[UILabel setFrame:](self->_standardTitleLabel, "setFrame:", v23, v24, v19, v21);
  -[UILabel setFrame:](self->_selectedTitleLabel, "setFrame:", v23, v25, v19, v21);
  [(UIImage *)self->_image size];
  double v27 = v26;
  double v29 = v28;
  [(UIImage *)self->_selectedImage size];
  if (v27 < v30) {
    double v27 = v30;
  }
  if (v29 < v31) {
    double v29 = v31;
  }
  v48.origin.CGFloat x = v23;
  v48.origin.double y = v25;
  v48.size.double width = v19;
  v48.size.double height = v21;
  CGRectGetMidX(v48);
  v49.origin.CGFloat x = rect;
  v49.origin.double y = v17;
  v49.size.double width = v27;
  v49.size.double height = v29;
  CGRectGetWidth(v49);
  UIFloorToViewScale();
  double v33 = v32;
  v50.origin.CGFloat x = rect_16;
  v50.origin.double y = rect_24;
  v50.size.double width = rect_8;
  v50.size.double height = height;
  CGRectGetHeight(v50);
  v51.origin.CGFloat x = v33;
  v51.origin.double y = v17;
  v51.size.double width = v27;
  v51.size.double height = v29;
  CGRectGetHeight(v51);
  UIFloorToViewScale();
  double v35 = v34 + -4.0;
  -[UIImageView setFrame:](self->_standardImageView, "setFrame:", v33, v34 + -4.0, v27, v29);
  -[UIImageView setFrame:](self->_selectedImageView, "setFrame:", v33, v35, v27, v29);
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)SKUICrossFadingTabBarButton;
  [(SKUICrossFadingTabBarButton *)&v6 tintColorDidChange];
  v3 = [(SKUICrossFadingTabBarButton *)self tintColor];
  [(UILabel *)self->_selectedTitleLabel setTextColor:v3];
  selectedImageView = self->_selectedImageView;
  v5 = [(UIImage *)self->_selectedImage _flatImageWithColor:v3];
  [(UIImageView *)selectedImageView setImage:v5];
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    id v4 = a3;
    v5 = (NSString *)[v4 copy];
    title = self->_title;
    self->_title = v5;

    [(UILabel *)self->_selectedTitleLabel setText:v4];
    [(UILabel *)self->_standardTitleLabel setText:v4];

    [(SKUICrossFadingTabBarButton *)self setNeedsLayout];
  }
}

- (void)setImage:(id)a3
{
  double v8 = (UIImage *)a3;
  if (self->_image != v8)
  {
    objc_storeStrong((id *)&self->_image, a3);
    standardImageView = self->_standardImageView;
    objc_super v6 = [(UILabel *)self->_standardTitleLabel textColor];
    double v7 = [(UIImage *)v8 _flatImageWithColor:v6];
    [(UIImageView *)standardImageView setImage:v7];

    [(SKUICrossFadingTabBarButton *)self setNeedsLayout];
  }
}

- (void)setSelectedImage:(id)a3
{
  double v8 = (UIImage *)a3;
  if (self->_selectedImage != v8)
  {
    objc_storeStrong((id *)&self->_selectedImage, a3);
    selectedImageView = self->_selectedImageView;
    objc_super v6 = [(SKUICrossFadingTabBarButton *)self tintColor];
    double v7 = [(UIImage *)v8 _flatImageWithColor:v6];
    [(UIImageView *)selectedImageView setImage:v7];

    [(SKUICrossFadingTabBarButton *)self setNeedsLayout];
  }
}

- (void)setSelectionProgress:(double)a3
{
  if (self->_selectionProgress != a3)
  {
    self->_selectionProgress = a3;
    if (a3 < 0.0) {
      a3 = 0.0;
    }
    double v4 = fmin(a3, 1.0);
    [(UILabel *)self->_selectedTitleLabel setAlpha:v4];
    [(UILabel *)self->_standardTitleLabel setAlpha:1.0 - v4];
    [(UIImageView *)self->_selectedImageView setAlpha:v4];
    standardImageView = self->_standardImageView;
    [(UIImageView *)standardImageView setAlpha:1.0 - v4];
  }
}

- (void)_setBadgeValue:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ([0 length]) {
      goto LABEL_10;
    }
    id v4 = 0;
LABEL_9:

    goto LABEL_10;
  }
  id v4 = v12;
  if (![v4 length]) {
    goto LABEL_9;
  }
  if (!v4)
  {
LABEL_10:
    [(_Badge *)self->_badge removeFromSuperview];
    badge = self->_badge;
    self->_badge = 0;

    id v4 = 0;
    goto LABEL_11;
  }
  v5 = self->_badge;
  if (!v5)
  {
    double v10 = [[_Badge alloc] initWithText:v4];
    double v11 = self->_badge;
    self->_badge = v10;

    [(SKUICrossFadingTabBarButton *)self addSubview:self->_badge];
    goto LABEL_15;
  }
  [(_Badge *)v5 frame];
  double v7 = v6;
  [(_Badge *)self->_badge setText:v4];
  [(_Badge *)self->_badge frame];
  if (v7 != v8) {
LABEL_15:
  }
    [(SKUICrossFadingTabBarButton *)self _positionBadge];
LABEL_11:
}

- (void)_positionBadge
{
  uint64_t v3 = [(SKUICrossFadingTabBarButton *)self superview];
  badge = self->_badge;
  if (badge) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    double v19 = (void *)v3;
    [(_Badge *)badge frame];
    CGFloat v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [(SKUICrossFadingTabBarButton *)self superview];
    -[SKUICrossFadingTabBarButton convertPoint:fromView:](self, "convertPoint:fromView:", v12, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    CGFloat v14 = v13 + 3.0;

    [(UIImageView *)self->_standardImageView frame];
    CGRectGetMaxX(v21);
    UIRoundToViewScale();
    double v16 = v15 + -5.0;
    [v19 bounds];
    -[SKUICrossFadingTabBarButton convertPoint:fromView:](self, "convertPoint:fromView:", v19, CGRectGetMaxX(v22) + -0.5, 0.0);
    UIRoundToViewScale();
    double v18 = v17;
    v23.origin.CGFloat x = v7;
    v23.origin.double y = v14;
    v23.size.double width = v9;
    v23.size.double height = v11;
    badge = (_Badge *)-[_Badge setFrame:](self->_badge, "setFrame:", fmax(fmin(v16, v18 - CGRectGetWidth(v23)), 0.0), v14, v9, v11);
    uint64_t v3 = (uint64_t)v19;
  }

  MEMORY[0x1F41817F8](badge, v3);
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (double)selectionProgress
{
  return self->_selectionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_standardImageView, 0);
  objc_storeStrong((id *)&self->_standardTitleLabel, 0);
  objc_storeStrong((id *)&self->_selectedImageView, 0);

  objc_storeStrong((id *)&self->_selectedTitleLabel, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICrossFadingTabBarButton initWithFrame:]";
}

@end