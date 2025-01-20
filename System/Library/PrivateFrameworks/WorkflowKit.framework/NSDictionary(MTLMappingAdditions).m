@interface NSDictionary(MTLMappingAdditions)
+ (id)mtl_identityPropertyMapWithModel:()MTLMappingAdditions;
@end

@implementation NSDictionary(MTLMappingAdditions)

+ (id)mtl_identityPropertyMapWithModel:()MTLMappingAdditions
{
  if (([a3 conformsToProtocol:&unk_1F232D168] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = [NSString stringWithUTF8String:"+[NSDictionary(MTLMappingAdditions) mtl_identityPropertyMapWithModel:]"];
    [v8 handleFailureInFunction:v9, @"NSDictionary+MTLMappingAdditions.m", 16, @"Invalid parameter not satisfying: %@", @"[modelClass conformsToProtocol:@protocol(MTLModel)]" file lineNumber description];
  }
  v4 = [a3 propertyKeys];
  v5 = [v4 allObjects];

  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v5];

  return v6;
}

@end