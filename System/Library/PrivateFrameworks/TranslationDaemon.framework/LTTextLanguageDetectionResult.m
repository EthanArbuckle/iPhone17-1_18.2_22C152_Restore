@interface LTTextLanguageDetectionResult
@end

@implementation LTTextLanguageDetectionResult

uint64_t __113___LTTextLanguageDetectionResult_Daemon__initWithDetectionCounts_availableLocales_lowConfidenceLocales_strategy___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [v5 countForObject:a3];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 > v8) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __113___LTTextLanguageDetectionResult_Daemon__initWithDetectionCounts_availableLocales_lowConfidenceLocales_strategy___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 _ltLocaleIdentifier];
}

id __68___LTTextLanguageDetectionResult_Daemon__sendAnalytics_isSupported___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v1 = *(__CFString **)(a1 + 32);
  if (!v1) {
    v1 = &stru_270C008E8;
  }
  v5[1] = @"isSupported";
  v6[0] = v1;
  v5[0] = @"language";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

@end