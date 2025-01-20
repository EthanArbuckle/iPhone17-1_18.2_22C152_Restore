@interface RelatedSectionTableViewCell
+ (double)cellHeight;
+ (id)accessibilityIdentifier;
+ (id)identifier;
- (MKVibrantLabel)sectionNameLabel;
- (NSString)sectionName;
- (RelatedSectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureSection;
- (void)prepareForReuse;
- (void)setSectionName:(id)a3;
- (void)setSectionNameLabel:(id)a3;
@end

@implementation RelatedSectionTableViewCell

- (RelatedSectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RelatedSectionTableViewCell;
  v4 = [(RelatedSectionTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(RelatedSectionTableViewCell *)v4 configureSection];
  }
  return v5;
}

- (void)configureSection
{
  v3 = (MKVibrantLabel *)[objc_alloc((Class)MKVibrantLabel) initWithStyle:1];
  sectionNameLabel = self->_sectionNameLabel;
  self->_sectionNameLabel = v3;

  v5 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline];
  [(MKVibrantLabel *)self->_sectionNameLabel setFont:v5];

  [(MKVibrantLabel *)self->_sectionNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  -[RelatedSectionTableViewCell setSeparatorInset:](self, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  [(RelatedSectionTableViewCell *)self _setShouldHaveFullLengthBottomSeparator:1];
  v6 = [(RelatedSectionTableViewCell *)self contentView];
  [v6 addSubview:self->_sectionNameLabel];

  v22 = [(MKVibrantLabel *)self->_sectionNameLabel leadingAnchor];
  v23 = [(RelatedSectionTableViewCell *)self contentView];
  v21 = [v23 leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21 constant:16.0];
  v24[0] = v20;
  v18 = [(MKVibrantLabel *)self->_sectionNameLabel trailingAnchor];
  v19 = [(RelatedSectionTableViewCell *)self contentView];
  v17 = [v19 trailingAnchor];
  objc_super v7 = [v18 constraintEqualToAnchor:v17];
  v24[1] = v7;
  v8 = [(MKVibrantLabel *)self->_sectionNameLabel topAnchor];
  v9 = [(RelatedSectionTableViewCell *)self contentView];
  v10 = [v9 topAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:16.0];
  v24[2] = v11;
  v12 = [(MKVibrantLabel *)self->_sectionNameLabel bottomAnchor];
  v13 = [(RelatedSectionTableViewCell *)self contentView];
  v14 = [v13 bottomAnchor];
  v15 = [v12 constraintLessThanOrEqualToAnchor:v14];
  v24[3] = v15;
  v16 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v16];
}

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = +[NSString stringWithFormat:@"%@%@", v3, @"Accessibility"];

  return v4;
}

+ (double)cellHeight
{
  return 248.0;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)RelatedSectionTableViewCell;
  [(RelatedSectionTableViewCell *)&v4 prepareForReuse];
  v3 = [(RelatedSectionTableViewCell *)self sectionNameLabel];
  [v3 setText:0];

  [(RelatedSectionTableViewCell *)self setSectionName:0];
}

- (void)setSectionName:(id)a3
{
  objc_storeStrong((id *)&self->_sectionName, a3);
  id v5 = a3;
  [(MKVibrantLabel *)self->_sectionNameLabel setText:v5];
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (MKVibrantLabel)sectionNameLabel
{
  return self->_sectionNameLabel;
}

- (void)setSectionNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionNameLabel, 0);

  objc_storeStrong((id *)&self->_sectionName, 0);
}

@end