@interface WLInternal
+ (BOOL)isInternal;
@end

@implementation WLInternal

+ (BOOL)isInternal
{
  uint64_t v2 = [@"com.apple.welcomekit" UTF8String];

  return MEMORY[0x270EDAB48](v2);
}

@end