@interface _NUVideoPlaybackFrameRequestResponse
- (__CVBuffer)frame;
- (void)dealloc;
- (void)setFrame:(__CVBuffer *)a3;
@end

@implementation _NUVideoPlaybackFrameRequestResponse

- (void)setFrame:(__CVBuffer *)a3
{
}

- (__CVBuffer)frame
{
  return (__CVBuffer *)objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  frame = self->_frame;
  if (frame) {
    CFRelease(frame);
  }
  v4.receiver = self;
  v4.super_class = (Class)_NUVideoPlaybackFrameRequestResponse;
  [(_NUVideoPlaybackFrameRequestResponse *)&v4 dealloc];
}

@end