@interface ClocksSingleIntentHandler
- (id)allClocks;
- (id)clocksFromCities:(id)a3;
- (id)defaultCitiesForClocksSingle:(id)a3;
- (id)userConfiguredClocks;
- (void)getCitiesMatchingSearch:(id)a3 completionHandler:(id)a4;
- (void)handleClocksSingle:(id)a3 completion:(id)a4;
- (void)provideCitiesOptionsCollectionForClocksSingle:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
@end

@implementation ClocksSingleIntentHandler

- (void)provideCitiesOptionsCollectionForClocksSingle:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 length])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000016B4;
    v12[3] = &unk_1000041F0;
    id v13 = v8;
    [(ClocksSingleIntentHandler *)self getCitiesMatchingSearch:v7 completionHandler:v12];
  }
  else
  {
    id v9 = objc_alloc((Class)INObjectCollection);
    v10 = [(ClocksSingleIntentHandler *)self allClocks];
    id v11 = [v9 initWithItems:v10];

    [v11 setUsesIndexedCollation:1];
    (*((void (**)(id, id, void))v8 + 2))(v8, v11, 0);
  }
}

- (id)allClocks
{
  v3 = +[WorldClockManager sharedManager];
  v4 = [v3 allCities];
  v5 = [(ClocksSingleIntentHandler *)self clocksFromCities:v4];

  return v5;
}

- (id)clocksFromCities:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000188C;
  v7[3] = &unk_100004218;
  id v8 = (id)objc_opt_new();
  id v4 = v8;
  [v3 enumerateObjectsUsingBlock:v7];

  id v5 = [v4 copy];
  return v5;
}

- (id)defaultCitiesForClocksSingle:(id)a3
{
  id v4 = +[WorldClockManager sharedManager];
  id v5 = [v4 citiesMatchingIdentifiers:&off_100004398];
  v6 = [(ClocksSingleIntentHandler *)self clocksFromCities:v5];

  return v6;
}

- (void)getCitiesMatchingSearch:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  v6 = (void (**)(id, void *, void))a4;
  id v7 = [(ClocksSingleIntentHandler *)self allClocks];
  if ([v11 length])
  {
    id v8 = +[WorldClockManager sharedManager];
    id v9 = [v8 citiesMatchingName:v11];
    v10 = [(ClocksSingleIntentHandler *)self clocksFromCities:v9];

    v6[2](v6, v10, 0);
  }
  else
  {
    v6[2](v6, v7, 0);
  }
}

- (id)userConfiguredClocks
{
  id v3 = +[WorldClockManager sharedManager];
  id v4 = [v3 cities];
  id v5 = [(ClocksSingleIntentHandler *)self clocksFromCities:v4];

  return v5;
}

- (void)handleClocksSingle:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v34 = (void (**)(id, id))a4;
  v38 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v35 = v5;
  id obj = [v5 cities];
  id v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v41;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v40 + 1) + 8 * i);
        id v8 = objc_alloc((Class)MTWorldClock);
        id v9 = [v7 identifier];
        v10 = [v7 displayString];
        id v11 = [v8 initWithIdentifier:v9 displayString:v10];

        v12 = [v7 displayString];
        [v11 setCity:v12];

        id v13 = [v7 timeZoneName];

        [v11 setTimeZoneName:v13];
        v14 = [v11 timeZoneName];
        v15 = +[NSTimeZone timeZoneWithName:v14];

        v16 = +[NSTimeZone systemTimeZone];
        v17 = +[NSDate date];
        v18 = [v15 secondsFromGMTForDate:v17];
        uint64_t v19 = v18 - (unsigned char *)[v16 secondsFromGMTForDate:v17];
        v20 = +[MTUtilities dayAndTimeZoneOffsetStringFromDate:v17 withTimeZoneOffset:v19 timeZoneAbbreviation:0 spaceBeforeTimeDesignator:0 hoursOnly:0 numericOnly:0];
        [v11 setSubtitleString:v20];
        v21 = +[NSNumber numberWithInteger:v18];
        [v11 setTimeZoneOffsetFromGMT:v21];

        v22 = +[NSNumber numberWithInteger:v19];
        [v11 setTimeZoneOffset:v22];

        v23 = [v15 abbreviation];
        [v11 setTimeZoneAbbreviation:v23];

        id v24 = [v15 isDaylightSavingTime];
        v25 = +[NSNumber numberWithBool:v24];
        [v11 setIsDaylightSavingTime:v25];

        if (v24) {
          uint64_t v26 = 2;
        }
        else {
          uint64_t v26 = 0;
        }
        v27 = objc_msgSend(v15, "localizedName:locale:", v26, 0, v34);
        [v11 setTimeZoneDisplayName:v27];

        v28 = [v17 dateByAddingTimeInterval:(double)v19];
        v29 = +[NSCalendar currentCalendar];
        v30 = [v29 components:252 fromDate:v28];

        v31 = +[NSCalendar currentCalendar];
        v32 = [v31 components:224 fromDate:v28];

        [v11 setCurrentDate:v30];
        [v11 setCurrentTime:v32];

        [v38 addObject:v11];
      }
      id v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v39);
  }

  id v33 = [objc_alloc((Class)ClocksSingleIntentResponse) initWithCode:4 userActivity:0];
  [v33 setClocks:v38];
  v34[2](v34, v33);
}

@end