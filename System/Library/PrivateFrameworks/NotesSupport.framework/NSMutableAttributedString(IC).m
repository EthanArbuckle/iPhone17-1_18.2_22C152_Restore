@interface NSMutableAttributedString(IC)
- (void)ic_appendAttributedSubstring:()IC fromRange:;
- (void)ic_appendString:()IC;
- (void)ic_replaceCharactersInRange:()IC withAttributedSubstring:fromRange:;
@end

@implementation NSMutableAttributedString(IC)

- (void)ic_appendString:()IC
{
  id v5 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5];
  [a1 appendAttributedString:v4];
}

- (void)ic_replaceCharactersInRange:()IC withAttributedSubstring:fromRange:
{
  id v12 = a5;
  v13 = [v12 string];
  v14 = objc_msgSend(v13, "substringWithRange:", a6, a7);
  objc_msgSend(a1, "replaceCharactersInRange:withString:", a3, a4, v14);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __95__NSMutableAttributedString_IC__ic_replaceCharactersInRange_withAttributedSubstring_fromRange___block_invoke;
  v15[3] = &unk_2640CE0D0;
  v15[6] = a7;
  v15[7] = a3;
  v15[4] = a1;
  v15[5] = a6;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", a6, a7, 0x100000, v15);
}

- (void)ic_appendAttributedSubstring:()IC fromRange:
{
  id v8 = a3;
  objc_msgSend(a1, "ic_replaceCharactersInRange:withAttributedSubstring:fromRange:", objc_msgSend(a1, "length"), 0, v8, a4, a5);
}

@end