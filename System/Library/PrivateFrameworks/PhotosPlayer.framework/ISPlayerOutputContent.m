@interface ISPlayerOutputContent
- (BOOL)photoIsOriginal;
- (CGImage)photo;
- (CGSize)videoSize;
- (ISPlayerOutputContent)initWithPhoto:(CGImage *)a3 photoIsOriginal:(BOOL)a4 photoEXIFOrientation:(int)a5 videoPlayer:(id)a6 aspectRatio:(id)a7;
- (ISWrappedAVPlayer)videoPlayer;
- (NSNumber)aspectRatio;
- (id)description;
- (int)photoEXIFOrientation;
- (void)dealloc;
@end

@implementation ISPlayerOutputContent

- (void)dealloc
{
  CGImageRelease(self->_photo);
  v3.receiver = self;
  v3.super_class = (Class)ISPlayerOutputContent;
  [(ISPlayerOutputContent *)&v3 dealloc];
}

- (CGImage)photo
{
  return self->_photo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectRatio, 0);

  objc_storeStrong((id *)&self->_videoPlayer, 0);
}

- (NSNumber)aspectRatio
{
  return self->_aspectRatio;
}

- (CGSize)videoSize
{
  double width = self->_videoSize.width;
  double height = self->_videoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (int)photoEXIFOrientation
{
  return self->_photoEXIFOrientation;
}

- (BOOL)photoIsOriginal
{
  return self->_photoIsOriginal;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)ISPlayerOutputContent;
  objc_super v3 = [(ISPlayerOutputContent *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" photo: %@, orientation: %d, video player: %@, aspect ratio: %@", self->_photo, self->_photoEXIFOrientation, self->_videoPlayer, self->_aspectRatio];

  return v4;
}

- (ISPlayerOutputContent)initWithPhoto:(CGImage *)a3 photoIsOriginal:(BOOL)a4 photoEXIFOrientation:(int)a5 videoPlayer:(id)a6 aspectRatio:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v17.receiver = self;
  v17.super_class = (Class)ISPlayerOutputContent;
  v15 = [(ISPlayerOutputContent *)&v17 init];
  if (v15)
  {
    v15->_photo = CGImageRetain(a3);
    v15->_photoIsOriginal = a4;
    v15->_photoEXIFOrientation = a5;
    objc_storeStrong((id *)&v15->_videoPlayer, a6);
    objc_storeStrong((id *)&v15->_aspectRatio, a7);
  }

  return v15;
}

@end