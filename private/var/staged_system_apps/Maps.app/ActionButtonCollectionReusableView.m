@interface ActionButtonCollectionReusableView
+ (double)estimatedHeight;
+ (id)reuseIdentifier;
- (ActionButtonCollectionReusableView)initWithFrame:(CGRect)a3;
- (MKVibrantView)vibrantView;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)leadingVibrantViewContraint;
- (NSLayoutConstraint)trailingVibrantViewContraint;
- (UIButton)button;
- (double)leadingPadding;
- (double)trailingPadding;
- (id)completion;
- (id)highlightedBackgroundColor;
- (id)regularBackgroundColor;
- (void)didEndTouch:(id)a3;
- (void)didTouchDown:(id)a3;
- (void)didTouchUp:(id)a3;
- (void)prepareForReuse;
- (void)setButton:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setLeadingPadding:(double)a3;
- (void)setLeadingVibrantViewContraint:(id)a3;
- (void)setTitle:(id)a3 completion:(id)a4;
- (void)setTrailingPadding:(double)a3;
- (void)setTrailingVibrantViewContraint:(id)a3;
- (void)setVibrantView:(id)a3;
- (void)setupSubviews;
- (void)updateFontsAndSizes;
@end

@implementation ActionButtonCollectionReusableView

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (double)estimatedHeight
{
  return 52.0;
}

- (ActionButtonCollectionReusableView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ActionButtonCollectionReusableView;
  v3 = -[ActionButtonCollectionReusableView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(ActionButtonCollectionReusableView *)v3 setBackgroundColor:v4];

    [(ActionButtonCollectionReusableView *)v3 setupSubviews];
    [(ActionButtonCollectionReusableView *)v3 updateFontsAndSizes];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v3;
}

- (void)setupSubviews
{
  v3 = [objc_alloc((Class)MKVibrantView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  vibrantView = self->_vibrantView;
  self->_vibrantView = v3;

  [(MKVibrantView *)self->_vibrantView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKVibrantView *)self->_vibrantView _setContinuousCornerRadius:8.0];
  v5 = [(ActionButtonCollectionReusableView *)self regularBackgroundColor];
  v6 = [(MKVibrantView *)self->_vibrantView contentView];
  [v6 setBackgroundColor:v5];

  [(ActionButtonCollectionReusableView *)self addSubview:self->_vibrantView];
  [(ActionButtonCollectionReusableView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:"didTouchUp:"];
  objc_super v7 = +[UIButton buttonWithType:0];
  button = self->_button;
  self->_button = v7;

  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = self->_button;
  v10 = +[MKInfoCardThemeManager currentTheme];
  v11 = [v10 tintColor];
  [(UIButton *)v9 setTitleColor:v11 forState:0];

  v12 = self->_button;
  v13 = +[MKInfoCardThemeManager currentTheme];
  v14 = [v13 tintColor];
  [(UIButton *)v12 setTitleColor:v14 forState:1];

  [(UIButton *)self->_button addTarget:self action:"didTouchUp:" forControlEvents:64];
  [(UIButton *)self->_button addTarget:self action:"didTouchDown:" forControlEvents:1];
  [(UIButton *)self->_button addTarget:self action:"didEndTouch:" forControlEvents:448];
  [(ActionButtonCollectionReusableView *)self addSubview:self->_button];
  v15 = [(ActionButtonCollectionReusableView *)self heightAnchor];
  v16 = [v15 constraintEqualToConstant:0.0];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v16;

  v18 = [(MKVibrantView *)self->_vibrantView leadingAnchor];
  v19 = [(ActionButtonCollectionReusableView *)self leadingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  leadingVibrantViewContraint = self->_leadingVibrantViewContraint;
  self->_leadingVibrantViewContraint = v20;

  v22 = [(MKVibrantView *)self->_vibrantView trailingAnchor];
  v23 = [(ActionButtonCollectionReusableView *)self trailingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  trailingVibrantViewContraint = self->_trailingVibrantViewContraint;
  self->_trailingVibrantViewContraint = v24;

  v26 = self->_trailingVibrantViewContraint;
  v47[0] = self->_leadingVibrantViewContraint;
  v47[1] = v26;
  v46 = [(MKVibrantView *)self->_vibrantView topAnchor];
  v45 = [(ActionButtonCollectionReusableView *)self topAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v47[2] = v44;
  v43 = [(MKVibrantView *)self->_vibrantView bottomAnchor];
  v42 = [(ActionButtonCollectionReusableView *)self bottomAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v47[3] = v41;
  v40 = [(UIButton *)self->_button leadingAnchor];
  v39 = [(MKVibrantView *)self->_vibrantView leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:4.0];
  v47[4] = v38;
  v27 = [(UIButton *)self->_button trailingAnchor];
  v28 = [(MKVibrantView *)self->_vibrantView trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 constant:-4.0];
  v47[5] = v29;
  v30 = [(UIButton *)self->_button topAnchor];
  v31 = [(MKVibrantView *)self->_vibrantView topAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v47[6] = v32;
  v33 = [(UIButton *)self->_button bottomAnchor];
  v34 = [(MKVibrantView *)self->_vibrantView bottomAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  v36 = self->_heightConstraint;
  v47[7] = v35;
  v47[8] = v36;
  v37 = +[NSArray arrayWithObjects:v47 count:9];
  +[NSLayoutConstraint activateConstraints:v37];
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)ActionButtonCollectionReusableView;
  [(ActionButtonCollectionReusableView *)&v7 prepareForReuse];
  v3 = [(ActionButtonCollectionReusableView *)self regularBackgroundColor];
  v4 = [(ActionButtonCollectionReusableView *)self vibrantView];
  v5 = [v4 contentView];
  [v5 setBackgroundColor:v3];

  v6 = [(ActionButtonCollectionReusableView *)self button];
  [v6 setTitle:0 forState:0];

  [(ActionButtonCollectionReusableView *)self setCompletion:0];
}

- (void)updateFontsAndSizes
{
  v3 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline addingSymbolicTraits:2];
  v4 = [(UIButton *)self->_button titleLabel];
  [v4 setFont:v3];

  id v8 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline addingSymbolicTraits:0];
  [(id)objc_opt_class() estimatedHeight];
  [v8 _mapkit_scaledValueForValue:];
  double v6 = v5;
  objc_super v7 = [(ActionButtonCollectionReusableView *)self heightConstraint];
  [v7 setConstant:v6];
}

- (id)regularBackgroundColor
{
  v2 = +[MKInfoCardThemeManager currentTheme];
  v3 = [v2 buttonNormalColor];

  return v3;
}

- (id)highlightedBackgroundColor
{
  v2 = +[MKInfoCardThemeManager currentTheme];
  v3 = [v2 buttonHighlightedColor];

  return v3;
}

- (void)didTouchUp:(id)a3
{
  v4 = [(ActionButtonCollectionReusableView *)self completion];

  if (v4)
  {
    double v5 = [(ActionButtonCollectionReusableView *)self completion];
    v5[2]();
  }
}

- (void)didTouchDown:(id)a3
{
  id v6 = [(ActionButtonCollectionReusableView *)self highlightedBackgroundColor];
  v4 = [(ActionButtonCollectionReusableView *)self vibrantView];
  double v5 = [v4 contentView];
  [v5 setBackgroundColor:v6];
}

- (void)didEndTouch:(id)a3
{
  id v6 = [(ActionButtonCollectionReusableView *)self regularBackgroundColor];
  v4 = [(ActionButtonCollectionReusableView *)self vibrantView];
  double v5 = [v4 contentView];
  [v5 setBackgroundColor:v6];
}

- (void)setTitle:(id)a3 completion:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  objc_super v7 = [(ActionButtonCollectionReusableView *)self button];
  [v7 setTitle:v6 forState:0];

  [(ActionButtonCollectionReusableView *)self setCompletion:v8];
}

- (void)setLeadingPadding:(double)a3
{
  self->_leadingPadding = a3;
  id v4 = [(ActionButtonCollectionReusableView *)self leadingVibrantViewContraint];
  [v4 setConstant:a3];
}

- (void)setTrailingPadding:(double)a3
{
  self->_trailingPadding = a3;
  double v3 = -a3;
  id v4 = [(ActionButtonCollectionReusableView *)self trailingVibrantViewContraint];
  [v4 setConstant:v3];
}

- (double)leadingPadding
{
  return self->_leadingPadding;
}

- (double)trailingPadding
{
  return self->_trailingPadding;
}

- (MKVibrantView)vibrantView
{
  return self->_vibrantView;
}

- (void)setVibrantView:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingVibrantViewContraint
{
  return self->_leadingVibrantViewContraint;
}

- (void)setLeadingVibrantViewContraint:(id)a3
{
}

- (NSLayoutConstraint)trailingVibrantViewContraint
{
  return self->_trailingVibrantViewContraint;
}

- (void)setTrailingVibrantViewContraint:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_trailingVibrantViewContraint, 0);
  objc_storeStrong((id *)&self->_leadingVibrantViewContraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_vibrantView, 0);
}

@end