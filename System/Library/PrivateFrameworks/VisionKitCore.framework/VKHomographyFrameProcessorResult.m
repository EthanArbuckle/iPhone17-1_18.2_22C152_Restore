@interface VKHomographyFrameProcessorResult
- (__n128)setWarpTransform:(__n128)a3;
- (__n128)warpTransform;
@end

@implementation VKHomographyFrameProcessorResult

- (__n128)warpTransform
{
  return a1[1];
}

- (__n128)setWarpTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  return result;
}

@end