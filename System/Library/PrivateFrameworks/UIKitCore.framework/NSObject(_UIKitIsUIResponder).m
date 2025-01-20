@interface NSObject(_UIKitIsUIResponder)
- (uint64_t)__isKindOfUIResponder;
@end

@implementation NSObject(_UIKitIsUIResponder)

- (uint64_t)__isKindOfUIResponder
{
  return 0;
}

@end