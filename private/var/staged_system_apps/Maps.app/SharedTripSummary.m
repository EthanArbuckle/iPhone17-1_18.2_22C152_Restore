@interface SharedTripSummary
+ (id)summaryWithSharedTrips:(id)a3;
- (NSArray)sharedTrips;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (id)_transportTypeStringForAnalytics;
- (void)setSharedTrips:(id)a3;
- (void)updateModel:(id)a3;
@end

@implementation SharedTripSummary

- (void)updateModel:(id)a3
{
  id v4 = a3;
  v5 = [(SharedTripSummary *)self title];
  [v4 setFirstLine:v5];

  id v6 = [(SharedTripSummary *)self subtitle];
  [v4 setSecondLine:v6];
}

+ (id)summaryWithSharedTrips:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setSharedTrips:v4];

  return v5;
}

- (NSString)title
{
  v3 = [(SharedTripSummary *)self sharedTrips];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    id v5 = [(SharedTripSummary *)self sharedTrips];
    id v6 = [v5 firstObject];

    v7 = [v6 homeCellTitle];
  }
  else
  {
    v8 = +[NSBundle mainBundle];
    id v6 = [v8 localizedStringForKey:@"Shared Trip Format [Cell, Title]", @"localized string not found", 0 value table];

    v9 = [(SharedTripSummary *)self sharedTrips];
    v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, [v9 count]);
  }

  return (NSString *)v7;
}

- (NSString)subtitle
{
  v3 = [(SharedTripSummary *)self sharedTrips];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    id v5 = [(SharedTripSummary *)self sharedTrips];
    id v6 = [v5 firstObject];

    v7 = [v6 homeCellSubtitle];
  }
  else
  {
    id v8 = objc_alloc((Class)NSMutableArray);
    v9 = [(SharedTripSummary *)self sharedTrips];
    id v10 = [v8 initWithCapacity:[v9 count]];

    id v11 = objc_alloc((Class)NSMutableSet);
    v12 = [(SharedTripSummary *)self sharedTrips];
    id v13 = [v11 initWithCapacity:[v12 count]];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v14 = [(SharedTripSummary *)self sharedTrips];
    id v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v20 = [v19 senderInfo];
          v21 = [v20 fromIdentifier];

          if (([v13 containsObject:v21] & 1) == 0)
          {
            [v13 addObject:v21];
            v22 = [v19 senderInfo];
            v23 = [v22 localName];
            [v10 addObject:v23];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }

    id v24 = [v10 count];
    v25 = +[NSBundle mainBundle];
    v26 = v25;
    if (v24 == (id)1)
    {
      v27 = [v25 localizedStringForKey:@"Shared Trips Cell Subtitle Format String (one sender, multiple routes)", @"localized string not found", 0 value table];

      v28 = [v10 firstObject];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v4, v28);
    }
    else
    {
      v27 = [v25 localizedStringForKey:@"Shared Trips Cell Subtitle Format String (multiple sender, multiple routes)", @"localized string not found", 0 value table];

      uint64_t v29 = [v10 count] - 1;
      v28 = [v10 firstObject];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v29, v28);
    v7 = };
  }

  return (NSString *)v7;
}

- (NSArray)sharedTrips
{
  return self->_sharedTrips;
}

- (void)setSharedTrips:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)_transportTypeStringForAnalytics
{
  v2 = [(SharedTripSummary *)self sharedTrips];
  v3 = sub_100099700(v2, &stru_1012F7EE8);

  id v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  v2 = [(SharedTripSummary *)self sharedTrips];
  v3 = [v2 valueForKey:@"groupIdentifier"];
  id v4 = +[NSString stringWithFormat:@"SharedTripSummary-%@", v3];

  return (NSString *)v4;
}

@end