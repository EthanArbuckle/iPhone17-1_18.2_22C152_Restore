@interface PXPlacesMapLayoutItemImpl
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLayoutItem:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (NSMutableOrderedSet)layoutGeotaggables;
- (NSString)description;
- (PXPlacesMapLayoutItemImpl)initWithCoordinate:(CLLocationCoordinate2D)a3;
- (unint64_t)hash;
- (void)addGeotaggable:(id)a3;
- (void)addGeotaggables:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setLayoutGeotaggables:(id)a3;
@end

@implementation PXPlacesMapLayoutItemImpl

- (void).cxx_destruct
{
}

- (void)setLayoutGeotaggables:(id)a3
{
}

- (NSMutableOrderedSet)layoutGeotaggables
{
  return self->_layoutGeotaggables;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationCoordinate2D v3 = a3;
  objc_copyStruct(&self->_coordinate, &v3, 16, 1, 0);
}

- (CLLocationCoordinate2D)coordinate
{
  objc_copyStruct(v4, &self->_coordinate, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (NSString)description
{
  double v3 = (void *)MEMORY[0x1E4F28E78];
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapLayoutItemImpl;
  v4 = [(PXPlacesMapLayoutItemImpl *)&v11 description];
  v5 = [v3 stringWithFormat:@"%@\n", v4];

  [v5 appendString:@"---------------------\n"];
  [(PXPlacesMapLayoutItemImpl *)self coordinate];
  uint64_t v7 = v6;
  [(PXPlacesMapLayoutItemImpl *)self coordinate];
  [v5 appendFormat:@"- Location: %f, %f:\n", v7, v8];
  v9 = [(PXPlacesMapLayoutItemImpl *)self geotaggables];
  [v5 appendFormat:@"- Geotaggables: %@:\n", v9];

  return (NSString *)v5;
}

- (BOOL)isEqualToLayoutItem:(id)a3
{
  id v4 = a3;
  [(PXPlacesMapLayoutItemImpl *)self coordinate];
  double v6 = v5;
  [v4 coordinate];
  if (vabdd_f64(v6, v7) >= 2.22044605e-16
    || ([(PXPlacesMapLayoutItemImpl *)self coordinate],
        double v9 = v8,
        [v4 coordinate],
        vabdd_f64(v9, v10) >= 2.22044605e-16))
  {
    char v14 = 0;
  }
  else
  {
    objc_super v11 = [(PXPlacesMapLayoutItemImpl *)self geotaggables];
    v12 = [v4 geotaggables];
    uint64_t v13 = [v11 count];
    if (v13 == [v12 count]) {
      char v14 = [v11 isEqualToOrderedSet:v12];
    }
    else {
      char v14 = 0;
    }
  }
  return v14;
}

- (void)addGeotaggables:(id)a3
{
}

- (void)addGeotaggable:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXPlacesMapLayoutItemImpl *)a3;
  double v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PXPlacesMapLayoutItemImpl *)self isEqualToLayoutItem:v5];

  return v6;
}

- (unint64_t)hash
{
  [(PXPlacesMapLayoutItemImpl *)self coordinate];
  double v4 = v3;
  [(PXPlacesMapLayoutItemImpl *)self coordinate];
  return (unint64_t)fabs(v5 * 1000.0 + v4 * 1000.0);
}

- (PXPlacesMapLayoutItemImpl)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesMapLayoutItemImpl;
  double v5 = [(PXPlacesMapLayoutItemImpl *)&v9 init];
  BOOL v6 = v5;
  if (v5)
  {
    -[PXPlacesMapLayoutItemImpl setCoordinate:](v5, "setCoordinate:", latitude, longitude);
    double v7 = [MEMORY[0x1E4F1CA70] orderedSet];
    [(PXPlacesMapLayoutItemImpl *)v6 setLayoutGeotaggables:v7];
  }
  return v6;
}

@end