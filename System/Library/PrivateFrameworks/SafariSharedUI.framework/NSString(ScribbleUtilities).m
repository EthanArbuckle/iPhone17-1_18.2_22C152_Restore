@interface NSString(ScribbleUtilities)
- (BOOL)safari_isLongEnoughToCheckSimilarity;
- (float)safari_similarityToString:()ScribbleUtilities;
- (uint64_t)safari_hasSimilarText:()ScribbleUtilities;
@end

@implementation NSString(ScribbleUtilities)

- (float)safari_similarityToString:()ScribbleUtilities
{
  id v4 = a3;
  float v5 = 0.0;
  if ([a1 length] && objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "_lp_similarityToString:", v4);
    float v5 = v6;
  }

  return v5;
}

- (BOOL)safari_isLongEnoughToCheckSimilarity
{
  return (unint64_t)[a1 length] > 0x13;
}

- (uint64_t)safari_hasSimilarText:()ScribbleUtilities
{
  id v4 = a3;
  if (![a1 length]) {
    goto LABEL_5;
  }
  if ((objc_msgSend(a1, "safari_isLongEnoughToCheckSimilarity") & 1) == 0)
  {
    uint64_t v6 = [a1 isEqualToString:v4];
    goto LABEL_7;
  }
  if ([v4 length])
  {
    objc_msgSend(a1, "safari_similarityToString:", v4);
    uint64_t v6 = v5 >= 0.65;
  }
  else
  {
LABEL_5:
    uint64_t v6 = 0;
  }
LABEL_7:

  return v6;
}

@end