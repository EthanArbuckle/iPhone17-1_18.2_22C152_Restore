@interface SBMigSetAssistantRecognitionStrings
@end

@implementation SBMigSetAssistantRecognitionStrings

uint64_t ___SBMigSetAssistantRecognitionStrings_block_invoke(uint64_t a1)
{
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _OWORD *))(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  uint64_t v5 = *(unsigned int *)(a1 + 60);
  long long v6 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v6;
  uint64_t result = v3(v4, v2, v5, v8);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end