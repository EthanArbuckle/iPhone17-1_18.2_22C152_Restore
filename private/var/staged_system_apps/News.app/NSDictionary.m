@interface NSDictionary
- (NSArray)sync_headlines;
- (NSArray)sync_sections;
- (NSData)sync_publisherLogoImageData;
- (NSData)sync_thumbnailImageData;
- (NSDate)sync_expirationDate;
- (NSString)sync_NewsURLString;
- (NSString)sync_colorHexString;
- (NSString)sync_excerpt;
- (NSString)sync_identifier;
- (NSString)sync_name;
- (NSString)sync_publisherIdentifier;
- (NSString)sync_publisherName;
- (NSString)sync_title;
- (unint64_t)sync_headlineCount;
- (unint64_t)sync_type;
@end

@implementation NSDictionary

- (NSDate)sync_expirationDate
{
  return (NSDate *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_expirationDate"];
}

- (NSArray)sync_sections
{
  return (NSArray *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_sections"];
}

- (unint64_t)sync_headlineCount
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"sync_headlineCount"];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (NSString)sync_identifier
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_identifier"];
}

- (NSString)sync_name
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_name"];
}

- (unint64_t)sync_type
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"sync_type"];
  id v3 = [v2 unsignedIntegerValue];

  if ((unint64_t)v3 >= 6)
  {
    v4 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unknown type %lu", (uint8_t *)&v6, 0xCu);
    }

    return 0;
  }
  return (unint64_t)v3;
}

- (NSString)sync_title
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_title"];
}

- (NSString)sync_excerpt
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_excerpt"];
}

- (NSArray)sync_headlines
{
  return (NSArray *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_headlines"];
}

- (NSString)sync_publisherName
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_publisherName"];
}

- (NSString)sync_publisherIdentifier
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_publisherIdentifier"];
}

- (NSString)sync_colorHexString
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_colorHexString"];
}

- (NSData)sync_thumbnailImageData
{
  return (NSData *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_thumbnailImageData"];
}

- (NSData)sync_publisherLogoImageData
{
  return (NSData *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_publisherLogoImageData"];
}

- (NSString)sync_NewsURLString
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"sync_NewsURLString"];
}

@end