@interface NSObject(_UIKitIsUIViewController)
- (uint64_t)__isKindOfUIViewController;
@end

@implementation NSObject(_UIKitIsUIViewController)

- (uint64_t)__isKindOfUIViewController
{
  return 0;
}

@end