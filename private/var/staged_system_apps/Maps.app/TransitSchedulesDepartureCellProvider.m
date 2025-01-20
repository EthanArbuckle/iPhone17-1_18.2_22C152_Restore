@interface TransitSchedulesDepartureCellProvider
- (id)_identifierForDeparture:(id)a3;
- (id)collectionView:(id)a3 departureCellWithIdentifier:(id)a4 indexPath:(id)a5 referenceDate:(id)a6 dataProvider:(id)a7;
- (id)identifiersForDepartures:(id)a3;
- (void)collectionView:(id)a3 selectedDeparture:(id)a4 atIndexPath:(id)a5;
- (void)registerCellsForCollectionView:(id)a3;
@end

@implementation TransitSchedulesDepartureCellProvider

- (id)identifiersForDepartures:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[TransitSchedulesDepartureCellProvider _identifierForDeparture:](self, "_identifierForDeparture:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (id)_identifierForDeparture:(id)a3
{
  id v3 = a3;
  if ((char *)[v3 liveStatus] - 1 > (char *)1) {
    [v3 scheduledDepartureDate];
  }
  else {
  id v4 = [v3 liveDepartureDate];
  }
  id v5 = [v3 tripIdentifier];

  CFStringRef v6 = @"NA";
  if (v4) {
    CFStringRef v6 = v4;
  }
  id v7 = +[NSString stringWithFormat:@"%llu_%@", v5, v6];

  return v7;
}

- (void)registerCellsForCollectionView:(id)a3
{
  id v3 = a3;
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TransitSchedulesDepartureCollectionCellIdentifier"];
}

- (void)collectionView:(id)a3 selectedDeparture:(id)a4 atIndexPath:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = [v7 section];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v6 indexPathsForSelectedItems];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v14 section] == v8) {
          [v6 deselectItemAtIndexPath:v14 animated:0];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [v6 selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
}

- (id)collectionView:(id)a3 departureCellWithIdentifier:(id)a4 indexPath:(id)a5 referenceDate:(id)a6 dataProvider:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  id v12 = a5;
  v13 = [a3 dequeueReusableCellWithReuseIdentifier:@"TransitSchedulesDepartureCollectionCellIdentifier" forIndexPath:v12];
  id v14 = [v12 row];

  long long v15 = [v11 departures];
  id v16 = [v15 count];

  if (v14 < v16)
  {
    long long v17 = [v11 departures];
    long long v18 = [v17 objectAtIndexedSubscript:v14];

    v19 = [v11 timeZone];
    [v13 setDeparture:v18 withReferenceDate:v10 timeZone:v19 timeDisplayStyle:[v11 timeDisplayStyle]];
  }

  return v13;
}

@end