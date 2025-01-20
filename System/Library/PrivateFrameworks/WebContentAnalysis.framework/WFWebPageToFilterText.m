@interface WFWebPageToFilterText
- (BOOL)isWorthAnalyzingWithEvidence:(int *)a3 message:(id *)a4;
- (BOOL)selfRestricted;
- (id)URLFuzzyForFilter;
- (id)URLFuzzyWithWordLength:(int)a3;
- (id)rawPlainText;
@end

@implementation WFWebPageToFilterText

- (id)rawPlainText
{
  v3 = objc_opt_new();
  [v3 appendString:kWFWebPageToFilterText_Signature];
  [v3 appendString:@"\n"];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n%@\n", kWFWebPageToFilterText_AdWord, WFWebPageToTrainingText_Category1];
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_pageTitle, kWFWebPageToFilterText_Title, 15));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_tags, kWFWebPageToFilterText_Tags, 5));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_metaTagDescription, kWFWebPageToFilterText_Description, 10));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_metaTagKeywords, kWFWebPageToFilterText_Keywords, 10));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_imageAltsText, kWFWebPageToFilterText_ImageAlts));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_linkTitlesText, kWFWebPageToFilterText_LinkTitles));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_pageContent, kWFWebPageToFilterText_PageContent));
  return v3;
}

- (BOOL)isWorthAnalyzingWithEvidence:(int *)a3 message:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  *a4 = 0;
  id v7 = [(WFWebPageDecorator *)self pageContent];
  unint64_t v8 = [v7 length];
  if (v8 <= 0x3B
    && !objc_msgSend(-[WFWebPageDecorator images](self, "images"), "count")
    && (unint64_t)objc_msgSend(-[WFWebPageDecorator scriptBlocks](self, "scriptBlocks"), "count") <= 3
    && (unint64_t)objc_msgSend(-[WFWebPageDecorator metaTagKeywords](self, "metaTagKeywords"), "length") <= 4
    && (unint64_t)objc_msgSend(-[WFWebPageDecorator metaTagDescription](self, "metaTagDescription"), "length") <= 4)
  {
    v9 = objc_msgSend(v7, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"));
    v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v16 = [v7 length];
      __int16 v17 = 2048;
      uint64_t v18 = objc_msgSend(-[WFWebPageDecorator scriptBlocks](self, "scriptBlocks"), "count");
      _os_log_impl(&dword_217734000, v10, OS_LOG_TYPE_INFO, "Page not worth analyzing [pageContent length]:%lu [[self images] count]==0 [[self scriptBlocks] count]:%lu", buf, 0x16u);
    }
    if ((unint64_t)[v9 length] <= 0xF)
    {
      BOOL result = 0;
      *a3 = 5;
      v12 = @"too little content found";
      goto LABEL_20;
    }
  }
  if (![(WFWebPageDecorator *)self hasFrameset])
  {
    if (![(WFWebPageDecorator *)self hasShortRefresh]) {
      return 1;
    }
    if (v8 <= 0x7F)
    {
      *a3 = 7;
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"it has a short refresh (length:%lu)", v8);
      goto LABEL_15;
    }
    uint64_t v14 = [NSString stringWithFormat:@"it has a short refresh, but there is a lot of content! (length:%lu)", v8];
LABEL_19:
    v12 = (__CFString *)v14;
    BOOL result = 1;
    goto LABEL_20;
  }
  if (v8 > 0x7F)
  {
    uint64_t v14 = [NSString stringWithFormat:@"it has a frameset, but there is a lot of content! (length:%lu)", v8];
    goto LABEL_19;
  }
  *a3 = 6;
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"it has a frameset (length:%lu)", v8);
LABEL_15:
  v12 = (__CFString *)v11;
  BOOL result = 0;
LABEL_20:
  *a4 = v12;
  return result;
}

- (BOOL)selfRestricted
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(-[WFWebPageDecorator metaTagsLabeled](self, "metaTagsLabeled"), "objectForKey:", @"rating");
  if (v3 && ![v3 caseInsensitiveCompare:@"RTA-5042-1996-1400-1577-RTA"]) {
    return 1;
  }
  id v4 = [(WFWebPageDecorator *)self metaTagsUnlabeled];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      [v9 rangeOfString:@"SS~~" options:1];
      if (v10) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_5;
        }
        return 0;
      }
    }
    if (v9)
    {
      uint64_t v11 = (void *)[MEMORY[0x263F08B08] scannerWithString:v9];
      v12 = (void *)[MEMORY[0x263EFF9A0] dictionary];
      uint64_t v16 = 0;
      unsigned int v15 = 0;
      while (([v11 scanUpToString:@"SS~~" intoString:0] & 1) != 0
           || [v11 scanString:@"SS~~" intoString:0])
      {
        [v11 scanString:@"SS~~" intoString:0];
        if (![v11 scanUpToString:@" " intoString:&v16]
          || ![v11 scanInt:&v15])
        {
          break;
        }
        uint64_t v13 = [NSNumber numberWithInt:v15];
        [v12 setObject:v13 forKey:v16];
      }
      if ((int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"000"), "intValue") > 4
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"001"), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"002"), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"003"), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"004"), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"005"), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"007"), "intValue") > 4
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"008"), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"009"), "intValue") > 5
        || (int)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"00A"), "intValue") > 5)
      {
        return 1;
      }
    }
  }
  return 0;
}

- (id)URLFuzzyWithWordLength:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(WFWebPageDecorator *)self URLString];
  unint64_t v5 = [(NSString *)v4 length];
  if (v5 < (int)v3 + 7) {
    return &stru_26C7AC028;
  }
  if (v5 >= 0x1B) {
    uint64_t v7 = 20;
  }
  else {
    uint64_t v7 = v5 - 7;
  }
  uint64_t v8 = -[NSString substringWithRange:](v4, "substringWithRange:", 7, v7);
  return [(NSString *)v8 WF_fuzzyStringWithWordLength:v3];
}

- (id)URLFuzzyForFilter
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = 3;
  do
  {
    objc_msgSend(v3, "appendString:", -[WFWebPageToFilterText URLFuzzyWithWordLength:](self, "URLFuzzyWithWordLength:", v4));
    [v3 appendString:@"\n"];
    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 7);
  return v3;
}

@end