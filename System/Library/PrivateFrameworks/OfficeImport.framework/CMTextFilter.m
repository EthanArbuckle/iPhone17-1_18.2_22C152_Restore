@interface CMTextFilter
+ (id)convertLineBreaksToParagraphBreaks:(id)a3;
+ (id)convertToVericalString:(id)a3;
+ (id)covertFormatString:(id)a3;
+ (id)filterHyperlinkField:(id)a3;
+ (id)filterSpecialCodes:(id)a3;
+ (id)filterToPreserveMultipleWhiteSpaces:(id)a3;
- (CMTextFilter)init;
@end

@implementation CMTextFilter

+ (id)filterHyperlinkField:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"HYPERLINK"];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = v4;
    v8 = [MEMORY[0x263F089D8] stringWithString:v3];
    objc_msgSend(v8, "deleteCharactersInRange:", v7, v6);
    objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"\", &stru_26EBF24D8, 2, 0, objc_msgSend(v8, "length""));
    v9 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v10 = objc_msgSend(v8, "oi_rangeOfCharactersFromSet:index:", v9, 0);
    uint64_t v12 = v11;

    if (v12 && !v10) {
      objc_msgSend(v8, "deleteCharactersInRange:", 0, v12);
    }
    if ((unint64_t)[v8 length] < 2)
    {
      id v6 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v14 = objc_msgSend(v8, "oi_rangeOfCharactersFromSet:index:", v13, 0);
    uint64_t v16 = v15;

    if (v16 && v10 == [v8 length] - v16) {
      objc_msgSend(v8, "deleteCharactersInRange:", v14, v16);
    }
    if ([v8 hasPrefix:@"\\l "])
    {
      v17 = @"\\l ";
      uint64_t v18 = 3;
    }
    else
    {
      if (![v8 hasPrefix:@"\\l"])
      {
LABEL_15:
        id v6 = v8;
        goto LABEL_16;
      }
      v17 = @"\\l";
      uint64_t v18 = 2;
    }
    objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", v17, @"#", 2, 0, v18);
    goto LABEL_15;
  }
LABEL_17:

  return v6;
}

+ (id)convertLineBreaksToParagraphBreaks:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v3];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%c", 10);
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%c", 13);
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", v5, v6, 2, 0, objc_msgSend(v4, "length"));

  return v4;
}

+ (id)convertToVericalString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  for (unsigned int i = 0; [v3 length] > (unint64_t)i; ++i)
  {
    uint64_t v6 = [v3 characterAtIndex:i];
    uint64_t v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    int v8 = [v7 characterIsMember:v6];

    if (v8) {
      uint64_t v9 = 160;
    }
    else {
      uint64_t v9 = v6;
    }
    objc_msgSend(v4, "appendFormat:", @"%C\r", v9);
  }

  return v4;
}

- (CMTextFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMTextFilter;
  return [(CMTextFilter *)&v3 init];
}

+ (id)covertFormatString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F089D8] stringWithString:v3];
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\", &stru_26EBF24D8, 2, 0, objc_msgSend(v3, "length""));

  return v4;
}

+ (id)filterSpecialCodes:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v3];
  unint64_t v5 = [v3 length];
  if (v5)
  {
    for (unint64_t i = 0; i < v5; ++i)
    {
      int v7 = [v4 characterAtIndex:i];
      if (v7 > 2027)
      {
        if (v7 != 2028)
        {
          if (v7 == 61607 || v7 == 61623)
          {
            objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, @"&bull;");
            v5 += 5;
          }
          continue;
        }
      }
      else if ((v7 - 10) >= 5)
      {
        if (v7 == 9)
        {
          objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, @"<span style=\"padding-left:36;\">&#x200b;</span>");
          v5 += 45;
        }
        continue;
      }
      objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, @"<br/>");
      v5 += 4;
    }
  }

  return v4;
}

+ (id)filterToPreserveMultipleWhiteSpaces:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v3];
  unint64_t v5 = [NSString stringWithFormat:@" &nbsp;"];
  while (objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"  ", v5, 2, 0, objc_msgSend(v4, "length")));

  return v4;
}

@end