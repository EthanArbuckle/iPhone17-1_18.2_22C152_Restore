@interface RPClipSample
- (BOOL)isKeyFrame;
- (RPClipSample)init;
- (float)seconds;
- (opaqueCMSampleBuffer)sampleBuffer;
- (void)setIsKeyFrame:(BOOL)a3;
- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setSeconds:(float)a3;
@end

@implementation RPClipSample

- (RPClipSample)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPClipSample;
  v2 = [(RPClipSample *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(RPClipSample *)v2 setSampleBuffer:0];
    [(RPClipSample *)v3 setSeconds:0.0];
    [(RPClipSample *)v3 setIsKeyFrame:0];
  }
  return v3;
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_sampleBuffer = a3;
}

- (float)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(float)a3
{
  self->_seconds = a3;
}

- (BOOL)isKeyFrame
{
  return self->_isKeyFrame;
}

- (void)setIsKeyFrame:(BOOL)a3
{
  self->_isKeyFrame = a3;
}

@end