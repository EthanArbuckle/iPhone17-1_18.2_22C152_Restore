@interface LTTextLanguageDetector
@end

@implementation LTTextLanguageDetector

uint64_t __56___LTTextLanguageDetector_detectionForStrings_strategy___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

id __48___LTTextLanguageDetector__mapSupportedLocales___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 availableLocales];
  v5 = _LTLanguageCodeToSupportedLocale();

  return v5;
}

@end