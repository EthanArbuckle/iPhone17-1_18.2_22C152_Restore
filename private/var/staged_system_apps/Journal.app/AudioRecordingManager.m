@interface AudioRecordingManager
- (double)amplitudeForSliceWithTimeRange:(id)a3 fullTimeRangeSampled:(BOOL *)a4;
- (void)handleAudioSessionInterruption:(id)a3;
- (void)handleAudioSessionRouteChange:(id)a3;
@end

@implementation AudioRecordingManager

- (void)handleAudioSessionInterruption:(id)a3
{
}

- (void)handleAudioSessionRouteChange:(id)a3
{
}

- (double)amplitudeForSliceWithTimeRange:(id)a3 fullTimeRangeSampled:(BOOL *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  swift_retain();
  sub_100615628(a4, var0, var1);
  double v8 = v7;
  swift_release();
  return v8;
}

@end