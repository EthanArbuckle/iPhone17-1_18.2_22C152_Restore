@interface PFLivePhotoFrameProcessingRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (CIImage)image;
- (double)renderScale;
- (int64_t)type;
- (void)setImage:(id)a3;
- (void)setRenderScale:(double)a3;
- (void)setTime:(id *)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PFLivePhotoFrameProcessingRequest

- (void).cxx_destruct
{
}

- (void)setRenderScale:(double)a3
{
  self->_renderScale = a3;
}

- (double)renderScale
{
  return self->_renderScale;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setImage:(id)a3
{
}

- (CIImage)image
{
  return self->_image;
}

@end