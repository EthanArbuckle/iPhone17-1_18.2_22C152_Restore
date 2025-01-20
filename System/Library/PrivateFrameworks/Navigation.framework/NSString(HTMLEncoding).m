@interface NSString(HTMLEncoding)
- (id)_navigation_sanitizedStringForDisplayInHTML;
- (id)_navigation_stringByEscapingHTML;
- (id)_navigation_stringByReplacingNewLinesWithString:()HTMLEncoding;
@end

@implementation NSString(HTMLEncoding)

- (id)_navigation_stringByEscapingHTML
{
  v1 = [a1 stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"\" withString:@"&quot;""];

  v3 = [v2 stringByReplacingOccurrencesOfString:@"'" withString:@"&#39;"];

  v4 = [v3 stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];

  v5 = [v4 stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];

  v6 = [v5 stringByReplacingOccurrencesOfString:@"—" withString:@"&mdash;"];

  return v6;
}

- (id)_navigation_stringByReplacingNewLinesWithString:()HTMLEncoding
{
  v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  v6 = [v4 newlineCharacterSet];
  v7 = [a1 componentsSeparatedByCharactersInSet:v6];
  v8 = [v7 componentsJoinedByString:v5];

  return v8;
}

- (id)_navigation_sanitizedStringForDisplayInHTML
{
  v1 = objc_msgSend(a1, "_navigation_stringByEscapingHTML");
  v2 = objc_msgSend(v1, "_navigation_stringByReplacingNewLinesWithString:", @"<br>");

  return v2;
}

@end