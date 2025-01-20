@interface AVAssetTrack
- ($F24F406B2B787EFB06265DBA3D28CBD5)rc_timeRange;
@end

@implementation AVAssetTrack

- ($F24F406B2B787EFB06265DBA3D28CBD5)rc_timeRange
{
  [(AVAssetTrack *)self timeRange];
  RCTimeRangeFromCMTimeRange();
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

@end