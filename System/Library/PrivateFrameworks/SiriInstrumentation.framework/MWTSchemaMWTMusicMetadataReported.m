@interface MWTSchemaMWTMusicMetadataReported
- (BOOL)hasAssetEndPoint;
- (BOOL)hasAssetLocation;
- (BOOL)hasAssetSource;
- (BOOL)hasAudioQueueType;
- (BOOL)hasBagWaitTime;
- (BOOL)hasCmInitialStartupItemCreationToLtluDurationInMs;
- (BOOL)hasCmInitialStartupItemCreationToReadyToPlayDurationInMs;
- (BOOL)hasContentConnectionTlsHandshakeDurationInMs;
- (BOOL)hasContentFirstSegmentDurationInMs;
- (BOOL)hasEndPointType;
- (BOOL)hasErrorResolutionType;
- (BOOL)hasFormatBitDepth;
- (BOOL)hasFormatBitrate;
- (BOOL)hasFormatChannels;
- (BOOL)hasFormatCodec;
- (BOOL)hasFormatLayout;
- (BOOL)hasFormatLayoutValue;
- (BOOL)hasFormatSampleRate;
- (BOOL)hasFormatTier;
- (BOOL)hasHasBagWaitTime;
- (BOOL)hasHasLeaseWaitTime;
- (BOOL)hasHasLookupWaitTime;
- (BOOL)hasHasMediaRedownloadWaitTime;
- (BOOL)hasHasSubscriptionAssetLoadWaitTime;
- (BOOL)hasHasSuzeLeaseWaitTime;
- (BOOL)hasIsAccountDataReady;
- (BOOL)hasIsAutoPlay;
- (BOOL)hasIsDelegatedPlayback;
- (BOOL)hasIsFirstPlayAfterAppLaunch;
- (BOOL)hasIsHlsKeysReady;
- (BOOL)hasIsInterruptingPlayback;
- (BOOL)hasIsLeaseReady;
- (BOOL)hasIsMiniSinfAvailable;
- (BOOL)hasIsNonDefaultUser;
- (BOOL)hasIsOfflineKeyReady;
- (BOOL)hasIsOnlineKeyReady;
- (BOOL)hasIsPrimaryUser;
- (BOOL)hasIsRemoteSetQueue;
- (BOOL)hasIsSharePlayPlayback;
- (BOOL)hasIsShuffled;
- (BOOL)hasIsStoreBagReady;
- (BOOL)hasIsSuzeLease;
- (BOOL)hasLeaseWaitTime;
- (BOOL)hasLookupWaitTime;
- (BOOL)hasMasterPlaylistConnectionTlsHandshakeDurationInMs;
- (BOOL)hasMasterPlaylistRequestDurationInMs;
- (BOOL)hasMediaRedownloadWaitTime;
- (BOOL)hasMusicDomain;
- (BOOL)hasNetworkConnectionType;
- (BOOL)hasNumberOfSpeakers;
- (BOOL)hasPrefetchedMetadataSource;
- (BOOL)hasQueueSize;
- (BOOL)hasQueueType;
- (BOOL)hasRouteConfiguration;
- (BOOL)hasRouteType;
- (BOOL)hasStreamingContentType;
- (BOOL)hasSubPlaylistConnectionTlsHandshakeDurationInMs;
- (BOOL)hasSubPlaylistRequestDurationInMs;
- (BOOL)hasSubscriptionAssetLoadWaitTime;
- (BOOL)hasSubscriptionType;
- (BOOL)hasSuzeLeaseWaitTime;
- (BOOL)hasWasMediaLibraryDatabaseUpgraded;
- (BOOL)isAccountDataReady;
- (BOOL)isAutoPlay;
- (BOOL)isDelegatedPlayback;
- (BOOL)isEqual:(id)a3;
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
- (BOOL)readFrom:(id)a3;
- (BOOL)wasMediaLibraryDatabaseUpgraded;
- (MWTSchemaMWTMusicMetadataReported)initWithDictionary:(id)a3;
- (MWTSchemaMWTMusicMetadataReported)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)audioQueueType;
- (NSString)errorResolutionType;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
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
- (unint64_t)hash;
- (unsigned)cmInitialStartupItemCreationToLtluDurationInMs;
- (unsigned)cmInitialStartupItemCreationToReadyToPlayDurationInMs;
- (unsigned)contentConnectionTlsHandshakeDurationInMs;
- (unsigned)contentFirstSegmentDurationInMs;
- (unsigned)formatBitDepth;
- (unsigned)formatBitrate;
- (unsigned)formatChannels;
- (unsigned)formatLayoutValue;
- (unsigned)formatSampleRate;
- (unsigned)masterPlaylistConnectionTlsHandshakeDurationInMs;
- (unsigned)masterPlaylistRequestDurationInMs;
- (unsigned)numberOfSpeakers;
- (unsigned)queueSize;
- (unsigned)subPlaylistConnectionTlsHandshakeDurationInMs;
- (unsigned)subPlaylistRequestDurationInMs;
- (void)deleteAssetEndPoint;
- (void)deleteAssetLocation;
- (void)deleteAssetSource;
- (void)deleteAudioQueueType;
- (void)deleteCmInitialStartupItemCreationToLtluDurationInMs;
- (void)deleteCmInitialStartupItemCreationToReadyToPlayDurationInMs;
- (void)deleteContentConnectionTlsHandshakeDurationInMs;
- (void)deleteContentFirstSegmentDurationInMs;
- (void)deleteEndPointType;
- (void)deleteErrorResolutionType;
- (void)deleteFormatBitDepth;
- (void)deleteFormatBitrate;
- (void)deleteFormatChannels;
- (void)deleteFormatCodec;
- (void)deleteFormatLayout;
- (void)deleteFormatLayoutValue;
- (void)deleteFormatSampleRate;
- (void)deleteFormatTier;
- (void)deleteHasBagWaitTime;
- (void)deleteHasLeaseWaitTime;
- (void)deleteHasLookupWaitTime;
- (void)deleteHasMediaRedownloadWaitTime;
- (void)deleteHasSubscriptionAssetLoadWaitTime;
- (void)deleteHasSuzeLeaseWaitTime;
- (void)deleteIsAccountDataReady;
- (void)deleteIsAutoPlay;
- (void)deleteIsDelegatedPlayback;
- (void)deleteIsFirstPlayAfterAppLaunch;
- (void)deleteIsHlsKeysReady;
- (void)deleteIsInterruptingPlayback;
- (void)deleteIsLeaseReady;
- (void)deleteIsMiniSinfAvailable;
- (void)deleteIsNonDefaultUser;
- (void)deleteIsOfflineKeyReady;
- (void)deleteIsOnlineKeyReady;
- (void)deleteIsPrimaryUser;
- (void)deleteIsRemoteSetQueue;
- (void)deleteIsSharePlayPlayback;
- (void)deleteIsShuffled;
- (void)deleteIsStoreBagReady;
- (void)deleteIsSuzeLease;
- (void)deleteMasterPlaylistConnectionTlsHandshakeDurationInMs;
- (void)deleteMasterPlaylistRequestDurationInMs;
- (void)deleteMusicDomain;
- (void)deleteNetworkConnectionType;
- (void)deleteNumberOfSpeakers;
- (void)deletePrefetchedMetadataSource;
- (void)deleteQueueSize;
- (void)deleteQueueType;
- (void)deleteRouteConfiguration;
- (void)deleteRouteType;
- (void)deleteStreamingContentType;
- (void)deleteSubPlaylistConnectionTlsHandshakeDurationInMs;
- (void)deleteSubPlaylistRequestDurationInMs;
- (void)deleteSubscriptionType;
- (void)deleteWasMediaLibraryDatabaseUpgraded;
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
- (void)setHasAssetEndPoint:(BOOL)a3;
- (void)setHasAssetLocation:(BOOL)a3;
- (void)setHasAssetSource:(BOOL)a3;
- (void)setHasAudioQueueType:(BOOL)a3;
- (void)setHasBagWaitTime:(BOOL)a3;
- (void)setHasCmInitialStartupItemCreationToLtluDurationInMs:(BOOL)a3;
- (void)setHasCmInitialStartupItemCreationToReadyToPlayDurationInMs:(BOOL)a3;
- (void)setHasContentConnectionTlsHandshakeDurationInMs:(BOOL)a3;
- (void)setHasContentFirstSegmentDurationInMs:(BOOL)a3;
- (void)setHasEndPointType:(BOOL)a3;
- (void)setHasErrorResolutionType:(BOOL)a3;
- (void)setHasFormatBitDepth:(BOOL)a3;
- (void)setHasFormatBitrate:(BOOL)a3;
- (void)setHasFormatChannels:(BOOL)a3;
- (void)setHasFormatCodec:(BOOL)a3;
- (void)setHasFormatLayout:(BOOL)a3;
- (void)setHasFormatLayoutValue:(BOOL)a3;
- (void)setHasFormatSampleRate:(BOOL)a3;
- (void)setHasFormatTier:(BOOL)a3;
- (void)setHasHasBagWaitTime:(BOOL)a3;
- (void)setHasHasLeaseWaitTime:(BOOL)a3;
- (void)setHasHasLookupWaitTime:(BOOL)a3;
- (void)setHasHasMediaRedownloadWaitTime:(BOOL)a3;
- (void)setHasHasSubscriptionAssetLoadWaitTime:(BOOL)a3;
- (void)setHasHasSuzeLeaseWaitTime:(BOOL)a3;
- (void)setHasIsAccountDataReady:(BOOL)a3;
- (void)setHasIsAutoPlay:(BOOL)a3;
- (void)setHasIsDelegatedPlayback:(BOOL)a3;
- (void)setHasIsFirstPlayAfterAppLaunch:(BOOL)a3;
- (void)setHasIsHlsKeysReady:(BOOL)a3;
- (void)setHasIsInterruptingPlayback:(BOOL)a3;
- (void)setHasIsLeaseReady:(BOOL)a3;
- (void)setHasIsMiniSinfAvailable:(BOOL)a3;
- (void)setHasIsNonDefaultUser:(BOOL)a3;
- (void)setHasIsOfflineKeyReady:(BOOL)a3;
- (void)setHasIsOnlineKeyReady:(BOOL)a3;
- (void)setHasIsPrimaryUser:(BOOL)a3;
- (void)setHasIsRemoteSetQueue:(BOOL)a3;
- (void)setHasIsSharePlayPlayback:(BOOL)a3;
- (void)setHasIsShuffled:(BOOL)a3;
- (void)setHasIsStoreBagReady:(BOOL)a3;
- (void)setHasIsSuzeLease:(BOOL)a3;
- (void)setHasLeaseWaitTime:(BOOL)a3;
- (void)setHasLookupWaitTime:(BOOL)a3;
- (void)setHasMasterPlaylistConnectionTlsHandshakeDurationInMs:(BOOL)a3;
- (void)setHasMasterPlaylistRequestDurationInMs:(BOOL)a3;
- (void)setHasMediaRedownloadWaitTime:(BOOL)a3;
- (void)setHasMusicDomain:(BOOL)a3;
- (void)setHasNetworkConnectionType:(BOOL)a3;
- (void)setHasNumberOfSpeakers:(BOOL)a3;
- (void)setHasPrefetchedMetadataSource:(BOOL)a3;
- (void)setHasQueueSize:(BOOL)a3;
- (void)setHasQueueType:(BOOL)a3;
- (void)setHasRouteConfiguration:(BOOL)a3;
- (void)setHasRouteType:(BOOL)a3;
- (void)setHasStreamingContentType:(BOOL)a3;
- (void)setHasSubPlaylistConnectionTlsHandshakeDurationInMs:(BOOL)a3;
- (void)setHasSubPlaylistRequestDurationInMs:(BOOL)a3;
- (void)setHasSubscriptionAssetLoadWaitTime:(BOOL)a3;
- (void)setHasSubscriptionType:(BOOL)a3;
- (void)setHasSuzeLeaseWaitTime:(BOOL)a3;
- (void)setHasWasMediaLibraryDatabaseUpgraded:(BOOL)a3;
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
- (void)setMasterPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3;
- (void)setMasterPlaylistRequestDurationInMs:(unsigned int)a3;
- (void)setMusicDomain:(int)a3;
- (void)setNetworkConnectionType:(int)a3;
- (void)setNumberOfSpeakers:(unsigned int)a3;
- (void)setPrefetchedMetadataSource:(int)a3;
- (void)setQueueSize:(unsigned int)a3;
- (void)setQueueType:(int)a3;
- (void)setRouteConfiguration:(int)a3;
- (void)setRouteType:(int)a3;
- (void)setStreamingContentType:(int)a3;
- (void)setSubPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3;
- (void)setSubPlaylistRequestDurationInMs:(unsigned int)a3;
- (void)setSubscriptionType:(int)a3;
- (void)setWasMediaLibraryDatabaseUpgraded:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MWTSchemaMWTMusicMetadataReported

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioQueueType, 0);
  objc_storeStrong((id *)&self->_errorResolutionType, 0);
}

- (void)setHasAudioQueueType:(BOOL)a3
{
  self->_hasErrorResolutionType = a3;
}

- (void)setHasErrorResolutionType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 7) = a3;
}

- (void)setAudioQueueType:(id)a3
{
}

- (NSString)audioQueueType
{
  return self->_audioQueueType;
}

- (unsigned)contentFirstSegmentDurationInMs
{
  return self->_contentFirstSegmentDurationInMs;
}

- (unsigned)contentConnectionTlsHandshakeDurationInMs
{
  return self->_contentConnectionTlsHandshakeDurationInMs;
}

- (unsigned)subPlaylistRequestDurationInMs
{
  return self->_subPlaylistRequestDurationInMs;
}

- (unsigned)subPlaylistConnectionTlsHandshakeDurationInMs
{
  return self->_subPlaylistConnectionTlsHandshakeDurationInMs;
}

- (unsigned)masterPlaylistRequestDurationInMs
{
  return self->_masterPlaylistRequestDurationInMs;
}

- (unsigned)masterPlaylistConnectionTlsHandshakeDurationInMs
{
  return self->_masterPlaylistConnectionTlsHandshakeDurationInMs;
}

- (unsigned)cmInitialStartupItemCreationToLtluDurationInMs
{
  return self->_cmInitialStartupItemCreationToLtluDurationInMs;
}

- (unsigned)cmInitialStartupItemCreationToReadyToPlayDurationInMs
{
  return self->_cmInitialStartupItemCreationToReadyToPlayDurationInMs;
}

- (BOOL)hasMediaRedownloadWaitTime
{
  return self->_hasMediaRedownloadWaitTime;
}

- (BOOL)hasSubscriptionAssetLoadWaitTime
{
  return self->_hasSubscriptionAssetLoadWaitTime;
}

- (BOOL)hasSuzeLeaseWaitTime
{
  return self->_hasSuzeLeaseWaitTime;
}

- (BOOL)hasLeaseWaitTime
{
  return self->_hasLeaseWaitTime;
}

- (BOOL)hasBagWaitTime
{
  return self->_hasBagWaitTime;
}

- (BOOL)hasLookupWaitTime
{
  return self->_hasLookupWaitTime;
}

- (int)subscriptionType
{
  return self->_subscriptionType;
}

- (int)assetLocation
{
  return self->_assetLocation;
}

- (int)assetSource
{
  return self->_assetSource;
}

- (unsigned)formatLayoutValue
{
  return self->_formatLayoutValue;
}

- (int)routeType
{
  return self->_routeType;
}

- (int)endPointType
{
  return self->_endPointType;
}

- (void)setErrorResolutionType:(id)a3
{
}

- (NSString)errorResolutionType
{
  return self->_errorResolutionType;
}

- (BOOL)isPrimaryUser
{
  return self->_isPrimaryUser;
}

- (BOOL)wasMediaLibraryDatabaseUpgraded
{
  return self->_wasMediaLibraryDatabaseUpgraded;
}

- (int)networkConnectionType
{
  return self->_networkConnectionType;
}

- (BOOL)isSuzeLease
{
  return self->_isSuzeLease;
}

- (BOOL)isSharePlayPlayback
{
  return self->_isSharePlayPlayback;
}

- (BOOL)isMiniSinfAvailable
{
  return self->_isMiniSinfAvailable;
}

- (BOOL)isFirstPlayAfterAppLaunch
{
  return self->_isFirstPlayAfterAppLaunch;
}

- (BOOL)isAutoPlay
{
  return self->_isAutoPlay;
}

- (BOOL)isNonDefaultUser
{
  return self->_isNonDefaultUser;
}

- (BOOL)isDelegatedPlayback
{
  return self->_isDelegatedPlayback;
}

- (BOOL)isRemoteSetQueue
{
  return self->_isRemoteSetQueue;
}

- (BOOL)isInterruptingPlayback
{
  return self->_isInterruptingPlayback;
}

- (BOOL)isHlsKeysReady
{
  return self->_isHlsKeysReady;
}

- (BOOL)isOfflineKeyReady
{
  return self->_isOfflineKeyReady;
}

- (BOOL)isOnlineKeyReady
{
  return self->_isOnlineKeyReady;
}

- (BOOL)isLeaseReady
{
  return self->_isLeaseReady;
}

- (BOOL)isStoreBagReady
{
  return self->_isStoreBagReady;
}

- (BOOL)isAccountDataReady
{
  return self->_isAccountDataReady;
}

- (int)routeConfiguration
{
  return self->_routeConfiguration;
}

- (unsigned)numberOfSpeakers
{
  return self->_numberOfSpeakers;
}

- (int)formatTier
{
  return self->_formatTier;
}

- (unsigned)formatSampleRate
{
  return self->_formatSampleRate;
}

- (int)formatLayout
{
  return self->_formatLayout;
}

- (unsigned)formatChannels
{
  return self->_formatChannels;
}

- (unsigned)formatBitDepth
{
  return self->_formatBitDepth;
}

- (unsigned)formatBitrate
{
  return self->_formatBitrate;
}

- (int)formatCodec
{
  return self->_formatCodec;
}

- (int)streamingContentType
{
  return self->_streamingContentType;
}

- (int)assetEndPoint
{
  return self->_assetEndPoint;
}

- (int)prefetchedMetadataSource
{
  return self->_prefetchedMetadataSource;
}

- (BOOL)isShuffled
{
  return self->_isShuffled;
}

- (unsigned)queueSize
{
  return self->_queueSize;
}

- (int)queueType
{
  return self->_queueType;
}

- (int)musicDomain
{
  return self->_musicDomain;
}

- (MWTSchemaMWTMusicMetadataReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v117.receiver = self;
  v117.super_class = (Class)MWTSchemaMWTMusicMetadataReported;
  v5 = [(MWTSchemaMWTMusicMetadataReported *)&v117 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"musicDomain"];
    objc_opt_class();
    v85 = v6;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setMusicDomain:](v5, "setMusicDomain:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"queueType"];
    objc_opt_class();
    v83 = v7;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setQueueType:](v5, "setQueueType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"queueSize"];
    objc_opt_class();
    v81 = v8;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setQueueSize:](v5, "setQueueSize:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isShuffled"];
    objc_opt_class();
    v116 = v9;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsShuffled:](v5, "setIsShuffled:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"prefetchedMetadataSource"];
    objc_opt_class();
    v78 = v10;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setPrefetchedMetadataSource:](v5, "setPrefetchedMetadataSource:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"assetEndPoint"];
    objc_opt_class();
    v76 = v11;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setAssetEndPoint:](v5, "setAssetEndPoint:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"streamingContentType"];
    objc_opt_class();
    v115 = v12;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setStreamingContentType:](v5, "setStreamingContentType:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"formatCodec"];
    objc_opt_class();
    v114 = v13;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setFormatCodec:](v5, "setFormatCodec:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"formatBitrate"];
    objc_opt_class();
    v113 = v14;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setFormatBitrate:](v5, "setFormatBitrate:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"formatBitDepth"];
    objc_opt_class();
    v112 = v15;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setFormatBitDepth:](v5, "setFormatBitDepth:", [v15 unsignedIntValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"formatChannels"];
    objc_opt_class();
    v111 = v16;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setFormatChannels:](v5, "setFormatChannels:", [v16 unsignedIntValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"formatLayout"];
    objc_opt_class();
    v110 = v17;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setFormatLayout:](v5, "setFormatLayout:", [v17 intValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"formatSampleRate"];
    objc_opt_class();
    v109 = v18;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setFormatSampleRate:](v5, "setFormatSampleRate:", [v18 unsignedIntValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"formatTier"];
    objc_opt_class();
    v108 = v19;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setFormatTier:](v5, "setFormatTier:", [v19 intValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"numberOfSpeakers"];
    objc_opt_class();
    v107 = v20;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setNumberOfSpeakers:](v5, "setNumberOfSpeakers:", [v20 unsignedIntValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"routeConfiguration"];
    objc_opt_class();
    v106 = v21;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setRouteConfiguration:](v5, "setRouteConfiguration:", [v21 intValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"isAccountDataReady"];
    objc_opt_class();
    v105 = v22;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsAccountDataReady:](v5, "setIsAccountDataReady:", [v22 BOOLValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"isStoreBagReady"];
    objc_opt_class();
    v104 = v23;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsStoreBagReady:](v5, "setIsStoreBagReady:", [v23 BOOLValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"isLeaseReady"];
    objc_opt_class();
    v103 = v24;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsLeaseReady:](v5, "setIsLeaseReady:", [v24 BOOLValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"isOnlineKeyReady"];
    objc_opt_class();
    v102 = v25;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsOnlineKeyReady:](v5, "setIsOnlineKeyReady:", [v25 BOOLValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"isOfflineKeyReady"];
    objc_opt_class();
    v101 = v26;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsOfflineKeyReady:](v5, "setIsOfflineKeyReady:", [v26 BOOLValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"isHlsKeysReady"];
    objc_opt_class();
    v100 = v27;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsHlsKeysReady:](v5, "setIsHlsKeysReady:", [v27 BOOLValue]);
    }
    v28 = [v4 objectForKeyedSubscript:@"isInterruptingPlayback"];
    objc_opt_class();
    v99 = v28;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsInterruptingPlayback:](v5, "setIsInterruptingPlayback:", [v28 BOOLValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"isRemoteSetQueue"];
    objc_opt_class();
    v98 = v29;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsRemoteSetQueue:](v5, "setIsRemoteSetQueue:", [v29 BOOLValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"isDelegatedPlayback"];
    objc_opt_class();
    v97 = v30;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsDelegatedPlayback:](v5, "setIsDelegatedPlayback:", [v30 BOOLValue]);
    }
    v31 = [v4 objectForKeyedSubscript:@"isNonDefaultUser"];
    objc_opt_class();
    v96 = v31;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsNonDefaultUser:](v5, "setIsNonDefaultUser:", [v31 BOOLValue]);
    }
    v32 = [v4 objectForKeyedSubscript:@"isAutoPlay"];
    objc_opt_class();
    v95 = v32;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsAutoPlay:](v5, "setIsAutoPlay:", [v32 BOOLValue]);
    }
    v33 = [v4 objectForKeyedSubscript:@"isFirstPlayAfterAppLaunch"];
    objc_opt_class();
    v94 = v33;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsFirstPlayAfterAppLaunch:](v5, "setIsFirstPlayAfterAppLaunch:", [v33 BOOLValue]);
    }
    v34 = [v4 objectForKeyedSubscript:@"isMiniSinfAvailable"];
    objc_opt_class();
    v93 = v34;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsMiniSinfAvailable:](v5, "setIsMiniSinfAvailable:", [v34 BOOLValue]);
    }
    v35 = [v4 objectForKeyedSubscript:@"isSharePlayPlayback"];
    objc_opt_class();
    v92 = v35;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsSharePlayPlayback:](v5, "setIsSharePlayPlayback:", [v35 BOOLValue]);
    }
    v36 = [v4 objectForKeyedSubscript:@"isSuzeLease"];
    objc_opt_class();
    v91 = v36;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsSuzeLease:](v5, "setIsSuzeLease:", [v36 BOOLValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"networkConnectionType"];
    objc_opt_class();
    v90 = v37;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setNetworkConnectionType:](v5, "setNetworkConnectionType:", [v37 intValue]);
    }
    v38 = [v4 objectForKeyedSubscript:@"wasMediaLibraryDatabaseUpgraded"];
    objc_opt_class();
    v89 = v38;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setWasMediaLibraryDatabaseUpgraded:](v5, "setWasMediaLibraryDatabaseUpgraded:", [v38 BOOLValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"isPrimaryUser"];
    objc_opt_class();
    v88 = v39;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setIsPrimaryUser:](v5, "setIsPrimaryUser:", [v39 BOOLValue]);
    }
    v40 = [v4 objectForKeyedSubscript:@"errorResolutionType"];
    objc_opt_class();
    v87 = v40;
    if (objc_opt_isKindOfClass())
    {
      v41 = (void *)[v40 copy];
      [(MWTSchemaMWTMusicMetadataReported *)v5 setErrorResolutionType:v41];
    }
    v42 = [v4 objectForKeyedSubscript:@"endPointType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setEndPointType:](v5, "setEndPointType:", [v42 intValue]);
    }
    v70 = v42;
    v43 = [v4 objectForKeyedSubscript:@"routeType"];
    objc_opt_class();
    v86 = v43;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setRouteType:](v5, "setRouteType:", [v43 intValue]);
    }
    v44 = [v4 objectForKeyedSubscript:@"formatLayoutValue"];
    objc_opt_class();
    v73 = v44;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setFormatLayoutValue:](v5, "setFormatLayoutValue:", [v44 unsignedIntValue]);
    }
    v45 = [v4 objectForKeyedSubscript:@"assetSource"];
    objc_opt_class();
    v84 = v45;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setAssetSource:](v5, "setAssetSource:", [v45 intValue]);
    }
    v46 = [v4 objectForKeyedSubscript:@"assetLocation"];
    objc_opt_class();
    v72 = v46;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setAssetLocation:](v5, "setAssetLocation:", [v46 intValue]);
    }
    v47 = [v4 objectForKeyedSubscript:@"subscriptionType"];
    objc_opt_class();
    v82 = v47;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setSubscriptionType:](v5, "setSubscriptionType:", [v47 intValue]);
    }
    v48 = [v4 objectForKeyedSubscript:@"hasLookupWaitTime"];
    objc_opt_class();
    v71 = v48;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setHasLookupWaitTime:](v5, "setHasLookupWaitTime:", [v48 BOOLValue]);
    }
    v49 = [v4 objectForKeyedSubscript:@"hasBagWaitTime"];
    objc_opt_class();
    v80 = v49;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setHasBagWaitTime:](v5, "setHasBagWaitTime:", [v49 BOOLValue]);
    }
    v50 = [v4 objectForKeyedSubscript:@"hasLeaseWaitTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setHasLeaseWaitTime:](v5, "setHasLeaseWaitTime:", [v50 BOOLValue]);
    }
    v51 = [v4 objectForKeyedSubscript:@"hasSuzeLeaseWaitTime"];
    objc_opt_class();
    v79 = v51;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setHasSuzeLeaseWaitTime:](v5, "setHasSuzeLeaseWaitTime:", [v51 BOOLValue]);
    }
    v52 = [v4 objectForKeyedSubscript:@"hasSubscriptionAssetLoadWaitTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setHasSubscriptionAssetLoadWaitTime:](v5, "setHasSubscriptionAssetLoadWaitTime:", [v52 BOOLValue]);
    }
    v53 = [v4 objectForKeyedSubscript:@"hasMediaRedownloadWaitTime"];
    objc_opt_class();
    v77 = v53;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setHasMediaRedownloadWaitTime:](v5, "setHasMediaRedownloadWaitTime:", [v53 BOOLValue]);
    }
    v54 = [v4 objectForKeyedSubscript:@"cmInitialStartupItemCreationToReadyToPlayDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setCmInitialStartupItemCreationToReadyToPlayDurationInMs:](v5, "setCmInitialStartupItemCreationToReadyToPlayDurationInMs:", [v54 unsignedIntValue]);
    }
    v55 = [v4 objectForKeyedSubscript:@"cmInitialStartupItemCreationToLtluDurationInMs"];
    objc_opt_class();
    v75 = v55;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setCmInitialStartupItemCreationToLtluDurationInMs:](v5, "setCmInitialStartupItemCreationToLtluDurationInMs:", [v55 unsignedIntValue]);
    }
    v56 = [v4 objectForKeyedSubscript:@"masterPlaylistConnectionTlsHandshakeDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setMasterPlaylistConnectionTlsHandshakeDurationInMs:](v5, "setMasterPlaylistConnectionTlsHandshakeDurationInMs:", [v56 unsignedIntValue]);
    }
    v57 = [v4 objectForKeyedSubscript:@"masterPlaylistRequestDurationInMs"];
    objc_opt_class();
    v74 = v57;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setMasterPlaylistRequestDurationInMs:](v5, "setMasterPlaylistRequestDurationInMs:", [v57 unsignedIntValue]);
    }
    v58 = [v4 objectForKeyedSubscript:@"subPlaylistConnectionTlsHandshakeDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setSubPlaylistConnectionTlsHandshakeDurationInMs:](v5, "setSubPlaylistConnectionTlsHandshakeDurationInMs:", [v58 unsignedIntValue]);
    }
    v69 = v52;
    v59 = [v4 objectForKeyedSubscript:@"subPlaylistRequestDurationInMs"];
    objc_opt_class();
    v60 = v54;
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setSubPlaylistRequestDurationInMs:](v5, "setSubPlaylistRequestDurationInMs:", [v59 unsignedIntValue]);
    }
    v61 = [v4 objectForKeyedSubscript:@"contentConnectionTlsHandshakeDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setContentConnectionTlsHandshakeDurationInMs:](v5, "setContentConnectionTlsHandshakeDurationInMs:", [v61 unsignedIntValue]);
    }
    v62 = [v4 objectForKeyedSubscript:@"contentFirstSegmentDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTMusicMetadataReported setContentFirstSegmentDurationInMs:](v5, "setContentFirstSegmentDurationInMs:", [v62 unsignedIntValue]);
    }
    v63 = [v4 objectForKeyedSubscript:@"audioQueueType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v68 = v50;
      v64 = v61;
      v65 = (void *)[v63 copy];
      [(MWTSchemaMWTMusicMetadataReported *)v5 setAudioQueueType:v65];

      v61 = v64;
      v50 = v68;
    }
    v66 = v5;
  }
  return v5;
}

- (MWTSchemaMWTMusicMetadataReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MWTSchemaMWTMusicMetadataReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MWTSchemaMWTMusicMetadataReported *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
    unsigned int v5 = [(MWTSchemaMWTMusicMetadataReported *)self assetEndPoint] - 1;
    if (v5 > 4) {
      v6 = @"MWTASSETENDPOINT_UNKNOWN";
    }
    else {
      v6 = off_1E5EB1EF0[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"assetEndPoint"];
    unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32);
    if ((v4 & 0x4000000000) == 0)
    {
LABEL_3:
      if ((v4 & 0x2000000000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
  }
  else if ((v4 & 0x4000000000) == 0)
  {
    goto LABEL_3;
  }
  int v7 = [(MWTSchemaMWTMusicMetadataReported *)self assetLocation];
  v8 = @"MWTASSETLOCATION_UNKNOWN";
  if (v7 == 1) {
    v8 = @"MWTASSETLOCATION_LOCAL_FILE";
  }
  if (v7 == 2) {
    v9 = @"MWTASSETLOCATION_CDN";
  }
  else {
    v9 = v8;
  }
  [v3 setObject:v9 forKeyedSubscript:@"assetLocation"];
  if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32)) & 0x2000000000) != 0)
  {
LABEL_15:
    unsigned int v10 = [(MWTSchemaMWTMusicMetadataReported *)self assetSource] - 1;
    if (v10 > 5) {
      v11 = @"MWTASSETSOURCE_UNKNOWN";
    }
    else {
      v11 = off_1E5EB1F18[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"assetSource"];
  }
LABEL_19:
  if (self->_audioQueueType)
  {
    v12 = [(MWTSchemaMWTMusicMetadataReported *)self audioQueueType];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"audioQueueType"];
  }
  unint64_t v14 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v14 & 0x800000000000) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported cmInitialStartupItemCreationToLtluDurationInMs](self, "cmInitialStartupItemCreationToLtluDurationInMs"));
    [v3 setObject:v15 forKeyedSubscript:@"cmInitialStartupItemCreationToLtluDurationInMs"];

    unint64_t v14 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                 + 6) << 16)) << 32);
    if ((v14 & 0x400000000000) == 0)
    {
LABEL_23:
      if ((v14 & 0x10000000000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_29;
    }
  }
  else if ((v14 & 0x400000000000) == 0)
  {
    goto LABEL_23;
  }
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported cmInitialStartupItemCreationToReadyToPlayDurationInMs](self, "cmInitialStartupItemCreationToReadyToPlayDurationInMs"));
  [v3 setObject:v16 forKeyedSubscript:@"cmInitialStartupItemCreationToReadyToPlayDurationInMs"];

  unint64_t v14 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v14 & 0x10000000000000) == 0)
  {
LABEL_24:
    if ((v14 & 0x20000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_30;
  }
LABEL_29:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported contentConnectionTlsHandshakeDurationInMs](self, "contentConnectionTlsHandshakeDurationInMs"));
  [v3 setObject:v17 forKeyedSubscript:@"contentConnectionTlsHandshakeDurationInMs"];

  unint64_t v14 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v14 & 0x20000000000000) == 0)
  {
LABEL_25:
    if ((v14 & 0x400000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_31;
  }
LABEL_30:
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported contentFirstSegmentDurationInMs](self, "contentFirstSegmentDurationInMs"));
  [v3 setObject:v18 forKeyedSubscript:@"contentFirstSegmentDurationInMs"];

  if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32)) & 0x400000000) == 0)
    goto LABEL_35;
LABEL_31:
  unsigned int v19 = [(MWTSchemaMWTMusicMetadataReported *)self endPointType] - 1;
  if (v19 > 2) {
    v20 = @"MWTENDPOINTTYPE_UNKNOWN";
  }
  else {
    v20 = off_1E5EB1F48[v19];
  }
  [v3 setObject:v20 forKeyedSubscript:@"endPointType"];
LABEL_35:
  if (self->_errorResolutionType)
  {
    v21 = [(MWTSchemaMWTMusicMetadataReported *)self errorResolutionType];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"errorResolutionType"];
  }
  $3A707FEDEB8D4B451EE4458D3B539123 v23 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v24 = *(void *)&v23 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
  if ((*(_WORD *)&v23 & 0x200) != 0)
  {
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatBitDepth](self, "formatBitDepth"));
    [v3 setObject:v28 forKeyedSubscript:@"formatBitDepth"];

    $3A707FEDEB8D4B451EE4458D3B539123 v29 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v24 = *(void *)&v29 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                          + 6) << 16)) << 32);
    if ((*(_WORD *)&v29 & 0x100) == 0)
    {
LABEL_39:
      if ((v24 & 0x400) == 0) {
        goto LABEL_40;
      }
      goto LABEL_87;
    }
  }
  else if ((*(_WORD *)&v23 & 0x100) == 0)
  {
    goto LABEL_39;
  }
  v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatBitrate](self, "formatBitrate"));
  [v3 setObject:v30 forKeyedSubscript:@"formatBitrate"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_40:
    if ((v24 & 0x80) == 0) {
      goto LABEL_41;
    }
    goto LABEL_88;
  }
LABEL_87:
  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatChannels](self, "formatChannels"));
  [v3 setObject:v31 forKeyedSubscript:@"formatChannels"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_41:
    if ((v24 & 0x800) == 0) {
      goto LABEL_42;
    }
    goto LABEL_92;
  }
LABEL_88:
  unsigned int v32 = [(MWTSchemaMWTMusicMetadataReported *)self formatCodec] - 1;
  if (v32 > 0x27) {
    v33 = @"MWTFORMATCODEC_UNKNOWN";
  }
  else {
    v33 = off_1E5EB1F60[v32];
  }
  [v3 setObject:v33 forKeyedSubscript:@"formatCodec"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_42:
    if ((v24 & 0x1000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_96;
  }
LABEL_92:
  unsigned int v34 = [(MWTSchemaMWTMusicMetadataReported *)self formatLayout] - 1;
  if (v34 > 0xAD) {
    v35 = @"MWTFORMATLAYOUT_UNKNOWN";
  }
  else {
    v35 = off_1E5EB20A0[v34];
  }
  [v3 setObject:v35 forKeyedSubscript:@"formatLayout"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x1000000000) == 0)
  {
LABEL_43:
    if ((v24 & 0x1000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_97;
  }
LABEL_96:
  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatLayoutValue](self, "formatLayoutValue"));
  [v3 setObject:v36 forKeyedSubscript:@"formatLayoutValue"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_44:
    if ((v24 & 0x2000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_98;
  }
LABEL_97:
  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatSampleRate](self, "formatSampleRate"));
  [v3 setObject:v37 forKeyedSubscript:@"formatSampleRate"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000) == 0)
  {
LABEL_45:
    if ((v24 & 0x20000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_102;
  }
LABEL_98:
  unsigned int v38 = [(MWTSchemaMWTMusicMetadataReported *)self formatTier] - 1;
  if (v38 > 4) {
    v39 = @"MWTFORMATTIER_UNKNOWN";
  }
  else {
    v39 = off_1E5EB2610[v38];
  }
  [v3 setObject:v39 forKeyedSubscript:@"formatTier"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x20000000000) == 0)
  {
LABEL_46:
    if ((v24 & 0x40000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_103;
  }
LABEL_102:
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasBagWaitTime](self, "hasBagWaitTime"));
  [v3 setObject:v40 forKeyedSubscript:@"hasBagWaitTime"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x40000000000) == 0)
  {
LABEL_47:
    if ((v24 & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_104;
  }
LABEL_103:
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasLeaseWaitTime](self, "hasLeaseWaitTime"));
  [v3 setObject:v41 forKeyedSubscript:@"hasLeaseWaitTime"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x10000000000) == 0)
  {
LABEL_48:
    if ((v24 & 0x200000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_105;
  }
LABEL_104:
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasLookupWaitTime](self, "hasLookupWaitTime"));
  [v3 setObject:v42 forKeyedSubscript:@"hasLookupWaitTime"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x200000000000) == 0)
  {
LABEL_49:
    if ((v24 & 0x100000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_106;
  }
LABEL_105:
  v43 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasMediaRedownloadWaitTime](self, "hasMediaRedownloadWaitTime"));
  [v3 setObject:v43 forKeyedSubscript:@"hasMediaRedownloadWaitTime"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x100000000000) == 0)
  {
LABEL_50:
    if ((v24 & 0x80000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_107;
  }
LABEL_106:
  v44 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasSubscriptionAssetLoadWaitTime](self, "hasSubscriptionAssetLoadWaitTime"));
  [v3 setObject:v44 forKeyedSubscript:@"hasSubscriptionAssetLoadWaitTime"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x80000000000) == 0)
  {
LABEL_51:
    if ((v24 & 0x10000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_108;
  }
LABEL_107:
  v45 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasSuzeLeaseWaitTime](self, "hasSuzeLeaseWaitTime"));
  [v3 setObject:v45 forKeyedSubscript:@"hasSuzeLeaseWaitTime"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_52:
    if ((v24 & 0x4000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_109;
  }
LABEL_108:
  v46 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isAccountDataReady](self, "isAccountDataReady"));
  [v3 setObject:v46 forKeyedSubscript:@"isAccountDataReady"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_53:
    if ((v24 & 0x1000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_110;
  }
LABEL_109:
  v47 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isAutoPlay](self, "isAutoPlay"));
  [v3 setObject:v47 forKeyedSubscript:@"isAutoPlay"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_54:
    if ((v24 & 0x8000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_111;
  }
LABEL_110:
  v48 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isDelegatedPlayback](self, "isDelegatedPlayback"));
  [v3 setObject:v48 forKeyedSubscript:@"isDelegatedPlayback"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_55:
    if ((v24 & 0x200000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_112;
  }
LABEL_111:
  v49 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isFirstPlayAfterAppLaunch](self, "isFirstPlayAfterAppLaunch"));
  [v3 setObject:v49 forKeyedSubscript:@"isFirstPlayAfterAppLaunch"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_56:
    if ((v24 & 0x400000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_113;
  }
LABEL_112:
  v50 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isHlsKeysReady](self, "isHlsKeysReady"));
  [v3 setObject:v50 forKeyedSubscript:@"isHlsKeysReady"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_57:
    if ((v24 & 0x40000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_114;
  }
LABEL_113:
  v51 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isInterruptingPlayback](self, "isInterruptingPlayback"));
  [v3 setObject:v51 forKeyedSubscript:@"isInterruptingPlayback"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_58:
    if ((v24 & 0x10000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_115;
  }
LABEL_114:
  v52 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isLeaseReady](self, "isLeaseReady"));
  [v3 setObject:v52 forKeyedSubscript:@"isLeaseReady"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_59:
    if ((v24 & 0x2000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_116;
  }
LABEL_115:
  v53 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isMiniSinfAvailable](self, "isMiniSinfAvailable"));
  [v3 setObject:v53 forKeyedSubscript:@"isMiniSinfAvailable"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_60:
    if ((v24 & 0x100000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_117;
  }
LABEL_116:
  v54 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isNonDefaultUser](self, "isNonDefaultUser"));
  [v3 setObject:v54 forKeyedSubscript:@"isNonDefaultUser"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_61:
    if ((v24 & 0x80000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_118;
  }
LABEL_117:
  v55 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isOfflineKeyReady](self, "isOfflineKeyReady"));
  [v3 setObject:v55 forKeyedSubscript:@"isOfflineKeyReady"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_62:
    if ((v24 & 0x200000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_119;
  }
LABEL_118:
  v56 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isOnlineKeyReady](self, "isOnlineKeyReady"));
  [v3 setObject:v56 forKeyedSubscript:@"isOnlineKeyReady"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x200000000) == 0)
  {
LABEL_63:
    if ((v24 & 0x800000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_120;
  }
LABEL_119:
  v57 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isPrimaryUser](self, "isPrimaryUser"));
  [v3 setObject:v57 forKeyedSubscript:@"isPrimaryUser"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_64:
    if ((v24 & 0x20000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_121;
  }
LABEL_120:
  v58 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isRemoteSetQueue](self, "isRemoteSetQueue"));
  [v3 setObject:v58 forKeyedSubscript:@"isRemoteSetQueue"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_65:
    if ((v24 & 8) == 0) {
      goto LABEL_66;
    }
    goto LABEL_122;
  }
LABEL_121:
  v59 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isSharePlayPlayback](self, "isSharePlayPlayback"));
  [v3 setObject:v59 forKeyedSubscript:@"isSharePlayPlayback"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_66:
    if ((v24 & 0x20000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_123;
  }
LABEL_122:
  v60 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isShuffled](self, "isShuffled"));
  [v3 setObject:v60 forKeyedSubscript:@"isShuffled"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_67:
    if ((v24 & 0x40000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_124;
  }
LABEL_123:
  v61 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isStoreBagReady](self, "isStoreBagReady"));
  [v3 setObject:v61 forKeyedSubscript:@"isStoreBagReady"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_68:
    if ((v24 & 0x1000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_125;
  }
LABEL_124:
  v62 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isSuzeLease](self, "isSuzeLease"));
  [v3 setObject:v62 forKeyedSubscript:@"isSuzeLease"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x1000000000000) == 0)
  {
LABEL_69:
    if ((v24 & 0x2000000000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_126;
  }
LABEL_125:
  v63 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported masterPlaylistConnectionTlsHandshakeDurationInMs](self, "masterPlaylistConnectionTlsHandshakeDurationInMs"));
  [v3 setObject:v63 forKeyedSubscript:@"masterPlaylistConnectionTlsHandshakeDurationInMs"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x2000000000000) == 0)
  {
LABEL_70:
    if ((v24 & 1) == 0) {
      goto LABEL_71;
    }
    goto LABEL_127;
  }
LABEL_126:
  v64 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported masterPlaylistRequestDurationInMs](self, "masterPlaylistRequestDurationInMs"));
  [v3 setObject:v64 forKeyedSubscript:@"masterPlaylistRequestDurationInMs"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 1) == 0)
  {
LABEL_71:
    if ((v24 & 0x80000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_131;
  }
LABEL_127:
  unsigned int v65 = [(MWTSchemaMWTMusicMetadataReported *)self musicDomain] - 1;
  if (v65 > 3) {
    v66 = @"MWTMUSICDOMAIN_UNKNOWN";
  }
  else {
    v66 = off_1E5EB2638[v65];
  }
  [v3 setObject:v66 forKeyedSubscript:@"musicDomain"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_72:
    if ((v24 & 0x4000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_135;
  }
LABEL_131:
  unsigned int v67 = [(MWTSchemaMWTMusicMetadataReported *)self networkConnectionType] - 1;
  if (v67 > 0xD) {
    v68 = @"MWTNETWORKCONNECTIONTYPE_UNKNOWN";
  }
  else {
    v68 = off_1E5EB2658[v67];
  }
  [v3 setObject:v68 forKeyedSubscript:@"networkConnectionType"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_73:
    if ((v24 & 0x10) == 0) {
      goto LABEL_74;
    }
    goto LABEL_136;
  }
LABEL_135:
  v69 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported numberOfSpeakers](self, "numberOfSpeakers"));
  [v3 setObject:v69 forKeyedSubscript:@"numberOfSpeakers"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10) == 0)
  {
LABEL_74:
    if ((v24 & 4) == 0) {
      goto LABEL_75;
    }
    goto LABEL_140;
  }
LABEL_136:
  unsigned int v70 = [(MWTSchemaMWTMusicMetadataReported *)self prefetchedMetadataSource] - 1;
  if (v70 > 3) {
    v71 = @"MWTPREFETCHEDMETADATASOURCE_UNKNOWN";
  }
  else {
    v71 = off_1E5EB26C8[v70];
  }
  [v3 setObject:v71 forKeyedSubscript:@"prefetchedMetadataSource"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_75:
    if ((v24 & 2) == 0) {
      goto LABEL_76;
    }
    goto LABEL_141;
  }
LABEL_140:
  v72 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported queueSize](self, "queueSize"));
  [v3 setObject:v72 forKeyedSubscript:@"queueSize"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 2) == 0)
  {
LABEL_76:
    if ((v24 & 0x8000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_145;
  }
LABEL_141:
  unsigned int v73 = [(MWTSchemaMWTMusicMetadataReported *)self queueType] - 1;
  if (v73 > 6) {
    v74 = @"MWTQUEUETYPE_UNKNOWN";
  }
  else {
    v74 = off_1E5EB26E8[v73];
  }
  [v3 setObject:v74 forKeyedSubscript:@"queueType"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_77:
    if ((v24 & 0x800000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_149;
  }
LABEL_145:
  unsigned int v75 = [(MWTSchemaMWTMusicMetadataReported *)self routeConfiguration] - 1;
  if (v75 > 5) {
    v76 = @"MWTROUTECONFIGURATION_UNKNOWN";
  }
  else {
    v76 = off_1E5EB2720[v75];
  }
  [v3 setObject:v76 forKeyedSubscript:@"routeConfiguration"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x800000000) == 0)
  {
LABEL_78:
    if ((v24 & 0x40) == 0) {
      goto LABEL_79;
    }
    goto LABEL_153;
  }
LABEL_149:
  unsigned int v77 = [(MWTSchemaMWTMusicMetadataReported *)self routeType] - 1;
  if (v77 > 8) {
    v78 = @"MWTAUDIOROUTETYPE_UNKNOWN";
  }
  else {
    v78 = off_1E5EB2750[v77];
  }
  [v3 setObject:v78 forKeyedSubscript:@"routeType"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_79:
    if ((v24 & 0x4000000000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_157;
  }
LABEL_153:
  unsigned int v79 = [(MWTSchemaMWTMusicMetadataReported *)self streamingContentType] - 1;
  if (v79 > 3) {
    v80 = @"MWTSTREAMINGCONTENTTYPE_UNKNOWN";
  }
  else {
    v80 = off_1E5EB2798[v79];
  }
  [v3 setObject:v80 forKeyedSubscript:@"streamingContentType"];
  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x4000000000000) == 0)
  {
LABEL_80:
    if ((v24 & 0x8000000000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_158;
  }
LABEL_157:
  v81 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported subPlaylistConnectionTlsHandshakeDurationInMs](self, "subPlaylistConnectionTlsHandshakeDurationInMs"));
  [v3 setObject:v81 forKeyedSubscript:@"subPlaylistConnectionTlsHandshakeDurationInMs"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x8000000000000) == 0)
  {
LABEL_81:
    if ((v24 & 0x8000000000) == 0) {
      goto LABEL_82;
    }
LABEL_159:
    unsigned int v83 = [(MWTSchemaMWTMusicMetadataReported *)self subscriptionType] - 1;
    if (v83 > 2) {
      v84 = @"MWTSUBSCRIPTIONTYPE_UNKNOWN";
    }
    else {
      v84 = off_1E5EB27B8[v83];
    }
    [v3 setObject:v84 forKeyedSubscript:@"subscriptionType"];
    if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                  + 6) << 16)) << 32)) & 0x100000000) != 0)
      goto LABEL_83;
    goto LABEL_84;
  }
LABEL_158:
  v82 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported subPlaylistRequestDurationInMs](self, "subPlaylistRequestDurationInMs"));
  [v3 setObject:v82 forKeyedSubscript:@"subPlaylistRequestDurationInMs"];

  unint64_t v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x8000000000) != 0) {
    goto LABEL_159;
  }
LABEL_82:
  if ((v24 & 0x100000000) != 0)
  {
LABEL_83:
    v25 = objc_msgSend(NSNumber, "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported wasMediaLibraryDatabaseUpgraded](self, "wasMediaLibraryDatabaseUpgraded"));
    [v3 setObject:v25 forKeyedSubscript:@"wasMediaLibraryDatabaseUpgraded"];
  }
LABEL_84:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v26 = v3;

  return v26;
}

- (unint64_t)hash
{
  unint64_t v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if (*(_DWORD *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_musicDomain;
    if ((*(_DWORD *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v61 = 2654435761 * self->_queueType;
      if ((*(_DWORD *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(_DWORD *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v61 = 0;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v60 = 2654435761 * self->_queueSize;
    if ((*(_DWORD *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v60 = 0;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v59 = 2654435761 * self->_isShuffled;
    if ((*(_DWORD *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v59 = 0;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v58 = 2654435761 * self->_prefetchedMetadataSource;
    if ((*(_DWORD *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v58 = 0;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v57 = 2654435761 * self->_assetEndPoint;
    if ((*(_DWORD *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v57 = 0;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v56 = 2654435761 * self->_streamingContentType;
    if ((*(_DWORD *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v56 = 0;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v55 = 2654435761 * self->_formatCodec;
    if ((*(_DWORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v55 = 0;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v54 = 2654435761 * self->_formatBitrate;
    if ((*(_DWORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v54 = 0;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v53 = 2654435761 * self->_formatBitDepth;
    if ((*(_DWORD *)&self->_has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v53 = 0;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v52 = 2654435761 * self->_formatChannels;
    if ((*(_DWORD *)&self->_has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v52 = 0;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    uint64_t v51 = 2654435761 * self->_formatLayout;
    if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v51 = 0;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v50 = 2654435761 * self->_formatSampleRate;
    if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v50 = 0;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v49 = 2654435761 * self->_formatTier;
    if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v49 = 0;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v48 = 2654435761 * self->_numberOfSpeakers;
    if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v48 = 0;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v47 = 2654435761 * self->_routeConfiguration;
    if ((*(_DWORD *)&self->_has & 0x10000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v47 = 0;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_18:
    uint64_t v46 = 2654435761 * self->_isAccountDataReady;
    if ((*(_DWORD *)&self->_has & 0x20000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v46 = 0;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v45 = 2654435761 * self->_isStoreBagReady;
    if ((*(_DWORD *)&self->_has & 0x40000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v45 = 0;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_20:
    uint64_t v44 = 2654435761 * self->_isLeaseReady;
    if ((*(_DWORD *)&self->_has & 0x80000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v44 = 0;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_21:
    uint64_t v43 = 2654435761 * self->_isOnlineKeyReady;
    if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v43 = 0;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_22:
    uint64_t v42 = 2654435761 * self->_isOfflineKeyReady;
    if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v42 = 0;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_23:
    uint64_t v41 = 2654435761 * self->_isHlsKeysReady;
    if ((*(_DWORD *)&self->_has & 0x400000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v41 = 0;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_24:
    uint64_t v40 = 2654435761 * self->_isInterruptingPlayback;
    if ((*(_DWORD *)&self->_has & 0x800000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v40 = 0;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_25:
    uint64_t v39 = 2654435761 * self->_isRemoteSetQueue;
    if ((*(_DWORD *)&self->_has & 0x1000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v39 = 0;
  if ((*(_DWORD *)&self->_has & 0x1000000) != 0)
  {
LABEL_26:
    uint64_t v38 = 2654435761 * self->_isDelegatedPlayback;
    if ((*(_DWORD *)&self->_has & 0x2000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v38 = 0;
  if ((*(_DWORD *)&self->_has & 0x2000000) != 0)
  {
LABEL_27:
    uint64_t v37 = 2654435761 * self->_isNonDefaultUser;
    if ((*(_DWORD *)&self->_has & 0x4000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_28:
    uint64_t v36 = 2654435761 * self->_isAutoPlay;
    if ((*(_DWORD *)&self->_has & 0x8000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
  {
LABEL_29:
    uint64_t v35 = 2654435761 * self->_isFirstPlayAfterAppLaunch;
    if ((*(_DWORD *)&self->_has & 0x10000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_30:
    uint64_t v34 = 2654435761 * self->_isMiniSinfAvailable;
    if ((*(_DWORD *)&self->_has & 0x20000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v34 = 0;
  if ((*(_DWORD *)&self->_has & 0x20000000) != 0)
  {
LABEL_31:
    uint64_t v32 = 2654435761 * self->_isSharePlayPlayback;
    if ((*(_DWORD *)&self->_has & 0x40000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_32:
    uint64_t v5 = 2654435761 * self->_isSuzeLease;
    if ((*(_DWORD *)&self->_has & 0x80000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&self->_has & 0x80000000) != 0)
  {
LABEL_33:
    uint64_t v6 = 2654435761 * self->_networkConnectionType;
    if ((v3 & 0x100000000) != 0) {
      goto LABEL_34;
    }
LABEL_68:
    uint64_t v7 = 0;
    if ((v3 & 0x200000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_69;
  }
LABEL_67:
  uint64_t v6 = 0;
  if ((v3 & 0x100000000) == 0) {
    goto LABEL_68;
  }
LABEL_34:
  uint64_t v7 = 2654435761 * self->_wasMediaLibraryDatabaseUpgraded;
  if ((v3 & 0x200000000) != 0)
  {
LABEL_35:
    uint64_t v8 = 2654435761 * self->_isPrimaryUser;
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v8 = 0;
LABEL_70:
  NSUInteger v9 = [(NSString *)self->_errorResolutionType hash];
  unint64_t v10 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v10 & 0x400000000) != 0)
  {
    uint64_t v11 = 2654435761 * self->_endPointType;
    if ((v10 & 0x800000000) != 0)
    {
LABEL_72:
      uint64_t v12 = 2654435761 * self->_routeType;
      if ((v10 & 0x1000000000) != 0) {
        goto LABEL_73;
      }
      goto LABEL_93;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((v10 & 0x800000000) != 0) {
      goto LABEL_72;
    }
  }
  uint64_t v12 = 0;
  if ((v10 & 0x1000000000) != 0)
  {
LABEL_73:
    uint64_t v13 = 2654435761 * self->_formatLayoutValue;
    if ((v10 & 0x2000000000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v13 = 0;
  if ((v10 & 0x2000000000) != 0)
  {
LABEL_74:
    uint64_t v14 = 2654435761 * self->_assetSource;
    if ((v10 & 0x4000000000) != 0) {
      goto LABEL_75;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v14 = 0;
  if ((v10 & 0x4000000000) != 0)
  {
LABEL_75:
    uint64_t v15 = 2654435761 * self->_assetLocation;
    if ((v10 & 0x8000000000) != 0) {
      goto LABEL_76;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v15 = 0;
  if ((v10 & 0x8000000000) != 0)
  {
LABEL_76:
    uint64_t v16 = 2654435761 * self->_subscriptionType;
    if ((v10 & 0x10000000000) != 0) {
      goto LABEL_77;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v16 = 0;
  if ((v10 & 0x10000000000) != 0)
  {
LABEL_77:
    uint64_t v17 = 2654435761 * self->_hasLookupWaitTime;
    if ((v10 & 0x20000000000) != 0) {
      goto LABEL_78;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v17 = 0;
  if ((v10 & 0x20000000000) != 0)
  {
LABEL_78:
    uint64_t v18 = 2654435761 * self->_hasBagWaitTime;
    if ((v10 & 0x40000000000) != 0) {
      goto LABEL_79;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v18 = 0;
  if ((v10 & 0x40000000000) != 0)
  {
LABEL_79:
    uint64_t v19 = 2654435761 * self->_hasLeaseWaitTime;
    if ((v10 & 0x80000000000) != 0) {
      goto LABEL_80;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v19 = 0;
  if ((v10 & 0x80000000000) != 0)
  {
LABEL_80:
    uint64_t v20 = 2654435761 * self->_hasSuzeLeaseWaitTime;
    if ((v10 & 0x100000000000) != 0) {
      goto LABEL_81;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v20 = 0;
  if ((v10 & 0x100000000000) != 0)
  {
LABEL_81:
    uint64_t v21 = 2654435761 * self->_hasSubscriptionAssetLoadWaitTime;
    if ((v10 & 0x200000000000) != 0) {
      goto LABEL_82;
    }
    goto LABEL_102;
  }
LABEL_101:
  uint64_t v21 = 0;
  if ((v10 & 0x200000000000) != 0)
  {
LABEL_82:
    uint64_t v22 = 2654435761 * self->_hasMediaRedownloadWaitTime;
    if ((v10 & 0x400000000000) != 0) {
      goto LABEL_83;
    }
    goto LABEL_103;
  }
LABEL_102:
  uint64_t v22 = 0;
  if ((v10 & 0x400000000000) != 0)
  {
LABEL_83:
    uint64_t v23 = 2654435761 * self->_cmInitialStartupItemCreationToReadyToPlayDurationInMs;
    if ((v10 & 0x800000000000) != 0) {
      goto LABEL_84;
    }
    goto LABEL_104;
  }
LABEL_103:
  uint64_t v23 = 0;
  if ((v10 & 0x800000000000) != 0)
  {
LABEL_84:
    uint64_t v24 = 2654435761 * self->_cmInitialStartupItemCreationToLtluDurationInMs;
    if ((v10 & 0x1000000000000) != 0) {
      goto LABEL_85;
    }
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v24 = 0;
  if ((v10 & 0x1000000000000) != 0)
  {
LABEL_85:
    uint64_t v25 = 2654435761 * self->_masterPlaylistConnectionTlsHandshakeDurationInMs;
    if ((v10 & 0x2000000000000) != 0) {
      goto LABEL_86;
    }
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v25 = 0;
  if ((v10 & 0x2000000000000) != 0)
  {
LABEL_86:
    uint64_t v26 = 2654435761 * self->_masterPlaylistRequestDurationInMs;
    if ((v10 & 0x4000000000000) != 0) {
      goto LABEL_87;
    }
    goto LABEL_107;
  }
LABEL_106:
  uint64_t v26 = 0;
  if ((v10 & 0x4000000000000) != 0)
  {
LABEL_87:
    uint64_t v27 = 2654435761 * self->_subPlaylistConnectionTlsHandshakeDurationInMs;
    if ((v10 & 0x8000000000000) != 0) {
      goto LABEL_88;
    }
    goto LABEL_108;
  }
LABEL_107:
  uint64_t v27 = 0;
  if ((v10 & 0x8000000000000) != 0)
  {
LABEL_88:
    uint64_t v28 = 2654435761 * self->_subPlaylistRequestDurationInMs;
    if ((v10 & 0x10000000000000) != 0) {
      goto LABEL_89;
    }
LABEL_109:
    uint64_t v29 = 0;
    if ((v10 & 0x20000000000000) != 0) {
      goto LABEL_90;
    }
LABEL_110:
    uint64_t v30 = 0;
    return v61 ^ v4 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v5 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ [(NSString *)self->_audioQueueType hash];
  }
LABEL_108:
  uint64_t v28 = 0;
  if ((v10 & 0x10000000000000) == 0) {
    goto LABEL_109;
  }
LABEL_89:
  uint64_t v29 = 2654435761 * self->_contentConnectionTlsHandshakeDurationInMs;
  if ((v10 & 0x20000000000000) == 0) {
    goto LABEL_110;
  }
LABEL_90:
  uint64_t v30 = 2654435761 * self->_contentFirstSegmentDurationInMs;
  return v61 ^ v4 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v5 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ [(NSString *)self->_audioQueueType hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_229;
  }
  $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  uint64_t v6 = v4[44];
  if ((*(_DWORD *)&self->_has & 1) != (v4[44] & 1)) {
    goto LABEL_229;
  }
  if (*(unsigned char *)&v5)
  {
    int musicDomain = self->_musicDomain;
    if (musicDomain != [v4 musicDomain]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  else
  {
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v6 | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
  }
  unsigned int v10 = (*(_DWORD *)&v5 >> 1) & 1;
  if (v10 != ((v6 >> 1) & 1)) {
    goto LABEL_229;
  }
  if (v10)
  {
    int queueType = self->_queueType;
    if (queueType != [v4 queueType]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v12 = (*(_DWORD *)&v5 >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1)) {
    goto LABEL_229;
  }
  if (v12)
  {
    unsigned int queueSize = self->_queueSize;
    if (queueSize != [v4 queueSize]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v14 = (*(_DWORD *)&v5 >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1)) {
    goto LABEL_229;
  }
  if (v14)
  {
    int isShuffled = self->_isShuffled;
    if (isShuffled != [v4 isShuffled]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v16 = (*(_DWORD *)&v5 >> 4) & 1;
  if (v16 != ((v6 >> 4) & 1)) {
    goto LABEL_229;
  }
  if (v16)
  {
    int prefetchedMetadataSource = self->_prefetchedMetadataSource;
    if (prefetchedMetadataSource != [v4 prefetchedMetadataSource]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v18 = (*(_DWORD *)&v5 >> 5) & 1;
  if (v18 != ((v6 >> 5) & 1)) {
    goto LABEL_229;
  }
  if (v18)
  {
    int assetEndPoint = self->_assetEndPoint;
    if (assetEndPoint != [v4 assetEndPoint]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v20 = (*(_DWORD *)&v5 >> 6) & 1;
  if (v20 != ((v6 >> 6) & 1)) {
    goto LABEL_229;
  }
  if (v20)
  {
    int streamingContentType = self->_streamingContentType;
    if (streamingContentType != [v4 streamingContentType]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v22 = (*(_DWORD *)&v5 >> 7) & 1;
  if (v22 != ((v6 >> 7) & 1)) {
    goto LABEL_229;
  }
  if (v22)
  {
    int formatCodec = self->_formatCodec;
    if (formatCodec != [v4 formatCodec]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v24 = (*(_DWORD *)&v5 >> 8) & 1;
  if (v24 != ((v6 >> 8) & 1)) {
    goto LABEL_229;
  }
  if (v24)
  {
    unsigned int formatBitrate = self->_formatBitrate;
    if (formatBitrate != [v4 formatBitrate]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v26 = (*(_DWORD *)&v5 >> 9) & 1;
  if (v26 != ((v6 >> 9) & 1)) {
    goto LABEL_229;
  }
  if (v26)
  {
    unsigned int formatBitDepth = self->_formatBitDepth;
    if (formatBitDepth != [v4 formatBitDepth]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v28 = (*(_DWORD *)&v5 >> 10) & 1;
  if (v28 != ((v6 >> 10) & 1)) {
    goto LABEL_229;
  }
  if (v28)
  {
    unsigned int formatChannels = self->_formatChannels;
    if (formatChannels != [v4 formatChannels]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v30 = (*(_DWORD *)&v5 >> 11) & 1;
  if (v30 != ((v6 >> 11) & 1)) {
    goto LABEL_229;
  }
  if (v30)
  {
    int formatLayout = self->_formatLayout;
    if (formatLayout != [v4 formatLayout]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v32 = (*(_DWORD *)&v5 >> 12) & 1;
  if (v32 != ((v6 >> 12) & 1)) {
    goto LABEL_229;
  }
  if (v32)
  {
    unsigned int formatSampleRate = self->_formatSampleRate;
    if (formatSampleRate != [v4 formatSampleRate]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v34 = (*(_DWORD *)&v5 >> 13) & 1;
  if (v34 != ((v6 >> 13) & 1)) {
    goto LABEL_229;
  }
  if (v34)
  {
    int formatTier = self->_formatTier;
    if (formatTier != [v4 formatTier]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v36 = (*(_DWORD *)&v5 >> 14) & 1;
  if (v36 != ((v6 >> 14) & 1)) {
    goto LABEL_229;
  }
  if (v36)
  {
    unsigned int numberOfSpeakers = self->_numberOfSpeakers;
    if (numberOfSpeakers != [v4 numberOfSpeakers]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v38 = (*(_DWORD *)&v5 >> 15) & 1;
  if (v38 != ((v6 >> 15) & 1)) {
    goto LABEL_229;
  }
  if (v38)
  {
    int routeConfiguration = self->_routeConfiguration;
    if (routeConfiguration != [v4 routeConfiguration]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v40 = HIWORD(*(_DWORD *)&v5) & 1;
  if (v40 != (WORD1(v6) & 1)) {
    goto LABEL_229;
  }
  if (v40)
  {
    int isAccountDataReady = self->_isAccountDataReady;
    if (isAccountDataReady != [v4 isAccountDataReady]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v42 = (*(_DWORD *)&v5 >> 17) & 1;
  if (v42 != ((v6 >> 17) & 1)) {
    goto LABEL_229;
  }
  if (v42)
  {
    int isStoreBagReady = self->_isStoreBagReady;
    if (isStoreBagReady != [v4 isStoreBagReady]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v44 = (*(_DWORD *)&v5 >> 18) & 1;
  if (v44 != ((v6 >> 18) & 1)) {
    goto LABEL_229;
  }
  if (v44)
  {
    int isLeaseReady = self->_isLeaseReady;
    if (isLeaseReady != [v4 isLeaseReady]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v46 = (*(_DWORD *)&v5 >> 19) & 1;
  if (v46 != ((v6 >> 19) & 1)) {
    goto LABEL_229;
  }
  if (v46)
  {
    int isOnlineKeyReady = self->_isOnlineKeyReady;
    if (isOnlineKeyReady != [v4 isOnlineKeyReady]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v48 = (*(_DWORD *)&v5 >> 20) & 1;
  if (v48 != ((v6 >> 20) & 1)) {
    goto LABEL_229;
  }
  if (v48)
  {
    int isOfflineKeyReady = self->_isOfflineKeyReady;
    if (isOfflineKeyReady != [v4 isOfflineKeyReady]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v50 = (*(_DWORD *)&v5 >> 21) & 1;
  if (v50 != ((v6 >> 21) & 1)) {
    goto LABEL_229;
  }
  if (v50)
  {
    int isHlsKeysReady = self->_isHlsKeysReady;
    if (isHlsKeysReady != [v4 isHlsKeysReady]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v52 = (*(_DWORD *)&v5 >> 22) & 1;
  if (v52 != ((v6 >> 22) & 1)) {
    goto LABEL_229;
  }
  if (v52)
  {
    int isInterruptingPlayback = self->_isInterruptingPlayback;
    if (isInterruptingPlayback != [v4 isInterruptingPlayback]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v54 = (*(_DWORD *)&v5 >> 23) & 1;
  if (v54 != ((v6 >> 23) & 1)) {
    goto LABEL_229;
  }
  if (v54)
  {
    int isRemoteSetQueue = self->_isRemoteSetQueue;
    if (isRemoteSetQueue != [v4 isRemoteSetQueue]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v56 = HIBYTE(*(_DWORD *)&v5) & 1;
  if (v56 != (BYTE3(v6) & 1)) {
    goto LABEL_229;
  }
  if (v56)
  {
    int isDelegatedPlayback = self->_isDelegatedPlayback;
    if (isDelegatedPlayback != [v4 isDelegatedPlayback]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v58 = (*(_DWORD *)&v5 >> 25) & 1;
  if (v58 != ((v6 >> 25) & 1)) {
    goto LABEL_229;
  }
  if (v58)
  {
    int isNonDefaultUser = self->_isNonDefaultUser;
    if (isNonDefaultUser != [v4 isNonDefaultUser]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v60 = (*(_DWORD *)&v5 >> 26) & 1;
  if (v60 != ((v6 >> 26) & 1)) {
    goto LABEL_229;
  }
  if (v60)
  {
    int isAutoPlay = self->_isAutoPlay;
    if (isAutoPlay != [v4 isAutoPlay]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v62 = (*(_DWORD *)&v5 >> 27) & 1;
  if (v62 != ((v6 >> 27) & 1)) {
    goto LABEL_229;
  }
  if (v62)
  {
    int isFirstPlayAfterAppLaunch = self->_isFirstPlayAfterAppLaunch;
    if (isFirstPlayAfterAppLaunch != [v4 isFirstPlayAfterAppLaunch]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v64 = (*(_DWORD *)&v5 >> 28) & 1;
  if (v64 != ((v6 >> 28) & 1)) {
    goto LABEL_229;
  }
  if (v64)
  {
    int isMiniSinfAvailable = self->_isMiniSinfAvailable;
    if (isMiniSinfAvailable != [v4 isMiniSinfAvailable]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v66 = (*(_DWORD *)&v5 >> 29) & 1;
  if (v66 != ((v6 >> 29) & 1)) {
    goto LABEL_229;
  }
  if (v66)
  {
    int isSharePlayPlayback = self->_isSharePlayPlayback;
    if (isSharePlayPlayback != [v4 isSharePlayPlayback]) {
      goto LABEL_229;
    }
    $3A707FEDEB8D4B451EE4458D3B539123 v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  unsigned int v68 = (*(_DWORD *)&v5 >> 30) & 1;
  if (v68 != ((v6 >> 30) & 1)) {
    goto LABEL_229;
  }
  if (v68)
  {
    int isSuzeLease = self->_isSuzeLease;
    if (isSuzeLease != [v4 isSuzeLease]) {
      goto LABEL_229;
    }
    unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32);
    unint64_t v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
  }
  if (((v8 ^ v7) & 0x80000000) != 0) {
    goto LABEL_229;
  }
  if ((v7 & 0x80000000) != 0)
  {
    int networkConnectionType = self->_networkConnectionType;
    if (networkConnectionType != [v4 networkConnectionType]) {
      goto LABEL_229;
    }
    LODWORD(v72) = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    LODWORD(v70) = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v71) = v70 >> 1;
    LODWORD(v73) = v72 >> 1;
  }
  else
  {
    uint64_t v70 = HIDWORD(v8) & 0xFFFFFF;
    uint64_t v71 = (v8 >> 33) & 0x7FFFFF;
    uint64_t v72 = HIDWORD(v7) & 0xFFFFFF;
    uint64_t v73 = (v7 >> 33) & 0x7FFFFF;
  }
  int v75 = v72 & 1;
  if (v75 != (v70 & 1)) {
    goto LABEL_229;
  }
  if (v75)
  {
    int wasMediaLibraryDatabaseUpgraded = self->_wasMediaLibraryDatabaseUpgraded;
    if (wasMediaLibraryDatabaseUpgraded != [v4 wasMediaLibraryDatabaseUpgraded]) {
      goto LABEL_229;
    }
    LODWORD(v71) = (*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) >> 1;
    LODWORD(v73) = (*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16)) >> 1;
  }
  int v77 = v73 & 1;
  if (v77 != (v71 & 1)) {
    goto LABEL_229;
  }
  if (v77)
  {
    int isPrimaryUser = self->_isPrimaryUser;
    if (isPrimaryUser != [v4 isPrimaryUser]) {
      goto LABEL_229;
    }
  }
  unsigned int v79 = [(MWTSchemaMWTMusicMetadataReported *)self errorResolutionType];
  v80 = [v4 errorResolutionType];
  if ((v79 == 0) == (v80 != 0)) {
    goto LABEL_228;
  }
  uint64_t v81 = [(MWTSchemaMWTMusicMetadataReported *)self errorResolutionType];
  if (v81)
  {
    v82 = (void *)v81;
    unsigned int v83 = [(MWTSchemaMWTMusicMetadataReported *)self errorResolutionType];
    v84 = [v4 errorResolutionType];
    int v85 = [v83 isEqual:v84];

    if (!v85) {
      goto LABEL_229;
    }
  }
  else
  {
  }
  unsigned int v86 = *((unsigned __int16 *)&self->_has + 2);
  int v87 = (v86 >> 2) & 1;
  unsigned int v88 = *((unsigned __int16 *)v4 + 90);
  if (v87 != ((v88 >> 2) & 1)) {
    goto LABEL_229;
  }
  if (v87)
  {
    int endPointType = self->_endPointType;
    if (endPointType != [v4 endPointType]) {
      goto LABEL_229;
    }
    unsigned int v117 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v118 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v91) = v118 >> 3;
    LODWORD(v92) = v118 >> 5;
    LODWORD(v93) = v118 >> 6;
    LODWORD(v94) = v118 >> 7;
    LODWORD(v95) = v118 >> 8;
    LODWORD(v96) = v118 >> 9;
    LODWORD(v97) = v118 >> 10;
    unint64_t v98 = v118 >> 11;
    LODWORD(v202) = v118 >> 4;
    LODWORD(v190) = v118 >> 12;
    LODWORD(v191) = v118 >> 13;
    LODWORD(v192) = v118 >> 14;
    LODWORD(v193) = v118 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v118 >> 17;
    LODWORD(v196) = v118 >> 18;
    LODWORD(v198) = v118 >> 19;
    LODWORD(v200) = v118 >> 20;
    LODWORD(v201) = v118 >> 21;
    LODWORD(v99) = v117 >> 3;
    LODWORD(v100) = v117 >> 4;
    LODWORD(v101) = v117 >> 5;
    LODWORD(v102) = v117 >> 6;
    LODWORD(v103) = v117 >> 7;
    LODWORD(v104) = v117 >> 8;
    LODWORD(v105) = v117 >> 9;
    LODWORD(v106) = v117 >> 10;
    LODWORD(v107) = v117 >> 11;
    LODWORD(v108) = v117 >> 12;
    LODWORD(v109) = v117 >> 13;
    LODWORD(v110) = v117 >> 14;
    unint64_t v111 = v117 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v117 >> 17;
    unint64_t v114 = v117 >> 18;
    LODWORD(v197) = v117 >> 19;
    LODWORD(v199) = v117 >> 20;
    unint64_t v115 = v117 >> 21;
  }
  else
  {
    unint64_t v89 = *(_DWORD *)&self->_has | ((unint64_t)(v86 | (*((unsigned __int8 *)&self->_has + 6) << 16)) << 32);
    unint64_t v90 = v4[44] | ((unint64_t)(v88 | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    unint64_t v91 = v90 >> 35;
    unint64_t v202 = v90 >> 36;
    unint64_t v92 = v90 >> 37;
    unint64_t v93 = v90 >> 38;
    unint64_t v94 = v90 >> 39;
    unint64_t v95 = v90 >> 40;
    unint64_t v96 = v90 >> 41;
    unint64_t v97 = v90 >> 42;
    unint64_t v98 = v90 >> 43;
    unint64_t v190 = v90 >> 44;
    unint64_t v191 = v90 >> 45;
    unint64_t v192 = v90 >> 46;
    unint64_t v193 = v90 >> 47;
    unint64_t v194 = HIWORD(v90);
    unint64_t v195 = v90 >> 49;
    unint64_t v196 = v90 >> 50;
    unint64_t v198 = v90 >> 51;
    unint64_t v200 = v90 >> 52;
    unint64_t v201 = v90 >> 53;
    unint64_t v99 = v89 >> 35;
    unint64_t v100 = v89 >> 36;
    unint64_t v101 = v89 >> 37;
    unint64_t v102 = v89 >> 38;
    unint64_t v103 = v89 >> 39;
    unint64_t v104 = v89 >> 40;
    unint64_t v105 = v89 >> 41;
    unint64_t v106 = v89 >> 42;
    unint64_t v107 = v89 >> 43;
    unint64_t v108 = v89 >> 44;
    unint64_t v109 = v89 >> 45;
    unint64_t v110 = v89 >> 46;
    unint64_t v111 = v89 >> 47;
    unint64_t v112 = HIWORD(v89);
    unint64_t v113 = v89 >> 49;
    unint64_t v114 = v89 >> 50;
    unint64_t v197 = v89 >> 51;
    unint64_t v199 = v89 >> 52;
    unint64_t v115 = v89 >> 53;
  }
  int v119 = v99 & 1;
  if (v119 != (v91 & 1)) {
    goto LABEL_229;
  }
  if (v119)
  {
    int routeType = self->_routeType;
    if (routeType != objc_msgSend(v4, "routeType", v114, v115, v113, v112, v98, v111)) {
      goto LABEL_229;
    }
    unsigned int v121 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v122 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v92) = v122 >> 5;
    LODWORD(v93) = v122 >> 6;
    LODWORD(v94) = v122 >> 7;
    LODWORD(v95) = v122 >> 8;
    LODWORD(v96) = v122 >> 9;
    LODWORD(v97) = v122 >> 10;
    unint64_t v98 = v122 >> 11;
    LODWORD(v202) = v122 >> 4;
    LODWORD(v190) = v122 >> 12;
    LODWORD(v191) = v122 >> 13;
    LODWORD(v192) = v122 >> 14;
    LODWORD(v193) = v122 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v122 >> 17;
    LODWORD(v196) = v122 >> 18;
    LODWORD(v198) = v122 >> 19;
    LODWORD(v200) = v122 >> 20;
    LODWORD(v201) = v122 >> 21;
    LODWORD(v100) = v121 >> 4;
    LODWORD(v101) = v121 >> 5;
    LODWORD(v102) = v121 >> 6;
    LODWORD(v103) = v121 >> 7;
    LODWORD(v104) = v121 >> 8;
    LODWORD(v105) = v121 >> 9;
    LODWORD(v106) = v121 >> 10;
    LODWORD(v107) = v121 >> 11;
    LODWORD(v108) = v121 >> 12;
    LODWORD(v109) = v121 >> 13;
    LODWORD(v110) = v121 >> 14;
    unint64_t v111 = v121 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v121 >> 17;
    unint64_t v114 = v121 >> 18;
    LODWORD(v197) = v121 >> 19;
    LODWORD(v199) = v121 >> 20;
    unint64_t v115 = v121 >> 21;
  }
  int v123 = v100 & 1;
  if (v123 != (v202 & 1)) {
    goto LABEL_229;
  }
  if (v123)
  {
    unsigned int formatLayoutValue = self->_formatLayoutValue;
    if (formatLayoutValue != objc_msgSend(v4, "formatLayoutValue", v114, v115, v113, v112, v98, v111)) {
      goto LABEL_229;
    }
    unsigned int v125 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v126 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v92) = v126 >> 5;
    LODWORD(v93) = v126 >> 6;
    LODWORD(v94) = v126 >> 7;
    LODWORD(v95) = v126 >> 8;
    LODWORD(v96) = v126 >> 9;
    LODWORD(v97) = v126 >> 10;
    unint64_t v98 = v126 >> 11;
    LODWORD(v190) = v126 >> 12;
    LODWORD(v191) = v126 >> 13;
    LODWORD(v192) = v126 >> 14;
    LODWORD(v193) = v126 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v126 >> 17;
    LODWORD(v196) = v126 >> 18;
    LODWORD(v198) = v126 >> 19;
    LODWORD(v200) = v126 >> 20;
    LODWORD(v201) = v126 >> 21;
    LODWORD(v101) = v125 >> 5;
    LODWORD(v102) = v125 >> 6;
    LODWORD(v103) = v125 >> 7;
    LODWORD(v104) = v125 >> 8;
    LODWORD(v105) = v125 >> 9;
    LODWORD(v106) = v125 >> 10;
    LODWORD(v107) = v125 >> 11;
    LODWORD(v108) = v125 >> 12;
    LODWORD(v109) = v125 >> 13;
    LODWORD(v110) = v125 >> 14;
    unint64_t v111 = v125 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v125 >> 17;
    unint64_t v114 = v125 >> 18;
    LODWORD(v197) = v125 >> 19;
    LODWORD(v199) = v125 >> 20;
    unint64_t v115 = v125 >> 21;
  }
  int v127 = v101 & 1;
  if (v127 != (v92 & 1)) {
    goto LABEL_229;
  }
  if (v127)
  {
    int assetSource = self->_assetSource;
    if (assetSource != objc_msgSend(v4, "assetSource", v114, v115, v113, v112, v98, v111)) {
      goto LABEL_229;
    }
    unsigned int v129 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v130 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v93) = v130 >> 6;
    LODWORD(v94) = v130 >> 7;
    LODWORD(v95) = v130 >> 8;
    LODWORD(v96) = v130 >> 9;
    LODWORD(v97) = v130 >> 10;
    unint64_t v98 = v130 >> 11;
    unsigned int v131 = v130 >> 18;
    LODWORD(v190) = v130 >> 12;
    LODWORD(v191) = v130 >> 13;
    LODWORD(v192) = v130 >> 14;
    LODWORD(v193) = v130 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v130 >> 17;
    LODWORD(v198) = v130 >> 19;
    LODWORD(v200) = v130 >> 20;
    LODWORD(v201) = v130 >> 21;
    LODWORD(v102) = v129 >> 6;
    LODWORD(v103) = v129 >> 7;
    LODWORD(v104) = v129 >> 8;
    LODWORD(v105) = v129 >> 9;
    LODWORD(v106) = v129 >> 10;
    LODWORD(v107) = v129 >> 11;
    LODWORD(v108) = v129 >> 12;
    LODWORD(v109) = v129 >> 13;
    LODWORD(v110) = v129 >> 14;
    unint64_t v111 = v129 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v129 >> 17;
    unint64_t v114 = v129 >> 18;
    LOBYTE(v196) = v131;
    LODWORD(v197) = v129 >> 19;
    LODWORD(v199) = v129 >> 20;
    unint64_t v115 = v129 >> 21;
  }
  if ((v102 & 1) != (v93 & 1)) {
    goto LABEL_229;
  }
  if (v102)
  {
    int assetLocation = self->_assetLocation;
    if (assetLocation != objc_msgSend(v4, "assetLocation", v114, v115, v113, v112, v98, v111)) {
      goto LABEL_229;
    }
    unsigned int v133 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v134 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v94) = v134 >> 7;
    LODWORD(v95) = v134 >> 8;
    LODWORD(v96) = v134 >> 9;
    LODWORD(v97) = v134 >> 10;
    unint64_t v98 = v134 >> 11;
    unsigned int v135 = v134 >> 18;
    unsigned int v136 = v134 >> 19;
    LODWORD(v190) = v134 >> 12;
    LODWORD(v191) = v134 >> 13;
    LODWORD(v192) = v134 >> 14;
    LODWORD(v193) = v134 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v134 >> 17;
    LODWORD(v200) = v134 >> 20;
    LODWORD(v201) = v134 >> 21;
    LODWORD(v103) = v133 >> 7;
    LODWORD(v104) = v133 >> 8;
    LODWORD(v105) = v133 >> 9;
    LODWORD(v106) = v133 >> 10;
    LODWORD(v107) = v133 >> 11;
    LODWORD(v108) = v133 >> 12;
    LODWORD(v109) = v133 >> 13;
    LODWORD(v110) = v133 >> 14;
    unint64_t v111 = v133 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v133 >> 17;
    unint64_t v114 = v133 >> 18;
    LOBYTE(v196) = v135;
    LODWORD(v197) = v133 >> 19;
    LOBYTE(v198) = v136;
    LODWORD(v199) = v133 >> 20;
    unint64_t v115 = v133 >> 21;
  }
  if ((v103 & 1) != (v94 & 1)) {
    goto LABEL_229;
  }
  if (v103)
  {
    int subscriptionType = self->_subscriptionType;
    if (subscriptionType != objc_msgSend(v4, "subscriptionType", v114, v115, v113, v112, v98, v111)) {
      goto LABEL_229;
    }
    unsigned int v138 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v139 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v95) = v139 >> 8;
    LODWORD(v96) = v139 >> 9;
    LODWORD(v97) = v139 >> 10;
    unint64_t v98 = v139 >> 11;
    unsigned int v140 = v139 >> 18;
    unsigned int v141 = v139 >> 19;
    LODWORD(v190) = v139 >> 12;
    LODWORD(v191) = v139 >> 13;
    LODWORD(v192) = v139 >> 14;
    LODWORD(v193) = v139 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v139 >> 17;
    LODWORD(v200) = v139 >> 20;
    LODWORD(v201) = v139 >> 21;
    LODWORD(v104) = v138 >> 8;
    LODWORD(v105) = v138 >> 9;
    LODWORD(v106) = v138 >> 10;
    LODWORD(v107) = v138 >> 11;
    LODWORD(v108) = v138 >> 12;
    LODWORD(v109) = v138 >> 13;
    LODWORD(v110) = v138 >> 14;
    unint64_t v111 = v138 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v138 >> 17;
    unint64_t v114 = v138 >> 18;
    LOBYTE(v196) = v140;
    LODWORD(v197) = v138 >> 19;
    LOBYTE(v198) = v141;
    LODWORD(v199) = v138 >> 20;
    unint64_t v115 = v138 >> 21;
  }
  if ((v104 & 1) != (v95 & 1)) {
    goto LABEL_229;
  }
  if (v104)
  {
    int hasLookupWaitTime = self->_hasLookupWaitTime;
    if (hasLookupWaitTime != objc_msgSend(v4, "hasLookupWaitTime", v114, v115, v113, v112, v98, v111)) {
      goto LABEL_229;
    }
    unsigned int v143 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v144 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v96) = v144 >> 9;
    LODWORD(v97) = v144 >> 10;
    unint64_t v98 = v144 >> 11;
    unsigned int v145 = v144 >> 18;
    unsigned int v146 = v144 >> 19;
    LODWORD(v190) = v144 >> 12;
    LODWORD(v191) = v144 >> 13;
    LODWORD(v192) = v144 >> 14;
    LODWORD(v193) = v144 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v144 >> 17;
    LODWORD(v200) = v144 >> 20;
    LODWORD(v201) = v144 >> 21;
    LODWORD(v105) = v143 >> 9;
    LODWORD(v106) = v143 >> 10;
    LODWORD(v107) = v143 >> 11;
    LODWORD(v108) = v143 >> 12;
    LODWORD(v109) = v143 >> 13;
    LODWORD(v110) = v143 >> 14;
    unint64_t v111 = v143 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v143 >> 17;
    unint64_t v114 = v143 >> 18;
    LOBYTE(v196) = v145;
    LODWORD(v197) = v143 >> 19;
    LOBYTE(v198) = v146;
    LODWORD(v199) = v143 >> 20;
    unint64_t v115 = v143 >> 21;
  }
  int v147 = v105 & 1;
  if (v147 != (v96 & 1)) {
    goto LABEL_229;
  }
  if (v147)
  {
    int hasBagWaitTime = self->_hasBagWaitTime;
    if (hasBagWaitTime != objc_msgSend(v4, "hasBagWaitTime", v114, v115, v113, v112, v98, v111)) {
      goto LABEL_229;
    }
    unsigned int v149 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v150 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v97) = v150 >> 10;
    unint64_t v98 = v150 >> 11;
    LODWORD(v106) = v149 >> 10;
    LODWORD(v107) = v149 >> 11;
    LODWORD(v190) = v150 >> 12;
    LODWORD(v191) = v150 >> 13;
    LODWORD(v192) = v150 >> 14;
    LODWORD(v193) = v150 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v150 >> 17;
    LODWORD(v200) = v150 >> 20;
    LODWORD(v201) = v150 >> 21;
    LODWORD(v108) = v149 >> 12;
    LODWORD(v109) = v149 >> 13;
    LODWORD(v110) = v149 >> 14;
    unint64_t v111 = v149 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v149 >> 17;
    unint64_t v114 = v149 >> 18;
    LODWORD(v196) = v150 >> 18;
    LODWORD(v197) = v149 >> 19;
    LODWORD(v198) = v150 >> 19;
    LODWORD(v199) = v149 >> 20;
    unint64_t v115 = v149 >> 21;
  }
  if ((v106 & 1) != (v97 & 1)) {
    goto LABEL_229;
  }
  if (v106)
  {
    int hasLeaseWaitTime = self->_hasLeaseWaitTime;
    if (hasLeaseWaitTime != objc_msgSend(v4, "hasLeaseWaitTime", v114, v115, v113, v112, v98, v111)) {
      goto LABEL_229;
    }
    unsigned int v152 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v153 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v98) = v153 >> 11;
    LODWORD(v107) = v152 >> 11;
    LODWORD(v108) = v152 >> 12;
    LODWORD(v109) = v152 >> 13;
    LODWORD(v190) = v153 >> 12;
    LODWORD(v191) = v153 >> 13;
    LODWORD(v192) = v153 >> 14;
    LODWORD(v193) = v153 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v153 >> 17;
    LODWORD(v200) = v153 >> 20;
    LODWORD(v201) = v153 >> 21;
    LODWORD(v110) = v152 >> 14;
    LODWORD(v111) = v152 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v152 >> 17;
    unint64_t v114 = v152 >> 18;
    LODWORD(v196) = v153 >> 18;
    LODWORD(v197) = v152 >> 19;
    LODWORD(v198) = v153 >> 19;
    LODWORD(v199) = v152 >> 20;
    unint64_t v115 = v152 >> 21;
  }
  if ((v107 & 1) != (v98 & 1)) {
    goto LABEL_229;
  }
  if (v107)
  {
    int hasSuzeLeaseWaitTime = self->_hasSuzeLeaseWaitTime;
    if (hasSuzeLeaseWaitTime != objc_msgSend(v4, "hasSuzeLeaseWaitTime", v114, v115, v113, v112)) {
      goto LABEL_229;
    }
    unsigned int v155 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v156 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v108) = v155 >> 12;
    LODWORD(v109) = v155 >> 13;
    LODWORD(v110) = v155 >> 14;
    LODWORD(v111) = v155 >> 15;
    LODWORD(v190) = v156 >> 12;
    LODWORD(v191) = v156 >> 13;
    LODWORD(v192) = v156 >> 14;
    LODWORD(v193) = v156 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v156 >> 17;
    LODWORD(v200) = v156 >> 20;
    LODWORD(v201) = v156 >> 21;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v155 >> 17;
    unint64_t v114 = v155 >> 18;
    LODWORD(v196) = v156 >> 18;
    LODWORD(v197) = v155 >> 19;
    LODWORD(v198) = v156 >> 19;
    LODWORD(v199) = v155 >> 20;
    unint64_t v115 = v155 >> 21;
  }
  if ((v108 & 1) != (v190 & 1)) {
    goto LABEL_229;
  }
  if (v108)
  {
    int hasSubscriptionAssetLoadWaitTime = self->_hasSubscriptionAssetLoadWaitTime;
    if (hasSubscriptionAssetLoadWaitTime != objc_msgSend(v4, "hasSubscriptionAssetLoadWaitTime", v114, v115, v113, v112))goto LABEL_229; {
    unsigned int v158 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    }
    unsigned int v159 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v109) = v158 >> 13;
    LODWORD(v110) = v158 >> 14;
    LODWORD(v111) = v158 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v158 >> 17;
    LODWORD(v191) = v159 >> 13;
    LODWORD(v192) = v159 >> 14;
    LODWORD(v193) = v159 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v159 >> 17;
    LODWORD(v196) = v159 >> 18;
    LODWORD(v200) = v159 >> 20;
    LODWORD(v201) = v159 >> 21;
    unint64_t v114 = v158 >> 18;
    LODWORD(v197) = v158 >> 19;
    LODWORD(v198) = v159 >> 19;
    LODWORD(v199) = v158 >> 20;
    unint64_t v115 = v158 >> 21;
  }
  if ((v109 & 1) != (v191 & 1)) {
    goto LABEL_229;
  }
  if (v109)
  {
    int hasMediaRedownloadWaitTime = self->_hasMediaRedownloadWaitTime;
    if (hasMediaRedownloadWaitTime != objc_msgSend(v4, "hasMediaRedownloadWaitTime", v114, v115, v113, v112))goto LABEL_229; {
    unsigned int v161 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    }
    unsigned int v162 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v110) = v161 >> 14;
    LODWORD(v111) = v161 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v161 >> 17;
    unint64_t v114 = v161 >> 18;
    LODWORD(v192) = v162 >> 14;
    LODWORD(v193) = v162 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v162 >> 17;
    LODWORD(v200) = v162 >> 20;
    LODWORD(v201) = v162 >> 21;
    LODWORD(v196) = v162 >> 18;
    LODWORD(v197) = v161 >> 19;
    LODWORD(v198) = v162 >> 19;
    LODWORD(v199) = v161 >> 20;
    unint64_t v115 = v161 >> 21;
  }
  if ((v110 & 1) != (v192 & 1)) {
    goto LABEL_229;
  }
  if (v110)
  {
    unsigned int cmInitialStartupItemCreationToReadyToPlayDurationInMs = self->_cmInitialStartupItemCreationToReadyToPlayDurationInMs;
    if (cmInitialStartupItemCreationToReadyToPlayDurationInMs != objc_msgSend(v4, "cmInitialStartupItemCreationToReadyToPlayDurationInMs", v114, v115, v113, v112))goto LABEL_229; {
    unsigned int v164 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    }
    unsigned int v165 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v111) = v164 >> 15;
    unint64_t v112 = *((unsigned __int8 *)&self->_has + 6);
    unint64_t v113 = v164 >> 17;
    unint64_t v114 = v164 >> 18;
    unint64_t v115 = v164 >> 21;
    LODWORD(v193) = v165 >> 15;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v165 >> 17;
    LODWORD(v196) = v165 >> 18;
    LODWORD(v200) = v165 >> 20;
    LODWORD(v201) = v165 >> 21;
    LODWORD(v197) = v164 >> 19;
    LODWORD(v198) = v165 >> 19;
    LODWORD(v199) = v164 >> 20;
  }
  if ((v111 & 1) != (v193 & 1)) {
    goto LABEL_229;
  }
  if (v111)
  {
    unsigned int cmInitialStartupItemCreationToLtluDurationInMs = self->_cmInitialStartupItemCreationToLtluDurationInMs;
    if (cmInitialStartupItemCreationToLtluDurationInMs != objc_msgSend(v4, "cmInitialStartupItemCreationToLtluDurationInMs", v114, v115, v113, v112))goto LABEL_229; {
    unsigned int v167 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    }
    unsigned int v168 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LOBYTE(v112) = *((unsigned char *)&self->_has + 6);
    unint64_t v113 = v167 >> 17;
    unint64_t v114 = v167 >> 18;
    unint64_t v115 = v167 >> 21;
    LOBYTE(v194) = *((unsigned char *)v4 + 182);
    LODWORD(v195) = v168 >> 17;
    LODWORD(v200) = v168 >> 20;
    LODWORD(v201) = v168 >> 21;
    LODWORD(v196) = v168 >> 18;
    LODWORD(v197) = v167 >> 19;
    LODWORD(v198) = v168 >> 19;
    LODWORD(v199) = v167 >> 20;
  }
  if ((v112 & 1) != (v194 & 1)) {
    goto LABEL_229;
  }
  if (v112)
  {
    unsigned int masterPlaylistConnectionTlsHandshakeDurationInMs = self->_masterPlaylistConnectionTlsHandshakeDurationInMs;
    if (masterPlaylistConnectionTlsHandshakeDurationInMs != objc_msgSend(v4, "masterPlaylistConnectionTlsHandshakeDurationInMs", v114, v115, v113))goto LABEL_229; {
    unsigned int v170 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    }
    unsigned int v171 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v113) = v170 >> 17;
    unint64_t v114 = v170 >> 18;
    unint64_t v115 = v170 >> 21;
    LODWORD(v195) = v171 >> 17;
    LODWORD(v196) = v171 >> 18;
    LODWORD(v200) = v171 >> 20;
    LODWORD(v201) = v171 >> 21;
    LODWORD(v197) = v170 >> 19;
    LODWORD(v198) = v171 >> 19;
    LODWORD(v199) = v170 >> 20;
  }
  if ((v113 & 1) != (v195 & 1)) {
    goto LABEL_229;
  }
  if (v113)
  {
    unsigned int masterPlaylistRequestDurationInMs = self->_masterPlaylistRequestDurationInMs;
    if (masterPlaylistRequestDurationInMs != objc_msgSend(v4, "masterPlaylistRequestDurationInMs", v114, v115))goto LABEL_229; {
    unsigned int v173 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    }
    unsigned int v174 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v114) = v173 >> 18;
    LODWORD(v115) = v173 >> 21;
    LODWORD(v200) = v174 >> 20;
    LODWORD(v201) = v174 >> 21;
    LODWORD(v196) = v174 >> 18;
    LODWORD(v197) = v173 >> 19;
    LODWORD(v198) = v174 >> 19;
    LODWORD(v199) = v173 >> 20;
  }
  if ((v114 & 1) != (v196 & 1)) {
    goto LABEL_229;
  }
  if (v114)
  {
    unsigned int subPlaylistConnectionTlsHandshakeDurationInMs = self->_subPlaylistConnectionTlsHandshakeDurationInMs;
    if (subPlaylistConnectionTlsHandshakeDurationInMs != [v4 subPlaylistConnectionTlsHandshakeDurationInMs])goto LABEL_229; {
    unsigned int v176 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    }
    unsigned int v177 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v115) = v176 >> 21;
    LODWORD(v200) = v177 >> 20;
    LODWORD(v201) = v177 >> 21;
    LODWORD(v197) = v176 >> 19;
    LODWORD(v198) = v177 >> 19;
    LODWORD(v199) = v176 >> 20;
  }
  if ((v197 & 1) != (v198 & 1)) {
    goto LABEL_229;
  }
  if (v197)
  {
    unsigned int subPlaylistRequestDurationInMs = self->_subPlaylistRequestDurationInMs;
    if (subPlaylistRequestDurationInMs != [v4 subPlaylistRequestDurationInMs]) {
      goto LABEL_229;
    }
    unsigned int v179 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    unsigned int v180 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v115) = v179 >> 21;
    LODWORD(v200) = v180 >> 20;
    LODWORD(v201) = v180 >> 21;
    LODWORD(v199) = v179 >> 20;
  }
  if ((v199 & 1) != (v200 & 1)) {
    goto LABEL_229;
  }
  if (v199)
  {
    unsigned int contentConnectionTlsHandshakeDurationInMs = self->_contentConnectionTlsHandshakeDurationInMs;
    if (contentConnectionTlsHandshakeDurationInMs != [v4 contentConnectionTlsHandshakeDurationInMs])goto LABEL_229; {
    LODWORD(v115) = *((unsigned __int8 *)&self->_has + 6) >> 5;
    }
    LODWORD(v201) = *((unsigned __int8 *)v4 + 182) >> 5;
  }
  if ((v115 & 1) != (v201 & 1)) {
    goto LABEL_229;
  }
  if (v115)
  {
    unsigned int contentFirstSegmentDurationInMs = self->_contentFirstSegmentDurationInMs;
    if (contentFirstSegmentDurationInMs != [v4 contentFirstSegmentDurationInMs]) {
      goto LABEL_229;
    }
  }
  unsigned int v79 = [(MWTSchemaMWTMusicMetadataReported *)self audioQueueType];
  v80 = [v4 audioQueueType];
  if ((v79 == 0) == (v80 != 0))
  {
LABEL_228:

    goto LABEL_229;
  }
  uint64_t v183 = [(MWTSchemaMWTMusicMetadataReported *)self audioQueueType];
  if (!v183)
  {

LABEL_232:
    BOOL v188 = 1;
    goto LABEL_230;
  }
  v184 = (void *)v183;
  v185 = [(MWTSchemaMWTMusicMetadataReported *)self audioQueueType];
  v186 = [v4 audioQueueType];
  char v187 = [v185 isEqual:v186];

  if (v187) {
    goto LABEL_232;
  }
LABEL_229:
  BOOL v188 = 0;
LABEL_230:

  return v188;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = *(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                      + 6) << 16)) << 32);
  if (*(unsigned char *)&v4)
  {
    PBDataWriterWriteInt32Field();
    $3A707FEDEB8D4B451EE4458D3B539123 v10 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    unint64_t v5 = *(void *)&v10 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                         + 6) << 16)) << 32);
    if ((*(unsigned char *)&v10 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_66;
    }
  }
  else if ((*(unsigned char *)&v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_20:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_22:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_23:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_24:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_96:
  PBDataWriterWriteBOOLField();
  if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32)) & 0x200000000) != 0)
LABEL_35:
    PBDataWriterWriteBOOLField();
LABEL_36:
  uint64_t v6 = [(MWTSchemaMWTMusicMetadataReported *)self errorResolutionType];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x400000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32);
    if ((v7 & 0x800000000) == 0)
    {
LABEL_40:
      if ((v7 & 0x1000000000) == 0) {
        goto LABEL_41;
      }
      goto LABEL_100;
    }
  }
  else if ((v7 & 0x800000000) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteInt32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x1000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x2000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x2000000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x4000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x4000000000) == 0)
  {
LABEL_43:
    if ((v7 & 0x8000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteInt32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x8000000000) == 0)
  {
LABEL_44:
    if ((v7 & 0x10000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteInt32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x20000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteBOOLField();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_46:
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteBOOLField();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_47:
    if ((v7 & 0x80000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x80000000000) == 0)
  {
LABEL_48:
    if ((v7 & 0x100000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteBOOLField();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x100000000000) == 0)
  {
LABEL_49:
    if ((v7 & 0x200000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteBOOLField();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x200000000000) == 0)
  {
LABEL_50:
    if ((v7 & 0x400000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteBOOLField();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x400000000000) == 0)
  {
LABEL_51:
    if ((v7 & 0x800000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x800000000000) == 0)
  {
LABEL_52:
    if ((v7 & 0x1000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x1000000000000) == 0)
  {
LABEL_53:
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x2000000000000) == 0)
  {
LABEL_54:
    if ((v7 & 0x4000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x4000000000000) == 0)
  {
LABEL_55:
    if ((v7 & 0x8000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((v7 & 0x10000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint32Field();
  unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x10000000000000) == 0)
  {
LABEL_57:
    if ((v7 & 0x20000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_116:
  PBDataWriterWriteUint32Field();
  if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32)) & 0x20000000000000) != 0)
LABEL_58:
    PBDataWriterWriteUint32Field();
LABEL_59:
  unint64_t v8 = [(MWTSchemaMWTMusicMetadataReported *)self audioQueueType];

  NSUInteger v9 = v11;
  if (v8)
  {
    PBDataWriterWriteStringField();
    NSUInteger v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MWTSchemaMWTMusicMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAudioQueueType
{
}

- (BOOL)hasAudioQueueType
{
  return self->_audioQueueType != 0;
}

- (void)deleteContentFirstSegmentDurationInMs
{
  [(MWTSchemaMWTMusicMetadataReported *)self setContentFirstSegmentDurationInMs:0];
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  unint64_t v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFDFFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v4);
}

- (void)setHasContentFirstSegmentDurationInMs:(BOOL)a3
{
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  uint64_t v4 = 0x20000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFDFFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v5);
}

- (BOOL)hasContentFirstSegmentDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setContentFirstSegmentDurationInMs:(unsigned int)a3
{
  unint64_t v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x20000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((unsigned char *)&self->_has + 6) = BYTE6(v3);
  self->_unsigned int contentFirstSegmentDurationInMs = a3;
}

- (void)deleteContentConnectionTlsHandshakeDurationInMs
{
  [(MWTSchemaMWTMusicMetadataReported *)self setContentConnectionTlsHandshakeDurationInMs:0];
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  unint64_t v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFEFFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v4);
}

- (void)setHasContentConnectionTlsHandshakeDurationInMs:(BOOL)a3
{
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  uint64_t v4 = 0x10000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFEFFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v5);
}

- (BOOL)hasContentConnectionTlsHandshakeDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setContentConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  unint64_t v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x10000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((unsigned char *)&self->_has + 6) = BYTE6(v3);
  self->_unsigned int contentConnectionTlsHandshakeDurationInMs = a3;
}

- (void)deleteSubPlaylistRequestDurationInMs
{
  [(MWTSchemaMWTMusicMetadataReported *)self setSubPlaylistRequestDurationInMs:0];
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  unint64_t v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFF7FFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v4);
}

- (void)setHasSubPlaylistRequestDurationInMs:(BOOL)a3
{
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  uint64_t v4 = 0x8000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFF7FFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v5);
}

- (BOOL)hasSubPlaylistRequestDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setSubPlaylistRequestDurationInMs:(unsigned int)a3
{
  unint64_t v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x8000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((unsigned char *)&self->_has + 6) = BYTE6(v3);
  self->_unsigned int subPlaylistRequestDurationInMs = a3;
}

- (void)deleteSubPlaylistConnectionTlsHandshakeDurationInMs
{
  [(MWTSchemaMWTMusicMetadataReported *)self setSubPlaylistConnectionTlsHandshakeDurationInMs:0];
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  unint64_t v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFBFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v4);
}

- (void)setHasSubPlaylistConnectionTlsHandshakeDurationInMs:(BOOL)a3
{
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  uint64_t v4 = 0x4000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFBFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v5);
}

- (BOOL)hasSubPlaylistConnectionTlsHandshakeDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setSubPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  unint64_t v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x4000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((unsigned char *)&self->_has + 6) = BYTE6(v3);
  self->_unsigned int subPlaylistConnectionTlsHandshakeDurationInMs = a3;
}

- (void)deleteMasterPlaylistRequestDurationInMs
{
  [(MWTSchemaMWTMusicMetadataReported *)self setMasterPlaylistRequestDurationInMs:0];
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  unint64_t v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFDFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v4);
}

- (void)setHasMasterPlaylistRequestDurationInMs:(BOOL)a3
{
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  uint64_t v4 = 0x2000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFDFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v5);
}

- (BOOL)hasMasterPlaylistRequestDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setMasterPlaylistRequestDurationInMs:(unsigned int)a3
{
  unint64_t v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x2000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((unsigned char *)&self->_has + 6) = BYTE6(v3);
  self->_unsigned int masterPlaylistRequestDurationInMs = a3;
}

- (void)deleteMasterPlaylistConnectionTlsHandshakeDurationInMs
{
  [(MWTSchemaMWTMusicMetadataReported *)self setMasterPlaylistConnectionTlsHandshakeDurationInMs:0];
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  unint64_t v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFEFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v4);
}

- (void)setHasMasterPlaylistConnectionTlsHandshakeDurationInMs:(BOOL)a3
{
  uint64_t v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  uint64_t v4 = 0x1000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFEFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = BYTE6(v5);
}

- (BOOL)hasMasterPlaylistConnectionTlsHandshakeDurationInMs
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (void)setMasterPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  unint64_t v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x1000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((unsigned char *)&self->_has + 6) = BYTE6(v3);
  self->_unsigned int masterPlaylistConnectionTlsHandshakeDurationInMs = a3;
}

- (void)deleteCmInitialStartupItemCreationToLtluDurationInMs
{
  [(MWTSchemaMWTMusicMetadataReported *)self setCmInitialStartupItemCreationToLtluDurationInMs:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFF7FFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasCmInitialStartupItemCreationToLtluDurationInMs:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x800000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFF7FFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasCmInitialStartupItemCreationToLtluDurationInMs
{
  return *((unsigned __int16 *)&self->_has + 2) >> 15;
}

- (void)setCmInitialStartupItemCreationToLtluDurationInMs:(unsigned int)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x800000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_unsigned int cmInitialStartupItemCreationToLtluDurationInMs = a3;
}

- (void)deleteCmInitialStartupItemCreationToReadyToPlayDurationInMs
{
  [(MWTSchemaMWTMusicMetadataReported *)self setCmInitialStartupItemCreationToReadyToPlayDurationInMs:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFBFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasCmInitialStartupItemCreationToReadyToPlayDurationInMs:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x400000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFBFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasCmInitialStartupItemCreationToReadyToPlayDurationInMs
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 14) & 1;
}

- (void)setCmInitialStartupItemCreationToReadyToPlayDurationInMs:(unsigned int)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x400000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_unsigned int cmInitialStartupItemCreationToReadyToPlayDurationInMs = a3;
}

- (void)deleteHasMediaRedownloadWaitTime
{
  [(MWTSchemaMWTMusicMetadataReported *)self setHasMediaRedownloadWaitTime:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFDFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasHasMediaRedownloadWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x200000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFDFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasHasMediaRedownloadWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 13) & 1;
}

- (void)setHasMediaRedownloadWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x200000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int hasMediaRedownloadWaitTime = a3;
}

- (void)deleteHasSubscriptionAssetLoadWaitTime
{
  [(MWTSchemaMWTMusicMetadataReported *)self setHasSubscriptionAssetLoadWaitTime:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFEFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasHasSubscriptionAssetLoadWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x100000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFEFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasHasSubscriptionAssetLoadWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 12) & 1;
}

- (void)setHasSubscriptionAssetLoadWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x100000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int hasSubscriptionAssetLoadWaitTime = a3;
}

- (void)deleteHasSuzeLeaseWaitTime
{
  [(MWTSchemaMWTMusicMetadataReported *)self setHasSuzeLeaseWaitTime:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFF7FFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasHasSuzeLeaseWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x80000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFF7FFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasHasSuzeLeaseWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 11) & 1;
}

- (void)setHasSuzeLeaseWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x80000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int hasSuzeLeaseWaitTime = a3;
}

- (void)deleteHasLeaseWaitTime
{
  [(MWTSchemaMWTMusicMetadataReported *)self setHasLeaseWaitTime:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFBFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasHasLeaseWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x40000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFBFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasHasLeaseWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 10) & 1;
}

- (void)setHasLeaseWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x40000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int hasLeaseWaitTime = a3;
}

- (void)deleteHasBagWaitTime
{
  [(MWTSchemaMWTMusicMetadataReported *)self setHasBagWaitTime:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFDFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasHasBagWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x20000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFDFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasHasBagWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 9) & 1;
}

- (void)setHasBagWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x20000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int hasBagWaitTime = a3;
}

- (void)deleteHasLookupWaitTime
{
  [(MWTSchemaMWTMusicMetadataReported *)self setHasLookupWaitTime:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFEFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasHasLookupWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x10000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFEFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasHasLookupWaitTime
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setHasLookupWaitTime:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x10000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int hasLookupWaitTime = a3;
}

- (void)deleteSubscriptionType
{
  [(MWTSchemaMWTMusicMetadataReported *)self setSubscriptionType:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFF7FFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasSubscriptionType:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x8000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFF7FFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasSubscriptionType
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 7) & 1;
}

- (void)setSubscriptionType:(int)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x8000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int subscriptionType = a3;
}

- (void)deleteAssetLocation
{
  [(MWTSchemaMWTMusicMetadataReported *)self setAssetLocation:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFBFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasAssetLocation:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x4000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFBFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasAssetLocation
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 6) & 1;
}

- (void)setAssetLocation:(int)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x4000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int assetLocation = a3;
}

- (void)deleteAssetSource
{
  [(MWTSchemaMWTMusicMetadataReported *)self setAssetSource:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFDFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasAssetSource:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x2000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFDFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasAssetSource
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 5) & 1;
}

- (void)setAssetSource:(int)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x2000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int assetSource = a3;
}

- (void)deleteFormatLayoutValue
{
  [(MWTSchemaMWTMusicMetadataReported *)self setFormatLayoutValue:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFEFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasFormatLayoutValue:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x1000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasFormatLayoutValue
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 4) & 1;
}

- (void)setFormatLayoutValue:(unsigned int)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x1000000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_unsigned int formatLayoutValue = a3;
}

- (void)deleteRouteType
{
  [(MWTSchemaMWTMusicMetadataReported *)self setRouteType:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFF7FFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasRouteType:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x800000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFF7FFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasRouteType
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 3) & 1;
}

- (void)setRouteType:(int)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x800000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int routeType = a3;
}

- (void)deleteEndPointType
{
  [(MWTSchemaMWTMusicMetadataReported *)self setEndPointType:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFBFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasEndPointType:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x400000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFBFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasEndPointType
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 2) & 1;
}

- (void)setEndPointType:(int)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x400000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int endPointType = a3;
}

- (void)deleteErrorResolutionType
{
}

- (BOOL)hasErrorResolutionType
{
  return self->_errorResolutionType != 0;
}

- (void)deleteIsPrimaryUser
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsPrimaryUser:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFDFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasIsPrimaryUser:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x200000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasIsPrimaryUser
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x200000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int isPrimaryUser = a3;
}

- (void)deleteWasMediaLibraryDatabaseUpgraded
{
  [(MWTSchemaMWTMusicMetadataReported *)self setWasMediaLibraryDatabaseUpgraded:0];
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  $3A707FEDEB8D4B451EE4458D3B539123 v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  unint64_t v5 = (*(void *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasWasMediaLibraryDatabaseUpgraded:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  uint64_t v4 = 0x100000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasWasMediaLibraryDatabaseUpgraded
{
  return *((_WORD *)&self->_has + 2) & 1;
}

- (void)setWasMediaLibraryDatabaseUpgraded:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->_has + 6);
  unint64_t v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x100000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_int wasMediaLibraryDatabaseUpgraded = a3;
}

- (void)deleteNetworkConnectionType
{
  [(MWTSchemaMWTMusicMetadataReported *)self setNetworkConnectionType:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x80000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasNetworkConnectionType:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  unsigned int v5 = 0x80000000;
  if (!a3) {
    unsigned int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0x7FFFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasNetworkConnectionType
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setNetworkConnectionType:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x80000000;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int networkConnectionType = a3;
}

- (void)deleteIsSuzeLease
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsSuzeLease:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x40000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsSuzeLease:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x40000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xBFFFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsSuzeLease
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 30) & 1;
}

- (void)setIsSuzeLease:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x40000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isSuzeLease = a3;
}

- (void)deleteIsSharePlayPlayback
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsSharePlayPlayback:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x20000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsSharePlayPlayback:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x20000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xDFFFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsSharePlayPlayback
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 29) & 1;
}

- (void)setIsSharePlayPlayback:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x20000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isSharePlayPlayback = a3;
}

- (void)deleteIsMiniSinfAvailable
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsMiniSinfAvailable:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x10000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsMiniSinfAvailable:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x10000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xEFFFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsMiniSinfAvailable
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 28) & 1;
}

- (void)setIsMiniSinfAvailable:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x10000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isMiniSinfAvailable = a3;
}

- (void)deleteIsFirstPlayAfterAppLaunch
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsFirstPlayAfterAppLaunch:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x8000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsFirstPlayAfterAppLaunch:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x8000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xF7FFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsFirstPlayAfterAppLaunch
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 27) & 1;
}

- (void)setIsFirstPlayAfterAppLaunch:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x8000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isFirstPlayAfterAppLaunch = a3;
}

- (void)deleteIsAutoPlay
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsAutoPlay:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x4000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsAutoPlay:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x4000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFBFFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsAutoPlay
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 26) & 1;
}

- (void)setIsAutoPlay:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x4000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isAutoPlay = a3;
}

- (void)deleteIsNonDefaultUser
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsNonDefaultUser:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x2000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsNonDefaultUser:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x2000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFDFFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsNonDefaultUser
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 25) & 1;
}

- (void)setIsNonDefaultUser:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x2000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isNonDefaultUser = a3;
}

- (void)deleteIsDelegatedPlayback
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsDelegatedPlayback:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x1000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsDelegatedPlayback:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x1000000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFEFFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsDelegatedPlayback
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 24) & 1;
}

- (void)setIsDelegatedPlayback:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x1000000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isDelegatedPlayback = a3;
}

- (void)deleteIsRemoteSetQueue
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsRemoteSetQueue:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x800000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsRemoteSetQueue:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x800000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFF7FFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsRemoteSetQueue
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 23) & 1;
}

- (void)setIsRemoteSetQueue:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x800000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isRemoteSetQueue = a3;
}

- (void)deleteIsInterruptingPlayback
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsInterruptingPlayback:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x400000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsInterruptingPlayback:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x400000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFBFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsInterruptingPlayback
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 22) & 1;
}

- (void)setIsInterruptingPlayback:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x400000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isInterruptingPlayback = a3;
}

- (void)deleteIsHlsKeysReady
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsHlsKeysReady:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x200000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsHlsKeysReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x200000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFDFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsHlsKeysReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 21) & 1;
}

- (void)setIsHlsKeysReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x200000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isHlsKeysReady = a3;
}

- (void)deleteIsOfflineKeyReady
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsOfflineKeyReady:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x100000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsOfflineKeyReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x100000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFEFFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsOfflineKeyReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 20) & 1;
}

- (void)setIsOfflineKeyReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x100000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isOfflineKeyReady = a3;
}

- (void)deleteIsOnlineKeyReady
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsOnlineKeyReady:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x80000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsOnlineKeyReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x80000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFF7FFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsOnlineKeyReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 19) & 1;
}

- (void)setIsOnlineKeyReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x80000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isOnlineKeyReady = a3;
}

- (void)deleteIsLeaseReady
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsLeaseReady:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x40000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsLeaseReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x40000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFBFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsLeaseReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 18) & 1;
}

- (void)setIsLeaseReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x40000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isLeaseReady = a3;
}

- (void)deleteIsStoreBagReady
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsStoreBagReady:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x20000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsStoreBagReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x20000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFDFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsStoreBagReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 17) & 1;
}

- (void)setIsStoreBagReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x20000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isStoreBagReady = a3;
}

- (void)deleteIsAccountDataReady
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsAccountDataReady:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x10000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsAccountDataReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x10000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFEFFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsAccountDataReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 16) & 1;
}

- (void)setIsAccountDataReady:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x10000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isAccountDataReady = a3;
}

- (void)deleteRouteConfiguration
{
  [(MWTSchemaMWTMusicMetadataReported *)self setRouteConfiguration:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x8000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasRouteConfiguration:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x8000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFF7FFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasRouteConfiguration
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 15) & 1;
}

- (void)setRouteConfiguration:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x8000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int routeConfiguration = a3;
}

- (void)deleteNumberOfSpeakers
{
  [(MWTSchemaMWTMusicMetadataReported *)self setNumberOfSpeakers:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x4000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasNumberOfSpeakers:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x4000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFBFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasNumberOfSpeakers
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 14) & 1;
}

- (void)setNumberOfSpeakers:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x4000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_unsigned int numberOfSpeakers = a3;
}

- (void)deleteFormatTier
{
  [(MWTSchemaMWTMusicMetadataReported *)self setFormatTier:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x2000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasFormatTier:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 0x2000;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFDFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasFormatTier
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 13) & 1;
}

- (void)setFormatTier:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x2000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int formatTier = a3;
}

- (void)deleteFormatSampleRate
{
  [(MWTSchemaMWTMusicMetadataReported *)self setFormatSampleRate:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x1000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasFormatSampleRate:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 4096;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFEFFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasFormatSampleRate
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 12) & 1;
}

- (void)setFormatSampleRate:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x1000u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_unsigned int formatSampleRate = a3;
}

- (void)deleteFormatLayout
{
  [(MWTSchemaMWTMusicMetadataReported *)self setFormatLayout:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x800u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasFormatLayout:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 2048;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFF7FF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasFormatLayout
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 11) & 1;
}

- (void)setFormatLayout:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x800u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int formatLayout = a3;
}

- (void)deleteFormatChannels
{
  [(MWTSchemaMWTMusicMetadataReported *)self setFormatChannels:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x400u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasFormatChannels:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 1024;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFBFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasFormatChannels
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 10) & 1;
}

- (void)setFormatChannels:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x400u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_unsigned int formatChannels = a3;
}

- (void)deleteFormatBitDepth
{
  [(MWTSchemaMWTMusicMetadataReported *)self setFormatBitDepth:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x200u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasFormatBitDepth:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 512;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFDFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasFormatBitDepth
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 9) & 1;
}

- (void)setFormatBitDepth:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x200u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_unsigned int formatBitDepth = a3;
}

- (void)deleteFormatBitrate
{
  [(MWTSchemaMWTMusicMetadataReported *)self setFormatBitrate:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x100u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasFormatBitrate:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 256;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFEFF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasFormatBitrate
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 8) & 1;
}

- (void)setFormatBitrate:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x100u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_unsigned int formatBitrate = a3;
}

- (void)deleteFormatCodec
{
  [(MWTSchemaMWTMusicMetadataReported *)self setFormatCodec:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x80u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasFormatCodec:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 128;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFF7F | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasFormatCodec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 7) & 1;
}

- (void)setFormatCodec:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x80u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int formatCodec = a3;
}

- (void)deleteStreamingContentType
{
  [(MWTSchemaMWTMusicMetadataReported *)self setStreamingContentType:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x40u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasStreamingContentType:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 64;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFBF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasStreamingContentType
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 6) & 1;
}

- (void)setStreamingContentType:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x40u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int streamingContentType = a3;
}

- (void)deleteAssetEndPoint
{
  [(MWTSchemaMWTMusicMetadataReported *)self setAssetEndPoint:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x20u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasAssetEndPoint:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 32;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFDF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasAssetEndPoint
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 5) & 1;
}

- (void)setAssetEndPoint:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x20u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int assetEndPoint = a3;
}

- (void)deletePrefetchedMetadataSource
{
  [(MWTSchemaMWTMusicMetadataReported *)self setPrefetchedMetadataSource:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x10u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasPrefetchedMetadataSource:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 16;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFEF | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasPrefetchedMetadataSource
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 4) & 1;
}

- (void)setPrefetchedMetadataSource:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x10u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int prefetchedMetadataSource = a3;
}

- (void)deleteIsShuffled
{
  [(MWTSchemaMWTMusicMetadataReported *)self setIsShuffled:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~8u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasIsShuffled:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 8;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFF7 | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasIsShuffled
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 3) & 1;
}

- (void)setIsShuffled:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 8u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int isShuffled = a3;
}

- (void)deleteQueueSize
{
  [(MWTSchemaMWTMusicMetadataReported *)self setQueueSize:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~4u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasQueueSize:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 4;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFB | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasQueueSize
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 2) & 1;
}

- (void)setQueueSize:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 4u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_unsigned int queueSize = a3;
}

- (void)deleteQueueType
{
  [(MWTSchemaMWTMusicMetadataReported *)self setQueueType:0];
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~2u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setHasQueueType:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  int v5 = 2;
  if (!a3) {
    int v5 = 0;
  }
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFD | v5;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (BOOL)hasQueueType
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 1) & 1;
}

- (void)setQueueType:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 2u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int queueType = a3;
}

- (void)deleteMusicDomain
{
  [(MWTSchemaMWTMusicMetadataReported *)self setMusicDomain:0];
  __int16 v3 = *((_WORD *)&self->_has + 2);
  char v4 = *((unsigned char *)&self->_has + 6);
  *(_DWORD *)&self->_has &= ~1u;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = v4;
}

- (void)setHasMusicDomain:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_has + 2);
  char v4 = *((unsigned char *)&self->_has + 6);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFE | a3;
  *((_WORD *)&self->_has + 2) = v3;
  *((unsigned char *)&self->_has + 6) = v4;
}

- (BOOL)hasMusicDomain
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setMusicDomain:(int)a3
{
  char v3 = *((unsigned char *)&self->_has + 6);
  __int16 v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 1u;
  *((unsigned char *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_int musicDomain = a3;
}

@end