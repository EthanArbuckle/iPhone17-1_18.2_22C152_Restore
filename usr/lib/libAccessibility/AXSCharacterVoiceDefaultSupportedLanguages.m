@interface AXSCharacterVoiceDefaultSupportedLanguages
@end

@implementation AXSCharacterVoiceDefaultSupportedLanguages

CFArrayRef ___AXSCharacterVoiceDefaultSupportedLanguages_block_invoke()
{
  v1[35] = *(const void **)MEMORY[0x1E4F143B8];
  memcpy(v1, off_1E568BF80, 0x118uLL);
  CFArrayRef result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v1, 35, MEMORY[0x1E4F1D510]);
  _AXSCharacterVoiceDefaultSupportedLanguages_supportedLanguages = (uint64_t)result;
  return result;
}

@end