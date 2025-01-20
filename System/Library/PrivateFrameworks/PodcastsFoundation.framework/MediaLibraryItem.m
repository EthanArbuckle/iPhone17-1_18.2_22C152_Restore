@interface MediaLibraryItem
+ (NSNumber)chosenByAutofill;
+ (NSNumber)isCompilation;
+ (NSNumber)isOTAPurchased;
+ (NSNumber)needsRestore;
+ (NSNumber)playbackRelativeVolume;
+ (NSNumber)playbackStart;
+ (NSNumber)remeberBookmark;
- (MediaLibraryItem)initWithDateAccessed:(id)a3 album:(id)a4 title:(id)a5 fileSize:(id)a6 externalGuid:(id)a7 bookmarkTimeMillis:(id)a8 seriesName:(id)a9 itemDescription:(id)a10 hasVideo:(id)a11 feedUrl:(id)a12 playlistId:(id)a13 dateReleased:(id)a14 artist:(id)a15 totalTimeMillis:(id)a16 playCount:(id)a17 hasBeenPlayed:(id)a18 serpentId:(id)a19 activeDsid:(id)a20 statsDownloadIdentifier:(id)a21 itemFilePath:(id)a22 artworkUrl:(id)a23 artworkTokenId:(id)a24;
- (NSNumber)activeDsid;
- (NSNumber)artworkTokenId;
- (NSNumber)bookmarkTimeMillis;
- (NSNumber)dateAccessed;
- (NSNumber)dateReleased;
- (NSNumber)fileSize;
- (NSNumber)hasBeenPlayed;
- (NSNumber)hasVideo;
- (NSNumber)playCount;
- (NSNumber)playlistId;
- (NSNumber)serpentId;
- (NSNumber)totalTimeMillis;
- (NSString)album;
- (NSString)artist;
- (NSString)externalGuid;
- (NSString)feedUrl;
- (NSString)itemDescription;
- (NSString)seriesName;
- (NSString)statsDownloadIdentifier;
- (NSString)title;
- (NSURL)artworkUrl;
- (NSURL)itemFilePath;
- (void)setActiveDsid:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtworkTokenId:(id)a3;
- (void)setArtworkUrl:(id)a3;
- (void)setBookmarkTimeMillis:(id)a3;
- (void)setDateAccessed:(id)a3;
- (void)setDateReleased:(id)a3;
- (void)setExternalGuid:(id)a3;
- (void)setFeedUrl:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setHasBeenPlayed:(id)a3;
- (void)setHasVideo:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setItemFilePath:(id)a3;
- (void)setPlayCount:(id)a3;
- (void)setPlaylistId:(id)a3;
- (void)setSeriesName:(id)a3;
- (void)setSerpentId:(id)a3;
- (void)setStatsDownloadIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTotalTimeMillis:(id)a3;
@end

@implementation MediaLibraryItem

- (MediaLibraryItem)initWithDateAccessed:(id)a3 album:(id)a4 title:(id)a5 fileSize:(id)a6 externalGuid:(id)a7 bookmarkTimeMillis:(id)a8 seriesName:(id)a9 itemDescription:(id)a10 hasVideo:(id)a11 feedUrl:(id)a12 playlistId:(id)a13 dateReleased:(id)a14 artist:(id)a15 totalTimeMillis:(id)a16 playCount:(id)a17 hasBeenPlayed:(id)a18 serpentId:(id)a19 activeDsid:(id)a20 statsDownloadIdentifier:(id)a21 itemFilePath:(id)a22 artworkUrl:(id)a23 artworkTokenId:(id)a24
{
  id v54 = a3;
  id v53 = a4;
  id v52 = a5;
  id v51 = a6;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v44 = a13;
  id v43 = a14;
  id v42 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  id v33 = a20;
  id v34 = a21;
  id v35 = a22;
  id v36 = a23;
  id v37 = a24;
  v55.receiver = self;
  v55.super_class = (Class)MediaLibraryItem;
  v38 = [(MediaLibraryItem *)&v55 init];
  v39 = v38;
  if (v38)
  {
    [(MediaLibraryItem *)v38 setDateAccessed:v54];
    [(MediaLibraryItem *)v39 setAlbum:v53];
    [(MediaLibraryItem *)v39 setTitle:v52];
    [(MediaLibraryItem *)v39 setFileSize:v51];
    [(MediaLibraryItem *)v39 setExternalGuid:v50];
    [(MediaLibraryItem *)v39 setBookmarkTimeMillis:v49];
    [(MediaLibraryItem *)v39 setSeriesName:v48];
    [(MediaLibraryItem *)v39 setItemDescription:v47];
    [(MediaLibraryItem *)v39 setHasVideo:v46];
    [(MediaLibraryItem *)v39 setFeedUrl:v45];
    [(MediaLibraryItem *)v39 setPlaylistId:v44];
    [(MediaLibraryItem *)v39 setDateReleased:v43];
    [(MediaLibraryItem *)v39 setArtist:v42];
    [(MediaLibraryItem *)v39 setTotalTimeMillis:v29];
    [(MediaLibraryItem *)v39 setPlayCount:v30];
    [(MediaLibraryItem *)v39 setHasBeenPlayed:v31];
    [(MediaLibraryItem *)v39 setSerpentId:v32];
    [(MediaLibraryItem *)v39 setActiveDsid:v33];
    [(MediaLibraryItem *)v39 setStatsDownloadIdentifier:v34];
    [(MediaLibraryItem *)v39 setItemFilePath:v35];
    [(MediaLibraryItem *)v39 setArtworkUrl:v36];
    [(MediaLibraryItem *)v39 setArtworkTokenId:v37];
  }

  return v39;
}

+ (NSNumber)remeberBookmark
{
  return (NSNumber *)MEMORY[0x1E4F1CC38];
}

+ (NSNumber)playbackStart
{
  return (NSNumber *)&unk_1F03D8838;
}

+ (NSNumber)playbackRelativeVolume
{
  return (NSNumber *)&unk_1F03D8850;
}

+ (NSNumber)isOTAPurchased
{
  return (NSNumber *)MEMORY[0x1E4F1CC38];
}

+ (NSNumber)needsRestore
{
  return (NSNumber *)MEMORY[0x1E4F1CC28];
}

+ (NSNumber)chosenByAutofill
{
  return (NSNumber *)MEMORY[0x1E4F1CC28];
}

+ (NSNumber)isCompilation
{
  return (NSNumber *)MEMORY[0x1E4F1CC28];
}

- (NSNumber)dateAccessed
{
  return self->_dateAccessed;
}

- (void)setDateAccessed:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
}

- (NSString)externalGuid
{
  return self->_externalGuid;
}

- (void)setExternalGuid:(id)a3
{
}

- (NSNumber)bookmarkTimeMillis
{
  return self->_bookmarkTimeMillis;
}

- (void)setBookmarkTimeMillis:(id)a3
{
}

- (NSString)seriesName
{
  return self->_seriesName;
}

- (void)setSeriesName:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSNumber)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(id)a3
{
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
}

- (NSNumber)playlistId
{
  return self->_playlistId;
}

- (void)setPlaylistId:(id)a3
{
}

- (NSNumber)dateReleased
{
  return self->_dateReleased;
}

- (void)setDateReleased:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSNumber)totalTimeMillis
{
  return self->_totalTimeMillis;
}

- (void)setTotalTimeMillis:(id)a3
{
}

- (NSNumber)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(id)a3
{
}

- (NSNumber)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(id)a3
{
}

- (NSNumber)serpentId
{
  return self->_serpentId;
}

- (void)setSerpentId:(id)a3
{
}

- (NSNumber)activeDsid
{
  return self->_activeDsid;
}

- (void)setActiveDsid:(id)a3
{
}

- (NSString)statsDownloadIdentifier
{
  return self->_statsDownloadIdentifier;
}

- (void)setStatsDownloadIdentifier:(id)a3
{
}

- (NSURL)itemFilePath
{
  return self->_itemFilePath;
}

- (void)setItemFilePath:(id)a3
{
}

- (NSURL)artworkUrl
{
  return self->_artworkUrl;
}

- (void)setArtworkUrl:(id)a3
{
}

- (NSNumber)artworkTokenId
{
  return self->_artworkTokenId;
}

- (void)setArtworkTokenId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTokenId, 0);
  objc_storeStrong((id *)&self->_artworkUrl, 0);
  objc_storeStrong((id *)&self->_itemFilePath, 0);
  objc_storeStrong((id *)&self->_statsDownloadIdentifier, 0);
  objc_storeStrong((id *)&self->_activeDsid, 0);
  objc_storeStrong((id *)&self->_serpentId, 0);
  objc_storeStrong((id *)&self->_hasBeenPlayed, 0);
  objc_storeStrong((id *)&self->_playCount, 0);
  objc_storeStrong((id *)&self->_totalTimeMillis, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_dateReleased, 0);
  objc_storeStrong((id *)&self->_playlistId, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_hasVideo, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_seriesName, 0);
  objc_storeStrong((id *)&self->_bookmarkTimeMillis, 0);
  objc_storeStrong((id *)&self->_externalGuid, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_dateAccessed, 0);
}

@end