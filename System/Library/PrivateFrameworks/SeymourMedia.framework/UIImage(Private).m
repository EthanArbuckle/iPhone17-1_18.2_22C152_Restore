@interface UIImage(Private)
+ (uint64_t)smm_systemImageNamed:()Private;
+ (uint64_t)smm_systemImageNamed:()Private withConfiguration:;
@end

@implementation UIImage(Private)

+ (uint64_t)smm_systemImageNamed:()Private withConfiguration:
{
  return objc_msgSend(MEMORY[0x263F827E8], "_systemImageNamed:withConfiguration:");
}

+ (uint64_t)smm_systemImageNamed:()Private
{
  return objc_msgSend(MEMORY[0x263F827E8], "_systemImageNamed:");
}

@end