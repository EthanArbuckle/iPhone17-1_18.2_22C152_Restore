@interface NTKVideoListing
- (BOOL)hasTag:(unint64_t)a3;
- (BOOL)snapshotDiffers:(id)a3;
- (CLKVideo)video;
- (UIColor)overlayColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForDevice:(id)a3 withName:(id)a4 videoName:(id)a5 transitionImageName:(id)a6 overlayColor:(id)a7 theme:(unint64_t)a8 variant:(int64_t)a9 clip:(int64_t)a10 tags:(unint64_t)a11;
- (int64_t)clip;
- (int64_t)variant;
- (unint64_t)theme;
- (void)_setHasAssets;
- (void)discardAssets;
@end

@implementation NTKVideoListing

- (id)initForDevice:(id)a3 withName:(id)a4 videoName:(id)a5 transitionImageName:(id)a6 overlayColor:(id)a7 theme:(unint64_t)a8 variant:(int64_t)a9 clip:(int64_t)a10 tags:(unint64_t)a11
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v26 = a6;
  id v25 = a7;
  v27.receiver = self;
  v27.super_class = (Class)NTKVideoListing;
  v21 = [(NTKVideoListing *)&v27 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_device, a3);
    objc_storeStrong((id *)&v22->_name, a4);
    objc_storeStrong((id *)&v22->_videoName, a5);
    objc_storeStrong((id *)&v22->_transitionImageName, a6);
    objc_storeStrong((id *)&v22->_overlayColor, a7);
    v22->_theme = a8;
    v22->_variant = a9;
    v22->_clip = a10;
    v22->_tags = a11;
    v23 = v22;
  }

  return v22;
}

- (void)_setHasAssets
{
  id v3 = +[NTKVideoListingFactory sharedInstanceForDevice:self->_device];
  [v3 setVideoListingHasAssets:self];
}

- (CLKVideo)video
{
  video = self->_video;
  if (!video)
  {
    v4 = (void *)MEMORY[0x1E4F19AE8];
    videoName = self->_videoName;
    device = self->_device;
    v7 = NTKAssetsBundle();
    v8 = [v4 videoNamed:videoName forDevice:device inBundle:v7];
    v9 = self->_video;
    self->_video = v8;

    [(NTKVideoListing *)self _setHasAssets];
    video = self->_video;
  }
  return video;
}

- (BOOL)snapshotDiffers:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 theme];
    if (v6 == [(NTKVideoListing *)self theme])
    {
      uint64_t v7 = [v5 variant];
      BOOL v8 = v7 != [(NTKVideoListing *)self variant];
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initForDevice:self->_device withName:self->_name videoName:self->_videoName transitionImageName:self->_transitionImageName overlayColor:self->_overlayColor theme:self->_theme variant:self->_variant clip:self->_clip tags:self->_tags];
}

- (BOOL)hasTag:(unint64_t)a3
{
  return (a3 & ~self->_tags) == 0;
}

- (void)discardAssets
{
  video = self->_video;
  self->_video = 0;
}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (int64_t)variant
{
  return self->_variant;
}

- (int64_t)clip
{
  return self->_clip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayColor, 0);
  objc_storeStrong((id *)&self->_transitionImageName, 0);
  objc_storeStrong((id *)&self->_videoName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end