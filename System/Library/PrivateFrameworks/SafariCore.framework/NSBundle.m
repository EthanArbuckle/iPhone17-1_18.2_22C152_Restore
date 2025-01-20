@interface NSBundle
@end

@implementation NSBundle

void __60__NSBundle_SafariCoreExtras__safari_safariInjectedBundleURL__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariCoreBundle");
  v1 = [v0 bundleURL];
  id v9 = [v1 URLByDeletingLastPathComponent];

  v2 = (void *)MEMORY[0x1E4F28B50];
  v3 = [v9 URLByAppendingPathComponent:@"MobileSafari.framework" isDirectory:1];
  v4 = [v2 bundleWithURL:v3];

  if (!v4) {
    __60__NSBundle_SafariCoreExtras__safari_safariInjectedBundleURL__block_invoke_cold_1();
  }
  v5 = [v4 builtInPlugInsURL];
  v6 = [v5 URLByAppendingPathComponent:@"Safari.wkbundle" isDirectory:1];
  uint64_t v7 = [v6 absoluteURL];
  v8 = (void *)safari_safariInjectedBundleURL_bundleURL;
  safari_safariInjectedBundleURL_bundleURL = v7;
}

void __53__NSBundle_SafariCoreExtras__safari_safariCoreBundle__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) bundleForClass:objc_opt_class()];
  v2 = (void *)safari_safariCoreBundle_bundle;
  safari_safariCoreBundle_bundle = v1;
}

void __60__NSBundle_SafariCoreExtras__safari_safariInjectedBundleURL__block_invoke_cold_1()
{
  v0 = [NSString stringWithFormat:&stru_1F105D3F0];
  uint64_t v1 = NSString;
  v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariShared/SafariShared/SafariCore/FoundationExtras/WBSCoreNSBundleExtras.m"];
  v3 = [v2 lastPathComponent];
  if ([v0 length])
  {
    v5 = [NSString stringWithFormat:@", %@", v0];
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "containingBundle", "+[NSBundle(SafariCoreExtras) safari_safariInjectedBundleURL]_block_invoke", v3, 364, v5];
  }
  else
  {
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "containingBundle", "+[NSBundle(SafariCoreExtras) safari_safariInjectedBundleURL]_block_invoke", v3, 364, &stru_1F105D3F0];
  }

  v6 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1F10624F0.isa, v4, v6);

  abort();
}

@end