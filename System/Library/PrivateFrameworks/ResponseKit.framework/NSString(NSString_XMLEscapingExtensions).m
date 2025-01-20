@interface NSString(NSString_XMLEscapingExtensions)
- (id)stringByEscapingXMLEntities;
- (id)stringByUnescapingXMLEntities;
@end

@implementation NSString(NSString_XMLEscapingExtensions)

- (id)stringByEscapingXMLEntities
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\", @"&quot;"",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"'", @"&#39;",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
    2,
    0,
    [v1 length]);

  return v1;
}

- (id)stringByUnescapingXMLEntities
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&amp;",
    @"&",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&quot;",
    @"\"",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&#39;",
    @"'",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&lt;",
    @"<",
    2,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&gt;",
    @">",
    2,
    0,
    [v1 length]);

  return v1;
}

@end