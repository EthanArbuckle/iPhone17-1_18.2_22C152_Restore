@interface ICSETableViewHeaderView
- (BOOL)isAccessibilityElement;
- (ICSETableViewHeaderView)initWithReuseIdentifier:(id)a3;
- (NSArray)defaultConstraints;
- (NSArray)largerTextSizeConstraints;
- (NSString)countLabelText;
- (NSString)typeLabelText;
- (UILabel)countLabel;
- (UILabel)typeLabel;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)prepareForReuse;
- (void)setCountLabel:(id)a3;
- (void)setCountLabelText:(id)a3;
- (void)setDefaultConstraints:(id)a3;
- (void)setLargerTextSizeConstraints:(id)a3;
- (void)setTypeLabel:(id)a3;
- (void)setTypeLabelText:(id)a3;
- (void)setupUI;
- (void)updateConstraints;
@end

@implementation ICSETableViewHeaderView

- (ICSETableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICSETableViewHeaderView;
  v3 = [(ICSETableViewHeaderView *)&v6 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3) {
    [(ICSETableViewHeaderView *)v3 setupUI];
  }
  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)ICSETableViewHeaderView;
  [(ICSETableViewHeaderView *)&v5 prepareForReuse];
  v3 = [(ICSETableViewHeaderView *)self typeLabel];
  [v3 setText:&stru_1000F2510];

  v4 = [(ICSETableViewHeaderView *)self countLabel];
  [v4 setText:&stru_1000F2510];
}

- (void)setTypeLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSETableViewHeaderView *)self typeLabel];
  [v5 setText:v4];
}

- (void)setCountLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSETableViewHeaderView *)self countLabel];
  [v5 setText:v4];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ICSETableViewHeaderView *)self typeLabel];
  v3 = [v2 text];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(ICSETableViewHeaderView *)self countLabel];
  v3 = [v2 text];

  return v3;
}

- (void)setupUI
{
  uint64_t v3 = [(ICSETableViewHeaderView *)self typeLabel];
  if (!v3
    || (id v4 = (void *)v3,
        [(ICSETableViewHeaderView *)self countLabel],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    id v6 = objc_alloc_init((Class)UILabel);
    [(ICSETableViewHeaderView *)self setTypeLabel:v6];

    v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    v8 = [v7 ic_fontWithSingleLineA];
    v9 = [(ICSETableViewHeaderView *)self typeLabel];
    [v9 setFont:v8];

    v10 = +[UIColor labelColor];
    v11 = [(ICSETableViewHeaderView *)self countLabel];
    [v11 setTextColor:v10];

    v12 = [(ICSETableViewHeaderView *)self typeLabel];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v13 = [(ICSETableViewHeaderView *)self typeLabel];
    [(ICSETableViewHeaderView *)self addSubview:v13];

    id v14 = objc_alloc_init((Class)UILabel);
    [(ICSETableViewHeaderView *)self setCountLabel:v14];

    v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v16 = [v15 ic_fontWithSingleLineA];
    v17 = [(ICSETableViewHeaderView *)self countLabel];
    [v17 setFont:v16];

    v18 = +[UIColor secondaryLabelColor];
    v19 = [(ICSETableViewHeaderView *)self countLabel];
    [v19 setTextColor:v18];

    v20 = [(ICSETableViewHeaderView *)self countLabel];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    v21 = [(ICSETableViewHeaderView *)self countLabel];
    [(ICSETableViewHeaderView *)self addSubview:v21];

    unint64_t v22 = (unint64_t)[(ICSETableViewHeaderView *)self accessibilityTraits];
    [(ICSETableViewHeaderView *)self setAccessibilityTraits:UIAccessibilityTraitHeader | v22];
    id v23 = [(ICSETableViewHeaderView *)self defaultConstraints];
    +[NSLayoutConstraint activateConstraints:v23];
  }
}

- (void)updateConstraints
{
  if (ICAccessibilityAccessibilityLargerTextSizesEnabled())
  {
    if (self->_defaultConstraints)
    {
      uint64_t v3 = [(ICSETableViewHeaderView *)self defaultConstraints];
      +[NSLayoutConstraint deactivateConstraints:v3];
    }
    uint64_t v4 = [(ICSETableViewHeaderView *)self largerTextSizeConstraints];
  }
  else
  {
    if (self->_largerTextSizeConstraints)
    {
      id v5 = [(ICSETableViewHeaderView *)self largerTextSizeConstraints];
      +[NSLayoutConstraint deactivateConstraints:v5];
    }
    uint64_t v4 = [(ICSETableViewHeaderView *)self defaultConstraints];
  }
  id v6 = (void *)v4;
  +[NSLayoutConstraint activateConstraints:v4];

  v7.receiver = self;
  v7.super_class = (Class)ICSETableViewHeaderView;
  [(ICSETableViewHeaderView *)&v7 updateConstraints];
}

- (NSArray)defaultConstraints
{
  defaultConstraints = self->_defaultConstraints;
  if (!defaultConstraints)
  {
    uint64_t v4 = [(ICSETableViewHeaderView *)self countLabel];
    id v5 = [v4 trailingAnchor];
    id v6 = [(ICSETableViewHeaderView *)self layoutMarginsGuide];
    objc_super v7 = [v6 trailingAnchor];
    v8 = [v5 constraintEqualToAnchor:v7];

    v9 = [(ICSETableViewHeaderView *)self typeLabel];
    v10 = [v9 leadingAnchor];
    v11 = [(ICSETableViewHeaderView *)self layoutMarginsGuide];
    v12 = [v11 leadingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];

    id v14 = [(ICSETableViewHeaderView *)self countLabel];
    v15 = [v14 leadingAnchor];
    v16 = [(ICSETableViewHeaderView *)self typeLabel];
    v17 = [v16 trailingAnchor];
    v18 = [v15 constraintGreaterThanOrEqualToAnchor:v17 constant:8.0];

    v19 = [(ICSETableViewHeaderView *)self typeLabel];
    v20 = [v19 centerYAnchor];
    v21 = [(ICSETableViewHeaderView *)self centerYAnchor];
    unint64_t v22 = [v20 constraintEqualToAnchor:v21];

    id v23 = [(ICSETableViewHeaderView *)self countLabel];
    v24 = [v23 centerYAnchor];
    v25 = [(ICSETableViewHeaderView *)self centerYAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];

    v30[0] = v8;
    v30[1] = v13;
    v30[2] = v18;
    v30[3] = v22;
    v30[4] = v26;
    v27 = +[NSArray arrayWithObjects:v30 count:5];
    v28 = self->_defaultConstraints;
    self->_defaultConstraints = v27;

    defaultConstraints = self->_defaultConstraints;
  }

  return defaultConstraints;
}

- (NSArray)largerTextSizeConstraints
{
  largerTextSizeConstraints = self->_largerTextSizeConstraints;
  if (!largerTextSizeConstraints)
  {
    uint64_t v4 = [(ICSETableViewHeaderView *)self typeLabel];
    id v5 = [v4 leadingAnchor];
    id v6 = [(ICSETableViewHeaderView *)self layoutMarginsGuide];
    objc_super v7 = [v6 leadingAnchor];
    v39 = [v5 constraintEqualToAnchor:v7];

    v8 = [(ICSETableViewHeaderView *)self typeLabel];
    v9 = [v8 topAnchor];
    v10 = [(ICSETableViewHeaderView *)self topAnchor];
    v38 = [v9 constraintEqualToAnchor:v10];

    v11 = [(ICSETableViewHeaderView *)self typeLabel];
    v12 = [v11 trailingAnchor];
    v13 = [(ICSETableViewHeaderView *)self layoutMarginsGuide];
    id v14 = [v13 trailingAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];

    v16 = [(ICSETableViewHeaderView *)self countLabel];
    v17 = [v16 leadingAnchor];
    v18 = [(ICSETableViewHeaderView *)self layoutMarginsGuide];
    v19 = [v18 leadingAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];

    v21 = [(ICSETableViewHeaderView *)self countLabel];
    unint64_t v22 = [v21 bottomAnchor];
    id v23 = [(ICSETableViewHeaderView *)self bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];

    v25 = [(ICSETableViewHeaderView *)self countLabel];
    v26 = [v25 trailingAnchor];
    v27 = [(ICSETableViewHeaderView *)self layoutMarginsGuide];
    v28 = [v27 trailingAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];

    v30 = [(ICSETableViewHeaderView *)self countLabel];
    v31 = [v30 topAnchor];
    v32 = [(ICSETableViewHeaderView *)self typeLabel];
    v33 = [v32 bottomAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];

    v40[0] = v39;
    v40[1] = v38;
    v40[2] = v15;
    v40[3] = v20;
    v40[4] = v24;
    v40[5] = v29;
    v40[6] = v34;
    v35 = +[NSArray arrayWithObjects:v40 count:7];
    v36 = self->_largerTextSizeConstraints;
    self->_largerTextSizeConstraints = v35;

    largerTextSizeConstraints = self->_largerTextSizeConstraints;
  }

  return largerTextSizeConstraints;
}

- (NSString)typeLabelText
{
  return self->_typeLabelText;
}

- (NSString)countLabelText
{
  return self->_countLabelText;
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
}

- (void)setDefaultConstraints:(id)a3
{
}

- (void)setLargerTextSizeConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largerTextSizeConstraints, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_countLabelText, 0);

  objc_storeStrong((id *)&self->_typeLabelText, 0);
}

@end