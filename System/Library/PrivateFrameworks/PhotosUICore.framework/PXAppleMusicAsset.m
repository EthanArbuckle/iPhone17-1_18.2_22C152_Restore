@interface PXAppleMusicAsset
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exportableDuration;
- (BOOL)isAudioEqualToAsset:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)audioSessionClass;
- (Class)defaultMediaProviderClass;
- (NSArray)entryPoints;
- (NSNumber)energy;
- (NSNumber)loudnessMainPeak;
- (NSNumber)loudnessMainValue;
- (NSNumber)valence;
- (NSNumber)visualTempo;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)artworkURLFormat;
- (NSString)assetTagsDescription;
- (NSString)colorGradeCategory;
- (NSString)contentProvider;
- (NSString)storeID;
- (NSString)title;
- (NSURL)introPreviewURL;
- (NSURL)songURL;
- (PHPhotoLibrary)photoLibrary;
- (PXAppleMusicAsset)init;
- (PXAppleMusicAsset)initWithConfiguration:(id)a3;
- (PXAppleMusicAsset)initWithMediaItem:(id)a3;
- (PXAudioAsset)previewAudioAsset;
- (PXAudioCueSource)cueSource;
- (PXDisplayAsset)artworkDisplayAsset;
- (id)artworkURLForTargetPixelSize:(CGSize)a3;
- (int64_t)catalog;
- (int64_t)pace;
- (int64_t)px_storyResourceKind;
- (unint64_t)flags;
- (void)configureCuesWithVideoEventTimestampsInSeconds:(id)a3 videoEventScores:(id)a4;
- (void)setAlbumTitle:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setArtworkURLFormat:(id)a3;
- (void)setColorGradeCategory:(id)a3;
- (void)setContentProvider:(id)a3;
- (void)setDuration:(id *)a3;
- (void)setEnergy:(id)a3;
- (void)setEntryPoints:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIntroPreviewURL:(id)a3;
- (void)setLoudnessMainPeak:(id)a3;
- (void)setLoudnessMainValue:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setSongURL:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValence:(id)a3;
- (void)setVisualTempo:(id)a3;
@end

@implementation PXAppleMusicAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_entryPoints, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_loudnessMainValue, 0);
  objc_storeStrong((id *)&self->_loudnessMainPeak, 0);
  objc_storeStrong((id *)&self->_introPreviewURL, 0);
  objc_storeStrong((id *)&self->_songURL, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_visualTempo, 0);
  objc_storeStrong((id *)&self->_valence, 0);
  objc_storeStrong((id *)&self->_energy, 0);
  objc_storeStrong((id *)&self->_artworkURLFormat, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setContentProvider:(id)a3
{
}

- (NSString)contentProvider
{
  return self->_contentProvider;
}

- (void)setEntryPoints:(id)a3
{
}

- (NSArray)entryPoints
{
  return self->_entryPoints;
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- (void)setLoudnessMainValue:(id)a3
{
}

- (NSNumber)loudnessMainValue
{
  return self->_loudnessMainValue;
}

- (void)setLoudnessMainPeak:(id)a3
{
}

- (NSNumber)loudnessMainPeak
{
  return self->_loudnessMainPeak;
}

- (void)setIntroPreviewURL:(id)a3
{
}

- (NSURL)introPreviewURL
{
  return self->_introPreviewURL;
}

- (void)setSongURL:(id)a3
{
}

- (NSURL)songURL
{
  return self->_songURL;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setColorGradeCategory:(id)a3
{
}

- (void)setVisualTempo:(id)a3
{
}

- (NSNumber)visualTempo
{
  return self->_visualTempo;
}

- (void)setValence:(id)a3
{
}

- (NSNumber)valence
{
  return self->_valence;
}

- (void)setEnergy:(id)a3
{
}

- (NSNumber)energy
{
  return self->_energy;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (void)setArtworkURLFormat:(id)a3
{
}

- (NSString)artworkURLFormat
{
  return self->_artworkURLFormat;
}

- (void)setAlbumTitle:(id)a3
{
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exportableDuration
{
  return +[PXAppleMusicPreviewAsset previewClipDuration];
}

- (PXAudioAsset)previewAudioAsset
{
  v2 = [[PXAppleMusicPreviewAsset alloc] initWithOriginalAsset:self];
  return (PXAudioAsset *)v2;
}

- (int64_t)catalog
{
  return 2;
}

- (Class)defaultMediaProviderClass
{
  return (Class)objc_opt_class();
}

- (id)artworkURLForTargetPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v6 = [(PXAppleMusicAsset *)self artworkURLFormat];
  if (v6)
  {
    *(float *)&double v7 = width;
    *(float *)&double v7 = floorf(*(float *)&v7);
    v8 = [NSNumber numberWithFloat:v7];
    v9 = [v8 stringValue];

    float v10 = height;
    *(float *)&double v11 = floorf(v10);
    v12 = [NSNumber numberWithFloat:v11];
    v13 = [v12 stringValue];

    v14 = [v6 stringByReplacingOccurrencesOfString:@"{w}" withString:v9];
    v15 = [v14 stringByReplacingOccurrencesOfString:@"{h}" withString:v13];

    v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
  }
  else
  {
    v17 = PLStoryGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138412290;
      v20 = self;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEBUG, "%@ was asked for an artwork URL, but the required URL format string is missing.", (uint8_t *)&v19, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (PXDisplayAsset)artworkDisplayAsset
{
  v2 = [[PXAppleMusicArtworkAsset alloc] initWithMusicAsset:self];
  return (PXDisplayAsset *)v2;
}

- (void)configureCuesWithVideoEventTimestampsInSeconds:(id)a3 videoEventScores:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXAppleMusicAsset.m", 164, @"Invalid parameter not satisfying: %@", @"videoEventTimestampsInSeconds.count == videoEventScores.count" object file lineNumber description];
  }
  id v10 = v8;
  uint64_t v11 = [v10 count];
  v12 = [PXConcreteAudioCueSource alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__PXAppleMusicAsset_configureCuesWithVideoEventTimestampsInSeconds_videoEventScores___block_invoke;
  v18[3] = &unk_1E5DB1190;
  id v20 = v10;
  uint64_t v21 = v11;
  id v19 = v7;
  id v13 = v10;
  id v14 = v7;
  v15 = [(PXConcreteAudioCueSource *)v12 initWithNumberOfCues:v11 configuration:v18];
  cueSource = self->_cueSource;
  self->_cueSource = v15;
}

void __85__PXAppleMusicAsset_configureCuesWithVideoEventTimestampsInSeconds_videoEventScores___block_invoke(uint64_t a1, CMTime *a2)
{
  id v4 = *(id *)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [v4 objectAtIndexedSubscript:v5];
      [v6 floatValue];
      CMTimeMakeWithSeconds(&v11, v7, PXAudioDefaultCMTimeScale);
      *a2 = v11;

      id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v5];
      unsigned int v9 = [v8 intValue];

      if (v9 >= 0x384) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = 3;
      }
      if (v9 < 0x2BC) {
        uint64_t v10 = 4;
      }
      if (v9 < 0x1F4) {
        uint64_t v10 = 2;
      }
      if ((int)v9 < 300) {
        uint64_t v10 = 1;
      }
      a2[1].value = v10;
      ++v5;
      a2 = (CMTime *)((char *)a2 + 32);
    }
    while (v5 < *(void *)(a1 + 48));
  }
}

- (NSString)assetTagsDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(PXAppleMusicAsset *)self valence];
  [v4 doubleValue];
  [v3 appendFormat:@"valence=%.2f", v5];

  v6 = [(PXAppleMusicAsset *)self energy];
  [v6 doubleValue];
  [v3 appendFormat:@",arousal=%.2f", v7];

  id v8 = [(PXAppleMusicAsset *)self visualTempo];
  [v8 doubleValue];
  [v3 appendFormat:@",visualTempo=%.2f", v9];

  return (NSString *)v3;
}

- (int64_t)pace
{
  id v3 = [(PXAppleMusicAsset *)self visualTempo];

  if (!v3) {
    return 2;
  }
  id v4 = [MEMORY[0x1E4F8CDA8] standardConfiguration];
  uint64_t v5 = [(PXAppleMusicAsset *)self visualTempo];
  [v5 doubleValue];

  int64_t v6 = PFStoryRecipeSongPaceFromVisualTempo();
  return v6;
}

- (NSString)colorGradeCategory
{
  if (!self->_colorGradeCategory)
  {
    uint64_t v3 = [(PXAppleMusicAsset *)self valence];
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = [(PXAppleMusicAsset *)self energy];

      if (v5)
      {
        int64_t v6 = [(PXAppleMusicAsset *)self valence];
        [v6 doubleValue];

        uint64_t v7 = [(PXAppleMusicAsset *)self energy];
        [v7 doubleValue];

        PFStoryColorGradeCategoryFromValenceArousal();
        id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        colorGradeCategory = self->_colorGradeCategory;
        self->_colorGradeCategory = v8;
      }
    }
  }
  uint64_t v10 = self->_colorGradeCategory;
  return v10;
}

- (Class)audioSessionClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXAppleMusicAsset *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(PXAppleMusicAsset *)v4 identifier];
      int64_t v6 = [(PXAppleMusicAsset *)self identifier];
      if (v5 == v6) {
        char v7 = 1;
      }
      else {
        char v7 = [v5 isEqual:v6];
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isAudioEqualToAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAppleMusicAsset *)self identifier];
  id v6 = [v4 identifier];
  if (v5 == v6)
  {

    goto LABEL_5;
  }
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
LABEL_5:
    uint64_t v9 = [v4 catalog];
    BOOL v8 = v9 == [(PXAppleMusicAsset *)self catalog];
    goto LABEL_6;
  }
  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (PXAppleMusicAsset)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicAsset.m", 91, @"%s is not available as initializer", "-[PXAppleMusicAsset init]");

  abort();
}

- (PXAppleMusicAsset)initWithMediaItem:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PXAppleMusicAsset_initWithMediaItem___block_invoke;
  v8[3] = &unk_1E5DC0968;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(PXAppleMusicAsset *)self initWithConfiguration:v8];

  return v6;
}

void __39__PXAppleMusicAsset_initWithMediaItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F31448]];
  [v3 setStoreID:v4];

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F31538]];
  [v3 setTitle:v5];

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F312F8]];
  [v3 setArtistName:v6];

  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F312E8]];
  [v3 setAlbumTitle:v7];

  BOOL v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F31440]];
  [v8 doubleValue];
  Float64 v10 = v9;

  if (v10 <= 0.0) {
    CMTime v12 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  }
  else {
    CMTimeMakeWithSeconds(&v12, v10, PXAudioDefaultCMTimeScale);
  }
  CMTime v11 = v12;
  [v3 setDuration:&v11];
  objc_msgSend(v3, "setFlags:", objc_msgSend(*(id *)(a1 + 32), "isExplicitItem"));
  [v3 setArtworkURLFormat:0];
  [v3 setSongURL:0];
  [v3 setIntroPreviewURL:0];
  [v3 setVisualTempo:0];
  [v3 setLoudnessMainPeak:0];
  [v3 setLoudnessMainValue:0];
}

- (PXAppleMusicAsset)initWithConfiguration:(id)a3
{
  id v4 = (void (**)(id, PXAppleMusicAsset *))a3;
  v7.receiver = self;
  v7.super_class = (Class)PXAppleMusicAsset;
  id v5 = [(PXAppleMusicAsset *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (int64_t)px_storyResourceKind
{
  return 2;
}

@end