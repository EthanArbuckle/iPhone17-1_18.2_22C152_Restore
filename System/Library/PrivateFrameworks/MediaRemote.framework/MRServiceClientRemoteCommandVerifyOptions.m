@interface MRServiceClientRemoteCommandVerifyOptions
@end

@implementation MRServiceClientRemoteCommandVerifyOptions

uint64_t ___MRServiceClientRemoteCommandVerifyOptions_block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "mr_isCommandSupportedAndEnabled:", *(unsigned int *)(a1 + 40))) {
    return 1;
  }
  uint64_t result = +[MRCommandInfo isCommandActuallySupportedEvenWhenDisabled:*(unsigned int *)(a1 + 40)];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(unsigned int *)(a1 + 40);
    return objc_msgSend(v3, "mr_isCommandSupported:", v4);
  }
  return result;
}

@end