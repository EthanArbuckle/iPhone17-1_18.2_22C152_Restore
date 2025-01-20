@interface NSString(MNLPRExras)
- (id)mnlpr_componentsSeparatedByGlyph;
@end

@implementation NSString(MNLPRExras)

- (id)mnlpr_componentsSeparatedByGlyph
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "length"));
  if ([a1 length])
  {
    unint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = [a1 rangeOfComposedCharacterSequenceAtIndex:v3];
      if (!v5) {
        break;
      }
      uint64_t v6 = v4;
      uint64_t v7 = v5;
      v8 = objc_msgSend(a1, "substringWithRange:", v4, v5);
      [v2 addObject:v8];
      unint64_t v3 = v6 + v7;

      if (v3 >= [a1 length]) {
        goto LABEL_5;
      }
    }
    id v9 = 0;
  }
  else
  {
LABEL_5:
    id v9 = v2;
  }

  return v9;
}

@end