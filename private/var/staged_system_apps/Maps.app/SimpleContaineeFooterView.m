@interface SimpleContaineeFooterView
- (NSString)text;
- (SimpleContaineeFooterView)initWithReuseIdentifier:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SimpleContaineeFooterView

- (SimpleContaineeFooterView)initWithReuseIdentifier:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SimpleContaineeFooterView;
  v3 = [(SimpleContaineeFooterView *)&v21 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    label = v3->_label;
    v3->_label = v4;

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_label setNumberOfLines:0];
    v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v3->_label setFont:v6];

    v7 = +[UIColor secondaryLabelColor];
    [(UILabel *)v3->_label setTextColor:v7];

    v8 = +[UIColor clearColor];
    [(UILabel *)v3->_label setBackgroundColor:v8];

    LODWORD(v9) = 1148846080;
    [(UILabel *)v3->_label setContentCompressionResistancePriority:1 forAxis:v9];
    v10 = [(SimpleContaineeFooterView *)v3 contentView];
    [v10 addSubview:v3->_label];

    v11 = +[UIBackgroundConfiguration clearConfiguration];
    [(SimpleContaineeFooterView *)v3 setBackgroundConfiguration:v11];

    uint64_t v12 = sub_1000BBB44(v3);
    if (v12 == 5) {
      double v13 = 4.0;
    }
    else {
      double v13 = 16.0;
    }
    if (v12 == 5) {
      double v14 = 0.0;
    }
    else {
      double v14 = 16.0;
    }
    v15 = v3->_label;
    v16 = [(SimpleContaineeFooterView *)v3 contentView];
    LODWORD(v17) = 1148846080;
    v18 = -[UILabel _maps_constraintsEqualToEdgesOfView:insets:priority:](v15, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v16, v13, v14, 0.0, v14, v17);
    v19 = [v18 allConstraints];
    +[NSLayoutConstraint activateConstraints:v19];
  }
  return v3;
}

- (void)setText:(id)a3
{
  id v4 = [a3 copy];
  [(UILabel *)self->_label setText:v4];
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void).cxx_destruct
{
}

@end