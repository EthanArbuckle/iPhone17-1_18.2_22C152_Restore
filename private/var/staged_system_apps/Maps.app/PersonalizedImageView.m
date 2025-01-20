@interface PersonalizedImageView
- (CGSize)intrinsicContentSize;
- (PersonalizedImageView)initWithMainImage:(id)a3 mainImageSize:(CGSize)a4 userImageDiameter:(double)a5 userImageExtensionPastMainImage:(double)a6;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)layoutSubviews;
@end

@implementation PersonalizedImageView

- (PersonalizedImageView)initWithMainImage:(id)a3 mainImageSize:(CGSize)a4 userImageDiameter:(double)a5 userImageExtensionPastMainImage:(double)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PersonalizedImageView;
  v13 = -[PersonalizedImageView initWithFrame:](&v16, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_mainImage, a3);
    v14->_mainImageSize.CGFloat width = width;
    v14->_mainImageSize.CGFloat height = height;
    v14->_userImageSize.CGFloat width = a5;
    v14->_userImageSize.CGFloat height = a5;
    v14->_userImageExtensionPastMainImage = a6;
    [(PersonalizedImageView *)v14 _setupViews];
    [(PersonalizedImageView *)v14 _setupConstraints];
  }

  return v14;
}

- (void)_setupViews
{
  id v3 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  mainImageView = self->_mainImageView;
  self->_mainImageView = v7;

  [(UIImageView *)self->_mainImageView setImage:self->_mainImage];
  [(UIImageView *)self->_mainImageView setContentMode:1];
  [(PersonalizedImageView *)self addSubview:self->_mainImageView];
  v9 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  userImageView = self->_userImageView;
  self->_userImageView = v9;

  v11 = +[UserInformationManager sharedInstance];
  id v12 = [v11 userIcon];
  [(UIImageView *)self->_userImageView setImage:v12];

  [(PersonalizedImageView *)self addSubview:self->_userImageView];
  LODWORD(v13) = 1148846080;
  [(PersonalizedImageView *)self setContentCompressionResistancePriority:1 forAxis:v13];
  LODWORD(v14) = 1148846080;

  [(PersonalizedImageView *)self setContentCompressionResistancePriority:0 forAxis:v14];
}

- (void)_setupConstraints
{
  id v3 = [objc_alloc((Class)MUSizeLayout) initWithItem:self->_mainImageView size:self->_mainImageSize.width, self->_mainImageSize.height];
  v26[0] = v3;
  id v4 = [objc_alloc((Class)MUSizeLayout) initWithItem:self->_userImageView size:self->_userImageSize.width, self->_userImageSize.height];
  v26[1] = v4;
  v5 = +[NSArray arrayWithObjects:v26 count:2];
  +[NSLayoutConstraint _mapsui_activateLayouts:v5];

  v24 = [(UIImageView *)self->_mainImageView topAnchor];
  v23 = [(PersonalizedImageView *)self topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v25[0] = v22;
  v21 = [(UIImageView *)self->_mainImageView leftAnchor];
  v20 = [(PersonalizedImageView *)self leftAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:self->_userImageExtensionPastMainImage + -4.0];
  v25[1] = v19;
  v18 = [(UIImageView *)self->_mainImageView rightAnchor];
  v17 = [(PersonalizedImageView *)self rightAnchor];
  objc_super v16 = [v18 constraintEqualToAnchor:v17 constant:-(self->_userImageExtensionPastMainImage + 4.0)];
  v25[2] = v16;
  v15 = [(UIImageView *)self->_mainImageView bottomAnchor];
  v6 = [(PersonalizedImageView *)self bottomAnchor];
  v7 = [v15 constraintEqualToAnchor:v6 constant:-self->_userImageExtensionPastMainImage];
  v25[3] = v7;
  v8 = [(UIImageView *)self->_userImageView rightAnchor];
  v9 = [(UIImageView *)self->_mainImageView rightAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:self->_userImageExtensionPastMainImage];
  v25[4] = v10;
  v11 = [(UIImageView *)self->_userImageView bottomAnchor];
  id v12 = [(UIImageView *)self->_mainImageView bottomAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12 constant:self->_userImageExtensionPastMainImage];
  v25[5] = v13;
  double v14 = +[NSArray arrayWithObjects:v25 count:6];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PersonalizedImageView;
  [(PersonalizedImageView *)&v9 layoutSubviews];
  [(UIImageView *)self->_mainImageView bounds];
  id v3 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  userImageView = self->_userImageView;
  [(UIImageView *)userImageView bounds];
  -[UIImageView convertRect:toView:](userImageView, "convertRect:toView:", self->_mainImageView);
  CGRect v11 = CGRectInset(v10, -3.0, -3.0);
  v5 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  [v3 appendPath:v5];
  v6 = +[CAShapeLayer layer];
  [v6 setFillRule:kCAFillRuleEvenOdd];
  id v7 = v3;
  [v6 setPath:[v7 CGPath]];
  v8 = [(UIImageView *)self->_mainImageView layer];
  [v8 setMask:v6];
}

- (CGSize)intrinsicContentSize
{
  double userImageExtensionPastMainImage = self->_userImageExtensionPastMainImage;
  double v3 = self->_mainImageSize.width + userImageExtensionPastMainImage * 2.0;
  double v4 = userImageExtensionPastMainImage + self->_mainImageSize.height;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainImage, 0);
  objc_storeStrong((id *)&self->_userImageView, 0);

  objc_storeStrong((id *)&self->_mainImageView, 0);
}

@end