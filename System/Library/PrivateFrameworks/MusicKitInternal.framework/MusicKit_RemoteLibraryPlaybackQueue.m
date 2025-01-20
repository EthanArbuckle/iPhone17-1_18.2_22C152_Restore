@interface MusicKit_RemoteLibraryPlaybackQueue
- (MusicKit_RemoteLibraryPlaybackQueue)initWithContainer:(id)a3 startItem:(id)a4 replaceQueueIntent:(int64_t)a5;
- (MusicKit_RemoteLibraryPlaybackQueue)initWithItem:(id)a3 replaceQueueIntent:(int64_t)a4;
- (MusicKit_RemoteLibraryPlaybackQueue)initWithRequest:(id)a3 startItem:(id)a4 replaceQueueIntent:(int64_t)a5;
- (int64_t)_persistentIDForStartItem;
- (void)_insertQueueWithPath:(id)a3 position:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6;
- (void)_resolveMediaQueryForLibraryRequest:(id)a3 completionHandler:(id)a4;
- (void)_setQueueWithPath:(id)a3 shuffleMode:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6;
- (void)insertQueueWithPath:(id)a3 position:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6;
- (void)setQueueWithPath:(id)a3 shuffleMode:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6;
@end

@implementation MusicKit_RemoteLibraryPlaybackQueue

- (MusicKit_RemoteLibraryPlaybackQueue)initWithRequest:(id)a3 startItem:(id)a4 replaceQueueIntent:(int64_t)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v79 = a3;
  id v8 = a4;
  v84.receiver = self;
  v84.super_class = (Class)MusicKit_RemoteLibraryPlaybackQueue;
  v9 = [(MusicKit_RemotePlaybackQueue *)&v84 initWithReplaceQueueIntent:a5];
  if (!v9) {
    goto LABEL_51;
  }
  id v10 = v79;
  if (([v10 filteringOptions] & 2) != 0)
  {
    v15 = (MPModelLibraryRequest *)v10;
    libraryRequest = v9->_libraryRequest;
    v9->_libraryRequest = v15;
    goto LABEL_48;
  }
  id v11 = objc_alloc_init((Class)getMPMediaQueryClass());
  [v11 setGroupingType:0];
  v12 = [v10 sectionKind];
  getMPModelAlbumKindClass();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v14 = [getMPMediaQueryClass() albumsQuery];
LABEL_8:
    libraryRequest = (void *)v14;

    goto LABEL_10;
  }
  v17 = [v10 sectionKind];
  getMPModelPlaylistKindClass();
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if (v18)
  {
    uint64_t v14 = [getMPMediaQueryClass() playlistsQuery];
    goto LABEL_8;
  }
  libraryRequest = v11;
LABEL_10:
  v19 = [v10 allowedSectionIdentifiers];
  BOOL v20 = [v19 count] == 0;

  if (v20)
  {
    v29 = [v10 scopedContainers];
    BOOL v30 = [v29 count] == 0;

    if (!v30)
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id obj = [v10 scopedContainers];
      uint64_t v31 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
      if (v31)
      {
        uint64_t v78 = *(void *)v81;
        v76 = &v87;
LABEL_16:
        uint64_t v32 = 0;
        while (1)
        {
          if (*(void *)v81 != v78) {
            objc_enumerationMutation(obj);
          }
          v33 = objc_msgSend(*(id *)(*((void *)&v80 + 1) + 8 * v32), "identifiers", v76);
          v34 = [v33 library];
          uint64_t v35 = [v34 persistentID];

          if (!v35) {
            break;
          }
          getMPModelAlbumClass();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
            v37 = [NSNumber numberWithLongLong:v35];
            v38 = getMPMediaItemPropertyAlbumPersistentID();
            v39 = [MPMediaPropertyPredicateClass predicateWithValue:v37 forProperty:v38 comparisonType:0];
            [libraryRequest addFilterPredicate:v39];
          }
          else
          {
            getMPModelPlaylistClass();
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v40 = getMPMediaPropertyPredicateClass();
              v41 = [NSNumber numberWithLongLong:v35];
              v42 = getMPMediaPlaylistPropertyPersistentID();
              v43 = [v40 predicateWithValue:v41 forProperty:v42 comparisonType:0];
              [libraryRequest addFilterPredicate:v43];

              [libraryRequest setShouldIncludeNonLibraryEntities:1];
            }
            else
            {
              uint64_t v90 = 0;
              v91 = &v90;
              uint64_t v92 = 0x2050000000;
              v44 = (void *)getMPModelArtistClass_softClass;
              uint64_t v93 = getMPModelArtistClass_softClass;
              if (!getMPModelArtistClass_softClass)
              {
                uint64_t v85 = MEMORY[0x1E4F143A8];
                uint64_t v86 = 3221225472;
                v87 = __getMPModelArtistClass_block_invoke;
                v88 = &unk_1E6D453B0;
                v89 = &v90;
                __getMPModelArtistClass_block_invoke((uint64_t)&v85);
                v44 = (void *)v91[3];
              }
              id v45 = v44;
              _Block_object_dispose(&v90, 8);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ([v10 sectionKind],
                    v46 = objc_claimAutoreleasedReturnValue(),
                    getMPModelAlbumKindClass(),
                    objc_opt_class(),
                    char v47 = objc_opt_isKindOfClass(),
                    v46,
                    (v47 & 1) != 0))
              {
                id v48 = getMPMediaPropertyPredicateClass();
                v49 = [NSNumber numberWithLongLong:v35];
                uint64_t v90 = 0;
                v91 = &v90;
                uint64_t v92 = 0x2020000000;
                v50 = (id *)getMPMediaItemPropertyAlbumArtistPersistentIDSymbolLoc_ptr;
                uint64_t v93 = getMPMediaItemPropertyAlbumArtistPersistentIDSymbolLoc_ptr;
                if (!getMPMediaItemPropertyAlbumArtistPersistentIDSymbolLoc_ptr)
                {
                  uint64_t v85 = MEMORY[0x1E4F143A8];
                  uint64_t v86 = 3221225472;
                  v87 = __getMPMediaItemPropertyAlbumArtistPersistentIDSymbolLoc_block_invoke;
                  v88 = &unk_1E6D453B0;
                  v89 = &v90;
                  v51 = (void *)MediaPlayerLibrary_14();
                  v52 = dlsym(v51, "MPMediaItemPropertyAlbumArtistPersistentID");
                  *(void *)(v89[1] + 24) = v52;
                  getMPMediaItemPropertyAlbumArtistPersistentIDSymbolLoc_ptr = *(void *)(v89[1] + 24);
                  v50 = (id *)v91[3];
                }
                _Block_object_dispose(&v90, 8);
                if (!v50) {
                  getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
                }
                id v53 = *v50;
                v54 = [v48 predicateWithValue:v49 forProperty:v53 comparisonType:0];
                [libraryRequest addFilterPredicate:v54];
              }
              else
              {
                uint64_t v90 = 0;
                v91 = &v90;
                uint64_t v92 = 0x2050000000;
                v55 = (void *)getMPModelComposerClass_softClass;
                uint64_t v93 = getMPModelComposerClass_softClass;
                if (!getMPModelComposerClass_softClass)
                {
                  uint64_t v85 = MEMORY[0x1E4F143A8];
                  uint64_t v86 = 3221225472;
                  v87 = __getMPModelComposerClass_block_invoke;
                  v88 = &unk_1E6D453B0;
                  v89 = &v90;
                  __getMPModelComposerClass_block_invoke((uint64_t)&v85);
                  v55 = (void *)v91[3];
                }
                id v56 = v55;
                _Block_object_dispose(&v90, 8);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v57 = [v10 sectionKind];
                  getMPModelAlbumKindClass();
                  objc_opt_class();
                  char v58 = objc_opt_isKindOfClass();

                  if (v58) {
                    goto LABEL_40;
                  }
                }
                uint64_t v90 = 0;
                v91 = &v90;
                uint64_t v92 = 0x2050000000;
                v59 = (void *)getMPModelGenreClass_softClass;
                uint64_t v93 = getMPModelGenreClass_softClass;
                if (!getMPModelGenreClass_softClass)
                {
                  uint64_t v85 = MEMORY[0x1E4F143A8];
                  uint64_t v86 = 3221225472;
                  v87 = __getMPModelGenreClass_block_invoke;
                  v88 = &unk_1E6D453B0;
                  v89 = &v90;
                  __getMPModelGenreClass_block_invoke((uint64_t)&v85);
                  v59 = (void *)v91[3];
                }
                id v60 = v59;
                _Block_object_dispose(&v90, 8);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v61 = [v10 sectionKind];
                  getMPModelAlbumKindClass();
                  objc_opt_class();
                  char v62 = objc_opt_isKindOfClass();

                  if (v62)
                  {
LABEL_40:
                    id v63 = getMPMediaPropertyPredicateClass();
                    v64 = [NSNumber numberWithLongLong:v35];
                    v65 = getMPMediaItemPropertyComposerPersistentID();
                    v66 = [v63 predicateWithValue:v64 forProperty:v65 comparisonType:0];
                    [libraryRequest addFilterPredicate:v66];
                  }
                }
              }
            }
          }
          if (v31 == ++v32)
          {
            uint64_t v31 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
            if (v31) {
              goto LABEL_16;
            }
            goto LABEL_47;
          }
        }
      }
      goto LABEL_47;
    }
  }
  else
  {
    v21 = [v10 allowedSectionIdentifiers];
    uint64_t v22 = [v21 firstObject];
    v23 = [(id)v22 library];
    uint64_t v24 = [v23 persistentID];

    v25 = [v10 sectionKind];
    getMPModelAlbumKindClass();
    objc_opt_class();
    LOBYTE(v22) = objc_opt_isKindOfClass();

    if (v22)
    {
      id v26 = getMPMediaPropertyPredicateClass();
      id obj = [NSNumber numberWithLongLong:v24];
      v27 = getMPMediaItemPropertyAlbumPersistentID();
      uint64_t v28 = [v26 predicateWithValue:obj forProperty:v27 comparisonType:0];
LABEL_46:
      v70 = (void *)v28;
      [libraryRequest addFilterPredicate:v28];

LABEL_47:
      objc_storeStrong((id *)&v9->_mediaQuery, libraryRequest);
      goto LABEL_48;
    }
    v67 = [v10 sectionKind];
    getMPModelPlaylistKindClass();
    objc_opt_class();
    char v68 = objc_opt_isKindOfClass();

    if (v68)
    {
      id v69 = getMPMediaPropertyPredicateClass();
      id obj = [NSNumber numberWithLongLong:v24];
      v27 = getMPMediaPlaylistPropertyPersistentID();
      uint64_t v28 = [v69 predicateWithValue:obj forProperty:v27 comparisonType:0];
      goto LABEL_46;
    }
  }
LABEL_48:

  if (!v9->_mediaQuery)
  {
    uint64_t v71 = [getMPMediaQueryClass() songsQuery];
    mediaQuery = v9->_mediaQuery;
    v9->_mediaQuery = (MPMediaQuery *)v71;
  }
  uint64_t v73 = [v8 _underlyingModelObject];
  underlyingStartObject = v9->_underlyingStartObject;
  v9->_underlyingStartObject = (MPModelObject *)v73;

LABEL_51:
  return v9;
}

- (MusicKit_RemoteLibraryPlaybackQueue)initWithItem:(id)a3 replaceQueueIntent:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MusicKit_RemoteLibraryPlaybackQueue;
  v7 = [(MusicKit_RemotePlaybackQueue *)&v13 initWithReplaceQueueIntent:a4];
  if (v7)
  {
    uint64_t v8 = [getMPMediaQueryClass() songsQuery];
    mediaQuery = v7->_mediaQuery;
    v7->_mediaQuery = (MPMediaQuery *)v8;

    uint64_t v10 = [v6 _underlyingModelObject];
    underlyingStartObject = v7->_underlyingStartObject;
    v7->_underlyingStartObject = (MPModelObject *)v10;
  }
  return v7;
}

- (MusicKit_RemoteLibraryPlaybackQueue)initWithContainer:(id)a3 startItem:(id)a4 replaceQueueIntent:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MusicKit_RemoteLibraryPlaybackQueue;
  uint64_t v10 = [(MusicKit_RemotePlaybackQueue *)&v28 initWithReplaceQueueIntent:a5];
  if (v10)
  {
    id v11 = [v8 _underlyingModelObject];
    id v12 = objc_alloc_init((Class)getMPMediaQueryClass());
    [v12 setGroupingType:0];
    getMPModelAlbumClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
      uint64_t v14 = NSNumber;
      v15 = [v11 identifiers];
      v16 = [v15 library];
      v17 = objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      uint64_t v18 = getMPMediaItemPropertyAlbumPersistentID();
    }
    else
    {
      getMPModelPlaylistClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v24 = [getMPMediaQueryClass() songsQuery];
        mediaQuery = v10->_mediaQuery;
        v10->_mediaQuery = (MPMediaQuery *)v24;
        goto LABEL_8;
      }
      id MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
      v19 = NSNumber;
      v15 = [v11 identifiers];
      v16 = [v15 library];
      v17 = objc_msgSend(v19, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      uint64_t v18 = getMPMediaPlaylistPropertyPersistentID();
    }
    BOOL v20 = (void *)v18;
    v21 = [MPMediaPropertyPredicateClass predicateWithValue:v17 forProperty:v18 comparisonType:0];
    [v12 addFilterPredicate:v21];

    uint64_t v22 = (MPMediaQuery *)v12;
    mediaQuery = v10->_mediaQuery;
    v10->_mediaQuery = v22;
LABEL_8:

    uint64_t v25 = [v9 _underlyingModelObject];
    underlyingStartObject = v10->_underlyingStartObject;
    v10->_underlyingStartObject = (MPModelObject *)v25;
  }
  return v10;
}

- (void)setQueueWithPath:(id)a3 shuffleMode:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  libraryRequest = self->_libraryRequest;
  if (libraryRequest)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __96__MusicKit_RemoteLibraryPlaybackQueue_setQueueWithPath_shuffleMode_sessionID_completionHandler___block_invoke;
    v14[3] = &unk_1E6D45CB0;
    v14[4] = self;
    id v15 = v10;
    int64_t v18 = a4;
    id v16 = v11;
    id v17 = v12;
    [(MusicKit_RemoteLibraryPlaybackQueue *)self _resolveMediaQueryForLibraryRequest:libraryRequest completionHandler:v14];
  }
  else
  {
    [(MusicKit_RemoteLibraryPlaybackQueue *)self _setQueueWithPath:v10 shuffleMode:a4 sessionID:v11 completionHandler:v12];
  }
}

- (void)_setQueueWithPath:(id)a3 shuffleMode:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void, id))a6;
  uint64_t v12 = MRSystemAppPlaybackQueueCreate();
  objc_super v13 = [(MPMediaQuery *)self->_mediaQuery protobufferEncodableObject];
  [v13 data];
  MRSystemAppPlaybackQueueSetLocalQueryData();

  int64_t v14 = [(MusicKit_RemoteLibraryPlaybackQueue *)self _persistentIDForStartItem];
  if (v14)
  {
    int64_t v15 = v14;
    id v16 = [getMPMediaLibraryClass_0() defaultMediaLibrary];
    id v17 = [v16 multiverseIdentifierForTrackWithPersistentID:v15];

    [v17 data];
    MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData();
  }
  MRSystemAppPlaybackQueueSetLocalQueryShuffleMode();
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  int64_t v18 = (void *)getMPRemotePlaybackQueueClass_softClass_0;
  uint64_t v35 = getMPRemotePlaybackQueueClass_softClass_0;
  if (!getMPRemotePlaybackQueueClass_softClass_0)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __getMPRemotePlaybackQueueClass_block_invoke_0;
    v31[3] = &unk_1E6D453B0;
    v31[4] = &v32;
    __getMPRemotePlaybackQueueClass_block_invoke_0((uint64_t)v31);
    int64_t v18 = (void *)v33[3];
  }
  id v19 = v18;
  _Block_object_dispose(&v32, 8);
  id v20 = [v19 queueWithMediaRemotePlaybackQueue:v12];
  [v20 _mediaRemotePlaybackQueue];
  [(MusicKit_RemotePlaybackQueue *)self mrReplaceIntentFromMusicKitReplaceQueueIntent:[(MusicKit_RemotePlaybackQueue *)self replaceQueueIntent]];
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  id v22 = v10;
  v23 = v22;
  if (!v22)
  {
    uint64_t v24 = +[MusicKit_PlayerPathSessionManager sharedSessionManager];
    v23 = [v24 sessionIDForPlayerPath:v9];
  }
  uint64_t v25 = *MEMORY[0x1E4F77648];
  v36[0] = *MEMORY[0x1E4F77688];
  v36[1] = v25;
  v37[0] = v23;
  v37[1] = MEMORY[0x1E4F1CC38];
  v36[2] = *MEMORY[0x1E4F777D0];
  v37[2] = ExternalRepresentation;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
  id v30 = 0;
  v27 = [(MusicKit_RemotePlaybackQueue *)self mrPlayerPathFromPlaybackPath:v9 error:&v30];
  id v28 = v30;
  if (v28)
  {
    if (v11) {
      v11[2](v11, 0, v28);
    }
  }
  else
  {
    v29 = v11;
    MRMediaRemoteSendCommandToPlayerWithResult();
  }
}

- (void)insertQueueWithPath:(id)a3 position:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  libraryRequest = self->_libraryRequest;
  if (libraryRequest)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __96__MusicKit_RemoteLibraryPlaybackQueue_insertQueueWithPath_position_sessionID_completionHandler___block_invoke;
    v14[3] = &unk_1E6D45CB0;
    v14[4] = self;
    id v15 = v10;
    int64_t v18 = a4;
    id v16 = v11;
    id v17 = v12;
    [(MusicKit_RemoteLibraryPlaybackQueue *)self _resolveMediaQueryForLibraryRequest:libraryRequest completionHandler:v14];
  }
  else
  {
    [(MusicKit_RemoteLibraryPlaybackQueue *)self _insertQueueWithPath:v10 position:a4 sessionID:v11 completionHandler:v12];
  }
}

- (void)_insertQueueWithPath:(id)a3 position:(int64_t)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v33 = a5;
  id v10 = a6;
  MRSystemAppPlaybackQueueCreate();
  int64_t v11 = [(MusicKit_RemoteLibraryPlaybackQueue *)self _persistentIDForStartItem];
  if (v11)
  {
    int64_t v12 = v11;
    mediaQuery = self->_mediaQuery;
    id MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
    int64_t v14 = [NSNumber numberWithLongLong:v12];
    id v15 = v10;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    id v16 = (id *)getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
    uint64_t v39 = getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
    if (!getMPMediaItemPropertyPersistentIDSymbolLoc_ptr)
    {
      id v17 = (void *)MediaPlayerLibrary_14();
      v37[3] = (uint64_t)dlsym(v17, "MPMediaItemPropertyPersistentID");
      getMPMediaItemPropertyPersistentIDSymbolLoc_ptr = v37[3];
      id v16 = (id *)v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v16) {
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    }
    id v18 = *v16;
    [MPMediaPropertyPredicateClass predicateWithValue:v14 forProperty:v18 comparisonType:0];
    v19 = id v10 = v15;
    [(MPMediaQuery *)mediaQuery addFilterPredicate:v19];
  }
  id v20 = [(MPMediaQuery *)self->_mediaQuery protobufferEncodableObject];
  [v20 data];
  MRSystemAppPlaybackQueueSetLocalQueryData();

  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  id v22 = v33;
  v23 = v22;
  if (!v22)
  {
    uint64_t v24 = +[MusicKit_PlayerPathSessionManager sharedSessionManager];
    v23 = [v24 sessionIDForPlayerPath:v34];
  }
  if (a4 == 2) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 2 * (a4 == 1);
  }
  uint64_t v26 = *MEMORY[0x1E4F77688];
  v41[0] = v23;
  uint64_t v27 = *MEMORY[0x1E4F776E8];
  v40[0] = v26;
  v40[1] = v27;
  id v28 = [NSNumber numberWithInt:v25];
  v41[1] = v28;
  v40[2] = *MEMORY[0x1E4F777D0];
  v41[2] = ExternalRepresentation;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];

  id v30 = [v34 mrPlayerPath];
  uint64_t v35 = v10;
  id v31 = v10;
  MRMediaRemoteSendCommandToPlayerWithResult();
}

- (void)_resolveMediaQueryForLibraryRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__MusicKit_RemoteLibraryPlaybackQueue__resolveMediaQueryForLibraryRequest_completionHandler___block_invoke;
  v7[3] = &unk_1E6D45688;
  id v8 = v5;
  id v6 = v5;
  [a3 performWithResponseHandler:v7];
}

- (int64_t)_persistentIDForStartItem
{
  underlyingStartObject = self->_underlyingStartObject;
  if (!underlyingStartObject) {
    return 0;
  }
  v4 = [(MPModelObject *)underlyingStartObject identifiers];
  id v5 = [v4 library];
  int64_t v6 = [v5 persistentID];

  getMPModelPlaylistEntryClass_0();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = self->_underlyingStartObject;
    id v8 = [(MPModelObject *)v7 song];

    if (v8)
    {
      id v9 = [(MPModelObject *)v7 song];
    }
    else
    {
      id v10 = [(MPModelObject *)v7 tvEpisode];

      if (v10)
      {
        id v9 = [(MPModelObject *)v7 tvEpisode];
      }
      else
      {
        int64_t v11 = [(MPModelObject *)v7 movie];

        if (!v11)
        {
LABEL_11:

          return v6;
        }
        id v9 = [(MPModelObject *)v7 movie];
      }
    }
    int64_t v12 = v9;
    objc_super v13 = [v9 identifiers];
    int64_t v14 = [v13 library];
    int64_t v6 = [v14 persistentID];

    goto LABEL_11;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingStartObject, 0);
  objc_storeStrong((id *)&self->_mediaQuery, 0);
  objc_storeStrong((id *)&self->_libraryRequest, 0);
}

@end