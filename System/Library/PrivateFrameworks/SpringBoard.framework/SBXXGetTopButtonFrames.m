@interface SBXXGetTopButtonFrames
@end

@implementation SBXXGetTopButtonFrames

double ___SBXXGetTopButtonFrames_block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v7 = *MEMORY[0x1E4F1DB28];
  long long v8 = v2;
  long long v5 = v7;
  long long v6 = v2;
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  +[SBCoverSheetPresentationManager getLeadingTopButtonFrame:&v7 trailingTopButtonFrame:&v5 forScreen:v3];

  *(_OWORD *)*(void *)(a1 + 32) = v7;
  *(_OWORD *)*(void *)(a1 + 48) = v8;
  *(_OWORD *)*(void *)(a1 + 64) = v5;
  **(void **)(a1 + 80) = v6;
  double result = *((double *)&v6 + 1);
  **(void **)(a1 + 88) = *((void *)&v6 + 1);
  return result;
}

@end