@interface NUVideoFrameJobCallbackCompositorHDR
- (BOOL)supportsHDROutput;
- (BOOL)supportsHDRSourceFrames;
@end

@implementation NUVideoFrameJobCallbackCompositorHDR

- (BOOL)supportsHDROutput
{
  return 1;
}

- (BOOL)supportsHDRSourceFrames
{
  return 1;
}

@end