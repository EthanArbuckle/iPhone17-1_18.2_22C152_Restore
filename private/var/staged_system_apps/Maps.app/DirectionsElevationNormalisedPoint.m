@interface DirectionsElevationNormalisedPoint
- (NSMeasurement)elevationMeasurement;
- (NSMeasurement)offsetMeasurement;
- (id)chartViewDataRowID;
- (id)chartViewDataValueForColumn:(id)a3;
- (id)columnsInChartView;
- (void)setElevationMeasurement:(id)a3;
- (void)setOffsetMeasurement:(id)a3;
@end

@implementation DirectionsElevationNormalisedPoint

- (id)columnsInChartView
{
  return &off_1013AE8E0;
}

- (id)chartViewDataValueForColumn:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"elevation"])
  {
    v5 = [(DirectionsElevationNormalisedPoint *)self elevationMeasurement];
LABEL_5:
    v6 = v5;
    [v5 doubleValue];
    v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"offset"])
  {
    v5 = [(DirectionsElevationNormalisedPoint *)self offsetMeasurement];
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (id)chartViewDataRowID
{
  v2 = [(DirectionsElevationNormalisedPoint *)self offsetMeasurement];
  [v2 doubleValue];
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v3;
}

- (NSMeasurement)elevationMeasurement
{
  return self->_elevationMeasurement;
}

- (void)setElevationMeasurement:(id)a3
{
}

- (NSMeasurement)offsetMeasurement
{
  return self->_offsetMeasurement;
}

- (void)setOffsetMeasurement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetMeasurement, 0);

  objc_storeStrong((id *)&self->_elevationMeasurement, 0);
}

@end