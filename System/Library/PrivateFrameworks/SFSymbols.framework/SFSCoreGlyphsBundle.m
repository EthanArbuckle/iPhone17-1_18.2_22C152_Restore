@interface SFSCoreGlyphsBundle
+ (NSBundle)private;
+ (NSBundle)public;
@end

@implementation SFSCoreGlyphsBundle

+ (NSBundle)public
{
  if (public_once != -1) {
    dispatch_once(&public_once, &__block_literal_global);
  }
  v2 = (void *)public_publicBundle;
  return (NSBundle *)v2;
}

+ (NSBundle)private
{
  if (private_once != -1) {
    dispatch_once(&private_once, &__block_literal_global_9);
  }
  v2 = (void *)private_privateBundle;
  return (NSBundle *)v2;
}

void __30__SFSCoreGlyphsBundle_private__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SFSymbolsFramework"];
  id v3 = [v0 pathForResource:@"CoreGlyphsPrivate" ofType:@"bundle"];

  uint64_t v1 = (uint64_t)v3;
  if (v3) {
    uint64_t v1 = [objc_alloc(MEMORY[0x263F086E0]) initWithPath:v3];
  }
  v2 = (void *)private_privateBundle;
  private_privateBundle = v1;
}

void __29__SFSCoreGlyphsBundle_public__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SFSymbolsFramework"];
  id v3 = [v0 pathForResource:@"CoreGlyphs" ofType:@"bundle"];

  uint64_t v1 = (uint64_t)v3;
  if (v3) {
    uint64_t v1 = [objc_alloc(MEMORY[0x263F086E0]) initWithPath:v3];
  }
  v2 = (void *)public_publicBundle;
  public_publicBundle = v1;
}

@end