@interface PFLivePhotoPlaybackResult
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime;
- (AVAsset)videoAsset;
- (CGImage)photo;
- (int)photoExifOrientation;
- (void)dealloc;
- (void)setPhoto:(CGImage *)a3;
- (void)setPhotoExifOrientation:(int)a3;
- (void)setPhotoTime:(id *)a3;
- (void)setVideoAsset:(id)a3;
@end

@implementation PFLivePhotoPlaybackResult

- (void).cxx_destruct
{
}

- (void)setVideoAsset:(id)a3
{
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (void)setPhotoTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_photoTime.epoch = a3->var3;
  *(_OWORD *)&self->_photoTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setPhotoExifOrientation:(int)a3
{
  self->_photoExifOrientation = a3;
}

- (int)photoExifOrientation
{
  return self->_photoExifOrientation;
}

- (CGImage)photo
{
  return self->_photo;
}

- (void)dealloc
{
  CGImageRelease(self->_photo);
  v3.receiver = self;
  v3.super_class = (Class)PFLivePhotoPlaybackResult;
  [(PFLivePhotoPlaybackResult *)&v3 dealloc];
}

- (void)setPhoto:(CGImage *)a3
{
  photo = self->_photo;
  if (photo != a3)
  {
    CGImageRelease(photo);
    self->_photo = CGImageRetain(a3);
  }
}

@end