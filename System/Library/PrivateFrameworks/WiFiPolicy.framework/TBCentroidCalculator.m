@interface TBCentroidCalculator
- (BOOL)_validLatitudeValue:(double)a3;
- (BOOL)_validLongitudeValue:(double)a3;
- (CLLocationCoordinate2D)centroid;
- (NSMutableArray)points;
- (void)addLatitude:(double)a3 longitude:(double)a4;
- (void)setPoints:(id)a3;
@end

@implementation TBCentroidCalculator

- (NSMutableArray)points
{
  points = self->_points;
  if (!points)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = self->_points;
    self->_points = v4;

    points = self->_points;
  }

  return points;
}

- (BOOL)_validLatitudeValue:(double)a3
{
  return a3 >= -90.0 && a3 <= 90.0;
}

- (BOOL)_validLongitudeValue:(double)a3
{
  return a3 >= -180.0 && a3 <= 180.0;
}

- (void)addLatitude:(double)a3 longitude:(double)a4
{
  if (-[TBCentroidCalculator _validLatitudeValue:](self, "_validLatitudeValue:")
    && [(TBCentroidCalculator *)self _validLongitudeValue:a4])
  {
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = [NSNumber numberWithDouble:a3];
    v9 = [NSNumber numberWithDouble:a4];
    objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    v10 = [(TBCentroidCalculator *)self points];
    [v10 addObject:v11];
  }
}

- (CLLocationCoordinate2D)centroid
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(TBCentroidCalculator *)self points];
  uint64_t v4 = [v3 count];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v5 = [(TBCentroidCalculator *)self points];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v13 count] == 2)
        {
          v14 = [v13 objectAtIndexedSubscript:0];
          [v14 floatValue];
          float v16 = v15;

          v17 = [v13 objectAtIndexedSubscript:1];
          [v17 floatValue];
          float v19 = v18;

          float v20 = v16 * 0.0174532925;
          float v21 = v19 * 0.0174532925;
          double v22 = v21;
          __double2 v23 = __sincos_stret(v20);
          __double2 v24 = __sincos_stret(v22);
          double v11 = v11 + v23.__cosval * v24.__cosval;
          double v10 = v10 + v23.__cosval * v24.__sinval;
          double v9 = v9 + v23.__sinval;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
  }

  long double v25 = v9 / (double)v4;
  double v26 = atan2(v10 / (double)v4, v11 / (double)v4);
  float v27 = atan2(v25, sqrt(v10 / (double)v4 * (v10 / (double)v4) + v11 / (double)v4 * (v11 / (double)v4)));
  float v28 = v27 * 57.2957795;
  float v29 = v26;
  float v30 = v29 * 57.2957795;
  CLLocationCoordinate2D v33 = CLLocationCoordinate2DMake(v28, v30);
  double longitude = v33.longitude;
  double latitude = v33.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setPoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end