@interface ML3Account
+ (id)allProperties;
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (id)predisambiguatedProperties;
+ (void)initialize;
@end

@implementation ML3Account

+ (id)allProperties
{
  return (id)ML3AccountAllProperties;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3AccountPredisambiguatedPropertyForProperties;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (id)databaseTable
{
  return @"account";
}

+ (void)initialize
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v7[0] = @"dsid";
    v7[1] = @"alt_dsid";
    v7[2] = @"apple_id";
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
    v4 = (void *)ML3AccountAllProperties;
    ML3AccountAllProperties = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [a1 predisambiguateProperties:ML3AccountAllProperties toDictionary:v5];
    v6 = (void *)ML3AccountPredisambiguatedPropertyForProperties;
    ML3AccountPredisambiguatedPropertyForProperties = (uint64_t)v5;
  }
}

@end