@interface MRImageManager
+ (void)cleanupPictureCache;
+ (void)initialize;
- (CGImage)CGImageWithData:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 orientation:(char *)a6;
- (CGImage)CGImageWithMoviePath:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 atTime:(double)a6 orientation:(char *)a7;
- (CGImage)CGImageWithPath:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 orientation:(char *)a6;
- (EAGLContext)imageGLContext;
- (MRContext)baseContext;
- (MRImageManager)initWithBaseContext:(id)a3;
- (id)_lockedMasterForAssetAtPath:(id)a3 withOptions:(id)a4;
- (id)_textureWithSize:(id)a3 isFBO:(BOOL)a4 options:(id *)a5;
- (id)fboTextureWithSize:(id)a3;
- (id)optimizedPath:(id)a3 forSize:(CGSize)a4;
- (id)retainedByUserImageWithCGContext:(CGContext *)a3;
- (id)retainedByUserImageWithSize:(CGSize)a3 andColor:(const float *)a4;
- (id)retainedByUserPlayerForAssetAtPath:(id)a3 size:(CGSize)a4 andOptions:(id)a5;
- (id)retainedByUserThumbnailForAssetAtPath:(id)a3;
- (id)textureWithSize:(id)a3 options:(id *)a4;
- (void)dealloc;
- (void)purgeResources:(BOOL)a3;
- (void)recycleTexture:(id)a3;
@end

@implementation MRImageManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRImageManager;
  objc_msgSendSuper2(&v2, "initialize");
  if ((byte_1F1318 & 1) == 0)
  {
    byte_1F1318 = 1;
    [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"MRDrawROIs"];
  }
}

- (MRImageManager)initWithBaseContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRImageManager;
  v4 = [(MRImageManager *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mBaseContext = (MRContext *)a3;
    v4->mImageGLContext = (EAGLContext *)objc_msgSend(objc_alloc((Class)EAGLContext), "initWithAPI:sharegroup:", 2, objc_msgSend(objc_msgSend(a3, "glContext"), "sharegroup"));
    v5->mTextures = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5->mAvailableTextures = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v5->mRecyclableTextures = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v5->_assetMasters = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v5;
}

- (void)dealloc
{
  self->mBaseContext = 0;
  mImageGLContext = self->mImageGLContext;
  if (mImageGLContext)
  {

    self->mImageGLContext = 0;
  }

  self->mTextures = 0;
  self->mAvailableTextures = 0;

  self->mRecyclableTextures = 0;
  self->_assetMasters = 0;
  v4.receiver = self;
  v4.super_class = (Class)MRImageManager;
  [(MRImageManager *)&v4 dealloc];
}

- (void)purgeResources:(BOOL)a3
{
  BOOL v3 = a3;
  assetMasters = self->_assetMasters;
  objc_sync_enter(assetMasters);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = [(NSMutableDictionary *)self->_assetMasters objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v7)
  {
    id v8 = 0;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ([v11 purgeResources])
        {
          if (!v8) {
            id v8 = objc_alloc_init((Class)NSMutableArray);
          }
          objc_msgSend(v8, "addObject:", objc_msgSend(v11, "path"));
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v7);
    if (v8)
    {
      [(NSMutableDictionary *)self->_assetMasters removeObjectsForKeys:v8];
    }
  }
  objc_sync_exit(assetMasters);
  objc_sync_enter(self);
  if (v3)
  {
    [(NSMutableSet *)self->mAvailableTextures removeAllObjects];
    [(NSMutableSet *)self->mRecyclableTextures removeAllObjects];
    [(NSMutableDictionary *)self->mTextures removeAllObjects];
  }
  else
  {
    double v12 = MRGetCurrentTime();
    id v13 = [(NSMutableSet *)self->mAvailableTextures copy];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v34;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
          [v17 timestamp];
          if (v18 < v12 + -60.0)
          {
            if ([v17 isFBO])
            {
              v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"f.%dx%d", [v17 size], (unint64_t)objc_msgSend(v17, "size") >> 32);
            }
            else
            {
              id v20 = [v17 size];
              unint64_t v21 = (unint64_t)[v17 size];
              unsigned int v22 = [v17 pixelFormat];
              uint64_t v23 = 4;
              if (v22 == 40) {
                uint64_t v23 = 1;
              }
              v19 = +[NSString stringWithFormat:@"t.%dx%dx%d", v20, HIDWORD(v21), v23];
            }
            id v24 = [(NSMutableDictionary *)self->mTextures objectForKey:v19];
            objc_sync_enter(v24);
            [v24 removeObject:v17];
            objc_sync_exit(v24);
            [(NSMutableSet *)self->mAvailableTextures removeObject:v17];
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v14);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    mRecyclableTextures = self->mRecyclableTextures;
    id v26 = [(NSMutableSet *)mRecyclableTextures countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v30;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(mRecyclableTextures);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * (void)k) setTimestamp:v12];
        }
        id v26 = [(NSMutableSet *)mRecyclableTextures countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v26);
    }
    [(NSMutableSet *)self->mAvailableTextures unionSet:self->mRecyclableTextures];
    [(NSMutableSet *)self->mRecyclableTextures removeAllObjects];
  }
  objc_sync_exit(self);
}

- (id)_textureWithSize:(id)a3 isFBO:(BOOL)a4 options:(id *)a5
{
  BOOL v6 = a4;
  if (a4)
  {
    uint64_t v9 = +[NSString stringWithFormat:@"f.%dx%d", a3, a3.var1, v23];
  }
  else
  {
    if (a5->var3) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 4;
    }
    uint64_t v9 = +[NSString stringWithFormat:@"t.%dx%dx%d", a3, a3.var1, v10];
  }
  v11 = v9;
  objc_sync_enter(self);
  id v12 = [(NSMutableDictionary *)self->mTextures objectForKey:v11];
  id v13 = v12;
  if (!v12)
  {
    id v13 = objc_alloc_init((Class)NSMutableArray);
    [(NSMutableDictionary *)self->mTextures setObject:v13 forKey:v11];

    objc_sync_exit(self);
LABEL_21:
    double v18 = [MRTexture alloc];
    mImageGLContext = self->mImageGLContext;
    if (v6) {
      id v20 = [(MRTexture *)v18 initFBOWithSize:a3 inGLContext:mImageGLContext options:a5];
    }
    else {
      id v20 = [(MRTexture *)v18 initWithSize:a3 inGLContext:mImageGLContext options:a5];
    }
    v17 = v20;
    if (v20)
    {
      [(MRTexture *)v20 setIsShared:1];
      if (v6) {
        CFStringRef v21 = @"Marimba FBO";
      }
      else {
        CFStringRef v21 = @"Marimba Texture";
      }
      [(MRTexture *)v17 setLabel:v21];
      objc_sync_enter(v13);
      [v13 addObject:v17];
      objc_sync_exit(v13);
    }
    return v17;
  }
  objc_sync_enter(v12);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(MRTexture **)(*((void *)&v24 + 1) + 8 * i);
        if ([(NSMutableSet *)self->mAvailableTextures containsObject:v17])
        {
          [(NSMutableSet *)self->mAvailableTextures removeObject:v17];
          goto LABEL_18;
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  v17 = 0;
LABEL_18:
  objc_sync_exit(v13);
  objc_sync_exit(self);
  if (!v17) {
    goto LABEL_21;
  }
  return v17;
}

- (id)textureWithSize:(id)a3 options:(id *)a4
{
  return [(MRImageManager *)self _textureWithSize:a3 isFBO:0 options:a4];
}

- (id)fboTextureWithSize:(id)a3
{
  return [(MRImageManager *)self _textureWithSize:a3 isFBO:1 options:0];
}

- (void)recycleTexture:(id)a3
{
  objc_sync_enter(self);
  [(NSMutableSet *)self->mRecyclableTextures addObject:a3];
  objc_sync_exit(self);
}

- (id)_lockedMasterForAssetAtPath:(id)a3 withOptions:(id)a4
{
  if (!a3) {
    return 0;
  }
  assetMasters = self->_assetMasters;
  objc_sync_enter(assetMasters);
  id v8 = (MRAssetMaster *)[(NSMutableDictionary *)self->_assetMasters objectForKey:a3];
  if (v8) {
    goto LABEL_11;
  }
  uint64_t v9 = [(MRContext *)self->mBaseContext assetManager];
  id v10 = [a4 isEmbeddedAsset];
  if (v10)
  {
    [a4 resolutionIfEmbeddedAsset];
    double v12 = v11;
    double v14 = v13;
    id v15 = 0;
  }
  else
  {
    if ([a3 isEqualToString:@"liveCamera"])
    {
      double v14 = 720.0;
      double v12 = 1280.0;
    }
    else
    {
      [(MZMediaManagement *)v9 resolutionForAssetAtPath:a3];
      double v12 = v16;
      double v14 = v17;
    }
    id v15 = [(MZMediaManagement *)v9 isSupportedMovieForAssetAtPath:a3];
  }
  id v8 = -[MRAssetMaster initWithPath:originalSize:isEmbeddedAsset:isSupportedMovie:andImageManager:]([MRAssetMaster alloc], "initWithPath:originalSize:isEmbeddedAsset:isSupportedMovie:andImageManager:", a3, v10, v15, self, v12, v14);
  [(MRAssetMaster *)v8 setTimestamp:0.0];
  [(NSMutableDictionary *)self->_assetMasters setObject:v8 forKey:a3];

  if (v8) {
LABEL_11:
  }
    objc_sync_enter(v8);
  objc_sync_exit(assetMasters);
  return v8;
}

- (id)retainedByUserPlayerForAssetAtPath:(id)a3 size:(CGSize)a4 andOptions:(id)a5
{
  if (!a3) {
    return 0;
  }
  double height = a4.height;
  double width = a4.width;
  id v8 = -[MRImageManager _lockedMasterForAssetAtPath:withOptions:](self, "_lockedMasterForAssetAtPath:withOptions:");
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  id v10 = objc_msgSend(v8, "retainedByUserPlayerForSize:andOptions:", a5, width, height);
  objc_sync_exit(v9);
  return v10;
}

- (id)retainedByUserThumbnailForAssetAtPath:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [(MRImageManager *)self _lockedMasterForAssetAtPath:a3 withOptions:0];
  if (!v3) {
    return 0;
  }
  objc_super v4 = v3;
  id v5 = objc_msgSend(objc_msgSend(v3, "thumbnail"), "retainByUser");
  objc_sync_exit(v4);
  return v5;
}

- (id)retainedByUserImageWithCGContext:(CGContext *)a3
{
  objc_super v4 = [[MRTextureSource alloc] initWithCGContext:a3 imageManager:self];
  id v5 = [MRImage alloc];
  double Width = (double)CGBitmapContextGetWidth(a3);
  id v7 = -[MRImage initWithTextureSource:andSize:](v5, "initWithTextureSource:andSize:", v4, Width, (double)CGBitmapContextGetHeight(a3));

  [(MRImage *)v7 setLabel:+[NSString stringWithFormat:@"Marimba CGContext"]];
  return v7;
}

- (id)retainedByUserImageWithSize:(CGSize)a3 andColor:(const float *)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = [[MRTextureSource alloc] initWithSize:a3.width | ((unint64_t)a3.height << 32) andColor:a4 imageManager:self];
  id v8 = -[MRImage initWithTextureSource:andSize:]([MRImage alloc], "initWithTextureSource:andSize:", v7, width, height);

  if (a4) {
    uint64_t v9 = +[NSString stringWithFormat:@"Marimba Color %.2f %.2f %.2f %.2f", *a4, a4[1], a4[2], a4[3]];
  }
  else {
    uint64_t v9 = +[NSString stringWithFormat:@"Marimba", v11, v12, v13, v14];
  }
  [(MRImage *)v8 setLabel:v9];

  return v8;
}

- (MRContext)baseContext
{
  return self->mBaseContext;
}

- (EAGLContext)imageGLContext
{
  return self->mImageGLContext;
}

- (id)optimizedPath:(id)a3 forSize:(CGSize)a4
{
  if (a4.width < a4.height) {
    a4.double width = a4.height;
  }
  if (a4.width >= 361.984) {
    return a3;
  }
  else {
    return +[NSString stringWithValidatedFormat:a3, @"%d", 0, 256 validFormatSpecifiers error];
  }
}

- (CGImage)CGImageWithPath:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 orientation:(char *)a6
{
  double height = a5.height;
  double width = a5.width;
  double v8 = a4.height;
  double v9 = a4.width;
  id v10 = -[MRImageManager optimizedPath:forSize:](self, "optimizedPath:forSize:", a3, a6, a5.width, a5.height);
  CGImageSourceRef v11 = CGImageSourceCreateWithURL((CFURLRef)+[NSURL fileURLWithPath:v10], 0);
  if (v11)
  {
    uint64_t v12 = v11;
    double v13 = v9 / width;
    if (v9 / width >= v8 / height) {
      double v13 = v8 / height;
    }
    uint64_t v14 = (uint64_t)v13;
    id v15 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", &__kCFBooleanTrue, @"kCGImageSourceShouldPreferRGB32", 0);
    if (v14 >= 2) {
      objc_msgSend(v15, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14), @"kCGImageSourceSubsampleFactor");
    }
    [v15 setObject:kCFBooleanTrue forKey:kCGImageSourceCreateThumbnailWithTransform];
    [v15 setObject:kCFBooleanTrue forKey:kCGImageSourceCreateThumbnailFromImageAlways];
    if (width >= height) {
      double v16 = width;
    }
    else {
      double v16 = height;
    }
    objc_msgSend(v15, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)v16), kCGImageSourceThumbnailMaxPixelSize);
    CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v12, 0, (CFDictionaryRef)v15);

    CFRelease(v12);
  }
  else
  {
    NSLog(@"Error creating image source for path '%@'.", v10);
    CGImageRef ThumbnailAtIndex = 0;
  }
  return ThumbnailAtIndex;
}

- (CGImage)CGImageWithData:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 orientation:(char *)a6
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.height;
  double v10 = a4.width;
  CGImageSourceRef v11 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (v11)
  {
    uint64_t v12 = v11;
    CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v11, 0, 0);
    if (v13)
    {
      CFDictionaryRef v14 = v13;
      *a6 = objc_msgSend(-[__CFDictionary objectForKey:](v13, "objectForKey:", kCGImagePropertyOrientation), "intValue");
    }
    double v15 = v10 / width;
    if (v10 / width >= v9 / height) {
      double v15 = v9 / height;
    }
    uint64_t v16 = (uint64_t)v15;
    id v17 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", &__kCFBooleanTrue, @"kCGImageSourceShouldPreferRGB32", 0);
    if (v16 >= 2) {
      objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16), @"kCGImageSourceSubsampleFactor");
    }
    [v17 setObject:kCFBooleanTrue forKey:kCGImageSourceCreateThumbnailWithTransform];
    [v17 setObject:kCFBooleanTrue forKey:kCGImageSourceCreateThumbnailFromImageAlways];
    if (width >= height) {
      double v18 = width;
    }
    else {
      double v18 = height;
    }
    objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)v18), kCGImageSourceThumbnailMaxPixelSize);
    CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v12, 0, (CFDictionaryRef)v17);

    CFRelease(v12);
  }
  else
  {
    NSLog(@"Error creating image source from data.");
    CGImageRef ThumbnailAtIndex = 0;
  }
  return ThumbnailAtIndex;
}

- (CGImage)CGImageWithMoviePath:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 atTime:(double)a6 orientation:(char *)a7
{
  double height = a5.height;
  double width = a5.width;
  double v10 = +[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", +[NSURL URLWithString:](NSURL, "URLWithString:", a3, a7, a4.width, a4.height), 0);
  id v11 = [objc_alloc((Class)AVAssetImageGenerator) initWithAsset:v10];
  uint64_t v12 = v11;
  if (a6 >= 0.0)
  {
    long long v36 = *(_OWORD *)&kCMTimeZero.value;
    long long v22 = v36;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    CMTimeEpoch v13 = epoch;
    [v11 setRequestedTimeToleranceBefore:&v36];
    long long v34 = v22;
    CMTimeEpoch v35 = v13;
    [v12 setRequestedTimeToleranceAfter:&v34];
  }
  objc_msgSend(v12, "setMaximumSize:", width, height);
  [v12 setAppliesPreferredTrackTransform:1];
  uint64_t v32 = 0;
  id v33 = 0;
  uint64_t v30 = 0;
  *(void *)timescale = 0;
  if (v10)
  {
    [(AVURLAsset *)v10 duration];
    int32_t v14 = timescale[0];
    uint64_t v15 = v30;
  }
  else
  {
    uint64_t v15 = 0;
    int32_t v14 = 0;
  }
  double v16 = (double)v14 * a6;
  if (a6 < 0.0) {
    double v16 = 0.0;
  }
  if (v15 <= (uint64_t)v16) {
    int64_t v17 = v15 - 1;
  }
  else {
    int64_t v17 = (uint64_t)v16;
  }
  CMTimeMake(&v29, v17, v14);
  double v18 = (CGImage *)[v12 copyCGImageAtTime:&v29 actualTime:0 error:&v33];
  if (v33)
  {
    id v19 = [v33 code];
    if (a6 >= 0.0 && v19 == (id)-11832)
    {
      long long v27 = *(_OWORD *)&kCMTimePositiveInfinity.value;
      long long v23 = v27;
      CMTimeEpoch v28 = kCMTimePositiveInfinity.epoch;
      CMTimeEpoch v20 = v28;
      [v12 setRequestedTimeToleranceBefore:&v27];
      long long v25 = v23;
      CMTimeEpoch v26 = v20;
      [v12 setRequestedTimeToleranceAfter:&v25];
      if (v18) {
        CGImageRelease(v18);
      }
      CMTimeMake(&v24, v17, timescale[0]);
      double v18 = (CGImage *)[v12 copyCGImageAtTime:&v24 actualTime:0 error:&v33];
    }
  }

  return v18;
}

+ (void)cleanupPictureCache
{
  pthread_setname_np("MRImageManager: Cleanup Picture Cache");
  +[NSThread setThreadPriority:0.1];
  id v3 = +[NSUserDefaults standardUserDefaults];
  if ([(NSUserDefaults *)v3 objectForKey:@"MRImageManagerMaxUntouchedAgeForCachedPictures"])
  {
    [(NSUserDefaults *)v3 doubleForKey:@"MRImageManagerMaxUntouchedAgeForCachedPictures"];
    double v5 = v4;
  }
  else
  {
    double v5 = 3000000.0;
  }
  if ([(NSUserDefaults *)v3 objectForKey:@"MRImageManagerTimeToWaitBeforeCleaningUpPictureCache"])
  {
    [(NSUserDefaults *)v3 doubleForKey:@"MRImageManagerTimeToWaitBeforeCleaningUpPictureCache"];
    unsigned int v7 = v6;
  }
  else
  {
    unsigned int v7 = 300;
  }
  sleep(v7);
  double v8 = +[NSFileManager defaultManager];
  id v9 = objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), "stringByAppendingPathComponent:", @"com.apple.iLifeSlideshow/Pictures");
  [(NSFileManager *)v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];
  double v10 = [(NSFileManager *)v8 subpathsOfDirectoryAtPath:v9 error:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      int32_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [v9 stringByAppendingPathComponent:*(void *)(*((void *)&v17 + 1) + 8 * (void)v14)];
        objc_msgSend(-[NSDictionary objectForKey:](-[NSFileManager attributesOfItemAtPath:error:](v8, "attributesOfItemAtPath:error:", v15, 0), "objectForKey:", NSFileModificationDate), "timeIntervalSinceNow");
        if (v5 < -v16) {
          [(NSFileManager *)v8 removeItemAtPath:v15 error:0];
        }
        int32_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  pthread_setname_np("");
}

@end