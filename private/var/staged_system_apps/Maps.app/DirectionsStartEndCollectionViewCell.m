@interface DirectionsStartEndCollectionViewCell
+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3;
+ (Class)startEndViewClass;
+ (id)reuseIdentifier;
- (DirectionsStartEndCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)heightForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6 width:(double)a7;
- (void)configureForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6;
- (void)prepareForReuse;
- (void)setIsDimmedStep:(BOOL)a3;
@end

@implementation DirectionsStartEndCollectionViewCell

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

- (DirectionsStartEndCollectionViewCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)DirectionsStartEndCollectionViewCell;
  v3 = -[DirectionsStartEndCollectionViewCell initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(DirectionsStartEndCollectionViewCell *)v3 setAccessibilityIdentifier:@"DirectionsStartEndCell"];
    id v5 = objc_alloc((Class)[(id)objc_opt_class() startEndViewClass]);
    v6 = [(DirectionsStartEndCollectionViewCell *)v4 contentView];
    [v6 bounds];
    v7 = [v5 initWithFrame:];
    startEndView = v4->_startEndView;
    v4->_startEndView = v7;

    [(DirectionsStartEndContentView *)v4->_startEndView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(DirectionsStartEndCollectionViewCell *)v4 contentView];
    [v9 addSubview:v4->_startEndView];

    v10 = v4->_startEndView;
    v11 = [(DirectionsStartEndCollectionViewCell *)v4 contentView];
    LODWORD(v12) = 1148846080;
    v13 = [(DirectionsStartEndContentView *)v10 _maps_constraintsEqualToEdgesOfView:v11 priority:v12];
    v14 = [v13 allConstraints];
    +[NSLayoutConstraint activateConstraints:v14];

    v15 = [(DirectionsStartEndContentView *)v4->_startEndView heightAnchor];
    uint64_t v16 = [v15 constraintEqualToConstant:0.0];
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v16;

    +[RoutingAppearanceManager configureBackgroundViewForStepCell:v4];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)DirectionsStartEndCollectionViewCell;
  [(DirectionsStartEndCollectionViewCell *)&v3 prepareForReuse];
  [(DirectionsStartEndContentView *)self->_startEndView prepareForReuse];
}

- (void)configureForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6
{
  BOOL v6 = a6;
  startEndView = self->_startEndView;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(DirectionsStartEndContentView *)startEndView bounds];
  [(DirectionsStartEndCollectionViewCell *)self heightForWaypoint:v13 route:v12 selectedVehicle:v11 displayedInRoutePlanning:v6 width:CGRectGetWidth(v15)];
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_heightConstraint setActive:1];
  [(DirectionsStartEndContentView *)self->_startEndView configureForWaypoint:v13 route:v12 selectedVehicle:v11 displayedInRoutePlanning:v6];
}

- (double)heightForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6 width:(double)a7
{
  [(DirectionsStartEndContentView *)self->_startEndView heightForWaypoint:a3 route:a4 selectedVehicle:a5 displayedInRoutePlanning:a6 width:a7];
  return result;
}

- (void)setIsDimmedStep:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_startEndView, 0);
}

@end