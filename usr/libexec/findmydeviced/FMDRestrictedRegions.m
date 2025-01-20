@interface FMDRestrictedRegions
+ (id)sharedInstance;
- (BOOL)isRestrictedLocationWithLatitude:(double)a3 longitude:(double)a4;
- (BOOL)isRestrictedSKU;
- (FMDRestrictedRegions)init;
- (GEOMapRegion)fineKoreaRegion;
- (NSMutableArray)regions;
- (NSMutableSet)sku;
- (NSString)currentDeviceSKURegion;
- (void)_setupRegions;
- (void)_setupSKUs;
- (void)setCurrentDeviceSKURegion:(id)a3;
- (void)setFineKoreaRegion:(id)a3;
- (void)setRegions:(id)a3;
- (void)setSku:(id)a3;
@end

@implementation FMDRestrictedRegions

+ (id)sharedInstance
{
  if (qword_10031EBB8 != -1) {
    dispatch_once(&qword_10031EBB8, &stru_1002DCCD0);
  }
  v2 = (void *)qword_10031EBB0;

  return v2;
}

- (FMDRestrictedRegions)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDRestrictedRegions;
  v2 = [(FMDRestrictedRegions *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(FMDRestrictedRegions *)v2 _setupRegions];
    [(FMDRestrictedRegions *)v3 _setupSKUs];
  }
  return v3;
}

- (BOOL)isRestrictedLocationWithLatitude:(double)a3 longitude:(double)a4
{
  v7 = +[FMSystemInfo sharedInstance];
  if ([v7 isInternalBuild])
  {
    unsigned __int8 v8 = +[FMPreferencesUtil BOOLForKey:@"simulateRestrictedRegionPresence" inDomain:kFMDNotBackedUpPrefDomain];

    if (v8) {
      return 1;
    }
  }
  else
  {
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = [(FMDRestrictedRegions *)self regions];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "containsCoordinate:", a3, a4))
        {
          v15 = [(FMDRestrictedRegions *)self fineKoreaRegion];
          unsigned __int8 v9 = [v15 containsCoordinate:a3, a4];

          goto LABEL_15;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v9 = 0;
LABEL_15:

  return v9;
}

- (void)_setupRegions
{
  v3 = +[NSMutableArray arrayWithCapacity:1];
  regions = self->_regions;
  self->_regions = v3;

  id v5 = objc_alloc_init((Class)GEOMapRegion);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [&off_1002F2E28 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(&off_1002F2E28);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = [v10 objectAtIndexedSubscript:1];
        [v11 doubleValue];
        double v13 = v12;

        v14 = [v10 objectAtIndexedSubscript:0];
        [v14 doubleValue];
        double v16 = v15;

        id v17 = [objc_alloc((Class)GEOLatLng) initWithLatitude:v13 longitude:v16];
        [v5 addVertex:v17];
      }
      id v7 = [&off_1002F2E28 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  long long v18 = [(FMDRestrictedRegions *)self regions];
  [v18 addObject:v5];
}

- (GEOMapRegion)fineKoreaRegion
{
  if (qword_10031EBC8 != -1) {
    dispatch_once(&qword_10031EBC8, &stru_1002DCCF0);
  }
  v2 = (void *)qword_10031EBC0;

  return (GEOMapRegion *)v2;
}

- (void)_setupSKUs
{
  v3 = +[NSMutableSet set];
  sku = self->_sku;
  self->_sku = v3;

  id v5 = self->_sku;

  [(NSMutableSet *)v5 addObject:@"KH"];
}

- (BOOL)isRestrictedSKU
{
  v3 = +[FMSystemInfo sharedInstance];
  if ([v3 isInternalBuild])
  {
    unsigned __int8 v4 = +[FMPreferencesUtil BOOLForKey:@"simulateRestrictedRegionPresence" inDomain:kFMDNotBackedUpPrefDomain];

    if (v4) {
      return 1;
    }
  }
  else
  {
  }
  id v6 = [(FMDRestrictedRegions *)self currentDeviceSKURegion];

  if (!v6)
  {
    id v7 = (void *)MGCopyAnswer();
    [(FMDRestrictedRegions *)self setCurrentDeviceSKURegion:v7];
  }
  uint64_t v8 = [(FMDRestrictedRegions *)self sku];
  unsigned __int8 v9 = [(FMDRestrictedRegions *)self currentDeviceSKURegion];
  unsigned __int8 v10 = [v8 containsObject:v9];

  return v10;
}

- (NSMutableArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
}

- (NSMutableSet)sku
{
  return self->_sku;
}

- (void)setSku:(id)a3
{
}

- (NSString)currentDeviceSKURegion
{
  return self->_currentDeviceSKURegion;
}

- (void)setCurrentDeviceSKURegion:(id)a3
{
}

- (void)setFineKoreaRegion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fineKoreaRegion, 0);
  objc_storeStrong((id *)&self->_currentDeviceSKURegion, 0);
  objc_storeStrong((id *)&self->_sku, 0);

  objc_storeStrong((id *)&self->_regions, 0);
}

@end