@interface MFAuthScheme
+ (id)schemeWithName:(id)a3;
@end

@implementation MFAuthScheme

+ (id)schemeWithName:(id)a3
{
  v3 = [MEMORY[0x1E4F607C8] schemeWithName:a3];
  return v3;
}

@end