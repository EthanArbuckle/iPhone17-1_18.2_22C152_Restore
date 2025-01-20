@interface MOLogLoadPreferences
@end

@implementation MOLogLoadPreferences

BOOL ___MOLogLoadPreferences_block_invoke(uint64_t a1)
{
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x263EFFE48], @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  BOOL result = _MOLogGetPreferenceIntValue(*(void *)(*(void *)(a1 + 32) + 16), (SInt32 *)(*(void *)(a1 + 32) + 44));
  uint64_t v3 = *(void *)(a1 + 32);
  if (!result)
  {
    int v5 = *(_DWORD *)(v3 + 48);
LABEL_6:
    *(_DWORD *)(v3 + 44) = v5;
    return result;
  }
  unsigned int v4 = *(_DWORD *)(v3 + 44);
  if ((v4 & 0x80000000) == 0)
  {
    if (v4 < 8) {
      return result;
    }
    int v5 = 7;
    goto LABEL_6;
  }
  *(_DWORD *)(v3 + 44) = 0;
  return result;
}

@end