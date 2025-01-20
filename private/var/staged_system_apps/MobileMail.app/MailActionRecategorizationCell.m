@interface MailActionRecategorizationCell
+ (id)reusableIdentifier;
- (BOOL)_disableRasterizeInAnimations;
- (MailActionRecategorizationCell)initWithFrame:(CGRect)a3;
- (UIImageView)categoryImageView;
- (UIImageView)selectionImage;
- (UILabel)categoryLabel;
- (UIStackView)stackView;
- (UIView)categoryIconView;
- (void)_setupViews;
- (void)setCardAction:(id)a3;
- (void)setCategoryIconView:(id)a3;
- (void)setCategoryImageView:(id)a3;
- (void)setCategoryLabel:(id)a3;
- (void)setSelectionImage:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation MailActionRecategorizationCell

+ (id)reusableIdentifier
{
  return @"MailActionRecategorizationCell";
}

- (MailActionRecategorizationCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MailActionRecategorizationCell;
  v3 = -[MailActionVerticalGroupedCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MailActionRecategorizationCell *)v3 _setupViews];
  }
  return v4;
}

- (void)setCardAction:(id)a3
{
  v56.receiver = self;
  v56.super_class = (Class)MailActionRecategorizationCell;
  id v55 = a3;
  -[MailActionCell setCardAction:](&v56, "setCardAction:");
  v4 = [(MailActionCell *)self titleLabel];
  [v4 setText:0];

  v5 = [(MailActionCell *)self imageView];
  [v5 setImage:0];

  objc_super v6 = [v55 imageName];
  LODWORD(v5) = v6 == 0;

  if (v5)
  {
    v35 = [(MailActionRecategorizationCell *)self categoryIconView];
    [v35 removeFromSuperview];
  }
  else
  {
    v7 = [v55 imageName];
    uint64_t v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    v9 = +[UIImageSymbolConfiguration configurationWithFont:v8];
    v54 = +[UIImage systemImageNamed:v7 withConfiguration:v9];

    v10 = [(MailActionRecategorizationCell *)self categoryImageView];
    [v10 setImage:v54];

    v11 = [(MailActionRecategorizationCell *)self categoryIconView];
    LOBYTE(v8) = [v11 isDescendantOfView:self];

    if ((v8 & 1) == 0)
    {
      v12 = [(MailActionRecategorizationCell *)self stackView];
      v13 = [(MailActionRecategorizationCell *)self categoryIconView];
      [v12 insertArrangedSubview:v13 atIndex:0];
    }
    v14 = +[UIColor systemWhiteColor];
    v15 = [(MailActionRecategorizationCell *)self categoryImageView];
    [v15 setTintColor:v14];

    v16 = [v55 tintColor];
    v17 = [(MailActionRecategorizationCell *)self categoryIconView];
    [v17 setBackgroundColor:v16];

    [v54 size];
    double v19 = v18;
    [v54 size];
    double v21 = v20;
    v22 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v22 capHeight];
    double v24 = v23;

    v50 = [(MailActionRecategorizationCell *)self categoryImageView];
    v53 = [v50 topAnchor];
    v49 = [(MailActionRecategorizationCell *)self categoryIconView];
    [v49 topAnchor];
    v48 = double v25 = (v24 - v21) * 0.5 + 8.0;
    v47 = [v53 constraintEqualToAnchor:v25];
    v57[0] = v47;
    v46 = [(MailActionRecategorizationCell *)self categoryImageView];
    v52 = [v46 bottomAnchor];
    v45 = [(MailActionRecategorizationCell *)self categoryIconView];
    v44 = [v45 bottomAnchor];
    v43 = [v52 constraintEqualToAnchor:-v25];
    v57[1] = v43;
    v42 = [(MailActionRecategorizationCell *)self categoryImageView];
    v51 = [v42 leadingAnchor];
    v41 = [(MailActionRecategorizationCell *)self categoryIconView];
    v26 = [v41 leadingAnchor];
    double v27 = (v24 - v19) * 0.5 + 8.0;
    v28 = [v51 constraintEqualToAnchor:v26 constant:v27];
    v57[2] = v28;
    v29 = [(MailActionRecategorizationCell *)self categoryImageView];
    v30 = [v29 trailingAnchor];
    v31 = [(MailActionRecategorizationCell *)self categoryIconView];
    v32 = [v31 trailingAnchor];
    v33 = [v30 constraintEqualToAnchor:v32 constant:-v27];
    v57[3] = v33;
    v34 = +[NSArray arrayWithObjects:v57 count:4];
    +[NSLayoutConstraint activateConstraints:v34];

    v35 = v54;
  }

  v36 = [v55 title];
  v37 = [(MailActionRecategorizationCell *)self categoryLabel];
  [v37 setText:v36];

  v38 = +[UIColor labelColor];
  v39 = [(MailActionRecategorizationCell *)self categoryLabel];
  [v39 setTextColor:v38];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v55 isSelected])
    {
      v40 = [(MailActionRecategorizationCell *)self selectionImage];
      [v40 setHidden:0];
    }
    else
    {
      v40 = [(MailActionRecategorizationCell *)self selectionImage];
      [v40 setHidden:1];
    }
  }
}

- (void)_setupViews
{
  id v3 = objc_alloc_init((Class)UILabel);
  v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v3 setFont:v4];

  v5 = +[UIColor systemBlueColor];
  [v3 setTextColor:v5];

  id v6 = objc_alloc_init((Class)UIImageView);
  [v6 setContentMode:1];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1144750080;
  [v6 setContentHuggingPriority:0 forAxis:v7];
  id v8 = objc_alloc_init((Class)UIView);
  [v8 addSubview:v6];
  [v8 setContentMode:1];
  v9 = [v8 layer];
  [v9 setCornerRadius:6.0];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v10) = 1132068864;
  [v8 setContentHuggingPriority:0 forAxis:v10];
  id v11 = objc_alloc((Class)UIImageView);
  v12 = +[UIImage systemImageNamed:MFImageGlyphCheckmark];
  id v13 = [v11 initWithImage:v12];

  v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  v15 = +[UIImageSymbolConfiguration configurationWithFont:v14];
  [v13 setPreferredSymbolConfiguration:v15];

  [v13 setContentMode:1];
  [v13 setHidden:1];
  id v16 = objc_alloc((Class)UIStackView);
  v22[0] = v8;
  v22[1] = v3;
  v22[2] = v13;
  v17 = +[NSArray arrayWithObjects:v22 count:3];
  id v18 = [v16 initWithArrangedSubviews:v17];

  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 setSpacing:12.0];
  [(MailActionRecategorizationCell *)self setStackView:v18];
  double v19 = [(MailActionRecategorizationCell *)self contentView];
  [v19 addSubview:v18];

  double v20 = [(MailActionRecategorizationCell *)self contentView];
  [v20 setLayoutMargins:10.0, 20.0, 10.0, 20.0];

  double v21 = [(MailActionRecategorizationCell *)self contentView];
  [v18 mf_pinToView:v21 usingLayoutMargins:1];

  [(MailActionRecategorizationCell *)self setCategoryImageView:v6];
  [(MailActionRecategorizationCell *)self setCategoryIconView:v8];
  [(MailActionRecategorizationCell *)self setCategoryLabel:v3];
  [(MailActionRecategorizationCell *)self setSelectionImage:v13];
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (UIView)categoryIconView
{
  return self->_categoryIconView;
}

- (void)setCategoryIconView:(id)a3
{
}

- (UIImageView)categoryImageView
{
  return self->_categoryImageView;
}

- (void)setCategoryImageView:(id)a3
{
}

- (UIImageView)selectionImage
{
  return self->_selectionImage;
}

- (void)setSelectionImage:(id)a3
{
}

- (UILabel)categoryLabel
{
  return self->_categoryLabel;
}

- (void)setCategoryLabel:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_selectionImage, 0);
  objc_storeStrong((id *)&self->_categoryImageView, 0);

  objc_storeStrong((id *)&self->_categoryIconView, 0);
}

@end