@interface NSString
@end

@implementation NSString

uint64_t __58__NSString_TUI_NSStringExtras__tui_optimizedSizeWithFont___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v1 = tui_optimizedSizeWithFont__cache;
  tui_optimizedSizeWithFont__cache = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __67__NSString_TUI_NSStringExtras__tui_excessiveLineHeightCharacterSet__block_invoke()
{
  uint64_t v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  uint64_t v1 = tui_excessiveLineHeightCharacterSet___tui_excessiveLineCharacterSet;
  tui_excessiveLineHeightCharacterSet___tui_excessiveLineCharacterSet = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end