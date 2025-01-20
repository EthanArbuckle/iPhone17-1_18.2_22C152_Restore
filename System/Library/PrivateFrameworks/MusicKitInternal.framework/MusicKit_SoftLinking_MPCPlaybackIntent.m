@interface MusicKit_SoftLinking_MPCPlaybackIntent
+ (MusicKit_SoftLinking_MPCPlaybackIntent)emptyPlaybackIntent;
- (MusicKit_SoftLinking_MPCPlaybackIntent)init;
- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithLegacyLibraryRequest:(id)a3 allowedIdentifiers:(id)a4 startIdentifierSet:(id)a5 onlyLibraryContent:(BOOL)a6;
- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithLegacyModelStationSeeding:(id)a3;
- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithStationSeedingIdentifierSet:(id)a3;
- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithStoreIDs:(id)a3 startIdentifierSet:(id)a4;
- (NSData)playActivityRecommendationData;
- (NSString)playActivityFeatureName;
- (id)_underlyingPlaybackIntent;
- (id)rawPlaybackIntent;
- (int64_t)repeatMode;
- (int64_t)shuffleMode;
- (void)setPlayActivityFeatureName:(id)a3;
- (void)setPlayActivityRecommendationData:(id)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setShuffleMode:(int64_t)a3;
@end

@implementation MusicKit_SoftLinking_MPCPlaybackIntent

- (void).cxx_destruct
{
}

- (id)_underlyingPlaybackIntent
{
  return self->_underlyingPlaybackIntent;
}

+ (MusicKit_SoftLinking_MPCPlaybackIntent)emptyPlaybackIntent
{
  v2 = objc_alloc_init(MusicKit_SoftLinking_MPCPlaybackIntent);
  return v2;
}

- (MusicKit_SoftLinking_MPCPlaybackIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v2 = [(MusicKit_SoftLinking_MPCPlaybackIntent *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)getMPCPlaybackIntentClass());
    [v3 setTracklistSource:3];
    underlyingPlaybackIntent = v2->_underlyingPlaybackIntent;
    v2->_underlyingPlaybackIntent = (MPCPlaybackIntent *)v3;
  }
  return v2;
}

- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithStoreIDs:(id)a3 startIdentifierSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v8 = [(MusicKit_SoftLinking_MPCPlaybackIntent *)&v18 init];
  if (v8)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v9 = (void *)getMPCModelStorePlaybackItemsRequestClass_softClass_0;
    uint64_t v27 = getMPCModelStorePlaybackItemsRequestClass_softClass_0;
    if (!getMPCModelStorePlaybackItemsRequestClass_softClass_0)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getMPCModelStorePlaybackItemsRequestClass_block_invoke_0;
      v22 = &unk_1E6D453B0;
      v23 = &v24;
      __getMPCModelStorePlaybackItemsRequestClass_block_invoke_0((uint64_t)&v19);
      v9 = (void *)v25[3];
    }
    v10 = v9;
    _Block_object_dispose(&v24, 8);
    id v11 = objc_alloc_init(v10);
    [v11 setStoreIDs:v6];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v12 = (void *)getMPCModelPlaybackIntentTracklistTokenClass_softClass;
    uint64_t v27 = getMPCModelPlaybackIntentTracklistTokenClass_softClass;
    if (!getMPCModelPlaybackIntentTracklistTokenClass_softClass)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __getMPCModelPlaybackIntentTracklistTokenClass_block_invoke;
      v22 = &unk_1E6D453B0;
      v23 = &v24;
      __getMPCModelPlaybackIntentTracklistTokenClass_block_invoke((uint64_t)&v19);
      v12 = (void *)v25[3];
    }
    v13 = v12;
    _Block_object_dispose(&v24, 8);
    id v14 = objc_alloc_init(v13);
    [v14 setRequest:v11];
    if (v7) {
      [v14 setStartItemIdentifiers:v7];
    }
    v15 = (MPCPlaybackIntent *)objc_alloc_init((Class)getMPCPlaybackIntentClass());
    underlyingPlaybackIntent = v8->_underlyingPlaybackIntent;
    v8->_underlyingPlaybackIntent = v15;

    [(MPCPlaybackIntent *)v8->_underlyingPlaybackIntent setTracklistToken:v14];
    [(MPCPlaybackIntent *)v8->_underlyingPlaybackIntent setTracklistSource:3];
  }
  return v8;
}

- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithLegacyLibraryRequest:(id)a3 allowedIdentifiers:(id)a4 startIdentifierSet:(id)a5 onlyLibraryContent:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v13 = [(MusicKit_SoftLinking_MPCPlaybackIntent *)&v23 init];
  if (v13)
  {
    id v14 = v10;
    if ([v11 count])
    {
      v15 = [v14 allowedItemIdentifiers];
      uint64_t v16 = [v15 count];

      if (!v16)
      {
        v17 = objc_msgSend(v11, "msv_map:", &__block_literal_global_13);
        [v14 setAllowedItemIdentifiers:v17];
      }
    }
    objc_super v18 = [v14 allowedItemIdentifiers];
    unint64_t v19 = [v18 count];

    if (v19 >= 2)
    {
      [v14 setItemSortDescriptors:0];
      [v14 setSortUsingAllowedItemIdentifiers:1];
    }
    if (!a6) {
      [v14 setFilteringOptions:4];
    }
    uint64_t v20 = [v14 playbackIntentWithStartItemIdentifiers:v12];
    underlyingPlaybackIntent = v13->_underlyingPlaybackIntent;
    v13->_underlyingPlaybackIntent = (MPCPlaybackIntent *)v20;
  }
  return v13;
}

- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithLegacyModelStationSeeding:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v5 = [(MusicKit_SoftLinking_MPCPlaybackIntent *)&v12 init];
  if (v5)
  {
    id v6 = [v4 _underlyingModelObject];
    getMPModelAlbumClass_0();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      uint64_t v8 = [getMPCPlaybackIntentClass() radioPlaybackIntentFromAlbum:v7];
    }
    else
    {
      getMPModelArtistClass();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        uint64_t v8 = [getMPCPlaybackIntentClass() radioPlaybackIntentFromArtist:v7];
      }
      else
      {
        getMPModelSongClass();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v6;
          uint64_t v8 = [getMPCPlaybackIntentClass() radioPlaybackIntentFromSong:v7];
        }
        else
        {
          getMPModelRadioStationClass();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_11:

            goto LABEL_12;
          }
          id v7 = v6;
          uint64_t v8 = [getMPCPlaybackIntentClass() radioPlaybackIntentWithStation:v7];
        }
      }
    }
    v9 = (MPCPlaybackIntent *)v8;

    underlyingPlaybackIntent = v5->_underlyingPlaybackIntent;
    v5->_underlyingPlaybackIntent = v9;

    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithStationSeedingIdentifierSet:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v5 = [(MusicKit_SoftLinking_MPCPlaybackIntent *)&v36 init];
  if (v5)
  {
    id v6 = v4;
    id v7 = [v6 modelKind];
    uint64_t v8 = [v7 identityKind];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    v9 = (void *)getMPModelAlbumKindClass_softClass_0;
    uint64_t v45 = getMPModelAlbumKindClass_softClass_0;
    if (!getMPModelAlbumKindClass_softClass_0)
    {
      uint64_t v37 = MEMORY[0x1E4F143A8];
      uint64_t v38 = 3221225472;
      v39 = __getMPModelAlbumKindClass_block_invoke_0;
      v40 = &unk_1E6D453B0;
      v41 = &v42;
      __getMPModelAlbumKindClass_block_invoke_0((uint64_t)&v37);
      v9 = (void *)v43[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v42, 8);
    id v11 = [v10 identityKind];
    int v12 = [v8 isEqual:v11];

    if (v12)
    {
      v13 = (void *)[objc_alloc((Class)getMPModelAlbumClass_0()) initWithIdentifiers:v6 block:&__block_literal_global_7_0];
      uint64_t v14 = [getMPCPlaybackIntentClass() radioPlaybackIntentFromAlbum:v13];
    }
    else
    {
      v15 = [v6 modelKind];
      uint64_t v16 = [v15 identityKind];
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x2050000000;
      v17 = (void *)getMPModelArtistKindClass_softClass;
      uint64_t v45 = getMPModelArtistKindClass_softClass;
      if (!getMPModelArtistKindClass_softClass)
      {
        uint64_t v37 = MEMORY[0x1E4F143A8];
        uint64_t v38 = 3221225472;
        v39 = __getMPModelArtistKindClass_block_invoke;
        v40 = &unk_1E6D453B0;
        v41 = &v42;
        __getMPModelArtistKindClass_block_invoke((uint64_t)&v37);
        v17 = (void *)v43[3];
      }
      id v18 = v17;
      _Block_object_dispose(&v42, 8);
      unint64_t v19 = [v18 identityKind];
      int v20 = [v16 isEqual:v19];

      if (v20)
      {
        v13 = (void *)[objc_alloc((Class)getMPModelArtistClass()) initWithIdentifiers:v6 block:&__block_literal_global_9_0];
        uint64_t v14 = [getMPCPlaybackIntentClass() radioPlaybackIntentFromArtist:v13];
      }
      else
      {
        v21 = [v6 modelKind];
        v22 = [v21 identityKind];
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2050000000;
        objc_super v23 = (void *)getMPModelSongKindClass_softClass;
        uint64_t v45 = getMPModelSongKindClass_softClass;
        if (!getMPModelSongKindClass_softClass)
        {
          uint64_t v37 = MEMORY[0x1E4F143A8];
          uint64_t v38 = 3221225472;
          v39 = __getMPModelSongKindClass_block_invoke;
          v40 = &unk_1E6D453B0;
          v41 = &v42;
          __getMPModelSongKindClass_block_invoke((uint64_t)&v37);
          objc_super v23 = (void *)v43[3];
        }
        id v24 = v23;
        _Block_object_dispose(&v42, 8);
        v25 = [v24 identityKind];
        int v26 = [v22 isEqual:v25];

        if (v26)
        {
          v13 = (void *)[objc_alloc((Class)getMPModelSongClass()) initWithIdentifiers:v6 block:&__block_literal_global_11];
          uint64_t v14 = [getMPCPlaybackIntentClass() radioPlaybackIntentFromSong:v13];
        }
        else
        {
          uint64_t v27 = [v6 modelKind];
          v28 = [v27 identityKind];
          uint64_t v42 = 0;
          v43 = &v42;
          uint64_t v44 = 0x2050000000;
          v29 = (void *)getMPModelRadioStationKindClass_softClass;
          uint64_t v45 = getMPModelRadioStationKindClass_softClass;
          if (!getMPModelRadioStationKindClass_softClass)
          {
            uint64_t v37 = MEMORY[0x1E4F143A8];
            uint64_t v38 = 3221225472;
            v39 = __getMPModelRadioStationKindClass_block_invoke;
            v40 = &unk_1E6D453B0;
            v41 = &v42;
            __getMPModelRadioStationKindClass_block_invoke((uint64_t)&v37);
            v29 = (void *)v43[3];
          }
          id v30 = v29;
          _Block_object_dispose(&v42, 8);
          v31 = [v30 identityKind];
          int v32 = [v28 isEqual:v31];

          if (!v32)
          {

            v34 = 0;
            goto LABEL_20;
          }
          v13 = (void *)[objc_alloc((Class)getMPModelRadioStationClass()) initWithIdentifiers:v6 block:&__block_literal_global_13_1];
          uint64_t v14 = [getMPCPlaybackIntentClass() radioPlaybackIntentWithStation:v13];
        }
      }
    }
    underlyingPlaybackIntent = v5->_underlyingPlaybackIntent;
    v5->_underlyingPlaybackIntent = (MPCPlaybackIntent *)v14;
  }
  v34 = v5;
LABEL_20:

  return v34;
}

- (id)rawPlaybackIntent
{
  return self->_underlyingPlaybackIntent;
}

- (NSString)playActivityFeatureName
{
  return (NSString *)[(MPCPlaybackIntent *)self->_underlyingPlaybackIntent playActivityFeatureName];
}

- (void)setPlayActivityFeatureName:(id)a3
{
}

- (NSData)playActivityRecommendationData
{
  return (NSData *)[(MPCPlaybackIntent *)self->_underlyingPlaybackIntent playActivityRecommendationData];
}

- (void)setPlayActivityRecommendationData:(id)a3
{
}

- (int64_t)repeatMode
{
  unint64_t v2 = [(MPCPlaybackIntent *)self->_underlyingPlaybackIntent repeatMode];
  if (v2 > 2) {
    return -1;
  }
  else {
    return qword_1E099D630[v2];
  }
}

- (void)setRepeatMode:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = qword_1E099D630[a3];
  }
  [(MPCPlaybackIntent *)self->_underlyingPlaybackIntent setRepeatMode:v3];
}

- (int64_t)shuffleMode
{
  int64_t result = [(MPCPlaybackIntent *)self->_underlyingPlaybackIntent shuffleMode];
  if ((unint64_t)result >= 3) {
    return -1;
  }
  return result;
}

- (void)setShuffleMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 3) {
    a3 = -1;
  }
  [(MPCPlaybackIntent *)self->_underlyingPlaybackIntent setShuffleMode:a3];
}

@end