@interface MRAssetPlayerMovieForExport
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (MRAssetPlayerMovieForExport)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)startTime;
- (double)time;
- (double)volume;
- (id)_posterImage:(BOOL)a3;
- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4;
- (void)_finishLoadingAsset:(id)a3 andVideoTrack:(id)a4 forTime:(double)a5;
- (void)_finishLoadingAsset:(id)a3 forTime:(double)a4 completion:(id)a5;
- (void)dealloc;
- (void)loadForTime:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setTime:(double)a3;
- (void)setVolume:(double)a3;
@end

@implementation MRAssetPlayerMovieForExport

- (MRAssetPlayerMovieForExport)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MRAssetPlayerMovieForExport;
  v6 = -[MRAssetPlayer initWithPath:size:master:andOptions:](&v8, "initWithPath:size:master:andOptions:", a3, a5, a6, a4.width, a4.height);
  if (v6)
  {
    v6->_loadingSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v6->_nextSampleBufferTimestamp = -1.0;
  }
  return v6;
}

- (void)dealloc
{
  [(MRImage *)self->super._image releaseByUser];
  self->super._image = 0;
  cvTextureCache = self->_cvTextureCache;
  if (cvTextureCache)
  {
    CVOpenGLESTextureCacheFlush(cvTextureCache, 0);
    CFRelease(self->_cvTextureCache);
    self->_cvTextureCache = 0;
  }
  trackOutput = self->_trackOutput;
  objc_sync_enter(trackOutput);

  self->_trackOutput = 0;
  nextSampleBuffer = self->_nextSampleBuffer;
  if (nextSampleBuffer)
  {
    CFRelease(nextSampleBuffer);
    self->_nextSampleBuffer = 0;
  }
  objc_sync_exit(trackOutput);

  self->_assetReader = 0;
  loadingSemaphore = self->_loadingSemaphore;
  if (loadingSemaphore)
  {
    dispatch_release(loadingSemaphore);
    self->_loadingSemaphore = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)MRAssetPlayerMovieForExport;
  [(MRAssetPlayer *)&v7 dealloc];
}

- (double)time
{
  return self->super._time;
}

- (void)setTime:(double)a3
{
  self->super._time = a3;
}

- (void)loadForTime:(double)a3
{
  v5 = [(MRAssetMaster *)self->super._master imageManager];
  unsigned __int8 v6 = [(MRAssetMaster *)self->super._master isEmbeddedAsset];
  if (v6) {
    objc_super v7 = 0;
  }
  else {
    objc_super v7 = [(MRContext *)[(MRImageManager *)v5 baseContext] assetManager];
  }
  objc_super v8 = (AVURLAsset *)[(MZMediaManagement *)v7 avAssetForAssetAtPath:[(MRAssetMaster *)self->super._master path]];
  if (!v8)
  {
    v9 = [(MRAssetMaster *)self->super._master path];
    if ((v6 & 1) == 0) {
      v9 = (NSString *)-[MZMediaManagement absolutePathForAssetAtPath:andSize:](v7, "absolutePathForAssetAtPath:andSize:", v9, self->super._size.width, self->super._size.height);
    }
    if ([(NSString *)v9 isAbsolutePath]) {
      v10 = +[NSURL fileURLWithPath:v9];
    }
    else {
      v10 = +[NSURL URLWithString:v9];
    }
    objc_super v8 = +[AVURLAsset URLAssetWithURL:v10 options:0];
  }
  v11 = dispatch_semaphore_create(0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_E0070;
  v13[3] = &unk_1AB5C0;
  v13[4] = self;
  v13[5] = v8;
  *(double *)&v13[7] = a3;
  v13[6] = v11;
  [(AVURLAsset *)v8 loadValuesAsynchronouslyForKeys:&off_1BC040 completionHandler:v13];
  dispatch_time_t v12 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v11, v12);
  dispatch_release(v11);
}

- (void)_finishLoadingAsset:(id)a3 forTime:(double)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_E01B0;
  v5[3] = &unk_1AB610;
  v5[4] = self;
  v5[5] = a3;
  *(double *)&v5[8] = a4;
  v5[7] = a5;
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "tracksWithMediaType:", AVMediaTypeVideo), "lastObject"), "loadValuesAsynchronouslyForKeys:completionHandler:", &off_1BC058, v5);
}

- (void)_finishLoadingAsset:(id)a3 andVideoTrack:(id)a4 forTime:(double)a5
{
  id v5 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  if (a4) {
    [a4 preferredTransform];
  }
  if (self->_startTime <= 0.0)
  {
    id v9 = a3;
  }
  else
  {
    int32_t v8 = [v5 naturalTimeScale];
    id v9 = objc_alloc_init((Class)AVMutableComposition);
    double startTime = self->_startTime;
    uint64_t v24 = 0;
    CMTimeMake(&start, (uint64_t)(startTime * (double)v8), v8);
    CMTimeMake(&duration, (uint64_t)(self->_duration * (double)v8), v8);
    CMTimeRangeMake(&v23, &start, &duration);
    long long v19 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    if (([v9 insertTimeRange:&v23 ofAsset:a3 atTime:&v19 error:&v24] & 1) == 0) {
      NSLog(@"%@", v24);
    }
    id v5 = objc_msgSend(objc_msgSend(v9, "tracksWithMediaType:", AVMediaTypeVideo), "lastObject");
  }
  CFStringRef v30 = kCVOpenGLESTextureCacheMaximumTextureAgeKey;
  v31 = &off_1BC090;
  v11 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  dispatch_time_t v12 = (EAGLContext *)objc_msgSend(objc_alloc((Class)EAGLContext), "initWithAPI:sharegroup:", 2, -[EAGLContext sharegroup](-[MRImageManager imageGLContext](-[MRAssetMaster imageManager](self->super._master, "imageManager"), "imageGLContext"), "sharegroup"));
  self->_textureCacheContext = v12;
  CVOpenGLESTextureCacheCreate(kCFAllocatorDefault, (CFDictionaryRef)v11, v12, 0, &self->_cvTextureCache);

  v29[0] = &__kCFBooleanTrue;
  v28[0] = kCVPixelFormatOpenGLESCompatibility;
  v28[1] = kCVPixelBufferPixelFormatTypeKey;
  v29[1] = +[NSNumber numberWithUnsignedInteger:1111970369];
  v28[2] = kCVPixelBufferWidthKey;
  v29[2] = +[NSNumber numberWithUnsignedInteger:(unint64_t)self->super._size.width];
  v28[3] = kCVPixelBufferHeightKey;
  v29[3] = +[NSNumber numberWithUnsignedInteger:(unint64_t)self->super._size.height];
  v13 = (AVAssetReaderTrackOutput *)objc_msgSend(objc_alloc((Class)AVAssetReaderTrackOutput), "initWithTrack:outputSettings:", v5, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 4));
  self->_trackOutput = v13;
  [(AVAssetReaderTrackOutput *)v13 setAlwaysCopiesSampleData:0];
  v14 = (AVAssetReader *)[objc_alloc((Class)AVAssetReader) initWithAsset:v9 error:0];
  self->_assetReader = v14;
  [(AVAssetReader *)v14 addOutput:self->_trackOutput];
  [(AVAssetReader *)self->_assetReader startReading];
  if (v5)
  {
    if (*(double *)&v25 == 1.0)
    {
      BOOL v15 = *((double *)&v26 + 1) == 1.0;
      unsigned __int8 v16 = 4;
    }
    else
    {
      if (*(double *)&v25 != -1.0)
      {
        if (*((double *)&v25 + 1) == 1.0)
        {
          BOOL v17 = *(double *)&v26 == 1.0;
          unsigned __int8 v16 = 6;
          char v18 = 5;
        }
        else
        {
          if (*((double *)&v25 + 1) != -1.0) {
            goto LABEL_17;
          }
          BOOL v17 = *(double *)&v26 == 1.0;
          unsigned __int8 v16 = 7;
          char v18 = 8;
        }
        if (v17) {
          unsigned __int8 v16 = v18;
        }
        goto LABEL_16;
      }
      BOOL v15 = *((double *)&v26 + 1) == 2.0;
      unsigned __int8 v16 = 3;
    }
    if (v15) {
      unsigned __int8 v16 = 1;
    }
LABEL_16:
    self->_orientation = v16;
  }
LABEL_17:
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_loadingSemaphore);
}

- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4
{
  loadingSemaphore = self->_loadingSemaphore;
  if (loadingSemaphore)
  {
    dispatch_semaphore_wait(loadingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release((dispatch_object_t)self->_loadingSemaphore);
    self->_loadingSemaphore = 0;
  }
  if ((char *)[(AVAssetReader *)self->_assetReader status] == (char *)&dword_0 + 1)
  {
    trackOutput = self->_trackOutput;
    objc_sync_enter(trackOutput);
    if (self->_nextSampleBufferTimestamp <= a3)
    {
      nextSampleBuffer = 0;
      while (1)
      {
        if (nextSampleBuffer) {
          CFRelease(nextSampleBuffer);
        }
        nextSampleBuffer = self->_nextSampleBuffer;
        if ((char *)[(AVAssetReader *)self->_assetReader status] != (char *)&dword_0 + 1) {
          break;
        }
        id v9 = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_trackOutput copyNextSampleBuffer];
        self->_nextSampleBuffer = v9;
        if (!v9) {
          goto LABEL_18;
        }
        memset(&timingInfoOut, 0, sizeof(timingInfoOut));
        uint64_t SampleTimingInfo = CMSampleBufferGetSampleTimingInfo(v9, 0, &timingInfoOut);
        if (SampleTimingInfo || timingInfoOut.presentationTimeStamp.timescale < 1)
        {
          NSLog(@"CMSampleBufferGetSampleTimingInfo() returned error %d for valid sample %@", SampleTimingInfo, self->_nextSampleBuffer);
          double v11 = 1.0e100;
        }
        else
        {
          double v11 = (double)timingInfoOut.presentationTimeStamp.value
              / (double)timingInfoOut.presentationTimeStamp.timescale;
        }
        self->_nextSampleBufferTimestamp = v11;
        if (v11 > a3) {
          goto LABEL_19;
        }
      }
      self->_nextSampleBuffer = 0;
LABEL_18:
      self->_nextSampleBufferTimestamp = 1.0e100;
LABEL_19:
      objc_sync_exit(trackOutput);
      if (nextSampleBuffer)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(nextSampleBuffer);
        if (ImageBuffer)
        {
          v13 = ImageBuffer;
          unsigned int Width = CVPixelBufferGetWidth(ImageBuffer);
          unsigned int Height = CVPixelBufferGetHeight(v13);
          CVOpenGLESTextureCacheFlush(self->_cvTextureCache, 0);
          timingInfoOut.duration.value = 0;
          CVOpenGLESTextureCacheCreateTextureFromImage(kCFAllocatorDefault, self->_cvTextureCache, v13, 0, 0xDE1u, 6408, Width, Height, 0x80E1u, 0x1401u, 0, (CVOpenGLESTextureRef *)&timingInfoOut);
          unsigned __int8 v16 = [MRTextureSource alloc];
          BOOL v17 = [(MRTextureSource *)v16 initWithCVTexture:timingInfoOut.duration.value size:Width | ((unint64_t)Height << 32) orientation:self->_orientation imageManager:[(MRAssetMaster *)self->super._master imageManager] monochromatic:0];
          CVBufferRelease((CVBufferRef)timingInfoOut.duration.value);
          char v18 = -[MRImage initWithTextureSource:andSize:]([MRImage alloc], "initWithTextureSource:andSize:", v17, self->super._size.width, self->super._size.height);

          CFRelease(nextSampleBuffer);
          if (v18) {
            goto LABEL_28;
          }
        }
        else
        {
          CFRelease(nextSampleBuffer);
        }
      }
    }
    else
    {
      objc_sync_exit(trackOutput);
    }
  }
  image = self->super._image;
  if (!image)
  {
    char v18 = (MRImage *)objc_msgSend(-[MRAssetMaster thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:](self->super._master, "thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:", self->super._isMonochromatic, self->super._generatesMipmap, self->super._usesPowerOfTwo), "retainByUser");
    if (!v18)
    {
      char v18 = [(MRContext *)[(MRImageManager *)[(MRAssetMaster *)self->super._master imageManager] baseContext] retainedByUserBlackImage];
      if (!v18)
      {
        image = self->super._image;
        return [(MRImage *)image retainByUser];
      }
    }
LABEL_28:
    objc_sync_enter(self);
    [(MRImage *)self->super._image releaseByUser];
    self->super._image = (MRImage *)[(MRImage *)v18 retainByUser];
    objc_sync_exit(self);
    return v18;
  }
  return [(MRImage *)image retainByUser];
}

- (id)_posterImage:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MRAssetMaster *)self->super._master imageManager];
  if ([(MRAssetMaster *)self->super._master isEmbeddedAsset]) {
    unsigned __int8 v6 = 0;
  }
  else {
    unsigned __int8 v6 = [(MRContext *)[(MRImageManager *)v5 baseContext] assetManager];
  }
  objc_super v7 = [(MRAssetMaster *)self->super._master path];
  BOOL v8 = v3 || !self->super._thumbnailIsOK;
  id result = -[MZMediaManagement CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:](v6, "CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:", v7, &self->_orientation, v3, v8, self->super._size.width, self->super._size.height);
  if (result)
  {
    v10 = [[MRTextureSource alloc] initWithCGImage:result textureSize:self->super._size.width | ((unint64_t)self->super._size.height << 32) orientation:0 imageManager:v5 monochromatic:self->super._isMonochromatic];
    double v11 = -[MRImage initWithTextureSource:andSize:]([MRImage alloc], "initWithTextureSource:andSize:", v10, self->super._size.width, self->super._size.height);

    return v11;
  }
  return result;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_CMTime duration = a3;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

@end