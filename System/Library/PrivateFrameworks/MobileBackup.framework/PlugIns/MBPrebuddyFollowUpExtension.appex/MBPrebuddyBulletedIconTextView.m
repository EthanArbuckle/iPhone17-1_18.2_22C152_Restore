@interface MBPrebuddyBulletedIconTextView
- (MBPrebuddyBulletedIconTextView)initWithImage:(id)a3 title:(id)a4 detail:(id)a5 tappableText:(id)a6;
- (MBPrebuddyBulletedIconTextViewDelegate)delegate;
- (NSString)detail;
- (NSString)tappableText;
- (NSString)title;
- (UIImage)image;
- (double)_horizontalMargins;
- (double)_leadingMargins;
- (double)_trailingMargins;
- (void)_setUp;
- (void)didTapText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation MBPrebuddyBulletedIconTextView

- (MBPrebuddyBulletedIconTextView)initWithImage:(id)a3 title:(id)a4 detail:(id)a5 tappableText:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MBPrebuddyBulletedIconTextView;
  v15 = -[MBPrebuddyBulletedIconTextView initWithFrame:](&v18, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_image, a3);
    objc_storeStrong((id *)&v16->_title, a4);
    objc_storeStrong((id *)&v16->_detail, a5);
    objc_storeStrong((id *)&v16->_tappableText, a6);
    [(MBPrebuddyBulletedIconTextView *)v16 _setUp];
  }

  return v16;
}

- (void)_setUp
{
  v3 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_image];
  imageView = self->_imageView;
  self->_imageView = v3;

  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MBPrebuddyBulletedIconTextView *)self addSubview:self->_imageView];
  id v5 = objc_alloc_init((Class)UILabel);
  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [v5 setFont:v6];

  [v5 setAdjustsFontForContentSizeCategory:1];
  [v5 setNumberOfLines:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v45 = v5;
  [v5 setText:self->_title];
  id v7 = objc_alloc_init((Class)UILabel);
  v8 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleHeadline weight:UIFontWeightRegular];
  [v7 setFont:v8];

  v9 = +[UIColor secondaryLabelColor];
  [v7 setTextColor:v9];

  [v7 setAdjustsFontForContentSizeCategory:1];
  [v7 setNumberOfLines:0];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v44 = v7;
  [v7 setText:self->_detail];
  v10 = (UILabel *)objc_alloc_init((Class)UILabel);
  tappableLabel = self->_tappableLabel;
  self->_tappableLabel = v10;

  [(UILabel *)self->_tappableLabel setUserInteractionEnabled:1];
  id v12 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleHeadline weight:UIFontWeightRegular];
  [(UILabel *)self->_tappableLabel setFont:v12];

  id v13 = [(MBPrebuddyBulletedIconTextView *)self tintColor];
  [(UILabel *)self->_tappableLabel setTextColor:v13];

  [(UILabel *)self->_tappableLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_tappableLabel setNumberOfLines:0];
  [(UILabel *)self->_tappableLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_tappableLabel setText:self->_tappableText];
  id v14 = objc_alloc((Class)UIStackView);
  v47[0] = v5;
  v47[1] = v7;
  v47[2] = self->_tappableLabel;
  v15 = +[NSArray arrayWithObjects:v47 count:3];
  v16 = (UIStackView *)[v14 initWithArrangedSubviews:v15];
  textStack = self->_textStack;
  self->_textStack = v16;

  [(UIStackView *)self->_textStack setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_textStack setAxis:1];
  [(MBPrebuddyBulletedIconTextView *)self addSubview:self->_textStack];
  v43 = [(UIImageView *)self->_imageView leadingAnchor];
  v42 = [(MBPrebuddyBulletedIconTextView *)self leadingAnchor];
  [(MBPrebuddyBulletedIconTextView *)self _leadingMargins];
  v41 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42);
  v46[0] = v41;
  v40 = [(UIImageView *)self->_imageView topAnchor];
  v39 = [(MBPrebuddyBulletedIconTextView *)self topAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:7.0];
  v46[1] = v38;
  v37 = [(UIImageView *)self->_imageView widthAnchor];
  v36 = [v37 constraintEqualToConstant:40.0];
  v46[2] = v36;
  v35 = [(UIImageView *)self->_imageView heightAnchor];
  v34 = [(UIImageView *)self->_imageView widthAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v46[3] = v33;
  v32 = [(UIStackView *)self->_textStack leadingAnchor];
  v31 = [(UIImageView *)self->_imageView trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:14.0];
  v46[4] = v30;
  v29 = [(UIStackView *)self->_textStack topAnchor];
  v28 = [(MBPrebuddyBulletedIconTextView *)self topAnchor];
  objc_super v18 = [v29 constraintEqualToAnchor:v28 constant:2.0];
  v46[5] = v18;
  v19 = [(UIStackView *)self->_textStack trailingAnchor];
  v20 = [(MBPrebuddyBulletedIconTextView *)self trailingAnchor];
  [(MBPrebuddyBulletedIconTextView *)self _trailingMargins];
  v22 = [v19 constraintEqualToAnchor:v20 constant:-v21];
  v46[6] = v22;
  v23 = [(UIStackView *)self->_textStack bottomAnchor];
  v24 = [(MBPrebuddyBulletedIconTextView *)self bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v46[7] = v25;
  v26 = +[NSArray arrayWithObjects:v46 count:8];
  +[NSLayoutConstraint activateConstraints:v26];

  id v27 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"didTapText:"];
  [(UILabel *)self->_tappableLabel addGestureRecognizer:v27];
}

- (void)didTapText:(id)a3
{
  id v4 = [(MBPrebuddyBulletedIconTextView *)self delegate];
  [v4 didTapHighlightedText:self];
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(MBPrebuddyBulletedIconTextView *)self tintColor];

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)MBPrebuddyBulletedIconTextView;
    [(MBPrebuddyBulletedIconTextView *)&v7 setTintColor:v4];
    [(UIImageView *)self->_imageView setTintColor:v4];
    v6 = [(MBPrebuddyBulletedIconTextView *)self tintColor];
    [(UILabel *)self->_tappableLabel setTextColor:v6];
  }
}

- (double)_leadingMargins
{
  [(MBPrebuddyBulletedIconTextView *)self _horizontalMargins];
  return result;
}

- (double)_trailingMargins
{
  [(MBPrebuddyBulletedIconTextView *)self _horizontalMargins];
  return result;
}

- (double)_horizontalMargins
{
  v2 = [(MBPrebuddyBulletedIconTextView *)self traitCollection];
  id v3 = [v2 horizontalSizeClass];

  double result = 54.0;
  if ((unint64_t)v3 < 2) {
    return 10.0;
  }
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detail
{
  return self->_detail;
}

- (NSString)tappableText
{
  return self->_tappableText;
}

- (MBPrebuddyBulletedIconTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MBPrebuddyBulletedIconTextViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tappableText, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_tappableLabel, 0);
  objc_storeStrong((id *)&self->_textStack, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end