@interface NSString(TSUDateFormatStringUtilities)
- (id)tsu_stringByReplacing2DigitYearStringWith4DigitYearString;
- (id)tsu_stringByReplacing4DigitYearStringWith2DigitYearString;
@end

@implementation NSString(TSUDateFormatStringUtilities)

- (id)tsu_stringByReplacing4DigitYearStringWith2DigitYearString
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"yyyy", @"yy", 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

- (id)tsu_stringByReplacing2DigitYearStringWith4DigitYearString
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"yy", @"yyyy", 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

@end