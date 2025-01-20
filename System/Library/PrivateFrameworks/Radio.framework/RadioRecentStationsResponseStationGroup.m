@interface RadioRecentStationsResponseStationGroup
- (BOOL)isActive;
- (NSArray)stationDictionaries;
- (NSString)localizedTitle;
- (RadioRecentStationsResponseStationGroup)initWithResponseDictionary:(id)a3;
@end

@implementation RadioRecentStationsResponseStationGroup

- (void).cxx_destruct
{
}

- (NSArray)stationDictionaries
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"stations"];
  if ([v2 isNSArray])
  {
    if ([v2 count]) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)localizedTitle
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"title"];
  if ([v2 isNSString])
  {
    if ([v2 length]) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (BOOL)isActive
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"is-active"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (RadioRecentStationsResponseStationGroup)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(RadioRecentStationsResponseStationGroup *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end