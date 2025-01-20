@interface MRContentItemMetadata
- (BOOL)artworkAvailable;
- (BOOL)excludeFromSuggestions;
- (BOOL)hasActiveFormatJustification;
- (BOOL)hasAdvertisement;
- (BOOL)hasAlbumTraits;
- (BOOL)hasAlwaysLive;
- (BOOL)hasArtworkAvailable;
- (BOOL)hasArtworkDataHeightDeprecated;
- (BOOL)hasArtworkDataWidthDeprecated;
- (BOOL)hasChapterCount;
- (BOOL)hasContainer;
- (BOOL)hasCurrentlyPlaying;
- (BOOL)hasDefaultPlaybackRate;
- (BOOL)hasDiscNumber;
- (BOOL)hasDownloadProgress;
- (BOOL)hasDownloadState;
- (BOOL)hasDuration;
- (BOOL)hasEditingStyleFlags;
- (BOOL)hasElapsedTime;
- (BOOL)hasElapsedTimeTimestamp;
- (BOOL)hasEpisodeNumber;
- (BOOL)hasEpisodeType;
- (BOOL)hasExcludeFromSuggestions;
- (BOOL)hasExplicitItem;
- (BOOL)hasFormatTierPreference;
- (BOOL)hasITunesStoreAlbumArtistIdentifier;
- (BOOL)hasITunesStoreAlbumIdentifier;
- (BOOL)hasITunesStoreArtistIdentifier;
- (BOOL)hasITunesStoreIdentifier;
- (BOOL)hasITunesStoreSubscriptionIdentifier;
- (BOOL)hasInTransition;
- (BOOL)hasInWishList;
- (BOOL)hasInferredTimestamp;
- (BOOL)hasInfoAvailable;
- (BOOL)hasIsResolvableParticipant;
- (BOOL)hasLanguageOptionsAvailable;
- (BOOL)hasLegacyUniqueIdentifier;
- (BOOL)hasLiked;
- (BOOL)hasLoading;
- (BOOL)hasLoadingPlaceholderTitle;
- (BOOL)hasLyricsAdamID;
- (BOOL)hasLyricsAvailable;
- (BOOL)hasMediaSubType;
- (BOOL)hasMediaType;
- (BOOL)hasNumberOfSections;
- (BOOL)hasPlayCount;
- (BOOL)hasPlayable;
- (BOOL)hasPlaybackProgress;
- (BOOL)hasPlaybackRate;
- (BOOL)hasPlaylistTraits;
- (BOOL)hasPlaylistType;
- (BOOL)hasRadioStationIdentifier;
- (BOOL)hasRadioStationType;
- (BOOL)hasReportingAdamID;
- (BOOL)hasSeasonNumber;
- (BOOL)hasSharable;
- (BOOL)hasSongTraits;
- (BOOL)hasStartTime;
- (BOOL)hasSteerable;
- (BOOL)hasStreamingContent;
- (BOOL)hasTotalDiscCount;
- (BOOL)hasTotalTrackCount;
- (BOOL)hasTrackNumber;
- (BOOL)hasTranscriptAlignmentsAvailable;
- (BOOL)infoAvailable;
- (BOOL)isAdvertisement;
- (BOOL)isAlwaysLive;
- (BOOL)isContainer;
- (BOOL)isCurrentlyPlaying;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitItem;
- (BOOL)isInTransition;
- (BOOL)isInWishList;
- (BOOL)isLiked;
- (BOOL)isLoading;
- (BOOL)isPlayable;
- (BOOL)isResolvableParticipant;
- (BOOL)isSharable;
- (BOOL)isSteerable;
- (BOOL)isStreamingContent;
- (BOOL)languageOptionsAvailable;
- (BOOL)lyricsAvailable;
- (BOOL)transcriptAlignmentsAvailable;
- (MRContentItemMetadata)initWithData:(id)a3;
- (MRContentItemMetadata)initWithProtobuf:(id)a3;
- (MRContentItemMetadataAudioFormat)activeFormat;
- (MRContentItemMetadataAudioFormat)preferredFormat;
- (MRContentItemMetadataAudioRoute)audioRoute;
- (NSArray)alternativeFormats;
- (NSArray)artworkURLTemplates;
- (NSData)data;
- (NSData)purchaseInfoData;
- (NSDate)currentPlaybackDate;
- (NSDate)releaseDate;
- (NSDictionary)appMetrics;
- (NSDictionary)collectionInfo;
- (NSDictionary)deviceSpecificUserInfo;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)nowPlayingInfo;
- (NSDictionary)userInfo;
- (NSString)albumArtistName;
- (NSString)albumName;
- (NSString)albumYear;
- (NSString)artworkIdentifier;
- (NSString)artworkMIMEType;
- (NSString)brandIdentifier;
- (NSString)classicalWork;
- (NSString)collectionIdentifier;
- (NSString)composer;
- (NSString)contentIdentifier;
- (NSString)directorName;
- (NSString)durationStringLocalizationKey;
- (NSString)genre;
- (NSString)internationalStandardRecordingCode;
- (NSString)localizedContentRating;
- (NSString)localizedDurationString;
- (NSString)localizedTitle;
- (NSString)participantIdentifier;
- (NSString)participantName;
- (NSString)profileIdentifier;
- (NSString)radioStationName;
- (NSString)radioStationString;
- (NSString)seriesName;
- (NSString)serviceIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (NSString)trackArtistName;
- (NSURL)artworkFileURL;
- (NSURL)artworkURL;
- (NSURL)assetURL;
- (NSURL)lyricsURL;
- (double)calculatedPlaybackPosition;
- (double)calculatedPlaybackPositionFromDate:(id)a3;
- (double)duration;
- (double)elapsedTime;
- (double)elapsedTimeTimestamp;
- (double)inferredTimestamp;
- (double)startTime;
- (float)defaultPlaybackRate;
- (float)downloadProgress;
- (float)playbackProgress;
- (float)playbackRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protobufWithEncoding:(int64_t)a3;
- (int64_t)activeFormatJustification;
- (int64_t)artworkDataHeightDeprecated;
- (int64_t)artworkDataWidthDeprecated;
- (int64_t)chapterCount;
- (int64_t)discNumber;
- (int64_t)downloadState;
- (int64_t)editingStyleFlags;
- (int64_t)episodeNumber;
- (int64_t)episodeType;
- (int64_t)iTunesStoreAlbumArtistIdentifier;
- (int64_t)iTunesStoreAlbumIdentifier;
- (int64_t)iTunesStoreArtistIdentifier;
- (int64_t)iTunesStoreIdentifier;
- (int64_t)iTunesStoreSubscriptionIdentifier;
- (int64_t)legacyUniqueIdentifier;
- (int64_t)lyricsAdamID;
- (int64_t)mediaSubType;
- (int64_t)mediaType;
- (int64_t)numberOfSections;
- (int64_t)playCount;
- (int64_t)playlistType;
- (int64_t)radioStationIdentifier;
- (int64_t)radioStationType;
- (int64_t)reportingAdamID;
- (int64_t)seasonNumber;
- (int64_t)totalDiscCount;
- (int64_t)totalTrackCount;
- (int64_t)trackNumber;
- (unint64_t)albumTraits;
- (unint64_t)formatTierPreference;
- (unint64_t)playlistTraits;
- (unint64_t)songTraits;
- (void)mergeFrom:(id)a3;
- (void)setActiveFormat:(id)a3;
- (void)setActiveFormatJustification:(int64_t)a3;
- (void)setAdvertisement:(BOOL)a3;
- (void)setAlbumArtistName:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setAlbumTraits:(unint64_t)a3;
- (void)setAlbumYear:(id)a3;
- (void)setAlternativeFormats:(id)a3;
- (void)setAlwaysLive:(BOOL)a3;
- (void)setAppMetrics:(id)a3;
- (void)setArtworkAvailable:(BOOL)a3;
- (void)setArtworkDataHeightDeprecated:(int64_t)a3;
- (void)setArtworkDataWidthDeprecated:(int64_t)a3;
- (void)setArtworkFileURL:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
- (void)setArtworkMIMEType:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setArtworkURLTemplates:(id)a3;
- (void)setAssetURL:(id)a3;
- (void)setAudioRoute:(id)a3;
- (void)setBrandIdentifier:(id)a3;
- (void)setChapterCount:(int64_t)a3;
- (void)setClassicalWork:(id)a3;
- (void)setCollectionIdentifier:(id)a3;
- (void)setCollectionInfo:(id)a3;
- (void)setComposer:(id)a3;
- (void)setContainer:(BOOL)a3;
- (void)setContentIdentifier:(id)a3;
- (void)setCurrentPlaybackDate:(id)a3;
- (void)setCurrentlyPlaying:(BOOL)a3;
- (void)setDefaultPlaybackRate:(float)a3;
- (void)setDeviceSpecificUserInfo:(id)a3;
- (void)setDirectorName:(id)a3;
- (void)setDiscNumber:(int64_t)a3;
- (void)setDownloadProgress:(float)a3;
- (void)setDownloadState:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setDurationStringLocalizationKey:(id)a3;
- (void)setEditingStyleFlags:(int64_t)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTimeTimestamp:(double)a3;
- (void)setEpisodeNumber:(int64_t)a3;
- (void)setEpisodeType:(int64_t)a3;
- (void)setExcludeFromSuggestions:(BOOL)a3;
- (void)setExplicitItem:(BOOL)a3;
- (void)setFormatTierPreference:(unint64_t)a3;
- (void)setGenre:(id)a3;
- (void)setHasActiveFormatJustification:(BOOL)a3;
- (void)setHasAdvertisement:(BOOL)a3;
- (void)setHasAlbumTraits:(BOOL)a3;
- (void)setHasAlwaysLive:(BOOL)a3;
- (void)setHasArtworkAvailable:(BOOL)a3;
- (void)setHasChapterCount:(BOOL)a3;
- (void)setHasContainer:(BOOL)a3;
- (void)setHasCurrentlyPlaying:(BOOL)a3;
- (void)setHasDefaultPlaybackRate:(BOOL)a3;
- (void)setHasDiscNumber:(BOOL)a3;
- (void)setHasDownloadProgress:(BOOL)a3;
- (void)setHasDownloadState:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEditingStyleFlags:(BOOL)a3;
- (void)setHasElapsedTime:(BOOL)a3;
- (void)setHasElapsedTimeTimestamp:(BOOL)a3;
- (void)setHasEpisodeNumber:(BOOL)a3;
- (void)setHasEpisodeType:(BOOL)a3;
- (void)setHasExplicitItem:(BOOL)a3;
- (void)setHasFormatTierPreference:(BOOL)a3;
- (void)setHasITunesStoreAlbumArtistIdentifier:(BOOL)a3;
- (void)setHasITunesStoreAlbumIdentifier:(BOOL)a3;
- (void)setHasITunesStoreArtistIdentifier:(BOOL)a3;
- (void)setHasITunesStoreIdentifier:(BOOL)a3;
- (void)setHasITunesStoreSubscriptionIdentifier:(BOOL)a3;
- (void)setHasInTransition:(BOOL)a3;
- (void)setHasInWishList:(BOOL)a3;
- (void)setHasInferredTimestamp:(BOOL)a3;
- (void)setHasInfoAvailable:(BOOL)a3;
- (void)setHasLanguageOptionsAvailable:(BOOL)a3;
- (void)setHasLegacyUniqueIdentifier:(BOOL)a3;
- (void)setHasLiked:(BOOL)a3;
- (void)setHasLoading:(BOOL)a3;
- (void)setHasLyricsAdamID:(BOOL)a3;
- (void)setHasLyricsAvailable:(BOOL)a3;
- (void)setHasMediaSubType:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasNumberOfSections:(BOOL)a3;
- (void)setHasPlayCount:(BOOL)a3;
- (void)setHasPlayable:(BOOL)a3;
- (void)setHasPlaybackProgress:(BOOL)a3;
- (void)setHasPlaybackRate:(BOOL)a3;
- (void)setHasPlaylistTraits:(BOOL)a3;
- (void)setHasPlaylistType:(BOOL)a3;
- (void)setHasRadioStationIdentifier:(BOOL)a3;
- (void)setHasRadioStationType:(BOOL)a3;
- (void)setHasReportingAdamID:(BOOL)a3;
- (void)setHasSeasonNumber:(BOOL)a3;
- (void)setHasSharable:(BOOL)a3;
- (void)setHasSongTraits:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasSteerable:(BOOL)a3;
- (void)setHasStreamingContent:(BOOL)a3;
- (void)setHasTotalDiscCount:(BOOL)a3;
- (void)setHasTotalTrackCount:(BOOL)a3;
- (void)setHasTrackNumber:(BOOL)a3;
- (void)setHasTranscriptAlignmentsAvailable:(BOOL)a3;
- (void)setITunesStoreAlbumArtistIdentifier:(int64_t)a3;
- (void)setITunesStoreAlbumIdentifier:(int64_t)a3;
- (void)setITunesStoreArtistIdentifier:(int64_t)a3;
- (void)setITunesStoreIdentifier:(int64_t)a3;
- (void)setITunesStoreSubscriptionIdentifier:(int64_t)a3;
- (void)setInTransition:(BOOL)a3;
- (void)setInWishList:(BOOL)a3;
- (void)setInferredTimestamp:(double)a3;
- (void)setInfoAvailable:(BOOL)a3;
- (void)setInternationalStandardRecordingCode:(id)a3;
- (void)setIsResolvableParticipant:(BOOL)a3;
- (void)setLanguageOptionsAvailable:(BOOL)a3;
- (void)setLegacyUniqueIdentifier:(int64_t)a3;
- (void)setLiked:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLocalizedContentRating:(id)a3;
- (void)setLocalizedDurationString:(id)a3;
- (void)setLyricsAdamID:(int64_t)a3;
- (void)setLyricsAvailable:(BOOL)a3;
- (void)setLyricsURL:(id)a3;
- (void)setMediaSubType:(int64_t)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setNumberOfSections:(int64_t)a3;
- (void)setParticipantIdentifier:(id)a3;
- (void)setParticipantName:(id)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setPlayable:(BOOL)a3;
- (void)setPlaybackProgress:(float)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPlaylistTraits:(unint64_t)a3;
- (void)setPlaylistType:(int64_t)a3;
- (void)setPreferredFormat:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setPurchaseInfoData:(id)a3;
- (void)setRadioStationIdentifier:(int64_t)a3;
- (void)setRadioStationName:(id)a3;
- (void)setRadioStationString:(id)a3;
- (void)setRadioStationType:(int64_t)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReportingAdamID:(int64_t)a3;
- (void)setSeasonNumber:(int64_t)a3;
- (void)setSeriesName:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setSharable:(BOOL)a3;
- (void)setSongTraits:(unint64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setSteerable:(BOOL)a3;
- (void)setStreamingContent:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTotalDiscCount:(int64_t)a3;
- (void)setTotalTrackCount:(int64_t)a3;
- (void)setTrackArtistName:(id)a3;
- (void)setTrackNumber:(int64_t)a3;
- (void)setTranscriptAlignmentsAvailable:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MRContentItemMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeFormats, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_activeFormat, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_albumYear, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplates, 0);
  objc_storeStrong((id *)&self->_artworkFileURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_artworkMIMEType, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedDurationString, 0);
  objc_storeStrong((id *)&self->_durationStringLocalizationKey, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_lyricsURL, 0);
  objc_storeStrong((id *)&self->_seriesName, 0);
  objc_storeStrong((id *)&self->_radioStationString, 0);
  objc_storeStrong((id *)&self->_radioStationName, 0);
  objc_storeStrong((id *)&self->_internationalStandardRecordingCode, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedContentRating, 0);
  objc_storeStrong((id *)&self->_directorName, 0);
  objc_storeStrong((id *)&self->_albumArtistName, 0);
  objc_storeStrong((id *)&self->_trackArtistName, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_classicalWork, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_currentPlaybackDate, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_collectionInfo, 0);
  objc_storeStrong((id *)&self->_deviceSpecificUserInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_appMetrics, 0);

  objc_storeStrong((id *)&self->_purchaseInfoData, 0);
}

- (id)protobufWithEncoding:(int64_t)a3
{
  v5 = objc_alloc_init(_MRContentItemMetadataProtobuf);
  [(_MRContentItemMetadataProtobuf *)v5 setIsContainer:[(MRContentItemMetadata *)self isContainer]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsContainer:[(MRContentItemMetadata *)self hasContainer]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsPlayable:[(MRContentItemMetadata *)self isPlayable]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsPlayable:[(MRContentItemMetadata *)self hasPlayable]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsExplicitItem:[(MRContentItemMetadata *)self isExplicitItem]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsExplicitItem:[(MRContentItemMetadata *)self hasExplicitItem]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsStreamingContent:[(MRContentItemMetadata *)self isStreamingContent]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsStreamingContent:[(MRContentItemMetadata *)self hasStreamingContent]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsCurrentlyPlaying:[(MRContentItemMetadata *)self isCurrentlyPlaying]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsCurrentlyPlaying:[(MRContentItemMetadata *)self hasCurrentlyPlaying]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsAlwaysLive:[(MRContentItemMetadata *)self isAlwaysLive]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsAlwaysLive:[(MRContentItemMetadata *)self hasAlwaysLive]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsSharable:[(MRContentItemMetadata *)self isSharable]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsSharable:[(MRContentItemMetadata *)self hasSharable]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsLiked:[(MRContentItemMetadata *)self isLiked]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsLiked:[(MRContentItemMetadata *)self hasLiked]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsInWishList:[(MRContentItemMetadata *)self isInWishList]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsInWishList:[(MRContentItemMetadata *)self hasInWishList]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsAdvertisement:[(MRContentItemMetadata *)self isAdvertisement]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsAdvertisement:[(MRContentItemMetadata *)self hasAdvertisement]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsSteerable:[(MRContentItemMetadata *)self isSteerable]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsSteerable:[(MRContentItemMetadata *)self hasSteerable]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsLoading:[(MRContentItemMetadata *)self isLoading]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsLoading:[(MRContentItemMetadata *)self hasLoading]];
  [(_MRContentItemMetadataProtobuf *)v5 setIsInTransition:[(MRContentItemMetadata *)self isInTransition]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsInTransition:[(MRContentItemMetadata *)self hasInTransition]];
  [(_MRContentItemMetadataProtobuf *)v5 setArtworkAvailable:[(MRContentItemMetadata *)self artworkAvailable]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasArtworkAvailable:[(MRContentItemMetadata *)self hasArtworkAvailable]];
  [(_MRContentItemMetadataProtobuf *)v5 setInfoAvailable:[(MRContentItemMetadata *)self infoAvailable]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasInfoAvailable:[(MRContentItemMetadata *)self hasInfoAvailable]];
  [(_MRContentItemMetadataProtobuf *)v5 setLanguageOptionsAvailable:[(MRContentItemMetadata *)self languageOptionsAvailable]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasLanguageOptionsAvailable:[(MRContentItemMetadata *)self hasLanguageOptionsAvailable]];
  [(_MRContentItemMetadataProtobuf *)v5 setLyricsAvailable:[(MRContentItemMetadata *)self lyricsAvailable]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasLyricsAvailable:[(MRContentItemMetadata *)self hasLyricsAvailable]];
  [(MRContentItemMetadata *)self playbackProgress];
  -[_MRContentItemMetadataProtobuf setPlaybackProgress:](v5, "setPlaybackProgress:");
  [(_MRContentItemMetadataProtobuf *)v5 setHasPlaybackProgress:[(MRContentItemMetadata *)self hasPlaybackProgress]];
  [(MRContentItemMetadata *)self playbackRate];
  -[_MRContentItemMetadataProtobuf setPlaybackRate:](v5, "setPlaybackRate:");
  [(_MRContentItemMetadataProtobuf *)v5 setHasPlaybackRate:[(MRContentItemMetadata *)self hasPlaybackRate]];
  [(MRContentItemMetadata *)self defaultPlaybackRate];
  -[_MRContentItemMetadataProtobuf setDefaultPlaybackRate:](v5, "setDefaultPlaybackRate:");
  [(_MRContentItemMetadataProtobuf *)v5 setHasDefaultPlaybackRate:[(MRContentItemMetadata *)self hasDefaultPlaybackRate]];
  [(MRContentItemMetadata *)self downloadProgress];
  -[_MRContentItemMetadataProtobuf setDownloadProgress:](v5, "setDownloadProgress:");
  [(_MRContentItemMetadataProtobuf *)v5 setHasDownloadProgress:[(MRContentItemMetadata *)self hasDownloadProgress]];
  [(_MRContentItemMetadataProtobuf *)v5 setPlaylistType:[(MRContentItemMetadata *)self playlistType]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasPlaylistType:[(MRContentItemMetadata *)self hasPlaylistType]];
  [(_MRContentItemMetadataProtobuf *)v5 setRadioStationType:[(MRContentItemMetadata *)self radioStationType]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasRadioStationType:[(MRContentItemMetadata *)self hasRadioStationType]];
  [(_MRContentItemMetadataProtobuf *)v5 setEditingStyleFlags:[(MRContentItemMetadata *)self editingStyleFlags]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasEditingStyleFlags:[(MRContentItemMetadata *)self hasEditingStyleFlags]];
  [(_MRContentItemMetadataProtobuf *)v5 setMediaType:[(MRContentItemMetadata *)self mediaType]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasMediaType:[(MRContentItemMetadata *)self hasMediaType]];
  [(_MRContentItemMetadataProtobuf *)v5 setMediaSubType:[(MRContentItemMetadata *)self mediaSubType]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasMediaSubType:[(MRContentItemMetadata *)self hasMediaSubType]];
  [(_MRContentItemMetadataProtobuf *)v5 setEpisodeType:[(MRContentItemMetadata *)self episodeType]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasEpisodeType:[(MRContentItemMetadata *)self hasEpisodeType]];
  [(_MRContentItemMetadataProtobuf *)v5 setPlayCount:[(MRContentItemMetadata *)self playCount]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasPlayCount:[(MRContentItemMetadata *)self hasPlayCount]];
  [(_MRContentItemMetadataProtobuf *)v5 setNumberOfSections:[(MRContentItemMetadata *)self numberOfSections]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasNumberOfSections:[(MRContentItemMetadata *)self hasNumberOfSections]];
  [(_MRContentItemMetadataProtobuf *)v5 setChapterCount:[(MRContentItemMetadata *)self chapterCount]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasChapterCount:[(MRContentItemMetadata *)self hasChapterCount]];
  [(_MRContentItemMetadataProtobuf *)v5 setTotalDiscCount:[(MRContentItemMetadata *)self totalDiscCount]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasTotalDiscCount:[(MRContentItemMetadata *)self hasTotalDiscCount]];
  [(_MRContentItemMetadataProtobuf *)v5 setTotalTrackCount:[(MRContentItemMetadata *)self totalTrackCount]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasTotalTrackCount:[(MRContentItemMetadata *)self hasTotalTrackCount]];
  [(_MRContentItemMetadataProtobuf *)v5 setDownloadState:[(MRContentItemMetadata *)self downloadState]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasDownloadState:[(MRContentItemMetadata *)self hasDownloadState]];
  [(_MRContentItemMetadataProtobuf *)v5 setArtworkDataWidthDeprecated:[(MRContentItemMetadata *)self artworkDataWidthDeprecated]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasArtworkDataWidthDeprecated:[(MRContentItemMetadata *)self hasArtworkDataWidthDeprecated]];
  [(_MRContentItemMetadataProtobuf *)v5 setArtworkDataHeightDeprecated:[(MRContentItemMetadata *)self artworkDataHeightDeprecated]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasArtworkDataHeightDeprecated:[(MRContentItemMetadata *)self hasArtworkDataHeightDeprecated]];
  [(MRContentItemMetadata *)self duration];
  -[_MRContentItemMetadataProtobuf setDuration:](v5, "setDuration:");
  [(_MRContentItemMetadataProtobuf *)v5 setHasDuration:[(MRContentItemMetadata *)self hasDuration]];
  [(MRContentItemMetadata *)self startTime];
  -[_MRContentItemMetadataProtobuf setStartTime:](v5, "setStartTime:");
  [(_MRContentItemMetadataProtobuf *)v5 setHasStartTime:[(MRContentItemMetadata *)self hasStartTime]];
  [(MRContentItemMetadata *)self elapsedTime];
  -[_MRContentItemMetadataProtobuf setElapsedTime:](v5, "setElapsedTime:");
  [(_MRContentItemMetadataProtobuf *)v5 setHasElapsedTime:[(MRContentItemMetadata *)self hasElapsedTime]];
  [(MRContentItemMetadata *)self elapsedTimeTimestamp];
  -[_MRContentItemMetadataProtobuf setElapsedTimeTimestamp:](v5, "setElapsedTimeTimestamp:");
  [(_MRContentItemMetadataProtobuf *)v5 setHasElapsedTimeTimestamp:[(MRContentItemMetadata *)self hasElapsedTimeTimestamp]];
  [(MRContentItemMetadata *)self inferredTimestamp];
  -[_MRContentItemMetadataProtobuf setInferredTimestamp:](v5, "setInferredTimestamp:");
  [(_MRContentItemMetadataProtobuf *)v5 setHasInferredTimestamp:[(MRContentItemMetadata *)self hasInferredTimestamp]];
  [(_MRContentItemMetadataProtobuf *)v5 setSeasonNumber:[(MRContentItemMetadata *)self seasonNumber]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasSeasonNumber:[(MRContentItemMetadata *)self hasSeasonNumber]];
  [(_MRContentItemMetadataProtobuf *)v5 setEpisodeNumber:[(MRContentItemMetadata *)self episodeNumber]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasEpisodeNumber:[(MRContentItemMetadata *)self hasEpisodeNumber]];
  v6 = [(MRContentItemMetadata *)self releaseDate];
  [v6 timeIntervalSince1970];
  -[_MRContentItemMetadataProtobuf setReleaseDate:](v5, "setReleaseDate:");

  v7 = [(MRContentItemMetadata *)self releaseDate];
  [(_MRContentItemMetadataProtobuf *)v5 setHasReleaseDate:v7 != 0];

  v8 = [(MRContentItemMetadata *)self currentPlaybackDate];
  if (v8)
  {
    v9 = [(MRContentItemMetadata *)self currentPlaybackDate];
    v10 = MREncodeObjectWithEncoding(v9, a3);
    [(_MRContentItemMetadataProtobuf *)v5 setCurrentPlaybackDateData:v10];
  }
  else
  {
    [(_MRContentItemMetadataProtobuf *)v5 setCurrentPlaybackDateData:0];
  }

  [(_MRContentItemMetadataProtobuf *)v5 setDiscNumber:[(MRContentItemMetadata *)self discNumber]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasDiscNumber:[(MRContentItemMetadata *)self hasDiscNumber]];
  [(_MRContentItemMetadataProtobuf *)v5 setTrackNumber:[(MRContentItemMetadata *)self trackNumber]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasTrackNumber:[(MRContentItemMetadata *)self hasTrackNumber]];
  [(_MRContentItemMetadataProtobuf *)v5 setRadioStationIdentifier:[(MRContentItemMetadata *)self radioStationIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasRadioStationIdentifier:[(MRContentItemMetadata *)self hasRadioStationIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setITunesStoreIdentifier:[(MRContentItemMetadata *)self iTunesStoreIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasITunesStoreIdentifier:[(MRContentItemMetadata *)self hasITunesStoreIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setITunesStoreSubscriptionIdentifier:[(MRContentItemMetadata *)self iTunesStoreSubscriptionIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasITunesStoreSubscriptionIdentifier:[(MRContentItemMetadata *)self hasITunesStoreSubscriptionIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setITunesStoreArtistIdentifier:[(MRContentItemMetadata *)self iTunesStoreArtistIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasITunesStoreArtistIdentifier:[(MRContentItemMetadata *)self hasITunesStoreArtistIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setITunesStoreAlbumIdentifier:[(MRContentItemMetadata *)self iTunesStoreAlbumIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasITunesStoreAlbumIdentifier:[(MRContentItemMetadata *)self hasITunesStoreAlbumIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setLegacyUniqueIdentifier:[(MRContentItemMetadata *)self legacyUniqueIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasLegacyUniqueIdentifier:[(MRContentItemMetadata *)self hasLegacyUniqueIdentifier]];
  v11 = [(MRContentItemMetadata *)self classicalWork];
  [(_MRContentItemMetadataProtobuf *)v5 setClassicalWork:v11];

  v12 = [(MRContentItemMetadata *)self appMetrics];
  if (v12)
  {
    v13 = [(MRContentItemMetadata *)self appMetrics];
    v14 = MREncodeObjectWithEncoding(v13, a3);
    [(_MRContentItemMetadataProtobuf *)v5 setAppMetricsData:v14];
  }
  else
  {
    [(_MRContentItemMetadataProtobuf *)v5 setAppMetricsData:0];
  }

  v15 = [(MRContentItemMetadata *)self nowPlayingInfo];
  if (v15)
  {
    v16 = [(MRContentItemMetadata *)self nowPlayingInfo];
    v17 = MREncodeObjectWithEncoding(v16, a3);
    [(_MRContentItemMetadataProtobuf *)v5 setNowPlayingInfoData:v17];
  }
  else
  {
    [(_MRContentItemMetadataProtobuf *)v5 setNowPlayingInfoData:0];
  }

  v18 = [(MRContentItemMetadata *)self userInfo];
  if (v18)
  {
    v19 = [(MRContentItemMetadata *)self userInfo];
    v20 = MREncodeObjectWithEncoding(v19, a3);
    [(_MRContentItemMetadataProtobuf *)v5 setUserInfoData:v20];
  }
  else
  {
    [(_MRContentItemMetadataProtobuf *)v5 setUserInfoData:0];
  }

  v21 = [(MRContentItemMetadata *)self deviceSpecificUserInfo];
  if (v21)
  {
    v22 = [(MRContentItemMetadata *)self deviceSpecificUserInfo];
    v23 = MREncodeObjectWithEncoding(v22, a3);
    [(_MRContentItemMetadataProtobuf *)v5 setDeviceSpecificUserInfoData:v23];
  }
  else
  {
    [(_MRContentItemMetadataProtobuf *)v5 setDeviceSpecificUserInfoData:0];
  }

  v24 = [(MRContentItemMetadata *)self collectionInfo];
  if (v24)
  {
    v25 = [(MRContentItemMetadata *)self collectionInfo];
    v26 = MREncodeObjectWithEncoding(v25, a3);
    [(_MRContentItemMetadataProtobuf *)v5 setCollectionInfoData:v26];
  }
  else
  {
    [(_MRContentItemMetadataProtobuf *)v5 setCollectionInfoData:0];
  }

  v27 = [(MRContentItemMetadata *)self purchaseInfoData];
  v28 = (void *)[v27 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setPurchaseInfoData:v28];

  v29 = [(MRContentItemMetadata *)self title];
  v30 = (void *)[v29 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setTitle:v30];

  v31 = [(MRContentItemMetadata *)self subtitle];
  v32 = (void *)[v31 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setSubtitle:v32];

  v33 = [(MRContentItemMetadata *)self albumName];
  v34 = (void *)[v33 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setAlbumName:v34];

  v35 = [(MRContentItemMetadata *)self trackArtistName];
  v36 = (void *)[v35 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setTrackArtistName:v36];

  v37 = [(MRContentItemMetadata *)self albumArtistName];
  v38 = (void *)[v37 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setAlbumArtistName:v38];

  v39 = [(MRContentItemMetadata *)self directorName];
  v40 = (void *)[v39 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setDirectorName:v40];

  v41 = [(MRContentItemMetadata *)self localizedContentRating];
  v42 = (void *)[v41 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setLocalizedContentRating:v42];

  v43 = [(MRContentItemMetadata *)self collectionIdentifier];
  v44 = (void *)[v43 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setCollectionIdentifier:v44];

  v45 = [(MRContentItemMetadata *)self profileIdentifier];
  v46 = (void *)[v45 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setProfileIdentifier:v46];

  v47 = [(MRContentItemMetadata *)self assetURL];
  v48 = [v47 absoluteString];
  [(_MRContentItemMetadataProtobuf *)v5 setAssetURLString:v48];

  v49 = [(MRContentItemMetadata *)self composer];
  v50 = (void *)[v49 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setComposer:v50];

  v51 = [(MRContentItemMetadata *)self genre];
  v52 = (void *)[v51 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setGenre:v52];

  v53 = [(MRContentItemMetadata *)self contentIdentifier];
  v54 = (void *)[v53 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setContentIdentifier:v54];

  v55 = [(MRContentItemMetadata *)self radioStationName];
  v56 = (void *)[v55 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setRadioStationName:v56];

  v57 = [(MRContentItemMetadata *)self radioStationString];
  v58 = (void *)[v57 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setRadioStationString:v58];

  v59 = [(MRContentItemMetadata *)self seriesName];
  v60 = (void *)[v59 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setSeriesName:v60];

  v61 = [(MRContentItemMetadata *)self lyricsURL];
  v62 = [v61 absoluteString];
  [(_MRContentItemMetadataProtobuf *)v5 setLyricsURL:v62];

  v63 = [(MRContentItemMetadata *)self serviceIdentifier];
  v64 = (void *)[v63 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setServiceIdentifier:v64];

  v65 = [(MRContentItemMetadata *)self brandIdentifier];
  v66 = (void *)[v65 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setBrandIdentifier:v66];

  v67 = [(MRContentItemMetadata *)self localizedDurationString];
  v68 = (void *)[v67 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setLocalizedDurationString:v68];

  v69 = [(MRContentItemMetadata *)self durationStringLocalizationKey];
  v70 = (void *)[v69 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setDurationStringLocalizationKey:v70];

  v71 = [(MRContentItemMetadata *)self artworkIdentifier];
  v72 = (void *)[v71 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setArtworkIdentifier:v72];

  v73 = [(MRContentItemMetadata *)self artworkMIMEType];
  v74 = (void *)[v73 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setArtworkMIMEType:v74];

  v75 = [(MRContentItemMetadata *)self artworkURL];
  v76 = [v75 absoluteString];
  [(_MRContentItemMetadataProtobuf *)v5 setArtworkURL:v76];

  v77 = [(MRContentItemMetadata *)self artworkFileURL];
  v78 = [v77 absoluteString];
  [(_MRContentItemMetadataProtobuf *)v5 setArtworkFileURL:v78];

  v79 = [(MRContentItemMetadata *)self albumYear];
  v80 = (void *)[v79 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setAlbumYear:v80];

  v81 = [(MRContentItemMetadata *)self internationalStandardRecordingCode];
  v82 = (void *)[v81 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setInternationalStandardRecordingCode:v82];

  v83 = [(MRContentItemMetadata *)self participantName];
  v84 = (void *)[v83 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setParticipantName:v84];

  v85 = [(MRContentItemMetadata *)self participantIdentifier];
  v86 = (void *)[v85 copy];
  [(_MRContentItemMetadataProtobuf *)v5 setParticipantIdentifier:v86];

  [(_MRContentItemMetadataProtobuf *)v5 setIsResolvableParticipant:[(MRContentItemMetadata *)self isResolvableParticipant]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasIsResolvableParticipant:[(MRContentItemMetadata *)self hasIsResolvableParticipant]];
  [(_MRContentItemMetadataProtobuf *)v5 setExcludeFromSuggestions:[(MRContentItemMetadata *)self excludeFromSuggestions]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasExcludeFromSuggestions:[(MRContentItemMetadata *)self hasExcludeFromSuggestions]];
  [(_MRContentItemMetadataProtobuf *)v5 setSongTraits:[(MRContentItemMetadata *)self songTraits]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasSongTraits:[(MRContentItemMetadata *)self hasSongTraits]];
  [(_MRContentItemMetadataProtobuf *)v5 setAlbumTraits:[(MRContentItemMetadata *)self albumTraits]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasAlbumTraits:[(MRContentItemMetadata *)self hasAlbumTraits]];
  [(_MRContentItemMetadataProtobuf *)v5 setPlaylistTraits:[(MRContentItemMetadata *)self playlistTraits]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasPlaylistTraits:[(MRContentItemMetadata *)self hasPlaylistTraits]];
  v87 = [(MRContentItemMetadata *)self preferredFormat];
  if (v87)
  {
    v88 = [(MRContentItemMetadata *)self preferredFormat];
    v89 = [v88 protobuf];
    [(_MRContentItemMetadataProtobuf *)v5 setPreferredFormat:v89];
  }
  else
  {
    [(_MRContentItemMetadataProtobuf *)v5 setPreferredFormat:0];
  }

  v90 = [(MRContentItemMetadata *)self activeFormat];
  if (v90)
  {
    v91 = [(MRContentItemMetadata *)self activeFormat];
    v92 = [v91 protobuf];
    [(_MRContentItemMetadataProtobuf *)v5 setActiveFormat:v92];
  }
  else
  {
    [(_MRContentItemMetadataProtobuf *)v5 setActiveFormat:0];
  }

  [(_MRContentItemMetadataProtobuf *)v5 setActiveFormatJustification:[(MRContentItemMetadata *)self activeFormatJustification]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasActiveFormatJustification:[(MRContentItemMetadata *)self hasActiveFormatJustification]];
  [(_MRContentItemMetadataProtobuf *)v5 setFormatTierPreference:[(MRContentItemMetadata *)self formatTierPreference]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasFormatTierPreference:[(MRContentItemMetadata *)self hasFormatTierPreference]];
  v93 = [(MRContentItemMetadata *)self audioRoute];
  if (v93)
  {
    v94 = [(MRContentItemMetadata *)self audioRoute];
    v95 = [v94 protobuf];
    [(_MRContentItemMetadataProtobuf *)v5 setAudioRoute:v95];
  }
  else
  {
    [(_MRContentItemMetadataProtobuf *)v5 setAudioRoute:0];
  }

  v96 = [(MRContentItemMetadata *)self alternativeFormats];

  if (v96)
  {
    [(_MRContentItemMetadataProtobuf *)v5 setHasAlternativeFormats:1];
    v97 = [(MRContentItemMetadata *)self alternativeFormats];
    v98 = objc_msgSend(v97, "msv_map:", &__block_literal_global_7);
    v99 = (void *)[v98 mutableCopy];
    [(_MRContentItemMetadataProtobuf *)v5 setAlternativeFormats:v99];
  }
  v100 = [(MRContentItemMetadata *)self artworkURLTemplates];
  uint64_t v101 = [v100 count];

  if (v101)
  {
    v102 = [(MRContentItemMetadata *)self artworkURLTemplates];
    v103 = MREncodeObjectWithEncoding(v102, a3);
    [(_MRContentItemMetadataProtobuf *)v5 setArtworkURLTemplatesData:v103];
  }
  [(_MRContentItemMetadataProtobuf *)v5 setReportingAdamID:[(MRContentItemMetadata *)self reportingAdamID]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasReportingAdamID:[(MRContentItemMetadata *)self hasReportingAdamID]];
  [(_MRContentItemMetadataProtobuf *)v5 setLyricsAdamID:[(MRContentItemMetadata *)self lyricsAdamID]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasLyricsAdamID:[(MRContentItemMetadata *)self hasLyricsAdamID]];
  [(_MRContentItemMetadataProtobuf *)v5 setITunesStoreAlbumArtistIdentifier:[(MRContentItemMetadata *)self iTunesStoreAlbumArtistIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasITunesStoreAlbumArtistIdentifier:[(MRContentItemMetadata *)self hasITunesStoreAlbumArtistIdentifier]];
  [(_MRContentItemMetadataProtobuf *)v5 setTranscriptAlignmentsAvailable:[(MRContentItemMetadata *)self transcriptAlignmentsAvailable]];
  [(_MRContentItemMetadataProtobuf *)v5 setHasTranscriptAlignmentsAvailable:[(MRContentItemMetadata *)self hasTranscriptAlignmentsAvailable]];

  return v5;
}

- (int64_t)iTunesStoreSubscriptionIdentifier
{
  return self->_iTunesStoreSubscriptionIdentifier;
}

- (int64_t)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v114 = (MRContentItemMetadata *)a3;
  if (self != v114)
  {
    if ([(MRContentItemMetadata *)v114 hasContainer]) {
      [(MRContentItemMetadata *)self setContainer:[(MRContentItemMetadata *)v114 isContainer]];
    }
    if ([(MRContentItemMetadata *)v114 hasPlayable]) {
      [(MRContentItemMetadata *)self setPlayable:[(MRContentItemMetadata *)v114 isPlayable]];
    }
    if ([(MRContentItemMetadata *)v114 hasExplicitItem]) {
      [(MRContentItemMetadata *)self setExplicitItem:[(MRContentItemMetadata *)v114 isExplicitItem]];
    }
    if ([(MRContentItemMetadata *)v114 hasStreamingContent]) {
      [(MRContentItemMetadata *)self setStreamingContent:[(MRContentItemMetadata *)v114 isStreamingContent]];
    }
    if ([(MRContentItemMetadata *)v114 hasCurrentlyPlaying]) {
      [(MRContentItemMetadata *)self setCurrentlyPlaying:[(MRContentItemMetadata *)v114 isCurrentlyPlaying]];
    }
    if ([(MRContentItemMetadata *)v114 hasAlwaysLive]) {
      [(MRContentItemMetadata *)self setAlwaysLive:[(MRContentItemMetadata *)v114 isAlwaysLive]];
    }
    if ([(MRContentItemMetadata *)v114 hasSharable]) {
      [(MRContentItemMetadata *)self setSharable:[(MRContentItemMetadata *)v114 isSharable]];
    }
    if ([(MRContentItemMetadata *)v114 hasLiked]) {
      [(MRContentItemMetadata *)self setLiked:[(MRContentItemMetadata *)v114 isLiked]];
    }
    if ([(MRContentItemMetadata *)v114 hasInWishList]) {
      [(MRContentItemMetadata *)self setInWishList:[(MRContentItemMetadata *)v114 isInWishList]];
    }
    if ([(MRContentItemMetadata *)v114 hasAdvertisement]) {
      [(MRContentItemMetadata *)self setAdvertisement:[(MRContentItemMetadata *)v114 isAdvertisement]];
    }
    if ([(MRContentItemMetadata *)v114 hasSteerable]) {
      [(MRContentItemMetadata *)self setSteerable:[(MRContentItemMetadata *)v114 isSteerable]];
    }
    if ([(MRContentItemMetadata *)v114 hasLoading]) {
      [(MRContentItemMetadata *)self setLoading:[(MRContentItemMetadata *)v114 isLoading]];
    }
    if ([(MRContentItemMetadata *)v114 hasInTransition]) {
      [(MRContentItemMetadata *)self setInTransition:[(MRContentItemMetadata *)v114 isInTransition]];
    }
    if ([(MRContentItemMetadata *)v114 hasArtworkAvailable]) {
      [(MRContentItemMetadata *)self setArtworkAvailable:[(MRContentItemMetadata *)v114 artworkAvailable]];
    }
    if ([(MRContentItemMetadata *)v114 hasInfoAvailable]) {
      [(MRContentItemMetadata *)self setInfoAvailable:[(MRContentItemMetadata *)v114 infoAvailable]];
    }
    if ([(MRContentItemMetadata *)v114 hasTranscriptAlignmentsAvailable]) {
      [(MRContentItemMetadata *)self setTranscriptAlignmentsAvailable:[(MRContentItemMetadata *)v114 transcriptAlignmentsAvailable]];
    }
    if ([(MRContentItemMetadata *)v114 hasLanguageOptionsAvailable]) {
      [(MRContentItemMetadata *)self setLanguageOptionsAvailable:[(MRContentItemMetadata *)v114 languageOptionsAvailable]];
    }
    if ([(MRContentItemMetadata *)v114 hasLyricsAvailable]) {
      [(MRContentItemMetadata *)self setLyricsAvailable:[(MRContentItemMetadata *)v114 lyricsAvailable]];
    }
    if ([(MRContentItemMetadata *)v114 hasPlaybackProgress])
    {
      [(MRContentItemMetadata *)v114 playbackProgress];
      -[MRContentItemMetadata setPlaybackProgress:](self, "setPlaybackProgress:");
    }
    if ([(MRContentItemMetadata *)v114 hasPlaybackRate])
    {
      [(MRContentItemMetadata *)v114 playbackRate];
      -[MRContentItemMetadata setPlaybackRate:](self, "setPlaybackRate:");
    }
    if ([(MRContentItemMetadata *)v114 hasDefaultPlaybackRate])
    {
      [(MRContentItemMetadata *)v114 defaultPlaybackRate];
      -[MRContentItemMetadata setDefaultPlaybackRate:](self, "setDefaultPlaybackRate:");
    }
    if ([(MRContentItemMetadata *)v114 hasDownloadProgress])
    {
      [(MRContentItemMetadata *)v114 downloadProgress];
      -[MRContentItemMetadata setDownloadProgress:](self, "setDownloadProgress:");
    }
    if ([(MRContentItemMetadata *)v114 hasPlaylistType]) {
      [(MRContentItemMetadata *)self setPlaylistType:[(MRContentItemMetadata *)v114 playlistType]];
    }
    if ([(MRContentItemMetadata *)v114 hasRadioStationType]) {
      [(MRContentItemMetadata *)self setRadioStationType:[(MRContentItemMetadata *)v114 radioStationType]];
    }
    if ([(MRContentItemMetadata *)v114 hasEditingStyleFlags]) {
      [(MRContentItemMetadata *)self setEditingStyleFlags:[(MRContentItemMetadata *)v114 editingStyleFlags]];
    }
    if ([(MRContentItemMetadata *)v114 hasMediaType]) {
      [(MRContentItemMetadata *)self setMediaType:[(MRContentItemMetadata *)v114 mediaType]];
    }
    if ([(MRContentItemMetadata *)v114 hasMediaSubType]) {
      [(MRContentItemMetadata *)self setMediaSubType:[(MRContentItemMetadata *)v114 mediaSubType]];
    }
    if ([(MRContentItemMetadata *)v114 hasEpisodeType]) {
      [(MRContentItemMetadata *)self setEpisodeType:[(MRContentItemMetadata *)v114 episodeType]];
    }
    if ([(MRContentItemMetadata *)v114 hasPlayCount]) {
      [(MRContentItemMetadata *)self setPlayCount:[(MRContentItemMetadata *)v114 playCount]];
    }
    if ([(MRContentItemMetadata *)v114 hasNumberOfSections]) {
      [(MRContentItemMetadata *)self setNumberOfSections:[(MRContentItemMetadata *)v114 numberOfSections]];
    }
    if ([(MRContentItemMetadata *)v114 hasChapterCount]) {
      [(MRContentItemMetadata *)self setChapterCount:[(MRContentItemMetadata *)v114 chapterCount]];
    }
    if ([(MRContentItemMetadata *)v114 hasTotalDiscCount]) {
      [(MRContentItemMetadata *)self setTotalDiscCount:[(MRContentItemMetadata *)v114 totalDiscCount]];
    }
    if ([(MRContentItemMetadata *)v114 hasTotalTrackCount]) {
      [(MRContentItemMetadata *)self setTotalTrackCount:[(MRContentItemMetadata *)v114 totalTrackCount]];
    }
    if ([(MRContentItemMetadata *)v114 hasDownloadState]) {
      [(MRContentItemMetadata *)self setDownloadState:[(MRContentItemMetadata *)v114 downloadState]];
    }
    if ([(MRContentItemMetadata *)v114 hasArtworkDataWidthDeprecated]) {
      [(MRContentItemMetadata *)self setArtworkDataWidthDeprecated:[(MRContentItemMetadata *)v114 artworkDataWidthDeprecated]];
    }
    if ([(MRContentItemMetadata *)v114 hasArtworkDataHeightDeprecated]) {
      [(MRContentItemMetadata *)self setArtworkDataHeightDeprecated:[(MRContentItemMetadata *)v114 artworkDataHeightDeprecated]];
    }
    if ([(MRContentItemMetadata *)v114 hasDuration])
    {
      [(MRContentItemMetadata *)v114 duration];
      -[MRContentItemMetadata setDuration:](self, "setDuration:");
    }
    if ([(MRContentItemMetadata *)v114 hasStartTime])
    {
      [(MRContentItemMetadata *)v114 startTime];
      -[MRContentItemMetadata setStartTime:](self, "setStartTime:");
    }
    if ([(MRContentItemMetadata *)v114 hasElapsedTime])
    {
      [(MRContentItemMetadata *)v114 elapsedTime];
      -[MRContentItemMetadata setElapsedTime:](self, "setElapsedTime:");
    }
    if ([(MRContentItemMetadata *)v114 hasElapsedTimeTimestamp])
    {
      [(MRContentItemMetadata *)v114 elapsedTimeTimestamp];
      -[MRContentItemMetadata setElapsedTimeTimestamp:](self, "setElapsedTimeTimestamp:");
    }
    if ([(MRContentItemMetadata *)v114 hasInferredTimestamp])
    {
      [(MRContentItemMetadata *)v114 inferredTimestamp];
      -[MRContentItemMetadata setInferredTimestamp:](self, "setInferredTimestamp:");
    }
    if ([(MRContentItemMetadata *)v114 hasSeasonNumber]) {
      [(MRContentItemMetadata *)self setSeasonNumber:[(MRContentItemMetadata *)v114 seasonNumber]];
    }
    if ([(MRContentItemMetadata *)v114 hasEpisodeNumber]) {
      [(MRContentItemMetadata *)self setEpisodeNumber:[(MRContentItemMetadata *)v114 episodeNumber]];
    }
    if ([(MRContentItemMetadata *)v114 hasDiscNumber]) {
      [(MRContentItemMetadata *)self setDiscNumber:[(MRContentItemMetadata *)v114 discNumber]];
    }
    if ([(MRContentItemMetadata *)v114 hasTrackNumber]) {
      [(MRContentItemMetadata *)self setTrackNumber:[(MRContentItemMetadata *)v114 trackNumber]];
    }
    if ([(MRContentItemMetadata *)v114 hasRadioStationIdentifier]) {
      [(MRContentItemMetadata *)self setRadioStationIdentifier:[(MRContentItemMetadata *)v114 radioStationIdentifier]];
    }
    if ([(MRContentItemMetadata *)v114 hasITunesStoreIdentifier]) {
      [(MRContentItemMetadata *)self setITunesStoreIdentifier:[(MRContentItemMetadata *)v114 iTunesStoreIdentifier]];
    }
    if ([(MRContentItemMetadata *)v114 hasITunesStoreSubscriptionIdentifier]) {
      [(MRContentItemMetadata *)self setITunesStoreSubscriptionIdentifier:[(MRContentItemMetadata *)v114 iTunesStoreSubscriptionIdentifier]];
    }
    if ([(MRContentItemMetadata *)v114 hasITunesStoreArtistIdentifier]) {
      [(MRContentItemMetadata *)self setITunesStoreArtistIdentifier:[(MRContentItemMetadata *)v114 iTunesStoreArtistIdentifier]];
    }
    if ([(MRContentItemMetadata *)v114 hasITunesStoreAlbumIdentifier]) {
      [(MRContentItemMetadata *)self setITunesStoreAlbumIdentifier:[(MRContentItemMetadata *)v114 iTunesStoreAlbumIdentifier]];
    }
    if ([(MRContentItemMetadata *)v114 hasLegacyUniqueIdentifier]) {
      [(MRContentItemMetadata *)self setLegacyUniqueIdentifier:[(MRContentItemMetadata *)v114 legacyUniqueIdentifier]];
    }
    if ([(MRContentItemMetadata *)v114 hasSongTraits]) {
      [(MRContentItemMetadata *)self setSongTraits:[(MRContentItemMetadata *)v114 songTraits]];
    }
    if ([(MRContentItemMetadata *)v114 hasAlbumTraits]) {
      [(MRContentItemMetadata *)self setAlbumTraits:[(MRContentItemMetadata *)v114 albumTraits]];
    }
    if ([(MRContentItemMetadata *)v114 hasPlaylistTraits]) {
      [(MRContentItemMetadata *)self setPlaylistTraits:[(MRContentItemMetadata *)v114 playlistTraits]];
    }
    if ([(MRContentItemMetadata *)v114 hasActiveFormatJustification]) {
      [(MRContentItemMetadata *)self setActiveFormatJustification:[(MRContentItemMetadata *)v114 activeFormatJustification]];
    }
    if ([(MRContentItemMetadata *)v114 hasFormatTierPreference]) {
      [(MRContentItemMetadata *)self setFormatTierPreference:[(MRContentItemMetadata *)v114 formatTierPreference]];
    }
    v4 = [(MRContentItemMetadata *)v114 purchaseInfoData];

    if (v4)
    {
      v5 = [(MRContentItemMetadata *)v114 purchaseInfoData];
      [(MRContentItemMetadata *)self setPurchaseInfoData:v5];
    }
    v6 = [(MRContentItemMetadata *)v114 appMetrics];

    if (v6)
    {
      v7 = [(MRContentItemMetadata *)v114 appMetrics];
      [(MRContentItemMetadata *)self setAppMetrics:v7];
    }
    v8 = [(MRContentItemMetadata *)v114 nowPlayingInfo];

    if (v8)
    {
      v9 = [(MRContentItemMetadata *)v114 nowPlayingInfo];
      [(MRContentItemMetadata *)self setNowPlayingInfo:v9];
    }
    v10 = [(MRContentItemMetadata *)v114 userInfo];

    if (v10)
    {
      v11 = [(MRContentItemMetadata *)v114 userInfo];
      [(MRContentItemMetadata *)self setUserInfo:v11];
    }
    v12 = [(MRContentItemMetadata *)v114 deviceSpecificUserInfo];

    if (v12)
    {
      v13 = [(MRContentItemMetadata *)v114 deviceSpecificUserInfo];
      [(MRContentItemMetadata *)self setDeviceSpecificUserInfo:v13];
    }
    v14 = [(MRContentItemMetadata *)v114 collectionInfo];

    if (v14)
    {
      v15 = [(MRContentItemMetadata *)v114 collectionInfo];
      [(MRContentItemMetadata *)self setCollectionInfo:v15];
    }
    v16 = [(MRContentItemMetadata *)v114 releaseDate];

    if (v16)
    {
      v17 = [(MRContentItemMetadata *)v114 releaseDate];
      [(MRContentItemMetadata *)self setReleaseDate:v17];
    }
    v18 = [(MRContentItemMetadata *)v114 currentPlaybackDate];

    if (v18)
    {
      v19 = [(MRContentItemMetadata *)v114 currentPlaybackDate];
      [(MRContentItemMetadata *)self setCurrentPlaybackDate:v19];
    }
    v20 = [(MRContentItemMetadata *)v114 title];

    if (v20)
    {
      v21 = [(MRContentItemMetadata *)v114 title];
      [(MRContentItemMetadata *)self setTitle:v21];
    }
    v22 = [(MRContentItemMetadata *)v114 subtitle];

    if (v22)
    {
      v23 = [(MRContentItemMetadata *)v114 subtitle];
      [(MRContentItemMetadata *)self setSubtitle:v23];
    }
    v24 = [(MRContentItemMetadata *)v114 classicalWork];

    if (v24)
    {
      v25 = [(MRContentItemMetadata *)v114 classicalWork];
      [(MRContentItemMetadata *)self setClassicalWork:v25];
    }
    v26 = [(MRContentItemMetadata *)v114 albumName];

    if (v26)
    {
      v27 = [(MRContentItemMetadata *)v114 albumName];
      [(MRContentItemMetadata *)self setAlbumName:v27];
    }
    v28 = [(MRContentItemMetadata *)v114 trackArtistName];

    if (v28)
    {
      v29 = [(MRContentItemMetadata *)v114 trackArtistName];
      [(MRContentItemMetadata *)self setTrackArtistName:v29];
    }
    v30 = [(MRContentItemMetadata *)v114 albumArtistName];

    if (v30)
    {
      v31 = [(MRContentItemMetadata *)v114 albumArtistName];
      [(MRContentItemMetadata *)self setAlbumArtistName:v31];
    }
    v32 = [(MRContentItemMetadata *)v114 directorName];

    if (v32)
    {
      v33 = [(MRContentItemMetadata *)v114 directorName];
      [(MRContentItemMetadata *)self setDirectorName:v33];
    }
    v34 = [(MRContentItemMetadata *)v114 localizedContentRating];

    if (v34)
    {
      v35 = [(MRContentItemMetadata *)v114 localizedContentRating];
      [(MRContentItemMetadata *)self setLocalizedContentRating:v35];
    }
    v36 = [(MRContentItemMetadata *)v114 collectionIdentifier];

    if (v36)
    {
      v37 = [(MRContentItemMetadata *)v114 collectionIdentifier];
      [(MRContentItemMetadata *)self setCollectionIdentifier:v37];
    }
    v38 = [(MRContentItemMetadata *)v114 profileIdentifier];

    if (v38)
    {
      v39 = [(MRContentItemMetadata *)v114 profileIdentifier];
      [(MRContentItemMetadata *)self setProfileIdentifier:v39];
    }
    v40 = [(MRContentItemMetadata *)v114 assetURL];

    if (v40)
    {
      v41 = [(MRContentItemMetadata *)v114 assetURL];
      [(MRContentItemMetadata *)self setAssetURL:v41];
    }
    v42 = [(MRContentItemMetadata *)v114 composer];

    if (v42)
    {
      v43 = [(MRContentItemMetadata *)v114 composer];
      [(MRContentItemMetadata *)self setComposer:v43];
    }
    v44 = [(MRContentItemMetadata *)v114 genre];

    if (v44)
    {
      v45 = [(MRContentItemMetadata *)v114 genre];
      [(MRContentItemMetadata *)self setGenre:v45];
    }
    v46 = [(MRContentItemMetadata *)v114 contentIdentifier];

    if (v46)
    {
      v47 = [(MRContentItemMetadata *)v114 contentIdentifier];
      [(MRContentItemMetadata *)self setContentIdentifier:v47];
    }
    v48 = [(MRContentItemMetadata *)v114 radioStationName];

    if (v48)
    {
      v49 = [(MRContentItemMetadata *)v114 radioStationName];
      [(MRContentItemMetadata *)self setRadioStationName:v49];
    }
    v50 = [(MRContentItemMetadata *)v114 radioStationString];

    if (v50)
    {
      v51 = [(MRContentItemMetadata *)v114 radioStationString];
      [(MRContentItemMetadata *)self setRadioStationString:v51];
    }
    v52 = [(MRContentItemMetadata *)v114 seriesName];

    if (v52)
    {
      v53 = [(MRContentItemMetadata *)v114 seriesName];
      [(MRContentItemMetadata *)self setSeriesName:v53];
    }
    v54 = [(MRContentItemMetadata *)v114 lyricsURL];

    if (v54)
    {
      v55 = [(MRContentItemMetadata *)v114 lyricsURL];
      [(MRContentItemMetadata *)self setLyricsURL:v55];
    }
    v56 = [(MRContentItemMetadata *)v114 serviceIdentifier];

    if (v56)
    {
      v57 = [(MRContentItemMetadata *)v114 serviceIdentifier];
      [(MRContentItemMetadata *)self setServiceIdentifier:v57];
    }
    v58 = [(MRContentItemMetadata *)v114 brandIdentifier];

    if (v58)
    {
      v59 = [(MRContentItemMetadata *)v114 brandIdentifier];
      [(MRContentItemMetadata *)self setBrandIdentifier:v59];
    }
    v60 = [(MRContentItemMetadata *)v114 localizedDurationString];

    if (v60)
    {
      v61 = [(MRContentItemMetadata *)v114 localizedDurationString];
      [(MRContentItemMetadata *)self setLocalizedDurationString:v61];
    }
    v62 = [(MRContentItemMetadata *)v114 durationStringLocalizationKey];

    if (v62)
    {
      v63 = [(MRContentItemMetadata *)v114 durationStringLocalizationKey];
      [(MRContentItemMetadata *)self setDurationStringLocalizationKey:v63];
    }
    v64 = [(MRContentItemMetadata *)v114 artworkIdentifier];

    if (v64)
    {
      v65 = [(MRContentItemMetadata *)v114 artworkIdentifier];
      [(MRContentItemMetadata *)self setArtworkIdentifier:v65];
    }
    v66 = [(MRContentItemMetadata *)v114 artworkMIMEType];

    if (v66)
    {
      v67 = [(MRContentItemMetadata *)v114 artworkMIMEType];
      [(MRContentItemMetadata *)self setArtworkMIMEType:v67];
    }
    v68 = [(MRContentItemMetadata *)v114 artworkURL];

    if (v68)
    {
      v69 = [(MRContentItemMetadata *)v114 artworkURL];
      [(MRContentItemMetadata *)self setArtworkURL:v69];
    }
    v70 = [(MRContentItemMetadata *)v114 artworkFileURL];

    if (v70)
    {
      v71 = [(MRContentItemMetadata *)v114 artworkFileURL];
      [(MRContentItemMetadata *)self setArtworkFileURL:v71];
    }
    v72 = [(MRContentItemMetadata *)v114 artworkURLTemplates];

    if (v72)
    {
      v73 = [(MRContentItemMetadata *)v114 artworkURLTemplates];
      [(MRContentItemMetadata *)self setArtworkURLTemplates:v73];
    }
    v74 = [(MRContentItemMetadata *)v114 albumYear];

    if (v74)
    {
      v75 = [(MRContentItemMetadata *)v114 albumYear];
      [(MRContentItemMetadata *)self setAlbumYear:v75];
    }
    v76 = [(MRContentItemMetadata *)v114 preferredFormat];

    if (v76)
    {
      v77 = [(MRContentItemMetadata *)v114 preferredFormat];
      [(MRContentItemMetadata *)self setPreferredFormat:v77];
    }
    v78 = [(MRContentItemMetadata *)v114 activeFormat];

    if (v78)
    {
      v79 = [(MRContentItemMetadata *)v114 activeFormat];
      [(MRContentItemMetadata *)self setActiveFormat:v79];
    }
    v80 = [(MRContentItemMetadata *)v114 audioRoute];

    if (v80)
    {
      v81 = [(MRContentItemMetadata *)v114 audioRoute];
      [(MRContentItemMetadata *)self setAudioRoute:v81];
    }
    v82 = [(MRContentItemMetadata *)v114 alternativeFormats];

    if (v82)
    {
      v83 = [(MRContentItemMetadata *)v114 alternativeFormats];
      [(MRContentItemMetadata *)self setAlternativeFormats:v83];
    }
    v84 = [(MRContentItemMetadata *)v114 participantName];

    if (v84)
    {
      v85 = [(MRContentItemMetadata *)v114 participantName];
      [(MRContentItemMetadata *)self setParticipantName:v85];
    }
    v86 = [(MRContentItemMetadata *)v114 participantIdentifier];

    if (v86)
    {
      v87 = [(MRContentItemMetadata *)v114 participantIdentifier];
      [(MRContentItemMetadata *)self setParticipantIdentifier:v87];
    }
    if ([(MRContentItemMetadata *)v114 hasIsResolvableParticipant]) {
      [(MRContentItemMetadata *)self setIsResolvableParticipant:[(MRContentItemMetadata *)v114 isResolvableParticipant]];
    }
    if ([(MRContentItemMetadata *)v114 hasExcludeFromSuggestions]) {
      [(MRContentItemMetadata *)self setExcludeFromSuggestions:[(MRContentItemMetadata *)v114 excludeFromSuggestions]];
    }
    v88 = [(MRContentItemMetadata *)v114 assetURL];

    if (v88)
    {
      v89 = [(MRContentItemMetadata *)v114 assetURL];
      assetURL = self->_assetURL;
      self->_assetURL = v89;
    }
    v91 = [(MRContentItemMetadata *)v114 userInfo];

    if (v91)
    {
      v92 = [(MRContentItemMetadata *)v114 userInfo];
      userInfo = self->_userInfo;
      self->_userInfo = v92;
    }
    v94 = [(MRContentItemMetadata *)v114 appMetrics];

    if (v94)
    {
      v95 = [(MRContentItemMetadata *)v114 appMetrics];
      appMetrics = self->_appMetrics;
      self->_appMetrics = v95;
    }
    v97 = [(MRContentItemMetadata *)v114 nowPlayingInfo];

    if (v97)
    {
      v98 = [(MRContentItemMetadata *)v114 nowPlayingInfo];
      nowPlayingInfo = self->_nowPlayingInfo;
      self->_nowPlayingInfo = v98;
    }
    v100 = [(MRContentItemMetadata *)v114 collectionInfo];

    if (v100)
    {
      uint64_t v101 = [(MRContentItemMetadata *)v114 collectionInfo];
      collectionInfo = self->_collectionInfo;
      self->_collectionInfo = v101;
    }
    v103 = [(MRContentItemMetadata *)v114 currentPlaybackDate];

    if (v103)
    {
      v104 = [(MRContentItemMetadata *)v114 currentPlaybackDate];
      currentPlaybackDate = self->_currentPlaybackDate;
      self->_currentPlaybackDate = v104;
    }
    v106 = [(MRContentItemMetadata *)v114 deviceSpecificUserInfo];

    if (v106)
    {
      v107 = [(MRContentItemMetadata *)v114 deviceSpecificUserInfo];
      deviceSpecificUserInfo = self->_deviceSpecificUserInfo;
      self->_deviceSpecificUserInfo = v107;
    }
    v109 = [(MRContentItemMetadata *)v114 artworkURLTemplates];

    if (v109)
    {
      v110 = [(MRContentItemMetadata *)v114 artworkURLTemplates];
      artworkURLTemplates = self->_artworkURLTemplates;
      self->_artworkURLTemplates = v110;
    }
    if ([(MRContentItemMetadata *)v114 hasReportingAdamID]) {
      [(MRContentItemMetadata *)self setReportingAdamID:[(MRContentItemMetadata *)v114 reportingAdamID]];
    }
    if ([(MRContentItemMetadata *)v114 hasLyricsAdamID]) {
      [(MRContentItemMetadata *)self setLyricsAdamID:[(MRContentItemMetadata *)v114 lyricsAdamID]];
    }
    if ([(MRContentItemMetadata *)v114 hasITunesStoreAlbumArtistIdentifier]) {
      [(MRContentItemMetadata *)self setITunesStoreAlbumArtistIdentifier:[(MRContentItemMetadata *)v114 iTunesStoreAlbumArtistIdentifier]];
    }
    v112 = [(MRContentItemMetadata *)v114 internationalStandardRecordingCode];

    if (v112)
    {
      v113 = [(MRContentItemMetadata *)v114 internationalStandardRecordingCode];
      [(MRContentItemMetadata *)self setInternationalStandardRecordingCode:v113];
    }
  }
}

- (NSDictionary)collectionInfo
{
  return self->_collectionInfo;
}

- (NSDictionary)deviceSpecificUserInfo
{
  return self->_deviceSpecificUserInfo;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(MRContentItemMetadata *)self hasContainer]) {
    objc_msgSend(v5, "setContainer:", -[MRContentItemMetadata isContainer](self, "isContainer"));
  }
  if ([(MRContentItemMetadata *)self hasPlayable]) {
    objc_msgSend(v5, "setPlayable:", -[MRContentItemMetadata isPlayable](self, "isPlayable"));
  }
  if ([(MRContentItemMetadata *)self hasExplicitItem]) {
    objc_msgSend(v5, "setExplicitItem:", -[MRContentItemMetadata isExplicitItem](self, "isExplicitItem"));
  }
  if ([(MRContentItemMetadata *)self hasStreamingContent]) {
    objc_msgSend(v5, "setStreamingContent:", -[MRContentItemMetadata isStreamingContent](self, "isStreamingContent"));
  }
  if ([(MRContentItemMetadata *)self hasCurrentlyPlaying]) {
    objc_msgSend(v5, "setCurrentlyPlaying:", -[MRContentItemMetadata isCurrentlyPlaying](self, "isCurrentlyPlaying"));
  }
  if ([(MRContentItemMetadata *)self hasAlwaysLive]) {
    objc_msgSend(v5, "setAlwaysLive:", -[MRContentItemMetadata isAlwaysLive](self, "isAlwaysLive"));
  }
  if ([(MRContentItemMetadata *)self hasSharable]) {
    objc_msgSend(v5, "setSharable:", -[MRContentItemMetadata isSharable](self, "isSharable"));
  }
  if ([(MRContentItemMetadata *)self hasLiked]) {
    objc_msgSend(v5, "setLiked:", -[MRContentItemMetadata isLiked](self, "isLiked"));
  }
  if ([(MRContentItemMetadata *)self hasInWishList]) {
    objc_msgSend(v5, "setInWishList:", -[MRContentItemMetadata isInWishList](self, "isInWishList"));
  }
  if ([(MRContentItemMetadata *)self hasAdvertisement]) {
    objc_msgSend(v5, "setAdvertisement:", -[MRContentItemMetadata isAdvertisement](self, "isAdvertisement"));
  }
  if ([(MRContentItemMetadata *)self hasSteerable]) {
    objc_msgSend(v5, "setSteerable:", -[MRContentItemMetadata isSteerable](self, "isSteerable"));
  }
  if ([(MRContentItemMetadata *)self hasLoading]) {
    objc_msgSend(v5, "setLoading:", -[MRContentItemMetadata isLoading](self, "isLoading"));
  }
  if ([(MRContentItemMetadata *)self hasInTransition]) {
    objc_msgSend(v5, "setInTransition:", -[MRContentItemMetadata isInTransition](self, "isInTransition"));
  }
  if ([(MRContentItemMetadata *)self hasArtworkAvailable]) {
    objc_msgSend(v5, "setArtworkAvailable:", -[MRContentItemMetadata artworkAvailable](self, "artworkAvailable"));
  }
  if ([(MRContentItemMetadata *)self hasInfoAvailable]) {
    objc_msgSend(v5, "setInfoAvailable:", -[MRContentItemMetadata infoAvailable](self, "infoAvailable"));
  }
  if ([(MRContentItemMetadata *)self hasTranscriptAlignmentsAvailable]) {
    objc_msgSend(v5, "setTranscriptAlignmentsAvailable:", -[MRContentItemMetadata transcriptAlignmentsAvailable](self, "transcriptAlignmentsAvailable"));
  }
  if ([(MRContentItemMetadata *)self hasLanguageOptionsAvailable]) {
    objc_msgSend(v5, "setLanguageOptionsAvailable:", -[MRContentItemMetadata languageOptionsAvailable](self, "languageOptionsAvailable"));
  }
  if ([(MRContentItemMetadata *)self hasLyricsAvailable]) {
    objc_msgSend(v5, "setLyricsAvailable:", -[MRContentItemMetadata lyricsAvailable](self, "lyricsAvailable"));
  }
  if ([(MRContentItemMetadata *)self hasPlaybackProgress])
  {
    [(MRContentItemMetadata *)self playbackProgress];
    objc_msgSend(v5, "setPlaybackProgress:");
  }
  if ([(MRContentItemMetadata *)self hasPlaybackRate])
  {
    [(MRContentItemMetadata *)self playbackRate];
    objc_msgSend(v5, "setPlaybackRate:");
  }
  if ([(MRContentItemMetadata *)self hasDefaultPlaybackRate])
  {
    [(MRContentItemMetadata *)self defaultPlaybackRate];
    objc_msgSend(v5, "setDefaultPlaybackRate:");
  }
  if ([(MRContentItemMetadata *)self hasDownloadProgress])
  {
    [(MRContentItemMetadata *)self downloadProgress];
    objc_msgSend(v5, "setDownloadProgress:");
  }
  if ([(MRContentItemMetadata *)self hasPlaylistType]) {
    objc_msgSend(v5, "setPlaylistType:", -[MRContentItemMetadata playlistType](self, "playlistType"));
  }
  if ([(MRContentItemMetadata *)self hasRadioStationType]) {
    objc_msgSend(v5, "setRadioStationType:", -[MRContentItemMetadata radioStationType](self, "radioStationType"));
  }
  if ([(MRContentItemMetadata *)self hasEditingStyleFlags]) {
    objc_msgSend(v5, "setEditingStyleFlags:", -[MRContentItemMetadata editingStyleFlags](self, "editingStyleFlags"));
  }
  if ([(MRContentItemMetadata *)self hasMediaType]) {
    objc_msgSend(v5, "setMediaType:", -[MRContentItemMetadata mediaType](self, "mediaType"));
  }
  if ([(MRContentItemMetadata *)self hasMediaSubType]) {
    objc_msgSend(v5, "setMediaSubType:", -[MRContentItemMetadata mediaSubType](self, "mediaSubType"));
  }
  if ([(MRContentItemMetadata *)self hasEpisodeType]) {
    objc_msgSend(v5, "setEpisodeType:", -[MRContentItemMetadata episodeType](self, "episodeType"));
  }
  if ([(MRContentItemMetadata *)self hasPlayCount]) {
    objc_msgSend(v5, "setPlayCount:", -[MRContentItemMetadata playCount](self, "playCount"));
  }
  if ([(MRContentItemMetadata *)self hasNumberOfSections]) {
    objc_msgSend(v5, "setNumberOfSections:", -[MRContentItemMetadata numberOfSections](self, "numberOfSections"));
  }
  if ([(MRContentItemMetadata *)self hasChapterCount]) {
    objc_msgSend(v5, "setChapterCount:", -[MRContentItemMetadata chapterCount](self, "chapterCount"));
  }
  if ([(MRContentItemMetadata *)self hasTotalDiscCount]) {
    objc_msgSend(v5, "setTotalDiscCount:", -[MRContentItemMetadata totalDiscCount](self, "totalDiscCount"));
  }
  if ([(MRContentItemMetadata *)self hasTotalTrackCount]) {
    objc_msgSend(v5, "setTotalTrackCount:", -[MRContentItemMetadata totalTrackCount](self, "totalTrackCount"));
  }
  if ([(MRContentItemMetadata *)self hasDownloadState]) {
    objc_msgSend(v5, "setDownloadState:", -[MRContentItemMetadata downloadState](self, "downloadState"));
  }
  if ([(MRContentItemMetadata *)self hasArtworkDataWidthDeprecated]) {
    objc_msgSend(v5, "setArtworkDataWidthDeprecated:", -[MRContentItemMetadata artworkDataWidthDeprecated](self, "artworkDataWidthDeprecated"));
  }
  if ([(MRContentItemMetadata *)self hasArtworkDataHeightDeprecated]) {
    objc_msgSend(v5, "setArtworkDataHeightDeprecated:", -[MRContentItemMetadata artworkDataHeightDeprecated](self, "artworkDataHeightDeprecated"));
  }
  if ([(MRContentItemMetadata *)self hasDuration])
  {
    [(MRContentItemMetadata *)self duration];
    objc_msgSend(v5, "setDuration:");
  }
  if ([(MRContentItemMetadata *)self hasStartTime])
  {
    [(MRContentItemMetadata *)self startTime];
    objc_msgSend(v5, "setStartTime:");
  }
  if ([(MRContentItemMetadata *)self hasElapsedTime])
  {
    [(MRContentItemMetadata *)self elapsedTime];
    objc_msgSend(v5, "setElapsedTime:");
  }
  if ([(MRContentItemMetadata *)self hasElapsedTimeTimestamp])
  {
    [(MRContentItemMetadata *)self elapsedTimeTimestamp];
    objc_msgSend(v5, "setElapsedTimeTimestamp:");
  }
  if ([(MRContentItemMetadata *)self hasInferredTimestamp])
  {
    [(MRContentItemMetadata *)self inferredTimestamp];
    objc_msgSend(v5, "setInferredTimestamp:");
  }
  if ([(MRContentItemMetadata *)self hasSeasonNumber]) {
    objc_msgSend(v5, "setSeasonNumber:", -[MRContentItemMetadata seasonNumber](self, "seasonNumber"));
  }
  if ([(MRContentItemMetadata *)self hasEpisodeNumber]) {
    objc_msgSend(v5, "setEpisodeNumber:", -[MRContentItemMetadata episodeNumber](self, "episodeNumber"));
  }
  if ([(MRContentItemMetadata *)self hasDiscNumber]) {
    objc_msgSend(v5, "setDiscNumber:", -[MRContentItemMetadata discNumber](self, "discNumber"));
  }
  if ([(MRContentItemMetadata *)self hasTrackNumber]) {
    objc_msgSend(v5, "setTrackNumber:", -[MRContentItemMetadata trackNumber](self, "trackNumber"));
  }
  if ([(MRContentItemMetadata *)self hasRadioStationIdentifier]) {
    objc_msgSend(v5, "setRadioStationIdentifier:", -[MRContentItemMetadata radioStationIdentifier](self, "radioStationIdentifier"));
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreIdentifier]) {
    objc_msgSend(v5, "setITunesStoreIdentifier:", -[MRContentItemMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier"));
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreSubscriptionIdentifier]) {
    objc_msgSend(v5, "setITunesStoreSubscriptionIdentifier:", -[MRContentItemMetadata iTunesStoreSubscriptionIdentifier](self, "iTunesStoreSubscriptionIdentifier"));
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreArtistIdentifier]) {
    objc_msgSend(v5, "setITunesStoreArtistIdentifier:", -[MRContentItemMetadata iTunesStoreArtistIdentifier](self, "iTunesStoreArtistIdentifier"));
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreAlbumIdentifier]) {
    objc_msgSend(v5, "setITunesStoreAlbumIdentifier:", -[MRContentItemMetadata iTunesStoreAlbumIdentifier](self, "iTunesStoreAlbumIdentifier"));
  }
  if ([(MRContentItemMetadata *)self hasLegacyUniqueIdentifier]) {
    objc_msgSend(v5, "setLegacyUniqueIdentifier:", -[MRContentItemMetadata legacyUniqueIdentifier](self, "legacyUniqueIdentifier"));
  }
  if ([(MRContentItemMetadata *)self hasSongTraits]) {
    objc_msgSend(v5, "setSongTraits:", -[MRContentItemMetadata songTraits](self, "songTraits"));
  }
  if ([(MRContentItemMetadata *)self hasAlbumTraits]) {
    objc_msgSend(v5, "setAlbumTraits:", -[MRContentItemMetadata albumTraits](self, "albumTraits"));
  }
  if ([(MRContentItemMetadata *)self hasPlaylistTraits]) {
    objc_msgSend(v5, "setPlaylistTraits:", -[MRContentItemMetadata playlistTraits](self, "playlistTraits"));
  }
  if ([(MRContentItemMetadata *)self hasActiveFormatJustification]) {
    objc_msgSend(v5, "setActiveFormatJustification:", -[MRContentItemMetadata activeFormatJustification](self, "activeFormatJustification"));
  }
  if ([(MRContentItemMetadata *)self hasFormatTierPreference]) {
    objc_msgSend(v5, "setFormatTierPreference:", -[MRContentItemMetadata formatTierPreference](self, "formatTierPreference"));
  }
  v6 = [(MRContentItemMetadata *)self purchaseInfoData];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setPurchaseInfoData:v7];

  v8 = [(MRContentItemMetadata *)self appMetrics];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAppMetrics:v9];

  v10 = [(MRContentItemMetadata *)self nowPlayingInfo];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setNowPlayingInfo:v11];

  v12 = [(MRContentItemMetadata *)self userInfo];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setUserInfo:v13];

  v14 = [(MRContentItemMetadata *)self deviceSpecificUserInfo];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setDeviceSpecificUserInfo:v15];

  v16 = [(MRContentItemMetadata *)self collectionInfo];
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setCollectionInfo:v17];

  v18 = [(MRContentItemMetadata *)self releaseDate];
  v19 = (void *)[v18 copyWithZone:a3];
  [v5 setReleaseDate:v19];

  v20 = [(MRContentItemMetadata *)self currentPlaybackDate];
  v21 = (void *)[v20 copyWithZone:a3];
  [v5 setCurrentPlaybackDate:v21];

  v22 = [(MRContentItemMetadata *)self title];
  v23 = (void *)[v22 copyWithZone:a3];
  [v5 setTitle:v23];

  v24 = [(MRContentItemMetadata *)self subtitle];
  v25 = (void *)[v24 copyWithZone:a3];
  [v5 setSubtitle:v25];

  v26 = [(MRContentItemMetadata *)self classicalWork];
  v27 = (void *)[v26 copyWithZone:a3];
  [v5 setClassicalWork:v27];

  v28 = [(MRContentItemMetadata *)self albumName];
  v29 = (void *)[v28 copyWithZone:a3];
  [v5 setAlbumName:v29];

  v30 = [(MRContentItemMetadata *)self trackArtistName];
  v31 = (void *)[v30 copyWithZone:a3];
  [v5 setTrackArtistName:v31];

  v32 = [(MRContentItemMetadata *)self albumArtistName];
  v33 = (void *)[v32 copyWithZone:a3];
  [v5 setAlbumArtistName:v33];

  v34 = [(MRContentItemMetadata *)self directorName];
  v35 = (void *)[v34 copyWithZone:a3];
  [v5 setDirectorName:v35];

  v36 = [(MRContentItemMetadata *)self localizedContentRating];
  v37 = (void *)[v36 copyWithZone:a3];
  [v5 setLocalizedContentRating:v37];

  v38 = [(MRContentItemMetadata *)self collectionIdentifier];
  v39 = (void *)[v38 copyWithZone:a3];
  [v5 setCollectionIdentifier:v39];

  v40 = [(MRContentItemMetadata *)self profileIdentifier];
  v41 = (void *)[v40 copyWithZone:a3];
  [v5 setProfileIdentifier:v41];

  v42 = [(MRContentItemMetadata *)self assetURL];
  v43 = (void *)[v42 copyWithZone:a3];
  [v5 setAssetURL:v43];

  v44 = [(MRContentItemMetadata *)self composer];
  v45 = (void *)[v44 copyWithZone:a3];
  [v5 setComposer:v45];

  v46 = [(MRContentItemMetadata *)self genre];
  v47 = (void *)[v46 copyWithZone:a3];
  [v5 setGenre:v47];

  v48 = [(MRContentItemMetadata *)self contentIdentifier];
  v49 = (void *)[v48 copyWithZone:a3];
  [v5 setContentIdentifier:v49];

  v50 = [(MRContentItemMetadata *)self radioStationName];
  v51 = (void *)[v50 copyWithZone:a3];
  [v5 setRadioStationName:v51];

  v52 = [(MRContentItemMetadata *)self radioStationString];
  v53 = (void *)[v52 copyWithZone:a3];
  [v5 setRadioStationString:v53];

  v54 = [(MRContentItemMetadata *)self seriesName];
  v55 = (void *)[v54 copyWithZone:a3];
  [v5 setSeriesName:v55];

  v56 = [(MRContentItemMetadata *)self lyricsURL];
  v57 = (void *)[v56 copyWithZone:a3];
  [v5 setLyricsURL:v57];

  v58 = [(MRContentItemMetadata *)self serviceIdentifier];
  v59 = (void *)[v58 copyWithZone:a3];
  [v5 setServiceIdentifier:v59];

  v60 = [(MRContentItemMetadata *)self brandIdentifier];
  v61 = (void *)[v60 copyWithZone:a3];
  [v5 setBrandIdentifier:v61];

  v62 = [(MRContentItemMetadata *)self localizedDurationString];
  v63 = (void *)[v62 copyWithZone:a3];
  [v5 setLocalizedDurationString:v63];

  v64 = [(MRContentItemMetadata *)self durationStringLocalizationKey];
  v65 = (void *)[v64 copyWithZone:a3];
  [v5 setDurationStringLocalizationKey:v65];

  v66 = [(MRContentItemMetadata *)self artworkIdentifier];
  v67 = (void *)[v66 copyWithZone:a3];
  [v5 setArtworkIdentifier:v67];

  v68 = [(MRContentItemMetadata *)self artworkMIMEType];
  v69 = (void *)[v68 copyWithZone:a3];
  [v5 setArtworkMIMEType:v69];

  v70 = [(MRContentItemMetadata *)self artworkURL];
  v71 = (void *)[v70 copyWithZone:a3];
  [v5 setArtworkURL:v71];

  v72 = [(MRContentItemMetadata *)self artworkFileURL];
  v73 = (void *)[v72 copyWithZone:a3];
  [v5 setArtworkFileURL:v73];

  v74 = [(MRContentItemMetadata *)self artworkURLTemplates];
  v75 = (void *)[v74 copyWithZone:a3];
  [v5 setArtworkURLTemplates:v75];

  v76 = [(MRContentItemMetadata *)self albumYear];
  v77 = (void *)[v76 copyWithZone:a3];
  [v5 setAlbumYear:v77];

  v78 = [(MRContentItemMetadata *)self participantName];
  v79 = (void *)[v78 copyWithZone:a3];
  [v5 setParticipantName:v79];

  v80 = [(MRContentItemMetadata *)self participantIdentifier];
  v81 = (void *)[v80 copyWithZone:a3];
  [v5 setParticipantIdentifier:v81];

  if ([(MRContentItemMetadata *)self hasIsResolvableParticipant]) {
    objc_msgSend(v5, "setIsResolvableParticipant:", -[MRContentItemMetadata isResolvableParticipant](self, "isResolvableParticipant"));
  }
  if ([(MRContentItemMetadata *)self hasExcludeFromSuggestions]) {
    objc_msgSend(v5, "setExcludeFromSuggestions:", -[MRContentItemMetadata excludeFromSuggestions](self, "excludeFromSuggestions"));
  }
  v82 = [(MRContentItemMetadata *)self preferredFormat];
  v83 = (void *)[v82 copyWithZone:a3];
  [v5 setPreferredFormat:v83];

  v84 = [(MRContentItemMetadata *)self activeFormat];
  v85 = (void *)[v84 copyWithZone:a3];
  [v5 setActiveFormat:v85];

  v86 = [(MRContentItemMetadata *)self audioRoute];
  v87 = (void *)[v86 copyWithZone:a3];
  [v5 setAudioRoute:v87];

  v88 = [(MRContentItemMetadata *)self alternativeFormats];
  if (v88)
  {
    id v89 = objc_alloc(MEMORY[0x1E4F1C978]);
    v90 = [(MRContentItemMetadata *)self alternativeFormats];
    v91 = (void *)[v89 initWithArray:v90 copyItems:1];
    [v5 setAlternativeFormats:v91];
  }
  else
  {
    [v5 setAlternativeFormats:0];
  }

  v92 = [(MRContentItemMetadata *)self internationalStandardRecordingCode];
  v93 = (void *)[v92 copyWithZone:a3];
  [v5 setInternationalStandardRecordingCode:v93];

  if ([(MRContentItemMetadata *)self hasReportingAdamID]) {
    objc_msgSend(v5, "setReportingAdamID:", -[MRContentItemMetadata reportingAdamID](self, "reportingAdamID"));
  }
  if ([(MRContentItemMetadata *)self hasLyricsAdamID]) {
    objc_msgSend(v5, "setLyricsAdamID:", -[MRContentItemMetadata lyricsAdamID](self, "lyricsAdamID"));
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreAlbumArtistIdentifier]) {
    objc_msgSend(v5, "setITunesStoreAlbumArtistIdentifier:", -[MRContentItemMetadata iTunesStoreAlbumArtistIdentifier](self, "iTunesStoreAlbumArtistIdentifier"));
  }
  id v94 = v5;

  return v94;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hasElapsedTimeTimestamp
{
  return self->_hasElapsedTimeTimestamp;
}

- (NSDictionary)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (NSString)trackArtistName
{
  return self->_trackArtistName;
}

- (NSString)composer
{
  return self->_composer;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (BOOL)hasPlaybackRate
{
  return self->_hasPlaybackRate;
}

- (NSString)genre
{
  return self->_genre;
}

- (BOOL)hasElapsedTime
{
  return self->_hasElapsedTime;
}

- (BOOL)hasInferredTimestamp
{
  return self->_hasInferredTimestamp;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (double)elapsedTimeTimestamp
{
  return self->_elapsedTimeTimestamp;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (NSDictionary)appMetrics
{
  return self->_appMetrics;
}

- (NSDate)currentPlaybackDate
{
  return self->_currentPlaybackDate;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (BOOL)isAlwaysLive
{
  return self->_alwaysLive;
}

- (BOOL)hasRadioStationIdentifier
{
  return self->_hasRadioStationIdentifier;
}

- (NSString)albumYear
{
  return self->_albumYear;
}

- (NSString)albumArtistName
{
  return self->_albumArtistName;
}

- (BOOL)hasStartTime
{
  return self->_hasStartTime;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (BOOL)hasInTransition
{
  return self->_hasInTransition;
}

- (BOOL)hasAlwaysLive
{
  return self->_hasAlwaysLive;
}

- (NSString)radioStationName
{
  return self->_radioStationName;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSArray)artworkURLTemplates
{
  return self->_artworkURLTemplates;
}

- (BOOL)hasTrackNumber
{
  return self->_hasTrackNumber;
}

- (BOOL)hasMediaType
{
  return self->_hasMediaType;
}

- (BOOL)hasLegacyUniqueIdentifier
{
  return self->_hasLegacyUniqueIdentifier;
}

- (BOOL)hasITunesStoreArtistIdentifier
{
  return self->_hasITunesStoreArtistIdentifier;
}

- (BOOL)hasDefaultPlaybackRate
{
  return self->_hasDefaultPlaybackRate;
}

- (BOOL)hasTotalTrackCount
{
  return self->_hasTotalTrackCount;
}

- (BOOL)hasTotalDiscCount
{
  return self->_hasTotalDiscCount;
}

- (BOOL)hasSteerable
{
  return self->_hasSteerable;
}

- (BOOL)hasSharable
{
  return self->_hasSharable;
}

- (BOOL)hasPlaybackProgress
{
  return self->_hasPlaybackProgress;
}

- (BOOL)hasLiked
{
  return self->_hasLiked;
}

- (BOOL)hasInWishList
{
  return self->_hasInWishList;
}

- (BOOL)hasITunesStoreSubscriptionIdentifier
{
  return self->_hasITunesStoreSubscriptionIdentifier;
}

- (BOOL)hasITunesStoreIdentifier
{
  return self->_hasITunesStoreIdentifier;
}

- (BOOL)hasITunesStoreAlbumIdentifier
{
  return self->_hasITunesStoreAlbumIdentifier;
}

- (BOOL)hasExplicitItem
{
  return self->_hasExplicitItem;
}

- (BOOL)hasDownloadState
{
  return self->_hasDownloadState;
}

- (BOOL)hasDownloadProgress
{
  return self->_hasDownloadProgress;
}

- (BOOL)hasDiscNumber
{
  return self->_hasDiscNumber;
}

- (BOOL)hasAdvertisement
{
  return self->_hasAdvertisement;
}

- (NSString)artworkMIMEType
{
  return self->_artworkMIMEType;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (int64_t)mediaSubType
{
  return self->_mediaSubType;
}

- (NSData)purchaseInfoData
{
  return self->_purchaseInfoData;
}

- (BOOL)hasMediaSubType
{
  return self->_hasMediaSubType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSString)internationalStandardRecordingCode
{
  return self->_internationalStandardRecordingCode;
}

- (BOOL)hasExcludeFromSuggestions
{
  return self->_hasExcludeFromSuggestions;
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (BOOL)isInTransition
{
  return self->_inTransition;
}

- (float)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (MRContentItemMetadataAudioFormat)activeFormat
{
  return self->_activeFormat;
}

- (MRContentItemMetadataAudioFormat)preferredFormat
{
  return self->_preferredFormat;
}

- (NSString)localizedDurationString
{
  v3 = [(MRContentItemMetadata *)self durationStringLocalizationKey];

  if (v3)
  {
    v4 = [(MRContentItemMetadata *)self durationStringLocalizationKey];
    MRLocalizedString(v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_localizedDurationString;
  }

  return v5;
}

- (NSString)durationStringLocalizationKey
{
  return self->_durationStringLocalizationKey;
}

- (MRContentItemMetadataAudioRoute)audioRoute
{
  return self->_audioRoute;
}

- (NSArray)alternativeFormats
{
  return self->_alternativeFormats;
}

- (BOOL)hasLoading
{
  return self->_hasLoading;
}

- (NSString)radioStationString
{
  return self->_radioStationString;
}

- (BOOL)hasPlayable
{
  return self->_hasPlayable;
}

- (BOOL)hasEditingStyleFlags
{
  return self->_hasEditingStyleFlags;
}

- (BOOL)hasArtworkAvailable
{
  return self->_hasArtworkAvailable;
}

- (BOOL)hasTranscriptAlignmentsAvailable
{
  return self->_hasTranscriptAlignmentsAvailable;
}

- (BOOL)hasStreamingContent
{
  return self->_hasStreamingContent;
}

- (BOOL)hasSongTraits
{
  return self->_hasSongTraits;
}

- (BOOL)hasSeasonNumber
{
  return self->_hasSeasonNumber;
}

- (BOOL)hasRadioStationType
{
  return self->_hasRadioStationType;
}

- (BOOL)hasPlaylistType
{
  return self->_hasPlaylistType;
}

- (BOOL)hasPlaylistTraits
{
  return self->_hasPlaylistTraits;
}

- (BOOL)hasPlayCount
{
  return self->_hasPlayCount;
}

- (BOOL)hasNumberOfSections
{
  return self->_hasNumberOfSections;
}

- (BOOL)hasLyricsAvailable
{
  return self->_hasLyricsAvailable;
}

- (BOOL)hasLanguageOptionsAvailable
{
  return self->_hasLanguageOptionsAvailable;
}

- (BOOL)hasInfoAvailable
{
  return self->_hasInfoAvailable;
}

- (BOOL)hasFormatTierPreference
{
  return self->_hasFormatTierPreference;
}

- (BOOL)hasEpisodeType
{
  return self->_hasEpisodeType;
}

- (BOOL)hasEpisodeNumber
{
  return self->_hasEpisodeNumber;
}

- (BOOL)hasCurrentlyPlaying
{
  return self->_hasCurrentlyPlaying;
}

- (BOOL)hasContainer
{
  return self->_hasContainer;
}

- (BOOL)hasChapterCount
{
  return self->_hasChapterCount;
}

- (BOOL)hasAlbumTraits
{
  return self->_hasAlbumTraits;
}

- (BOOL)hasActiveFormatJustification
{
  return self->_hasActiveFormatJustification;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)seriesName
{
  return self->_seriesName;
}

- (NSString)participantName
{
  return self->_participantName;
}

- (NSString)participantIdentifier
{
  return self->_participantIdentifier;
}

- (NSURL)lyricsURL
{
  return self->_lyricsURL;
}

- (NSString)localizedContentRating
{
  return self->_localizedContentRating;
}

- (BOOL)hasReportingAdamID
{
  return self->_hasReportingAdamID;
}

- (BOOL)hasLyricsAdamID
{
  return self->_hasLyricsAdamID;
}

- (BOOL)hasIsResolvableParticipant
{
  return self->_hasIsResolvableParticipant;
}

- (BOOL)hasITunesStoreAlbumArtistIdentifier
{
  return self->_hasITunesStoreAlbumArtistIdentifier;
}

- (NSString)directorName
{
  return self->_directorName;
}

- (NSURL)artworkFileURL
{
  return self->_artworkFileURL;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (BOOL)isPlayable
{
  return self->_playable;
}

- (BOOL)hasArtworkDataWidthDeprecated
{
  return self->_hasArtworkDataWidthDeprecated;
}

- (BOOL)hasArtworkDataHeightDeprecated
{
  return self->_hasArtworkDataHeightDeprecated;
}

- (NSString)classicalWork
{
  return self->_classicalWork;
}

- (int64_t)iTunesStoreArtistIdentifier
{
  return self->_iTunesStoreArtistIdentifier;
}

- (int64_t)trackNumber
{
  return self->_trackNumber;
}

- (void)setUserInfo:(id)a3
{
}

- (void)setTrackArtistName:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setGenre:(id)a3
{
}

- (void)setDeviceSpecificUserInfo:(id)a3
{
}

- (void)setComposer:(id)a3
{
}

- (void)setCollectionInfo:(id)a3
{
}

- (void)setAlbumYear:(id)a3
{
}

- (void)setAlbumName:(id)a3
{
}

- (void)setAlbumArtistName:(id)a3
{
}

- (int64_t)legacyUniqueIdentifier
{
  return self->_legacyUniqueIdentifier;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
  self->_hasPlaybackRate = 1;
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSinceReferenceDate];
  -[MRContentItemMetadata setElapsedTimeTimestamp:](self, "setElapsedTimeTimestamp:");
}

- (void)setPlayable:(BOOL)a3
{
  self->_playable = a3;
  self->_hasPlayable = 1;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
  self->_hasLoading = 1;
}

- (void)setInTransition:(BOOL)a3
{
  self->_inTransition = a3;
  self->_hasInTransition = 1;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
  self->_hasElapsedTime = 1;
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSinceReferenceDate];
  -[MRContentItemMetadata setElapsedTimeTimestamp:](self, "setElapsedTimeTimestamp:");
}

- (void)setElapsedTimeTimestamp:(double)a3
{
  self->_elapsedTimeTimestamp = a3;
  self->_hasElapsedTimeTimestamp = 1;
}

- (void)setDefaultPlaybackRate:(float)a3
{
  self->_defaultPlaybackRate = a3;
  self->_hasDefaultPlaybackRate = 1;
}

- (void)setAlwaysLive:(BOOL)a3
{
  self->_alwaysLive = a3;
  self->_hasAlwaysLive = 1;
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (void)setNowPlayingInfo:(id)a3
{
}

- (int64_t)editingStyleFlags
{
  return self->_editingStyleFlags;
}

- (BOOL)artworkAvailable
{
  return self->_artworkAvailable;
}

- (int64_t)iTunesStoreAlbumArtistIdentifier
{
  return self->_iTunesStoreAlbumArtistIdentifier;
}

- (void)setReleaseDate:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void)setSeriesName:(id)a3
{
}

- (void)setRadioStationString:(id)a3
{
}

- (void)setRadioStationName:(id)a3
{
}

- (void)setPurchaseInfoData:(id)a3
{
}

- (void)setProfileIdentifier:(id)a3
{
}

- (void)setPreferredFormat:(id)a3
{
}

- (void)setParticipantName:(id)a3
{
}

- (void)setParticipantIdentifier:(id)a3
{
}

- (void)setLyricsURL:(id)a3
{
}

- (void)setLocalizedDurationString:(id)a3
{
}

- (void)setLocalizedContentRating:(id)a3
{
}

- (void)setInternationalStandardRecordingCode:(id)a3
{
}

- (void)setDurationStringLocalizationKey:(id)a3
{
}

- (void)setDirectorName:(id)a3
{
}

- (void)setCurrentPlaybackDate:(id)a3
{
}

- (void)setContentIdentifier:(id)a3
{
}

- (void)setCollectionIdentifier:(id)a3
{
}

- (void)setClassicalWork:(id)a3
{
}

- (void)setBrandIdentifier:(id)a3
{
}

- (void)setAudioRoute:(id)a3
{
}

- (void)setAssetURL:(id)a3
{
}

- (void)setArtworkURLTemplates:(id)a3
{
}

- (void)setArtworkURL:(id)a3
{
}

- (void)setArtworkMIMEType:(id)a3
{
}

- (void)setArtworkFileURL:(id)a3
{
}

- (void)setAppMetrics:(id)a3
{
}

- (void)setAlternativeFormats:(id)a3
{
}

- (void)setActiveFormat:(id)a3
{
}

- (void)setTrackNumber:(int64_t)a3
{
  self->_trackNumber = a3;
  self->_hasTrackNumber = 1;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
  self->_hasMediaType = 1;
}

- (void)setMediaSubType:(int64_t)a3
{
  self->_mediaSubType = a3;
  self->_hasMediaSubType = 1;
}

- (void)setLegacyUniqueIdentifier:(int64_t)a3
{
  self->_legacyUniqueIdentifier = a3;
  self->_hasLegacyUniqueIdentifier = 1;
}

- (void)setITunesStoreArtistIdentifier:(int64_t)a3
{
  self->_iTunesStoreArtistIdentifier = a3;
  self->_hasITunesStoreArtistIdentifier = 1;
}

- (void)setITunesStoreAlbumArtistIdentifier:(int64_t)a3
{
  self->_iTunesStoreAlbumArtistIdentifier = a3;
  self->_hasITunesStoreAlbumArtistIdentifier = 1;
}

- (void)setEditingStyleFlags:(int64_t)a3
{
  self->_editingStyleFlags = a3;
  self->_hasEditingStyleFlags = 1;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  self->_hasDuration = 1;
}

- (void)setArtworkAvailable:(BOOL)a3
{
  self->_artworkAvailable = a3;
  self->_hasArtworkAvailable = 1;
}

- (unint64_t)songTraits
{
  return self->_songTraits;
}

- (int64_t)reportingAdamID
{
  return self->_reportingAdamID;
}

- (int64_t)lyricsAdamID
{
  return self->_lyricsAdamID;
}

- (unint64_t)formatTierPreference
{
  return self->_formatTierPreference;
}

- (int64_t)activeFormatJustification
{
  return self->_activeFormatJustification;
}

- (void)setInferredTimestamp:(double)a3
{
  self->_inferredTimestamp = a3;
  self->_hasInferredTimestamp = 1;
}

- (int64_t)totalDiscCount
{
  return self->_totalDiscCount;
}

- (BOOL)lyricsAvailable
{
  return self->_lyricsAvailable;
}

- (BOOL)languageOptionsAvailable
{
  return self->_languageOptionsAvailable;
}

- (BOOL)infoAvailable
{
  return self->_infoAvailable;
}

- (int64_t)discNumber
{
  return self->_discNumber;
}

- (BOOL)transcriptAlignmentsAvailable
{
  return self->_transcriptAlignmentsAvailable;
}

- (int64_t)seasonNumber
{
  return self->_seasonNumber;
}

- (int64_t)radioStationType
{
  return self->_radioStationType;
}

- (int64_t)radioStationIdentifier
{
  return self->_radioStationIdentifier;
}

- (int64_t)playlistType
{
  return self->_playlistType;
}

- (unint64_t)playlistTraits
{
  return self->_playlistTraits;
}

- (float)playbackProgress
{
  return self->_playbackProgress;
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (int64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (BOOL)isStreamingContent
{
  return self->_streamingContent;
}

- (BOOL)isSteerable
{
  return self->_steerable;
}

- (BOOL)isSharable
{
  return self->_sharable;
}

- (BOOL)isResolvableParticipant
{
  return self->_isResolvableParticipant;
}

- (BOOL)isLiked
{
  return self->_liked;
}

- (BOOL)isInWishList
{
  return self->_inWishList;
}

- (BOOL)isCurrentlyPlaying
{
  return self->_currentlyPlaying;
}

- (BOOL)isContainer
{
  return self->_container;
}

- (BOOL)isAdvertisement
{
  return self->_advertisement;
}

- (BOOL)excludeFromSuggestions
{
  return self->_excludeFromSuggestions;
}

- (int64_t)episodeType
{
  return self->_episodeType;
}

- (int64_t)episodeNumber
{
  return self->_episodeNumber;
}

- (int64_t)downloadState
{
  return self->_downloadState;
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (int64_t)chapterCount
{
  return self->_chapterCount;
}

- (int64_t)artworkDataWidthDeprecated
{
  return self->_artworkDataWidthDeprecated;
}

- (int64_t)artworkDataHeightDeprecated
{
  return self->_artworkDataHeightDeprecated;
}

- (unint64_t)albumTraits
{
  return self->_albumTraits;
}

- (double)inferredTimestamp
{
  return self->_inferredTimestamp;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MRContentItemMetadata *)self hasContainer])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isContainer](self, "isContainer"));
    [v3 setObject:v4 forKeyedSubscript:@"container"];
  }
  if ([(MRContentItemMetadata *)self hasPlayable])
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isPlayable](self, "isPlayable"));
    [v3 setObject:v5 forKeyedSubscript:@"playable"];
  }
  if ([(MRContentItemMetadata *)self hasExplicitItem])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isExplicitItem](self, "isExplicitItem"));
    [v3 setObject:v6 forKeyedSubscript:@"explicitItem"];
  }
  if ([(MRContentItemMetadata *)self hasStreamingContent])
  {
    v7 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isStreamingContent](self, "isStreamingContent"));
    [v3 setObject:v7 forKeyedSubscript:@"streamingContent"];
  }
  if ([(MRContentItemMetadata *)self hasCurrentlyPlaying])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isCurrentlyPlaying](self, "isCurrentlyPlaying"));
    [v3 setObject:v8 forKeyedSubscript:@"currentlyPlaying"];
  }
  if ([(MRContentItemMetadata *)self hasAlwaysLive])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isAlwaysLive](self, "isAlwaysLive"));
    [v3 setObject:v9 forKeyedSubscript:@"alwaysLive"];
  }
  if ([(MRContentItemMetadata *)self hasSharable])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isSharable](self, "isSharable"));
    [v3 setObject:v10 forKeyedSubscript:@"sharable"];
  }
  if ([(MRContentItemMetadata *)self hasLiked])
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isLiked](self, "isLiked"));
    [v3 setObject:v11 forKeyedSubscript:@"liked"];
  }
  if ([(MRContentItemMetadata *)self hasInWishList])
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isInWishList](self, "isInWishList"));
    [v3 setObject:v12 forKeyedSubscript:@"inWishList"];
  }
  if ([(MRContentItemMetadata *)self hasAdvertisement])
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isAdvertisement](self, "isAdvertisement"));
    [v3 setObject:v13 forKeyedSubscript:@"advertisement"];
  }
  if ([(MRContentItemMetadata *)self hasSteerable])
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isSteerable](self, "isSteerable"));
    [v3 setObject:v14 forKeyedSubscript:@"steerable"];
  }
  if ([(MRContentItemMetadata *)self hasLoading])
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isLoading](self, "isLoading"));
    [v3 setObject:v15 forKeyedSubscript:@"loading"];
  }
  if ([(MRContentItemMetadata *)self hasInTransition])
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isInTransition](self, "isInTransition"));
    [v3 setObject:v16 forKeyedSubscript:@"inTransition"];
  }
  if ([(MRContentItemMetadata *)self hasArtworkAvailable])
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata artworkAvailable](self, "artworkAvailable"));
    [v3 setObject:v17 forKeyedSubscript:@"artworkAvailable"];
  }
  if ([(MRContentItemMetadata *)self hasInfoAvailable])
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata infoAvailable](self, "infoAvailable"));
    [v3 setObject:v18 forKeyedSubscript:@"infoAvailable"];
  }
  if ([(MRContentItemMetadata *)self hasTranscriptAlignmentsAvailable])
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata transcriptAlignmentsAvailable](self, "transcriptAlignmentsAvailable"));
    [v3 setObject:v19 forKeyedSubscript:@"transcriptAlignmentsAvailable"];
  }
  if ([(MRContentItemMetadata *)self hasLanguageOptionsAvailable])
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata languageOptionsAvailable](self, "languageOptionsAvailable"));
    [v3 setObject:v20 forKeyedSubscript:@"languageOptionsAvailable"];
  }
  if ([(MRContentItemMetadata *)self hasLyricsAvailable])
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata lyricsAvailable](self, "lyricsAvailable"));
    [v3 setObject:v21 forKeyedSubscript:@"lyricsAvailable"];
  }
  if ([(MRContentItemMetadata *)self hasPlaybackProgress])
  {
    v22 = NSNumber;
    [(MRContentItemMetadata *)self playbackProgress];
    v23 = objc_msgSend(v22, "numberWithFloat:");
    [v3 setObject:v23 forKeyedSubscript:@"playbackProgress"];
  }
  if ([(MRContentItemMetadata *)self hasPlaybackRate])
  {
    v24 = NSNumber;
    [(MRContentItemMetadata *)self playbackRate];
    v25 = objc_msgSend(v24, "numberWithFloat:");
    [v3 setObject:v25 forKeyedSubscript:@"playbackRate"];
  }
  if ([(MRContentItemMetadata *)self hasDefaultPlaybackRate])
  {
    v26 = NSNumber;
    [(MRContentItemMetadata *)self defaultPlaybackRate];
    v27 = objc_msgSend(v26, "numberWithFloat:");
    [v3 setObject:v27 forKeyedSubscript:@"defaultPlaybackRate"];
  }
  if ([(MRContentItemMetadata *)self hasDownloadProgress])
  {
    v28 = NSNumber;
    [(MRContentItemMetadata *)self downloadProgress];
    v29 = objc_msgSend(v28, "numberWithFloat:");
    [v3 setObject:v29 forKeyedSubscript:@"downloadProgress"];
  }
  if ([(MRContentItemMetadata *)self hasPlaylistType])
  {
    v30 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata playlistType](self, "playlistType"));
    [v3 setObject:v30 forKeyedSubscript:@"playlistType"];
  }
  if ([(MRContentItemMetadata *)self hasRadioStationType])
  {
    v31 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata radioStationType](self, "radioStationType"));
    [v3 setObject:v31 forKeyedSubscript:@"radioStationType"];
  }
  if ([(MRContentItemMetadata *)self hasEditingStyleFlags])
  {
    v32 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata editingStyleFlags](self, "editingStyleFlags"));
    [v3 setObject:v32 forKeyedSubscript:@"editingStyleFlags"];
  }
  if ([(MRContentItemMetadata *)self hasMediaType])
  {
    v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata mediaType](self, "mediaType"));
    [v3 setObject:v33 forKeyedSubscript:@"mediaType"];
  }
  if ([(MRContentItemMetadata *)self hasMediaSubType])
  {
    v34 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata mediaSubType](self, "mediaSubType"));
    [v3 setObject:v34 forKeyedSubscript:@"mediaSubType"];
  }
  if ([(MRContentItemMetadata *)self hasEpisodeType])
  {
    v35 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata episodeType](self, "episodeType"));
    [v3 setObject:v35 forKeyedSubscript:@"episodeType"];
  }
  if ([(MRContentItemMetadata *)self hasPlayCount])
  {
    v36 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata playCount](self, "playCount"));
    [v3 setObject:v36 forKeyedSubscript:@"playCount"];
  }
  if ([(MRContentItemMetadata *)self hasNumberOfSections])
  {
    v37 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata numberOfSections](self, "numberOfSections"));
    [v3 setObject:v37 forKeyedSubscript:@"numberOfSections"];
  }
  if ([(MRContentItemMetadata *)self hasChapterCount])
  {
    v38 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata chapterCount](self, "chapterCount"));
    [v3 setObject:v38 forKeyedSubscript:@"chapterCount"];
  }
  if ([(MRContentItemMetadata *)self hasTotalDiscCount])
  {
    v39 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata totalDiscCount](self, "totalDiscCount"));
    [v3 setObject:v39 forKeyedSubscript:@"totalDiscCount"];
  }
  if ([(MRContentItemMetadata *)self hasTotalTrackCount])
  {
    v40 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata totalTrackCount](self, "totalTrackCount"));
    [v3 setObject:v40 forKeyedSubscript:@"totalTrackCount"];
  }
  if ([(MRContentItemMetadata *)self hasDownloadState])
  {
    v41 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata downloadState](self, "downloadState"));
    [v3 setObject:v41 forKeyedSubscript:@"downloadState"];
  }
  if ([(MRContentItemMetadata *)self hasDuration])
  {
    v42 = NSNumber;
    [(MRContentItemMetadata *)self duration];
    v43 = objc_msgSend(v42, "numberWithDouble:");
    [v3 setObject:v43 forKeyedSubscript:@"duration"];
  }
  if ([(MRContentItemMetadata *)self hasStartTime])
  {
    v44 = NSNumber;
    [(MRContentItemMetadata *)self startTime];
    v45 = objc_msgSend(v44, "numberWithDouble:");
    [v3 setObject:v45 forKeyedSubscript:@"startTime"];
  }
  if ([(MRContentItemMetadata *)self hasElapsedTime])
  {
    v46 = NSNumber;
    [(MRContentItemMetadata *)self elapsedTime];
    v47 = objc_msgSend(v46, "numberWithDouble:");
    [v3 setObject:v47 forKeyedSubscript:@"elapsedTime"];
  }
  if ([(MRContentItemMetadata *)self hasElapsedTimeTimestamp])
  {
    v48 = NSNumber;
    [(MRContentItemMetadata *)self elapsedTimeTimestamp];
    v49 = objc_msgSend(v48, "numberWithDouble:");
    [v3 setObject:v49 forKeyedSubscript:@"elapsedTimeTimestamp"];
  }
  if ([(MRContentItemMetadata *)self hasInferredTimestamp])
  {
    v50 = NSNumber;
    [(MRContentItemMetadata *)self inferredTimestamp];
    v51 = objc_msgSend(v50, "numberWithDouble:");
    [v3 setObject:v51 forKeyedSubscript:@"inferredTimestamp"];
  }
  if ([(MRContentItemMetadata *)self hasSeasonNumber])
  {
    v52 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata seasonNumber](self, "seasonNumber"));
    [v3 setObject:v52 forKeyedSubscript:@"seasonNumber"];
  }
  if ([(MRContentItemMetadata *)self hasEpisodeNumber])
  {
    v53 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata episodeNumber](self, "episodeNumber"));
    [v3 setObject:v53 forKeyedSubscript:@"episodeNumber"];
  }
  if ([(MRContentItemMetadata *)self hasDiscNumber])
  {
    v54 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata discNumber](self, "discNumber"));
    [v3 setObject:v54 forKeyedSubscript:@"discNumber"];
  }
  if ([(MRContentItemMetadata *)self hasTrackNumber])
  {
    v55 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata trackNumber](self, "trackNumber"));
    [v3 setObject:v55 forKeyedSubscript:@"trackNumber"];
  }
  if ([(MRContentItemMetadata *)self hasRadioStationIdentifier])
  {
    v56 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MRContentItemMetadata radioStationIdentifier](self, "radioStationIdentifier"));
    [v3 setObject:v56 forKeyedSubscript:@"radioStationIdentifier"];
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreIdentifier])
  {
    v57 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier"));
    [v3 setObject:v57 forKeyedSubscript:@"iTunesStoreIdentifier"];
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreSubscriptionIdentifier])
  {
    v58 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreSubscriptionIdentifier](self, "iTunesStoreSubscriptionIdentifier"));
    [v3 setObject:v58 forKeyedSubscript:@"iTunesStoreSubscriptionIdentifier"];
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreArtistIdentifier])
  {
    v59 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreArtistIdentifier](self, "iTunesStoreArtistIdentifier"));
    [v3 setObject:v59 forKeyedSubscript:@"iTunesStoreArtistIdentifier"];
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreAlbumIdentifier])
  {
    v60 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreAlbumIdentifier](self, "iTunesStoreAlbumIdentifier"));
    [v3 setObject:v60 forKeyedSubscript:@"iTunesStoreAlbumIdentifier"];
  }
  if ([(MRContentItemMetadata *)self hasLegacyUniqueIdentifier])
  {
    v61 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MRContentItemMetadata legacyUniqueIdentifier](self, "legacyUniqueIdentifier"));
    [v3 setObject:v61 forKeyedSubscript:@"legacyUniqueIdentifier"];
  }
  if ([(MRContentItemMetadata *)self hasSongTraits])
  {
    v62 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRContentItemMetadata songTraits](self, "songTraits"));
    [v3 setObject:v62 forKeyedSubscript:@"songTraits"];
  }
  if ([(MRContentItemMetadata *)self hasAlbumTraits])
  {
    v63 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRContentItemMetadata albumTraits](self, "albumTraits"));
    [v3 setObject:v63 forKeyedSubscript:@"albumTraits"];
  }
  if ([(MRContentItemMetadata *)self hasPlaylistTraits])
  {
    v64 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRContentItemMetadata playlistTraits](self, "playlistTraits"));
    [v3 setObject:v64 forKeyedSubscript:@"playlistTraits"];
  }
  if ([(MRContentItemMetadata *)self hasActiveFormatJustification])
  {
    v65 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadata activeFormatJustification](self, "activeFormatJustification"));
    [v3 setObject:v65 forKeyedSubscript:@"activeFormatJustification"];
  }
  if ([(MRContentItemMetadata *)self hasFormatTierPreference])
  {
    v66 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MRContentItemMetadata formatTierPreference](self, "formatTierPreference"));
    [v3 setObject:v66 forKeyedSubscript:@"formatTierPreference"];
  }
  v67 = [(MRContentItemMetadata *)self purchaseInfoData];
  [v3 setObject:v67 forKeyedSubscript:@"purchaseInfoData"];

  v68 = [(MRContentItemMetadata *)self appMetrics];
  [v3 setObject:v68 forKeyedSubscript:@"appMetrics"];

  v69 = [(MRContentItemMetadata *)self nowPlayingInfo];
  [v3 setObject:v69 forKeyedSubscript:@"nowPlayingInfo"];

  v70 = [(MRContentItemMetadata *)self userInfo];
  [v3 setObject:v70 forKeyedSubscript:@"userInfo"];

  v71 = [(MRContentItemMetadata *)self deviceSpecificUserInfo];
  [v3 setObject:v71 forKeyedSubscript:@"deviceSpecificUserInfo"];

  v72 = [(MRContentItemMetadata *)self collectionInfo];
  [v3 setObject:v72 forKeyedSubscript:@"collectionInfo"];

  v73 = [(MRContentItemMetadata *)self releaseDate];
  [v3 setObject:v73 forKeyedSubscript:@"releaseDate"];

  v74 = [(MRContentItemMetadata *)self currentPlaybackDate];
  [v3 setObject:v74 forKeyedSubscript:@"currentPlaybackDate"];

  v75 = [(MRContentItemMetadata *)self title];
  [v3 setObject:v75 forKeyedSubscript:@"title"];

  v76 = [(MRContentItemMetadata *)self subtitle];
  [v3 setObject:v76 forKeyedSubscript:@"subtitle"];

  v77 = [(MRContentItemMetadata *)self albumName];
  [v3 setObject:v77 forKeyedSubscript:@"albumName"];

  v78 = [(MRContentItemMetadata *)self trackArtistName];
  [v3 setObject:v78 forKeyedSubscript:@"trackArtistName"];

  v79 = [(MRContentItemMetadata *)self albumArtistName];
  [v3 setObject:v79 forKeyedSubscript:@"albumArtistName"];

  v80 = [(MRContentItemMetadata *)self directorName];
  [v3 setObject:v80 forKeyedSubscript:@"directorName"];

  v81 = [(MRContentItemMetadata *)self localizedContentRating];
  [v3 setObject:v81 forKeyedSubscript:@"localizedContentRating"];

  v82 = [(MRContentItemMetadata *)self collectionIdentifier];
  [v3 setObject:v82 forKeyedSubscript:@"collectionIdentifier"];

  v83 = [(MRContentItemMetadata *)self profileIdentifier];
  [v3 setObject:v83 forKeyedSubscript:@"profileIdentifier"];

  v84 = [(MRContentItemMetadata *)self assetURL];
  [v3 setObject:v84 forKeyedSubscript:@"assetURL"];

  v85 = [(MRContentItemMetadata *)self composer];
  [v3 setObject:v85 forKeyedSubscript:@"composer"];

  v86 = [(MRContentItemMetadata *)self genre];
  [v3 setObject:v86 forKeyedSubscript:@"genre"];

  v87 = [(MRContentItemMetadata *)self contentIdentifier];
  [v3 setObject:v87 forKeyedSubscript:@"contentIdentifier"];

  v88 = [(MRContentItemMetadata *)self radioStationName];
  [v3 setObject:v88 forKeyedSubscript:@"radioStationName"];

  id v89 = [(MRContentItemMetadata *)self radioStationString];
  [v3 setObject:v89 forKeyedSubscript:@"radioStationString"];

  v90 = [(MRContentItemMetadata *)self seriesName];
  [v3 setObject:v90 forKeyedSubscript:@"seriesName"];

  v91 = [(MRContentItemMetadata *)self lyricsURL];
  [v3 setObject:v91 forKeyedSubscript:@"lyricsURL"];

  v92 = [(MRContentItemMetadata *)self serviceIdentifier];
  [v3 setObject:v92 forKeyedSubscript:@"serviceIdentifier"];

  v93 = [(MRContentItemMetadata *)self brandIdentifier];
  [v3 setObject:v93 forKeyedSubscript:@"brandIdentifier"];

  id v94 = [(MRContentItemMetadata *)self localizedDurationString];
  [v3 setObject:v94 forKeyedSubscript:@"localizedDurationString"];

  v95 = [(MRContentItemMetadata *)self artworkIdentifier];
  [v3 setObject:v95 forKeyedSubscript:@"artworkIdentifier"];

  v96 = [(MRContentItemMetadata *)self artworkMIMEType];
  [v3 setObject:v96 forKeyedSubscript:@"artworkMIMEType"];

  v97 = [(MRContentItemMetadata *)self artworkURL];
  [v3 setObject:v97 forKeyedSubscript:@"artworkURL"];

  v98 = [(MRContentItemMetadata *)self artworkFileURL];
  [v3 setObject:v98 forKeyedSubscript:@"artworkFileURL"];

  v99 = [(MRContentItemMetadata *)self artworkURLTemplates];
  [v3 setObject:v99 forKeyedSubscript:@"artworkURLTemplates"];

  v100 = [(MRContentItemMetadata *)self albumYear];
  [v3 setObject:v100 forKeyedSubscript:@"albumYear"];

  uint64_t v101 = [(MRContentItemMetadata *)self participantName];
  [v3 setObject:v101 forKeyedSubscript:@"participantName"];

  v102 = [(MRContentItemMetadata *)self participantIdentifier];
  [v3 setObject:v102 forKeyedSubscript:@"participantIdentifier"];

  v103 = [(MRContentItemMetadata *)self internationalStandardRecordingCode];
  [v3 setObject:v103 forKeyedSubscript:@"internationalStandardRecordingCode"];

  if ([(MRContentItemMetadata *)self hasIsResolvableParticipant])
  {
    v104 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata isResolvableParticipant](self, "isResolvableParticipant"));
    [v3 setObject:v104 forKeyedSubscript:@"isResolvableParticipant"];
  }
  if ([(MRContentItemMetadata *)self hasExcludeFromSuggestions])
  {
    v105 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadata excludeFromSuggestions](self, "excludeFromSuggestions"));
    [v3 setObject:v105 forKeyedSubscript:@"excludeFromSuggestions"];
  }
  v106 = [(MRContentItemMetadata *)self preferredFormat];

  if (v106)
  {
    v107 = [(MRContentItemMetadata *)self preferredFormat];
    v108 = [v107 dictionaryRepresentation];
    [v3 setObject:v108 forKeyedSubscript:@"preferredFormat"];
  }
  v109 = [(MRContentItemMetadata *)self activeFormat];

  if (v109)
  {
    v110 = [(MRContentItemMetadata *)self activeFormat];
    v111 = [v110 dictionaryRepresentation];
    [v3 setObject:v111 forKeyedSubscript:@"activeFormat"];
  }
  v112 = [(MRContentItemMetadata *)self audioRoute];

  if (v112)
  {
    v113 = [(MRContentItemMetadata *)self audioRoute];
    v114 = [v113 dictionaryRepresentation];
    [v3 setObject:v114 forKeyedSubscript:@"audioRoute"];
  }
  v115 = [(MRContentItemMetadata *)self alternativeFormats];

  if (v115)
  {
    v116 = [(MRContentItemMetadata *)self alternativeFormats];
    v117 = objc_msgSend(v116, "msv_map:", &__block_literal_global_306);
    [v3 setObject:v117 forKeyedSubscript:@"alternativeFormats"];
  }
  if ([(MRContentItemMetadata *)self hasElapsedTimeTimestamp])
  {
    id v118 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(MRContentItemMetadata *)self elapsedTimeTimestamp];
    v119 = objc_msgSend(v118, "initWithTimeIntervalSinceReferenceDate:");
    [v3 setObject:v119 forKeyedSubscript:@"elapsedTimeTimestamp"];
  }
  if ([(MRContentItemMetadata *)self hasInferredTimestamp])
  {
    id v120 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(MRContentItemMetadata *)self inferredTimestamp];
    v121 = objc_msgSend(v120, "initWithTimeIntervalSinceReferenceDate:");
    [v3 setObject:v121 forKeyedSubscript:@"inferredTimestamp"];
  }
  if ([(MRContentItemMetadata *)self hasElapsedTimeTimestamp]
    || [(MRContentItemMetadata *)self hasInferredTimestamp])
  {
    if ([(MRContentItemMetadata *)self hasElapsedTimeTimestamp]) {
      [(MRContentItemMetadata *)self elapsedTimeTimestamp];
    }
    else {
      [(MRContentItemMetadata *)self inferredTimestamp];
    }
    double v123 = v122;
    v124 = [MEMORY[0x1E4F1C9C8] date];
    [v124 timeIntervalSinceReferenceDate];
    double v126 = v125 - v123;

    v127 = (void *)MRCreateDurationStringRepresentation(v126);
    [v3 setObject:v127 forKeyedSubscript:@"custom: delta"];
  }
  if ([(MRContentItemMetadata *)self hasStartTime])
  {
    id v128 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(MRContentItemMetadata *)self startTime];
    v129 = objc_msgSend(v128, "initWithTimeIntervalSinceReferenceDate:");
    [v3 setObject:v129 forKeyedSubscript:@"startTime"];
  }
  if ([(MRContentItemMetadata *)self hasDuration])
  {
    [(MRContentItemMetadata *)self duration];
    v131 = (void *)MRCreateDurationStringRepresentation(v130);
    [v3 setObject:v131 forKeyedSubscript:@"duration"];
  }
  if ([(MRContentItemMetadata *)self hasElapsedTime])
  {
    [(MRContentItemMetadata *)self elapsedTime];
    v133 = (void *)MRCreateDurationStringRepresentation(v132);
    [v3 setObject:v133 forKeyedSubscript:@"elapsedTime"];
  }
  if ([(MRContentItemMetadata *)self hasDuration]
    && [(MRContentItemMetadata *)self hasElapsedTime])
  {
    [(MRContentItemMetadata *)self duration];
    double v135 = v134;
    [(MRContentItemMetadata *)self elapsedTime];
    v137 = (void *)MRCreateDurationStringRepresentation(v135 - v136);
    [v3 setObject:v137 forKeyedSubscript:@"custom: remainingTime"];
  }
  if ([(MRContentItemMetadata *)self hasElapsedTime]
    && ([(MRContentItemMetadata *)self hasInferredTimestamp]
     || [(MRContentItemMetadata *)self hasElapsedTimeTimestamp]))
  {
    [(MRContentItemMetadata *)self calculatedPlaybackPosition];
    v139 = (void *)MRCreateDurationStringRepresentation(v138);
    [v3 setObject:v139 forKeyedSubscript:@"custom: calculatedElapsedTime"];
  }
  if ([(MRContentItemMetadata *)self hasPlaybackRate])
  {
    v140 = NSNumber;
    [(MRContentItemMetadata *)self playbackRate];
    v141 = objc_msgSend(v140, "numberWithFloat:");
    [v3 setObject:v141 forKeyedSubscript:@"__playbackRate"];
  }
  v142 = [(MRContentItemMetadata *)self title];

  if (v142)
  {
    v143 = [(MRContentItemMetadata *)self title];
    [v3 setObject:v143 forKeyedSubscript:@"__title"];
  }
  if ([(MRContentItemMetadata *)self hasReportingAdamID])
  {
    v144 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MRContentItemMetadata reportingAdamID](self, "reportingAdamID"));
    [v3 setObject:v144 forKeyedSubscript:@"reportingAdamID"];
  }
  if ([(MRContentItemMetadata *)self hasLyricsAdamID])
  {
    v145 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MRContentItemMetadata lyricsAdamID](self, "lyricsAdamID"));
    [v3 setObject:v145 forKeyedSubscript:@"lyricsAdamID"];
  }
  if ([(MRContentItemMetadata *)self hasITunesStoreAlbumArtistIdentifier])
  {
    v146 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreAlbumArtistIdentifier](self, "iTunesStoreAlbumArtistIdentifier"));
    [v3 setObject:v146 forKeyedSubscript:@"iTunesStoreAlbumArtistIdentifier"];
  }
  v147 = (NSDictionary *)v3;

  return v147;
}

- (double)calculatedPlaybackPosition
{
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [(MRContentItemMetadata *)self calculatedPlaybackPositionFromDate:v3];
  double v5 = v4;

  return v5;
}

- (double)calculatedPlaybackPositionFromDate:(id)a3
{
  id v4 = a3;
  if ([(MRContentItemMetadata *)self hasInferredTimestamp]
    || (double v5 = 0.0, [(MRContentItemMetadata *)self hasElapsedTimeTimestamp]))
  {
    if ([(MRContentItemMetadata *)self hasElapsedTimeTimestamp]) {
      [(MRContentItemMetadata *)self elapsedTimeTimestamp];
    }
    else {
      [(MRContentItemMetadata *)self inferredTimestamp];
    }
    double v7 = v6;
    double v8 = 1.0;
    if ([(MRContentItemMetadata *)self hasPlaybackRate])
    {
      [(MRContentItemMetadata *)self playbackRate];
      double v8 = v9;
    }
    [v4 timeIntervalSinceReferenceDate];
    double v11 = v10 - v7;
    [(MRContentItemMetadata *)self elapsedTime];
    double v5 = v12 + v11 * v8;
  }

  return v5;
}

- (double)startTime
{
  return self->_startTime;
}

- (MRContentItemMetadata)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v150.receiver = self;
    v150.super_class = (Class)MRContentItemMetadata;
    double v5 = [(MRContentItemMetadata *)&v150 init];
    if (v5)
    {
      v5->_container = [v4 isContainer];
      v5->_hasContainer = [v4 hasIsContainer];
      v5->_playable = [v4 isPlayable];
      v5->_hasPlayable = [v4 hasIsPlayable];
      v5->_explicitItem = [v4 isExplicitItem];
      v5->_hasExplicitItem = [v4 hasIsExplicitItem];
      v5->_streamingContent = [v4 isStreamingContent];
      v5->_hasStreamingContent = [v4 hasIsStreamingContent];
      v5->_currentlyPlaying = [v4 isCurrentlyPlaying];
      v5->_hasCurrentlyPlaying = [v4 hasIsCurrentlyPlaying];
      v5->_alwaysLive = [v4 isAlwaysLive];
      v5->_hasAlwaysLive = [v4 hasIsAlwaysLive];
      v5->_sharable = [v4 isSharable];
      v5->_hasSharable = [v4 hasIsSharable];
      v5->_liked = [v4 isLiked];
      v5->_hasLiked = [v4 hasIsLiked];
      v5->_inWishList = [v4 isInWishList];
      v5->_hasInWishList = [v4 hasIsInWishList];
      v5->_advertisement = [v4 isAdvertisement];
      v5->_hasAdvertisement = [v4 hasIsAdvertisement];
      v5->_steerable = [v4 isSteerable];
      v5->_hasSteerable = [v4 hasIsSteerable];
      v5->_loading = [v4 isLoading];
      v5->_hasLoading = [v4 hasIsLoading];
      v5->_inTransition = [v4 isInTransition];
      v5->_hasInTransition = [v4 hasIsInTransition];
      v5->_artworkAvailable = [v4 artworkAvailable];
      v5->_hasArtworkAvailable = [v4 hasArtworkAvailable];
      v5->_infoAvailable = [v4 infoAvailable];
      v5->_hasInfoAvailable = [v4 hasInfoAvailable];
      v5->_transcriptAlignmentsAvailable = [v4 transcriptAlignmentsAvailable];
      v5->_hasTranscriptAlignmentsAvailable = [v4 hasTranscriptAlignmentsAvailable];
      v5->_languageOptionsAvailable = [v4 languageOptionsAvailable];
      v5->_hasLanguageOptionsAvailable = [v4 hasLanguageOptionsAvailable];
      v5->_lyricsAvailable = [v4 lyricsAvailable];
      v5->_hasLyricsAvailable = [v4 hasLyricsAvailable];
      [v4 playbackProgress];
      v5->_playbackProgress = v6;
      v5->_hasPlaybackProgress = [v4 hasPlaybackProgress];
      [v4 playbackRate];
      v5->_playbackRate = v7;
      v5->_hasPlaybackRate = [v4 hasPlaybackRate];
      [v4 defaultPlaybackRate];
      v5->_defaultPlaybackRate = v8;
      v5->_hasDefaultPlaybackRate = [v4 hasDefaultPlaybackRate];
      [v4 downloadProgress];
      v5->_downloadProgress = v9;
      v5->_hasDownloadProgress = [v4 hasDownloadProgress];
      v5->_playlistType = (int)[v4 playlistType];
      v5->_hasPlaylistType = [v4 hasPlaylistType];
      v5->_radioStationType = (int)[v4 radioStationType];
      v5->_hasRadioStationType = [v4 hasRadioStationType];
      v5->_editingStyleFlags = (int)[v4 editingStyleFlags];
      v5->_hasEditingStyleFlags = [v4 hasEditingStyleFlags];
      v5->_mediaType = (int)[v4 mediaType];
      v5->_hasMediaType = [v4 hasMediaType];
      v5->_mediaSubType = (int)[v4 mediaSubType];
      v5->_hasMediaSubType = [v4 hasMediaSubType];
      v5->_episodeType = (int)[v4 episodeType];
      v5->_hasEpisodeType = [v4 hasEpisodeType];
      v5->_playCount = (int)[v4 playCount];
      v5->_hasPlayCount = [v4 hasPlayCount];
      v5->_numberOfSections = (int)[v4 numberOfSections];
      v5->_hasNumberOfSections = [v4 hasNumberOfSections];
      v5->_chapterCount = (int)[v4 chapterCount];
      v5->_hasChapterCount = [v4 hasChapterCount];
      v5->_totalDiscCount = (int)[v4 totalDiscCount];
      v5->_hasTotalDiscCount = [v4 hasTotalDiscCount];
      v5->_totalTrackCount = (int)[v4 totalTrackCount];
      v5->_hasTotalTrackCount = [v4 hasTotalTrackCount];
      v5->_downloadState = (int)[v4 downloadState];
      v5->_hasDownloadState = [v4 hasDownloadState];
      v5->_artworkDataWidthDeprecated = (int)[v4 artworkDataWidthDeprecated];
      v5->_hasArtworkDataWidthDeprecated = [v4 hasArtworkDataWidthDeprecated];
      v5->_artworkDataHeightDeprecated = (int)[v4 artworkDataHeightDeprecated];
      v5->_hasArtworkDataHeightDeprecated = [v4 hasArtworkDataHeightDeprecated];
      [v4 duration];
      v5->_duration = v10;
      v5->_hasDuration = [v4 hasDuration];
      [v4 startTime];
      v5->_startTime = v11;
      v5->_hasStartTime = [v4 hasStartTime];
      [v4 elapsedTime];
      v5->_elapsedTime = v12;
      v5->_hasElapsedTime = [v4 hasElapsedTime];
      [v4 elapsedTimeTimestamp];
      v5->_elapsedTimeTimestamp = v13;
      v5->_hasElapsedTimeTimestamp = [v4 hasElapsedTimeTimestamp];
      [v4 inferredTimestamp];
      v5->_inferredTimestamp = v14;
      v5->_hasInferredTimestamp = [v4 hasInferredTimestamp];
      v5->_seasonNumber = (int)[v4 seasonNumber];
      v5->_hasSeasonNumber = [v4 hasSeasonNumber];
      v5->_episodeNumber = (int)[v4 episodeNumber];
      v5->_hasEpisodeNumber = [v4 hasEpisodeNumber];
      v5->_discNumber = (int)[v4 discNumber];
      v5->_hasDiscNumber = [v4 hasDiscNumber];
      v5->_trackNumber = (int)[v4 trackNumber];
      v5->_hasTrackNumber = [v4 hasTrackNumber];
      v5->_radioStationIdentifier = [v4 radioStationIdentifier];
      v5->_hasRadioStationIdentifier = [v4 hasRadioStationIdentifier];
      v5->_iTunesStoreIdentifier = [v4 iTunesStoreIdentifier];
      v5->_hasITunesStoreIdentifier = [v4 hasITunesStoreIdentifier];
      v5->_iTunesStoreSubscriptionIdentifier = [v4 iTunesStoreSubscriptionIdentifier];
      v5->_hasITunesStoreSubscriptionIdentifier = [v4 hasITunesStoreSubscriptionIdentifier];
      v5->_iTunesStoreArtistIdentifier = [v4 iTunesStoreArtistIdentifier];
      v5->_hasITunesStoreArtistIdentifier = [v4 hasITunesStoreArtistIdentifier];
      v5->_iTunesStoreAlbumIdentifier = [v4 iTunesStoreAlbumIdentifier];
      v5->_hasITunesStoreAlbumIdentifier = [v4 hasITunesStoreAlbumIdentifier];
      v5->_legacyUniqueIdentifier = [v4 legacyUniqueIdentifier];
      v5->_hasLegacyUniqueIdentifier = [v4 hasLegacyUniqueIdentifier];
      uint64_t v15 = [v4 classicalWork];
      classicalWork = v5->_classicalWork;
      v5->_classicalWork = (NSString *)v15;

      if ([v4 hasReleaseDate])
      {
        v17 = (void *)MEMORY[0x1E4F1C9C8];
        [v4 releaseDate];
        uint64_t v18 = objc_msgSend(v17, "dateWithTimeIntervalSince1970:");
        releaseDate = v5->_releaseDate;
        v5->_releaseDate = (NSDate *)v18;
      }
      else
      {
        releaseDate = v5->_releaseDate;
        v5->_releaseDate = 0;
      }

      if ([v4 hasCurrentPlaybackDateData])
      {
        v21 = [v4 currentPlaybackDateData];
        uint64_t v22 = MRDecodeObjectWithEncoding(v21, 0);
        currentPlaybackDate = v5->_currentPlaybackDate;
        v5->_currentPlaybackDate = (NSDate *)v22;
      }
      else
      {
        v21 = v5->_currentPlaybackDate;
        v5->_currentPlaybackDate = 0;
      }

      if ([v4 hasAppMetricsData])
      {
        v24 = [v4 appMetricsData];
        uint64_t v25 = MRDecodeObjectWithEncoding(v24, 0);
        appMetrics = v5->_appMetrics;
        v5->_appMetrics = (NSDictionary *)v25;
      }
      else
      {
        v24 = v5->_appMetrics;
        v5->_appMetrics = 0;
      }

      if ([v4 hasNowPlayingInfoData])
      {
        v27 = [v4 nowPlayingInfoData];
        uint64_t v28 = MRDecodeObjectWithEncoding(v27, 0);
        nowPlayingInfo = v5->_nowPlayingInfo;
        v5->_nowPlayingInfo = (NSDictionary *)v28;
      }
      else
      {
        v27 = v5->_nowPlayingInfo;
        v5->_nowPlayingInfo = 0;
      }

      if ([v4 hasUserInfoData])
      {
        v30 = [v4 userInfoData];
        uint64_t v31 = MRDecodeObjectWithEncoding(v30, 0);
        userInfo = v5->_userInfo;
        v5->_userInfo = (NSDictionary *)v31;
      }
      else
      {
        v30 = v5->_userInfo;
        v5->_userInfo = 0;
      }

      if ([v4 hasDeviceSpecificUserInfoData])
      {
        v33 = [v4 deviceSpecificUserInfoData];
        uint64_t v34 = MRDecodeObjectWithEncoding(v33, 0);
        deviceSpecificUserInfo = v5->_deviceSpecificUserInfo;
        v5->_deviceSpecificUserInfo = (NSDictionary *)v34;
      }
      else
      {
        v33 = v5->_deviceSpecificUserInfo;
        v5->_deviceSpecificUserInfo = 0;
      }

      if ([v4 hasCollectionInfoData])
      {
        v36 = [v4 collectionInfoData];
        uint64_t v37 = MRDecodeObjectWithEncoding(v36, 0);
        collectionInfo = v5->_collectionInfo;
        v5->_collectionInfo = (NSDictionary *)v37;
      }
      else
      {
        v36 = v5->_collectionInfo;
        v5->_collectionInfo = 0;
      }

      v39 = [v4 purchaseInfoData];
      uint64_t v40 = [v39 copy];
      purchaseInfoData = v5->_purchaseInfoData;
      v5->_purchaseInfoData = (NSData *)v40;

      v42 = [v4 title];
      uint64_t v43 = [v42 copy];
      title = v5->_title;
      v5->_title = (NSString *)v43;

      v45 = [v4 subtitle];
      uint64_t v46 = [v45 copy];
      subtitle = v5->_subtitle;
      v5->_subtitle = (NSString *)v46;

      v48 = [v4 albumName];
      uint64_t v49 = [v48 copy];
      albumName = v5->_albumName;
      v5->_albumName = (NSString *)v49;

      v51 = [v4 trackArtistName];
      uint64_t v52 = [v51 copy];
      trackArtistName = v5->_trackArtistName;
      v5->_trackArtistName = (NSString *)v52;

      v54 = [v4 albumArtistName];
      uint64_t v55 = [v54 copy];
      albumArtistName = v5->_albumArtistName;
      v5->_albumArtistName = (NSString *)v55;

      v57 = [v4 directorName];
      uint64_t v58 = [v57 copy];
      directorName = v5->_directorName;
      v5->_directorName = (NSString *)v58;

      v60 = [v4 localizedContentRating];
      uint64_t v61 = [v60 copy];
      localizedContentRating = v5->_localizedContentRating;
      v5->_localizedContentRating = (NSString *)v61;

      v63 = [v4 collectionIdentifier];
      uint64_t v64 = [v63 copy];
      collectionIdentifier = v5->_collectionIdentifier;
      v5->_collectionIdentifier = (NSString *)v64;

      v66 = [v4 profileIdentifier];
      uint64_t v67 = [v66 copy];
      profileIdentifier = v5->_profileIdentifier;
      v5->_profileIdentifier = (NSString *)v67;

      v69 = [v4 composer];
      uint64_t v70 = [v69 copy];
      composer = v5->_composer;
      v5->_composer = (NSString *)v70;

      v72 = [v4 genre];
      uint64_t v73 = [v72 copy];
      genre = v5->_genre;
      v5->_genre = (NSString *)v73;

      v75 = [v4 contentIdentifier];
      uint64_t v76 = [v75 copy];
      contentIdentifier = v5->_contentIdentifier;
      v5->_contentIdentifier = (NSString *)v76;

      v78 = [v4 radioStationName];
      uint64_t v79 = [v78 copy];
      radioStationName = v5->_radioStationName;
      v5->_radioStationName = (NSString *)v79;

      v81 = [v4 radioStationString];
      uint64_t v82 = [v81 copy];
      radioStationString = v5->_radioStationString;
      v5->_radioStationString = (NSString *)v82;

      v84 = [v4 seriesName];
      uint64_t v85 = [v84 copy];
      seriesName = v5->_seriesName;
      v5->_seriesName = (NSString *)v85;

      if ([v4 hasLyricsURL])
      {
        id v87 = objc_alloc(MEMORY[0x1E4F1CB10]);
        v88 = [v4 lyricsURL];
        uint64_t v89 = [v87 initWithString:v88];
        lyricsURL = v5->_lyricsURL;
        v5->_lyricsURL = (NSURL *)v89;
      }
      else
      {
        v88 = v5->_lyricsURL;
        v5->_lyricsURL = 0;
      }

      v91 = [v4 serviceIdentifier];
      uint64_t v92 = [v91 copy];
      serviceIdentifier = v5->_serviceIdentifier;
      v5->_serviceIdentifier = (NSString *)v92;

      id v94 = [v4 brandIdentifier];
      uint64_t v95 = [v94 copy];
      brandIdentifier = v5->_brandIdentifier;
      v5->_brandIdentifier = (NSString *)v95;

      v97 = [v4 localizedDurationString];
      uint64_t v98 = [v97 copy];
      localizedDurationString = v5->_localizedDurationString;
      v5->_localizedDurationString = (NSString *)v98;

      v100 = [v4 durationStringLocalizationKey];
      uint64_t v101 = [v100 copy];
      durationStringLocalizationKey = v5->_durationStringLocalizationKey;
      v5->_durationStringLocalizationKey = (NSString *)v101;

      v103 = [v4 artworkIdentifier];
      uint64_t v104 = [v103 copy];
      artworkIdentifier = v5->_artworkIdentifier;
      v5->_artworkIdentifier = (NSString *)v104;

      v106 = [v4 artworkMIMEType];
      uint64_t v107 = [v106 copy];
      artworkMIMEType = v5->_artworkMIMEType;
      v5->_artworkMIMEType = (NSString *)v107;

      v109 = [v4 albumYear];
      uint64_t v110 = [v109 copy];
      albumYear = v5->_albumYear;
      v5->_albumYear = (NSString *)v110;

      if ([v4 hasAssetURLString])
      {
        id v112 = objc_alloc(MEMORY[0x1E4F1CB10]);
        v113 = [v4 assetURLString];
        uint64_t v114 = [v112 initWithString:v113];
        assetURL = v5->_assetURL;
        v5->_assetURL = (NSURL *)v114;
      }
      else
      {
        v113 = v5->_assetURL;
        v5->_assetURL = 0;
      }

      if ([v4 hasArtworkURL])
      {
        id v116 = objc_alloc(MEMORY[0x1E4F1CB10]);
        v117 = [v4 artworkURL];
        uint64_t v118 = [v116 initWithString:v117];
        artworkURL = v5->_artworkURL;
        v5->_artworkURL = (NSURL *)v118;
      }
      else
      {
        v117 = v5->_artworkURL;
        v5->_artworkURL = 0;
      }

      if ([v4 hasArtworkFileURL])
      {
        id v120 = objc_alloc(MEMORY[0x1E4F1CB10]);
        v121 = [v4 artworkFileURL];
        uint64_t v122 = [v120 initWithString:v121];
        artworkFileURL = v5->_artworkFileURL;
        v5->_artworkFileURL = (NSURL *)v122;
      }
      else
      {
        v121 = v5->_artworkFileURL;
        v5->_artworkFileURL = 0;
      }

      v124 = [v4 internationalStandardRecordingCode];
      uint64_t v125 = [v124 copy];
      internationalStandardRecordingCode = v5->_internationalStandardRecordingCode;
      v5->_internationalStandardRecordingCode = (NSString *)v125;

      if ([v4 hasParticipantName])
      {
        uint64_t v127 = [v4 participantName];
        participantName = v5->_participantName;
        v5->_participantName = (NSString *)v127;
      }
      else
      {
        participantName = v5->_participantName;
        v5->_participantName = 0;
      }

      if ([v4 hasParticipantIdentifier])
      {
        uint64_t v129 = [v4 participantIdentifier];
        participantIdentifier = v5->_participantIdentifier;
        v5->_participantIdentifier = (NSString *)v129;
      }
      else
      {
        participantIdentifier = v5->_participantIdentifier;
        v5->_participantIdentifier = 0;
      }

      v5->_isResolvableParticipant = [v4 isResolvableParticipant];
      v5->_hasIsResolvableParticipant = [v4 hasIsResolvableParticipant];
      v5->_excludeFromSuggestions = [v4 excludeFromSuggestions];
      v5->_hasExcludeFromSuggestions = [v4 hasExcludeFromSuggestions];
      v5->_songTraits = (int)[v4 songTraits];
      v5->_hasSongTraits = [v4 hasSongTraits];
      v5->_albumTraits = (int)[v4 albumTraits];
      v5->_hasAlbumTraits = [v4 hasAlbumTraits];
      v5->_playlistTraits = (int)[v4 playlistTraits];
      v5->_hasPlaylistTraits = [v4 hasPlaylistTraits];
      if ([v4 hasPreferredFormat])
      {
        v131 = [MRContentItemMetadataAudioFormat alloc];
        double v132 = [v4 preferredFormat];
        uint64_t v133 = [(MRContentItemMetadataAudioFormat *)v131 initWithProtobuf:v132];
        preferredFormat = v5->_preferredFormat;
        v5->_preferredFormat = (MRContentItemMetadataAudioFormat *)v133;
      }
      else
      {
        double v132 = v5->_preferredFormat;
        v5->_preferredFormat = 0;
      }

      if ([v4 hasActiveFormat])
      {
        double v135 = [MRContentItemMetadataAudioFormat alloc];
        double v136 = [v4 activeFormat];
        uint64_t v137 = [(MRContentItemMetadataAudioFormat *)v135 initWithProtobuf:v136];
        activeFormat = v5->_activeFormat;
        v5->_activeFormat = (MRContentItemMetadataAudioFormat *)v137;
      }
      else
      {
        double v136 = v5->_activeFormat;
        v5->_activeFormat = 0;
      }

      v5->_activeFormatJustification = (int)[v4 activeFormatJustification];
      v5->_hasActiveFormatJustification = [v4 hasActiveFormatJustification];
      v5->_formatTierPreference = (int)[v4 formatTierPreference];
      v5->_hasFormatTierPreference = [v4 hasFormatTierPreference];
      if ([v4 hasAudioRoute])
      {
        v139 = [MRContentItemMetadataAudioRoute alloc];
        v140 = [v4 audioRoute];
        uint64_t v141 = [(MRContentItemMetadataAudioRoute *)v139 initWithProtobuf:v140];
        audioRoute = v5->_audioRoute;
        v5->_audioRoute = (MRContentItemMetadataAudioRoute *)v141;
      }
      else
      {
        v140 = v5->_audioRoute;
        v5->_audioRoute = 0;
      }

      if ([v4 hasAlternativeFormats])
      {
        v143 = [v4 alternativeFormats];
        uint64_t v144 = objc_msgSend(v143, "msv_map:", &__block_literal_global_12);
        alternativeFormats = v5->_alternativeFormats;
        v5->_alternativeFormats = (NSArray *)v144;
      }
      else
      {
        v143 = v5->_alternativeFormats;
        v5->_alternativeFormats = 0;
      }

      if ([v4 hasArtworkURLTemplatesData])
      {
        v146 = [v4 artworkURLTemplatesData];
        uint64_t v147 = MRDecodeObjectWithEncoding(v146, 0);
        artworkURLTemplates = v5->_artworkURLTemplates;
        v5->_artworkURLTemplates = (NSArray *)v147;
      }
      v5->_reportingAdamID = [v4 reportingAdamID];
      v5->_hasReportingAdamID = [v4 hasReportingAdamID];
      v5->_lyricsAdamID = [v4 lyricsAdamID];
      v5->_hasLyricsAdamID = [v4 hasLyricsAdamID];
      v5->_iTunesStoreAlbumArtistIdentifier = [v4 iTunesStoreAlbumArtistIdentifier];
      v5->_hasITunesStoreAlbumArtistIdentifier = [v4 hasITunesStoreAlbumArtistIdentifier];
    }
    self = v5;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (int64_t)totalTrackCount
{
  return self->_totalTrackCount;
}

- (BOOL)isExplicitItem
{
  return self->_explicitItem;
}

- (int64_t)iTunesStoreAlbumIdentifier
{
  return self->_iTunesStoreAlbumIdentifier;
}

- (void)setHasInferredTimestamp:(BOOL)a3
{
  self->_hasInferredTimestamp = a3;
}

- (void)setHasElapsedTimeTimestamp:(BOOL)a3
{
  self->_hasElapsedTimeTimestamp = a3;
}

- (void)setHasElapsedTime:(BOOL)a3
{
  self->_hasElapsedTime = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRContentItemMetadata *)a3;
  if (v4 == self) {
    goto LABEL_419;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_420;
  }
  BOOL v5 = [(MRContentItemMetadata *)v4 hasContainer];
  if (v5 != [(MRContentItemMetadata *)self hasContainer]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasContainer])
  {
    if ([(MRContentItemMetadata *)self hasContainer])
    {
      BOOL v6 = [(MRContentItemMetadata *)v4 isContainer];
      if (v6 != [(MRContentItemMetadata *)self isContainer]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v7 = [(MRContentItemMetadata *)v4 hasPlayable];
  if (v7 != [(MRContentItemMetadata *)self hasPlayable]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasPlayable])
  {
    if ([(MRContentItemMetadata *)self hasPlayable])
    {
      BOOL v8 = [(MRContentItemMetadata *)v4 isPlayable];
      if (v8 != [(MRContentItemMetadata *)self isPlayable]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v9 = [(MRContentItemMetadata *)v4 hasExplicitItem];
  if (v9 != [(MRContentItemMetadata *)self hasExplicitItem]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasExplicitItem])
  {
    if ([(MRContentItemMetadata *)self hasExplicitItem])
    {
      BOOL v10 = [(MRContentItemMetadata *)v4 isExplicitItem];
      if (v10 != [(MRContentItemMetadata *)self isExplicitItem]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v11 = [(MRContentItemMetadata *)v4 hasStreamingContent];
  if (v11 != [(MRContentItemMetadata *)self hasStreamingContent]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasStreamingContent])
  {
    if ([(MRContentItemMetadata *)self hasStreamingContent])
    {
      BOOL v12 = [(MRContentItemMetadata *)v4 isStreamingContent];
      if (v12 != [(MRContentItemMetadata *)self isStreamingContent]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v13 = [(MRContentItemMetadata *)v4 hasCurrentlyPlaying];
  if (v13 != [(MRContentItemMetadata *)self hasCurrentlyPlaying]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasCurrentlyPlaying])
  {
    if ([(MRContentItemMetadata *)self hasCurrentlyPlaying])
    {
      BOOL v14 = [(MRContentItemMetadata *)v4 isCurrentlyPlaying];
      if (v14 != [(MRContentItemMetadata *)self isCurrentlyPlaying]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v15 = [(MRContentItemMetadata *)v4 hasAlwaysLive];
  if (v15 != [(MRContentItemMetadata *)self hasAlwaysLive]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasAlwaysLive])
  {
    if ([(MRContentItemMetadata *)self hasAlwaysLive])
    {
      BOOL v16 = [(MRContentItemMetadata *)v4 isAlwaysLive];
      if (v16 != [(MRContentItemMetadata *)self isAlwaysLive]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v17 = [(MRContentItemMetadata *)v4 hasSharable];
  if (v17 != [(MRContentItemMetadata *)self hasSharable]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasSharable])
  {
    if ([(MRContentItemMetadata *)self hasSharable])
    {
      BOOL v18 = [(MRContentItemMetadata *)v4 isSharable];
      if (v18 != [(MRContentItemMetadata *)self isSharable]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v19 = [(MRContentItemMetadata *)v4 hasLiked];
  if (v19 != [(MRContentItemMetadata *)self hasLiked]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasLiked])
  {
    if ([(MRContentItemMetadata *)self hasLiked])
    {
      BOOL v20 = [(MRContentItemMetadata *)v4 isLiked];
      if (v20 != [(MRContentItemMetadata *)self isLiked]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v21 = [(MRContentItemMetadata *)v4 hasInWishList];
  if (v21 != [(MRContentItemMetadata *)self hasInWishList]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasInWishList])
  {
    if ([(MRContentItemMetadata *)self hasInWishList])
    {
      BOOL v22 = [(MRContentItemMetadata *)v4 isInWishList];
      if (v22 != [(MRContentItemMetadata *)self isInWishList]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v23 = [(MRContentItemMetadata *)v4 hasAdvertisement];
  if (v23 != [(MRContentItemMetadata *)self hasAdvertisement]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasAdvertisement])
  {
    if ([(MRContentItemMetadata *)self hasAdvertisement])
    {
      BOOL v24 = [(MRContentItemMetadata *)v4 isAdvertisement];
      if (v24 != [(MRContentItemMetadata *)self isAdvertisement]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v25 = [(MRContentItemMetadata *)v4 hasSteerable];
  if (v25 != [(MRContentItemMetadata *)self hasSteerable]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasSteerable])
  {
    if ([(MRContentItemMetadata *)self hasSteerable])
    {
      BOOL v26 = [(MRContentItemMetadata *)v4 isSteerable];
      if (v26 != [(MRContentItemMetadata *)self isSteerable]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v27 = [(MRContentItemMetadata *)v4 hasLoading];
  if (v27 != [(MRContentItemMetadata *)self hasLoading]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasLoading])
  {
    if ([(MRContentItemMetadata *)self hasLoading])
    {
      BOOL v28 = [(MRContentItemMetadata *)v4 isLoading];
      if (v28 != [(MRContentItemMetadata *)self isLoading]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v29 = [(MRContentItemMetadata *)v4 hasInTransition];
  if (v29 != [(MRContentItemMetadata *)self hasInTransition]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasInTransition])
  {
    if ([(MRContentItemMetadata *)self hasInTransition])
    {
      BOOL v30 = [(MRContentItemMetadata *)v4 isInTransition];
      if (v30 != [(MRContentItemMetadata *)self isInTransition]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v31 = [(MRContentItemMetadata *)v4 hasArtworkAvailable];
  if (v31 != [(MRContentItemMetadata *)self hasArtworkAvailable]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasArtworkAvailable])
  {
    if ([(MRContentItemMetadata *)self hasArtworkAvailable])
    {
      BOOL v32 = [(MRContentItemMetadata *)v4 artworkAvailable];
      if (v32 != [(MRContentItemMetadata *)self artworkAvailable]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v33 = [(MRContentItemMetadata *)v4 hasInfoAvailable];
  if (v33 != [(MRContentItemMetadata *)self hasInfoAvailable]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasInfoAvailable])
  {
    if ([(MRContentItemMetadata *)self hasInfoAvailable])
    {
      BOOL v34 = [(MRContentItemMetadata *)v4 infoAvailable];
      if (v34 != [(MRContentItemMetadata *)self infoAvailable]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v35 = [(MRContentItemMetadata *)v4 hasTranscriptAlignmentsAvailable];
  if (v35 != [(MRContentItemMetadata *)self hasTranscriptAlignmentsAvailable]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasTranscriptAlignmentsAvailable])
  {
    if ([(MRContentItemMetadata *)self hasTranscriptAlignmentsAvailable])
    {
      BOOL v36 = [(MRContentItemMetadata *)v4 transcriptAlignmentsAvailable];
      if (v36 != [(MRContentItemMetadata *)self transcriptAlignmentsAvailable]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v37 = [(MRContentItemMetadata *)v4 hasLanguageOptionsAvailable];
  if (v37 != [(MRContentItemMetadata *)self hasLanguageOptionsAvailable]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasLanguageOptionsAvailable])
  {
    if ([(MRContentItemMetadata *)self hasLanguageOptionsAvailable])
    {
      BOOL v38 = [(MRContentItemMetadata *)v4 languageOptionsAvailable];
      if (v38 != [(MRContentItemMetadata *)self languageOptionsAvailable]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v39 = [(MRContentItemMetadata *)v4 hasLyricsAvailable];
  if (v39 != [(MRContentItemMetadata *)self hasLyricsAvailable]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasLyricsAvailable])
  {
    if ([(MRContentItemMetadata *)self hasLyricsAvailable])
    {
      BOOL v40 = [(MRContentItemMetadata *)v4 lyricsAvailable];
      if (v40 != [(MRContentItemMetadata *)self lyricsAvailable]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v41 = [(MRContentItemMetadata *)v4 hasPlaybackProgress];
  if (v41 != [(MRContentItemMetadata *)self hasPlaybackProgress]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasPlaybackProgress])
  {
    if ([(MRContentItemMetadata *)self hasPlaybackProgress])
    {
      [(MRContentItemMetadata *)v4 playbackProgress];
      float v43 = v42;
      [(MRContentItemMetadata *)self playbackProgress];
      if (v43 != v44) {
        goto LABEL_420;
      }
    }
  }
  BOOL v45 = [(MRContentItemMetadata *)v4 hasPlaybackRate];
  if (v45 != [(MRContentItemMetadata *)self hasPlaybackRate]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasPlaybackRate])
  {
    if ([(MRContentItemMetadata *)self hasPlaybackRate])
    {
      [(MRContentItemMetadata *)v4 playbackRate];
      float v47 = v46;
      [(MRContentItemMetadata *)self playbackRate];
      if (v47 != v48) {
        goto LABEL_420;
      }
    }
  }
  BOOL v49 = [(MRContentItemMetadata *)v4 hasDefaultPlaybackRate];
  if (v49 != [(MRContentItemMetadata *)self hasDefaultPlaybackRate]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasDefaultPlaybackRate])
  {
    if ([(MRContentItemMetadata *)self hasDefaultPlaybackRate])
    {
      [(MRContentItemMetadata *)v4 defaultPlaybackRate];
      float v51 = v50;
      [(MRContentItemMetadata *)self defaultPlaybackRate];
      if (v51 != v52) {
        goto LABEL_420;
      }
    }
  }
  BOOL v53 = [(MRContentItemMetadata *)v4 hasDownloadProgress];
  if (v53 != [(MRContentItemMetadata *)self hasDownloadProgress]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasDownloadProgress])
  {
    if ([(MRContentItemMetadata *)self hasDownloadProgress])
    {
      [(MRContentItemMetadata *)v4 downloadProgress];
      float v55 = v54;
      [(MRContentItemMetadata *)self downloadProgress];
      if (v55 != v56) {
        goto LABEL_420;
      }
    }
  }
  BOOL v57 = [(MRContentItemMetadata *)v4 hasPlaylistType];
  if (v57 != [(MRContentItemMetadata *)self hasPlaylistType]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasPlaylistType])
  {
    if ([(MRContentItemMetadata *)self hasPlaylistType])
    {
      uint64_t v58 = [(MRContentItemMetadata *)v4 playlistType];
      if (v58 != [(MRContentItemMetadata *)self playlistType]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v59 = [(MRContentItemMetadata *)v4 hasRadioStationType];
  if (v59 != [(MRContentItemMetadata *)self hasRadioStationType]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasRadioStationType])
  {
    if ([(MRContentItemMetadata *)self hasRadioStationType])
    {
      uint64_t v60 = [(MRContentItemMetadata *)v4 radioStationType];
      if (v60 != [(MRContentItemMetadata *)self radioStationType]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v61 = [(MRContentItemMetadata *)v4 hasEditingStyleFlags];
  if (v61 != [(MRContentItemMetadata *)self hasEditingStyleFlags]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasEditingStyleFlags])
  {
    if ([(MRContentItemMetadata *)self hasEditingStyleFlags])
    {
      uint64_t v62 = [(MRContentItemMetadata *)v4 editingStyleFlags];
      if (v62 != [(MRContentItemMetadata *)self editingStyleFlags]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v63 = [(MRContentItemMetadata *)v4 hasMediaType];
  if (v63 != [(MRContentItemMetadata *)self hasMediaType]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasMediaType])
  {
    if ([(MRContentItemMetadata *)self hasMediaType])
    {
      uint64_t v64 = [(MRContentItemMetadata *)v4 mediaType];
      if (v64 != [(MRContentItemMetadata *)self mediaType]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v65 = [(MRContentItemMetadata *)v4 hasMediaSubType];
  if (v65 != [(MRContentItemMetadata *)self hasMediaSubType]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasMediaSubType])
  {
    if ([(MRContentItemMetadata *)self hasMediaSubType])
    {
      uint64_t v66 = [(MRContentItemMetadata *)v4 mediaSubType];
      if (v66 != [(MRContentItemMetadata *)self mediaSubType]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v67 = [(MRContentItemMetadata *)v4 hasEpisodeType];
  if (v67 != [(MRContentItemMetadata *)self hasEpisodeType]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasEpisodeType])
  {
    if ([(MRContentItemMetadata *)self hasEpisodeType])
    {
      uint64_t v68 = [(MRContentItemMetadata *)v4 episodeType];
      if (v68 != [(MRContentItemMetadata *)self episodeType]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v69 = [(MRContentItemMetadata *)v4 hasPlayCount];
  if (v69 != [(MRContentItemMetadata *)self hasPlayCount]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasPlayCount])
  {
    if ([(MRContentItemMetadata *)self hasPlayCount])
    {
      uint64_t v70 = [(MRContentItemMetadata *)v4 playCount];
      if (v70 != [(MRContentItemMetadata *)self playCount]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v71 = [(MRContentItemMetadata *)v4 hasNumberOfSections];
  if (v71 != [(MRContentItemMetadata *)self hasNumberOfSections]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasNumberOfSections])
  {
    if ([(MRContentItemMetadata *)self hasNumberOfSections])
    {
      uint64_t v72 = [(MRContentItemMetadata *)v4 numberOfSections];
      if (v72 != [(MRContentItemMetadata *)self numberOfSections]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v73 = [(MRContentItemMetadata *)v4 hasChapterCount];
  if (v73 != [(MRContentItemMetadata *)self hasChapterCount]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasChapterCount])
  {
    if ([(MRContentItemMetadata *)self hasChapterCount])
    {
      uint64_t v74 = [(MRContentItemMetadata *)v4 chapterCount];
      if (v74 != [(MRContentItemMetadata *)self chapterCount]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v75 = [(MRContentItemMetadata *)v4 hasTotalDiscCount];
  if (v75 != [(MRContentItemMetadata *)self hasTotalDiscCount]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasTotalDiscCount])
  {
    if ([(MRContentItemMetadata *)self hasTotalDiscCount])
    {
      uint64_t v76 = [(MRContentItemMetadata *)v4 totalDiscCount];
      if (v76 != [(MRContentItemMetadata *)self totalDiscCount]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v77 = [(MRContentItemMetadata *)v4 hasTotalTrackCount];
  if (v77 != [(MRContentItemMetadata *)self hasTotalTrackCount]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasTotalTrackCount])
  {
    if ([(MRContentItemMetadata *)self hasTotalTrackCount])
    {
      uint64_t v78 = [(MRContentItemMetadata *)v4 totalTrackCount];
      if (v78 != [(MRContentItemMetadata *)self totalTrackCount]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v79 = [(MRContentItemMetadata *)v4 hasDownloadState];
  if (v79 != [(MRContentItemMetadata *)self hasDownloadState]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasDownloadState])
  {
    if ([(MRContentItemMetadata *)self hasDownloadState])
    {
      uint64_t v80 = [(MRContentItemMetadata *)v4 downloadState];
      if (v80 != [(MRContentItemMetadata *)self downloadState]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v81 = [(MRContentItemMetadata *)v4 hasArtworkDataWidthDeprecated];
  if (v81 != [(MRContentItemMetadata *)self hasArtworkDataWidthDeprecated]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasArtworkDataWidthDeprecated])
  {
    if ([(MRContentItemMetadata *)self hasArtworkDataWidthDeprecated])
    {
      uint64_t v82 = [(MRContentItemMetadata *)v4 artworkDataWidthDeprecated];
      if (v82 != [(MRContentItemMetadata *)self artworkDataWidthDeprecated]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v83 = [(MRContentItemMetadata *)v4 hasArtworkDataHeightDeprecated];
  if (v83 != [(MRContentItemMetadata *)self hasArtworkDataHeightDeprecated]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasArtworkDataHeightDeprecated])
  {
    if ([(MRContentItemMetadata *)self hasArtworkDataHeightDeprecated])
    {
      uint64_t v84 = [(MRContentItemMetadata *)v4 artworkDataHeightDeprecated];
      if (v84 != [(MRContentItemMetadata *)self artworkDataHeightDeprecated]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v85 = [(MRContentItemMetadata *)v4 hasDuration];
  if (v85 != [(MRContentItemMetadata *)self hasDuration]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasDuration])
  {
    if ([(MRContentItemMetadata *)self hasDuration])
    {
      [(MRContentItemMetadata *)v4 duration];
      double v87 = v86;
      [(MRContentItemMetadata *)self duration];
      if (v87 != v88) {
        goto LABEL_420;
      }
    }
  }
  BOOL v89 = [(MRContentItemMetadata *)v4 hasStartTime];
  if (v89 != [(MRContentItemMetadata *)self hasStartTime]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasStartTime])
  {
    if ([(MRContentItemMetadata *)self hasStartTime])
    {
      [(MRContentItemMetadata *)v4 startTime];
      double v91 = v90;
      [(MRContentItemMetadata *)self startTime];
      if (v91 != v92) {
        goto LABEL_420;
      }
    }
  }
  BOOL v93 = [(MRContentItemMetadata *)v4 hasElapsedTime];
  if (v93 != [(MRContentItemMetadata *)self hasElapsedTime]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasElapsedTime])
  {
    if ([(MRContentItemMetadata *)self hasElapsedTime])
    {
      [(MRContentItemMetadata *)v4 elapsedTime];
      double v95 = v94;
      [(MRContentItemMetadata *)self elapsedTime];
      if (v95 != v96) {
        goto LABEL_420;
      }
    }
  }
  BOOL v97 = [(MRContentItemMetadata *)v4 hasElapsedTimeTimestamp];
  if (v97 != [(MRContentItemMetadata *)self hasElapsedTimeTimestamp]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasElapsedTimeTimestamp])
  {
    if ([(MRContentItemMetadata *)self hasElapsedTimeTimestamp])
    {
      [(MRContentItemMetadata *)v4 elapsedTimeTimestamp];
      double v99 = v98;
      [(MRContentItemMetadata *)self elapsedTimeTimestamp];
      if (v99 != v100) {
        goto LABEL_420;
      }
    }
  }
  BOOL v101 = [(MRContentItemMetadata *)v4 hasInferredTimestamp];
  if (v101 != [(MRContentItemMetadata *)self hasInferredTimestamp]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasInferredTimestamp])
  {
    if ([(MRContentItemMetadata *)self hasInferredTimestamp])
    {
      [(MRContentItemMetadata *)v4 inferredTimestamp];
      double v103 = v102;
      [(MRContentItemMetadata *)self inferredTimestamp];
      if (v103 != v104) {
        goto LABEL_420;
      }
    }
  }
  BOOL v105 = [(MRContentItemMetadata *)v4 hasSeasonNumber];
  if (v105 != [(MRContentItemMetadata *)self hasSeasonNumber]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasSeasonNumber])
  {
    if ([(MRContentItemMetadata *)self hasSeasonNumber])
    {
      uint64_t v106 = [(MRContentItemMetadata *)v4 seasonNumber];
      if (v106 != [(MRContentItemMetadata *)self seasonNumber]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v107 = [(MRContentItemMetadata *)v4 hasEpisodeNumber];
  if (v107 != [(MRContentItemMetadata *)self hasEpisodeNumber]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasEpisodeNumber])
  {
    if ([(MRContentItemMetadata *)self hasEpisodeNumber])
    {
      uint64_t v108 = [(MRContentItemMetadata *)v4 episodeNumber];
      if (v108 != [(MRContentItemMetadata *)self episodeNumber]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v109 = [(MRContentItemMetadata *)v4 hasDiscNumber];
  if (v109 != [(MRContentItemMetadata *)self hasDiscNumber]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasDiscNumber])
  {
    if ([(MRContentItemMetadata *)self hasDiscNumber])
    {
      uint64_t v110 = [(MRContentItemMetadata *)v4 discNumber];
      if (v110 != [(MRContentItemMetadata *)self discNumber]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v111 = [(MRContentItemMetadata *)v4 hasTrackNumber];
  if (v111 != [(MRContentItemMetadata *)self hasTrackNumber]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasTrackNumber])
  {
    if ([(MRContentItemMetadata *)self hasTrackNumber])
    {
      uint64_t v112 = [(MRContentItemMetadata *)v4 trackNumber];
      if (v112 != [(MRContentItemMetadata *)self trackNumber]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v113 = [(MRContentItemMetadata *)v4 hasRadioStationIdentifier];
  if (v113 != [(MRContentItemMetadata *)self hasRadioStationIdentifier]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasRadioStationIdentifier])
  {
    if ([(MRContentItemMetadata *)self hasRadioStationIdentifier])
    {
      uint64_t v114 = [(MRContentItemMetadata *)v4 radioStationIdentifier];
      if (v114 != [(MRContentItemMetadata *)self radioStationIdentifier]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v115 = [(MRContentItemMetadata *)v4 hasITunesStoreIdentifier];
  if (v115 != [(MRContentItemMetadata *)self hasITunesStoreIdentifier]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasITunesStoreIdentifier])
  {
    if ([(MRContentItemMetadata *)self hasITunesStoreIdentifier])
    {
      uint64_t v116 = [(MRContentItemMetadata *)v4 iTunesStoreIdentifier];
      if (v116 != [(MRContentItemMetadata *)self iTunesStoreIdentifier]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v117 = [(MRContentItemMetadata *)v4 hasITunesStoreSubscriptionIdentifier];
  if (v117 != [(MRContentItemMetadata *)self hasITunesStoreSubscriptionIdentifier])goto LABEL_420; {
  if ([(MRContentItemMetadata *)v4 hasITunesStoreSubscriptionIdentifier])
  }
  {
    if ([(MRContentItemMetadata *)self hasITunesStoreSubscriptionIdentifier])
    {
      uint64_t v118 = [(MRContentItemMetadata *)v4 iTunesStoreSubscriptionIdentifier];
      if (v118 != [(MRContentItemMetadata *)self iTunesStoreSubscriptionIdentifier]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v119 = [(MRContentItemMetadata *)v4 hasITunesStoreArtistIdentifier];
  if (v119 != [(MRContentItemMetadata *)self hasITunesStoreArtistIdentifier]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasITunesStoreArtistIdentifier])
  {
    if ([(MRContentItemMetadata *)self hasITunesStoreArtistIdentifier])
    {
      uint64_t v120 = [(MRContentItemMetadata *)v4 iTunesStoreArtistIdentifier];
      if (v120 != [(MRContentItemMetadata *)self iTunesStoreArtistIdentifier]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v121 = [(MRContentItemMetadata *)v4 hasITunesStoreAlbumIdentifier];
  if (v121 != [(MRContentItemMetadata *)self hasITunesStoreAlbumIdentifier]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasITunesStoreAlbumIdentifier])
  {
    if ([(MRContentItemMetadata *)self hasITunesStoreAlbumIdentifier])
    {
      uint64_t v122 = [(MRContentItemMetadata *)v4 iTunesStoreAlbumIdentifier];
      if (v122 != [(MRContentItemMetadata *)self iTunesStoreAlbumIdentifier]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v123 = [(MRContentItemMetadata *)v4 hasLegacyUniqueIdentifier];
  if (v123 != [(MRContentItemMetadata *)self hasLegacyUniqueIdentifier]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasLegacyUniqueIdentifier])
  {
    if ([(MRContentItemMetadata *)self hasLegacyUniqueIdentifier])
    {
      uint64_t v124 = [(MRContentItemMetadata *)v4 legacyUniqueIdentifier];
      if (v124 != [(MRContentItemMetadata *)self legacyUniqueIdentifier]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v125 = [(MRContentItemMetadata *)v4 hasSongTraits];
  if (v125 != [(MRContentItemMetadata *)self hasSongTraits]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasSongTraits])
  {
    if ([(MRContentItemMetadata *)self hasSongTraits])
    {
      uint64_t v126 = [(MRContentItemMetadata *)v4 songTraits];
      if (v126 != [(MRContentItemMetadata *)self songTraits]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v127 = [(MRContentItemMetadata *)v4 hasAlbumTraits];
  if (v127 != [(MRContentItemMetadata *)self hasAlbumTraits]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasAlbumTraits])
  {
    if ([(MRContentItemMetadata *)self hasAlbumTraits])
    {
      uint64_t v128 = [(MRContentItemMetadata *)v4 albumTraits];
      if (v128 != [(MRContentItemMetadata *)self albumTraits]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v129 = [(MRContentItemMetadata *)v4 hasPlaylistTraits];
  if (v129 != [(MRContentItemMetadata *)self hasPlaylistTraits]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasPlaylistTraits])
  {
    if ([(MRContentItemMetadata *)self hasPlaylistTraits])
    {
      uint64_t v130 = [(MRContentItemMetadata *)v4 playlistTraits];
      if (v130 != [(MRContentItemMetadata *)self playlistTraits]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v131 = [(MRContentItemMetadata *)v4 hasActiveFormatJustification];
  if (v131 != [(MRContentItemMetadata *)self hasActiveFormatJustification]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasActiveFormatJustification])
  {
    if ([(MRContentItemMetadata *)self hasActiveFormatJustification])
    {
      uint64_t v132 = [(MRContentItemMetadata *)v4 activeFormatJustification];
      if (v132 != [(MRContentItemMetadata *)self activeFormatJustification]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v133 = [(MRContentItemMetadata *)v4 hasFormatTierPreference];
  if (v133 != [(MRContentItemMetadata *)self hasFormatTierPreference]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasFormatTierPreference])
  {
    if ([(MRContentItemMetadata *)self hasFormatTierPreference])
    {
      uint64_t v134 = [(MRContentItemMetadata *)v4 formatTierPreference];
      if (v134 != [(MRContentItemMetadata *)self formatTierPreference]) {
        goto LABEL_420;
      }
    }
  }
  double v135 = [(MRContentItemMetadata *)v4 purchaseInfoData];
  uint64_t v136 = [(MRContentItemMetadata *)self purchaseInfoData];
  if (v135 == (void *)v136)
  {
  }
  else
  {
    uint64_t v137 = (void *)v136;
    double v138 = [(MRContentItemMetadata *)v4 purchaseInfoData];
    v139 = [(MRContentItemMetadata *)self purchaseInfoData];
    int v140 = [v138 isEqualToData:v139];

    if (!v140) {
      goto LABEL_420;
    }
  }
  uint64_t v141 = [(MRContentItemMetadata *)v4 appMetrics];
  uint64_t v142 = [(MRContentItemMetadata *)self appMetrics];
  if (v141 == (void *)v142)
  {
  }
  else
  {
    v143 = (void *)v142;
    uint64_t v144 = [(MRContentItemMetadata *)v4 appMetrics];
    v145 = [(MRContentItemMetadata *)self appMetrics];
    int v146 = [v144 isEqualToDictionary:v145];

    if (!v146) {
      goto LABEL_420;
    }
  }
  uint64_t v147 = [(MRContentItemMetadata *)v4 nowPlayingInfo];
  uint64_t v148 = [(MRContentItemMetadata *)self nowPlayingInfo];
  if (v147 == (void *)v148)
  {
  }
  else
  {
    v149 = (void *)v148;
    objc_super v150 = [(MRContentItemMetadata *)v4 nowPlayingInfo];
    v151 = [(MRContentItemMetadata *)self nowPlayingInfo];
    int v152 = [v150 isEqualToDictionary:v151];

    if (!v152) {
      goto LABEL_420;
    }
  }
  v153 = [(MRContentItemMetadata *)v4 userInfo];
  uint64_t v154 = [(MRContentItemMetadata *)self userInfo];
  if (v153 == (void *)v154)
  {
  }
  else
  {
    v155 = (void *)v154;
    v156 = [(MRContentItemMetadata *)v4 userInfo];
    v157 = [(MRContentItemMetadata *)self userInfo];
    int v158 = [v156 isEqualToDictionary:v157];

    if (!v158) {
      goto LABEL_420;
    }
  }
  v159 = [(MRContentItemMetadata *)v4 deviceSpecificUserInfo];
  uint64_t v160 = [(MRContentItemMetadata *)self deviceSpecificUserInfo];
  if (v159 == (void *)v160)
  {
  }
  else
  {
    v161 = (void *)v160;
    v162 = [(MRContentItemMetadata *)v4 deviceSpecificUserInfo];
    v163 = [(MRContentItemMetadata *)self deviceSpecificUserInfo];
    int v164 = [v162 isEqualToDictionary:v163];

    if (!v164) {
      goto LABEL_420;
    }
  }
  v165 = [(MRContentItemMetadata *)v4 collectionInfo];
  uint64_t v166 = [(MRContentItemMetadata *)self collectionInfo];
  if (v165 == (void *)v166)
  {
  }
  else
  {
    v167 = (void *)v166;
    v168 = [(MRContentItemMetadata *)v4 collectionInfo];
    v169 = [(MRContentItemMetadata *)self collectionInfo];
    int v170 = [v168 isEqualToDictionary:v169];

    if (!v170) {
      goto LABEL_420;
    }
  }
  v171 = [(MRContentItemMetadata *)v4 releaseDate];
  uint64_t v172 = [(MRContentItemMetadata *)self releaseDate];
  if (v171 == (void *)v172)
  {
  }
  else
  {
    v173 = (void *)v172;
    v174 = [(MRContentItemMetadata *)v4 releaseDate];
    v175 = [(MRContentItemMetadata *)self releaseDate];
    int v176 = [v174 isEqualToDate:v175];

    if (!v176) {
      goto LABEL_420;
    }
  }
  v177 = [(MRContentItemMetadata *)v4 currentPlaybackDate];
  uint64_t v178 = [(MRContentItemMetadata *)self currentPlaybackDate];
  if (v177 == (void *)v178)
  {
  }
  else
  {
    v179 = (void *)v178;
    v180 = [(MRContentItemMetadata *)v4 currentPlaybackDate];
    v181 = [(MRContentItemMetadata *)self currentPlaybackDate];
    int v182 = [v180 isEqualToDate:v181];

    if (!v182) {
      goto LABEL_420;
    }
  }
  v183 = [(MRContentItemMetadata *)v4 title];
  uint64_t v184 = [(MRContentItemMetadata *)self title];
  if (v183 == (void *)v184)
  {
  }
  else
  {
    v185 = (void *)v184;
    v186 = [(MRContentItemMetadata *)v4 title];
    v187 = [(MRContentItemMetadata *)self title];
    int v188 = [v186 isEqualToString:v187];

    if (!v188) {
      goto LABEL_420;
    }
  }
  v189 = [(MRContentItemMetadata *)v4 subtitle];
  uint64_t v190 = [(MRContentItemMetadata *)self subtitle];
  if (v189 == (void *)v190)
  {
  }
  else
  {
    v191 = (void *)v190;
    v192 = [(MRContentItemMetadata *)v4 subtitle];
    v193 = [(MRContentItemMetadata *)self subtitle];
    int v194 = [v192 isEqualToString:v193];

    if (!v194) {
      goto LABEL_420;
    }
  }
  v195 = [(MRContentItemMetadata *)v4 classicalWork];
  uint64_t v196 = [(MRContentItemMetadata *)self classicalWork];
  if (v195 == (void *)v196)
  {
  }
  else
  {
    v197 = (void *)v196;
    v198 = [(MRContentItemMetadata *)v4 classicalWork];
    v199 = [(MRContentItemMetadata *)self classicalWork];
    int v200 = [v198 isEqualToString:v199];

    if (!v200) {
      goto LABEL_420;
    }
  }
  v201 = [(MRContentItemMetadata *)v4 albumName];
  uint64_t v202 = [(MRContentItemMetadata *)self albumName];
  if (v201 == (void *)v202)
  {
  }
  else
  {
    v203 = (void *)v202;
    v204 = [(MRContentItemMetadata *)v4 albumName];
    v205 = [(MRContentItemMetadata *)self albumName];
    int v206 = [v204 isEqualToString:v205];

    if (!v206) {
      goto LABEL_420;
    }
  }
  v207 = [(MRContentItemMetadata *)v4 trackArtistName];
  uint64_t v208 = [(MRContentItemMetadata *)self trackArtistName];
  if (v207 == (void *)v208)
  {
  }
  else
  {
    v209 = (void *)v208;
    v210 = [(MRContentItemMetadata *)v4 trackArtistName];
    v211 = [(MRContentItemMetadata *)self trackArtistName];
    int v212 = [v210 isEqualToString:v211];

    if (!v212) {
      goto LABEL_420;
    }
  }
  v213 = [(MRContentItemMetadata *)v4 albumArtistName];
  uint64_t v214 = [(MRContentItemMetadata *)self albumArtistName];
  if (v213 == (void *)v214)
  {
  }
  else
  {
    v215 = (void *)v214;
    v216 = [(MRContentItemMetadata *)v4 albumArtistName];
    v217 = [(MRContentItemMetadata *)self albumArtistName];
    int v218 = [v216 isEqualToString:v217];

    if (!v218) {
      goto LABEL_420;
    }
  }
  v219 = [(MRContentItemMetadata *)v4 directorName];
  uint64_t v220 = [(MRContentItemMetadata *)self directorName];
  if (v219 == (void *)v220)
  {
  }
  else
  {
    v221 = (void *)v220;
    v222 = [(MRContentItemMetadata *)v4 directorName];
    v223 = [(MRContentItemMetadata *)self directorName];
    int v224 = [v222 isEqualToString:v223];

    if (!v224) {
      goto LABEL_420;
    }
  }
  v225 = [(MRContentItemMetadata *)v4 localizedContentRating];
  uint64_t v226 = [(MRContentItemMetadata *)self localizedContentRating];
  if (v225 == (void *)v226)
  {
  }
  else
  {
    v227 = (void *)v226;
    v228 = [(MRContentItemMetadata *)v4 localizedContentRating];
    v229 = [(MRContentItemMetadata *)self localizedContentRating];
    int v230 = [v228 isEqualToString:v229];

    if (!v230) {
      goto LABEL_420;
    }
  }
  v231 = [(MRContentItemMetadata *)v4 collectionIdentifier];
  uint64_t v232 = [(MRContentItemMetadata *)self collectionIdentifier];
  if (v231 == (void *)v232)
  {
  }
  else
  {
    v233 = (void *)v232;
    v234 = [(MRContentItemMetadata *)v4 collectionIdentifier];
    v235 = [(MRContentItemMetadata *)self collectionIdentifier];
    int v236 = [v234 isEqualToString:v235];

    if (!v236) {
      goto LABEL_420;
    }
  }
  v237 = [(MRContentItemMetadata *)v4 profileIdentifier];
  uint64_t v238 = [(MRContentItemMetadata *)self profileIdentifier];
  if (v237 == (void *)v238)
  {
  }
  else
  {
    v239 = (void *)v238;
    v240 = [(MRContentItemMetadata *)v4 profileIdentifier];
    v241 = [(MRContentItemMetadata *)self profileIdentifier];
    int v242 = [v240 isEqualToString:v241];

    if (!v242) {
      goto LABEL_420;
    }
  }
  v243 = [(MRContentItemMetadata *)v4 assetURL];
  uint64_t v244 = [(MRContentItemMetadata *)self assetURL];
  if (v243 == (void *)v244)
  {
  }
  else
  {
    v245 = (void *)v244;
    v246 = [(MRContentItemMetadata *)v4 assetURL];
    v247 = [(MRContentItemMetadata *)self assetURL];
    int v248 = [v246 isEqual:v247];

    if (!v248) {
      goto LABEL_420;
    }
  }
  v249 = [(MRContentItemMetadata *)v4 composer];
  uint64_t v250 = [(MRContentItemMetadata *)self composer];
  if (v249 == (void *)v250)
  {
  }
  else
  {
    v251 = (void *)v250;
    v252 = [(MRContentItemMetadata *)v4 composer];
    v253 = [(MRContentItemMetadata *)self composer];
    int v254 = [v252 isEqualToString:v253];

    if (!v254) {
      goto LABEL_420;
    }
  }
  v255 = [(MRContentItemMetadata *)v4 genre];
  uint64_t v256 = [(MRContentItemMetadata *)self genre];
  if (v255 == (void *)v256)
  {
  }
  else
  {
    v257 = (void *)v256;
    v258 = [(MRContentItemMetadata *)v4 genre];
    v259 = [(MRContentItemMetadata *)self genre];
    int v260 = [v258 isEqualToString:v259];

    if (!v260) {
      goto LABEL_420;
    }
  }
  v261 = [(MRContentItemMetadata *)v4 contentIdentifier];
  uint64_t v262 = [(MRContentItemMetadata *)self contentIdentifier];
  if (v261 == (void *)v262)
  {
  }
  else
  {
    v263 = (void *)v262;
    v264 = [(MRContentItemMetadata *)v4 contentIdentifier];
    v265 = [(MRContentItemMetadata *)self contentIdentifier];
    int v266 = [v264 isEqualToString:v265];

    if (!v266) {
      goto LABEL_420;
    }
  }
  v267 = [(MRContentItemMetadata *)v4 internationalStandardRecordingCode];
  uint64_t v268 = [(MRContentItemMetadata *)self internationalStandardRecordingCode];
  if (v267 == (void *)v268)
  {
  }
  else
  {
    v269 = (void *)v268;
    v270 = [(MRContentItemMetadata *)v4 internationalStandardRecordingCode];
    v271 = [(MRContentItemMetadata *)self internationalStandardRecordingCode];
    int v272 = [v270 isEqualToString:v271];

    if (!v272) {
      goto LABEL_420;
    }
  }
  v273 = [(MRContentItemMetadata *)v4 radioStationName];
  uint64_t v274 = [(MRContentItemMetadata *)self radioStationName];
  if (v273 == (void *)v274)
  {
  }
  else
  {
    v275 = (void *)v274;
    v276 = [(MRContentItemMetadata *)v4 radioStationName];
    v277 = [(MRContentItemMetadata *)self radioStationName];
    int v278 = [v276 isEqualToString:v277];

    if (!v278) {
      goto LABEL_420;
    }
  }
  v279 = [(MRContentItemMetadata *)v4 radioStationString];
  uint64_t v280 = [(MRContentItemMetadata *)self radioStationString];
  if (v279 == (void *)v280)
  {
  }
  else
  {
    v281 = (void *)v280;
    v282 = [(MRContentItemMetadata *)v4 radioStationString];
    v283 = [(MRContentItemMetadata *)self radioStationString];
    int v284 = [v282 isEqualToString:v283];

    if (!v284) {
      goto LABEL_420;
    }
  }
  v285 = [(MRContentItemMetadata *)v4 seriesName];
  uint64_t v286 = [(MRContentItemMetadata *)self seriesName];
  if (v285 == (void *)v286)
  {
  }
  else
  {
    v287 = (void *)v286;
    v288 = [(MRContentItemMetadata *)v4 seriesName];
    v289 = [(MRContentItemMetadata *)self seriesName];
    int v290 = [v288 isEqualToString:v289];

    if (!v290) {
      goto LABEL_420;
    }
  }
  v291 = [(MRContentItemMetadata *)v4 lyricsURL];
  uint64_t v292 = [(MRContentItemMetadata *)self lyricsURL];
  if (v291 == (void *)v292)
  {
  }
  else
  {
    v293 = (void *)v292;
    v294 = [(MRContentItemMetadata *)v4 lyricsURL];
    v295 = [(MRContentItemMetadata *)self lyricsURL];
    int v296 = [v294 isEqual:v295];

    if (!v296) {
      goto LABEL_420;
    }
  }
  v297 = [(MRContentItemMetadata *)v4 serviceIdentifier];
  uint64_t v298 = [(MRContentItemMetadata *)self serviceIdentifier];
  if (v297 == (void *)v298)
  {
  }
  else
  {
    v299 = (void *)v298;
    v300 = [(MRContentItemMetadata *)v4 serviceIdentifier];
    v301 = [(MRContentItemMetadata *)self serviceIdentifier];
    int v302 = [v300 isEqualToString:v301];

    if (!v302) {
      goto LABEL_420;
    }
  }
  v303 = [(MRContentItemMetadata *)v4 brandIdentifier];
  uint64_t v304 = [(MRContentItemMetadata *)self brandIdentifier];
  if (v303 == (void *)v304)
  {
  }
  else
  {
    v305 = (void *)v304;
    v306 = [(MRContentItemMetadata *)v4 brandIdentifier];
    v307 = [(MRContentItemMetadata *)self brandIdentifier];
    int v308 = [v306 isEqualToString:v307];

    if (!v308) {
      goto LABEL_420;
    }
  }
  v309 = [(MRContentItemMetadata *)v4 durationStringLocalizationKey];
  uint64_t v310 = [(MRContentItemMetadata *)self durationStringLocalizationKey];
  if (v309 == (void *)v310)
  {
  }
  else
  {
    v311 = (void *)v310;
    v312 = [(MRContentItemMetadata *)v4 durationStringLocalizationKey];
    v313 = [(MRContentItemMetadata *)self durationStringLocalizationKey];
    int v314 = [v312 isEqualToString:v313];

    if (!v314) {
      goto LABEL_420;
    }
  }
  v315 = [(MRContentItemMetadata *)v4 localizedDurationString];
  uint64_t v316 = [(MRContentItemMetadata *)self localizedDurationString];
  if (v315 == (void *)v316)
  {
  }
  else
  {
    v317 = (void *)v316;
    v318 = [(MRContentItemMetadata *)v4 localizedDurationString];
    v319 = [(MRContentItemMetadata *)self localizedDurationString];
    int v320 = [v318 isEqualToString:v319];

    if (!v320) {
      goto LABEL_420;
    }
  }
  v321 = [(MRContentItemMetadata *)v4 artworkIdentifier];
  uint64_t v322 = [(MRContentItemMetadata *)self artworkIdentifier];
  if (v321 == (void *)v322)
  {
  }
  else
  {
    v323 = (void *)v322;
    v324 = [(MRContentItemMetadata *)v4 artworkIdentifier];
    v325 = [(MRContentItemMetadata *)self artworkIdentifier];
    int v326 = [v324 isEqualToString:v325];

    if (!v326) {
      goto LABEL_420;
    }
  }
  v327 = [(MRContentItemMetadata *)v4 artworkMIMEType];
  uint64_t v328 = [(MRContentItemMetadata *)self artworkMIMEType];
  if (v327 == (void *)v328)
  {
  }
  else
  {
    v329 = (void *)v328;
    v330 = [(MRContentItemMetadata *)v4 artworkMIMEType];
    v331 = [(MRContentItemMetadata *)self artworkMIMEType];
    int v332 = [v330 isEqualToString:v331];

    if (!v332) {
      goto LABEL_420;
    }
  }
  v333 = [(MRContentItemMetadata *)v4 artworkURL];
  uint64_t v334 = [(MRContentItemMetadata *)self artworkURL];
  if (v333 == (void *)v334)
  {
  }
  else
  {
    v335 = (void *)v334;
    v336 = [(MRContentItemMetadata *)v4 artworkURL];
    v337 = [(MRContentItemMetadata *)self artworkURL];
    int v338 = [v336 isEqual:v337];

    if (!v338) {
      goto LABEL_420;
    }
  }
  v339 = [(MRContentItemMetadata *)v4 artworkFileURL];
  uint64_t v340 = [(MRContentItemMetadata *)self artworkFileURL];
  if (v339 == (void *)v340)
  {
  }
  else
  {
    v341 = (void *)v340;
    v342 = [(MRContentItemMetadata *)v4 artworkFileURL];
    v343 = [(MRContentItemMetadata *)self artworkFileURL];
    int v344 = [v342 isEqual:v343];

    if (!v344) {
      goto LABEL_420;
    }
  }
  v345 = [(MRContentItemMetadata *)v4 artworkURLTemplates];
  uint64_t v346 = [(MRContentItemMetadata *)self artworkURLTemplates];
  if (v345 == (void *)v346)
  {
  }
  else
  {
    v347 = (void *)v346;
    v348 = [(MRContentItemMetadata *)v4 artworkURLTemplates];
    v349 = [(MRContentItemMetadata *)self artworkURLTemplates];
    int v350 = [v348 isEqualToArray:v349];

    if (!v350) {
      goto LABEL_420;
    }
  }
  v351 = [(MRContentItemMetadata *)v4 albumYear];
  uint64_t v352 = [(MRContentItemMetadata *)self albumYear];
  if (v351 == (void *)v352)
  {
  }
  else
  {
    v353 = (void *)v352;
    v354 = [(MRContentItemMetadata *)v4 albumYear];
    v355 = [(MRContentItemMetadata *)self albumYear];
    int v356 = [v354 isEqualToString:v355];

    if (!v356) {
      goto LABEL_420;
    }
  }
  v357 = [(MRContentItemMetadata *)v4 participantName];
  uint64_t v358 = [(MRContentItemMetadata *)self participantName];
  if (v357 == (void *)v358)
  {
  }
  else
  {
    v359 = (void *)v358;
    v360 = [(MRContentItemMetadata *)v4 participantName];
    v361 = [(MRContentItemMetadata *)self participantName];
    int v362 = [v360 isEqualToString:v361];

    if (!v362) {
      goto LABEL_420;
    }
  }
  v363 = [(MRContentItemMetadata *)v4 participantIdentifier];
  uint64_t v364 = [(MRContentItemMetadata *)self participantIdentifier];
  if (v363 == (void *)v364)
  {
  }
  else
  {
    v365 = (void *)v364;
    v366 = [(MRContentItemMetadata *)v4 participantIdentifier];
    v367 = [(MRContentItemMetadata *)self participantIdentifier];
    int v368 = [v366 isEqualToString:v367];

    if (!v368) {
      goto LABEL_420;
    }
  }
  BOOL v369 = [(MRContentItemMetadata *)v4 hasIsResolvableParticipant];
  if (v369 != [(MRContentItemMetadata *)self hasIsResolvableParticipant]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasIsResolvableParticipant])
  {
    if ([(MRContentItemMetadata *)self hasIsResolvableParticipant])
    {
      BOOL v370 = [(MRContentItemMetadata *)v4 isResolvableParticipant];
      if (v370 != [(MRContentItemMetadata *)self isResolvableParticipant]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v371 = [(MRContentItemMetadata *)v4 hasExcludeFromSuggestions];
  if (v371 != [(MRContentItemMetadata *)self hasExcludeFromSuggestions]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasExcludeFromSuggestions])
  {
    if ([(MRContentItemMetadata *)self hasExcludeFromSuggestions])
    {
      BOOL v372 = [(MRContentItemMetadata *)v4 excludeFromSuggestions];
      if (v372 != [(MRContentItemMetadata *)self excludeFromSuggestions]) {
        goto LABEL_420;
      }
    }
  }
  v373 = [(MRContentItemMetadata *)v4 preferredFormat];
  uint64_t v374 = [(MRContentItemMetadata *)self preferredFormat];
  if (v373 == (void *)v374)
  {
  }
  else
  {
    v375 = (void *)v374;
    v376 = [(MRContentItemMetadata *)v4 preferredFormat];
    v377 = [(MRContentItemMetadata *)self preferredFormat];
    int v378 = [v376 isEqual:v377];

    if (!v378) {
      goto LABEL_420;
    }
  }
  v379 = [(MRContentItemMetadata *)v4 activeFormat];
  uint64_t v380 = [(MRContentItemMetadata *)self activeFormat];
  if (v379 == (void *)v380)
  {
  }
  else
  {
    v381 = (void *)v380;
    v382 = [(MRContentItemMetadata *)v4 activeFormat];
    v383 = [(MRContentItemMetadata *)self activeFormat];
    int v384 = [v382 isEqual:v383];

    if (!v384) {
      goto LABEL_420;
    }
  }
  v385 = [(MRContentItemMetadata *)v4 audioRoute];
  uint64_t v386 = [(MRContentItemMetadata *)self audioRoute];
  if (v385 == (void *)v386)
  {
  }
  else
  {
    v387 = (void *)v386;
    v388 = [(MRContentItemMetadata *)v4 audioRoute];
    v389 = [(MRContentItemMetadata *)self audioRoute];
    int v390 = [v388 isEqual:v389];

    if (!v390) {
      goto LABEL_420;
    }
  }
  v391 = [(MRContentItemMetadata *)v4 alternativeFormats];
  uint64_t v392 = [(MRContentItemMetadata *)self alternativeFormats];
  if (v391 == (void *)v392)
  {

    goto LABEL_407;
  }
  v393 = (void *)v392;
  v394 = [(MRContentItemMetadata *)v4 alternativeFormats];
  v395 = [(MRContentItemMetadata *)self alternativeFormats];
  int v396 = [v394 isEqual:v395];

  if (!v396)
  {
LABEL_420:
    BOOL v403 = 0;
    goto LABEL_421;
  }
LABEL_407:
  BOOL v397 = [(MRContentItemMetadata *)v4 hasReportingAdamID];
  if (v397 != [(MRContentItemMetadata *)self hasReportingAdamID]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasReportingAdamID])
  {
    if ([(MRContentItemMetadata *)self hasReportingAdamID])
    {
      uint64_t v398 = [(MRContentItemMetadata *)v4 reportingAdamID];
      if (v398 != [(MRContentItemMetadata *)self reportingAdamID]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v399 = [(MRContentItemMetadata *)v4 hasLyricsAdamID];
  if (v399 != [(MRContentItemMetadata *)self hasLyricsAdamID]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasLyricsAdamID])
  {
    if ([(MRContentItemMetadata *)self hasLyricsAdamID])
    {
      uint64_t v400 = [(MRContentItemMetadata *)v4 lyricsAdamID];
      if (v400 != [(MRContentItemMetadata *)self lyricsAdamID]) {
        goto LABEL_420;
      }
    }
  }
  BOOL v401 = [(MRContentItemMetadata *)v4 hasITunesStoreAlbumArtistIdentifier];
  if (v401 != [(MRContentItemMetadata *)self hasITunesStoreAlbumArtistIdentifier]) {
    goto LABEL_420;
  }
  if ([(MRContentItemMetadata *)v4 hasITunesStoreAlbumArtistIdentifier])
  {
    if ([(MRContentItemMetadata *)self hasITunesStoreAlbumArtistIdentifier])
    {
      uint64_t v402 = [(MRContentItemMetadata *)v4 iTunesStoreAlbumArtistIdentifier];
      if (v402 != [(MRContentItemMetadata *)self iTunesStoreAlbumArtistIdentifier]) {
        goto LABEL_420;
      }
    }
  }
LABEL_419:
  BOOL v403 = 1;
LABEL_421:

  return v403;
}

MRContentItemMetadataAudioFormat *__42__MRContentItemMetadata_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MRContentItemMetadataAudioFormat alloc] initWithProtobuf:v2];

  return v3;
}

- (MRContentItemMetadata)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [[_MRContentItemMetadataProtobuf alloc] initWithData:v4];

    self = [(MRContentItemMetadata *)self initWithProtobuf:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __46__MRContentItemMetadata_protobufWithEncoding___block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

- (NSData)data
{
  id v2 = [(MRContentItemMetadata *)self protobufWithEncoding:0];
  id v3 = [v2 data];

  return (NSData *)v3;
}

- (BOOL)hasLoadingPlaceholderTitle
{
  id v2 = [(MRContentItemMetadata *)self title];
  char v3 = [v2 isEqualToString:@"LOADING_AUDIO_LABEL"];

  return v3;
}

- (NSString)localizedTitle
{
  if ([(MRContentItemMetadata *)self hasLoadingPlaceholderTitle]) {
    MRLocalizedString(@"LOADING_AUDIO_LABEL");
  }
  else {
  char v3 = [(MRContentItemMetadata *)self title];
  }

  return (NSString *)v3;
}

- (void)setContainer:(BOOL)a3
{
  self->_container = a3;
  self->_hasContainer = 1;
}

- (void)setExplicitItem:(BOOL)a3
{
  self->_explicitItem = a3;
  self->_hasExplicitItem = 1;
}

- (void)setStreamingContent:(BOOL)a3
{
  self->_streamingContent = a3;
  self->_hasStreamingContent = 1;
}

- (void)setCurrentlyPlaying:(BOOL)a3
{
  self->_currentlyPlaying = a3;
  self->_hasCurrentlyPlaying = 1;
}

- (void)setSharable:(BOOL)a3
{
  self->_sharable = a3;
  self->_hasSharable = 1;
}

- (void)setLiked:(BOOL)a3
{
  self->_liked = a3;
  self->_hasLiked = 1;
}

- (void)setInWishList:(BOOL)a3
{
  self->_inWishList = a3;
  self->_hasInWishList = 1;
}

- (void)setAdvertisement:(BOOL)a3
{
  self->_advertisement = a3;
  self->_hasAdvertisement = 1;
}

- (void)setSteerable:(BOOL)a3
{
  self->_steerable = a3;
  self->_hasSteerable = 1;
}

- (void)setInfoAvailable:(BOOL)a3
{
  self->_infoAvailable = a3;
  self->_hasInfoAvailable = 1;
}

- (void)setTranscriptAlignmentsAvailable:(BOOL)a3
{
  self->_transcriptAlignmentsAvailable = a3;
  self->_hasTranscriptAlignmentsAvailable = 1;
}

- (void)setLanguageOptionsAvailable:(BOOL)a3
{
  self->_languageOptionsAvailable = a3;
  self->_hasLanguageOptionsAvailable = 1;
}

- (void)setLyricsAvailable:(BOOL)a3
{
  self->_lyricsAvailable = a3;
  self->_hasLyricsAvailable = 1;
}

- (void)setPlaybackProgress:(float)a3
{
  self->_playbackProgress = a3;
  self->_hasPlaybackProgress = 1;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
  self->_hasDownloadProgress = 1;
}

- (void)setPlaylistType:(int64_t)a3
{
  self->_playlistType = a3;
  self->_hasPlaylistType = 1;
}

- (void)setRadioStationType:(int64_t)a3
{
  self->_radioStationType = a3;
  self->_hasRadioStationType = 1;
}

- (void)setEpisodeType:(int64_t)a3
{
  self->_episodeType = a3;
  self->_hasEpisodeType = 1;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
  self->_hasPlayCount = 1;
}

- (void)setNumberOfSections:(int64_t)a3
{
  self->_numberOfSections = a3;
  self->_hasNumberOfSections = 1;
}

- (void)setChapterCount:(int64_t)a3
{
  self->_chapterCount = a3;
  self->_hasChapterCount = 1;
}

- (void)setTotalDiscCount:(int64_t)a3
{
  self->_totalDiscCount = a3;
  self->_hasTotalDiscCount = 1;
}

- (void)setTotalTrackCount:(int64_t)a3
{
  self->_totalTrackCount = a3;
  self->_hasTotalTrackCount = 1;
}

- (void)setDownloadState:(int64_t)a3
{
  self->_downloadState = a3;
  self->_hasDownloadState = 1;
}

- (void)setArtworkDataWidthDeprecated:(int64_t)a3
{
  self->_artworkDataWidthDeprecated = a3;
  self->_hasArtworkDataWidthDeprecated = 1;
}

- (void)setArtworkDataHeightDeprecated:(int64_t)a3
{
  self->_artworkDataHeightDeprecated = a3;
  self->_hasArtworkDataHeightDeprecated = 1;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
  self->_hasStartTime = 1;
}

- (void)setSeasonNumber:(int64_t)a3
{
  self->_seasonNumber = a3;
  self->_hasSeasonNumber = 1;
}

- (void)setEpisodeNumber:(int64_t)a3
{
  self->_episodeNumber = a3;
  self->_hasEpisodeNumber = 1;
}

- (void)setDiscNumber:(int64_t)a3
{
  self->_discNumber = a3;
  self->_hasDiscNumber = 1;
}

- (void)setRadioStationIdentifier:(int64_t)a3
{
  self->_radioStationIdentifier = a3;
  self->_hasRadioStationIdentifier = 1;
}

- (void)setITunesStoreIdentifier:(int64_t)a3
{
  self->_iTunesStoreIdentifier = a3;
  self->_hasITunesStoreIdentifier = 1;
}

- (void)setITunesStoreSubscriptionIdentifier:(int64_t)a3
{
  self->_iTunesStoreSubscriptionIdentifier = a3;
  self->_hasITunesStoreSubscriptionIdentifier = 1;
}

- (void)setITunesStoreAlbumIdentifier:(int64_t)a3
{
  self->_iTunesStoreAlbumIdentifier = a3;
  self->_hasITunesStoreAlbumIdentifier = 1;
}

- (void)setSongTraits:(unint64_t)a3
{
  self->_songTraits = a3;
  self->_hasSongTraits = 1;
}

- (void)setAlbumTraits:(unint64_t)a3
{
  self->_albumTraits = a3;
  self->_hasAlbumTraits = 1;
}

- (void)setPlaylistTraits:(unint64_t)a3
{
  self->_playlistTraits = a3;
  self->_hasPlaylistTraits = 1;
}

- (void)setActiveFormatJustification:(int64_t)a3
{
  self->_activeFormatJustification = a3;
  self->_hasActiveFormatJustification = 1;
}

- (void)setFormatTierPreference:(unint64_t)a3
{
  self->_formatTierPreference = a3;
  self->_hasFormatTierPreference = 1;
}

- (void)setReportingAdamID:(int64_t)a3
{
  self->_reportingAdamID = a3;
  self->_hasReportingAdamID = 1;
}

- (void)setLyricsAdamID:(int64_t)a3
{
  self->_lyricsAdamID = a3;
  self->_hasLyricsAdamID = 1;
}

- (void)setIsResolvableParticipant:(BOOL)a3
{
  self->_isResolvableParticipant = a3;
  self->_hasIsResolvableParticipant = 1;
}

- (void)setExcludeFromSuggestions:(BOOL)a3
{
  self->_excludeFromSuggestions = a3;
  self->_hasExcludeFromSuggestions = 1;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(MRContentItemMetadata *)self dictionaryRepresentation];
  BOOL v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

uint64_t __49__MRContentItemMetadata_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (void)setHasContainer:(BOOL)a3
{
  self->_hasContainer = a3;
}

- (void)setHasPlayable:(BOOL)a3
{
  self->_hasPlayable = a3;
}

- (void)setHasExplicitItem:(BOOL)a3
{
  self->_hasExplicitItem = a3;
}

- (void)setHasStreamingContent:(BOOL)a3
{
  self->_hasStreamingContent = a3;
}

- (void)setHasCurrentlyPlaying:(BOOL)a3
{
  self->_hasCurrentlyPlaying = a3;
}

- (void)setHasAlwaysLive:(BOOL)a3
{
  self->_hasAlwaysLive = a3;
}

- (void)setHasSharable:(BOOL)a3
{
  self->_hasSharable = a3;
}

- (void)setHasLiked:(BOOL)a3
{
  self->_hasLiked = a3;
}

- (void)setHasInWishList:(BOOL)a3
{
  self->_hasInWishList = a3;
}

- (void)setHasAdvertisement:(BOOL)a3
{
  self->_hasAdvertisement = a3;
}

- (void)setHasSteerable:(BOOL)a3
{
  self->_hasSteerable = a3;
}

- (void)setHasLoading:(BOOL)a3
{
  self->_hasLoading = a3;
}

- (void)setHasInTransition:(BOOL)a3
{
  self->_hasInTransition = a3;
}

- (void)setHasArtworkAvailable:(BOOL)a3
{
  self->_hasArtworkAvailable = a3;
}

- (void)setHasInfoAvailable:(BOOL)a3
{
  self->_hasInfoAvailable = a3;
}

- (void)setHasTranscriptAlignmentsAvailable:(BOOL)a3
{
  self->_hasTranscriptAlignmentsAvailable = a3;
}

- (void)setHasLanguageOptionsAvailable:(BOOL)a3
{
  self->_hasLanguageOptionsAvailable = a3;
}

- (void)setHasLyricsAvailable:(BOOL)a3
{
  self->_hasLyricsAvailable = a3;
}

- (void)setHasPlaybackProgress:(BOOL)a3
{
  self->_hasPlaybackProgress = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  self->_hasPlaybackRate = a3;
}

- (void)setHasDefaultPlaybackRate:(BOOL)a3
{
  self->_hasDefaultPlaybackRate = a3;
}

- (void)setHasDownloadProgress:(BOOL)a3
{
  self->_hasDownloadProgress = a3;
}

- (void)setHasPlaylistType:(BOOL)a3
{
  self->_hasPlaylistType = a3;
}

- (void)setHasRadioStationType:(BOOL)a3
{
  self->_hasRadioStationType = a3;
}

- (void)setHasEditingStyleFlags:(BOOL)a3
{
  self->_hasEditingStyleFlags = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  self->_hasMediaType = a3;
}

- (void)setHasMediaSubType:(BOOL)a3
{
  self->_hasMediaSubType = a3;
}

- (void)setHasEpisodeType:(BOOL)a3
{
  self->_hasEpisodeType = a3;
}

- (void)setHasPlayCount:(BOOL)a3
{
  self->_hasPlayCount = a3;
}

- (void)setHasNumberOfSections:(BOOL)a3
{
  self->_hasNumberOfSections = a3;
}

- (void)setHasChapterCount:(BOOL)a3
{
  self->_hasChapterCount = a3;
}

- (void)setHasTotalDiscCount:(BOOL)a3
{
  self->_hasTotalDiscCount = a3;
}

- (void)setHasTotalTrackCount:(BOOL)a3
{
  self->_hasTotalTrackCount = a3;
}

- (void)setHasDownloadState:(BOOL)a3
{
  self->_hasDownloadState = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  self->_hasStartTime = a3;
}

- (void)setHasSeasonNumber:(BOOL)a3
{
  self->_hasSeasonNumber = a3;
}

- (void)setHasEpisodeNumber:(BOOL)a3
{
  self->_hasEpisodeNumber = a3;
}

- (void)setHasDiscNumber:(BOOL)a3
{
  self->_hasDiscNumber = a3;
}

- (void)setHasTrackNumber:(BOOL)a3
{
  self->_hasTrackNumber = a3;
}

- (void)setHasRadioStationIdentifier:(BOOL)a3
{
  self->_hasRadioStationIdentifier = a3;
}

- (void)setHasITunesStoreIdentifier:(BOOL)a3
{
  self->_hasITunesStoreIdentifier = a3;
}

- (void)setHasITunesStoreSubscriptionIdentifier:(BOOL)a3
{
  self->_hasITunesStoreSubscriptionIdentifier = a3;
}

- (void)setHasITunesStoreArtistIdentifier:(BOOL)a3
{
  self->_hasITunesStoreArtistIdentifier = a3;
}

- (void)setHasITunesStoreAlbumIdentifier:(BOOL)a3
{
  self->_hasITunesStoreAlbumIdentifier = a3;
}

- (void)setHasLegacyUniqueIdentifier:(BOOL)a3
{
  self->_hasLegacyUniqueIdentifier = a3;
}

- (void)setHasReportingAdamID:(BOOL)a3
{
  self->_hasReportingAdamID = a3;
}

- (void)setHasLyricsAdamID:(BOOL)a3
{
  self->_hasLyricsAdamID = a3;
}

- (void)setHasITunesStoreAlbumArtistIdentifier:(BOOL)a3
{
  self->_hasITunesStoreAlbumArtistIdentifier = a3;
}

- (void)setHasSongTraits:(BOOL)a3
{
  self->_hasSongTraits = a3;
}

- (void)setHasAlbumTraits:(BOOL)a3
{
  self->_hasAlbumTraits = a3;
}

- (void)setHasPlaylistTraits:(BOOL)a3
{
  self->_hasPlaylistTraits = a3;
}

- (void)setHasActiveFormatJustification:(BOOL)a3
{
  self->_hasActiveFormatJustification = a3;
}

- (void)setHasFormatTierPreference:(BOOL)a3
{
  self->_hasFormatTierPreference = a3;
}

@end