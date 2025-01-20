@interface NSDictionary(NNHeadlineSyncHelpers)
- (uint64_t)sync_NewsURLString;
- (uint64_t)sync_colorHexString;
- (uint64_t)sync_excerpt;
- (uint64_t)sync_expirationDate;
- (uint64_t)sync_headlineCount;
- (uint64_t)sync_headlines;
- (uint64_t)sync_identifier;
- (uint64_t)sync_name;
- (uint64_t)sync_publisherIdentifier;
- (uint64_t)sync_publisherLogoImageData;
- (uint64_t)sync_publisherName;
- (uint64_t)sync_sections;
- (uint64_t)sync_thumbnailImageData;
- (uint64_t)sync_title;
- (unint64_t)sync_type;
@end

@implementation NSDictionary(NNHeadlineSyncHelpers)

- (uint64_t)sync_expirationDate
{
  return [a1 objectForKeyedSubscript:@"sync_expirationDate"];
}

- (uint64_t)sync_sections
{
  return [a1 objectForKeyedSubscript:@"sync_sections"];
}

- (uint64_t)sync_headlineCount
{
  v1 = [a1 objectForKeyedSubscript:@"sync_headlineCount"];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)sync_identifier
{
  return [a1 objectForKeyedSubscript:@"sync_identifier"];
}

- (uint64_t)sync_name
{
  return [a1 objectForKeyedSubscript:@"sync_name"];
}

- (unint64_t)sync_type
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = [a1 objectForKeyedSubscript:@"sync_type"];
  unint64_t v2 = [v1 unsignedIntegerValue];

  if (v2 >= 6)
  {
    v3 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      unint64_t v6 = v2;
      _os_log_impl(&dword_22592C000, v3, OS_LOG_TYPE_INFO, "Unknown type %lu", (uint8_t *)&v5, 0xCu);
    }

    return 0;
  }
  return v2;
}

- (uint64_t)sync_title
{
  return [a1 objectForKeyedSubscript:@"sync_title"];
}

- (uint64_t)sync_excerpt
{
  return [a1 objectForKeyedSubscript:@"sync_excerpt"];
}

- (uint64_t)sync_headlines
{
  return [a1 objectForKeyedSubscript:@"sync_headlines"];
}

- (uint64_t)sync_publisherName
{
  return [a1 objectForKeyedSubscript:@"sync_publisherName"];
}

- (uint64_t)sync_publisherIdentifier
{
  return [a1 objectForKeyedSubscript:@"sync_publisherIdentifier"];
}

- (uint64_t)sync_colorHexString
{
  return [a1 objectForKeyedSubscript:@"sync_colorHexString"];
}

- (uint64_t)sync_thumbnailImageData
{
  return [a1 objectForKeyedSubscript:@"sync_thumbnailImageData"];
}

- (uint64_t)sync_publisherLogoImageData
{
  return [a1 objectForKeyedSubscript:@"sync_publisherLogoImageData"];
}

- (uint64_t)sync_NewsURLString
{
  return [a1 objectForKeyedSubscript:@"sync_NewsURLString"];
}

@end