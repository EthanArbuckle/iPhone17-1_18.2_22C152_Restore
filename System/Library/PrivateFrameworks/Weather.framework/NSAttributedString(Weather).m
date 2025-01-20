@interface NSAttributedString(Weather)
- (id)wa_font;
@end

@implementation NSAttributedString(Weather)

- (id)wa_font
{
  v1 = [a1 attribute:*MEMORY[0x263F1C238] atIndex:0 effectiveRange:0];
  if (!v1)
  {
    v2 = (void *)MEMORY[0x263F1C658];
    [MEMORY[0x263F1C658] systemFontSize];
    v1 = objc_msgSend(v2, "systemFontOfSize:");
  }
  return v1;
}

@end