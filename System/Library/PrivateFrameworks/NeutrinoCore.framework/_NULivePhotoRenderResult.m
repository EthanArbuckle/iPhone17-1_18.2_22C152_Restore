@interface _NULivePhotoRenderResult
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime;
- (AVAsset)video;
- (AVVideoComposition)videoComposition;
- (CGImage)photo;
- (NUImageGeometry)videoGeometry;
- (void)dealloc;
- (void)setPhoto:(CGImage *)a3;
- (void)setPhotoTime:(id *)a3;
- (void)setVideo:(id)a3;
- (void)setVideoComposition:(id)a3;
- (void)setVideoGeometry:(id)a3;
@end

@implementation _NULivePhotoRenderResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoGeometry, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);

  objc_storeStrong((id *)&self->_video, 0);
}

- (void)setVideoGeometry:(id)a3
{
}

- (NUImageGeometry)videoGeometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPhotoTime:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  objc_copyStruct(retstr, &self->_photoTime, 24, 1, 0);
  return result;
}

- (void)setPhoto:(CGImage *)a3
{
}

- (CGImage)photo
{
  return (CGImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVideoComposition:(id)a3
{
}

- (AVVideoComposition)videoComposition
{
  return (AVVideoComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVideo:(id)a3
{
}

- (AVAsset)video
{
  return (AVAsset *)objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  CGImageRelease(self->_photo);
  v3.receiver = self;
  v3.super_class = (Class)_NULivePhotoRenderResult;
  [(_NULivePhotoRenderResult *)&v3 dealloc];
}

@end