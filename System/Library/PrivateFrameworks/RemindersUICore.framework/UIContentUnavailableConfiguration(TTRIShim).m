@interface UIContentUnavailableConfiguration(TTRIShim)
- (id)asTTRI;
@end

@implementation UIContentUnavailableConfiguration(TTRIShim)

- (id)asTTRI
{
  return +[TTRIUIContentUnavailableShim instanceWrappingImpl:a1];
}

@end