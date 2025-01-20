@interface UIApplication(ApplicationDelegate)
+ (uint64_t)px_sharedApplication;
@end

@implementation UIApplication(ApplicationDelegate)

+ (uint64_t)px_sharedApplication
{
  return [MEMORY[0x1E4FB1438] sharedApplication];
}

@end