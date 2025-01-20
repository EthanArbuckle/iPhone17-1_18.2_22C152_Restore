@interface NSPersonNameComponents(IC)
- (id)ic_componentsForSearchHighlighting;
- (uint64_t)ic_localizedNameWithDefaultFormattingStyle;
@end

@implementation NSPersonNameComponents(IC)

- (uint64_t)ic_localizedNameWithDefaultFormattingStyle
{
  return [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:a1 style:0 options:0];
}

- (id)ic_componentsForSearchHighlighting
{
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [a1 givenName];
  objc_msgSend(v2, "ic_addNonNilObject:", v3);

  v4 = [a1 familyName];
  objc_msgSend(v2, "ic_addNonNilObject:", v4);

  return v2;
}

@end