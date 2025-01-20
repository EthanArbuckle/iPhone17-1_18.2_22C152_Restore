@interface ML3ContainerItem
+ (id)databaseTable;
+ (id)defaultOrderingTerms;
+ (int64_t)revisionTrackingCode;
+ (void)initialize;
@end

@implementation ML3ContainerItem

+ (id)defaultOrderingTerms
{
  return (id)ML3ContainerItemDefaultOrderingTerms;
}

+ (int64_t)revisionTrackingCode
{
  return 9;
}

+ (id)databaseTable
{
  return @"container_item";
}

+ (void)initialize
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[ML3OrderingTerm orderingTermWithProperty:@"position"];
    v5[0] = v2;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    v4 = (void *)ML3ContainerItemDefaultOrderingTerms;
    ML3ContainerItemDefaultOrderingTerms = v3;
  }
}

@end