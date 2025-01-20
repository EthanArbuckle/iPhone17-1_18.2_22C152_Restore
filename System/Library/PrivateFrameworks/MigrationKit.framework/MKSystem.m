@interface MKSystem
+ (id)version;
@end

@implementation MKSystem

+ (id)version
{
  v2 = (void *)_CFCopySystemVersionDictionary();
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];

  return v3;
}

@end