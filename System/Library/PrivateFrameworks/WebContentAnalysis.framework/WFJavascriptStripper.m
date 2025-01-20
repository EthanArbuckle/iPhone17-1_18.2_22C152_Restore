@interface WFJavascriptStripper
+ (id)getJavascriptLines:(id)a3;
+ (id)getStringsFromLine:(id)a3 withTokenCharacter:(id)a4;
+ (id)javascriptStripLine:(id)a3;
+ (id)stripJavascript:(id)a3;
@end

@implementation WFJavascriptStripper

+ (id)getStringsFromLine:(id)a3 withTokenCharacter:(id)a4
{
  v6 = objc_opt_new();
  uint64_t v7 = [a3 length];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = v7;
    do
    {
      uint64_t v11 = objc_msgSend(a3, "rangeOfString:options:range:", a4, 0, v9, v10);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v13 = v11;
      uint64_t v14 = v11 + v12;
      uint64_t v15 = objc_msgSend(a3, "rangeOfString:options:range:", a4, 0, v11 + v12, v8 - (v11 + v12));
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v17 = v15;
      uint64_t v18 = v16;
      [v6 appendFormat:@"%@,", objc_msgSend(a3, "substringWithRange:", v14, v15 - (v16 + v13))];
      uint64_t v9 = v17 + v18;
      uint64_t v10 = v8 - (v17 + v18);
    }
    while (v8 != v17 + v18);
  }
  return v6;
}

+ (id)javascriptStripLine:(id)a3
{
  uint64_t v5 = [a1 getStringsFromLine:a3 withTokenCharacter:@"\""];
  uint64_t v6 = [a1 getStringsFromLine:a3 withTokenCharacter:@"'"];
  return (id)[NSString stringWithFormat:@"%@%@", v5, v6];
}

+ (id)getJavascriptLines:(id)a3
{
  v4 = objc_opt_new();
  uint64_t v5 = (void *)[a3 componentsSeparatedByString:@";"];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", i), "componentsSeparatedByString:", @"\n"));
  }
  return v4;
}

+ (id)stripJavascript:(id)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_msgSend(a1, "getJavascriptLines:", +[WFPostprocessor lightweightStripHTMLTags:](WFPostprocessor, "lightweightStripHTMLTags:", a3));
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = objc_msgSend(a1, "javascriptStripLine:", objc_msgSend(v6, "objectAtIndex:", v7));
      if ([v8 length])
      {
        [v5 appendString:v8];
        [v5 appendString:@"\n"];
      }
      ++v7;
    }
    while ([v6 count] > v7);
  }
  return v5;
}

@end