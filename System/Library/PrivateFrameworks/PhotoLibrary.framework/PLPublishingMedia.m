@interface PLPublishingMedia
+ (BOOL)isValidPublishingMedia:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHDVideo;
- (BOOL)isVideo;
- (NSString)pathForVideoFile;
- (NSURL)assetURL;
- (PLPublishingMedia)init;
- (PLPublishingMedia)initWithAVURLAsset:(id)a3;
- (PLPublishingMedia)initWithAsset:(id)a3;
- (PLPublishingMedia)initWithManagedAsset:(id)a3;
- (double)duration;
- (id)asset;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setAssetURL:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIsHDVideo:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setPathForVideoFile:(id)a3;
@end

@implementation PLPublishingMedia

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setIsHDVideo:(BOOL)a3
{
  self->_isHDVideo = a3;
}

- (BOOL)isHDVideo
{
  return self->_isHDVideo;
}

- (void)setAssetURL:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setPathForVideoFile:(id)a3
{
}

- (NSString)pathForVideoFile
{
  return self->_pathForVideoFile;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setAsset:(id)a3
{
}

- (id)asset
{
  return self->_asset;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLPublishingMedia;
  [(PLPublishingMedia *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id asset = self->_asset;
  uint64_t v6 = [a3 asset];
  return [asset isEqual:v6];
}

- (unint64_t)hash
{
  return [self->_asset hash];
}

- (PLPublishingMedia)initWithAVURLAsset:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLPublishingMedia.m", 87, @"Invalid parameter not satisfying: %@", @"avAsset");
  }
  v19.receiver = self;
  v19.super_class = (Class)PLPublishingMedia;
  v5 = [(PLPublishingMedia *)&v19 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(PLPublishingMedia *)v5 setAsset:a3];
    v7 = (void *)[a3 URL];
    v8 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithFilenameExtension:", objc_msgSend(v7, "pathExtension"));
    uint64_t v9 = [v8 conformsToType:*MEMORY[0x1E4F44448]];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "URL"), "path");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F8CC38], "tracksWithMediaType:forAsset:", *MEMORY[0x1E4F15C18], a3), "firstObject"), "naturalSize");
    if (v11 < 720.0 || v12 < 1280.0)
    {
      BOOL v14 = v12 >= 720.0 && v11 >= 1280.0;
      if (!a3) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v14 = 1;
      if (!a3)
      {
LABEL_15:
        memset(&time, 0, sizeof(time));
        goto LABEL_16;
      }
    }
    [a3 duration];
LABEL_16:
    CMTimeConvertScale(&v17, &time, 1, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    double value = (double)v17.value;
    [(PLPublishingMedia *)v6 setIsVideo:v9];
    [(PLPublishingMedia *)v6 setPathForVideoFile:v10];
    [(PLPublishingMedia *)v6 setAssetURL:v7];
    [(PLPublishingMedia *)v6 setIsHDVideo:v14];
    [(PLPublishingMedia *)v6 setDuration:value];
  }
  return v6;
}

- (PLPublishingMedia)initWithManagedAsset:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLPublishingMedia.m", 67, @"Invalid parameter not satisfying: %@", @"managedAsset");
  }
  v13.receiver = self;
  v13.super_class = (Class)PLPublishingMedia;
  v5 = [(PLPublishingMedia *)&v13 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(PLPublishingMedia *)v5 setAsset:a3];
    uint64_t v7 = [a3 isVideo];
    uint64_t v8 = [a3 pathForVideoFile];
    uint64_t v9 = [a3 isHDVideo];
    [MEMORY[0x1E4F8ABF0] durationForManagedAsset:a3 applyVideoAdjustments:1];
    double v11 = v10;
    [(PLPublishingMedia *)v6 setIsVideo:v7];
    [(PLPublishingMedia *)v6 setPathForVideoFile:v8];
    -[PLPublishingMedia setAssetURL:](v6, "setAssetURL:", [a3 assetURL]);
    [(PLPublishingMedia *)v6 setIsHDVideo:v9];
    [(PLPublishingMedia *)v6 setDuration:v11];
  }
  return v6;
}

- (PLPublishingMedia)initWithAsset:(id)a3
{
  id v3 = a3;
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLPublishingMedia.m", 46, @"Invalid parameter not satisfying: %@", @"asset");
  }
  if (!+[PLPublishingMedia isValidPublishingMedia:v3]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLPublishingMedia.m", 47, @"Invalid parameter not satisfying: %@", @"[PLPublishingMedia isValidPublishingMedia:asset]");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (id)[MEMORY[0x1E4F166C8] assetWithURL:v3];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [(PLPublishingMedia *)self initWithManagedAsset:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return [(PLPublishingMedia *)self initWithAVURLAsset:v3];
    }
    else
    {
      return 0;
    }
  }
}

- (PLPublishingMedia)init
{
  return [(PLPublishingMedia *)self initWithAsset:0];
}

+ (BOOL)isValidPublishingMedia:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end