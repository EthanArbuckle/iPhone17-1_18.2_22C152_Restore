@interface NSNumberFormatter(SiriUI)
+ (id)siriui_localizedStringFromNumber:()SiriUI;
@end

@implementation NSNumberFormatter(SiriUI)

+ (id)siriui_localizedStringFromNumber:()SiriUI
{
  v3 = (objc_class *)MEMORY[0x263F08A30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
  v7 = [v6 assistantUILocale];
  [v5 setLocale:v7];

  v8 = [v5 stringFromNumber:v4];

  return v8;
}

@end