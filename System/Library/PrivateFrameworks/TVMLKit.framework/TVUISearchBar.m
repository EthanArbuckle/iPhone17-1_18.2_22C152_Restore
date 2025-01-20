@interface TVUISearchBar
@end

@implementation TVUISearchBar

uint64_t __32___TVUISearchBar__tvmlKitBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.TVMLKit"];
  uint64_t v1 = _tvmlKitBundle_bundle;
  _tvmlKitBundle_bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __29___TVUISearchBar__clearGlyph__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x263F1C6B0];
  id v5 = +[TVMLUtilities TVMLKitBundle];
  uint64_t v1 = [v0 imageNamed:@"Search-clear" inBundle:v5];
  v2 = [MEMORY[0x263F1C550] systemGrayColor];
  uint64_t v3 = [v1 _flatImageWithColor:v2];
  v4 = (void *)_clearGlyph_clearGlpyh;
  _clearGlyph_clearGlpyh = v3;
}

void __30___TVUISearchBar__searchGlyph__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x263F1C6B0];
  id v5 = +[TVMLUtilities TVMLKitBundle];
  uint64_t v1 = [v0 imageNamed:@"Search-glyph" inBundle:v5];
  v2 = [MEMORY[0x263F1C550] systemGrayColor];
  uint64_t v3 = [v1 _flatImageWithColor:v2];
  v4 = (void *)_searchGlyph_searchGlyph;
  _searchGlyph_searchGlyph = v3;
}

@end