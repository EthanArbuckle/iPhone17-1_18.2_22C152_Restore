@interface DirectionsStartEndTableViewCell
+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3;
+ (Class)startEndViewClass;
+ (id)reuseIdentifier;
- (BOOL)alignSeparatorWithLeadingText;
- (CGRect)_separatorFrame;
- (DirectionsStartEndTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)heightForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6 width:(double)a7;
- (void)configureForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6;
- (void)prepareForReuse;
- (void)setAlignSeparatorWithLeadingText:(BOOL)a3;
- (void)setIsDimmedStep:(BOOL)a3;
@end

@implementation DirectionsStartEndTableViewCell

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  result = ($8452678F12DBC466148836A9D382CAFC *)[a2 startEndViewClass];
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

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (Class)startEndViewClass
{
  return (Class)objc_opt_class();
}

- (DirectionsStartEndTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)DirectionsStartEndTableViewCell;
  v4 = [(MapsThemeTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(DirectionsStartEndTableViewCell *)v4 setAccessibilityIdentifier:@"DirectionsStartEndCell"];
    id v6 = objc_alloc((Class)[(id)objc_opt_class() startEndViewClass]);
    v7 = [(DirectionsStartEndTableViewCell *)v5 contentView];
    [v7 bounds];
    v8 = [v6 initWithFrame:];
    startEndView = v5->_startEndView;
    v5->_startEndView = v8;

    [(DirectionsStartEndContentView *)v5->_startEndView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(DirectionsStartEndTableViewCell *)v5 contentView];
    [v10 addSubview:v5->_startEndView];

    v11 = v5->_startEndView;
    v12 = [(DirectionsStartEndTableViewCell *)v5 contentView];
    LODWORD(v13) = 1148846080;
    v14 = [(DirectionsStartEndContentView *)v11 _maps_constraintsEqualToEdgesOfView:v12 priority:v13];
    v15 = [v14 allConstraints];
    +[NSLayoutConstraint activateConstraints:v15];
  }
  return v5;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)DirectionsStartEndTableViewCell;
  [(DirectionsStartEndTableViewCell *)&v3 prepareForReuse];
  [(DirectionsStartEndContentView *)self->_startEndView prepareForReuse];
}

- (void)setAlignSeparatorWithLeadingText:(BOOL)a3
{
  if (self->_alignSeparatorWithLeadingText != a3)
  {
    self->_alignSeparatorWithLeadingText = a3;
    id v4 = [(DirectionsStartEndTableViewCell *)self separatorStyle];
    [(DirectionsStartEndTableViewCell *)self setSeparatorStyle:((uint64_t)[(DirectionsStartEndTableViewCell *)self separatorStyle] + 1) % 3];
    [(DirectionsStartEndTableViewCell *)self setSeparatorStyle:v4];
  }
}

- (CGRect)_separatorFrame
{
  v24.receiver = self;
  v24.super_class = (Class)DirectionsStartEndTableViewCell;
  [(DirectionsStartEndTableViewCell *)&v24 _separatorFrame];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  if ([(DirectionsStartEndTableViewCell *)self alignSeparatorWithLeadingText])
  {
    long long v23 = 0u;
    v11 = objc_opt_class();
    v12 = [(DirectionsStartEndTableViewCell *)self traitCollection];
    id v13 = [v12 userInterfaceIdiom];
    if (v11) {
      [v11 cellMetricsForIdiom:v13];
    }
    else {
      long long v23 = 0u;
    }

    double v14 = *(double *)&v23 + *((double *)&v23 + 1) + 0.0;
    if (+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(DirectionsStartEndTableViewCell *)self semanticContentAttribute]])
    {
      v15 = [(DirectionsStartEndTableViewCell *)self contentView];
      [v15 bounds];
      double MaxX = CGRectGetMaxX(v25);
      v26.origin.x = v4;
      v26.origin.y = v6;
      v26.size.width = v8;
      v26.size.height = v10;
      double v17 = MaxX - CGRectGetMaxX(v26);

      double v18 = v14 - v17;
    }
    else
    {
      v27.origin.x = v4;
      v27.origin.y = v6;
      v27.size.width = v8;
      v27.size.height = v10;
      double v18 = v14 - CGRectGetMinX(v27);
      double v4 = v4 + v18;
    }
    double v8 = v8 - v18;
  }
  double v19 = v4;
  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)configureForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6
{
}

- (double)heightForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6 width:(double)a7
{
  [(DirectionsStartEndContentView *)self->_startEndView heightForWaypoint:a3 route:a4 selectedVehicle:a5 displayedInRoutePlanning:a6 width:a7];
  return result;
}

- (void)setIsDimmedStep:(BOOL)a3
{
}

- (BOOL)alignSeparatorWithLeadingText
{
  return self->_alignSeparatorWithLeadingText;
}

- (void).cxx_destruct
{
}

@end