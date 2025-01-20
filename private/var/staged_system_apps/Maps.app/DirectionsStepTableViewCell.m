@interface DirectionsStepTableViewCell
+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3;
+ (Class)stepViewClass;
+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6;
+ (id)reuseIdentifier;
+ (unint64_t)signViewIconSize;
- (BOOL)alignSeparatorWithLeadingText;
- (BOOL)isSelectedRow;
- (CGRect)_separatorFrame;
- (DirectionsStepTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)trailingView;
- (double)_trailingGuideToContentViewDistance;
- (void)setAccessoryType:(int64_t)a3;
- (void)setAlignSeparatorWithLeadingText:(BOOL)a3;
- (void)setIsDimmedStep:(BOOL)a3;
- (void)setIsSelectedRow:(BOOL)a3;
- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7;
- (void)setTrailingView:(id)a3;
- (void)updateTheme;
@end

@implementation DirectionsStepTableViewCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

- (DirectionsStepTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)DirectionsStepTableViewCell;
  v4 = [(MapsThemeTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(DirectionsStepTableViewCell *)v4 setAccessibilityIdentifier:@"DirectionsStepCell"];
    id v6 = objc_alloc((Class)[(id)objc_opt_class() stepViewClass]);
    v7 = [(DirectionsStepTableViewCell *)v5 contentView];
    [v7 bounds];
    v8 = [v6 initWithFrame:];
    stepView = v5->_stepView;
    v5->_stepView = v8;

    [(DirectionsStepView *)v5->_stepView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DirectionsStepView *)v5->_stepView setAccessibilityIdentifier:@"DirectionsStep"];
    v10 = [(DirectionsStepTableViewCell *)v5 contentView];
    [v10 addSubview:v5->_stepView];

    v11 = v5->_stepView;
    v12 = [(DirectionsStepTableViewCell *)v5 contentView];
    LODWORD(v13) = 1148846080;
    v14 = [(DirectionsStepView *)v11 _maps_constraintsEqualToEdgesOfView:v12 priority:v13];
    v15 = [v14 allConstraints];
    +[NSLayoutConstraint activateConstraints:v15];
  }
  return v5;
}

- (void)updateTheme
{
  v9.receiver = self;
  v9.super_class = (Class)DirectionsStepTableViewCell;
  [(MapsThemeTableViewCell *)&v9 updateTheme];
  v3 = [(DirectionsStepTableViewCell *)self backgroundView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(DirectionsStepTableViewCell *)self backgroundView];
    [v5 setHighlightedColor:[self isSelectedRow]];
  }
  id v6 = [(DirectionsStepTableViewCell *)self theme];
  v7 = [v6 tableViewCellHighlightedOverlayColor];
  v8 = [(DirectionsStepTableViewCell *)self selectedBackgroundView];
  [v8 setBackgroundColor:v7];
}

- (void)setAccessoryType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DirectionsStepTableViewCell;
  [(DirectionsStepTableViewCell *)&v5 setAccessoryType:a3];
  stepView = self->_stepView;
  [(DirectionsStepTableViewCell *)self _trailingGuideToContentViewDistance];
  -[DirectionsStepView _updateTrailingGuideToContentViewConstraintWithConstant:](stepView, "_updateTrailingGuideToContentViewConstraintWithConstant:");
}

- (double)_trailingGuideToContentViewDistance
{
  v3 = objc_opt_class();
  v4 = [(DirectionsStepTableViewCell *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];
  if (v3) {
    [v3 cellMetricsForIdiom:v5];
  }

  id v6 = [(DirectionsStepTableViewCell *)self accessoryType];
  double result = 0.0;
  if (v6) {
    return 0.0;
  }
  return result;
}

- (CGRect)_separatorFrame
{
  v23.receiver = self;
  v23.super_class = (Class)DirectionsStepTableViewCell;
  [(DirectionsStepTableViewCell *)&v23 _separatorFrame];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  if ([(DirectionsStepTableViewCell *)self alignSeparatorWithLeadingText])
  {
    long long v22 = 0u;
    v11 = objc_opt_class();
    v12 = [(DirectionsStepTableViewCell *)self traitCollection];
    id v13 = [v12 userInterfaceIdiom];
    if (v11) {
      [v11 cellMetricsForIdiom:v13];
    }
    else {
      long long v22 = 0u;
    }

    if (+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(DirectionsStepTableViewCell *)self semanticContentAttribute]])
    {
      v14 = [(DirectionsStepTableViewCell *)self contentView];
      [v14 bounds];
      double MaxX = CGRectGetMaxX(v24);
      v25.origin.x = v4;
      v25.origin.y = v6;
      v25.size.width = v8;
      v25.size.height = v10;
      double v16 = MaxX - CGRectGetMaxX(v25);

      double v17 = *(double *)&v22 + *((double *)&v22 + 1) + 0.0 - v16;
    }
    else
    {
      v26.origin.x = v4;
      v26.origin.y = v6;
      v26.size.width = v8;
      v26.size.height = v10;
      double v17 = *(double *)&v22 + *((double *)&v22 + 1) + 0.0 - CGRectGetMinX(v26);
      double v4 = v4 + v17;
    }
    double v8 = v8 - v17;
  }
  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  CGRect result = ($8452678F12DBC466148836A9D382CAFC *)[a2 stepViewClass];
  if (result)
  {
    return ($8452678F12DBC466148836A9D382CAFC *)[($8452678F12DBC466148836A9D382CAFC *)result cellMetricsForIdiom:a4];
  }
  else
  {
    retstr->var8 = 0.0;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var6 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  return result;
}

+ (unint64_t)signViewIconSize
{
  id v2 = [a1 stepViewClass];

  return (unint64_t)[v2 signViewIconSize];
}

+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  objc_msgSend(objc_msgSend(a1, "stepViewClass"), "heightForWidth:route:step:idiom:", v11, v10, a6, a3);
  double v13 = v12;

  return v13;
}

- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7
{
}

- (void)setIsDimmedStep:(BOOL)a3
{
}

- (void)setAlignSeparatorWithLeadingText:(BOOL)a3
{
  if (self->_alignSeparatorWithLeadingText != a3)
  {
    self->_alignSeparatorWithLeadingText = a3;
    id v4 = [(DirectionsStepTableViewCell *)self separatorStyle];
    [(DirectionsStepTableViewCell *)self setSeparatorStyle:((uint64_t)[(DirectionsStepTableViewCell *)self separatorStyle] + 1) % 3];
    [(DirectionsStepTableViewCell *)self setSeparatorStyle:v4];
  }
}

- (void)setIsSelectedRow:(BOOL)a3
{
}

- (BOOL)isSelectedRow
{
  return [(DirectionsStepView *)self->_stepView isSelectedRow];
}

- (void)setTrailingView:(id)a3
{
}

- (UIView)trailingView
{
  return [(DirectionsStepView *)self->_stepView trailingView];
}

- (BOOL)alignSeparatorWithLeadingText
{
  return self->_alignSeparatorWithLeadingText;
}

- (void).cxx_destruct
{
}

@end