@interface NSBundle(TSULocaleAdditions)
- (id)localizedStringForKey:()TSULocaleAdditions value:table:locale:;
@end

@implementation NSBundle(TSULocaleAdditions)

- (id)localizedStringForKey:()TSULocaleAdditions value:table:locale:
{
  v13[1] = *MEMORY[0x263EF8340];
  v8 = (void *)MEMORY[0x263F086E0];
  uint64_t v9 = [a1 localizations];
  v13[0] = +[OITSULocale canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:](OITSULocale, "canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:", [a6 localeIdentifier]);
  objc_msgSend((id)objc_msgSend(v8, "preferredLocalizationsFromArray:forPreferences:", v9, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v13, 1)), "objectAtIndexedSubscript:", 0);
  CFBundleRef v10 = CFBundleCreate(0, (CFURLRef)[a1 bundleURL]);
  v11 = (void *)CFBundleCopyLocalizedStringForLocalization();
  CFRelease(v10);
  return v11;
}

@end