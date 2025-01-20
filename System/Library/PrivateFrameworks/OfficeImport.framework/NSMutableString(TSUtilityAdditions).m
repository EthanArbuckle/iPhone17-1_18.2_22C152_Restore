@interface NSMutableString(TSUtilityAdditions)
- (uint64_t)tsu_appendSeparator:()TSUtilityAdditions format:;
- (void)tsu_appendCharacter:()TSUtilityAdditions;
- (void)tsu_insertCharacter:()TSUtilityAdditions atIndex:;
@end

@implementation NSMutableString(TSUtilityAdditions)

- (void)tsu_appendCharacter:()TSUtilityAdditions
{
  UniChar chars = a3;
  CFStringAppendCharacters(a1, &chars, 1);
}

- (void)tsu_insertCharacter:()TSUtilityAdditions atIndex:
{
  id v6 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%C", a3);
  [a1 insertString:v6 atIndex:a4];
}

- (uint64_t)tsu_appendSeparator:()TSUtilityAdditions format:
{
  if ([a1 length]) {
    [a1 appendString:a3];
  }
  return [a1 appendString:objc_msgSend(NSString, "tsu_stringWithFormat:arguments:", a4, &a9)];
}

@end