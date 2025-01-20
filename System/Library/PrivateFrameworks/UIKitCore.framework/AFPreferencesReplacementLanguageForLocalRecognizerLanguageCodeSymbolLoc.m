@interface AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc
@end

@implementation AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc

void *__get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = AssistantServicesLibrary_0();
  result = dlsym(v2, "_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCodeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                                 + 24);
  return result;
}

@end