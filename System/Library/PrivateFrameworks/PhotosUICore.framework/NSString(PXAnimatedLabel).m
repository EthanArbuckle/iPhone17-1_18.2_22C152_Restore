@interface NSString(PXAnimatedLabel)
- (BOOL)containsDigits;
- (id)stringByRemovingDigits;
- (uint64_t)digits;
- (uint64_t)rangeOfDigits;
@end

@implementation NSString(PXAnimatedLabel)

- (uint64_t)digits
{
  if (![a1 containsDigits]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v2 = [a1 rangeOfDigits];
  v4 = objc_msgSend(a1, "substringWithRange:", v2, v3);
  uint64_t v5 = [v4 integerValue];

  return v5;
}

- (id)stringByRemovingDigits
{
  id v1 = a1;
  if ([v1 containsDigits])
  {
    uint64_t v2 = [v1 rangeOfDigits];
    uint64_t v4 = objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", v2, v3, &stru_1F00B0030);

    id v1 = (id)v4;
  }
  return v1;
}

- (BOOL)containsDigits
{
  return [a1 rangeOfDigits] != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)rangeOfDigits
{
  return [a1 rangeOfString:@"\\d+" options:1024];
}

@end