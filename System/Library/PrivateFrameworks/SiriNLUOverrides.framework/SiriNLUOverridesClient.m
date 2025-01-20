@interface SiriNLUOverridesClient
+ (void)clearCache;
@end

@implementation SiriNLUOverridesClient

+ (void)clearCache
{
  [MEMORY[0x263F08AE8] resetCache];
  +[RegexOverrideCache reset];
}

@end