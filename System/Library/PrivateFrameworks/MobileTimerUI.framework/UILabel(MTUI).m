@interface UILabel(MTUI)
- (void)mtui_setText:()MTUI hyphenationFactor:;
@end

@implementation UILabel(MTUI)

- (void)mtui_setText:()MTUI hyphenationFactor:
{
  v15[1] = *MEMORY[0x263EF8340];
  if (a2 <= 0.0)
  {
    id v9 = a4;
    [a1 setText:v9];
  }
  else
  {
    v6 = (void *)MEMORY[0x263F1C358];
    id v7 = a4;
    v8 = [v6 defaultParagraphStyle];
    id v9 = (id)[v8 mutableCopy];

    *(float *)&double v10 = a2;
    [v9 setHyphenationFactor:v10];
    id v11 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v14 = *MEMORY[0x263F1C268];
    v15[0] = v9;
    v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v13 = (void *)[v11 initWithString:v7 attributes:v12];

    [a1 setAttributedText:v13];
  }
}

@end