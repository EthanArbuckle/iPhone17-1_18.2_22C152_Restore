@interface _PGBundle
+ (id)bundle;
@end

@implementation _PGBundle

+ (id)bundle
{
  return (id)[MEMORY[0x1E4F28B50] bundleForClass:a1];
}

@end