@interface NibView
- (NSBundle)bundle;
- (NSString)nibName;
- (NibView)initWithCoder:(id)a3;
- (NibView)initWithFrame:(CGRect)a3;
- (NibView)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)contentView;
- (void)setContentView:(id)a3;
@end

@implementation NibView

- (NibView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(NibView *)self initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7) {
    -[NibView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (NibView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NibView;
  return [(NibView *)&v4 initWithCoder:a3];
}

- (NibView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NibView;
  v8 = -[NibView initWithFrame:](&v19, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    nibName = v8->_nibName;
    v8->_nibName = v9;

    objc_storeStrong((id *)&v8->_bundle, a4);
    v11 = [(NibView *)v8 bundle];
    v12 = [(NibView *)v8 nibName];
    id v13 = [v11 loadNibNamed:v12 owner:v8 options:0];

    [(NibView *)v8 contentViewDidLoad];
    double y = CGPointZero.y;
    v15 = [(NibView *)v8 contentView];
    [v15 _mapkit_fittingSize];
    -[NibView setFrame:](v8, "setFrame:", CGPointZero.x, y, v16, v17);
  }
  return v8;
}

- (NSString)nibName
{
  nibName = self->_nibName;
  if (!nibName)
  {
    objc_super v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_nibName;
    self->_nibName = v5;

    nibName = self->_nibName;
  }

  return nibName;
}

- (NSBundle)bundle
{
  bundle = self->_bundle;
  if (!bundle)
  {
    objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = self->_bundle;
    self->_bundle = v4;

    bundle = self->_bundle;
  }

  return bundle;
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v22 = v5;
    v8 = [(UIView *)contentView superview];

    if (v8 == self) {
      [(UIView *)*p_contentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    [(NibView *)self addSubview:*p_contentView];
    [(UIView *)*p_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [(UIView *)*p_contentView leftAnchor];
    v20 = [(NibView *)self leftAnchor];
    objc_super v19 = [v21 constraintEqualToAnchor:v20];
    v23[0] = v19;
    v9 = [(UIView *)*p_contentView topAnchor];
    v10 = [(NibView *)self topAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v23[1] = v11;
    v12 = [(UIView *)*p_contentView rightAnchor];
    id v13 = [(NibView *)self rightAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v23[2] = v14;
    v15 = [(UIView *)*p_contentView bottomAnchor];
    double v16 = [(NibView *)self bottomAnchor];
    double v17 = [v15 constraintEqualToAnchor:v16];
    v23[3] = v17;
    v18 = +[NSArray arrayWithObjects:v23 count:4];
    +[NSLayoutConstraint activateConstraints:v18];

    v5 = v22;
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_bundle, 0);

  objc_storeStrong((id *)&self->_nibName, 0);
}

@end