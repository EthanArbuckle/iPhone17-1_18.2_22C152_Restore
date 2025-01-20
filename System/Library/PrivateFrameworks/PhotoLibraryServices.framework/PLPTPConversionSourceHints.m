@interface PLPTPConversionSourceHints
+ (id)hintsForAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5;
- (BOOL)isLivePhoto;
- (BOOL)isRender;
- (BOOL)isVideo;
- (BOOL)livePhotoImageIsHEIC;
- (PLPTPConversionSourceHints)initWithAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5;
@end

@implementation PLPTPConversionSourceHints

- (void).cxx_destruct
{
}

- (BOOL)isLivePhoto
{
  return self->_isLivePhoto;
}

- (BOOL)isRender
{
  return self->_isRender;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)livePhotoImageIsHEIC
{
  return self->_isLivePhoto
      && [(UTType *)self->_livePhotoImageContentType conformsToType:*MEMORY[0x1E4F443E0]];
}

- (PLPTPConversionSourceHints)initWithAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLPTPConversionSourceHints;
  v9 = [(PLPTPConversionSourceHints *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_isVideo = a4;
    v9->_isRender = a5;
    if ([v8 isPhotoIris])
    {
      v10->_isLivePhoto = 1;
      if (a5) {
        [v8 uniformTypeIdentifier];
      }
      else {
      v11 = [v8 originalUniformTypeIdentifier];
      }
      uint64_t v12 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v11];
      livePhotoImageContentType = v10->_livePhotoImageContentType;
      v10->_livePhotoImageContentType = (UTType *)v12;
    }
  }

  return v10;
}

+ (id)hintsForAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithAsset:v8 isVideo:v6 isRender:v5];

  return v9;
}

@end