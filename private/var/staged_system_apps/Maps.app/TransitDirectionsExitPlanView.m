@interface TransitDirectionsExitPlanView
- (GEOComposedString)text;
- (NSIndexSet)indexSetOfSuggestedCars;
- (TransitDirectionsExitPlanView)initWithFrame:(CGRect)a3;
- (id)bottomView;
- (id)topView;
- (unint64_t)_visibleCarIndexForCar:(unint64_t)a3;
- (unint64_t)maximumNumberOfVisibleCars;
- (unint64_t)numberOfCars;
- (void)_updateCars;
- (void)_updateSuggestedCarTinting;
- (void)setIndexSetOfSuggestedCars:(id)a3;
- (void)setMaximumNumberOfVisibleCars:(unint64_t)a3;
- (void)setNumberOfCars:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation TransitDirectionsExitPlanView

- (TransitDirectionsExitPlanView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TransitDirectionsExitPlanView;
  v3 = -[TransitDirectionsBoardingInfoStackView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(TransitDirectionsExitPlanView *)v3 setAccessibilityIdentifier:v5];

    v3->_maximumNumberOfVisibleCars = 3;
  }
  return v3;
}

- (id)topView
{
  carStackView = self->_carStackView;
  if (!carStackView)
  {
    v4 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:&__NSArray0__struct];
    v5 = self->_carStackView;
    self->_carStackView = v4;

    [(UIStackView *)self->_carStackView setAccessibilityIdentifier:@"CarStackView"];
    [(UIStackView *)self->_carStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_carStackView setAxis:0];
    [(UIStackView *)self->_carStackView setDistribution:0];
    [(UIStackView *)self->_carStackView setAlignment:0];
    [(UIStackView *)self->_carStackView setSpacing:2.0];
    LODWORD(v6) = 1148846080;
    [(UIStackView *)self->_carStackView setContentHuggingPriority:0 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(UIStackView *)self->_carStackView setContentHuggingPriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(UIStackView *)self->_carStackView setContentCompressionResistancePriority:0 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(UIStackView *)self->_carStackView setContentCompressionResistancePriority:1 forAxis:v9];
    v10 = [(UIStackView *)self->_carStackView heightAnchor];
    v11 = [v10 constraintEqualToConstant:20.0];
    [v11 setActive:1];

    [(TransitDirectionsExitPlanView *)self addSubview:self->_carStackView];
    carStackView = self->_carStackView;
  }

  return carStackView;
}

- (id)bottomView
{
  label = self->_label;
  if (!label)
  {
    v4 = [objc_alloc((Class)MKMultiPartLabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_label;
    self->_label = v4;

    [(MKMultiPartLabel *)self->_label setAccessibilityIdentifier:@"Label"];
    [(MKMultiPartLabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = +[UIColor secondaryLabelColor];
    [(MKMultiPartLabel *)self->_label setTextColor:v6];

    double v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(MKMultiPartLabel *)self->_label setFont:v7];

    -[MKMultiPartLabel setTextInset:](self->_label, "setTextInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    [(MKMultiPartLabel *)self->_label setLineBreakMode:0];
    [(MKMultiPartLabel *)self->_label setNumberOfLines:2];
    [(MKMultiPartLabel *)self->_label setUserInteractionEnabled:0];
    LODWORD(v8) = 1148846080;
    [(MKMultiPartLabel *)self->_label setContentCompressionResistancePriority:1 forAxis:v8];
    LODWORD(v9) = 1148829696;
    [(MKMultiPartLabel *)self->_label setContentCompressionResistancePriority:0 forAxis:v9];
    LODWORD(v10) = 1148846080;
    [(MKMultiPartLabel *)self->_label setContentHuggingPriority:1 forAxis:v10];
    LODWORD(v11) = 1112014848;
    [(MKMultiPartLabel *)self->_label setContentHuggingPriority:0 forAxis:v11];
    [(TransitDirectionsExitPlanView *)self addSubview:self->_label];
    label = self->_label;
  }

  return label;
}

- (void)setText:(id)a3
{
  id v5 = a3;
  text = self->_text;
  unint64_t v7 = (unint64_t)v5;
  id v8 = text;
  if (v7 | (unint64_t)v8)
  {
    double v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_text, a3);
      if (v7)
      {
        id v11 = [objc_alloc((Class)MKServerFormattedString) initWithComposedString:v7];
        NSAttributedStringKey v15 = NSFontAttributeName;
        v12 = [(MKMultiPartLabel *)self->_label font];
        v16 = v12;
        v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        v14 = [v11 multiPartAttributedStringWithAttributes:v13];
        [(MKMultiPartLabel *)self->_label setMultiPartString:v14];
      }
      else
      {
        [(MKMultiPartLabel *)self->_label setMultiPartString:0];
      }
    }
  }
}

- (void)setNumberOfCars:(unint64_t)a3
{
  if (self->_numberOfCars != a3)
  {
    self->_numberOfCars = a3;
    [(TransitDirectionsExitPlanView *)self _updateCars];
  }
}

- (void)setMaximumNumberOfVisibleCars:(unint64_t)a3
{
  if (self->_maximumNumberOfVisibleCars != a3)
  {
    self->_maximumNumberOfVisibleCars = a3;
    [(TransitDirectionsExitPlanView *)self _updateCars];
  }
}

- (void)setIndexSetOfSuggestedCars:(id)a3
{
  id v4 = a3;
  indexSetOfSuggestedCars = self->_indexSetOfSuggestedCars;
  unint64_t v10 = (unint64_t)v4;
  id v6 = indexSetOfSuggestedCars;
  if (v10 | (unint64_t)v6)
  {
    unsigned __int8 v7 = [(id)v10 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = (NSIndexSet *)[(id)v10 copy];
      double v9 = self->_indexSetOfSuggestedCars;
      self->_indexSetOfSuggestedCars = v8;

      [(TransitDirectionsExitPlanView *)self _updateSuggestedCarTinting];
    }
  }
}

- (NSIndexSet)indexSetOfSuggestedCars
{
  indexSetOfSuggestedCars = self->_indexSetOfSuggestedCars;
  if (!indexSetOfSuggestedCars)
  {
    id v4 = +[NSIndexSet indexSet];
    id v5 = self->_indexSetOfSuggestedCars;
    self->_indexSetOfSuggestedCars = v4;

    indexSetOfSuggestedCars = self->_indexSetOfSuggestedCars;
  }

  return indexSetOfSuggestedCars;
}

- (void)_updateCars
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  unint64_t v5 = [(TransitDirectionsExitPlanView *)self numberOfCars];
  if (v5 >= [(TransitDirectionsExitPlanView *)self maximumNumberOfVisibleCars]) {
    unint64_t v6 = [(TransitDirectionsExitPlanView *)self maximumNumberOfVisibleCars];
  }
  else {
    unint64_t v6 = [(TransitDirectionsExitPlanView *)self numberOfCars];
  }
  unint64_t v7 = v6;
  if (!v6) {
    goto LABEL_19;
  }
  id v8 = +[UIImage imageNamed:@"transit-exitplan-front"];
  v28 = self;
  if (v7 == 1)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = +[UIImage imageNamed:@"transit-exitplan-rear"];
    if (v7 >= 3)
    {
      unint64_t v10 = +[UIImage imageNamed:@"transit-exitplan-middle"];
      goto LABEL_10;
    }
  }
  unint64_t v10 = 0;
LABEL_10:
  uint64_t v11 = 0;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  do
  {
    NSAttributedStringKey v15 = -[AutolayoutImageView initWithFrame:]([AutolayoutImageView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    LODWORD(v16) = 1148846080;
    [(AutolayoutImageView *)v15 setContentHuggingPriority:0 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [(AutolayoutImageView *)v15 setContentHuggingPriority:1 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(AutolayoutImageView *)v15 setContentCompressionResistancePriority:0 forAxis:v18];
    LODWORD(v19) = 1148846080;
    [(AutolayoutImageView *)v15 setContentCompressionResistancePriority:1 forAxis:v19];
    if (v7 - 1 == v11) {
      v20 = v9;
    }
    else {
      v20 = v10;
    }
    if (v11) {
      v21 = v20;
    }
    else {
      v21 = v8;
    }
    -[AutolayoutImageView setImage:](v15, "setImage:", v21, v28);
    [v3 addObject:v15];
    [v4 addObject:v15];

    ++v11;
  }
  while (v7 != v11);

  self = v28;
LABEL_19:
  id v29 = v3;
  v22 = [(TransitDirectionsExitPlanView *)self traitCollection];
  id v23 = [v22 layoutDirection];

  v24 = v29;
  if (!v23)
  {
    v25 = [v29 reverseObjectEnumerator];
    v24 = [v25 allObjects];
  }
  v26 = (NSArray *)[v4 copy];
  cars = self->_cars;
  self->_cars = v26;

  [(UIStackView *)self->_carStackView _maps_setArrangedSubviews:v24];
  [(TransitDirectionsExitPlanView *)self _updateSuggestedCarTinting];
}

- (void)_updateSuggestedCarTinting
{
  if ([(NSArray *)self->_cars count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = self->_cars;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        unint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v7);
          double v9 = +[UIColor systemGray3Color];
          [v8 setTintColor:v9];

          unint64_t v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    unint64_t v10 = [(TransitDirectionsExitPlanView *)self indexSetOfSuggestedCars];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100AD47A8;
    v11[3] = &unk_1012EB2B8;
    v11[4] = self;
    [v10 enumerateIndexesUsingBlock:v11];
  }
}

- (unint64_t)_visibleCarIndexForCar:(unint64_t)a3
{
  NSUInteger v5 = [(NSArray *)self->_cars count];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!a3) {
    return 0;
  }
  unint64_t v6 = v5;
  if ((char *)[(TransitDirectionsExitPlanView *)self numberOfCars] - 1 == (unsigned char *)a3) {
    return v6 - 1;
  }
  else {
    return vcvtas_u32_f32((float)((float)a3 / (float)[(TransitDirectionsExitPlanView *)self numberOfCars]) * (float)v6);
  }
}

- (unint64_t)maximumNumberOfVisibleCars
{
  return self->_maximumNumberOfVisibleCars;
}

- (GEOComposedString)text
{
  return self->_text;
}

- (unint64_t)numberOfCars
{
  return self->_numberOfCars;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_indexSetOfSuggestedCars, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_cars, 0);

  objc_storeStrong((id *)&self->_carStackView, 0);
}

@end