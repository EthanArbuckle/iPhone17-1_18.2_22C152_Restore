@interface NSString(Extras)
- (id)URLScheme;
- (id)stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets;
@end

@implementation NSString(Extras)

- (id)stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets
{
  v2 = (void *)[a1 mutableCopy];
  int v3 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
         0,
         0,
         [v2 length]);
  int v4 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
         0,
         0,
         [v2 length])
     + v3;
  if (v4
     + objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
                       0,
                       0,
                       [v2 length]))
  {
    v5 = v2;
  }
  else
  {
    v5 = a1;
  }
  id v6 = v5;

  return v6;
}

- (id)URLScheme
{
  uint64_t v2 = [a1 rangeOfString:@":"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v3 = 0;
  }
  else
  {
    int v3 = [a1 substringToIndex:v2];
  }
  return v3;
}

@end