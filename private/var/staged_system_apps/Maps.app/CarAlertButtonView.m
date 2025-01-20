@interface CarAlertButtonView
- (BOOL)canBecomeFocused;
- (CarAlertButtonView)initWithTitle:(id)a3 image:(id)a4;
- (void)_setHighlightsForHitView:(id)a3;
- (void)_setupConstraints;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CarAlertButtonView

- (CarAlertButtonView)initWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CarAlertButtonView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[CarAlertButtonView initWithFrame:](&v18, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    [(CarAlertButtonView *)v11 setAccessibilityIdentifier:@"CarAlertButton"];
    v13 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    imageView = v12->_imageView;
    v12->_imageView = v13;

    [(UIImageView *)v12->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v12->_imageView setContentMode:1];
    [(UIImageView *)v12->_imageView setAccessibilityIdentifier:@"ImageView"];
    objc_storeStrong((id *)&v12->_image, a4);
    [(CarAlertButtonView *)v12 addSubview:v12->_imageView];
    v15 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v15;

    [(UILabel *)v12->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v12->_titleLabel setText:v6];
    [(UILabel *)v12->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [(CarAlertButtonView *)v12 addSubview:v12->_titleLabel];
    [(CarAlertButtonView *)v12 _setupConstraints];
    [(CarAlertButtonView *)v12 setHighlighted:0];
  }

  return v12;
}

- (void)_setupConstraints
{
  v30 = [(UILabel *)self->_titleLabel leadingAnchor];
  v29 = [(CarAlertButtonView *)self leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:12.0];
  v31[0] = v28;
  v27 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v26 = [(CarAlertButtonView *)self topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:28.0];
  v31[1] = v25;
  v24 = [(CarAlertButtonView *)self bottomAnchor];
  v23 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:14.0];
  v31[2] = v22;
  v21 = [(CarAlertButtonView *)self trailingAnchor];
  v20 = [(UILabel *)self->_titleLabel trailingAnchor];
  v19 = [v21 constraintGreaterThanOrEqualToAnchor:v20 constant:12.0];
  v31[3] = v19;
  objc_super v18 = [(UIImageView *)self->_imageView leadingAnchor];
  v17 = [(UILabel *)self->_titleLabel trailingAnchor];
  v16 = [v18 constraintGreaterThanOrEqualToAnchor:v17 constant:12.0];
  v31[4] = v16;
  v15 = [(UIImageView *)self->_imageView centerYAnchor];
  v14 = [(CarAlertButtonView *)self centerYAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v31[5] = v13;
  v3 = [(CarAlertButtonView *)self trailingAnchor];
  v4 = [(UIImageView *)self->_imageView trailingAnchor];
  v5 = [v3 constraintGreaterThanOrEqualToAnchor:v4 constant:12.0];
  v31[6] = v5;
  id v6 = [(UIImageView *)self->_imageView topAnchor];
  id v7 = [(CarAlertButtonView *)self topAnchor];
  v8 = [v6 constraintGreaterThanOrEqualToAnchor:v7 constant:8.0];
  v31[7] = v8;
  v9 = [(CarAlertButtonView *)self bottomAnchor];
  v10 = [(UIImageView *)self->_imageView bottomAnchor];
  v11 = [v9 constraintGreaterThanOrEqualToAnchor:v10 constant:8.0];
  v31[8] = v11;
  v12 = +[NSArray arrayWithObjects:v31 count:9];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)setHighlighted:(BOOL)a3
{
  if (a3)
  {
    id v7 = +[UIColor _carSystemFocusLabelColor];
    +[UIColor _carSystemFocusColor];
  }
  else
  {
    id v7 = +[UIColor _carSystemFocusColor];
    +[UIColor clearColor];
  v4 = };
  [(CarAlertButtonView *)self setBackgroundColor:v4];
  [(UILabel *)self->_titleLabel setTextColor:v7];
  imageView = self->_imageView;
  id v6 = [(UIImage *)self->_image _flatImageWithColor:v7];
  [(UIImageView *)imageView setImage:v6];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = [a3 nextFocusedItem];
  [(CarAlertButtonView *)self setHighlighted:v5 == self];
}

- (void)_setHighlightsForHitView:(id)a3
{
  if (a3 == self) {
    [a3 setHighlighted:1];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarAlertButtonView;
  [(CarAlertButtonView *)&v14 touchesBegan:v6 withEvent:v7];
  if (sub_100A33B24(v6))
  {
    v8 = [v6 anyObject];
    [v8 locationInView:self];
    double v10 = v9;
    double v12 = v11;

    v13 = -[CarAlertButtonView hitTest:withEvent:](self, "hitTest:withEvent:", v7, v10, v12);
    [(CarAlertButtonView *)self _setHighlightsForHitView:v13];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarAlertButtonView;
  [(CarAlertButtonView *)&v14 touchesMoved:v6 withEvent:v7];
  if (sub_100A33B24(v6))
  {
    v8 = [v6 anyObject];
    [v8 locationInView:self];
    double v10 = v9;
    double v12 = v11;

    v13 = -[CarAlertButtonView hitTest:withEvent:](self, "hitTest:withEvent:", v7, v10, v12);
    [(CarAlertButtonView *)self _setHighlightsForHitView:v13];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CarAlertButtonView;
  id v6 = a3;
  [(CarAlertButtonView *)&v7 touchesCancelled:v6 withEvent:a4];
  LODWORD(a4) = sub_100A33B24(v6);

  if (a4) {
    -[CarAlertButtonView setHighlighted:](self, "setHighlighted:", 0, v7.receiver, v7.super_class);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CarAlertButtonView;
  id v6 = a3;
  [(CarAlertButtonView *)&v7 touchesEnded:v6 withEvent:a4];
  LODWORD(a4) = sub_100A33B24(v6);

  if (a4) {
    -[CarAlertButtonView setHighlighted:](self, "setHighlighted:", 0, v7.receiver, v7.super_class);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end