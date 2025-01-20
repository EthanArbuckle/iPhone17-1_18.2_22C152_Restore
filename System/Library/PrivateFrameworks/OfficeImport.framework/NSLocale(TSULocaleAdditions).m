@interface NSLocale(TSULocaleAdditions)
+ (__CFString)tsu_firstPreferredLocalization;
@end

@implementation NSLocale(TSULocaleAdditions)

+ (__CFString)tsu_firstPreferredLocalization
{
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "preferredLocalizations");
  if (![v0 count]) {
    return @"en_US";
  }
  return (__CFString *)[v0 objectAtIndexedSubscript:0];
}

@end