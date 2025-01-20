@interface NSString(UIKitAdditions)
- (id)_uikit_unescapedQueryValue;
- (id)queryKeysAndValues;
@end

@implementation NSString(UIKitAdditions)

- (id)_uikit_unescapedQueryValue
{
  v1 = [a1 stringByRemovingPercentEncoding];
  v2 = (void *)[v1 mutableCopy];

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"+", @" ", 2, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)queryKeysAndValues
{
  int v2 = [a1 length];
  v3 = 0;
  int v4 = v2;
  if (v2)
  {
    unsigned int v5 = v2 - 1;
    if (v2 != 1)
    {
      v3 = 0;
      uint64_t v6 = 0;
      do
      {
        uint64_t v7 = [a1 rangeOfString:@"=" options:2 range:v6];
        uint64_t v8 = (v7 + 1);
        if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 > v5) {
          break;
        }
        uint64_t v10 = (v4 - v8);
        uint64_t v11 = objc_msgSend(a1, "rangeOfString:options:range:", @"&", 2, v8, v10);
        uint64_t v12 = v11;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v10 = v11 - v8;
        }
        uint64_t v13 = v7 - v6;
        if (v13 && v10)
        {
          if (!v3)
          {
            v3 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          v14 = objc_msgSend(a1, "substringWithRange:", v6, v13);
          v15 = [v14 lowercaseString];

          v16 = objc_msgSend(a1, "substringWithRange:", v8, v10);
          v17 = objc_msgSend(v16, "_uikit_unescapedQueryValue");

          if ([v15 length] && objc_msgSend(v17, "length")) {
            [v3 setObject:v17 forKey:v15];
          }
        }
        if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v6 = (v12 + 1);
      }
      while (v6 < v5);
    }
  }
  return v3;
}

@end