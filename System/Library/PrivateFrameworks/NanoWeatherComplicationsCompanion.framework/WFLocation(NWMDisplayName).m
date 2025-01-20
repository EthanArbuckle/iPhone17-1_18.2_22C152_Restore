@interface WFLocation(NWMDisplayName)
+ (id)_nwm_attributedDisplayName:()NWMDisplayName prefixedWithLocationGlyph:;
+ (id)nwm_attributedDisplayNameWithLocationGlyph:()NWMDisplayName inFont:;
+ (id)nwm_attributedDisplayNameWithLocationGlyph:()NWMDisplayName withTextStyle:;
@end

@implementation WFLocation(NWMDisplayName)

+ (id)nwm_attributedDisplayNameWithLocationGlyph:()NWMDisplayName inFont:
{
  v6 = (void *)MEMORY[0x263F1C6C8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 configurationWithFont:v7 scale:1];
  v10 = [MEMORY[0x263F1C6B0] systemImageNamed:@"location.fill" withConfiguration:v9];
  v11 = objc_msgSend(a1, "_nwm_attributedDisplayName:prefixedWithLocationGlyph:", v8, v10);

  v12 = (void *)[v11 mutableCopy];
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F1C238], v7, 0, objc_msgSend(v12, "length"));

  v13 = (void *)[v12 copy];

  return v13;
}

+ (id)nwm_attributedDisplayNameWithLocationGlyph:()NWMDisplayName withTextStyle:
{
  v4 = (void *)MEMORY[0x263F1C6C8];
  uint64_t v5 = *MEMORY[0x263F1D260];
  id v6 = a3;
  id v7 = [v4 configurationWithTextStyle:v5 scale:1];
  id v8 = [MEMORY[0x263F1C6B0] systemImageNamed:@"location.fill" withConfiguration:v7];
  v9 = objc_msgSend(a1, "_nwm_attributedDisplayName:prefixedWithLocationGlyph:", v6, v8);

  return v9;
}

+ (id)_nwm_attributedDisplayName:()NWMDisplayName prefixedWithLocationGlyph:
{
  id v5 = a3;
  id v6 = [a4 imageWithRenderingMode:2];
  id v7 = objc_alloc_init(MEMORY[0x263F1C370]);
  [v7 setImage:v6];
  id v8 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v7];
  v9 = [NSString stringWithFormat:@" %@", v5];

  v10 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9];
  [v10 insertAttributedString:v8 atIndex:0];
  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x263F1C220], &unk_26EEA87F8, 0, 1);
  v11 = (void *)[v10 copy];

  return v11;
}

@end