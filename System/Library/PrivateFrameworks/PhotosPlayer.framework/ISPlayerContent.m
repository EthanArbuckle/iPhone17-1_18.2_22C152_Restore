@interface ISPlayerContent
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration;
- (AVPlayerItem)videoPlayerItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)photoHasColorAdjustments;
- (BOOL)photoIsOriginal;
- (BOOL)supportsVitality;
- (CGImage)photo;
- (ISPlayerContent)initWithPhoto:(CGImage *)a3 photoIsOriginal:(BOOL)a4 photoEXIFOrientation:(int)a5 photoTime:(id *)a6 videoDuration:(id *)a7 photoHasColorAdjustments:(BOOL)a8 videoPlayerItem:(id)a9 variationIdentifier:(id)a10 supportsVitality:(BOOL)a11;
- (NSNumber)variationIdentifier;
- (int)photoEXIFOrientation;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation ISPlayerContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationIdentifier, 0);

  objc_storeStrong((id *)&self->_videoPlayerItem, 0);
}

- (NSNumber)variationIdentifier
{
  return self->_variationIdentifier;
}

- (BOOL)supportsVitality
{
  return self->_supportsVitality;
}

- (BOOL)photoIsOriginal
{
  return self->_photoIsOriginal;
}

- (BOOL)photoHasColorAdjustments
{
  return self->_photoHasColorAdjustments;
}

- (AVPlayerItem)videoPlayerItem
{
  return self->_videoPlayerItem;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (int)photoEXIFOrientation
{
  return self->_photoEXIFOrientation;
}

- (CGImage)photo
{
  return self->_photo;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)ISPlayerContent;
  v3 = [(ISPlayerContent *)&v9 hash];
  v4 = &v3[[(AVPlayerItem *)self->_videoPlayerItem hash] + self->_photoHasColorAdjustments];
  $95D729B680665BEAEFA1D6FCA8238556 videoDuration = self->_videoDuration;
  unint64_t v5 = (unint64_t)(CMTimeGetSeconds((CMTime *)&videoDuration) * 10000.0);
  v6 = &v4[self->_photoIsOriginal];
  return (unint64_t)&v6[[(NSNumber *)self->_variationIdentifier hash] + self->_supportsVitality + v5];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    photo = self->_photo;
    if (photo != (CGImage *)[v6 photo]) {
      goto LABEL_8;
    }
    if (v6) {
      [v6 photoTime];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = (CMTime)self->_photoTime;
    if (CMTimeCompare(&time1, &time2))
    {
LABEL_8:
      BOOL v8 = 0;
LABEL_9:

      goto LABEL_10;
    }
    videoPlayerItem = self->_videoPlayerItem;
    v11 = [v6 videoPlayerItem];
    if (videoPlayerItem != v11) {
      goto LABEL_21;
    }
    int photoHasColorAdjustments = self->_photoHasColorAdjustments;
    if (photoHasColorAdjustments != [v6 photoHasColorAdjustments]) {
      goto LABEL_21;
    }
    if (v6) {
      [v6 videoDuration];
    }
    else {
      memset(&v18, 0, sizeof(v18));
    }
    CMTime time1 = (CMTime)self->_videoDuration;
    if (CMTimeCompare(&time1, &v18)
      || (int photoIsOriginal = self->_photoIsOriginal, photoIsOriginal != [v6 photoIsOriginal]))
    {
LABEL_21:
      BOOL v8 = 0;
LABEL_22:

      goto LABEL_9;
    }
    variationIdentifier = self->_variationIdentifier;
    v15 = [v6 variationIdentifier];
    if (variationIdentifier == v15
      || (v16 = self->_variationIdentifier,
          [v6 variationIdentifier],
          v3 = objc_claimAutoreleasedReturnValue(),
          [(NSNumber *)v16 isEqual:v3]))
    {
      int supportsVitality = self->_supportsVitality;
      BOOL v8 = supportsVitality == [v6 supportsVitality];
      if (variationIdentifier == v15)
      {
LABEL_25:

        goto LABEL_22;
      }
    }
    else
    {
      BOOL v8 = 0;
    }

    goto LABEL_25;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (void)dealloc
{
  CGImageRelease(self->_photo);
  v3 = +[ISDeferredDealloc sharedInstance];
  [v3 _performDeferredDealloc:self->_videoPlayerItem];

  v4.receiver = self;
  v4.super_class = (Class)ISPlayerContent;
  [(ISPlayerContent *)&v4 dealloc];
}

- (ISPlayerContent)initWithPhoto:(CGImage *)a3 photoIsOriginal:(BOOL)a4 photoEXIFOrientation:(int)a5 photoTime:(id *)a6 videoDuration:(id *)a7 photoHasColorAdjustments:(BOOL)a8 videoPlayerItem:(id)a9 variationIdentifier:(id)a10 supportsVitality:(BOOL)a11
{
  id v17 = a9;
  id v18 = a10;
  v24.receiver = self;
  v24.super_class = (Class)ISPlayerContent;
  v19 = [(ISPlayerContent *)&v24 init];
  if (v19)
  {
    *((void *)v19 + 2) = CGImageRetain(a3);
    *((_DWORD *)v19 + 3) = a5;
    v19[8] = a8;
    int64_t var3 = a6->var3;
    *(_OWORD *)(v19 + 40) = *(_OWORD *)&a6->var0;
    *((void *)v19 + 7) = var3;
    int64_t v21 = a7->var3;
    *((_OWORD *)v19 + 4) = *(_OWORD *)&a7->var0;
    *((void *)v19 + 10) = v21;
    objc_storeStrong((id *)v19 + 3, a9);
    v19[9] = a4;
    objc_storeStrong((id *)v19 + 4, a10);
    v19[10] = a11;
  }

  return (ISPlayerContent *)v19;
}

@end