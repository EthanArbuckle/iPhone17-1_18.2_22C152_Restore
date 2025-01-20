@interface NSString(MTUIString)
+ (uint64_t)mtui_daySettingString:()MTUIString options:;
@end

@implementation NSString(MTUIString)

+ (uint64_t)mtui_daySettingString:()MTUIString options:
{
  return MEMORY[0x270F4B3C0](a3, a4 & 1, (a4 >> 1) & 1, (a4 >> 2) & 1, 0);
}

@end