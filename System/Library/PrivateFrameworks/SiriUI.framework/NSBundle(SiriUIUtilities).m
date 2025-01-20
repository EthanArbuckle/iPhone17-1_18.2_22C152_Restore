@interface NSBundle(SiriUIUtilities)
- (uint64_t)siriUILocalizedStringForKey:()SiriUIUtilities;
- (uint64_t)siriUILocalizedStringForKey:()SiriUIUtilities table:;
@end

@implementation NSBundle(SiriUIUtilities)

- (uint64_t)siriUILocalizedStringForKey:()SiriUIUtilities
{
  return [a1 assistantUILocalizedStringForKey:a3 value:0 table:0];
}

- (uint64_t)siriUILocalizedStringForKey:()SiriUIUtilities table:
{
  return [a1 assistantUILocalizedStringForKey:a3 value:0 table:a4];
}

@end