@interface CLKUIPrimaryGamutMatrix
@end

@implementation CLKUIPrimaryGamutMatrix

__n128 __CLKUIPrimaryGamutMatrix_block_invoke()
{
  long long v0 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
  CLKUIPrimaryGamutMatrix_p3ToNativeMatrix = *MEMORY[0x1E4F14998];
  unk_1E9D04D80 = v0;
  __n128 result = *(__n128 *)(MEMORY[0x1E4F14998] + 32);
  xmmword_1E9D04D90 = (__int128)result;
  return result;
}

@end