@interface SBXXSetAssistantRecognitionStrings
@end

@implementation SBXXSetAssistantRecognitionStrings

uint64_t ___SBXXSetAssistantRecognitionStrings_block_invoke(uint64_t a1)
{
  return [(id)SBApp setNextAssistantRecognitionStrings:*(void *)(a1 + 32)];
}

@end