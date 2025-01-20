@interface CarCollectionCell
+ (id)reuseIdentifier;
- (CarCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setupWithCollectionHandler:(id)a3;
@end

@implementation CarCollectionCell

- (CarCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)CarCollectionCell;
  v4 = [(CarCollectionCell *)&v17 initWithStyle:3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CarCollectionCell *)v4 setAccessibilityIdentifier:@"CarCollectionCell"];
    v6 = [(CarCollectionCell *)v5 textLabel];
    [v6 setNumberOfLines:2];

    v7 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightMedium];
    v8 = [(CarCollectionCell *)v5 textLabel];
    [v8 setFont:v7];

    v9 = [(CarCollectionCell *)v5 textLabel];
    [v9 setAccessibilityIdentifier:@"TitleLabel"];

    v10 = [(CarCollectionCell *)v5 detailTextLabel];
    [v10 setNumberOfLines:2];

    v11 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:3 grade:UIFontWeightRegular];
    v12 = [(CarCollectionCell *)v5 detailTextLabel];
    [v12 setFont:v11];

    v13 = +[UIColor _carSystemPrimaryColor];
    v14 = [(CarCollectionCell *)v5 detailTextLabel];
    [v14 setTextColor:v13];

    v15 = [(CarCollectionCell *)v5 detailTextLabel];
    [v15 setAccessibilityIdentifier:@"DetailLabel"];
  }
  return v5;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CarCollectionCell;
  [(CarCollectionCell *)&v5 prepareForReuse];
  v3 = [(CarCollectionCell *)self textLabel];
  [v3 setText:0];

  v4 = [(CarCollectionCell *)self detailTextLabel];
  [v4 setText:0];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarCollectionCell;
  [(CarCollectionCell *)&v10 setHighlighted:a3 animated:a4];
  if (v4) {
    +[UIColor _carSystemFocusLabelColor];
  }
  else {
  v6 = +[UIColor labelColor];
  }
  v7 = [(CarCollectionCell *)self textLabel];
  [v7 setTextColor:v6];

  if (v4) {
    +[UIColor _carSystemFocusPrimaryColor];
  }
  else {
  v8 = +[UIColor _carSystemPrimaryColor];
  }
  v9 = [(CarCollectionCell *)self detailTextLabel];
  [v9 setTextColor:v8];
}

+ (id)reuseIdentifier
{
  return @"CarCollectionCellReuseIdentifier";
}

- (void)setupWithCollectionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 title];
  v6 = [(CarCollectionCell *)self textLabel];
  [v6 setText:v5];

  id v8 = [v4 subtitle];

  v7 = [(CarCollectionCell *)self detailTextLabel];
  [v7 setText:v8];
}

@end