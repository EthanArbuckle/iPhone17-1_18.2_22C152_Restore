@interface ML3StoreItemTrackData
- (BOOL)_platformMetadataItem:(id)a3 matchesKind:(id)a4;
- (BOOL)_platformMetadataItemIsAUCAudioKind:(id)a3;
- (BOOL)_platformMetadataItemIsAUCKind:(id)a3;
- (BOOL)_platformMetadataItemIsAUCVideoKind:(id)a3;
- (BOOL)_platformMetadataItemIsMovieKind:(id)a3;
- (BOOL)_platformMetadataItemIsMusicKind:(id)a3;
- (BOOL)_platformMetadataItemIsMusicVideoKind:(id)a3;
- (BOOL)_platformMetadataItemIsSongKind:(id)a3;
- (BOOL)_platformMetadataItemIsTVShowKind:(id)a3;
- (BOOL)_platformMetadataItemIsVideoKind:(id)a3;
- (ML3StoreItemTrackData)initWithLookupItems:(id)a3;
- (ML3StoreItemTrackData)initWithTrackData:(id)a3;
- (NSArray)parsedStoreItemsImportProperties;
- (NSData)trackData;
- (double)_songDurationFromOffersArray:(id)a3;
- (id)_allSongItemsFromCollectionLookupItem:(id)a3;
- (id)_allSongItemsFromLookupItems:(id)a3;
- (id)_artworkTokenForItemWithCollectionID:(int64_t)a3 itemID:(int64_t)a4;
- (id)_artworkTokenFromLookupItem:(id)a3;
- (id)_bestAlbumArtworkImageURLFromStoreArtworkVariants:(id)a3;
- (id)_bestArtworkImageURLFromStoreArtworkVariants:(id)a3 cropStyle:(id)a4;
- (id)_bestPlaylistArtworkImageURLFromStoreArtworkVariants:(id)a3;
- (id)_importDictionaryForLookupItem:(id)a3 parentCollectionCache:(id)a4;
- (id)_lookupItemArtworksForArtworkDictionaries:(id)a3;
- (id)_parentDictForItemAlbumId:(id)a3;
- (id)_storeItemsImportPropertiesFromLookupItems:(id)a3;
- (id)_storeItemsImportPropertiesFromTrackData:(id)a3;
- (id)_storePlatformDateFormatter;
- (int64_t)_episodeTypeFromVideoSubTypeString:(id)a3;
- (unint64_t)trackCount;
@end

@implementation ML3StoreItemTrackData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePlatformDateFormatter, 0);
  objc_storeStrong((id *)&self->_parsedStoreItemsImportProperties, 0);
  objc_storeStrong((id *)&self->_trackData, 0);

  objc_storeStrong((id *)&self->_lookupItems, 0);
}

- (id)_bestArtworkImageURLFromStoreArtworkVariants:(id)a3 cropStyle:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v58 count:16];
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v11 = 0;
  if (v8)
  {
    uint64_t v12 = *(void *)v46;
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v14 = *MEMORY[0x1E4F1DB30];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v7);
        }
        v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v17 = [v16 sizeInfo];
        [v17 maxSupportedSize];
        double v19 = v18;
        double v21 = v20;

        if (v19 > v14 || v21 > v13)
        {
          id v23 = v16;

          double v13 = v21;
          double v14 = v19;
          v11 = v23;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v8);
  }

  MSVGetMaximumScreenSize();
  double v25 = v24;
  double v27 = v26;
  v28 = [v11 sizeInfo];
  [v28 maxSupportedSize];
  double v30 = v29;
  double v32 = v31;

  if (v30 != v9 || v32 != v10)
  {
    MSVImageUtilitiesMakeBoundingBoxSize();
    double v25 = v34;
    double v27 = v35;
  }
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  v36 = (id *)getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr_17691;
  uint64_t v57 = getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr_17691;
  if (!getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr_17691)
  {
    uint64_t v49 = MEMORY[0x1E4F143A8];
    uint64_t v50 = 3221225472;
    v51 = __getICStoreArtworkInfoImageFormatJPEGSymbolLoc_block_invoke_17692;
    v52 = &unk_1E5FB7330;
    v53 = &v54;
    v37 = iTunesCloudLibrary_17693();
    v38 = dlsym(v37, "ICStoreArtworkInfoImageFormatJPEG");
    *(void *)(v53[1] + 24) = v38;
    getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr_17691 = *(void *)(v53[1] + 24);
    v36 = (id *)v55[3];
  }
  _Block_object_dispose(&v54, 8);
  if (!v36)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    v44 = [NSString stringWithUTF8String:"NSString *getICStoreArtworkInfoImageFormatJPEG(void)"];
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"ML3StoreItemTrackData.m", 43, @"%s", dlerror());

    __break(1u);
  }
  id v39 = *v36;
  v40 = objc_msgSend(v11, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", v6, v39, MSVDeviceSupportsExtendedColorDisplay(), v25, v27);

  v41 = [v40 absoluteString];

  return v41;
}

- (id)_bestPlaylistArtworkImageURLFromStoreArtworkVariants:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v5 = (void *)getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr_17708;
  uint64_t v14 = getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr_17708;
  if (!getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr_17708)
  {
    id v6 = iTunesCloudLibrary_17693();
    v12[3] = (uint64_t)dlsym(v6, "ICStoreArtworkInfoCropStyleSquareCenterCrop");
    getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr_17708 = v12[3];
    id v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    id v7 = [(ML3StoreItemTrackData *)self _bestArtworkImageURLFromStoreArtworkVariants:v4 cropStyle:*v5];

    return v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"NSString *getICStoreArtworkInfoCropStyleSquareCenterCrop(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"ML3StoreItemTrackData.m", 42, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (id)_bestAlbumArtworkImageURLFromStoreArtworkVariants:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v5 = (void *)getICStoreArtworkInfoCropStyleBoundedBoxSymbolLoc_ptr;
  uint64_t v14 = getICStoreArtworkInfoCropStyleBoundedBoxSymbolLoc_ptr;
  if (!getICStoreArtworkInfoCropStyleBoundedBoxSymbolLoc_ptr)
  {
    id v6 = iTunesCloudLibrary_17693();
    v12[3] = (uint64_t)dlsym(v6, "ICStoreArtworkInfoCropStyleBoundedBox");
    getICStoreArtworkInfoCropStyleBoundedBoxSymbolLoc_ptr = v12[3];
    id v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    id v7 = [(ML3StoreItemTrackData *)self _bestArtworkImageURLFromStoreArtworkVariants:v4 cropStyle:*v5];

    return v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"NSString *getICStoreArtworkInfoCropStyleBoundedBox(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"ML3StoreItemTrackData.m", 41, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsMovieKind:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v5 = (void *)getICStorePlatformMetadataKindMovieSymbolLoc_ptr;
  uint64_t v14 = getICStorePlatformMetadataKindMovieSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindMovieSymbolLoc_ptr)
  {
    id v6 = iTunesCloudLibrary_17693();
    v12[3] = (uint64_t)dlsym(v6, "ICStorePlatformMetadataKindMovie");
    getICStorePlatformMetadataKindMovieSymbolLoc_ptr = v12[3];
    id v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    BOOL v7 = [(ML3StoreItemTrackData *)self _platformMetadataItem:v4 matchesKind:*v5];

    return v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindMovie(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"ML3StoreItemTrackData.m", 37, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsTVShowKind:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v5 = (void *)getICStorePlatformMetadataKindTVEpisodeSymbolLoc_ptr;
  uint64_t v14 = getICStorePlatformMetadataKindTVEpisodeSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindTVEpisodeSymbolLoc_ptr)
  {
    id v6 = iTunesCloudLibrary_17693();
    v12[3] = (uint64_t)dlsym(v6, "ICStorePlatformMetadataKindTVEpisode");
    getICStorePlatformMetadataKindTVEpisodeSymbolLoc_ptr = v12[3];
    id v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    BOOL v7 = [(ML3StoreItemTrackData *)self _platformMetadataItem:v4 matchesKind:*v5];

    return v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindTVEpisode(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"ML3StoreItemTrackData.m", 36, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsVideoKind:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ML3StoreItemTrackData *)self _platformMetadataItemIsTVShowKind:v4]
    || [(ML3StoreItemTrackData *)self _platformMetadataItemIsMovieKind:v4];

  return v5;
}

- (BOOL)_platformMetadataItemIsAUCVideoKind:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  BOOL v5 = (void *)getICStorePlatformMetadataKindUploadedVideoSymbolLoc_ptr;
  uint64_t v14 = getICStorePlatformMetadataKindUploadedVideoSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindUploadedVideoSymbolLoc_ptr)
  {
    id v6 = iTunesCloudLibrary_17693();
    v12[3] = (uint64_t)dlsym(v6, "ICStorePlatformMetadataKindUploadedVideo");
    getICStorePlatformMetadataKindUploadedVideoSymbolLoc_ptr = v12[3];
    BOOL v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    BOOL v7 = [(ML3StoreItemTrackData *)self _platformMetadataItem:v4 matchesKind:*v5];

    return v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindUploadedVideo(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"ML3StoreItemTrackData.m", 35, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsAUCAudioKind:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  BOOL v5 = (void *)getICStorePlatformMetadataKindUploadedAudioSymbolLoc_ptr;
  uint64_t v14 = getICStorePlatformMetadataKindUploadedAudioSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindUploadedAudioSymbolLoc_ptr)
  {
    id v6 = iTunesCloudLibrary_17693();
    v12[3] = (uint64_t)dlsym(v6, "ICStorePlatformMetadataKindUploadedAudio");
    getICStorePlatformMetadataKindUploadedAudioSymbolLoc_ptr = v12[3];
    BOOL v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    BOOL v7 = [(ML3StoreItemTrackData *)self _platformMetadataItem:v4 matchesKind:*v5];

    return v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindUploadedAudio(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"ML3StoreItemTrackData.m", 34, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsAUCKind:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ML3StoreItemTrackData *)self _platformMetadataItemIsAUCAudioKind:v4]
    || [(ML3StoreItemTrackData *)self _platformMetadataItemIsAUCVideoKind:v4];

  return v5;
}

- (BOOL)_platformMetadataItemIsMusicVideoKind:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  BOOL v5 = (void *)getICStorePlatformMetadataKindMusicVideoSymbolLoc_ptr;
  uint64_t v14 = getICStorePlatformMetadataKindMusicVideoSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindMusicVideoSymbolLoc_ptr)
  {
    id v6 = iTunesCloudLibrary_17693();
    v12[3] = (uint64_t)dlsym(v6, "ICStorePlatformMetadataKindMusicVideo");
    getICStorePlatformMetadataKindMusicVideoSymbolLoc_ptr = v12[3];
    BOOL v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    BOOL v7 = [(ML3StoreItemTrackData *)self _platformMetadataItem:v4 matchesKind:*v5];

    return v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindMusicVideo(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"ML3StoreItemTrackData.m", 33, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsSongKind:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  BOOL v5 = (void *)getICStorePlatformMetadataKindSongSymbolLoc_ptr;
  uint64_t v14 = getICStorePlatformMetadataKindSongSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindSongSymbolLoc_ptr)
  {
    id v6 = iTunesCloudLibrary_17693();
    v12[3] = (uint64_t)dlsym(v6, "ICStorePlatformMetadataKindSong");
    getICStorePlatformMetadataKindSongSymbolLoc_ptr = v12[3];
    BOOL v5 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    BOOL v7 = [(ML3StoreItemTrackData *)self _platformMetadataItem:v4 matchesKind:*v5];

    return v7;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindSong(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"ML3StoreItemTrackData.m", 32, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsMusicKind:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ML3StoreItemTrackData *)self _platformMetadataItemIsSongKind:v4]
    || [(ML3StoreItemTrackData *)self _platformMetadataItemIsMusicVideoKind:v4];

  return v5;
}

- (BOOL)_platformMetadataItem:(id)a3 matchesKind:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 kind];
  if (v7)
  {
    uint64_t v8 = [v5 kind];
    BOOL v9 = [v8 compare:v6 options:1] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_allSongItemsFromCollectionLookupItem:(id)a3
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  id v4 = (id *)getICStorePlatformMetadataKindAlbumSymbolLoc_ptr;
  uint64_t v69 = getICStorePlatformMetadataKindAlbumSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindAlbumSymbolLoc_ptr)
  {
    uint64_t v61 = MEMORY[0x1E4F143A8];
    uint64_t v62 = 3221225472;
    v63 = __getICStorePlatformMetadataKindAlbumSymbolLoc_block_invoke;
    v64 = &unk_1E5FB7330;
    v65 = &v66;
    id v5 = iTunesCloudLibrary_17693();
    v67[3] = (uint64_t)dlsym(v5, "ICStorePlatformMetadataKindAlbum");
    getICStorePlatformMetadataKindAlbumSymbolLoc_ptr = *(void *)(v65[1] + 24);
    id v4 = (id *)v67[3];
  }
  _Block_object_dispose(&v66, 8);
  if (!v4)
  {
    long long v46 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v47 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindAlbum(void)"];
    objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, @"ML3StoreItemTrackData.m", 39, @"%s", dlerror());

    goto LABEL_50;
  }
  id v6 = *v4;
  BOOL v7 = getICStorePlatformMetadataKindArtist();
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v8 = (id *)getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr_17720;
  uint64_t v69 = getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr_17720;
  if (!getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr_17720)
  {
    uint64_t v61 = MEMORY[0x1E4F143A8];
    uint64_t v62 = 3221225472;
    v63 = __getICStorePlatformMetadataKindPlaylistSymbolLoc_block_invoke_17721;
    v64 = &unk_1E5FB7330;
    v65 = &v66;
    BOOL v9 = iTunesCloudLibrary_17693();
    v67[3] = (uint64_t)dlsym(v9, "ICStorePlatformMetadataKindPlaylist");
    getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr_17720 = *(void *)(v65[1] + 24);
    uint64_t v8 = (id *)v67[3];
  }
  _Block_object_dispose(&v66, 8);
  if (!v8)
  {
    long long v48 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v49 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindPlaylist(void)"];
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, @"ML3StoreItemTrackData.m", 30, @"%s", dlerror());

    goto LABEL_50;
  }
  id v10 = *v8;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v11 = (void *)getICStorePlatformMetadataKindTVSeasonSymbolLoc_ptr;
  uint64_t v69 = getICStorePlatformMetadataKindTVSeasonSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindTVSeasonSymbolLoc_ptr)
  {
    uint64_t v61 = MEMORY[0x1E4F143A8];
    uint64_t v62 = 3221225472;
    v63 = __getICStorePlatformMetadataKindTVSeasonSymbolLoc_block_invoke;
    v64 = &unk_1E5FB7330;
    v65 = &v66;
    uint64_t v12 = iTunesCloudLibrary_17693();
    v67[3] = (uint64_t)dlsym(v12, "ICStorePlatformMetadataKindTVSeason");
    getICStorePlatformMetadataKindTVSeasonSymbolLoc_ptr = *(void *)(v65[1] + 24);
    uint64_t v11 = (void *)v67[3];
  }
  _Block_object_dispose(&v66, 8);
  if (!v11)
  {
    uint64_t v50 = [MEMORY[0x1E4F28B00] currentHandler];
    v51 = [NSString stringWithUTF8String:"NSString *getICStorePlatformMetadataKindTVSeason(void)"];
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, @"ML3StoreItemTrackData.m", 38, @"%s", dlerror());

LABEL_50:
    __break(1u);
  }
  v53 = objc_msgSend(v3, "setWithObjects:", v6, v7, v10, *v11, 0);

  v52 = [v56 kind];
  if ([(ML3StoreItemTrackData *)self _platformMetadataItemIsMusicKind:v56]
    || [(ML3StoreItemTrackData *)self _platformMetadataItemIsAUCKind:v56]
    || [(ML3StoreItemTrackData *)self _platformMetadataItemIsVideoKind:v56])
  {
    v71[0] = v56;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
  }
  else if ([v53 containsObject:v52])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15 = [v56 metadataDictionary];
    v16 = [v15 objectForKey:@"children"];
    v17 = [v15 objectForKey:@"childrenIds"];
    double v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      double v20 = [v15 objectForKey:@"children"];
      id v19 = [v20 allKeys];
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v19;
    uint64_t v21 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v58 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = [v16 objectForKey:*(void *)(*((void *)&v57 + 1) + 8 * i)];
          double v25 = (void *)[(id)v24 mutableCopy];

          double v26 = [v56 kind];
          double v27 = getICStorePlatformMetadataKindArtist();
          LOBYTE(v24) = [v26 isEqualToString:v27];

          if ((v24 & 1) == 0)
          {
            v28 = [v15 objectForKeyedSubscript:@"artwork"];

            if (v28)
            {
              double v29 = [v15 objectForKeyedSubscript:@"artwork"];
              [v25 setObject:v29 forKeyedSubscript:@"albumArtwork"];
            }
            double v30 = [v15 objectForKeyedSubscript:@"artistId"];

            if (v30)
            {
              double v31 = [v15 objectForKeyedSubscript:@"artistId"];
              [v25 setObject:v31 forKeyedSubscript:@"albumArtistId"];
            }
            double v32 = [v15 objectForKeyedSubscript:@"artistName"];

            if (v32)
            {
              v33 = [v15 objectForKeyedSubscript:@"artistName"];
              [v25 setObject:v33 forKeyedSubscript:@"albumArtistName"];
            }
            double v34 = [v15 objectForKeyedSubscript:@"copyright"];

            if (v34)
            {
              double v35 = [v15 objectForKeyedSubscript:@"copyright"];
              [v25 setObject:v35 forKeyedSubscript:@"copyright"];
            }
            v36 = [v15 objectForKeyedSubscript:@"isMasteredForItunes"];

            if (v36)
            {
              v37 = [v15 objectForKeyedSubscript:@"isMasteredForItunes"];
              [v25 setObject:v37 forKeyedSubscript:@"isMasteredForItunes"];
            }
            v38 = [v15 objectForKeyedSubscript:@"isCompilation"];

            if (v38)
            {
              id v39 = [v15 objectForKeyedSubscript:@"isCompilation"];
              [v25 setObject:v39 forKeyedSubscript:@"isCompilation"];
            }
            v40 = [v15 objectForKeyedSubscript:@"seasonNumber"];

            if (v40)
            {
              v41 = [v15 objectForKeyedSubscript:@"seasonNumber"];
              [v25 setObject:v41 forKeyedSubscript:@"episodeSeasonNumber"];
            }
          }
          uint64_t v66 = 0;
          v67 = &v66;
          uint64_t v68 = 0x2050000000;
          v42 = (void *)getICStorePlatformMetadataClass_softClass;
          uint64_t v69 = getICStorePlatformMetadataClass_softClass;
          if (!getICStorePlatformMetadataClass_softClass)
          {
            uint64_t v61 = MEMORY[0x1E4F143A8];
            uint64_t v62 = 3221225472;
            v63 = __getICStorePlatformMetadataClass_block_invoke;
            v64 = &unk_1E5FB7330;
            v65 = &v66;
            __getICStorePlatformMetadataClass_block_invoke((uint64_t)&v61);
            v42 = (void *)v67[3];
          }
          v43 = v42;
          _Block_object_dispose(&v66, 8);
          v44 = (void *)[[v43 alloc] initWithMetadataDictionary:v25];
          long long v45 = [(ML3StoreItemTrackData *)self _allSongItemsFromCollectionLookupItem:v44];
          [v13 addObjectsFromArray:v45];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
      }
      while (v21);
    }
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (id)_allSongItemsFromLookupItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[ML3StoreItemTrackData _allSongItemsFromCollectionLookupItem:](self, "_allSongItemsFromCollectionLookupItem:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (double)_songDurationFromOffersArray:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  unint64_t v3 = 0;
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    double v4 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        id v6 = [*(id *)(*((void *)&v21 + 1) + 8 * i) objectForKeyedSubscript:@"assets"];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v18 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * j) objectForKeyedSubscript:@"duration"];
              if (objc_opt_respondsToSelector())
              {
                [v11 doubleValue];
                double v4 = v4 + v12;
                ++v3;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v8);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }
  else
  {
    double v4 = 0.0;
  }

  return v4 / (double)v3;
}

- (id)_lookupItemArtworksForArtworkDictionaries:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25[0] = v13;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];

    id v13 = (id)v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v13;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = 0;
            long long v21 = &v20;
            uint64_t v22 = 0x2050000000;
            uint64_t v9 = (void *)getICStoreArtworkInfoClass_softClass;
            uint64_t v23 = getICStoreArtworkInfoClass_softClass;
            if (!getICStoreArtworkInfoClass_softClass)
            {
              v19[0] = MEMORY[0x1E4F143A8];
              v19[1] = 3221225472;
              v19[2] = __getICStoreArtworkInfoClass_block_invoke;
              v19[3] = &unk_1E5FB7330;
              v19[4] = &v20;
              __getICStoreArtworkInfoClass_block_invoke((uint64_t)v19);
              uint64_t v9 = (void *)v21[3];
            }
            id v10 = v9;
            _Block_object_dispose(&v20, 8);
            uint64_t v11 = (void *)[[v10 alloc] initWithArtworkResponseDictionary:v8];
            if (v11) {
              [v14 addObject:v11];
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v24 count:16];
      }
      while (v5);
    }
  }

  return v14;
}

- (int64_t)_episodeTypeFromVideoSubTypeString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"episode"])
  {
    int64_t v4 = 3;
  }
  else if (([v3 isEqualToString:@"episodebonus"] & 1) != 0 {
         || ([v3 isEqualToString:@"seasonbonus"] & 1) != 0)
  }
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"tvtrailer"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"tvextra"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"tvinterview"])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_artworkTokenForItemWithCollectionID:(int64_t)a3 itemID:(int64_t)a4
{
  if (a3 >= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"store_collection_id=%lld", a4, a3);
    int64_t v4 = LABEL_5:;
    goto LABEL_6;
  }
  if (a4 >= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"store_item_id=%lld", a4, a4);
    goto LABEL_5;
  }
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  int64_t v4 = [v6 UUIDString];

LABEL_6:

  return v4;
}

- (id)_artworkTokenFromLookupItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 collectionStoreAdamID];
  uint64_t v6 = [v4 storeAdamID];

  return [(ML3StoreItemTrackData *)self _artworkTokenForItemWithCollectionID:v5 itemID:v6];
}

- (id)_importDictionaryForLookupItem:(id)a3 parentCollectionCache:(id)a4
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v174 = a4;
  v182 = v6;
  if (![(ML3StoreItemTrackData *)self _platformMetadataItemIsMusicKind:v6]
    && ![(ML3StoreItemTrackData *)self _platformMetadataItemIsAUCKind:v6]
    && ![(ML3StoreItemTrackData *)self _platformMetadataItemIsVideoKind:v6])
  {
    log = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v117 = [v6 kind];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v117;
      _os_log_impl(&dword_1B022D000, log, OS_LOG_TYPE_ERROR, "[ML3StoreItemTrackData] unsupported item kind %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id v183 = 0;
    goto LABEL_176;
  }
  id v183 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(ML3StoreItemTrackData *)self _platformMetadataItemIsMusicVideoKind:v6]|| [(ML3StoreItemTrackData *)self _platformMetadataItemIsAUCVideoKind:v6])
  {
    uint64_t v7 = 1032;
  }
  else if ([(ML3StoreItemTrackData *)self _platformMetadataItemIsTVShowKind:v6])
  {
    uint64_t v7 = 512;
  }
  else if ([(ML3StoreItemTrackData *)self _platformMetadataItemIsMovieKind:v6])
  {
    uint64_t v7 = 2048;
  }
  else
  {
    uint64_t v7 = 8;
  }
  log = [v6 metadataDictionary];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "storeAdamID"));
  [v183 setObject:v8 forKeyedSubscript:&unk_1F09119C8];

  uint64_t v9 = [v6 artistName];

  if (v9)
  {
    id v10 = [v6 artistName];
    [v183 setObject:v10 forKeyedSubscript:&unk_1F09119E0];
  }
  uint64_t v11 = [log objectForKeyedSubscript:@"artistId"];

  if (v11)
  {
    double v12 = [log objectForKeyedSubscript:@"artistId"];
    [v183 setObject:v12 forKeyedSubscript:&unk_1F09119F8];
  }
  id v13 = [log objectForKeyedSubscript:@"collectionId"];

  if (v13)
  {
    id v14 = [log objectForKeyedSubscript:@"collectionId"];
    [v183 setObject:v14 forKeyedSubscript:&unk_1F0911A10];
  }
  long long v15 = [log objectForKeyedSubscript:@"collectionName"];

  if (v15)
  {
    long long v16 = [log objectForKeyedSubscript:@"collectionName"];
    [v183 setObject:v16 forKeyedSubscript:&unk_1F0911A28];
  }
  long long v17 = [log objectForKeyedSubscript:@"name"];

  if (v17)
  {
    long long v18 = [log objectForKeyedSubscript:@"name"];
    [v183 setObject:v18 forKeyedSubscript:&unk_1F0911A40];
  }
  long long v19 = [log objectForKeyedSubscript:@"trackNumber"];

  if (v19)
  {
    uint64_t v20 = [log objectForKeyedSubscript:@"trackNumber"];
    [v183 setObject:v20 forKeyedSubscript:&unk_1F0911A58];
  }
  long long v21 = [log objectForKeyedSubscript:@"discNumber"];

  if (v21)
  {
    uint64_t v22 = [log objectForKeyedSubscript:@"discNumber"];
    [v183 setObject:v22 forKeyedSubscript:&unk_1F0911A70];
  }
  uint64_t v23 = [log objectForKeyedSubscript:@"copyright"];

  if (v23)
  {
    long long v24 = [log objectForKeyedSubscript:@"copyright"];
    [v183 setObject:v24 forKeyedSubscript:&unk_1F0911A88];
  }
  double v25 = [log objectForKeyedSubscript:@"isCompilation"];

  if (v25)
  {
    double v26 = [log objectForKeyedSubscript:@"isCompilation"];
    [v183 setObject:v26 forKeyedSubscript:&unk_1F0911AA0];
  }
  uint64_t v27 = [log objectForKeyedSubscript:@"isMasteredForItunes"];

  if (v27)
  {
    v28 = [log objectForKeyedSubscript:@"isMasteredForItunes"];
    [v183 setObject:v28 forKeyedSubscript:&unk_1F0911AB8];
  }
  double v29 = [log objectForKeyedSubscript:@"ml3td_radio_station_id"];

  if (v29)
  {
    double v30 = [log objectForKeyedSubscript:@"ml3td_radio_station_id"];
    [v183 setObject:v30 forKeyedSubscript:&unk_1F0911AD0];
  }
  double v31 = [log objectForKeyedSubscript:@"ml3td_advertisement_unique_id"];

  if (v31)
  {
    double v32 = [log objectForKeyedSubscript:@"ml3td_advertisement_unique_id"];
    [v183 setObject:v32 forKeyedSubscript:&unk_1F0911AE8];
  }
  v33 = [log objectForKeyedSubscript:@"ml3td_advertisement_type"];

  if (v33)
  {
    double v34 = [log objectForKeyedSubscript:@"ml3td_advertisement_type"];
    [v183 setObject:v34 forKeyedSubscript:&unk_1F0911B00];
  }
  double v35 = [log objectForKeyedSubscript:@"showComposer"];

  if (v35)
  {
    v36 = [log objectForKeyedSubscript:@"showComposer"];
    [v183 setObject:v36 forKeyedSubscript:&unk_1F0911B18];
  }
  v37 = [log objectForKeyedSubscript:@"work"];

  if (v37)
  {
    v38 = [log objectForKeyedSubscript:@"work"];
    [v183 setObject:v38 forKeyedSubscript:&unk_1F0911B30];
  }
  id v39 = [log objectForKeyedSubscript:@"shouldBookmarkPlayPosition"];

  if (v39)
  {
    v40 = [log objectForKeyedSubscript:@"shouldBookmarkPlayPosition"];
    [v183 setObject:v40 forKeyedSubscript:&unk_1F0911B48];
  }
  v41 = [log objectForKeyedSubscript:@"episodeSeasonNumber"];

  if (v41)
  {
    v42 = [log objectForKeyedSubscript:@"episodeSeasonNumber"];
    [v183 setObject:v42 forKeyedSubscript:&unk_1F0911B60];
  }
  v43 = [log objectForKeyedSubscript:@"excludeFromShuffle"];

  if (v43)
  {
    v44 = [log objectForKeyedSubscript:@"excludeFromShuffle"];
    [v183 setObject:v44 forKeyedSubscript:&unk_1F0911B78];
  }
  long long v45 = [log objectForKeyedSubscript:@"wasAvailableForSubs"];

  if (v45)
  {
    long long v46 = [log objectForKeyedSubscript:@"wasAvailableForSubs"];
    [v183 setObject:v46 forKeyedSubscript:&unk_1F0911B90];
  }
  long long v47 = [log objectForKeyedSubscript:@"episodeDisplayLabel"];

  if (v47)
  {
    long long v48 = [log objectForKeyedSubscript:@"episodeDisplayLabel"];
    [v183 setObject:v48 forKeyedSubscript:&unk_1F0911BA8];
  }
  uint64_t v49 = [log objectForKeyedSubscript:@"hasLyrics"];

  if (v49)
  {
    uint64_t v50 = [log objectForKeyedSubscript:@"hasLyrics"];
    [v183 setObject:v50 forKeyedSubscript:&unk_1F0911BC0];
  }
  v51 = [log objectForKeyedSubscript:@"hasTimeSyncedLyrics"];

  if (v51)
  {
    v52 = [log objectForKeyedSubscript:@"hasTimeSyncedLyrics"];
    [v183 setObject:v52 forKeyedSubscript:&unk_1F0911BD8];
  }
  v53 = [v6 formerStoreAdamIDs];
  uint64_t v54 = [v53 count];

  if (v54)
  {
    v55 = [v182 formerStoreAdamIDs];
    [v183 setObject:v55 forKeyedSubscript:&unk_1F0911BF0];
  }
  id v56 = [log objectForKeyedSubscript:@"albumArtistId"];
  if (v56)
  {
    long long v57 = [log objectForKeyedSubscript:@"albumArtistName"];

    if (v57)
    {
      long long v58 = [log objectForKeyedSubscript:@"albumArtistId"];

      if (v58)
      {
        long long v59 = [log objectForKeyedSubscript:@"albumArtistId"];
        [v183 setObject:v59 forKeyedSubscript:&unk_1F0911C08];
      }
      long long v60 = [log objectForKeyedSubscript:@"albumArtistName"];

      if (!v60) {
        goto LABEL_69;
      }
      uint64_t v61 = [log objectForKeyedSubscript:@"albumArtistName"];
      [v183 setObject:v61 forKeyedSubscript:&unk_1F0911C20];
      goto LABEL_68;
    }
  }
  uint64_t v62 = [log objectForKeyedSubscript:@"collectionId"];

  if (!v62) {
    goto LABEL_69;
  }
  uint64_t v61 = [log objectForKeyedSubscript:@"collectionId"];
  v63 = [v174 objectForKeyedSubscript:v61];
  if (v63) {
    goto LABEL_63;
  }
  v63 = [(ML3StoreItemTrackData *)self _parentDictForItemAlbumId:v61];
  if (v63)
  {
    [v174 setObject:v63 forKeyedSubscript:v61];
LABEL_63:
    v64 = [v63 objectForKeyedSubscript:@"albumArtistId"];

    if (v64)
    {
      v65 = [v63 objectForKeyedSubscript:@"albumArtistId"];
      [v183 setObject:v65 forKeyedSubscript:&unk_1F0911C08];
    }
    uint64_t v66 = [v63 objectForKeyedSubscript:@"albumArtistName"];

    if (v66)
    {
      v67 = [v63 objectForKeyedSubscript:@"albumArtistName"];
      [v183 setObject:v67 forKeyedSubscript:&unk_1F0911C20];
    }
  }

LABEL_68:
LABEL_69:
  if ([(ML3StoreItemTrackData *)self _platformMetadataItemIsAUCKind:v182])
  {
    uint64_t v68 = [v183 objectForKeyedSubscript:&unk_1F0911A40];

    if (!v68)
    {
      uint64_t v69 = [log objectForKeyedSubscript:@"title"];

      if (v69)
      {
        v70 = [log objectForKeyedSubscript:@"title"];
        [v183 setObject:v70 forKeyedSubscript:&unk_1F0911A40];
      }
    }
  }
  if ((v7 & 0x200) != 0)
  {
    v71 = [v182 artistName];

    if (v71)
    {
      v72 = [v182 artistName];
      [v183 setObject:v72 forKeyedSubscript:&unk_1F0911C38];
    }
    v73 = [log objectForKeyedSubscript:@"trackNumber"];

    if (v73)
    {
      v74 = [log objectForKeyedSubscript:@"trackNumber"];
      [v183 setObject:v74 forKeyedSubscript:&unk_1F0911C50];
    }
    v75 = [log objectForKeyedSubscript:@"videoSubType"];
    v76 = objc_msgSend(NSNumber, "numberWithInteger:", -[ML3StoreItemTrackData _episodeTypeFromVideoSubTypeString:](self, "_episodeTypeFromVideoSubTypeString:", v75));
    [v183 setObject:v76 forKeyedSubscript:&unk_1F0911C68];

    v77 = [log objectForKeyedSubscript:@"screenshots"];
    v78 = [(ML3StoreItemTrackData *)self _lookupItemArtworksForArtworkDictionaries:v77];
    v79 = [(ML3StoreItemTrackData *)self _bestAlbumArtworkImageURLFromStoreArtworkVariants:v78];
    if (v79) {
      [v183 setObject:v79 forKeyedSubscript:&unk_1F0911C80];
    }
  }
  v80 = [NSNumber numberWithUnsignedInt:v7];
  [v183 setObject:v80 forKeyedSubscript:&unk_1F0911C98];

  v81 = [NSNumber numberWithUnsignedInt:v7];
  [v183 setObject:v81 forKeyedSubscript:&unk_1F0911CB0];

  v82 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v175 = objc_msgSend(v82, "numberWithDouble:");
  [v183 setObject:v175 forKeyedSubscript:&unk_1F0911CC8];
  [v183 setObject:v175 forKeyedSubscript:&unk_1F0911CE0];
  v179 = [log objectForKeyedSubscript:@"releaseDate"];
  if (v179)
  {
    v83 = [(ML3StoreItemTrackData *)self _storePlatformDateFormatter];
    v84 = [v83 dateFromString:v179];

    v85 = NSNumber;
    [v84 timeIntervalSinceReferenceDate];
    v86 = objc_msgSend(v85, "numberWithDouble:");
    [v183 setObject:v86 forKeyedSubscript:&unk_1F0911CF8];
  }
  v181 = [log objectForKeyedSubscript:@"offers"];
  if (v181)
  {
    [(ML3StoreItemTrackData *)self _songDurationFromOffersArray:v181];
    v88 = [NSNumber numberWithDouble:v87 * 1000.0];
    [v183 setObject:v88 forKeyedSubscript:&unk_1F0911D10];

    long long v192 = 0u;
    long long v193 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    id v89 = v181;
    char v90 = 0;
    uint64_t v91 = [v89 countByEnumeratingWithState:&v190 objects:v199 count:16];
    if (v91)
    {
      uint64_t v92 = *(void *)v191;
      do
      {
        for (uint64_t i = 0; i != v91; ++i)
        {
          if (*(void *)v191 != v92) {
            objc_enumerationMutation(v89);
          }
          v94 = [*(id *)(*((void *)&v190 + 1) + 8 * i) objectForKeyedSubscript:@"type"];
          char v95 = [v94 isEqualToString:@"subscription"];

          v90 |= v95;
        }
        uint64_t v91 = [v89 countByEnumeratingWithState:&v190 objects:v199 count:16];
      }
      while (v91);
    }

    v96 = [NSNumber numberWithBool:v90 & 1];
    [v183 setObject:v96 forKeyedSubscript:&unk_1F0911D28];
  }
  v178 = [log objectForKeyedSubscript:@"genreNames"];
  if ([v178 count])
  {
    v97 = [v178 firstObject];
    [v183 setObject:v97 forKeyedSubscript:&unk_1F0911D40];
  }
  v98 = [v182 artworkInfos];
  if ([v98 count])
  {
    v99 = v98;
  }
  else
  {
    v100 = [log objectForKeyedSubscript:@"albumArtwork"];
    uint64_t v101 = [(ML3StoreItemTrackData *)self _lookupItemArtworksForArtworkDictionaries:v100];

    v99 = (void *)v101;
  }
  v173 = v99;
  v177 = -[ML3StoreItemTrackData _bestAlbumArtworkImageURLFromStoreArtworkVariants:](self, "_bestAlbumArtworkImageURLFromStoreArtworkVariants:");
  if (v177) {
    [v183 setObject:v177 forKeyedSubscript:&unk_1F0911D58];
  }
  v180 = [log objectForKeyedSubscript:@"contentRatingsBySystem"];
  if (v180)
  {
    v102 = [v180 allKeys];
    v103 = [v102 firstObject];

    v104 = [v180 objectForKey:v103];
    v105 = v104;
    if (v104)
    {
      uint64_t v106 = [v104 objectForKeyedSubscript:@"name"];
      v107 = (void *)v106;
      if (v106) {
        v108 = (__CFString *)v106;
      }
      else {
        v108 = &stru_1F08D4D70;
      }
      v109 = v108;

      v110 = [v105 objectForKeyedSubscript:@"value"];
      if ([v103 isEqualToString:@"riaa"])
      {
        if ([(__CFString *)v109 isEqualToString:@"Explicit"])
        {
          uint64_t v111 = 1;
        }
        else if ([(__CFString *)v109 isEqualToString:@"Clean"])
        {
          uint64_t v111 = 2;
        }
        else
        {
          uint64_t v111 = 0;
        }
      }
      else
      {
        uint64_t v112 = [v105 objectForKey:@"advisories"];
        v113 = (void *)v112;
        if (v112) {
          v114 = (__CFString *)v112;
        }
        else {
          v114 = &stru_1F08D4D70;
        }
        v115 = v114;

        if (objc_opt_respondsToSelector()) {
          uint64_t v116 = [v110 integerValue];
        }
        else {
          uint64_t v116 = 0;
        }
        v118 = [NSString stringWithFormat:@"%@|%@|%ld|%@", v103, v109, v116, v115];
        [v183 setObject:v118 forKeyedSubscript:&unk_1F0911D70];

        uint64_t v111 = 0;
      }
      v119 = [NSNumber numberWithUnsignedInt:v111];
      [v183 setObject:v119 forKeyedSubscript:&unk_1F0911D88];

      if (v110) {
        v120 = v110;
      }
      else {
        v120 = &unk_1F0911DA0;
      }
      [v183 setObject:v120 forKeyedSubscript:&unk_1F0911DB8];
    }
  }
  v176 = [log objectForKeyedSubscript:@"composer"];
  if (v176)
  {
    v121 = [v176 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v121 length]) {
      [v183 setObject:v121 forKeyedSubscript:&unk_1F0911DD0];
    }
  }
  [v182 audioTraits];
  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v122 = 0;
  uint64_t v123 = [obj countByEnumeratingWithState:&v186 objects:v198 count:16];
  if (v123)
  {
    uint64_t v124 = *(void *)v187;
    do
    {
      for (uint64_t j = 0; j != v123; ++j)
      {
        if (*(void *)v187 != v124) {
          objc_enumerationMutation(obj);
        }
        v126 = *(void **)(*((void *)&v186 + 1) + 8 * j);
        uint64_t v194 = 0;
        v195 = &v194;
        uint64_t v196 = 0x2020000000;
        v127 = (id *)getICStorePlatformAudioTraitSpatialSymbolLoc_ptr;
        uint64_t v197 = getICStorePlatformAudioTraitSpatialSymbolLoc_ptr;
        if (!getICStorePlatformAudioTraitSpatialSymbolLoc_ptr)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v201 = __getICStorePlatformAudioTraitSpatialSymbolLoc_block_invoke;
          v202 = &unk_1E5FB7330;
          v203 = &v194;
          v128 = iTunesCloudLibrary_17693();
          v129 = dlsym(v128, "ICStorePlatformAudioTraitSpatial");
          *(void *)(v203[1] + 24) = v129;
          getICStorePlatformAudioTraitSpatialSymbolLoc_ptr = *(void *)(v203[1] + 24);
          v127 = (id *)v195[3];
        }
        _Block_object_dispose(&v194, 8);
        if (!v127)
        {
          v161 = [MEMORY[0x1E4F28B00] currentHandler];
          v162 = [NSString stringWithUTF8String:"NSString *getICStorePlatformAudioTraitSpatial(void)"];
          objc_msgSend(v161, "handleFailureInFunction:file:lineNumber:description:", v162, @"ML3StoreItemTrackData.m", 44, @"%s", dlerror());

          goto LABEL_183;
        }
        id v130 = *v127;
        int v131 = [v126 isEqualToString:v130];

        if (v131)
        {
          v122 |= 0x20uLL;
        }
        else
        {
          uint64_t v194 = 0;
          v195 = &v194;
          uint64_t v196 = 0x2020000000;
          v132 = (id *)getICStorePlatformAudioTraitLosslessSymbolLoc_ptr;
          uint64_t v197 = getICStorePlatformAudioTraitLosslessSymbolLoc_ptr;
          if (!getICStorePlatformAudioTraitLosslessSymbolLoc_ptr)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v201 = __getICStorePlatformAudioTraitLosslessSymbolLoc_block_invoke;
            v202 = &unk_1E5FB7330;
            v203 = &v194;
            v133 = iTunesCloudLibrary_17693();
            v134 = dlsym(v133, "ICStorePlatformAudioTraitLossless");
            *(void *)(v203[1] + 24) = v134;
            getICStorePlatformAudioTraitLosslessSymbolLoc_ptr = *(void *)(v203[1] + 24);
            v132 = (id *)v195[3];
          }
          _Block_object_dispose(&v194, 8);
          if (!v132)
          {
            v163 = [MEMORY[0x1E4F28B00] currentHandler];
            v164 = [NSString stringWithUTF8String:"NSString *getICStorePlatformAudioTraitLossless(void)"];
            objc_msgSend(v163, "handleFailureInFunction:file:lineNumber:description:", v164, @"ML3StoreItemTrackData.m", 45, @"%s", dlerror());

            goto LABEL_183;
          }
          id v135 = *v132;
          int v136 = [v126 isEqualToString:v135];

          if (v136)
          {
            v122 |= 4uLL;
          }
          else
          {
            uint64_t v194 = 0;
            v195 = &v194;
            uint64_t v196 = 0x2020000000;
            v137 = (id *)getICStorePlatformAudioTraitHiResLosslessSymbolLoc_ptr;
            uint64_t v197 = getICStorePlatformAudioTraitHiResLosslessSymbolLoc_ptr;
            if (!getICStorePlatformAudioTraitHiResLosslessSymbolLoc_ptr)
            {
              *(void *)&long long buf = MEMORY[0x1E4F143A8];
              *((void *)&buf + 1) = 3221225472;
              v201 = __getICStorePlatformAudioTraitHiResLosslessSymbolLoc_block_invoke;
              v202 = &unk_1E5FB7330;
              v203 = &v194;
              v138 = iTunesCloudLibrary_17693();
              v139 = dlsym(v138, "ICStorePlatformAudioTraitHiResLossless");
              *(void *)(v203[1] + 24) = v139;
              getICStorePlatformAudioTraitHiResLosslessSymbolLoc_ptr = *(void *)(v203[1] + 24);
              v137 = (id *)v195[3];
            }
            _Block_object_dispose(&v194, 8);
            if (!v137)
            {
              v165 = [MEMORY[0x1E4F28B00] currentHandler];
              v166 = [NSString stringWithUTF8String:"NSString *getICStorePlatformAudioTraitHiResLossless(void)"];
              objc_msgSend(v165, "handleFailureInFunction:file:lineNumber:description:", v166, @"ML3StoreItemTrackData.m", 46, @"%s", dlerror());

              goto LABEL_183;
            }
            id v140 = *v137;
            int v141 = [v126 isEqualToString:v140];

            if (v141)
            {
              v122 |= 0x10uLL;
            }
            else
            {
              uint64_t v194 = 0;
              v195 = &v194;
              uint64_t v196 = 0x2020000000;
              v142 = (id *)getICStorePlatformAudioTraitLossyStereoSymbolLoc_ptr;
              uint64_t v197 = getICStorePlatformAudioTraitLossyStereoSymbolLoc_ptr;
              if (!getICStorePlatformAudioTraitLossyStereoSymbolLoc_ptr)
              {
                *(void *)&long long buf = MEMORY[0x1E4F143A8];
                *((void *)&buf + 1) = 3221225472;
                v201 = __getICStorePlatformAudioTraitLossyStereoSymbolLoc_block_invoke;
                v202 = &unk_1E5FB7330;
                v203 = &v194;
                v143 = iTunesCloudLibrary_17693();
                v144 = dlsym(v143, "ICStorePlatformAudioTraitLossyStereo");
                *(void *)(v203[1] + 24) = v144;
                getICStorePlatformAudioTraitLossyStereoSymbolLoc_ptr = *(void *)(v203[1] + 24);
                v142 = (id *)v195[3];
              }
              _Block_object_dispose(&v194, 8);
              if (!v142)
              {
                v167 = [MEMORY[0x1E4F28B00] currentHandler];
                v168 = [NSString stringWithUTF8String:"NSString *getICStorePlatformAudioTraitLossyStereo(void)"];
                objc_msgSend(v167, "handleFailureInFunction:file:lineNumber:description:", v168, @"ML3StoreItemTrackData.m", 49, @"%s", dlerror());

                goto LABEL_183;
              }
              id v145 = *v142;
              int v146 = [v126 isEqualToString:v145];

              if (v146)
              {
                v122 |= 8uLL;
              }
              else
              {
                uint64_t v194 = 0;
                v195 = &v194;
                uint64_t v196 = 0x2020000000;
                v147 = (id *)getICStorePlatformAudioTraitAtmosSymbolLoc_ptr;
                uint64_t v197 = getICStorePlatformAudioTraitAtmosSymbolLoc_ptr;
                if (!getICStorePlatformAudioTraitAtmosSymbolLoc_ptr)
                {
                  *(void *)&long long buf = MEMORY[0x1E4F143A8];
                  *((void *)&buf + 1) = 3221225472;
                  v201 = __getICStorePlatformAudioTraitAtmosSymbolLoc_block_invoke;
                  v202 = &unk_1E5FB7330;
                  v203 = &v194;
                  v148 = iTunesCloudLibrary_17693();
                  v149 = dlsym(v148, "ICStorePlatformAudioTraitAtmos");
                  *(void *)(v203[1] + 24) = v149;
                  getICStorePlatformAudioTraitAtmosSymbolLoc_ptr = *(void *)(v203[1] + 24);
                  v147 = (id *)v195[3];
                }
                _Block_object_dispose(&v194, 8);
                if (!v147)
                {
                  v169 = [MEMORY[0x1E4F28B00] currentHandler];
                  v170 = [NSString stringWithUTF8String:"NSString *getICStorePlatformAudioTraitAtmos(void)"];
                  objc_msgSend(v169, "handleFailureInFunction:file:lineNumber:description:", v170, @"ML3StoreItemTrackData.m", 47, @"%s", dlerror());

                  goto LABEL_183;
                }
                id v150 = *v147;
                int v151 = [v126 isEqualToString:v150];

                if (v151)
                {
                  v122 |= 1uLL;
                }
                else
                {
                  uint64_t v194 = 0;
                  v195 = &v194;
                  uint64_t v196 = 0x2020000000;
                  v152 = (id *)getICStorePlatformAudioTraitSurroundSymbolLoc_ptr;
                  uint64_t v197 = getICStorePlatformAudioTraitSurroundSymbolLoc_ptr;
                  if (!getICStorePlatformAudioTraitSurroundSymbolLoc_ptr)
                  {
                    *(void *)&long long buf = MEMORY[0x1E4F143A8];
                    *((void *)&buf + 1) = 3221225472;
                    v201 = __getICStorePlatformAudioTraitSurroundSymbolLoc_block_invoke;
                    v202 = &unk_1E5FB7330;
                    v203 = &v194;
                    v153 = iTunesCloudLibrary_17693();
                    v154 = dlsym(v153, "ICStorePlatformAudioTraitSurround");
                    *(void *)(v203[1] + 24) = v154;
                    getICStorePlatformAudioTraitSurroundSymbolLoc_ptr = *(void *)(v203[1] + 24);
                    v152 = (id *)v195[3];
                  }
                  _Block_object_dispose(&v194, 8);
                  if (!v152)
                  {
                    v171 = [MEMORY[0x1E4F28B00] currentHandler];
                    v172 = [NSString stringWithUTF8String:"NSString *getICStorePlatformAudioTraitSurround(void)"];
                    objc_msgSend(v171, "handleFailureInFunction:file:lineNumber:description:", v172, @"ML3StoreItemTrackData.m", 48, @"%s", dlerror());

LABEL_183:
                    __break(1u);
                  }
                  id v155 = *v152;
                  int v156 = [v126 isEqualToString:v155];

                  if (v156)
                  {
                    v122 |= 2uLL;
                  }
                  else
                  {
                    v157 = os_log_create("com.apple.amp.medialibrary", "Default");
                    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(buf) = 138543362;
                      *(void *)((char *)&buf + 4) = v126;
                      _os_log_impl(&dword_1B022D000, v157, OS_LOG_TYPE_ERROR, "[ML3StoreItemTrackData] unsupported audio trait %{public}@", (uint8_t *)&buf, 0xCu);
                    }
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v123 = [obj countByEnumeratingWithState:&v186 objects:v198 count:16];
    }
    while (v123);
  }

  v158 = [NSNumber numberWithInteger:v122];
  [v183 setObject:v158 forKeyedSubscript:&unk_1F0911DE8];

LABEL_176:
  id v159 = v183;

  return v159;
}

- (id)_parentDictForItemAlbumId:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__17934;
  double v29 = __Block_byref_object_dispose__17935;
  id v30 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 stringValue];
  }
  uint64_t v5 = v4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2050000000;
  id v6 = (void *)getICStorePlatformRequestClass_softClass;
  uint64_t v39 = getICStorePlatformRequestClass_softClass;
  if (!getICStorePlatformRequestClass_softClass)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getICStorePlatformRequestClass_block_invoke;
    double v34 = &unk_1E5FB7330;
    double v35 = &v36;
    __getICStorePlatformRequestClass_block_invoke((uint64_t)&v31);
    id v6 = (void *)v37[3];
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v36, 8);
  id v8 = objc_alloc_init(v7);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2050000000;
  uint64_t v9 = (void *)getICStoreRequestContextClass_softClass;
  uint64_t v39 = getICStoreRequestContextClass_softClass;
  if (!getICStoreRequestContextClass_softClass)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getICStoreRequestContextClass_block_invoke;
    double v34 = &unk_1E5FB7330;
    double v35 = &v36;
    __getICStoreRequestContextClass_block_invoke((uint64_t)&v31);
    uint64_t v9 = (void *)v37[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v36, 8);
  id v11 = [v10 alloc];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2050000000;
  double v12 = (void *)getICUserIdentityClass_softClass;
  uint64_t v39 = getICUserIdentityClass_softClass;
  if (!getICUserIdentityClass_softClass)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getICUserIdentityClass_block_invoke;
    double v34 = &unk_1E5FB7330;
    double v35 = &v36;
    __getICUserIdentityClass_block_invoke((uint64_t)&v31);
    double v12 = (void *)v37[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v36, 8);
  id v14 = [v13 activeAccount];
  long long v15 = (void *)[v11 initWithIdentity:v14];

  [v8 setRequestContext:v15];
  [v8 setKeyProfile:@"album-parent"];
  v40[0] = v5;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  [v8 setItemIdentifiers:v16];

  [v8 setPersonalizationStyle:0];
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__ML3StoreItemTrackData__parentDictForItemAlbumId___block_invoke;
  v22[3] = &unk_1E5FB6198;
  long long v24 = &v25;
  long long v18 = v17;
  uint64_t v23 = v18;
  id v19 = (id)[v8 performWithResponseHandler:v22];
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  id v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);

  return v20;
}

void __51__ML3StoreItemTrackData__parentDictForItemAlbumId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 allItems];
    uint64_t v7 = [v6 firstObject];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if ([v7 artistStoreAdamID])
      {
        id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NSObject artistStoreAdamID](v7, "artistStoreAdamID"));
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v11 forKeyedSubscript:@"albumArtistId"];
      }
      double v12 = [v7 artistName];

      if (v12)
      {
        id v13 = [v7 artistName];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v13 forKeyedSubscript:@"albumArtistName"];
      }
    }
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v5;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "[ML3StoreItemTrackData] Error fetching album parent store content for item add. %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_storeItemsImportPropertiesFromTrackData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v5 = MSVPropertyListDataClasses();
  id v11 = 0;
  id v6 = [v3 unarchivedObjectOfClasses:v5 fromData:v4 error:&v11];

  id v7 = v11;
  if (!v6)
  {
    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "[ML3StoreItemTrackData] Failed to decode track data. err=%{public}@", buf, 0xCu);
    }
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"track_items"];

  return v9;
}

- (id)_storeItemsImportPropertiesFromLookupItems:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v20 = self;
  id v19 = v4;
  id v5 = [(ML3StoreItemTrackData *)self _allSongItemsFromLookupItems:v4];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v21 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v12 = (void *)MEMORY[0x1B3E93C70]();
        uint64_t v13 = [v11 storeAdamID];
        uint64_t v14 = [NSNumber numberWithLongLong:v13];
        int v15 = [v6 containsObject:v14];

        if (v15)
        {
          uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 134217984;
            uint64_t v29 = v13;
            _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "[ML3StoreItemTrackData] not including item with store identifier:%lld", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v16 = [(ML3StoreItemTrackData *)v20 _importDictionaryForLookupItem:v11 parentCollectionCache:v21];
          [v22 addObject:v16];
          dispatch_semaphore_t v17 = [NSNumber numberWithLongLong:v13];
          [v6 addObject:v17];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }

  return v22;
}

- (id)_storePlatformDateFormatter
{
  storePlatformDateFormatter = self->_storePlatformDateFormatter;
  if (!storePlatformDateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v5 = self->_storePlatformDateFormatter;
    self->_storePlatformDateFormatter = v4;

    [(NSDateFormatter *)self->_storePlatformDateFormatter setDateFormat:@"YYYY-MM-dd"];
    storePlatformDateFormatter = self->_storePlatformDateFormatter;
  }

  return storePlatformDateFormatter;
}

- (unint64_t)trackCount
{
  v2 = [(ML3StoreItemTrackData *)self parsedStoreItemsImportProperties];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSArray)parsedStoreItemsImportProperties
{
  parsedStoreItemsImportProperties = self->_parsedStoreItemsImportProperties;
  if (!parsedStoreItemsImportProperties)
  {
    if (self->_lookupItems)
    {
      -[ML3StoreItemTrackData _storeItemsImportPropertiesFromLookupItems:](self, "_storeItemsImportPropertiesFromLookupItems:");
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      id v5 = self->_parsedStoreItemsImportProperties;
      self->_parsedStoreItemsImportProperties = v4;

      parsedStoreItemsImportProperties = self->_parsedStoreItemsImportProperties;
      goto LABEL_7;
    }
    if (self->_trackData)
    {
      -[ML3StoreItemTrackData _storeItemsImportPropertiesFromTrackData:](self, "_storeItemsImportPropertiesFromTrackData:");
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    parsedStoreItemsImportProperties = 0;
  }
LABEL_7:

  return parsedStoreItemsImportProperties;
}

- (NSData)trackData
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ML3StoreItemTrackData *)self parsedStoreItemsImportProperties];
  unint64_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v7 = @"track_items";
    v8[0] = v2;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return (NSData *)v5;
}

- (ML3StoreItemTrackData)initWithTrackData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemTrackData;
  id v5 = [(ML3StoreItemTrackData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    trackData = v5->_trackData;
    v5->_trackData = (NSData *)v6;
  }
  return v5;
}

- (ML3StoreItemTrackData)initWithLookupItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemTrackData;
  id v5 = [(ML3StoreItemTrackData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    lookupItems = v5->_lookupItems;
    v5->_lookupItems = (NSArray *)v6;
  }
  return v5;
}

@end