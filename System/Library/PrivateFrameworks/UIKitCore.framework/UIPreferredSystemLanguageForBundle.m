@interface UIPreferredSystemLanguageForBundle
@end

@implementation UIPreferredSystemLanguageForBundle

void ___UIPreferredSystemLanguageForBundle_block_invoke(uint64_t a1)
{
  CFArrayRef locArray = [*(id *)(a1 + 32) localizations];
  CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
  if (CFPreferencesAppValueIsForced(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3D8])) {
    CFArrayRef v2 = (const __CFArray *)CFPreferencesCopyAppValue(@"AppleLanguages", v1);
  }
  else {
    CFArrayRef v2 = (const __CFArray *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  }
  CFArrayRef v3 = v2;
  if (v2)
  {
    CFArrayRef v4 = CFBundleCopyLocalizationsForPreferences(locArray, v2);
    uint64_t v5 = [(__CFArray *)v4 firstObject];
    v6 = (void *)_UIPreferredSystemLanguageForBundle_primaryLanguage;
    _UIPreferredSystemLanguageForBundle_primaryLanguage = v5;
  }
}

@end