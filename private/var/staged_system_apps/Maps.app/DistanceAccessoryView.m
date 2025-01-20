@interface DistanceAccessoryView
- (CGSize)intrinsicContentSize;
- (DistanceAccessoryView)initWithFrame:(CGRect)a3;
- (NSCharacterSet)customDecimalCharacterSet;
- (NSCharacterSet)customNonDecimalCharacterSet;
- (NSDictionary)digitTextAttributes;
- (NSDictionary)unitTextAttributes;
- (NSString)previousDistanceString;
- (UIActivityIndicatorView)activityView;
- (UIColor)textColor;
- (UIFontDescriptor)roundedFontDescriptor;
- (UIView)distanceLabel;
- (_TtC4Maps31DistanceAccessoryLabelViewModel)labelViewModel;
- (double)distanceToNextManeuver;
- (int64_t)displayState;
- (void)layoutSubviews;
- (void)setActivityView:(id)a3;
- (void)setCustomDecimalCharacterSet:(id)a3;
- (void)setCustomNonDecimalCharacterSet:(id)a3;
- (void)setDigitTextAttributes:(id)a3;
- (void)setDisplayState:(int64_t)a3;
- (void)setDistanceLabel:(id)a3;
- (void)setDistanceToNextManeuver:(double)a3;
- (void)setLabelViewModel:(id)a3;
- (void)setPreviousDistanceString:(id)a3;
- (void)setRoundedFontDescriptor:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setUnitTextAttributes:(id)a3;
@end

@implementation DistanceAccessoryView

- (DistanceAccessoryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)DistanceAccessoryView;
  v7 = -[DistanceAccessoryView initWithFrame:](&v18, "initWithFrame:");
  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [(DistanceAccessoryView *)v7 setAccessibilityIdentifier:v9];

    v7->_displayState = 0;
    v10 = objc_alloc_init(_TtC4Maps31DistanceAccessoryLabelViewModel);
    labelViewModel = v7->_labelViewModel;
    v7->_labelViewModel = v10;

    v12 = [(DistanceAccessoryLabelViewModel *)v7->_labelViewModel labelView];
    objc_storeWeak((id *)&v7->_distanceLabel, v12);

    id WeakRetained = objc_loadWeakRetained((id *)&v7->_distanceLabel);
    [WeakRetained setAccessibilityIdentifier:@"DistanceLabel"];

    id v14 = objc_loadWeakRetained((id *)&v7->_distanceLabel);
    [(DistanceAccessoryView *)v7 addSubview:v14];

    v15 = [objc_alloc((Class)UIActivityIndicatorView) initWithFrame:x, y, width, height];
    activityView = v7->_activityView;
    v7->_activityView = v15;

    [(UIActivityIndicatorView *)v7->_activityView setAccessibilityIdentifier:@"ActivityView"];
    [(UIActivityIndicatorView *)v7->_activityView setHidden:1];
    [(DistanceAccessoryView *)v7 addSubview:v7->_activityView];
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  CGFloat width = 20.0;
  CGFloat height = 20.0;
  if ((id)[(DistanceAccessoryView *)self displayState] != (id)3)
  {
    if ((id)[(DistanceAccessoryView *)self displayState] == (id)2)
    {
      v5 = [(DistanceAccessoryView *)self distanceLabel];
      [v5 intrinsicContentSize];
      CGFloat width = v6;
      CGFloat height = v7;
    }
    else
    {
      CGFloat width = CGSizeZero.width;
      CGFloat height = CGSizeZero.height;
    }
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)layoutSubviews
{
  v3 = [(DistanceAccessoryView *)self distanceLabel];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(DistanceAccessoryView *)self distanceLabel];
  [v8 setFrame:0.0, 0.0, v5, v7];

  double v9 = [(DistanceAccessoryView *)self activityView];
  [v9 setFrame:CGRectMake(0.0, 0.0, 20.0, 20.0)];

  [(DistanceAccessoryView *)self invalidateIntrinsicContentSize];
}

- (void)setDisplayState:(int64_t)a3
{
  if (self->_displayState != a3)
  {
    self->_displayState = a3;
    BOOL v5 = a3 != 2;
    double v6 = [(DistanceAccessoryView *)self distanceLabel];
    [v6 setHidden:v5];

    double v7 = [(DistanceAccessoryView *)self activityView];
    [v7 setHidden:a3 != 3];

    double v8 = [(DistanceAccessoryView *)self activityView];
    double v9 = v8;
    if (a3 == 3) {
      [v8 startAnimating];
    }
    else {
      [v8 stopAnimating];
    }

    [(DistanceAccessoryView *)self setNeedsLayout];
    [(DistanceAccessoryView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setDistanceToNextManeuver:(double)a3
{
  self->_distanceToNextManeuver = a3;
  double v4 = +[NSString _navigation_localizedStringForDistance:context:extraDetail:](NSString, "_navigation_localizedStringForDistance:context:extraDetail:", 1, 0);
  BOOL v5 = [(DistanceAccessoryView *)self previousDistanceString];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(DistanceAccessoryView *)self setPreviousDistanceString:v4];
    if (GEOConfigGetBOOL())
    {
      id v7 = objc_alloc_init((Class)NSMutableAttributedString);
      double v8 = +[NSScanner scannerWithString:v4];
      if (([v8 isAtEnd] & 1) == 0)
      {
        do
        {
          double v9 = [(DistanceAccessoryView *)self customDecimalCharacterSet];
          v30 = &stru_101324E70;
          [v8 scanCharactersFromSet:v9 intoString:&v30];
          v10 = v30;

          if ([(__CFString *)v10 length])
          {
            id v11 = objc_alloc((Class)NSAttributedString);
            v12 = [(DistanceAccessoryView *)self digitTextAttributes];
            id v13 = [v11 initWithString:v10 attributes:v12];

            [v7 appendAttributedString:v13];
          }
          id v14 = [(DistanceAccessoryView *)self customNonDecimalCharacterSet];
          v29 = &stru_101324E70;
          [v8 scanCharactersFromSet:v14 intoString:&v29];
          v15 = v29;

          if ([(__CFString *)v15 length])
          {
            id v16 = objc_alloc((Class)NSAttributedString);
            v17 = [(__CFString *)v15 uppercaseString];
            objc_super v18 = [(DistanceAccessoryView *)self unitTextAttributes];
            id v19 = [v16 initWithString:v17 attributes:v18];

            [v7 appendAttributedString:v19];
          }
        }
        while (![v8 isAtEnd]);
      }
      id v20 = [v7 copy];
    }
    else
    {
      id v21 = objc_alloc((Class)NSAttributedString);
      v22 = [(DistanceAccessoryView *)self digitTextAttributes];
      id v20 = [v21 initWithString:v4 attributes:v22];
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10062106C;
    v27[3] = &unk_1012E5D58;
    v27[4] = self;
    id v28 = v20;
    id v23 = v20;
    v24 = objc_retainBlock(v27);
    [(DistanceAccessoryView *)self alpha];
    if (v25 == 0.0)
    {
      ((void (*)(void *))v24[2])(v24);
    }
    else
    {
      v26 = [(DistanceAccessoryView *)self systemApertureElementContext];
      [v26 setElementNeedsUpdateWithCoordinatedAnimations:v24];
    }
  }
}

- (UIFontDescriptor)roundedFontDescriptor
{
  roundedFontDescriptor = self->_roundedFontDescriptor;
  if (!roundedFontDescriptor)
  {
    double v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    BOOL v5 = [v4 fontDescriptor];
    unsigned __int8 v6 = [v5 fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded];
    id v7 = self->_roundedFontDescriptor;
    self->_roundedFontDescriptor = v6;

    roundedFontDescriptor = self->_roundedFontDescriptor;
  }

  return roundedFontDescriptor;
}

- (NSDictionary)digitTextAttributes
{
  digitTextAttributes = self->_digitTextAttributes;
  if (!digitTextAttributes)
  {
    UIFontDescriptorTraitKey v23 = UIFontWeightTrait;
    double v4 = +[NSNumber numberWithDouble:UIFontWeightMedium];
    v24 = v4;
    BOOL v5 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

    v21[0] = UIFontFeatureTypeIdentifierKey;
    v21[1] = UIFontFeatureSelectorIdentifierKey;
    v22[0] = &off_1013A7E58;
    v22[1] = &off_1013A7E70;
    unsigned __int8 v6 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v7 = [(DistanceAccessoryView *)self roundedFontDescriptor];
    v20[0] = v5;
    v19[0] = UIFontDescriptorTraitsAttribute;
    v19[1] = UIFontDescriptorFeatureSettingsAttribute;
    objc_super v18 = v6;
    double v8 = +[NSArray arrayWithObjects:&v18 count:1];
    v20[1] = v8;
    double v9 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    v10 = [v7 fontDescriptorByAddingAttributes:v9];

    id v11 = +[UIFont fontWithDescriptor:v10 size:15.0];
    v12 = +[MapsTheme apertureKeyColor];
    v17[1] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:2];
    id v14 = self->_digitTextAttributes;
    self->_digitTextAttributes = v13;

    digitTextAttributes = self->_digitTextAttributes;
  }

  return digitTextAttributes;
}

- (NSDictionary)unitTextAttributes
{
  unitTextAttributes = self->_unitTextAttributes;
  if (!unitTextAttributes)
  {
    UIFontDescriptorTraitKey v18 = UIFontWeightTrait;
    double v4 = +[NSNumber numberWithDouble:UIFontWeightBold];
    id v19 = v4;
    BOOL v5 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    unsigned __int8 v6 = [(DistanceAccessoryView *)self roundedFontDescriptor];
    UIFontDescriptorAttributeName v16 = UIFontDescriptorTraitsAttribute;
    v17 = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    double v8 = [v6 fontDescriptorByAddingAttributes:v7];

    double v9 = +[UIFont fontWithDescriptor:v8 size:8.0];
    v15[0] = v9;
    v14[0] = NSFontAttributeName;
    v14[1] = NSForegroundColorAttributeName;
    v10 = +[MapsTheme apertureKeyColor];
    v14[2] = NSBaselineOffsetAttributeName;
    v15[1] = v10;
    v15[2] = &off_1013A7E88;
    id v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    v12 = self->_unitTextAttributes;
    self->_unitTextAttributes = v11;

    unitTextAttributes = self->_unitTextAttributes;
  }

  return unitTextAttributes;
}

- (NSCharacterSet)customDecimalCharacterSet
{
  customDecimalCharacterSet = self->_customDecimalCharacterSet;
  if (!customDecimalCharacterSet)
  {
    double v4 = [(DistanceAccessoryView *)self customNonDecimalCharacterSet];
    BOOL v5 = [v4 invertedSet];
    id v6 = [v5 mutableCopy];

    [v6 addCharactersInString:@"."];
    id v7 = (NSCharacterSet *)[v6 copy];
    double v8 = self->_customDecimalCharacterSet;
    self->_customDecimalCharacterSet = v7;

    customDecimalCharacterSet = self->_customDecimalCharacterSet;
  }

  return customDecimalCharacterSet;
}

- (NSCharacterSet)customNonDecimalCharacterSet
{
  customNonDecimalCharacterSet = self->_customNonDecimalCharacterSet;
  if (!customNonDecimalCharacterSet)
  {
    double v4 = +[NSCharacterSet letterCharacterSet];
    id v5 = [v4 mutableCopy];

    [v5 addCharactersInString:@" "];
    [v5 addCharactersInString:@"."];
    [v5 addCharactersInString:@"׳"];
    id v6 = (NSCharacterSet *)[v5 copy];
    id v7 = self->_customNonDecimalCharacterSet;
    self->_customNonDecimalCharacterSet = v6;

    customNonDecimalCharacterSet = self->_customNonDecimalCharacterSet;
  }

  return customNonDecimalCharacterSet;
}

- (int64_t)displayState
{
  return self->_displayState;
}

- (double)distanceToNextManeuver
{
  return self->_distanceToNextManeuver;
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (void)setRoundedFontDescriptor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (void)setDigitTextAttributes:(id)a3
{
}

- (void)setUnitTextAttributes:(id)a3
{
}

- (void)setCustomDecimalCharacterSet:(id)a3
{
}

- (void)setCustomNonDecimalCharacterSet:(id)a3
{
}

- (_TtC4Maps31DistanceAccessoryLabelViewModel)labelViewModel
{
  return self->_labelViewModel;
}

- (void)setLabelViewModel:(id)a3
{
}

- (UIView)distanceLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_distanceLabel);

  return (UIView *)WeakRetained;
}

- (void)setDistanceLabel:(id)a3
{
}

- (NSString)previousDistanceString
{
  return self->_previousDistanceString;
}

- (void)setPreviousDistanceString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDistanceString, 0);
  objc_destroyWeak((id *)&self->_distanceLabel);
  objc_storeStrong((id *)&self->_labelViewModel, 0);
  objc_storeStrong((id *)&self->_customNonDecimalCharacterSet, 0);
  objc_storeStrong((id *)&self->_customDecimalCharacterSet, 0);
  objc_storeStrong((id *)&self->_unitTextAttributes, 0);
  objc_storeStrong((id *)&self->_digitTextAttributes, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_roundedFontDescriptor, 0);

  objc_storeStrong((id *)&self->_activityView, 0);
}

@end