@interface NSString(NTKMonogram)
- (uint64_t)ntk_containsOnlyValidMonogramCharacters;
- (uint64_t)ntk_isValidMonogram;
@end

@implementation NSString(NTKMonogram)

- (uint64_t)ntk_isValidMonogram
{
  if (![a1 length] || (unint64_t)objc_msgSend(a1, "length") > 5) {
    return 0;
  }

  return objc_msgSend(a1, "ntk_containsOnlyValidMonogramCharacters");
}

- (uint64_t)ntk_containsOnlyValidMonogramCharacters
{
  return [a1 _containsEmoji] ^ 1;
}

@end