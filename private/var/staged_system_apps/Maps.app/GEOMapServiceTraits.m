@interface GEOMapServiceTraits
+ (void)addCommonKnownClientResolvedTypesIfAvailableWithClientTypeResolver:(id)a3 toTraits:(id)a4;
+ (void)addKnownClientResolvedTypesIfAvailable:(id)a3 clientTypeResolver:(id)a4 toTraits:(id)a5;
- (void)addKnownClientResolvedTypesIfAvailable:(id)a3 clientTypeResolver:(id)a4;
@end

@implementation GEOMapServiceTraits

+ (void)addCommonKnownClientResolvedTypesIfAvailableWithClientTypeResolver:(id)a3 toTraits:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [&off_1013ADD70 mutableCopy];
  v8 = +[MKLocationManager sharedLocationManager];
  if ([v8 isLocationServicesApproved]
    && [v8 isAuthorizedForPreciseLocation])
  {
    [v10 addObject:&off_1013A82F0];
  }
  if (GEOConfigGetBOOL()) {
    [v10 addObject:&off_1013A8308];
  }
  v9 = +[NSSet setWithArray:v10];
  [a1 addKnownClientResolvedTypesIfAvailable:v9 clientTypeResolver:v7 toTraits:v6];
}

+ (void)addKnownClientResolvedTypesIfAvailable:(id)a3 clientTypeResolver:(id)a4 toTraits:(id)a5
{
}

- (void)addKnownClientResolvedTypesIfAvailable:(id)a3 clientTypeResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v11) intValue];
        id v13 = v12;
        if ((v12 - 1) >= 6) {
          uint64_t v14 = 0;
        }
        else {
          uint64_t v14 = v12;
        }
        if ([v7 hasObjectWithType:v14]) {
          [(GEOMapServiceTraits *)self addKnownClientResolvedType:v13];
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

@end