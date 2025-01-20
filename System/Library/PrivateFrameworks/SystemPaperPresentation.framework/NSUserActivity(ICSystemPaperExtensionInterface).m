@interface NSUserActivity(ICSystemPaperExtensionInterface)
+ (id)ic_userActivityWithData:()ICSystemPaperExtensionInterface;
@end

@implementation NSUserActivity(ICSystemPaperExtensionInterface)

+ (id)ic_userActivityWithData:()ICSystemPaperExtensionInterface
{
  v3 = (objc_class *)MEMORY[0x263F08D38];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] _initWithUserActivityData:v4];

  return v5;
}

@end