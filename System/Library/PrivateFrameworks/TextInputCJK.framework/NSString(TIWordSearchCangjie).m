@interface NSString(TIWordSearchCangjie)
- (BOOL)containsCangjieWildcard;
@end

@implementation NSString(TIWordSearchCangjie)

- (BOOL)containsCangjieWildcard
{
  return [a1 rangeOfString:@"z" options:2] != 0x7FFFFFFFFFFFFFFFLL;
}

@end