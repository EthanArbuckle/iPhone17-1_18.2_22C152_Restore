@interface CardTestPopoverContainee
- (CardTestPopoverContainee)initWithContext:(id)a3 forLabelMarker:(id)a4;
- (void)_createSubviews;
@end

@implementation CardTestPopoverContainee

- (CardTestPopoverContainee)initWithContext:(id)a3 forLabelMarker:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CardTestPopoverContainee;
  v8 = [(CardTestContainee *)&v12 initWithContext:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_labelMarker, a4);
    [(ContaineeViewController *)v9 setPreferredPresentationStyle:3];
    v10 = [(ContaineeViewController *)v9 macPopoverPresentationController];
    [v7 coordinate];
    [v10 setCoordinate:];
  }
  return v9;
}

- (void)_createSubviews
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = +[NSString stringWithFormat:@"Label Marker: %@", self->_labelMarker];
  [v3 setText:v4];

  [v3 setNumberOfLines:0];
  v5 = [(CardTestPopoverContainee *)self view];
  [v5 addSubview:v3];

  v21 = [v3 leadingAnchor];
  v22 = [(CardTestPopoverContainee *)self view];
  v20 = [v22 leadingAnchor];
  v19 = [v21 constraintEqualToSystemSpacingAfterAnchor:v20 multiplier:1.0];
  v23[0] = v19;
  v17 = [v3 topAnchor];
  v18 = [(CardTestPopoverContainee *)self view];
  v16 = [v18 topAnchor];
  v15 = [v17 constraintEqualToSystemSpacingBelowAnchor:v16 multiplier:1.0];
  v23[1] = v15;
  v6 = [(CardTestPopoverContainee *)self view];
  id v7 = [v6 trailingAnchor];
  v8 = [v3 trailingAnchor];
  v9 = [v7 constraintEqualToSystemSpacingAfterAnchor:v8 multiplier:1.0];
  v23[2] = v9;
  v10 = [(CardTestPopoverContainee *)self view];
  v11 = [v10 bottomAnchor];
  objc_super v12 = [v3 bottomAnchor];
  v13 = [v11 constraintEqualToSystemSpacingBelowAnchor:v12 multiplier:1.0];
  v23[3] = v13;
  v14 = +[NSArray arrayWithObjects:v23 count:4];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void).cxx_destruct
{
}

@end