@interface TVSearchBar
@end

@implementation TVSearchBar

uint64_t __34___TVSearchBar__listItemTextColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
  v1 = (void *)_listItemTextColor___lightThemeColor;
  _listItemTextColor___lightThemeColor = v0;

  uint64_t v2 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
  uint64_t v3 = _listItemTextColor___darkThemeColor;
  _listItemTextColor___darkThemeColor = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t __49___TVSearchBar__listItemSelectedOverlayFillColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.3];
  v1 = (void *)_listItemSelectedOverlayFillColor___lightThemeColor;
  _listItemSelectedOverlayFillColor___lightThemeColor = v0;

  uint64_t v2 = [MEMORY[0x263F1C550] colorWithRed:0.501960784 green:0.482352941 blue:0.501960784 alpha:0.1];
  uint64_t v3 = _listItemSelectedOverlayFillColor___darkThemeColor;
  _listItemSelectedOverlayFillColor___darkThemeColor = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

@end