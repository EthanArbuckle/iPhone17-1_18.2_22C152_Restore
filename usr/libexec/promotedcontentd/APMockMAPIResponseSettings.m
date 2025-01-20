@interface APMockMAPIResponseSettings
+ (id)storageWithDefaultValues:(id)a3;
- (NSArray)contentDataObjects;
- (id)_parseContentDataJson:(id)a3;
@end

@implementation APMockMAPIResponseSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APSettingsStorageUserDefaults) initWithDefaultValues:v3];

  return v4;
}

- (NSArray)contentDataObjects
{
  id v3 = [(APMockMAPIResponseSettings *)self responseJson];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 dataUsingEncoding:4];
    id v21 = 0;
    v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v21];
    id v7 = v21;

    id v8 = 0;
    if (!v7)
    {
      if ([v6 count])
      {
        id v9 = objc_alloc_init((Class)NSMutableArray);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = v6;
        id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = -[APMockMAPIResponseSettings _parseContentDataJson:](self, "_parseContentDataJson:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
              if (v15) {
                [v9 addObject:v15];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
          }
          while (v12);
        }

        id v8 = [v9 copy];
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return (NSArray *)v8;
}

- (id)_parseContentDataJson:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)APContentData);
  id v5 = objc_alloc_init((Class)APRepresentationData);
  v6 = [v3 objectForKeyedSubscript:@"ttl"];
  id v7 = [v6 integerValue];

  id v8 = +[NSDate now];
  id v9 = [v8 dateByAddingTimeInterval:(double)(uint64_t)v7];
  [v4 setExpirationDate:v9];

  id v10 = [v3 objectForKeyedSubscript:@"adamId"];
  [v5 setAdamID:v10];

  id v11 = objc_alloc((Class)NSUUID);
  id v12 = [v3 objectForKeyedSubscript:@"impressionId"];
  id v13 = [v11 initWithUUIDString:v12];
  [v5 setImpressionID:v13];

  v14 = [v3 objectForKeyedSubscript:@"metadata"];
  [v5 setMetadata:v14];

  v15 = [v3 objectForKeyedSubscript:@"journeyRelayAdGroupId"];
  [v5 setJourneyRelayAdGroupId:v15];

  v16 = [v3 objectForKeyedSubscript:@"journeyRelayCampaignId"];
  [v5 setJourneyRelayCampaignId:v16];

  long long v17 = [v3 objectForKeyedSubscript:@"parentAppCheckEnabled"];
  [v5 setParentAppCheckEnabled:[v17 BOOLValue]];

  long long v18 = [v3 objectForKeyedSubscript:@"rank"];
  [v5 setRank:[v18 integerValue]];

  id v19 = objc_alloc((Class)NSUUID);
  long long v20 = [v3 objectForKeyedSubscript:@"iAdId"];

  id v21 = [v19 initWithUUIDString:v20];
  [v5 setIAdID:v21];

  [v5 setInstallAttribution:&__NSDictionary0__struct];
  [v5 setPlacementType:5];
  [v4 addRepresentation:v5];

  return v4;
}

@end