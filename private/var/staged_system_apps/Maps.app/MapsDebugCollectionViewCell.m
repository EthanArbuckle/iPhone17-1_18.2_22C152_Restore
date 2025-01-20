@interface MapsDebugCollectionViewCell
- (MapsDebugCollectionViewCell)initWithFrame:(CGRect)a3;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (void)setupContentView;
@end

@implementation MapsDebugCollectionViewCell

- (MapsDebugCollectionViewCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)MapsDebugCollectionViewCell;
  v3 = -[MapsDebugCollectionViewCell initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = sub_1000BBB44(v3);
    id v6 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    textLabel = v4->_textLabel;
    v4->_textLabel = v10;

    [(UILabel *)v4->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v5 == 5) {
      +[UIFont systemFontOfSize:15.0];
    }
    else {
    v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }
    [(UILabel *)v4->_textLabel setFont:v12];

    [(UILabel *)v4->_textLabel setAdjustsFontForContentSizeCategory:v5 != 5];
    [(UILabel *)v4->_textLabel setNumberOfLines:2];
    [(UILabel *)v4->_textLabel setAccessibilityIdentifier:@"TextLabel"];
    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    detailTextLabel = v4->_detailTextLabel;
    v4->_detailTextLabel = v13;

    [(UILabel *)v4->_detailTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_detailTextLabel setTextColor:v15];

    if (v5 == 5) {
      +[UIFont systemFontOfSize:15.0];
    }
    else {
    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }
    [(UILabel *)v4->_detailTextLabel setFont:v16];

    [(UILabel *)v4->_detailTextLabel setAdjustsFontForContentSizeCategory:v5 != 5];
    [(UILabel *)v4->_detailTextLabel setNumberOfLines:2];
    [(UILabel *)v4->_detailTextLabel setAccessibilityIdentifier:@"DetailTextLabel"];
    [(MapsDebugCollectionViewCell *)v4 setupContentView];
  }
  return v4;
}

- (void)setupContentView
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [(MapsDebugCollectionViewCell *)self contentView];
  v4 = [v3 subviews];

  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v8) removeFromSuperview];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  id v9 = objc_alloc((Class)UIStackView);
  detailTextLabel = self->_detailTextLabel;
  v23[0] = self->_textLabel;
  v23[1] = detailTextLabel;
  v11 = +[NSArray arrayWithObjects:v23 count:2];
  id v12 = [v9 initWithArrangedSubviews:v11];

  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 setAxis:1];
  [v12 setAlignment:0];
  [v12 setDistribution:2];
  [v12 setSpacing:1.0];
  [v12 setAccessibilityIdentifier:@"MapsDebugCollectionViewCellTextStack"];
  v13 = [(MapsDebugCollectionViewCell *)self contentView];
  [v13 addSubview:v12];

  if (sub_1000BBB44(self) == 5) {
    double v14 = 5.0;
  }
  else {
    double v14 = 10.0;
  }
  v15 = [(MapsDebugCollectionViewCell *)self contentView];
  LODWORD(v16) = 1148846080;
  v17 = [v12 _maps_constraintsEqualToEdgesOfView:v15 insets:v14 priority:16.0];
  objc_super v18 = [v17 allConstraints];
  +[NSLayoutConstraint activateConstraints:v18];
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextLabel, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end