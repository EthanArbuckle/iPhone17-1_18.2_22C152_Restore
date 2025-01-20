@interface SBStripOrderingMapsByStripSize
@end

@implementation SBStripOrderingMapsByStripSize

void ____SBStripOrderingMapsByStripSize_block_invoke()
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = &unk_1F334AC58;
  v17[1] = &unk_1F334AC88;
  v18[0] = &unk_1F3348210;
  v18[1] = &unk_1F3348228;
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v15[0] = &unk_1F334AC58;
  v15[1] = &unk_1F334AC88;
  v16[0] = &unk_1F3348240;
  v16[1] = &unk_1F3348258;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v13[0] = &unk_1F334AC58;
  v13[1] = &unk_1F334AC88;
  v14[0] = &unk_1F3348270;
  v14[1] = &unk_1F3348288;
  v13[2] = &unk_1F334AC70;
  v13[3] = &unk_1F334ACA0;
  v14[2] = &unk_1F33482A0;
  v14[3] = &unk_1F33482B8;
  v13[4] = &unk_1F334ACB8;
  v14[4] = &unk_1F33482D0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  v9 = &unk_1F334AC58;
  v10 = &unk_1F33482E8;
  v11[0] = &unk_1F334AC88;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v12[0] = v3;
  v11[1] = &unk_1F334AC70;
  v7 = &unk_1F334AC58;
  v8 = &unk_1F3348300;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v12[1] = v4;
  v12[2] = v0;
  v11[2] = &unk_1F334ACA0;
  v11[3] = &unk_1F334ACB8;
  v11[4] = &unk_1F334ACD0;
  v12[3] = v1;
  v12[4] = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  v6 = (void *)__SBStripOrderingMapsByStripSize__map;
  __SBStripOrderingMapsByStripSize__map = v5;
}

@end