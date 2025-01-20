@interface SBCPlaybackPositionEntity
+ (BOOL)supportsSecureCoding;
+ (id)ubiquitousIdentifierWithItemTitle:(id)a3 albumName:(id)a4 itemArtistName:(id)a5;
+ (id)ubiquitousIdentifierWithPodcastFeedURL:(id)a3 feedGUID:(id)a4;
+ (id)ubiquitousIdentifierWithUniqueStoreID:(int64_t)a3;
+ (id)ubiquitousIdentifierWithiTunesUFeedURL:(id)a3 feedGUID:(id)a4;
- (BOOL)bookmarkTimeModified;
- (BOOL)bookmarkTimestampModified;
- (BOOL)hasBeenPlayed;
- (BOOL)hasBeenPlayedModified;
- (BOOL)userPlayCountModified;
- (NSString)ubiquitousIdentifier;
- (SBCPlaybackPositionDomain)playbackPositionDomain;
- (SBCPlaybackPositionEntity)initWithCoder:(id)a3;
- (SBCPlaybackPositionEntity)initWithPlaybackPositionDomain:(id)a3 ubiquitousIdentifier:(id)a4 foreignDatabaseEntityID:(int64_t)a5;
- (double)bookmarkTime;
- (double)bookmarkTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)iTunesCloudEntity;
- (int64_t)foreignDatabaseEntityID;
- (unint64_t)userPlayCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmarkTime:(double)a3;
- (void)setBookmarkTimestamp:(double)a3;
- (void)setHasBeenPlayed:(BOOL)a3;
- (void)setUserPlayCount:(unint64_t)a3;
@end

@implementation SBCPlaybackPositionEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquitousIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackPositionDomain, 0);
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (unint64_t)userPlayCount
{
  return self->_userPlayCount;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (double)bookmarkTimestamp
{
  return self->_bookmarkTimestamp;
}

- (int64_t)foreignDatabaseEntityID
{
  return self->_foreignDatabaseEntityID;
}

- (NSString)ubiquitousIdentifier
{
  return self->_ubiquitousIdentifier;
}

- (SBCPlaybackPositionDomain)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (BOOL)bookmarkTimestampModified
{
  return (propertyMonitor_0 >> 1) & 1;
}

- (BOOL)bookmarkTimeModified
{
  return propertyMonitor_0 & 1;
}

- (BOOL)userPlayCountModified
{
  return (propertyMonitor_0 >> 2) & 1;
}

- (BOOL)hasBeenPlayedModified
{
  return (propertyMonitor_0 >> 3) & 1;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
  propertyMonitor_0 |= 8u;
}

- (void)setUserPlayCount:(unint64_t)a3
{
  self->_userPlayCount = a3;
  propertyMonitor_0 |= 4u;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
  propertyMonitor_0 |= 1u;
}

- (void)setBookmarkTimestamp:(double)a3
{
  self->_bookmarkTimestamp = a3;
  propertyMonitor_0 |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPlaybackPositionDomain:self->_playbackPositionDomain ubiquitousIdentifier:self->_ubiquitousIdentifier foreignDatabaseEntityID:self->_foreignDatabaseEntityID];
  v5 = v4;
  if (v4)
  {
    [v4 setBookmarkTimestamp:self->_bookmarkTimestamp];
    [v5 setBookmarkTime:self->_bookmarkTime];
    [v5 setUserPlayCount:self->_userPlayCount];
    [v5 setHasBeenPlayed:self->_hasBeenPlayed];
  }
  v6 = self;

  return v6;
}

- (SBCPlaybackPositionEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"SBCPlaybackPositionDomain"];
  v6 = [v4 decodeObjectForKey:@"SBCUbiquitousIdentifier"];
  v7 = -[SBCPlaybackPositionEntity initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:](self, "initWithPlaybackPositionDomain:ubiquitousIdentifier:foreignDatabaseEntityID:", v5, v6, [v4 decodeInt64ForKey:@"SBCForeignDatabaseEntityID"]);
  if (v7)
  {
    [v4 decodeDoubleForKey:@"SBCBookmarkTimestamp"];
    v7->_bookmarkTimestamp = v8;
    [v4 decodeDoubleForKey:@"SBCBookmarkTime"];
    v7->_bookmarkTime = v9;
    v7->_userPlayCount = [v4 decodeIntegerForKey:@"SBCUserPlayCount"];
    v7->_hasBeenPlayed = [v4 decodeBoolForKey:@"SBCHasBeenPlayed"];
    char v10 = [v4 decodeBoolForKey:@"SBCBookmarkTimeModified"];
    propertyMonitor_0 = propertyMonitor_0 & 0xFE | v10;
    if ([v4 decodeBoolForKey:@"SBCHasBeenPlayedModified"]) {
      char v11 = 8;
    }
    else {
      char v11 = 0;
    }
    propertyMonitor_0 = propertyMonitor_0 & 0xF7 | v11;
    if ([v4 decodeBoolForKey:@"SBCUserPlayCountModified"]) {
      char v12 = 4;
    }
    else {
      char v12 = 0;
    }
    propertyMonitor_0 = propertyMonitor_0 & 0xFB | v12;
    if ([v4 decodeBoolForKey:@"SBCBookmarkTimestampModified"]) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    propertyMonitor_0 = propertyMonitor_0 & 0xFD | v13;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  playbackPositionDomain = self->_playbackPositionDomain;
  id v5 = a3;
  [v5 encodeObject:playbackPositionDomain forKey:@"SBCPlaybackPositionDomain"];
  [v5 encodeObject:self->_ubiquitousIdentifier forKey:@"SBCUbiquitousIdentifier"];
  [v5 encodeInt64:self->_foreignDatabaseEntityID forKey:@"SBCForeignDatabaseEntityID"];
  [v5 encodeDouble:@"SBCBookmarkTimestamp" forKey:self->_bookmarkTimestamp];
  [v5 encodeDouble:@"SBCBookmarkTime" forKey:self->_bookmarkTime];
  [v5 encodeInteger:self->_userPlayCount forKey:@"SBCUserPlayCount"];
  [v5 encodeBool:self->_hasBeenPlayed forKey:@"SBCHasBeenPlayed"];
  [v5 encodeBool:propertyMonitor_0 & 1 forKey:@"SBCBookmarkTimeModified"];
  [v5 encodeBool:(propertyMonitor_0 >> 3) & 1 forKey:@"SBCHasBeenPlayedModified"];
  [v5 encodeBool:(propertyMonitor_0 >> 2) & 1 forKey:@"SBCUserPlayCountModified"];
  [v5 encodeBool:(propertyMonitor_0 >> 1) & 1 forKey:@"SBCBookmarkTimestampModified"];
}

- (id)iTunesCloudEntity
{
  uint64_t v3 = [(SBCPlaybackPositionDomain *)self->_playbackPositionDomain domainIdentifier];
  id v4 = (void *)v3;
  id v5 = (void *)*MEMORY[0x263F88F68];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  v7 = (void *)[objc_alloc(MEMORY[0x263F89268]) initWithDomain:v6];
  [v7 setPlaybackPositionKey:self->_ubiquitousIdentifier];
  double v8 = [(SBCPlaybackPositionDomain *)self->_playbackPositionDomain foreignDatabasePath];
  double v9 = SBCPathWithScrubbedMount(v8);

  char v10 = [MEMORY[0x263F57448] allLibraries];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __46__SBCPlaybackPositionEntity_iTunesCloudEntity__block_invoke;
  v24 = &unk_264CAD3A8;
  id v11 = v9;
  id v25 = v11;
  id v12 = v7;
  id v26 = v12;
  [v10 enumerateObjectsUsingBlock:&v21];

  if (self->_foreignDatabaseEntityID)
  {
    char v13 = objc_msgSend(NSNumber, "numberWithLongLong:", v21, v22, v23, v24, v25);
    [v12 setItemPersistentIdentifier:v13];
  }
  if ([(SBCPlaybackPositionEntity *)self bookmarkTimestampModified])
  {
    v14 = [NSNumber numberWithDouble:self->_bookmarkTimestamp];
    [v12 setBookmarkTimestamp:v14];
  }
  if ([(SBCPlaybackPositionEntity *)self bookmarkTimeModified])
  {
    v15 = [NSNumber numberWithDouble:self->_bookmarkTime];
    [v12 setBookmarkTime:v15];
  }
  if ([(SBCPlaybackPositionEntity *)self userPlayCountModified])
  {
    v16 = [NSNumber numberWithUnsignedInteger:self->_userPlayCount];
    [v12 setUserPlayCount:v16];
  }
  if ([(SBCPlaybackPositionEntity *)self hasBeenPlayedModified])
  {
    v17 = [NSNumber numberWithBool:self->_hasBeenPlayed];
    [v12 setHasBeenPlayed:v17];
  }
  v18 = v26;
  id v19 = v12;

  return v19;
}

void __46__SBCPlaybackPositionEntity_iTunesCloudEntity__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 databasePath];
  v7 = SBCPathWithScrubbedMount(v6);
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    double v9 = [v10 libraryUID];
    [*(id *)(a1 + 40) setLibraryIdentifier:v9];

    *a4 = 1;
  }
}

- (SBCPlaybackPositionEntity)initWithPlaybackPositionDomain:(id)a3 ubiquitousIdentifier:(id)a4 foreignDatabaseEntityID:(int64_t)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBCPlaybackPositionEntity;
  double v9 = [(SBCPlaybackPositionEntity *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ubiquitousIdentifier, a4);
    v10->_foreignDatabaseEntityID = a5;
    propertyMonitor_0 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ubiquitousIdentifierWithiTunesUFeedURL:(id)a3 feedGUID:(id)a4
{
  return (id)[MEMORY[0x263F89268] keyValueStoreItemIdentifierForUniqueStoreID:0 itemTitle:0 albumName:0 itemArtistName:0 feedURL:a3 feedGUID:a4];
}

+ (id)ubiquitousIdentifierWithPodcastFeedURL:(id)a3 feedGUID:(id)a4
{
  return (id)[MEMORY[0x263F89268] keyValueStoreItemIdentifierForUniqueStoreID:0 itemTitle:0 albumName:0 itemArtistName:0 feedURL:a3 feedGUID:a4];
}

+ (id)ubiquitousIdentifierWithItemTitle:(id)a3 albumName:(id)a4 itemArtistName:(id)a5
{
  return (id)[MEMORY[0x263F89268] keyValueStoreItemIdentifierForUniqueStoreID:0 itemTitle:a3 albumName:a4 itemArtistName:a5 feedURL:0 feedGUID:0];
}

+ (id)ubiquitousIdentifierWithUniqueStoreID:(int64_t)a3
{
  return (id)[MEMORY[0x263F89268] keyValueStoreItemIdentifierForUniqueStoreID:a3 itemTitle:0 albumName:0 itemArtistName:0 feedURL:0 feedGUID:0];
}

@end