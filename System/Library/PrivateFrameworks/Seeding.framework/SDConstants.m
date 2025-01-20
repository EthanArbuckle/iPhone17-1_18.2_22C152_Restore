@interface SDConstants
+ (void)initialize;
@end

@implementation SDConstants

+ (void)initialize
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"DisableBuildFiltering"];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 registerDefaults:v3];
}

@end