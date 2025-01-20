@interface PEPlaybackRateOption
+ (id)_playbackRateOptionsForFrameRate:(unint64_t)a3;
+ (id)playbackRateOptionsForAsset:(id)a3;
+ (id)playbackRateOptionsForEditSource:(id)a3;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PEPlaybackRateOption)initWithType:(unint64_t)a3;
- (PEPlaybackRateOption)initWithType:(unint64_t)a3 videoFrameRate:(unint64_t)a4;
- (float)playbackRate;
- (unint64_t)type;
- (unint64_t)videoFrameRate;
@end

@implementation PEPlaybackRateOption

- (unint64_t)videoFrameRate
{
  return self->_videoFrameRate;
}

- (unint64_t)type
{
  return self->_type;
}

- (float)playbackRate
{
  unint64_t v2 = [(PEPlaybackRateOption *)self type];
  float result = 1.0;
  if (v2 - 1 <= 4) {
    return flt_217BDEC30[v2 - 1];
  }
  return result;
}

- (NSString)localizedSubtitle
{
  if ([(PEPlaybackRateOption *)self videoFrameRate])
  {
    float v3 = (float)[(PEPlaybackRateOption *)self videoFrameRate];
    [(PEPlaybackRateOption *)self playbackRate];
    unint64_t v5 = vcvtps_s32_f32(v4 * v3);
    id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v6 setNumberStyle:0];
    v7 = [NSNumber numberWithInteger:v5];
    v8 = [v6 stringFromNumber:v7];

    v9 = PELocalizedString(@"PlaybackRateOptionFPS");
    v10 = PEStringWithValidatedFormat();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)localizedTitle
{
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v3 setNumberStyle:3];
  float v4 = NSNumber;
  [(PEPlaybackRateOption *)self playbackRate];
  unint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
  id v6 = [v3 stringFromNumber:v5];

  return (NSString *)v6;
}

- (PEPlaybackRateOption)initWithType:(unint64_t)a3 videoFrameRate:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PEPlaybackRateOption;
  float result = [(PEPlaybackRateOption *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_videoFrameRate = a4;
  }
  return result;
}

- (PEPlaybackRateOption)initWithType:(unint64_t)a3
{
  return [(PEPlaybackRateOption *)self initWithType:a3 videoFrameRate:0];
}

+ (id)_playbackRateOptionsForFrameRate:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a3)
  {
    unint64_t v5 = [[PEPlaybackRateOption alloc] initWithType:0 videoFrameRate:a3];
    [v4 addObject:v5];

    if (a3 >= 0x32)
    {
      id v6 = [[PEPlaybackRateOption alloc] initWithType:1 videoFrameRate:a3];
      [v4 addObject:v6];

      if (a3 >= 0x64)
      {
        objc_super v7 = [[PEPlaybackRateOption alloc] initWithType:2 videoFrameRate:a3];
        [v4 addObject:v7];

        v8 = [[PEPlaybackRateOption alloc] initWithType:3 videoFrameRate:a3];
        [v4 addObject:v8];

        if (a3 >= 0xC8)
        {
          v9 = [[PEPlaybackRateOption alloc] initWithType:4 videoFrameRate:a3];
          [v4 addObject:v9];

          v10 = [[PEPlaybackRateOption alloc] initWithType:5 videoFrameRate:a3];
          [v4 addObject:v10];
        }
      }
    }
  }
  v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];

  return v11;
}

+ (id)playbackRateOptionsForAsset:(id)a3
{
  id v3 = a3;
  if ([v3 mediaType] == 2)
  {
    [v3 fetchPropertySetsIfNeeded];
    id v4 = [v3 photosInfoPanelExtendedProperties];
    unint64_t v5 = [v4 fps];
    [v5 floatValue];
    float v7 = v6;

    v8 = +[PEPlaybackRateOption _playbackRateOptionsForFrameRate:(unint64_t)v7];
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

+ (id)playbackRateOptionsForEditSource:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (void *)MEMORY[0x263EFA470];
    unint64_t v5 = [v3 videoURL];
    float v6 = [v4 assetWithURL:v5];

    id v14 = 0;
    [MEMORY[0x263F586C0] nominalFrameRateForAsset:v6 error:&v14];
    int v8 = v7;
    id v9 = v14;
    if (v9)
    {
      v11 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v9;
        _os_log_impl(&dword_217B65000, v11, OS_LOG_TYPE_ERROR, "Failed to load frame rate for supportedPlaybackRatesForEditSource: %@", buf, 0xCu);
      }

      v12 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      LODWORD(v10) = v8;
      v12 = +[PEPlaybackRateOption _playbackRateOptionsForFrameRate:](PEPlaybackRateOption, "_playbackRateOptionsForFrameRate:", [MEMORY[0x263F586C0] nominalFrameRateRoundedToNearestTraditionalFrameRate:v10]);
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

@end