@interface UIContentUnavailableTextProperties(TTRIShim)
- (id)asTTRI;
@end

@implementation UIContentUnavailableTextProperties(TTRIShim)

- (id)asTTRI
{
  return +[TTRIUIContentUnavailableShim instanceWrappingImpl:a1];
}

@end