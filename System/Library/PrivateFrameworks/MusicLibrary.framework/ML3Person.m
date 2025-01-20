@interface ML3Person
+ (id)allProperties;
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (id)predisambiguatedProperties;
+ (int64_t)revisionTrackingCode;
+ (void)initialize;
@end

@implementation ML3Person

+ (id)allProperties
{
  return (id)ML3PersonAllProperties;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3PersonPredisambiguatedPropertyForProperties;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (int64_t)revisionTrackingCode
{
  return 10;
}

+ (id)databaseTable
{
  return @"person";
}

+ (void)initialize
{
  v7[7] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v7[0] = @"person_pid";
    v7[1] = @"cloud_id";
    v7[2] = @"handle";
    v7[3] = @"name";
    v7[4] = @"image_url";
    v7[5] = @"image_token";
    v7[6] = @"lightweight_profile";
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
    v4 = (void *)ML3PersonAllProperties;
    ML3PersonAllProperties = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [a1 predisambiguateProperties:ML3PersonAllProperties toDictionary:v5];
    v6 = (void *)ML3PersonPredisambiguatedPropertyForProperties;
    ML3PersonPredisambiguatedPropertyForProperties = (uint64_t)v5;
  }
}

@end