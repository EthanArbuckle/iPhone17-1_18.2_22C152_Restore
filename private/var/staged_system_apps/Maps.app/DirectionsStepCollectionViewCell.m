@interface DirectionsStepCollectionViewCell
+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3;
+ (Class)stepViewClass;
+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6;
+ (id)reuseIdentifier;
+ (unint64_t)signViewIconSize;
- (BOOL)isSelectedRow;
- (DirectionsStepCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIView)trailingView;
- (void)setIsDimmedStep:(BOOL)a3;
- (void)setIsSelectedRow:(BOOL)a3;
- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7;
- (void)setTrailingView:(id)a3;
- (void)updateTheme;
@end

@implementation DirectionsStepCollectionViewCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

- (DirectionsStepCollectionViewCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)DirectionsStepCollectionViewCell;
  v3 = -[DirectionsStepCollectionViewCell initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(DirectionsStepCollectionViewCell *)v3 setAccessibilityIdentifier:@"DirectionsStepCell"];
    id v5 = objc_alloc((Class)[(id)objc_opt_class() stepViewClass]);
    v6 = [(DirectionsStepCollectionViewCell *)v4 contentView];
    [v6 bounds];
    v7 = [v5 initWithFrame:];
    stepView = v4->_stepView;
    v4->_stepView = v7;

    [(DirectionsStepView *)v4->_stepView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DirectionsStepView *)v4->_stepView setAccessibilityIdentifier:@"DirectionsStep"];
    v9 = [(DirectionsStepCollectionViewCell *)v4 contentView];
    [v9 addSubview:v4->_stepView];

    v10 = v4->_stepView;
    v11 = [(DirectionsStepCollectionViewCell *)v4 contentView];
    LODWORD(v12) = 1148846080;
    v13 = [(DirectionsStepView *)v10 _maps_constraintsEqualToEdgesOfView:v11 priority:v12];
    v14 = [v13 allConstraints];
    +[NSLayoutConstraint activateConstraints:v14];

    v15 = [(DirectionsStepView *)v4->_stepView heightAnchor];
    uint64_t v16 = [v15 constraintEqualToConstant:0.0];
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v16;

    +[RoutingAppearanceManager configureBackgroundViewForStepCell:v4];
  }
  return v4;
}

- (void)updateTheme
{
  v9.receiver = self;
  v9.super_class = (Class)DirectionsStepCollectionViewCell;
  [(MapsThemeCollectionViewListCell *)&v9 updateTheme];
  if (sub_1000BBB44(self) != 5)
  {
    v3 = [(DirectionsStepCollectionViewCell *)self backgroundView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v5 = [(DirectionsStepCollectionViewCell *)self backgroundView];
      [v5 setHighlightedColor:[self isSelectedRow]];
    }
    v6 = [(DirectionsStepCollectionViewCell *)self theme];
    v7 = [v6 tableViewCellHighlightedOverlayColor];
    v8 = [(DirectionsStepCollectionViewCell *)self selectedBackgroundView];
    [v8 setBackgroundColor:v7];
  }
}

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  result = ($8452678F12DBC466148836A9D382CAFC *)[a2 stepViewClass];
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
  BOOL v8 = a6;
  id v12 = a4;
  id v16 = a3;
  double v13 = objc_opt_class();
  [(DirectionsStepView *)self->_stepView bounds];
  double Width = CGRectGetWidth(v18);
  v15 = [(DirectionsStepCollectionViewCell *)self traitCollection];
  [v13 heightForWidth:v16 route:v12 step:[v15 userInterfaceIdiom] idiom:Width];
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");

  [(NSLayoutConstraint *)self->_heightConstraint setActive:1];
  [(DirectionsStepView *)self->_stepView setRoute:v16 step:v12 stepIndex:a5 alignToLeftEdgeIfNoManeuverSign:v8 size:a7];
}

- (void)setIsDimmedStep:(BOOL)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_stepView, 0);
}

@end