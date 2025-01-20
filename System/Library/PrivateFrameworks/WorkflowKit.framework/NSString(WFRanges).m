@interface NSString(WFRanges)
- (id)allRangesOfString:()WFRanges options:;
@end

@implementation NSString(WFRanges)

- (id)allRangesOfString:()WFRanges options:
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = objc_msgSend(a1, "rangeOfString:options:range:", v6, a4, 0, objc_msgSend(a1, "length"));
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    do
    {
      v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v10, v11);
      [v7 addObject:v12];

      uint64_t v10 = objc_msgSend(a1, "rangeOfString:options:range:", v6, a4, v10 + v11, objc_msgSend(a1, "length") - (v10 + v11));
      uint64_t v11 = v13;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v7;
}

@end