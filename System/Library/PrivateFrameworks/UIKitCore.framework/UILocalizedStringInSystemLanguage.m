@interface UILocalizedStringInSystemLanguage
@end

@implementation UILocalizedStringInSystemLanguage

void ___UILocalizedStringInSystemLanguage_block_invoke()
{
  v0 = _UIKitBundle();
  _UIPreferredSystemLanguageForBundle(v0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v1 = _UIKitBundle();
    v2 = [v1 preferredLocalizations];
    v3 = [v2 firstObject];
    char v4 = [v3 isEqualToString:v11];

    if ((v4 & 1) == 0)
    {
      v5 = _UIKitBundle();
      v6 = [v5 pathForResource:v11 ofType:@"lproj"];

      if ([v6 length])
      {
        uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithPath:v6];
        v8 = (void *)qword_1EB25B880;
        qword_1EB25B880 = v7;
      }
    }
  }
  if (!qword_1EB25B880)
  {
    uint64_t v9 = _UIKitBundle();
    v10 = (void *)qword_1EB25B880;
    qword_1EB25B880 = v9;
  }
}

@end