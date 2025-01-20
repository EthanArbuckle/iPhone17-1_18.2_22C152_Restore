@interface CIImage(PrivateSmartBlackAndWhite)
- (id)smartBlackAndWhiteAdjustmentsForValue:()PrivateSmartBlackAndWhite andStatistics:;
- (uint64_t)smartBlackAndWhiteStatistics;
@end

@implementation CIImage(PrivateSmartBlackAndWhite)

- (id)smartBlackAndWhiteAdjustmentsForValue:()PrivateSmartBlackAndWhite andStatistics:
{
  v6[7] = *MEMORY[0x1E4F143B8];
  if (smartBlackAndWhiteAdjustmentsForValue_andStatistics__onceToken != -1) {
    dispatch_once(&smartBlackAndWhiteAdjustmentsForValue_andStatistics__onceToken, &__block_literal_global_99_18980);
  }
  v5[0] = @"inputStrength";
  v5[1] = @"inputNeutralGamma";
  v6[0] = &unk_1F000A688;
  v6[1] = &unk_1F000A668;
  v6[2] = &unk_1F000A668;
  v5[2] = @"inputTone";
  v5[3] = @"inputHue";
  v2 = [NSNumber numberWithDouble:a1];
  v6[3] = v2;
  v6[4] = &unk_1F000A668;
  v5[4] = @"inputGrain";
  v5[5] = @"inputSeed";
  v5[6] = @"inputScaleFactor";
  v6[5] = &unk_1F000A668;
  v6[6] = &unk_1F000A668;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];

  return v3;
}

- (uint64_t)smartBlackAndWhiteStatistics
{
  if (smartBlackAndWhiteStatistics_onceToken != -1) {
    dispatch_once(&smartBlackAndWhiteStatistics_onceToken, &__block_literal_global_91_18988);
  }
  return MEMORY[0x1E4F1CC08];
}

@end