@interface UIImage(StatusBarImageProvider)
- (uint64_t)isFromStatusBarImageProvider;
@end

@implementation UIImage(StatusBarImageProvider)

- (uint64_t)isFromStatusBarImageProvider
{
  return objc_opt_isKindOfClass() & 1;
}

@end