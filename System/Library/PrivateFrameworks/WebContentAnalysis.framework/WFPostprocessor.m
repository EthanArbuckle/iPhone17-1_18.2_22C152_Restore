@interface WFPostprocessor
+ (_NSRange)rangeOfFirstHTMLTag:(id)a3 searchRange:(_NSRange)a4;
+ (id)adultWebSiteTagging:(id)a3;
+ (id)lightweightStripHTMLTags:(id)a3;
+ (id)lightweightStripHTMLTagsForLine:(id)a3;
+ (id)normalizeStrippedHTML:(id)a3;
+ (id)postprocessPlainTextWebPage:(id)a3;
@end

@implementation WFPostprocessor

+ (_NSRange)rangeOfFirstHTMLTag:(id)a3 searchRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = [a3 length];
  uint64_t v8 = objc_msgSend(a3, "rangeOfString:options:range:", @"<", 0, location, length);
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v8;
    uint64_t v12 = objc_msgSend(a3, "rangeOfString:options:range:", @">", 0, v8 + v9, v7 - (v8 + v9));
    uint64_t v14 = v12 - v11;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v14 = 0;
    }
    NSUInteger v9 = v14 + v13;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v10 = v11;
    }
  }
  NSUInteger v15 = v10;
  result.NSUInteger length = v9;
  result.NSUInteger location = v15;
  return result;
}

+ (id)postprocessPlainTextWebPage:(id)a3
{
  id v3 = +[WFPostprocessor normalizeStrippedHTML:](WFPostprocessor, "normalizeStrippedHTML:", +[WFPostprocessor lightweightStripHTMLTags:a3]);
  v4 = objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"));
  return (id)[v4 componentsJoinedByString:&stru_26C7AC028];
}

+ (id)lightweightStripHTMLTagsForLine:(id)a3
{
  v5 = objc_opt_new();
  unint64_t v6 = [a3 length];
  if (v6 >= 2)
  {
    unint64_t v7 = v6;
    uint64_t v8 = 0;
    unint64_t v9 = v6;
    while (1)
    {
      uint64_t v10 = objc_msgSend(a1, "rangeOfFirstHTMLTag:searchRange:", a3, v8, v9);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      objc_msgSend(v5, "appendString:", objc_msgSend(a3, "substringWithRange:", v8, v10 - v8));
      [v5 appendString:@" "];
      uint64_t v8 = v12 + v13;
      unint64_t v9 = v7 - (v12 + v13);
      if (v9 <= 1) {
        goto LABEL_7;
      }
    }
    objc_msgSend(v5, "appendString:", objc_msgSend(a3, "substringWithRange:", v8, v9));
  }
LABEL_7:
  return v5;
}

+ (id)lightweightStripHTMLTags:(id)a3
{
  v5 = objc_opt_new();
  unint64_t v6 = (void *)[a3 componentsSeparatedByString:@"\n"];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      objc_msgSend(v5, "appendString:", objc_msgSend(a1, "lightweightStripHTMLTagsForLine:", objc_msgSend(v6, "objectAtIndex:", i)));
      [v5 appendString:@"\n"];
    }
  }
  return v5;
}

+ (id)normalizeStrippedHTML:(id)a3
{
  id v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "WF_stringByReplacingString:withString:", @"_", @" "), "WF_stringByReplacingString:withString:", @"-", @" "), "WF_stringByReplacingString:withString:", @"<", @" ");
  return (id)objc_msgSend(v3, "WF_stringByReplacingString:withString:", @">", @" ");
}

+ (id)adultWebSiteTagging:(id)a3
{
  id v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "WF_stringByReplacingString:withString:", @"2257", @"TwoTwoFiveSeven (2257)"), "WF_stringByReplacingString:withString:", @"U.S.C", @"UnitedStatesCode(U S C)"), "WF_stringByReplacingString:withString:", @"USC", @"UnitedStatesCode (U S C)");
  return (id)objc_msgSend(v3, "WF_stringByReplacingString:withString:", @"18", @"OneEight");
}

@end