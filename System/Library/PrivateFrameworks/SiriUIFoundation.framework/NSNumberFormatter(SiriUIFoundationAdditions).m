@interface NSNumberFormatter(SiriUIFoundationAdditions)
+ (id)sruif_localizedStringFromNumber:()SiriUIFoundationAdditions;
@end

@implementation NSNumberFormatter(SiriUIFoundationAdditions)

+ (id)sruif_localizedStringFromNumber:()SiriUIFoundationAdditions
{
  v3 = (objc_class *)MEMORY[0x263F08A30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = SRUIFGetLocale();
  [v5 setLocale:v6];

  v7 = [v5 stringFromNumber:v4];

  return v7;
}

@end