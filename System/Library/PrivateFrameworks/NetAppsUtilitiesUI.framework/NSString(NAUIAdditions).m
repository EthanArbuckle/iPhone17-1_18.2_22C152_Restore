@interface NSString(NAUIAdditions)
- (BOOL)naui_containsCJKScripts;
@end

@implementation NSString(NAUIAdditions)

- (BOOL)naui_containsCJKScripts
{
  if (![a1 length]) {
    return 0;
  }
  unint64_t v2 = 0;
  do
  {
    [a1 characterAtIndex:v2];
    BOOL v3 = NAUIIsCJKCharacter();
    if (v3) {
      break;
    }
    ++v2;
  }
  while (v2 < [a1 length]);
  return v3;
}

@end