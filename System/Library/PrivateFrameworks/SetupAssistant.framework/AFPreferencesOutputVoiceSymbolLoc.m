@interface AFPreferencesOutputVoiceSymbolLoc
@end

@implementation AFPreferencesOutputVoiceSymbolLoc

void *__get_AFPreferencesOutputVoiceSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AssistantServicesLibrary();
  result = dlsym(v2, "_AFPreferencesOutputVoice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AFPreferencesOutputVoiceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end