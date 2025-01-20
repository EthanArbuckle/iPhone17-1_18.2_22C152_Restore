@interface MRAssetPlayerMovie
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (BOOL)newImageIsAvailable;
- (MRAssetPlayerMovie)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6;
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
- (void)outputMediaDataWillChange:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setTime:(double)a3;
- (void)setVolume:(double)a3;
@end

@implementation MRAssetPlayerMovie

- (MRAssetPlayerMovie)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MRAssetPlayerMovie;
  v6 = -[MRAssetPlayer initWithPath:size:master:andOptions:](&v8, "initWithPath:size:master:andOptions:", a3, a5, a6, a4.width, a4.height);
  if (v6)
  {
    v6->_semaphore = (NSConditionLock *)[objc_alloc((Class)NSConditionLock) initWithCondition:0];
    v6->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("MRAssetPlayerMovie", 0);
  }
  return v6;
}

- (void)dealloc
{
  [(MRImage *)self->super._image releaseByUser];
  self->super._image = 0;
  cvTextureCache = self->_cvTextureCache;
  if (cvTextureCache) {
    CVOpenGLESTextureCacheFlush(cvTextureCache, 0);
  }
  [(AVPlayerItemVideoOutput *)self->_videoOutput setDelegate:0 queue:0];
  avPlayer = self->_avPlayer;
  playerItem = self->_playerItem;
  videoOutput = self->_videoOutput;
  v7 = self->_cvTextureCache;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DE700;
  block[3] = &unk_1AB5C0;
  block[4] = avPlayer;
  block[5] = playerItem;
  block[6] = videoOutput;
  block[7] = v7;
  dispatch_async(dispatchQueue, block);
  self->_cvTextureCache = 0;
  self->_videoOutput = 0;
  self->_playerItem = 0;
  self->_avPlayer = 0;
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  self->_dispatchQueue = 0;

  self->_semaphore = 0;
  v9.receiver = self;
  v9.super_class = (Class)MRAssetPlayerMovie;
  [(MRAssetPlayer *)&v9 dealloc];
}

- (double)time
{
  return self->super._time;
}

- (void)setTime:(double)a3
{
  [(AVPlayerItem *)self->_playerItem cancelPendingSeeks];
  if (self->super._time != a3) {
    [(AVPlayer *)self->_avPlayer cancelPendingPrerolls];
  }
  self->super._time = a3;
  BOOL v5 = a3 >= 0.0 && self->_movieDuration > a3;
  self->_isPlaying &= v5;
  if (self->_movieIsReadyToPlay)
  {
    dispatchQueue = self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_DE894;
    v7[3] = &unk_1AA668;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    dispatch_sync(dispatchQueue, v7);
  }
}

- (void)setIsPlaying:(BOOL)a3
{
  if (self->_isPlaying != a3)
  {
    self->_isPlaying = a3;
    if (self->_movieIsReadyToPlay)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_DEA04;
      block[3] = &unk_1AA6F8;
      block[4] = self;
      dispatch_sync(dispatchQueue, block);
    }
  }
}

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

- (BOOL)newImageIsAvailable
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self->_movieIsReadyToPlay)
  {
    dispatchQueue = self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_DEBA0;
    v6[3] = &unk_1AB5E8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(dispatchQueue, v6);
  }
  BOOL v4 = self->_newImageIsAvailable || *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)loadForTime:(double)a3
{
  if (!self->_avPlayer)
  {
    BOOL v5 = [(MRAssetMaster *)self->super._master imageManager];
    unsigned __int8 v6 = [(MRAssetMaster *)self->super._master isEmbeddedAsset];
    if (v6) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [(MRContext *)[(MRImageManager *)v5 baseContext] assetManager];
    }
    objc_super v8 = (AVURLAsset *)[(MZMediaManagement *)v7 avAssetForAssetAtPath:[(MRAssetMaster *)self->super._master path]];
    if (!v8)
    {
      uint64_t v9 = [(MRAssetMaster *)self->super._master path];
      if ((v6 & 1) == 0) {
        uint64_t v9 = (NSString *)-[MZMediaManagement absolutePathForAssetAtPath:andSize:](v7, "absolutePathForAssetAtPath:andSize:", v9, self->super._size.width, self->super._size.height);
      }
      if ([(NSString *)v9 isAbsolutePath]) {
        char v10 = +[NSURL fileURLWithPath:v9];
      }
      else {
        char v10 = +[NSURL URLWithString:v9];
      }
      objc_super v8 = +[AVURLAsset URLAssetWithURL:v10 options:0];
    }
    v11 = dispatch_semaphore_create(0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_DEDC8;
    v13[3] = &unk_1AB5C0;
    v13[4] = self;
    v13[5] = v8;
    *(double *)&v13[7] = a3;
    v13[6] = v11;
    [(AVURLAsset *)v8 loadValuesAsynchronouslyForKeys:&off_1BC010 completionHandler:v13];
    dispatch_time_t v12 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v11, v12);
    dispatch_release(v11);
  }
}

- (void)_finishLoadingAsset:(id)a3 forTime:(double)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_DEF08;
  v5[3] = &unk_1AB610;
  v5[4] = self;
  v5[5] = a3;
  *(double *)&v5[8] = a4;
  v5[7] = a5;
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "tracksWithMediaType:", AVMediaTypeVideo), "lastObject"), "loadValuesAsynchronouslyForKeys:completionHandler:", &off_1BC028, v5);
}

- (void)_finishLoadingAsset:(id)a3 andVideoTrack:(id)a4 forTime:(double)a5
{
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  if (a4) {
    [a4 preferredTransform];
  }
  if (self->_startTime <= 0.0)
  {
    id v10 = a3;
  }
  else
  {
    int32_t v9 = [v6 naturalTimeScale];
    id v10 = objc_alloc_init((Class)AVMutableComposition);
    double startTime = self->_startTime;
    time.value = 0;
    CMTimeMake(&start, (uint64_t)(startTime * (double)v9), v9);
    CMTimeMake(&duration, (uint64_t)(self->_duration * (double)v9), v9);
    CMTimeRangeMake(&v23, &start, &duration);
    CMTime v20 = kCMTimeZero;
    if (([v10 insertTimeRange:&v23 ofAsset:a3 atTime:&v20 error:&time] & 1) == 0) {
      NSLog(@"%@", time.value);
    }
    id v6 = objc_msgSend(objc_msgSend(v10, "tracksWithMediaType:", AVMediaTypeVideo), "lastObject");
  }
  memset(&v20, 0, sizeof(v20));
  if (v10) {
    [v10 duration];
  }
  dispatch_time_t v12 = +[AVPlayerItem playerItemWithAsset:v10];
  self->_playerItem = v12;
  if (v12)
  {
    memset(&time, 0, sizeof(time));
    [(AVPlayerItem *)v12 duration];
    if ((time.flags & 1) != 0 && (time.flags & 0x1C) == 0 && time.value >= 1) {
      CMTime v20 = time;
    }
  }
  self->_avPlayer = (AVPlayer *)[objc_alloc((Class)AVPlayer) initWithPlayerItem:self->_playerItem];
  CMTime time = v20;
  self->_movieDuration = CMTimeGetSeconds(&time);
  CFStringRef v29 = kCVOpenGLESTextureCacheMaximumTextureAgeKey;
  v30 = &off_1BC090;
  v13 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v14 = (EAGLContext *)objc_msgSend(objc_alloc((Class)EAGLContext), "initWithAPI:sharegroup:", 2, -[EAGLContext sharegroup](-[MRImageManager imageGLContext](-[MRAssetMaster imageManager](self->super._master, "imageManager"), "imageGLContext"), "sharegroup"));
  self->_textureCacheContext = v14;
  CVOpenGLESTextureCacheCreate(kCFAllocatorDefault, (CFDictionaryRef)v13, v14, 0, &self->_cvTextureCache);

  v28[0] = &__kCFBooleanTrue;
  v27[0] = kCVPixelFormatOpenGLESCompatibility;
  v27[1] = kCVPixelBufferPixelFormatTypeKey;
  v28[1] = +[NSNumber numberWithUnsignedInteger:1111970369];
  v27[2] = kCVPixelBufferWidthKey;
  v28[2] = +[NSNumber numberWithUnsignedInteger:(unint64_t)self->super._size.width];
  v27[3] = kCVPixelBufferHeightKey;
  v28[3] = +[NSNumber numberWithUnsignedInteger:(unint64_t)self->super._size.height];
  v15 = (AVPlayerItemVideoOutput *)objc_msgSend(objc_alloc((Class)AVPlayerItemVideoOutput), "initWithPixelBufferAttributes:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
  self->_videoOutput = v15;
  [(AVPlayerItemVideoOutput *)v15 setDelegate:self queue:self->_dispatchQueue];
  [(AVPlayerItemVideoOutput *)self->_videoOutput requestNotificationOfMediaDataChangeWithAdvanceInterval:0.0];
  [(AVPlayerItem *)self->_playerItem addOutput:self->_videoOutput];
  if (v6)
  {
    if (*(double *)&v24 == 1.0)
    {
      if (*((double *)&v25 + 1) == 1.0) {
        unsigned __int8 v16 = 1;
      }
      else {
        unsigned __int8 v16 = 4;
      }
LABEL_28:
      self->_orientation = v16;
      goto LABEL_29;
    }
    if (*(double *)&v24 == -1.0)
    {
      BOOL v17 = *((double *)&v25 + 1) == 1.0;
      unsigned __int8 v16 = 3;
      char v18 = 2;
      goto LABEL_26;
    }
    if (*((double *)&v24 + 1) == 1.0)
    {
      BOOL v17 = *(double *)&v25 == 1.0;
      unsigned __int8 v16 = 6;
      char v18 = 5;
      goto LABEL_26;
    }
    if (*((double *)&v24 + 1) == -1.0)
    {
      BOOL v17 = *(double *)&v25 == 1.0;
      unsigned __int8 v16 = 7;
      char v18 = 8;
LABEL_26:
      if (v17) {
        unsigned __int8 v16 = v18;
      }
      goto LABEL_28;
    }
  }
LABEL_29:
  self->super._CMTime time = a5;
}

- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4
{
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3052000000;
  long long v26 = sub_DF71C;
  v27 = sub_DF72C;
  uint64_t v28 = 0;
  semaphore = self->_semaphore;
  if (!semaphore) {
    goto LABEL_13;
  }
  if ((!self->super._image || self->_imageIsThumbnail) && !self->super._thumbnailIsOK)
  {
    if ([(NSConditionLock *)semaphore lockWhenCondition:1 beforeDate:+[NSDate dateWithTimeIntervalSinceNow:1.0]])
    {
LABEL_8:
      [(NSConditionLock *)self->_semaphore unlock];

      self->_semaphore = 0;
LABEL_13:
      if (a4 < 0.0
        || (videoOutput = self->_videoOutput) == 0
        || ([(AVPlayerItemVideoOutput *)videoOutput itemTimeForHostTime:a4],
            CMTimeEpoch epoch = v22.epoch,
            CMTimeValue value = v22.value,
            CMTimeFlags flags = v22.flags,
            CMTimeScale timescale = v22.timescale,
            (v22.flags & 1) == 0))
      {
        CMTimeMake(&v22, (uint64_t)(a3 * 1000000.0), 1000000);
        CMTimeValue value = v22.value;
        CMTimeFlags flags = v22.flags;
        CMTimeScale timescale = v22.timescale;
        CMTimeEpoch epoch = v22.epoch;
      }
      dispatchQueue = self->_dispatchQueue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_DF738;
      v18[3] = &unk_1AB638;
      *(double *)&v18[6] = a3;
      v18[7] = value;
      CMTimeScale v19 = timescale;
      CMTimeFlags v20 = flags;
      CMTimeEpoch v21 = epoch;
      v18[4] = self;
      v18[5] = &v23;
      dispatch_sync(dispatchQueue, v18);
      goto LABEL_18;
    }
    semaphore = self->_semaphore;
  }
  if ([(NSConditionLock *)semaphore tryLockWhenCondition:1]) {
    goto LABEL_8;
  }
  if ((char *)[(AVPlayer *)self->_avPlayer status] == (char *)&dword_0 + 1 && self->_isPlaying)
  {
    LODWORD(v8) = 1.0;
    [(AVPlayer *)self->_avPlayer setRate:v8];
  }
  if (!self->_semaphore) {
    goto LABEL_13;
  }
LABEL_18:
  if (v24[5])
  {
    BOOL v13 = 0;
  }
  else
  {
    if (self->super._image
      || (id v16 = objc_msgSend(-[MRAssetMaster thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:](self->super._master, "thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:", self->super._isMonochromatic, self->super._generatesMipmap, self->super._usesPowerOfTwo), "retainByUser"), (v24[5] = (uint64_t)v16) == 0)&& (v17 = -[MRContext retainedByUserBlackImage](-[MRImageManager baseContext](-[MRAssetMaster imageManager](self->super._master, "imageManager"), "baseContext"), "retainedByUserBlackImage"), (v24[5] = (uint64_t)v17) == 0))
    {
      id v14 = [(MRImage *)self->super._image retainByUser];
      v24[5] = (uint64_t)v14;
      goto LABEL_23;
    }
    BOOL v13 = 1;
  }
  objc_sync_enter(self);
  [(MRImage *)self->super._image releaseByUser];
  self->super._image = (MRImage *)[(id)v24[5] retainByUser];
  self->_imageIsThumbnail = v13;
  objc_sync_exit(self);
  id v14 = (id)v24[5];
LABEL_23:
  _Block_object_dispose(&v23, 8);
  return v14;
}

- (void)outputMediaDataWillChange:(id)a3
{
  self->_newImageIsAvailable = 1;
  if (self->_movieIsReadyToPlay) {
    goto LABEL_7;
  }
  self->_movieIsReadyToPlay = 1;
  double time = self->super._time;
  if (time > 0.001)
  {
    avPlayer = self->_avPlayer;
    CMTimeMake(&v8, (uint64_t)(time * 1000000.0), 1000000);
    [(AVPlayer *)avPlayer seekToTime:&v8];
    [(AVPlayerItemVideoOutput *)self->_videoOutput requestNotificationOfMediaDataChangeWithAdvanceInterval:0.0];
    self->_newImageIsAvailable = 0;
  }
  [(AVPlayerItem *)self->_playerItem setAudioTimePitchAlgorithm:AVAudioTimePitchAlgorithmVarispeed];
  if (self->_isPlaying)
  {
    LODWORD(v6) = 1.0;
    [(AVPlayer *)self->_avPlayer setRate:v6];
  }
  [(NSConditionLock *)self->_semaphore lock];
  [(NSConditionLock *)self->_semaphore unlockWithCondition:1];
  if (self->_newImageIsAvailable)
  {
LABEL_7:
    [(MRAssetPlayerDelegate *)self->super._delegate imageIsAvailableFromAssetPlayer:self];
    if (!self->_isPlaying)
    {
      LODWORD(v7) = 1.0;
      [(AVPlayer *)self->_avPlayer prerollAtRate:0 completionHandler:v7];
    }
  }
}

- (id)_posterImage:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MRAssetMaster *)self->super._master imageManager];
  if ([(MRAssetMaster *)self->super._master isEmbeddedAsset]) {
    double v6 = 0;
  }
  else {
    double v6 = [(MRContext *)[(MRImageManager *)v5 baseContext] assetManager];
  }
  double v7 = [(MRAssetMaster *)self->super._master path];
  BOOL v8 = v3 || !self->super._thumbnailIsOK;
  id result = -[MZMediaManagement CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:](v6, "CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:", v7, &self->_orientation, v3, v8, self->super._size.width, self->super._size.height);
  if (result)
  {
    id v10 = [[MRTextureSource alloc] initWithCGImage:result textureSize:self->super._size.width | ((unint64_t)self->super._size.height << 32) orientation:0 imageManager:v5 monochromatic:self->super._isMonochromatic];
    v11 = -[MRImage initWithTextureSource:andSize:]([MRImage alloc], "initWithTextureSource:andSize:", v10, self->super._size.width, self->super._size.height);

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

@end