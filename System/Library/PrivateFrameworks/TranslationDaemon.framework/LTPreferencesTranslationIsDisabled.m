@interface LTPreferencesTranslationIsDisabled
@end

@implementation LTPreferencesTranslationIsDisabled

uint64_t ___LTPreferencesTranslationIsDisabled_block_invoke()
{
  _LTPreferencesTranslationIsDisabled_deviceSKU = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

BOOL ___LTPreferencesTranslationIsDisabled_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:_LTPreferencesTranslationIsDisabled_deviceSKU] == 0;
}

@end