@interface SUScriptMediaLibrary
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)_isRestricted;
- (NSString)itemPropertyAlbumArtist;
- (NSString)itemPropertyAlbumTitle;
- (NSString)itemPropertyArtist;
- (NSString)itemPropertyComposer;
- (NSString)itemPropertyDiscCount;
- (NSString)itemPropertyDiscNumber;
- (NSString)itemPropertyGenre;
- (NSString)itemPropertyIsCompilation;
- (NSString)itemPropertyIsHD;
- (NSString)itemPropertyIsRental;
- (NSString)itemPropertyLastPlayedDate;
- (NSString)itemPropertyLyrics;
- (NSString)itemPropertyMediaType;
- (NSString)itemPropertyPersistentID;
- (NSString)itemPropertyPlayCount;
- (NSString)itemPropertyPlaybackDuration;
- (NSString)itemPropertyPodcastTitle;
- (NSString)itemPropertyRating;
- (NSString)itemPropertySkipCount;
- (NSString)itemPropertyStoreID;
- (NSString)itemPropertyTitle;
- (NSString)itemPropertyTrackCount;
- (NSString)itemPropertyTrackNumber;
- (NSString)mediaTypeAny;
- (NSString)mediaTypeAnyAudio;
- (NSString)mediaTypeAnyVideo;
- (NSString)mediaTypeAudiobook;
- (NSString)mediaTypeMovie;
- (NSString)mediaTypeMusic;
- (NSString)mediaTypeMusicVideo;
- (NSString)mediaTypePodcast;
- (NSString)mediaTypeTVShow;
- (NSString)mediaTypeVideoPodcast;
- (NSString)playerTypeApplication;
- (NSString)playerTypeIPod;
- (NSString)queryPresetAlbums;
- (NSString)queryPresetArtists;
- (NSString)queryPresetAudiobooks;
- (NSString)queryPresetCompilations;
- (NSString)queryPresetComposers;
- (NSString)queryPresetGenres;
- (NSString)queryPresetMovies;
- (NSString)queryPresetMusicVideos;
- (NSString)queryPresetPlaylists;
- (NSString)queryPresetPodcasts;
- (NSString)queryPresetSongs;
- (NSString)queryPresetTVShows;
- (NSString)queryPresetVideoPodcasts;
- (id)_className;
- (id)containsAdamID:(id)a3;
- (id)containsAdamIDs:(id)a3;
- (id)makeCollectionWithItems:(id)a3;
- (id)makePickerWithMediaTypes:(id)a3;
- (id)makeQueryWithPreset:(id)a3;
- (id)musicPlayerForType:(id)a3;
- (id)playSongsInCollectionWithAdamID:(id)a3 firstItemID:(id)a4;
- (id)playSongsWithAdamIDs:(id)a3;
- (id)playVideoWithAdamID:(id)a3;
- (id)scriptAttributeKeys;
- (void)_connectNativeObject;
- (void)_launchMusicApp;
- (void)_launchMusicAppAfterPlayback:(id)a3 firstItem:(id)a4;
- (void)dealloc;
- (void)getProperties:(id)a3 ofAdamIDs:(id)a4 withCompletionFunction:(id)a5;
@end

@implementation SUScriptMediaLibrary

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaLibrary;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)containsAdamID:(id)a3
{
  if (SSGetUnsignedLongLongFromValue())
  {
    id v4 = objc_alloc_init(NSNumber);
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v5 = dispatch_semaphore_create(0);
    dispatch_retain(v5);
    id v6 = +[SUMediaLibraryAdamIDCache sharedCache];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__SUScriptMediaLibrary_containsAdamID___block_invoke;
    v10[3] = &unk_2648139C0;
    v10[5] = v5;
    v10[6] = &v11;
    v10[4] = self;
    [v6 getContainsAdamID:v4 completionBlock:v10];
    dispatch_time_t v7 = dispatch_time(0, 500000000);
    dispatch_semaphore_wait(v5, v7);
    dispatch_release(v5);
    [(SUScriptObject *)self lock];
    LODWORD(v5) = *((unsigned __int8 *)v12 + 24);
    [(SUScriptObject *)self unlock];

    _Block_object_dispose(&v11, 8);
    v8 = (id *)MEMORY[0x263EFFB40];
    if (!v5) {
      v8 = (id *)MEMORY[0x263EFFB38];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    v8 = (id *)MEMORY[0x263EFFB38];
  }
  return *v8;
}

void __39__SUScriptMediaLibrary_containsAdamID___block_invoke(uint64_t a1, char a2)
{
  [*(id *)(a1 + 32) lock];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  [*(id *)(a1 + 32) unlock];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  id v4 = *(NSObject **)(a1 + 40);

  dispatch_release(v4);
}

- (id)containsAdamIDs:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v5 = [(SUScriptObject *)self copyJavaScriptContext];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  dispatch_time_t v7 = JSObjectMake(v5, 0, 0);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [a3 webScriptValueAtIndex:0];
  uint64_t v9 = SSGetUnsignedLongLongFromValue();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 1;
    do
    {
      v12 = (void *)[objc_alloc(NSNumber) initWithItemIdentifier:v10];
      [v8 addObject:v12];

      [a3 webScriptValueAtIndex:v11];
      uint64_t v10 = SSGetUnsignedLongLongFromValue();
      uint64_t v11 = (v11 + 1);
    }
    while (v10);
  }
  v24 = v8;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3052000000;
  v33 = __Block_byref_object_copy__20;
  v34 = __Block_byref_object_dispose__20;
  id v35 = 0;
  id v35 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v13 = dispatch_semaphore_create(0);
  dispatch_retain(v13);
  id v14 = +[SUMediaLibraryAdamIDCache sharedCache];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __40__SUScriptMediaLibrary_containsAdamIDs___block_invoke;
  v29[3] = &unk_2648139E8;
  v29[5] = v13;
  v29[6] = &v30;
  v29[4] = self;
  [v14 getIntersectionWithSet:v8 completionBlock:v29];
  dispatch_time_t v15 = dispatch_time(0, 500000000);
  dispatch_semaphore_wait(v13, v15);
  dispatch_release(v13);
  [(SUScriptObject *)self lock];
  id v23 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v16 = (void *)v31[5];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "itemIdentifierValue"));
        SUJSObjectSetBooleanProperty(v6, v7, v20);
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v17);
  }

  v31[5] = 0;
  [(SUScriptObject *)self unlock];

  v21 = objc_msgSend(MEMORY[0x263F1FA90], "scriptObjectForJSObject:originRootObject:rootObject:", v7, objc_msgSend(v23, "_originRootObject"), objc_msgSend(v23, "_rootObject"));
  JSGlobalContextRelease(v6);
  _Block_object_dispose(&v30, 8);
  return v21;
}

void __40__SUScriptMediaLibrary_containsAdamIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) unionSet:a2];
  [*(id *)(a1 + 32) unlock];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  id v4 = *(NSObject **)(a1 + 40);

  dispatch_release(v4);
}

- (void)getProperties:(id)a3 ofAdamIDs:(id)a4 withCompletionFunction:(id)a5
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v9 = (void *)[a4 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
    uint64_t v10 = (void *)[a3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
    if ([v9 count] && objc_msgSend(v10, "count"))
    {
      id v11 = +[SUMediaLibraryAdamIDCache sharedCache];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __71__SUScriptMediaLibrary_getProperties_ofAdamIDs_withCompletionFunction___block_invoke;
      v13[3] = &unk_264813A10;
      v13[4] = a5;
      v13[5] = self;
      [v11 getProperties:v10 ofAdamIDs:v9 withCompletionBlock:v13];
    }
    else
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x263F1FA90];
    [v12 throwException:@"Invalid argument"];
  }
}

void __71__SUScriptMediaLibrary_getProperties_ofAdamIDs_withCompletionFunction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  [(SUScriptFunction *)v4 setThisObject:*(void *)(a1 + 40)];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = objc_alloc_init(SUScriptMediaItem);
        [(SUScriptObject *)v11 setNativeObject:+[SUScriptNativeObject objectWithNativeObject:v10]];
        [v5 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  -[SUScriptFunction callWithArguments:](v4, "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v5, 0));

  [(SUScriptFunction *)v4 setThisObject:0];
}

- (id)makeCollectionWithItems:(id)a3
{
  if ([(SUScriptMediaLibrary *)self _isRestricted]
    || (id v5 = [[SUScriptMediaItemCollection alloc] initWithItems:a3]) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF9D0];
    return (id)[v8 null];
  }
  else
  {
    uint64_t v6 = v5;
    [(SUScriptObject *)self checkInScriptObject:v5];
    return v6;
  }
}

- (id)makePickerWithMediaTypes:(id)a3
{
  if ([(SUScriptMediaLibrary *)self _isRestricted]
    || (id v5 = [[SUScriptMediaPickerController alloc] initWithMediaTypes:a3]) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF9D0];
    return (id)[v8 null];
  }
  else
  {
    uint64_t v6 = v5;
    [(SUScriptObject *)self checkInScriptObject:v5];
    return v6;
  }
}

- (id)makeQueryWithPreset:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  long long v12 = __Block_byref_object_copy__20;
  long long v13 = __Block_byref_object_dispose__20;
  uint64_t v14 = 0;
  if (![(SUScriptMediaLibrary *)self _isRestricted])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (a3 == 0) | objc_opt_isKindOfClass() & 1)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      WebThreadRunOnMainThread();
      [(SUScriptObject *)self checkInScriptObject:v10[5]];
    }
    else
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
  }
  id v5 = (void *)v10[5];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (id)[MEMORY[0x263EFF9D0] null];
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v9, 8);
  return v7;
}

uint64_t __44__SUScriptMediaLibrary_makeQueryWithPreset___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetAlbums")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] albumsQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetArtists")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] artistsQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetSongs")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] songsQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetPlaylists")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] playlistsQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetPodcasts")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] podcastsQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetAudiobooks")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] audiobooksQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetCompilations")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] compilationsQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetComposers")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] composersQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetGenres")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] genresQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetMovies")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] moviesQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetMusicVideos")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] musicVideosQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetTVShows")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] tvShowsQuery];
    goto LABEL_27;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetVideoPodcasts")))
  {
    uint64_t v2 = [MEMORY[0x263F11E68] videoPodcastsQuery];
LABEL_27:
    id v3 = (id)v2;
    if (v2) {
      goto LABEL_29;
    }
  }
  id v3 = objc_alloc_init(MEMORY[0x263F11E68]);
LABEL_29:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_alloc_init(SUScriptMediaQuery);
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v5 = +[SUScriptNativeObject objectWithNativeObject:v3];

  return [v4 setNativeObject:v5];
}

- (id)musicPlayerForType:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    return (id)[MEMORY[0x263EFF9D0] null];
  }
  if ([(SUScriptMediaLibrary *)self _isRestricted]) {
    return (id)[MEMORY[0x263EFF9D0] null];
  }
  [(SUScriptObject *)self lock];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  musicPlayers = self->_musicPlayers;
  uint64_t v6 = [(NSMutableArray *)musicPlayers countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6)
  {
    [(SUScriptObject *)self unlock];
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(musicPlayers);
      }
      uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v11, "playerType"), "isEqual:", a3)) {
        uint64_t v8 = v11;
      }
    }
    uint64_t v7 = [(NSMutableArray *)musicPlayers countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v7);
  [(SUScriptObject *)self unlock];
  if (!v8 || ![(SUScriptObject *)self scriptObjectIsCheckedIn:v8])
  {
LABEL_19:
    long long v13 = [[SUScriptMusicPlayerController alloc] initWithPlayerType:a3];
    if (v13)
    {
      uint64_t v8 = v13;
      [(SUScriptObject *)self checkInScriptObject:v13];
      [(SUScriptObject *)self lock];
      uint64_t v14 = self->_musicPlayers;
      if (!v14)
      {
        uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        self->_musicPlayers = v14;
      }
      [(NSMutableArray *)v14 addObject:v8];
      [(SUScriptObject *)self unlock];
      long long v15 = v8;
      return v8;
    }
    return (id)[MEMORY[0x263EFF9D0] null];
  }
  return v8;
}

- (id)playSongsInCollectionWithAdamID:(id)a3 firstItemID:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (!a4 || (objc_opt_respondsToSelector())) {
    WebThreadRunOnMainThread();
  }
  else {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  if (*((unsigned char *)v9 + 24)) {
    id v5 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    id v5 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v6 = *v5;
  _Block_object_dispose(&v8, 8);
  return v6;
}

void __68__SUScriptMediaLibrary_playSongsInCollectionWithAdamID_firstItemID___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[MEMORY[0x263F11E68] albumsQuery];
  id v3 = (void *)MEMORY[0x263F11E60];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(v2, "addFilterPredicate:", objc_msgSend(v3, "predicateWithValue:forProperty:", v4, *MEMORY[0x263F113E0]));
  id v5 = (void *)[v2 items];
  if ([v5 count])
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F11E18]) initWithItems:v5];
    uint64_t v7 = *(void **)(a1 + 48);
    if (v7
      && (uint64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "longLongValue")),
          long long v33 = 0u,
          long long v34 = 0u,
          long long v35 = 0u,
          long long v36 = 0u,
          (uint64_t v9 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16]) != 0))
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      uint64_t v12 = *MEMORY[0x263F113D8];
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
        if (objc_msgSend((id)objc_msgSend(v14, "valueForProperty:", v12), "isEqualToNumber:", v8)) {
          break;
        }
        if (v10 == ++v13)
        {
          uint64_t v10 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
          uint64_t v14 = 0;
          if (v10) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    long long v15 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = [v5 count];
      int v38 = 138412546;
      uint64_t v39 = v18;
      __int16 v40 = 2048;
      uint64_t v41 = v19;
      LODWORD(v32) = 22;
      v31 = &v38;
      uint64_t v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v38, v32);
        free(v21);
        v31 = (int *)v22;
        SSFileLog();
      }
    }
    id v23 = objc_msgSend(MEMORY[0x263F120B0], "systemMusicPlayer", v31);
    [v23 setQueueWithItemCollection:v6];
    [*(id *)(a1 + 40) _launchMusicAppAfterPlayback:v23 firstItem:v14];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    v24 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v26 &= 2u;
    }
    if (v26)
    {
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = *(void *)(a1 + 32);
      int v38 = 138412546;
      uint64_t v39 = v27;
      __int16 v40 = 2112;
      uint64_t v41 = v28;
      LODWORD(v32) = 22;
      uint64_t v29 = _os_log_send_and_compose_impl();
      if (v29)
      {
        uint64_t v30 = (void *)v29;
        objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v38, v32);
        free(v30);
        SSFileLog();
      }
    }
  }
}

- (id)playSongsWithAdamIDs:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)[a3 copyArrayValueWithValidator:SURespondsValidator context:sel_longLongValue];
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  if (*((unsigned char *)v9 + 24)) {
    id v5 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    id v5 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v6 = *v5;
  _Block_object_dispose(&v8, 8);
  return v6;
}

void __45__SUScriptMediaLibrary_playSongsWithAdamIDs___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v1 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v35;
    uint64_t v4 = *MEMORY[0x263F113D8];
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v35 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = objc_msgSend(MEMORY[0x263F11E60], "predicateWithValue:forProperty:", objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "longLongValue")), v4);
        id v7 = objc_alloc(MEMORY[0x263F11E68]);
        uint64_t v8 = objc_msgSend(v7, "initWithFilterPredicates:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v6, 0));
        uint64_t v9 = (void *)[v8 items];
        if ([v9 count] == 1) {
          objc_msgSend(v32, "addObject:", objc_msgSend(v9, "objectAtIndex:", 0));
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v2);
  }
  if ([v32 count])
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F11E18]) initWithItems:v32];
    char v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v14 = v13;
    }
    else {
      int v14 = v13 & 2;
    }
    if (v14)
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = [v10 count];
      int v38 = 138412546;
      uint64_t v39 = v15;
      __int16 v40 = 2048;
      uint64_t v41 = v16;
      LODWORD(v30) = 22;
      uint64_t v29 = &v38;
      uint64_t v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v38, v30);
        free(v18);
        uint64_t v29 = (int *)v19;
        SSFileLog();
      }
    }
    uint64_t v20 = objc_msgSend(MEMORY[0x263F120B0], "systemMusicPlayer", v29);
    [v20 setQueueWithItemCollection:v10];
    [*(id *)(a1 + 40) _launchMusicAppAfterPlayback:v20 firstItem:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v21 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    if (os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v24 = v23;
    }
    else {
      int v24 = v23 & 2;
    }
    if (v24)
    {
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = *(void *)(a1 + 32);
      int v38 = 138412546;
      uint64_t v39 = v25;
      __int16 v40 = 2112;
      uint64_t v41 = v26;
      LODWORD(v30) = 22;
      uint64_t v27 = _os_log_send_and_compose_impl();
      if (v27)
      {
        uint64_t v28 = (void *)v27;
        objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, &v38, v30);
        free(v28);
        SSFileLog();
      }
    }
  }
}

- (id)playVideoWithAdamID:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (objc_opt_respondsToSelector()) {
    WebThreadRunOnMainThread();
  }
  else {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  if (*((unsigned char *)v7 + 24)) {
    uint64_t v3 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v3 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;
  _Block_object_dispose(&v6, 8);
  return v4;
}

void __44__SUScriptMediaLibrary_playVideoWithAdamID___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  uint64_t v3 = [MEMORY[0x263F11E60] predicateWithValue:v2 forProperty:*MEMORY[0x263F113D8]];
  id v4 = objc_alloc(MEMORY[0x263F11E68]);
  id v5 = objc_msgSend(v4, "initWithFilterPredicates:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v3, 0));
  if ([v5 _hasItems])
  {
    uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"videos://play?adam-id=%@", v2];
    id v7 = (void *)[objc_alloc(NSURL) initWithString:v6];
    uint64_t v8 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v23 = 138412546;
      uint64_t v24 = objc_opt_class();
      __int16 v25 = 2112;
      uint64_t v26 = v2;
      LODWORD(v22) = 22;
      uint64_t v21 = &v23;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        int v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v23, v22);
        free(v12);
        uint64_t v21 = (int *)v13;
        SSFileLog();
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", v21), "openSensitiveURL:withOptions:", v7, 0);
  }
  else
  {
    int v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = *(void *)(a1 + 32);
      int v23 = 138412546;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      LODWORD(v22) = 22;
      uint64_t v19 = _os_log_send_and_compose_impl();
      if (v19)
      {
        uint64_t v20 = (void *)v19;
        objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v23, v22);
        free(v20);
        SSFileLog();
      }
    }
  }
}

- (id)_className
{
  return @"iTunesMediaLibrary";
}

- (NSString)itemPropertyAlbumArtist
{
  return (NSString *)*MEMORY[0x263F11208];
}

- (NSString)itemPropertyAlbumTitle
{
  return (NSString *)*MEMORY[0x263F11220];
}

- (NSString)itemPropertyArtist
{
  return (NSString *)*MEMORY[0x263F11238];
}

- (NSString)itemPropertyComposer
{
  return (NSString *)*MEMORY[0x263F11260];
}

- (NSString)itemPropertyDiscCount
{
  return (NSString *)*MEMORY[0x263F11270];
}

- (NSString)itemPropertyDiscNumber
{
  return (NSString *)*MEMORY[0x263F11278];
}

- (NSString)itemPropertyGenre
{
  return (NSString *)*MEMORY[0x263F112A0];
}

- (NSString)itemPropertyIsCompilation
{
  return (NSString *)*MEMORY[0x263F112E0];
}

- (NSString)itemPropertyIsHD
{
  return (NSString *)*MEMORY[0x263F112F8];
}

- (NSString)itemPropertyIsRental
{
  return (NSString *)*MEMORY[0x263F11320];
}

- (NSString)itemPropertyLastPlayedDate
{
  return (NSString *)*MEMORY[0x263F11340];
}

- (NSString)itemPropertyLyrics
{
  return (NSString *)*MEMORY[0x263F11350];
}

- (NSString)itemPropertyMediaType
{
  return (NSString *)*MEMORY[0x263F11358];
}

- (NSString)itemPropertyPersistentID
{
  return (NSString *)*MEMORY[0x263F11368];
}

- (NSString)itemPropertyPlayCount
{
  return (NSString *)*MEMORY[0x263F11370];
}

- (NSString)itemPropertyPlaybackDuration
{
  return (NSString *)*MEMORY[0x263F11380];
}

- (NSString)itemPropertyPodcastTitle
{
  return (NSString *)*MEMORY[0x263F11390];
}

- (NSString)itemPropertyRating
{
  return (NSString *)*MEMORY[0x263F113A0];
}

- (NSString)itemPropertySkipCount
{
  return (NSString *)*MEMORY[0x263F113B0];
}

- (NSString)itemPropertyStoreID
{
  return (NSString *)*MEMORY[0x263F113D8];
}

- (NSString)itemPropertyTitle
{
  return (NSString *)*MEMORY[0x263F11400];
}

- (NSString)itemPropertyTrackCount
{
  return (NSString *)*MEMORY[0x263F11228];
}

- (NSString)itemPropertyTrackNumber
{
  return (NSString *)*MEMORY[0x263F11230];
}

- (NSString)mediaTypeAny
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:-1];
}

- (NSString)mediaTypeAnyAudio
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:255];
}

- (NSString)mediaTypeAnyVideo
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:65280];
}

- (NSString)mediaTypeAudiobook
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:4];
}

- (NSString)mediaTypeMovie
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:256];
}

- (NSString)mediaTypeMusic
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:1];
}

- (NSString)mediaTypeMusicVideo
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:2048];
}

- (NSString)mediaTypePodcast
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:2];
}

- (NSString)mediaTypeTVShow
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:512];
}

- (NSString)mediaTypeVideoPodcast
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:1024];
}

- (NSString)playerTypeApplication
{
  return (NSString *)@"app";
}

- (NSString)playerTypeIPod
{
  return (NSString *)@"iPod";
}

- (NSString)queryPresetAlbums
{
  return (NSString *)@"albums";
}

- (NSString)queryPresetArtists
{
  return (NSString *)@"artists";
}

- (NSString)queryPresetAudiobooks
{
  return (NSString *)@"audiobooks";
}

- (NSString)queryPresetCompilations
{
  return (NSString *)@"compilations";
}

- (NSString)queryPresetComposers
{
  return (NSString *)@"composers";
}

- (NSString)queryPresetGenres
{
  return (NSString *)@"genres";
}

- (NSString)queryPresetMovies
{
  return (NSString *)@"movies";
}

- (NSString)queryPresetMusicVideos
{
  return (NSString *)@"musicvideos";
}

- (NSString)queryPresetPlaylists
{
  return (NSString *)@"playlists";
}

- (NSString)queryPresetPodcasts
{
  return (NSString *)@"podcasts";
}

- (NSString)queryPresetSongs
{
  return (NSString *)@"songs";
}

- (NSString)queryPresetTVShows
{
  return (NSString *)@"tvshows";
}

- (NSString)queryPresetVideoPodcasts
{
  return (NSString *)@"videopodcasts";
}

- (void)_connectNativeObject
{
}

uint64_t __44__SUScriptMediaLibrary__connectNativeObject__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptMediaLibraryNativeObject, "objectWithNativeObject:", [MEMORY[0x263F11E40] defaultMediaLibrary]);

  return [v1 setNativeObject:v2];
}

- (BOOL)_isRestricted
{
  return ![(SUScriptObject *)self sourceIsTrusted];
}

- (void)_launchMusicApp
{
  uint64_t v2 = (void *)[MEMORY[0x263F01880] defaultWorkspace];
  if ((objc_msgSend(v2, "openSensitiveURL:withOptions:", objc_msgSend(NSURL, "URLWithString:", @"music://show-now-playing"), 0) & 1) == 0)
  {
    MEMORY[0x270F77188](@"com.apple.Music", 0);
  }
}

- (void)_launchMusicAppAfterPlayback:(id)a3 firstItem:(id)a4
{
  id v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3052000000;
  uint64_t v18 = __Block_byref_object_copy__20;
  uint64_t v19 = __Block_byref_object_dispose__20;
  uint64_t v20 = 0;
  uint64_t v8 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v9 = *MEMORY[0x263F11B48];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__SUScriptMediaLibrary__launchMusicAppAfterPlayback_firstItem___block_invoke;
  v14[3] = &unk_264813A88;
  v14[4] = a3;
  v14[5] = self;
  v14[6] = v7;
  v14[7] = &v15;
  int v10 = (void *)[v7 addObserverForName:v9 object:a3 queue:v8 usingBlock:v14];
  v16[5] = (uint64_t)v10;
  id v11 = v10;
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__SUScriptMediaLibrary__launchMusicAppAfterPlayback_firstItem___block_invoke_92;
  v13[3] = &unk_264813AB0;
  v13[4] = self;
  v13[5] = v7;
  void v13[6] = a3;
  v13[7] = &v15;
  dispatch_after(v12, MEMORY[0x263EF83A0], v13);
  [a3 beginGeneratingPlaybackNotifications];
  if (a4) {
    [a3 setNowPlayingItem:a4];
  }
  [a3 play];
  _Block_object_dispose(&v15, 8);
}

uint64_t __63__SUScriptMediaLibrary__launchMusicAppAfterPlayback_firstItem___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) playbackState];
  if (result == 1)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v5 &= 2u;
    }
    if (v5)
    {
      int v11 = 138412290;
      uint64_t v12 = objc_opt_class();
      LODWORD(v10) = 12;
      uint64_t v9 = &v11;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        id v7 = (void *)v6;
        uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v11, v10);
        free(v7);
        uint64_t v9 = (int *)v8;
        SSFileLog();
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_launchMusicApp", v9);
    [*(id *)(a1 + 48) removeObserver:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = 0;
    return [*(id *)(a1 + 32) endGeneratingPlaybackNotifications];
  }
  return result;
}

uint64_t __63__SUScriptMediaLibrary__launchMusicAppAfterPlayback_firstItem___block_invoke_92(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8) + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    if (!os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v4 &= 2u;
    }
    if (v4)
    {
      int v10 = 138412290;
      uint64_t v11 = objc_opt_class();
      LODWORD(v9) = 12;
      uint64_t v8 = &v10;
      uint64_t v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, &v10, v9);
        free(v6);
        uint64_t v8 = (int *)v7;
        SSFileLog();
      }
    }
    objc_msgSend(*(id *)(v1 + 32), "_launchMusicApp", v8);
    [*(id *)(v1 + 40) removeObserver:*(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40)];

    *(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) = 0;
    return [*(id *)(v1 + 48) endGeneratingPlaybackNotifications];
  }
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_34, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaLibrary;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_28, 10);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaLibrary;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaLibrary;
  uint64_t v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_34 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_28 = (uint64_t)sel_containsAdamID_;
    unk_2681B4F30 = @"containsAdamID";
    qword_2681B4F38 = (uint64_t)sel_containsAdamIDs_;
    unk_2681B4F40 = @"containsAdamIDs";
    qword_2681B4F48 = (uint64_t)sel_getProperties_ofAdamIDs_withCompletionFunction_;
    unk_2681B4F50 = @"getItemProperties";
    qword_2681B4F58 = (uint64_t)sel_makeCollectionWithItems_;
    unk_2681B4F60 = @"createCollection";
    qword_2681B4F68 = (uint64_t)sel_makePickerWithMediaTypes_;
    unk_2681B4F70 = @"createPicker";
    qword_2681B4F78 = (uint64_t)sel_makeQueryWithPreset_;
    unk_2681B4F80 = @"createQuery";
    qword_2681B4F88 = (uint64_t)sel_musicPlayerForType_;
    unk_2681B4F90 = @"getMusicPlayer";
    qword_2681B4F98 = (uint64_t)sel_playSongsInCollectionWithAdamID_firstItemID_;
    unk_2681B4FA0 = @"playCollection";
    qword_2681B4FA8 = (uint64_t)sel_playSongsWithAdamIDs_;
    unk_2681B4FB0 = @"playMusic";
    qword_2681B4FB8 = (uint64_t)sel_playVideoWithAdamID_;
    unk_2681B4FC0 = @"playVideo";
    __KeyMapping_34 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"ITEM_ALBUM_ARTIST", @"itemPropertyAlbumArtist", @"ITEM_ALBUM_TITLE", @"itemPropertyAlbumTitle", @"ITEM_ARTIST", @"itemPropertyArtist", @"ITEM_COMPOSER", @"itemPropertyComposer", @"ITEM_DISC_COUNT", @"itemPropertyDiscCount", @"ITEM_DISC_NUMBER", @"itemPropertyDiscNumber", @"ITEM_GENRE", @"itemPropertyGenre", @"ITEM_IS_COMPILATION", @"itemPropertyIsCompilation", @"ITEM_IS_HD",
                        @"itemPropertyIsHD",
                        @"ITEM_IS_RENTAL",
                        @"itemPropertyIsRental",
                        @"ITEM_LAST_PLAYED_DATE",
                        @"itemPropertyLastPlayedDate",
                        @"ITEM_LYRICS",
                        @"itemPropertyLyrics",
                        @"ITEM_MEDIA_TYPE",
                        @"itemPropertyMediaType",
                        @"ITEM_PERSISTENT_ID",
                        @"itemPropertyPersistentID",
                        @"ITEM_PLAY_COUNT",
                        @"itemPropertyPlayCount",
                        @"ITEM_PLAYBACK_DURATION",
                        @"itemPropertyPlaybackDuration",
                        @"ITEM_PODCAST_TITLE",
                        @"itemPropertyPodcastTitle",
                        @"ITEM_RATING",
                        @"itemPropertyRating",
                        @"ITEM_SKIP_COUNT",
                        @"itemPropertySkipCount",
                        @"ITEM_STORE_ID",
                        @"itemPropertyStoreID",
                        @"ITEM_TITLE",
                        @"itemPropertyTitle",
                        @"ITEM_TRACK_COUNT",
                        @"itemPropertyTrackCount",
                        @"ITEM_TRACK_NUMBER",
                        @"itemPropertyTrackNumber",
                        @"MEDIA_TYPE_ANY",
                        @"mediaTypeAny",
                        @"MEDIA_TYPE_ANY_AUDIO",
                        @"mediaTypeAnyAudio",
                        @"MEDIA_TYPE_ANY_VIDEO",
                        @"mediaTypeAnyVideo",
                        @"MEDIA_TYPE_AUDIOBOOK",
                        @"mediaTypeAudiobook",
                        @"MEDIA_TYPE_MOVIE",
                        @"mediaTypeMovie",
                        @"MEDIA_TYPE_MUSIC",
                        @"mediaTypeMusic",
                        @"MEDIA_TYPE_MUSIC_VIDEO",
                        @"mediaTypeMusicVideo",
                        @"MEDIA_TYPE_PODCAST");
  }
}

@end