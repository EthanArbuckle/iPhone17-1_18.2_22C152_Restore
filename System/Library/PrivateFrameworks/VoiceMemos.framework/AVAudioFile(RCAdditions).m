@interface AVAudioFile(RCAdditions)
- (double)rc_durationInSeconds;
- (double)rc_sampleRate;
- (uint64_t)rc_audioFormat;
@end

@implementation AVAudioFile(RCAdditions)

- (double)rc_sampleRate
{
  v1 = [a1 processingFormat];
  [v1 sampleRate];
  double v3 = v2;

  return v3;
}

- (double)rc_durationInSeconds
{
  double v2 = (double)[a1 length];
  double v3 = [a1 processingFormat];
  [v3 sampleRate];
  double v5 = v2 / v4;

  return v5;
}

- (uint64_t)rc_audioFormat
{
  v1 = [a1 fileFormat];
  double v2 = [v1 settings];
  double v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F151E0]];
  uint64_t v4 = [v3 unsignedIntValue];

  return v4;
}

@end