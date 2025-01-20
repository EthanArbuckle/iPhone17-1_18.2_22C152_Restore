@interface SBXXSetMediaVolume
@end

@implementation SBXXSetMediaVolume

void ___SBXXSetMediaVolume_block_invoke(uint64_t a1)
{
  id v3 = [(id)SBApp volumeControl];
  LODWORD(v2) = *(_DWORD *)(a1 + 32);
  [v3 _setMediaVolumeForIAP:v2];
}

@end