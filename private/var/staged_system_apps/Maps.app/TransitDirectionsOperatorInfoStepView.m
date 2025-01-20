@interface TransitDirectionsOperatorInfoStepView
- (double)bottomSpacerHeight;
- (id)_initialConstraints;
- (void)_contentSizeCategoryDidChange;
- (void)_createSubviews;
- (void)_updateNavigationStateAlpha:(double)a3;
- (void)configureWithItem:(id)a3;
- (void)setPreviousItem:(id)a3 withPreviousNavigationState:(int64_t)a4;
@end

@implementation TransitDirectionsOperatorInfoStepView

- (void)_createSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  [(TransitDirectionsStepView *)&v9 _createSubviews];
  v3 = [objc_alloc((Class)MKMultiPartLabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  label = self->_label;
  self->_label = v3;

  [(MKMultiPartLabel *)self->_label setAccessibilityIdentifier:@"Label"];
  [(MKMultiPartLabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[UIFont system15];
  [(MKMultiPartLabel *)self->_label setFont:v5];

  v6 = +[UIColor secondaryLabelColor];
  [(MKMultiPartLabel *)self->_label setTextColor:v6];

  [(MKMultiPartLabel *)self->_label setUserInteractionEnabled:0];
  -[MKMultiPartLabel setTextInset:](self->_label, "setTextInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  LODWORD(v7) = 1148846080;
  [(MKMultiPartLabel *)self->_label setContentHuggingPriority:1 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [(MKMultiPartLabel *)self->_label setContentCompressionResistancePriority:1 forAxis:v8];
  [(TransitDirectionsOperatorInfoStepView *)self addSubview:self->_label];
}

- (id)_initialConstraints
{
  v12.receiver = self;
  v12.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  v3 = [(TransitDirectionsStepView *)&v12 _initialConstraints];
  label = self->_label;
  v5 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  LODWORD(v6) = 1148846080;
  double v7 = [(MKMultiPartLabel *)label _maps_constraintsEqualToEdgesOfLayoutGuide:v5 priority:v6];

  double v8 = [v7 leadingConstraint];
  leadingLabelConstraint = self->_leadingLabelConstraint;
  self->_leadingLabelConstraint = v8;

  v10 = [v7 allConstraints];
  [v3 addObjectsFromArray:v10];

  return v3;
}

- (void)configureWithItem:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  id v4 = a3;
  [(TransitDirectionsStepView *)&v19 configureWithItem:v4];
  NSAttributedStringKey v20 = NSFontAttributeName;
  v5 = [(MKMultiPartLabel *)self->_label font];
  v21 = v5;
  double v6 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  double v7 = [v4 majorFormattedStrings];

  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100D31C84;
  v17 = &unk_1013227F0;
  id v18 = v6;
  id v8 = v6;
  objc_super v9 = sub_100099700(v7, &v14);

  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Hours [separator] Fares [Transit, Route List View]", @"localized string not found", 0 value table];

  id v12 = [objc_alloc((Class)NSAttributedString) initWithString:v11];
  v13 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v9 repeatedSeparator:v12];

  [(MKMultiPartLabel *)self->_label setMultiPartString:v13];
}

- (void)setPreviousItem:(id)a3 withPreviousNavigationState:(int64_t)a4
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_previousTransitDirectionsListItem, a3);
  self->_previousTransitDirectionsListItemsNavigationState = a4;
  id v7 = [v9 type];
  double v8 = 0.0;
  if (v7 == (id)12) {
    +[TransitDirectionsBlockTransferStepView leadingTextInsetForBlockTransferTransitDirectionsListItem:navigationState:](TransitDirectionsBlockTransferStepView, "leadingTextInsetForBlockTransferTransitDirectionsListItem:navigationState:", v9, a4, 0.0);
  }
  [(NSLayoutConstraint *)self->_leadingLabelConstraint setConstant:v8];
}

- (void)_contentSizeCategoryDidChange
{
  v2 = self;
  if (sub_1000BBB44(v2) == 5) {
    +[UIFont system17];
  }
  else {
  v3 = +[UIFont system15];
  }

  id v4 = [v3 _mapkit_fontByAddingFeaturesForTimeDisplay];

  [(MKMultiPartLabel *)v2->_label setFont:v4];
  v5.receiver = v2;
  v5.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  [(TransitDirectionsStepView *)&v5 _contentSizeCategoryDidChange];
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  [(MKMultiPartLabel *)self->_label setAlpha:a3];
}

- (double)bottomSpacerHeight
{
  return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTransitDirectionsListItem, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_leadingLabelConstraint, 0);

  objc_storeStrong((id *)&self->_topToPrimaryLabelBaselineConstraint, 0);
}

@end