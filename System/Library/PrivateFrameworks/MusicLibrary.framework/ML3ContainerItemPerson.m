@interface ML3ContainerItemPerson
+ (id)allProperties;
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (id)predisambiguatedProperties;
+ (int64_t)revisionTrackingCode;
+ (void)initialize;
@end

@implementation ML3ContainerItemPerson

+ (id)allProperties
{
  return (id)ML3ContainerItemPersonAllProperties;
}

+ (id)predisambiguatedProperties
{
  return (id)ML3ContainerItemPersonPredisambiguatedPropertyForProperties;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (int64_t)revisionTrackingCode
{
  return 11;
}

+ (id)databaseTable
{
  return @"container_item_person";
}

+ (void)initialize
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v7[0] = @"container_item_person_pid";
    v7[1] = @"container_item_pid";
    v7[2] = @"person_pid";
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
    v4 = (void *)ML3ContainerItemPersonAllProperties;
    ML3ContainerItemPersonAllProperties = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [a1 predisambiguateProperties:ML3ContainerItemPersonAllProperties toDictionary:v5];
    v6 = (void *)ML3ContainerItemPersonPredisambiguatedPropertyForProperties;
    ML3ContainerItemPersonPredisambiguatedPropertyForProperties = (uint64_t)v5;
  }
}

@end