@interface GeoRequestCounterDurations
- (BOOL)supportsMultipleSelection;
- (GeoRequestCounterDurations)init;
- (double)currentDurationInterval;
- (id)currentSelection;
- (id)currentSelectionString;
- (id)stringForRow:(int64_t)a3;
- (int64_t)rowCount;
- (void)setSelection:(id)a3;
@end

@implementation GeoRequestCounterDurations

- (GeoRequestCounterDurations)init
{
  v6.receiver = self;
  v6.super_class = (Class)GeoRequestCounterDurations;
  v2 = [(GeoRequestCounterDurations *)&v6 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v4 = [v3 valueForKey:@"_debug_geoReqCountDuration"];

    v2->_selectedRow = (int64_t)[v4 integerValue];
  }
  return v2;
}

- (BOOL)supportsMultipleSelection
{
  return 0;
}

- (id)currentSelectionString
{
  return [(GeoRequestCounterDurations *)self stringForRow:self->_selectedRow];
}

- (id)currentSelection
{
  return +[NSIndexSet indexSetWithIndex:self->_selectedRow];
}

- (void)setSelection:(id)a3
{
  self->_selectedRow = (int64_t)[a3 firstIndex];
  id v5 = +[NSUserDefaults standardUserDefaults];
  v4 = +[NSNumber numberWithInteger:self->_selectedRow];
  [v5 setObject:v4 forKey:@"_debug_geoReqCountDuration"];
}

- (double)currentDurationInterval
{
  v2 = [&off_1013AD578 objectAtIndexedSubscript:self->_selectedRow];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)stringForRow:(int64_t)a3
{
  v7[0] = @"10 minutes";
  v7[1] = @"1 hour";
  v7[2] = @"6 hours";
  v7[3] = @"12 hours";
  v7[4] = @"1 day";
  v7[5] = @"7 days";
  v7[6] = @"30 days";
  double v4 = +[NSArray arrayWithObjects:v7 count:7];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)rowCount
{
  return 7;
}

@end