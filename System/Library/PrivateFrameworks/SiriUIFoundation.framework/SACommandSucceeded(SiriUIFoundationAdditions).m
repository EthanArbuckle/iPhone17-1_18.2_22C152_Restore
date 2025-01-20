@interface SACommandSucceeded(SiriUIFoundationAdditions)
+ (id)sruif_commandSucceededWithRefId:()SiriUIFoundationAdditions;
@end

@implementation SACommandSucceeded(SiriUIFoundationAdditions)

+ (id)sruif_commandSucceededWithRefId:()SiriUIFoundationAdditions
{
  v3 = (objc_class *)MEMORY[0x263F64830];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setRefId:v4];

  return v5;
}

@end