@interface VKFrame
- (VKFrameInfo)info;
- (VNImageRequestHandler)imageRequestHandler;
- (__CVBuffer)CVImageBuffer;
- (void)setInfo:(id)a3;
@end

@implementation VKFrame

- (VNImageRequestHandler)imageRequestHandler
{
  return 0;
}

- (__CVBuffer)CVImageBuffer
{
  return 0;
}

- (VKFrameInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end