@interface NSAttributedStringKey:
- (uint64_t)Any;
@end

@implementation NSAttributedStringKey:

- (uint64_t)Any
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

@end