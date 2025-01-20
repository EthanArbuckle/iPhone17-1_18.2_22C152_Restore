@interface UIFirstTypeIdentifierEligibleForMassStorage
@end

@implementation UIFirstTypeIdentifierEligibleForMassStorage

void ___UIFirstTypeIdentifierEligibleForMassStorage_block_invoke()
{
  v6[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F44390];
  v6[0] = *MEMORY[0x1E4F44370];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F44328];
  v6[2] = *MEMORY[0x1E4F443A8];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F443B0];
  v6[4] = *MEMORY[0x1E4F44558];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F44398];
  v6[6] = *MEMORY[0x1E4F44380];
  v6[7] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  v5 = (void *)_MergedGlobals_1290;
  _MergedGlobals_1290 = v4;
}

@end