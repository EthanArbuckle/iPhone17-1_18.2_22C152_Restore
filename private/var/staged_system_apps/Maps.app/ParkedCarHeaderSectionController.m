@interface ParkedCarHeaderSectionController
- (ParkedCarHeaderSectionController)initWithParkedCar:(id)a3;
- (id)_headerSubtitle;
- (id)sectionView;
- (void)_commonInit;
- (void)hideTitle:(BOOL)a3;
- (void)setActive:(BOOL)a3;
- (void)updateFromParkedCar;
- (void)updateTrailingConstraint;
@end

@implementation ParkedCarHeaderSectionController

- (ParkedCarHeaderSectionController)initWithParkedCar:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ParkedCarHeaderSectionController;
  v3 = [(ParkedCarSectionController *)&v6 initWithParkedCar:a3];
  v4 = v3;
  if (v3) {
    [(ParkedCarHeaderSectionController *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = [ParkedCarHeaderViewModel alloc];
  v4 = [(ParkedCarSectionController *)self parkedCar];
  v5 = [(ParkedCarHeaderSectionController *)self _headerSubtitle];
  v8 = [(ParkedCarHeaderViewModel *)v3 initWithParkedCar:v4 subtitleText:v5];

  objc_super v6 = (MUPlaceHeaderView *)[objc_alloc((Class)MUPlaceHeaderView) initWithViewModel:v8 trailingConstraintProvider:&stru_1012F89D0];
  headerView = self->_headerView;
  self->_headerView = v6;
}

- (id)sectionView
{
  return self->_headerView;
}

- (void)updateFromParkedCar
{
  v3 = [ParkedCarHeaderViewModel alloc];
  id v6 = [(ParkedCarSectionController *)self parkedCar];
  v4 = [(ParkedCarHeaderSectionController *)self _headerSubtitle];
  v5 = [(ParkedCarHeaderViewModel *)v3 initWithParkedCar:v6 subtitleText:v4];
  [(MUPlaceHeaderView *)self->_headerView setViewModel:v5];
}

- (void)hideTitle:(BOOL)a3
{
}

- (void)updateTrailingConstraint
{
}

- (id)_headerSubtitle
{
  v3 = [(ParkedCarSectionController *)self parkedCar];
  v4 = [v3 locationName];

  v5 = +[MKLocationManager sharedLocationManager];
  id v6 = [v5 lastLocation];

  if (!v6) {
    goto LABEL_10;
  }
  [v6 coordinate];
  v9 = 0;
  if (v8 < -180.0 || v8 > 180.0 || v7 < -90.0 || v7 > 90.0) {
    goto LABEL_11;
  }
  v10 = +[MKLocationManager sharedLocationManager];
  unsigned int v11 = [v10 isAuthorizedForPreciseLocation];

  if (!v11)
  {
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  [v6 coordinate];
  v12 = [(ParkedCarSectionController *)self parkedCar];
  [v12 coordinate];
  GEOCalculateDistance();
  double v14 = v13;

  distanceFormatter = self->_distanceFormatter;
  if (!distanceFormatter)
  {
    v16 = (MKDistanceFormatter *)objc_alloc_init((Class)MKDistanceFormatter);
    v17 = self->_distanceFormatter;
    self->_distanceFormatter = v16;

    [(MKDistanceFormatter *)self->_distanceFormatter setUnitStyle:1];
    distanceFormatter = self->_distanceFormatter;
  }
  v9 = [(MKDistanceFormatter *)distanceFormatter stringFromDistance:v14];
LABEL_11:
  if ([v4 length])
  {
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"Near %@ [ParkedCar Place Card]" value:@"localized string not found" table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v4);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9) {
      goto LABEL_18;
    }
    if (v20)
    {
      v21 = +[NSBundle mainBundle];
      v22 = [v21 localizedStringForKey:@"PARKED_CAR_PLACE_CARD_LOCATION_AND_DISTANCE" value:@"localized string not found" table:0];
      uint64_t v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v20, v9);

      id v20 = (id)v23;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (v9)
  {
LABEL_16:
    id v20 = v9;
    goto LABEL_18;
  }
  id v20 = 0;
LABEL_18:

  return v20;
}

- (void)setActive:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ParkedCarHeaderSectionController;
  [(ParkedCarHeaderSectionController *)&v4 setActive:a3];
  if ([(ParkedCarHeaderSectionController *)self isActive]) {
    [(ParkedCarHeaderSectionController *)self updateFromParkedCar];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceFormatter, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end