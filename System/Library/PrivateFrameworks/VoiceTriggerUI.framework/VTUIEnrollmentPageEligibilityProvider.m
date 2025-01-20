@interface VTUIEnrollmentPageEligibilityProvider
- (BOOL)shouldShowLanguageDisambiguationForBestFittingSiriLanguages:(id)a3;
@end

@implementation VTUIEnrollmentPageEligibilityProvider

- (BOOL)shouldShowLanguageDisambiguationForBestFittingSiriLanguages:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    v5 = [MEMORY[0x263F285A0] sharedPreferences];
    v6 = [v5 languageCode];

    if (v6) {
      char v4 = [v3 containsObject:v6];
    }
    else {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

@end