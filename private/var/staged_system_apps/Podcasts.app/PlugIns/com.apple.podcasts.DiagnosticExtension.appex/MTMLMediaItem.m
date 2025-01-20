@interface MTMLMediaItem
+ (BOOL)isMediaItemSyncedFromiTunes:(id)a3;
+ (BOOL)isMissingAssetForItem:(id)a3;
+ (BOOL)isMissingFilePathForItem:(id)a3;
+ (id)itemWithMPMediaItem:(id)a3;
+ (id)itemWithMPMediaItem:(id)a3 isRestoreDownloadCandidate:(BOOL)a4;
+ (id)propertiesForMediaItem;
- (BOOL)hasBeenPlayed;
- (BOOL)isExplicit;
- (BOOL)isFromITunesSync;
- (BOOL)isItunesU;
- (BOOL)isMissingAsset;
- (NSDate)lastPlayedDate;
- (NSDate)pubDate;
- (NSNumber)byteSize;
- (NSNumber)downloadIdentifier;
- (NSNumber)duration;
- (NSNumber)persistentId;
- (NSNumber)playCount;
- (NSNumber)playhead;
- (NSNumber)podcastPersistentId;
- (NSNumber)storeCollectionId;
- (NSNumber)storeTrackId;
- (NSString)artist;
- (NSString)assetUrl;
- (NSString)category;
- (NSString)feedUrl;
- (NSString)guid;
- (NSString)podcastTitle;
- (NSString)title;
- (NSString)uti;
- (id)description;
- (void)setArtist:(id)a3;
- (void)setAssetUrl:(id)a3;
- (void)setByteSize:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDownloadIdentifier:(id)a3;
- (void)setDuration:(id)a3;
- (void)setFeedUrl:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasBeenPlayed:(BOOL)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setIsFromITunesSync:(BOOL)a3;
- (void)setIsItunesU:(BOOL)a3;
- (void)setIsMissingAsset:(BOOL)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setPersistentId:(id)a3;
- (void)setPlayCount:(id)a3;
- (void)setPlayhead:(id)a3;
- (void)setPodcastPersistentId:(id)a3;
- (void)setPodcastTitle:(id)a3;
- (void)setPubDate:(id)a3;
- (void)setStoreCollectionId:(id)a3;
- (void)setStoreTrackId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUti:(id)a3;
@end

@implementation MTMLMediaItem

+ (id)itemWithMPMediaItem:(id)a3
{
  return [a1 itemWithMPMediaItem:a3 isRestoreDownloadCandidate:0];
}

+ (id)itemWithMPMediaItem:(id)a3 isRestoreDownloadCandidate:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = objc_opt_new();
    v8 = [a1 propertiesForMediaItem];
    v9 = +[NSSet setWithArray:v8];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000403C;
    v16[3] = &unk_1000083A8;
    id v10 = v7;
    id v17 = v10;
    [v6 enumerateValuesForProperties:v9 usingBlock:v16];

    [v10 setIsFromITunesSync:[a1 isMediaItemSyncedFromiTunes:v6]];
    BOOL v11 = +[MTMLMediaItem isMissingFilePathForItem:v6]
       || +[MTMLMediaItem isMissingAssetForItem:v6];
    [v10 setIsMissingAsset:v11];
    if ([v10 isMissingAsset] && !a4)
    {
      [v10 setAssetUrl:0];
      v12 = +[MTMediaLibraryTransactionManager sharedInstance];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100004420;
      v14[3] = &unk_1000083D0;
      id v15 = v6;
      [v12 requestMediaLibraryWriteTransaction:v14];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (BOOL)isMissingFilePathForItem:(id)a3
{
  v3 = [a3 valueForProperty:MPMediaItemPropertyFilePath];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

+ (BOOL)isMissingAssetForItem:(id)a3
{
  v3 = [a3 valueForProperty:MPMediaItemPropertyFilePath];
  if ([v3 length])
  {
    BOOL v4 = +[NSFileManager defaultManager];
    unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

    char v6 = v5 ^ 1;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = [(MTMLMediaItem *)self persistentId];
  BOOL v4 = [(MTMLMediaItem *)self title];
  unsigned __int8 v5 = [(MTMLMediaItem *)self guid];
  char v6 = +[NSString stringWithFormat:@"[%@] %@ %@", v3, v4, v5];

  return v6;
}

+ (id)propertiesForMediaItem
{
  v4[0] = MPMediaItemPropertyPodcastURL;
  v4[1] = MPMediaItemPropertyPodcastTitle;
  v4[2] = MPMediaItemPropertyIsITunesU;
  v4[3] = MPMediaItemPropertyArtist;
  v4[4] = MPMediaItemPropertyPersistentID;
  v4[5] = MPMediaItemPropertyPodcastPersistentID;
  v4[6] = MPMediaItemPropertyFileSize;
  v4[7] = MPMediaItemPropertyGenre;
  v4[8] = MPMediaItemPropertyPlaybackDuration;
  v4[9] = MPMediaItemPropertyTitle;
  v4[10] = MPMediaItemPropertyMediaType;
  v4[11] = MPMediaItemPropertyReleaseDate;
  v4[12] = MPMediaItemPropertyBookmarkTime;
  v4[13] = MPMediaItemPropertyHasBeenPlayed;
  v4[14] = MPMediaItemPropertyPlayCount;
  v4[15] = MPMediaItemPropertyDownloadIdentifier;
  v4[16] = MPMediaItemPropertyRestricted;
  v4[17] = MPMediaItemPropertyStoreID;
  v4[18] = MPMediaItemPropertyStorePlaylistID;
  v4[19] = MPMediaItemPropertyLastPlayedDate;
  v4[20] = MPMediaItemPropertyPodcastGUID;
  v4[21] = MPMediaItemPropertyFilePath;
  v4[22] = MPMediaItemPropertyAssetURL;
  v2 = +[NSArray arrayWithObjects:v4 count:23];

  return v2;
}

+ (BOOL)isMediaItemSyncedFromiTunes:(id)a3
{
  v3 = [a3 valueForProperty:MPMediaItemPropertyFilePath];
  unsigned __int8 v4 = [v3 containsStringInsensitive:@"/var/mobile/Media/iTunes_Control/"];

  return v4;
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSNumber)persistentId
{
  return self->_persistentId;
}

- (void)setPersistentId:(id)a3
{
}

- (NSNumber)storeTrackId
{
  return self->_storeTrackId;
}

- (void)setStoreTrackId:(id)a3
{
}

- (NSNumber)podcastPersistentId
{
  return self->_podcastPersistentId;
}

- (void)setPodcastPersistentId:(id)a3
{
}

- (NSNumber)storeCollectionId
{
  return self->_storeCollectionId;
}

- (void)setStoreCollectionId:(id)a3
{
}

- (NSNumber)byteSize
{
  return self->_byteSize;
}

- (void)setByteSize:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)assetUrl
{
  return self->_assetUrl;
}

- (void)setAssetUrl:(id)a3
{
}

- (BOOL)isItunesU
{
  return self->_isItunesU;
}

- (void)setIsItunesU:(BOOL)a3
{
  self->_isItunesU = a3;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (void)setPubDate:(id)a3
{
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
}

- (NSNumber)playhead
{
  return self->_playhead;
}

- (void)setPlayhead:(id)a3
{
}

- (NSNumber)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(id)a3
{
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
}

- (NSString)podcastTitle
{
  return self->_podcastTitle;
}

- (void)setPodcastTitle:(id)a3
{
}

- (NSNumber)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(id)a3
{
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (BOOL)isFromITunesSync
{
  return self->_isFromITunesSync;
}

- (void)setIsFromITunesSync:(BOOL)a3
{
  self->_isFromITunesSync = a3;
}

- (BOOL)isMissingAsset
{
  return self->_isMissingAsset;
}

- (void)setIsMissingAsset:(BOOL)a3
{
  self->_isMissingAsset = a3;
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setLastPlayedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlayedDate, 0);
  objc_storeStrong((id *)&self->_downloadIdentifier, 0);
  objc_storeStrong((id *)&self->_podcastTitle, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_playCount, 0);
  objc_storeStrong((id *)&self->_playhead, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_assetUrl, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_byteSize, 0);
  objc_storeStrong((id *)&self->_storeCollectionId, 0);
  objc_storeStrong((id *)&self->_podcastPersistentId, 0);
  objc_storeStrong((id *)&self->_storeTrackId, 0);
  objc_storeStrong((id *)&self->_persistentId, 0);

  objc_storeStrong((id *)&self->_artist, 0);
}

@end