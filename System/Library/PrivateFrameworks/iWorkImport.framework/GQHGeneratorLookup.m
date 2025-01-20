@interface GQHGeneratorLookup
+ (Class)generatorForApplication:(int)a3;
@end

@implementation GQHGeneratorLookup

+ (Class)generatorForApplication:(int)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return (Class)objc_opt_class();
  }
}

@end