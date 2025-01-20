@interface ML3DatabaseMetadata
+ (id)allProperties;
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (id)predisambiguatedProperties;
+ (void)initialize;
@end

@implementation ML3DatabaseMetadata

+ (id)allProperties
{
  return (id)ML3DatabaseMetadataAllProperties;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3DatabaseMetadataPredisambiguatedPropertyForProperties;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (id)databaseTable
{
  return @"db_info";
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"audio_language", @"subtitle_language", @"genius_cuid", @"primary_container_pid", 0);
    v4 = (void *)ML3DatabaseMetadataAllProperties;
    ML3DatabaseMetadataAllProperties = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [a1 predisambiguateProperties:ML3DatabaseMetadataAllProperties toDictionary:v5];
    v6 = (void *)ML3DatabaseMetadataPredisambiguatedPropertyForProperties;
    ML3DatabaseMetadataPredisambiguatedPropertyForProperties = (uint64_t)v5;
  }
}

@end