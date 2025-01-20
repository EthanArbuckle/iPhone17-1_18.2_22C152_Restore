@interface UIKBRTFingerDetectionFingerFeedbackView
@end

@implementation UIKBRTFingerDetectionFingerFeedbackView

void __78___UIKBRTFingerDetectionFingerFeedbackView_centerOn_withRadius_andIdentifier___block_invoke()
{
  v3[13] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1ED3F5760;
  v2[1] = &unk_1ED3F5640;
  v3[0] = @"?";
  v3[1] = @"L?";
  v2[2] = &unk_1ED3F56D0;
  v2[3] = &unk_1ED3F56A0;
  v3[2] = @"R?";
  v3[3] = @"LL";
  v2[4] = &unk_1ED3F5688;
  v2[5] = &unk_1ED3F5670;
  v3[4] = @"LR";
  v3[5] = @"LM";
  v2[6] = &unk_1ED3F5658;
  v2[7] = &unk_1ED3F56B8;
  v3[6] = @"LI";
  v3[7] = @"LT";
  v2[8] = &unk_1ED3F5748;
  v2[9] = &unk_1ED3F56E8;
  v3[8] = @"RT";
  v3[9] = @"RI";
  v2[10] = &unk_1ED3F5700;
  v2[11] = &unk_1ED3F5718;
  v3[10] = @"RM";
  v3[11] = @"RR";
  v2[12] = &unk_1ED3F5730;
  v3[12] = @"RL";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:13];
  v1 = (void *)qword_1EB25D198;
  qword_1EB25D198 = v0;
}

@end