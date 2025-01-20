@interface ICRadioStationMetadata
- (BOOL)allowsItemLiking;
- (BOOL)allowsSharing;
- (BOOL)containsVideo;
- (BOOL)isSubscriptionRequired;
- (ICRadioStationMetadata)initWithResponseDictionary:(id)a3;
- (ICRadioStationProviderResource)providerResource;
- (ICStoreArtworkInfo)artworkInfo;
- (NSString)attributionLabel;
- (NSString)coreSeedName;
- (NSString)descriptionText;
- (NSString)name;
- (NSString)stationHash;
- (NSString)stationStringID;
- (int64_t)stationID;
- (int64_t)subtype;
- (int64_t)type;
@end

@implementation ICRadioStationMetadata

- (void).cxx_destruct
{
}

- (BOOL)containsVideo
{
  return [(NSDictionary *)self->_responseDictionary ic_BOOLValueForKey:@"contains-video"];
}

- (ICRadioStationProviderResource)providerResource
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKeyedSubscript:@"provider-resource"];
  if (v2) {
    v3 = [[ICRadioStationProviderResource alloc] initWithRadioStationProviderResourceDictionary:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isSubscriptionRequired
{
  return [(NSDictionary *)self->_responseDictionary ic_BOOLValueForKey:@"requires-subscription"];
}

- (int64_t)subtype
{
  return [(NSDictionary *)self->_responseDictionary ic_intValueForKey:@"station-subtype"];
}

- (int64_t)type
{
  return [(NSDictionary *)self->_responseDictionary ic_intValueForKey:@"station-type"];
}

- (NSString)attributionLabel
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"attribution-label"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)stationStringID
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"radio-station-id"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)stationID
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"station-id"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSString)stationHash
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"station-hash"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)name
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"name"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)descriptionText
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"description"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)coreSeedName
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"core-seed-name"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (ICStoreArtworkInfo)artworkInfo
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"artwork"];
  if (v2) {
    id v3 = [[ICStoreArtworkInfo alloc] initWithArtworkResponseValue:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)allowsItemLiking
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"rules"];
  if (_NSIsNSDictionary())
  {
    id v3 = [v2 objectForKey:@"like-enabled"];
    if (objc_opt_respondsToSelector()) {
      char v4 = [v3 BOOLValue];
    }
    else {
      char v4 = 0;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)allowsSharing
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"rules"];
  if (_NSIsNSDictionary())
  {
    id v3 = [v2 objectForKey:@"sharing-enabled"];
    if (objc_opt_respondsToSelector()) {
      char v4 = [v3 BOOLValue];
    }
    else {
      char v4 = 0;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (ICRadioStationMetadata)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRadioStationMetadata;
  v5 = [(ICRadioStationMetadata *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end