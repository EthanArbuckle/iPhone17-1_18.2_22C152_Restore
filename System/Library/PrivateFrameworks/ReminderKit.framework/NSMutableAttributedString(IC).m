@interface NSMutableAttributedString(IC)
- (void)ic_appendAttributedSubstring:()IC fromRange:;
- (void)ic_replaceCharactersInRange:()IC withAttributedSubstring:fromRange:;
@end

@implementation NSMutableAttributedString(IC)

- (void)ic_appendAttributedSubstring:()IC fromRange:
{
  id v8 = a3;
  objc_msgSend(a1, "ic_replaceCharactersInRange:withAttributedSubstring:fromRange:", objc_msgSend(a1, "length"), 0, v8, a4, a5);
}

- (void)ic_replaceCharactersInRange:()IC withAttributedSubstring:fromRange:
{
  id v12 = a5;
  v13 = [v12 string];
  v14 = objc_msgSend(v13, "substringWithRange:", a6, a7);
  objc_msgSend(a1, "replaceCharactersInRange:withString:", a3, a4, v14);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__NSMutableAttributedString_IC__ic_replaceCharactersInRange_withAttributedSubstring_fromRange___block_invoke;
  v15[3] = &unk_1E61DE488;
  v15[6] = a7;
  v15[7] = a3;
  v15[4] = a1;
  v15[5] = a6;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", a6, a7, 0x100000, v15);
}

@end