@interface NSString(CACHelpers)
- (id)cac_stringByCollapsingWhitespace;
- (id)cac_stringByFilteringPunctuation;
- (id)cac_stringByPreparingForAX;
@end

@implementation NSString(CACHelpers)

- (id)cac_stringByFilteringPunctuation
{
  if (cac_stringByFilteringPunctuation_onceToken != -1) {
    dispatch_once(&cac_stringByFilteringPunctuation_onceToken, &__block_literal_global_34);
  }
  v2 = [a1 componentsSeparatedByCharactersInSet:cac_stringByFilteringPunctuation___punctuationSet];
  v3 = [v2 componentsJoinedByString:&stru_26EB332F0];

  return v3;
}

- (id)cac_stringByCollapsingWhitespace
{
  if (cac_stringByCollapsingWhitespace_onceToken != -1) {
    dispatch_once(&cac_stringByCollapsingWhitespace_onceToken, &__block_literal_global_274_0);
  }
  v2 = objc_msgSend((id)cac_stringByCollapsingWhitespace___regex, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), @" ");
  v3 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

- (id)cac_stringByPreparingForAX
{
  v2 = [a1 stringByReplacingOccurrencesOfString:@"feat." withString:@"featuring"];
  v3 = [a1 stringByReplacingOccurrencesOfString:@"" withString:@"Apple"];

  v4 = objc_msgSend(v3, "cac_stringByFilteringPunctuation");

  v5 = objc_msgSend(v4, "cac_stringByCollapsingWhitespace");

  if ([v5 length])
  {
    v6 = objc_msgSend(v5, "substringWithRange:", 0, 1);
    v7 = [v6 uppercaseString];
    uint64_t v8 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", 0, 1, v7);

    v5 = (void *)v8;
  }
  return v5;
}

@end