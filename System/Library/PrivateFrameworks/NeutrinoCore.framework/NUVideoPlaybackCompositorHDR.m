@interface NUVideoPlaybackCompositorHDR
- (BOOL)supportsHDROutput;
- (BOOL)supportsHDRSourceFrames;
@end

@implementation NUVideoPlaybackCompositorHDR

- (BOOL)supportsHDROutput
{
  return 1;
}

- (BOOL)supportsHDRSourceFrames
{
  return 1;
}

@end