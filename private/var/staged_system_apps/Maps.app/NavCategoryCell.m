@interface NavCategoryCell
+ (double)heightForCellWithCategory:(id)a3 width:(double)a4;
- (GEOSearchCategory)category;
- (NavCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_updateContent;
- (void)prepareForReuse;
- (void)setCategory:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation NavCategoryCell

- (NavCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v50.receiver = self;
  v50.super_class = (Class)NavCategoryCell;
  v4 = [(NavCategoryCell *)&v50 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(NavCategoryCell *)v4 setAccessibilityIdentifier:v6];

    v7 = [(NavCategoryCell *)v4 contentView];
    [v7 setAccessibilityIdentifier:@"NavCategoryCellContent"];

    v49 = +[UIBackgroundConfiguration listCellConfiguration];
    [v49 setCornerRadius:10.0];
    [(NavCategoryCell *)v4 setBackgroundConfiguration:v49];
    uint64_t v8 = objc_opt_new();
    leadingImageView = v4->_leadingImageView;
    v4->_leadingImageView = (UIImageView *)v8;

    [(UIImageView *)v4->_leadingImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_leadingImageView setContentMode:1];
    v10 = [(UIImageView *)v4->_leadingImageView layer];
    [v10 setCornerRadius:27.0];

    [(UIImageView *)v4->_leadingImageView setAccessibilityIdentifier:@"LeadingImageView"];
    v11 = [(NavCategoryCell *)v4 contentView];
    [v11 addSubview:v4->_leadingImageView];

    uint64_t v12 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v12;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    [(UILabel *)v4->_titleLabel setFont:v14];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    v15 = [(NavCategoryCell *)v4 contentView];
    [v15 addSubview:v4->_titleLabel];

    v47 = [(UIImageView *)v4->_leadingImageView leadingAnchor];
    v48 = [(NavCategoryCell *)v4 contentView];
    v46 = [v48 leadingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46 constant:12.0];
    v51[0] = v45;
    v44 = [(UIImageView *)v4->_leadingImageView widthAnchor];
    v43 = [v44 constraintEqualToConstant:54.0];
    v51[1] = v43;
    v41 = [(UIImageView *)v4->_leadingImageView centerYAnchor];
    v42 = [(NavCategoryCell *)v4 contentView];
    v40 = [v42 centerYAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v51[2] = v39;
    v38 = [(UIImageView *)v4->_leadingImageView heightAnchor];
    v37 = [v38 constraintEqualToConstant:54.0];
    v51[3] = v37;
    v36 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v35 = [(UIImageView *)v4->_leadingImageView trailingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:10.0];
    v51[4] = v34;
    v32 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v33 = [(NavCategoryCell *)v4 contentView];
    v31 = [v33 trailingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:-16.0];
    v51[5] = v30;
    v28 = [(UILabel *)v4->_titleLabel centerYAnchor];
    v29 = [(NavCategoryCell *)v4 contentView];
    v27 = [v29 centerYAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v51[6] = v26;
    v16 = [(UILabel *)v4->_titleLabel topAnchor];
    v17 = [(NavCategoryCell *)v4 contentView];
    v18 = [v17 topAnchor];
    v19 = [v16 constraintGreaterThanOrEqualToAnchor:v18];
    v51[7] = v19;
    v20 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v21 = [(NavCategoryCell *)v4 contentView];
    v22 = [v21 bottomAnchor];
    v23 = [v20 constraintLessThanOrEqualToAnchor:v22];
    v51[8] = v23;
    v24 = +[NSArray arrayWithObjects:v51 count:9];
    +[NSLayoutConstraint activateConstraints:v24];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NavCategoryCell;
  [(NavCategoryCell *)&v3 prepareForReuse];
  [(NavCategoryCell *)self setCategory:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NavCategoryCell;
  [(NavCategoryCell *)&v12 traitCollectionDidChange:v4];
  v5 = [(NavCategoryCell *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  if (v6 == [v4 userInterfaceStyle])
  {
    v7 = [(NavCategoryCell *)self traitCollection];
    [v7 displayScale];
    double v9 = v8;
    [v4 displayScale];
    double v11 = v10;

    if (v9 == v11) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(NavCategoryCell *)self _updateContent];
  [(NavCategoryCell *)self setNeedsUpdateConfiguration];
LABEL_6:
}

- (void)setCategory:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_category;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_category, a3);
      [(NavCategoryCell *)self _updateContent];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)_updateContent
{
  objc_super v3 = [(NavCategoryCell *)self category];
  id v4 = [v3 shortDisplayString];
  [(UILabel *)self->_titleLabel setText:v4];

  id v5 = [(NavCategoryCell *)self category];

  if (v5)
  {
    id v13 = [(NavCategoryCell *)self category];
    unint64_t v6 = [v13 styleAttributes];
    unint64_t v7 = [(NavCategoryCell *)self traitCollection];
    [v7 displayScale];
    double v9 = v8;
    double v10 = [(NavCategoryCell *)self traitCollection];
    double v11 = +[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:nightMode:", v6, 5, 1, 0, 0, [v10 userInterfaceStyle] == (id)2, v9);
    [(UIImageView *)self->_leadingImageView setImage:v11];
  }
  else
  {
    leadingImageView = self->_leadingImageView;
    [(UIImageView *)leadingImageView setImage:0];
  }
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v10 = a3;
  id v4 = [(NavCategoryCell *)self backgroundConfiguration];
  id v5 = [v4 updatedConfigurationForState:v10];

  unint64_t v6 = [(NavCategoryCell *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (([v10 isHighlighted] & 1) != 0 || objc_msgSend(v10, "isSelected"))
  {
    if (v7 == (id)2) {
      +[UIColor tertiarySystemGroupedBackgroundColor];
    }
    else {
    uint64_t v8 = +[UIColor systemLightMidGrayColor];
    }
  }
  else
  {
    uint64_t v8 = +[UIColor secondarySystemGroupedBackgroundColor];
  }
  double v9 = (void *)v8;
  [v5 setBackgroundColor:v8];

  [(NavCategoryCell *)self setBackgroundConfiguration:v5];
}

+ (double)heightForCellWithCategory:(id)a3 width:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)NSAttributedString);
  id v7 = [v5 shortDisplayString];

  NSAttributedStringKey v17 = NSFontAttributeName;
  uint64_t v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  v18 = v8;
  double v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  id v10 = [v6 initWithString:v7 attributes:v9];

  [v10 boundingRectWithSize:1 options:0 context:a4 + -76.0 + -16.0];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double v15 = 78.0;
  if (ceil(CGRectGetMaxY(v19)) > 78.0)
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double v15 = ceil(CGRectGetMaxY(v20));
  }

  return v15;
}

- (GEOSearchCategory)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_leadingImageView, 0);
}

@end