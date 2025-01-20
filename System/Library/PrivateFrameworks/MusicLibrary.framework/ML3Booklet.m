@interface ML3Booklet
+ (id)allProperties;
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (id)predisambiguatedProperties;
+ (int64_t)revisionTrackingCode;
@end

@implementation ML3Booklet

+ (id)allProperties
{
  if (allProperties___allPropertiesOnceToken != -1) {
    dispatch_once(&allProperties___allPropertiesOnceToken, &__block_literal_global_16097);
  }
  v2 = (void *)allProperties___ML3BookletAllProperties;

  return v2;
}

void __27__ML3Booklet_allProperties__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"booklet_pid";
  v2[1] = @"item_pid";
  v2[2] = @"name";
  v2[3] = @"store_item_id";
  v2[4] = @"redownload_params";
  v2[5] = @"file_size";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)allProperties___ML3BookletAllProperties;
  allProperties___ML3BookletAllProperties = v0;
}

+ (id)predisambiguatedProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ML3Booklet_predisambiguatedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predisambiguatedProperties___predisambiguatedPropertiesOnceToken != -1) {
    dispatch_once(&predisambiguatedProperties___predisambiguatedPropertiesOnceToken, block);
  }
  v2 = (void *)predisambiguatedProperties___ML3BookletPredisambiguatedPropertyForProperties;

  return v2;
}

void __40__ML3Booklet_predisambiguatedProperties__block_invoke(uint64_t a1)
{
  id v4 = [(id)objc_opt_class() allProperties];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [*(id *)(a1 + 32) predisambiguateProperties:v4 toDictionary:v2];
  v3 = (void *)predisambiguatedProperties___ML3BookletPredisambiguatedPropertyForProperties;
  predisambiguatedProperties___ML3BookletPredisambiguatedPropertyForProperties = (uint64_t)v2;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (int64_t)revisionTrackingCode
{
  return 12;
}

+ (id)databaseTable
{
  return @"booklet";
}

@end