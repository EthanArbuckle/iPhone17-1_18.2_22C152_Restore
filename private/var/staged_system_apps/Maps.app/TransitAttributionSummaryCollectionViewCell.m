@interface TransitAttributionSummaryCollectionViewCell
- (TransitAttributionSummaryCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_moreString;
- (id)attributionSummary;
- (void)setAttribution:(id)a3;
- (void)setAttributionSummary:(id)a3;
- (void)tintColorDidChange;
@end

@implementation TransitAttributionSummaryCollectionViewCell

- (TransitAttributionSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)TransitAttributionSummaryCollectionViewCell;
  v3 = -[TransitAttributionSummaryCollectionViewCell initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TransitAttributionSummaryCollectionViewCell *)v3 setAccessibilityIdentifier:@"TransitAttributionSummaryCollectionViewCell"];
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    attributionLabel = v4->_attributionLabel;
    v4->_attributionLabel = v5;

    [(UILabel *)v4->_attributionLabel setNumberOfLines:0];
    [(UILabel *)v4->_attributionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_attributionLabel setAccessibilityIdentifier:@"AttributionLabel"];
    v7 = [(TransitAttributionSummaryCollectionViewCell *)v4 contentView];
    [v7 addSubview:v4->_attributionLabel];

    +[DynamicTypeWizard autorefreshLabel:v4->_attributionLabel withFontProvider:&stru_1013213C0];
    v24 = [(UILabel *)v4->_attributionLabel leadingAnchor];
    v25 = [(TransitAttributionSummaryCollectionViewCell *)v4 contentView];
    v23 = [v25 leadingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v27[0] = v22;
    v20 = [(UILabel *)v4->_attributionLabel trailingAnchor];
    v21 = [(TransitAttributionSummaryCollectionViewCell *)v4 contentView];
    v19 = [v21 trailingAnchor];
    v18 = [v20 constraintEqualToAnchor:v19];
    v27[1] = v18;
    v8 = [(UILabel *)v4->_attributionLabel topAnchor];
    v9 = [(TransitAttributionSummaryCollectionViewCell *)v4 contentView];
    v10 = [v9 topAnchor];
    v11 = [v8 constraintEqualToSystemSpacingBelowAnchor:v10 multiplier:1.0];
    v27[2] = v11;
    v12 = [(TransitAttributionSummaryCollectionViewCell *)v4 contentView];
    v13 = [v12 bottomAnchor];
    v14 = [(UILabel *)v4->_attributionLabel bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:27.0];
    v27[3] = v15;
    v16 = +[NSArray arrayWithObjects:v27 count:4];
    +[NSLayoutConstraint activateConstraints:v16];
  }
  return v4;
}

- (void)setAttribution:(id)a3
{
  id v8 = [a3 _providerNames];
  v4 = [v8 _mapkit_componentsJoinedInCommaDelimitedList];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"TransitAttribution_LineCard_Format" value:@"localized string not found" table:0];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);

  [(TransitAttributionSummaryCollectionViewCell *)self setAttributionSummary:v7];
}

- (void)setAttributionSummary:(id)a3
{
  id v4 = a3;
  id v23 = [(TransitAttributionSummaryCollectionViewCell *)self _moreString];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Attribution_And_More_format" value:@"localized string not found" table:0];

  id v7 = objc_alloc((Class)NSMutableAttributedString);
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4, v23);
  id v9 = [v7 initWithString:v8];

  v10 = [v9 string];
  id v11 = [v10 rangeOfString:v4];
  uint64_t v13 = v12;

  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL && v13 != 0)
  {
    v15 = [(TransitAttributionSummaryCollectionViewCell *)self mk_theme];
    v16 = [v15 lightTextColor];
    [v9 addAttribute:NSForegroundColorAttributeName value:v16 range:v11, v13];
  }
  v17 = [v9 string];
  id v18 = [v17 rangeOfString:v23 options:4];
  uint64_t v20 = v19;

  if (v18 != (id)0x7FFFFFFFFFFFFFFFLL && v20 != 0)
  {
    v22 = [(TransitAttributionSummaryCollectionViewCell *)self tintColor];
    [v9 addAttribute:NSForegroundColorAttributeName value:v22 range:v18, v20];
  }
  [(UILabel *)self->_attributionLabel setAttributedText:v9];
}

- (id)attributionSummary
{
  v2 = [(UILabel *)self->_attributionLabel attributedText];
  v3 = [v2 string];

  return v3;
}

- (id)_moreString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"More_ellipsis" value:@"localized string not found" table:0];

  return v3;
}

- (void)tintColorDidChange
{
  v13.receiver = self;
  v13.super_class = (Class)TransitAttributionSummaryCollectionViewCell;
  [(TransitAttributionSummaryCollectionViewCell *)&v13 tintColorDidChange];
  id v3 = objc_alloc((Class)NSMutableAttributedString);
  id v4 = [(UILabel *)self->_attributionLabel attributedText];
  id v5 = [v3 initWithAttributedString:v4];

  v6 = [v5 string];
  id v7 = [(TransitAttributionSummaryCollectionViewCell *)self _moreString];
  id v8 = [v6 rangeOfString:v7];
  uint64_t v10 = v9;

  [v5 removeAttribute:NSForegroundColorAttributeName range:v8 v10];
  id v11 = [(TransitAttributionSummaryCollectionViewCell *)self mk_theme];
  uint64_t v12 = [v11 tintColor];
  [v5 addAttribute:NSForegroundColorAttributeName value:v12 range:v8, v10];

  [(UILabel *)self->_attributionLabel setAttributedText:v5];
}

- (void).cxx_destruct
{
}

@end