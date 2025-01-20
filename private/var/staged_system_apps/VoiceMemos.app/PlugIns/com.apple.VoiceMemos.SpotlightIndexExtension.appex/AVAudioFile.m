@interface AVAudioFile
- (double)rc_durationInSeconds;
- (double)rc_sampleRate;
- (unsigned)rc_audioFormat;
@end

@implementation AVAudioFile

- (double)rc_sampleRate
{
  v2 = [(AVAudioFile *)self processingFormat];
  [v2 sampleRate];
  double v4 = v3;

  return v4;
}

- (double)rc_durationInSeconds
{
  double v3 = (double)[(AVAudioFile *)self length];
  double v4 = [(AVAudioFile *)self processingFormat];
  [v4 sampleRate];
  double v6 = v3 / v5;

  return v6;
}

- (unsigned)rc_audioFormat
{
  v2 = [(AVAudioFile *)self fileFormat];
  double v3 = [v2 settings];
  double v4 = [v3 objectForKeyedSubscript:AVFormatIDKey];
  unsigned int v5 = [v4 unsignedIntValue];

  return v5;
}

@end