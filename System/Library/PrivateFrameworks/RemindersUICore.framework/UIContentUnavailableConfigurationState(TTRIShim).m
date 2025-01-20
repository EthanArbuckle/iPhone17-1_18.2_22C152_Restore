@interface UIContentUnavailableConfigurationState(TTRIShim)
- (id)asTTRI;
@end

@implementation UIContentUnavailableConfigurationState(TTRIShim)

- (id)asTTRI
{
  return +[TTRIUIContentUnavailableShim instanceWrappingImpl:a1];
}

@end