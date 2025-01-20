@interface TVPExternalImagePlayer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTime;
- (CADisplayLink)displayLink;
- (NSDate)playbackDate;
- (NSDate)referenceDate;
- (NSMutableArray)imageInfosBeingLoaded;
- (TVPExternalImageLoader)imageLoader;
- (TVPExternalImagePlayer)initWithMediaItem:(id)a3 referenceTime:(id *)a4 forDate:(id)a5;
- (TVPMediaItem)mediaItem;
- (UIImage)currentImage;
- (double)_timeAfterRemovingInterstitials:(double)a3;
- (double)currentImageTime;
- (double)imageInterval;
- (double)previousTimestamp;
- (double)rate;
- (id)elapsedTimeUpdateBlock;
- (id)imageUpdateBlock;
- (void)_cancelAllImageLoads;
- (void)_cancelStaleImageLoadsForTime:(double)a3;
- (void)_displayLinkTimerFired:(id)a3;
- (void)_loadImagesIfNecessary;
- (void)_updateImageIntervalWithRate:(double)a3;
- (void)invalidate;
- (void)setCurrentImage:(id)a3;
- (void)setCurrentImageTime:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setElapsedTime:(id *)a3;
- (void)setElapsedTimeUpdateBlock:(id)a3;
- (void)setImageInfosBeingLoaded:(id)a3;
- (void)setImageInterval:(double)a3;
- (void)setImageLoader:(id)a3;
- (void)setImageUpdateBlock:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setPlaybackDate:(id)a3;
- (void)setPreviousTimestamp:(double)a3;
- (void)setRate:(double)a3;
- (void)setReferenceDate:(id)a3;
- (void)setReferenceTime:(id *)a3;
@end

@implementation TVPExternalImagePlayer

- (TVPExternalImagePlayer)initWithMediaItem:(id)a3 referenceTime:(id *)a4 forDate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TVPExternalImagePlayer;
  v11 = [(TVPExternalImagePlayer *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaItem, a3);
    uint64_t v13 = MEMORY[0x263F010E0];
    *(_OWORD *)&v12->_elapsedTime.value = *MEMORY[0x263F010E0];
    v12->_elapsedTime.epoch = *(void *)(v13 + 16);
    int64_t var3 = a4->var3;
    *(_OWORD *)&v12->_referenceTime.value = *(_OWORD *)&a4->var0;
    v12->_referenceTime.epoch = var3;
    objc_storeStrong((id *)&v12->_referenceDate, a5);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    imageInfosBeingLoaded = v12->_imageInfosBeingLoaded;
    v12->_imageInfosBeingLoaded = v15;
  }
  return v12;
}

- (void)setRate:(double)a3
{
  if (self->_rate != a3)
  {
    self->_rate = a3;
    if (a3 == 0.0)
    {
      v4 = [(TVPExternalImagePlayer *)self displayLink];
      [v4 invalidate];

      [(TVPExternalImagePlayer *)self setDisplayLink:0];
      [(TVPExternalImagePlayer *)self setPreviousTimestamp:0.0];
      v5 = [(TVPExternalImagePlayer *)self imageInfosBeingLoaded];
      [v5 removeAllObjects];

      v6 = [(TVPExternalImagePlayer *)self imageLoader];
      [v6 invalidate];

      [(TVPExternalImagePlayer *)self setImageLoader:0];
      [(TVPExternalImagePlayer *)self setCurrentImage:0];
    }
    else
    {
      v7 = [(TVPExternalImagePlayer *)self imageLoader];

      if (!v7)
      {
        v8 = [(TVPExternalImagePlayer *)self mediaItem];
        id v9 = [v8 mediaItemMetadataForProperty:@"TVPMediaItemMetadataExternalImageConfig"];

        if (v9)
        {
          id v10 = [[TVPExternalImageLoader alloc] initWithConfig:v9];
          [(TVPExternalImagePlayer *)self setImageLoader:v10];
        }
      }
      [(TVPExternalImagePlayer *)self _cancelAllImageLoads];
      [(TVPExternalImagePlayer *)self _updateImageIntervalWithRate:self->_rate];
      [(TVPExternalImagePlayer *)self _loadImagesIfNecessary];
      v11 = [(TVPExternalImagePlayer *)self displayLink];

      if (!v11)
      {
        id v13 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel__displayLinkTimerFired_];
        [v13 setPreferredFramesPerSecond:30];
        [(TVPExternalImagePlayer *)self setDisplayLink:v13];
        v12 = [MEMORY[0x263EFF9F0] mainRunLoop];
        [v13 addToRunLoop:v12 forMode:*MEMORY[0x263EFF588]];
      }
    }
  }
}

- (void)setElapsedTime:(id *)a3
{
  if ((a3->var2 & 0x1D) == 1)
  {
    long long v3 = *(_OWORD *)&a3->var0;
    self->_elapsedTime.epoch = a3->var3;
    *(_OWORD *)&self->_elapsedTime.value = v3;
  }
}

- (void)invalidate
{
}

- (void)_displayLinkTimerFired:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  double v6 = v5;
  [(TVPExternalImagePlayer *)self previousTimestamp];
  if (v7 == 0.0) {
    double v8 = v6 + -1.0 / (double)[v4 preferredFramesPerSecond];
  }
  else {
    double v8 = v7;
  }
  memset(&v32, 0, sizeof(v32));
  [(TVPExternalImagePlayer *)self elapsedTime];
  CMTime time = v32;
  double Seconds = CMTimeGetSeconds(&time);
  [(TVPExternalImagePlayer *)self rate];
  double v11 = Seconds + (v6 - v8) * v10;
  memset(&time, 0, sizeof(time));
  CMTimeMakeWithSeconds(&time, v11, 1000000);
  v12 = [(TVPExternalImagePlayer *)self referenceDate];
  if (v12)
  {
    memset(&v30, 0, sizeof(v30));
    [(TVPExternalImagePlayer *)self referenceTime];
    CMTime v28 = time;
    CMTimeSubtract(&v30, &v28, &rhs);
    CMTime v28 = v30;
    id v13 = [v12 dateByAddingTimeInterval:CMTimeGetSeconds(&v28)];
  }
  else
  {
    id v13 = 0;
  }
  CMTime v30 = time;
  [(TVPExternalImagePlayer *)self setElapsedTime:&v30];
  [(TVPExternalImagePlayer *)self setPlaybackDate:v13];
  [(TVPExternalImagePlayer *)self setPreviousTimestamp:v6];
  [(TVPExternalImagePlayer *)self _timeAfterRemovingInterstitials:Seconds];
  double v15 = v14;
  [(TVPExternalImagePlayer *)self _timeAfterRemovingInterstitials:v11];
  double v17 = v16;
  if (floor(v16) != floor(v15))
  {
    [(TVPExternalImagePlayer *)self _cancelStaleImageLoadsForTime:v16];
    objc_super v18 = [(TVPExternalImagePlayer *)self imageLoader];
    [(TVPExternalImagePlayer *)self imageInterval];
    [v18 closestImageTimeForTime:v17 imageInterval:v19];
    double v21 = v20;
    [(TVPExternalImagePlayer *)self currentImageTime];
    if (v22 != v21 && [v18 imageIsLoadedForTime:v21])
    {
      v23 = [v18 loadedImageForTime:v21];
      if (v23)
      {
        [(TVPExternalImagePlayer *)self setCurrentImage:v23];
        v24 = [(TVPExternalImagePlayer *)self imageUpdateBlock];

        if (v24)
        {
          v25 = [(TVPExternalImagePlayer *)self imageUpdateBlock];
          ((void (**)(void, void *))v25)[2](v25, v23);
        }
        [(TVPExternalImagePlayer *)self setCurrentImageTime:v21];
      }
    }
  }
  v26 = [(TVPExternalImagePlayer *)self elapsedTimeUpdateBlock];
  if (v26)
  {
    [(TVPExternalImagePlayer *)self rate];
    v27 = (void (*)(void *, CMTime *, CMTime *, void *))v26[2];
    CMTime v30 = time;
    CMTime v28 = v32;
    v27(v26, &v30, &v28, v13);
  }
}

- (void)_loadImagesIfNecessary
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v31 = [(TVPExternalImagePlayer *)self imageLoader];
  if (v31)
  {
    [(TVPExternalImagePlayer *)self rate];
    double v4 = v3;
    memset(&v41, 0, sizeof(v41));
    [(TVPExternalImagePlayer *)self elapsedTime];
    CMTime time = v41;
    [(TVPExternalImagePlayer *)self _timeAfterRemovingInterstitials:CMTimeGetSeconds(&time)];
    double v6 = v5;
    [(TVPExternalImagePlayer *)self imageInterval];
    [v31 closestImageTimeForTime:v4 + v6 imageInterval:v7];
    double v9 = v8;
    [(TVPExternalImagePlayer *)self imageInterval];
    double v11 = v10;
    id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v4 <= 0.0)
    {
      [v31 firstImageTime];
      for (i = v15; v9 >= i; double v9 = v9 - v11)
      {
        if ((objc_msgSend(v31, "imageIsLoadedForTime:", v9, v30) & 1) == 0)
        {
          double v17 = objc_alloc_init(TVPPlaybackImageLoadInfo);
          [(TVPPlaybackImageLoadInfo *)v17 setRequestedTime:v9];
          [v30 addObject:v17];
        }
      }
    }
    else
    {
      [v31 lastImageTime];
      for (j = v12; v9 <= j; double v9 = v11 + v9)
      {
        if ((objc_msgSend(v31, "imageIsLoadedForTime:", v9, v30) & 1) == 0)
        {
          double v14 = objc_alloc_init(TVPPlaybackImageLoadInfo);
          [(TVPPlaybackImageLoadInfo *)v14 setRequestedTime:v9];
          [v30 addObject:v14];
        }
      }
    }
    objc_super v18 = v30;
    if (v30)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v19 = v30;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v37;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v37 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * v22);
            v24 = [(TVPExternalImagePlayer *)self imageInfosBeingLoaded];
            v25 = [(TVPExternalImagePlayer *)self imageInfosBeingLoaded];
            uint64_t v26 = objc_msgSend(v24, "indexOfObject:inSortedRange:options:usingComparator:", v23, 0, objc_msgSend(v25, "count"), 1024, &__block_literal_global_7);

            v27 = [(TVPExternalImagePlayer *)self imageInfosBeingLoaded];
            [v27 insertObject:v23 atIndex:v26];

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v20);
      }

      objc_initWeak((id *)&time, self);
      CMTime v28 = [v19 valueForKey:@"requestedTime"];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_2;
      v34[3] = &unk_264CC53F8;
      objc_copyWeak(&v35, (id *)&time);
      v29 = objc_msgSend(v31, "loadImagesForTimes:maxSize:withHandler:", v28, v34, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_2_11;
      v32[3] = &unk_264CC5420;
      id v33 = v19;
      [v29 enumerateObjectsUsingBlock:v32];

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)&time);
      objc_super v18 = v30;
    }
  }
}

uint64_t __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 requestedTime];
  double v7 = v6;
  [v5 requestedTime];
  if (v7 >= v8)
  {
    [v4 requestedTime];
    double v11 = v10;
    [v5 requestedTime];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  uint64_t v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  double v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  uint64_t v9 = [WeakRetained imageInfosBeingLoaded];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_8;
  v14[3] = &unk_264CC53D0;
  id v10 = v5;
  id v15 = v10;
  double v16 = &v24;
  double v17 = &v18;
  [v9 enumerateObjectsUsingBlock:v14];

  double v11 = (void *)v19[5];
  if (v11)
  {
    [v11 setIdentifier:0];
    id v12 = objc_loadWeakRetained(v7);
    id v13 = [v12 imageInfosBeingLoaded];
    [v13 removeObjectAtIndex:v25[3]];
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_8(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  double v8 = [v10 identifier];
  int v9 = [v8 isEqual:a1[4]];

  if (v9)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
}

void __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_2_11(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  [v6 setIdentifier:v5];
}

- (void)_cancelAllImageLoads
{
  id v5 = [(TVPExternalImagePlayer *)self imageLoader];
  double v3 = [(TVPExternalImagePlayer *)self imageInfosBeingLoaded];
  id v4 = [v3 valueForKey:@"identifier"];
  [v5 cancelImageLoadingForIdentifiers:v4];
}

- (void)_cancelStaleImageLoadsForTime:(double)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F089C8]);
  [(TVPExternalImagePlayer *)self rate];
  double v7 = v6;
  double v8 = [(TVPExternalImagePlayer *)self imageInfosBeingLoaded];
  if (v7 <= 0.0)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__TVPExternalImagePlayer__cancelStaleImageLoadsForTime___block_invoke_2;
    v11[3] = &unk_264CC5448;
    *(double *)&v12[1] = a3;
    int v9 = (id *)v12;
    v12[0] = v5;
    [v8 enumerateObjectsWithOptions:2 usingBlock:v11];
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __56__TVPExternalImagePlayer__cancelStaleImageLoadsForTime___block_invoke;
    v13[3] = &unk_264CC5448;
    *(double *)&v14[1] = a3;
    int v9 = (id *)v14;
    v14[0] = v5;
    [v8 enumerateObjectsUsingBlock:v13];
  }

  id v10 = [(TVPExternalImagePlayer *)self imageInfosBeingLoaded];
  [v10 removeObjectsAtIndexes:v5];
}

uint64_t __56__TVPExternalImagePlayer__cancelStaleImageLoadsForTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 requestedTime];
  if (v8 >= *(double *)(a1 + 40))
  {
    *a4 = 1;
  }
  else
  {
    int v9 = *(void **)(a1 + 32);
    return [v9 addIndex:a3];
  }
  return result;
}

uint64_t __56__TVPExternalImagePlayer__cancelStaleImageLoadsForTime___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 requestedTime];
  if (v8 <= *(double *)(a1 + 40))
  {
    *a4 = 1;
  }
  else
  {
    int v9 = *(void **)(a1 + 32);
    return [v9 addIndex:a3];
  }
  return result;
}

- (void)_updateImageIntervalWithRate:(double)a3
{
  id v5 = [(TVPExternalImagePlayer *)self mediaItem];
  id v7 = [v5 mediaItemMetadataForProperty:@"TVPMediaItemMetadataExternalImageConfig"];

  [v7 imageInterval];
  [(TVPExternalImagePlayer *)self setImageInterval:(double)(uint64_t)(vcvtpd_s64_f64(fabs(a3) * 0.25 / (double)(uint64_t)v6) * (uint64_t)v6)];
}

- (double)_timeAfterRemovingInterstitials:(double)a3
{
  id v4 = [(TVPExternalImagePlayer *)self mediaItem];
  id v5 = [v4 mediaItemMetadataForProperty:@"TVPMediaItemMetadataInterstitialCollection"];

  if (v5)
  {
    [v5 timeAdjustedByRemovingInterstitials:a3];
    a3 = v6;
  }

  return a3;
}

- (double)rate
{
  return self->_rate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (NSDate)playbackDate
{
  return self->_playbackDate;
}

- (void)setPlaybackDate:(id)a3
{
}

- (UIImage)currentImage
{
  return self->_currentImage;
}

- (void)setCurrentImage:(id)a3
{
}

- (id)elapsedTimeUpdateBlock
{
  return self->_elapsedTimeUpdateBlock;
}

- (void)setElapsedTimeUpdateBlock:(id)a3
{
}

- (id)imageUpdateBlock
{
  return self->_imageUpdateBlock;
}

- (void)setImageUpdateBlock:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (double)previousTimestamp
{
  return self->_previousTimestamp;
}

- (void)setPreviousTimestamp:(double)a3
{
  self->_previousTimestamp = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (void)setReferenceTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_referenceTime.epoch = a3->var3;
  *(_OWORD *)&self->_referenceTime.value = v3;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (TVPExternalImageLoader)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (NSMutableArray)imageInfosBeingLoaded
{
  return self->_imageInfosBeingLoaded;
}

- (void)setImageInfosBeingLoaded:(id)a3
{
}

- (double)currentImageTime
{
  return self->_currentImageTime;
}

- (void)setCurrentImageTime:(double)a3
{
  self->_currentImageTime = a3;
}

- (double)imageInterval
{
  return self->_imageInterval;
}

- (void)setImageInterval:(double)a3
{
  self->_imageInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageInfosBeingLoaded, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_imageUpdateBlock, 0);
  objc_storeStrong(&self->_elapsedTimeUpdateBlock, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_playbackDate, 0);
}

@end