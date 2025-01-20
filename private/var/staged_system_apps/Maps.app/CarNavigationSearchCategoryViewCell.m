@interface CarNavigationSearchCategoryViewCell
- (CarNavigationSearchCategoryViewCell)initWithFrame:(CGRect)a3;
- (NSUUID)updateIdentifier;
- (UIImage)image;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setUpdateIdentifier:(id)a3;
@end

@implementation CarNavigationSearchCategoryViewCell

- (CarNavigationSearchCategoryViewCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CarNavigationSearchCategoryViewCell;
  v3 = -[CarNavigationSearchCategoryViewCell initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(CarNavigationSearchCategoryViewCell *)v3 setBackgroundColor:v4];
    v5 = [(CarNavigationSearchCategoryViewCell *)v3 contentView];
    [v5 setBackgroundColor:v4];

    id v6 = objc_alloc((Class)UIImageView);
    [(CarNavigationSearchCategoryViewCell *)v3 bounds];
    v7 = [v6 initWithFrame:];
    imageView = v3->_imageView;
    v3->_imageView = v7;

    [(UIImageView *)v3->_imageView setAutoresizingMask:18];
    [(UIImageView *)v3->_imageView setContentMode:1];
    v9 = [(CarNavigationSearchCategoryViewCell *)v3 contentView];
    [v9 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CarNavigationSearchCategoryViewCell;
  -[CarNavigationSearchCategoryViewCell setHighlighted:](&v13, "setHighlighted:");
  if (v3)
  {
    CGAffineTransformMakeScale(&v12, 0.949999988, 0.949999988);
    imageView = self->_imageView;
    CGAffineTransform v11 = v12;
    id v6 = &v11;
  }
  else
  {
    imageView = self->_imageView;
    long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v9 = v7;
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    id v6 = (CGAffineTransform *)&v8;
  }
  -[UIImageView setTransform:](imageView, "setTransform:", v6, v8, v9, v10, *(_OWORD *)&v11.a, *(_OWORD *)&v11.c, *(_OWORD *)&v11.tx);
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateIdentifier, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end