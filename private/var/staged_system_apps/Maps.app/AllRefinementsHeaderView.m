@interface AllRefinementsHeaderView
+ (id)reuseIdentifier;
- (AllRefinementsHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)label;
- (void)addSubviews;
- (void)prepareForReuse;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateFont;
@end

@implementation AllRefinementsHeaderView

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (AllRefinementsHeaderView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AllRefinementsHeaderView;
  v3 = -[AllRefinementsHeaderView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(AllRefinementsHeaderView *)v3 setBackgroundColor:v4];

    [(AllRefinementsHeaderView *)v3 addSubviews];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(AllRefinementsHeaderView *)v3 setAccessibilityIdentifier:@"AllRefinementsHeaderView"];
  }
  return v3;
}

- (void)addSubviews
{
  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = self->_label;
  self->_label = v3;

  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_label setNumberOfLines:1];
  [(UILabel *)self->_label setAccessibilityIdentifier:@"AllRefinementsHeaderLabel"];
  v5 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_label setTextColor:v5];

  [(AllRefinementsHeaderView *)self updateFont];
  [(AllRefinementsHeaderView *)self addSubview:self->_label];
  v18 = [(UILabel *)self->_label leadingAnchor];
  v17 = [(AllRefinementsHeaderView *)self leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  v6 = [(UILabel *)self->_label trailingAnchor];
  objc_super v7 = [(AllRefinementsHeaderView *)self trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v19[1] = v8;
  v9 = [(UILabel *)self->_label topAnchor];
  v10 = [(AllRefinementsHeaderView *)self topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:16.0];
  v19[2] = v11;
  v12 = [(UILabel *)self->_label bottomAnchor];
  v13 = [(AllRefinementsHeaderView *)self bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v19[3] = v14;
  v15 = +[NSArray arrayWithObjects:v19 count:4];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)AllRefinementsHeaderView;
  [(AllRefinementsHeaderView *)&v4 prepareForReuse];
  v3 = [(AllRefinementsHeaderView *)self label];
  [v3 setText:0];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(AllRefinementsHeaderView *)self label];
  [v5 setText:v4];
}

- (void)updateFont
{
  id v5 = [(AllRefinementsHeaderView *)self traitCollection];
  v3 = +[UIFont system15SemiboldCompatibleWithTraitCollection:v5];
  id v4 = [(AllRefinementsHeaderView *)self label];
  [v4 setFont:v3];
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end