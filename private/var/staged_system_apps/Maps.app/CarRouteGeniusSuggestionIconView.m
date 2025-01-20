@interface CarRouteGeniusSuggestionIconView
- (CarRouteGeniusSuggestionIconView)initWithImage:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation CarRouteGeniusSuggestionIconView

- (CarRouteGeniusSuggestionIconView)initWithImage:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CarRouteGeniusSuggestionIconView;
  v5 = -[CarRouteGeniusSuggestionIconView initWithFrame:](&v20, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v4];
    imageView = v5->_imageView;
    v5->_imageView = v6;

    [(UIImageView *)v5->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v5->_imageView setContentMode:1];
    v8 = +[UIColor clearColor];
    [(UIImageView *)v5->_imageView setBackgroundColor:v8];

    [(CarRouteGeniusSuggestionIconView *)v5 addSubview:v5->_imageView];
    LODWORD(v9) = 1148846080;
    v10 = -[UIImageView _maps_constraintsEqualToEdgesOfView:insets:priority:](v5->_imageView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v5, 10.0, 0.0, 0.0, 0.0, v9);
    v11 = [v10 allConstraints];
    id v12 = [v11 mutableCopy];

    v13 = [(UIImageView *)v5->_imageView heightAnchor];
    v14 = [v13 constraintEqualToConstant:25.0];
    v21[0] = v14;
    v15 = [(UIImageView *)v5->_imageView widthAnchor];
    v16 = [(UIImageView *)v5->_imageView heightAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v21[1] = v17;
    v18 = +[NSArray arrayWithObjects:v21 count:2];
    [v12 addObjectsFromArray:v18];

    +[NSLayoutConstraint activateConstraints:v12];
  }

  return v5;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end