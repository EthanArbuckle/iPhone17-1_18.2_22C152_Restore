@interface TransitRouteAttributesBuilder
- (RoutePlanningTiming)timing;
- (TransitPreferences)preferences;
- (TransitRouteAttributesBuilder)initWithTransitPreferences:(id)a3 timing:(id)a4;
- (void)fillRouteAttributes:(id)a3;
@end

@implementation TransitRouteAttributesBuilder

- (TransitRouteAttributesBuilder)initWithTransitPreferences:(id)a3 timing:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransitRouteAttributesBuilder;
  v9 = [(TransitRouteAttributesBuilder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preferences, a3);
    objc_storeStrong((id *)&v10->_timing, a4);
  }

  return v10;
}

- (void)fillRouteAttributes:(id)a3
{
  id v4 = a3;
  [v4 setMainTransportType:1];
  [v4 setRoutePointTypeForTransportType:[v4 mainTransportType]];
  long long v9 = 0uLL;
  uint64_t v10 = 0;
  timing = self->_timing;
  if (timing)
  {
    [(RoutePlanningTiming *)timing timepoint];
    if ((~BYTE4(v10) & 6) == 0)
    {
      long long v7 = v9;
      uint64_t v8 = v10;
      [v4 setTimepoint:&v7];
    }
  }
  v6 = [(TransitPreferences *)self->_preferences transitOptions];
  [v4 setTransitOptions:v6];
}

- (TransitPreferences)preferences
{
  return self->_preferences;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timing, 0);

  objc_storeStrong((id *)&self->_preferences, 0);
}

@end