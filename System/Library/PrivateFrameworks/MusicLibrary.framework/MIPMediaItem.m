@interface MIPMediaItem
+ (Class)libraryIdentifiersType;
- (BOOL)cloudAssetAvailable;
- (BOOL)explicitContent;
- (BOOL)hasAccountId;
- (BOOL)hasArtworkId;
- (BOOL)hasAssetStoreItemId;
- (BOOL)hasAudiobook;
- (BOOL)hasBookmarkTimeMilliseconds;
- (BOOL)hasChapterData;
- (BOOL)hasChapterMetadataUrl;
- (BOOL)hasCloudAssetAvailable;
- (BOOL)hasCloudMatchedStatus;
- (BOOL)hasCloudPlaybackEndpointType;
- (BOOL)hasCloudStatus;
- (BOOL)hasCloudUniversalLibraryId;
- (BOOL)hasComment;
- (BOOL)hasContentRating;
- (BOOL)hasContentRatingLevel;
- (BOOL)hasCopyright;
- (BOOL)hasCreationDateTime;
- (BOOL)hasDrmKey1IdCode;
- (BOOL)hasDrmKey2IdCode;
- (BOOL)hasDrmPlatformIdCode;
- (BOOL)hasDrmVersionsCode;
- (BOOL)hasDuration;
- (BOOL)hasExplicitContent;
- (BOOL)hasExtrasUrl;
- (BOOL)hasFamilyAccountId;
- (BOOL)hasFileKind;
- (BOOL)hasFileSize;
- (BOOL)hasFlattenedChapterData;
- (BOOL)hasGrouping;
- (BOOL)hasHasChapterData;
- (BOOL)hasHasLocalAsset;
- (BOOL)hasHidden;
- (BOOL)hasInUsersCloudLibrary;
- (BOOL)hasIsInUsersLibrary;
- (BOOL)hasIsPreorder;
- (BOOL)hasLastPlayedDateTime;
- (BOOL)hasLastSkippedDateTime;
- (BOOL)hasLikedState;
- (BOOL)hasLikedStateChanged;
- (BOOL)hasLikedStateChangedDate;
- (BOOL)hasLocalAsset;
- (BOOL)hasLongDescription;
- (BOOL)hasMediaType;
- (BOOL)hasModificationDateTime;
- (BOOL)hasMovie;
- (BOOL)hasNeedsReporting;
- (BOOL)hasPlayCount;
- (BOOL)hasPlayCountDelta;
- (BOOL)hasPlaybackEndpointType;
- (BOOL)hasPodcast;
- (BOOL)hasPurchaseDateTime;
- (BOOL)hasPurchaseHistoryId;
- (BOOL)hasPurchaseHistoryRedownloadParams;
- (BOOL)hasPurchaseHistoryToken;
- (BOOL)hasReleaseDateTime;
- (BOOL)hasRememberBookmark;
- (BOOL)hasReportingStoreItemId;
- (BOOL)hasSagaId;
- (BOOL)hasSagaRedownloadParams;
- (BOOL)hasSecondaryArtworkId;
- (BOOL)hasSecondaryArtworkSourceType;
- (BOOL)hasShortDescription;
- (BOOL)hasSkipCount;
- (BOOL)hasSkipCountDelta;
- (BOOL)hasSong;
- (BOOL)hasSortTitle;
- (BOOL)hasStoreAssetFlavor;
- (BOOL)hasStoreId;
- (BOOL)hasStorePlaylistId;
- (BOOL)hasStoreProtectionType;
- (BOOL)hasStoreXID;
- (BOOL)hasStorefrontId;
- (BOOL)hasSubscriptionStoreItemId;
- (BOOL)hasTitle;
- (BOOL)hasTvShow;
- (BOOL)hasUserDisabled;
- (BOOL)hasYear;
- (BOOL)hidden;
- (BOOL)inUsersCloudLibrary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInUsersLibrary;
- (BOOL)isPreorder;
- (BOOL)likedStateChanged;
- (BOOL)needsReporting;
- (BOOL)readFrom:(id)a3;
- (BOOL)rememberBookmark;
- (BOOL)userDisabled;
- (MIPAudiobook)audiobook;
- (MIPMovie)movie;
- (MIPPodcast)podcast;
- (MIPSong)song;
- (MIPTVShow)tvShow;
- (NSData)flattenedChapterData;
- (NSMutableArray)libraryIdentifiers;
- (NSString)artworkId;
- (NSString)chapterMetadataUrl;
- (NSString)cloudUniversalLibraryId;
- (NSString)comment;
- (NSString)copyright;
- (NSString)extrasUrl;
- (NSString)grouping;
- (NSString)longDescription;
- (NSString)purchaseHistoryRedownloadParams;
- (NSString)sagaRedownloadParams;
- (NSString)secondaryArtworkId;
- (NSString)shortDescription;
- (NSString)sortTitle;
- (NSString)storeAssetFlavor;
- (NSString)storeXID;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)libraryIdentifiersAtIndex:(unint64_t)a3;
- (id)mediaTypeAsString:(int)a3;
- (int)StringAsMediaType:(id)a3;
- (int)cloudMatchedStatus;
- (int)cloudPlaybackEndpointType;
- (int)cloudStatus;
- (int)contentRating;
- (int)contentRatingLevel;
- (int)drmVersionsCode;
- (int)fileKind;
- (int)likedState;
- (int)mediaType;
- (int)playCount;
- (int)playCountDelta;
- (int)playbackEndpointType;
- (int)purchaseHistoryToken;
- (int)secondaryArtworkSourceType;
- (int)skipCount;
- (int)skipCountDelta;
- (int)storeProtectionType;
- (int)year;
- (int64_t)accountId;
- (int64_t)assetStoreItemId;
- (int64_t)bookmarkTimeMilliseconds;
- (int64_t)creationDateTime;
- (int64_t)drmKey1IdCode;
- (int64_t)drmKey2IdCode;
- (int64_t)drmPlatformIdCode;
- (int64_t)duration;
- (int64_t)familyAccountId;
- (int64_t)fileSize;
- (int64_t)lastPlayedDateTime;
- (int64_t)lastSkippedDateTime;
- (int64_t)likedStateChangedDate;
- (int64_t)modificationDateTime;
- (int64_t)purchaseDateTime;
- (int64_t)purchaseHistoryId;
- (int64_t)releaseDateTime;
- (int64_t)reportingStoreItemId;
- (int64_t)sagaId;
- (int64_t)storeId;
- (int64_t)storePlaylistId;
- (int64_t)storefrontId;
- (int64_t)subscriptionStoreItemId;
- (unint64_t)hash;
- (unint64_t)libraryIdentifiersCount;
- (void)addLibraryIdentifiers:(id)a3;
- (void)clearLibraryIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(int64_t)a3;
- (void)setArtworkId:(id)a3;
- (void)setAssetStoreItemId:(int64_t)a3;
- (void)setAudiobook:(id)a3;
- (void)setBookmarkTimeMilliseconds:(int64_t)a3;
- (void)setChapterMetadataUrl:(id)a3;
- (void)setCloudAssetAvailable:(BOOL)a3;
- (void)setCloudMatchedStatus:(int)a3;
- (void)setCloudPlaybackEndpointType:(int)a3;
- (void)setCloudStatus:(int)a3;
- (void)setCloudUniversalLibraryId:(id)a3;
- (void)setComment:(id)a3;
- (void)setContentRating:(int)a3;
- (void)setContentRatingLevel:(int)a3;
- (void)setCopyright:(id)a3;
- (void)setCreationDateTime:(int64_t)a3;
- (void)setDrmKey1IdCode:(int64_t)a3;
- (void)setDrmKey2IdCode:(int64_t)a3;
- (void)setDrmPlatformIdCode:(int64_t)a3;
- (void)setDrmVersionsCode:(int)a3;
- (void)setDuration:(int64_t)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setExtrasUrl:(id)a3;
- (void)setFamilyAccountId:(int64_t)a3;
- (void)setFileKind:(int)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setFlattenedChapterData:(id)a3;
- (void)setGrouping:(id)a3;
- (void)setHasAccountId:(BOOL)a3;
- (void)setHasAssetStoreItemId:(BOOL)a3;
- (void)setHasBookmarkTimeMilliseconds:(BOOL)a3;
- (void)setHasChapterData:(BOOL)a3;
- (void)setHasCloudAssetAvailable:(BOOL)a3;
- (void)setHasCloudMatchedStatus:(BOOL)a3;
- (void)setHasCloudPlaybackEndpointType:(BOOL)a3;
- (void)setHasCloudStatus:(BOOL)a3;
- (void)setHasContentRating:(BOOL)a3;
- (void)setHasContentRatingLevel:(BOOL)a3;
- (void)setHasCreationDateTime:(BOOL)a3;
- (void)setHasDrmKey1IdCode:(BOOL)a3;
- (void)setHasDrmKey2IdCode:(BOOL)a3;
- (void)setHasDrmPlatformIdCode:(BOOL)a3;
- (void)setHasDrmVersionsCode:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasExplicitContent:(BOOL)a3;
- (void)setHasFamilyAccountId:(BOOL)a3;
- (void)setHasFileKind:(BOOL)a3;
- (void)setHasFileSize:(BOOL)a3;
- (void)setHasHasChapterData:(BOOL)a3;
- (void)setHasHasLocalAsset:(BOOL)a3;
- (void)setHasHidden:(BOOL)a3;
- (void)setHasInUsersCloudLibrary:(BOOL)a3;
- (void)setHasIsInUsersLibrary:(BOOL)a3;
- (void)setHasIsPreorder:(BOOL)a3;
- (void)setHasLastPlayedDateTime:(BOOL)a3;
- (void)setHasLastSkippedDateTime:(BOOL)a3;
- (void)setHasLikedState:(BOOL)a3;
- (void)setHasLikedStateChanged:(BOOL)a3;
- (void)setHasLikedStateChangedDate:(BOOL)a3;
- (void)setHasLocalAsset:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasModificationDateTime:(BOOL)a3;
- (void)setHasNeedsReporting:(BOOL)a3;
- (void)setHasPlayCount:(BOOL)a3;
- (void)setHasPlayCountDelta:(BOOL)a3;
- (void)setHasPlaybackEndpointType:(BOOL)a3;
- (void)setHasPurchaseDateTime:(BOOL)a3;
- (void)setHasPurchaseHistoryId:(BOOL)a3;
- (void)setHasPurchaseHistoryToken:(BOOL)a3;
- (void)setHasReleaseDateTime:(BOOL)a3;
- (void)setHasRememberBookmark:(BOOL)a3;
- (void)setHasReportingStoreItemId:(BOOL)a3;
- (void)setHasSagaId:(BOOL)a3;
- (void)setHasSecondaryArtworkSourceType:(BOOL)a3;
- (void)setHasSkipCount:(BOOL)a3;
- (void)setHasSkipCountDelta:(BOOL)a3;
- (void)setHasStoreId:(BOOL)a3;
- (void)setHasStorePlaylistId:(BOOL)a3;
- (void)setHasStoreProtectionType:(BOOL)a3;
- (void)setHasStorefrontId:(BOOL)a3;
- (void)setHasSubscriptionStoreItemId:(BOOL)a3;
- (void)setHasUserDisabled:(BOOL)a3;
- (void)setHasYear:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInUsersCloudLibrary:(BOOL)a3;
- (void)setIsInUsersLibrary:(BOOL)a3;
- (void)setIsPreorder:(BOOL)a3;
- (void)setLastPlayedDateTime:(int64_t)a3;
- (void)setLastSkippedDateTime:(int64_t)a3;
- (void)setLibraryIdentifiers:(id)a3;
- (void)setLikedState:(int)a3;
- (void)setLikedStateChanged:(BOOL)a3;
- (void)setLikedStateChangedDate:(int64_t)a3;
- (void)setLongDescription:(id)a3;
- (void)setMediaType:(int)a3;
- (void)setModificationDateTime:(int64_t)a3;
- (void)setMovie:(id)a3;
- (void)setNeedsReporting:(BOOL)a3;
- (void)setPlayCount:(int)a3;
- (void)setPlayCountDelta:(int)a3;
- (void)setPlaybackEndpointType:(int)a3;
- (void)setPodcast:(id)a3;
- (void)setPurchaseDateTime:(int64_t)a3;
- (void)setPurchaseHistoryId:(int64_t)a3;
- (void)setPurchaseHistoryRedownloadParams:(id)a3;
- (void)setPurchaseHistoryToken:(int)a3;
- (void)setReleaseDateTime:(int64_t)a3;
- (void)setRememberBookmark:(BOOL)a3;
- (void)setReportingStoreItemId:(int64_t)a3;
- (void)setSagaId:(int64_t)a3;
- (void)setSagaRedownloadParams:(id)a3;
- (void)setSecondaryArtworkId:(id)a3;
- (void)setSecondaryArtworkSourceType:(int)a3;
- (void)setShortDescription:(id)a3;
- (void)setSkipCount:(int)a3;
- (void)setSkipCountDelta:(int)a3;
- (void)setSong:(id)a3;
- (void)setSortTitle:(id)a3;
- (void)setStoreAssetFlavor:(id)a3;
- (void)setStoreId:(int64_t)a3;
- (void)setStorePlaylistId:(int64_t)a3;
- (void)setStoreProtectionType:(int)a3;
- (void)setStoreXID:(id)a3;
- (void)setStorefrontId:(int64_t)a3;
- (void)setSubscriptionStoreItemId:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTvShow:(id)a3;
- (void)setUserDisabled:(BOOL)a3;
- (void)setYear:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPMediaItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvShow, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_storeXID, 0);
  objc_storeStrong((id *)&self->_storeAssetFlavor, 0);
  objc_storeStrong((id *)&self->_sortTitle, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_secondaryArtworkId, 0);
  objc_storeStrong((id *)&self->_sagaRedownloadParams, 0);
  objc_storeStrong((id *)&self->_purchaseHistoryRedownloadParams, 0);
  objc_storeStrong((id *)&self->_podcast, 0);
  objc_storeStrong((id *)&self->_movie, 0);
  objc_storeStrong((id *)&self->_longDescription, 0);
  objc_storeStrong((id *)&self->_libraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_flattenedChapterData, 0);
  objc_storeStrong((id *)&self->_extrasUrl, 0);
  objc_storeStrong((id *)&self->_copyright, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, 0);
  objc_storeStrong((id *)&self->_chapterMetadataUrl, 0);
  objc_storeStrong((id *)&self->_audiobook, 0);

  objc_storeStrong((id *)&self->_artworkId, 0);
}

- (void)setAudiobook:(id)a3
{
}

- (MIPAudiobook)audiobook
{
  return self->_audiobook;
}

- (void)setPodcast:(id)a3
{
}

- (MIPPodcast)podcast
{
  return self->_podcast;
}

- (void)setTvShow:(id)a3
{
}

- (MIPTVShow)tvShow
{
  return self->_tvShow;
}

- (void)setMovie:(id)a3
{
}

- (MIPMovie)movie
{
  return self->_movie;
}

- (void)setSong:(id)a3
{
}

- (MIPSong)song
{
  return self->_song;
}

- (int64_t)assetStoreItemId
{
  return self->_assetStoreItemId;
}

- (int64_t)reportingStoreItemId
{
  return self->_reportingStoreItemId;
}

- (void)setCloudUniversalLibraryId:(id)a3
{
}

- (NSString)cloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId;
}

- (int64_t)subscriptionStoreItemId
{
  return self->_subscriptionStoreItemId;
}

- (void)setStoreXID:(id)a3
{
}

- (NSString)storeXID
{
  return self->_storeXID;
}

- (void)setSagaRedownloadParams:(id)a3
{
}

- (NSString)sagaRedownloadParams
{
  return self->_sagaRedownloadParams;
}

- (int64_t)sagaId
{
  return self->_sagaId;
}

- (void)setPurchaseHistoryRedownloadParams:(id)a3
{
}

- (NSString)purchaseHistoryRedownloadParams
{
  return self->_purchaseHistoryRedownloadParams;
}

- (int)purchaseHistoryToken
{
  return self->_purchaseHistoryToken;
}

- (int64_t)purchaseHistoryId
{
  return self->_purchaseHistoryId;
}

- (int64_t)accountId
{
  return self->_accountId;
}

- (int64_t)storefrontId
{
  return self->_storefrontId;
}

- (int64_t)storeId
{
  return self->_storeId;
}

- (void)setLibraryIdentifiers:(id)a3
{
}

- (NSMutableArray)libraryIdentifiers
{
  return self->_libraryIdentifiers;
}

- (int64_t)likedStateChangedDate
{
  return self->_likedStateChangedDate;
}

- (BOOL)isPreorder
{
  return self->_isPreorder;
}

- (void)setFlattenedChapterData:(id)a3
{
}

- (NSData)flattenedChapterData
{
  return self->_flattenedChapterData;
}

- (BOOL)hasChapterData
{
  return self->_hasChapterData;
}

- (void)setSecondaryArtworkId:(id)a3
{
}

- (NSString)secondaryArtworkId
{
  return self->_secondaryArtworkId;
}

- (int)secondaryArtworkSourceType
{
  return self->_secondaryArtworkSourceType;
}

- (BOOL)inUsersCloudLibrary
{
  return self->_inUsersCloudLibrary;
}

- (int)cloudMatchedStatus
{
  return self->_cloudMatchedStatus;
}

- (int)playbackEndpointType
{
  return self->_playbackEndpointType;
}

- (int)cloudPlaybackEndpointType
{
  return self->_cloudPlaybackEndpointType;
}

- (BOOL)userDisabled
{
  return self->_userDisabled;
}

- (int)storeProtectionType
{
  return self->_storeProtectionType;
}

- (BOOL)cloudAssetAvailable
{
  return self->_cloudAssetAvailable;
}

- (BOOL)isInUsersLibrary
{
  return self->_isInUsersLibrary;
}

- (BOOL)likedStateChanged
{
  return self->_likedStateChanged;
}

- (BOOL)needsReporting
{
  return self->_needsReporting;
}

- (int)likedState
{
  return self->_likedState;
}

- (void)setGrouping:(id)a3
{
}

- (NSString)grouping
{
  return self->_grouping;
}

- (BOOL)hasLocalAsset
{
  return self->_hasLocalAsset;
}

- (int64_t)storePlaylistId
{
  return self->_storePlaylistId;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (int64_t)bookmarkTimeMilliseconds
{
  return self->_bookmarkTimeMilliseconds;
}

- (BOOL)rememberBookmark
{
  return self->_rememberBookmark;
}

- (int64_t)lastSkippedDateTime
{
  return self->_lastSkippedDateTime;
}

- (int)skipCountDelta
{
  return self->_skipCountDelta;
}

- (int)skipCount
{
  return self->_skipCount;
}

- (int64_t)lastPlayedDateTime
{
  return self->_lastPlayedDateTime;
}

- (int)playCountDelta
{
  return self->_playCountDelta;
}

- (int)playCount
{
  return self->_playCount;
}

- (int)cloudStatus
{
  return self->_cloudStatus;
}

- (int64_t)purchaseDateTime
{
  return self->_purchaseDateTime;
}

- (void)setExtrasUrl:(id)a3
{
}

- (NSString)extrasUrl
{
  return self->_extrasUrl;
}

- (void)setStoreAssetFlavor:(id)a3
{
}

- (NSString)storeAssetFlavor
{
  return self->_storeAssetFlavor;
}

- (void)setChapterMetadataUrl:(id)a3
{
}

- (NSString)chapterMetadataUrl
{
  return self->_chapterMetadataUrl;
}

- (int64_t)drmKey2IdCode
{
  return self->_drmKey2IdCode;
}

- (int64_t)drmKey1IdCode
{
  return self->_drmKey1IdCode;
}

- (int64_t)drmPlatformIdCode
{
  return self->_drmPlatformIdCode;
}

- (int)drmVersionsCode
{
  return self->_drmVersionsCode;
}

- (int64_t)familyAccountId
{
  return self->_familyAccountId;
}

- (int)fileKind
{
  return self->_fileKind;
}

- (void)setComment:(id)a3
{
}

- (NSString)comment
{
  return self->_comment;
}

- (int)contentRatingLevel
{
  return self->_contentRatingLevel;
}

- (int)year
{
  return self->_year;
}

- (void)setArtworkId:(id)a3
{
}

- (NSString)artworkId
{
  return self->_artworkId;
}

- (void)setCopyright:(id)a3
{
}

- (NSString)copyright
{
  return self->_copyright;
}

- (void)setLongDescription:(id)a3
{
}

- (NSString)longDescription
{
  return self->_longDescription;
}

- (void)setShortDescription:(id)a3
{
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (BOOL)explicitContent
{
  return self->_explicitContent;
}

- (int)contentRating
{
  return self->_contentRating;
}

- (int64_t)duration
{
  return self->_duration;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (int64_t)modificationDateTime
{
  return self->_modificationDateTime;
}

- (int64_t)creationDateTime
{
  return self->_creationDateTime;
}

- (int64_t)releaseDateTime
{
  return self->_releaseDateTime;
}

- (void)setSortTitle:(id)a3
{
}

- (NSString)sortTitle
{
  return self->_sortTitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 499) & 0x80) != 0)
  {
    self->_mediaType = v4[82];
    *(void *)&self->_has |= 0x80000000uLL;
  }
  if (*((void *)v4 + 58)) {
    -[MIPMediaItem setTitle:](self, "setTitle:");
  }
  if (*((void *)v5 + 54)) {
    -[MIPMediaItem setSortTitle:](self, "setSortTitle:");
  }
  uint64_t v6 = *((void *)v5 + 62);
  if ((v6 & 0x10000) != 0)
  {
    self->_releaseDateTime = *((void *)v5 + 17);
    *(void *)&self->_has |= 0x10000uLL;
    uint64_t v6 = *((void *)v5 + 62);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x2000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_115;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_creationDateTime = *((void *)v5 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v6 = *((void *)v5 + 62);
  if ((v6 & 0x2000) == 0)
  {
LABEL_10:
    if ((v6 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_modificationDateTime = *((void *)v5 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v6 = *((void *)v5 + 62);
  if ((v6 & 0x200) == 0)
  {
LABEL_11:
    if ((v6 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_fileSize = *((void *)v5 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v6 = *((void *)v5 + 62);
  if ((v6 & 0x80) == 0)
  {
LABEL_12:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_duration = *((void *)v5 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v6 = *((void *)v5 + 62);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_13:
    if ((v6 & 0x40000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_118:
  self->_contentRating = *((_DWORD *)v5 + 62);
  *(void *)&self->_has |= 0x4000000uLL;
  if ((*((void *)v5 + 62) & 0x40000000000) != 0)
  {
LABEL_14:
    self->_explicitContent = *((unsigned char *)v5 + 485);
    *(void *)&self->_has |= 0x40000000000uLL;
  }
LABEL_15:
  if (*((void *)v5 + 51)) {
    -[MIPMediaItem setShortDescription:](self, "setShortDescription:");
  }
  if (*((void *)v5 + 40)) {
    -[MIPMediaItem setLongDescription:](self, "setLongDescription:");
  }
  if (*((void *)v5 + 32)) {
    -[MIPMediaItem setCopyright:](self, "setCopyright:");
  }
  if (*((void *)v5 + 24)) {
    -[MIPMediaItem setArtworkId:](self, "setArtworkId:");
  }
  uint64_t v7 = *((void *)v5 + 62);
  if ((v7 & 0x10000000000) != 0)
  {
    self->_year = *((_DWORD *)v5 + 120);
    *(void *)&self->_has |= 0x10000000000uLL;
    uint64_t v7 = *((void *)v5 + 62);
  }
  if ((v7 & 0x8000000) != 0)
  {
    self->_contentRatingLevel = *((_DWORD *)v5 + 63);
    *(void *)&self->_has |= 0x8000000uLL;
  }
  if (*((void *)v5 + 30)) {
    -[MIPMediaItem setComment:](self, "setComment:");
  }
  uint64_t v8 = *((void *)v5 + 62);
  if ((v8 & 0x20000000) != 0)
  {
    self->_fileKind = *((_DWORD *)v5 + 70);
    *(void *)&self->_has |= 0x20000000uLL;
    uint64_t v8 = *((void *)v5 + 62);
    if ((v8 & 0x100) == 0)
    {
LABEL_31:
      if ((v8 & 0x10000000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_122;
    }
  }
  else if ((v8 & 0x100) == 0)
  {
    goto LABEL_31;
  }
  self->_familyAccountId = *((void *)v5 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v8 = *((void *)v5 + 62);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_32:
    if ((v8 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_drmVersionsCode = *((_DWORD *)v5 + 66);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v8 = *((void *)v5 + 62);
  if ((v8 & 0x40) == 0)
  {
LABEL_33:
    if ((v8 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_drmPlatformIdCode = *((void *)v5 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v8 = *((void *)v5 + 62);
  if ((v8 & 0x10) == 0)
  {
LABEL_34:
    if ((v8 & 0x20) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_124:
  self->_drmKey1IdCode = *((void *)v5 + 5);
  *(void *)&self->_has |= 0x10uLL;
  if ((*((void *)v5 + 62) & 0x20) != 0)
  {
LABEL_35:
    self->_drmKey2IdCode = *((void *)v5 + 6);
    *(void *)&self->_has |= 0x20uLL;
  }
LABEL_36:
  if (*((void *)v5 + 26)) {
    -[MIPMediaItem setChapterMetadataUrl:](self, "setChapterMetadataUrl:");
  }
  if (*((void *)v5 + 55)) {
    -[MIPMediaItem setStoreAssetFlavor:](self, "setStoreAssetFlavor:");
  }
  if (*((void *)v5 + 34)) {
    -[MIPMediaItem setExtrasUrl:](self, "setExtrasUrl:");
  }
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x4000) != 0)
  {
    self->_purchaseDateTime = *((void *)v5 + 15);
    *(void *)&self->_has |= 0x4000uLL;
    uint64_t v9 = *((void *)v5 + 62);
    if ((v9 & 0x2000000) == 0)
    {
LABEL_44:
      if ((v9 & 0x100000000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_128;
    }
  }
  else if ((v9 & 0x2000000) == 0)
  {
    goto LABEL_44;
  }
  self->_cloudStatus = *((_DWORD *)v5 + 56);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x100000000) == 0)
  {
LABEL_45:
    if ((v9 & 0x200000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_playCount = *((_DWORD *)v5 + 86);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x200000000) == 0)
  {
LABEL_46:
    if ((v9 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_playCountDelta = *((_DWORD *)v5 + 87);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x400) == 0)
  {
LABEL_47:
    if ((v9 & 0x2000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_lastPlayedDateTime = *((void *)v5 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x2000000000) == 0)
  {
LABEL_48:
    if ((v9 & 0x4000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_132;
  }
LABEL_131:
  self->_skipCount = *((_DWORD *)v5 + 104);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x4000000000) == 0)
  {
LABEL_49:
    if ((v9 & 0x800) == 0) {
      goto LABEL_50;
    }
    goto LABEL_133;
  }
LABEL_132:
  self->_skipCountDelta = *((_DWORD *)v5 + 105);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x800) == 0)
  {
LABEL_50:
    if ((v9 & 0x8000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_134;
  }
LABEL_133:
  self->_lastSkippedDateTime = *((void *)v5 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((v9 & 4) == 0) {
      goto LABEL_52;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_rememberBookmark = *((unsigned char *)v5 + 494);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 4) == 0)
  {
LABEL_52:
    if ((v9 & 0x200000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_bookmarkTimeMilliseconds = *((void *)v5 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x200000000000) == 0)
  {
LABEL_53:
    if ((v9 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_hidden = *((unsigned char *)v5 + 488);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v9 = *((void *)v5 + 62);
  if ((v9 & 0x100000) == 0)
  {
LABEL_54:
    if ((v9 & 0x100000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_137:
  self->_storePlaylistId = *((void *)v5 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  if ((*((void *)v5 + 62) & 0x100000000000) != 0)
  {
LABEL_55:
    self->_hasLocalAsset = *((unsigned char *)v5 + 487);
    *(void *)&self->_has |= 0x100000000000uLL;
  }
LABEL_56:
  if (*((void *)v5 + 37)) {
    -[MIPMediaItem setGrouping:](self, "setGrouping:");
  }
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x40000000) != 0)
  {
    self->_likedState = *((_DWORD *)v5 + 78);
    *(void *)&self->_has |= 0x40000000uLL;
    uint64_t v10 = *((void *)v5 + 62);
    if ((v10 & 0x4000000000000) == 0)
    {
LABEL_60:
      if ((v10 & 0x2000000000000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_141;
    }
  }
  else if ((v10 & 0x4000000000000) == 0)
  {
    goto LABEL_60;
  }
  self->_needsReporting = *((unsigned char *)v5 + 493);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((v10 & 0x800000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_142;
  }
LABEL_141:
  self->_likedStateChanged = *((unsigned char *)v5 + 492);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x800000000000) == 0)
  {
LABEL_62:
    if ((v10 & 0x20000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_isInUsersLibrary = *((unsigned char *)v5 + 490);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x20000000000) == 0)
  {
LABEL_63:
    if ((v10 & 0x8000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_144;
  }
LABEL_143:
  self->_cloudAssetAvailable = *((unsigned char *)v5 + 484);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x8000000000) == 0)
  {
LABEL_64:
    if ((v10 & 0x10000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_145;
  }
LABEL_144:
  self->_storeProtectionType = *((_DWORD *)v5 + 112);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x10000000000000) == 0)
  {
LABEL_65:
    if ((v10 & 0x1000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_146;
  }
LABEL_145:
  self->_userDisabled = *((unsigned char *)v5 + 495);
  *(void *)&self->_has |= 0x10000000000000uLL;
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x1000000) == 0)
  {
LABEL_66:
    if ((v10 & 0x400000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_147;
  }
LABEL_146:
  self->_cloudPlaybackEndpointType = *((_DWORD *)v5 + 55);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x400000000) == 0)
  {
LABEL_67:
    if ((v10 & 0x800000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_148;
  }
LABEL_147:
  self->_playbackEndpointType = *((_DWORD *)v5 + 88);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x800000) == 0)
  {
LABEL_68:
    if ((v10 & 0x400000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_149;
  }
LABEL_148:
  self->_cloudMatchedStatus = *((_DWORD *)v5 + 54);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v10 = *((void *)v5 + 62);
  if ((v10 & 0x400000000000) == 0)
  {
LABEL_69:
    if ((v10 & 0x1000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
LABEL_149:
  self->_inUsersCloudLibrary = *((unsigned char *)v5 + 489);
  *(void *)&self->_has |= 0x400000000000uLL;
  if ((*((void *)v5 + 62) & 0x1000000000) != 0)
  {
LABEL_70:
    self->_secondaryArtworkSourceType = *((_DWORD *)v5 + 100);
    *(void *)&self->_has |= 0x1000000000uLL;
  }
LABEL_71:
  if (*((void *)v5 + 49)) {
    -[MIPMediaItem setSecondaryArtworkId:](self, "setSecondaryArtworkId:");
  }
  if ((*((unsigned char *)v5 + 501) & 8) != 0)
  {
    self->_hasChapterData = *((unsigned char *)v5 + 486);
    *(void *)&self->_has |= 0x80000000000uLL;
  }
  if (*((void *)v5 + 36)) {
    -[MIPMediaItem setFlattenedChapterData:](self, "setFlattenedChapterData:");
  }
  uint64_t v11 = *((void *)v5 + 62);
  if ((v11 & 0x1000000000000) != 0)
  {
    self->_isPreorder = *((unsigned char *)v5 + 491);
    *(void *)&self->_has |= 0x1000000000000uLL;
    uint64_t v11 = *((void *)v5 + 62);
  }
  if ((v11 & 0x1000) != 0)
  {
    self->_likedStateChangedDate = *((void *)v5 + 13);
    *(void *)&self->_has |= 0x1000uLL;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = *((id *)v5 + 38);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        -[MIPMediaItem addLibraryIdentifiers:](self, "addLibraryIdentifiers:", *(void *)(*((void *)&v29 + 1) + 8 * i), (void)v29);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  uint64_t v17 = *((void *)v5 + 62);
  if ((v17 & 0x80000) != 0)
  {
    self->_storeId = *((void *)v5 + 20);
    *(void *)&self->_has |= 0x80000uLL;
    uint64_t v17 = *((void *)v5 + 62);
    if ((v17 & 0x200000) == 0)
    {
LABEL_90:
      if ((v17 & 1) == 0) {
        goto LABEL_91;
      }
      goto LABEL_153;
    }
  }
  else if ((v17 & 0x200000) == 0)
  {
    goto LABEL_90;
  }
  self->_storefrontId = *((void *)v5 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v17 = *((void *)v5 + 62);
  if ((v17 & 1) == 0)
  {
LABEL_91:
    if ((v17 & 0x8000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_154;
  }
LABEL_153:
  self->_accountId = *((void *)v5 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v17 = *((void *)v5 + 62);
  if ((v17 & 0x8000) == 0)
  {
LABEL_92:
    if ((v17 & 0x800000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_154:
  self->_purchaseHistoryId = *((void *)v5 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  if ((*((void *)v5 + 62) & 0x800000000) != 0)
  {
LABEL_93:
    self->_purchaseHistoryToken = *((_DWORD *)v5 + 94);
    *(void *)&self->_has |= 0x800000000uLL;
  }
LABEL_94:
  if (*((void *)v5 + 46)) {
    -[MIPMediaItem setPurchaseHistoryRedownloadParams:](self, "setPurchaseHistoryRedownloadParams:");
  }
  if ((*((unsigned char *)v5 + 498) & 4) != 0)
  {
    self->_sagaId = *((void *)v5 + 19);
    *(void *)&self->_has |= 0x40000uLL;
  }
  if (*((void *)v5 + 48)) {
    -[MIPMediaItem setSagaRedownloadParams:](self, "setSagaRedownloadParams:");
  }
  if (*((void *)v5 + 57)) {
    -[MIPMediaItem setStoreXID:](self, "setStoreXID:");
  }
  if ((*((unsigned char *)v5 + 498) & 0x40) != 0)
  {
    self->_subscriptionStoreItemId = *((void *)v5 + 23);
    *(void *)&self->_has |= 0x400000uLL;
  }
  if (*((void *)v5 + 29)) {
    -[MIPMediaItem setCloudUniversalLibraryId:](self, "setCloudUniversalLibraryId:");
  }
  uint64_t v18 = *((void *)v5 + 62);
  if ((v18 & 0x20000) != 0)
  {
    self->_reportingStoreItemId = *((void *)v5 + 18);
    *(void *)&self->_has |= 0x20000uLL;
    uint64_t v18 = *((void *)v5 + 62);
  }
  if ((v18 & 2) != 0)
  {
    self->_assetStoreItemId = *((void *)v5 + 2);
    *(void *)&self->_has |= 2uLL;
  }
  song = self->_song;
  uint64_t v20 = *((void *)v5 + 53);
  if (song)
  {
    if (v20) {
      -[MIPSong mergeFrom:](song, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[MIPMediaItem setSong:](self, "setSong:");
  }
  movie = self->_movie;
  uint64_t v22 = *((void *)v5 + 42);
  if (movie)
  {
    if (v22) {
      -[MIPMovie mergeFrom:](movie, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[MIPMediaItem setMovie:](self, "setMovie:");
  }
  tvShow = self->_tvShow;
  uint64_t v24 = *((void *)v5 + 59);
  if (tvShow)
  {
    if (v24) {
      -[MIPTVShow mergeFrom:](tvShow, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[MIPMediaItem setTvShow:](self, "setTvShow:");
  }
  podcast = self->_podcast;
  uint64_t v26 = *((void *)v5 + 45);
  if (podcast)
  {
    if (v26) {
      -[MIPPodcast mergeFrom:](podcast, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[MIPMediaItem setPodcast:](self, "setPodcast:");
  }
  audiobook = self->_audiobook;
  uint64_t v28 = *((void *)v5 + 25);
  if (audiobook)
  {
    if (v28) {
      -[MIPAudiobook mergeFrom:](audiobook, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[MIPMediaItem setAudiobook:](self, "setAudiobook:");
  }
}

- (unint64_t)hash
{
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0) {
    uint64_t v88 = 2654435761 * self->_mediaType;
  }
  else {
    uint64_t v88 = 0;
  }
  NSUInteger v87 = [(NSString *)self->_title hash];
  NSUInteger v86 = [(NSString *)self->_sortTitle hash];
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    uint64_t v85 = 2654435761 * self->_releaseDateTime;
    if ((*(unsigned char *)&has & 8) != 0)
    {
LABEL_6:
      uint64_t v84 = 2654435761 * self->_creationDateTime;
      if ((*(_WORD *)&has & 0x2000) != 0) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v85 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v84 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_7:
    uint64_t v83 = 2654435761 * self->_modificationDateTime;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v83 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_8:
    uint64_t v82 = 2654435761 * self->_fileSize;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v82 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v81 = 2654435761 * self->_duration;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_10;
    }
LABEL_17:
    uint64_t v80 = 0;
    if ((*(void *)&has & 0x40000000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v81 = 0;
  if ((*(_DWORD *)&has & 0x4000000) == 0) {
    goto LABEL_17;
  }
LABEL_10:
  uint64_t v80 = 2654435761 * self->_contentRating;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
LABEL_11:
    uint64_t v79 = 2654435761 * self->_explicitContent;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v79 = 0;
LABEL_19:
  NSUInteger v78 = [(NSString *)self->_shortDescription hash];
  NSUInteger v77 = [(NSString *)self->_longDescription hash];
  NSUInteger v76 = [(NSString *)self->_copyright hash];
  NSUInteger v75 = [(NSString *)self->_artworkId hash];
  $20C9AD10F7A062A4D81634BCAF627925 v4 = self->_has;
  if ((*(void *)&v4 & 0x10000000000) != 0)
  {
    uint64_t v74 = 2654435761 * self->_year;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v74 = 0;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0)
    {
LABEL_21:
      uint64_t v73 = 2654435761 * self->_contentRatingLevel;
      goto LABEL_24;
    }
  }
  uint64_t v73 = 0;
LABEL_24:
  NSUInteger v72 = [(NSString *)self->_comment hash];
  $20C9AD10F7A062A4D81634BCAF627925 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000000) != 0)
  {
    uint64_t v71 = 2654435761 * self->_fileKind;
    if ((*(_WORD *)&v5 & 0x100) != 0)
    {
LABEL_26:
      uint64_t v70 = 2654435761 * self->_familyAccountId;
      if ((*(_DWORD *)&v5 & 0x10000000) != 0) {
        goto LABEL_27;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v71 = 0;
    if ((*(_WORD *)&v5 & 0x100) != 0) {
      goto LABEL_26;
    }
  }
  uint64_t v70 = 0;
  if ((*(_DWORD *)&v5 & 0x10000000) != 0)
  {
LABEL_27:
    uint64_t v69 = 2654435761 * self->_drmVersionsCode;
    if ((*(unsigned char *)&v5 & 0x40) != 0) {
      goto LABEL_28;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v69 = 0;
  if ((*(unsigned char *)&v5 & 0x40) != 0)
  {
LABEL_28:
    uint64_t v68 = 2654435761 * self->_drmPlatformIdCode;
    if ((*(unsigned char *)&v5 & 0x10) != 0) {
      goto LABEL_29;
    }
LABEL_35:
    uint64_t v67 = 0;
    if ((*(unsigned char *)&v5 & 0x20) != 0) {
      goto LABEL_30;
    }
    goto LABEL_36;
  }
LABEL_34:
  uint64_t v68 = 0;
  if ((*(unsigned char *)&v5 & 0x10) == 0) {
    goto LABEL_35;
  }
LABEL_29:
  uint64_t v67 = 2654435761 * self->_drmKey1IdCode;
  if ((*(unsigned char *)&v5 & 0x20) != 0)
  {
LABEL_30:
    uint64_t v66 = 2654435761 * self->_drmKey2IdCode;
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v66 = 0;
LABEL_37:
  NSUInteger v65 = [(NSString *)self->_chapterMetadataUrl hash];
  NSUInteger v64 = [(NSString *)self->_storeAssetFlavor hash];
  NSUInteger v63 = [(NSString *)self->_extrasUrl hash];
  $20C9AD10F7A062A4D81634BCAF627925 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
    uint64_t v62 = 2654435761 * self->_purchaseDateTime;
    if ((*(_DWORD *)&v6 & 0x2000000) != 0)
    {
LABEL_39:
      uint64_t v61 = 2654435761 * self->_cloudStatus;
      if ((*(void *)&v6 & 0x100000000) != 0) {
        goto LABEL_40;
      }
      goto LABEL_53;
    }
  }
  else
  {
    uint64_t v62 = 0;
    if ((*(_DWORD *)&v6 & 0x2000000) != 0) {
      goto LABEL_39;
    }
  }
  uint64_t v61 = 0;
  if ((*(void *)&v6 & 0x100000000) != 0)
  {
LABEL_40:
    uint64_t v60 = 2654435761 * self->_playCount;
    if ((*(void *)&v6 & 0x200000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v60 = 0;
  if ((*(void *)&v6 & 0x200000000) != 0)
  {
LABEL_41:
    uint64_t v59 = 2654435761 * self->_playCountDelta;
    if ((*(_WORD *)&v6 & 0x400) != 0) {
      goto LABEL_42;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v59 = 0;
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
LABEL_42:
    uint64_t v58 = 2654435761 * self->_lastPlayedDateTime;
    if ((*(void *)&v6 & 0x2000000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v58 = 0;
  if ((*(void *)&v6 & 0x2000000000) != 0)
  {
LABEL_43:
    uint64_t v57 = 2654435761 * self->_skipCount;
    if ((*(void *)&v6 & 0x4000000000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v57 = 0;
  if ((*(void *)&v6 & 0x4000000000) != 0)
  {
LABEL_44:
    uint64_t v56 = 2654435761 * self->_skipCountDelta;
    if ((*(_WORD *)&v6 & 0x800) != 0) {
      goto LABEL_45;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v56 = 0;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_45:
    uint64_t v55 = 2654435761 * self->_lastSkippedDateTime;
    if ((*(void *)&v6 & 0x8000000000000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v55 = 0;
  if ((*(void *)&v6 & 0x8000000000000) != 0)
  {
LABEL_46:
    uint64_t v54 = 2654435761 * self->_rememberBookmark;
    if ((*(unsigned char *)&v6 & 4) != 0) {
      goto LABEL_47;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v54 = 0;
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
LABEL_47:
    uint64_t v53 = 2654435761 * self->_bookmarkTimeMilliseconds;
    if ((*(void *)&v6 & 0x200000000000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v53 = 0;
  if ((*(void *)&v6 & 0x200000000000) != 0)
  {
LABEL_48:
    uint64_t v52 = 2654435761 * self->_hidden;
    if ((*(_DWORD *)&v6 & 0x100000) != 0) {
      goto LABEL_49;
    }
LABEL_62:
    uint64_t v51 = 0;
    if ((*(void *)&v6 & 0x100000000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_63;
  }
LABEL_61:
  uint64_t v52 = 0;
  if ((*(_DWORD *)&v6 & 0x100000) == 0) {
    goto LABEL_62;
  }
LABEL_49:
  uint64_t v51 = 2654435761 * self->_storePlaylistId;
  if ((*(void *)&v6 & 0x100000000000) != 0)
  {
LABEL_50:
    uint64_t v50 = 2654435761 * self->_hasLocalAsset;
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v50 = 0;
LABEL_64:
  NSUInteger v49 = [(NSString *)self->_grouping hash];
  $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
    uint64_t v48 = 2654435761 * self->_likedState;
    if ((*(void *)&v7 & 0x4000000000000) != 0)
    {
LABEL_66:
      uint64_t v47 = 2654435761 * self->_needsReporting;
      if ((*(void *)&v7 & 0x2000000000000) != 0) {
        goto LABEL_67;
      }
      goto LABEL_79;
    }
  }
  else
  {
    uint64_t v48 = 0;
    if ((*(void *)&v7 & 0x4000000000000) != 0) {
      goto LABEL_66;
    }
  }
  uint64_t v47 = 0;
  if ((*(void *)&v7 & 0x2000000000000) != 0)
  {
LABEL_67:
    uint64_t v46 = 2654435761 * self->_likedStateChanged;
    if ((*(void *)&v7 & 0x800000000000) != 0) {
      goto LABEL_68;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v46 = 0;
  if ((*(void *)&v7 & 0x800000000000) != 0)
  {
LABEL_68:
    uint64_t v45 = 2654435761 * self->_isInUsersLibrary;
    if ((*(void *)&v7 & 0x20000000000) != 0) {
      goto LABEL_69;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v45 = 0;
  if ((*(void *)&v7 & 0x20000000000) != 0)
  {
LABEL_69:
    uint64_t v44 = 2654435761 * self->_cloudAssetAvailable;
    if ((*(void *)&v7 & 0x8000000000) != 0) {
      goto LABEL_70;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v44 = 0;
  if ((*(void *)&v7 & 0x8000000000) != 0)
  {
LABEL_70:
    uint64_t v43 = 2654435761 * self->_storeProtectionType;
    if ((*(void *)&v7 & 0x10000000000000) != 0) {
      goto LABEL_71;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v43 = 0;
  if ((*(void *)&v7 & 0x10000000000000) != 0)
  {
LABEL_71:
    uint64_t v42 = 2654435761 * self->_userDisabled;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0) {
      goto LABEL_72;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v42 = 0;
  if ((*(_DWORD *)&v7 & 0x1000000) != 0)
  {
LABEL_72:
    uint64_t v41 = 2654435761 * self->_cloudPlaybackEndpointType;
    if ((*(void *)&v7 & 0x400000000) != 0) {
      goto LABEL_73;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v41 = 0;
  if ((*(void *)&v7 & 0x400000000) != 0)
  {
LABEL_73:
    uint64_t v40 = 2654435761 * self->_playbackEndpointType;
    if ((*(_DWORD *)&v7 & 0x800000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_86;
  }
LABEL_85:
  uint64_t v40 = 0;
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
LABEL_74:
    uint64_t v39 = 2654435761 * self->_cloudMatchedStatus;
    if ((*(void *)&v7 & 0x400000000000) != 0) {
      goto LABEL_75;
    }
LABEL_87:
    uint64_t v38 = 0;
    if ((*(void *)&v7 & 0x1000000000) != 0) {
      goto LABEL_76;
    }
    goto LABEL_88;
  }
LABEL_86:
  uint64_t v39 = 0;
  if ((*(void *)&v7 & 0x400000000000) == 0) {
    goto LABEL_87;
  }
LABEL_75:
  uint64_t v38 = 2654435761 * self->_inUsersCloudLibrary;
  if ((*(void *)&v7 & 0x1000000000) != 0)
  {
LABEL_76:
    uint64_t v37 = 2654435761 * self->_secondaryArtworkSourceType;
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v37 = 0;
LABEL_89:
  NSUInteger v36 = [(NSString *)self->_secondaryArtworkId hash];
  if ((*((unsigned char *)&self->_has + 5) & 8) != 0) {
    uint64_t v35 = 2654435761 * self->_hasChapterData;
  }
  else {
    uint64_t v35 = 0;
  }
  uint64_t v34 = [(NSData *)self->_flattenedChapterData hash];
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x1000000000000) != 0)
  {
    uint64_t v33 = 2654435761 * self->_isPreorder;
    if ((*(_WORD *)&v8 & 0x1000) != 0) {
      goto LABEL_94;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((*(_WORD *)&v8 & 0x1000) != 0)
    {
LABEL_94:
      uint64_t v32 = 2654435761 * self->_likedStateChangedDate;
      goto LABEL_97;
    }
  }
  uint64_t v32 = 0;
LABEL_97:
  uint64_t v31 = [(NSMutableArray *)self->_libraryIdentifiers hash];
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) != 0)
  {
    uint64_t v30 = 2654435761 * self->_storeId;
    if ((*(_DWORD *)&v9 & 0x200000) != 0)
    {
LABEL_99:
      uint64_t v29 = 2654435761 * self->_storefrontId;
      if (*(unsigned char *)&v9) {
        goto LABEL_100;
      }
      goto LABEL_105;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if ((*(_DWORD *)&v9 & 0x200000) != 0) {
      goto LABEL_99;
    }
  }
  uint64_t v29 = 0;
  if (*(unsigned char *)&v9)
  {
LABEL_100:
    uint64_t v27 = 2654435761 * self->_accountId;
    if ((*(_WORD *)&v9 & 0x8000) != 0) {
      goto LABEL_101;
    }
LABEL_106:
    uint64_t v10 = 0;
    if ((*(void *)&v9 & 0x800000000) != 0) {
      goto LABEL_102;
    }
    goto LABEL_107;
  }
LABEL_105:
  uint64_t v27 = 0;
  if ((*(_WORD *)&v9 & 0x8000) == 0) {
    goto LABEL_106;
  }
LABEL_101:
  uint64_t v10 = 2654435761 * self->_purchaseHistoryId;
  if ((*(void *)&v9 & 0x800000000) != 0)
  {
LABEL_102:
    uint64_t v11 = 2654435761 * self->_purchaseHistoryToken;
    goto LABEL_108;
  }
LABEL_107:
  uint64_t v11 = 0;
LABEL_108:
  NSUInteger v12 = [(NSString *)self->_purchaseHistoryRedownloadParams hash];
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    uint64_t v13 = 2654435761 * self->_sagaId;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_sagaRedownloadParams hash];
  NSUInteger v15 = [(NSString *)self->_storeXID hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    uint64_t v16 = 2654435761 * self->_subscriptionStoreItemId;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_cloudUniversalLibraryId hash];
  $20C9AD10F7A062A4D81634BCAF627925 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000) != 0)
  {
    uint64_t v19 = 2654435761 * self->_reportingStoreItemId;
    if ((*(unsigned char *)&v18 & 2) != 0) {
      goto LABEL_116;
    }
LABEL_118:
    uint64_t v20 = 0;
    goto LABEL_119;
  }
  uint64_t v19 = 0;
  if ((*(unsigned char *)&v18 & 2) == 0) {
    goto LABEL_118;
  }
LABEL_116:
  uint64_t v20 = 2654435761 * self->_assetStoreItemId;
LABEL_119:
  NSUInteger v21 = v87 ^ v88 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20;
  unint64_t v22 = [(MIPSong *)self->_song hash];
  unint64_t v23 = v22 ^ [(MIPMovie *)self->_movie hash];
  unint64_t v24 = v23 ^ [(MIPTVShow *)self->_tvShow hash];
  unint64_t v25 = v24 ^ [(MIPPodcast *)self->_podcast hash];
  return v21 ^ v25 ^ [(MIPAudiobook *)self->_audiobook hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_356;
  }
  uint64_t v5 = *((void *)v4 + 62);
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    if ((v5 & 0x80000000) == 0 || self->_mediaType != *((_DWORD *)v4 + 82)) {
      goto LABEL_356;
    }
  }
  else if ((v5 & 0x80000000) != 0)
  {
    goto LABEL_356;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 58) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_356;
  }
  sortTitle = self->_sortTitle;
  if ((unint64_t)sortTitle | *((void *)v4 + 54))
  {
    if (!-[NSString isEqual:](sortTitle, "isEqual:")) {
      goto LABEL_356;
    }
  }
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  uint64_t v9 = *((void *)v4 + 62);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_releaseDateTime != *((void *)v4 + 17)) {
      goto LABEL_356;
    }
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_creationDateTime != *((void *)v4 + 4)) {
      goto LABEL_356;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_modificationDateTime != *((void *)v4 + 14)) {
      goto LABEL_356;
    }
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_fileSize != *((void *)v4 + 10)) {
      goto LABEL_356;
    }
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_356;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_duration != *((void *)v4 + 8)) {
      goto LABEL_356;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v9 & 0x4000000) == 0 || self->_contentRating != *((_DWORD *)v4 + 62)) {
      goto LABEL_356;
    }
  }
  else if ((v9 & 0x4000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v9 & 0x40000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_explicitContent)
    {
      if (!*((unsigned char *)v4 + 485)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 485))
    {
      goto LABEL_356;
    }
  }
  else if ((v9 & 0x40000000000) != 0)
  {
    goto LABEL_356;
  }
  shortDescription = self->_shortDescription;
  if ((unint64_t)shortDescription | *((void *)v4 + 51)
    && !-[NSString isEqual:](shortDescription, "isEqual:"))
  {
    goto LABEL_356;
  }
  longDescription = self->_longDescription;
  if ((unint64_t)longDescription | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](longDescription, "isEqual:")) {
      goto LABEL_356;
    }
  }
  copyright = self->_copyright;
  if ((unint64_t)copyright | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](copyright, "isEqual:")) {
      goto LABEL_356;
    }
  }
  artworkId = self->_artworkId;
  if ((unint64_t)artworkId | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](artworkId, "isEqual:")) {
      goto LABEL_356;
    }
  }
  $20C9AD10F7A062A4D81634BCAF627925 v14 = self->_has;
  uint64_t v15 = *((void *)v4 + 62);
  if ((*(void *)&v14 & 0x10000000000) != 0)
  {
    if ((v15 & 0x10000000000) == 0 || self->_year != *((_DWORD *)v4 + 120)) {
      goto LABEL_356;
    }
  }
  else if ((v15 & 0x10000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    if ((v15 & 0x8000000) == 0 || self->_contentRatingLevel != *((_DWORD *)v4 + 63)) {
      goto LABEL_356;
    }
  }
  else if ((v15 & 0x8000000) != 0)
  {
    goto LABEL_356;
  }
  comment = self->_comment;
  if ((unint64_t)comment | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](comment, "isEqual:")) {
      goto LABEL_356;
    }
    $20C9AD10F7A062A4D81634BCAF627925 v14 = self->_has;
    uint64_t v15 = *((void *)v4 + 62);
  }
  if ((*(_DWORD *)&v14 & 0x20000000) != 0)
  {
    if ((v15 & 0x20000000) == 0 || self->_fileKind != *((_DWORD *)v4 + 70)) {
      goto LABEL_356;
    }
  }
  else if ((v15 & 0x20000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_familyAccountId != *((void *)v4 + 9)) {
      goto LABEL_356;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    if ((v15 & 0x10000000) == 0 || self->_drmVersionsCode != *((_DWORD *)v4 + 66)) {
      goto LABEL_356;
    }
  }
  else if ((v15 & 0x10000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_drmPlatformIdCode != *((void *)v4 + 7)) {
      goto LABEL_356;
    }
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_356;
  }
  if ((*(unsigned char *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_drmKey1IdCode != *((void *)v4 + 5)) {
      goto LABEL_356;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_356;
  }
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_drmKey2IdCode != *((void *)v4 + 6)) {
      goto LABEL_356;
    }
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_356;
  }
  chapterMetadataUrl = self->_chapterMetadataUrl;
  if ((unint64_t)chapterMetadataUrl | *((void *)v4 + 26)
    && !-[NSString isEqual:](chapterMetadataUrl, "isEqual:"))
  {
    goto LABEL_356;
  }
  storeAssetFlavor = self->_storeAssetFlavor;
  if ((unint64_t)storeAssetFlavor | *((void *)v4 + 55))
  {
    if (!-[NSString isEqual:](storeAssetFlavor, "isEqual:")) {
      goto LABEL_356;
    }
  }
  extrasUrl = self->_extrasUrl;
  if ((unint64_t)extrasUrl | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](extrasUrl, "isEqual:")) {
      goto LABEL_356;
    }
  }
  $20C9AD10F7A062A4D81634BCAF627925 v20 = self->_has;
  uint64_t v21 = *((void *)v4 + 62);
  if ((*(_WORD *)&v20 & 0x4000) != 0)
  {
    if ((v21 & 0x4000) == 0 || self->_purchaseDateTime != *((void *)v4 + 15)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x4000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x2000000) != 0)
  {
    if ((v21 & 0x2000000) == 0 || self->_cloudStatus != *((_DWORD *)v4 + 56)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x2000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x100000000) != 0)
  {
    if ((v21 & 0x100000000) == 0 || self->_playCount != *((_DWORD *)v4 + 86)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x100000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x200000000) != 0)
  {
    if ((v21 & 0x200000000) == 0 || self->_playCountDelta != *((_DWORD *)v4 + 87)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x200000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v20 & 0x400) != 0)
  {
    if ((v21 & 0x400) == 0 || self->_lastPlayedDateTime != *((void *)v4 + 11)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x400) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x2000000000) != 0)
  {
    if ((v21 & 0x2000000000) == 0 || self->_skipCount != *((_DWORD *)v4 + 104)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x2000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x4000000000) != 0)
  {
    if ((v21 & 0x4000000000) == 0 || self->_skipCountDelta != *((_DWORD *)v4 + 105)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x4000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v20 & 0x800) != 0)
  {
    if ((v21 & 0x800) == 0 || self->_lastSkippedDateTime != *((void *)v4 + 12)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x800) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x8000000000000) != 0)
  {
    if ((v21 & 0x8000000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_rememberBookmark)
    {
      if (!*((unsigned char *)v4 + 494)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 494))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x8000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(unsigned char *)&v20 & 4) != 0)
  {
    if ((v21 & 4) == 0 || self->_bookmarkTimeMilliseconds != *((void *)v4 + 3)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 4) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x200000000000) != 0)
  {
    if ((v21 & 0x200000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_hidden)
    {
      if (!*((unsigned char *)v4 + 488)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 488))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x200000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x100000) != 0)
  {
    if ((v21 & 0x100000) == 0 || self->_storePlaylistId != *((void *)v4 + 21)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x100000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x100000000000) != 0)
  {
    if ((v21 & 0x100000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_hasLocalAsset)
    {
      if (!*((unsigned char *)v4 + 487)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 487))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x100000000000) != 0)
  {
    goto LABEL_356;
  }
  grouping = self->_grouping;
  if ((unint64_t)grouping | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](grouping, "isEqual:")) {
      goto LABEL_356;
    }
    $20C9AD10F7A062A4D81634BCAF627925 v20 = self->_has;
    uint64_t v21 = *((void *)v4 + 62);
  }
  if ((*(_DWORD *)&v20 & 0x40000000) != 0)
  {
    if ((v21 & 0x40000000) == 0 || self->_likedState != *((_DWORD *)v4 + 78)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x40000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x4000000000000) != 0)
  {
    if ((v21 & 0x4000000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_needsReporting)
    {
      if (!*((unsigned char *)v4 + 493)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 493))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x4000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x2000000000000) != 0)
  {
    if ((v21 & 0x2000000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_likedStateChanged)
    {
      if (!*((unsigned char *)v4 + 492)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 492))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x2000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x800000000000) != 0)
  {
    if ((v21 & 0x800000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_isInUsersLibrary)
    {
      if (!*((unsigned char *)v4 + 490)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 490))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x800000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x20000000000) != 0)
  {
    if ((v21 & 0x20000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_cloudAssetAvailable)
    {
      if (!*((unsigned char *)v4 + 484)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 484))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x20000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x8000000000) != 0)
  {
    if ((v21 & 0x8000000000) == 0 || self->_storeProtectionType != *((_DWORD *)v4 + 112)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x8000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x10000000000000) != 0)
  {
    if ((v21 & 0x10000000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_userDisabled)
    {
      if (!*((unsigned char *)v4 + 495)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 495))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x10000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x1000000) != 0)
  {
    if ((v21 & 0x1000000) == 0 || self->_cloudPlaybackEndpointType != *((_DWORD *)v4 + 55)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x1000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x400000000) != 0)
  {
    if ((v21 & 0x400000000) == 0 || self->_playbackEndpointType != *((_DWORD *)v4 + 88)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x400000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x800000) != 0)
  {
    if ((v21 & 0x800000) == 0 || self->_cloudMatchedStatus != *((_DWORD *)v4 + 54)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x800000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x400000000000) != 0)
  {
    if ((v21 & 0x400000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_inUsersCloudLibrary)
    {
      if (!*((unsigned char *)v4 + 489)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 489))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x400000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x1000000000) != 0)
  {
    if ((v21 & 0x1000000000) == 0 || self->_secondaryArtworkSourceType != *((_DWORD *)v4 + 100)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x1000000000) != 0)
  {
    goto LABEL_356;
  }
  secondaryArtworkId = self->_secondaryArtworkId;
  if ((unint64_t)secondaryArtworkId | *((void *)v4 + 49))
  {
    if (!-[NSString isEqual:](secondaryArtworkId, "isEqual:")) {
      goto LABEL_356;
    }
    $20C9AD10F7A062A4D81634BCAF627925 v20 = self->_has;
    uint64_t v21 = *((void *)v4 + 62);
  }
  if ((*(void *)&v20 & 0x80000000000) != 0)
  {
    if ((v21 & 0x80000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_hasChapterData)
    {
      if (!*((unsigned char *)v4 + 486)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 486))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x80000000000) != 0)
  {
    goto LABEL_356;
  }
  flattenedChapterData = self->_flattenedChapterData;
  if ((unint64_t)flattenedChapterData | *((void *)v4 + 36))
  {
    if (!-[NSData isEqual:](flattenedChapterData, "isEqual:")) {
      goto LABEL_356;
    }
    $20C9AD10F7A062A4D81634BCAF627925 v20 = self->_has;
    uint64_t v21 = *((void *)v4 + 62);
  }
  if ((*(void *)&v20 & 0x1000000000000) != 0)
  {
    if ((v21 & 0x1000000000000) == 0) {
      goto LABEL_356;
    }
    if (self->_isPreorder)
    {
      if (!*((unsigned char *)v4 + 491)) {
        goto LABEL_356;
      }
    }
    else if (*((unsigned char *)v4 + 491))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x1000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v20 & 0x1000) != 0)
  {
    if ((v21 & 0x1000) == 0 || self->_likedStateChangedDate != *((void *)v4 + 13)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x1000) != 0)
  {
    goto LABEL_356;
  }
  libraryIdentifiers = self->_libraryIdentifiers;
  if ((unint64_t)libraryIdentifiers | *((void *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](libraryIdentifiers, "isEqual:")) {
      goto LABEL_356;
    }
    $20C9AD10F7A062A4D81634BCAF627925 v20 = self->_has;
    uint64_t v21 = *((void *)v4 + 62);
  }
  if ((*(_DWORD *)&v20 & 0x80000) != 0)
  {
    if ((v21 & 0x80000) == 0 || self->_storeId != *((void *)v4 + 20)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x80000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x200000) != 0)
  {
    if ((v21 & 0x200000) == 0 || self->_storefrontId != *((void *)v4 + 22)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x200000) != 0)
  {
    goto LABEL_356;
  }
  if (*(unsigned char *)&v20)
  {
    if ((v21 & 1) == 0 || self->_accountId != *((void *)v4 + 1)) {
      goto LABEL_356;
    }
  }
  else if (v21)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v20 & 0x8000) != 0)
  {
    if ((v21 & 0x8000) == 0 || self->_purchaseHistoryId != *((void *)v4 + 16)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x8000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(void *)&v20 & 0x800000000) != 0)
  {
    if ((v21 & 0x800000000) == 0 || self->_purchaseHistoryToken != *((_DWORD *)v4 + 94)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x800000000) != 0)
  {
    goto LABEL_356;
  }
  purchaseHistoryRedownloadParams = self->_purchaseHistoryRedownloadParams;
  if ((unint64_t)purchaseHistoryRedownloadParams | *((void *)v4 + 46))
  {
    if (!-[NSString isEqual:](purchaseHistoryRedownloadParams, "isEqual:")) {
      goto LABEL_356;
    }
    $20C9AD10F7A062A4D81634BCAF627925 v20 = self->_has;
    uint64_t v21 = *((void *)v4 + 62);
  }
  if ((*(_DWORD *)&v20 & 0x40000) != 0)
  {
    if ((v21 & 0x40000) == 0 || self->_sagaId != *((void *)v4 + 19)) {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x40000) != 0)
  {
    goto LABEL_356;
  }
  sagaRedownloadParams = self->_sagaRedownloadParams;
  if ((unint64_t)sagaRedownloadParams | *((void *)v4 + 48)
    && !-[NSString isEqual:](sagaRedownloadParams, "isEqual:"))
  {
    goto LABEL_356;
  }
  storeXID = self->_storeXID;
  if ((unint64_t)storeXID | *((void *)v4 + 57))
  {
    if (!-[NSString isEqual:](storeXID, "isEqual:")) {
      goto LABEL_356;
    }
  }
  $20C9AD10F7A062A4D81634BCAF627925 v29 = self->_has;
  uint64_t v30 = *((void *)v4 + 62);
  if ((*(_DWORD *)&v29 & 0x400000) != 0)
  {
    if ((v30 & 0x400000) == 0 || self->_subscriptionStoreItemId != *((void *)v4 + 23)) {
      goto LABEL_356;
    }
  }
  else if ((v30 & 0x400000) != 0)
  {
    goto LABEL_356;
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if ((unint64_t)cloudUniversalLibraryId | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](cloudUniversalLibraryId, "isEqual:")) {
      goto LABEL_356;
    }
    $20C9AD10F7A062A4D81634BCAF627925 v29 = self->_has;
    uint64_t v30 = *((void *)v4 + 62);
  }
  if ((*(_DWORD *)&v29 & 0x20000) != 0)
  {
    if ((v30 & 0x20000) == 0 || self->_reportingStoreItemId != *((void *)v4 + 18)) {
      goto LABEL_356;
    }
  }
  else if ((v30 & 0x20000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(unsigned char *)&v29 & 2) == 0)
  {
    if ((v30 & 2) == 0) {
      goto LABEL_346;
    }
LABEL_356:
    char v37 = 0;
    goto LABEL_357;
  }
  if ((v30 & 2) == 0 || self->_assetStoreItemId != *((void *)v4 + 2)) {
    goto LABEL_356;
  }
LABEL_346:
  song = self->_song;
  if ((unint64_t)song | *((void *)v4 + 53) && !-[MIPSong isEqual:](song, "isEqual:")) {
    goto LABEL_356;
  }
  movie = self->_movie;
  if ((unint64_t)movie | *((void *)v4 + 42))
  {
    if (!-[MIPMovie isEqual:](movie, "isEqual:")) {
      goto LABEL_356;
    }
  }
  tvShow = self->_tvShow;
  if ((unint64_t)tvShow | *((void *)v4 + 59))
  {
    if (!-[MIPTVShow isEqual:](tvShow, "isEqual:")) {
      goto LABEL_356;
    }
  }
  podcast = self->_podcast;
  if ((unint64_t)podcast | *((void *)v4 + 45))
  {
    if (!-[MIPPodcast isEqual:](podcast, "isEqual:")) {
      goto LABEL_356;
    }
  }
  audiobook = self->_audiobook;
  if ((unint64_t)audiobook | *((void *)v4 + 25)) {
    char v37 = -[MIPAudiobook isEqual:](audiobook, "isEqual:");
  }
  else {
    char v37 = 1;
  }
LABEL_357:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 328) = self->_mediaType;
    *(void *)(v5 + 496) |= 0x80000000uLL;
  }
  uint64_t v7 = [(NSString *)self->_title copyWithZone:a3];
  $20C9AD10F7A062A4D81634BCAF627925 v8 = *(void **)(v6 + 464);
  *(void *)(v6 + 464) = v7;

  uint64_t v9 = [(NSString *)self->_sortTitle copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 432);
  *(void *)(v6 + 432) = v9;

  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(void *)(v6 + 136) = self->_releaseDateTime;
    *(void *)(v6 + 496) |= 0x10000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_79;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 32) = self->_creationDateTime;
  *(void *)(v6 + 496) |= 8uLL;
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(void *)(v6 + 112) = self->_modificationDateTime;
  *(void *)(v6 + 496) |= 0x2000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(void *)(v6 + 80) = self->_fileSize;
  *(void *)(v6 + 496) |= 0x200uLL;
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(void *)(v6 + 64) = self->_duration;
  *(void *)(v6 + 496) |= 0x80uLL;
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_82:
  *(_DWORD *)(v6 + 248) = self->_contentRating;
  *(void *)(v6 + 496) |= 0x4000000uLL;
  if ((*(void *)&self->_has & 0x40000000000) != 0)
  {
LABEL_10:
    *(unsigned char *)(v6 + 485) = self->_explicitContent;
    *(void *)(v6 + 496) |= 0x40000000000uLL;
  }
LABEL_11:
  uint64_t v12 = [(NSString *)self->_shortDescription copyWithZone:a3];
  uint64_t v13 = *(void **)(v6 + 408);
  *(void *)(v6 + 408) = v12;

  uint64_t v14 = [(NSString *)self->_longDescription copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 320);
  *(void *)(v6 + 320) = v14;

  uint64_t v16 = [(NSString *)self->_copyright copyWithZone:a3];
  NSUInteger v17 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = v16;

  uint64_t v18 = [(NSString *)self->_artworkId copyWithZone:a3];
  uint64_t v19 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v18;

  $20C9AD10F7A062A4D81634BCAF627925 v20 = self->_has;
  if ((*(void *)&v20 & 0x10000000000) != 0)
  {
    *(_DWORD *)(v6 + 480) = self->_year;
    *(void *)(v6 + 496) |= 0x10000000000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v20 = self->_has;
  }
  if ((*(_DWORD *)&v20 & 0x8000000) != 0)
  {
    *(_DWORD *)(v6 + 252) = self->_contentRatingLevel;
    *(void *)(v6 + 496) |= 0x8000000uLL;
  }
  uint64_t v21 = [(NSString *)self->_comment copyWithZone:a3];
  unint64_t v22 = *(void **)(v6 + 240);
  *(void *)(v6 + 240) = v21;

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x20000000) != 0)
  {
    *(_DWORD *)(v6 + 280) = self->_fileKind;
    *(void *)(v6 + 496) |= 0x20000000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
    if ((*(_WORD *)&v23 & 0x100) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&v23 & 0x10000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_86;
    }
  }
  else if ((*(_WORD *)&v23 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  *(void *)(v6 + 72) = self->_familyAccountId;
  *(void *)(v6 + 496) |= 0x100uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x10000000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v23 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v6 + 264) = self->_drmVersionsCode;
  *(void *)(v6 + 496) |= 0x10000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(unsigned char *)&v23 & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v23 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(void *)(v6 + 56) = self->_drmPlatformIdCode;
  *(void *)(v6 + 496) |= 0x40uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(unsigned char *)&v23 & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v23 & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_88:
  *(void *)(v6 + 40) = self->_drmKey1IdCode;
  *(void *)(v6 + 496) |= 0x10uLL;
  if ((*(void *)&self->_has & 0x20) != 0)
  {
LABEL_21:
    *(void *)(v6 + 48) = self->_drmKey2IdCode;
    *(void *)(v6 + 496) |= 0x20uLL;
  }
LABEL_22:
  uint64_t v24 = [(NSString *)self->_chapterMetadataUrl copyWithZone:a3];
  unint64_t v25 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v24;

  uint64_t v26 = [(NSString *)self->_storeAssetFlavor copyWithZone:a3];
  uint64_t v27 = *(void **)(v6 + 440);
  *(void *)(v6 + 440) = v26;

  uint64_t v28 = [(NSString *)self->_extrasUrl copyWithZone:a3];
  $20C9AD10F7A062A4D81634BCAF627925 v29 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v28;

  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x4000) != 0)
  {
    *(void *)(v6 + 120) = self->_purchaseDateTime;
    *(void *)(v6 + 496) |= 0x4000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
    if ((*(_DWORD *)&v30 & 0x2000000) == 0)
    {
LABEL_24:
      if ((*(void *)&v30 & 0x100000000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_92;
    }
  }
  else if ((*(_DWORD *)&v30 & 0x2000000) == 0)
  {
    goto LABEL_24;
  }
  *(_DWORD *)(v6 + 224) = self->_cloudStatus;
  *(void *)(v6 + 496) |= 0x2000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(void *)&v30 & 0x100000000) == 0)
  {
LABEL_25:
    if ((*(void *)&v30 & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v6 + 344) = self->_playCount;
  *(void *)(v6 + 496) |= 0x100000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(void *)&v30 & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v30 & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v6 + 348) = self->_playCountDelta;
  *(void *)(v6 + 496) |= 0x200000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x400) == 0)
  {
LABEL_27:
    if ((*(void *)&v30 & 0x2000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(void *)(v6 + 88) = self->_lastPlayedDateTime;
  *(void *)(v6 + 496) |= 0x400uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(void *)&v30 & 0x2000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&v30 & 0x4000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v6 + 416) = self->_skipCount;
  *(void *)(v6 + 496) |= 0x2000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(void *)&v30 & 0x4000000000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v30 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(_DWORD *)(v6 + 420) = self->_skipCountDelta;
  *(void *)(v6 + 496) |= 0x4000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x800) == 0)
  {
LABEL_30:
    if ((*(void *)&v30 & 0x8000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(void *)(v6 + 96) = self->_lastSkippedDateTime;
  *(void *)(v6 + 496) |= 0x800uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(void *)&v30 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v30 & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(unsigned char *)(v6 + 494) = self->_rememberBookmark;
  *(void *)(v6 + 496) |= 0x8000000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(unsigned char *)&v30 & 4) == 0)
  {
LABEL_32:
    if ((*(void *)&v30 & 0x200000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(void *)(v6 + 24) = self->_bookmarkTimeMilliseconds;
  *(void *)(v6 + 496) |= 4uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(void *)&v30 & 0x200000000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v30 & 0x100000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(unsigned char *)(v6 + 488) = self->_hidden;
  *(void *)(v6 + 496) |= 0x200000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x100000) == 0)
  {
LABEL_34:
    if ((*(void *)&v30 & 0x100000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_101:
  *(void *)(v6 + 168) = self->_storePlaylistId;
  *(void *)(v6 + 496) |= 0x100000uLL;
  if ((*(void *)&self->_has & 0x100000000000) != 0)
  {
LABEL_35:
    *(unsigned char *)(v6 + 487) = self->_hasLocalAsset;
    *(void *)(v6 + 496) |= 0x100000000000uLL;
  }
LABEL_36:
  uint64_t v31 = [(NSString *)self->_grouping copyWithZone:a3];
  uint64_t v32 = *(void **)(v6 + 296);
  *(void *)(v6 + 296) = v31;

  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x40000000) != 0)
  {
    *(_DWORD *)(v6 + 312) = self->_likedState;
    *(void *)(v6 + 496) |= 0x40000000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
    if ((*(void *)&v33 & 0x4000000000000) == 0)
    {
LABEL_38:
      if ((*(void *)&v33 & 0x2000000000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_105;
    }
  }
  else if ((*(void *)&v33 & 0x4000000000000) == 0)
  {
    goto LABEL_38;
  }
  *(unsigned char *)(v6 + 493) = self->_needsReporting;
  *(void *)(v6 + 496) |= 0x4000000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(void *)&v33 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((*(void *)&v33 & 0x800000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(unsigned char *)(v6 + 492) = self->_likedStateChanged;
  *(void *)(v6 + 496) |= 0x2000000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(void *)&v33 & 0x800000000000) == 0)
  {
LABEL_40:
    if ((*(void *)&v33 & 0x20000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(unsigned char *)(v6 + 490) = self->_isInUsersLibrary;
  *(void *)(v6 + 496) |= 0x800000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(void *)&v33 & 0x20000000000) == 0)
  {
LABEL_41:
    if ((*(void *)&v33 & 0x8000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(unsigned char *)(v6 + 484) = self->_cloudAssetAvailable;
  *(void *)(v6 + 496) |= 0x20000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(void *)&v33 & 0x8000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&v33 & 0x10000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_109;
  }
LABEL_108:
  *(_DWORD *)(v6 + 448) = self->_storeProtectionType;
  *(void *)(v6 + 496) |= 0x8000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(void *)&v33 & 0x10000000000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v33 & 0x1000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_110;
  }
LABEL_109:
  *(unsigned char *)(v6 + 495) = self->_userDisabled;
  *(void *)(v6 + 496) |= 0x10000000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(void *)&v33 & 0x400000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(_DWORD *)(v6 + 220) = self->_cloudPlaybackEndpointType;
  *(void *)(v6 + 496) |= 0x1000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(void *)&v33 & 0x400000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v33 & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(_DWORD *)(v6 + 352) = self->_playbackEndpointType;
  *(void *)(v6 + 496) |= 0x400000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(void *)&v33 & 0x400000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(_DWORD *)(v6 + 216) = self->_cloudMatchedStatus;
  *(void *)(v6 + 496) |= 0x800000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v33 = self->_has;
  if ((*(void *)&v33 & 0x400000000000) == 0)
  {
LABEL_47:
    if ((*(void *)&v33 & 0x1000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_113:
  *(unsigned char *)(v6 + 489) = self->_inUsersCloudLibrary;
  *(void *)(v6 + 496) |= 0x400000000000uLL;
  if ((*(void *)&self->_has & 0x1000000000) != 0)
  {
LABEL_48:
    *(_DWORD *)(v6 + 400) = self->_secondaryArtworkSourceType;
    *(void *)(v6 + 496) |= 0x1000000000uLL;
  }
LABEL_49:
  uint64_t v34 = [(NSString *)self->_secondaryArtworkId copyWithZone:a3];
  uint64_t v35 = *(void **)(v6 + 392);
  *(void *)(v6 + 392) = v34;

  if ((*((unsigned char *)&self->_has + 5) & 8) != 0)
  {
    *(unsigned char *)(v6 + 486) = self->_hasChapterData;
    *(void *)(v6 + 496) |= 0x80000000000uLL;
  }
  uint64_t v36 = [(NSData *)self->_flattenedChapterData copyWithZone:a3];
  char v37 = *(void **)(v6 + 288);
  *(void *)(v6 + 288) = v36;

  $20C9AD10F7A062A4D81634BCAF627925 v38 = self->_has;
  if ((*(void *)&v38 & 0x1000000000000) != 0)
  {
    *(unsigned char *)(v6 + 491) = self->_isPreorder;
    *(void *)(v6 + 496) |= 0x1000000000000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v38 = self->_has;
  }
  if ((*(_WORD *)&v38 & 0x1000) != 0)
  {
    *(void *)(v6 + 104) = self->_likedStateChangedDate;
    *(void *)(v6 + 496) |= 0x1000uLL;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v39 = self->_libraryIdentifiers;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v68;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v68 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * v43), "copyWithZone:", a3, (void)v67);
        [(id)v6 addLibraryIdentifiers:v44];

        ++v43;
      }
      while (v41 != v43);
      uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v41);
  }

  $20C9AD10F7A062A4D81634BCAF627925 v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x80000) != 0)
  {
    *(void *)(v6 + 160) = self->_storeId;
    *(void *)(v6 + 496) |= 0x80000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v45 = self->_has;
    if ((*(_DWORD *)&v45 & 0x200000) == 0)
    {
LABEL_64:
      if ((*(unsigned char *)&v45 & 1) == 0) {
        goto LABEL_65;
      }
      goto LABEL_117;
    }
  }
  else if ((*(_DWORD *)&v45 & 0x200000) == 0)
  {
    goto LABEL_64;
  }
  *(void *)(v6 + 176) = self->_storefrontId;
  *(void *)(v6 + 496) |= 0x200000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v45 = self->_has;
  if ((*(unsigned char *)&v45 & 1) == 0)
  {
LABEL_65:
    if ((*(_WORD *)&v45 & 0x8000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(void *)(v6 + 8) = self->_accountId;
  *(void *)(v6 + 496) |= 1uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v45 = self->_has;
  if ((*(_WORD *)&v45 & 0x8000) == 0)
  {
LABEL_66:
    if ((*(void *)&v45 & 0x800000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_118:
  *(void *)(v6 + 128) = self->_purchaseHistoryId;
  *(void *)(v6 + 496) |= 0x8000uLL;
  if ((*(void *)&self->_has & 0x800000000) != 0)
  {
LABEL_67:
    *(_DWORD *)(v6 + 376) = self->_purchaseHistoryToken;
    *(void *)(v6 + 496) |= 0x800000000uLL;
  }
LABEL_68:
  uint64_t v46 = -[NSString copyWithZone:](self->_purchaseHistoryRedownloadParams, "copyWithZone:", a3, (void)v67);
  uint64_t v47 = *(void **)(v6 + 368);
  *(void *)(v6 + 368) = v46;

  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *(void *)(v6 + 152) = self->_sagaId;
    *(void *)(v6 + 496) |= 0x40000uLL;
  }
  uint64_t v48 = [(NSString *)self->_sagaRedownloadParams copyWithZone:a3];
  NSUInteger v49 = *(void **)(v6 + 384);
  *(void *)(v6 + 384) = v48;

  uint64_t v50 = [(NSString *)self->_storeXID copyWithZone:a3];
  uint64_t v51 = *(void **)(v6 + 456);
  *(void *)(v6 + 456) = v50;

  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    *(void *)(v6 + 184) = self->_subscriptionStoreItemId;
    *(void *)(v6 + 496) |= 0x400000uLL;
  }
  uint64_t v52 = [(NSString *)self->_cloudUniversalLibraryId copyWithZone:a3];
  uint64_t v53 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = v52;

  $20C9AD10F7A062A4D81634BCAF627925 v54 = self->_has;
  if ((*(_DWORD *)&v54 & 0x20000) != 0)
  {
    *(void *)(v6 + 144) = self->_reportingStoreItemId;
    *(void *)(v6 + 496) |= 0x20000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v54 = self->_has;
  }
  if ((*(unsigned char *)&v54 & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_assetStoreItemId;
    *(void *)(v6 + 496) |= 2uLL;
  }
  id v55 = [(MIPSong *)self->_song copyWithZone:a3];
  uint64_t v56 = *(void **)(v6 + 424);
  *(void *)(v6 + 424) = v55;

  id v57 = [(MIPMovie *)self->_movie copyWithZone:a3];
  uint64_t v58 = *(void **)(v6 + 336);
  *(void *)(v6 + 336) = v57;

  id v59 = [(MIPTVShow *)self->_tvShow copyWithZone:a3];
  uint64_t v60 = *(void **)(v6 + 472);
  *(void *)(v6 + 472) = v59;

  id v61 = [(MIPPodcast *)self->_podcast copyWithZone:a3];
  uint64_t v62 = *(void **)(v6 + 360);
  *(void *)(v6 + 360) = v61;

  id v63 = [(MIPAudiobook *)self->_audiobook copyWithZone:a3];
  NSUInteger v64 = *(void **)(v6 + 200);
  *(void *)(v6 + 200) = v63;

  id v65 = (id)v6;
  return v65;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    v4[82] = self->_mediaType;
    *((void *)v4 + 62) |= 0x80000000uLL;
  }
  uint64_t v18 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v18;
  }
  if (self->_sortTitle)
  {
    objc_msgSend(v18, "setSortTitle:");
    id v4 = v18;
  }
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *((void *)v4 + 17) = self->_releaseDateTime;
    *((void *)v4 + 62) |= 0x10000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_122;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 4) = self->_creationDateTime;
  *((void *)v4 + 62) |= 8uLL;
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((void *)v4 + 14) = self->_modificationDateTime;
  *((void *)v4 + 62) |= 0x2000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((void *)v4 + 10) = self->_fileSize;
  *((void *)v4 + 62) |= 0x200uLL;
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((void *)v4 + 8) = self->_duration;
  *((void *)v4 + 62) |= 0x80uLL;
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_125:
  v4[62] = self->_contentRating;
  *((void *)v4 + 62) |= 0x4000000uLL;
  if ((*(void *)&self->_has & 0x40000000000) != 0)
  {
LABEL_14:
    *((unsigned char *)v4 + 485) = self->_explicitContent;
    *((void *)v4 + 62) |= 0x40000000000uLL;
  }
LABEL_15:
  if (self->_shortDescription)
  {
    objc_msgSend(v18, "setShortDescription:");
    id v4 = v18;
  }
  if (self->_longDescription)
  {
    objc_msgSend(v18, "setLongDescription:");
    id v4 = v18;
  }
  if (self->_copyright)
  {
    objc_msgSend(v18, "setCopyright:");
    id v4 = v18;
  }
  if (self->_artworkId)
  {
    objc_msgSend(v18, "setArtworkId:");
    id v4 = v18;
  }
  $20C9AD10F7A062A4D81634BCAF627925 v6 = self->_has;
  if ((*(void *)&v6 & 0x10000000000) != 0)
  {
    v4[120] = self->_year;
    *((void *)v4 + 62) |= 0x10000000000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    v4[63] = self->_contentRatingLevel;
    *((void *)v4 + 62) |= 0x8000000uLL;
  }
  if (self->_comment)
  {
    objc_msgSend(v18, "setComment:");
    id v4 = v18;
  }
  $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
    v4[70] = self->_fileKind;
    *((void *)v4 + 62) |= 0x20000000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x100) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v7 & 0x10000000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_129;
    }
  }
  else if ((*(_WORD *)&v7 & 0x100) == 0)
  {
    goto LABEL_31;
  }
  *((void *)v4 + 9) = self->_familyAccountId;
  *((void *)v4 + 62) |= 0x100uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000000) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_130;
  }
LABEL_129:
  v4[66] = self->_drmVersionsCode;
  *((void *)v4 + 62) |= 0x10000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_131;
  }
LABEL_130:
  *((void *)v4 + 7) = self->_drmPlatformIdCode;
  *((void *)v4 + 62) |= 0x40uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_131:
  *((void *)v4 + 5) = self->_drmKey1IdCode;
  *((void *)v4 + 62) |= 0x10uLL;
  if ((*(void *)&self->_has & 0x20) != 0)
  {
LABEL_35:
    *((void *)v4 + 6) = self->_drmKey2IdCode;
    *((void *)v4 + 62) |= 0x20uLL;
  }
LABEL_36:
  if (self->_chapterMetadataUrl)
  {
    objc_msgSend(v18, "setChapterMetadataUrl:");
    id v4 = v18;
  }
  if (self->_storeAssetFlavor)
  {
    objc_msgSend(v18, "setStoreAssetFlavor:");
    id v4 = v18;
  }
  if (self->_extrasUrl)
  {
    objc_msgSend(v18, "setExtrasUrl:");
    id v4 = v18;
  }
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) != 0)
  {
    *((void *)v4 + 15) = self->_purchaseDateTime;
    *((void *)v4 + 62) |= 0x4000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x2000000) == 0)
    {
LABEL_44:
      if ((*(void *)&v8 & 0x100000000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_135;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
    goto LABEL_44;
  }
  v4[56] = self->_cloudStatus;
  *((void *)v4 + 62) |= 0x2000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x100000000) == 0)
  {
LABEL_45:
    if ((*(void *)&v8 & 0x200000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_136;
  }
LABEL_135:
  v4[86] = self->_playCount;
  *((void *)v4 + 62) |= 0x100000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x200000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v8 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_137;
  }
LABEL_136:
  v4[87] = self->_playCountDelta;
  *((void *)v4 + 62) |= 0x200000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_47:
    if ((*(void *)&v8 & 0x2000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_138;
  }
LABEL_137:
  *((void *)v4 + 11) = self->_lastPlayedDateTime;
  *((void *)v4 + 62) |= 0x400uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x2000000000) == 0)
  {
LABEL_48:
    if ((*(void *)&v8 & 0x4000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_139;
  }
LABEL_138:
  v4[104] = self->_skipCount;
  *((void *)v4 + 62) |= 0x2000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x4000000000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v8 & 0x800) == 0) {
      goto LABEL_50;
    }
    goto LABEL_140;
  }
LABEL_139:
  v4[105] = self->_skipCountDelta;
  *((void *)v4 + 62) |= 0x4000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_50:
    if ((*(void *)&v8 & 0x8000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((void *)v4 + 12) = self->_lastSkippedDateTime;
  *((void *)v4 + 62) |= 0x800uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_52;
    }
    goto LABEL_142;
  }
LABEL_141:
  *((unsigned char *)v4 + 494) = self->_rememberBookmark;
  *((void *)v4 + 62) |= 0x8000000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) == 0)
  {
LABEL_52:
    if ((*(void *)&v8 & 0x200000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_143;
  }
LABEL_142:
  *((void *)v4 + 3) = self->_bookmarkTimeMilliseconds;
  *((void *)v4 + 62) |= 4uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x200000000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v8 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_144;
  }
LABEL_143:
  *((unsigned char *)v4 + 488) = self->_hidden;
  *((void *)v4 + 62) |= 0x200000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_54:
    if ((*(void *)&v8 & 0x100000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_144:
  *((void *)v4 + 21) = self->_storePlaylistId;
  *((void *)v4 + 62) |= 0x100000uLL;
  if ((*(void *)&self->_has & 0x100000000000) != 0)
  {
LABEL_55:
    *((unsigned char *)v4 + 487) = self->_hasLocalAsset;
    *((void *)v4 + 62) |= 0x100000000000uLL;
  }
LABEL_56:
  if (self->_grouping)
  {
    objc_msgSend(v18, "setGrouping:");
    id v4 = v18;
  }
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000000) != 0)
  {
    v4[78] = self->_likedState;
    *((void *)v4 + 62) |= 0x40000000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
    if ((*(void *)&v9 & 0x4000000000000) == 0)
    {
LABEL_60:
      if ((*(void *)&v9 & 0x2000000000000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_148;
    }
  }
  else if ((*(void *)&v9 & 0x4000000000000) == 0)
  {
    goto LABEL_60;
  }
  *((unsigned char *)v4 + 493) = self->_needsReporting;
  *((void *)v4 + 62) |= 0x4000000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((*(void *)&v9 & 0x800000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((unsigned char *)v4 + 492) = self->_likedStateChanged;
  *((void *)v4 + 62) |= 0x2000000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x800000000000) == 0)
  {
LABEL_62:
    if ((*(void *)&v9 & 0x20000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((unsigned char *)v4 + 490) = self->_isInUsersLibrary;
  *((void *)v4 + 62) |= 0x800000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x20000000000) == 0)
  {
LABEL_63:
    if ((*(void *)&v9 & 0x8000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((unsigned char *)v4 + 484) = self->_cloudAssetAvailable;
  *((void *)v4 + 62) |= 0x20000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x8000000000) == 0)
  {
LABEL_64:
    if ((*(void *)&v9 & 0x10000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_152;
  }
LABEL_151:
  v4[112] = self->_storeProtectionType;
  *((void *)v4 + 62) |= 0x8000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x10000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_153;
  }
LABEL_152:
  *((unsigned char *)v4 + 495) = self->_userDisabled;
  *((void *)v4 + 62) |= 0x10000000000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_66:
    if ((*(void *)&v9 & 0x400000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_154;
  }
LABEL_153:
  v4[55] = self->_cloudPlaybackEndpointType;
  *((void *)v4 + 62) |= 0x1000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v9 & 0x800000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_155;
  }
LABEL_154:
  v4[88] = self->_playbackEndpointType;
  *((void *)v4 + 62) |= 0x400000000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_68:
    if ((*(void *)&v9 & 0x400000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_156;
  }
LABEL_155:
  v4[54] = self->_cloudMatchedStatus;
  *((void *)v4 + 62) |= 0x800000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000000) == 0)
  {
LABEL_69:
    if ((*(void *)&v9 & 0x1000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
LABEL_156:
  *((unsigned char *)v4 + 489) = self->_inUsersCloudLibrary;
  *((void *)v4 + 62) |= 0x400000000000uLL;
  if ((*(void *)&self->_has & 0x1000000000) != 0)
  {
LABEL_70:
    v4[100] = self->_secondaryArtworkSourceType;
    *((void *)v4 + 62) |= 0x1000000000uLL;
  }
LABEL_71:
  if (self->_secondaryArtworkId)
  {
    objc_msgSend(v18, "setSecondaryArtworkId:");
    id v4 = v18;
  }
  if ((*((unsigned char *)&self->_has + 5) & 8) != 0)
  {
    *((unsigned char *)v4 + 486) = self->_hasChapterData;
    *((void *)v4 + 62) |= 0x80000000000uLL;
  }
  if (self->_flattenedChapterData)
  {
    objc_msgSend(v18, "setFlattenedChapterData:");
    id v4 = v18;
  }
  $20C9AD10F7A062A4D81634BCAF627925 v10 = self->_has;
  if ((*(void *)&v10 & 0x1000000000000) != 0)
  {
    *((unsigned char *)v4 + 491) = self->_isPreorder;
    *((void *)v4 + 62) |= 0x1000000000000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    *((void *)v4 + 13) = self->_likedStateChangedDate;
    *((void *)v4 + 62) |= 0x1000uLL;
  }
  if ([(MIPMediaItem *)self libraryIdentifiersCount])
  {
    [v18 clearLibraryIdentifiers];
    unint64_t v11 = [(MIPMediaItem *)self libraryIdentifiersCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = [(MIPMediaItem *)self libraryIdentifiersAtIndex:i];
        [v18 addLibraryIdentifiers:v14];
      }
    }
  }
  $20C9AD10F7A062A4D81634BCAF627925 v15 = self->_has;
  uint64_t v16 = v18;
  if ((*(_DWORD *)&v15 & 0x80000) != 0)
  {
    *((void *)v18 + 20) = self->_storeId;
    *((void *)v18 + 62) |= 0x80000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x200000) == 0)
    {
LABEL_87:
      if ((*(unsigned char *)&v15 & 1) == 0) {
        goto LABEL_88;
      }
      goto LABEL_160;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x200000) == 0)
  {
    goto LABEL_87;
  }
  *((void *)v18 + 22) = self->_storefrontId;
  *((void *)v18 + 62) |= 0x200000uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 1) == 0)
  {
LABEL_88:
    if ((*(_WORD *)&v15 & 0x8000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_161;
  }
LABEL_160:
  *((void *)v18 + 1) = self->_accountId;
  *((void *)v18 + 62) |= 1uLL;
  $20C9AD10F7A062A4D81634BCAF627925 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x8000) == 0)
  {
LABEL_89:
    if ((*(void *)&v15 & 0x800000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_90;
  }
LABEL_161:
  *((void *)v18 + 16) = self->_purchaseHistoryId;
  *((void *)v18 + 62) |= 0x8000uLL;
  if ((*(void *)&self->_has & 0x800000000) != 0)
  {
LABEL_90:
    v18[94] = self->_purchaseHistoryToken;
    *((void *)v18 + 62) |= 0x800000000uLL;
  }
LABEL_91:
  if (self->_purchaseHistoryRedownloadParams)
  {
    objc_msgSend(v18, "setPurchaseHistoryRedownloadParams:");
    uint64_t v16 = v18;
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    v16[19] = self->_sagaId;
    v16[62] |= 0x40000uLL;
  }
  if (self->_sagaRedownloadParams)
  {
    objc_msgSend(v18, "setSagaRedownloadParams:");
    uint64_t v16 = v18;
  }
  if (self->_storeXID)
  {
    objc_msgSend(v18, "setStoreXID:");
    uint64_t v16 = v18;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    v16[23] = self->_subscriptionStoreItemId;
    v16[62] |= 0x400000uLL;
  }
  if (self->_cloudUniversalLibraryId)
  {
    objc_msgSend(v18, "setCloudUniversalLibraryId:");
    uint64_t v16 = v18;
  }
  $20C9AD10F7A062A4D81634BCAF627925 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    v16[18] = self->_reportingStoreItemId;
    v16[62] |= 0x20000uLL;
    $20C9AD10F7A062A4D81634BCAF627925 v17 = self->_has;
  }
  if ((*(unsigned char *)&v17 & 2) != 0)
  {
    v16[2] = self->_assetStoreItemId;
    v16[62] |= 2uLL;
  }
  if (self->_song)
  {
    objc_msgSend(v18, "setSong:");
    uint64_t v16 = v18;
  }
  if (self->_movie)
  {
    objc_msgSend(v18, "setMovie:");
    uint64_t v16 = v18;
  }
  if (self->_tvShow)
  {
    objc_msgSend(v18, "setTvShow:");
    uint64_t v16 = v18;
  }
  if (self->_podcast)
  {
    objc_msgSend(v18, "setPodcast:");
    uint64_t v16 = v18;
  }
  if (self->_audiobook)
  {
    objc_msgSend(v18, "setAudiobook:");
    uint64_t v16 = v18;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_sortTitle) {
    PBDataWriterWriteStringField();
  }
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_123;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_126:
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x40000000000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_shortDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_longDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_copyright) {
    PBDataWriterWriteStringField();
  }
  if (self->_artworkId) {
    PBDataWriterWriteStringField();
  }
  $20C9AD10F7A062A4D81634BCAF627925 v6 = self->_has;
  if ((*(void *)&v6 & 0x10000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $20C9AD10F7A062A4D81634BCAF627925 v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x8000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_comment) {
    PBDataWriterWriteStringField();
  }
  $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x100) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v7 & 0x10000000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_130;
    }
  }
  else if ((*(_WORD *)&v7 & 0x100) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000000) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_132:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x20) != 0) {
LABEL_35:
  }
    PBDataWriterWriteInt64Field();
LABEL_36:
  if (self->_chapterMetadataUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_storeAssetFlavor) {
    PBDataWriterWriteStringField();
  }
  if (self->_extrasUrl) {
    PBDataWriterWriteStringField();
  }
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x2000000) == 0)
    {
LABEL_44:
      if ((*(void *)&v8 & 0x100000000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_136;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
    goto LABEL_44;
  }
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x100000000) == 0)
  {
LABEL_45:
    if ((*(void *)&v8 & 0x200000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x200000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v8 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_47:
    if ((*(void *)&v8 & 0x2000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x2000000000) == 0)
  {
LABEL_48:
    if ((*(void *)&v8 & 0x4000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x4000000000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v8 & 0x800) == 0) {
      goto LABEL_50;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_50:
    if ((*(void *)&v8 & 0x8000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_52;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteBOOLField();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) == 0)
  {
LABEL_52:
    if ((*(void *)&v8 & 0x200000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(void *)&v8 & 0x200000000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v8 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  $20C9AD10F7A062A4D81634BCAF627925 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_54:
    if ((*(void *)&v8 & 0x100000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_145:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x100000000000) != 0) {
LABEL_55:
  }
    PBDataWriterWriteBOOLField();
LABEL_56:
  if (self->_grouping) {
    PBDataWriterWriteStringField();
  }
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
    if ((*(void *)&v9 & 0x4000000000000) == 0)
    {
LABEL_60:
      if ((*(void *)&v9 & 0x2000000000000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_149;
    }
  }
  else if ((*(void *)&v9 & 0x4000000000000) == 0)
  {
    goto LABEL_60;
  }
  PBDataWriterWriteBOOLField();
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((*(void *)&v9 & 0x800000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteBOOLField();
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x800000000000) == 0)
  {
LABEL_62:
    if ((*(void *)&v9 & 0x20000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteBOOLField();
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x20000000000) == 0)
  {
LABEL_63:
    if ((*(void *)&v9 & 0x8000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteBOOLField();
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x8000000000) == 0)
  {
LABEL_64:
    if ((*(void *)&v9 & 0x10000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x10000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteBOOLField();
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_66:
    if ((*(void *)&v9 & 0x400000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v9 & 0x800000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_68:
    if ((*(void *)&v9 & 0x400000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteInt32Field();
  $20C9AD10F7A062A4D81634BCAF627925 v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000000) == 0)
  {
LABEL_69:
    if ((*(void *)&v9 & 0x1000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
LABEL_157:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x1000000000) != 0) {
LABEL_70:
  }
    PBDataWriterWriteInt32Field();
LABEL_71:
  if (self->_secondaryArtworkId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 5) & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_flattenedChapterData) {
    PBDataWriterWriteDataField();
  }
  $20C9AD10F7A062A4D81634BCAF627925 v10 = self->_has;
  if ((*(void *)&v10 & 0x1000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $20C9AD10F7A062A4D81634BCAF627925 v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v11 = self->_libraryIdentifiers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  $20C9AD10F7A062A4D81634BCAF627925 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x80000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $20C9AD10F7A062A4D81634BCAF627925 v16 = self->_has;
    if ((*(_DWORD *)&v16 & 0x200000) == 0)
    {
LABEL_90:
      if ((*(unsigned char *)&v16 & 1) == 0) {
        goto LABEL_91;
      }
      goto LABEL_161;
    }
  }
  else if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
    goto LABEL_90;
  }
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 1) == 0)
  {
LABEL_91:
    if ((*(_WORD *)&v16 & 0x8000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt64Field();
  $20C9AD10F7A062A4D81634BCAF627925 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x8000) == 0)
  {
LABEL_92:
    if ((*(void *)&v16 & 0x800000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_162:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x800000000) != 0) {
LABEL_93:
  }
    PBDataWriterWriteInt32Field();
LABEL_94:
  if (self->_purchaseHistoryRedownloadParams) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_sagaRedownloadParams) {
    PBDataWriterWriteStringField();
  }
  if (self->_storeXID) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_cloudUniversalLibraryId) {
    PBDataWriterWriteStringField();
  }
  $20C9AD10F7A062A4D81634BCAF627925 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $20C9AD10F7A062A4D81634BCAF627925 v17 = self->_has;
  }
  if ((*(unsigned char *)&v17 & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_song) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_movie) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_tvShow) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_podcast) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_audiobook) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPMediaItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    unsigned int v4 = self->_mediaType - 1;
    if (v4 >= 0xD)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mediaType);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v5 = off_1E5FB82B8[v4];
    }
    [v3 setObject:v5 forKey:@"mediaType"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  sortTitle = self->_sortTitle;
  if (sortTitle) {
    [v3 setObject:sortTitle forKey:@"sortTitle"];
  }
  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    NSUInteger v64 = [NSNumber numberWithLongLong:self->_releaseDateTime];
    [v3 setObject:v64 forKey:@"releaseDateTime"];

    $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_12:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_128;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_12;
  }
  id v65 = [NSNumber numberWithLongLong:self->_creationDateTime];
  [v3 setObject:v65 forKey:@"creationDateTime"];

  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_129;
  }
LABEL_128:
  uint64_t v66 = [NSNumber numberWithLongLong:self->_modificationDateTime];
  [v3 setObject:v66 forKey:@"modificationDateTime"];

  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_130;
  }
LABEL_129:
  long long v67 = [NSNumber numberWithLongLong:self->_fileSize];
  [v3 setObject:v67 forKey:@"fileSize"];

  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_131;
  }
LABEL_130:
  long long v68 = [NSNumber numberWithLongLong:self->_duration];
  [v3 setObject:v68 forKey:@"duration"];

  $20C9AD10F7A062A4D81634BCAF627925 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_16:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_131:
  long long v69 = [NSNumber numberWithInt:self->_contentRating];
  [v3 setObject:v69 forKey:@"contentRating"];

  if ((*(void *)&self->_has & 0x40000000000) != 0)
  {
LABEL_17:
    $20C9AD10F7A062A4D81634BCAF627925 v9 = [NSNumber numberWithBool:self->_explicitContent];
    [v3 setObject:v9 forKey:@"explicitContent"];
  }
LABEL_18:
  shortDescription = self->_shortDescription;
  if (shortDescription) {
    [v3 setObject:shortDescription forKey:@"shortDescription"];
  }
  longDescription = self->_longDescription;
  if (longDescription) {
    [v3 setObject:longDescription forKey:@"longDescription"];
  }
  copyright = self->_copyright;
  if (copyright) {
    [v3 setObject:copyright forKey:@"copyright"];
  }
  artworkId = self->_artworkId;
  if (artworkId) {
    [v3 setObject:artworkId forKey:@"artworkId"];
  }
  $20C9AD10F7A062A4D81634BCAF627925 v14 = self->_has;
  if ((*(void *)&v14 & 0x10000000000) != 0)
  {
    uint64_t v15 = [NSNumber numberWithInt:self->_year];
    [v3 setObject:v15 forKey:@"year"];

    $20C9AD10F7A062A4D81634BCAF627925 v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    $20C9AD10F7A062A4D81634BCAF627925 v16 = [NSNumber numberWithInt:self->_contentRatingLevel];
    [v3 setObject:v16 forKey:@"contentRatingLevel"];
  }
  comment = self->_comment;
  if (comment) {
    [v3 setObject:comment forKey:@"comment"];
  }
  $20C9AD10F7A062A4D81634BCAF627925 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000000) != 0)
  {
    long long v70 = [NSNumber numberWithInt:self->_fileKind];
    [v3 setObject:v70 forKey:@"fileKind"];

    $20C9AD10F7A062A4D81634BCAF627925 v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x100) == 0)
    {
LABEL_34:
      if ((*(_DWORD *)&v18 & 0x10000000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_135;
    }
  }
  else if ((*(_WORD *)&v18 & 0x100) == 0)
  {
    goto LABEL_34;
  }
  uint64_t v71 = [NSNumber numberWithLongLong:self->_familyAccountId];
  [v3 setObject:v71 forKey:@"familyAccountId"];

  $20C9AD10F7A062A4D81634BCAF627925 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000000) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&v18 & 0x40) == 0) {
      goto LABEL_36;
    }
    goto LABEL_136;
  }
LABEL_135:
  uint64_t v72 = [NSNumber numberWithInt:self->_drmVersionsCode];
  [v3 setObject:v72 forKey:@"drmVersionsCode"];

  $20C9AD10F7A062A4D81634BCAF627925 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x40) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v18 & 0x10) == 0) {
      goto LABEL_37;
    }
    goto LABEL_137;
  }
LABEL_136:
  uint64_t v73 = [NSNumber numberWithLongLong:self->_drmPlatformIdCode];
  [v3 setObject:v73 forKey:@"drmPlatformIdCode"];

  $20C9AD10F7A062A4D81634BCAF627925 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x10) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&v18 & 0x20) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_137:
  uint64_t v74 = [NSNumber numberWithLongLong:self->_drmKey1IdCode];
  [v3 setObject:v74 forKey:@"drmKey1IdCode"];

  if ((*(void *)&self->_has & 0x20) != 0)
  {
LABEL_38:
    long long v19 = [NSNumber numberWithLongLong:self->_drmKey2IdCode];
    [v3 setObject:v19 forKey:@"drmKey2IdCode"];
  }
LABEL_39:
  chapterMetadataUrl = self->_chapterMetadataUrl;
  if (chapterMetadataUrl) {
    [v3 setObject:chapterMetadataUrl forKey:@"chapterMetadataUrl"];
  }
  storeAssetFlavor = self->_storeAssetFlavor;
  if (storeAssetFlavor) {
    [v3 setObject:storeAssetFlavor forKey:@"storeAssetFlavor"];
  }
  extrasUrl = self->_extrasUrl;
  if (extrasUrl) {
    [v3 setObject:extrasUrl forKey:@"extrasUrl"];
  }
  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x4000) != 0)
  {
    NSUInteger v75 = [NSNumber numberWithLongLong:self->_purchaseDateTime];
    [v3 setObject:v75 forKey:@"purchaseDateTime"];

    $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
    if ((*(_DWORD *)&v23 & 0x2000000) == 0)
    {
LABEL_47:
      if ((*(void *)&v23 & 0x100000000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_141;
    }
  }
  else if ((*(_DWORD *)&v23 & 0x2000000) == 0)
  {
    goto LABEL_47;
  }
  NSUInteger v76 = [NSNumber numberWithInt:self->_cloudStatus];
  [v3 setObject:v76 forKey:@"cloudStatus"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(void *)&v23 & 0x100000000) == 0)
  {
LABEL_48:
    if ((*(void *)&v23 & 0x200000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_142;
  }
LABEL_141:
  NSUInteger v77 = [NSNumber numberWithInt:self->_playCount];
  [v3 setObject:v77 forKey:@"playCount"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(void *)&v23 & 0x200000000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v23 & 0x400) == 0) {
      goto LABEL_50;
    }
    goto LABEL_143;
  }
LABEL_142:
  NSUInteger v78 = [NSNumber numberWithInt:self->_playCountDelta];
  [v3 setObject:v78 forKey:@"playCountDelta"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x400) == 0)
  {
LABEL_50:
    if ((*(void *)&v23 & 0x2000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_144;
  }
LABEL_143:
  uint64_t v79 = [NSNumber numberWithLongLong:self->_lastPlayedDateTime];
  [v3 setObject:v79 forKey:@"lastPlayedDateTime"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(void *)&v23 & 0x2000000000) == 0)
  {
LABEL_51:
    if ((*(void *)&v23 & 0x4000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_145;
  }
LABEL_144:
  uint64_t v80 = [NSNumber numberWithInt:self->_skipCount];
  [v3 setObject:v80 forKey:@"skipCount"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(void *)&v23 & 0x4000000000) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v23 & 0x800) == 0) {
      goto LABEL_53;
    }
    goto LABEL_146;
  }
LABEL_145:
  uint64_t v81 = [NSNumber numberWithInt:self->_skipCountDelta];
  [v3 setObject:v81 forKey:@"skipCountDelta"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x800) == 0)
  {
LABEL_53:
    if ((*(void *)&v23 & 0x8000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_147;
  }
LABEL_146:
  uint64_t v82 = [NSNumber numberWithLongLong:self->_lastSkippedDateTime];
  [v3 setObject:v82 forKey:@"lastSkippedDateTime"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(void *)&v23 & 0x8000000000000) == 0)
  {
LABEL_54:
    if ((*(unsigned char *)&v23 & 4) == 0) {
      goto LABEL_55;
    }
    goto LABEL_148;
  }
LABEL_147:
  uint64_t v83 = [NSNumber numberWithBool:self->_rememberBookmark];
  [v3 setObject:v83 forKey:@"rememberBookmark"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(unsigned char *)&v23 & 4) == 0)
  {
LABEL_55:
    if ((*(void *)&v23 & 0x200000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_149;
  }
LABEL_148:
  uint64_t v84 = [NSNumber numberWithLongLong:self->_bookmarkTimeMilliseconds];
  [v3 setObject:v84 forKey:@"bookmarkTimeMilliseconds"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(void *)&v23 & 0x200000000000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v23 & 0x100000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_150;
  }
LABEL_149:
  uint64_t v85 = [NSNumber numberWithBool:self->_hidden];
  [v3 setObject:v85 forKey:@"hidden"];

  $20C9AD10F7A062A4D81634BCAF627925 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x100000) == 0)
  {
LABEL_57:
    if ((*(void *)&v23 & 0x100000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_150:
  NSUInteger v86 = [NSNumber numberWithLongLong:self->_storePlaylistId];
  [v3 setObject:v86 forKey:@"storePlaylistId"];

  if ((*(void *)&self->_has & 0x100000000000) != 0)
  {
LABEL_58:
    uint64_t v24 = [NSNumber numberWithBool:self->_hasLocalAsset];
    [v3 setObject:v24 forKey:@"hasLocalAsset"];
  }
LABEL_59:
  grouping = self->_grouping;
  if (grouping) {
    [v3 setObject:grouping forKey:@"grouping"];
  }
  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x40000000) != 0)
  {
    NSUInteger v87 = [NSNumber numberWithInt:self->_likedState];
    [v3 setObject:v87 forKey:@"likedState"];

    $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
    if ((*(void *)&v26 & 0x4000000000000) == 0)
    {
LABEL_63:
      if ((*(void *)&v26 & 0x2000000000000) == 0) {
        goto LABEL_64;
      }
      goto LABEL_154;
    }
  }
  else if ((*(void *)&v26 & 0x4000000000000) == 0)
  {
    goto LABEL_63;
  }
  uint64_t v88 = [NSNumber numberWithBool:self->_needsReporting];
  [v3 setObject:v88 forKey:@"needsReporting"];

  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(void *)&v26 & 0x2000000000000) == 0)
  {
LABEL_64:
    if ((*(void *)&v26 & 0x800000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_155;
  }
LABEL_154:
  v89 = [NSNumber numberWithBool:self->_likedStateChanged];
  [v3 setObject:v89 forKey:@"likedStateChanged"];

  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(void *)&v26 & 0x800000000000) == 0)
  {
LABEL_65:
    if ((*(void *)&v26 & 0x20000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_156;
  }
LABEL_155:
  v90 = [NSNumber numberWithBool:self->_isInUsersLibrary];
  [v3 setObject:v90 forKey:@"isInUsersLibrary"];

  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(void *)&v26 & 0x20000000000) == 0)
  {
LABEL_66:
    if ((*(void *)&v26 & 0x8000000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_157;
  }
LABEL_156:
  v91 = [NSNumber numberWithBool:self->_cloudAssetAvailable];
  [v3 setObject:v91 forKey:@"cloudAssetAvailable"];

  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(void *)&v26 & 0x8000000000) == 0)
  {
LABEL_67:
    if ((*(void *)&v26 & 0x10000000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_158;
  }
LABEL_157:
  v92 = [NSNumber numberWithInt:self->_storeProtectionType];
  [v3 setObject:v92 forKey:@"storeProtectionType"];

  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(void *)&v26 & 0x10000000000000) == 0)
  {
LABEL_68:
    if ((*(_DWORD *)&v26 & 0x1000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_159;
  }
LABEL_158:
  v93 = [NSNumber numberWithBool:self->_userDisabled];
  [v3 setObject:v93 forKey:@"userDisabled"];

  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x1000000) == 0)
  {
LABEL_69:
    if ((*(void *)&v26 & 0x400000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_160;
  }
LABEL_159:
  v94 = [NSNumber numberWithInt:self->_cloudPlaybackEndpointType];
  [v3 setObject:v94 forKey:@"cloudPlaybackEndpointType"];

  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(void *)&v26 & 0x400000000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v26 & 0x800000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_161;
  }
LABEL_160:
  v95 = [NSNumber numberWithInt:self->_playbackEndpointType];
  [v3 setObject:v95 forKey:@"playbackEndpointType"];

  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x800000) == 0)
  {
LABEL_71:
    if ((*(void *)&v26 & 0x400000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_162;
  }
LABEL_161:
  v96 = [NSNumber numberWithInt:self->_cloudMatchedStatus];
  [v3 setObject:v96 forKey:@"cloudMatchedStatus"];

  $20C9AD10F7A062A4D81634BCAF627925 v26 = self->_has;
  if ((*(void *)&v26 & 0x400000000000) == 0)
  {
LABEL_72:
    if ((*(void *)&v26 & 0x1000000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_162:
  v97 = [NSNumber numberWithBool:self->_inUsersCloudLibrary];
  [v3 setObject:v97 forKey:@"inUsersCloudLibrary"];

  if ((*(void *)&self->_has & 0x1000000000) != 0)
  {
LABEL_73:
    uint64_t v27 = [NSNumber numberWithInt:self->_secondaryArtworkSourceType];
    [v3 setObject:v27 forKey:@"secondaryArtworkSourceType"];
  }
LABEL_74:
  secondaryArtworkId = self->_secondaryArtworkId;
  if (secondaryArtworkId) {
    [v3 setObject:secondaryArtworkId forKey:@"secondaryArtworkId"];
  }
  if ((*((unsigned char *)&self->_has + 5) & 8) != 0)
  {
    $20C9AD10F7A062A4D81634BCAF627925 v29 = [NSNumber numberWithBool:self->_hasChapterData];
    [v3 setObject:v29 forKey:@"hasChapterData"];
  }
  flattenedChapterData = self->_flattenedChapterData;
  if (flattenedChapterData) {
    [v3 setObject:flattenedChapterData forKey:@"flattenedChapterData"];
  }
  $20C9AD10F7A062A4D81634BCAF627925 v31 = self->_has;
  if ((*(void *)&v31 & 0x1000000000000) != 0)
  {
    uint64_t v32 = [NSNumber numberWithBool:self->_isPreorder];
    [v3 setObject:v32 forKey:@"isPreorder"];

    $20C9AD10F7A062A4D81634BCAF627925 v31 = self->_has;
  }
  if ((*(_WORD *)&v31 & 0x1000) != 0)
  {
    $20C9AD10F7A062A4D81634BCAF627925 v33 = [NSNumber numberWithLongLong:self->_likedStateChangedDate];
    [v3 setObject:v33 forKey:@"likedStateChangedDate"];
  }
  if ([(NSMutableArray *)self->_libraryIdentifiers count])
  {
    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_libraryIdentifiers, "count"));
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v35 = self->_libraryIdentifiers;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v102 objects:v106 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v103 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = [*(id *)(*((void *)&v102 + 1) + 8 * i) dictionaryRepresentation];
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v102 objects:v106 count:16];
      }
      while (v37);
    }

    [v3 setObject:v34 forKey:@"libraryIdentifiers"];
  }
  $20C9AD10F7A062A4D81634BCAF627925 v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x80000) != 0)
  {
    v98 = [NSNumber numberWithLongLong:self->_storeId];
    [v3 setObject:v98 forKey:@"storeId"];

    $20C9AD10F7A062A4D81634BCAF627925 v41 = self->_has;
    if ((*(_DWORD *)&v41 & 0x200000) == 0)
    {
LABEL_95:
      if ((*(unsigned char *)&v41 & 1) == 0) {
        goto LABEL_96;
      }
      goto LABEL_166;
    }
  }
  else if ((*(_DWORD *)&v41 & 0x200000) == 0)
  {
    goto LABEL_95;
  }
  v99 = [NSNumber numberWithLongLong:self->_storefrontId];
  [v3 setObject:v99 forKey:@"storefrontId"];

  $20C9AD10F7A062A4D81634BCAF627925 v41 = self->_has;
  if ((*(unsigned char *)&v41 & 1) == 0)
  {
LABEL_96:
    if ((*(_WORD *)&v41 & 0x8000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_167;
  }
LABEL_166:
  v100 = [NSNumber numberWithLongLong:self->_accountId];
  [v3 setObject:v100 forKey:@"accountId"];

  $20C9AD10F7A062A4D81634BCAF627925 v41 = self->_has;
  if ((*(_WORD *)&v41 & 0x8000) == 0)
  {
LABEL_97:
    if ((*(void *)&v41 & 0x800000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
LABEL_167:
  v101 = [NSNumber numberWithLongLong:self->_purchaseHistoryId];
  [v3 setObject:v101 forKey:@"purchaseHistoryId"];

  if ((*(void *)&self->_has & 0x800000000) != 0)
  {
LABEL_98:
    uint64_t v42 = [NSNumber numberWithInt:self->_purchaseHistoryToken];
    [v3 setObject:v42 forKey:@"purchaseHistoryToken"];
  }
LABEL_99:
  purchaseHistoryRedownloadParams = self->_purchaseHistoryRedownloadParams;
  if (purchaseHistoryRedownloadParams) {
    [v3 setObject:purchaseHistoryRedownloadParams forKey:@"purchaseHistoryRedownloadParams"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    uint64_t v44 = [NSNumber numberWithLongLong:self->_sagaId];
    [v3 setObject:v44 forKey:@"sagaId"];
  }
  sagaRedownloadParams = self->_sagaRedownloadParams;
  if (sagaRedownloadParams) {
    [v3 setObject:sagaRedownloadParams forKey:@"sagaRedownloadParams"];
  }
  storeXID = self->_storeXID;
  if (storeXID) {
    [v3 setObject:storeXID forKey:@"storeXID"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    uint64_t v47 = [NSNumber numberWithLongLong:self->_subscriptionStoreItemId];
    [v3 setObject:v47 forKey:@"subscriptionStoreItemId"];
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if (cloudUniversalLibraryId) {
    [v3 setObject:cloudUniversalLibraryId forKey:@"cloudUniversalLibraryId"];
  }
  $20C9AD10F7A062A4D81634BCAF627925 v49 = self->_has;
  if ((*(_DWORD *)&v49 & 0x20000) != 0)
  {
    uint64_t v50 = [NSNumber numberWithLongLong:self->_reportingStoreItemId];
    [v3 setObject:v50 forKey:@"reportingStoreItemId"];

    $20C9AD10F7A062A4D81634BCAF627925 v49 = self->_has;
  }
  if ((*(unsigned char *)&v49 & 2) != 0)
  {
    uint64_t v51 = [NSNumber numberWithLongLong:self->_assetStoreItemId];
    [v3 setObject:v51 forKey:@"assetStoreItemId"];
  }
  song = self->_song;
  if (song)
  {
    uint64_t v53 = [(MIPSong *)song dictionaryRepresentation];
    [v3 setObject:v53 forKey:@"song"];
  }
  movie = self->_movie;
  if (movie)
  {
    id v55 = [(MIPMovie *)movie dictionaryRepresentation];
    [v3 setObject:v55 forKey:@"movie"];
  }
  tvShow = self->_tvShow;
  if (tvShow)
  {
    id v57 = [(MIPTVShow *)tvShow dictionaryRepresentation];
    [v3 setObject:v57 forKey:@"tvShow"];
  }
  podcast = self->_podcast;
  if (podcast)
  {
    id v59 = [(MIPPodcast *)podcast dictionaryRepresentation];
    [v3 setObject:v59 forKey:@"podcast"];
  }
  audiobook = self->_audiobook;
  if (audiobook)
  {
    id v61 = [(MIPAudiobook *)audiobook dictionaryRepresentation];
    [v3 setObject:v61 forKey:@"audiobook"];
  }
  id v62 = v3;

  return v62;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPMediaItem;
  unsigned int v4 = [(MIPMediaItem *)&v8 description];
  uint64_t v5 = [(MIPMediaItem *)self dictionaryRepresentation];
  $20C9AD10F7A062A4D81634BCAF627925 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAudiobook
{
  return self->_audiobook != 0;
}

- (BOOL)hasPodcast
{
  return self->_podcast != 0;
}

- (BOOL)hasTvShow
{
  return self->_tvShow != 0;
}

- (BOOL)hasMovie
{
  return self->_movie != 0;
}

- (BOOL)hasSong
{
  return self->_song != 0;
}

- (BOOL)hasAssetStoreItemId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAssetStoreItemId:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (void)setAssetStoreItemId:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_assetStoreItemId = a3;
}

- (BOOL)hasReportingStoreItemId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasReportingStoreItemId:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (void)setReportingStoreItemId:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_reportingStoreItemId = a3;
}

- (BOOL)hasCloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId != 0;
}

- (BOOL)hasSubscriptionStoreItemId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasSubscriptionStoreItemId:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (void)setSubscriptionStoreItemId:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_subscriptionStoreItemId = a3;
}

- (BOOL)hasStoreXID
{
  return self->_storeXID != 0;
}

- (BOOL)hasSagaRedownloadParams
{
  return self->_sagaRedownloadParams != 0;
}

- (BOOL)hasSagaId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasSagaId:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (void)setSagaId:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_sagaId = a3;
}

- (BOOL)hasPurchaseHistoryRedownloadParams
{
  return self->_purchaseHistoryRedownloadParams != 0;
}

- (BOOL)hasPurchaseHistoryToken
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setHasPurchaseHistoryToken:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (void)setPurchaseHistoryToken:(int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_purchaseHistoryToken = a3;
}

- (BOOL)hasPurchaseHistoryId
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasPurchaseHistoryId:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (void)setPurchaseHistoryId:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_purchaseHistoryId = a3;
}

- (BOOL)hasAccountId
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasAccountId:(BOOL)a3
{
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setAccountId:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_accountId = a3;
}

- (BOOL)hasStorefrontId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasStorefrontId:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (void)setStorefrontId:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_storefrontId = a3;
}

- (BOOL)hasStoreId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasStoreId:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (void)setStoreId:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_storeId = a3;
}

- (id)libraryIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_libraryIdentifiers objectAtIndex:a3];
}

- (unint64_t)libraryIdentifiersCount
{
  return [(NSMutableArray *)self->_libraryIdentifiers count];
}

- (void)addLibraryIdentifiers:(id)a3
{
  id v4 = a3;
  libraryIdentifiers = self->_libraryIdentifiers;
  id v8 = v4;
  if (!libraryIdentifiers)
  {
    $20C9AD10F7A062A4D81634BCAF627925 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $20C9AD10F7A062A4D81634BCAF627925 v7 = self->_libraryIdentifiers;
    self->_libraryIdentifiers = v6;

    id v4 = v8;
    libraryIdentifiers = self->_libraryIdentifiers;
  }
  [(NSMutableArray *)libraryIdentifiers addObject:v4];
}

- (void)clearLibraryIdentifiers
{
}

- (BOOL)hasLikedStateChangedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasLikedStateChangedDate:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (void)setLikedStateChangedDate:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_likedStateChangedDate = a3;
}

- (BOOL)hasIsPreorder
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (void)setHasIsPreorder:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (void)setIsPreorder:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_isPreorder = a3;
}

- (BOOL)hasFlattenedChapterData
{
  return self->_flattenedChapterData != 0;
}

- (BOOL)hasHasChapterData
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setHasHasChapterData:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (void)setHasChapterData:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_hasChapterData = a3;
}

- (BOOL)hasSecondaryArtworkId
{
  return self->_secondaryArtworkId != 0;
}

- (BOOL)hasSecondaryArtworkSourceType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setHasSecondaryArtworkSourceType:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (void)setSecondaryArtworkSourceType:(int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_secondaryArtworkSourceType = a3;
}

- (BOOL)hasInUsersCloudLibrary
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setHasInUsersCloudLibrary:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (void)setInUsersCloudLibrary:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_inUsersCloudLibrary = a3;
}

- (BOOL)hasCloudMatchedStatus
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasCloudMatchedStatus:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (void)setCloudMatchedStatus:(int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_cloudMatchedStatus = a3;
}

- (BOOL)hasPlaybackEndpointType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setHasPlaybackEndpointType:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (void)setPlaybackEndpointType:(int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_playbackEndpointType = a3;
}

- (BOOL)hasCloudPlaybackEndpointType
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasCloudPlaybackEndpointType:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (void)setCloudPlaybackEndpointType:(int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_cloudPlaybackEndpointType = a3;
}

- (BOOL)hasUserDisabled
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setHasUserDisabled:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (void)setUserDisabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_userDisabled = a3;
}

- (BOOL)hasStoreProtectionType
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setHasStoreProtectionType:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (void)setStoreProtectionType:(int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_storeProtectionType = a3;
}

- (BOOL)hasCloudAssetAvailable
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setHasCloudAssetAvailable:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (void)setCloudAssetAvailable:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_cloudAssetAvailable = a3;
}

- (BOOL)hasIsInUsersLibrary
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setHasIsInUsersLibrary:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (void)setIsInUsersLibrary:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_isInUsersLibrary = a3;
}

- (BOOL)hasLikedStateChanged
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setHasLikedStateChanged:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (void)setLikedStateChanged:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_likedStateChanged = a3;
}

- (BOOL)hasNeedsReporting
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setHasNeedsReporting:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (void)setNeedsReporting:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_needsReporting = a3;
}

- (BOOL)hasLikedState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHasLikedState:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (void)setLikedState:(int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_likedState = a3;
}

- (BOOL)hasGrouping
{
  return self->_grouping != 0;
}

- (BOOL)hasHasLocalAsset
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setHasHasLocalAsset:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (void)setHasLocalAsset:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_hasLocalAsset = a3;
}

- (BOOL)hasStorePlaylistId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasStorePlaylistId:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (void)setStorePlaylistId:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_storePlaylistId = a3;
}

- (BOOL)hasHidden
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setHasHidden:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (void)setHidden:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_hidden = a3;
}

- (BOOL)hasBookmarkTimeMilliseconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasBookmarkTimeMilliseconds:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (void)setBookmarkTimeMilliseconds:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_bookmarkTimeMilliseconds = a3;
}

- (BOOL)hasRememberBookmark
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setHasRememberBookmark:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (void)setRememberBookmark:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_rememberBookmark = a3;
}

- (BOOL)hasLastSkippedDateTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasLastSkippedDateTime:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (void)setLastSkippedDateTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_lastSkippedDateTime = a3;
}

- (BOOL)hasSkipCountDelta
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setHasSkipCountDelta:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (void)setSkipCountDelta:(int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_skipCountDelta = a3;
}

- (BOOL)hasSkipCount
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setHasSkipCount:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (void)setSkipCount:(int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_skipCount = a3;
}

- (BOOL)hasLastPlayedDateTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasLastPlayedDateTime:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (void)setLastPlayedDateTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_lastPlayedDateTime = a3;
}

- (BOOL)hasPlayCountDelta
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHasPlayCountDelta:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (void)setPlayCountDelta:(int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_playCountDelta = a3;
}

- (BOOL)hasPlayCount
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setHasPlayCount:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (void)setPlayCount:(int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_playCount = a3;
}

- (BOOL)hasCloudStatus
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasCloudStatus:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (void)setCloudStatus:(int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_cloudStatus = a3;
}

- (BOOL)hasPurchaseDateTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasPurchaseDateTime:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (void)setPurchaseDateTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_purchaseDateTime = a3;
}

- (BOOL)hasExtrasUrl
{
  return self->_extrasUrl != 0;
}

- (BOOL)hasStoreAssetFlavor
{
  return self->_storeAssetFlavor != 0;
}

- (BOOL)hasChapterMetadataUrl
{
  return self->_chapterMetadataUrl != 0;
}

- (BOOL)hasDrmKey2IdCode
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasDrmKey2IdCode:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (void)setDrmKey2IdCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_drmKey2IdCode = a3;
}

- (BOOL)hasDrmKey1IdCode
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasDrmKey1IdCode:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (void)setDrmKey1IdCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_drmKey1IdCode = a3;
}

- (BOOL)hasDrmPlatformIdCode
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasDrmPlatformIdCode:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setDrmPlatformIdCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_drmPlatformIdCode = a3;
}

- (BOOL)hasDrmVersionsCode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasDrmVersionsCode:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (void)setDrmVersionsCode:(int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_drmVersionsCode = a3;
}

- (BOOL)hasFamilyAccountId
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasFamilyAccountId:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (void)setFamilyAccountId:(int64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_familyAccountId = a3;
}

- (BOOL)hasFileKind
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasFileKind:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (void)setFileKind:(int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_fileKind = a3;
}

- (BOOL)hasComment
{
  return self->_comment != 0;
}

- (BOOL)hasContentRatingLevel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasContentRatingLevel:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (void)setContentRatingLevel:(int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_contentRatingLevel = a3;
}

- (BOOL)hasYear
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setHasYear:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (void)setYear:(int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_year = a3;
}

- (BOOL)hasArtworkId
{
  return self->_artworkId != 0;
}

- (BOOL)hasCopyright
{
  return self->_copyright != 0;
}

- (BOOL)hasLongDescription
{
  return self->_longDescription != 0;
}

- (BOOL)hasShortDescription
{
  return self->_shortDescription != 0;
}

- (BOOL)hasExplicitContent
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setHasExplicitContent:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (void)setExplicitContent:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_explicitContent = a3;
}

- (BOOL)hasContentRating
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasContentRating:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (void)setContentRating:(int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_contentRating = a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasDuration:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (void)setDuration:(int64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_duration = a3;
}

- (BOOL)hasFileSize
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasFileSize:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (void)setFileSize:(int64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_fileSize = a3;
}

- (BOOL)hasModificationDateTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasModificationDateTime:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (void)setModificationDateTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_modificationDateTime = a3;
}

- (BOOL)hasCreationDateTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasCreationDateTime:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (void)setCreationDateTime:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_creationDateTime = a3;
}

- (BOOL)hasReleaseDateTime
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasReleaseDateTime:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (void)setReleaseDateTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_releaseDateTime = a3;
}

- (BOOL)hasSortTitle
{
  return self->_sortTitle != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (int)StringAsMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Song"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Movie"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TVShow"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Podcast"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"VoiceMemo"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"VideoPodcast"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MusicVideo"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AudioBook"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"DigitalBooklet"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ITunesUAudio"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ITunesUVideo"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"HomeVideo"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MusicQuiz"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)mediaTypeAsString:(int)a3
{
  if ((a3 - 1) >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5FB82B8[a3 - 1];
  }

  return v3;
}

- (BOOL)hasMediaType
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setHasMediaType:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$20C9AD10F7A062A4D81634BCAF627925 has = ($20C9AD10F7A062A4D81634BCAF627925)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)setMediaType:(int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_mediaType = a3;
}

- (int)mediaType
{
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0) {
    return self->_mediaType;
  }
  else {
    return 1;
  }
}

+ (Class)libraryIdentifiersType
{
  return (Class)objc_opt_class();
}

@end