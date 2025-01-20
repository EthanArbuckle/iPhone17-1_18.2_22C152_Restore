@interface UILabel(Truncation)
+ (uint64_t)px_isTruncatedForAttributedString:()Truncation forWidth:lines:;
- (BOOL)px_isTruncatedForWidth:()Truncation lines:;
@end

@implementation UILabel(Truncation)

- (BOOL)px_isTruncatedForWidth:()Truncation lines:
{
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  objc_msgSend(a1, "textRectForBounds:limitedToNumberOfLines:", *MEMORY[0x1E4F1DB28], v8, a2, 9.22337204e18);
  double v10 = v9;
  objc_msgSend(a1, "textRectForBounds:limitedToNumberOfLines:", a4 + 1, v7, v8, a2, 9.22337204e18);
  return v11 > v10;
}

+ (uint64_t)px_isTruncatedForAttributedString:()Truncation forWidth:lines:
{
  uint64_t v7 = px_isTruncatedForAttributedString_forWidth_lines__onceToken;
  id v8 = a4;
  if (v7 != -1) {
    dispatch_once(&px_isTruncatedForAttributedString_forWidth_lines__onceToken, &__block_literal_global_25036);
  }
  [(id)px_isTruncatedForAttributedString_forWidth_lines__label setAttributedText:v8];

  double v9 = (void *)px_isTruncatedForAttributedString_forWidth_lines__label;
  return objc_msgSend(v9, "px_isTruncatedForWidth:lines:", a5, a1);
}

@end