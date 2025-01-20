@interface GeoPlaceCacheDetailTableViewController
- (GeoPlaceCacheDetailTableViewController)initWithGEORequestCounterCacheResults:(id)a3;
- (id)_nonZeroTotalsForSection:(int64_t)a3;
- (id)_totalsForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
@end

@implementation GeoPlaceCacheDetailTableViewController

- (GeoPlaceCacheDetailTableViewController)initWithGEORequestCounterCacheResults:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)GeoPlaceCacheDetailTableViewController;
  v5 = [(GeoPlaceCacheDetailTableViewController *)&v36 initWithStyle:1];
  if (v5)
  {
    uint64_t v6 = +[NSOrderedSet orderedSetWithArray:&off_1013AE058];
    displayOrder = v5->_displayOrder;
    v26 = v5;
    v5->_displayOrder = (NSOrderedSet *)v6;

    v31 = +[NSMutableDictionary dictionary];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v27 = v4;
    id obj = v4;
    id v30 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v33;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v10 = [v9 requestType];
          if (v10 >= 0x3F)
          {
            v11 = +[NSString stringWithFormat:@"(unknown: %i)", v10];
          }
          else
          {
            v11 = off_1012FA520[(int)v10];
          }
          id v12 = [v31 objectForKeyedSubscript:v11];
          if (!v12)
          {
            v37[0] = &off_1013A8D70;
            v37[1] = &off_1013A8D88;
            v38[0] = &off_1013A8DB8;
            v38[1] = &off_1013A8DB8;
            v37[2] = &off_1013A8DA0;
            v38[2] = &off_1013A8DB8;
            v13 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
            id v12 = [v13 mutableCopy];

            [v31 setObject:v12 forKeyedSubscript:v11];
          }
          v14 = [v12 objectForKeyedSubscript:&off_1013A8D70];
          v15 = [NSNumber numberWithUnsignedInteger:((char *)[v14 unsignedIntegerValue] + [v9 cacheHitCount])];
          [v12 setObject:v15 forKeyedSubscript:&off_1013A8D70];

          v16 = [v12 objectForKeyedSubscript:&off_1013A8D88];
          v17 = [NSNumber numberWithUnsignedInteger:((char *)[v16 unsignedIntegerValue] + [v9 cacheMissCount])];
          [v12 setObject:v17 forKeyedSubscript:&off_1013A8D88];

          v18 = [v12 objectForKeyedSubscript:&off_1013A8DA0];
          v19 = [NSNumber numberWithUnsignedInteger:((char *)[v18 unsignedIntegerValue] + [v9 cacheExpiredCount])];
          [v12 setObject:v19 forKeyedSubscript:&off_1013A8DA0];
        }
        id v30 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v30);
    }

    v20 = (NSDictionary *)[v31 copy];
    v5 = v26;
    totalsDict = v26->_totalsDict;
    v26->_totalsDict = v20;

    v22 = [v31 allKeys];
    v23 = [v22 sortedArrayUsingSelector:"compare:"];

    if (v23)
    {
      v24 = +[NSOrderedSet orderedSetWithArray:v23];
    }
    else
    {
      v24 = 0;
    }
    objc_storeStrong((id *)&v26->_orderedKeys, v24);
    id v4 = v27;
    if (v23) {
  }
    }
  return v5;
}

- (id)_totalsForSection:(int64_t)a3
{
  id v4 = [(NSOrderedSet *)self->_orderedKeys objectAtIndexedSubscript:a3];
  v5 = [(NSDictionary *)self->_totalsDict objectForKeyedSubscript:v4];

  return v5;
}

- (id)_nonZeroTotalsForSection:(int64_t)a3
{
  id v5 = [(NSOrderedSet *)self->_displayOrder mutableCopy];
  uint64_t v6 = [(GeoPlaceCacheDetailTableViewController *)self _totalsForSection:a3];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008403F4;
  v9[3] = &unk_1012FA500;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSOrderedSet *)self->_orderedKeys count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(GeoPlaceCacheDetailTableViewController *)self _nonZeroTotalsForSection:a4];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(NSOrderedSet *)self->_orderedKeys objectAtIndexedSubscript:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:@"reuseIdentifier"];
  }
  [v7 setSelectionStyle:0];
  v8 = -[GeoPlaceCacheDetailTableViewController _nonZeroTotalsForSection:](self, "_nonZeroTotalsForSection:", [v6 section]);
  v9 = [v8 objectAtIndexedSubscript:[v6 row]];
  id v10 = 0;
  unsigned __int8 v11 = [v9 unsignedIntegerValue] - 1;
  if (v11 <= 2u) {
    id v10 = off_1012FA718[(char)v11];
  }
  id v12 = [v6 section];

  v13 = [(GeoPlaceCacheDetailTableViewController *)self _totalsForSection:v12];
  v14 = [v13 objectForKeyedSubscript:v9];
  id v15 = [v14 unsignedIntegerValue];

  v16 = [v7 textLabel];
  [v16 setText:v10];

  v17 = +[NSString stringWithFormat:@"%lu", v15];
  v18 = [v7 detailTextLabel];
  [v18 setText:v17];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_totalsDict, 0);

  objc_storeStrong((id *)&self->_displayOrder, 0);
}

@end