@interface RadioRecentStationsResponse
- (NSArray)stationDictionaries;
- (NSArray)stationGroups;
- (RadioRecentStationsResponse)initWithResponseDictionary:(id)a3;
@end

@implementation RadioRecentStationsResponse

- (void).cxx_destruct
{
}

- (NSArray)stationGroups
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"station-groups"];
  if ([v2 isNSArray])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      v6 = 0;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v9, "isNSDictionary", (void)v12))
          {
            v10 = [[RadioRecentStationsResponseStationGroup alloc] initWithResponseDictionary:v9];
            if (v10)
            {
              if (!v6) {
                v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
              }
              [v6 addObject:v10];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (NSArray)stationDictionaries
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"stations"];
  if ([v2 isNSArray])
  {
    if ([v2 count]) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = v3;

  return v4;
}

- (RadioRecentStationsResponse)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RadioRecentStationsResponse *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end