@interface ML3ProtoSyncExportSession
- (ML3ProtoSyncExportSession)initWithLibrary:(id)a3 outputStream:(id)a4 syncType:(int)a5;
- (id)_writSyncPackageToStream:(id)a3;
- (id)begin:(unsigned int)a3;
- (id)end;
- (id)exportAlbumArtistAdded:(unint64_t)a3;
- (id)exportAlbumArtistDeleted:(unint64_t)a3;
- (id)exportAlbumArtistUpdated:(unint64_t)a3;
- (id)exportAlbumUpdated:(unint64_t)a3;
- (id)exportPlaylistAdded:(unint64_t)a3;
- (id)exportPlaylistDeleted:(unint64_t)a3;
- (id)exportPlaylistUpdated:(unint64_t)a3;
- (id)exportTrackAdded:(unint64_t)a3;
- (id)exportTrackDeleted:(unint64_t)a3;
- (id)exportTrackUpdated:(unint64_t)a3;
@end

@implementation ML3ProtoSyncExportSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamWriter, 0);

  objc_storeStrong((id *)&self->_libraryUUID, 0);
}

- (id)_writSyncPackageToStream:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [a3 data];
  [v4 length];
  v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v19 length:PBDataWriterWriteBareVarint() freeWhenDone:0];
  streamWriter = self->_streamWriter;
  id v16 = 0;
  char v7 = [(MSVStreamWriter *)streamWriter writeAllData:v5 error:&v16];
  id v8 = v16;
  if (v7)
  {
    v9 = self->_streamWriter;
    id v15 = v8;
    char v10 = [(MSVStreamWriter *)v9 writeAllData:v4 error:&v15];
    id v11 = v15;

    if (v10) {
      goto LABEL_9;
    }
    v12 = os_log_create("com.apple.amp.medialibrary", "SyncData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v11;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "failed to write package data. err=%{public}@", buf, 0xCu);
    }
    id v8 = v11;
  }
  else
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "SyncData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "failed to write package len. err=%{public}@", buf, 0xCu);
    }
  }

  id v11 = v8;
LABEL_9:
  int v13 = [v5 length];
  self->_stats.totalSize += [v4 length] + v13;

  return v11;
}

- (id)exportAlbumUpdated:(unint64_t)a3
{
  ++self->_stats.albumUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:2];
  char v7 = [ML3Album alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3Album *)v9 protocolItem];
  [(MSPMediaSyncOperation *)v6 setAlbum:v10];

  id v11 = [(ML3Album *)v9 multiverseIdentifier];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v11];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  v12 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v12;
}

- (id)exportAlbumArtistUpdated:(unint64_t)a3
{
  ++self->_stats.artistUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:2];
  char v7 = [ML3AlbumArtist alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3AlbumArtist *)v9 protocolItem];
  [(MSPMediaSyncOperation *)v6 setArtist:v10];

  id v11 = [(ML3AlbumArtist *)v9 multiverseIdentifier];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v11];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  v12 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v12;
}

- (id)exportAlbumArtistDeleted:(unint64_t)a3
{
  ++self->_stats.artistUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:3];
  char v7 = [ML3AlbumArtist alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3AlbumArtist *)v9 protocolItem];
  [(MSPMediaSyncOperation *)v6 setArtist:v10];

  id v11 = [(ML3AlbumArtist *)v9 multiverseIdentifier];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v11];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  v12 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v12;
}

- (id)exportAlbumArtistAdded:(unint64_t)a3
{
  ++self->_stats.artistAdds;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:1];
  char v7 = [ML3AlbumArtist alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3AlbumArtist *)v9 protocolItem];
  [(MSPMediaSyncOperation *)v6 setArtist:v10];

  id v11 = [(ML3AlbumArtist *)v9 multiverseIdentifier];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v11];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  v12 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v12;
}

- (id)exportPlaylistUpdated:(unint64_t)a3
{
  ++self->_stats.playlistUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:2];
  char v7 = [ML3Container alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3Container *)v9 protocolItemForDynamicUpdate];
  [(MSPMediaSyncOperation *)v6 setPlaylist:v10];

  id v11 = [(ML3Container *)v9 multiverseIdentifier];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v11];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  v12 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v12;
}

- (id)exportPlaylistDeleted:(unint64_t)a3
{
  ++self->_stats.playlistDeletes;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:3];
  char v7 = [ML3Container alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3Container *)v9 multiverseIdentifier];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v10];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  id v11 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v11;
}

- (id)exportPlaylistAdded:(unint64_t)a3
{
  ++self->_stats.playlistAdds;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:1];
  char v7 = [ML3Container alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3Container *)v9 protocolItem];
  [(MSPMediaSyncOperation *)v6 setPlaylist:v10];

  id v11 = [(ML3Container *)v9 multiverseIdentifier];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v11];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  v12 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v12;
}

- (id)exportTrackDeleted:(unint64_t)a3
{
  ++self->_stats.trackDeletes;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:3];
  char v7 = [ML3Track alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3Track *)v9 multiverseIdentifierLibraryOnly:1];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v10];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  id v11 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v11;
}

- (id)exportTrackUpdated:(unint64_t)a3
{
  ++self->_stats.trackUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:2];
  char v7 = [ML3Track alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3Track *)v9 protocolItemForDynamicUpdate];
  [(MSPMediaSyncOperation *)v6 setMediaItem:v10];

  id v11 = [(ML3Track *)v9 multiverseIdentifierLibraryOnly:1];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v11];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  v12 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v12;
}

- (id)exportTrackAdded:(unint64_t)a3
{
  ++self->_stats.trackAdds;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v5 setType:4];
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  [(MSPMediaSyncOperation *)v6 setOperationType:1];
  char v7 = [ML3Track alloc];
  id v8 = [(ML3ExportSession *)self library];
  v9 = [(ML3Entity *)v7 initWithPersistentID:a3 inLibrary:v8];

  char v10 = [(ML3Track *)v9 protocolItem];
  [(MSPMediaSyncOperation *)v6 setMediaItem:v10];

  id v11 = [(ML3Track *)v9 multiverseIdentifierLibraryOnly:1];
  [(MSPMediaSyncOperation *)v6 setMultiverseId:v11];

  [(MSPMediaSyncPackage *)v5 setSyncOperation:v6];
  v12 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v5];

  return v12;
}

- (id)end
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v3 setType:1];
  [(MSPMediaSyncPackage *)v3 setLastPackage:1];
  v4 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v3];
  [(MSVStreamWriter *)self->_streamWriter stop];
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int trackAdds = self->_stats.trackAdds;
    int trackUpdates = self->_stats.trackUpdates;
    int trackDeletes = self->_stats.trackDeletes;
    int playlistAdds = self->_stats.playlistAdds;
    int playlistDeletes = self->_stats.playlistDeletes;
    int playlistUpdates = self->_stats.playlistUpdates;
    int artistAdds = self->_stats.artistAdds;
    unsigned int totalSize = self->_stats.totalSize;
    int artistUpdates = self->_stats.artistUpdates;
    int albumUpdates = self->_stats.albumUpdates;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v13 = v12 - self->_sessionStartTime;
    *(_DWORD *)buf = 67111680;
    unsigned int v20 = totalSize;
    __int16 v21 = 1024;
    int v22 = trackAdds;
    __int16 v23 = 1024;
    int v24 = trackDeletes;
    __int16 v25 = 1024;
    int v26 = trackUpdates;
    __int16 v27 = 1024;
    int v28 = playlistAdds;
    __int16 v29 = 1024;
    int v30 = playlistDeletes;
    __int16 v31 = 1024;
    int v32 = playlistUpdates;
    __int16 v33 = 1024;
    int v34 = artistAdds;
    __int16 v35 = 1024;
    int v36 = artistUpdates;
    __int16 v37 = 1024;
    int v38 = albumUpdates;
    __int16 v39 = 2048;
    double v40 = v13;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "finished export session: %d bytes, %d add_tracks, %d delete_tracks, %d update_tracks, %d add_playlists, %d delete_playlists, %d update_playlists, %d add_artists, %d update_artists, %d update_albums in %.2f seconds", buf, 0x48u);
  }

  return v4;
}

- (id)begin:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v3;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "starting proto export session. numOperations=%d", (uint8_t *)v15, 8u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_sessionStartTime = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F77A10]);
  id v8 = [(ML3ExportSession *)self outputStream];
  v9 = (MSVStreamWriter *)[v7 initWithOutputStream:v8 queue:0];
  streamWriter = self->_streamWriter;
  self->_streamWriter = v9;

  [(MSVStreamWriter *)self->_streamWriter start];
  id v11 = objc_alloc_init(MSPMediaSyncPackage);
  [(MSPMediaSyncPackage *)v11 setType:2];
  [(MSPMediaSyncPackage *)v11 setLastPackage:0];
  double v12 = objc_alloc_init(MSPMediaSyncHeader);
  [(MSPMediaSyncHeader *)v12 setTotalPackages:v3];
  [(MSPMediaSyncHeader *)v12 setSyncType:self->_syncType];
  [(MSPMediaSyncPackage *)v11 setHeader:v12];
  double v13 = [(ML3ProtoSyncExportSession *)self _writSyncPackageToStream:v11];

  return v13;
}

- (ML3ProtoSyncExportSession)initWithLibrary:(id)a3 outputStream:(id)a4 syncType:(int)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3ProtoSyncExportSession;
  v9 = [(ML3ExportSession *)&v13 initWithLibrary:v8 outputStream:a4];
  if (v9)
  {
    uint64_t v10 = [v8 libraryUID];
    libraryUUID = v9->_libraryUUID;
    v9->_libraryUUID = (NSString *)v10;

    v9->_syncType = a5;
  }

  return v9;
}

@end