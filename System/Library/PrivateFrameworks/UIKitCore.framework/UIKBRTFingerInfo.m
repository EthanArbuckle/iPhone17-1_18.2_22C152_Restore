@interface UIKBRTFingerInfo
@end

@implementation UIKBRTFingerInfo

void __32___UIKBRTFingerInfo_description__block_invoke()
{
  v3[13] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1ED3F5760;
  v2[1] = &unk_1ED3F5640;
  v3[0] = @"Unknown";
  v3[1] = @"LeftUnknown";
  v2[2] = &unk_1ED3F56D0;
  v2[3] = &unk_1ED3F56A0;
  v3[2] = @"RightUnknown";
  v3[3] = @"LeftLittle";
  v2[4] = &unk_1ED3F5688;
  v2[5] = &unk_1ED3F5670;
  v3[4] = @"LeftRing";
  v3[5] = @"LeftMiddle";
  v2[6] = &unk_1ED3F5658;
  v2[7] = &unk_1ED3F56B8;
  v3[6] = @"LeftIndex";
  v3[7] = @"LeftThumb";
  v2[8] = &unk_1ED3F5748;
  v2[9] = &unk_1ED3F56E8;
  v3[8] = @"RightThumb";
  v3[9] = @"RightIndex";
  v2[10] = &unk_1ED3F5700;
  v2[11] = &unk_1ED3F5718;
  v3[10] = @"RightMiddle";
  v3[11] = @"RightRing";
  v2[12] = &unk_1ED3F5730;
  v3[12] = @"RightLittle";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:13];
  v1 = (void *)_MergedGlobals_9_2;
  _MergedGlobals_9_2 = v0;
}

@end