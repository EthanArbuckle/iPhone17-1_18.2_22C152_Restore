@interface ISAsset
+ (id)assetForURL:(id)a3 error:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoCMTime;
- (AVAsset)videoAsset;
- (BOOL)hasColorAdjustments;
- (CGImage)photo;
- (ISAsset)init;
- (ISAsset)initWithVideoAsset:(id)a3 UIImage:(id)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6 options:(unint64_t)a7;
- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5;
- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5 options:(unint64_t)a6;
- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6;
- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6 options:(unint64_t)a7;
- (double)photoTime;
- (id)description;
- (int)photoEXIFOrientation;
- (unint64_t)options;
- (void)dealloc;
- (void)resetAVObjects;
@end

@implementation ISAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAsset, 0);

  objc_storeStrong(&self->_UIImage, 0);
}

- (unint64_t)options
{
  return self->_options;
}

- (int)photoEXIFOrientation
{
  return self->_photoEXIFOrientation;
}

- (double)photoTime
{
  return self->_photoTime;
}

- (CGImage)photo
{
  return self->_photo;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (BOOL)hasColorAdjustments
{
  return [(ISAsset *)self options] & 1;
}

- (void)resetAVObjects
{
  id v6 = [(ISAsset *)self videoAsset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v6 URL];
    v4 = [MEMORY[0x1E4F166C8] assetWithURL:v3];
    videoAsset = self->_videoAsset;
    self->_videoAsset = v4;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoCMTime
{
  [(ISAsset *)self photoTime];

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 1000);
}

- (ISAsset)initWithVideoAsset:(id)a3 UIImage:(id)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6 options:(unint64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a4;
  id v13 = a3;
  v14 = -[ISAsset initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:](self, "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:", v13, [v12 CGImage], v8, a7, a5);

  if (v14) {
    objc_storeStrong(&v14->_UIImage, v12);
  }

  return v14;
}

- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6 options:(unint64_t)a7
{
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ISAsset;
  id v13 = [(ISAsset *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    videoAsset = v13->_videoAsset;
    v13->_videoAsset = (AVAsset *)v14;

    v13->_photo = CGImageRetain(a4);
    v13->_photoTime = a5;
    v13->_photoEXIFOrientation = a6;
    v13->_options = a7;
  }

  return v13;
}

- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6
{
  return [(ISAsset *)self initWithVideoAsset:a3 photo:a4 photoTime:*(void *)&a6 photoEXIFOrientation:0 options:a5];
}

- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5
{
  return [(ISAsset *)self initWithVideoAsset:a3 photo:a4 photoTime:0 photoEXIFOrientation:0 options:a5];
}

- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5 options:(unint64_t)a6
{
  return [(ISAsset *)self initWithVideoAsset:a3 photo:a4 photoTime:0 photoEXIFOrientation:a6 options:a5];
}

- (ISAsset)init
{
  return [(ISAsset *)self initWithVideoAsset:0 photo:0 photoTime:0 photoEXIFOrientation:0 options:0.0];
}

- (void)dealloc
{
  CGImageRelease(self->_photo);
  v3 = +[ISDeferredDealloc sharedInstance];
  [v3 _performDeferredDealloc:self->_videoAsset];

  v4.receiver = self;
  v4.super_class = (Class)ISAsset;
  [(ISAsset *)&v4 dealloc];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)ISAsset;
  objc_super v4 = [(ISAsset *)&v9 description];
  v5 = [v3 stringWithString:v4];

  [v5 appendFormat:@"\n\tPhoto: %@", -[ISAsset photo](self, "photo")];
  id v6 = [(ISAsset *)self videoAsset];
  [v5 appendFormat:@"\n\tVideo: %@", v6];

  v7 = (void *)[v5 copy];

  return v7;
}

+ (id)assetForURL:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F8CE20];
    id v7 = a3;
    uint64_t v8 = (void *)[[v6 alloc] initWithBundleAtURL:v7];

    objc_super v9 = [v8 imagePath];
    v10 = [v8 videoPath];
    if (v8)
    {
      [v8 imageDisplayTime];
      CMTimeFlags flags = v23.flags;
      CMTimeEpoch epoch = v23.epoch;
    }
    else
    {
      CMTimeEpoch epoch = 0;
      CMTimeFlags flags = 0;
      memset(&v23, 0, sizeof(v23));
    }
    CMTimeValue value = v23.value;
    CMTimeScale timescale = v23.timescale;
    if (v9)
    {
      id v14 = (id) [objc_alloc(MEMORY[0x1E4F42A80]) initWithContentsOfFile:v9];
      uint64_t v15 = [v14 CGImage];
      if (v15)
      {
        uint64_t v16 = v15;
        if (v10)
        {
          objc_super v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
          v18 = [MEMORY[0x1E4F166C8] assetWithURL:v17];
          double Seconds = 0.0;
          if (flags)
          {
            v23.CMTimeValue value = value;
            v23.CMTimeScale timescale = timescale;
            v23.CMTimeFlags flags = flags;
            v23.CMTimeEpoch epoch = epoch;
            double Seconds = CMTimeGetSeconds(&v23);
          }
        }
        else
        {
          v18 = 0;
          double Seconds = 0.0;
        }
        uint64_t v20 = objc_msgSend(v14, "imageOrientation", v23.value, *(void *)&v23.timescale, v23.epoch);
        if ((unint64_t)(v20 - 1) > 6) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = qword_1DB24DF00[v20 - 1];
        }
        id v13 = (void *)[objc_alloc((Class)a1) initWithVideoAsset:v18 photo:v16 photoTime:v21 photoEXIFOrientation:Seconds];
      }
      else
      {
        id v13 = 0;
        if (a4) {
          *a4 = 0;
        }
      }
    }
    else
    {
      id v13 = 0;
      if (a4) {
        *a4 = 0;
      }
    }
  }
  else
  {
    id v13 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v13;
}

@end