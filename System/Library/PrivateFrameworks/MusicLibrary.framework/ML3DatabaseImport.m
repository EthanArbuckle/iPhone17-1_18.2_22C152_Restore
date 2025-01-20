@interface ML3DatabaseImport
+ (BOOL)supportsSecureCoding;
- (BOOL)clientInitiatedReset;
- (BOOL)isPendingMatch;
- (BOOL)isResetSync;
- (BOOL)isSagaEnabled;
- (BOOL)isServerImport;
- (BOOL)isSuspendable;
- (BOOL)pairedDeviceCanProcessStandaloneCollections;
- (BOOL)playlistsAreLibraryOwnedContent;
- (BOOL)tracksAreLibraryOwnedContent;
- (ML3DatabaseImport)init;
- (ML3DatabaseImport)initWithCoder:(id)a3;
- (ML3DatabaseImport)initWithLibraryPath:(id)a3 trackData:(id)a4 playlistData:(id)a5;
- (ML3DatabaseImport)initWithLibraryPath:(id)a3 trackData:(id)a4 playlistData:(id)a5 albumArtistData:(id)a6 albumData:(id)a7 clientIdentity:(id)a8;
- (ML3DatabaseImport)initWithLibraryPath:(id)a3 trackData:(id)a4 playlistData:(id)a5 clientIdentity:(id)a6;
- (NSData)albumArtistData;
- (NSData)albumData;
- (NSData)playlistData;
- (NSData)trackData;
- (NSFileHandle)fileHandle;
- (NSString)libraryPath;
- (NSString)syncAnchor;
- (NSString)syncLibraryID;
- (OS_tcc_identity)clientIdentity;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)preferredVideoQuality;
- (int64_t)storeAccountID;
- (unsigned)homeSharingBasePlaylistID;
- (void)encodeWithCoder:(id)a3;
- (void)setClientInitiatedReset:(BOOL)a3;
@end

@implementation ML3DatabaseImport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_syncLibraryID, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_albumData, 0);
  objc_storeStrong((id *)&self->_albumArtistData, 0);
  objc_storeStrong((id *)&self->_playlistData, 0);
  objc_storeStrong((id *)&self->_trackData, 0);

  objc_storeStrong((id *)&self->_libraryPath, 0);
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (BOOL)isSuspendable
{
  return self->_suspendable;
}

- (NSString)syncLibraryID
{
  return self->_syncLibraryID;
}

- (BOOL)pairedDeviceCanProcessStandaloneCollections
{
  return self->_pairedDeviceCanProcessStandaloneCollections;
}

- (BOOL)isServerImport
{
  return self->_isServerImport;
}

- (BOOL)isPendingMatch
{
  return self->_pendingMatch;
}

- (BOOL)playlistsAreLibraryOwnedContent
{
  return self->_playlistsAreLibraryOwnedContent;
}

- (BOOL)tracksAreLibraryOwnedContent
{
  return self->_tracksAreLibraryOwnedContent;
}

- (void)setClientInitiatedReset:(BOOL)a3
{
  self->_clientInitiatedReset = a3;
}

- (BOOL)clientInitiatedReset
{
  return self->_clientInitiatedReset;
}

- (unsigned)homeSharingBasePlaylistID
{
  return self->_homeSharingBasePlaylistID;
}

- (int64_t)preferredVideoQuality
{
  return self->_preferredVideoQuality;
}

- (int64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (BOOL)isSagaEnabled
{
  return self->_sagaEnabled;
}

- (BOOL)isResetSync
{
  return self->_resetSync;
}

- (NSString)syncAnchor
{
  return self->_syncAnchor;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (NSData)albumData
{
  return self->_albumData;
}

- (NSData)albumArtistData
{
  return self->_albumArtistData;
}

- (NSData)playlistData
{
  return self->_playlistData;
}

- (NSData)trackData
{
  return self->_trackData;
}

- (NSString)libraryPath
{
  return self->_libraryPath;
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  v5 = [[(objc_class *)a4 allocWithZone:a3] initWithLibraryPath:self->_libraryPath trackData:self->_trackData playlistData:self->_playlistData albumArtistData:self->_albumArtistData albumData:self->_albumData clientIdentity:self->_clientIdentity];
  objc_storeStrong((id *)v5 + 6, self->_fileHandle);
  uint64_t v6 = [(NSString *)self->_syncAnchor copy];
  v7 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v6;

  *((unsigned char *)v5 + 64) = self->_resetSync;
  *((unsigned char *)v5 + 65) = self->_sagaEnabled;
  *((void *)v5 + 9) = self->_storeAccountID;
  *((void *)v5 + 10) = self->_preferredVideoQuality;
  *((_DWORD *)v5 + 22) = self->_homeSharingBasePlaylistID;
  *((unsigned char *)v5 + 92) = self->_tracksAreLibraryOwnedContent;
  *((unsigned char *)v5 + 93) = self->_playlistsAreLibraryOwnedContent;
  *((unsigned char *)v5 + 94) = self->_pendingMatch;
  *((unsigned char *)v5 + 95) = self->_isServerImport;
  objc_storeStrong((id *)v5 + 13, self->_syncLibraryID);
  *((unsigned char *)v5 + 112) = self->_suspendable;
  *((unsigned char *)v5 + 96) = self->_pairedDeviceCanProcessStandaloneCollections;
  *((unsigned char *)v5 + 113) = self->_clientInitiatedReset;
  return v5;
}

- (ML3DatabaseImport)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = NSStringFromSelector(a2);
    [v20 handleFailureInMethod:a2, self, @"ML3DatabaseImport.m", 149, @"%@: coder must support keyed coding", v21 object file lineNumber description];
  }
  uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"libraryPath"];
  v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"trackData"];
  v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"playlistData"];
  v9 = [v5 decodeTCCIdentityForKey:@"clientIdentity"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"albumArtistData"];
  v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"albumData"];
  v12 = [(ML3DatabaseImport *)self initWithLibraryPath:v6 trackData:v7 playlistData:v8 albumArtistData:v10 albumData:v11 clientIdentity:v9];
  if (v12)
  {
    uint64_t v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"fileHandle"];
    fileHandle = v12->_fileHandle;
    v12->_fileHandle = (NSFileHandle *)v13;

    uint64_t v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"syncAnchor"];
    syncAnchor = v12->_syncAnchor;
    v12->_syncAnchor = (NSString *)v15;

    v12->_resetSync = [v5 decodeBoolForKey:@"resetSync"];
    v12->_sagaEnabled = [v5 decodeBoolForKey:@"sagaEnabled"];
    v12->_storeAccountID = [v5 decodeInt64ForKey:@"storeAccountID"];
    v12->_preferredVideoQuality = [v5 decodeInt64ForKey:@"preferredVideoQuality"];
    v12->_homeSharingBasePlaylistID = [v5 decodeInt32ForKey:@"homeSharingBasePlaylistID"];
    v12->_tracksAreLibraryOwnedContent = [v5 decodeBoolForKey:@"tracksAreLibraryOwnedContent"];
    v12->_playlistsAreLibraryOwnedContent = [v5 decodeBoolForKey:@"playlistsAreLibraryOwnedContent"];
    v12->_pendingMatch = [v5 decodeBoolForKey:@"pendingMatch"];
    v12->_isServerImport = [v5 decodeBoolForKey:@"isServerImport"];
    uint64_t v17 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"syncLibraryUUID"];
    syncLibraryID = v12->_syncLibraryID;
    v12->_syncLibraryID = (NSString *)v17;

    v12->_suspendable = [v5 decodeBoolForKey:@"suspendable"];
    v12->_pairedDeviceCanProcessStandaloneCollections = [v5 decodeBoolForKey:@"pairedDeviceCanProcessStandaloneCollections"];
    v12->_clientInitiatedReset = [v5 decodeBoolForKey:@"clientInitiatedResetSync"];
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  if (([v7 allowsKeyedCoding] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"ML3DatabaseImport.m", 122, @"%@: coder must support keyed coding", v6 object file lineNumber description];
  }
  [v7 encodeObject:self->_libraryPath forKey:@"libraryPath"];
  [v7 encodeObject:self->_trackData forKey:@"trackData"];
  [v7 encodeObject:self->_playlistData forKey:@"playlistData"];
  [v7 encodeObject:self->_albumArtistData forKey:@"albumArtistData"];
  [v7 encodeObject:self->_albumData forKey:@"albumData"];
  [v7 encodeObject:self->_fileHandle forKey:@"fileHandle"];
  [v7 encodeObject:self->_syncAnchor forKey:@"syncAnchor"];
  [v7 encodeBool:self->_resetSync forKey:@"resetSync"];
  [v7 encodeBool:self->_sagaEnabled forKey:@"sagaEnabled"];
  [v7 encodeInt64:self->_storeAccountID forKey:@"storeAccountID"];
  [v7 encodeInt64:self->_preferredVideoQuality forKey:@"preferredVideoQuality"];
  [v7 encodeInt32:self->_homeSharingBasePlaylistID forKey:@"homeSharingBasePlaylistID"];
  [v7 encodeBool:self->_tracksAreLibraryOwnedContent forKey:@"tracksAreLibraryOwnedContent"];
  [v7 encodeBool:self->_playlistsAreLibraryOwnedContent forKey:@"playlistsAreLibraryOwnedContent"];
  [v7 encodeBool:self->_pendingMatch forKey:@"pendingMatch"];
  [v7 encodeBool:self->_isServerImport forKey:@"isServerImport"];
  [v7 encodeObject:self->_syncLibraryID forKey:@"syncLibraryUUID"];
  [v7 encodeBool:self->_suspendable forKey:@"suspendable"];
  [v7 encodeBool:self->_pairedDeviceCanProcessStandaloneCollections forKey:@"pairedDeviceCanProcessStandaloneCollections"];
  [v7 encodeBool:self->_clientInitiatedReset forKey:@"clientInitiatedResetSync"];
  [v7 encodeTCCIdentity:self->_clientIdentity forKey:@"clientIdentity"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ML3DatabaseImport *)self _copyWithZone:a3 usingConcreteClass:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ML3DatabaseImport *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = @"YES";
  if (self->_tracksAreLibraryOwnedContent) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if (self->_playlistsAreLibraryOwnedContent) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if (self->_pendingMatch) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (self->_clientInitiatedReset) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if (!self->_pairedDeviceCanProcessStandaloneCollections) {
    uint64_t v5 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@ %p libraryOwnedTracks=%@ libraryOwnedPlaylists=%@ pendingMatch=%@ _clientInitiatedReset=%@ pairedDeviceCanProcessStandaloneCollections=%@ libraryPath=\"%@\">", v4, self, v6, v7, v8, v9, v5, self->_libraryPath];
}

- (ML3DatabaseImport)init
{
  return [(ML3DatabaseImport *)self initWithLibraryPath:0 trackData:0 playlistData:0];
}

- (ML3DatabaseImport)initWithLibraryPath:(id)a3 trackData:(id)a4 playlistData:(id)a5 albumArtistData:(id)a6 albumData:(id)a7 clientIdentity:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)ML3DatabaseImport;
  v20 = [(ML3DatabaseImport *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    libraryPath = v20->_libraryPath;
    v20->_libraryPath = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    trackData = v20->_trackData;
    v20->_trackData = (NSData *)v23;

    uint64_t v25 = [v16 copy];
    playlistData = v20->_playlistData;
    v20->_playlistData = (NSData *)v25;

    uint64_t v27 = [v17 copy];
    albumArtistData = v20->_albumArtistData;
    v20->_albumArtistData = (NSData *)v27;

    uint64_t v29 = [v18 copy];
    albumData = v20->_albumData;
    v20->_albumData = (NSData *)v29;

    *(_DWORD *)&v20->_tracksAreLibraryOwnedContent = 257;
    v20->_pairedDeviceCanProcessStandaloneCollections = 0;
    v20->_suspendable = 1;
    objc_storeStrong((id *)&v20->_clientIdentity, a8);
    v20->_clientInitiatedReset = 0;
    v20->_resetSync = 0;
  }

  return v20;
}

- (ML3DatabaseImport)initWithLibraryPath:(id)a3 trackData:(id)a4 playlistData:(id)a5 clientIdentity:(id)a6
{
  return [(ML3DatabaseImport *)self initWithLibraryPath:a3 trackData:a4 playlistData:a5 albumArtistData:0 albumData:0 clientIdentity:a6];
}

- (ML3DatabaseImport)initWithLibraryPath:(id)a3 trackData:(id)a4 playlistData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = MSVTCCIdentityForCurrentProcess();
  v12 = [(ML3DatabaseImport *)self initWithLibraryPath:v10 trackData:v9 playlistData:v8 clientIdentity:v11];

  return v12;
}

@end