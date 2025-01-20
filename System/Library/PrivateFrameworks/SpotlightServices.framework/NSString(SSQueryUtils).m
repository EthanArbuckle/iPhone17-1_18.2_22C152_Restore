@interface NSString(SSQueryUtils)
- (id)escapedStringForSearchQuery;
@end

@implementation NSString(SSQueryUtils)

- (id)escapedStringForSearchQuery
{
  v1 = [a1 decomposedStringWithCanonicalMapping];
  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v3 = [v1 stringByTrimmingCharactersInSet:v2];
  v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\\\", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"'", @"\\'", 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"*", @"\\*", 0, 0, objc_msgSend(v4, "length"));
  return v4;
}

@end