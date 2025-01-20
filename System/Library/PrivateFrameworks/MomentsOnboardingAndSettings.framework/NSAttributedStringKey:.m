@interface NSAttributedStringKey:
- (uint64_t)UIFont;
@end

@implementation NSAttributedStringKey:

- (uint64_t)UIFont
{
  return swift_release();
}

@end