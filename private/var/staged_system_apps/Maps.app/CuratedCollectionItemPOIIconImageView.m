@interface CuratedCollectionItemPOIIconImageView
- (CuratedCollectionItemPOIIconImageView)initWithCoder:(id)a3;
- (CuratedCollectionItemPOIIconImageView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)imageView;
- (void)_commonInit;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation CuratedCollectionItemPOIIconImageView

- (CuratedCollectionItemPOIIconImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionItemPOIIconImageView;
  v3 = -[CuratedCollectionItemPOIIconImageView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CuratedCollectionItemPOIIconImageView *)v3 _commonInit];
  }
  return v4;
}

- (CuratedCollectionItemPOIIconImageView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionItemPOIIconImageView;
  v3 = [(CuratedCollectionItemPOIIconImageView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CuratedCollectionItemPOIIconImageView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v3 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(CuratedCollectionItemPOIIconImageView *)self setImageView:v3];

  v4 = [(CuratedCollectionItemPOIIconImageView *)self imageView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(CuratedCollectionItemPOIIconImageView *)self imageView];
  [v5 setContentMode:2];

  objc_super v6 = [(CuratedCollectionItemPOIIconImageView *)self imageView];
  [(CuratedCollectionItemPOIIconImageView *)self addSubview:v6];

  v7 = [(CuratedCollectionItemPOIIconImageView *)self traitCollection];
  if ([v7 userInterfaceIdiom] == (id)5) {
    double v8 = 24.0;
  }
  else {
    double v8 = 30.0;
  }

  v9 = [(CuratedCollectionItemPOIIconImageView *)self traitCollection];
  if ([v9 userInterfaceIdiom] == (id)5) {
    double v10 = -2.0;
  }
  else {
    double v10 = 0.0;
  }

  v11 = [(CuratedCollectionItemPOIIconImageView *)self traitCollection];
  if ([v11 userInterfaceIdiom] == (id)5) {
    double v12 = 10.0;
  }
  else {
    double v12 = 8.0;
  }

  v31 = [(CuratedCollectionItemPOIIconImageView *)self imageView];
  v30 = [v31 topAnchor];
  v29 = [(CuratedCollectionItemPOIIconImageView *)self topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:v10];
  v32[0] = v28;
  v27 = [(CuratedCollectionItemPOIIconImageView *)self imageView];
  v26 = [v27 leadingAnchor];
  v25 = [(CuratedCollectionItemPOIIconImageView *)self leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v32[1] = v24;
  v23 = [(CuratedCollectionItemPOIIconImageView *)self imageView];
  v13 = [v23 bottomAnchor];
  v14 = [(CuratedCollectionItemPOIIconImageView *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:v12];
  v32[2] = v15;
  v16 = [(CuratedCollectionItemPOIIconImageView *)self imageView];
  v17 = [v16 heightAnchor];
  v18 = [v17 constraintEqualToConstant:v8];
  v32[3] = v18;
  v19 = [(CuratedCollectionItemPOIIconImageView *)self imageView];
  v20 = [v19 widthAnchor];
  v21 = [v20 constraintEqualToConstant:v8];
  v32[4] = v21;
  v22 = +[NSArray arrayWithObjects:v32 count:5];
  +[NSLayoutConstraint activateConstraints:v22];
}

- (void)setImage:(id)a3
{
  p_image = (id *)&self->_image;
  id v8 = a3;
  if ((objc_msgSend(*p_image, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    id v6 = *p_image;
    v7 = [(CuratedCollectionItemPOIIconImageView *)self imageView];
    [v7 setImage:v6];
  }
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end