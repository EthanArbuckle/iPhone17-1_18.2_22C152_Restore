@interface _MRCommandOptionsProtobuf
- (BOOL)alwaysIgnoreDuringCall;
- (BOOL)alwaysIgnoreDuringSharePlay;
- (BOOL)beginSeek;
- (BOOL)endSeek;
- (BOOL)externalPlayerCommand;
- (BOOL)hasAlwaysIgnoreDuringCall;
- (BOOL)hasAlwaysIgnoreDuringSharePlay;
- (BOOL)hasApplicationUserIdentity;
- (BOOL)hasAssistantCommandSendTimestamp;
- (BOOL)hasAssistantTTSEndTimestamp;
- (BOOL)hasAssociatedParticipantIdentifier;
- (BOOL)hasBeginSeek;
- (BOOL)hasClientPreferredLanguages;
- (BOOL)hasCommandID;
- (BOOL)hasCommandSequenceUUID;
- (BOOL)hasCommandTimeout;
- (BOOL)hasContentItemID;
- (BOOL)hasContextID;
- (BOOL)hasDesiredSessionID;
- (BOOL)hasDestinationAppDisplayID;
- (BOOL)hasDestinationDeviceUIDs;
- (BOOL)hasDialogOptions;
- (BOOL)hasEndSeek;
- (BOOL)hasEventNoticeIdentifier;
- (BOOL)hasEventNoticeType;
- (BOOL)hasExternalPlayerCommand;
- (BOOL)hasHomeKitUserIdentifier;
- (BOOL)hasInsertAfterContentItemID;
- (BOOL)hasInsertBeforeContentItemID;
- (BOOL)hasLanguageOption;
- (BOOL)hasMediaType;
- (BOOL)hasNegative;
- (BOOL)hasNowPlayingContentItemID;
- (BOOL)hasOriginatedFromRemoteDevice;
- (BOOL)hasOriginatingDeviceUID;
- (BOOL)hasPlaybackAuthorizationToken;
- (BOOL)hasPlaybackPosition;
- (BOOL)hasPlaybackQueueContext;
- (BOOL)hasPlaybackQueueDestinationOffset;
- (BOOL)hasPlaybackQueueInsertionPosition;
- (BOOL)hasPlaybackQueueOffset;
- (BOOL)hasPlaybackRate;
- (BOOL)hasPlaybackSession;
- (BOOL)hasPlaybackSessionFilePath;
- (BOOL)hasPlaybackSessionIdentifier;
- (BOOL)hasPlaybackSessionMetadata;
- (BOOL)hasPlaybackSessionPriority;
- (BOOL)hasPlaybackSessionRevision;
- (BOOL)hasPlaybackSessionType;
- (BOOL)hasPrepareForSetQueueIsProactive;
- (BOOL)hasPrepareForSetQueueProactiveReason;
- (BOOL)hasPrepareForSetQueueProactiveReasonType;
- (BOOL)hasPreservesQueueEndAction;
- (BOOL)hasPreservesRepeatMode;
- (BOOL)hasPreservesShuffleMode;
- (BOOL)hasQueueEndAction;
- (BOOL)hasRadioStationHash;
- (BOOL)hasRadioStationID;
- (BOOL)hasRating;
- (BOOL)hasReferencePosition;
- (BOOL)hasRemoteControlInterface;
- (BOOL)hasRepeatMode;
- (BOOL)hasReplaceIntent;
- (BOOL)hasRequestDefermentToPlaybackQueuePosition;
- (BOOL)hasSendOptions;
- (BOOL)hasSenderID;
- (BOOL)hasSharedPlaybackSessionIdentifier;
- (BOOL)hasShouldBeginRadioPlayback;
- (BOOL)hasShouldOverrideManuallyCuratedQueue;
- (BOOL)hasShuffleMode;
- (BOOL)hasSiriSearchDataSetIdentifier;
- (BOOL)hasSiriTurnIdentifier;
- (BOOL)hasSkipInterval;
- (BOOL)hasSleepTimerStopMode;
- (BOOL)hasSleepTimerTime;
- (BOOL)hasSourceID;
- (BOOL)hasStationURL;
- (BOOL)hasSystemAppPlaybackQueue;
- (BOOL)hasSystemAppPlaybackQueueData;
- (BOOL)hasTrackID;
- (BOOL)hasTrueCompletion;
- (BOOL)hasUserIdentityData;
- (BOOL)hasVerifySupportedCommands;
- (BOOL)hasVocalsControlActive;
- (BOOL)hasVocalsControlContinuous;
- (BOOL)hasVocalsControlLevel;
- (BOOL)hasVocalsControlMaxLevel;
- (BOOL)hasVocalsControlMinLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)negative;
- (BOOL)originatedFromRemoteDevice;
- (BOOL)prepareForSetQueueIsProactive;
- (BOOL)preservesQueueEndAction;
- (BOOL)preservesRepeatMode;
- (BOOL)preservesShuffleMode;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestDefermentToPlaybackQueuePosition;
- (BOOL)shouldBeginRadioPlayback;
- (BOOL)shouldOverrideManuallyCuratedQueue;
- (BOOL)trueCompletion;
- (BOOL)verifySupportedCommands;
- (BOOL)vocalsControlActive;
- (BOOL)vocalsControlContinuous;
- (NSData)applicationUserIdentity;
- (NSData)destinationDeviceUIDs;
- (NSData)languageOption;
- (NSData)playbackQueueContext;
- (NSData)playbackSession;
- (NSData)playbackSessionMetadata;
- (NSData)systemAppPlaybackQueueData;
- (NSData)userIdentityData;
- (NSString)associatedParticipantIdentifier;
- (NSString)clientPreferredLanguages;
- (NSString)commandID;
- (NSString)commandSequenceUUID;
- (NSString)contentItemID;
- (NSString)contextID;
- (NSString)desiredSessionID;
- (NSString)destinationAppDisplayID;
- (NSString)eventNoticeIdentifier;
- (NSString)eventNoticeType;
- (NSString)homeKitUserIdentifier;
- (NSString)insertAfterContentItemID;
- (NSString)insertBeforeContentItemID;
- (NSString)mediaType;
- (NSString)nowPlayingContentItemID;
- (NSString)originatingDeviceUID;
- (NSString)playbackAuthorizationToken;
- (NSString)playbackSessionFilePath;
- (NSString)playbackSessionIdentifier;
- (NSString)playbackSessionRevision;
- (NSString)playbackSessionType;
- (NSString)prepareForSetQueueProactiveReason;
- (NSString)radioStationHash;
- (NSString)remoteControlInterface;
- (NSString)senderID;
- (NSString)sharedPlaybackSessionIdentifier;
- (NSString)siriSearchDataSetIdentifier;
- (NSString)siriTurnIdentifier;
- (NSString)sourceID;
- (NSString)stationURL;
- (_MRDictionaryProtobuf)dialogOptions;
- (_MRSystemPlaybackQueueProtobuf)systemAppPlaybackQueue;
- (double)assistantCommandSendTimestamp;
- (double)assistantTTSEndTimestamp;
- (double)commandTimeout;
- (double)playbackPosition;
- (double)referencePosition;
- (double)sleepTimerTime;
- (float)playbackRate;
- (float)rating;
- (float)skipInterval;
- (float)vocalsControlLevel;
- (float)vocalsControlMaxLevel;
- (float)vocalsControlMinLevel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)playbackSessionPriorityAsString:(int)a3;
- (id)prepareForSetQueueProactiveReasonTypeAsString:(int)a3;
- (id)queueEndActionAsString:(int)a3;
- (id)repeatModeAsString:(int)a3;
- (id)replaceIntentAsString:(int)a3;
- (id)sendOptionsAsString:(int)a3;
- (id)shuffleModeAsString:(int)a3;
- (id)sleepTimerStopModeAsString:(int)a3;
- (int)StringAsPlaybackSessionPriority:(id)a3;
- (int)StringAsPrepareForSetQueueProactiveReasonType:(id)a3;
- (int)StringAsQueueEndAction:(id)a3;
- (int)StringAsRepeatMode:(id)a3;
- (int)StringAsReplaceIntent:(id)a3;
- (int)StringAsSendOptions:(id)a3;
- (int)StringAsShuffleMode:(id)a3;
- (int)StringAsSleepTimerStopMode:(id)a3;
- (int)playbackQueueDestinationOffset;
- (int)playbackQueueInsertionPosition;
- (int)playbackQueueOffset;
- (int)playbackSessionPriority;
- (int)prepareForSetQueueProactiveReasonType;
- (int)queueEndAction;
- (int)repeatMode;
- (int)replaceIntent;
- (int)sendOptions;
- (int)shuffleMode;
- (int)sleepTimerStopMode;
- (int64_t)radioStationID;
- (unint64_t)hash;
- (unint64_t)trackID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlwaysIgnoreDuringCall:(BOOL)a3;
- (void)setAlwaysIgnoreDuringSharePlay:(BOOL)a3;
- (void)setApplicationUserIdentity:(id)a3;
- (void)setAssistantCommandSendTimestamp:(double)a3;
- (void)setAssistantTTSEndTimestamp:(double)a3;
- (void)setAssociatedParticipantIdentifier:(id)a3;
- (void)setBeginSeek:(BOOL)a3;
- (void)setClientPreferredLanguages:(id)a3;
- (void)setCommandID:(id)a3;
- (void)setCommandSequenceUUID:(id)a3;
- (void)setCommandTimeout:(double)a3;
- (void)setContentItemID:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDesiredSessionID:(id)a3;
- (void)setDestinationAppDisplayID:(id)a3;
- (void)setDestinationDeviceUIDs:(id)a3;
- (void)setDialogOptions:(id)a3;
- (void)setEndSeek:(BOOL)a3;
- (void)setEventNoticeIdentifier:(id)a3;
- (void)setEventNoticeType:(id)a3;
- (void)setExternalPlayerCommand:(BOOL)a3;
- (void)setHasAlwaysIgnoreDuringCall:(BOOL)a3;
- (void)setHasAlwaysIgnoreDuringSharePlay:(BOOL)a3;
- (void)setHasAssistantCommandSendTimestamp:(BOOL)a3;
- (void)setHasAssistantTTSEndTimestamp:(BOOL)a3;
- (void)setHasBeginSeek:(BOOL)a3;
- (void)setHasCommandTimeout:(BOOL)a3;
- (void)setHasEndSeek:(BOOL)a3;
- (void)setHasExternalPlayerCommand:(BOOL)a3;
- (void)setHasNegative:(BOOL)a3;
- (void)setHasOriginatedFromRemoteDevice:(BOOL)a3;
- (void)setHasPlaybackPosition:(BOOL)a3;
- (void)setHasPlaybackQueueDestinationOffset:(BOOL)a3;
- (void)setHasPlaybackQueueInsertionPosition:(BOOL)a3;
- (void)setHasPlaybackQueueOffset:(BOOL)a3;
- (void)setHasPlaybackRate:(BOOL)a3;
- (void)setHasPlaybackSessionPriority:(BOOL)a3;
- (void)setHasPrepareForSetQueueIsProactive:(BOOL)a3;
- (void)setHasPrepareForSetQueueProactiveReasonType:(BOOL)a3;
- (void)setHasPreservesQueueEndAction:(BOOL)a3;
- (void)setHasPreservesRepeatMode:(BOOL)a3;
- (void)setHasPreservesShuffleMode:(BOOL)a3;
- (void)setHasQueueEndAction:(BOOL)a3;
- (void)setHasRadioStationID:(BOOL)a3;
- (void)setHasRating:(BOOL)a3;
- (void)setHasReferencePosition:(BOOL)a3;
- (void)setHasRepeatMode:(BOOL)a3;
- (void)setHasReplaceIntent:(BOOL)a3;
- (void)setHasRequestDefermentToPlaybackQueuePosition:(BOOL)a3;
- (void)setHasSendOptions:(BOOL)a3;
- (void)setHasShouldBeginRadioPlayback:(BOOL)a3;
- (void)setHasShouldOverrideManuallyCuratedQueue:(BOOL)a3;
- (void)setHasShuffleMode:(BOOL)a3;
- (void)setHasSkipInterval:(BOOL)a3;
- (void)setHasSleepTimerStopMode:(BOOL)a3;
- (void)setHasSleepTimerTime:(BOOL)a3;
- (void)setHasTrackID:(BOOL)a3;
- (void)setHasTrueCompletion:(BOOL)a3;
- (void)setHasVerifySupportedCommands:(BOOL)a3;
- (void)setHasVocalsControlActive:(BOOL)a3;
- (void)setHasVocalsControlContinuous:(BOOL)a3;
- (void)setHasVocalsControlLevel:(BOOL)a3;
- (void)setHasVocalsControlMaxLevel:(BOOL)a3;
- (void)setHasVocalsControlMinLevel:(BOOL)a3;
- (void)setHomeKitUserIdentifier:(id)a3;
- (void)setInsertAfterContentItemID:(id)a3;
- (void)setInsertBeforeContentItemID:(id)a3;
- (void)setLanguageOption:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setNegative:(BOOL)a3;
- (void)setNowPlayingContentItemID:(id)a3;
- (void)setOriginatedFromRemoteDevice:(BOOL)a3;
- (void)setOriginatingDeviceUID:(id)a3;
- (void)setPlaybackAuthorizationToken:(id)a3;
- (void)setPlaybackPosition:(double)a3;
- (void)setPlaybackQueueContext:(id)a3;
- (void)setPlaybackQueueDestinationOffset:(int)a3;
- (void)setPlaybackQueueInsertionPosition:(int)a3;
- (void)setPlaybackQueueOffset:(int)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPlaybackSession:(id)a3;
- (void)setPlaybackSessionFilePath:(id)a3;
- (void)setPlaybackSessionIdentifier:(id)a3;
- (void)setPlaybackSessionMetadata:(id)a3;
- (void)setPlaybackSessionPriority:(int)a3;
- (void)setPlaybackSessionRevision:(id)a3;
- (void)setPlaybackSessionType:(id)a3;
- (void)setPrepareForSetQueueIsProactive:(BOOL)a3;
- (void)setPrepareForSetQueueProactiveReason:(id)a3;
- (void)setPrepareForSetQueueProactiveReasonType:(int)a3;
- (void)setPreservesQueueEndAction:(BOOL)a3;
- (void)setPreservesRepeatMode:(BOOL)a3;
- (void)setPreservesShuffleMode:(BOOL)a3;
- (void)setQueueEndAction:(int)a3;
- (void)setRadioStationHash:(id)a3;
- (void)setRadioStationID:(int64_t)a3;
- (void)setRating:(float)a3;
- (void)setReferencePosition:(double)a3;
- (void)setRemoteControlInterface:(id)a3;
- (void)setRepeatMode:(int)a3;
- (void)setReplaceIntent:(int)a3;
- (void)setRequestDefermentToPlaybackQueuePosition:(BOOL)a3;
- (void)setSendOptions:(int)a3;
- (void)setSenderID:(id)a3;
- (void)setSharedPlaybackSessionIdentifier:(id)a3;
- (void)setShouldBeginRadioPlayback:(BOOL)a3;
- (void)setShouldOverrideManuallyCuratedQueue:(BOOL)a3;
- (void)setShuffleMode:(int)a3;
- (void)setSiriSearchDataSetIdentifier:(id)a3;
- (void)setSiriTurnIdentifier:(id)a3;
- (void)setSkipInterval:(float)a3;
- (void)setSleepTimerStopMode:(int)a3;
- (void)setSleepTimerTime:(double)a3;
- (void)setSourceID:(id)a3;
- (void)setStationURL:(id)a3;
- (void)setSystemAppPlaybackQueue:(id)a3;
- (void)setSystemAppPlaybackQueueData:(id)a3;
- (void)setTrackID:(unint64_t)a3;
- (void)setTrueCompletion:(BOOL)a3;
- (void)setUserIdentityData:(id)a3;
- (void)setVerifySupportedCommands:(BOOL)a3;
- (void)setVocalsControlActive:(BOOL)a3;
- (void)setVocalsControlContinuous:(BOOL)a3;
- (void)setVocalsControlLevel:(float)a3;
- (void)setVocalsControlMaxLevel:(float)a3;
- (void)setVocalsControlMinLevel:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRCommandOptionsProtobuf

- (BOOL)hasSourceID
{
  return self->_sourceID != 0;
}

- (BOOL)hasMediaType
{
  return self->_mediaType != 0;
}

- (void)setExternalPlayerCommand:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_externalPlayerCommand = a3;
}

- (void)setHasExternalPlayerCommand:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasExternalPlayerCommand
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSkipInterval:(float)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_skipInterval = a3;
}

- (void)setHasSkipInterval:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasSkipInterval
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPlaybackRate:(float)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_playbackRate = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasPlaybackRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRating:(float)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_rating = a3;
}

- (void)setHasRating:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasRating
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNegative:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_negative = a3;
}

- (void)setHasNegative:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasNegative
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setPlaybackPosition:(double)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_playbackPosition = a3;
}

- (void)setHasPlaybackPosition:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasPlaybackPosition
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)repeatMode
{
  if (*((unsigned char *)&self->_has + 2)) {
    return self->_repeatMode;
  }
  else {
    return 0;
  }
}

- (void)setRepeatMode:(int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasRepeatMode
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E57D8E00[a3];
  }

  return v3;
}

- (int)StringAsRepeatMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"One"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"All"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)shuffleMode
{
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    return self->_shuffleMode;
  }
  else {
    return 0;
  }
}

- (void)setShuffleMode:(int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasShuffleMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E57D8E20[a3];
  }

  return v3;
}

- (int)StringAsShuffleMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Albums"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Songs"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasContextID
{
  return self->_contextID != 0;
}

- (void)setTrackID:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_trackID = a3;
}

- (void)setHasTrackID:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTrackID
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRadioStationID:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_radioStationID = a3;
}

- (void)setHasRadioStationID:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasRadioStationID
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasRadioStationHash
{
  return self->_radioStationHash != 0;
}

- (BOOL)hasSystemAppPlaybackQueueData
{
  return self->_systemAppPlaybackQueueData != 0;
}

- (BOOL)hasDestinationAppDisplayID
{
  return self->_destinationAppDisplayID != 0;
}

- (int)sendOptions
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_sendOptions;
  }
  else {
    return 0;
  }
}

- (void)setSendOptions:(int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_sendOptions = a3;
}

- (void)setHasSendOptions:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSendOptions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)sendOptionsAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"LaunchApplication";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"None";
  }
  return v4;
}

- (int)StringAsSendOptions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"LaunchApplication"];
  }

  return v4;
}

- (void)setRequestDefermentToPlaybackQueuePosition:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_requestDefermentToPlaybackQueuePosition = a3;
}

- (void)setHasRequestDefermentToPlaybackQueuePosition:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasRequestDefermentToPlaybackQueuePosition
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setShouldOverrideManuallyCuratedQueue:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_shouldOverrideManuallyCuratedQueue = a3;
}

- (void)setHasShouldOverrideManuallyCuratedQueue:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasShouldOverrideManuallyCuratedQueue
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (BOOL)hasStationURL
{
  return self->_stationURL != 0;
}

- (void)setShouldBeginRadioPlayback:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_shouldBeginRadioPlayback = a3;
}

- (void)setHasShouldBeginRadioPlayback:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasShouldBeginRadioPlayback
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setPlaybackQueueInsertionPosition:(int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_playbackQueueInsertionPosition = a3;
}

- (void)setHasPlaybackQueueInsertionPosition:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasPlaybackQueueInsertionPosition
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasContentItemID
{
  return self->_contentItemID != 0;
}

- (void)setPlaybackQueueOffset:(int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_playbackQueueOffset = a3;
}

- (void)setHasPlaybackQueueOffset:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasPlaybackQueueOffset
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setPlaybackQueueDestinationOffset:(int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_playbackQueueDestinationOffset = a3;
}

- (void)setHasPlaybackQueueDestinationOffset:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasPlaybackQueueDestinationOffset
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasLanguageOption
{
  return self->_languageOption != 0;
}

- (BOOL)hasPlaybackQueueContext
{
  return self->_playbackQueueContext != 0;
}

- (BOOL)hasInsertAfterContentItemID
{
  return self->_insertAfterContentItemID != 0;
}

- (BOOL)hasNowPlayingContentItemID
{
  return self->_nowPlayingContentItemID != 0;
}

- (int)replaceIntent
{
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    return self->_replaceIntent;
  }
  else {
    return 0;
  }
}

- (void)setReplaceIntent:(int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_replaceIntent = a3;
}

- (void)setHasReplaceIntent:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasReplaceIntent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)replaceIntentAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E57D8E40[a3];
  }

  return v3;
}

- (int)StringAsReplaceIntent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NonDestructive"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ClearUpNext"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KeepUpNext"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LeaveSharedSession"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCommandID
{
  return self->_commandID != 0;
}

- (BOOL)hasSenderID
{
  return self->_senderID != 0;
}

- (BOOL)hasRemoteControlInterface
{
  return self->_remoteControlInterface != 0;
}

- (void)setBeginSeek:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_beginSeek = a3;
}

- (void)setHasBeginSeek:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasBeginSeek
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setEndSeek:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_endSeek = a3;
}

- (void)setHasEndSeek:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasEndSeek
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasPlaybackSession
{
  return self->_playbackSession != 0;
}

- (BOOL)hasUserIdentityData
{
  return self->_userIdentityData != 0;
}

- (BOOL)hasInsertBeforeContentItemID
{
  return self->_insertBeforeContentItemID != 0;
}

- (int)queueEndAction
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_queueEndAction;
  }
  else {
    return 0;
  }
}

- (void)setQueueEndAction:(int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_queueEndAction = a3;
}

- (void)setHasQueueEndAction:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasQueueEndAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)queueEndActionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E57D8E60[a3];
  }

  return v3;
}

- (int)StringAsQueueEndAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Clear"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Reset"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AutoPlay"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPreservesRepeatMode:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_preservesRepeatMode = a3;
}

- (void)setHasPreservesRepeatMode:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasPreservesRepeatMode
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setPreservesShuffleMode:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_preservesShuffleMode = a3;
}

- (void)setHasPreservesShuffleMode:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasPreservesShuffleMode
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setPreservesQueueEndAction:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_preservesQueueEndAction = a3;
}

- (void)setHasPreservesQueueEndAction:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasPreservesQueueEndAction
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (BOOL)hasHomeKitUserIdentifier
{
  return self->_homeKitUserIdentifier != 0;
}

- (void)setVerifySupportedCommands:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_verifySupportedCommands = a3;
}

- (void)setHasVerifySupportedCommands:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasVerifySupportedCommands
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (BOOL)hasPlaybackSessionIdentifier
{
  return self->_playbackSessionIdentifier != 0;
}

- (int)playbackSessionPriority
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_playbackSessionPriority;
  }
  else {
    return 0;
  }
}

- (void)setPlaybackSessionPriority:(int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_playbackSessionPriority = a3;
}

- (void)setHasPlaybackSessionPriority:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasPlaybackSessionPriority
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)playbackSessionPriorityAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1024)
    {
      int v4 = @"Immediate";
    }
    else if (a3 == 512)
    {
      int v4 = @"High";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Low";
  }
  return v4;
}

- (int)StringAsPlaybackSessionPriority:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Low"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"High"])
  {
    int v4 = 512;
  }
  else if ([v3 isEqualToString:@"Immediate"])
  {
    int v4 = 1024;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPlaybackSessionFilePath
{
  return self->_playbackSessionFilePath != 0;
}

- (BOOL)hasPlaybackSessionRevision
{
  return self->_playbackSessionRevision != 0;
}

- (BOOL)hasPlaybackSessionMetadata
{
  return self->_playbackSessionMetadata != 0;
}

- (BOOL)hasPlaybackSessionType
{
  return self->_playbackSessionType != 0;
}

- (void)setTrueCompletion:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_trueCompletion = a3;
}

- (void)setHasTrueCompletion:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasTrueCompletion
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (BOOL)hasPlaybackAuthorizationToken
{
  return self->_playbackAuthorizationToken != 0;
}

- (BOOL)hasEventNoticeType
{
  return self->_eventNoticeType != 0;
}

- (BOOL)hasEventNoticeIdentifier
{
  return self->_eventNoticeIdentifier != 0;
}

- (BOOL)hasSharedPlaybackSessionIdentifier
{
  return self->_sharedPlaybackSessionIdentifier != 0;
}

- (void)setCommandTimeout:(double)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_commandTimeout = a3;
}

- (void)setHasCommandTimeout:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasCommandTimeout
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAssistantTTSEndTimestamp:(double)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_assistantTTSEndTimestamp = a3;
}

- (void)setHasAssistantTTSEndTimestamp:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAssistantTTSEndTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAssistantCommandSendTimestamp:(double)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_assistantCommandSendTimestamp = a3;
}

- (void)setHasAssistantCommandSendTimestamp:(BOOL)a3
{
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAssistantCommandSendTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasOriginatingDeviceUID
{
  return self->_originatingDeviceUID != 0;
}

- (BOOL)hasDestinationDeviceUIDs
{
  return self->_destinationDeviceUIDs != 0;
}

- (BOOL)hasDesiredSessionID
{
  return self->_desiredSessionID != 0;
}

- (void)setAlwaysIgnoreDuringCall:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_alwaysIgnoreDuringCall = a3;
}

- (void)setHasAlwaysIgnoreDuringCall:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasAlwaysIgnoreDuringCall
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setAlwaysIgnoreDuringSharePlay:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_alwaysIgnoreDuringSharePlay = a3;
}

- (void)setHasAlwaysIgnoreDuringSharePlay:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasAlwaysIgnoreDuringSharePlay
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (BOOL)hasCommandSequenceUUID
{
  return self->_commandSequenceUUID != 0;
}

- (void)setOriginatedFromRemoteDevice:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_originatedFromRemoteDevice = a3;
}

- (void)setHasOriginatedFromRemoteDevice:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasOriginatedFromRemoteDevice
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (BOOL)hasSiriTurnIdentifier
{
  return self->_siriTurnIdentifier != 0;
}

- (BOOL)hasSiriSearchDataSetIdentifier
{
  return self->_siriSearchDataSetIdentifier != 0;
}

- (void)setPrepareForSetQueueIsProactive:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_prepareForSetQueueIsProactive = a3;
}

- (void)setHasPrepareForSetQueueIsProactive:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasPrepareForSetQueueIsProactive
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (BOOL)hasPrepareForSetQueueProactiveReason
{
  return self->_prepareForSetQueueProactiveReason != 0;
}

- (int)prepareForSetQueueProactiveReasonType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_prepareForSetQueueProactiveReasonType;
  }
  else {
    return 0;
  }
}

- (void)setPrepareForSetQueueProactiveReasonType:(int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_prepareForSetQueueProactiveReasonType = a3;
}

- (void)setHasPrepareForSetQueueProactiveReasonType:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasPrepareForSetQueueProactiveReasonType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)prepareForSetQueueProactiveReasonTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E57D8E80[a3];
  }

  return v3;
}

- (int)StringAsPrepareForSetQueueProactiveReasonType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Boot"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ASE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SiriActivation"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasApplicationUserIdentity
{
  return self->_applicationUserIdentity != 0;
}

- (BOOL)hasSystemAppPlaybackQueue
{
  return self->_systemAppPlaybackQueue != 0;
}

- (void)setVocalsControlActive:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_vocalsControlActive = a3;
}

- (void)setHasVocalsControlActive:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasVocalsControlActive
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setVocalsControlLevel:(float)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_vocalsControlLevel = a3;
}

- (void)setHasVocalsControlLevel:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasVocalsControlLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setVocalsControlMinLevel:(float)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_vocalsControlMinLevel = a3;
}

- (void)setHasVocalsControlMinLevel:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasVocalsControlMinLevel
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setVocalsControlMaxLevel:(float)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_vocalsControlMaxLevel = a3;
}

- (void)setHasVocalsControlMaxLevel:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasVocalsControlMaxLevel
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setVocalsControlContinuous:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_vocalsControlContinuous = a3;
}

- (void)setHasVocalsControlContinuous:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasVocalsControlContinuous
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (BOOL)hasAssociatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier != 0;
}

- (void)setSleepTimerTime:(double)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_sleepTimerTime = a3;
}

- (void)setHasSleepTimerTime:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasSleepTimerTime
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (int)sleepTimerStopMode
{
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    return self->_sleepTimerStopMode;
  }
  else {
    return 0;
  }
}

- (void)setSleepTimerStopMode:(int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_sleepTimerStopMode = a3;
}

- (void)setHasSleepTimerStopMode:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSleepTimerStopMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)sleepTimerStopModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E57D8EA0[a3];
  }

  return v3;
}

- (int)StringAsSleepTimerStopMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Time"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ChapterEnd"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ItemEnd"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDialogOptions
{
  return self->_dialogOptions != 0;
}

- (BOOL)hasClientPreferredLanguages
{
  return self->_clientPreferredLanguages != 0;
}

- (void)setReferencePosition:(double)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_referencePosition = a3;
}

- (void)setHasReferencePosition:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D356D6608A0B9B449BA135355957D2E8)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasReferencePosition
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRCommandOptionsProtobuf;
  int v4 = [(_MRCommandOptionsProtobuf *)&v8 description];
  v5 = [(_MRCommandOptionsProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  sourceID = self->_sourceID;
  if (sourceID) {
    [v3 setObject:sourceID forKey:@"sourceID"];
  }
  mediaType = self->_mediaType;
  if (mediaType) {
    [v5 setObject:mediaType forKey:@"mediaType"];
  }
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_externalPlayerCommand];
    [v5 setObject:v9 forKey:@"externalPlayerCommand"];

    $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_7;
  }
  *(float *)&double v4 = self->_skipInterval;
  v10 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v10 forKey:@"skipInterval"];

  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(float *)&double v4 = self->_playbackRate;
  v11 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v11 forKey:@"playbackRate"];

  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(float *)&double v4 = self->_rating;
  v12 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v12 forKey:@"rating"];

  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = [NSNumber numberWithBool:self->_negative];
  [v5 setObject:v13 forKey:@"negative"];

  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_19:
  v14 = [NSNumber numberWithDouble:self->_playbackPosition];
  [v5 setObject:v14 forKey:@"playbackPosition"];

  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
LABEL_20:
  uint64_t repeatMode = self->_repeatMode;
  if (repeatMode >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_repeatMode);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E57D8E00[repeatMode];
  }
  [v5 setObject:v16 forKey:@"repeatMode"];

  if ((*(void *)&self->_has & 0x80000) != 0)
  {
LABEL_24:
    uint64_t shuffleMode = self->_shuffleMode;
    if (shuffleMode >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_shuffleMode);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E57D8E20[shuffleMode];
    }
    [v5 setObject:v18 forKey:@"shuffleMode"];
  }
LABEL_28:
  contextID = self->_contextID;
  if (contextID) {
    [v5 setObject:contextID forKey:@"contextID"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v20 = self->_has;
  if ((*(unsigned char *)&v20 & 0x80) != 0)
  {
    v21 = [NSNumber numberWithUnsignedLongLong:self->_trackID];
    [v5 setObject:v21 forKey:@"trackID"];

    $D356D6608A0B9B449BA135355957D2E8 v20 = self->_has;
  }
  if ((*(unsigned char *)&v20 & 0x10) != 0)
  {
    v22 = [NSNumber numberWithLongLong:self->_radioStationID];
    [v5 setObject:v22 forKey:@"radioStationID"];
  }
  radioStationHash = self->_radioStationHash;
  if (radioStationHash) {
    [v5 setObject:radioStationHash forKey:@"radioStationHash"];
  }
  systemAppPlaybackQueueData = self->_systemAppPlaybackQueueData;
  if (systemAppPlaybackQueueData) {
    [v5 setObject:systemAppPlaybackQueueData forKey:@"systemAppPlaybackQueueData"];
  }
  destinationAppDisplayID = self->_destinationAppDisplayID;
  if (destinationAppDisplayID) {
    [v5 setObject:destinationAppDisplayID forKey:@"destinationAppDisplayID"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x40000) != 0)
  {
    int sendOptions = self->_sendOptions;
    if (sendOptions)
    {
      if (sendOptions == 1)
      {
        v43 = @"LaunchApplication";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sendOptions);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v43 = @"None";
    }
    [v5 setObject:v43 forKey:@"sendOptions"];

    $D356D6608A0B9B449BA135355957D2E8 v26 = self->_has;
    if ((*(void *)&v26 & 0x1000000000) == 0)
    {
LABEL_42:
      if ((*(void *)&v26 & 0x4000000000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }
  }
  else if ((*(void *)&v26 & 0x1000000000) == 0)
  {
    goto LABEL_42;
  }
  v64 = [NSNumber numberWithBool:self->_requestDefermentToPlaybackQueuePosition];
  [v5 setObject:v64 forKey:@"requestDefermentToPlaybackQueuePosition"];

  if ((*(void *)&self->_has & 0x4000000000) != 0)
  {
LABEL_43:
    v27 = [NSNumber numberWithBool:self->_shouldOverrideManuallyCuratedQueue];
    [v5 setObject:v27 forKey:@"shouldOverrideManuallyCuratedQueue"];
  }
LABEL_44:
  stationURL = self->_stationURL;
  if (stationURL) {
    [v5 setObject:stationURL forKey:@"stationURL"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v29 = self->_has;
  if ((*(void *)&v29 & 0x2000000000) != 0)
  {
    v30 = [NSNumber numberWithBool:self->_shouldBeginRadioPlayback];
    [v5 setObject:v30 forKey:@"shouldBeginRadioPlayback"];

    $D356D6608A0B9B449BA135355957D2E8 v29 = self->_has;
  }
  if ((*(_WORD *)&v29 & 0x200) != 0)
  {
    v31 = [NSNumber numberWithInt:self->_playbackQueueInsertionPosition];
    [v5 setObject:v31 forKey:@"playbackQueueInsertionPosition"];
  }
  contentItemID = self->_contentItemID;
  if (contentItemID) {
    [v5 setObject:contentItemID forKey:@"contentItemID"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x400) != 0)
  {
    v34 = [NSNumber numberWithInt:self->_playbackQueueOffset];
    [v5 setObject:v34 forKey:@"playbackQueueOffset"];

    $D356D6608A0B9B449BA135355957D2E8 v33 = self->_has;
  }
  if ((*(_WORD *)&v33 & 0x100) != 0)
  {
    v35 = [NSNumber numberWithInt:self->_playbackQueueDestinationOffset];
    [v5 setObject:v35 forKey:@"playbackQueueDestinationOffset"];
  }
  languageOption = self->_languageOption;
  if (languageOption) {
    [v5 setObject:languageOption forKey:@"languageOption"];
  }
  playbackQueueContext = self->_playbackQueueContext;
  if (playbackQueueContext) {
    [v5 setObject:playbackQueueContext forKey:@"playbackQueueContext"];
  }
  insertAfterContentItemID = self->_insertAfterContentItemID;
  if (insertAfterContentItemID) {
    [v5 setObject:insertAfterContentItemID forKey:@"insertAfterContentItemID"];
  }
  nowPlayingContentItemID = self->_nowPlayingContentItemID;
  if (nowPlayingContentItemID) {
    [v5 setObject:nowPlayingContentItemID forKey:@"nowPlayingContentItemID"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    uint64_t replaceIntent = self->_replaceIntent;
    if (replaceIntent >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_replaceIntent);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_1E57D8E40[replaceIntent];
    }
    [v5 setObject:v41 forKey:@"replaceIntent"];
  }
  commandID = self->_commandID;
  if (commandID) {
    [v5 setObject:commandID forKey:@"commandID"];
  }
  senderID = self->_senderID;
  if (senderID) {
    [v5 setObject:senderID forKey:@"senderID"];
  }
  remoteControlInterface = self->_remoteControlInterface;
  if (remoteControlInterface) {
    [v5 setObject:remoteControlInterface forKey:@"remoteControlInterface"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v47 = self->_has;
  if ((*(_DWORD *)&v47 & 0x8000000) != 0)
  {
    v48 = [NSNumber numberWithBool:self->_beginSeek];
    [v5 setObject:v48 forKey:@"beginSeek"];

    $D356D6608A0B9B449BA135355957D2E8 v47 = self->_has;
  }
  if ((*(_DWORD *)&v47 & 0x10000000) != 0)
  {
    v49 = [NSNumber numberWithBool:self->_endSeek];
    [v5 setObject:v49 forKey:@"endSeek"];
  }
  playbackSession = self->_playbackSession;
  if (playbackSession) {
    [v5 setObject:playbackSession forKey:@"playbackSession"];
  }
  userIdentityData = self->_userIdentityData;
  if (userIdentityData) {
    [v5 setObject:userIdentityData forKey:@"userIdentityData"];
  }
  insertBeforeContentItemID = self->_insertBeforeContentItemID;
  if (insertBeforeContentItemID) {
    [v5 setObject:insertBeforeContentItemID forKey:@"insertBeforeContentItemID"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v53 = self->_has;
  if ((*(_WORD *)&v53 & 0x4000) != 0)
  {
    uint64_t queueEndAction = self->_queueEndAction;
    if (queueEndAction >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_queueEndAction);
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = off_1E57D8E60[queueEndAction];
    }
    [v5 setObject:v61 forKey:@"queueEndAction"];

    $D356D6608A0B9B449BA135355957D2E8 v53 = self->_has;
    if ((*(void *)&v53 & 0x400000000) == 0)
    {
LABEL_90:
      if ((*(void *)&v53 & 0x800000000) == 0) {
        goto LABEL_91;
      }
      goto LABEL_109;
    }
  }
  else if ((*(void *)&v53 & 0x400000000) == 0)
  {
    goto LABEL_90;
  }
  v62 = [NSNumber numberWithBool:self->_preservesRepeatMode];
  [v5 setObject:v62 forKey:@"preservesRepeatMode"];

  $D356D6608A0B9B449BA135355957D2E8 v53 = self->_has;
  if ((*(void *)&v53 & 0x800000000) == 0)
  {
LABEL_91:
    if ((*(void *)&v53 & 0x200000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
LABEL_109:
  v63 = [NSNumber numberWithBool:self->_preservesShuffleMode];
  [v5 setObject:v63 forKey:@"preservesShuffleMode"];

  if ((*(void *)&self->_has & 0x200000000) != 0)
  {
LABEL_92:
    v54 = [NSNumber numberWithBool:self->_preservesQueueEndAction];
    [v5 setObject:v54 forKey:@"preservesQueueEndAction"];
  }
LABEL_93:
  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  if (homeKitUserIdentifier) {
    [v5 setObject:homeKitUserIdentifier forKey:@"homeKitUserIdentifier"];
  }
  if (*((unsigned char *)&self->_has + 5))
  {
    v56 = [NSNumber numberWithBool:self->_verifySupportedCommands];
    [v5 setObject:v56 forKey:@"verifySupportedCommands"];
  }
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if (playbackSessionIdentifier) {
    [v5 setObject:playbackSessionIdentifier forKey:@"playbackSessionIdentifier"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    int playbackSessionPriority = self->_playbackSessionPriority;
    if (playbackSessionPriority)
    {
      if (playbackSessionPriority == 1024)
      {
        v59 = @"Immediate";
      }
      else if (playbackSessionPriority == 512)
      {
        v59 = @"High";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_playbackSessionPriority);
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v59 = @"Low";
    }
    [v5 setObject:v59 forKey:@"playbackSessionPriority"];
  }
  playbackSessionFilePath = self->_playbackSessionFilePath;
  if (playbackSessionFilePath) {
    [v5 setObject:playbackSessionFilePath forKey:@"playbackSessionFilePath"];
  }
  playbackSessionRevision = self->_playbackSessionRevision;
  if (playbackSessionRevision) {
    [v5 setObject:playbackSessionRevision forKey:@"playbackSessionRevision"];
  }
  playbackSessionMetadata = self->_playbackSessionMetadata;
  if (playbackSessionMetadata) {
    [v5 setObject:playbackSessionMetadata forKey:@"playbackSessionMetadata"];
  }
  playbackSessionType = self->_playbackSessionType;
  if (playbackSessionType) {
    [v5 setObject:playbackSessionType forKey:@"playbackSessionType"];
  }
  if ((*((unsigned char *)&self->_has + 4) & 0x80) != 0)
  {
    v69 = [NSNumber numberWithBool:self->_trueCompletion];
    [v5 setObject:v69 forKey:@"trueCompletion"];
  }
  playbackAuthorizationToken = self->_playbackAuthorizationToken;
  if (playbackAuthorizationToken) {
    [v5 setObject:playbackAuthorizationToken forKey:@"playbackAuthorizationToken"];
  }
  eventNoticeType = self->_eventNoticeType;
  if (eventNoticeType) {
    [v5 setObject:eventNoticeType forKey:@"eventNoticeType"];
  }
  eventNoticeIdentifier = self->_eventNoticeIdentifier;
  if (eventNoticeIdentifier) {
    [v5 setObject:eventNoticeIdentifier forKey:@"eventNoticeIdentifier"];
  }
  sharedPlaybackSessionIdentifier = self->_sharedPlaybackSessionIdentifier;
  if (sharedPlaybackSessionIdentifier) {
    [v5 setObject:sharedPlaybackSessionIdentifier forKey:@"sharedPlaybackSessionIdentifier"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v74 = self->_has;
  if ((*(unsigned char *)&v74 & 4) != 0)
  {
    v90 = [NSNumber numberWithDouble:self->_commandTimeout];
    [v5 setObject:v90 forKey:@"commandTimeout"];

    $D356D6608A0B9B449BA135355957D2E8 v74 = self->_has;
    if ((*(unsigned char *)&v74 & 2) == 0)
    {
LABEL_140:
      if ((*(unsigned char *)&v74 & 1) == 0) {
        goto LABEL_142;
      }
      goto LABEL_141;
    }
  }
  else if ((*(unsigned char *)&v74 & 2) == 0)
  {
    goto LABEL_140;
  }
  v91 = [NSNumber numberWithDouble:self->_assistantTTSEndTimestamp];
  [v5 setObject:v91 forKey:@"assistantTTSEndTimestamp"];

  if (*(void *)&self->_has)
  {
LABEL_141:
    v75 = [NSNumber numberWithDouble:self->_assistantCommandSendTimestamp];
    [v5 setObject:v75 forKey:@"assistantCommandSendTimestamp"];
  }
LABEL_142:
  originatingDeviceUID = self->_originatingDeviceUID;
  if (originatingDeviceUID) {
    [v5 setObject:originatingDeviceUID forKey:@"originatingDeviceUID"];
  }
  destinationDeviceUIDs = self->_destinationDeviceUIDs;
  if (destinationDeviceUIDs) {
    [v5 setObject:destinationDeviceUIDs forKey:@"destinationDeviceUIDs"];
  }
  desiredSessionID = self->_desiredSessionID;
  if (desiredSessionID) {
    [v5 setObject:desiredSessionID forKey:@"desiredSessionID"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v79 = self->_has;
  if ((*(_DWORD *)&v79 & 0x2000000) != 0)
  {
    v80 = [NSNumber numberWithBool:self->_alwaysIgnoreDuringCall];
    [v5 setObject:v80 forKey:@"alwaysIgnoreDuringCall"];

    $D356D6608A0B9B449BA135355957D2E8 v79 = self->_has;
  }
  if ((*(_DWORD *)&v79 & 0x4000000) != 0)
  {
    v81 = [NSNumber numberWithBool:self->_alwaysIgnoreDuringSharePlay];
    [v5 setObject:v81 forKey:@"alwaysIgnoreDuringSharePlay"];
  }
  commandSequenceUUID = self->_commandSequenceUUID;
  if (commandSequenceUUID) {
    [v5 setObject:commandSequenceUUID forKey:@"commandSequenceUUID"];
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    v83 = [NSNumber numberWithBool:self->_originatedFromRemoteDevice];
    [v5 setObject:v83 forKey:@"originatedFromRemoteDevice"];
  }
  siriTurnIdentifier = self->_siriTurnIdentifier;
  if (siriTurnIdentifier) {
    [v5 setObject:siriTurnIdentifier forKey:@"siriTurnIdentifier"];
  }
  siriSearchDataSetIdentifier = self->_siriSearchDataSetIdentifier;
  if (siriSearchDataSetIdentifier) {
    [v5 setObject:siriSearchDataSetIdentifier forKey:@"siriSearchDataSetIdentifier"];
  }
  if (*((unsigned char *)&self->_has + 4))
  {
    v86 = [NSNumber numberWithBool:self->_prepareForSetQueueIsProactive];
    [v5 setObject:v86 forKey:@"prepareForSetQueueIsProactive"];
  }
  prepareForSetQueueProactiveReason = self->_prepareForSetQueueProactiveReason;
  if (prepareForSetQueueProactiveReason) {
    [v5 setObject:prepareForSetQueueProactiveReason forKey:@"prepareForSetQueueProactiveReason"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    uint64_t prepareForSetQueueProactiveReasonType = self->_prepareForSetQueueProactiveReasonType;
    if (prepareForSetQueueProactiveReasonType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_prepareForSetQueueProactiveReasonType);
      v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v89 = off_1E57D8E80[prepareForSetQueueProactiveReasonType];
    }
    [v5 setObject:v89 forKey:@"prepareForSetQueueProactiveReasonType"];
  }
  applicationUserIdentity = self->_applicationUserIdentity;
  if (applicationUserIdentity) {
    [v5 setObject:applicationUserIdentity forKey:@"applicationUserIdentity"];
  }
  systemAppPlaybackQueue = self->_systemAppPlaybackQueue;
  if (systemAppPlaybackQueue)
  {
    v94 = [(_MRSystemPlaybackQueueProtobuf *)systemAppPlaybackQueue dictionaryRepresentation];
    [v5 setObject:v94 forKey:@"systemAppPlaybackQueue"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v95 = self->_has;
  if ((*(void *)&v95 & 0x20000000000) != 0)
  {
    v102 = [NSNumber numberWithBool:self->_vocalsControlActive];
    [v5 setObject:v102 forKey:@"vocalsControlActive"];

    $D356D6608A0B9B449BA135355957D2E8 v95 = self->_has;
    if ((*(_DWORD *)&v95 & 0x400000) == 0)
    {
LABEL_178:
      if ((*(_DWORD *)&v95 & 0x1000000) == 0) {
        goto LABEL_179;
      }
      goto LABEL_191;
    }
  }
  else if ((*(_DWORD *)&v95 & 0x400000) == 0)
  {
    goto LABEL_178;
  }
  *(float *)&double v4 = self->_vocalsControlLevel;
  v103 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v103 forKey:@"vocalsControlLevel"];

  $D356D6608A0B9B449BA135355957D2E8 v95 = self->_has;
  if ((*(_DWORD *)&v95 & 0x1000000) == 0)
  {
LABEL_179:
    if ((*(_DWORD *)&v95 & 0x800000) == 0) {
      goto LABEL_180;
    }
    goto LABEL_192;
  }
LABEL_191:
  *(float *)&double v4 = self->_vocalsControlMinLevel;
  v104 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v104 forKey:@"vocalsControlMinLevel"];

  $D356D6608A0B9B449BA135355957D2E8 v95 = self->_has;
  if ((*(_DWORD *)&v95 & 0x800000) == 0)
  {
LABEL_180:
    if ((*(void *)&v95 & 0x40000000000) == 0) {
      goto LABEL_182;
    }
    goto LABEL_181;
  }
LABEL_192:
  *(float *)&double v4 = self->_vocalsControlMaxLevel;
  v105 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v105 forKey:@"vocalsControlMaxLevel"];

  if ((*(void *)&self->_has & 0x40000000000) != 0)
  {
LABEL_181:
    v96 = [NSNumber numberWithBool:self->_vocalsControlContinuous];
    [v5 setObject:v96 forKey:@"vocalsControlContinuous"];
  }
LABEL_182:
  associatedParticipantIdentifier = self->_associatedParticipantIdentifier;
  if (associatedParticipantIdentifier) {
    [v5 setObject:associatedParticipantIdentifier forKey:@"associatedParticipantIdentifier"];
  }
  $D356D6608A0B9B449BA135355957D2E8 v98 = self->_has;
  if ((*(unsigned char *)&v98 & 0x40) != 0)
  {
    v99 = [NSNumber numberWithDouble:self->_sleepTimerTime];
    [v5 setObject:v99 forKey:@"sleepTimerTime"];

    $D356D6608A0B9B449BA135355957D2E8 v98 = self->_has;
  }
  if ((*(_DWORD *)&v98 & 0x200000) != 0)
  {
    uint64_t sleepTimerStopMode = self->_sleepTimerStopMode;
    if (sleepTimerStopMode >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sleepTimerStopMode);
      v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v101 = off_1E57D8EA0[sleepTimerStopMode];
    }
    [v5 setObject:v101 forKey:@"sleepTimerStopMode"];
  }
  dialogOptions = self->_dialogOptions;
  if (dialogOptions)
  {
    v107 = [(_MRDictionaryProtobuf *)dialogOptions dictionaryRepresentation];
    [v5 setObject:v107 forKey:@"dialogOptions"];
  }
  clientPreferredLanguages = self->_clientPreferredLanguages;
  if (clientPreferredLanguages) {
    [v5 setObject:clientPreferredLanguages forKey:@"clientPreferredLanguages"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v109 = [NSNumber numberWithDouble:self->_referencePosition];
    [v5 setObject:v109 forKey:@"referencePosition"];
  }
  id v110 = v5;

  return v110;
}

- (BOOL)readFrom:(id)a3
{
  return _MRCommandOptionsProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (self->_sourceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_mediaType)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_154;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteFloatField();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteFloatField();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteBOOLField();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteDoubleField();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteInt32Field();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteInt32Field();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_160:
  PBDataWriterWriteUint64Field();
  id v4 = v15;
  if ((*(void *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt64Field();
    id v4 = v15;
  }
LABEL_16:
  if (self->_radioStationHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_systemAppPlaybackQueueData)
  {
    PBDataWriterWriteDataField();
    id v4 = v15;
  }
  if (self->_destinationAppDisplayID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 v6 = self->_has;
  }
  if ((*(void *)&v6 & 0x1000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
  if (self->_contextID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 4) & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
  if (self->_stationURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v7 = self->_has;
  if ((*(void *)&v7 & 0x2000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v15;
  }
  if (self->_contentItemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 v8 = self->_has;
  }
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v15;
  }
  if (self->_languageOption)
  {
    PBDataWriterWriteDataField();
    id v4 = v15;
  }
  if (self->_playbackQueueContext)
  {
    PBDataWriterWriteDataField();
    id v4 = v15;
  }
  if (self->_insertAfterContentItemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_nowPlayingContentItemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v15;
  }
  if (self->_commandID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_senderID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_remoteControlInterface)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
  if (self->_playbackSession)
  {
    PBDataWriterWriteDataField();
    id v4 = v15;
  }
  if (self->_userIdentityData)
  {
    PBDataWriterWriteDataField();
    id v4 = v15;
  }
  if (self->_insertBeforeContentItemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 v10 = self->_has;
    if ((*(void *)&v10 & 0x400000000) == 0)
    {
LABEL_70:
      if ((*(void *)&v10 & 0x800000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_164;
    }
  }
  else if ((*(void *)&v10 & 0x400000000) == 0)
  {
    goto LABEL_70;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 v10 = self->_has;
  if ((*(void *)&v10 & 0x800000000) == 0)
  {
LABEL_71:
    if ((*(void *)&v10 & 0x200000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
LABEL_164:
  PBDataWriterWriteBOOLField();
  id v4 = v15;
  if ((*(void *)&self->_has & 0x200000000) != 0)
  {
LABEL_72:
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
LABEL_73:
  if (self->_homeKitUserIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (*((unsigned char *)&self->_has + 5))
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
  if (self->_playbackSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v15;
  }
  if (self->_playbackSessionFilePath)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_playbackSessionRevision)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_playbackSessionMetadata)
  {
    PBDataWriterWriteDataField();
    id v4 = v15;
  }
  if (self->_playbackSessionType)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 4) & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
  if (self->_playbackAuthorizationToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_eventNoticeType)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_eventNoticeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_sharedPlaybackSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 v11 = self->_has;
    if ((*(unsigned char *)&v11 & 2) == 0)
    {
LABEL_101:
      if ((*(unsigned char *)&v11 & 1) == 0) {
        goto LABEL_103;
      }
      goto LABEL_102;
    }
  }
  else if ((*(unsigned char *)&v11 & 2) == 0)
  {
    goto LABEL_101;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v15;
  if (*(void *)&self->_has)
  {
LABEL_102:
    PBDataWriterWriteDoubleField();
    id v4 = v15;
  }
LABEL_103:
  if (self->_originatingDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_destinationDeviceUIDs)
  {
    PBDataWriterWriteDataField();
    id v4 = v15;
  }
  if (self->_desiredSessionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 v12 = self->_has;
  }
  if ((*(_DWORD *)&v12 & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
  if (self->_commandSequenceUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
  if (self->_siriTurnIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (self->_siriSearchDataSetIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if (*((unsigned char *)&self->_has + 4))
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
  if (self->_prepareForSetQueueProactiveReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v15;
  }
  if (self->_applicationUserIdentity)
  {
    PBDataWriterWriteDataField();
    id v4 = v15;
  }
  if (self->_systemAppPlaybackQueue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v13 = self->_has;
  if ((*(void *)&v13 & 0x20000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
    {
LABEL_133:
      if ((*(_DWORD *)&v13 & 0x1000000) == 0) {
        goto LABEL_134;
      }
      goto LABEL_171;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
    goto LABEL_133;
  }
  PBDataWriterWriteFloatField();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_134:
    if ((*(_DWORD *)&v13 & 0x800000) == 0) {
      goto LABEL_135;
    }
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteFloatField();
  id v4 = v15;
  $D356D6608A0B9B449BA135355957D2E8 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_135:
    if ((*(void *)&v13 & 0x40000000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_136;
  }
LABEL_172:
  PBDataWriterWriteFloatField();
  id v4 = v15;
  if ((*(void *)&self->_has & 0x40000000000) != 0)
  {
LABEL_136:
    PBDataWriterWriteBOOLField();
    id v4 = v15;
  }
LABEL_137:
  if (self->_associatedParticipantIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v15;
    $D356D6608A0B9B449BA135355957D2E8 v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v15;
  }
  if (self->_dialogOptions)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v15;
  }
  if (self->_clientPreferredLanguages)
  {
    PBDataWriterWriteStringField();
    id v4 = v15;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v15;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (self->_sourceID)
  {
    objc_msgSend(v4, "setSourceID:");
    id v4 = v15;
  }
  if (self->_mediaType)
  {
    objc_msgSend(v15, "setMediaType:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    *((unsigned char *)v4 + 480) = self->_externalPlayerCommand;
    *((void *)v4 + 62) |= 0x20000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_154;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 104) = LODWORD(self->_skipInterval);
  *((void *)v4 + 62) |= 0x100000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_155;
  }
LABEL_154:
  *((_DWORD *)v4 + 65) = LODWORD(self->_playbackRate);
  *((void *)v4 + 62) |= 0x800uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_156;
  }
LABEL_155:
  *((_DWORD *)v4 + 86) = LODWORD(self->_rating);
  *((void *)v4 + 62) |= 0x8000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_157;
  }
LABEL_156:
  *((unsigned char *)v4 + 481) = self->_negative;
  *((void *)v4 + 62) |= 0x40000000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_158;
  }
LABEL_157:
  *((void *)v4 + 4) = *(void *)&self->_playbackPosition;
  *((void *)v4 + 62) |= 8uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_159;
  }
LABEL_158:
  *((_DWORD *)v4 + 90) = self->_repeatMode;
  *((void *)v4 + 62) |= 0x10000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_160;
  }
LABEL_159:
  *((_DWORD *)v4 + 98) = self->_shuffleMode;
  *((void *)v4 + 62) |= 0x80000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_160:
  *((void *)v4 + 8) = self->_trackID;
  *((void *)v4 + 62) |= 0x80uLL;
  if ((*(void *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    *((void *)v4 + 5) = self->_radioStationID;
    *((void *)v4 + 62) |= 0x10uLL;
  }
LABEL_16:
  if (self->_radioStationHash)
  {
    objc_msgSend(v15, "setRadioStationHash:");
    id v4 = v15;
  }
  if (self->_systemAppPlaybackQueueData)
  {
    objc_msgSend(v15, "setSystemAppPlaybackQueueData:");
    id v4 = v15;
  }
  if (self->_destinationAppDisplayID)
  {
    objc_msgSend(v15, "setDestinationAppDisplayID:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    *((_DWORD *)v4 + 92) = self->_sendOptions;
    *((void *)v4 + 62) |= 0x40000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v6 = self->_has;
  }
  if ((*(void *)&v6 & 0x1000000000) != 0)
  {
    *((unsigned char *)v4 + 487) = self->_requestDefermentToPlaybackQueuePosition;
    *((void *)v4 + 62) |= 0x1000000000uLL;
  }
  if (self->_contextID)
  {
    objc_msgSend(v15, "setContextID:");
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 4) & 0x40) != 0)
  {
    *((unsigned char *)v4 + 489) = self->_shouldOverrideManuallyCuratedQueue;
    *((void *)v4 + 62) |= 0x4000000000uLL;
  }
  if (self->_stationURL)
  {
    objc_msgSend(v15, "setStationURL:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v7 = self->_has;
  if ((*(void *)&v7 & 0x2000000000) != 0)
  {
    *((unsigned char *)v4 + 488) = self->_shouldBeginRadioPlayback;
    *((void *)v4 + 62) |= 0x2000000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 63) = self->_playbackQueueInsertionPosition;
    *((void *)v4 + 62) |= 0x200uLL;
  }
  if (self->_contentItemID)
  {
    objc_msgSend(v15, "setContentItemID:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
    *((_DWORD *)v4 + 64) = self->_playbackQueueOffset;
    *((void *)v4 + 62) |= 0x400uLL;
    $D356D6608A0B9B449BA135355957D2E8 v8 = self->_has;
  }
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 62) = self->_playbackQueueDestinationOffset;
    *((void *)v4 + 62) |= 0x100uLL;
  }
  if (self->_languageOption)
  {
    objc_msgSend(v15, "setLanguageOption:");
    id v4 = v15;
  }
  if (self->_playbackQueueContext)
  {
    objc_msgSend(v15, "setPlaybackQueueContext:");
    id v4 = v15;
  }
  if (self->_insertAfterContentItemID)
  {
    objc_msgSend(v15, "setInsertAfterContentItemID:");
    id v4 = v15;
  }
  if (self->_nowPlayingContentItemID)
  {
    objc_msgSend(v15, "setNowPlayingContentItemID:");
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *((_DWORD *)v4 + 91) = self->_replaceIntent;
    *((void *)v4 + 62) |= 0x20000uLL;
  }
  if (self->_commandID)
  {
    objc_msgSend(v15, "setCommandID:");
    id v4 = v15;
  }
  if (self->_senderID)
  {
    objc_msgSend(v15, "setSenderID:");
    id v4 = v15;
  }
  if (self->_remoteControlInterface)
  {
    objc_msgSend(v15, "setRemoteControlInterface:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) != 0)
  {
    *((unsigned char *)v4 + 478) = self->_beginSeek;
    *((void *)v4 + 62) |= 0x8000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x10000000) != 0)
  {
    *((unsigned char *)v4 + 479) = self->_endSeek;
    *((void *)v4 + 62) |= 0x10000000uLL;
  }
  if (self->_playbackSession)
  {
    objc_msgSend(v15, "setPlaybackSession:");
    id v4 = v15;
  }
  if (self->_userIdentityData)
  {
    objc_msgSend(v15, "setUserIdentityData:");
    id v4 = v15;
  }
  if (self->_insertBeforeContentItemID)
  {
    objc_msgSend(v15, "setInsertBeforeContentItemID:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 83) = self->_queueEndAction;
    *((void *)v4 + 62) |= 0x4000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v10 = self->_has;
    if ((*(void *)&v10 & 0x400000000) == 0)
    {
LABEL_70:
      if ((*(void *)&v10 & 0x800000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_164;
    }
  }
  else if ((*(void *)&v10 & 0x400000000) == 0)
  {
    goto LABEL_70;
  }
  *((unsigned char *)v4 + 485) = self->_preservesRepeatMode;
  *((void *)v4 + 62) |= 0x400000000uLL;
  $D356D6608A0B9B449BA135355957D2E8 v10 = self->_has;
  if ((*(void *)&v10 & 0x800000000) == 0)
  {
LABEL_71:
    if ((*(void *)&v10 & 0x200000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
LABEL_164:
  *((unsigned char *)v4 + 486) = self->_preservesShuffleMode;
  *((void *)v4 + 62) |= 0x800000000uLL;
  if ((*(void *)&self->_has & 0x200000000) != 0)
  {
LABEL_72:
    *((unsigned char *)v4 + 484) = self->_preservesQueueEndAction;
    *((void *)v4 + 62) |= 0x200000000uLL;
  }
LABEL_73:
  if (self->_homeKitUserIdentifier)
  {
    objc_msgSend(v15, "setHomeKitUserIdentifier:");
    id v4 = v15;
  }
  if (*((unsigned char *)&self->_has + 5))
  {
    *((unsigned char *)v4 + 491) = self->_verifySupportedCommands;
    *((void *)v4 + 62) |= 0x10000000000uLL;
  }
  if (self->_playbackSessionIdentifier)
  {
    objc_msgSend(v15, "setPlaybackSessionIdentifier:");
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *((_DWORD *)v4 + 74) = self->_playbackSessionPriority;
    *((void *)v4 + 62) |= 0x1000uLL;
  }
  if (self->_playbackSessionFilePath)
  {
    objc_msgSend(v15, "setPlaybackSessionFilePath:");
    id v4 = v15;
  }
  if (self->_playbackSessionRevision)
  {
    objc_msgSend(v15, "setPlaybackSessionRevision:");
    id v4 = v15;
  }
  if (self->_playbackSessionMetadata)
  {
    objc_msgSend(v15, "setPlaybackSessionMetadata:");
    id v4 = v15;
  }
  if (self->_playbackSessionType)
  {
    objc_msgSend(v15, "setPlaybackSessionType:");
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 4) & 0x80) != 0)
  {
    *((unsigned char *)v4 + 490) = self->_trueCompletion;
    *((void *)v4 + 62) |= 0x8000000000uLL;
  }
  if (self->_playbackAuthorizationToken)
  {
    objc_msgSend(v15, "setPlaybackAuthorizationToken:");
    id v4 = v15;
  }
  if (self->_eventNoticeType)
  {
    objc_msgSend(v15, "setEventNoticeType:");
    id v4 = v15;
  }
  if (self->_eventNoticeIdentifier)
  {
    objc_msgSend(v15, "setEventNoticeIdentifier:");
    id v4 = v15;
  }
  if (self->_sharedPlaybackSessionIdentifier)
  {
    objc_msgSend(v15, "setSharedPlaybackSessionIdentifier:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_commandTimeout;
    *((void *)v4 + 62) |= 4uLL;
    $D356D6608A0B9B449BA135355957D2E8 v11 = self->_has;
    if ((*(unsigned char *)&v11 & 2) == 0)
    {
LABEL_101:
      if ((*(unsigned char *)&v11 & 1) == 0) {
        goto LABEL_103;
      }
      goto LABEL_102;
    }
  }
  else if ((*(unsigned char *)&v11 & 2) == 0)
  {
    goto LABEL_101;
  }
  *((void *)v4 + 2) = *(void *)&self->_assistantTTSEndTimestamp;
  *((void *)v4 + 62) |= 2uLL;
  if (*(void *)&self->_has)
  {
LABEL_102:
    *((void *)v4 + 1) = *(void *)&self->_assistantCommandSendTimestamp;
    *((void *)v4 + 62) |= 1uLL;
  }
LABEL_103:
  if (self->_originatingDeviceUID)
  {
    objc_msgSend(v15, "setOriginatingDeviceUID:");
    id v4 = v15;
  }
  if (self->_destinationDeviceUIDs)
  {
    objc_msgSend(v15, "setDestinationDeviceUIDs:");
    id v4 = v15;
  }
  if (self->_desiredSessionID)
  {
    objc_msgSend(v15, "setDesiredSessionID:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
    *((unsigned char *)v4 + 476) = self->_alwaysIgnoreDuringCall;
    *((void *)v4 + 62) |= 0x2000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v12 = self->_has;
  }
  if ((*(_DWORD *)&v12 & 0x4000000) != 0)
  {
    *((unsigned char *)v4 + 477) = self->_alwaysIgnoreDuringSharePlay;
    *((void *)v4 + 62) |= 0x4000000uLL;
  }
  if (self->_commandSequenceUUID)
  {
    objc_msgSend(v15, "setCommandSequenceUUID:");
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    *((unsigned char *)v4 + 482) = self->_originatedFromRemoteDevice;
    *((void *)v4 + 62) |= 0x80000000uLL;
  }
  if (self->_siriTurnIdentifier)
  {
    objc_msgSend(v15, "setSiriTurnIdentifier:");
    id v4 = v15;
  }
  if (self->_siriSearchDataSetIdentifier)
  {
    objc_msgSend(v15, "setSiriSearchDataSetIdentifier:");
    id v4 = v15;
  }
  if (*((unsigned char *)&self->_has + 4))
  {
    *((unsigned char *)v4 + 483) = self->_prepareForSetQueueIsProactive;
    *((void *)v4 + 62) |= 0x100000000uLL;
  }
  if (self->_prepareForSetQueueProactiveReason)
  {
    objc_msgSend(v15, "setPrepareForSetQueueProactiveReason:");
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *((_DWORD *)v4 + 82) = self->_prepareForSetQueueProactiveReasonType;
    *((void *)v4 + 62) |= 0x2000uLL;
  }
  if (self->_applicationUserIdentity)
  {
    objc_msgSend(v15, "setApplicationUserIdentity:");
    id v4 = v15;
  }
  if (self->_systemAppPlaybackQueue)
  {
    objc_msgSend(v15, "setSystemAppPlaybackQueue:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v13 = self->_has;
  if ((*(void *)&v13 & 0x20000000000) != 0)
  {
    *((unsigned char *)v4 + 492) = self->_vocalsControlActive;
    *((void *)v4 + 62) |= 0x20000000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
    {
LABEL_133:
      if ((*(_DWORD *)&v13 & 0x1000000) == 0) {
        goto LABEL_134;
      }
      goto LABEL_171;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
    goto LABEL_133;
  }
  *((_DWORD *)v4 + 116) = LODWORD(self->_vocalsControlLevel);
  *((void *)v4 + 62) |= 0x400000uLL;
  $D356D6608A0B9B449BA135355957D2E8 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_134:
    if ((*(_DWORD *)&v13 & 0x800000) == 0) {
      goto LABEL_135;
    }
    goto LABEL_172;
  }
LABEL_171:
  *((_DWORD *)v4 + 118) = LODWORD(self->_vocalsControlMinLevel);
  *((void *)v4 + 62) |= 0x1000000uLL;
  $D356D6608A0B9B449BA135355957D2E8 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_135:
    if ((*(void *)&v13 & 0x40000000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_136;
  }
LABEL_172:
  *((_DWORD *)v4 + 117) = LODWORD(self->_vocalsControlMaxLevel);
  *((void *)v4 + 62) |= 0x800000uLL;
  if ((*(void *)&self->_has & 0x40000000000) != 0)
  {
LABEL_136:
    *((unsigned char *)v4 + 493) = self->_vocalsControlContinuous;
    *((void *)v4 + 62) |= 0x40000000000uLL;
  }
LABEL_137:
  if (self->_associatedParticipantIdentifier)
  {
    objc_msgSend(v15, "setAssociatedParticipantIdentifier:");
    id v4 = v15;
  }
  $D356D6608A0B9B449BA135355957D2E8 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    *((void *)v4 + 7) = *(void *)&self->_sleepTimerTime;
    *((void *)v4 + 62) |= 0x40uLL;
    $D356D6608A0B9B449BA135355957D2E8 v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    *((_DWORD *)v4 + 105) = self->_sleepTimerStopMode;
    *((void *)v4 + 62) |= 0x200000uLL;
  }
  if (self->_dialogOptions)
  {
    objc_msgSend(v15, "setDialogOptions:");
    id v4 = v15;
  }
  if (self->_clientPreferredLanguages)
  {
    objc_msgSend(v15, "setClientPreferredLanguages:");
    id v4 = v15;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((void *)v4 + 6) = *(void *)&self->_referencePosition;
    *((void *)v4 + 62) |= 0x20uLL;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sourceID copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v7 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = v6;

  uint64_t v8 = [(NSString *)self->_mediaType copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v9 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v8;

  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    *(unsigned char *)(v5 + 480) = self->_externalPlayerCommand;
    *(void *)(v5 + 496) |= 0x20000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 416) = self->_skipInterval;
  *(void *)(v5 + 496) |= 0x100000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(float *)(v5 + 260) = self->_playbackRate;
  *(void *)(v5 + 496) |= 0x800uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(float *)(v5 + 344) = self->_rating;
  *(void *)(v5 + 496) |= 0x8000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(unsigned char *)(v5 + 481) = self->_negative;
  *(void *)(v5 + 496) |= 0x40000000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(double *)(v5 + 32) = self->_playbackPosition;
  *(void *)(v5 + 496) |= 8uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 360) = self->_repeatMode;
  *(void *)(v5 + 496) |= 0x10000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 392) = self->_shuffleMode;
  *(void *)(v5 + 496) |= 0x80000uLL;
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_78:
  *(void *)(v5 + 64) = self->_trackID;
  *(void *)(v5 + 496) |= 0x80uLL;
  if ((*(void *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *(void *)(v5 + 40) = self->_radioStationID;
    *(void *)(v5 + 496) |= 0x10uLL;
  }
LABEL_12:
  uint64_t v11 = [(NSString *)self->_radioStationHash copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v12 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v11;

  uint64_t v13 = [(NSData *)self->_systemAppPlaybackQueueData copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v14 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v13;

  uint64_t v15 = [(NSString *)self->_destinationAppDisplayID copyWithZone:a3];
  v16 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v15;

  $D356D6608A0B9B449BA135355957D2E8 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x40000) != 0)
  {
    *(_DWORD *)(v5 + 368) = self->_sendOptions;
    *(void *)(v5 + 496) |= 0x40000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v17 = self->_has;
  }
  if ((*(void *)&v17 & 0x1000000000) != 0)
  {
    *(unsigned char *)(v5 + 487) = self->_requestDefermentToPlaybackQueuePosition;
    *(void *)(v5 + 496) |= 0x1000000000uLL;
  }
  uint64_t v18 = [(NSString *)self->_contextID copyWithZone:a3];
  v19 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v18;

  if ((*((unsigned char *)&self->_has + 4) & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 489) = self->_shouldOverrideManuallyCuratedQueue;
    *(void *)(v5 + 496) |= 0x4000000000uLL;
  }
  uint64_t v20 = [(NSString *)self->_stationURL copyWithZone:a3];
  v21 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = v20;

  $D356D6608A0B9B449BA135355957D2E8 v22 = self->_has;
  if ((*(void *)&v22 & 0x2000000000) != 0)
  {
    *(unsigned char *)(v5 + 488) = self->_shouldBeginRadioPlayback;
    *(void *)(v5 + 496) |= 0x2000000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v22 = self->_has;
  }
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 252) = self->_playbackQueueInsertionPosition;
    *(void *)(v5 + 496) |= 0x200uLL;
  }
  uint64_t v23 = [(NSString *)self->_contentItemID copyWithZone:a3];
  v24 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v23;

  $D356D6608A0B9B449BA135355957D2E8 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_playbackQueueOffset;
    *(void *)(v5 + 496) |= 0x400uLL;
    $D356D6608A0B9B449BA135355957D2E8 v25 = self->_has;
  }
  if ((*(_WORD *)&v25 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 248) = self->_playbackQueueDestinationOffset;
    *(void *)(v5 + 496) |= 0x100uLL;
  }
  uint64_t v26 = [(NSData *)self->_languageOption copyWithZone:a3];
  v27 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v26;

  uint64_t v28 = [(NSData *)self->_playbackQueueContext copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v29 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v28;

  uint64_t v30 = [(NSString *)self->_insertAfterContentItemID copyWithZone:a3];
  v31 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v30;

  uint64_t v32 = [(NSString *)self->_nowPlayingContentItemID copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v33 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v32;

  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *(_DWORD *)(v5 + 364) = self->_replaceIntent;
    *(void *)(v5 + 496) |= 0x20000uLL;
  }
  uint64_t v34 = [(NSString *)self->_commandID copyWithZone:a3];
  v35 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v34;

  uint64_t v36 = [(NSString *)self->_senderID copyWithZone:a3];
  v37 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v36;

  uint64_t v38 = [(NSString *)self->_remoteControlInterface copyWithZone:a3];
  v39 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v38;

  $D356D6608A0B9B449BA135355957D2E8 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x8000000) != 0)
  {
    *(unsigned char *)(v5 + 478) = self->_beginSeek;
    *(void *)(v5 + 496) |= 0x8000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v40 = self->_has;
  }
  if ((*(_DWORD *)&v40 & 0x10000000) != 0)
  {
    *(unsigned char *)(v5 + 479) = self->_endSeek;
    *(void *)(v5 + 496) |= 0x10000000uLL;
  }
  uint64_t v41 = [(NSData *)self->_playbackSession copyWithZone:a3];
  v42 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v41;

  uint64_t v43 = [(NSData *)self->_userIdentityData copyWithZone:a3];
  v44 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v43;

  uint64_t v45 = [(NSString *)self->_insertBeforeContentItemID copyWithZone:a3];
  v46 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v45;

  $D356D6608A0B9B449BA135355957D2E8 v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 332) = self->_queueEndAction;
    *(void *)(v5 + 496) |= 0x4000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v47 = self->_has;
    if ((*(void *)&v47 & 0x400000000) == 0)
    {
LABEL_34:
      if ((*(void *)&v47 & 0x800000000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_82;
    }
  }
  else if ((*(void *)&v47 & 0x400000000) == 0)
  {
    goto LABEL_34;
  }
  *(unsigned char *)(v5 + 485) = self->_preservesRepeatMode;
  *(void *)(v5 + 496) |= 0x400000000uLL;
  $D356D6608A0B9B449BA135355957D2E8 v47 = self->_has;
  if ((*(void *)&v47 & 0x800000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v47 & 0x200000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_82:
  *(unsigned char *)(v5 + 486) = self->_preservesShuffleMode;
  *(void *)(v5 + 496) |= 0x800000000uLL;
  if ((*(void *)&self->_has & 0x200000000) != 0)
  {
LABEL_36:
    *(unsigned char *)(v5 + 484) = self->_preservesQueueEndAction;
    *(void *)(v5 + 496) |= 0x200000000uLL;
  }
LABEL_37:
  uint64_t v48 = [(NSString *)self->_homeKitUserIdentifier copyWithZone:a3];
  v49 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v48;

  if (*((unsigned char *)&self->_has + 5))
  {
    *(unsigned char *)(v5 + 491) = self->_verifySupportedCommands;
    *(void *)(v5 + 496) |= 0x10000000000uLL;
  }
  uint64_t v50 = [(NSString *)self->_playbackSessionIdentifier copyWithZone:a3];
  v51 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v50;

  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_playbackSessionPriority;
    *(void *)(v5 + 496) |= 0x1000uLL;
  }
  uint64_t v52 = [(NSString *)self->_playbackSessionFilePath copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v53 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v52;

  uint64_t v54 = [(NSString *)self->_playbackSessionRevision copyWithZone:a3];
  v55 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v54;

  uint64_t v56 = [(NSData *)self->_playbackSessionMetadata copyWithZone:a3];
  v57 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v56;

  uint64_t v58 = [(NSString *)self->_playbackSessionType copyWithZone:a3];
  v59 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v58;

  if ((*((unsigned char *)&self->_has + 4) & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 490) = self->_trueCompletion;
    *(void *)(v5 + 496) |= 0x8000000000uLL;
  }
  uint64_t v60 = [(NSString *)self->_playbackAuthorizationToken copyWithZone:a3];
  v61 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v60;

  uint64_t v62 = [(NSString *)self->_eventNoticeType copyWithZone:a3];
  v63 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v62;

  uint64_t v64 = [(NSString *)self->_eventNoticeIdentifier copyWithZone:a3];
  v65 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v64;

  uint64_t v66 = [(NSString *)self->_sharedPlaybackSessionIdentifier copyWithZone:a3];
  v67 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v66;

  $D356D6608A0B9B449BA135355957D2E8 v68 = self->_has;
  if ((*(unsigned char *)&v68 & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_commandTimeout;
    *(void *)(v5 + 496) |= 4uLL;
    $D356D6608A0B9B449BA135355957D2E8 v68 = self->_has;
    if ((*(unsigned char *)&v68 & 2) == 0)
    {
LABEL_45:
      if ((*(unsigned char *)&v68 & 1) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((*(unsigned char *)&v68 & 2) == 0)
  {
    goto LABEL_45;
  }
  *(double *)(v5 + 16) = self->_assistantTTSEndTimestamp;
  *(void *)(v5 + 496) |= 2uLL;
  if (*(void *)&self->_has)
  {
LABEL_46:
    *(double *)(v5 + 8) = self->_assistantCommandSendTimestamp;
    *(void *)(v5 + 496) |= 1uLL;
  }
LABEL_47:
  uint64_t v69 = [(NSString *)self->_originatingDeviceUID copyWithZone:a3];
  v70 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v69;

  uint64_t v71 = [(NSData *)self->_destinationDeviceUIDs copyWithZone:a3];
  v72 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v71;

  uint64_t v73 = [(NSString *)self->_desiredSessionID copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v74 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v73;

  $D356D6608A0B9B449BA135355957D2E8 v75 = self->_has;
  if ((*(_DWORD *)&v75 & 0x2000000) != 0)
  {
    *(unsigned char *)(v5 + 476) = self->_alwaysIgnoreDuringCall;
    *(void *)(v5 + 496) |= 0x2000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v75 = self->_has;
  }
  if ((*(_DWORD *)&v75 & 0x4000000) != 0)
  {
    *(unsigned char *)(v5 + 477) = self->_alwaysIgnoreDuringSharePlay;
    *(void *)(v5 + 496) |= 0x4000000uLL;
  }
  uint64_t v76 = [(NSString *)self->_commandSequenceUUID copyWithZone:a3];
  v77 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v76;

  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 482) = self->_originatedFromRemoteDevice;
    *(void *)(v5 + 496) |= 0x80000000uLL;
  }
  uint64_t v78 = [(NSString *)self->_siriTurnIdentifier copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v79 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v78;

  uint64_t v80 = [(NSString *)self->_siriSearchDataSetIdentifier copyWithZone:a3];
  v81 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v80;

  if (*((unsigned char *)&self->_has + 4))
  {
    *(unsigned char *)(v5 + 483) = self->_prepareForSetQueueIsProactive;
    *(void *)(v5 + 496) |= 0x100000000uLL;
  }
  uint64_t v82 = [(NSString *)self->_prepareForSetQueueProactiveReason copyWithZone:a3];
  v83 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v82;

  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 328) = self->_prepareForSetQueueProactiveReasonType;
    *(void *)(v5 + 496) |= 0x2000uLL;
  }
  uint64_t v84 = [(NSData *)self->_applicationUserIdentity copyWithZone:a3];
  v85 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v84;

  id v86 = [(_MRSystemPlaybackQueueProtobuf *)self->_systemAppPlaybackQueue copyWithZone:a3];
  v87 = *(void **)(v5 + 440);
  *(void *)(v5 + 440) = v86;

  $D356D6608A0B9B449BA135355957D2E8 v88 = self->_has;
  if ((*(void *)&v88 & 0x20000000000) != 0)
  {
    *(unsigned char *)(v5 + 492) = self->_vocalsControlActive;
    *(void *)(v5 + 496) |= 0x20000000000uLL;
    $D356D6608A0B9B449BA135355957D2E8 v88 = self->_has;
    if ((*(_DWORD *)&v88 & 0x400000) == 0)
    {
LABEL_59:
      if ((*(_DWORD *)&v88 & 0x1000000) == 0) {
        goto LABEL_60;
      }
      goto LABEL_89;
    }
  }
  else if ((*(_DWORD *)&v88 & 0x400000) == 0)
  {
    goto LABEL_59;
  }
  *(float *)(v5 + 464) = self->_vocalsControlLevel;
  *(void *)(v5 + 496) |= 0x400000uLL;
  $D356D6608A0B9B449BA135355957D2E8 v88 = self->_has;
  if ((*(_DWORD *)&v88 & 0x1000000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v88 & 0x800000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(float *)(v5 + 472) = self->_vocalsControlMinLevel;
  *(void *)(v5 + 496) |= 0x1000000uLL;
  $D356D6608A0B9B449BA135355957D2E8 v88 = self->_has;
  if ((*(_DWORD *)&v88 & 0x800000) == 0)
  {
LABEL_61:
    if ((*(void *)&v88 & 0x40000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
LABEL_90:
  *(float *)(v5 + 468) = self->_vocalsControlMaxLevel;
  *(void *)(v5 + 496) |= 0x800000uLL;
  if ((*(void *)&self->_has & 0x40000000000) != 0)
  {
LABEL_62:
    *(unsigned char *)(v5 + 493) = self->_vocalsControlContinuous;
    *(void *)(v5 + 496) |= 0x40000000000uLL;
  }
LABEL_63:
  uint64_t v89 = [(NSString *)self->_associatedParticipantIdentifier copyWithZone:a3];
  v90 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v89;

  $D356D6608A0B9B449BA135355957D2E8 v91 = self->_has;
  if ((*(unsigned char *)&v91 & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_sleepTimerTime;
    *(void *)(v5 + 496) |= 0x40uLL;
    $D356D6608A0B9B449BA135355957D2E8 v91 = self->_has;
  }
  if ((*(_DWORD *)&v91 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 420) = self->_sleepTimerStopMode;
    *(void *)(v5 + 496) |= 0x200000uLL;
  }
  id v92 = [(_MRDictionaryProtobuf *)self->_dialogOptions copyWithZone:a3];
  v93 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v92;

  uint64_t v94 = [(NSString *)self->_clientPreferredLanguages copyWithZone:a3];
  $D356D6608A0B9B449BA135355957D2E8 v95 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v94;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_referencePosition;
    *(void *)(v5 + 496) |= 0x20uLL;
  }
  id v96 = (id)v5;

  return v96;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_359;
  }
  sourceID = self->_sourceID;
  if ((unint64_t)sourceID | *((void *)v4 + 53))
  {
    if (!-[NSString isEqual:](sourceID, "isEqual:")) {
      goto LABEL_359;
    }
  }
  mediaType = self->_mediaType;
  if ((unint64_t)mediaType | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](mediaType, "isEqual:")) {
      goto LABEL_359;
    }
  }
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  uint64_t v8 = *((void *)v4 + 62);
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v8 & 0x20000000) == 0) {
      goto LABEL_359;
    }
    if (self->_externalPlayerCommand)
    {
      if (!*((unsigned char *)v4 + 480)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 480))
    {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x20000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_skipInterval != *((float *)v4 + 104)) {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_playbackRate != *((float *)v4 + 65)) {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_rating != *((float *)v4 + 86)) {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) == 0) {
      goto LABEL_359;
    }
    if (self->_negative)
    {
      if (!*((unsigned char *)v4 + 481)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 481))
    {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x40000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_playbackPosition != *((double *)v4 + 4)) {
      goto LABEL_359;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_repeatMode != *((_DWORD *)v4 + 90)) {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 98)) {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_trackID != *((void *)v4 + 8)) {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_359;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_radioStationID != *((void *)v4 + 5)) {
      goto LABEL_359;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_359;
  }
  radioStationHash = self->_radioStationHash;
  if ((unint64_t)radioStationHash | *((void *)v4 + 42)
    && !-[NSString isEqual:](radioStationHash, "isEqual:"))
  {
    goto LABEL_359;
  }
  systemAppPlaybackQueueData = self->_systemAppPlaybackQueueData;
  if ((unint64_t)systemAppPlaybackQueueData | *((void *)v4 + 56))
  {
    if (!-[NSData isEqual:](systemAppPlaybackQueueData, "isEqual:")) {
      goto LABEL_359;
    }
  }
  destinationAppDisplayID = self->_destinationAppDisplayID;
  if ((unint64_t)destinationAppDisplayID | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](destinationAppDisplayID, "isEqual:")) {
      goto LABEL_359;
    }
  }
  $D356D6608A0B9B449BA135355957D2E8 v12 = self->_has;
  uint64_t v13 = *((void *)v4 + 62);
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    if ((v13 & 0x40000) == 0 || self->_sendOptions != *((_DWORD *)v4 + 92)) {
      goto LABEL_359;
    }
  }
  else if ((v13 & 0x40000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(void *)&v12 & 0x1000000000) != 0)
  {
    if ((v13 & 0x1000000000) == 0) {
      goto LABEL_359;
    }
    if (self->_requestDefermentToPlaybackQueuePosition)
    {
      if (!*((unsigned char *)v4 + 487)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 487))
    {
      goto LABEL_359;
    }
  }
  else if ((v13 & 0x1000000000) != 0)
  {
    goto LABEL_359;
  }
  contextID = self->_contextID;
  if ((unint64_t)contextID | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](contextID, "isEqual:")) {
      goto LABEL_359;
    }
    $D356D6608A0B9B449BA135355957D2E8 v12 = self->_has;
  }
  uint64_t v15 = *((void *)v4 + 62);
  if ((*(void *)&v12 & 0x4000000000) != 0)
  {
    if ((v15 & 0x4000000000) == 0) {
      goto LABEL_359;
    }
    if (self->_shouldOverrideManuallyCuratedQueue)
    {
      if (!*((unsigned char *)v4 + 489)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 489))
    {
      goto LABEL_359;
    }
  }
  else if ((v15 & 0x4000000000) != 0)
  {
    goto LABEL_359;
  }
  stationURL = self->_stationURL;
  if ((unint64_t)stationURL | *((void *)v4 + 54))
  {
    if (!-[NSString isEqual:](stationURL, "isEqual:")) {
      goto LABEL_359;
    }
    $D356D6608A0B9B449BA135355957D2E8 v12 = self->_has;
  }
  uint64_t v17 = *((void *)v4 + 62);
  if ((*(void *)&v12 & 0x2000000000) != 0)
  {
    if ((v17 & 0x2000000000) == 0) {
      goto LABEL_359;
    }
    if (self->_shouldBeginRadioPlayback)
    {
      if (!*((unsigned char *)v4 + 488)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 488))
    {
      goto LABEL_359;
    }
  }
  else if ((v17 & 0x2000000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_playbackQueueInsertionPosition != *((_DWORD *)v4 + 63)) {
      goto LABEL_359;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_359;
  }
  contentItemID = self->_contentItemID;
  if ((unint64_t)contentItemID | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](contentItemID, "isEqual:")) {
      goto LABEL_359;
    }
    $D356D6608A0B9B449BA135355957D2E8 v12 = self->_has;
  }
  uint64_t v19 = *((void *)v4 + 62);
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v19 & 0x400) == 0 || self->_playbackQueueOffset != *((_DWORD *)v4 + 64)) {
      goto LABEL_359;
    }
  }
  else if ((v19 & 0x400) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0 || self->_playbackQueueDestinationOffset != *((_DWORD *)v4 + 62)) {
      goto LABEL_359;
    }
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_359;
  }
  languageOption = self->_languageOption;
  if ((unint64_t)languageOption | *((void *)v4 + 25)
    && !-[NSData isEqual:](languageOption, "isEqual:"))
  {
    goto LABEL_359;
  }
  playbackQueueContext = self->_playbackQueueContext;
  if ((unint64_t)playbackQueueContext | *((void *)v4 + 30))
  {
    if (!-[NSData isEqual:](playbackQueueContext, "isEqual:")) {
      goto LABEL_359;
    }
  }
  insertAfterContentItemID = self->_insertAfterContentItemID;
  if ((unint64_t)insertAfterContentItemID | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](insertAfterContentItemID, "isEqual:")) {
      goto LABEL_359;
    }
  }
  nowPlayingContentItemID = self->_nowPlayingContentItemID;
  if ((unint64_t)nowPlayingContentItemID | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](nowPlayingContentItemID, "isEqual:")) {
      goto LABEL_359;
    }
  }
  uint64_t v24 = *((void *)v4 + 62);
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    if ((v24 & 0x20000) == 0 || self->_replaceIntent != *((_DWORD *)v4 + 91)) {
      goto LABEL_359;
    }
  }
  else if ((v24 & 0x20000) != 0)
  {
    goto LABEL_359;
  }
  commandID = self->_commandID;
  if ((unint64_t)commandID | *((void *)v4 + 12) && !-[NSString isEqual:](commandID, "isEqual:")) {
    goto LABEL_359;
  }
  senderID = self->_senderID;
  if ((unint64_t)senderID | *((void *)v4 + 47))
  {
    if (!-[NSString isEqual:](senderID, "isEqual:")) {
      goto LABEL_359;
    }
  }
  remoteControlInterface = self->_remoteControlInterface;
  if ((unint64_t)remoteControlInterface | *((void *)v4 + 44))
  {
    if (!-[NSString isEqual:](remoteControlInterface, "isEqual:")) {
      goto LABEL_359;
    }
  }
  $D356D6608A0B9B449BA135355957D2E8 v28 = self->_has;
  uint64_t v29 = *((void *)v4 + 62);
  if ((*(_DWORD *)&v28 & 0x8000000) != 0)
  {
    if ((v29 & 0x8000000) == 0) {
      goto LABEL_359;
    }
    if (self->_beginSeek)
    {
      if (!*((unsigned char *)v4 + 478)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 478))
    {
      goto LABEL_359;
    }
  }
  else if ((v29 & 0x8000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v28 & 0x10000000) != 0)
  {
    if ((v29 & 0x10000000) == 0) {
      goto LABEL_359;
    }
    if (self->_endSeek)
    {
      if (!*((unsigned char *)v4 + 479)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 479))
    {
      goto LABEL_359;
    }
  }
  else if ((v29 & 0x10000000) != 0)
  {
    goto LABEL_359;
  }
  playbackSession = self->_playbackSession;
  if ((unint64_t)playbackSession | *((void *)v4 + 33)
    && !-[NSData isEqual:](playbackSession, "isEqual:"))
  {
    goto LABEL_359;
  }
  userIdentityData = self->_userIdentityData;
  if ((unint64_t)userIdentityData | *((void *)v4 + 57))
  {
    if (!-[NSData isEqual:](userIdentityData, "isEqual:")) {
      goto LABEL_359;
    }
  }
  insertBeforeContentItemID = self->_insertBeforeContentItemID;
  if ((unint64_t)insertBeforeContentItemID | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](insertBeforeContentItemID, "isEqual:")) {
      goto LABEL_359;
    }
  }
  $D356D6608A0B9B449BA135355957D2E8 v33 = self->_has;
  uint64_t v34 = *((void *)v4 + 62);
  if ((*(_WORD *)&v33 & 0x4000) != 0)
  {
    if ((v34 & 0x4000) == 0 || self->_queueEndAction != *((_DWORD *)v4 + 83)) {
      goto LABEL_359;
    }
  }
  else if ((v34 & 0x4000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(void *)&v33 & 0x400000000) != 0)
  {
    if ((v34 & 0x400000000) == 0) {
      goto LABEL_359;
    }
    if (self->_preservesRepeatMode)
    {
      if (!*((unsigned char *)v4 + 485)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 485))
    {
      goto LABEL_359;
    }
  }
  else if ((v34 & 0x400000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(void *)&v33 & 0x800000000) != 0)
  {
    if ((v34 & 0x800000000) == 0) {
      goto LABEL_359;
    }
    if (self->_preservesShuffleMode)
    {
      if (!*((unsigned char *)v4 + 486)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 486))
    {
      goto LABEL_359;
    }
  }
  else if ((v34 & 0x800000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(void *)&v33 & 0x200000000) != 0)
  {
    if ((v34 & 0x200000000) == 0) {
      goto LABEL_359;
    }
    if (self->_preservesQueueEndAction)
    {
      if (!*((unsigned char *)v4 + 484)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 484))
    {
      goto LABEL_359;
    }
  }
  else if ((v34 & 0x200000000) != 0)
  {
    goto LABEL_359;
  }
  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  if ((unint64_t)homeKitUserIdentifier | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](homeKitUserIdentifier, "isEqual:")) {
      goto LABEL_359;
    }
    $D356D6608A0B9B449BA135355957D2E8 v33 = self->_has;
  }
  uint64_t v36 = *((void *)v4 + 62);
  if ((*(void *)&v33 & 0x10000000000) != 0)
  {
    if ((v36 & 0x10000000000) == 0) {
      goto LABEL_359;
    }
    if (self->_verifySupportedCommands)
    {
      if (!*((unsigned char *)v4 + 491)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 491))
    {
      goto LABEL_359;
    }
  }
  else if ((v36 & 0x10000000000) != 0)
  {
    goto LABEL_359;
  }
  playbackSessionIdentifier = self->_playbackSessionIdentifier;
  if ((unint64_t)playbackSessionIdentifier | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](playbackSessionIdentifier, "isEqual:")) {
      goto LABEL_359;
    }
    $D356D6608A0B9B449BA135355957D2E8 v33 = self->_has;
  }
  uint64_t v38 = *((void *)v4 + 62);
  if ((*(_WORD *)&v33 & 0x1000) != 0)
  {
    if ((v38 & 0x1000) == 0 || self->_playbackSessionPriority != *((_DWORD *)v4 + 74)) {
      goto LABEL_359;
    }
  }
  else if ((v38 & 0x1000) != 0)
  {
    goto LABEL_359;
  }
  playbackSessionFilePath = self->_playbackSessionFilePath;
  if ((unint64_t)playbackSessionFilePath | *((void *)v4 + 34)
    && !-[NSString isEqual:](playbackSessionFilePath, "isEqual:"))
  {
    goto LABEL_359;
  }
  playbackSessionRevision = self->_playbackSessionRevision;
  if ((unint64_t)playbackSessionRevision | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](playbackSessionRevision, "isEqual:")) {
      goto LABEL_359;
    }
  }
  playbackSessionMetadata = self->_playbackSessionMetadata;
  if ((unint64_t)playbackSessionMetadata | *((void *)v4 + 36))
  {
    if (!-[NSData isEqual:](playbackSessionMetadata, "isEqual:")) {
      goto LABEL_359;
    }
  }
  playbackSessionType = self->_playbackSessionType;
  if ((unint64_t)playbackSessionType | *((void *)v4 + 39))
  {
    if (!-[NSString isEqual:](playbackSessionType, "isEqual:")) {
      goto LABEL_359;
    }
  }
  uint64_t v43 = *((void *)v4 + 62);
  if ((*((unsigned char *)&self->_has + 4) & 0x80) != 0)
  {
    if ((v43 & 0x8000000000) == 0) {
      goto LABEL_359;
    }
    if (self->_trueCompletion)
    {
      if (!*((unsigned char *)v4 + 490)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 490))
    {
      goto LABEL_359;
    }
  }
  else if ((v43 & 0x8000000000) != 0)
  {
    goto LABEL_359;
  }
  playbackAuthorizationToken = self->_playbackAuthorizationToken;
  if ((unint64_t)playbackAuthorizationToken | *((void *)v4 + 29)
    && !-[NSString isEqual:](playbackAuthorizationToken, "isEqual:"))
  {
    goto LABEL_359;
  }
  eventNoticeType = self->_eventNoticeType;
  if ((unint64_t)eventNoticeType | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](eventNoticeType, "isEqual:")) {
      goto LABEL_359;
    }
  }
  eventNoticeIdentifier = self->_eventNoticeIdentifier;
  if ((unint64_t)eventNoticeIdentifier | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](eventNoticeIdentifier, "isEqual:")) {
      goto LABEL_359;
    }
  }
  sharedPlaybackSessionIdentifier = self->_sharedPlaybackSessionIdentifier;
  if ((unint64_t)sharedPlaybackSessionIdentifier | *((void *)v4 + 48))
  {
    if (!-[NSString isEqual:](sharedPlaybackSessionIdentifier, "isEqual:")) {
      goto LABEL_359;
    }
  }
  $D356D6608A0B9B449BA135355957D2E8 v48 = self->_has;
  uint64_t v49 = *((void *)v4 + 62);
  if ((*(unsigned char *)&v48 & 4) != 0)
  {
    if ((v49 & 4) == 0 || self->_commandTimeout != *((double *)v4 + 3)) {
      goto LABEL_359;
    }
  }
  else if ((v49 & 4) != 0)
  {
    goto LABEL_359;
  }
  if ((*(unsigned char *)&v48 & 2) != 0)
  {
    if ((v49 & 2) == 0 || self->_assistantTTSEndTimestamp != *((double *)v4 + 2)) {
      goto LABEL_359;
    }
  }
  else if ((v49 & 2) != 0)
  {
    goto LABEL_359;
  }
  if (*(unsigned char *)&v48)
  {
    if ((v49 & 1) == 0 || self->_assistantCommandSendTimestamp != *((double *)v4 + 1)) {
      goto LABEL_359;
    }
  }
  else if (v49)
  {
    goto LABEL_359;
  }
  originatingDeviceUID = self->_originatingDeviceUID;
  if ((unint64_t)originatingDeviceUID | *((void *)v4 + 28)
    && !-[NSString isEqual:](originatingDeviceUID, "isEqual:"))
  {
    goto LABEL_359;
  }
  destinationDeviceUIDs = self->_destinationDeviceUIDs;
  if ((unint64_t)destinationDeviceUIDs | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](destinationDeviceUIDs, "isEqual:")) {
      goto LABEL_359;
    }
  }
  desiredSessionID = self->_desiredSessionID;
  if ((unint64_t)desiredSessionID | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](desiredSessionID, "isEqual:")) {
      goto LABEL_359;
    }
  }
  $D356D6608A0B9B449BA135355957D2E8 v53 = self->_has;
  uint64_t v54 = *((void *)v4 + 62);
  if ((*(_DWORD *)&v53 & 0x2000000) != 0)
  {
    if ((v54 & 0x2000000) == 0) {
      goto LABEL_359;
    }
    if (self->_alwaysIgnoreDuringCall)
    {
      if (!*((unsigned char *)v4 + 476)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 476))
    {
      goto LABEL_359;
    }
  }
  else if ((v54 & 0x2000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v53 & 0x4000000) != 0)
  {
    if ((v54 & 0x4000000) == 0) {
      goto LABEL_359;
    }
    if (self->_alwaysIgnoreDuringSharePlay)
    {
      if (!*((unsigned char *)v4 + 477)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 477))
    {
      goto LABEL_359;
    }
  }
  else if ((v54 & 0x4000000) != 0)
  {
    goto LABEL_359;
  }
  commandSequenceUUID = self->_commandSequenceUUID;
  if ((unint64_t)commandSequenceUUID | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](commandSequenceUUID, "isEqual:")) {
      goto LABEL_359;
    }
    $D356D6608A0B9B449BA135355957D2E8 v53 = self->_has;
  }
  uint64_t v56 = *((void *)v4 + 62);
  if ((*(_DWORD *)&v53 & 0x80000000) != 0)
  {
    if ((v56 & 0x80000000) == 0) {
      goto LABEL_359;
    }
    if (self->_originatedFromRemoteDevice)
    {
      if (!*((unsigned char *)v4 + 482)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 482))
    {
      goto LABEL_359;
    }
  }
  else if ((v56 & 0x80000000) != 0)
  {
    goto LABEL_359;
  }
  siriTurnIdentifier = self->_siriTurnIdentifier;
  if ((unint64_t)siriTurnIdentifier | *((void *)v4 + 51)
    && !-[NSString isEqual:](siriTurnIdentifier, "isEqual:"))
  {
    goto LABEL_359;
  }
  siriSearchDataSetIdentifier = self->_siriSearchDataSetIdentifier;
  if ((unint64_t)siriSearchDataSetIdentifier | *((void *)v4 + 50))
  {
    if (!-[NSString isEqual:](siriSearchDataSetIdentifier, "isEqual:")) {
      goto LABEL_359;
    }
  }
  $D356D6608A0B9B449BA135355957D2E8 v59 = self->_has;
  uint64_t v60 = *((void *)v4 + 62);
  if ((*(void *)&v59 & 0x100000000) != 0)
  {
    if ((v60 & 0x100000000) == 0) {
      goto LABEL_359;
    }
    if (self->_prepareForSetQueueIsProactive)
    {
      if (!*((unsigned char *)v4 + 483)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 483))
    {
      goto LABEL_359;
    }
  }
  else if ((v60 & 0x100000000) != 0)
  {
    goto LABEL_359;
  }
  prepareForSetQueueProactiveReason = self->_prepareForSetQueueProactiveReason;
  if ((unint64_t)prepareForSetQueueProactiveReason | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](prepareForSetQueueProactiveReason, "isEqual:")) {
      goto LABEL_359;
    }
    $D356D6608A0B9B449BA135355957D2E8 v59 = self->_has;
  }
  uint64_t v62 = *((void *)v4 + 62);
  if ((*(_WORD *)&v59 & 0x2000) != 0)
  {
    if ((v62 & 0x2000) == 0 || self->_prepareForSetQueueProactiveReasonType != *((_DWORD *)v4 + 82)) {
      goto LABEL_359;
    }
  }
  else if ((v62 & 0x2000) != 0)
  {
    goto LABEL_359;
  }
  applicationUserIdentity = self->_applicationUserIdentity;
  if ((unint64_t)applicationUserIdentity | *((void *)v4 + 9)
    && !-[NSData isEqual:](applicationUserIdentity, "isEqual:"))
  {
    goto LABEL_359;
  }
  systemAppPlaybackQueue = self->_systemAppPlaybackQueue;
  if ((unint64_t)systemAppPlaybackQueue | *((void *)v4 + 55))
  {
    if (!-[_MRSystemPlaybackQueueProtobuf isEqual:](systemAppPlaybackQueue, "isEqual:")) {
      goto LABEL_359;
    }
  }
  $D356D6608A0B9B449BA135355957D2E8 v65 = self->_has;
  uint64_t v66 = *((void *)v4 + 62);
  if ((*(void *)&v65 & 0x20000000000) != 0)
  {
    if ((v66 & 0x20000000000) == 0) {
      goto LABEL_359;
    }
    if (self->_vocalsControlActive)
    {
      if (!*((unsigned char *)v4 + 492)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 492))
    {
      goto LABEL_359;
    }
  }
  else if ((v66 & 0x20000000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v65 & 0x400000) != 0)
  {
    if ((v66 & 0x400000) == 0 || self->_vocalsControlLevel != *((float *)v4 + 116)) {
      goto LABEL_359;
    }
  }
  else if ((v66 & 0x400000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v65 & 0x1000000) != 0)
  {
    if ((v66 & 0x1000000) == 0 || self->_vocalsControlMinLevel != *((float *)v4 + 118)) {
      goto LABEL_359;
    }
  }
  else if ((v66 & 0x1000000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v65 & 0x800000) != 0)
  {
    if ((v66 & 0x800000) == 0 || self->_vocalsControlMaxLevel != *((float *)v4 + 117)) {
      goto LABEL_359;
    }
  }
  else if ((v66 & 0x800000) != 0)
  {
    goto LABEL_359;
  }
  if ((*(void *)&v65 & 0x40000000000) != 0)
  {
    if ((v66 & 0x40000000000) == 0) {
      goto LABEL_359;
    }
    if (self->_vocalsControlContinuous)
    {
      if (!*((unsigned char *)v4 + 493)) {
        goto LABEL_359;
      }
    }
    else if (*((unsigned char *)v4 + 493))
    {
      goto LABEL_359;
    }
  }
  else if ((v66 & 0x40000000000) != 0)
  {
    goto LABEL_359;
  }
  associatedParticipantIdentifier = self->_associatedParticipantIdentifier;
  if ((unint64_t)associatedParticipantIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](associatedParticipantIdentifier, "isEqual:")) {
      goto LABEL_359;
    }
    $D356D6608A0B9B449BA135355957D2E8 v65 = self->_has;
  }
  uint64_t v68 = *((void *)v4 + 62);
  if ((*(unsigned char *)&v65 & 0x40) != 0)
  {
    if ((v68 & 0x40) == 0 || self->_sleepTimerTime != *((double *)v4 + 7)) {
      goto LABEL_359;
    }
  }
  else if ((v68 & 0x40) != 0)
  {
    goto LABEL_359;
  }
  if ((*(_DWORD *)&v65 & 0x200000) == 0)
  {
    if ((v68 & 0x200000) == 0) {
      goto LABEL_350;
    }
LABEL_359:
    BOOL v71 = 0;
    goto LABEL_360;
  }
  if ((v68 & 0x200000) == 0 || self->_sleepTimerStopMode != *((_DWORD *)v4 + 105)) {
    goto LABEL_359;
  }
LABEL_350:
  dialogOptions = self->_dialogOptions;
  if ((unint64_t)dialogOptions | *((void *)v4 + 19)
    && !-[_MRDictionaryProtobuf isEqual:](dialogOptions, "isEqual:"))
  {
    goto LABEL_359;
  }
  clientPreferredLanguages = self->_clientPreferredLanguages;
  if ((unint64_t)clientPreferredLanguages | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](clientPreferredLanguages, "isEqual:")) {
      goto LABEL_359;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((void *)v4 + 62) & 0x20) == 0 || self->_referencePosition != *((double *)v4 + 6)) {
      goto LABEL_359;
    }
    BOOL v71 = 1;
  }
  else
  {
    BOOL v71 = (*((void *)v4 + 62) & 0x20) == 0;
  }
LABEL_360:

  return v71;
}

- (unint64_t)hash
{
  NSUInteger v151 = [(NSString *)self->_sourceID hash];
  NSUInteger v150 = [(NSString *)self->_mediaType hash];
  $D356D6608A0B9B449BA135355957D2E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    uint64_t v149 = 2654435761 * self->_externalPlayerCommand;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v149 = 0;
  if ((*(_DWORD *)&has & 0x100000) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float skipInterval = self->_skipInterval;
  float v5 = -skipInterval;
  if (skipInterval >= 0.0) {
    float v5 = self->_skipInterval;
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
LABEL_11:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    float playbackRate = self->_playbackRate;
    float v11 = -playbackRate;
    if (playbackRate >= 0.0) {
      float v11 = self->_playbackRate;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    float rating = self->_rating;
    float v16 = -rating;
    if (rating >= 0.0) {
      float v16 = self->_rating;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    uint64_t v147 = 2654435761 * self->_negative;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_29;
    }
LABEL_34:
    unint64_t v23 = 0;
    goto LABEL_37;
  }
  uint64_t v147 = 0;
  if ((*(unsigned char *)&has & 8) == 0) {
    goto LABEL_34;
  }
LABEL_29:
  double playbackPosition = self->_playbackPosition;
  double v20 = -playbackPosition;
  if (playbackPosition >= 0.0) {
    double v20 = self->_playbackPosition;
  }
  long double v21 = floor(v20 + 0.5);
  double v22 = (v20 - v21) * 1.84467441e19;
  unint64_t v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
  if (v22 >= 0.0)
  {
    if (v22 > 0.0) {
      v23 += (unint64_t)v22;
    }
  }
  else
  {
    v23 -= (unint64_t)fabs(v22);
  }
LABEL_37:
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    uint64_t v145 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_39;
    }
LABEL_42:
    uint64_t v144 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_40;
    }
    goto LABEL_43;
  }
  uint64_t v145 = 2654435761 * self->_repeatMode;
  if ((*(_DWORD *)&has & 0x80000) == 0) {
    goto LABEL_42;
  }
LABEL_39:
  uint64_t v144 = 2654435761 * self->_shuffleMode;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_40:
    unint64_t v143 = 2654435761u * self->_trackID;
    goto LABEL_44;
  }
LABEL_43:
  unint64_t v143 = 0;
LABEL_44:
  unint64_t v146 = v23;
  if ((*(unsigned char *)&has & 0x10) != 0) {
    uint64_t v142 = 2654435761 * self->_radioStationID;
  }
  else {
    uint64_t v142 = 0;
  }
  NSUInteger v141 = [(NSString *)self->_radioStationHash hash];
  uint64_t v140 = [(NSData *)self->_systemAppPlaybackQueueData hash];
  NSUInteger v139 = [(NSString *)self->_destinationAppDisplayID hash];
  $D356D6608A0B9B449BA135355957D2E8 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
    uint64_t v138 = 2654435761 * self->_sendOptions;
    if ((*(void *)&v24 & 0x1000000000) != 0) {
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v138 = 0;
    if ((*(void *)&v24 & 0x1000000000) != 0)
    {
LABEL_49:
      uint64_t v137 = 2654435761 * self->_requestDefermentToPlaybackQueuePosition;
      goto LABEL_52;
    }
  }
  uint64_t v137 = 0;
LABEL_52:
  NSUInteger v136 = [(NSString *)self->_contextID hash];
  if ((*((unsigned char *)&self->_has + 4) & 0x40) != 0) {
    uint64_t v135 = 2654435761 * self->_shouldOverrideManuallyCuratedQueue;
  }
  else {
    uint64_t v135 = 0;
  }
  NSUInteger v134 = [(NSString *)self->_stationURL hash];
  $D356D6608A0B9B449BA135355957D2E8 v25 = self->_has;
  if ((*(void *)&v25 & 0x2000000000) != 0)
  {
    uint64_t v133 = 2654435761 * self->_shouldBeginRadioPlayback;
    if ((*(_WORD *)&v25 & 0x200) != 0) {
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v133 = 0;
    if ((*(_WORD *)&v25 & 0x200) != 0)
    {
LABEL_57:
      uint64_t v132 = 2654435761 * self->_playbackQueueInsertionPosition;
      goto LABEL_60;
    }
  }
  uint64_t v132 = 0;
LABEL_60:
  NSUInteger v131 = [(NSString *)self->_contentItemID hash];
  $D356D6608A0B9B449BA135355957D2E8 v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x400) != 0)
  {
    uint64_t v130 = 2654435761 * self->_playbackQueueOffset;
    if ((*(_WORD *)&v26 & 0x100) != 0) {
      goto LABEL_62;
    }
  }
  else
  {
    uint64_t v130 = 0;
    if ((*(_WORD *)&v26 & 0x100) != 0)
    {
LABEL_62:
      uint64_t v129 = 2654435761 * self->_playbackQueueDestinationOffset;
      goto LABEL_65;
    }
  }
  uint64_t v129 = 0;
LABEL_65:
  uint64_t v128 = [(NSData *)self->_languageOption hash];
  uint64_t v127 = [(NSData *)self->_playbackQueueContext hash];
  NSUInteger v126 = [(NSString *)self->_insertAfterContentItemID hash];
  NSUInteger v125 = [(NSString *)self->_nowPlayingContentItemID hash];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    uint64_t v124 = 2654435761 * self->_replaceIntent;
  }
  else {
    uint64_t v124 = 0;
  }
  NSUInteger v123 = [(NSString *)self->_commandID hash];
  NSUInteger v122 = [(NSString *)self->_senderID hash];
  NSUInteger v121 = [(NSString *)self->_remoteControlInterface hash];
  $D356D6608A0B9B449BA135355957D2E8 v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x8000000) != 0)
  {
    uint64_t v120 = 2654435761 * self->_beginSeek;
    if ((*(_DWORD *)&v27 & 0x10000000) != 0) {
      goto LABEL_70;
    }
  }
  else
  {
    uint64_t v120 = 0;
    if ((*(_DWORD *)&v27 & 0x10000000) != 0)
    {
LABEL_70:
      uint64_t v119 = 2654435761 * self->_endSeek;
      goto LABEL_73;
    }
  }
  uint64_t v119 = 0;
LABEL_73:
  uint64_t v118 = [(NSData *)self->_playbackSession hash];
  uint64_t v117 = [(NSData *)self->_userIdentityData hash];
  NSUInteger v116 = [(NSString *)self->_insertBeforeContentItemID hash];
  $D356D6608A0B9B449BA135355957D2E8 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x4000) != 0)
  {
    uint64_t v115 = 2654435761 * self->_queueEndAction;
    if ((*(void *)&v28 & 0x400000000) != 0)
    {
LABEL_75:
      uint64_t v114 = 2654435761 * self->_preservesRepeatMode;
      if ((*(void *)&v28 & 0x800000000) != 0) {
        goto LABEL_76;
      }
LABEL_80:
      uint64_t v113 = 0;
      if ((*(void *)&v28 & 0x200000000) != 0) {
        goto LABEL_77;
      }
      goto LABEL_81;
    }
  }
  else
  {
    uint64_t v115 = 0;
    if ((*(void *)&v28 & 0x400000000) != 0) {
      goto LABEL_75;
    }
  }
  uint64_t v114 = 0;
  if ((*(void *)&v28 & 0x800000000) == 0) {
    goto LABEL_80;
  }
LABEL_76:
  uint64_t v113 = 2654435761 * self->_preservesShuffleMode;
  if ((*(void *)&v28 & 0x200000000) != 0)
  {
LABEL_77:
    uint64_t v112 = 2654435761 * self->_preservesQueueEndAction;
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v112 = 0;
LABEL_82:
  NSUInteger v111 = [(NSString *)self->_homeKitUserIdentifier hash];
  if (*((unsigned char *)&self->_has + 5)) {
    uint64_t v110 = 2654435761 * self->_verifySupportedCommands;
  }
  else {
    uint64_t v110 = 0;
  }
  NSUInteger v109 = [(NSString *)self->_playbackSessionIdentifier hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    uint64_t v108 = 2654435761 * self->_playbackSessionPriority;
  }
  else {
    uint64_t v108 = 0;
  }
  NSUInteger v107 = [(NSString *)self->_playbackSessionFilePath hash];
  NSUInteger v106 = [(NSString *)self->_playbackSessionRevision hash];
  uint64_t v105 = [(NSData *)self->_playbackSessionMetadata hash];
  NSUInteger v104 = [(NSString *)self->_playbackSessionType hash];
  if ((*((unsigned char *)&self->_has + 4) & 0x80) != 0) {
    uint64_t v103 = 2654435761 * self->_trueCompletion;
  }
  else {
    uint64_t v103 = 0;
  }
  NSUInteger v102 = [(NSString *)self->_playbackAuthorizationToken hash];
  NSUInteger v101 = [(NSString *)self->_eventNoticeType hash];
  NSUInteger v100 = [(NSString *)self->_eventNoticeIdentifier hash];
  NSUInteger v99 = [(NSString *)self->_sharedPlaybackSessionIdentifier hash];
  $D356D6608A0B9B449BA135355957D2E8 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 4) != 0)
  {
    double commandTimeout = self->_commandTimeout;
    double v32 = -commandTimeout;
    if (commandTimeout >= 0.0) {
      double v32 = self->_commandTimeout;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  if ((*(unsigned char *)&v29 & 2) != 0)
  {
    double assistantTTSEndTimestamp = self->_assistantTTSEndTimestamp;
    double v37 = -assistantTTSEndTimestamp;
    if (assistantTTSEndTimestamp >= 0.0) {
      double v37 = self->_assistantTTSEndTimestamp;
    }
    long double v38 = floor(v37 + 0.5);
    double v39 = (v37 - v38) * 1.84467441e19;
    unint64_t v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v35 += (unint64_t)v39;
      }
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  unint64_t v97 = v35;
  if (*(unsigned char *)&v29)
  {
    double assistantCommandSendTimestamp = self->_assistantCommandSendTimestamp;
    double v42 = -assistantCommandSendTimestamp;
    if (assistantCommandSendTimestamp >= 0.0) {
      double v42 = self->_assistantCommandSendTimestamp;
    }
    long double v43 = floor(v42 + 0.5);
    double v44 = (v42 - v43) * 1.84467441e19;
    unint64_t v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0) {
        v40 += (unint64_t)v44;
      }
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    unint64_t v40 = 0;
  }
  unint64_t v96 = v40;
  NSUInteger v95 = [(NSString *)self->_originatingDeviceUID hash];
  uint64_t v94 = [(NSData *)self->_destinationDeviceUIDs hash];
  NSUInteger v93 = [(NSString *)self->_desiredSessionID hash];
  $D356D6608A0B9B449BA135355957D2E8 v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x2000000) != 0)
  {
    uint64_t v92 = 2654435761 * self->_alwaysIgnoreDuringCall;
    if ((*(_DWORD *)&v45 & 0x4000000) != 0) {
      goto LABEL_117;
    }
  }
  else
  {
    uint64_t v92 = 0;
    if ((*(_DWORD *)&v45 & 0x4000000) != 0)
    {
LABEL_117:
      uint64_t v91 = 2654435761 * self->_alwaysIgnoreDuringSharePlay;
      goto LABEL_120;
    }
  }
  uint64_t v91 = 0;
LABEL_120:
  NSUInteger v90 = [(NSString *)self->_commandSequenceUUID hash];
  if ((*((unsigned char *)&self->_has + 3) & 0x80) != 0) {
    uint64_t v89 = 2654435761 * self->_originatedFromRemoteDevice;
  }
  else {
    uint64_t v89 = 0;
  }
  NSUInteger v88 = [(NSString *)self->_siriTurnIdentifier hash];
  NSUInteger v87 = [(NSString *)self->_siriSearchDataSetIdentifier hash];
  if (*((unsigned char *)&self->_has + 4)) {
    uint64_t v86 = 2654435761 * self->_prepareForSetQueueIsProactive;
  }
  else {
    uint64_t v86 = 0;
  }
  NSUInteger v85 = [(NSString *)self->_prepareForSetQueueProactiveReason hash];
  unint64_t v148 = v8;
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v84 = 2654435761 * self->_prepareForSetQueueProactiveReasonType;
  }
  else {
    uint64_t v84 = 0;
  }
  uint64_t v83 = [(NSData *)self->_applicationUserIdentity hash];
  unint64_t v82 = [(_MRSystemPlaybackQueueProtobuf *)self->_systemAppPlaybackQueue hash];
  $D356D6608A0B9B449BA135355957D2E8 v46 = self->_has;
  if ((*(void *)&v46 & 0x20000000000) != 0)
  {
    uint64_t v81 = 2654435761 * self->_vocalsControlActive;
    if ((*(_DWORD *)&v46 & 0x400000) != 0) {
      goto LABEL_131;
    }
LABEL_136:
    unint64_t v51 = 0;
    goto LABEL_139;
  }
  uint64_t v81 = 0;
  if ((*(_DWORD *)&v46 & 0x400000) == 0) {
    goto LABEL_136;
  }
LABEL_131:
  float vocalsControlLevel = self->_vocalsControlLevel;
  float v48 = -vocalsControlLevel;
  if (vocalsControlLevel >= 0.0) {
    float v48 = self->_vocalsControlLevel;
  }
  float v49 = floorf(v48 + 0.5);
  float v50 = (float)(v48 - v49) * 1.8447e19;
  unint64_t v51 = 2654435761u * (unint64_t)fmodf(v49, 1.8447e19);
  if (v50 >= 0.0)
  {
    if (v50 > 0.0) {
      v51 += (unint64_t)v50;
    }
  }
  else
  {
    v51 -= (unint64_t)fabsf(v50);
  }
LABEL_139:
  if ((*(_DWORD *)&v46 & 0x1000000) != 0)
  {
    float vocalsControlMinLevel = self->_vocalsControlMinLevel;
    float v54 = -vocalsControlMinLevel;
    if (vocalsControlMinLevel >= 0.0) {
      float v54 = self->_vocalsControlMinLevel;
    }
    float v55 = floorf(v54 + 0.5);
    float v56 = (float)(v54 - v55) * 1.8447e19;
    unint64_t v52 = 2654435761u * (unint64_t)fmodf(v55, 1.8447e19);
    if (v56 >= 0.0)
    {
      if (v56 > 0.0) {
        v52 += (unint64_t)v56;
      }
    }
    else
    {
      v52 -= (unint64_t)fabsf(v56);
    }
  }
  else
  {
    unint64_t v52 = 0;
  }
  if ((*(_DWORD *)&v46 & 0x800000) != 0)
  {
    float vocalsControlMaxLevel = self->_vocalsControlMaxLevel;
    float v59 = -vocalsControlMaxLevel;
    if (vocalsControlMaxLevel >= 0.0) {
      float v59 = self->_vocalsControlMaxLevel;
    }
    float v60 = floorf(v59 + 0.5);
    float v61 = (float)(v59 - v60) * 1.8447e19;
    unint64_t v57 = 2654435761u * (unint64_t)fmodf(v60, 1.8447e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0) {
        v57 += (unint64_t)v61;
      }
    }
    else
    {
      v57 -= (unint64_t)fabsf(v61);
    }
  }
  else
  {
    unint64_t v57 = 0;
  }
  unint64_t v80 = v57;
  if ((*(void *)&v46 & 0x40000000000) != 0) {
    uint64_t v79 = 2654435761 * self->_vocalsControlContinuous;
  }
  else {
    uint64_t v79 = 0;
  }
  unint64_t v98 = v30;
  NSUInteger v77 = [(NSString *)self->_associatedParticipantIdentifier hash];
  $D356D6608A0B9B449BA135355957D2E8 v62 = self->_has;
  if ((*(unsigned char *)&v62 & 0x40) != 0)
  {
    double sleepTimerTime = self->_sleepTimerTime;
    double v65 = -sleepTimerTime;
    if (sleepTimerTime >= 0.0) {
      double v65 = self->_sleepTimerTime;
    }
    long double v66 = floor(v65 + 0.5);
    double v67 = (v65 - v66) * 1.84467441e19;
    unint64_t v63 = 2654435761u * (unint64_t)fmod(v66, 1.84467441e19);
    if (v67 >= 0.0)
    {
      if (v67 > 0.0) {
        v63 += (unint64_t)v67;
      }
    }
    else
    {
      v63 -= (unint64_t)fabs(v67);
    }
  }
  else
  {
    unint64_t v63 = 0;
  }
  if ((*(_DWORD *)&v62 & 0x200000) != 0) {
    uint64_t v68 = 2654435761 * self->_sleepTimerStopMode;
  }
  else {
    uint64_t v68 = 0;
  }
  unint64_t v69 = [(_MRDictionaryProtobuf *)self->_dialogOptions hash];
  NSUInteger v70 = [(NSString *)self->_clientPreferredLanguages hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    double referencePosition = self->_referencePosition;
    double v73 = -referencePosition;
    if (referencePosition >= 0.0) {
      double v73 = self->_referencePosition;
    }
    long double v74 = floor(v73 + 0.5);
    double v75 = (v73 - v74) * 1.84467441e19;
    unint64_t v71 = 2654435761u * (unint64_t)fmod(v74, 1.84467441e19);
    if (v75 >= 0.0)
    {
      if (v75 > 0.0) {
        v71 += (unint64_t)v75;
      }
    }
    else
    {
      v71 -= (unint64_t)fabs(v75);
    }
  }
  else
  {
    unint64_t v71 = 0;
  }
  return v150 ^ v151 ^ v149 ^ v148 ^ v9 ^ v14 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v51 ^ v52 ^ v80 ^ v79 ^ v78 ^ v63 ^ v68 ^ v69 ^ v70 ^ v71;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v19 = v4;
  if (*((void *)v4 + 53))
  {
    -[_MRCommandOptionsProtobuf setSourceID:](self, "setSourceID:");
    id v4 = v19;
  }
  if (*((void *)v4 + 26))
  {
    -[_MRCommandOptionsProtobuf setMediaType:](self, "setMediaType:");
    id v4 = v19;
  }
  uint64_t v5 = *((void *)v4 + 62);
  if ((v5 & 0x20000000) != 0)
  {
    self->_externalPlayerCommand = *((unsigned char *)v4 + 480);
    *(void *)&self->_has |= 0x20000000uLL;
    uint64_t v5 = *((void *)v4 + 62);
    if ((v5 & 0x100000) == 0)
    {
LABEL_7:
      if ((v5 & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_134;
    }
  }
  else if ((v5 & 0x100000) == 0)
  {
    goto LABEL_7;
  }
  self->_float skipInterval = *((float *)v4 + 104);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v5 = *((void *)v4 + 62);
  if ((v5 & 0x800) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_float playbackRate = *((float *)v4 + 65);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v5 = *((void *)v4 + 62);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_float rating = *((float *)v4 + 86);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *((void *)v4 + 62);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_negative = *((unsigned char *)v4 + 481);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *((void *)v4 + 62);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_138;
  }
LABEL_137:
  self->_double playbackPosition = *((double *)v4 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v5 = *((void *)v4 + 62);
  if ((v5 & 0x10000) == 0)
  {
LABEL_12:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_139;
  }
LABEL_138:
  self->_uint64_t repeatMode = *((_DWORD *)v4 + 90);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *((void *)v4 + 62);
  if ((v5 & 0x80000) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_140;
  }
LABEL_139:
  self->_uint64_t shuffleMode = *((_DWORD *)v4 + 98);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v5 = *((void *)v4 + 62);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_140:
  self->_trackID = *((void *)v4 + 8);
  *(void *)&self->_has |= 0x80uLL;
  if ((*((void *)v4 + 62) & 0x10) != 0)
  {
LABEL_15:
    self->_radioStationID = *((void *)v4 + 5);
    *(void *)&self->_has |= 0x10uLL;
  }
LABEL_16:
  if (*((void *)v4 + 42))
  {
    -[_MRCommandOptionsProtobuf setRadioStationHash:](self, "setRadioStationHash:");
    id v4 = v19;
  }
  if (*((void *)v4 + 56))
  {
    -[_MRCommandOptionsProtobuf setSystemAppPlaybackQueueData:](self, "setSystemAppPlaybackQueueData:");
    id v4 = v19;
  }
  if (*((void *)v4 + 17))
  {
    -[_MRCommandOptionsProtobuf setDestinationAppDisplayID:](self, "setDestinationAppDisplayID:");
    id v4 = v19;
  }
  uint64_t v6 = *((void *)v4 + 62);
  if ((v6 & 0x40000) != 0)
  {
    self->_int sendOptions = *((_DWORD *)v4 + 92);
    *(void *)&self->_has |= 0x40000uLL;
    uint64_t v6 = *((void *)v4 + 62);
  }
  if ((v6 & 0x1000000000) != 0)
  {
    self->_requestDefermentToPlaybackQueuePosition = *((unsigned char *)v4 + 487);
    *(void *)&self->_has |= 0x1000000000uLL;
  }
  if (*((void *)v4 + 15))
  {
    -[_MRCommandOptionsProtobuf setContextID:](self, "setContextID:");
    id v4 = v19;
  }
  if ((*((unsigned char *)v4 + 500) & 0x40) != 0)
  {
    self->_shouldOverrideManuallyCuratedQueue = *((unsigned char *)v4 + 489);
    *(void *)&self->_has |= 0x4000000000uLL;
  }
  if (*((void *)v4 + 54))
  {
    -[_MRCommandOptionsProtobuf setStationURL:](self, "setStationURL:");
    id v4 = v19;
  }
  uint64_t v7 = *((void *)v4 + 62);
  if ((v7 & 0x2000000000) != 0)
  {
    self->_shouldBeginRadioPlayback = *((unsigned char *)v4 + 488);
    *(void *)&self->_has |= 0x2000000000uLL;
    uint64_t v7 = *((void *)v4 + 62);
  }
  if ((v7 & 0x200) != 0)
  {
    self->_playbackQueueInsertionPosition = *((_DWORD *)v4 + 63);
    *(void *)&self->_has |= 0x200uLL;
  }
  if (*((void *)v4 + 14))
  {
    -[_MRCommandOptionsProtobuf setContentItemID:](self, "setContentItemID:");
    id v4 = v19;
  }
  uint64_t v8 = *((void *)v4 + 62);
  if ((v8 & 0x400) != 0)
  {
    self->_playbackQueueOffset = *((_DWORD *)v4 + 64);
    *(void *)&self->_has |= 0x400uLL;
    uint64_t v8 = *((void *)v4 + 62);
  }
  if ((v8 & 0x100) != 0)
  {
    self->_playbackQueueDestinationOffset = *((_DWORD *)v4 + 62);
    *(void *)&self->_has |= 0x100uLL;
  }
  if (*((void *)v4 + 25))
  {
    -[_MRCommandOptionsProtobuf setLanguageOption:](self, "setLanguageOption:");
    id v4 = v19;
  }
  if (*((void *)v4 + 30))
  {
    -[_MRCommandOptionsProtobuf setPlaybackQueueContext:](self, "setPlaybackQueueContext:");
    id v4 = v19;
  }
  if (*((void *)v4 + 23))
  {
    -[_MRCommandOptionsProtobuf setInsertAfterContentItemID:](self, "setInsertAfterContentItemID:");
    id v4 = v19;
  }
  if (*((void *)v4 + 27))
  {
    -[_MRCommandOptionsProtobuf setNowPlayingContentItemID:](self, "setNowPlayingContentItemID:");
    id v4 = v19;
  }
  if ((*((unsigned char *)v4 + 498) & 2) != 0)
  {
    self->_uint64_t replaceIntent = *((_DWORD *)v4 + 91);
    *(void *)&self->_has |= 0x20000uLL;
  }
  if (*((void *)v4 + 12))
  {
    -[_MRCommandOptionsProtobuf setCommandID:](self, "setCommandID:");
    id v4 = v19;
  }
  if (*((void *)v4 + 47))
  {
    -[_MRCommandOptionsProtobuf setSenderID:](self, "setSenderID:");
    id v4 = v19;
  }
  if (*((void *)v4 + 44))
  {
    -[_MRCommandOptionsProtobuf setRemoteControlInterface:](self, "setRemoteControlInterface:");
    id v4 = v19;
  }
  uint64_t v9 = *((void *)v4 + 62);
  if ((v9 & 0x8000000) != 0)
  {
    self->_beginSeek = *((unsigned char *)v4 + 478);
    *(void *)&self->_has |= 0x8000000uLL;
    uint64_t v9 = *((void *)v4 + 62);
  }
  if ((v9 & 0x10000000) != 0)
  {
    self->_endSeek = *((unsigned char *)v4 + 479);
    *(void *)&self->_has |= 0x10000000uLL;
  }
  if (*((void *)v4 + 33))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSession:](self, "setPlaybackSession:");
    id v4 = v19;
  }
  if (*((void *)v4 + 57))
  {
    -[_MRCommandOptionsProtobuf setUserIdentityData:](self, "setUserIdentityData:");
    id v4 = v19;
  }
  if (*((void *)v4 + 24))
  {
    -[_MRCommandOptionsProtobuf setInsertBeforeContentItemID:](self, "setInsertBeforeContentItemID:");
    id v4 = v19;
  }
  uint64_t v10 = *((void *)v4 + 62);
  if ((v10 & 0x4000) != 0)
  {
    self->_uint64_t queueEndAction = *((_DWORD *)v4 + 83);
    *(void *)&self->_has |= 0x4000uLL;
    uint64_t v10 = *((void *)v4 + 62);
    if ((v10 & 0x400000000) == 0)
    {
LABEL_70:
      if ((v10 & 0x800000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_144;
    }
  }
  else if ((v10 & 0x400000000) == 0)
  {
    goto LABEL_70;
  }
  self->_preservesRepeatMode = *((unsigned char *)v4 + 485);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v10 = *((void *)v4 + 62);
  if ((v10 & 0x800000000) == 0)
  {
LABEL_71:
    if ((v10 & 0x200000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
LABEL_144:
  self->_preservesShuffleMode = *((unsigned char *)v4 + 486);
  *(void *)&self->_has |= 0x800000000uLL;
  if ((*((void *)v4 + 62) & 0x200000000) != 0)
  {
LABEL_72:
    self->_preservesQueueEndAction = *((unsigned char *)v4 + 484);
    *(void *)&self->_has |= 0x200000000uLL;
  }
LABEL_73:
  if (*((void *)v4 + 22))
  {
    -[_MRCommandOptionsProtobuf setHomeKitUserIdentifier:](self, "setHomeKitUserIdentifier:");
    id v4 = v19;
  }
  if (*((unsigned char *)v4 + 501))
  {
    self->_verifySupportedCommands = *((unsigned char *)v4 + 491);
    *(void *)&self->_has |= 0x10000000000uLL;
  }
  if (*((void *)v4 + 35))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionIdentifier:](self, "setPlaybackSessionIdentifier:");
    id v4 = v19;
  }
  if ((*((unsigned char *)v4 + 497) & 0x10) != 0)
  {
    self->_int playbackSessionPriority = *((_DWORD *)v4 + 74);
    *(void *)&self->_has |= 0x1000uLL;
  }
  if (*((void *)v4 + 34))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionFilePath:](self, "setPlaybackSessionFilePath:");
    id v4 = v19;
  }
  if (*((void *)v4 + 38))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionRevision:](self, "setPlaybackSessionRevision:");
    id v4 = v19;
  }
  if (*((void *)v4 + 36))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionMetadata:](self, "setPlaybackSessionMetadata:");
    id v4 = v19;
  }
  if (*((void *)v4 + 39))
  {
    -[_MRCommandOptionsProtobuf setPlaybackSessionType:](self, "setPlaybackSessionType:");
    id v4 = v19;
  }
  if ((*((unsigned char *)v4 + 500) & 0x80) != 0)
  {
    self->_trueCompletion = *((unsigned char *)v4 + 490);
    *(void *)&self->_has |= 0x8000000000uLL;
  }
  if (*((void *)v4 + 29))
  {
    -[_MRCommandOptionsProtobuf setPlaybackAuthorizationToken:](self, "setPlaybackAuthorizationToken:");
    id v4 = v19;
  }
  if (*((void *)v4 + 21))
  {
    -[_MRCommandOptionsProtobuf setEventNoticeType:](self, "setEventNoticeType:");
    id v4 = v19;
  }
  if (*((void *)v4 + 20))
  {
    -[_MRCommandOptionsProtobuf setEventNoticeIdentifier:](self, "setEventNoticeIdentifier:");
    id v4 = v19;
  }
  if (*((void *)v4 + 48))
  {
    -[_MRCommandOptionsProtobuf setSharedPlaybackSessionIdentifier:](self, "setSharedPlaybackSessionIdentifier:");
    id v4 = v19;
  }
  uint64_t v11 = *((void *)v4 + 62);
  if ((v11 & 4) != 0)
  {
    self->_double commandTimeout = *((double *)v4 + 3);
    *(void *)&self->_has |= 4uLL;
    uint64_t v11 = *((void *)v4 + 62);
    if ((v11 & 2) == 0)
    {
LABEL_101:
      if ((v11 & 1) == 0) {
        goto LABEL_103;
      }
      goto LABEL_102;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_101;
  }
  self->_double assistantTTSEndTimestamp = *((double *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  if (*((void *)v4 + 62))
  {
LABEL_102:
    self->_double assistantCommandSendTimestamp = *((double *)v4 + 1);
    *(void *)&self->_has |= 1uLL;
  }
LABEL_103:
  if (*((void *)v4 + 28))
  {
    -[_MRCommandOptionsProtobuf setOriginatingDeviceUID:](self, "setOriginatingDeviceUID:");
    id v4 = v19;
  }
  if (*((void *)v4 + 18))
  {
    -[_MRCommandOptionsProtobuf setDestinationDeviceUIDs:](self, "setDestinationDeviceUIDs:");
    id v4 = v19;
  }
  if (*((void *)v4 + 16))
  {
    -[_MRCommandOptionsProtobuf setDesiredSessionID:](self, "setDesiredSessionID:");
    id v4 = v19;
  }
  uint64_t v12 = *((void *)v4 + 62);
  if ((v12 & 0x2000000) != 0)
  {
    self->_alwaysIgnoreDuringCall = *((unsigned char *)v4 + 476);
    *(void *)&self->_has |= 0x2000000uLL;
    uint64_t v12 = *((void *)v4 + 62);
  }
  if ((v12 & 0x4000000) != 0)
  {
    self->_alwaysIgnoreDuringSharePlay = *((unsigned char *)v4 + 477);
    *(void *)&self->_has |= 0x4000000uLL;
  }
  if (*((void *)v4 + 13))
  {
    -[_MRCommandOptionsProtobuf setCommandSequenceUUID:](self, "setCommandSequenceUUID:");
    id v4 = v19;
  }
  if ((*((unsigned char *)v4 + 499) & 0x80) != 0)
  {
    self->_originatedFromRemoteDevice = *((unsigned char *)v4 + 482);
    *(void *)&self->_has |= 0x80000000uLL;
  }
  if (*((void *)v4 + 51))
  {
    -[_MRCommandOptionsProtobuf setSiriTurnIdentifier:](self, "setSiriTurnIdentifier:");
    id v4 = v19;
  }
  if (*((void *)v4 + 50))
  {
    -[_MRCommandOptionsProtobuf setSiriSearchDataSetIdentifier:](self, "setSiriSearchDataSetIdentifier:");
    id v4 = v19;
  }
  if (*((unsigned char *)v4 + 500))
  {
    self->_prepareForSetQueueIsProactive = *((unsigned char *)v4 + 483);
    *(void *)&self->_has |= 0x100000000uLL;
  }
  if (*((void *)v4 + 40))
  {
    -[_MRCommandOptionsProtobuf setPrepareForSetQueueProactiveReason:](self, "setPrepareForSetQueueProactiveReason:");
    id v4 = v19;
  }
  if ((*((unsigned char *)v4 + 497) & 0x20) != 0)
  {
    self->_uint64_t prepareForSetQueueProactiveReasonType = *((_DWORD *)v4 + 82);
    *(void *)&self->_has |= 0x2000uLL;
  }
  if (*((void *)v4 + 9))
  {
    -[_MRCommandOptionsProtobuf setApplicationUserIdentity:](self, "setApplicationUserIdentity:");
    id v4 = v19;
  }
  systemAppPlaybackQueue = self->_systemAppPlaybackQueue;
  uint64_t v14 = *((void *)v4 + 55);
  if (systemAppPlaybackQueue)
  {
    if (!v14) {
      goto LABEL_152;
    }
    -[_MRSystemPlaybackQueueProtobuf mergeFrom:](systemAppPlaybackQueue, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_152;
    }
    -[_MRCommandOptionsProtobuf setSystemAppPlaybackQueue:](self, "setSystemAppPlaybackQueue:");
  }
  id v4 = v19;
LABEL_152:
  uint64_t v15 = *((void *)v4 + 62);
  if ((v15 & 0x20000000000) != 0)
  {
    self->_vocalsControlActive = *((unsigned char *)v4 + 492);
    *(void *)&self->_has |= 0x20000000000uLL;
    uint64_t v15 = *((void *)v4 + 62);
    if ((v15 & 0x400000) == 0)
    {
LABEL_154:
      if ((v15 & 0x1000000) == 0) {
        goto LABEL_155;
      }
      goto LABEL_169;
    }
  }
  else if ((v15 & 0x400000) == 0)
  {
    goto LABEL_154;
  }
  self->_float vocalsControlLevel = *((float *)v4 + 116);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v15 = *((void *)v4 + 62);
  if ((v15 & 0x1000000) == 0)
  {
LABEL_155:
    if ((v15 & 0x800000) == 0) {
      goto LABEL_156;
    }
    goto LABEL_170;
  }
LABEL_169:
  self->_float vocalsControlMinLevel = *((float *)v4 + 118);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v15 = *((void *)v4 + 62);
  if ((v15 & 0x800000) == 0)
  {
LABEL_156:
    if ((v15 & 0x40000000000) == 0) {
      goto LABEL_158;
    }
    goto LABEL_157;
  }
LABEL_170:
  self->_float vocalsControlMaxLevel = *((float *)v4 + 117);
  *(void *)&self->_has |= 0x800000uLL;
  if ((*((void *)v4 + 62) & 0x40000000000) != 0)
  {
LABEL_157:
    self->_vocalsControlContinuous = *((unsigned char *)v4 + 493);
    *(void *)&self->_has |= 0x40000000000uLL;
  }
LABEL_158:
  if (*((void *)v4 + 10))
  {
    -[_MRCommandOptionsProtobuf setAssociatedParticipantIdentifier:](self, "setAssociatedParticipantIdentifier:");
    id v4 = v19;
  }
  uint64_t v16 = *((void *)v4 + 62);
  if ((v16 & 0x40) != 0)
  {
    self->_double sleepTimerTime = *((double *)v4 + 7);
    *(void *)&self->_has |= 0x40uLL;
    uint64_t v16 = *((void *)v4 + 62);
  }
  if ((v16 & 0x200000) != 0)
  {
    self->_uint64_t sleepTimerStopMode = *((_DWORD *)v4 + 105);
    *(void *)&self->_has |= 0x200000uLL;
  }
  dialogOptions = self->_dialogOptions;
  uint64_t v18 = *((void *)v4 + 19);
  if (dialogOptions)
  {
    if (!v18) {
      goto LABEL_175;
    }
    dialogOptions = (_MRDictionaryProtobuf *)-[_MRDictionaryProtobuf mergeFrom:](dialogOptions, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_175;
    }
    dialogOptions = (_MRDictionaryProtobuf *)-[_MRCommandOptionsProtobuf setDialogOptions:](self, "setDialogOptions:");
  }
  id v4 = v19;
LABEL_175:
  if (*((void *)v4 + 11))
  {
    dialogOptions = (_MRDictionaryProtobuf *)-[_MRCommandOptionsProtobuf setClientPreferredLanguages:](self, "setClientPreferredLanguages:");
    id v4 = v19;
  }
  if ((*((unsigned char *)v4 + 496) & 0x20) != 0)
  {
    self->_double referencePosition = *((double *)v4 + 6);
    *(void *)&self->_has |= 0x20uLL;
  }

  MEMORY[0x1F41817F8](dialogOptions, v4);
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (BOOL)externalPlayerCommand
{
  return self->_externalPlayerCommand;
}

- (float)skipInterval
{
  return self->_skipInterval;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (float)rating
{
  return self->_rating;
}

- (BOOL)negative
{
  return self->_negative;
}

- (double)playbackPosition
{
  return self->_playbackPosition;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (unint64_t)trackID
{
  return self->_trackID;
}

- (int64_t)radioStationID
{
  return self->_radioStationID;
}

- (NSString)radioStationHash
{
  return self->_radioStationHash;
}

- (void)setRadioStationHash:(id)a3
{
}

- (NSData)systemAppPlaybackQueueData
{
  return self->_systemAppPlaybackQueueData;
}

- (void)setSystemAppPlaybackQueueData:(id)a3
{
}

- (NSString)destinationAppDisplayID
{
  return self->_destinationAppDisplayID;
}

- (void)setDestinationAppDisplayID:(id)a3
{
}

- (BOOL)requestDefermentToPlaybackQueuePosition
{
  return self->_requestDefermentToPlaybackQueuePosition;
}

- (BOOL)shouldOverrideManuallyCuratedQueue
{
  return self->_shouldOverrideManuallyCuratedQueue;
}

- (NSString)stationURL
{
  return self->_stationURL;
}

- (void)setStationURL:(id)a3
{
}

- (BOOL)shouldBeginRadioPlayback
{
  return self->_shouldBeginRadioPlayback;
}

- (int)playbackQueueInsertionPosition
{
  return self->_playbackQueueInsertionPosition;
}

- (NSString)contentItemID
{
  return self->_contentItemID;
}

- (void)setContentItemID:(id)a3
{
}

- (int)playbackQueueOffset
{
  return self->_playbackQueueOffset;
}

- (int)playbackQueueDestinationOffset
{
  return self->_playbackQueueDestinationOffset;
}

- (NSData)languageOption
{
  return self->_languageOption;
}

- (void)setLanguageOption:(id)a3
{
}

- (NSData)playbackQueueContext
{
  return self->_playbackQueueContext;
}

- (void)setPlaybackQueueContext:(id)a3
{
}

- (NSString)insertAfterContentItemID
{
  return self->_insertAfterContentItemID;
}

- (void)setInsertAfterContentItemID:(id)a3
{
}

- (NSString)nowPlayingContentItemID
{
  return self->_nowPlayingContentItemID;
}

- (void)setNowPlayingContentItemID:(id)a3
{
}

- (NSString)commandID
{
  return self->_commandID;
}

- (void)setCommandID:(id)a3
{
}

- (NSString)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
}

- (NSString)remoteControlInterface
{
  return self->_remoteControlInterface;
}

- (void)setRemoteControlInterface:(id)a3
{
}

- (BOOL)beginSeek
{
  return self->_beginSeek;
}

- (BOOL)endSeek
{
  return self->_endSeek;
}

- (NSData)playbackSession
{
  return self->_playbackSession;
}

- (void)setPlaybackSession:(id)a3
{
}

- (NSData)userIdentityData
{
  return self->_userIdentityData;
}

- (void)setUserIdentityData:(id)a3
{
}

- (NSString)insertBeforeContentItemID
{
  return self->_insertBeforeContentItemID;
}

- (void)setInsertBeforeContentItemID:(id)a3
{
}

- (BOOL)preservesRepeatMode
{
  return self->_preservesRepeatMode;
}

- (BOOL)preservesShuffleMode
{
  return self->_preservesShuffleMode;
}

- (BOOL)preservesQueueEndAction
{
  return self->_preservesQueueEndAction;
}

- (NSString)homeKitUserIdentifier
{
  return self->_homeKitUserIdentifier;
}

- (void)setHomeKitUserIdentifier:(id)a3
{
}

- (BOOL)verifySupportedCommands
{
  return self->_verifySupportedCommands;
}

- (NSString)playbackSessionIdentifier
{
  return self->_playbackSessionIdentifier;
}

- (void)setPlaybackSessionIdentifier:(id)a3
{
}

- (NSString)playbackSessionFilePath
{
  return self->_playbackSessionFilePath;
}

- (void)setPlaybackSessionFilePath:(id)a3
{
}

- (NSString)playbackSessionRevision
{
  return self->_playbackSessionRevision;
}

- (void)setPlaybackSessionRevision:(id)a3
{
}

- (NSData)playbackSessionMetadata
{
  return self->_playbackSessionMetadata;
}

- (void)setPlaybackSessionMetadata:(id)a3
{
}

- (NSString)playbackSessionType
{
  return self->_playbackSessionType;
}

- (void)setPlaybackSessionType:(id)a3
{
}

- (BOOL)trueCompletion
{
  return self->_trueCompletion;
}

- (NSString)playbackAuthorizationToken
{
  return self->_playbackAuthorizationToken;
}

- (void)setPlaybackAuthorizationToken:(id)a3
{
}

- (NSString)eventNoticeType
{
  return self->_eventNoticeType;
}

- (void)setEventNoticeType:(id)a3
{
}

- (NSString)eventNoticeIdentifier
{
  return self->_eventNoticeIdentifier;
}

- (void)setEventNoticeIdentifier:(id)a3
{
}

- (NSString)sharedPlaybackSessionIdentifier
{
  return self->_sharedPlaybackSessionIdentifier;
}

- (void)setSharedPlaybackSessionIdentifier:(id)a3
{
}

- (double)commandTimeout
{
  return self->_commandTimeout;
}

- (double)assistantTTSEndTimestamp
{
  return self->_assistantTTSEndTimestamp;
}

- (double)assistantCommandSendTimestamp
{
  return self->_assistantCommandSendTimestamp;
}

- (NSString)originatingDeviceUID
{
  return self->_originatingDeviceUID;
}

- (void)setOriginatingDeviceUID:(id)a3
{
}

- (NSData)destinationDeviceUIDs
{
  return self->_destinationDeviceUIDs;
}

- (void)setDestinationDeviceUIDs:(id)a3
{
}

- (NSString)desiredSessionID
{
  return self->_desiredSessionID;
}

- (void)setDesiredSessionID:(id)a3
{
}

- (BOOL)alwaysIgnoreDuringCall
{
  return self->_alwaysIgnoreDuringCall;
}

- (BOOL)alwaysIgnoreDuringSharePlay
{
  return self->_alwaysIgnoreDuringSharePlay;
}

- (NSString)commandSequenceUUID
{
  return self->_commandSequenceUUID;
}

- (void)setCommandSequenceUUID:(id)a3
{
}

- (BOOL)originatedFromRemoteDevice
{
  return self->_originatedFromRemoteDevice;
}

- (NSString)siriTurnIdentifier
{
  return self->_siriTurnIdentifier;
}

- (void)setSiriTurnIdentifier:(id)a3
{
}

- (NSString)siriSearchDataSetIdentifier
{
  return self->_siriSearchDataSetIdentifier;
}

- (void)setSiriSearchDataSetIdentifier:(id)a3
{
}

- (BOOL)prepareForSetQueueIsProactive
{
  return self->_prepareForSetQueueIsProactive;
}

- (NSString)prepareForSetQueueProactiveReason
{
  return self->_prepareForSetQueueProactiveReason;
}

- (void)setPrepareForSetQueueProactiveReason:(id)a3
{
}

- (NSData)applicationUserIdentity
{
  return self->_applicationUserIdentity;
}

- (void)setApplicationUserIdentity:(id)a3
{
}

- (_MRSystemPlaybackQueueProtobuf)systemAppPlaybackQueue
{
  return self->_systemAppPlaybackQueue;
}

- (void)setSystemAppPlaybackQueue:(id)a3
{
}

- (BOOL)vocalsControlActive
{
  return self->_vocalsControlActive;
}

- (float)vocalsControlLevel
{
  return self->_vocalsControlLevel;
}

- (float)vocalsControlMinLevel
{
  return self->_vocalsControlMinLevel;
}

- (float)vocalsControlMaxLevel
{
  return self->_vocalsControlMaxLevel;
}

- (BOOL)vocalsControlContinuous
{
  return self->_vocalsControlContinuous;
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
}

- (double)sleepTimerTime
{
  return self->_sleepTimerTime;
}

- (_MRDictionaryProtobuf)dialogOptions
{
  return self->_dialogOptions;
}

- (void)setDialogOptions:(id)a3
{
}

- (NSString)clientPreferredLanguages
{
  return self->_clientPreferredLanguages;
}

- (void)setClientPreferredLanguages:(id)a3
{
}

- (double)referencePosition
{
  return self->_referencePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityData, 0);
  objc_storeStrong((id *)&self->_systemAppPlaybackQueueData, 0);
  objc_storeStrong((id *)&self->_systemAppPlaybackQueue, 0);
  objc_storeStrong((id *)&self->_stationURL, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_siriTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_siriSearchDataSetIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedPlaybackSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_remoteControlInterface, 0);
  objc_storeStrong((id *)&self->_radioStationHash, 0);
  objc_storeStrong((id *)&self->_prepareForSetQueueProactiveReason, 0);
  objc_storeStrong((id *)&self->_playbackSessionType, 0);
  objc_storeStrong((id *)&self->_playbackSessionRevision, 0);
  objc_storeStrong((id *)&self->_playbackSessionMetadata, 0);
  objc_storeStrong((id *)&self->_playbackSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackSessionFilePath, 0);
  objc_storeStrong((id *)&self->_playbackSession, 0);
  objc_storeStrong((id *)&self->_playbackQueueContext, 0);
  objc_storeStrong((id *)&self->_playbackAuthorizationToken, 0);
  objc_storeStrong((id *)&self->_originatingDeviceUID, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentItemID, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_languageOption, 0);
  objc_storeStrong((id *)&self->_insertBeforeContentItemID, 0);
  objc_storeStrong((id *)&self->_insertAfterContentItemID, 0);
  objc_storeStrong((id *)&self->_homeKitUserIdentifier, 0);
  objc_storeStrong((id *)&self->_eventNoticeType, 0);
  objc_storeStrong((id *)&self->_eventNoticeIdentifier, 0);
  objc_storeStrong((id *)&self->_dialogOptions, 0);
  objc_storeStrong((id *)&self->_destinationDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_destinationAppDisplayID, 0);
  objc_storeStrong((id *)&self->_desiredSessionID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_contentItemID, 0);
  objc_storeStrong((id *)&self->_commandSequenceUUID, 0);
  objc_storeStrong((id *)&self->_commandID, 0);
  objc_storeStrong((id *)&self->_clientPreferredLanguages, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationUserIdentity, 0);
}

@end