@interface SASelfLoggerMWTMusicMetadata
- (BOOL)hasBagWaitTime;
- (BOOL)hasLeaseWaitTime;
- (BOOL)hasLookupWaitTime;
- (BOOL)hasMediaRedownloadWaitTime;
- (BOOL)hasSubscriptionAssetLoadWaitTime;
- (BOOL)hasSuzeLeaseWaitTime;
- (BOOL)isAccountDataReady;
- (BOOL)isAutoPlay;
- (BOOL)isDelegatedPlayback;
- (BOOL)isFirstPlayAfterAppLaunch;
- (BOOL)isHlsKeysReady;
- (BOOL)isInterruptingPlayback;
- (BOOL)isLeaseReady;
- (BOOL)isMiniSinfAvailable;
- (BOOL)isNonDefaultUser;
- (BOOL)isOfflineKeyReady;
- (BOOL)isOnlineKeyReady;
- (BOOL)isPrimaryUser;
- (BOOL)isRemoteSetQueue;
- (BOOL)isSharePlayPlayback;
- (BOOL)isShuffled;
- (BOOL)isStoreBagReady;
- (BOOL)isSuzeLease;
- (BOOL)wasMediaLibraryDatabaseUpgraded;
- (NSString)audioQueueType;
- (NSString)errorResolutionType;
- (SASelfLoggerMWTMusicMetadata)init;
- (int)assetEndPoint;
- (int)assetLocation;
- (int)assetSource;
- (int)endPointType;
- (int)formatCodec;
- (int)formatLayout;
- (int)formatTier;
- (int)musicDomain;
- (int)networkConnectionType;
- (int)prefetchedMetadataSource;
- (int)queueType;
- (int)routeConfiguration;
- (int)routeType;
- (int)streamingContentType;
- (int)subscriptionType;
- (unsigned)cmInitialStartupItemCreationToLtluDurationInMs;
- (unsigned)cmInitialStartupItemCreationToReadyToPlayDurationInMs;
- (unsigned)contentConnectionTlsHandshakeDurationInMs;
- (unsigned)contentFirstSegmentDurationInMs;
- (unsigned)formatBitDepth;
- (unsigned)formatBitrate;
- (unsigned)formatChannels;
- (unsigned)formatLayoutValue;
- (unsigned)formatSampleRate;
- (unsigned)numberOfSpeakers;
- (unsigned)primaryPlaylistConnectionTlsHandshakeDurationInMs;
- (unsigned)primaryPlaylistRequestDurationInMs;
- (unsigned)queueSize;
- (unsigned)subPlaylistConnectionTlsHandshakeDurationInMs;
- (unsigned)subPlaylistRequestDurationInMs;
- (void)setAssetEndPoint:(int)a3;
- (void)setAssetLocation:(int)a3;
- (void)setAssetSource:(int)a3;
- (void)setAudioQueueType:(id)a3;
- (void)setCmInitialStartupItemCreationToLtluDurationInMs:(unsigned int)a3;
- (void)setCmInitialStartupItemCreationToReadyToPlayDurationInMs:(unsigned int)a3;
- (void)setContentConnectionTlsHandshakeDurationInMs:(unsigned int)a3;
- (void)setContentFirstSegmentDurationInMs:(unsigned int)a3;
- (void)setEndPointType:(int)a3;
- (void)setErrorResolutionType:(id)a3;
- (void)setFormatBitDepth:(unsigned int)a3;
- (void)setFormatBitrate:(unsigned int)a3;
- (void)setFormatChannels:(unsigned int)a3;
- (void)setFormatCodec:(int)a3;
- (void)setFormatLayout:(int)a3;
- (void)setFormatLayoutValue:(unsigned int)a3;
- (void)setFormatSampleRate:(unsigned int)a3;
- (void)setFormatTier:(int)a3;
- (void)setHasBagWaitTime:(BOOL)a3;
- (void)setHasLeaseWaitTime:(BOOL)a3;
- (void)setHasLookupWaitTime:(BOOL)a3;
- (void)setHasMediaRedownloadWaitTime:(BOOL)a3;
- (void)setHasSubscriptionAssetLoadWaitTime:(BOOL)a3;
- (void)setHasSuzeLeaseWaitTime:(BOOL)a3;
- (void)setIsAccountDataReady:(BOOL)a3;
- (void)setIsAutoPlay:(BOOL)a3;
- (void)setIsDelegatedPlayback:(BOOL)a3;
- (void)setIsFirstPlayAfterAppLaunch:(BOOL)a3;
- (void)setIsHlsKeysReady:(BOOL)a3;
- (void)setIsInterruptingPlayback:(BOOL)a3;
- (void)setIsLeaseReady:(BOOL)a3;
- (void)setIsMiniSinfAvailable:(BOOL)a3;
- (void)setIsNonDefaultUser:(BOOL)a3;
- (void)setIsOfflineKeyReady:(BOOL)a3;
- (void)setIsOnlineKeyReady:(BOOL)a3;
- (void)setIsPrimaryUser:(BOOL)a3;
- (void)setIsRemoteSetQueue:(BOOL)a3;
- (void)setIsSharePlayPlayback:(BOOL)a3;
- (void)setIsShuffled:(BOOL)a3;
- (void)setIsStoreBagReady:(BOOL)a3;
- (void)setIsSuzeLease:(BOOL)a3;
- (void)setMusicDomain:(int)a3;
- (void)setNetworkConnectionType:(int)a3;
- (void)setNumberOfSpeakers:(unsigned int)a3;
- (void)setPrefetchedMetadataSource:(int)a3;
- (void)setPrimaryPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3;
- (void)setPrimaryPlaylistRequestDurationInMs:(unsigned int)a3;
- (void)setQueueSize:(unsigned int)a3;
- (void)setQueueType:(int)a3;
- (void)setRouteConfiguration:(int)a3;
- (void)setRouteType:(int)a3;
- (void)setStreamingContentType:(int)a3;
- (void)setSubPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3;
- (void)setSubPlaylistRequestDurationInMs:(unsigned int)a3;
- (void)setSubscriptionType:(int)a3;
- (void)setWasMediaLibraryDatabaseUpgraded:(BOOL)a3;
@end

@implementation SASelfLoggerMWTMusicMetadata

- (SASelfLoggerMWTMusicMetadata)init
{
  return (SASelfLoggerMWTMusicMetadata *)SiriAudioSelfLogger.MWTMusicMetadata.init()();
}

- (int)musicDomain
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_musicDomain);
  swift_beginAccess();
  return *v2;
}

- (void)setMusicDomain:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_musicDomain);
  swift_beginAccess();
  int *v4 = a3;
}

- (int)queueType
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_queueType);
  swift_beginAccess();
  return *v2;
}

- (void)setQueueType:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_queueType);
  swift_beginAccess();
  int *v4 = a3;
}

- (unsigned)queueSize
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_queueSize);
  swift_beginAccess();
  return *v2;
}

- (void)setQueueSize:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_queueSize);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (BOOL)isShuffled
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isShuffled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShuffled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isShuffled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int)prefetchedMetadataSource
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_prefetchedMetadataSource);
  swift_beginAccess();
  return *v2;
}

- (void)setPrefetchedMetadataSource:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_prefetchedMetadataSource);
  swift_beginAccess();
  int *v4 = a3;
}

- (int)assetEndPoint
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetEndPoint);
  swift_beginAccess();
  return *v2;
}

- (void)setAssetEndPoint:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetEndPoint);
  swift_beginAccess();
  int *v4 = a3;
}

- (int)streamingContentType
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_streamingContentType);
  swift_beginAccess();
  return *v2;
}

- (void)setStreamingContentType:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_streamingContentType);
  swift_beginAccess();
  int *v4 = a3;
}

- (int)formatCodec
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatCodec);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatCodec:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatCodec);
  swift_beginAccess();
  int *v4 = a3;
}

- (unsigned)formatBitrate
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatBitrate);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatBitrate:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatBitrate);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (unsigned)formatBitDepth
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatBitDepth);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatBitDepth:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatBitDepth);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (unsigned)formatChannels
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatChannels);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatChannels:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatChannels);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (int)formatLayout
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatLayout);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatLayout:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatLayout);
  swift_beginAccess();
  int *v4 = a3;
}

- (unsigned)formatSampleRate
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatSampleRate);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatSampleRate:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatSampleRate);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (int)formatTier
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatTier);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatTier:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatTier);
  swift_beginAccess();
  int *v4 = a3;
}

- (unsigned)numberOfSpeakers
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_numberOfSpeakers);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfSpeakers:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_numberOfSpeakers);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (int)routeConfiguration
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_routeConfiguration);
  swift_beginAccess();
  return *v2;
}

- (void)setRouteConfiguration:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_routeConfiguration);
  swift_beginAccess();
  int *v4 = a3;
}

- (BOOL)isAccountDataReady
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isAccountDataReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAccountDataReady:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isAccountDataReady;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isStoreBagReady
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isStoreBagReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsStoreBagReady:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isStoreBagReady;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isLeaseReady
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isLeaseReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLeaseReady:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isLeaseReady;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isOnlineKeyReady
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isOnlineKeyReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsOnlineKeyReady:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isOnlineKeyReady;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isOfflineKeyReady
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isOfflineKeyReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsOfflineKeyReady:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isOfflineKeyReady;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isHlsKeysReady
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isHlsKeysReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsHlsKeysReady:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isHlsKeysReady;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isInterruptingPlayback
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isInterruptingPlayback;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInterruptingPlayback:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isInterruptingPlayback;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isRemoteSetQueue
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isRemoteSetQueue;
  swift_beginAccess();
  return *v2;
}

- (void)setIsRemoteSetQueue:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isRemoteSetQueue;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isDelegatedPlayback
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isDelegatedPlayback;
  swift_beginAccess();
  return *v2;
}

- (void)setIsDelegatedPlayback:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isDelegatedPlayback;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isNonDefaultUser
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isNonDefaultUser;
  swift_beginAccess();
  return *v2;
}

- (void)setIsNonDefaultUser:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isNonDefaultUser;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isAutoPlay
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isAutoPlay;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAutoPlay:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isAutoPlay;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isFirstPlayAfterAppLaunch
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isFirstPlayAfterAppLaunch;
  swift_beginAccess();
  return *v2;
}

- (void)setIsFirstPlayAfterAppLaunch:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isFirstPlayAfterAppLaunch;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isMiniSinfAvailable
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isMiniSinfAvailable;
  swift_beginAccess();
  return *v2;
}

- (void)setIsMiniSinfAvailable:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isMiniSinfAvailable;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isSharePlayPlayback
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isSharePlayPlayback;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSharePlayPlayback:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isSharePlayPlayback;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isSuzeLease
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isSuzeLease;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSuzeLease:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isSuzeLease;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int)networkConnectionType
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_networkConnectionType);
  swift_beginAccess();
  return *v2;
}

- (void)setNetworkConnectionType:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_networkConnectionType);
  swift_beginAccess();
  int *v4 = a3;
}

- (BOOL)wasMediaLibraryDatabaseUpgraded
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_wasMediaLibraryDatabaseUpgraded;
  swift_beginAccess();
  return *v2;
}

- (void)setWasMediaLibraryDatabaseUpgraded:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_wasMediaLibraryDatabaseUpgraded;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isPrimaryUser
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isPrimaryUser;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isPrimaryUser;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)errorResolutionType
{
  return (NSString *)sub_238097BA8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SASelfLoggerMWTMusicMetadata_errorResolutionType);
}

- (void)setErrorResolutionType:(id)a3
{
}

- (int)endPointType
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_endPointType);
  swift_beginAccess();
  return *v2;
}

- (void)setEndPointType:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_endPointType);
  swift_beginAccess();
  int *v4 = a3;
}

- (int)routeType
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_routeType);
  swift_beginAccess();
  return *v2;
}

- (void)setRouteType:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_routeType);
  swift_beginAccess();
  int *v4 = a3;
}

- (unsigned)formatLayoutValue
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatLayoutValue);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatLayoutValue:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatLayoutValue);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (int)assetSource
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetSource);
  swift_beginAccess();
  return *v2;
}

- (void)setAssetSource:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetSource);
  swift_beginAccess();
  int *v4 = a3;
}

- (int)assetLocation
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setAssetLocation:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetLocation);
  swift_beginAccess();
  int *v4 = a3;
}

- (int)subscriptionType
{
  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subscriptionType);
  swift_beginAccess();
  return *v2;
}

- (void)setSubscriptionType:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subscriptionType);
  swift_beginAccess();
  int *v4 = a3;
}

- (BOOL)hasLookupWaitTime
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasLookupWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasLookupWaitTime:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasLookupWaitTime;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasBagWaitTime
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasBagWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasBagWaitTime:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasBagWaitTime;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasLeaseWaitTime
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasLeaseWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasLeaseWaitTime:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasLeaseWaitTime;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasSuzeLeaseWaitTime
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasSuzeLeaseWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasSuzeLeaseWaitTime:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasSuzeLeaseWaitTime;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasSubscriptionAssetLoadWaitTime
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasSubscriptionAssetLoadWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasSubscriptionAssetLoadWaitTime:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasSubscriptionAssetLoadWaitTime;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasMediaRedownloadWaitTime
{
  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasMediaRedownloadWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasMediaRedownloadWaitTime:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasMediaRedownloadWaitTime;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (unsigned)cmInitialStartupItemCreationToReadyToPlayDurationInMs
{
  v2 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_cmInitialStartupItemCreationToReadyToPlayDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setCmInitialStartupItemCreationToReadyToPlayDurationInMs:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_cmInitialStartupItemCreationToReadyToPlayDurationInMs);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (unsigned)cmInitialStartupItemCreationToLtluDurationInMs
{
  v2 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_cmInitialStartupItemCreationToLtluDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setCmInitialStartupItemCreationToLtluDurationInMs:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_cmInitialStartupItemCreationToLtluDurationInMs);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (unsigned)primaryPlaylistConnectionTlsHandshakeDurationInMs
{
  v2 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_primaryPlaylistConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setPrimaryPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_primaryPlaylistConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (unsigned)primaryPlaylistRequestDurationInMs
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_primaryPlaylistRequestDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setPrimaryPlaylistRequestDurationInMs:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_primaryPlaylistRequestDurationInMs);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (unsigned)subPlaylistConnectionTlsHandshakeDurationInMs
{
  v2 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subPlaylistConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setSubPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subPlaylistConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (unsigned)subPlaylistRequestDurationInMs
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subPlaylistRequestDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setSubPlaylistRequestDurationInMs:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subPlaylistRequestDurationInMs);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (unsigned)contentConnectionTlsHandshakeDurationInMs
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_contentConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setContentConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_contentConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (unsigned)contentFirstSegmentDurationInMs
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_contentFirstSegmentDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setContentFirstSegmentDurationInMs:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_contentFirstSegmentDurationInMs);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (NSString)audioQueueType
{
  return (NSString *)sub_238097BA8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SASelfLoggerMWTMusicMetadata_audioQueueType);
}

- (void)setAudioQueueType:(id)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end