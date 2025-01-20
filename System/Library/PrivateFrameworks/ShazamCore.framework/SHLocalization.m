@interface SHLocalization
+ (id)localizedStringForKey:(id)a3;
+ (id)shFrameworkBundle;
@end

@implementation SHLocalization

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 shFrameworkBundle];
  v6 = [v5 localizedStringForKey:v4 value:&stru_26DAEBAC8 table:@"Localizable"];

  return v6;
}

+ (id)shFrameworkBundle
{
  if (shFrameworkBundle_onceToken != -1) {
    dispatch_once(&shFrameworkBundle_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)shFrameworkBundle_bundle;
  return v2;
}

void __35__SHLocalization_shFrameworkBundle__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Foundation"];
  v1 = [v0 bundleURL];
  v2 = [v1 URLByDeletingLastPathComponent];
  id v6 = [v2 URLByDeletingLastPathComponent];

  v3 = [v6 URLByAppendingPathComponent:@"Frameworks/ShazamKit.framework" isDirectory:1];
  uint64_t v4 = [objc_alloc(MEMORY[0x263F086E0]) initWithURL:v3];
  v5 = (void *)shFrameworkBundle_bundle;
  shFrameworkBundle_bundle = v4;
}

@end