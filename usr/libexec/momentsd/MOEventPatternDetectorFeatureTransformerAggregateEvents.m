@interface MOEventPatternDetectorFeatureTransformerAggregateEvents
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorFeatureTransformerAggregateEvents)init;
- (id)transformFeaturesFromEvents:(id)a3 withFeatures:(id)a4;
@end

@implementation MOEventPatternDetectorFeatureTransformerAggregateEvents

- (MOEventPatternDetectorFeatureTransformerAggregateEvents)init
{
  v8.receiver = self;
  v8.super_class = (Class)MOEventPatternDetectorFeatureTransformerAggregateEvents;
  v2 = [(MOEventPatternDetectorFeatureTransformerAggregateEvents *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_aggregationWindow = 16;
    v4 = (NSCalendar *)[objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    currentCalendar = v3->_currentCalendar;
    v3->_currentCalendar = v4;

    v6 = v3;
  }

  return v3;
}

- (id)transformFeaturesFromEvents:(id)a3 withFeatures:(id)a4
{
  id v5 = a3;
  id v40 = a4;
  v36 = objc_opt_new();
  v39 = objc_opt_new();
  v38 = objc_opt_new();
  if ([v5 count])
  {
    unint64_t v6 = 0;
    id v37 = v5;
    do
    {
      v7 = [v5 objectAtIndex:v6];
      objc_super v8 = [v40 objectAtIndex:v6];
      if ([v7 count])
      {
        v44 = objc_opt_new();
        v43 = objc_opt_new();
        v9 = [v7 firstObject];
        v10 = [v9 startDate];
        v11 = [v10 dateByAddingTimeInterval:-10800.0];

        v12 = [v8 firstObject];
        [v12 doubleValue];
        double v14 = v13;

        unint64_t v41 = v6;
        if ([v7 count])
        {
          unint64_t v15 = 0;
          do
          {
            if ((unint64_t)[v7 count] <= v15 + 1) {
              goto LABEL_12;
            }
            currentCalendar = self->_currentCalendar;
            v16 = [v7 objectAtIndex:v15 + 1];
            v17 = [v16 endDate];
            [v17 dateByAddingTimeInterval:-10800.0];
            v18 = v9;
            v20 = v19 = v8;
            unsigned int v21 = [(NSCalendar *)currentCalendar isDate:v11 equalToDate:v20 toUnitGranularity:self->_aggregationWindow];

            objc_super v8 = v19;
            v9 = v18;

            if (v21)
            {
              v22 = [v8 objectAtIndex:v15 + 1];
              [v22 doubleValue];
              double v24 = v23;

              unint64_t aggregationType = self->_aggregationType;
              if (aggregationType == 1)
              {
                if (v24 > v14)
                {
                  uint64_t v33 = [v7 objectAtIndex:v15 + 1];

                  v9 = (void *)v33;
                  double v14 = v24;
                }
              }
              else if (!aggregationType)
              {
                double v14 = v14 + v24;
              }
            }
            else
            {
LABEL_12:
              v26 = +[NSNumber numberWithDouble:v14];
              [v44 addObject:v26];

              [v43 addObject:v9];
              if ((unint64_t)[v7 count] > v15 + 1)
              {
                v27 = [v7 objectAtIndex:v15 + 1];
                v28 = [v27 startDate];
                uint64_t v29 = [v28 dateByAddingTimeInterval:-10800.0];

                uint64_t v30 = [v7 objectAtIndex:v15 + 1];

                v31 = [v8 objectAtIndex:v15 + 1];
                [v31 doubleValue];
                double v14 = v32;

                v9 = (void *)v30;
                v11 = (void *)v29;
              }
            }
            ++v15;
          }
          while ((unint64_t)[v7 count] > v15);
        }
        [v38 addObject:v44];
        [v39 addObject:v43];

        id v5 = v37;
        unint64_t v6 = v41;
      }

      ++v6;
    }
    while ((unint64_t)[v5 count] > v6);
  }
  v34 = v36;
  [v36 addObject:v39];
  [v34 addObject:v38];

  return v34;
}

- (BOOL)configure:(id)a3
{
  id v5 = a3;
  id v6 = [v5 count];
  if (v6)
  {
    v7 = [v5 objectForKey:@"AggregationWindow"];

    if (v7)
    {
      objc_super v8 = [v5 objectForKey:@"AggregationWindow"];
      self->_aggregationWindow = (unint64_t)v8;
    }
    else
    {
      v9 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:](@"AggregationWindow", v9);
      }
    }
    v10 = [v5 objectForKey:@"AggregationType"];

    if (!v10)
    {
      double v13 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:](@"AggregationType", v13);
      }
      goto LABEL_14;
    }
    v11 = [v5 objectForKey:@"AggregationType"];
    self->_unint64_t aggregationType = [v11 unsignedIntValue];

    if (self->_aggregationType >= 2)
    {
      v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:]((uint64_t *)&self->_aggregationType, v12);
      }

      double v13 = +[NSAssertionHandler currentHandler];
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOEventPatternDetectorFeatureTransformerAggregateEvents.m", 108, @"Unknown Aggregation Type : %lu (in %s:%d)", self->_aggregationType, "-[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:]", 108);
LABEL_14:
    }
  }

  return v6 != 0;
}

- (void).cxx_destruct
{
}

- (void)configure:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Configuration property not set for AggregateEvents: %@", (uint8_t *)&v2, 0xCu);
}

- (void)configure:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134218498;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  id v6 = "-[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:]";
  __int16 v7 = 1024;
  int v8 = 108;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown Aggregation Type : %lu (in %s:%d)", (uint8_t *)&v3, 0x1Cu);
}

@end