@interface NSAttributedString(PKUIUtilities)
+ (id)pkui_attriutedStringWithString:()PKUIUtilities font:paragraphStyle:;
- (double)pkui_sizeThatFits:()PKUIUtilities withNumberOfLines:forceWordWrap:;
- (uint64_t)pkui_sizeThatFits:()PKUIUtilities;
- (uint64_t)pkui_sizeThatFits:()PKUIUtilities withNumberOfLines:;
@end

@implementation NSAttributedString(PKUIUtilities)

+ (id)pkui_attriutedStringWithString:()PKUIUtilities font:paragraphStyle:
{
  v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11 = v10;
  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  }
  if (v9) {
    [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
  }
  if (!v7) {
    v7 = &stru_1EF1B5B50;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v11];

  return v12;
}

- (uint64_t)pkui_sizeThatFits:()PKUIUtilities
{
  return objc_msgSend(a1, "pkui_sizeThatFits:withNumberOfLines:", 0);
}

- (uint64_t)pkui_sizeThatFits:()PKUIUtilities withNumberOfLines:
{
  return objc_msgSend(a1, "pkui_sizeThatFits:withNumberOfLines:forceWordWrap:", a3, 0);
}

- (double)pkui_sizeThatFits:()PKUIUtilities withNumberOfLines:forceWordWrap:
{
  if (a6)
  {
    id v10 = (void *)[a1 mutableCopy];
    uint64_t v11 = [a1 length];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__NSAttributedString_PKUIUtilities__pkui_sizeThatFits_withNumberOfLines_forceWordWrap___block_invoke;
    v18[3] = &unk_1E59CEDC8;
    id v12 = v10;
    id v19 = v12;
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, v18);
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4FB0860]);
  [v13 setMaximumNumberOfLines:a5];
  if (v12) {
    v14 = v12;
  }
  else {
    v14 = a1;
  }
  objc_msgSend(v14, "boundingRectWithSize:options:context:", 33, v13, a2, a3);
  PKFloatCeilToPixel();
  double v16 = fmin(v15, a2);
  PKFloatCeilToPixel();

  return v16;
}

@end