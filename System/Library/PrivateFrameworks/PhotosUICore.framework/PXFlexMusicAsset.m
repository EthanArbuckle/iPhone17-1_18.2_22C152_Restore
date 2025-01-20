@interface PXFlexMusicAsset
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetDuration;
- (BOOL)isAudioEqualToAsset:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)audioSessionClass;
- (Class)defaultMediaProviderClass;
- (NSArray)entryPoints;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)assetTagsDescription;
- (NSString)colorGradeCategory;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)artworkURL;
- (PXDisplayAsset)artworkDisplayAsset;
- (PXFlexMusicAsset)assetWithTargetDuration:(id *)a3;
- (PXFlexMusicAsset)initWithConfiguration:(id)a3;
- (int64_t)catalog;
- (int64_t)pace;
- (int64_t)px_storyResourceKind;
- (unint64_t)flags;
- (unint64_t)hash;
- (void)setAlbumTitle:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setAssetTagsDescription:(id)a3;
- (void)setColorGradeCategory:(id)a3;
- (void)setDuration:(id *)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPace:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTargetDuration:(id *)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXFlexMusicAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_assetTagsDescription, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
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

- (void)setAssetTagsDescription:(id)a3
{
}

- (NSString)assetTagsDescription
{
  return self->_assetTagsDescription;
}

- (void)setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void)setTargetDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_targetDuration.epoch = a3->var3;
  *(_OWORD *)&self->_targetDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void)setAlbumTitle:(id)a3
{
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (PXFlexMusicAsset)assetWithTargetDuration:(id *)a3
{
  v5 = [PXFlexMusicAsset alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PXFlexMusicAsset_assetWithTargetDuration___block_invoke;
  v8[3] = &unk_1E5DADFB8;
  v8[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  v6 = [(PXFlexMusicAsset *)v5 initWithConfiguration:v8];
  return v6;
}

void __44__PXFlexMusicAsset_assetWithTargetDuration___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 title];
  [v4 setTitle:v5];

  v6 = [*(id *)(a1 + 32) artistName];
  [v4 setArtistName:v6];

  v7 = [*(id *)(a1 + 32) subtitle];
  [v4 setSubtitle:v7];

  v8 = [*(id *)(a1 + 32) identifier];
  [v4 setIdentifier:v8];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [*(id *)(a1 + 32) assetTagsDescription];
  v10 = (void *)[v9 copy];
  [v4 setAssetTagsDescription:v10];

  v11 = [*(id *)(a1 + 32) colorGradeCategory];
  v12 = (void *)[v11 copy];
  [v4 setColorGradeCategory:v12];

  objc_msgSend(v4, "setPace:", objc_msgSend(*(id *)(a1 + 32), "pace"));
  objc_msgSend(v4, "setFlags:", objc_msgSend(*(id *)(a1 + 32), "flags"));
  long long v13 = *(_OWORD *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 56);
  [v4 setTargetDuration:&v13];
}

- (NSArray)entryPoints
{
  return 0;
}

- (int64_t)catalog
{
  return 4;
}

- (Class)defaultMediaProviderClass
{
  return (Class)objc_opt_class();
}

- (PXDisplayAsset)artworkDisplayAsset
{
  v2 = [[PXFlexMusicArtworkAsset alloc] initWithAudioAsset:self];
  return (PXDisplayAsset *)v2;
}

- (Class)audioSessionClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)flags
{
  return 2;
}

- (PXFlexMusicAsset)initWithConfiguration:(id)a3
{
  id v4 = (void (**)(id, PXFlexMusicAsset *))a3;
  v7.receiver = self;
  v7.super_class = (Class)PXFlexMusicAsset;
  v5 = [(PXFlexMusicAsset *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (BOOL)isAudioEqualToAsset:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(PXFlexMusicAsset *)self identifier];
    id v6 = [v4 identifier];
    if (v5 == v6)
    {
    }
    else
    {
      int v7 = [v5 isEqual:v6];

      if (!v7)
      {
        BOOL v8 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    [(PXFlexMusicAsset *)self targetDuration];
    if (v4) {
      [v4 targetDuration];
    }
    else {
      memset(&v10, 0, sizeof(v10));
    }
    BOOL v8 = CMTimeCompare(&time1, &v10) == 0;
    goto LABEL_11;
  }
  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXFlexMusicAsset *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(PXFlexMusicAsset *)v4 identifier];
      id v6 = [(PXFlexMusicAsset *)self identifier];
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

- (int64_t)px_storyResourceKind
{
  return 2;
}

@end