@interface UIContentUnavailableButtonProperties(TTRIShim)
- (id)asTTRI;
@end

@implementation UIContentUnavailableButtonProperties(TTRIShim)

- (id)asTTRI
{
  return +[TTRIUIContentUnavailableShim instanceWrappingImpl:a1];
}

@end