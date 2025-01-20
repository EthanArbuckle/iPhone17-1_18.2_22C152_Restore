@interface AMSBag(VUIAdditions)
+ (uint64_t)vui_defaultBag;
@end

@implementation AMSBag(VUIAdditions)

+ (uint64_t)vui_defaultBag
{
  return [MEMORY[0x1E4F4DBD8] bagForProfile:@"TVApp" profileVersion:@"1"];
}

@end