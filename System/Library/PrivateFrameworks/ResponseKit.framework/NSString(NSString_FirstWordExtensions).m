@interface NSString(NSString_FirstWordExtensions)
- (id)lowercaseFirstWordString;
- (id)uppercaseFirstWordString;
@end

@implementation NSString(NSString_FirstWordExtensions)

- (id)lowercaseFirstWordString
{
  v2 = [MEMORY[0x263F08708] punctuationCharacterSet];
  v3 = [v2 invertedSet];
  uint64_t v4 = [a1 rangeOfCharacterFromSet:v3];
  uint64_t v6 = v5;

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_msgSend(a1, "substringWithRange:", v4, v6);
    v8 = [v7 lowercaseString];
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v4, v6, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (![a1 isEqualToString:v9]) {
      goto LABEL_5;
    }
  }
  id v9 = a1;
LABEL_5:

  return v9;
}

- (id)uppercaseFirstWordString
{
  v2 = [MEMORY[0x263F08708] punctuationCharacterSet];
  v3 = [v2 invertedSet];
  uint64_t v4 = [a1 rangeOfCharacterFromSet:v3];
  uint64_t v6 = v5;

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_msgSend(a1, "substringWithRange:", v4, v6);
    v8 = [v7 uppercaseString];
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v4, v6, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (![a1 isEqualToString:v9]) {
      goto LABEL_5;
    }
  }
  id v9 = a1;
LABEL_5:

  return v9;
}

@end