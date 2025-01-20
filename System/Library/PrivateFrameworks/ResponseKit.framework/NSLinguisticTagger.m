@interface NSLinguisticTagger
@end

@implementation NSLinguisticTagger

void __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  uint64_t v2 = [MEMORY[0x263F08770] dataDetectorWithTypes:32 error:&obj];
  objc_storeStrong((id *)(v1 + 40), obj);
  v3 = (void *)languageOfRange_withAdditionalContext_withPreferredLanguages__dataDetector;
  languageOfRange_withAdditionalContext_withPreferredLanguages__dataDetector = v2;
}

uint64_t __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [v5 countForObject:a3];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 < v8) {
    return -1;
  }
  else {
    return v7 > v8;
  }
}

uint64_t __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) tagAtIndex:a3 scheme:*MEMORY[0x263F082A8] tokenRange:0 sentenceRange:0];
  if (v4)
  {
    uint64_t v9 = v4;
    v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
    unint64_t v6 = (unint64_t)((double)(unint64_t)[v5 unsignedIntegerValue] + 1.0);

    unint64_t v7 = [NSNumber numberWithUnsignedInteger:v6];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v9];

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }

  return MEMORY[0x270F9A758]();
}

void __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ((double)(unint64_t)[a3 unsignedIntegerValue]
     / (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 0.7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end