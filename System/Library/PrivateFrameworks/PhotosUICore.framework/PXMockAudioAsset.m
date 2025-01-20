@interface PXMockAudioAsset
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exportableDuration;
- (BOOL)isAudioEqualToAsset:(id)a3;
- (Class)audioSessionClass;
- (Class)defaultMediaProviderClass;
- (NSArray)entryPoints;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)artworkURLFormat;
- (NSString)assetTagsDescription;
- (NSString)colorGradeCategory;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (PXDisplayAsset)artworkDisplayAsset;
- (PXMockAudioAsset)init;
- (PXMockAudioAsset)initWithConfiguration:(id)a3;
- (id)artworkURLForTargetPixelSize:(CGSize)a3;
- (int64_t)catalog;
- (int64_t)pace;
- (int64_t)px_storyResourceKind;
- (unint64_t)flags;
- (void)setAlbumTitle:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setArtworkURLFormat:(id)a3;
- (void)setAudioSessionClass:(Class)a3;
- (void)setColorGradeCategory:(id)a3;
- (void)setDuration:(id *)a3;
- (void)setEntryPoints:(id)a3;
- (void)setExportableDuration:(id *)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPace:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXMockAudioAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPoints, 0);
  objc_storeStrong((id *)&self->_audioSessionClass, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artworkURLFormat, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setExportableDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_exportableDuration.epoch = a3->var3;
  *(_OWORD *)&self->_exportableDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exportableDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setEntryPoints:(id)a3
{
}

- (NSArray)entryPoints
{
  return self->_entryPoints;
}

- (void)setAudioSessionClass:(Class)a3
{
}

- (Class)audioSessionClass
{
  return self->_audioSessionClass;
}

- (void)setPace:(int64_t)a3
{
  self->_pace = a3;
}

- (int64_t)pace
{
  return self->_pace;
}

- (void)setColorGradeCategory:(id)a3
{
}

- (NSString)colorGradeCategory
{
  return self->_colorGradeCategory;
}

- (void)setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
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

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)catalog
{
  return 1;
}

- (Class)defaultMediaProviderClass
{
  return 0;
}

- (id)artworkURLForTargetPixelSize:(CGSize)a3
{
  double height = a3.height;
  *(float *)&a3.width = a3.width;
  *(float *)&a3.width = floorf(*(float *)&a3.width);
  v5 = [NSNumber numberWithFloat:a3.width];
  v6 = [v5 stringValue];

  float v7 = height;
  *(float *)&double v8 = floorf(v7);
  v9 = [NSNumber numberWithFloat:v8];
  v10 = [v9 stringValue];

  v11 = [(PXMockAudioAsset *)self artworkURLFormat];
  v12 = [v11 stringByReplacingOccurrencesOfString:@"{w}" withString:v6];
  v13 = [v12 stringByReplacingOccurrencesOfString:@"{h}" withString:v10];

  v14 = [MEMORY[0x1E4F1CB10] URLWithString:v13];

  return v14;
}

- (PXDisplayAsset)artworkDisplayAsset
{
  return 0;
}

- (NSString)assetTagsDescription
{
  return (NSString *)&stru_1F00B0030;
}

- (BOOL)isAudioEqualToAsset:(id)a3
{
  id v4 = a3;
  if ([v4 catalog] == 1)
  {
    v5 = [v4 identifier];
    v6 = [(PXMockAudioAsset *)self identifier];
    if (v5 == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 isEqualToString:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (PXMockAudioAsset)init
{
  v15.receiver = self;
  v15.super_class = (Class)PXMockAudioAsset;
  v2 = [(PXMockAudioAsset *)&v15 init];
  if (v2)
  {
    long long v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    uint64_t v6 = [[NSString alloc] initWithFormat:@"Mock Song %@", v2->_identifier];
    title = v2->_title;
    v2->_title = (NSString *)v6;

    uint64_t v8 = [[NSString alloc] initWithFormat:@"Mock Artist %@", v2->_identifier];
    artistName = v2->_artistName;
    v2->_artistName = (NSString *)v8;

    uint64_t v10 = [[NSString alloc] initWithFormat:@"Mock Album %@", v2->_identifier];
    albumTitle = v2->_albumTitle;
    v2->_albumTitle = (NSString *)v10;

    v2->_pace = 2;
    uint64_t v12 = objc_opt_class();
    Class audioSessionClass = v2->_audioSessionClass;
    v2->_Class audioSessionClass = (Class)v12;

    v2->_flags = 0;
  }
  return v2;
}

- (PXMockAudioAsset)initWithConfiguration:(id)a3
{
  uint64_t v4 = (void (**)(id, PXMockAudioAsset *))a3;
  v5 = [(PXMockAudioAsset *)self init];
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