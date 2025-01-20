@interface CarFocusableImageButton
- (BOOL)isAccessibilityElement;
- (BOOL)needsContinuousRoundedCorners;
- (CGSize)intrinsicContentSize;
- (CarFocusableImageButton)initWithFrame:(CGRect)a3;
- (CarFocusableImageButton)initWithImage:(id)a3;
- (CarFocusableImageButton)initWithImage:(id)a3 edgeInsets:(UIEdgeInsets)a4;
- (int64_t)semanticContentAttributeForImage;
- (void)setImage:(id)a3;
- (void)setRoundedCorners:(unint64_t)a3;
- (void)setSemanticContentAttributeForImage:(int64_t)a3;
@end

@implementation CarFocusableImageButton

- (CarFocusableImageButton)initWithFrame:(CGRect)a3
{
  return -[CarFocusableImageButton initWithImage:](self, "initWithImage:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CarFocusableImageButton)initWithImage:(id)a3
{
  return -[CarFocusableImageButton initWithImage:edgeInsets:](self, "initWithImage:edgeInsets:", a3, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
}

- (CarFocusableImageButton)initWithImage:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CarFocusableImageButton;
  v10 = -[CarFocusableBlurControl initWithFrame:](&v35, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v11 = v10;
  if (v10)
  {
    [(CarFocusableBlurControl *)v10 setRoundedCornerRadius:14.0];
    v12 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v9];
    imageView = v11->_imageView;
    v11->_imageView = v12;

    [(UIImageView *)v11->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v11->_imageView setContentMode:1];
    [(CarFocusableControl *)v11 addSubview:v11->_imageView];
    v34 = [(UIImageView *)v11->_imageView centerXAnchor];
    v33 = [(CarFocusableImageButton *)v11 centerXAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v36[0] = v32;
    v31 = [(UIImageView *)v11->_imageView centerYAnchor];
    v30 = [(CarFocusableImageButton *)v11 centerYAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v36[1] = v29;
    v28 = [(UIImageView *)v11->_imageView topAnchor];
    v27 = [(CarFocusableImageButton *)v11 topAnchor];
    v26 = [v28 constraintGreaterThanOrEqualToAnchor:v27 constant:top];
    v36[2] = v26;
    v25 = [(UIImageView *)v11->_imageView leftAnchor];
    v24 = [(CarFocusableImageButton *)v11 leftAnchor];
    v14 = [v25 constraintGreaterThanOrEqualToAnchor:v24 constant:left];
    v36[3] = v14;
    v15 = [(CarFocusableImageButton *)v11 rightAnchor];
    v16 = [(UIImageView *)v11->_imageView rightAnchor];
    v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16 constant:right];
    v36[4] = v17;
    v18 = [(CarFocusableImageButton *)v11 bottomAnchor];
    v19 = [(UIImageView *)v11->_imageView bottomAnchor];
    v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19 constant:bottom];
    v36[5] = v20;
    +[NSArray arrayWithObjects:v36 count:6];
    v22 = id v21 = v9;
    +[NSLayoutConstraint activateConstraints:v22];

    id v9 = v21;
  }

  return v11;
}

- (CGSize)intrinsicContentSize
{
  unint64_t v2 = [(CarFocusableBlurControl *)self roundedCorners];
  double v3 = 28.0;
  if (v2 != -1) {
    double v3 = 33.0;
  }
  double v4 = 28.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)setSemanticContentAttributeForImage:(int64_t)a3
{
  if (self->_semanticContentAttributeForImage != a3)
  {
    self->_semanticContentAttributeForImage = a3;
    -[UIImageView setSemanticContentAttribute:](self->_imageView, "setSemanticContentAttribute:");
  }
}

- (BOOL)needsContinuousRoundedCorners
{
  return 0;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  if ([(CarFocusableBlurControl *)self roundedCorners] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CarFocusableImageButton;
    [(CarFocusableBlurControl *)&v5 setRoundedCorners:a3];
    [(CarFocusableImageButton *)self invalidateIntrinsicContentSize];
  }
}

- (void)setImage:(id)a3
{
  [(UIImageView *)self->_imageView setImage:a3];
  [(CarFocusableImageButton *)self setNeedsLayout];

  [(CarFocusableImageButton *)self layoutIfNeeded];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)semanticContentAttributeForImage
{
  return self->_semanticContentAttributeForImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end