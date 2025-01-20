@interface NSMutableAttributedString(SCRCMutableAttributedStringExtras)
- (id)attributedStringByTrimmingEmptySpaceEdges;
- (uint64_t)replaceOccurrencesOfString:()SCRCMutableAttributedStringExtras withString:;
- (void)appendString:()SCRCMutableAttributedStringExtras;
@end

@implementation NSMutableAttributedString(SCRCMutableAttributedStringExtras)

- (uint64_t)replaceOccurrencesOfString:()SCRCMutableAttributedStringExtras withString:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 mutableString];
  uint64_t v9 = objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, objc_msgSend(v8, "length"));

  return v9;
}

- (id)attributedStringByTrimmingEmptySpaceEdges
{
  v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v3 = [v2 invertedSet];

  v4 = [a1 string];
  uint64_t v5 = [v4 rangeOfCharacterFromSet:v3];
  uint64_t v7 = v6;

  v8 = [a1 string];
  uint64_t v9 = [v8 rangeOfCharacterFromSet:v3 options:4];
  uint64_t v11 = v10;

  if (v11) {
    uint64_t v12 = v9 + v11;
  }
  else {
    uint64_t v12 = [a1 length];
  }
  if (v7) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = objc_msgSend(a1, "attributedSubstringFromRange:", v13, v12 - v13);

  return v14;
}

- (void)appendString:()SCRCMutableAttributedStringExtras
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x263F086A0];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithString:v5];

    [a1 appendAttributedString:v6];
  }
}

@end