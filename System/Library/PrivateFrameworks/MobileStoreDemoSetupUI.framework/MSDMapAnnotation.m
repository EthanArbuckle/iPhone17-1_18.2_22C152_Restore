@interface MSDMapAnnotation
- (BOOL)isSameLocation:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (MSDMapAnnotation)initWithStoreInfo:(id)a3;
- (MSDStoreInfo)storeInfo;
- (NSString)title;
@end

@implementation MSDMapAnnotation

- (MSDMapAnnotation)initWithStoreInfo:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSDMapAnnotation;
  v6 = [(MSDMapAnnotation *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeInfo, a3);
    uint64_t v8 = [v5 storeName];
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v10 = [v5 storeLocation];
    [v10 coordinate];
    v7->_coordinate.latitude = v11;
    v7->_coordinate.longitude = v12;
  }
  return v7;
}

- (BOOL)isSameLocation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(MSDMapAnnotation *)self storeInfo];
    v7 = [v6 storeLocation];
    [v7 coordinate];
    double v9 = v8;
    v10 = [v5 storeInfo];
    CLLocationDegrees v11 = [v10 storeLocation];
    [v11 coordinate];
    if (v9 == v12)
    {
      v23 = [(MSDMapAnnotation *)self storeInfo];
      v13 = [v23 storeLocation];
      [v13 coordinate];
      double v15 = v14;
      v16 = [v5 storeInfo];
      [v16 storeLocation];
      v17 = v7;
      v19 = v18 = v6;
      [v19 coordinate];
      BOOL v21 = v15 == v20;

      v6 = v18;
      v7 = v17;
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (NSString)title
{
  return self->_title;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (MSDStoreInfo)storeInfo
{
  return self->_storeInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end