@interface AVAudioTime(RCAdditions)
- (id)rc_adjustedBySamples:()RCAdditions;
- (id)rc_adjustedBySeconds:()RCAdditions;
- (id)rc_copyFromTimeStamp;
- (uint64_t)rc_hostTimeInSeconds;
@end

@implementation AVAudioTime(RCAdditions)

- (id)rc_copyFromTimeStamp
{
  objc_msgSend(a1, "audioTimeStamp", 0, 0, 0, 0, 0, 0, 0, 0);
  id v2 = objc_alloc(MEMORY[0x1E4F153F8]);
  [a1 sampleRate];
  v3 = objc_msgSend(v2, "initWithAudioTimeStamp:sampleRate:", &v5);
  return v3;
}

- (id)rc_adjustedBySamples:()RCAdditions
{
  v4 = (void *)MEMORY[0x1E4F153F8];
  uint64_t v5 = [a1 sampleTime] + a3;
  [a1 sampleRate];
  v6 = objc_msgSend(v4, "timeWithSampleTime:atRate:", v5);
  v7 = [v6 extrapolateTimeFromAnchor:a1];

  return v7;
}

- (id)rc_adjustedBySeconds:()RCAdditions
{
  [a1 sampleRate];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F153F8], "timeWithSampleTime:atRate:", objc_msgSend(a1, "sampleTime") + (uint64_t)(v4 * a2), v4);
  v6 = [v5 extrapolateTimeFromAnchor:a1];

  return v6;
}

- (uint64_t)rc_hostTimeInSeconds
{
  v1 = (void *)MEMORY[0x1E4F153F8];
  uint64_t v2 = [a1 hostTime];
  return [v1 secondsForHostTime:v2];
}

@end