@interface SBXXSetVoiceControlEnabled
@end

@implementation SBXXSetVoiceControlEnabled

uint64_t ___SBXXSetVoiceControlEnabled_block_invoke(uint64_t a1)
{
  return +[SBVoiceDisabledBundles setAppDisabledVoiceControl:*(unsigned __int8 *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 32)];
}

@end