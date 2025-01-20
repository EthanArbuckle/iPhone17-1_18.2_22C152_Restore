@interface _MRContentItemMetadataProtobuf
+ (Class)alternativeFormatsType;
- (BOOL)artworkAvailable;
- (BOOL)excludeFromSuggestions;
- (BOOL)hasActiveFormat;
- (BOOL)hasActiveFormatJustification;
- (BOOL)hasAlbumArtistName;
- (BOOL)hasAlbumName;
- (BOOL)hasAlbumTraits;
- (BOOL)hasAlbumYear;
- (BOOL)hasAlternativeFormats;
- (BOOL)hasAppMetricsData;
- (BOOL)hasArtworkAvailable;
- (BOOL)hasArtworkDataHeightDeprecated;
- (BOOL)hasArtworkDataWidthDeprecated;
- (BOOL)hasArtworkFileURL;
- (BOOL)hasArtworkIdentifier;
- (BOOL)hasArtworkMIMEType;
- (BOOL)hasArtworkURL;
- (BOOL)hasArtworkURLTemplatesData;
- (BOOL)hasAssetURLString;
- (BOOL)hasAudioRoute;
- (BOOL)hasBrandIdentifier;
- (BOOL)hasChapterCount;
- (BOOL)hasClassicalWork;
- (BOOL)hasCollectionIdentifier;
- (BOOL)hasCollectionInfoData;
- (BOOL)hasComposer;
- (BOOL)hasContentIdentifier;
- (BOOL)hasCurrentPlaybackDateData;
- (BOOL)hasDefaultPlaybackRate;
- (BOOL)hasDeviceSpecificUserInfoData;
- (BOOL)hasDirectorName;
- (BOOL)hasDiscNumber;
- (BOOL)hasDownloadProgress;
- (BOOL)hasDownloadState;
- (BOOL)hasDuration;
- (BOOL)hasDurationStringLocalizationKey;
- (BOOL)hasEditingStyleFlags;
- (BOOL)hasElapsedTime;
- (BOOL)hasElapsedTimeTimestamp;
- (BOOL)hasEpisodeNumber;
- (BOOL)hasEpisodeType;
- (BOOL)hasExcludeFromSuggestions;
- (BOOL)hasFormatTierPreference;
- (BOOL)hasGenre;
- (BOOL)hasHasAlternativeFormats;
- (BOOL)hasITunesStoreAlbumArtistIdentifier;
- (BOOL)hasITunesStoreAlbumIdentifier;
- (BOOL)hasITunesStoreArtistIdentifier;
- (BOOL)hasITunesStoreIdentifier;
- (BOOL)hasITunesStoreSubscriptionIdentifier;
- (BOOL)hasInferredTimestamp;
- (BOOL)hasInfoAvailable;
- (BOOL)hasInternationalStandardRecordingCode;
- (BOOL)hasIsAdvertisement;
- (BOOL)hasIsAlwaysLive;
- (BOOL)hasIsContainer;
- (BOOL)hasIsCurrentlyPlaying;
- (BOOL)hasIsExplicitItem;
- (BOOL)hasIsInTransition;
- (BOOL)hasIsInWishList;
- (BOOL)hasIsLiked;
- (BOOL)hasIsLoading;
- (BOOL)hasIsPlayable;
- (BOOL)hasIsResolvableParticipant;
- (BOOL)hasIsSharable;
- (BOOL)hasIsSteerable;
- (BOOL)hasIsStreamingContent;
- (BOOL)hasLanguageOptionsAvailable;
- (BOOL)hasLegacyUniqueIdentifier;
- (BOOL)hasLocalizedContentRating;
- (BOOL)hasLocalizedDurationString;
- (BOOL)hasLyricsAdamID;
- (BOOL)hasLyricsAvailable;
- (BOOL)hasLyricsURL;
- (BOOL)hasMediaSubType;
- (BOOL)hasMediaType;
- (BOOL)hasNowPlayingInfoData;
- (BOOL)hasNumberOfSections;
- (BOOL)hasParticipantIdentifier;
- (BOOL)hasParticipantName;
- (BOOL)hasPlayCount;
- (BOOL)hasPlaybackProgress;
- (BOOL)hasPlaybackRate;
- (BOOL)hasPlaylistTraits;
- (BOOL)hasPlaylistType;
- (BOOL)hasPreferredFormat;
- (BOOL)hasProfileIdentifier;
- (BOOL)hasPurchaseInfoData;
- (BOOL)hasRadioStationIdentifier;
- (BOOL)hasRadioStationName;
- (BOOL)hasRadioStationString;
- (BOOL)hasRadioStationType;
- (BOOL)hasReleaseDate;
- (BOOL)hasReportingAdamID;
- (BOOL)hasSeasonNumber;
- (BOOL)hasSeriesName;
- (BOOL)hasServiceIdentifier;
- (BOOL)hasSongTraits;
- (BOOL)hasStartTime;
- (BOOL)hasSubtitle;
- (BOOL)hasTitle;
- (BOOL)hasTotalDiscCount;
- (BOOL)hasTotalTrackCount;
- (BOOL)hasTrackArtistName;
- (BOOL)hasTrackNumber;
- (BOOL)hasTranscriptAlignmentsAvailable;
- (BOOL)hasUserInfoData;
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
- (BOOL)readFrom:(id)a3;
- (BOOL)transcriptAlignmentsAvailable;
- (NSData)appMetricsData;
- (NSData)artworkURLTemplatesData;
- (NSData)collectionInfoData;
- (NSData)currentPlaybackDateData;
- (NSData)deviceSpecificUserInfoData;
- (NSData)nowPlayingInfoData;
- (NSData)purchaseInfoData;
- (NSData)userInfoData;
- (NSMutableArray)alternativeFormats;
- (NSString)albumArtistName;
- (NSString)albumName;
- (NSString)albumYear;
- (NSString)artworkFileURL;
- (NSString)artworkIdentifier;
- (NSString)artworkMIMEType;
- (NSString)artworkURL;
- (NSString)assetURLString;
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
- (NSString)lyricsURL;
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
- (_MRAudioFormatProtobuf)activeFormat;
- (_MRAudioFormatProtobuf)preferredFormat;
- (_MRAudioRouteProtobuf)audioRoute;
- (double)duration;
- (double)elapsedTime;
- (double)elapsedTimeTimestamp;
- (double)inferredTimestamp;
- (double)releaseDate;
- (double)startTime;
- (float)defaultPlaybackRate;
- (float)downloadProgress;
- (float)playbackProgress;
- (float)playbackRate;
- (id)activeFormatJustificationAsString:(int)a3;
- (id)albumTraitsAsString:(int)a3;
- (id)alternativeFormatsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formatTierPreferenceAsString:(int)a3;
- (id)playlistTraitsAsString:(int)a3;
- (id)songTraitsAsString:(int)a3;
- (int)StringAsActiveFormatJustification:(id)a3;
- (int)StringAsAlbumTraits:(id)a3;
- (int)StringAsFormatTierPreference:(id)a3;
- (int)StringAsPlaylistTraits:(id)a3;
- (int)StringAsSongTraits:(id)a3;
- (int)activeFormatJustification;
- (int)albumTraits;
- (int)artworkDataHeightDeprecated;
- (int)artworkDataWidthDeprecated;
- (int)chapterCount;
- (int)discNumber;
- (int)downloadState;
- (int)editingStyleFlags;
- (int)episodeNumber;
- (int)episodeType;
- (int)formatTierPreference;
- (int)mediaSubType;
- (int)mediaType;
- (int)numberOfSections;
- (int)playCount;
- (int)playlistTraits;
- (int)playlistType;
- (int)radioStationType;
- (int)seasonNumber;
- (int)songTraits;
- (int)totalDiscCount;
- (int)totalTrackCount;
- (int)trackNumber;
- (int64_t)iTunesStoreAlbumArtistIdentifier;
- (int64_t)iTunesStoreAlbumIdentifier;
- (int64_t)iTunesStoreArtistIdentifier;
- (int64_t)iTunesStoreIdentifier;
- (int64_t)iTunesStoreSubscriptionIdentifier;
- (int64_t)legacyUniqueIdentifier;
- (int64_t)lyricsAdamID;
- (int64_t)radioStationIdentifier;
- (int64_t)reportingAdamID;
- (unint64_t)alternativeFormatsCount;
- (unint64_t)hash;
- (void)addAlternativeFormats:(id)a3;
- (void)clearAlternativeFormats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveFormat:(id)a3;
- (void)setActiveFormatJustification:(int)a3;
- (void)setAlbumArtistName:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setAlbumTraits:(int)a3;
- (void)setAlbumYear:(id)a3;
- (void)setAlternativeFormats:(id)a3;
- (void)setAppMetricsData:(id)a3;
- (void)setArtworkAvailable:(BOOL)a3;
- (void)setArtworkDataHeightDeprecated:(int)a3;
- (void)setArtworkDataWidthDeprecated:(int)a3;
- (void)setArtworkFileURL:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
- (void)setArtworkMIMEType:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setArtworkURLTemplatesData:(id)a3;
- (void)setAssetURLString:(id)a3;
- (void)setAudioRoute:(id)a3;
- (void)setBrandIdentifier:(id)a3;
- (void)setChapterCount:(int)a3;
- (void)setClassicalWork:(id)a3;
- (void)setCollectionIdentifier:(id)a3;
- (void)setCollectionInfoData:(id)a3;
- (void)setComposer:(id)a3;
- (void)setContentIdentifier:(id)a3;
- (void)setCurrentPlaybackDateData:(id)a3;
- (void)setDefaultPlaybackRate:(float)a3;
- (void)setDeviceSpecificUserInfoData:(id)a3;
- (void)setDirectorName:(id)a3;
- (void)setDiscNumber:(int)a3;
- (void)setDownloadProgress:(float)a3;
- (void)setDownloadState:(int)a3;
- (void)setDuration:(double)a3;
- (void)setDurationStringLocalizationKey:(id)a3;
- (void)setEditingStyleFlags:(int)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTimeTimestamp:(double)a3;
- (void)setEpisodeNumber:(int)a3;
- (void)setEpisodeType:(int)a3;
- (void)setExcludeFromSuggestions:(BOOL)a3;
- (void)setFormatTierPreference:(int)a3;
- (void)setGenre:(id)a3;
- (void)setHasActiveFormatJustification:(BOOL)a3;
- (void)setHasAlbumTraits:(BOOL)a3;
- (void)setHasAlternativeFormats:(BOOL)a3;
- (void)setHasArtworkAvailable:(BOOL)a3;
- (void)setHasArtworkDataHeightDeprecated:(BOOL)a3;
- (void)setHasArtworkDataWidthDeprecated:(BOOL)a3;
- (void)setHasChapterCount:(BOOL)a3;
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
- (void)setHasExcludeFromSuggestions:(BOOL)a3;
- (void)setHasFormatTierPreference:(BOOL)a3;
- (void)setHasHasAlternativeFormats:(BOOL)a3;
- (void)setHasITunesStoreAlbumArtistIdentifier:(BOOL)a3;
- (void)setHasITunesStoreAlbumIdentifier:(BOOL)a3;
- (void)setHasITunesStoreArtistIdentifier:(BOOL)a3;
- (void)setHasITunesStoreIdentifier:(BOOL)a3;
- (void)setHasITunesStoreSubscriptionIdentifier:(BOOL)a3;
- (void)setHasInferredTimestamp:(BOOL)a3;
- (void)setHasInfoAvailable:(BOOL)a3;
- (void)setHasIsAdvertisement:(BOOL)a3;
- (void)setHasIsAlwaysLive:(BOOL)a3;
- (void)setHasIsContainer:(BOOL)a3;
- (void)setHasIsCurrentlyPlaying:(BOOL)a3;
- (void)setHasIsExplicitItem:(BOOL)a3;
- (void)setHasIsInTransition:(BOOL)a3;
- (void)setHasIsInWishList:(BOOL)a3;
- (void)setHasIsLiked:(BOOL)a3;
- (void)setHasIsLoading:(BOOL)a3;
- (void)setHasIsPlayable:(BOOL)a3;
- (void)setHasIsResolvableParticipant:(BOOL)a3;
- (void)setHasIsSharable:(BOOL)a3;
- (void)setHasIsSteerable:(BOOL)a3;
- (void)setHasIsStreamingContent:(BOOL)a3;
- (void)setHasLanguageOptionsAvailable:(BOOL)a3;
- (void)setHasLegacyUniqueIdentifier:(BOOL)a3;
- (void)setHasLyricsAdamID:(BOOL)a3;
- (void)setHasLyricsAvailable:(BOOL)a3;
- (void)setHasMediaSubType:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasNumberOfSections:(BOOL)a3;
- (void)setHasPlayCount:(BOOL)a3;
- (void)setHasPlaybackProgress:(BOOL)a3;
- (void)setHasPlaybackRate:(BOOL)a3;
- (void)setHasPlaylistTraits:(BOOL)a3;
- (void)setHasPlaylistType:(BOOL)a3;
- (void)setHasRadioStationIdentifier:(BOOL)a3;
- (void)setHasRadioStationType:(BOOL)a3;
- (void)setHasReleaseDate:(BOOL)a3;
- (void)setHasReportingAdamID:(BOOL)a3;
- (void)setHasSeasonNumber:(BOOL)a3;
- (void)setHasSongTraits:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTotalDiscCount:(BOOL)a3;
- (void)setHasTotalTrackCount:(BOOL)a3;
- (void)setHasTrackNumber:(BOOL)a3;
- (void)setHasTranscriptAlignmentsAvailable:(BOOL)a3;
- (void)setITunesStoreAlbumArtistIdentifier:(int64_t)a3;
- (void)setITunesStoreAlbumIdentifier:(int64_t)a3;
- (void)setITunesStoreArtistIdentifier:(int64_t)a3;
- (void)setITunesStoreIdentifier:(int64_t)a3;
- (void)setITunesStoreSubscriptionIdentifier:(int64_t)a3;
- (void)setInferredTimestamp:(double)a3;
- (void)setInfoAvailable:(BOOL)a3;
- (void)setInternationalStandardRecordingCode:(id)a3;
- (void)setIsAdvertisement:(BOOL)a3;
- (void)setIsAlwaysLive:(BOOL)a3;
- (void)setIsContainer:(BOOL)a3;
- (void)setIsCurrentlyPlaying:(BOOL)a3;
- (void)setIsExplicitItem:(BOOL)a3;
- (void)setIsInTransition:(BOOL)a3;
- (void)setIsInWishList:(BOOL)a3;
- (void)setIsLiked:(BOOL)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setIsPlayable:(BOOL)a3;
- (void)setIsResolvableParticipant:(BOOL)a3;
- (void)setIsSharable:(BOOL)a3;
- (void)setIsSteerable:(BOOL)a3;
- (void)setIsStreamingContent:(BOOL)a3;
- (void)setLanguageOptionsAvailable:(BOOL)a3;
- (void)setLegacyUniqueIdentifier:(int64_t)a3;
- (void)setLocalizedContentRating:(id)a3;
- (void)setLocalizedDurationString:(id)a3;
- (void)setLyricsAdamID:(int64_t)a3;
- (void)setLyricsAvailable:(BOOL)a3;
- (void)setLyricsURL:(id)a3;
- (void)setMediaSubType:(int)a3;
- (void)setMediaType:(int)a3;
- (void)setNowPlayingInfoData:(id)a3;
- (void)setNumberOfSections:(int)a3;
- (void)setParticipantIdentifier:(id)a3;
- (void)setParticipantName:(id)a3;
- (void)setPlayCount:(int)a3;
- (void)setPlaybackProgress:(float)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPlaylistTraits:(int)a3;
- (void)setPlaylistType:(int)a3;
- (void)setPreferredFormat:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setPurchaseInfoData:(id)a3;
- (void)setRadioStationIdentifier:(int64_t)a3;
- (void)setRadioStationName:(id)a3;
- (void)setRadioStationString:(id)a3;
- (void)setRadioStationType:(int)a3;
- (void)setReleaseDate:(double)a3;
- (void)setReportingAdamID:(int64_t)a3;
- (void)setSeasonNumber:(int)a3;
- (void)setSeriesName:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setSongTraits:(int)a3;
- (void)setStartTime:(double)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTotalDiscCount:(int)a3;
- (void)setTotalTrackCount:(int)a3;
- (void)setTrackArtistName:(id)a3;
- (void)setTrackNumber:(int)a3;
- (void)setTranscriptAlignmentsAvailable:(BOOL)a3;
- (void)setUserInfoData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRContentItemMetadataProtobuf

- (void)setUserInfoData:(id)a3
{
}

- (void)setTranscriptAlignmentsAvailable:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_transcriptAlignmentsAvailable = a3;
}

- (void)setTrackNumber:(int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_trackNumber = a3;
}

- (void)setTrackArtistName:(id)a3
{
}

- (void)setTotalTrackCount:(int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_totalTrackCount = a3;
}

- (void)setTotalDiscCount:(int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_totalDiscCount = a3;
}

- (void)setTitle:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (void)setStartTime:(double)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_startTime = a3;
}

- (void)setSongTraits:(int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_songTraits = a3;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void)setSeriesName:(id)a3
{
}

- (void)setSeasonNumber:(int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_seasonNumber = a3;
}

- (void)setReportingAdamID:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_reportingAdamID = a3;
}

- (void)setReleaseDate:(double)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_releaseDate = a3;
}

- (void)setRadioStationType:(int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_radioStationType = a3;
}

- (void)setRadioStationString:(id)a3
{
}

- (void)setRadioStationName:(id)a3
{
}

- (void)setRadioStationIdentifier:(int64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_radioStationIdentifier = a3;
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

- (void)setPlaylistType:(int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_playlistType = a3;
}

- (void)setPlaylistTraits:(int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_playlistTraits = a3;
}

- (void)setPlaybackRate:(float)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_playbackRate = a3;
}

- (void)setPlaybackProgress:(float)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_playbackProgress = a3;
}

- (void)setPlayCount:(int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_playCount = a3;
}

- (void)setParticipantName:(id)a3
{
}

- (void)setParticipantIdentifier:(id)a3
{
}

- (void)setNumberOfSections:(int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_numberOfSections = a3;
}

- (void)setNowPlayingInfoData:(id)a3
{
}

- (void)setMediaType:(int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_mediaType = a3;
}

- (void)setMediaSubType:(int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_mediaSubType = a3;
}

- (void)setLyricsURL:(id)a3
{
}

- (void)setLyricsAvailable:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_lyricsAvailable = a3;
}

- (void)setLyricsAdamID:(int64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_lyricsAdamID = a3;
}

- (void)setLocalizedDurationString:(id)a3
{
}

- (void)setLocalizedContentRating:(id)a3
{
}

- (void)setLegacyUniqueIdentifier:(int64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_legacyUniqueIdentifier = a3;
}

- (void)setLanguageOptionsAvailable:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_languageOptionsAvailable = a3;
}

- (void)setIsStreamingContent:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_isStreamingContent = a3;
}

- (void)setIsSteerable:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_isSteerable = a3;
}

- (void)setIsSharable:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_isSharable = a3;
}

- (void)setIsResolvableParticipant:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_isResolvableParticipant = a3;
}

- (void)setIsPlayable:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_isPlayable = a3;
}

- (void)setIsLoading:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_isLoading = a3;
}

- (void)setIsLiked:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_isLiked = a3;
}

- (void)setIsInWishList:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_isInWishList = a3;
}

- (void)setIsInTransition:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_isInTransition = a3;
}

- (void)setIsExplicitItem:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_isExplicitItem = a3;
}

- (void)setIsCurrentlyPlaying:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_isCurrentlyPlaying = a3;
}

- (void)setIsContainer:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_isContainer = a3;
}

- (void)setIsAlwaysLive:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_isAlwaysLive = a3;
}

- (void)setIsAdvertisement:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_isAdvertisement = a3;
}

- (void)setInternationalStandardRecordingCode:(id)a3
{
}

- (void)setInfoAvailable:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_infoAvailable = a3;
}

- (void)setInferredTimestamp:(double)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_inferredTimestamp = a3;
}

- (void)setITunesStoreSubscriptionIdentifier:(int64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_iTunesStoreSubscriptionIdentifier = a3;
}

- (void)setITunesStoreIdentifier:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_iTunesStoreIdentifier = a3;
}

- (void)setITunesStoreArtistIdentifier:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_iTunesStoreArtistIdentifier = a3;
}

- (void)setITunesStoreAlbumIdentifier:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_iTunesStoreAlbumIdentifier = a3;
}

- (void)setITunesStoreAlbumArtistIdentifier:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_iTunesStoreAlbumArtistIdentifier = a3;
}

- (void)setHasTranscriptAlignmentsAvailable:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasTrackNumber:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (void)setHasTotalTrackCount:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (void)setHasTotalDiscCount:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (void)setHasStartTime:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (void)setHasSongTraits:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (void)setHasSeasonNumber:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (void)setHasReportingAdamID:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (void)setHasReleaseDate:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (void)setHasRadioStationType:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (void)setHasRadioStationIdentifier:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (void)setHasPlaylistType:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (void)setHasPlaylistTraits:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (void)setHasPlaybackProgress:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (void)setHasPlayCount:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)setHasNumberOfSections:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (void)setHasMediaType:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (void)setHasMediaSubType:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (void)setHasLyricsAvailable:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasLyricsAdamID:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (void)setHasLegacyUniqueIdentifier:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (void)setHasLanguageOptionsAvailable:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsStreamingContent:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsSteerable:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsSharable:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsResolvableParticipant:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsPlayable:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsLoading:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsLiked:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsInWishList:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsInTransition:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (void)setHasIsExplicitItem:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsCurrentlyPlaying:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsContainer:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsAlwaysLive:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (void)setHasIsAdvertisement:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (void)setHasInfoAvailable:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (void)setHasInferredTimestamp:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (void)setHasITunesStoreSubscriptionIdentifier:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (void)setHasITunesStoreIdentifier:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setHasITunesStoreArtistIdentifier:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (void)setHasITunesStoreAlbumIdentifier:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (void)setHasITunesStoreAlbumArtistIdentifier:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (void)setHasFormatTierPreference:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (void)setHasExcludeFromSuggestions:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (void)setHasEpisodeType:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (void)setHasEpisodeNumber:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (void)setHasElapsedTimeTimestamp:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (void)setHasElapsedTime:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (void)setHasEditingStyleFlags:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (void)setHasDuration:(BOOL)a3
{
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setHasDownloadState:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (void)setHasDownloadProgress:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (void)setHasDiscNumber:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (void)setHasDefaultPlaybackRate:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (void)setHasChapterCount:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (void)setHasArtworkDataWidthDeprecated:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (void)setHasArtworkDataHeightDeprecated:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (void)setHasArtworkAvailable:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (void)setHasAlbumTraits:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (void)setHasActiveFormatJustification:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (void)setGenre:(id)a3
{
}

- (void)setFormatTierPreference:(int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_formatTierPreference = a3;
}

- (void)setExcludeFromSuggestions:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_excludeFromSuggestions = a3;
}

- (void)setEpisodeType:(int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_episodeType = a3;
}

- (void)setEpisodeNumber:(int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_episodeNumber = a3;
}

- (void)setElapsedTimeTimestamp:(double)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_elapsedTimeTimestamp = a3;
}

- (void)setElapsedTime:(double)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_elapsedTime = a3;
}

- (void)setEditingStyleFlags:(int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_editingStyleFlags = a3;
}

- (void)setDurationStringLocalizationKey:(id)a3
{
}

- (void)setDuration:(double)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_duration = a3;
}

- (void)setDownloadState:(int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_downloadState = a3;
}

- (void)setDownloadProgress:(float)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_downloadProgress = a3;
}

- (void)setDiscNumber:(int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_discNumber = a3;
}

- (void)setDirectorName:(id)a3
{
}

- (void)setDeviceSpecificUserInfoData:(id)a3
{
}

- (void)setDefaultPlaybackRate:(float)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_defaultPlaybackRate = a3;
}

- (void)setCurrentPlaybackDateData:(id)a3
{
}

- (void)setContentIdentifier:(id)a3
{
}

- (void)setComposer:(id)a3
{
}

- (void)setCollectionInfoData:(id)a3
{
}

- (void)setCollectionIdentifier:(id)a3
{
}

- (void)setClassicalWork:(id)a3
{
}

- (void)setChapterCount:(int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_chapterCount = a3;
}

- (void)setBrandIdentifier:(id)a3
{
}

- (void)setAudioRoute:(id)a3
{
}

- (void)setAssetURLString:(id)a3
{
}

- (void)setArtworkURL:(id)a3
{
}

- (void)setArtworkMIMEType:(id)a3
{
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (void)setArtworkFileURL:(id)a3
{
}

- (void)setArtworkDataWidthDeprecated:(int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_artworkDataWidthDeprecated = a3;
}

- (void)setArtworkDataHeightDeprecated:(int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_artworkDataHeightDeprecated = a3;
}

- (void)setArtworkAvailable:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_artworkAvailable = a3;
}

- (void)setAppMetricsData:(id)a3
{
}

- (void)setAlbumYear:(id)a3
{
}

- (void)setAlbumTraits:(int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_albumTraits = a3;
}

- (void)setAlbumName:(id)a3
{
}

- (void)setAlbumArtistName:(id)a3
{
}

- (void)setActiveFormatJustification:(int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_activeFormatJustification = a3;
}

- (void)setActiveFormat:(id)a3
{
}

- (NSData)userInfoData
{
  return self->_userInfoData;
}

- (BOOL)transcriptAlignmentsAvailable
{
  return self->_transcriptAlignmentsAvailable;
}

- (int)trackNumber
{
  return self->_trackNumber;
}

- (NSString)trackArtistName
{
  return self->_trackArtistName;
}

- (int)totalTrackCount
{
  return self->_totalTrackCount;
}

- (int)totalDiscCount
{
  return self->_totalDiscCount;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)startTime
{
  return self->_startTime;
}

- (int)songTraits
{
  if ((*((unsigned char *)&self->_has + 4) & 0x40) != 0) {
    return self->_songTraits;
  }
  else {
    return 0;
  }
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)seriesName
{
  return self->_seriesName;
}

- (int)seasonNumber
{
  return self->_seasonNumber;
}

- (int64_t)reportingAdamID
{
  return self->_reportingAdamID;
}

- (int)radioStationType
{
  return self->_radioStationType;
}

- (NSString)radioStationString
{
  return self->_radioStationString;
}

- (NSString)radioStationName
{
  return self->_radioStationName;
}

- (int64_t)radioStationIdentifier
{
  return self->_radioStationIdentifier;
}

- (NSData)purchaseInfoData
{
  return self->_purchaseInfoData;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (int)playlistType
{
  return self->_playlistType;
}

- (int)playlistTraits
{
  if ((*((unsigned char *)&self->_has + 4) & 4) != 0) {
    return self->_playlistTraits;
  }
  else {
    return 0;
  }
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (float)playbackProgress
{
  return self->_playbackProgress;
}

- (int)playCount
{
  return self->_playCount;
}

- (int)numberOfSections
{
  return self->_numberOfSections;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)mediaSubType
{
  return self->_mediaSubType;
}

- (BOOL)lyricsAvailable
{
  return self->_lyricsAvailable;
}

- (int64_t)lyricsAdamID
{
  return self->_lyricsAdamID;
}

- (NSString)localizedDurationString
{
  return self->_localizedDurationString;
}

- (NSString)localizedContentRating
{
  return self->_localizedContentRating;
}

- (int64_t)legacyUniqueIdentifier
{
  return self->_legacyUniqueIdentifier;
}

- (BOOL)languageOptionsAvailable
{
  return self->_languageOptionsAvailable;
}

- (BOOL)isStreamingContent
{
  return self->_isStreamingContent;
}

- (BOOL)isSteerable
{
  return self->_isSteerable;
}

- (BOOL)isSharable
{
  return self->_isSharable;
}

- (BOOL)isResolvableParticipant
{
  return self->_isResolvableParticipant;
}

- (BOOL)isPlayable
{
  return self->_isPlayable;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (BOOL)isLiked
{
  return self->_isLiked;
}

- (BOOL)isInWishList
{
  return self->_isInWishList;
}

- (BOOL)isInTransition
{
  return self->_isInTransition;
}

- (BOOL)isExplicitItem
{
  return self->_isExplicitItem;
}

- (BOOL)isCurrentlyPlaying
{
  return self->_isCurrentlyPlaying;
}

- (BOOL)isContainer
{
  return self->_isContainer;
}

- (BOOL)isAlwaysLive
{
  return self->_isAlwaysLive;
}

- (BOOL)isAdvertisement
{
  return self->_isAdvertisement;
}

- (NSString)internationalStandardRecordingCode
{
  return self->_internationalStandardRecordingCode;
}

- (BOOL)infoAvailable
{
  return self->_infoAvailable;
}

- (double)inferredTimestamp
{
  return self->_inferredTimestamp;
}

- (int64_t)iTunesStoreSubscriptionIdentifier
{
  return self->_iTunesStoreSubscriptionIdentifier;
}

- (int64_t)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (int64_t)iTunesStoreArtistIdentifier
{
  return self->_iTunesStoreArtistIdentifier;
}

- (int64_t)iTunesStoreAlbumIdentifier
{
  return self->_iTunesStoreAlbumIdentifier;
}

- (int64_t)iTunesStoreAlbumArtistIdentifier
{
  return self->_iTunesStoreAlbumArtistIdentifier;
}

- (BOOL)hasUserInfoData
{
  return self->_userInfoData != 0;
}

- (BOOL)hasTranscriptAlignmentsAvailable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 6) & 1;
}

- (BOOL)hasTrackNumber
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (BOOL)hasTotalTrackCount
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (BOOL)hasTotalDiscCount
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (BOOL)hasStartTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasSongTraits
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (BOOL)hasSeasonNumber
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (BOOL)hasReportingAdamID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasReleaseDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasRadioStationType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (BOOL)hasRadioStationIdentifier
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasPreferredFormat
{
  return self->_preferredFormat != 0;
}

- (BOOL)hasPlaylistType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (BOOL)hasPlaylistTraits
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (BOOL)hasPlaybackRate
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (BOOL)hasPlaybackProgress
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (BOOL)hasPlayCount
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (BOOL)hasParticipantName
{
  return self->_participantName != 0;
}

- (BOOL)hasParticipantIdentifier
{
  return self->_participantIdentifier != 0;
}

- (BOOL)hasNumberOfSections
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (BOOL)hasNowPlayingInfoData
{
  return self->_nowPlayingInfoData != 0;
}

- (BOOL)hasMediaType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (BOOL)hasMediaSubType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasLyricsURL
{
  return self->_lyricsURL != 0;
}

- (BOOL)hasLyricsAvailable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (BOOL)hasLyricsAdamID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasLegacyUniqueIdentifier
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasLanguageOptionsAvailable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (BOOL)hasIsStreamingContent
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (BOOL)hasIsSteerable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (BOOL)hasIsSharable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (BOOL)hasIsResolvableParticipant
{
  return *((unsigned char *)&self->_has + 7) & 1;
}

- (BOOL)hasIsPlayable
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (BOOL)hasIsLoading
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (BOOL)hasIsLiked
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (BOOL)hasIsInWishList
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (BOOL)hasIsInTransition
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (BOOL)hasIsExplicitItem
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (BOOL)hasIsCurrentlyPlaying
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (BOOL)hasIsContainer
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (BOOL)hasIsAlwaysLive
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (BOOL)hasIsAdvertisement
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (BOOL)hasInfoAvailable
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (BOOL)hasInferredTimestamp
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasITunesStoreSubscriptionIdentifier
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasITunesStoreIdentifier
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasITunesStoreArtistIdentifier
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasITunesStoreAlbumIdentifier
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasITunesStoreAlbumArtistIdentifier
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasFormatTierPreference
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (BOOL)hasExcludeFromSuggestions
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (BOOL)hasEpisodeType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (BOOL)hasEpisodeNumber
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (BOOL)hasElapsedTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasElapsedTimeTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasEditingStyleFlags
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (BOOL)hasDuration
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasDownloadState
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasDownloadProgress
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasDiscNumber
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasDeviceSpecificUserInfoData
{
  return self->_deviceSpecificUserInfoData != 0;
}

- (BOOL)hasDefaultPlaybackRate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasCurrentPlaybackDateData
{
  return self->_currentPlaybackDateData != 0;
}

- (BOOL)hasCollectionInfoData
{
  return self->_collectionInfoData != 0;
}

- (BOOL)hasChapterCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasAudioRoute
{
  return self->_audioRoute != 0;
}

- (BOOL)hasAssetURLString
{
  return self->_assetURLString != 0;
}

- (BOOL)hasArtworkURL
{
  return self->_artworkURL != 0;
}

- (BOOL)hasArtworkURLTemplatesData
{
  return self->_artworkURLTemplatesData != 0;
}

- (BOOL)hasArtworkFileURL
{
  return self->_artworkFileURL != 0;
}

- (BOOL)hasArtworkDataWidthDeprecated
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasArtworkDataHeightDeprecated
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasArtworkAvailable
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (BOOL)hasAppMetricsData
{
  return self->_appMetricsData != 0;
}

- (BOOL)hasAlternativeFormats
{
  return self->_hasAlternativeFormats;
}

- (BOOL)hasAlbumTraits
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasActiveFormat
{
  return self->_activeFormat != 0;
}

- (BOOL)hasActiveFormatJustification
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (NSString)genre
{
  return self->_genre;
}

- (int)formatTierPreference
{
  if ((*((unsigned char *)&self->_has + 3) & 8) != 0) {
    return self->_formatTierPreference;
  }
  else {
    return 1;
  }
}

- (BOOL)excludeFromSuggestions
{
  return self->_excludeFromSuggestions;
}

- (int)episodeType
{
  return self->_episodeType;
}

- (int)episodeNumber
{
  return self->_episodeNumber;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (double)elapsedTimeTimestamp
{
  return self->_elapsedTimeTimestamp;
}

- (int)editingStyleFlags
{
  return self->_editingStyleFlags;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)durationStringLocalizationKey
{
  return self->_durationStringLocalizationKey;
}

- (int)downloadState
{
  return self->_downloadState;
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (int)discNumber
{
  return self->_discNumber;
}

- (NSString)directorName
{
  return self->_directorName;
}

- (NSData)deviceSpecificUserInfoData
{
  return self->_deviceSpecificUserInfoData;
}

- (float)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSString)composer
{
  return self->_composer;
}

- (NSData)collectionInfoData
{
  return self->_collectionInfoData;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (NSString)classicalWork
{
  return self->_classicalWork;
}

- (int)chapterCount
{
  return self->_chapterCount;
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (NSString)artworkMIMEType
{
  return self->_artworkMIMEType;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (int)artworkDataWidthDeprecated
{
  return self->_artworkDataWidthDeprecated;
}

- (int)artworkDataHeightDeprecated
{
  return self->_artworkDataHeightDeprecated;
}

- (BOOL)artworkAvailable
{
  return self->_artworkAvailable;
}

- (NSString)albumYear
{
  return self->_albumYear;
}

- (int)albumTraits
{
  if (*((unsigned char *)&self->_has + 2)) {
    return self->_albumTraits;
  }
  else {
    return 0;
  }
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSString)albumArtistName
{
  return self->_albumArtistName;
}

- (int)activeFormatJustification
{
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_activeFormatJustification;
  }
  else {
    return 0;
  }
}

- (NSData)nowPlayingInfoData
{
  return self->_nowPlayingInfoData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoData, 0);
  objc_storeStrong((id *)&self->_trackArtistName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_seriesName, 0);
  objc_storeStrong((id *)&self->_radioStationString, 0);
  objc_storeStrong((id *)&self->_radioStationName, 0);
  objc_storeStrong((id *)&self->_purchaseInfoData, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoData, 0);
  objc_storeStrong((id *)&self->_lyricsURL, 0);
  objc_storeStrong((id *)&self->_localizedDurationString, 0);
  objc_storeStrong((id *)&self->_localizedContentRating, 0);
  objc_storeStrong((id *)&self->_internationalStandardRecordingCode, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_durationStringLocalizationKey, 0);
  objc_storeStrong((id *)&self->_directorName, 0);
  objc_storeStrong((id *)&self->_deviceSpecificUserInfoData, 0);
  objc_storeStrong((id *)&self->_currentPlaybackDateData, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_collectionInfoData, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_classicalWork, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_assetURLString, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplatesData, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_artworkMIMEType, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkFileURL, 0);
  objc_storeStrong((id *)&self->_appMetricsData, 0);
  objc_storeStrong((id *)&self->_alternativeFormats, 0);
  objc_storeStrong((id *)&self->_albumYear, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumArtistName, 0);

  objc_storeStrong((id *)&self->_activeFormat, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 has = self->_has;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $39A7635802529FA34AF0E2292B825163 has = self->_has;
    if ((*(void *)&has & 0x80000000000000) == 0)
    {
LABEL_7:
      if ((*(void *)&has & 0x100000000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(void *)&has & 0x80000000000000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x100000000) != 0) {
LABEL_8:
  }
    PBDataWriterWriteFloatField();
LABEL_9:
  if (self->_albumName) {
    PBDataWriterWriteStringField();
  }
  if (self->_trackArtistName) {
    PBDataWriterWriteStringField();
  }
  if (self->_albumArtistName) {
    PBDataWriterWriteStringField();
  }
  if (self->_directorName) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v6 = self->_has;
  if ((*(void *)&v6 & 0x2000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $39A7635802529FA34AF0E2292B825163 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v6 & 0x1000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_187;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  $39A7635802529FA34AF0E2292B825163 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteDoubleField();
  $39A7635802529FA34AF0E2292B825163 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_188:
  PBDataWriterWriteInt32Field();
  if (*(void *)&self->_has) {
LABEL_22:
  }
    PBDataWriterWriteDoubleField();
LABEL_23:
  if (self->_localizedContentRating) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x4000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
    if ((*(void *)&v7 & 0x800000000) == 0)
    {
LABEL_27:
      if ((*(void *)&v7 & 0x1000000000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_192;
    }
  }
  else if ((*(void *)&v7 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field();
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&v7 & 0x40000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_193;
  }
LABEL_192:
  PBDataWriterWriteInt32Field();
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&v7 & 0x200000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_194;
  }
LABEL_193:
  PBDataWriterWriteBOOLField();
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&v7 & 0x1000000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_195;
  }
LABEL_194:
  PBDataWriterWriteBOOLField();
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_196;
  }
LABEL_195:
  PBDataWriterWriteBOOLField();
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(void *)&v7 & 0x2000000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_197;
  }
LABEL_196:
  PBDataWriterWriteInt32Field();
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x2000000000000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_198;
  }
LABEL_197:
  PBDataWriterWriteBOOLField();
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_34:
    if ((*(void *)&v7 & 0x800000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_199;
  }
LABEL_198:
  PBDataWriterWriteInt32Field();
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x800000000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v7 & 0x2000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_199:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x2000000000000) != 0) {
LABEL_36:
  }
    PBDataWriterWriteBOOLField();
LABEL_37:
  if (self->_collectionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_profileIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_artworkMIMEType) {
    PBDataWriterWriteStringField();
  }
  if (self->_assetURLString) {
    PBDataWriterWriteStringField();
  }
  if (self->_composer) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $39A7635802529FA34AF0E2292B825163 v8 = self->_has;
  }
  if ((*(unsigned char *)&v8 & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_genre) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
  if ((*(void *)&v9 & 0x800000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
    if ((*(void *)&v9 & 0x200000000) == 0)
    {
LABEL_57:
      if ((*(_DWORD *)&v9 & 0x80000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_203;
    }
  }
  else if ((*(void *)&v9 & 0x200000000) == 0)
  {
    goto LABEL_57;
  }
  PBDataWriterWriteFloatField();
  $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_58:
    if ((*(void *)&v9 & 0x8000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_204;
  }
LABEL_203:
  PBDataWriterWriteInt32Field();
  $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
  if ((*(void *)&v9 & 0x8000000000) == 0)
  {
LABEL_59:
    if ((*(void *)&v9 & 0x10000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_205;
  }
LABEL_204:
  PBDataWriterWriteInt32Field();
  $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
  if ((*(void *)&v9 & 0x10000000000) == 0)
  {
LABEL_60:
    if ((*(void *)&v9 & 0x20000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_205:
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x20000000000) != 0) {
LABEL_61:
  }
    PBDataWriterWriteInt32Field();
LABEL_62:
  if (self->_contentIdentifier) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v10 = self->_has;
  if ((*(void *)&v10 & 0x200000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $39A7635802529FA34AF0E2292B825163 v10 = self->_has;
    if ((*(void *)&v10 & 0x20000000000000) == 0)
    {
LABEL_66:
      if ((*(void *)&v10 & 0x10000000000000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_209;
    }
  }
  else if ((*(void *)&v10 & 0x20000000000000) == 0)
  {
    goto LABEL_66;
  }
  PBDataWriterWriteBOOLField();
  $39A7635802529FA34AF0E2292B825163 v10 = self->_has;
  if ((*(void *)&v10 & 0x10000000000000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v10 & 0x800) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_209:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x800) != 0) {
LABEL_68:
  }
    PBDataWriterWriteInt64Field();
LABEL_69:
  if (self->_radioStationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_radioStationString) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    PBDataWriterWriteInt64Field();
    $39A7635802529FA34AF0E2292B825163 v11 = self->_has;
    if ((*(unsigned char *)&v11 & 0x80) == 0)
    {
LABEL_75:
      if ((*(unsigned char *)&v11 & 0x20) == 0) {
        goto LABEL_76;
      }
      goto LABEL_213;
    }
  }
  else if ((*(unsigned char *)&v11 & 0x80) == 0)
  {
    goto LABEL_75;
  }
  PBDataWriterWriteInt64Field();
  $39A7635802529FA34AF0E2292B825163 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x20) == 0)
  {
LABEL_76:
    if ((*(unsigned char *)&v11 & 0x10) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_213:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x10) != 0) {
LABEL_77:
  }
    PBDataWriterWriteInt64Field();
LABEL_78:
  if (self->_purchaseInfoData) {
    PBDataWriterWriteDataField();
  }
  $39A7635802529FA34AF0E2292B825163 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    PBDataWriterWriteFloatField();
    $39A7635802529FA34AF0E2292B825163 v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x800000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v12 & 0x400000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x800000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x400000) != 0) {
LABEL_83:
  }
    PBDataWriterWriteFloatField();
LABEL_84:
  if (self->_appMetricsData) {
    PBDataWriterWriteDataField();
  }
  if (self->_seriesName) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $39A7635802529FA34AF0E2292B825163 v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x10000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_nowPlayingInfoData) {
    PBDataWriterWriteDataField();
  }
  if (self->_userInfoData) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 7) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_artworkURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_lyricsURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceSpecificUserInfoData) {
    PBDataWriterWriteDataField();
  }
  if (self->_collectionInfoData) {
    PBDataWriterWriteDataField();
  }
  $39A7635802529FA34AF0E2292B825163 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    $39A7635802529FA34AF0E2292B825163 v14 = self->_has;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_serviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $39A7635802529FA34AF0E2292B825163 v15 = self->_has;
  }
  if ((*(_DWORD *)&v15 & 0x20000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_currentPlaybackDateData) {
    PBDataWriterWriteDataField();
  }
  if (self->_artworkIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 6) & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_artworkURLTemplatesData) {
    PBDataWriterWriteDataField();
  }
  $39A7635802529FA34AF0E2292B825163 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    PBDataWriterWriteInt64Field();
    $39A7635802529FA34AF0E2292B825163 v16 = self->_has;
  }
  if ((*(_DWORD *)&v16 & 0x4000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_artworkFileURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_brandIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedDurationString) {
    PBDataWriterWriteStringField();
  }
  if (self->_albumYear) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(void *)&v17 & 0x4000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x10000) == 0)
    {
LABEL_138:
      if ((*(void *)&v17 & 0x400000000) == 0) {
        goto LABEL_140;
      }
      goto LABEL_139;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x10000) == 0)
  {
    goto LABEL_138;
  }
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x400000000) != 0) {
LABEL_139:
  }
    PBDataWriterWriteInt32Field();
LABEL_140:
  if (self->_preferredFormat) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activeFormat) {
    PBDataWriterWriteSubmessage();
  }
  $39A7635802529FA34AF0E2292B825163 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $39A7635802529FA34AF0E2292B825163 v18 = self->_has;
  }
  if ((*(_DWORD *)&v18 & 0x8000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_audioRoute) {
    PBDataWriterWriteSubmessage();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v19 = self->_alternativeFormats;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v21);
  }

  $39A7635802529FA34AF0E2292B825163 v24 = self->_has;
  if ((*(void *)&v24 & 0x400000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $39A7635802529FA34AF0E2292B825163 v24 = self->_has;
  }
  if ((*(void *)&v24 & 0x100000000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_participantName) {
    PBDataWriterWriteStringField();
  }
  if (self->_participantIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_classicalWork) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $39A7635802529FA34AF0E2292B825163 v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x400) == 0)
    {
LABEL_169:
      if ((*(unsigned char *)&v25 & 8) == 0) {
        goto LABEL_171;
      }
      goto LABEL_170;
    }
  }
  else if ((*(_WORD *)&v25 & 0x400) == 0)
  {
    goto LABEL_169;
  }
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 8) != 0) {
LABEL_170:
  }
    PBDataWriterWriteInt64Field();
LABEL_171:
  if (self->_durationStringLocalizationKey) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 7)) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_internationalStandardRecordingCode) {
    PBDataWriterWriteStringField();
  }
  $39A7635802529FA34AF0E2292B825163 v26 = self->_has;
  if ((*(void *)&v26 & 0x8000000000000) == 0)
  {
    if ((*(void *)&v26 & 0x80000000000) == 0) {
      goto LABEL_179;
    }
LABEL_225:
    PBDataWriterWriteBOOLField();
    if ((*(void *)&self->_has & 0x4000000000000000) == 0) {
      goto LABEL_181;
    }
    goto LABEL_180;
  }
  PBDataWriterWriteBOOLField();
  $39A7635802529FA34AF0E2292B825163 v26 = self->_has;
  if ((*(void *)&v26 & 0x80000000000) != 0) {
    goto LABEL_225;
  }
LABEL_179:
  if ((*(void *)&v26 & 0x4000000000000000) != 0) {
LABEL_180:
  }
    PBDataWriterWriteBOOLField();
LABEL_181:
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (BOOL)hasTrackArtistName
{
  return self->_trackArtistName != 0;
}

- (BOOL)hasAlbumArtistName
{
  return self->_albumArtistName != 0;
}

- (BOOL)hasDirectorName
{
  return self->_directorName != 0;
}

- (BOOL)hasLocalizedContentRating
{
  return self->_localizedContentRating != 0;
}

- (BOOL)hasCollectionIdentifier
{
  return self->_collectionIdentifier != 0;
}

- (BOOL)hasProfileIdentifier
{
  return self->_profileIdentifier != 0;
}

- (BOOL)hasArtworkMIMEType
{
  return self->_artworkMIMEType != 0;
}

- (BOOL)hasComposer
{
  return self->_composer != 0;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (BOOL)hasContentIdentifier
{
  return self->_contentIdentifier != 0;
}

- (BOOL)hasRadioStationName
{
  return self->_radioStationName != 0;
}

- (BOOL)hasRadioStationString
{
  return self->_radioStationString != 0;
}

- (BOOL)hasPurchaseInfoData
{
  return self->_purchaseInfoData != 0;
}

- (BOOL)hasSeriesName
{
  return self->_seriesName != 0;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (BOOL)hasArtworkIdentifier
{
  return self->_artworkIdentifier != 0;
}

- (BOOL)hasBrandIdentifier
{
  return self->_brandIdentifier != 0;
}

- (BOOL)hasLocalizedDurationString
{
  return self->_localizedDurationString != 0;
}

- (BOOL)hasAlbumYear
{
  return self->_albumYear != 0;
}

- (id)songTraitsAsString:(int)a3
{
  id v4 = @"None";
  switch(a3)
  {
    case 0:
      goto LABEL_11;
    case 1:
      id v4 = @"AppleDigitalMaster";
      return v4;
    case 2:
      id v4 = @"Loseless";
      return v4;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_10;
    case 4:
      id v4 = @"HighResolutionLossless";
      return v4;
    case 8:
      id v4 = @"Spatial";
      return v4;
    default:
      if (a3 == 16)
      {
        id v4 = @"Atmos";
      }
      else if (a3 == 32)
      {
        id v4 = @"Surround";
      }
      else
      {
LABEL_10:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      }
      return v4;
  }
}

- (int)StringAsSongTraits:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AppleDigitalMaster"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Loseless"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HighResolutionLossless"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Spatial"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Atmos"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"Surround"])
  {
    int v4 = 32;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)albumTraitsAsString:(int)a3
{
  int v4 = @"None";
  switch(a3)
  {
    case 0:
      goto LABEL_11;
    case 1:
      int v4 = @"AppleDigitalMaster";
      return v4;
    case 2:
      int v4 = @"Loseless";
      return v4;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_10;
    case 4:
      int v4 = @"HighResolutionLossless";
      return v4;
    case 8:
      int v4 = @"Spatial";
      return v4;
    default:
      if (a3 == 16)
      {
        int v4 = @"Atmos";
      }
      else if (a3 == 32)
      {
        int v4 = @"Surround";
      }
      else
      {
LABEL_10:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      }
      return v4;
  }
}

- (int)StringAsAlbumTraits:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AppleDigitalMaster"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Loseless"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HighResolutionLossless"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Spatial"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Atmos"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"Surround"])
  {
    int v4 = 32;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)playlistTraitsAsString:(int)a3
{
  if (a3 <= 15)
  {
    if (a3)
    {
      if (a3 != 8)
      {
LABEL_22:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"Spatial";
    }
    else
    {
      int v4 = @"None";
    }
  }
  else
  {
    switch(a3)
    {
      case 16:
        int v4 = @"Atmos";
        break;
      case 32:
        int v4 = @"Surround";
        break;
      case 256:
        int v4 = @"Sing";
        return v4;
      default:
        goto LABEL_22;
    }
  }
  return v4;
}

- (int)StringAsPlaylistTraits:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Spatial"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Atmos"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"Surround"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"Sing"])
  {
    int v4 = 256;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)activeFormatJustificationAsString:(int)a3
{
  if (a3 <= 100)
  {
    switch(a3)
    {
      case 0:
        int v4 = @"Unknown";
        return v4;
      case 1:
        int v4 = @"Unavailable";
        return v4;
      case 100:
        int v4 = @"UserPreference";
        return v4;
    }
LABEL_28:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (a3 > 500)
  {
    if (a3 == 501)
    {
      int v4 = @"RouteUnknownCompatibility";
      return v4;
    }
    if (a3 == 1000)
    {
      int v4 = @"BandwidthInsufficient";
      return v4;
    }
    goto LABEL_28;
  }
  if (a3 != 101)
  {
    if (a3 == 500)
    {
      int v4 = @"RouteIncompatible";
      return v4;
    }
    goto LABEL_28;
  }
  int v4 = @"UserDownload";
  return v4;
}

- (int)StringAsActiveFormatJustification:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Unavailable"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UserPreference"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"UserDownload"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"RouteIncompatible"])
  {
    int v4 = 500;
  }
  else if ([v3 isEqualToString:@"RouteUnknownCompatibility"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"BandwidthInsufficient"])
  {
    int v4 = 1000;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)formatTierPreferenceAsString:(int)a3
{
  int v4 = @"LowBandwidthStereo";
  switch(a3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      int v4 = @"HighQualityStereo";
      return v4;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_9;
    case 4:
      int v4 = @"Lossless";
      return v4;
    case 8:
      int v4 = @"HighResolutionLossless";
      return v4;
    default:
      if (a3 == 16)
      {
        int v4 = @"Spatial";
      }
      else
      {
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      }
      return v4;
  }
}

- (int)StringAsFormatTierPreference:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LowBandwidthStereo"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HighQualityStereo"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Lossless"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HighResolutionLossless"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Spatial"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)clearAlternativeFormats
{
}

- (void)addAlternativeFormats:(id)a3
{
  id v4 = a3;
  alternativeFormats = self->_alternativeFormats;
  id v8 = v4;
  if (!alternativeFormats)
  {
    $39A7635802529FA34AF0E2292B825163 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    $39A7635802529FA34AF0E2292B825163 v7 = self->_alternativeFormats;
    self->_alternativeFormats = v6;

    id v4 = v8;
    alternativeFormats = self->_alternativeFormats;
  }
  [(NSMutableArray *)alternativeFormats addObject:v4];
}

- (unint64_t)alternativeFormatsCount
{
  return [(NSMutableArray *)self->_alternativeFormats count];
}

- (id)alternativeFormatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_alternativeFormats objectAtIndex:a3];
}

+ (Class)alternativeFormatsType
{
  return (Class)objc_opt_class();
}

- (void)setHasAlternativeFormats:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_hasAlternativeFormats = a3;
}

- (void)setHasHasAlternativeFormats:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$39A7635802529FA34AF0E2292B825163 has = ($39A7635802529FA34AF0E2292B825163)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasHasAlternativeFormats
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (BOOL)hasClassicalWork
{
  return self->_classicalWork != 0;
}

- (BOOL)hasDurationStringLocalizationKey
{
  return self->_durationStringLocalizationKey != 0;
}

- (BOOL)hasInternationalStandardRecordingCode
{
  return self->_internationalStandardRecordingCode != 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRContentItemMetadataProtobuf;
  id v4 = [(_MRContentItemMetadataProtobuf *)&v8 description];
  v5 = [(_MRContentItemMetadataProtobuf *)self dictionaryRepresentation];
  $39A7635802529FA34AF0E2292B825163 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v5 setObject:subtitle forKey:@"subtitle"];
  }
  $39A7635802529FA34AF0E2292B825163 has = self->_has;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    v72 = [NSNumber numberWithBool:self->_isContainer];
    [v5 setObject:v72 forKey:@"isContainer"];

    $39A7635802529FA34AF0E2292B825163 has = self->_has;
    if ((*(void *)&has & 0x80000000000000) == 0)
    {
LABEL_7:
      if ((*(void *)&has & 0x100000000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(void *)&has & 0x80000000000000) == 0)
  {
    goto LABEL_7;
  }
  v73 = [NSNumber numberWithBool:self->_isPlayable];
  [v5 setObject:v73 forKey:@"isPlayable"];

  if ((*(void *)&self->_has & 0x100000000) != 0)
  {
LABEL_8:
    *(float *)&double v4 = self->_playbackProgress;
    $39A7635802529FA34AF0E2292B825163 v9 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v9 forKey:@"playbackProgress"];
  }
LABEL_9:
  albumName = self->_albumName;
  if (albumName) {
    [v5 setObject:albumName forKey:@"albumName"];
  }
  trackArtistName = self->_trackArtistName;
  if (trackArtistName) {
    [v5 setObject:trackArtistName forKey:@"trackArtistName"];
  }
  albumArtistName = self->_albumArtistName;
  if (albumArtistName) {
    [v5 setObject:albumArtistName forKey:@"albumArtistName"];
  }
  directorName = self->_directorName;
  if (directorName) {
    [v5 setObject:directorName forKey:@"directorName"];
  }
  $39A7635802529FA34AF0E2292B825163 v14 = self->_has;
  if ((*(void *)&v14 & 0x2000000000) != 0)
  {
    v74 = [NSNumber numberWithInt:self->_seasonNumber];
    [v5 setObject:v74 forKey:@"seasonNumber"];

    $39A7635802529FA34AF0E2292B825163 v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x2000000) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v14 & 0x1000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_145;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
    goto LABEL_19;
  }
  v75 = [NSNumber numberWithInt:self->_episodeNumber];
  [v5 setObject:v75 forKey:@"episodeNumber"];

  $39A7635802529FA34AF0E2292B825163 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v14 & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_146;
  }
LABEL_145:
  v76 = [NSNumber numberWithDouble:self->_releaseDate];
  [v5 setObject:v76 forKey:@"releaseDate"];

  $39A7635802529FA34AF0E2292B825163 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v14 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_146:
  v77 = [NSNumber numberWithInt:self->_playCount];
  [v5 setObject:v77 forKey:@"playCount"];

  if (*(void *)&self->_has)
  {
LABEL_22:
    $39A7635802529FA34AF0E2292B825163 v15 = [NSNumber numberWithDouble:self->_duration];
    [v5 setObject:v15 forKey:@"duration"];
  }
LABEL_23:
  localizedContentRating = self->_localizedContentRating;
  if (localizedContentRating) {
    [v5 setObject:localizedContentRating forKey:@"localizedContentRating"];
  }
  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(void *)&v17 & 0x4000000000000) != 0)
  {
    v78 = [NSNumber numberWithBool:self->_isExplicitItem];
    [v5 setObject:v78 forKey:@"isExplicitItem"];

    $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
    if ((*(void *)&v17 & 0x800000000) == 0)
    {
LABEL_27:
      if ((*(void *)&v17 & 0x1000000000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_150;
    }
  }
  else if ((*(void *)&v17 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  v79 = [NSNumber numberWithInt:self->_playlistType];
  [v5 setObject:v79 forKey:@"playlistType"];

  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(void *)&v17 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&v17 & 0x40000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_151;
  }
LABEL_150:
  v80 = [NSNumber numberWithInt:self->_radioStationType];
  [v5 setObject:v80 forKey:@"radioStationType"];

  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(void *)&v17 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&v17 & 0x200000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_152;
  }
LABEL_151:
  v81 = [NSNumber numberWithBool:self->_artworkAvailable];
  [v5 setObject:v81 forKey:@"artworkAvailable"];

  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(void *)&v17 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&v17 & 0x1000000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_153;
  }
LABEL_152:
  v82 = [NSNumber numberWithBool:self->_infoAvailable];
  [v5 setObject:v82 forKey:@"infoAvailable"];

  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(void *)&v17 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v17 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_154;
  }
LABEL_153:
  v83 = [NSNumber numberWithBool:self->_languageOptionsAvailable];
  [v5 setObject:v83 forKey:@"languageOptionsAvailable"];

  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(void *)&v17 & 0x2000000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_155;
  }
LABEL_154:
  v84 = [NSNumber numberWithInt:self->_numberOfSections];
  [v5 setObject:v84 forKey:@"numberOfSections"];

  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(void *)&v17 & 0x2000000000000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v17 & 0x1000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_156;
  }
LABEL_155:
  v85 = [NSNumber numberWithBool:self->_lyricsAvailable];
  [v5 setObject:v85 forKey:@"lyricsAvailable"];

  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x1000000) == 0)
  {
LABEL_34:
    if ((*(void *)&v17 & 0x800000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_157;
  }
LABEL_156:
  v86 = [NSNumber numberWithInt:self->_editingStyleFlags];
  [v5 setObject:v86 forKey:@"editingStyleFlags"];

  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(void *)&v17 & 0x800000000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v17 & 0x2000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_157:
  v87 = [NSNumber numberWithBool:self->_isStreamingContent];
  [v5 setObject:v87 forKey:@"isStreamingContent"];

  if ((*(void *)&self->_has & 0x2000000000000) != 0)
  {
LABEL_36:
    $39A7635802529FA34AF0E2292B825163 v18 = [NSNumber numberWithBool:self->_isCurrentlyPlaying];
    [v5 setObject:v18 forKey:@"isCurrentlyPlaying"];
  }
LABEL_37:
  collectionIdentifier = self->_collectionIdentifier;
  if (collectionIdentifier) {
    [v5 setObject:collectionIdentifier forKey:@"collectionIdentifier"];
  }
  profileIdentifier = self->_profileIdentifier;
  if (profileIdentifier) {
    [v5 setObject:profileIdentifier forKey:@"profileIdentifier"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    uint64_t v21 = [NSNumber numberWithDouble:self->_startTime];
    [v5 setObject:v21 forKey:@"startTime"];
  }
  artworkMIMEType = self->_artworkMIMEType;
  if (artworkMIMEType) {
    [v5 setObject:artworkMIMEType forKey:@"artworkMIMEType"];
  }
  assetURLString = self->_assetURLString;
  if (assetURLString) {
    [v5 setObject:assetURLString forKey:@"assetURLString"];
  }
  composer = self->_composer;
  if (composer) {
    [v5 setObject:composer forKey:@"composer"];
  }
  $39A7635802529FA34AF0E2292B825163 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x200000) != 0)
  {
    $39A7635802529FA34AF0E2292B825163 v26 = [NSNumber numberWithInt:self->_discNumber];
    [v5 setObject:v26 forKey:@"discNumber"];

    $39A7635802529FA34AF0E2292B825163 v25 = self->_has;
  }
  if ((*(unsigned char *)&v25 & 2) != 0)
  {
    long long v27 = [NSNumber numberWithDouble:self->_elapsedTime];
    [v5 setObject:v27 forKey:@"elapsedTime"];
  }
  genre = self->_genre;
  if (genre) {
    [v5 setObject:genre forKey:@"genre"];
  }
  $39A7635802529FA34AF0E2292B825163 v29 = self->_has;
  if ((*(void *)&v29 & 0x800000000000) != 0)
  {
    v88 = [NSNumber numberWithBool:self->_isAlwaysLive];
    [v5 setObject:v88 forKey:@"isAlwaysLive"];

    $39A7635802529FA34AF0E2292B825163 v29 = self->_has;
    if ((*(void *)&v29 & 0x200000000) == 0)
    {
LABEL_57:
      if ((*(_DWORD *)&v29 & 0x80000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_161;
    }
  }
  else if ((*(void *)&v29 & 0x200000000) == 0)
  {
    goto LABEL_57;
  }
  *(float *)&double v4 = self->_playbackRate;
  v89 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v89 forKey:@"playbackRate"];

  $39A7635802529FA34AF0E2292B825163 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x80000) == 0)
  {
LABEL_58:
    if ((*(void *)&v29 & 0x8000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_162;
  }
LABEL_161:
  v90 = [NSNumber numberWithInt:self->_chapterCount];
  [v5 setObject:v90 forKey:@"chapterCount"];

  $39A7635802529FA34AF0E2292B825163 v29 = self->_has;
  if ((*(void *)&v29 & 0x8000000000) == 0)
  {
LABEL_59:
    if ((*(void *)&v29 & 0x10000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_163;
  }
LABEL_162:
  v91 = [NSNumber numberWithInt:self->_totalDiscCount];
  [v5 setObject:v91 forKey:@"totalDiscCount"];

  $39A7635802529FA34AF0E2292B825163 v29 = self->_has;
  if ((*(void *)&v29 & 0x10000000000) == 0)
  {
LABEL_60:
    if ((*(void *)&v29 & 0x20000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_163:
  v92 = [NSNumber numberWithInt:self->_totalTrackCount];
  [v5 setObject:v92 forKey:@"totalTrackCount"];

  if ((*(void *)&self->_has & 0x20000000000) != 0)
  {
LABEL_61:
    long long v30 = [NSNumber numberWithInt:self->_trackNumber];
    [v5 setObject:v30 forKey:@"trackNumber"];
  }
LABEL_62:
  contentIdentifier = self->_contentIdentifier;
  if (contentIdentifier) {
    [v5 setObject:contentIdentifier forKey:@"contentIdentifier"];
  }
  $39A7635802529FA34AF0E2292B825163 v32 = self->_has;
  if ((*(void *)&v32 & 0x200000000000000) != 0)
  {
    v93 = [NSNumber numberWithBool:self->_isSharable];
    [v5 setObject:v93 forKey:@"isSharable"];

    $39A7635802529FA34AF0E2292B825163 v32 = self->_has;
    if ((*(void *)&v32 & 0x20000000000000) == 0)
    {
LABEL_66:
      if ((*(void *)&v32 & 0x10000000000000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_167;
    }
  }
  else if ((*(void *)&v32 & 0x20000000000000) == 0)
  {
    goto LABEL_66;
  }
  v94 = [NSNumber numberWithBool:self->_isLiked];
  [v5 setObject:v94 forKey:@"isLiked"];

  $39A7635802529FA34AF0E2292B825163 v32 = self->_has;
  if ((*(void *)&v32 & 0x10000000000000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v32 & 0x800) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_167:
  v95 = [NSNumber numberWithBool:self->_isInWishList];
  [v5 setObject:v95 forKey:@"isInWishList"];

  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_68:
    v33 = [NSNumber numberWithLongLong:self->_radioStationIdentifier];
    [v5 setObject:v33 forKey:@"radioStationIdentifier"];
  }
LABEL_69:
  radioStationName = self->_radioStationName;
  if (radioStationName) {
    [v5 setObject:radioStationName forKey:@"radioStationName"];
  }
  radioStationString = self->_radioStationString;
  if (radioStationString) {
    [v5 setObject:radioStationString forKey:@"radioStationString"];
  }
  $39A7635802529FA34AF0E2292B825163 v36 = self->_has;
  if ((*(unsigned char *)&v36 & 0x40) != 0)
  {
    v96 = [NSNumber numberWithLongLong:self->_iTunesStoreIdentifier];
    [v5 setObject:v96 forKey:@"iTunesStoreIdentifier"];

    $39A7635802529FA34AF0E2292B825163 v36 = self->_has;
    if ((*(unsigned char *)&v36 & 0x80) == 0)
    {
LABEL_75:
      if ((*(unsigned char *)&v36 & 0x20) == 0) {
        goto LABEL_76;
      }
      goto LABEL_171;
    }
  }
  else if ((*(unsigned char *)&v36 & 0x80) == 0)
  {
    goto LABEL_75;
  }
  v97 = [NSNumber numberWithLongLong:self->_iTunesStoreSubscriptionIdentifier];
  [v5 setObject:v97 forKey:@"iTunesStoreSubscriptionIdentifier"];

  $39A7635802529FA34AF0E2292B825163 v36 = self->_has;
  if ((*(unsigned char *)&v36 & 0x20) == 0)
  {
LABEL_76:
    if ((*(unsigned char *)&v36 & 0x10) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_171:
  v98 = [NSNumber numberWithLongLong:self->_iTunesStoreArtistIdentifier];
  [v5 setObject:v98 forKey:@"iTunesStoreArtistIdentifier"];

  if ((*(void *)&self->_has & 0x10) != 0)
  {
LABEL_77:
    v37 = [NSNumber numberWithLongLong:self->_iTunesStoreAlbumIdentifier];
    [v5 setObject:v37 forKey:@"iTunesStoreAlbumIdentifier"];
  }
LABEL_78:
  purchaseInfoData = self->_purchaseInfoData;
  if (purchaseInfoData) {
    [v5 setObject:purchaseInfoData forKey:@"purchaseInfoData"];
  }
  $39A7635802529FA34AF0E2292B825163 v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x100000) != 0)
  {
    *(float *)&double v4 = self->_defaultPlaybackRate;
    v99 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v99 forKey:@"defaultPlaybackRate"];

    $39A7635802529FA34AF0E2292B825163 v39 = self->_has;
    if ((*(_DWORD *)&v39 & 0x800000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v39 & 0x400000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v39 & 0x800000) == 0)
  {
    goto LABEL_82;
  }
  v100 = [NSNumber numberWithInt:self->_downloadState];
  [v5 setObject:v100 forKey:@"downloadState"];

  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_83:
    *(float *)&double v4 = self->_downloadProgress;
    v40 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v40 forKey:@"downloadProgress"];
  }
LABEL_84:
  appMetricsData = self->_appMetricsData;
  if (appMetricsData) {
    [v5 setObject:appMetricsData forKey:@"appMetricsData"];
  }
  seriesName = self->_seriesName;
  if (seriesName) {
    [v5 setObject:seriesName forKey:@"seriesName"];
  }
  $39A7635802529FA34AF0E2292B825163 v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x20000000) != 0)
  {
    v44 = [NSNumber numberWithInt:self->_mediaType];
    [v5 setObject:v44 forKey:@"mediaType"];

    $39A7635802529FA34AF0E2292B825163 v43 = self->_has;
  }
  if ((*(_DWORD *)&v43 & 0x10000000) != 0)
  {
    v45 = [NSNumber numberWithInt:self->_mediaSubType];
    [v5 setObject:v45 forKey:@"mediaSubType"];
  }
  nowPlayingInfoData = self->_nowPlayingInfoData;
  if (nowPlayingInfoData) {
    [v5 setObject:nowPlayingInfoData forKey:@"nowPlayingInfoData"];
  }
  userInfoData = self->_userInfoData;
  if (userInfoData) {
    [v5 setObject:userInfoData forKey:@"userInfoData"];
  }
  if ((*((unsigned char *)&self->_has + 7) & 4) != 0)
  {
    v48 = [NSNumber numberWithBool:self->_isSteerable];
    [v5 setObject:v48 forKey:@"isSteerable"];
  }
  artworkURL = self->_artworkURL;
  if (artworkURL) {
    [v5 setObject:artworkURL forKey:@"artworkURL"];
  }
  lyricsURL = self->_lyricsURL;
  if (lyricsURL) {
    [v5 setObject:lyricsURL forKey:@"lyricsURL"];
  }
  deviceSpecificUserInfoData = self->_deviceSpecificUserInfoData;
  if (deviceSpecificUserInfoData) {
    [v5 setObject:deviceSpecificUserInfoData forKey:@"deviceSpecificUserInfoData"];
  }
  collectionInfoData = self->_collectionInfoData;
  if (collectionInfoData) {
    [v5 setObject:collectionInfoData forKey:@"collectionInfoData"];
  }
  $39A7635802529FA34AF0E2292B825163 v53 = self->_has;
  if ((*(unsigned char *)&v53 & 4) != 0)
  {
    v54 = [NSNumber numberWithDouble:self->_elapsedTimeTimestamp];
    [v5 setObject:v54 forKey:@"elapsedTimeTimestamp"];

    $39A7635802529FA34AF0E2292B825163 v53 = self->_has;
  }
  if ((*(_WORD *)&v53 & 0x100) != 0)
  {
    v55 = [NSNumber numberWithDouble:self->_inferredTimestamp];
    [v5 setObject:v55 forKey:@"inferredTimestamp"];
  }
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v5 setObject:serviceIdentifier forKey:@"serviceIdentifier"];
  }
  $39A7635802529FA34AF0E2292B825163 v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x40000) != 0)
  {
    v58 = [NSNumber numberWithInt:self->_artworkDataWidthDeprecated];
    [v5 setObject:v58 forKey:@"artworkDataWidthDeprecated"];

    $39A7635802529FA34AF0E2292B825163 v57 = self->_has;
  }
  if ((*(_DWORD *)&v57 & 0x20000) != 0)
  {
    v59 = [NSNumber numberWithInt:self->_artworkDataHeightDeprecated];
    [v5 setObject:v59 forKey:@"artworkDataHeightDeprecated"];
  }
  currentPlaybackDateData = self->_currentPlaybackDateData;
  if (currentPlaybackDateData) {
    [v5 setObject:currentPlaybackDateData forKey:@"currentPlaybackDateData"];
  }
  artworkIdentifier = self->_artworkIdentifier;
  if (artworkIdentifier) {
    [v5 setObject:artworkIdentifier forKey:@"artworkIdentifier"];
  }
  if ((*((unsigned char *)&self->_has + 6) & 0x40) != 0)
  {
    v62 = [NSNumber numberWithBool:self->_isLoading];
    [v5 setObject:v62 forKey:@"isLoading"];
  }
  artworkURLTemplatesData = self->_artworkURLTemplatesData;
  if (artworkURLTemplatesData) {
    [v5 setObject:artworkURLTemplatesData forKey:@"artworkURLTemplatesData"];
  }
  $39A7635802529FA34AF0E2292B825163 v64 = self->_has;
  if ((*(_WORD *)&v64 & 0x200) != 0)
  {
    v65 = [NSNumber numberWithLongLong:self->_legacyUniqueIdentifier];
    [v5 setObject:v65 forKey:@"legacyUniqueIdentifier"];

    $39A7635802529FA34AF0E2292B825163 v64 = self->_has;
  }
  if ((*(_DWORD *)&v64 & 0x4000000) != 0)
  {
    v66 = [NSNumber numberWithInt:self->_episodeType];
    [v5 setObject:v66 forKey:@"episodeType"];
  }
  artworkFileURL = self->_artworkFileURL;
  if (artworkFileURL) {
    [v5 setObject:artworkFileURL forKey:@"artworkFileURL"];
  }
  brandIdentifier = self->_brandIdentifier;
  if (brandIdentifier) {
    [v5 setObject:brandIdentifier forKey:@"brandIdentifier"];
  }
  localizedDurationString = self->_localizedDurationString;
  if (localizedDurationString) {
    [v5 setObject:localizedDurationString forKey:@"localizedDurationString"];
  }
  albumYear = self->_albumYear;
  if (albumYear) {
    [v5 setObject:albumYear forKey:@"albumYear"];
  }
  $39A7635802529FA34AF0E2292B825163 v71 = self->_has;
  if ((*(void *)&v71 & 0x4000000000) != 0)
  {
    int songTraits = self->_songTraits;
    v102 = @"None";
    switch(songTraits)
    {
      case 0:
        break;
      case 1:
        v102 = @"AppleDigitalMaster";
        break;
      case 2:
        v102 = @"Loseless";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_181;
      case 4:
        v102 = @"HighResolutionLossless";
        break;
      case 8:
        v102 = @"Spatial";
        break;
      default:
        if (songTraits == 16)
        {
          v102 = @"Atmos";
        }
        else if (songTraits == 32)
        {
          v102 = @"Surround";
        }
        else
        {
LABEL_181:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_songTraits);
          v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    [v5 setObject:v102 forKey:@"songTraits"];

    $39A7635802529FA34AF0E2292B825163 v71 = self->_has;
    if ((*(_DWORD *)&v71 & 0x10000) == 0)
    {
LABEL_138:
      if ((*(void *)&v71 & 0x400000000) == 0) {
        goto LABEL_211;
      }
LABEL_198:
      int playlistTraits = self->_playlistTraits;
      if (playlistTraits <= 15)
      {
        if (!playlistTraits)
        {
          v106 = @"None";
          goto LABEL_210;
        }
        if (playlistTraits == 8)
        {
          v106 = @"Spatial";
          goto LABEL_210;
        }
      }
      else
      {
        switch(playlistTraits)
        {
          case 16:
            v106 = @"Atmos";
            goto LABEL_210;
          case 32:
            v106 = @"Surround";
            goto LABEL_210;
          case 256:
            v106 = @"Sing";
LABEL_210:
            [v5 setObject:v106 forKey:@"playlistTraits"];

            goto LABEL_211;
        }
      }
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_playlistTraits);
      v106 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_210;
    }
  }
  else if ((*(_DWORD *)&v71 & 0x10000) == 0)
  {
    goto LABEL_138;
  }
  int albumTraits = self->_albumTraits;
  v104 = @"None";
  switch(albumTraits)
  {
    case 0:
      break;
    case 1:
      v104 = @"AppleDigitalMaster";
      break;
    case 2:
      v104 = @"Loseless";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_192;
    case 4:
      v104 = @"HighResolutionLossless";
      break;
    case 8:
      v104 = @"Spatial";
      break;
    default:
      if (albumTraits == 16)
      {
        v104 = @"Atmos";
      }
      else if (albumTraits == 32)
      {
        v104 = @"Surround";
      }
      else
      {
LABEL_192:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_albumTraits);
        v104 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  [v5 setObject:v104 forKey:@"albumTraits"];

  if ((*(void *)&self->_has & 0x400000000) != 0) {
    goto LABEL_198;
  }
LABEL_211:
  preferredFormat = self->_preferredFormat;
  if (preferredFormat)
  {
    v108 = [(_MRAudioFormatProtobuf *)preferredFormat dictionaryRepresentation];
    [v5 setObject:v108 forKey:@"preferredFormat"];
  }
  activeFormat = self->_activeFormat;
  if (activeFormat)
  {
    v110 = [(_MRAudioFormatProtobuf *)activeFormat dictionaryRepresentation];
    [v5 setObject:v110 forKey:@"activeFormat"];
  }
  $39A7635802529FA34AF0E2292B825163 v111 = self->_has;
  if ((*(_WORD *)&v111 & 0x8000) != 0)
  {
    int activeFormatJustification = self->_activeFormatJustification;
    if (activeFormatJustification <= 100)
    {
      switch(activeFormatJustification)
      {
        case 0:
          v113 = @"Unknown";
          goto LABEL_233;
        case 1:
          v113 = @"Unavailable";
          goto LABEL_233;
        case 100:
          v113 = @"UserPreference";
          goto LABEL_233;
      }
    }
    else if (activeFormatJustification > 500)
    {
      if (activeFormatJustification == 501)
      {
        v113 = @"RouteUnknownCompatibility";
        goto LABEL_233;
      }
      if (activeFormatJustification == 1000)
      {
        v113 = @"BandwidthInsufficient";
        goto LABEL_233;
      }
    }
    else
    {
      if (activeFormatJustification == 101)
      {
        v113 = @"UserDownload";
        goto LABEL_233;
      }
      if (activeFormatJustification == 500)
      {
        v113 = @"RouteIncompatible";
LABEL_233:
        [v5 setObject:v113 forKey:@"activeFormatJustification"];

        $39A7635802529FA34AF0E2292B825163 v111 = self->_has;
        goto LABEL_234;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_activeFormatJustification);
    v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_233;
  }
LABEL_234:
  if ((*(_DWORD *)&v111 & 0x8000000) != 0)
  {
    int formatTierPreference = self->_formatTierPreference;
    v115 = @"LowBandwidthStereo";
    switch(formatTierPreference)
    {
      case 1:
        break;
      case 2:
        v115 = @"HighQualityStereo";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_239;
      case 4:
        v115 = @"Lossless";
        break;
      case 8:
        v115 = @"HighResolutionLossless";
        break;
      default:
        if (formatTierPreference == 16)
        {
          v115 = @"Spatial";
        }
        else
        {
LABEL_239:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_formatTierPreference);
          v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    [v5 setObject:v115 forKey:@"formatTierPreference"];
  }
  audioRoute = self->_audioRoute;
  if (audioRoute)
  {
    v117 = [(_MRAudioRouteProtobuf *)audioRoute dictionaryRepresentation];
    [v5 setObject:v117 forKey:@"audioRoute"];
  }
  if ([(NSMutableArray *)self->_alternativeFormats count])
  {
    v118 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_alternativeFormats, "count"));
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    v119 = self->_alternativeFormats;
    uint64_t v120 = [(NSMutableArray *)v119 countByEnumeratingWithState:&v144 objects:v148 count:16];
    if (v120)
    {
      uint64_t v121 = v120;
      uint64_t v122 = *(void *)v145;
      do
      {
        for (uint64_t i = 0; i != v121; ++i)
        {
          if (*(void *)v145 != v122) {
            objc_enumerationMutation(v119);
          }
          v124 = [*(id *)(*((void *)&v144 + 1) + 8 * i) dictionaryRepresentation];
          [v118 addObject:v124];
        }
        uint64_t v121 = [(NSMutableArray *)v119 countByEnumeratingWithState:&v144 objects:v148 count:16];
      }
      while (v121);
    }

    [v5 setObject:v118 forKey:@"alternativeFormats"];
  }
  $39A7635802529FA34AF0E2292B825163 v125 = self->_has;
  if ((*(void *)&v125 & 0x400000000000) != 0)
  {
    v126 = [NSNumber numberWithBool:self->_isAdvertisement];
    [v5 setObject:v126 forKey:@"isAdvertisement"];

    $39A7635802529FA34AF0E2292B825163 v125 = self->_has;
  }
  if ((*(void *)&v125 & 0x100000000000) != 0)
  {
    v127 = [NSNumber numberWithBool:self->_hasAlternativeFormats];
    [v5 setObject:v127 forKey:@"hasAlternativeFormats"];
  }
  participantName = self->_participantName;
  if (participantName) {
    [v5 setObject:participantName forKey:@"participantName"];
  }
  participantIdentifier = self->_participantIdentifier;
  if (participantIdentifier) {
    [v5 setObject:participantIdentifier forKey:@"participantIdentifier"];
  }
  classicalWork = self->_classicalWork;
  if (classicalWork) {
    [v5 setObject:classicalWork forKey:@"classicalWork"];
  }
  $39A7635802529FA34AF0E2292B825163 v131 = self->_has;
  if ((*(_WORD *)&v131 & 0x2000) != 0)
  {
    v140 = [NSNumber numberWithLongLong:self->_reportingAdamID];
    [v5 setObject:v140 forKey:@"reportingAdamID"];

    $39A7635802529FA34AF0E2292B825163 v131 = self->_has;
    if ((*(_WORD *)&v131 & 0x400) == 0)
    {
LABEL_266:
      if ((*(unsigned char *)&v131 & 8) == 0) {
        goto LABEL_268;
      }
      goto LABEL_267;
    }
  }
  else if ((*(_WORD *)&v131 & 0x400) == 0)
  {
    goto LABEL_266;
  }
  v141 = [NSNumber numberWithLongLong:self->_lyricsAdamID];
  [v5 setObject:v141 forKey:@"lyricsAdamID"];

  if ((*(void *)&self->_has & 8) != 0)
  {
LABEL_267:
    v132 = [NSNumber numberWithLongLong:self->_iTunesStoreAlbumArtistIdentifier];
    [v5 setObject:v132 forKey:@"iTunesStoreAlbumArtistIdentifier"];
  }
LABEL_268:
  durationStringLocalizationKey = self->_durationStringLocalizationKey;
  if (durationStringLocalizationKey) {
    [v5 setObject:durationStringLocalizationKey forKey:@"durationStringLocalizationKey"];
  }
  if (*((unsigned char *)&self->_has + 7))
  {
    v134 = [NSNumber numberWithBool:self->_isResolvableParticipant];
    [v5 setObject:v134 forKey:@"isResolvableParticipant"];
  }
  internationalStandardRecordingCode = self->_internationalStandardRecordingCode;
  if (internationalStandardRecordingCode) {
    [v5 setObject:internationalStandardRecordingCode forKey:@"internationalStandardRecordingCode"];
  }
  $39A7635802529FA34AF0E2292B825163 v136 = self->_has;
  if ((*(void *)&v136 & 0x8000000000000) == 0)
  {
    if ((*(void *)&v136 & 0x80000000000) == 0) {
      goto LABEL_276;
    }
LABEL_283:
    v143 = [NSNumber numberWithBool:self->_excludeFromSuggestions];
    [v5 setObject:v143 forKey:@"excludeFromSuggestions"];

    if ((*(void *)&self->_has & 0x4000000000000000) == 0) {
      goto LABEL_278;
    }
    goto LABEL_277;
  }
  v142 = [NSNumber numberWithBool:self->_isInTransition];
  [v5 setObject:v142 forKey:@"isInTransition"];

  $39A7635802529FA34AF0E2292B825163 v136 = self->_has;
  if ((*(void *)&v136 & 0x80000000000) != 0) {
    goto LABEL_283;
  }
LABEL_276:
  if ((*(void *)&v136 & 0x4000000000000000) != 0)
  {
LABEL_277:
    v137 = [NSNumber numberWithBool:self->_transcriptAlignmentsAvailable];
    [v5 setObject:v137 forKey:@"transcriptAlignmentsAvailable"];
  }
LABEL_278:
  id v138 = v5;

  return v138;
}

- (BOOL)readFrom:(id)a3
{
  return _MRContentItemMetadataProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v27 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v27;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v27, "setSubtitle:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 has = self->_has;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    *((unsigned char *)v4 + 614) = self->_isContainer;
    *((void *)v4 + 79) |= 0x1000000000000uLL;
    $39A7635802529FA34AF0E2292B825163 has = self->_has;
    if ((*(void *)&has & 0x80000000000000) == 0)
    {
LABEL_7:
      if ((*(void *)&has & 0x100000000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(void *)&has & 0x80000000000000) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 621) = self->_isPlayable;
  *((void *)v4 + 79) |= 0x80000000000000uLL;
  if ((*(void *)&self->_has & 0x100000000) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 117) = LODWORD(self->_playbackProgress);
    *((void *)v4 + 79) |= 0x100000000uLL;
  }
LABEL_9:
  if (self->_albumName)
  {
    objc_msgSend(v27, "setAlbumName:");
    id v4 = v27;
  }
  if (self->_trackArtistName)
  {
    objc_msgSend(v27, "setTrackArtistName:");
    id v4 = v27;
  }
  if (self->_albumArtistName)
  {
    objc_msgSend(v27, "setAlbumArtistName:");
    id v4 = v27;
  }
  if (self->_directorName)
  {
    objc_msgSend(v27, "setDirectorName:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v6 = self->_has;
  if ((*(void *)&v6 & 0x2000000000) != 0)
  {
    *((_DWORD *)v4 + 133) = self->_seasonNumber;
    *((void *)v4 + 79) |= 0x2000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v6 & 0x1000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_186;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v4 + 93) = self->_episodeNumber;
  *((void *)v4 + 79) |= 0x2000000uLL;
  $39A7635802529FA34AF0E2292B825163 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_187;
  }
LABEL_186:
  *((void *)v4 + 13) = *(void *)&self->_releaseDate;
  *((void *)v4 + 79) |= 0x1000uLL;
  $39A7635802529FA34AF0E2292B825163 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_187:
  *((_DWORD *)v4 + 116) = self->_playCount;
  *((void *)v4 + 79) |= 0x80000000uLL;
  if (*(void *)&self->_has)
  {
LABEL_22:
    *((void *)v4 + 1) = *(void *)&self->_duration;
    *((void *)v4 + 79) |= 1uLL;
  }
LABEL_23:
  if (self->_localizedContentRating)
  {
    objc_msgSend(v27, "setLocalizedContentRating:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x4000000000000) != 0)
  {
    *((unsigned char *)v4 + 616) = self->_isExplicitItem;
    *((void *)v4 + 79) |= 0x4000000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
    if ((*(void *)&v7 & 0x800000000) == 0)
    {
LABEL_27:
      if ((*(void *)&v7 & 0x1000000000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_191;
    }
  }
  else if ((*(void *)&v7 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  *((_DWORD *)v4 + 120) = self->_playlistType;
  *((void *)v4 + 79) |= 0x800000000uLL;
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&v7 & 0x40000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_192;
  }
LABEL_191:
  *((_DWORD *)v4 + 132) = self->_radioStationType;
  *((void *)v4 + 79) |= 0x1000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&v7 & 0x200000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_193;
  }
LABEL_192:
  *((unsigned char *)v4 + 608) = self->_artworkAvailable;
  *((void *)v4 + 79) |= 0x40000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&v7 & 0x1000000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_194;
  }
LABEL_193:
  *((unsigned char *)v4 + 611) = self->_infoAvailable;
  *((void *)v4 + 79) |= 0x200000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_195;
  }
LABEL_194:
  *((unsigned char *)v4 + 626) = self->_languageOptionsAvailable;
  *((void *)v4 + 79) |= 0x1000000000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(void *)&v7 & 0x2000000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_196;
  }
LABEL_195:
  *((_DWORD *)v4 + 110) = self->_numberOfSections;
  *((void *)v4 + 79) |= 0x40000000uLL;
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x2000000000000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_197;
  }
LABEL_196:
  *((unsigned char *)v4 + 627) = self->_lyricsAvailable;
  *((void *)v4 + 79) |= 0x2000000000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_34:
    if ((*(void *)&v7 & 0x800000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_198;
  }
LABEL_197:
  *((_DWORD *)v4 + 92) = self->_editingStyleFlags;
  *((void *)v4 + 79) |= 0x1000000uLL;
  $39A7635802529FA34AF0E2292B825163 v7 = self->_has;
  if ((*(void *)&v7 & 0x800000000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v7 & 0x2000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_198:
  *((unsigned char *)v4 + 625) = self->_isStreamingContent;
  *((void *)v4 + 79) |= 0x800000000000000uLL;
  if ((*(void *)&self->_has & 0x2000000000000) != 0)
  {
LABEL_36:
    *((unsigned char *)v4 + 615) = self->_isCurrentlyPlaying;
    *((void *)v4 + 79) |= 0x2000000000000uLL;
  }
LABEL_37:
  if (self->_collectionIdentifier)
  {
    objc_msgSend(v27, "setCollectionIdentifier:");
    id v4 = v27;
  }
  if (self->_profileIdentifier)
  {
    objc_msgSend(v27, "setProfileIdentifier:");
    id v4 = v27;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *((void *)v4 + 15) = *(void *)&self->_startTime;
    *((void *)v4 + 79) |= 0x4000uLL;
  }
  if (self->_artworkMIMEType)
  {
    objc_msgSend(v27, "setArtworkMIMEType:");
    id v4 = v27;
  }
  if (self->_assetURLString)
  {
    objc_msgSend(v27, "setAssetURLString:");
    id v4 = v27;
  }
  if (self->_composer)
  {
    objc_msgSend(v27, "setComposer:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    *((_DWORD *)v4 + 86) = self->_discNumber;
    *((void *)v4 + 79) |= 0x200000uLL;
    $39A7635802529FA34AF0E2292B825163 v8 = self->_has;
  }
  if ((*(unsigned char *)&v8 & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_elapsedTime;
    *((void *)v4 + 79) |= 2uLL;
  }
  if (self->_genre)
  {
    objc_msgSend(v27, "setGenre:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
  if ((*(void *)&v9 & 0x800000000000) != 0)
  {
    *((unsigned char *)v4 + 613) = self->_isAlwaysLive;
    *((void *)v4 + 79) |= 0x800000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
    if ((*(void *)&v9 & 0x200000000) == 0)
    {
LABEL_57:
      if ((*(_DWORD *)&v9 & 0x80000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_202;
    }
  }
  else if ((*(void *)&v9 & 0x200000000) == 0)
  {
    goto LABEL_57;
  }
  *((_DWORD *)v4 + 118) = LODWORD(self->_playbackRate);
  *((void *)v4 + 79) |= 0x200000000uLL;
  $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_58:
    if ((*(void *)&v9 & 0x8000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_203;
  }
LABEL_202:
  *((_DWORD *)v4 + 66) = self->_chapterCount;
  *((void *)v4 + 79) |= 0x80000uLL;
  $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
  if ((*(void *)&v9 & 0x8000000000) == 0)
  {
LABEL_59:
    if ((*(void *)&v9 & 0x10000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_204;
  }
LABEL_203:
  *((_DWORD *)v4 + 144) = self->_totalDiscCount;
  *((void *)v4 + 79) |= 0x8000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
  if ((*(void *)&v9 & 0x10000000000) == 0)
  {
LABEL_60:
    if ((*(void *)&v9 & 0x20000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_204:
  *((_DWORD *)v4 + 145) = self->_totalTrackCount;
  *((void *)v4 + 79) |= 0x10000000000uLL;
  if ((*(void *)&self->_has & 0x20000000000) != 0)
  {
LABEL_61:
    *((_DWORD *)v4 + 148) = self->_trackNumber;
    *((void *)v4 + 79) |= 0x20000000000uLL;
  }
LABEL_62:
  if (self->_contentIdentifier)
  {
    objc_msgSend(v27, "setContentIdentifier:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v10 = self->_has;
  if ((*(void *)&v10 & 0x200000000000000) != 0)
  {
    *((unsigned char *)v4 + 623) = self->_isSharable;
    *((void *)v4 + 79) |= 0x200000000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v10 = self->_has;
    if ((*(void *)&v10 & 0x20000000000000) == 0)
    {
LABEL_66:
      if ((*(void *)&v10 & 0x10000000000000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_208;
    }
  }
  else if ((*(void *)&v10 & 0x20000000000000) == 0)
  {
    goto LABEL_66;
  }
  *((unsigned char *)v4 + 619) = self->_isLiked;
  *((void *)v4 + 79) |= 0x20000000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v10 = self->_has;
  if ((*(void *)&v10 & 0x10000000000000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v10 & 0x800) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_208:
  *((unsigned char *)v4 + 618) = self->_isInWishList;
  *((void *)v4 + 79) |= 0x10000000000000uLL;
  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_68:
    *((void *)v4 + 12) = self->_radioStationIdentifier;
    *((void *)v4 + 79) |= 0x800uLL;
  }
LABEL_69:
  if (self->_radioStationName)
  {
    objc_msgSend(v27, "setRadioStationName:");
    id v4 = v27;
  }
  if (self->_radioStationString)
  {
    objc_msgSend(v27, "setRadioStationString:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    *((void *)v4 + 7) = self->_iTunesStoreIdentifier;
    *((void *)v4 + 79) |= 0x40uLL;
    $39A7635802529FA34AF0E2292B825163 v11 = self->_has;
    if ((*(unsigned char *)&v11 & 0x80) == 0)
    {
LABEL_75:
      if ((*(unsigned char *)&v11 & 0x20) == 0) {
        goto LABEL_76;
      }
      goto LABEL_212;
    }
  }
  else if ((*(unsigned char *)&v11 & 0x80) == 0)
  {
    goto LABEL_75;
  }
  *((void *)v4 + 8) = self->_iTunesStoreSubscriptionIdentifier;
  *((void *)v4 + 79) |= 0x80uLL;
  $39A7635802529FA34AF0E2292B825163 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x20) == 0)
  {
LABEL_76:
    if ((*(unsigned char *)&v11 & 0x10) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_212:
  *((void *)v4 + 6) = self->_iTunesStoreArtistIdentifier;
  *((void *)v4 + 79) |= 0x20uLL;
  if ((*(void *)&self->_has & 0x10) != 0)
  {
LABEL_77:
    *((void *)v4 + 5) = self->_iTunesStoreAlbumIdentifier;
    *((void *)v4 + 79) |= 0x10uLL;
  }
LABEL_78:
  if (self->_purchaseInfoData)
  {
    objc_msgSend(v27, "setPurchaseInfoData:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    *((_DWORD *)v4 + 80) = LODWORD(self->_defaultPlaybackRate);
    *((void *)v4 + 79) |= 0x100000uLL;
    $39A7635802529FA34AF0E2292B825163 v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x800000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v12 & 0x400000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x800000) == 0)
  {
    goto LABEL_82;
  }
  *((_DWORD *)v4 + 88) = self->_downloadState;
  *((void *)v4 + 79) |= 0x800000uLL;
  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_83:
    *((_DWORD *)v4 + 87) = LODWORD(self->_downloadProgress);
    *((void *)v4 + 79) |= 0x400000uLL;
  }
LABEL_84:
  if (self->_appMetricsData)
  {
    objc_msgSend(v27, "setAppMetricsData:");
    id v4 = v27;
  }
  if (self->_seriesName)
  {
    objc_msgSend(v27, "setSeriesName:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
    *((_DWORD *)v4 + 107) = self->_mediaType;
    *((void *)v4 + 79) |= 0x20000000uLL;
    $39A7635802529FA34AF0E2292B825163 v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x10000000) != 0)
  {
    *((_DWORD *)v4 + 106) = self->_mediaSubType;
    *((void *)v4 + 79) |= 0x10000000uLL;
  }
  if (self->_nowPlayingInfoData)
  {
    objc_msgSend(v27, "setNowPlayingInfoData:");
    id v4 = v27;
  }
  if (self->_userInfoData)
  {
    objc_msgSend(v27, "setUserInfoData:");
    id v4 = v27;
  }
  if ((*((unsigned char *)&self->_has + 7) & 4) != 0)
  {
    *((unsigned char *)v4 + 624) = self->_isSteerable;
    *((void *)v4 + 79) |= 0x400000000000000uLL;
  }
  if (self->_artworkURL)
  {
    objc_msgSend(v27, "setArtworkURL:");
    id v4 = v27;
  }
  if (self->_lyricsURL)
  {
    objc_msgSend(v27, "setLyricsURL:");
    id v4 = v27;
  }
  if (self->_deviceSpecificUserInfoData)
  {
    objc_msgSend(v27, "setDeviceSpecificUserInfoData:");
    id v4 = v27;
  }
  if (self->_collectionInfoData)
  {
    objc_msgSend(v27, "setCollectionInfoData:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_elapsedTimeTimestamp;
    *((void *)v4 + 79) |= 4uLL;
    $39A7635802529FA34AF0E2292B825163 v14 = self->_has;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    *((void *)v4 + 9) = *(void *)&self->_inferredTimestamp;
    *((void *)v4 + 79) |= 0x100uLL;
  }
  if (self->_serviceIdentifier)
  {
    objc_msgSend(v27, "setServiceIdentifier:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    *((_DWORD *)v4 + 49) = self->_artworkDataWidthDeprecated;
    *((void *)v4 + 79) |= 0x40000uLL;
    $39A7635802529FA34AF0E2292B825163 v15 = self->_has;
  }
  if ((*(_DWORD *)&v15 & 0x20000) != 0)
  {
    *((_DWORD *)v4 + 48) = self->_artworkDataHeightDeprecated;
    *((void *)v4 + 79) |= 0x20000uLL;
  }
  if (self->_currentPlaybackDateData)
  {
    objc_msgSend(v27, "setCurrentPlaybackDateData:");
    id v4 = v27;
  }
  if (self->_artworkIdentifier)
  {
    objc_msgSend(v27, "setArtworkIdentifier:");
    id v4 = v27;
  }
  if ((*((unsigned char *)&self->_has + 6) & 0x40) != 0)
  {
    *((unsigned char *)v4 + 620) = self->_isLoading;
    *((void *)v4 + 79) |= 0x40000000000000uLL;
  }
  if (self->_artworkURLTemplatesData)
  {
    objc_msgSend(v27, "setArtworkURLTemplatesData:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    *((void *)v4 + 10) = self->_legacyUniqueIdentifier;
    *((void *)v4 + 79) |= 0x200uLL;
    $39A7635802529FA34AF0E2292B825163 v16 = self->_has;
  }
  if ((*(_DWORD *)&v16 & 0x4000000) != 0)
  {
    *((_DWORD *)v4 + 94) = self->_episodeType;
    *((void *)v4 + 79) |= 0x4000000uLL;
  }
  if (self->_artworkFileURL)
  {
    objc_msgSend(v27, "setArtworkFileURL:");
    id v4 = v27;
  }
  if (self->_brandIdentifier)
  {
    objc_msgSend(v27, "setBrandIdentifier:");
    id v4 = v27;
  }
  if (self->_localizedDurationString)
  {
    objc_msgSend(v27, "setLocalizedDurationString:");
    id v4 = v27;
  }
  if (self->_albumYear)
  {
    objc_msgSend(v27, "setAlbumYear:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
  if ((*(void *)&v17 & 0x4000000000) != 0)
  {
    *((_DWORD *)v4 + 138) = self->_songTraits;
    *((void *)v4 + 79) |= 0x4000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x10000) == 0)
    {
LABEL_138:
      if ((*(void *)&v17 & 0x400000000) == 0) {
        goto LABEL_140;
      }
      goto LABEL_139;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x10000) == 0)
  {
    goto LABEL_138;
  }
  *((_DWORD *)v4 + 40) = self->_albumTraits;
  *((void *)v4 + 79) |= 0x10000uLL;
  if ((*(void *)&self->_has & 0x400000000) != 0)
  {
LABEL_139:
    *((_DWORD *)v4 + 119) = self->_playlistTraits;
    *((void *)v4 + 79) |= 0x400000000uLL;
  }
LABEL_140:
  if (self->_preferredFormat)
  {
    objc_msgSend(v27, "setPreferredFormat:");
    id v4 = v27;
  }
  if (self->_activeFormat)
  {
    objc_msgSend(v27, "setActiveFormat:");
    id v4 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 34) = self->_activeFormatJustification;
    *((void *)v4 + 79) |= 0x8000uLL;
    $39A7635802529FA34AF0E2292B825163 v18 = self->_has;
  }
  if ((*(_DWORD *)&v18 & 0x8000000) != 0)
  {
    *((_DWORD *)v4 + 95) = self->_formatTierPreference;
    *((void *)v4 + 79) |= 0x8000000uLL;
  }
  if (self->_audioRoute) {
    objc_msgSend(v27, "setAudioRoute:");
  }
  if ([(_MRContentItemMetadataProtobuf *)self alternativeFormatsCount])
  {
    [v27 clearAlternativeFormats];
    unint64_t v19 = [(_MRContentItemMetadataProtobuf *)self alternativeFormatsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t i = 0; i != v20; ++i)
      {
        uint64_t v22 = [(_MRContentItemMetadataProtobuf *)self alternativeFormatsAtIndex:i];
        [v27 addAlternativeFormats:v22];
      }
    }
  }
  $39A7635802529FA34AF0E2292B825163 v23 = self->_has;
  $39A7635802529FA34AF0E2292B825163 v24 = v27;
  if ((*(void *)&v23 & 0x400000000000) != 0)
  {
    *((unsigned char *)v27 + 612) = self->_isAdvertisement;
    *((void *)v27 + 79) |= 0x400000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v23 = self->_has;
  }
  if ((*(void *)&v23 & 0x100000000000) != 0)
  {
    *((unsigned char *)v27 + 610) = self->_hasAlternativeFormats;
    *((void *)v27 + 79) |= 0x100000000000uLL;
  }
  if (self->_participantName)
  {
    objc_msgSend(v27, "setParticipantName:");
    $39A7635802529FA34AF0E2292B825163 v24 = v27;
  }
  if (self->_participantIdentifier)
  {
    objc_msgSend(v27, "setParticipantIdentifier:");
    $39A7635802529FA34AF0E2292B825163 v24 = v27;
  }
  if (self->_classicalWork)
  {
    objc_msgSend(v27, "setClassicalWork:");
    $39A7635802529FA34AF0E2292B825163 v24 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x2000) != 0)
  {
    v24[14] = self->_reportingAdamID;
    v24[79] |= 0x2000uLL;
    $39A7635802529FA34AF0E2292B825163 v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x400) == 0)
    {
LABEL_166:
      if ((*(unsigned char *)&v25 & 8) == 0) {
        goto LABEL_168;
      }
      goto LABEL_167;
    }
  }
  else if ((*(_WORD *)&v25 & 0x400) == 0)
  {
    goto LABEL_166;
  }
  v24[11] = self->_lyricsAdamID;
  v24[79] |= 0x400uLL;
  if ((*(void *)&self->_has & 8) != 0)
  {
LABEL_167:
    v24[4] = self->_iTunesStoreAlbumArtistIdentifier;
    v24[79] |= 8uLL;
  }
LABEL_168:
  if (self->_durationStringLocalizationKey)
  {
    objc_msgSend(v27, "setDurationStringLocalizationKey:");
    $39A7635802529FA34AF0E2292B825163 v24 = v27;
  }
  if (*((unsigned char *)&self->_has + 7))
  {
    *((unsigned char *)v24 + 622) = self->_isResolvableParticipant;
    v24[79] |= 0x100000000000000uLL;
  }
  if (self->_internationalStandardRecordingCode)
  {
    objc_msgSend(v27, "setInternationalStandardRecordingCode:");
    $39A7635802529FA34AF0E2292B825163 v24 = v27;
  }
  $39A7635802529FA34AF0E2292B825163 v26 = self->_has;
  if ((*(void *)&v26 & 0x8000000000000) != 0)
  {
    *((unsigned char *)v24 + 617) = self->_isInTransition;
    v24[79] |= 0x8000000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v26 = self->_has;
    if ((*(void *)&v26 & 0x80000000000) == 0)
    {
LABEL_176:
      if ((*(void *)&v26 & 0x4000000000000000) == 0) {
        goto LABEL_178;
      }
      goto LABEL_177;
    }
  }
  else if ((*(void *)&v26 & 0x80000000000) == 0)
  {
    goto LABEL_176;
  }
  *((unsigned char *)v24 + 609) = self->_excludeFromSuggestions;
  v24[79] |= 0x80000000000uLL;
  if ((*(void *)&self->_has & 0x4000000000000000) != 0)
  {
LABEL_177:
    *((unsigned char *)v24 + 628) = self->_transcriptAlignmentsAvailable;
    v24[79] |= 0x4000000000000000uLL;
  }
LABEL_178:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v7 = *(void **)(v5 + 568);
  *(void *)(v5 + 568) = v6;

  uint64_t v8 = [(NSString *)self->_subtitle copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v9 = *(void **)(v5 + 560);
  *(void *)(v5 + 560) = v8;

  $39A7635802529FA34AF0E2292B825163 has = self->_has;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    *(unsigned char *)(v5 + 614) = self->_isContainer;
    *(void *)(v5 + 632) |= 0x1000000000000uLL;
    $39A7635802529FA34AF0E2292B825163 has = self->_has;
    if ((*(void *)&has & 0x80000000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x100000000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(void *)&has & 0x80000000000000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 621) = self->_isPlayable;
  *(void *)(v5 + 632) |= 0x80000000000000uLL;
  if ((*(void *)&self->_has & 0x100000000) != 0)
  {
LABEL_4:
    *(float *)(v5 + 468) = self->_playbackProgress;
    *(void *)(v5 + 632) |= 0x100000000uLL;
  }
LABEL_5:
  uint64_t v11 = [(NSString *)self->_albumName copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v12 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v11;

  uint64_t v13 = [(NSString *)self->_trackArtistName copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v14 = *(void **)(v5 + 584);
  *(void *)(v5 + 584) = v13;

  uint64_t v15 = [(NSString *)self->_albumArtistName copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v16 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v15;

  uint64_t v17 = [(NSString *)self->_directorName copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v18 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v17;

  $39A7635802529FA34AF0E2292B825163 v19 = self->_has;
  if ((*(void *)&v19 & 0x2000000000) != 0)
  {
    *(_DWORD *)(v5 + 532) = self->_seasonNumber;
    *(void *)(v5 + 632) |= 0x2000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v19 = self->_has;
    if ((*(_DWORD *)&v19 & 0x2000000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&v19 & 0x1000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_105;
    }
  }
  else if ((*(_DWORD *)&v19 & 0x2000000) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 372) = self->_episodeNumber;
  *(void *)(v5 + 632) |= 0x2000000uLL;
  $39A7635802529FA34AF0E2292B825163 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&v19 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(double *)(v5 + 104) = self->_releaseDate;
  *(void *)(v5 + 632) |= 0x1000uLL;
  $39A7635802529FA34AF0E2292B825163 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&v19 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_106:
  *(_DWORD *)(v5 + 464) = self->_playCount;
  *(void *)(v5 + 632) |= 0x80000000uLL;
  if (*(void *)&self->_has)
  {
LABEL_10:
    *(double *)(v5 + 8) = self->_duration;
    *(void *)(v5 + 632) |= 1uLL;
  }
LABEL_11:
  uint64_t v20 = [(NSString *)self->_localizedContentRating copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v20;

  $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
  if ((*(void *)&v22 & 0x4000000000000) != 0)
  {
    *(unsigned char *)(v5 + 616) = self->_isExplicitItem;
    *(void *)(v5 + 632) |= 0x4000000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
    if ((*(void *)&v22 & 0x800000000) == 0)
    {
LABEL_13:
      if ((*(void *)&v22 & 0x1000000000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_110;
    }
  }
  else if ((*(void *)&v22 & 0x800000000) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v5 + 480) = self->_playlistType;
  *(void *)(v5 + 632) |= 0x800000000uLL;
  $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
  if ((*(void *)&v22 & 0x1000000000) == 0)
  {
LABEL_14:
    if ((*(void *)&v22 & 0x40000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(_DWORD *)(v5 + 528) = self->_radioStationType;
  *(void *)(v5 + 632) |= 0x1000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
  if ((*(void *)&v22 & 0x40000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&v22 & 0x200000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(unsigned char *)(v5 + 608) = self->_artworkAvailable;
  *(void *)(v5 + 632) |= 0x40000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
  if ((*(void *)&v22 & 0x200000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&v22 & 0x1000000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(unsigned char *)(v5 + 611) = self->_infoAvailable;
  *(void *)(v5 + 632) |= 0x200000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
  if ((*(void *)&v22 & 0x1000000000000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v22 & 0x40000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(unsigned char *)(v5 + 626) = self->_languageOptionsAvailable;
  *(void *)(v5 + 632) |= 0x1000000000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x40000000) == 0)
  {
LABEL_18:
    if ((*(void *)&v22 & 0x2000000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(_DWORD *)(v5 + 440) = self->_numberOfSections;
  *(void *)(v5 + 632) |= 0x40000000uLL;
  $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
  if ((*(void *)&v22 & 0x2000000000000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v22 & 0x1000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(unsigned char *)(v5 + 627) = self->_lyricsAvailable;
  *(void *)(v5 + 632) |= 0x2000000000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x1000000) == 0)
  {
LABEL_20:
    if ((*(void *)&v22 & 0x800000000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(_DWORD *)(v5 + 368) = self->_editingStyleFlags;
  *(void *)(v5 + 632) |= 0x1000000uLL;
  $39A7635802529FA34AF0E2292B825163 v22 = self->_has;
  if ((*(void *)&v22 & 0x800000000000000) == 0)
  {
LABEL_21:
    if ((*(void *)&v22 & 0x2000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_117:
  *(unsigned char *)(v5 + 625) = self->_isStreamingContent;
  *(void *)(v5 + 632) |= 0x800000000000000uLL;
  if ((*(void *)&self->_has & 0x2000000000000) != 0)
  {
LABEL_22:
    *(unsigned char *)(v5 + 615) = self->_isCurrentlyPlaying;
    *(void *)(v5 + 632) |= 0x2000000000000uLL;
  }
LABEL_23:
  uint64_t v23 = [(NSString *)self->_collectionIdentifier copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v24 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v23;

  uint64_t v25 = [(NSString *)self->_profileIdentifier copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v26 = *(void **)(v5 + 496);
  *(void *)(v5 + 496) = v25;

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *(double *)(v5 + 120) = self->_startTime;
    *(void *)(v5 + 632) |= 0x4000uLL;
  }
  uint64_t v27 = [(NSString *)self->_artworkMIMEType copyWithZone:a3];
  long long v28 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v27;

  uint64_t v29 = [(NSString *)self->_assetURLString copyWithZone:a3];
  long long v30 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v29;

  uint64_t v31 = [(NSString *)self->_composer copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v32 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v31;

  $39A7635802529FA34AF0E2292B825163 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 344) = self->_discNumber;
    *(void *)(v5 + 632) |= 0x200000uLL;
    $39A7635802529FA34AF0E2292B825163 v33 = self->_has;
  }
  if ((*(unsigned char *)&v33 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_elapsedTime;
    *(void *)(v5 + 632) |= 2uLL;
  }
  uint64_t v34 = [(NSString *)self->_genre copyWithZone:a3];
  v35 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v34;

  $39A7635802529FA34AF0E2292B825163 v36 = self->_has;
  if ((*(void *)&v36 & 0x800000000000) != 0)
  {
    *(unsigned char *)(v5 + 613) = self->_isAlwaysLive;
    *(void *)(v5 + 632) |= 0x800000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v36 = self->_has;
    if ((*(void *)&v36 & 0x200000000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v36 & 0x80000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_121;
    }
  }
  else if ((*(void *)&v36 & 0x200000000) == 0)
  {
    goto LABEL_31;
  }
  *(float *)(v5 + 472) = self->_playbackRate;
  *(void *)(v5 + 632) |= 0x200000000uLL;
  $39A7635802529FA34AF0E2292B825163 v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x80000) == 0)
  {
LABEL_32:
    if ((*(void *)&v36 & 0x8000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_122;
  }
LABEL_121:
  *(_DWORD *)(v5 + 264) = self->_chapterCount;
  *(void *)(v5 + 632) |= 0x80000uLL;
  $39A7635802529FA34AF0E2292B825163 v36 = self->_has;
  if ((*(void *)&v36 & 0x8000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&v36 & 0x10000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_123;
  }
LABEL_122:
  *(_DWORD *)(v5 + 576) = self->_totalDiscCount;
  *(void *)(v5 + 632) |= 0x8000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v36 = self->_has;
  if ((*(void *)&v36 & 0x10000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&v36 & 0x20000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_123:
  *(_DWORD *)(v5 + 580) = self->_totalTrackCount;
  *(void *)(v5 + 632) |= 0x10000000000uLL;
  if ((*(void *)&self->_has & 0x20000000000) != 0)
  {
LABEL_35:
    *(_DWORD *)(v5 + 592) = self->_trackNumber;
    *(void *)(v5 + 632) |= 0x20000000000uLL;
  }
LABEL_36:
  uint64_t v37 = [(NSString *)self->_contentIdentifier copyWithZone:a3];
  v38 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v37;

  $39A7635802529FA34AF0E2292B825163 v39 = self->_has;
  if ((*(void *)&v39 & 0x200000000000000) != 0)
  {
    *(unsigned char *)(v5 + 623) = self->_isSharable;
    *(void *)(v5 + 632) |= 0x200000000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v39 = self->_has;
    if ((*(void *)&v39 & 0x20000000000000) == 0)
    {
LABEL_38:
      if ((*(void *)&v39 & 0x10000000000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_127;
    }
  }
  else if ((*(void *)&v39 & 0x20000000000000) == 0)
  {
    goto LABEL_38;
  }
  *(unsigned char *)(v5 + 619) = self->_isLiked;
  *(void *)(v5 + 632) |= 0x20000000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v39 = self->_has;
  if ((*(void *)&v39 & 0x10000000000000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v39 & 0x800) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_127:
  *(unsigned char *)(v5 + 618) = self->_isInWishList;
  *(void *)(v5 + 632) |= 0x10000000000000uLL;
  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_40:
    *(void *)(v5 + 96) = self->_radioStationIdentifier;
    *(void *)(v5 + 632) |= 0x800uLL;
  }
LABEL_41:
  uint64_t v40 = [(NSString *)self->_radioStationName copyWithZone:a3];
  v41 = *(void **)(v5 + 512);
  *(void *)(v5 + 512) = v40;

  uint64_t v42 = [(NSString *)self->_radioStationString copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v43 = *(void **)(v5 + 520);
  *(void *)(v5 + 520) = v42;

  $39A7635802529FA34AF0E2292B825163 v44 = self->_has;
  if ((*(unsigned char *)&v44 & 0x40) != 0)
  {
    *(void *)(v5 + 56) = self->_iTunesStoreIdentifier;
    *(void *)(v5 + 632) |= 0x40uLL;
    $39A7635802529FA34AF0E2292B825163 v44 = self->_has;
    if ((*(unsigned char *)&v44 & 0x80) == 0)
    {
LABEL_43:
      if ((*(unsigned char *)&v44 & 0x20) == 0) {
        goto LABEL_44;
      }
      goto LABEL_131;
    }
  }
  else if ((*(unsigned char *)&v44 & 0x80) == 0)
  {
    goto LABEL_43;
  }
  *(void *)(v5 + 64) = self->_iTunesStoreSubscriptionIdentifier;
  *(void *)(v5 + 632) |= 0x80uLL;
  $39A7635802529FA34AF0E2292B825163 v44 = self->_has;
  if ((*(unsigned char *)&v44 & 0x20) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v44 & 0x10) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_131:
  *(void *)(v5 + 48) = self->_iTunesStoreArtistIdentifier;
  *(void *)(v5 + 632) |= 0x20uLL;
  if ((*(void *)&self->_has & 0x10) != 0)
  {
LABEL_45:
    *(void *)(v5 + 40) = self->_iTunesStoreAlbumIdentifier;
    *(void *)(v5 + 632) |= 0x10uLL;
  }
LABEL_46:
  uint64_t v45 = [(NSData *)self->_purchaseInfoData copyWithZone:a3];
  v46 = *(void **)(v5 + 504);
  *(void *)(v5 + 504) = v45;

  $39A7635802529FA34AF0E2292B825163 v47 = self->_has;
  if ((*(_DWORD *)&v47 & 0x100000) != 0)
  {
    *(float *)(v5 + 320) = self->_defaultPlaybackRate;
    *(void *)(v5 + 632) |= 0x100000uLL;
    $39A7635802529FA34AF0E2292B825163 v47 = self->_has;
    if ((*(_DWORD *)&v47 & 0x800000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v47 & 0x400000) == 0) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_DWORD *)&v47 & 0x800000) == 0)
  {
    goto LABEL_48;
  }
  *(_DWORD *)(v5 + 352) = self->_downloadState;
  *(void *)(v5 + 632) |= 0x800000uLL;
  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_49:
    *(float *)(v5 + 348) = self->_downloadProgress;
    *(void *)(v5 + 632) |= 0x400000uLL;
  }
LABEL_50:
  uint64_t v48 = [(NSData *)self->_appMetricsData copyWithZone:a3];
  v49 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v48;

  uint64_t v50 = [(NSString *)self->_seriesName copyWithZone:a3];
  v51 = *(void **)(v5 + 536);
  *(void *)(v5 + 536) = v50;

  $39A7635802529FA34AF0E2292B825163 v52 = self->_has;
  if ((*(_DWORD *)&v52 & 0x20000000) != 0)
  {
    *(_DWORD *)(v5 + 428) = self->_mediaType;
    *(void *)(v5 + 632) |= 0x20000000uLL;
    $39A7635802529FA34AF0E2292B825163 v52 = self->_has;
  }
  if ((*(_DWORD *)&v52 & 0x10000000) != 0)
  {
    *(_DWORD *)(v5 + 424) = self->_mediaSubType;
    *(void *)(v5 + 632) |= 0x10000000uLL;
  }
  uint64_t v53 = [(NSData *)self->_nowPlayingInfoData copyWithZone:a3];
  v54 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = v53;

  uint64_t v55 = [(NSData *)self->_userInfoData copyWithZone:a3];
  v56 = *(void **)(v5 + 600);
  *(void *)(v5 + 600) = v55;

  if ((*((unsigned char *)&self->_has + 7) & 4) != 0)
  {
    *(unsigned char *)(v5 + 624) = self->_isSteerable;
    *(void *)(v5 + 632) |= 0x400000000000000uLL;
  }
  uint64_t v57 = [(NSString *)self->_artworkURL copyWithZone:a3];
  v58 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v57;

  uint64_t v59 = [(NSString *)self->_lyricsURL copyWithZone:a3];
  v60 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v59;

  uint64_t v61 = [(NSData *)self->_deviceSpecificUserInfoData copyWithZone:a3];
  v62 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v61;

  uint64_t v63 = [(NSData *)self->_collectionInfoData copyWithZone:a3];
  $39A7635802529FA34AF0E2292B825163 v64 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v63;

  $39A7635802529FA34AF0E2292B825163 v65 = self->_has;
  if ((*(unsigned char *)&v65 & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_elapsedTimeTimestamp;
    *(void *)(v5 + 632) |= 4uLL;
    $39A7635802529FA34AF0E2292B825163 v65 = self->_has;
  }
  if ((*(_WORD *)&v65 & 0x100) != 0)
  {
    *(double *)(v5 + 72) = self->_inferredTimestamp;
    *(void *)(v5 + 632) |= 0x100uLL;
  }
  uint64_t v66 = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  v67 = *(void **)(v5 + 544);
  *(void *)(v5 + 544) = v66;

  $39A7635802529FA34AF0E2292B825163 v68 = self->_has;
  if ((*(_DWORD *)&v68 & 0x40000) != 0)
  {
    *(_DWORD *)(v5 + 196) = self->_artworkDataWidthDeprecated;
    *(void *)(v5 + 632) |= 0x40000uLL;
    $39A7635802529FA34AF0E2292B825163 v68 = self->_has;
  }
  if ((*(_DWORD *)&v68 & 0x20000) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_artworkDataHeightDeprecated;
    *(void *)(v5 + 632) |= 0x20000uLL;
  }
  uint64_t v69 = [(NSData *)self->_currentPlaybackDateData copyWithZone:a3];
  v70 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v69;

  uint64_t v71 = [(NSString *)self->_artworkIdentifier copyWithZone:a3];
  v72 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v71;

  if ((*((unsigned char *)&self->_has + 6) & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 620) = self->_isLoading;
    *(void *)(v5 + 632) |= 0x40000000000000uLL;
  }
  uint64_t v73 = [(NSData *)self->_artworkURLTemplatesData copyWithZone:a3];
  v74 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v73;

  $39A7635802529FA34AF0E2292B825163 v75 = self->_has;
  if ((*(_WORD *)&v75 & 0x200) != 0)
  {
    *(void *)(v5 + 80) = self->_legacyUniqueIdentifier;
    *(void *)(v5 + 632) |= 0x200uLL;
    $39A7635802529FA34AF0E2292B825163 v75 = self->_has;
  }
  if ((*(_DWORD *)&v75 & 0x4000000) != 0)
  {
    *(_DWORD *)(v5 + 376) = self->_episodeType;
    *(void *)(v5 + 632) |= 0x4000000uLL;
  }
  uint64_t v76 = [(NSString *)self->_artworkFileURL copyWithZone:a3];
  v77 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v76;

  uint64_t v78 = [(NSString *)self->_brandIdentifier copyWithZone:a3];
  v79 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v78;

  uint64_t v80 = [(NSString *)self->_localizedDurationString copyWithZone:a3];
  v81 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v80;

  uint64_t v82 = [(NSString *)self->_albumYear copyWithZone:a3];
  v83 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v82;

  $39A7635802529FA34AF0E2292B825163 v84 = self->_has;
  if ((*(void *)&v84 & 0x4000000000) != 0)
  {
    *(_DWORD *)(v5 + 552) = self->_songTraits;
    *(void *)(v5 + 632) |= 0x4000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v84 = self->_has;
    if ((*(_DWORD *)&v84 & 0x10000) == 0)
    {
LABEL_72:
      if ((*(void *)&v84 & 0x400000000) == 0) {
        goto LABEL_74;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v84 & 0x10000) == 0)
  {
    goto LABEL_72;
  }
  *(_DWORD *)(v5 + 160) = self->_albumTraits;
  *(void *)(v5 + 632) |= 0x10000uLL;
  if ((*(void *)&self->_has & 0x400000000) != 0)
  {
LABEL_73:
    *(_DWORD *)(v5 + 476) = self->_playlistTraits;
    *(void *)(v5 + 632) |= 0x400000000uLL;
  }
LABEL_74:
  id v85 = [(_MRAudioFormatProtobuf *)self->_preferredFormat copyWithZone:a3];
  v86 = *(void **)(v5 + 488);
  *(void *)(v5 + 488) = v85;

  id v87 = [(_MRAudioFormatProtobuf *)self->_activeFormat copyWithZone:a3];
  v88 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v87;

  $39A7635802529FA34AF0E2292B825163 v89 = self->_has;
  if ((*(_WORD *)&v89 & 0x8000) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_activeFormatJustification;
    *(void *)(v5 + 632) |= 0x8000uLL;
    $39A7635802529FA34AF0E2292B825163 v89 = self->_has;
  }
  if ((*(_DWORD *)&v89 & 0x8000000) != 0)
  {
    *(_DWORD *)(v5 + 380) = self->_formatTierPreference;
    *(void *)(v5 + 632) |= 0x8000000uLL;
  }
  id v90 = [(_MRAudioRouteProtobuf *)self->_audioRoute copyWithZone:a3];
  v91 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v90;

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v92 = self->_alternativeFormats;
  uint64_t v93 = [(NSMutableArray *)v92 countByEnumeratingWithState:&v113 objects:v117 count:16];
  if (v93)
  {
    uint64_t v94 = v93;
    uint64_t v95 = *(void *)v114;
    do
    {
      uint64_t v96 = 0;
      do
      {
        if (*(void *)v114 != v95) {
          objc_enumerationMutation(v92);
        }
        v97 = objc_msgSend(*(id *)(*((void *)&v113 + 1) + 8 * v96), "copyWithZone:", a3, (void)v113);
        [(id)v5 addAlternativeFormats:v97];

        ++v96;
      }
      while (v94 != v96);
      uint64_t v94 = [(NSMutableArray *)v92 countByEnumeratingWithState:&v113 objects:v117 count:16];
    }
    while (v94);
  }

  $39A7635802529FA34AF0E2292B825163 v98 = self->_has;
  if ((*(void *)&v98 & 0x400000000000) != 0)
  {
    *(unsigned char *)(v5 + 612) = self->_isAdvertisement;
    *(void *)(v5 + 632) |= 0x400000000000uLL;
    $39A7635802529FA34AF0E2292B825163 v98 = self->_has;
  }
  if ((*(void *)&v98 & 0x100000000000) != 0)
  {
    *(unsigned char *)(v5 + 610) = self->_hasAlternativeFormats;
    *(void *)(v5 + 632) |= 0x100000000000uLL;
  }
  uint64_t v99 = -[NSString copyWithZone:](self->_participantName, "copyWithZone:", a3, (void)v113);
  v100 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v99;

  uint64_t v101 = [(NSString *)self->_participantIdentifier copyWithZone:a3];
  v102 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v101;

  uint64_t v103 = [(NSString *)self->_classicalWork copyWithZone:a3];
  v104 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v103;

  $39A7635802529FA34AF0E2292B825163 v105 = self->_has;
  if ((*(_WORD *)&v105 & 0x2000) != 0)
  {
    *(void *)(v5 + 112) = self->_reportingAdamID;
    *(void *)(v5 + 632) |= 0x2000uLL;
    $39A7635802529FA34AF0E2292B825163 v105 = self->_has;
    if ((*(_WORD *)&v105 & 0x400) == 0)
    {
LABEL_91:
      if ((*(unsigned char *)&v105 & 8) == 0) {
        goto LABEL_93;
      }
      goto LABEL_92;
    }
  }
  else if ((*(_WORD *)&v105 & 0x400) == 0)
  {
    goto LABEL_91;
  }
  *(void *)(v5 + 88) = self->_lyricsAdamID;
  *(void *)(v5 + 632) |= 0x400uLL;
  if ((*(void *)&self->_has & 8) != 0)
  {
LABEL_92:
    *(void *)(v5 + 32) = self->_iTunesStoreAlbumArtistIdentifier;
    *(void *)(v5 + 632) |= 8uLL;
  }
LABEL_93:
  uint64_t v106 = [(NSString *)self->_durationStringLocalizationKey copyWithZone:a3];
  v107 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v106;

  if (*((unsigned char *)&self->_has + 7))
  {
    *(unsigned char *)(v5 + 622) = self->_isResolvableParticipant;
    *(void *)(v5 + 632) |= 0x100000000000000uLL;
  }
  uint64_t v108 = [(NSString *)self->_internationalStandardRecordingCode copyWithZone:a3];
  v109 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v108;

  $39A7635802529FA34AF0E2292B825163 v110 = self->_has;
  if ((*(void *)&v110 & 0x8000000000000) == 0)
  {
    if ((*(void *)&v110 & 0x80000000000) == 0) {
      goto LABEL_97;
    }
LABEL_143:
    *(unsigned char *)(v5 + 609) = self->_excludeFromSuggestions;
    *(void *)(v5 + 632) |= 0x80000000000uLL;
    if ((*(void *)&self->_has & 0x4000000000000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
  *(unsigned char *)(v5 + 617) = self->_isInTransition;
  *(void *)(v5 + 632) |= 0x8000000000000uLL;
  $39A7635802529FA34AF0E2292B825163 v110 = self->_has;
  if ((*(void *)&v110 & 0x80000000000) != 0) {
    goto LABEL_143;
  }
LABEL_97:
  if ((*(void *)&v110 & 0x4000000000000000) != 0)
  {
LABEL_98:
    *(unsigned char *)(v5 + 628) = self->_transcriptAlignmentsAvailable;
    *(void *)(v5 + 632) |= 0x4000000000000000uLL;
  }
LABEL_99:
  id v111 = (id)v5;

  return v111;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_469;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 71))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_469;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 70))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 has = self->_has;
  uint64_t v8 = *((void *)v4 + 79);
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    if ((v8 & 0x1000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isContainer)
    {
      if (!*((unsigned char *)v4 + 614)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 614))
    {
      goto LABEL_469;
    }
  }
  else if ((v8 & 0x1000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
    if ((v8 & 0x80000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isPlayable)
    {
      if (!*((unsigned char *)v4 + 621)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 621))
    {
      goto LABEL_469;
    }
  }
  else if ((v8 & 0x80000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v8 & 0x100000000) == 0 || self->_playbackProgress != *((float *)v4 + 117)) {
      goto LABEL_469;
    }
  }
  else if ((v8 & 0x100000000) != 0)
  {
    goto LABEL_469;
  }
  albumName = self->_albumName;
  if ((unint64_t)albumName | *((void *)v4 + 19) && !-[NSString isEqual:](albumName, "isEqual:")) {
    goto LABEL_469;
  }
  trackArtistName = self->_trackArtistName;
  if ((unint64_t)trackArtistName | *((void *)v4 + 73))
  {
    if (!-[NSString isEqual:](trackArtistName, "isEqual:")) {
      goto LABEL_469;
    }
  }
  albumArtistName = self->_albumArtistName;
  if ((unint64_t)albumArtistName | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](albumArtistName, "isEqual:")) {
      goto LABEL_469;
    }
  }
  directorName = self->_directorName;
  if ((unint64_t)directorName | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](directorName, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v13 = self->_has;
  uint64_t v14 = *((void *)v4 + 79);
  if ((*(void *)&v13 & 0x2000000000) != 0)
  {
    if ((v14 & 0x2000000000) == 0 || self->_seasonNumber != *((_DWORD *)v4 + 133)) {
      goto LABEL_469;
    }
  }
  else if ((v14 & 0x2000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v13 & 0x2000000) != 0)
  {
    if ((v14 & 0x2000000) == 0 || self->_episodeNumber != *((_DWORD *)v4 + 93)) {
      goto LABEL_469;
    }
  }
  else if ((v14 & 0x2000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_releaseDate != *((double *)v4 + 13)) {
      goto LABEL_469;
    }
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v13 & 0x80000000) != 0)
  {
    if ((v14 & 0x80000000) == 0 || self->_playCount != *((_DWORD *)v4 + 116)) {
      goto LABEL_469;
    }
  }
  else if ((v14 & 0x80000000) != 0)
  {
    goto LABEL_469;
  }
  if (*(unsigned char *)&v13)
  {
    if ((v14 & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_469;
    }
  }
  else if (v14)
  {
    goto LABEL_469;
  }
  localizedContentRating = self->_localizedContentRating;
  if ((unint64_t)localizedContentRating | *((void *)v4 + 50))
  {
    if (!-[NSString isEqual:](localizedContentRating, "isEqual:")) {
      goto LABEL_469;
    }
    $39A7635802529FA34AF0E2292B825163 v13 = self->_has;
  }
  uint64_t v16 = *((void *)v4 + 79);
  if ((*(void *)&v13 & 0x4000000000000) != 0)
  {
    if ((v16 & 0x4000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isExplicitItem)
    {
      if (!*((unsigned char *)v4 + 616)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 616))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x4000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v13 & 0x800000000) != 0)
  {
    if ((v16 & 0x800000000) == 0 || self->_playlistType != *((_DWORD *)v4 + 120)) {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x800000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v13 & 0x1000000000) != 0)
  {
    if ((v16 & 0x1000000000) == 0 || self->_radioStationType != *((_DWORD *)v4 + 132)) {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x1000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v13 & 0x40000000000) != 0)
  {
    if ((v16 & 0x40000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_artworkAvailable)
    {
      if (!*((unsigned char *)v4 + 608)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 608))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x40000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v13 & 0x200000000000) != 0)
  {
    if ((v16 & 0x200000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_infoAvailable)
    {
      if (!*((unsigned char *)v4 + 611)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 611))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x200000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v13 & 0x1000000000000000) != 0)
  {
    if ((v16 & 0x1000000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_languageOptionsAvailable)
    {
      if (!*((unsigned char *)v4 + 626)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 626))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x1000000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v13 & 0x40000000) != 0)
  {
    if ((v16 & 0x40000000) == 0 || self->_numberOfSections != *((_DWORD *)v4 + 110)) {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x40000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v13 & 0x2000000000000000) != 0)
  {
    if ((v16 & 0x2000000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_lyricsAvailable)
    {
      if (!*((unsigned char *)v4 + 627)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 627))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x2000000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
  {
    if ((v16 & 0x1000000) == 0 || self->_editingStyleFlags != *((_DWORD *)v4 + 92)) {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x1000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v13 & 0x800000000000000) != 0)
  {
    if ((v16 & 0x800000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isStreamingContent)
    {
      if (!*((unsigned char *)v4 + 625)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 625))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x800000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v13 & 0x2000000000000) != 0)
  {
    if ((v16 & 0x2000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isCurrentlyPlaying)
    {
      if (!*((unsigned char *)v4 + 615)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 615))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x2000000000000) != 0)
  {
    goto LABEL_469;
  }
  collectionIdentifier = self->_collectionIdentifier;
  if ((unint64_t)collectionIdentifier | *((void *)v4 + 35)
    && !-[NSString isEqual:](collectionIdentifier, "isEqual:"))
  {
    goto LABEL_469;
  }
  profileIdentifier = self->_profileIdentifier;
  if ((unint64_t)profileIdentifier | *((void *)v4 + 62))
  {
    if (!-[NSString isEqual:](profileIdentifier, "isEqual:")) {
      goto LABEL_469;
    }
  }
  uint64_t v19 = *((void *)v4 + 79);
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    if ((v19 & 0x4000) == 0 || self->_startTime != *((double *)v4 + 15)) {
      goto LABEL_469;
    }
  }
  else if ((v19 & 0x4000) != 0)
  {
    goto LABEL_469;
  }
  artworkMIMEType = self->_artworkMIMEType;
  if ((unint64_t)artworkMIMEType | *((void *)v4 + 27)
    && !-[NSString isEqual:](artworkMIMEType, "isEqual:"))
  {
    goto LABEL_469;
  }
  assetURLString = self->_assetURLString;
  if ((unint64_t)assetURLString | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](assetURLString, "isEqual:")) {
      goto LABEL_469;
    }
  }
  composer = self->_composer;
  if ((unint64_t)composer | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](composer, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v23 = self->_has;
  uint64_t v24 = *((void *)v4 + 79);
  if ((*(_DWORD *)&v23 & 0x200000) != 0)
  {
    if ((v24 & 0x200000) == 0 || self->_discNumber != *((_DWORD *)v4 + 86)) {
      goto LABEL_469;
    }
  }
  else if ((v24 & 0x200000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(unsigned char *)&v23 & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_elapsedTime != *((double *)v4 + 2)) {
      goto LABEL_469;
    }
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_469;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((void *)v4 + 48))
  {
    if (!-[NSString isEqual:](genre, "isEqual:")) {
      goto LABEL_469;
    }
    $39A7635802529FA34AF0E2292B825163 v23 = self->_has;
  }
  uint64_t v26 = *((void *)v4 + 79);
  if ((*(void *)&v23 & 0x800000000000) != 0)
  {
    if ((v26 & 0x800000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isAlwaysLive)
    {
      if (!*((unsigned char *)v4 + 613)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 613))
    {
      goto LABEL_469;
    }
  }
  else if ((v26 & 0x800000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v23 & 0x200000000) != 0)
  {
    if ((v26 & 0x200000000) == 0 || self->_playbackRate != *((float *)v4 + 118)) {
      goto LABEL_469;
    }
  }
  else if ((v26 & 0x200000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v23 & 0x80000) != 0)
  {
    if ((v26 & 0x80000) == 0 || self->_chapterCount != *((_DWORD *)v4 + 66)) {
      goto LABEL_469;
    }
  }
  else if ((v26 & 0x80000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v23 & 0x8000000000) != 0)
  {
    if ((v26 & 0x8000000000) == 0 || self->_totalDiscCount != *((_DWORD *)v4 + 144)) {
      goto LABEL_469;
    }
  }
  else if ((v26 & 0x8000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v23 & 0x10000000000) != 0)
  {
    if ((v26 & 0x10000000000) == 0 || self->_totalTrackCount != *((_DWORD *)v4 + 145)) {
      goto LABEL_469;
    }
  }
  else if ((v26 & 0x10000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v23 & 0x20000000000) != 0)
  {
    if ((v26 & 0x20000000000) == 0 || self->_trackNumber != *((_DWORD *)v4 + 148)) {
      goto LABEL_469;
    }
  }
  else if ((v26 & 0x20000000000) != 0)
  {
    goto LABEL_469;
  }
  contentIdentifier = self->_contentIdentifier;
  if ((unint64_t)contentIdentifier | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](contentIdentifier, "isEqual:")) {
      goto LABEL_469;
    }
    $39A7635802529FA34AF0E2292B825163 v23 = self->_has;
  }
  uint64_t v28 = *((void *)v4 + 79);
  if ((*(void *)&v23 & 0x200000000000000) != 0)
  {
    if ((v28 & 0x200000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isSharable)
    {
      if (!*((unsigned char *)v4 + 623)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 623))
    {
      goto LABEL_469;
    }
  }
  else if ((v28 & 0x200000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v23 & 0x20000000000000) != 0)
  {
    if ((v28 & 0x20000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isLiked)
    {
      if (!*((unsigned char *)v4 + 619)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 619))
    {
      goto LABEL_469;
    }
  }
  else if ((v28 & 0x20000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v23 & 0x10000000000000) != 0)
  {
    if ((v28 & 0x10000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isInWishList)
    {
      if (!*((unsigned char *)v4 + 618)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 618))
    {
      goto LABEL_469;
    }
  }
  else if ((v28 & 0x10000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_WORD *)&v23 & 0x800) != 0)
  {
    if ((v28 & 0x800) == 0 || self->_radioStationIdentifier != *((void *)v4 + 12)) {
      goto LABEL_469;
    }
  }
  else if ((v28 & 0x800) != 0)
  {
    goto LABEL_469;
  }
  radioStationName = self->_radioStationName;
  if ((unint64_t)radioStationName | *((void *)v4 + 64)
    && !-[NSString isEqual:](radioStationName, "isEqual:"))
  {
    goto LABEL_469;
  }
  radioStationString = self->_radioStationString;
  if ((unint64_t)radioStationString | *((void *)v4 + 65))
  {
    if (!-[NSString isEqual:](radioStationString, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v31 = self->_has;
  uint64_t v32 = *((void *)v4 + 79);
  if ((*(unsigned char *)&v31 & 0x40) != 0)
  {
    if ((v32 & 0x40) == 0 || self->_iTunesStoreIdentifier != *((void *)v4 + 7)) {
      goto LABEL_469;
    }
  }
  else if ((v32 & 0x40) != 0)
  {
    goto LABEL_469;
  }
  if ((*(unsigned char *)&v31 & 0x80) != 0)
  {
    if ((v32 & 0x80) == 0 || self->_iTunesStoreSubscriptionIdentifier != *((void *)v4 + 8)) {
      goto LABEL_469;
    }
  }
  else if ((v32 & 0x80) != 0)
  {
    goto LABEL_469;
  }
  if ((*(unsigned char *)&v31 & 0x20) != 0)
  {
    if ((v32 & 0x20) == 0 || self->_iTunesStoreArtistIdentifier != *((void *)v4 + 6)) {
      goto LABEL_469;
    }
  }
  else if ((v32 & 0x20) != 0)
  {
    goto LABEL_469;
  }
  if ((*(unsigned char *)&v31 & 0x10) != 0)
  {
    if ((v32 & 0x10) == 0 || self->_iTunesStoreAlbumIdentifier != *((void *)v4 + 5)) {
      goto LABEL_469;
    }
  }
  else if ((v32 & 0x10) != 0)
  {
    goto LABEL_469;
  }
  purchaseInfoData = self->_purchaseInfoData;
  if ((unint64_t)purchaseInfoData | *((void *)v4 + 63))
  {
    if (!-[NSData isEqual:](purchaseInfoData, "isEqual:")) {
      goto LABEL_469;
    }
    $39A7635802529FA34AF0E2292B825163 v31 = self->_has;
  }
  uint64_t v34 = *((void *)v4 + 79);
  if ((*(_DWORD *)&v31 & 0x100000) != 0)
  {
    if ((v34 & 0x100000) == 0 || self->_defaultPlaybackRate != *((float *)v4 + 80)) {
      goto LABEL_469;
    }
  }
  else if ((v34 & 0x100000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v31 & 0x800000) != 0)
  {
    if ((v34 & 0x800000) == 0 || self->_downloadState != *((_DWORD *)v4 + 88)) {
      goto LABEL_469;
    }
  }
  else if ((v34 & 0x800000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v31 & 0x400000) != 0)
  {
    if ((v34 & 0x400000) == 0 || self->_downloadProgress != *((float *)v4 + 87)) {
      goto LABEL_469;
    }
  }
  else if ((v34 & 0x400000) != 0)
  {
    goto LABEL_469;
  }
  appMetricsData = self->_appMetricsData;
  if ((unint64_t)appMetricsData | *((void *)v4 + 23)
    && !-[NSData isEqual:](appMetricsData, "isEqual:"))
  {
    goto LABEL_469;
  }
  seriesName = self->_seriesName;
  if ((unint64_t)seriesName | *((void *)v4 + 67))
  {
    if (!-[NSString isEqual:](seriesName, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v37 = self->_has;
  uint64_t v38 = *((void *)v4 + 79);
  if ((*(_DWORD *)&v37 & 0x20000000) != 0)
  {
    if ((v38 & 0x20000000) == 0 || self->_mediaType != *((_DWORD *)v4 + 107)) {
      goto LABEL_469;
    }
  }
  else if ((v38 & 0x20000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v37 & 0x10000000) != 0)
  {
    if ((v38 & 0x10000000) == 0 || self->_mediaSubType != *((_DWORD *)v4 + 106)) {
      goto LABEL_469;
    }
  }
  else if ((v38 & 0x10000000) != 0)
  {
    goto LABEL_469;
  }
  nowPlayingInfoData = self->_nowPlayingInfoData;
  if ((unint64_t)nowPlayingInfoData | *((void *)v4 + 54)
    && !-[NSData isEqual:](nowPlayingInfoData, "isEqual:"))
  {
    goto LABEL_469;
  }
  userInfoData = self->_userInfoData;
  if ((unint64_t)userInfoData | *((void *)v4 + 75))
  {
    if (!-[NSData isEqual:](userInfoData, "isEqual:")) {
      goto LABEL_469;
    }
  }
  uint64_t v41 = *((void *)v4 + 79);
  if ((*((unsigned char *)&self->_has + 7) & 4) != 0)
  {
    if ((v41 & 0x400000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isSteerable)
    {
      if (!*((unsigned char *)v4 + 624)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 624))
    {
      goto LABEL_469;
    }
  }
  else if ((v41 & 0x400000000000000) != 0)
  {
    goto LABEL_469;
  }
  artworkURL = self->_artworkURL;
  if ((unint64_t)artworkURL | *((void *)v4 + 28)
    && !-[NSString isEqual:](artworkURL, "isEqual:"))
  {
    goto LABEL_469;
  }
  lyricsURL = self->_lyricsURL;
  if ((unint64_t)lyricsURL | *((void *)v4 + 52))
  {
    if (!-[NSString isEqual:](lyricsURL, "isEqual:")) {
      goto LABEL_469;
    }
  }
  deviceSpecificUserInfoData = self->_deviceSpecificUserInfoData;
  if ((unint64_t)deviceSpecificUserInfoData | *((void *)v4 + 41))
  {
    if (!-[NSData isEqual:](deviceSpecificUserInfoData, "isEqual:")) {
      goto LABEL_469;
    }
  }
  collectionInfoData = self->_collectionInfoData;
  if ((unint64_t)collectionInfoData | *((void *)v4 + 36))
  {
    if (!-[NSData isEqual:](collectionInfoData, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v46 = self->_has;
  uint64_t v47 = *((void *)v4 + 79);
  if ((*(unsigned char *)&v46 & 4) != 0)
  {
    if ((v47 & 4) == 0 || self->_elapsedTimeTimestamp != *((double *)v4 + 3)) {
      goto LABEL_469;
    }
  }
  else if ((v47 & 4) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_WORD *)&v46 & 0x100) != 0)
  {
    if ((v47 & 0x100) == 0 || self->_inferredTimestamp != *((double *)v4 + 9)) {
      goto LABEL_469;
    }
  }
  else if ((v47 & 0x100) != 0)
  {
    goto LABEL_469;
  }
  serviceIdentifier = self->_serviceIdentifier;
  if ((unint64_t)serviceIdentifier | *((void *)v4 + 68))
  {
    if (!-[NSString isEqual:](serviceIdentifier, "isEqual:")) {
      goto LABEL_469;
    }
    $39A7635802529FA34AF0E2292B825163 v46 = self->_has;
  }
  uint64_t v49 = *((void *)v4 + 79);
  if ((*(_DWORD *)&v46 & 0x40000) != 0)
  {
    if ((v49 & 0x40000) == 0 || self->_artworkDataWidthDeprecated != *((_DWORD *)v4 + 49)) {
      goto LABEL_469;
    }
  }
  else if ((v49 & 0x40000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v46 & 0x20000) != 0)
  {
    if ((v49 & 0x20000) == 0 || self->_artworkDataHeightDeprecated != *((_DWORD *)v4 + 48)) {
      goto LABEL_469;
    }
  }
  else if ((v49 & 0x20000) != 0)
  {
    goto LABEL_469;
  }
  currentPlaybackDateData = self->_currentPlaybackDateData;
  if ((unint64_t)currentPlaybackDateData | *((void *)v4 + 39)
    && !-[NSData isEqual:](currentPlaybackDateData, "isEqual:"))
  {
    goto LABEL_469;
  }
  artworkIdentifier = self->_artworkIdentifier;
  if ((unint64_t)artworkIdentifier | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](artworkIdentifier, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v52 = self->_has;
  uint64_t v53 = *((void *)v4 + 79);
  if ((*(void *)&v52 & 0x40000000000000) != 0)
  {
    if ((v53 & 0x40000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isLoading)
    {
      if (!*((unsigned char *)v4 + 620)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 620))
    {
      goto LABEL_469;
    }
  }
  else if ((v53 & 0x40000000000000) != 0)
  {
    goto LABEL_469;
  }
  artworkURLTemplatesData = self->_artworkURLTemplatesData;
  if ((unint64_t)artworkURLTemplatesData | *((void *)v4 + 29))
  {
    if (!-[NSData isEqual:](artworkURLTemplatesData, "isEqual:")) {
      goto LABEL_469;
    }
    $39A7635802529FA34AF0E2292B825163 v52 = self->_has;
  }
  uint64_t v55 = *((void *)v4 + 79);
  if ((*(_WORD *)&v52 & 0x200) != 0)
  {
    if ((v55 & 0x200) == 0 || self->_legacyUniqueIdentifier != *((void *)v4 + 10)) {
      goto LABEL_469;
    }
  }
  else if ((v55 & 0x200) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v52 & 0x4000000) != 0)
  {
    if ((v55 & 0x4000000) == 0 || self->_episodeType != *((_DWORD *)v4 + 94)) {
      goto LABEL_469;
    }
  }
  else if ((v55 & 0x4000000) != 0)
  {
    goto LABEL_469;
  }
  artworkFileURL = self->_artworkFileURL;
  if ((unint64_t)artworkFileURL | *((void *)v4 + 25)
    && !-[NSString isEqual:](artworkFileURL, "isEqual:"))
  {
    goto LABEL_469;
  }
  brandIdentifier = self->_brandIdentifier;
  if ((unint64_t)brandIdentifier | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](brandIdentifier, "isEqual:")) {
      goto LABEL_469;
    }
  }
  localizedDurationString = self->_localizedDurationString;
  if ((unint64_t)localizedDurationString | *((void *)v4 + 51))
  {
    if (!-[NSString isEqual:](localizedDurationString, "isEqual:")) {
      goto LABEL_469;
    }
  }
  albumYear = self->_albumYear;
  if ((unint64_t)albumYear | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](albumYear, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v60 = self->_has;
  uint64_t v61 = *((void *)v4 + 79);
  if ((*(void *)&v60 & 0x4000000000) != 0)
  {
    if ((v61 & 0x4000000000) == 0 || self->_songTraits != *((_DWORD *)v4 + 138)) {
      goto LABEL_469;
    }
  }
  else if ((v61 & 0x4000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v60 & 0x10000) != 0)
  {
    if ((v61 & 0x10000) == 0 || self->_albumTraits != *((_DWORD *)v4 + 40)) {
      goto LABEL_469;
    }
  }
  else if ((v61 & 0x10000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v60 & 0x400000000) != 0)
  {
    if ((v61 & 0x400000000) == 0 || self->_playlistTraits != *((_DWORD *)v4 + 119)) {
      goto LABEL_469;
    }
  }
  else if ((v61 & 0x400000000) != 0)
  {
    goto LABEL_469;
  }
  preferredFormat = self->_preferredFormat;
  if ((unint64_t)preferredFormat | *((void *)v4 + 61)
    && !-[_MRAudioFormatProtobuf isEqual:](preferredFormat, "isEqual:"))
  {
    goto LABEL_469;
  }
  activeFormat = self->_activeFormat;
  if ((unint64_t)activeFormat | *((void *)v4 + 16))
  {
    if (!-[_MRAudioFormatProtobuf isEqual:](activeFormat, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v64 = self->_has;
  uint64_t v65 = *((void *)v4 + 79);
  if ((*(_WORD *)&v64 & 0x8000) != 0)
  {
    if ((v65 & 0x8000) == 0 || self->_activeFormatJustification != *((_DWORD *)v4 + 34)) {
      goto LABEL_469;
    }
  }
  else if ((v65 & 0x8000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v64 & 0x8000000) != 0)
  {
    if ((v65 & 0x8000000) == 0 || self->_formatTierPreference != *((_DWORD *)v4 + 95)) {
      goto LABEL_469;
    }
  }
  else if ((v65 & 0x8000000) != 0)
  {
    goto LABEL_469;
  }
  audioRoute = self->_audioRoute;
  if ((unint64_t)audioRoute | *((void *)v4 + 31) && !-[_MRAudioRouteProtobuf isEqual:](audioRoute, "isEqual:")) {
    goto LABEL_469;
  }
  alternativeFormats = self->_alternativeFormats;
  if ((unint64_t)alternativeFormats | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](alternativeFormats, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v68 = self->_has;
  uint64_t v69 = *((void *)v4 + 79);
  if ((*(void *)&v68 & 0x400000000000) != 0)
  {
    if ((v69 & 0x400000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isAdvertisement)
    {
      if (!*((unsigned char *)v4 + 612)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 612))
    {
      goto LABEL_469;
    }
  }
  else if ((v69 & 0x400000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v68 & 0x100000000000) != 0)
  {
    if ((v69 & 0x100000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_hasAlternativeFormats)
    {
      if (!*((unsigned char *)v4 + 610)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 610))
    {
      goto LABEL_469;
    }
  }
  else if ((v69 & 0x100000000000) != 0)
  {
    goto LABEL_469;
  }
  participantName = self->_participantName;
  if ((unint64_t)participantName | *((void *)v4 + 57)
    && !-[NSString isEqual:](participantName, "isEqual:"))
  {
    goto LABEL_469;
  }
  participantIdentifier = self->_participantIdentifier;
  if ((unint64_t)participantIdentifier | *((void *)v4 + 56))
  {
    if (!-[NSString isEqual:](participantIdentifier, "isEqual:")) {
      goto LABEL_469;
    }
  }
  classicalWork = self->_classicalWork;
  if ((unint64_t)classicalWork | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](classicalWork, "isEqual:")) {
      goto LABEL_469;
    }
  }
  $39A7635802529FA34AF0E2292B825163 v73 = self->_has;
  uint64_t v74 = *((void *)v4 + 79);
  if ((*(_WORD *)&v73 & 0x2000) != 0)
  {
    if ((v74 & 0x2000) == 0 || self->_reportingAdamID != *((void *)v4 + 14)) {
      goto LABEL_469;
    }
  }
  else if ((v74 & 0x2000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_WORD *)&v73 & 0x400) != 0)
  {
    if ((v74 & 0x400) == 0 || self->_lyricsAdamID != *((void *)v4 + 11)) {
      goto LABEL_469;
    }
  }
  else if ((v74 & 0x400) != 0)
  {
    goto LABEL_469;
  }
  if ((*(unsigned char *)&v73 & 8) != 0)
  {
    if ((v74 & 8) == 0 || self->_iTunesStoreAlbumArtistIdentifier != *((void *)v4 + 4)) {
      goto LABEL_469;
    }
  }
  else if ((v74 & 8) != 0)
  {
    goto LABEL_469;
  }
  durationStringLocalizationKey = self->_durationStringLocalizationKey;
  if ((unint64_t)durationStringLocalizationKey | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](durationStringLocalizationKey, "isEqual:")) {
      goto LABEL_469;
    }
    $39A7635802529FA34AF0E2292B825163 v73 = self->_has;
  }
  uint64_t v76 = *((void *)v4 + 79);
  if ((*(void *)&v73 & 0x100000000000000) != 0)
  {
    if ((v76 & 0x100000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isResolvableParticipant)
    {
      if (!*((unsigned char *)v4 + 622)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 622))
    {
      goto LABEL_469;
    }
  }
  else if ((v76 & 0x100000000000000) != 0)
  {
    goto LABEL_469;
  }
  internationalStandardRecordingCode = self->_internationalStandardRecordingCode;
  if ((unint64_t)internationalStandardRecordingCode | *((void *)v4 + 49))
  {
    if (!-[NSString isEqual:](internationalStandardRecordingCode, "isEqual:")) {
      goto LABEL_469;
    }
    $39A7635802529FA34AF0E2292B825163 v73 = self->_has;
  }
  uint64_t v78 = *((void *)v4 + 79);
  if ((*(void *)&v73 & 0x8000000000000) != 0)
  {
    if ((v78 & 0x8000000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_isInTransition)
    {
      if (!*((unsigned char *)v4 + 617)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 617))
    {
      goto LABEL_469;
    }
  }
  else if ((v78 & 0x8000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v73 & 0x80000000000) != 0)
  {
    if ((v78 & 0x80000000000) == 0) {
      goto LABEL_469;
    }
    if (self->_excludeFromSuggestions)
    {
      if (!*((unsigned char *)v4 + 609)) {
        goto LABEL_469;
      }
    }
    else if (*((unsigned char *)v4 + 609))
    {
      goto LABEL_469;
    }
  }
  else if ((v78 & 0x80000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(void *)&v73 & 0x4000000000000000) != 0)
  {
    if ((v78 & 0x4000000000000000) != 0)
    {
      if (self->_transcriptAlignmentsAvailable)
      {
        if (!*((unsigned char *)v4 + 628)) {
          goto LABEL_469;
        }
      }
      else if (*((unsigned char *)v4 + 628))
      {
        goto LABEL_469;
      }
      BOOL v79 = 1;
      goto LABEL_470;
    }
LABEL_469:
    BOOL v79 = 0;
    goto LABEL_470;
  }
  BOOL v79 = (v78 & 0x4000000000000000) == 0;
LABEL_470:

  return v79;
}

- (unint64_t)hash
{
  NSUInteger v175 = [(NSString *)self->_title hash];
  NSUInteger v174 = [(NSString *)self->_subtitle hash];
  $39A7635802529FA34AF0E2292B825163 has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
    uint64_t v173 = 0;
    if ((*(void *)&has & 0x80000000000000) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v172 = 0;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    goto LABEL_13;
  }
  uint64_t v173 = 2654435761 * self->_isContainer;
  if ((*(void *)&has & 0x80000000000000) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v172 = 2654435761 * self->_isPlayable;
  if ((*(void *)&has & 0x100000000) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float playbackProgress = self->_playbackProgress;
  float v5 = -playbackProgress;
  if (playbackProgress >= 0.0) {
    float v5 = self->_playbackProgress;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_13:
  unint64_t v171 = v8;
  NSUInteger v170 = [(NSString *)self->_albumName hash];
  NSUInteger v169 = [(NSString *)self->_trackArtistName hash];
  NSUInteger v168 = [(NSString *)self->_albumArtistName hash];
  NSUInteger v167 = [(NSString *)self->_directorName hash];
  $39A7635802529FA34AF0E2292B825163 v9 = self->_has;
  if ((*(void *)&v9 & 0x2000000000) == 0)
  {
    uint64_t v166 = 0;
    if ((*(_DWORD *)&v9 & 0x2000000) != 0) {
      goto LABEL_15;
    }
LABEL_21:
    uint64_t v165 = 0;
    if ((*(_WORD *)&v9 & 0x1000) != 0) {
      goto LABEL_16;
    }
LABEL_22:
    unint64_t v14 = 0;
    goto LABEL_25;
  }
  uint64_t v166 = 2654435761 * self->_seasonNumber;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0) {
    goto LABEL_21;
  }
LABEL_15:
  uint64_t v165 = 2654435761 * self->_episodeNumber;
  if ((*(_WORD *)&v9 & 0x1000) == 0) {
    goto LABEL_22;
  }
LABEL_16:
  double releaseDate = self->_releaseDate;
  double v11 = -releaseDate;
  if (releaseDate >= 0.0) {
    double v11 = self->_releaseDate;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_25:
  if ((*(_DWORD *)&v9 & 0x80000000) != 0) {
    uint64_t v163 = 2654435761 * self->_playCount;
  }
  else {
    uint64_t v163 = 0;
  }
  unint64_t v164 = v14;
  if (*(unsigned char *)&v9)
  {
    double duration = self->_duration;
    double v17 = -duration;
    if (duration >= 0.0) {
      double v17 = self->_duration;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  unint64_t v162 = v15;
  NSUInteger v161 = [(NSString *)self->_localizedContentRating hash];
  $39A7635802529FA34AF0E2292B825163 v20 = self->_has;
  if ((*(void *)&v20 & 0x4000000000000) != 0)
  {
    uint64_t v160 = 2654435761 * self->_isExplicitItem;
    if ((*(void *)&v20 & 0x800000000) != 0)
    {
LABEL_38:
      uint64_t v159 = 2654435761 * self->_playlistType;
      if ((*(void *)&v20 & 0x1000000000) != 0) {
        goto LABEL_39;
      }
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v160 = 0;
    if ((*(void *)&v20 & 0x800000000) != 0) {
      goto LABEL_38;
    }
  }
  uint64_t v159 = 0;
  if ((*(void *)&v20 & 0x1000000000) != 0)
  {
LABEL_39:
    uint64_t v158 = 2654435761 * self->_radioStationType;
    if ((*(void *)&v20 & 0x40000000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v158 = 0;
  if ((*(void *)&v20 & 0x40000000000) != 0)
  {
LABEL_40:
    uint64_t v157 = 2654435761 * self->_artworkAvailable;
    if ((*(void *)&v20 & 0x200000000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v157 = 0;
  if ((*(void *)&v20 & 0x200000000000) != 0)
  {
LABEL_41:
    uint64_t v156 = 2654435761 * self->_infoAvailable;
    if ((*(void *)&v20 & 0x1000000000000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v156 = 0;
  if ((*(void *)&v20 & 0x1000000000000000) != 0)
  {
LABEL_42:
    uint64_t v155 = 2654435761 * self->_languageOptionsAvailable;
    if ((*(_DWORD *)&v20 & 0x40000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v155 = 0;
  if ((*(_DWORD *)&v20 & 0x40000000) != 0)
  {
LABEL_43:
    uint64_t v154 = 2654435761 * self->_numberOfSections;
    if ((*(void *)&v20 & 0x2000000000000000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v154 = 0;
  if ((*(void *)&v20 & 0x2000000000000000) != 0)
  {
LABEL_44:
    uint64_t v153 = 2654435761 * self->_lyricsAvailable;
    if ((*(_DWORD *)&v20 & 0x1000000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v153 = 0;
  if ((*(_DWORD *)&v20 & 0x1000000) != 0)
  {
LABEL_45:
    uint64_t v152 = 2654435761 * self->_editingStyleFlags;
    if ((*(void *)&v20 & 0x800000000000000) != 0) {
      goto LABEL_46;
    }
LABEL_57:
    uint64_t v151 = 0;
    if ((*(void *)&v20 & 0x2000000000000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_58;
  }
LABEL_56:
  uint64_t v152 = 0;
  if ((*(void *)&v20 & 0x800000000000000) == 0) {
    goto LABEL_57;
  }
LABEL_46:
  uint64_t v151 = 2654435761 * self->_isStreamingContent;
  if ((*(void *)&v20 & 0x2000000000000) != 0)
  {
LABEL_47:
    uint64_t v150 = 2654435761 * self->_isCurrentlyPlaying;
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v150 = 0;
LABEL_59:
  NSUInteger v149 = [(NSString *)self->_collectionIdentifier hash];
  NSUInteger v148 = [(NSString *)self->_profileIdentifier hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    double startTime = self->_startTime;
    double v23 = -startTime;
    if (startTime >= 0.0) {
      double v23 = self->_startTime;
    }
    long double v24 = floor(v23 + 0.5);
    double v25 = (v23 - v24) * 1.84467441e19;
    unint64_t v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0) {
        v21 += (unint64_t)v25;
      }
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    unint64_t v21 = 0;
  }
  unint64_t v147 = v21;
  NSUInteger v146 = [(NSString *)self->_artworkMIMEType hash];
  NSUInteger v145 = [(NSString *)self->_assetURLString hash];
  NSUInteger v144 = [(NSString *)self->_composer hash];
  $39A7635802529FA34AF0E2292B825163 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x200000) != 0)
  {
    uint64_t v143 = 2654435761 * self->_discNumber;
    if ((*(unsigned char *)&v26 & 2) != 0) {
      goto LABEL_69;
    }
LABEL_74:
    unint64_t v31 = 0;
    goto LABEL_77;
  }
  uint64_t v143 = 0;
  if ((*(unsigned char *)&v26 & 2) == 0) {
    goto LABEL_74;
  }
LABEL_69:
  double elapsedTime = self->_elapsedTime;
  double v28 = -elapsedTime;
  if (elapsedTime >= 0.0) {
    double v28 = self->_elapsedTime;
  }
  long double v29 = floor(v28 + 0.5);
  double v30 = (v28 - v29) * 1.84467441e19;
  unint64_t v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0) {
      v31 += (unint64_t)v30;
    }
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
LABEL_77:
  unint64_t v142 = v31;
  NSUInteger v141 = [(NSString *)self->_genre hash];
  $39A7635802529FA34AF0E2292B825163 v32 = self->_has;
  if ((*(void *)&v32 & 0x800000000000) != 0)
  {
    uint64_t v140 = 2654435761 * self->_isAlwaysLive;
    if ((*(void *)&v32 & 0x200000000) != 0) {
      goto LABEL_79;
    }
LABEL_84:
    unint64_t v37 = 0;
    goto LABEL_87;
  }
  uint64_t v140 = 0;
  if ((*(void *)&v32 & 0x200000000) == 0) {
    goto LABEL_84;
  }
LABEL_79:
  float playbackRate = self->_playbackRate;
  float v34 = -playbackRate;
  if (playbackRate >= 0.0) {
    float v34 = self->_playbackRate;
  }
  float v35 = floorf(v34 + 0.5);
  float v36 = (float)(v34 - v35) * 1.8447e19;
  unint64_t v37 = 2654435761u * (unint64_t)fmodf(v35, 1.8447e19);
  if (v36 >= 0.0)
  {
    if (v36 > 0.0) {
      v37 += (unint64_t)v36;
    }
  }
  else
  {
    v37 -= (unint64_t)fabsf(v36);
  }
LABEL_87:
  if ((*(_DWORD *)&v32 & 0x80000) == 0)
  {
    uint64_t v138 = 0;
    if ((*(void *)&v32 & 0x8000000000) != 0) {
      goto LABEL_89;
    }
LABEL_92:
    uint64_t v137 = 0;
    if ((*(void *)&v32 & 0x10000000000) != 0) {
      goto LABEL_90;
    }
    goto LABEL_93;
  }
  uint64_t v138 = 2654435761 * self->_chapterCount;
  if ((*(void *)&v32 & 0x8000000000) == 0) {
    goto LABEL_92;
  }
LABEL_89:
  uint64_t v137 = 2654435761 * self->_totalDiscCount;
  if ((*(void *)&v32 & 0x10000000000) != 0)
  {
LABEL_90:
    uint64_t v136 = 2654435761 * self->_totalTrackCount;
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v136 = 0;
LABEL_94:
  unint64_t v139 = v37;
  if ((*(void *)&v32 & 0x20000000000) != 0) {
    uint64_t v135 = 2654435761 * self->_trackNumber;
  }
  else {
    uint64_t v135 = 0;
  }
  NSUInteger v134 = [(NSString *)self->_contentIdentifier hash];
  $39A7635802529FA34AF0E2292B825163 v38 = self->_has;
  if ((*(void *)&v38 & 0x200000000000000) != 0)
  {
    uint64_t v133 = 2654435761 * self->_isSharable;
    if ((*(void *)&v38 & 0x20000000000000) != 0)
    {
LABEL_99:
      uint64_t v132 = 2654435761 * self->_isLiked;
      if ((*(void *)&v38 & 0x10000000000000) != 0) {
        goto LABEL_100;
      }
LABEL_104:
      uint64_t v131 = 0;
      if ((*(_WORD *)&v38 & 0x800) != 0) {
        goto LABEL_101;
      }
      goto LABEL_105;
    }
  }
  else
  {
    uint64_t v133 = 0;
    if ((*(void *)&v38 & 0x20000000000000) != 0) {
      goto LABEL_99;
    }
  }
  uint64_t v132 = 0;
  if ((*(void *)&v38 & 0x10000000000000) == 0) {
    goto LABEL_104;
  }
LABEL_100:
  uint64_t v131 = 2654435761 * self->_isInWishList;
  if ((*(_WORD *)&v38 & 0x800) != 0)
  {
LABEL_101:
    uint64_t v130 = 2654435761 * self->_radioStationIdentifier;
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v130 = 0;
LABEL_106:
  NSUInteger v129 = [(NSString *)self->_radioStationName hash];
  NSUInteger v128 = [(NSString *)self->_radioStationString hash];
  $39A7635802529FA34AF0E2292B825163 v39 = self->_has;
  if ((*(unsigned char *)&v39 & 0x40) != 0)
  {
    uint64_t v127 = 2654435761 * self->_iTunesStoreIdentifier;
    if ((*(unsigned char *)&v39 & 0x80) != 0)
    {
LABEL_108:
      uint64_t v126 = 2654435761 * self->_iTunesStoreSubscriptionIdentifier;
      if ((*(unsigned char *)&v39 & 0x20) != 0) {
        goto LABEL_109;
      }
LABEL_113:
      uint64_t v125 = 0;
      if ((*(unsigned char *)&v39 & 0x10) != 0) {
        goto LABEL_110;
      }
      goto LABEL_114;
    }
  }
  else
  {
    uint64_t v127 = 0;
    if ((*(unsigned char *)&v39 & 0x80) != 0) {
      goto LABEL_108;
    }
  }
  uint64_t v126 = 0;
  if ((*(unsigned char *)&v39 & 0x20) == 0) {
    goto LABEL_113;
  }
LABEL_109:
  uint64_t v125 = 2654435761 * self->_iTunesStoreArtistIdentifier;
  if ((*(unsigned char *)&v39 & 0x10) != 0)
  {
LABEL_110:
    uint64_t v124 = 2654435761 * self->_iTunesStoreAlbumIdentifier;
    goto LABEL_115;
  }
LABEL_114:
  uint64_t v124 = 0;
LABEL_115:
  uint64_t v123 = [(NSData *)self->_purchaseInfoData hash];
  $39A7635802529FA34AF0E2292B825163 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x100000) != 0)
  {
    float defaultPlaybackRate = self->_defaultPlaybackRate;
    float v43 = -defaultPlaybackRate;
    if (defaultPlaybackRate >= 0.0) {
      float v43 = self->_defaultPlaybackRate;
    }
    float v44 = floorf(v43 + 0.5);
    float v45 = (float)(v43 - v44) * 1.8447e19;
    unint64_t v41 = 2654435761u * (unint64_t)fmodf(v44, 1.8447e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0) {
        v41 += (unint64_t)v45;
      }
    }
    else
    {
      v41 -= (unint64_t)fabsf(v45);
    }
  }
  else
  {
    unint64_t v41 = 0;
  }
  if ((*(_DWORD *)&v40 & 0x800000) != 0) {
    uint64_t v121 = 2654435761 * self->_downloadState;
  }
  else {
    uint64_t v121 = 0;
  }
  unint64_t v122 = v41;
  if ((*(_DWORD *)&v40 & 0x400000) != 0)
  {
    float downloadProgress = self->_downloadProgress;
    float v48 = -downloadProgress;
    if (downloadProgress >= 0.0) {
      float v48 = self->_downloadProgress;
    }
    float v49 = floorf(v48 + 0.5);
    float v50 = (float)(v48 - v49) * 1.8447e19;
    unint64_t v46 = 2654435761u * (unint64_t)fmodf(v49, 1.8447e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0) {
        v46 += (unint64_t)v50;
      }
    }
    else
    {
      v46 -= (unint64_t)fabsf(v50);
    }
  }
  else
  {
    unint64_t v46 = 0;
  }
  unint64_t v120 = v46;
  uint64_t v119 = [(NSData *)self->_appMetricsData hash];
  NSUInteger v118 = [(NSString *)self->_seriesName hash];
  $39A7635802529FA34AF0E2292B825163 v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x20000000) != 0)
  {
    uint64_t v117 = 2654435761 * self->_mediaType;
    if ((*(_DWORD *)&v51 & 0x10000000) != 0) {
      goto LABEL_136;
    }
  }
  else
  {
    uint64_t v117 = 0;
    if ((*(_DWORD *)&v51 & 0x10000000) != 0)
    {
LABEL_136:
      uint64_t v116 = 2654435761 * self->_mediaSubType;
      goto LABEL_139;
    }
  }
  uint64_t v116 = 0;
LABEL_139:
  uint64_t v115 = [(NSData *)self->_nowPlayingInfoData hash];
  uint64_t v114 = [(NSData *)self->_userInfoData hash];
  if ((*((unsigned char *)&self->_has + 7) & 4) != 0) {
    uint64_t v113 = 2654435761 * self->_isSteerable;
  }
  else {
    uint64_t v113 = 0;
  }
  NSUInteger v112 = [(NSString *)self->_artworkURL hash];
  NSUInteger v111 = [(NSString *)self->_lyricsURL hash];
  uint64_t v110 = [(NSData *)self->_deviceSpecificUserInfoData hash];
  uint64_t v109 = [(NSData *)self->_collectionInfoData hash];
  $39A7635802529FA34AF0E2292B825163 v52 = self->_has;
  if ((*(unsigned char *)&v52 & 4) != 0)
  {
    double elapsedTimeTimestamp = self->_elapsedTimeTimestamp;
    double v55 = -elapsedTimeTimestamp;
    if (elapsedTimeTimestamp >= 0.0) {
      double v55 = self->_elapsedTimeTimestamp;
    }
    long double v56 = floor(v55 + 0.5);
    double v57 = (v55 - v56) * 1.84467441e19;
    unint64_t v53 = 2654435761u * (unint64_t)fmod(v56, 1.84467441e19);
    if (v57 >= 0.0)
    {
      if (v57 > 0.0) {
        v53 += (unint64_t)v57;
      }
    }
    else
    {
      v53 -= (unint64_t)fabs(v57);
    }
  }
  else
  {
    unint64_t v53 = 0;
  }
  unint64_t v108 = v53;
  if ((*(_WORD *)&v52 & 0x100) != 0)
  {
    double inferredTimestamp = self->_inferredTimestamp;
    double v60 = -inferredTimestamp;
    if (inferredTimestamp >= 0.0) {
      double v60 = self->_inferredTimestamp;
    }
    long double v61 = floor(v60 + 0.5);
    double v62 = (v60 - v61) * 1.84467441e19;
    unint64_t v58 = 2654435761u * (unint64_t)fmod(v61, 1.84467441e19);
    if (v62 >= 0.0)
    {
      if (v62 > 0.0) {
        v58 += (unint64_t)v62;
      }
    }
    else
    {
      v58 -= (unint64_t)fabs(v62);
    }
  }
  else
  {
    unint64_t v58 = 0;
  }
  unint64_t v107 = v58;
  NSUInteger v106 = [(NSString *)self->_serviceIdentifier hash];
  $39A7635802529FA34AF0E2292B825163 v63 = self->_has;
  if ((*(_DWORD *)&v63 & 0x40000) != 0)
  {
    uint64_t v105 = 2654435761 * self->_artworkDataWidthDeprecated;
    if ((*(_DWORD *)&v63 & 0x20000) != 0) {
      goto LABEL_160;
    }
  }
  else
  {
    uint64_t v105 = 0;
    if ((*(_DWORD *)&v63 & 0x20000) != 0)
    {
LABEL_160:
      uint64_t v104 = 2654435761 * self->_artworkDataHeightDeprecated;
      goto LABEL_163;
    }
  }
  uint64_t v104 = 0;
LABEL_163:
  uint64_t v103 = [(NSData *)self->_currentPlaybackDateData hash];
  NSUInteger v102 = [(NSString *)self->_artworkIdentifier hash];
  if ((*((unsigned char *)&self->_has + 6) & 0x40) != 0) {
    uint64_t v101 = 2654435761 * self->_isLoading;
  }
  else {
    uint64_t v101 = 0;
  }
  uint64_t v100 = [(NSData *)self->_artworkURLTemplatesData hash];
  $39A7635802529FA34AF0E2292B825163 v64 = self->_has;
  if ((*(_WORD *)&v64 & 0x200) != 0)
  {
    uint64_t v99 = 2654435761 * self->_legacyUniqueIdentifier;
    if ((*(_DWORD *)&v64 & 0x4000000) != 0) {
      goto LABEL_168;
    }
  }
  else
  {
    uint64_t v99 = 0;
    if ((*(_DWORD *)&v64 & 0x4000000) != 0)
    {
LABEL_168:
      uint64_t v98 = 2654435761 * self->_episodeType;
      goto LABEL_171;
    }
  }
  uint64_t v98 = 0;
LABEL_171:
  NSUInteger v97 = [(NSString *)self->_artworkFileURL hash];
  NSUInteger v96 = [(NSString *)self->_brandIdentifier hash];
  NSUInteger v95 = [(NSString *)self->_localizedDurationString hash];
  NSUInteger v94 = [(NSString *)self->_albumYear hash];
  $39A7635802529FA34AF0E2292B825163 v65 = self->_has;
  if ((*(void *)&v65 & 0x4000000000) == 0)
  {
    uint64_t v93 = 0;
    if ((*(_DWORD *)&v65 & 0x10000) != 0) {
      goto LABEL_173;
    }
LABEL_176:
    uint64_t v92 = 0;
    if ((*(void *)&v65 & 0x400000000) != 0) {
      goto LABEL_174;
    }
    goto LABEL_177;
  }
  uint64_t v93 = 2654435761 * self->_songTraits;
  if ((*(_DWORD *)&v65 & 0x10000) == 0) {
    goto LABEL_176;
  }
LABEL_173:
  uint64_t v92 = 2654435761 * self->_albumTraits;
  if ((*(void *)&v65 & 0x400000000) != 0)
  {
LABEL_174:
    uint64_t v91 = 2654435761 * self->_playlistTraits;
    goto LABEL_178;
  }
LABEL_177:
  uint64_t v91 = 0;
LABEL_178:
  unint64_t v90 = [(_MRAudioFormatProtobuf *)self->_preferredFormat hash];
  unint64_t v89 = [(_MRAudioFormatProtobuf *)self->_activeFormat hash];
  $39A7635802529FA34AF0E2292B825163 v66 = self->_has;
  if ((*(_WORD *)&v66 & 0x8000) != 0)
  {
    uint64_t v88 = 2654435761 * self->_activeFormatJustification;
    if ((*(_DWORD *)&v66 & 0x8000000) != 0) {
      goto LABEL_180;
    }
  }
  else
  {
    uint64_t v88 = 0;
    if ((*(_DWORD *)&v66 & 0x8000000) != 0)
    {
LABEL_180:
      uint64_t v87 = 2654435761 * self->_formatTierPreference;
      goto LABEL_183;
    }
  }
  uint64_t v87 = 0;
LABEL_183:
  unint64_t v86 = [(_MRAudioRouteProtobuf *)self->_audioRoute hash];
  uint64_t v85 = [(NSMutableArray *)self->_alternativeFormats hash];
  $39A7635802529FA34AF0E2292B825163 v67 = self->_has;
  if ((*(void *)&v67 & 0x400000000000) != 0)
  {
    uint64_t v84 = 2654435761 * self->_isAdvertisement;
    if ((*(void *)&v67 & 0x100000000000) != 0) {
      goto LABEL_185;
    }
  }
  else
  {
    uint64_t v84 = 0;
    if ((*(void *)&v67 & 0x100000000000) != 0)
    {
LABEL_185:
      uint64_t v83 = 2654435761 * self->_hasAlternativeFormats;
      goto LABEL_188;
    }
  }
  uint64_t v83 = 0;
LABEL_188:
  NSUInteger v82 = [(NSString *)self->_participantName hash];
  NSUInteger v68 = [(NSString *)self->_participantIdentifier hash];
  NSUInteger v69 = [(NSString *)self->_classicalWork hash];
  $39A7635802529FA34AF0E2292B825163 v70 = self->_has;
  if ((*(_WORD *)&v70 & 0x2000) == 0)
  {
    uint64_t v71 = 0;
    if ((*(_WORD *)&v70 & 0x400) != 0) {
      goto LABEL_190;
    }
LABEL_193:
    uint64_t v72 = 0;
    if ((*(unsigned char *)&v70 & 8) != 0) {
      goto LABEL_191;
    }
    goto LABEL_194;
  }
  uint64_t v71 = 2654435761 * self->_reportingAdamID;
  if ((*(_WORD *)&v70 & 0x400) == 0) {
    goto LABEL_193;
  }
LABEL_190:
  uint64_t v72 = 2654435761 * self->_lyricsAdamID;
  if ((*(unsigned char *)&v70 & 8) != 0)
  {
LABEL_191:
    uint64_t v73 = 2654435761 * self->_iTunesStoreAlbumArtistIdentifier;
    goto LABEL_195;
  }
LABEL_194:
  uint64_t v73 = 0;
LABEL_195:
  NSUInteger v74 = [(NSString *)self->_durationStringLocalizationKey hash];
  if (*((unsigned char *)&self->_has + 7)) {
    uint64_t v75 = 2654435761 * self->_isResolvableParticipant;
  }
  else {
    uint64_t v75 = 0;
  }
  NSUInteger v76 = [(NSString *)self->_internationalStandardRecordingCode hash];
  $39A7635802529FA34AF0E2292B825163 v77 = self->_has;
  if ((*(void *)&v77 & 0x8000000000000) == 0)
  {
    uint64_t v78 = 0;
    if ((*(void *)&v77 & 0x80000000000) != 0) {
      goto LABEL_200;
    }
LABEL_203:
    uint64_t v79 = 0;
    if ((*(void *)&v77 & 0x4000000000000000) != 0) {
      goto LABEL_201;
    }
LABEL_204:
    uint64_t v80 = 0;
    return v174 ^ v175 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v68 ^ v69 ^ v71 ^ v72 ^ v73 ^ v74 ^ v75 ^ v76 ^ v78 ^ v79 ^ v80;
  }
  uint64_t v78 = 2654435761 * self->_isInTransition;
  if ((*(void *)&v77 & 0x80000000000) == 0) {
    goto LABEL_203;
  }
LABEL_200:
  uint64_t v79 = 2654435761 * self->_excludeFromSuggestions;
  if ((*(void *)&v77 & 0x4000000000000000) == 0) {
    goto LABEL_204;
  }
LABEL_201:
  uint64_t v80 = 2654435761 * self->_transcriptAlignmentsAvailable;
  return v174 ^ v175 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v68 ^ v69 ^ v71 ^ v72 ^ v73 ^ v74 ^ v75 ^ v76 ^ v78 ^ v79 ^ v80;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 71)) {
    -[_MRContentItemMetadataProtobuf setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 70)) {
    -[_MRContentItemMetadataProtobuf setSubtitle:](self, "setSubtitle:");
  }
  uint64_t v5 = *((void *)v4 + 79);
  if ((v5 & 0x1000000000000) != 0)
  {
    self->_isContainer = *((unsigned char *)v4 + 614);
    *(void *)&self->_has |= 0x1000000000000uLL;
    uint64_t v5 = *((void *)v4 + 79);
    if ((v5 & 0x80000000000000) == 0)
    {
LABEL_7:
      if ((v5 & 0x100000000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((v5 & 0x80000000000000) == 0)
  {
    goto LABEL_7;
  }
  self->_isPlayable = *((unsigned char *)v4 + 621);
  *(void *)&self->_has |= 0x80000000000000uLL;
  if ((*((void *)v4 + 79) & 0x100000000) != 0)
  {
LABEL_8:
    self->_float playbackProgress = *((float *)v4 + 117);
    *(void *)&self->_has |= 0x100000000uLL;
  }
LABEL_9:
  if (*((void *)v4 + 19)) {
    -[_MRContentItemMetadataProtobuf setAlbumName:](self, "setAlbumName:");
  }
  if (*((void *)v4 + 73)) {
    -[_MRContentItemMetadataProtobuf setTrackArtistName:](self, "setTrackArtistName:");
  }
  if (*((void *)v4 + 18)) {
    -[_MRContentItemMetadataProtobuf setAlbumArtistName:](self, "setAlbumArtistName:");
  }
  if (*((void *)v4 + 42)) {
    -[_MRContentItemMetadataProtobuf setDirectorName:](self, "setDirectorName:");
  }
  uint64_t v6 = *((void *)v4 + 79);
  if ((v6 & 0x2000000000) != 0)
  {
    self->_seasonNumber = *((_DWORD *)v4 + 133);
    *(void *)&self->_has |= 0x2000000000uLL;
    uint64_t v6 = *((void *)v4 + 79);
    if ((v6 & 0x2000000) == 0)
    {
LABEL_19:
      if ((v6 & 0x1000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_148;
    }
  }
  else if ((v6 & 0x2000000) == 0)
  {
    goto LABEL_19;
  }
  self->_episodeNumber = *((_DWORD *)v4 + 93);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v6 = *((void *)v4 + 79);
  if ((v6 & 0x1000) == 0)
  {
LABEL_20:
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_149;
  }
LABEL_148:
  self->_double releaseDate = *((double *)v4 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v6 = *((void *)v4 + 79);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_149:
  self->_playCount = *((_DWORD *)v4 + 116);
  *(void *)&self->_has |= 0x80000000uLL;
  if (*((void *)v4 + 79))
  {
LABEL_22:
    self->_double duration = *((double *)v4 + 1);
    *(void *)&self->_has |= 1uLL;
  }
LABEL_23:
  if (*((void *)v4 + 50)) {
    -[_MRContentItemMetadataProtobuf setLocalizedContentRating:](self, "setLocalizedContentRating:");
  }
  uint64_t v7 = *((void *)v4 + 79);
  if ((v7 & 0x4000000000000) != 0)
  {
    self->_isExplicitItem = *((unsigned char *)v4 + 616);
    *(void *)&self->_has |= 0x4000000000000uLL;
    uint64_t v7 = *((void *)v4 + 79);
    if ((v7 & 0x800000000) == 0)
    {
LABEL_27:
      if ((v7 & 0x1000000000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_153;
    }
  }
  else if ((v7 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  self->_playlistType = *((_DWORD *)v4 + 120);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v7 = *((void *)v4 + 79);
  if ((v7 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_154;
  }
LABEL_153:
  self->_radioStationType = *((_DWORD *)v4 + 132);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v7 = *((void *)v4 + 79);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((v7 & 0x200000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_155;
  }
LABEL_154:
  self->_artworkAvailable = *((unsigned char *)v4 + 608);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v7 = *((void *)v4 + 79);
  if ((v7 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((v7 & 0x1000000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_156;
  }
LABEL_155:
  self->_infoAvailable = *((unsigned char *)v4 + 611);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v7 = *((void *)v4 + 79);
  if ((v7 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_157;
  }
LABEL_156:
  self->_languageOptionsAvailable = *((unsigned char *)v4 + 626);
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v7 = *((void *)v4 + 79);
  if ((v7 & 0x40000000) == 0)
  {
LABEL_32:
    if ((v7 & 0x2000000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_158;
  }
LABEL_157:
  self->_numberOfSections = *((_DWORD *)v4 + 110);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v7 = *((void *)v4 + 79);
  if ((v7 & 0x2000000000000000) == 0)
  {
LABEL_33:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_159;
  }
LABEL_158:
  self->_lyricsAvailable = *((unsigned char *)v4 + 627);
  *(void *)&self->_has |= 0x2000000000000000uLL;
  uint64_t v7 = *((void *)v4 + 79);
  if ((v7 & 0x1000000) == 0)
  {
LABEL_34:
    if ((v7 & 0x800000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_160;
  }
LABEL_159:
  self->_editingStyleFlags = *((_DWORD *)v4 + 92);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v7 = *((void *)v4 + 79);
  if ((v7 & 0x800000000000000) == 0)
  {
LABEL_35:
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_160:
  self->_isStreamingContent = *((unsigned char *)v4 + 625);
  *(void *)&self->_has |= 0x800000000000000uLL;
  if ((*((void *)v4 + 79) & 0x2000000000000) != 0)
  {
LABEL_36:
    self->_isCurrentlyPlaying = *((unsigned char *)v4 + 615);
    *(void *)&self->_has |= 0x2000000000000uLL;
  }
LABEL_37:
  if (*((void *)v4 + 35)) {
    -[_MRContentItemMetadataProtobuf setCollectionIdentifier:](self, "setCollectionIdentifier:");
  }
  if (*((void *)v4 + 62)) {
    -[_MRContentItemMetadataProtobuf setProfileIdentifier:](self, "setProfileIdentifier:");
  }
  if ((*((unsigned char *)v4 + 633) & 0x40) != 0)
  {
    self->_double startTime = *((double *)v4 + 15);
    *(void *)&self->_has |= 0x4000uLL;
  }
  if (*((void *)v4 + 27)) {
    -[_MRContentItemMetadataProtobuf setArtworkMIMEType:](self, "setArtworkMIMEType:");
  }
  if (*((void *)v4 + 30)) {
    -[_MRContentItemMetadataProtobuf setAssetURLString:](self, "setAssetURLString:");
  }
  if (*((void *)v4 + 37)) {
    -[_MRContentItemMetadataProtobuf setComposer:](self, "setComposer:");
  }
  uint64_t v8 = *((void *)v4 + 79);
  if ((v8 & 0x200000) != 0)
  {
    self->_discNumber = *((_DWORD *)v4 + 86);
    *(void *)&self->_has |= 0x200000uLL;
    uint64_t v8 = *((void *)v4 + 79);
  }
  if ((v8 & 2) != 0)
  {
    self->_double elapsedTime = *((double *)v4 + 2);
    *(void *)&self->_has |= 2uLL;
  }
  if (*((void *)v4 + 48)) {
    -[_MRContentItemMetadataProtobuf setGenre:](self, "setGenre:");
  }
  uint64_t v9 = *((void *)v4 + 79);
  if ((v9 & 0x800000000000) != 0)
  {
    self->_isAlwaysLive = *((unsigned char *)v4 + 613);
    *(void *)&self->_has |= 0x800000000000uLL;
    uint64_t v9 = *((void *)v4 + 79);
    if ((v9 & 0x200000000) == 0)
    {
LABEL_57:
      if ((v9 & 0x80000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_164;
    }
  }
  else if ((v9 & 0x200000000) == 0)
  {
    goto LABEL_57;
  }
  self->_float playbackRate = *((float *)v4 + 118);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v9 = *((void *)v4 + 79);
  if ((v9 & 0x80000) == 0)
  {
LABEL_58:
    if ((v9 & 0x8000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_165;
  }
LABEL_164:
  self->_chapterCount = *((_DWORD *)v4 + 66);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v9 = *((void *)v4 + 79);
  if ((v9 & 0x8000000000) == 0)
  {
LABEL_59:
    if ((v9 & 0x10000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_166;
  }
LABEL_165:
  self->_totalDiscCount = *((_DWORD *)v4 + 144);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v9 = *((void *)v4 + 79);
  if ((v9 & 0x10000000000) == 0)
  {
LABEL_60:
    if ((v9 & 0x20000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_166:
  self->_totalTrackCount = *((_DWORD *)v4 + 145);
  *(void *)&self->_has |= 0x10000000000uLL;
  if ((*((void *)v4 + 79) & 0x20000000000) != 0)
  {
LABEL_61:
    self->_trackNumber = *((_DWORD *)v4 + 148);
    *(void *)&self->_has |= 0x20000000000uLL;
  }
LABEL_62:
  if (*((void *)v4 + 38)) {
    -[_MRContentItemMetadataProtobuf setContentIdentifier:](self, "setContentIdentifier:");
  }
  uint64_t v10 = *((void *)v4 + 79);
  if ((v10 & 0x200000000000000) != 0)
  {
    self->_isSharable = *((unsigned char *)v4 + 623);
    *(void *)&self->_has |= 0x200000000000000uLL;
    uint64_t v10 = *((void *)v4 + 79);
    if ((v10 & 0x20000000000000) == 0)
    {
LABEL_66:
      if ((v10 & 0x10000000000000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_170;
    }
  }
  else if ((v10 & 0x20000000000000) == 0)
  {
    goto LABEL_66;
  }
  self->_isLiked = *((unsigned char *)v4 + 619);
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v10 = *((void *)v4 + 79);
  if ((v10 & 0x10000000000000) == 0)
  {
LABEL_67:
    if ((v10 & 0x800) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_170:
  self->_isInWishList = *((unsigned char *)v4 + 618);
  *(void *)&self->_has |= 0x10000000000000uLL;
  if ((*((void *)v4 + 79) & 0x800) != 0)
  {
LABEL_68:
    self->_radioStationIdentifier = *((void *)v4 + 12);
    *(void *)&self->_has |= 0x800uLL;
  }
LABEL_69:
  if (*((void *)v4 + 64)) {
    -[_MRContentItemMetadataProtobuf setRadioStationName:](self, "setRadioStationName:");
  }
  if (*((void *)v4 + 65)) {
    -[_MRContentItemMetadataProtobuf setRadioStationString:](self, "setRadioStationString:");
  }
  uint64_t v11 = *((void *)v4 + 79);
  if ((v11 & 0x40) != 0)
  {
    self->_iTunesStoreIdentifier = *((void *)v4 + 7);
    *(void *)&self->_has |= 0x40uLL;
    uint64_t v11 = *((void *)v4 + 79);
    if ((v11 & 0x80) == 0)
    {
LABEL_75:
      if ((v11 & 0x20) == 0) {
        goto LABEL_76;
      }
      goto LABEL_174;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_75;
  }
  self->_iTunesStoreSubscriptionIdentifier = *((void *)v4 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v11 = *((void *)v4 + 79);
  if ((v11 & 0x20) == 0)
  {
LABEL_76:
    if ((v11 & 0x10) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_174:
  self->_iTunesStoreArtistIdentifier = *((void *)v4 + 6);
  *(void *)&self->_has |= 0x20uLL;
  if ((*((void *)v4 + 79) & 0x10) != 0)
  {
LABEL_77:
    self->_iTunesStoreAlbumIdentifier = *((void *)v4 + 5);
    *(void *)&self->_has |= 0x10uLL;
  }
LABEL_78:
  if (*((void *)v4 + 63)) {
    -[_MRContentItemMetadataProtobuf setPurchaseInfoData:](self, "setPurchaseInfoData:");
  }
  uint64_t v12 = *((void *)v4 + 79);
  if ((v12 & 0x100000) != 0)
  {
    self->_float defaultPlaybackRate = *((float *)v4 + 80);
    *(void *)&self->_has |= 0x100000uLL;
    uint64_t v12 = *((void *)v4 + 79);
    if ((v12 & 0x800000) == 0)
    {
LABEL_82:
      if ((v12 & 0x400000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
  }
  else if ((v12 & 0x800000) == 0)
  {
    goto LABEL_82;
  }
  self->_downloadState = *((_DWORD *)v4 + 88);
  *(void *)&self->_has |= 0x800000uLL;
  if ((*((void *)v4 + 79) & 0x400000) != 0)
  {
LABEL_83:
    self->_float downloadProgress = *((float *)v4 + 87);
    *(void *)&self->_has |= 0x400000uLL;
  }
LABEL_84:
  if (*((void *)v4 + 23)) {
    -[_MRContentItemMetadataProtobuf setAppMetricsData:](self, "setAppMetricsData:");
  }
  if (*((void *)v4 + 67)) {
    -[_MRContentItemMetadataProtobuf setSeriesName:](self, "setSeriesName:");
  }
  uint64_t v13 = *((void *)v4 + 79);
  if ((v13 & 0x20000000) != 0)
  {
    self->_mediaType = *((_DWORD *)v4 + 107);
    *(void *)&self->_has |= 0x20000000uLL;
    uint64_t v13 = *((void *)v4 + 79);
  }
  if ((v13 & 0x10000000) != 0)
  {
    self->_mediaSubType = *((_DWORD *)v4 + 106);
    *(void *)&self->_has |= 0x10000000uLL;
  }
  if (*((void *)v4 + 54)) {
    -[_MRContentItemMetadataProtobuf setNowPlayingInfoData:](self, "setNowPlayingInfoData:");
  }
  if (*((void *)v4 + 75)) {
    -[_MRContentItemMetadataProtobuf setUserInfoData:](self, "setUserInfoData:");
  }
  if ((*((unsigned char *)v4 + 639) & 4) != 0)
  {
    self->_isSteerable = *((unsigned char *)v4 + 624);
    *(void *)&self->_has |= 0x400000000000000uLL;
  }
  if (*((void *)v4 + 28)) {
    -[_MRContentItemMetadataProtobuf setArtworkURL:](self, "setArtworkURL:");
  }
  if (*((void *)v4 + 52)) {
    -[_MRContentItemMetadataProtobuf setLyricsURL:](self, "setLyricsURL:");
  }
  if (*((void *)v4 + 41)) {
    -[_MRContentItemMetadataProtobuf setDeviceSpecificUserInfoData:](self, "setDeviceSpecificUserInfoData:");
  }
  if (*((void *)v4 + 36)) {
    -[_MRContentItemMetadataProtobuf setCollectionInfoData:](self, "setCollectionInfoData:");
  }
  uint64_t v14 = *((void *)v4 + 79);
  if ((v14 & 4) != 0)
  {
    self->_double elapsedTimeTimestamp = *((double *)v4 + 3);
    *(void *)&self->_has |= 4uLL;
    uint64_t v14 = *((void *)v4 + 79);
  }
  if ((v14 & 0x100) != 0)
  {
    self->_double inferredTimestamp = *((double *)v4 + 9);
    *(void *)&self->_has |= 0x100uLL;
  }
  if (*((void *)v4 + 68)) {
    -[_MRContentItemMetadataProtobuf setServiceIdentifier:](self, "setServiceIdentifier:");
  }
  uint64_t v15 = *((void *)v4 + 79);
  if ((v15 & 0x40000) != 0)
  {
    self->_artworkDataWidthDeprecated = *((_DWORD *)v4 + 49);
    *(void *)&self->_has |= 0x40000uLL;
    uint64_t v15 = *((void *)v4 + 79);
  }
  if ((v15 & 0x20000) != 0)
  {
    self->_artworkDataHeightDeprecated = *((_DWORD *)v4 + 48);
    *(void *)&self->_has |= 0x20000uLL;
  }
  if (*((void *)v4 + 39)) {
    -[_MRContentItemMetadataProtobuf setCurrentPlaybackDateData:](self, "setCurrentPlaybackDateData:");
  }
  if (*((void *)v4 + 26)) {
    -[_MRContentItemMetadataProtobuf setArtworkIdentifier:](self, "setArtworkIdentifier:");
  }
  if ((*((unsigned char *)v4 + 638) & 0x40) != 0)
  {
    self->_isLoading = *((unsigned char *)v4 + 620);
    *(void *)&self->_has |= 0x40000000000000uLL;
  }
  if (*((void *)v4 + 29)) {
    -[_MRContentItemMetadataProtobuf setArtworkURLTemplatesData:](self, "setArtworkURLTemplatesData:");
  }
  uint64_t v16 = *((void *)v4 + 79);
  if ((v16 & 0x200) != 0)
  {
    self->_legacyUniqueIdentifier = *((void *)v4 + 10);
    *(void *)&self->_has |= 0x200uLL;
    uint64_t v16 = *((void *)v4 + 79);
  }
  if ((v16 & 0x4000000) != 0)
  {
    self->_episodeType = *((_DWORD *)v4 + 94);
    *(void *)&self->_has |= 0x4000000uLL;
  }
  if (*((void *)v4 + 25)) {
    -[_MRContentItemMetadataProtobuf setArtworkFileURL:](self, "setArtworkFileURL:");
  }
  if (*((void *)v4 + 32)) {
    -[_MRContentItemMetadataProtobuf setBrandIdentifier:](self, "setBrandIdentifier:");
  }
  if (*((void *)v4 + 51)) {
    -[_MRContentItemMetadataProtobuf setLocalizedDurationString:](self, "setLocalizedDurationString:");
  }
  if (*((void *)v4 + 21)) {
    -[_MRContentItemMetadataProtobuf setAlbumYear:](self, "setAlbumYear:");
  }
  uint64_t v17 = *((void *)v4 + 79);
  if ((v17 & 0x4000000000) != 0)
  {
    self->_int songTraits = *((_DWORD *)v4 + 138);
    *(void *)&self->_has |= 0x4000000000uLL;
    uint64_t v17 = *((void *)v4 + 79);
    if ((v17 & 0x10000) == 0)
    {
LABEL_138:
      if ((v17 & 0x400000000) == 0) {
        goto LABEL_140;
      }
      goto LABEL_139;
    }
  }
  else if ((v17 & 0x10000) == 0)
  {
    goto LABEL_138;
  }
  self->_int albumTraits = *((_DWORD *)v4 + 40);
  *(void *)&self->_has |= 0x10000uLL;
  if ((*((void *)v4 + 79) & 0x400000000) != 0)
  {
LABEL_139:
    self->_int playlistTraits = *((_DWORD *)v4 + 119);
    *(void *)&self->_has |= 0x400000000uLL;
  }
LABEL_140:
  preferredFormat = self->_preferredFormat;
  uint64_t v19 = *((void *)v4 + 61);
  if (preferredFormat)
  {
    if (v19) {
      -[_MRAudioFormatProtobuf mergeFrom:](preferredFormat, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[_MRContentItemMetadataProtobuf setPreferredFormat:](self, "setPreferredFormat:");
  }
  activeFormat = self->_activeFormat;
  uint64_t v21 = *((void *)v4 + 16);
  if (activeFormat)
  {
    if (v21) {
      -[_MRAudioFormatProtobuf mergeFrom:](activeFormat, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[_MRContentItemMetadataProtobuf setActiveFormat:](self, "setActiveFormat:");
  }
  uint64_t v22 = *((void *)v4 + 79);
  if ((v22 & 0x8000) != 0)
  {
    self->_int activeFormatJustification = *((_DWORD *)v4 + 34);
    *(void *)&self->_has |= 0x8000uLL;
    uint64_t v22 = *((void *)v4 + 79);
  }
  if ((v22 & 0x8000000) != 0)
  {
    self->_int formatTierPreference = *((_DWORD *)v4 + 95);
    *(void *)&self->_has |= 0x8000000uLL;
  }
  audioRoute = self->_audioRoute;
  uint64_t v24 = *((void *)v4 + 31);
  if (audioRoute)
  {
    if (v24) {
      -[_MRAudioRouteProtobuf mergeFrom:](audioRoute, "mergeFrom:");
    }
  }
  else if (v24)
  {
    [(_MRContentItemMetadataProtobuf *)self setAudioRoute:"setAudioRoute:"];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v25 = *((id *)v4 + 22);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        -[_MRContentItemMetadataProtobuf addAlternativeFormats:](self, "addAlternativeFormats:", *(void *)(*((void *)&v33 + 1) + 8 * i), (void)v33);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v27);
  }

  uint64_t v30 = *((void *)v4 + 79);
  if ((v30 & 0x400000000000) != 0)
  {
    self->_isAdvertisement = *((unsigned char *)v4 + 612);
    *(void *)&self->_has |= 0x400000000000uLL;
    uint64_t v30 = *((void *)v4 + 79);
  }
  if ((v30 & 0x100000000000) != 0)
  {
    self->_hasAlternativeFormats = *((unsigned char *)v4 + 610);
    *(void *)&self->_has |= 0x100000000000uLL;
  }
  if (*((void *)v4 + 57)) {
    -[_MRContentItemMetadataProtobuf setParticipantName:](self, "setParticipantName:");
  }
  if (*((void *)v4 + 56)) {
    -[_MRContentItemMetadataProtobuf setParticipantIdentifier:](self, "setParticipantIdentifier:");
  }
  if (*((void *)v4 + 34)) {
    -[_MRContentItemMetadataProtobuf setClassicalWork:](self, "setClassicalWork:");
  }
  uint64_t v31 = *((void *)v4 + 79);
  if ((v31 & 0x2000) != 0)
  {
    self->_reportingAdamID = *((void *)v4 + 14);
    *(void *)&self->_has |= 0x2000uLL;
    uint64_t v31 = *((void *)v4 + 79);
    if ((v31 & 0x400) == 0)
    {
LABEL_217:
      if ((v31 & 8) == 0) {
        goto LABEL_219;
      }
      goto LABEL_218;
    }
  }
  else if ((v31 & 0x400) == 0)
  {
    goto LABEL_217;
  }
  self->_lyricsAdamID = *((void *)v4 + 11);
  *(void *)&self->_has |= 0x400uLL;
  if ((*((void *)v4 + 79) & 8) != 0)
  {
LABEL_218:
    self->_iTunesStoreAlbumArtistIdentifier = *((void *)v4 + 4);
    *(void *)&self->_has |= 8uLL;
  }
LABEL_219:
  if (*((void *)v4 + 45)) {
    -[_MRContentItemMetadataProtobuf setDurationStringLocalizationKey:](self, "setDurationStringLocalizationKey:");
  }
  if (*((unsigned char *)v4 + 639))
  {
    self->_isResolvableParticipant = *((unsigned char *)v4 + 622);
    *(void *)&self->_has |= 0x100000000000000uLL;
  }
  if (*((void *)v4 + 49)) {
    -[_MRContentItemMetadataProtobuf setInternationalStandardRecordingCode:](self, "setInternationalStandardRecordingCode:");
  }
  uint64_t v32 = *((void *)v4 + 79);
  if ((v32 & 0x8000000000000) == 0)
  {
    if ((v32 & 0x80000000000) == 0) {
      goto LABEL_227;
    }
LABEL_234:
    self->_excludeFromSuggestions = *((unsigned char *)v4 + 609);
    *(void *)&self->_has |= 0x80000000000uLL;
    if ((*((void *)v4 + 79) & 0x4000000000000000) == 0) {
      goto LABEL_229;
    }
    goto LABEL_228;
  }
  self->_isInTransition = *((unsigned char *)v4 + 617);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v32 = *((void *)v4 + 79);
  if ((v32 & 0x80000000000) != 0) {
    goto LABEL_234;
  }
LABEL_227:
  if ((v32 & 0x4000000000000000) != 0)
  {
LABEL_228:
    self->_transcriptAlignmentsAvailable = *((unsigned char *)v4 + 628);
    *(void *)&self->_has |= 0x4000000000000000uLL;
  }
LABEL_229:
}

- (double)releaseDate
{
  return self->_releaseDate;
}

- (NSString)assetURLString
{
  return self->_assetURLString;
}

- (NSData)appMetricsData
{
  return self->_appMetricsData;
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (NSString)lyricsURL
{
  return self->_lyricsURL;
}

- (NSData)currentPlaybackDateData
{
  return self->_currentPlaybackDateData;
}

- (NSData)artworkURLTemplatesData
{
  return self->_artworkURLTemplatesData;
}

- (void)setArtworkURLTemplatesData:(id)a3
{
}

- (NSString)artworkFileURL
{
  return self->_artworkFileURL;
}

- (_MRAudioFormatProtobuf)preferredFormat
{
  return self->_preferredFormat;
}

- (_MRAudioFormatProtobuf)activeFormat
{
  return self->_activeFormat;
}

- (_MRAudioRouteProtobuf)audioRoute
{
  return self->_audioRoute;
}

- (NSMutableArray)alternativeFormats
{
  return self->_alternativeFormats;
}

- (void)setAlternativeFormats:(id)a3
{
}

- (NSString)participantName
{
  return self->_participantName;
}

- (NSString)participantIdentifier
{
  return self->_participantIdentifier;
}

@end