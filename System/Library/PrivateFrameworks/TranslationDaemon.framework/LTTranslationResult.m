@interface LTTranslationResult
@end

@implementation LTTranslationResult

id __98___LTTranslationResult_Osprey__initWithOspreySpeechTranslationMTResponse_sourceText_censorSpeech___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F1C170];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [*(id *)(a1 + 32) locale];
  v7 = (void *)[v5 initWithOspreyMtResponsePhrase:v4 locale:v6 censorSpeech:*(unsigned __int8 *)(a1 + 40)];

  return v7;
}

id __55___LTTranslationResult_Osprey__initWithOspreyResponse___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F1C170];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithOspreyPhrase:v3];

  return v4;
}

uint64_t __73___LTTranslationResult_Osprey__updateAlignmentWithSourceSpan_targetSpan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 targetRange];
  if (v6 == [v5 targetRange])
  {
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v8 = [v4 targetRange];
    if (v8 < [v5 targetRange]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

@end