@interface MCDLibraryAddObserver
- (BOOL)didReceiveAlbumResponse;
- (BOOL)didReceivePlaylistResponse;
- (BOOL)isAlbumAddable;
- (BOOL)isAlbumAdded;
- (BOOL)isCloudLibraryEnabled;
- (BOOL)isPlaylistAddable;
- (BOOL)isPlaylistAdded;
- (BOOL)isSongAddable;
- (BOOL)isSongAdded;
- (BOOL)shouldShowFavoriteSong;
- (MCDStorePlaybackItemsManager)albumsContentManager;
- (MCDStorePlaybackItemsManager)playlistContentManager;
- (MPLibraryAddStatusObserver)songAddStatusObserver;
- (MPModelAlbum)album;
- (MPModelObject)referralObject;
- (MPModelPlaylist)playlist;
- (MPModelSong)song;
- (id)updateBlock;
- (void)_addItemToLibrary:(id)a3;
- (void)addAlbumToLibrary;
- (void)addPlaylistToLibrary;
- (void)addSongToLibrary;
- (void)contentManager:(id)a3 didReceiveResponse:(id)a4;
- (void)setAlbum:(id)a3;
- (void)setAlbumsContentManager:(id)a3;
- (void)setDidReceiveAlbumResponse:(BOOL)a3;
- (void)setDidReceivePlaylistResponse:(BOOL)a3;
- (void)setPlaylist:(id)a3;
- (void)setPlaylistContentManager:(id)a3;
- (void)setReferralObject:(id)a3;
- (void)setSong:(id)a3;
- (void)setSongAddStatusObserver:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)updateRequestForTracklist:(id)a3;
@end

@implementation MCDLibraryAddObserver

- (void)setUpdateBlock:(id)a3
{
}

- (void)updateRequestForTracklist:(id)a3
{
  id v4 = a3;
  v5 = [v4 playingItem];
  v6 = [v5 metadataObject];
  v7 = [v6 flattenedGenericObject];

  if ([v7 type] == (id)1)
  {
    v8 = [v7 song];
    [(MCDLibraryAddObserver *)self setSong:v8];

    v9 = sub_1000A5CE4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [(MCDLibraryAddObserver *)self song];
      v11 = [v10 debugDescription];
      int v31 = 138543362;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "LibraryAddObserver: Song updated %{public}@", (uint8_t *)&v31, 0xCu);
    }
  }
  else
  {
    [(MCDLibraryAddObserver *)self setSong:0];
  }
  v12 = [v4 playingItemIndexPath];

  if (!v12)
  {
    [(MCDLibraryAddObserver *)self setDidReceivePlaylistResponse:0];
    v19 = 0;
    id v21 = 0;
    goto LABEL_16;
  }
  v13 = [v4 items];
  v14 = [v4 playingItemIndexPath];
  v15 = [v13 sectionAtIndex:[v14 section]];

  v16 = [v15 metadataObject];
  id v17 = [v16 type];
  if (v17 == (id)2)
  {
    v18 = [v16 album];
    v20 = 0;
    v19 = v18;
    goto LABEL_12;
  }
  if (v17 == (id)4)
  {
    v18 = [v16 playlist];
    v19 = 0;
    v20 = v18;
LABEL_12:
    id v21 = v18;
    goto LABEL_14;
  }
  id v21 = 0;
  v19 = 0;
  v20 = 0;
LABEL_14:

  [(MCDLibraryAddObserver *)self setDidReceivePlaylistResponse:0];
  if (v20)
  {
    v22 = [MCDStorePlaybackItemsManager alloc];
    v23 = [(MCDPlaylistTracksDataSource *)[MCDPlaylistAddedDataSource alloc] initWithLimitedUI:0 playlist:v20];
    v24 = [(_MCDContentManager *)v22 initWithDataSource:v23 delegate:self];
    [(MCDLibraryAddObserver *)self setPlaylistContentManager:v24];

    goto LABEL_17;
  }
LABEL_16:
  [(MCDLibraryAddObserver *)self setPlaylistContentManager:0];
  v20 = 0;
LABEL_17:
  [(MCDLibraryAddObserver *)self setDidReceiveAlbumResponse:0];
  if (!v19)
  {
    v25 = [(MCDLibraryAddObserver *)self song];
    v19 = [v25 album];

    if (v21)
    {
      if (v19) {
        goto LABEL_20;
      }
    }
    else
    {
      id v21 = v19;
      if (v19) {
        goto LABEL_20;
      }
    }
    [(MCDLibraryAddObserver *)self setAlbumsContentManager:0];
    goto LABEL_21;
  }
LABEL_20:
  v26 = [MCDStorePlaybackItemsManager alloc];
  v27 = [(MCDAlbumTracksDataSource *)[MCDAlbumAddedDataSource alloc] initWithLimitedUI:0 album:v19 storeContent:0];
  v28 = [(_MCDContentManager *)v26 initWithDataSource:v27 delegate:self];
  [(MCDLibraryAddObserver *)self setAlbumsContentManager:v28];

LABEL_21:
  v29 = [(MCDLibraryAddObserver *)self song];
  if (!v29)
  {
    v29 = [(MCDLibraryAddObserver *)self album];
    if (!v29)
    {
      v30 = [(MCDLibraryAddObserver *)self playlist];

      if (v30) {
        goto LABEL_24;
      }
      v29 = sub_1000A5CE4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100D6963C((uint64_t)v4, v29);
      }
    }
  }

LABEL_24:
}

- (void)setSong:(id)a3
{
  v5 = (MPModelSong *)a3;
  if (self->_song != v5) {
    objc_storeStrong((id *)&self->_song, a3);
  }
  v6 = [(MCDLibraryAddObserver *)self songAddStatusObserver];
  v7 = v6;
  if (v5)
  {
    v8 = [(MCDLibraryAddObserver *)self songAddStatusObserver];

    if (v8)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = objc_alloc_init((Class)MPLibraryAddStatusObserver);

      objc_initWeak(&location, self);
      v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      v12 = sub_1000A5F3C;
      v13 = &unk_100FC3928;
      objc_copyWeak(&v14, &location);
      [v9 setStatusBlock:&v10];
      -[MCDLibraryAddObserver setSongAddStatusObserver:](self, "setSongAddStatusObserver:", v9, v10, v11, v12, v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    [v9 configureWithModelObject:v5];
  }
  else
  {

    if (v7) {
      [(MCDLibraryAddObserver *)self setSongAddStatusObserver:0];
    }
  }
}

- (void)addSongToLibrary
{
  v3 = sub_1000A5CE4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Adding song to library", v5, 2u);
  }

  id v4 = [(MCDLibraryAddObserver *)self song];
  [(MCDLibraryAddObserver *)self _addItemToLibrary:v4];
}

- (void)addAlbumToLibrary
{
  v3 = sub_1000A5CE4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Adding album to library", v5, 2u);
  }

  id v4 = [(MCDLibraryAddObserver *)self album];
  [(MCDLibraryAddObserver *)self _addItemToLibrary:v4];
}

- (void)addPlaylistToLibrary
{
  v3 = sub_1000A5CE4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Adding playlist to library", v5, 2u);
  }

  id v4 = [(MCDLibraryAddObserver *)self playlist];
  [(MCDLibraryAddObserver *)self _addItemToLibrary:v4];
}

- (void)_addItemToLibrary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init((Class)MPMutableSectionedCollection);
    [v5 appendSection:&stru_101023248];
    [v5 appendItem:v4];
    id v6 = objc_alloc_init((Class)MPModelLibraryImportChangeRequest);
    [v6 setShouldLibraryAdd:1];
    [v6 setModelObjects:v5];
    v7 = [(MCDLibraryAddObserver *)self referralObject];
    [v6 setReferralObject:v7];

    v8 = +[MPModelLibraryTransientStateController sharedDeviceLibraryController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A629C;
    v9[3] = &unk_100FC3DE0;
    id v10 = v4;
    [v8 performLibraryImportChangeRequest:v6 withRelatedModelObjects:0 completion:v9];
  }
  else
  {
    v5 = sub_1000A5CE4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100D696B4(v5);
    }
  }
}

- (BOOL)isCloudLibraryEnabled
{
  v2 = +[MPCloudController sharedCloudController];
  unsigned __int8 v3 = [v2 isCloudLibraryEnabled];

  return v3;
}

- (BOOL)isSongAddable
{
  unsigned __int8 v3 = [(MCDLibraryAddObserver *)self songAddStatusObserver];
  id v4 = [v3 currentStatus];

  v5 = sub_1000A5CE4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(MCDLibraryAddObserver *)self song];
    if ([(MCDLibraryAddObserver *)self isCloudLibraryEnabled]) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    int v12 = 134218754;
    if ([(MCDLibraryAddObserver *)self isSongAdded]) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    v13 = v6;
    if (v4 == (id)2) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    __int16 v14 = 2114;
    CFStringRef v15 = v7;
    __int16 v16 = 2114;
    CFStringRef v17 = v8;
    __int16 v18 = 2114;
    CFStringRef v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "isSongAddable: %p\n\tisCloudLibraryEnabled: %{public}@\n\tlibraryAdded: %{public}@\n\tlibraryAddEligible: %{public}@", (uint8_t *)&v12, 0x2Au);
  }
  unsigned int v10 = [(MCDLibraryAddObserver *)self isCloudLibraryEnabled];
  BOOL result = 0;
  if (v10)
  {
    if (v4 == (id)2) {
      return ![(MCDLibraryAddObserver *)self isSongAdded];
    }
  }
  return result;
}

- (BOOL)isSongAdded
{
  v2 = [(MCDLibraryAddObserver *)self songAddStatusObserver];
  BOOL v3 = [v2 currentStatus] == (id)1;

  return v3;
}

- (BOOL)shouldShowFavoriteSong
{
  BOOL v3 = [(MCDLibraryAddObserver *)self songAddStatusObserver];
  id v4 = (char *)[v3 currentStatus];

  v5 = [(MCDLibraryAddObserver *)self song];
  id v6 = [v5 identifiers];
  CFStringRef v7 = [v6 library];
  CFStringRef v8 = [v7 databaseID];
  v25 = self;
  if (v8)
  {
    v23 = [(MCDLibraryAddObserver *)self song];
    v24 = v4;
    CFStringRef v9 = [v23 identifiers];
    unsigned int v10 = [v9 library];
    uint64_t v11 = [v10 databaseID];
    +[MPMediaLibrary deviceMediaLibrary];
    v13 = int v12 = v5;
    __int16 v14 = [v13 uniqueIdentifier];
    unsigned int v15 = [v11 isEqualToString:v14] ^ 1;

    v5 = v12;
    id v4 = v24;
  }
  else
  {
    unsigned int v15 = 0;
  }

  __int16 v16 = sub_1000A5CE4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [(MCDLibraryAddObserver *)v25 song];
    __int16 v18 = (void *)v17;
    CFStringRef v19 = @"NO";
    if (v4 == (char *)1) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    *(_DWORD *)buf = 134218754;
    uint64_t v27 = v17;
    if (v4 == (char *)2) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    CFStringRef v29 = v20;
    __int16 v28 = 2114;
    __int16 v30 = 2114;
    if (v15) {
      CFStringRef v19 = @"YES";
    }
    CFStringRef v31 = v21;
    __int16 v32 = 2114;
    CFStringRef v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "shouldShowFavoriteSong: %p\n\tlibraryAdded: %{public}@\n\tlibraryAddEligible: %{public}@\n\tisHomeSharing: %{public}@", buf, 0x2Au);
  }
  if ((unint64_t)(v4 - 1) < 2) {
    return v15 ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)isAlbumAddable
{
  BOOL v3 = sub_1000A5CE4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(MCDLibraryAddObserver *)self album];
    if ([(MCDLibraryAddObserver *)self didReceiveAlbumResponse]) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    if ([(MCDLibraryAddObserver *)self isCloudLibraryEnabled]) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
    if ([(MCDLibraryAddObserver *)self isAlbumAdded]) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    CFStringRef v8 = [(MCDLibraryAddObserver *)self album];
    int v13 = 134219010;
    if ([v8 isLibraryAddEligible]) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    __int16 v14 = v4;
    __int16 v15 = 2114;
    CFStringRef v16 = v5;
    __int16 v17 = 2114;
    CFStringRef v18 = v6;
    __int16 v19 = 2114;
    CFStringRef v20 = v7;
    __int16 v21 = 2114;
    CFStringRef v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "isAlbumAddable: %p\n\tdidReceiveAlbumResponse: %{public}@\n\tisCloudLibraryEnabled: %{public}@\n\tlibraryAdded: %{public}@\n\tlibraryAddEligible: %{public}@", (uint8_t *)&v13, 0x34u);
  }
  if ([(MCDLibraryAddObserver *)self didReceiveAlbumResponse]
    && [(MCDLibraryAddObserver *)self isCloudLibraryEnabled])
  {
    unsigned int v10 = [(MCDLibraryAddObserver *)self album];
    if ([v10 isLibraryAddEligible]) {
      unsigned int v11 = ![(MCDLibraryAddObserver *)self isAlbumAdded];
    }
    else {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)isAlbumAdded
{
  v2 = [(MCDLibraryAddObserver *)self album];
  unsigned __int8 v3 = [v2 isLibraryAdded];

  return v3;
}

- (BOOL)isPlaylistAddable
{
  unsigned __int8 v3 = sub_1000A5CE4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(MCDLibraryAddObserver *)self playlist];
    if ([(MCDLibraryAddObserver *)self didReceivePlaylistResponse]) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    if ([(MCDLibraryAddObserver *)self isCloudLibraryEnabled]) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
    int v11 = 134218754;
    if ([(MCDLibraryAddObserver *)self isPlaylistAdded]) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    int v12 = v4;
    __int16 v13 = 2114;
    CFStringRef v14 = v5;
    __int16 v15 = 2114;
    CFStringRef v16 = v6;
    __int16 v17 = 2114;
    CFStringRef v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "isPlaylistAddable: %p\n\tdidReceivePlaylistResponse: %{public}@\n\tisCloudLibraryEnabled: %{public}@\n\tlibraryAdded: %{public}@", (uint8_t *)&v11, 0x2Au);
  }
  if ([(MCDLibraryAddObserver *)self didReceivePlaylistResponse]
    && [(MCDLibraryAddObserver *)self isCloudLibraryEnabled])
  {
    CFStringRef v8 = [(MCDLibraryAddObserver *)self playlist];
    if (v8) {
      unsigned int v9 = ![(MCDLibraryAddObserver *)self isPlaylistAdded];
    }
    else {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)isPlaylistAdded
{
  v2 = [(MCDLibraryAddObserver *)self playlist];
  unsigned __int8 v3 = [v2 isLibraryAdded];

  return v3;
}

- (void)contentManager:(id)a3 didReceiveResponse:(id)a4
{
  id v5 = a4;
  CFStringRef v6 = [v5 results];
  CFStringRef v7 = [v6 firstSection];

  id v8 = [v7 type];
  if (v8 == (id)4)
  {
    [(MCDLibraryAddObserver *)self setDidReceivePlaylistResponse:1];
    CFStringRef v14 = [v7 playlist];
    [(MCDLibraryAddObserver *)self setPlaylist:v14];

    unsigned int v10 = sub_1000A5CE4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = [(MCDLibraryAddObserver *)self playlist];
      int v12 = [v11 debugDescription];
      int v15 = 138543362;
      CFStringRef v16 = v12;
      __int16 v13 = "LibraryAddObserver: Playlist updated %{public}@";
      goto LABEL_7;
    }
  }
  else if (v8 == (id)2)
  {
    [(MCDLibraryAddObserver *)self setDidReceiveAlbumResponse:1];
    unsigned int v9 = [v7 album];
    [(MCDLibraryAddObserver *)self setAlbum:v9];

    unsigned int v10 = sub_1000A5CE4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = [(MCDLibraryAddObserver *)self album];
      int v12 = [v11 debugDescription];
      int v15 = 138543362;
      CFStringRef v16 = v12;
      __int16 v13 = "LibraryAddObserver: Album updated %{public}@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    unsigned int v10 = sub_1000A5CE4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100D696F8((uint64_t)v5, v10);
    }
  }
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (MPLibraryAddStatusObserver)songAddStatusObserver
{
  return self->_songAddStatusObserver;
}

- (void)setSongAddStatusObserver:(id)a3
{
}

- (MCDStorePlaybackItemsManager)albumsContentManager
{
  return self->_albumsContentManager;
}

- (void)setAlbumsContentManager:(id)a3
{
}

- (MCDStorePlaybackItemsManager)playlistContentManager
{
  return self->_playlistContentManager;
}

- (void)setPlaylistContentManager:(id)a3
{
}

- (BOOL)didReceiveAlbumResponse
{
  return self->_didReceiveAlbumResponse;
}

- (void)setDidReceiveAlbumResponse:(BOOL)a3
{
  self->_didReceiveAlbumResponse = a3;
}

- (BOOL)didReceivePlaylistResponse
{
  return self->_didReceivePlaylistResponse;
}

- (void)setDidReceivePlaylistResponse:(BOOL)a3
{
  self->_didReceivePlaylistResponse = a3;
}

- (MPModelSong)song
{
  return self->_song;
}

- (MPModelAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (void)setReferralObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referralObject, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_playlistContentManager, 0);
  objc_storeStrong((id *)&self->_albumsContentManager, 0);
  objc_storeStrong((id *)&self->_songAddStatusObserver, 0);

  objc_storeStrong(&self->_updateBlock, 0);
}

@end