@interface NSString(SiriUIUtilities)
- (id)siriUIAttributedStringWithSubscriptAtRange:()SiriUIUtilities font:;
@end

@implementation NSString(SiriUIUtilities)

- (id)siriUIAttributedStringWithSubscriptAtRange:()SiriUIUtilities font:
{
  v8 = (objc_class *)MEMORY[0x263F089B8];
  id v9 = a5;
  v10 = (void *)[[v8 alloc] initWithString:a1];
  v11 = [v9 _fontScaledByScaleFactor:0.5];

  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x263F1C238], v11, a3, a4);
  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x263F1C220], &unk_26D6581B8, a3, a4);

  return v10;
}

@end