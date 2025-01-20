@interface MacRapImageSingleLineCell
+ (NSString)reuseIdentifier;
- (MacRapImageSingleLineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImage)image;
- (UILabel)textLabel;
- (void)_contentSizeChanged;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateConstraints;
- (void)_updateFonts;
- (void)setImage:(id)a3;
@end

@implementation MacRapImageSingleLineCell

- (MacRapImageSingleLineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MacRapImageSingleLineCell;
  v4 = [(MacRapImageSingleLineCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(MacRapImageSingleLineCell *)v4 setAccessibilityIdentifier:v6];

    v7 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    textLabel = v4->_textLabel;
    v4->_textLabel = v7;

    [(MacRapImageSingleLineCell *)v4 _setupSubviews];
    [(MacRapImageSingleLineCell *)v4 _setupConstraints];
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v4 selector:"_contentSizeChanged" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (void)_setupSubviews
{
  [(UILabel *)self->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_textLabel setNumberOfLines:0];
  [(UILabel *)self->_textLabel setAccessibilityIdentifier:@"TextLabel"];
  v3 = [(MacRapImageSingleLineCell *)self contentView];
  [v3 addSubview:self->_textLabel];

  [(MacRapImageSingleLineCell *)self _updateFonts];
  v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v4;

  [(UIImageView *)self->_imageView setAccessibilityIdentifier:@"ImageView"];
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = +[UIColor systemBlueColor];
  [(UIImageView *)self->_imageView setTintColor:v6];

  id v7 = [(MacRapImageSingleLineCell *)self contentView];
  [v7 addSubview:self->_imageView];
}

- (void)_setupConstraints
{
  v3 = [(MacRapImageSingleLineCell *)self contentView];
  v4 = [(UILabel *)self->_textLabel firstBaselineAnchor];
  v5 = [v3 topAnchor];
  v6 = [(UILabel *)self->_textLabel font];
  [v6 _scaledValueForValue:23.0];
  [v4 constraintEqualToAnchor:v5];
  id v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v7;

  v9 = [(UILabel *)self->_textLabel lastBaselineAnchor];
  v10 = [v3 bottomAnchor];
  objc_super v11 = [(UILabel *)self->_textLabel font];
  [v11 _scaledValueForValue:-12.0];
  [v9 constraintEqualToAnchor:v10];
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v12;

  v33 = [(UILabel *)self->_textLabel leadingAnchor];
  v32 = [(UIImageView *)self->_imageView trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:15.0];
  v34[0] = v31;
  v30 = [(UILabel *)self->_textLabel trailingAnchor];
  v29 = [v3 trailingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:-30.0];
  v14 = self->_topToFirstBaselineConstraint;
  v34[1] = v28;
  v34[2] = v14;
  v34[3] = self->_lastBaselineToBottomConstraint;
  v26 = [(UIImageView *)self->_imageView leadingAnchor];
  v27 = v3;
  v25 = [v3 leadingAnchor];
  v15 = [v26 constraintEqualToAnchor:v25 constant:30.0];
  v34[4] = v15;
  v16 = [(UIImageView *)self->_imageView centerYAnchor];
  v17 = [v3 centerYAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v34[5] = v18;
  v19 = [(UIImageView *)self->_imageView widthAnchor];
  v20 = [v19 constraintEqualToConstant:20.0];
  v34[6] = v20;
  v21 = [(UIImageView *)self->_imageView heightAnchor];
  v22 = [(UIImageView *)self->_imageView widthAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v34[7] = v23;
  v24 = +[NSArray arrayWithObjects:v34 count:8];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (void)_contentSizeChanged
{
  [(MacRapImageSingleLineCell *)self _updateFonts];

  [(MacRapImageSingleLineCell *)self _updateConstraints];
}

- (void)_updateFonts
{
  id v3 = +[RAPFontManager regularTitleFont];
  [(UILabel *)self->_textLabel setFont:v3];
}

- (void)_updateConstraints
{
  id v3 = [(UILabel *)self->_textLabel font];
  [v3 _scaledValueForValue:23.0];
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  id v4 = [(UILabel *)self->_textLabel font];
  [v4 _scaledValueForValue:-12.0];
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"MacRapImageSingleLineCell";
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  [(UIImageView *)self->_imageView setImage:v5];
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);

  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
}

@end