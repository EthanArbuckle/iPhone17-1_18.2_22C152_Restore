@interface NSAttributedString(SCROAttributedStringExtras)
- (id)scrAttributedStringByTrimmingTrailingNewlines;
- (uint64_t)getRange:()SCROAttributedStringExtras ofAttribute:;
- (uint64_t)getRange:()SCROAttributedStringExtras ofAttribute:withValue:;
- (void)deepCopyWithZone:()SCROAttributedStringExtras;
@end

@implementation NSAttributedString(SCROAttributedStringExtras)

- (uint64_t)getRange:()SCROAttributedStringExtras ofAttribute:
{
  id v6 = a4;
  uint64_t v7 = [a1 length];
  long long v14 = 0uLL;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      v10 = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v6, v9, &v14, v9, v8);
      if (v10) {
        break;
      }
      uint64_t v11 = v9 + v8;
      uint64_t v9 = *((void *)&v14 + 1) + v14;
      uint64_t v8 = v11 - (*((void *)&v14 + 1) + v14);
      if (v11 == *((void *)&v14 + 1) + (void)v14) {
        goto LABEL_5;
      }
    }
    *a3 = v14;

    uint64_t v12 = 1;
  }
  else
  {
LABEL_5:
    uint64_t v12 = 0;
  }

  return v12;
}

- (uint64_t)getRange:()SCROAttributedStringExtras ofAttribute:withValue:
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a1 length];
  long long v18 = 0uLL;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while (1)
    {
      v13 = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v8, v12, &v18, v12, v11);
      long long v14 = v13;
      if (v13)
      {
        if ([v13 isEqual:v9]) {
          break;
        }
      }
      uint64_t v15 = *((void *)&v18 + 1) + v18;
      uint64_t v11 = v12 + v11 - (*((void *)&v18 + 1) + v18);

      uint64_t v12 = v15;
      if (!v11) {
        goto LABEL_6;
      }
    }
    *a3 = v18;

    uint64_t v16 = 1;
  }
  else
  {
LABEL_6:
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)deepCopyWithZone:()SCROAttributedStringExtras
{
  v2 = [a1 string];
  v3 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v2];
  uint64_t v4 = [v2 length];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  if (v4)
  {
    unint64_t v5 = v4;
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", v6, &v11, v6, v5 - v6);
      if (v7 && v12)
      {
        uint64_t v8 = [objc_alloc(NSDictionary) initWithDictionary:v7 copyItems:0];

        objc_msgSend(v3, "setAttributes:range:", v8, v11, v12);
        uint64_t v9 = v12;
        uint64_t v7 = (void *)v8;
      }
      else
      {
        uint64_t v9 = 1;
      }
      v6 += v9;
    }
    while (v6 < v5);
  }

  return v3;
}

- (id)scrAttributedStringByTrimmingTrailingNewlines
{
  v1 = (void *)[a1 mutableCopy];
  [v1 scrAttributedStringTrimTrailingNewlines];
  v2 = (void *)[v1 copy];

  return v2;
}

@end