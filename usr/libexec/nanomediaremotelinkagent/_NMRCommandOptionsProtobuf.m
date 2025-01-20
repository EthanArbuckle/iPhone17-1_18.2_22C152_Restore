@interface _NMRCommandOptionsProtobuf
- (BOOL)externalPlayerCommand;
- (BOOL)hasContentItemID;
- (BOOL)hasContextID;
- (BOOL)hasDestinationAppDisplayID;
- (BOOL)hasExternalPlayerCommand;
- (BOOL)hasMediaType;
- (BOOL)hasNegative;
- (BOOL)hasPlaybackPosition;
- (BOOL)hasPlaybackQueueInsertionPosition;
- (BOOL)hasPlaybackRate;
- (BOOL)hasQueueEndAction;
- (BOOL)hasRadioStationHash;
- (BOOL)hasRadioStationID;
- (BOOL)hasRating;
- (BOOL)hasRepeatMode;
- (BOOL)hasRequestDefermentToPlaybackQueuePosition;
- (BOOL)hasSendOptions;
- (BOOL)hasShouldBeginRadioPlayback;
- (BOOL)hasShouldOverrideManuallyCuratedQueue;
- (BOOL)hasShuffleMode;
- (BOOL)hasSkipInterval;
- (BOOL)hasSourceID;
- (BOOL)hasStationURL;
- (BOOL)hasSystemAppPlaybackQueueData;
- (BOOL)hasTrackID;
- (BOOL)isEqual:(id)a3;
- (BOOL)negative;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestDefermentToPlaybackQueuePosition;
- (BOOL)shouldBeginRadioPlayback;
- (BOOL)shouldOverrideManuallyCuratedQueue;
- (NSData)systemAppPlaybackQueueData;
- (NSString)contentItemID;
- (NSString)contextID;
- (NSString)destinationAppDisplayID;
- (NSString)mediaType;
- (NSString)radioStationHash;
- (NSString)sourceID;
- (NSString)stationURL;
- (double)playbackPosition;
- (float)playbackRate;
- (float)rating;
- (float)skipInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)queueEndActionAsString:(int)a3;
- (id)repeatModeAsString:(int)a3;
- (id)shuffleModeAsString:(int)a3;
- (int)StringAsQueueEndAction:(id)a3;
- (int)StringAsRepeatMode:(id)a3;
- (int)StringAsShuffleMode:(id)a3;
- (int)playbackQueueInsertionPosition;
- (int)queueEndAction;
- (int)repeatMode;
- (int)shuffleMode;
- (int64_t)radioStationID;
- (unint64_t)hash;
- (unint64_t)trackID;
- (unsigned)sendOptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentItemID:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDestinationAppDisplayID:(id)a3;
- (void)setExternalPlayerCommand:(BOOL)a3;
- (void)setHasExternalPlayerCommand:(BOOL)a3;
- (void)setHasNegative:(BOOL)a3;
- (void)setHasPlaybackPosition:(BOOL)a3;
- (void)setHasPlaybackQueueInsertionPosition:(BOOL)a3;
- (void)setHasPlaybackRate:(BOOL)a3;
- (void)setHasQueueEndAction:(BOOL)a3;
- (void)setHasRadioStationID:(BOOL)a3;
- (void)setHasRating:(BOOL)a3;
- (void)setHasRepeatMode:(BOOL)a3;
- (void)setHasRequestDefermentToPlaybackQueuePosition:(BOOL)a3;
- (void)setHasSendOptions:(BOOL)a3;
- (void)setHasShouldBeginRadioPlayback:(BOOL)a3;
- (void)setHasShouldOverrideManuallyCuratedQueue:(BOOL)a3;
- (void)setHasShuffleMode:(BOOL)a3;
- (void)setHasSkipInterval:(BOOL)a3;
- (void)setHasTrackID:(BOOL)a3;
- (void)setMediaType:(id)a3;
- (void)setNegative:(BOOL)a3;
- (void)setPlaybackPosition:(double)a3;
- (void)setPlaybackQueueInsertionPosition:(int)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setQueueEndAction:(int)a3;
- (void)setRadioStationHash:(id)a3;
- (void)setRadioStationID:(int64_t)a3;
- (void)setRating:(float)a3;
- (void)setRepeatMode:(int)a3;
- (void)setRequestDefermentToPlaybackQueuePosition:(BOOL)a3;
- (void)setSendOptions:(unsigned int)a3;
- (void)setShouldBeginRadioPlayback:(BOOL)a3;
- (void)setShouldOverrideManuallyCuratedQueue:(BOOL)a3;
- (void)setShuffleMode:(int)a3;
- (void)setSkipInterval:(float)a3;
- (void)setSourceID:(id)a3;
- (void)setStationURL:(id)a3;
- (void)setSystemAppPlaybackQueueData:(id)a3;
- (void)setTrackID:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRCommandOptionsProtobuf

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
  *(_WORD *)&self->_has |= 0x800u;
  self->_externalPlayerCommand = a3;
}

- (void)setHasExternalPlayerCommand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasExternalPlayerCommand
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSkipInterval:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_skipInterval = a3;
}

- (void)setHasSkipInterval:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSkipInterval
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setPlaybackRate:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_playbackRate = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPlaybackRate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRating:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rating = a3;
}

- (void)setHasRating:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRating
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNegative:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_negative = a3;
}

- (void)setHasNegative:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasNegative
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setPlaybackPosition:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_playbackPosition = a3;
}

- (void)setHasPlaybackPosition:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasPlaybackPosition
{
  return *(_WORD *)&self->_has & 1;
}

- (int)repeatMode
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_repeatMode;
  }
  else {
    return 0;
  }
}

- (void)setRepeatMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRepeatMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1000454B0 + a3);
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
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_shuffleMode;
  }
  else {
    return 0;
  }
}

- (void)setShuffleMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasShuffleMode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1000454D0 + a3);
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
  *(_WORD *)&self->_has |= 4u;
  self->_trackID = a3;
}

- (void)setHasTrackID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTrackID
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRadioStationID:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_radioStationID = a3;
}

- (void)setHasRadioStationID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRadioStationID
{
  return (*(_WORD *)&self->_has >> 1) & 1;
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

- (void)setSendOptions:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sendOptions = a3;
}

- (void)setHasSendOptions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSendOptions
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRequestDefermentToPlaybackQueuePosition:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_requestDefermentToPlaybackQueuePosition = a3;
}

- (void)setHasRequestDefermentToPlaybackQueuePosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasRequestDefermentToPlaybackQueuePosition
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setShouldOverrideManuallyCuratedQueue:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_shouldOverrideManuallyCuratedQueue = a3;
}

- (void)setHasShouldOverrideManuallyCuratedQueue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasShouldOverrideManuallyCuratedQueue
{
  return *(_WORD *)&self->_has >> 15;
}

- (BOOL)hasStationURL
{
  return self->_stationURL != 0;
}

- (void)setShouldBeginRadioPlayback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_shouldBeginRadioPlayback = a3;
}

- (void)setHasShouldBeginRadioPlayback:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasShouldBeginRadioPlayback
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setPlaybackQueueInsertionPosition:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_playbackQueueInsertionPosition = a3;
}

- (void)setHasPlaybackQueueInsertionPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPlaybackQueueInsertionPosition
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasContentItemID
{
  return self->_contentItemID != 0;
}

- (int)queueEndAction
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_queueEndAction;
  }
  else {
    return 0;
  }
}

- (void)setQueueEndAction:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_queueEndAction = a3;
}

- (void)setHasQueueEndAction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasQueueEndAction
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)queueEndActionAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1000454F0 + a3);
  }

  return v3;
}

- (int)StringAsQueueEndAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Clear"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Reset"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AutoPlay"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRCommandOptionsProtobuf;
  id v3 = [(_NMRCommandOptionsProtobuf *)&v7 description];
  int v4 = [(_NMRCommandOptionsProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v5 = v3;
  sourceID = self->_sourceID;
  if (sourceID) {
    [v3 setObject:sourceID forKey:@"sourceID"];
  }
  mediaType = self->_mediaType;
  if (mediaType) {
    [v5 setObject:mediaType forKey:@"mediaType"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_externalPlayerCommand];
    [v5 setObject:v9 forKey:@"externalPlayerCommand"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *(float *)&double v4 = self->_skipInterval;
  v10 = +[NSNumber numberWithFloat:v4];
  [v5 setObject:v10 forKey:@"skipInterval"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(float *)&double v4 = self->_playbackRate;
  v11 = +[NSNumber numberWithFloat:v4];
  [v5 setObject:v11 forKey:@"playbackRate"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(float *)&double v4 = self->_rating;
  v12 = +[NSNumber numberWithFloat:v4];
  [v5 setObject:v12 forKey:@"rating"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = +[NSNumber numberWithBool:self->_negative];
  [v5 setObject:v13 forKey:@"negative"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_19:
  v14 = +[NSNumber numberWithDouble:self->_playbackPosition];
  [v5 setObject:v14 forKey:@"playbackPosition"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
LABEL_20:
  uint64_t repeatMode = self->_repeatMode;
  if (repeatMode >= 4)
  {
    v16 = +[NSString stringWithFormat:@"(unknown: %i)", self->_repeatMode];
  }
  else
  {
    v16 = *(&off_1000454B0 + repeatMode);
  }
  [v5 setObject:v16 forKey:@"repeatMode"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_24:
    uint64_t shuffleMode = self->_shuffleMode;
    if (shuffleMode >= 4)
    {
      v18 = +[NSString stringWithFormat:@"(unknown: %i)", self->_shuffleMode];
    }
    else
    {
      v18 = *(&off_1000454D0 + shuffleMode);
    }
    [v5 setObject:v18 forKey:@"shuffleMode"];
  }
LABEL_28:
  contextID = self->_contextID;
  if (contextID) {
    [v5 setObject:contextID forKey:@"contextID"];
  }
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 4) != 0)
  {
    v21 = +[NSNumber numberWithUnsignedLongLong:self->_trackID];
    [v5 setObject:v21 forKey:@"trackID"];

    __int16 v20 = (__int16)self->_has;
  }
  if ((v20 & 2) != 0)
  {
    v22 = +[NSNumber numberWithLongLong:self->_radioStationID];
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
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x100) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x2000) == 0) {
      goto LABEL_42;
    }
LABEL_55:
    v35 = +[NSNumber numberWithBool:self->_requestDefermentToPlaybackQueuePosition];
    [v5 setObject:v35 forKey:@"requestDefermentToPlaybackQueuePosition"];

    if ((*(_WORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_56;
  }
  v34 = +[NSNumber numberWithUnsignedInt:self->_sendOptions];
  [v5 setObject:v34 forKey:@"sendOptions"];

  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x2000) != 0) {
    goto LABEL_55;
  }
LABEL_42:
  if ((v26 & 0x8000) == 0) {
    goto LABEL_43;
  }
LABEL_56:
  v36 = +[NSNumber numberWithBool:self->_shouldOverrideManuallyCuratedQueue];
  [v5 setObject:v36 forKey:@"shouldOverrideManuallyCuratedQueue"];

LABEL_43:
  stationURL = self->_stationURL;
  if (stationURL) {
    [v5 setObject:stationURL forKey:@"stationURL"];
  }
  __int16 v28 = (__int16)self->_has;
  if ((v28 & 0x4000) != 0)
  {
    v29 = +[NSNumber numberWithBool:self->_shouldBeginRadioPlayback];
    [v5 setObject:v29 forKey:@"shouldBeginRadioPlayback"];

    __int16 v28 = (__int16)self->_has;
  }
  if ((v28 & 8) != 0)
  {
    v30 = +[NSNumber numberWithInt:self->_playbackQueueInsertionPosition];
    [v5 setObject:v30 forKey:@"playbackQueueInsertionPosition"];
  }
  contentItemID = self->_contentItemID;
  if (contentItemID) {
    [v5 setObject:contentItemID forKey:@"contentItemID"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    uint64_t queueEndAction = self->_queueEndAction;
    if (queueEndAction >= 5)
    {
      v33 = +[NSString stringWithFormat:@"(unknown: %i)", self->_queueEndAction];
    }
    else
    {
      v33 = *(&off_1000454F0 + queueEndAction);
    }
    [v5 setObject:v33 forKey:@"queueEndAction"];
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100028FAC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_sourceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_mediaType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteFloatField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteFloatField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
LABEL_16:
  if (self->_radioStationHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_systemAppPlaybackQueueData)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if (self->_destinationAppDisplayID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_contextID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_stationURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_contentItemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_sourceID)
  {
    [v4 setSourceID:];
    id v4 = v8;
  }
  if (self->_mediaType)
  {
    [v8 setMediaType:];
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *((unsigned char *)v4 + 136) = self->_externalPlayerCommand;
    *((_WORD *)v4 + 72) |= 0x800u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 26) = LODWORD(self->_skipInterval);
  *((_WORD *)v4 + 72) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 17) = LODWORD(self->_playbackRate);
  *((_WORD *)v4 + 72) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 22) = LODWORD(self->_rating);
  *((_WORD *)v4 + 72) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((unsigned char *)v4 + 137) = self->_negative;
  *((_WORD *)v4 + 72) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)v4 + 1) = *(void *)&self->_playbackPosition;
  *((_WORD *)v4 + 72) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 23) = self->_repeatMode;
  *((_WORD *)v4 + 72) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 25) = self->_shuffleMode;
  *((_WORD *)v4 + 72) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_51:
  *((void *)v4 + 3) = self->_trackID;
  *((_WORD *)v4 + 72) |= 4u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_15:
    *((void *)v4 + 2) = self->_radioStationID;
    *((_WORD *)v4 + 72) |= 2u;
  }
LABEL_16:
  if (self->_radioStationHash)
  {
    [v8 setRadioStationHash:];
    id v4 = v8;
  }
  if (self->_systemAppPlaybackQueueData)
  {
    [v8 setSystemAppPlaybackQueueData:];
    id v4 = v8;
  }
  if (self->_destinationAppDisplayID)
  {
    [v8 setDestinationAppDisplayID:];
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_sendOptions;
    *((_WORD *)v4 + 72) |= 0x100u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x2000) != 0)
  {
    *((unsigned char *)v4 + 138) = self->_requestDefermentToPlaybackQueuePosition;
    *((_WORD *)v4 + 72) |= 0x2000u;
  }
  if (self->_contextID)
  {
    [v8 setContextID:];
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
  {
    *((unsigned char *)v4 + 140) = self->_shouldOverrideManuallyCuratedQueue;
    *((_WORD *)v4 + 72) |= 0x8000u;
  }
  if (self->_stationURL)
  {
    [v8 setStationURL:];
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x4000) != 0)
  {
    *((unsigned char *)v4 + 139) = self->_shouldBeginRadioPlayback;
    *((_WORD *)v4 + 72) |= 0x4000u;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_playbackQueueInsertionPosition;
    *((_WORD *)v4 + 72) |= 8u;
  }
  if (self->_contentItemID)
  {
    [v8 setContentItemID:];
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_queueEndAction;
    *((_WORD *)v4 + 72) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(NSString *)self->_sourceID copyWithZone:a3];
  __int16 v7 = (void *)v5[14];
  v5[14] = v6;

  id v8 = [(NSString *)self->_mediaType copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *((unsigned char *)v5 + 136) = self->_externalPlayerCommand;
    *((_WORD *)v5 + 72) |= 0x800u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 26) = LODWORD(self->_skipInterval);
  *((_WORD *)v5 + 72) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 17) = LODWORD(self->_playbackRate);
  *((_WORD *)v5 + 72) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 22) = LODWORD(self->_rating);
  *((_WORD *)v5 + 72) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((unsigned char *)v5 + 137) = self->_negative;
  *((_WORD *)v5 + 72) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  v5[1] = *(void *)&self->_playbackPosition;
  *((_WORD *)v5 + 72) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v5 + 23) = self->_repeatMode;
  *((_WORD *)v5 + 72) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 25) = self->_shuffleMode;
  *((_WORD *)v5 + 72) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_33:
  v5[3] = self->_trackID;
  *((_WORD *)v5 + 72) |= 4u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_11:
    v5[2] = self->_radioStationID;
    *((_WORD *)v5 + 72) |= 2u;
  }
LABEL_12:
  id v11 = [(NSString *)self->_radioStationHash copyWithZone:a3];
  v12 = (void *)v5[10];
  v5[10] = v11;

  id v13 = [(NSData *)self->_systemAppPlaybackQueueData copyWithZone:a3];
  v14 = (void *)v5[16];
  v5[16] = v13;

  id v15 = [(NSString *)self->_destinationAppDisplayID copyWithZone:a3];
  v16 = (void *)v5[6];
  v5[6] = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x100) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_sendOptions;
    *((_WORD *)v5 + 72) |= 0x100u;
    __int16 v17 = (__int16)self->_has;
  }
  if ((v17 & 0x2000) != 0)
  {
    *((unsigned char *)v5 + 138) = self->_requestDefermentToPlaybackQueuePosition;
    *((_WORD *)v5 + 72) |= 0x2000u;
  }
  id v18 = [(NSString *)self->_contextID copyWithZone:a3];
  v19 = (void *)v5[5];
  v5[5] = v18;

  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
  {
    *((unsigned char *)v5 + 140) = self->_shouldOverrideManuallyCuratedQueue;
    *((_WORD *)v5 + 72) |= 0x8000u;
  }
  id v20 = [(NSString *)self->_stationURL copyWithZone:a3];
  v21 = (void *)v5[15];
  v5[15] = v20;

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x4000) != 0)
  {
    *((unsigned char *)v5 + 139) = self->_shouldBeginRadioPlayback;
    *((_WORD *)v5 + 72) |= 0x4000u;
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 8) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_playbackQueueInsertionPosition;
    *((_WORD *)v5 + 72) |= 8u;
  }
  id v23 = [(NSString *)self->_contentItemID copyWithZone:a3];
  v24 = (void *)v5[4];
  v5[4] = v23;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v5 + 18) = self->_queueEndAction;
    *((_WORD *)v5 + 72) |= 0x20u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (__int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_116;
  }
  sourceID = self->_sourceID;
  if ((unint64_t)sourceID | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](sourceID, "isEqual:")) {
      goto LABEL_116;
    }
  }
  mediaType = self->_mediaType;
  if ((unint64_t)mediaType | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](mediaType, "isEqual:")) {
      goto LABEL_116;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = v4[72];
  if ((has & 0x800) != 0)
  {
    if ((v4[72] & 0x800) == 0) {
      goto LABEL_116;
    }
    if (self->_externalPlayerCommand)
    {
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_116;
      }
    }
    else if (*((unsigned char *)v4 + 136))
    {
      goto LABEL_116;
    }
  }
  else if ((v4[72] & 0x800) != 0)
  {
    goto LABEL_116;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((v4[72] & 0x400) == 0 || self->_skipInterval != *((float *)v4 + 26)) {
      goto LABEL_116;
    }
  }
  else if ((v4[72] & 0x400) != 0)
  {
    goto LABEL_116;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_playbackRate != *((float *)v4 + 17)) {
      goto LABEL_116;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_116;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_rating != *((float *)v4 + 22)) {
      goto LABEL_116;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_116;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((v4[72] & 0x1000) == 0) {
      goto LABEL_116;
    }
    if (self->_negative)
    {
      if (!*((unsigned char *)v4 + 137)) {
        goto LABEL_116;
      }
    }
    else if (*((unsigned char *)v4 + 137))
    {
      goto LABEL_116;
    }
  }
  else if ((v4[72] & 0x1000) != 0)
  {
    goto LABEL_116;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_playbackPosition != *((double *)v4 + 1)) {
      goto LABEL_116;
    }
  }
  else if (v8)
  {
    goto LABEL_116;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_repeatMode != *((_DWORD *)v4 + 23)) {
      goto LABEL_116;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_116;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((v4[72] & 0x200) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 25)) {
      goto LABEL_116;
    }
  }
  else if ((v4[72] & 0x200) != 0)
  {
    goto LABEL_116;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_trackID != *((void *)v4 + 3)) {
      goto LABEL_116;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_116;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_radioStationID != *((void *)v4 + 2)) {
      goto LABEL_116;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_116;
  }
  radioStationHash = self->_radioStationHash;
  if ((unint64_t)radioStationHash | *((void *)v4 + 10)
    && !-[NSString isEqual:](radioStationHash, "isEqual:"))
  {
    goto LABEL_116;
  }
  systemAppPlaybackQueueData = self->_systemAppPlaybackQueueData;
  if ((unint64_t)systemAppPlaybackQueueData | *((void *)v4 + 16))
  {
    if (!-[NSData isEqual:](systemAppPlaybackQueueData, "isEqual:")) {
      goto LABEL_116;
    }
  }
  destinationAppDisplayID = self->_destinationAppDisplayID;
  if ((unint64_t)destinationAppDisplayID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](destinationAppDisplayID, "isEqual:")) {
      goto LABEL_116;
    }
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    if ((v4[72] & 0x100) == 0 || self->_sendOptions != *((_DWORD *)v4 + 24)) {
      goto LABEL_116;
    }
  }
  else if ((v4[72] & 0x100) != 0)
  {
    goto LABEL_116;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((v4[72] & 0x2000) == 0) {
      goto LABEL_116;
    }
    if (self->_requestDefermentToPlaybackQueuePosition)
    {
      if (!*((unsigned char *)v4 + 138)) {
        goto LABEL_116;
      }
    }
    else if (*((unsigned char *)v4 + 138))
    {
      goto LABEL_116;
    }
  }
  else if ((v4[72] & 0x2000) != 0)
  {
    goto LABEL_116;
  }
  contextID = self->_contextID;
  if ((unint64_t)contextID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](contextID, "isEqual:")) {
      goto LABEL_116;
    }
    __int16 v12 = (__int16)self->_has;
  }
  int v14 = v4[72];
  if (v12 < 0)
  {
    if ((v14 & 0x80000000) == 0) {
      goto LABEL_116;
    }
    if (self->_shouldOverrideManuallyCuratedQueue)
    {
      if (!*((unsigned char *)v4 + 140)) {
        goto LABEL_116;
      }
    }
    else if (*((unsigned char *)v4 + 140))
    {
      goto LABEL_116;
    }
  }
  else if (v14 < 0)
  {
    goto LABEL_116;
  }
  stationURL = self->_stationURL;
  if ((unint64_t)stationURL | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](stationURL, "isEqual:")) {
      goto LABEL_116;
    }
    __int16 v12 = (__int16)self->_has;
  }
  __int16 v16 = v4[72];
  if ((v12 & 0x4000) != 0)
  {
    if ((v4[72] & 0x4000) == 0) {
      goto LABEL_116;
    }
    if (self->_shouldBeginRadioPlayback)
    {
      if (!*((unsigned char *)v4 + 139)) {
        goto LABEL_116;
      }
    }
    else if (*((unsigned char *)v4 + 139))
    {
      goto LABEL_116;
    }
  }
  else if ((v4[72] & 0x4000) != 0)
  {
    goto LABEL_116;
  }
  if ((v12 & 8) != 0)
  {
    if ((v16 & 8) == 0 || self->_playbackQueueInsertionPosition != *((_DWORD *)v4 + 16)) {
      goto LABEL_116;
    }
  }
  else if ((v16 & 8) != 0)
  {
    goto LABEL_116;
  }
  contentItemID = self->_contentItemID;
  if ((unint64_t)contentItemID | *((void *)v4 + 4))
  {
    if (-[NSString isEqual:](contentItemID, "isEqual:"))
    {
      __int16 v12 = (__int16)self->_has;
      goto LABEL_111;
    }
LABEL_116:
    BOOL v19 = 0;
    goto LABEL_117;
  }
LABEL_111:
  __int16 v18 = v4[72];
  if ((v12 & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_queueEndAction != *((_DWORD *)v4 + 18)) {
      goto LABEL_116;
    }
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = (v18 & 0x20) == 0;
  }
LABEL_117:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v46 = [(NSString *)self->_sourceID hash];
  NSUInteger v45 = [(NSString *)self->_mediaType hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0) {
    uint64_t v44 = 2654435761 * self->_externalPlayerCommand;
  }
  else {
    uint64_t v44 = 0;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    float skipInterval = self->_skipInterval;
    float v6 = -skipInterval;
    if (skipInterval >= 0.0) {
      float v6 = self->_skipInterval;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 0x10) != 0)
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
  if ((has & 0x40) != 0)
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
  if ((has & 0x1000) != 0)
  {
    uint64_t v43 = 2654435761 * self->_negative;
    if (has) {
      goto LABEL_30;
    }
LABEL_35:
    unint64_t v23 = 0;
    goto LABEL_38;
  }
  uint64_t v43 = 0;
  if ((has & 1) == 0) {
    goto LABEL_35;
  }
LABEL_30:
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
LABEL_38:
  if ((has & 0x80) == 0)
  {
    uint64_t v41 = 0;
    if ((has & 0x200) != 0) {
      goto LABEL_40;
    }
LABEL_43:
    uint64_t v40 = 0;
    if ((has & 4) != 0) {
      goto LABEL_41;
    }
    goto LABEL_44;
  }
  uint64_t v41 = 2654435761 * self->_repeatMode;
  if ((has & 0x200) == 0) {
    goto LABEL_43;
  }
LABEL_40:
  uint64_t v40 = 2654435761 * self->_shuffleMode;
  if ((has & 4) != 0)
  {
LABEL_41:
    unint64_t v39 = 2654435761u * self->_trackID;
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v39 = 0;
LABEL_45:
  unint64_t v42 = v23;
  if ((has & 2) != 0) {
    uint64_t v38 = 2654435761 * self->_radioStationID;
  }
  else {
    uint64_t v38 = 0;
  }
  NSUInteger v37 = [(NSString *)self->_radioStationHash hash];
  unint64_t v36 = (unint64_t)[(NSData *)self->_systemAppPlaybackQueueData hash];
  NSUInteger v35 = [(NSString *)self->_destinationAppDisplayID hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t v34 = 2654435761 * self->_sendOptions;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_50:
      uint64_t v24 = 2654435761 * self->_requestDefermentToPlaybackQueuePosition;
      goto LABEL_53;
    }
  }
  uint64_t v24 = 0;
LABEL_53:
  NSUInteger v25 = [(NSString *)self->_contextID hash];
  if ((*(_WORD *)&self->_has & 0x80000000) != 0) {
    uint64_t v26 = 2654435761 * self->_shouldOverrideManuallyCuratedQueue;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v27 = [(NSString *)self->_stationURL hash];
  __int16 v28 = (__int16)self->_has;
  if ((v28 & 0x4000) != 0) {
    uint64_t v29 = 2654435761 * self->_shouldBeginRadioPlayback;
  }
  else {
    uint64_t v29 = 0;
  }
  if ((v28 & 8) != 0) {
    uint64_t v30 = 2654435761 * self->_playbackQueueInsertionPosition;
  }
  else {
    uint64_t v30 = 0;
  }
  NSUInteger v31 = [(NSString *)self->_contentItemID hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v32 = 2654435761 * self->_queueEndAction;
  }
  else {
    uint64_t v32 = 0;
  }
  return v45 ^ v46 ^ v44 ^ v4 ^ v9 ^ v14 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v24 ^ v25 ^ v26 ^ v27 ^ v29 ^ v30 ^ v31 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (__int16 *)a3;
  float v8 = v4;
  if (*((void *)v4 + 14))
  {
    -[_NMRCommandOptionsProtobuf setSourceID:](self, "setSourceID:");
    unint64_t v4 = v8;
  }
  if (*((void *)v4 + 7))
  {
    -[_NMRCommandOptionsProtobuf setMediaType:](self, "setMediaType:");
    unint64_t v4 = v8;
  }
  __int16 v5 = v4[72];
  if ((v5 & 0x800) != 0)
  {
    self->_externalPlayerCommand = *((unsigned char *)v4 + 136);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v5 = v4[72];
    if ((v5 & 0x400) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_45;
    }
  }
  else if ((v4[72] & 0x400) == 0)
  {
    goto LABEL_7;
  }
  self->_float skipInterval = *((float *)v4 + 26);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = v4[72];
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_float playbackRate = *((float *)v4 + 17);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = v4[72];
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_float rating = *((float *)v4 + 22);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = v4[72];
  if ((v5 & 0x1000) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_negative = *((unsigned char *)v4 + 137);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = v4[72];
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_double playbackPosition = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = v4[72];
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_uint64_t repeatMode = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = v4[72];
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_uint64_t shuffleMode = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = v4[72];
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_51:
  self->_trackID = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((v4[72] & 2) != 0)
  {
LABEL_15:
    self->_radioStationID = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_16:
  if (*((void *)v4 + 10))
  {
    -[_NMRCommandOptionsProtobuf setRadioStationHash:](self, "setRadioStationHash:");
    unint64_t v4 = v8;
  }
  if (*((void *)v4 + 16))
  {
    -[_NMRCommandOptionsProtobuf setSystemAppPlaybackQueueData:](self, "setSystemAppPlaybackQueueData:");
    unint64_t v4 = v8;
  }
  if (*((void *)v4 + 6))
  {
    -[_NMRCommandOptionsProtobuf setDestinationAppDisplayID:](self, "setDestinationAppDisplayID:");
    unint64_t v4 = v8;
  }
  __int16 v6 = v4[72];
  if ((v6 & 0x100) != 0)
  {
    self->_sendOptions = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v6 = v4[72];
  }
  if ((v6 & 0x2000) != 0)
  {
    self->_requestDefermentToPlaybackQueuePosition = *((unsigned char *)v4 + 138);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v4 + 5))
  {
    -[_NMRCommandOptionsProtobuf setContextID:](self, "setContextID:");
    unint64_t v4 = v8;
  }
  if (v4[72] < 0)
  {
    self->_shouldOverrideManuallyCuratedQueue = *((unsigned char *)v4 + 140);
    *(_WORD *)&self->_has |= 0x8000u;
  }
  if (*((void *)v4 + 15))
  {
    -[_NMRCommandOptionsProtobuf setStationURL:](self, "setStationURL:");
    unint64_t v4 = v8;
  }
  __int16 v7 = v4[72];
  if ((v7 & 0x4000) != 0)
  {
    self->_shouldBeginRadioPlayback = *((unsigned char *)v4 + 139);
    *(_WORD *)&self->_has |= 0x4000u;
    __int16 v7 = v4[72];
  }
  if ((v7 & 8) != 0)
  {
    self->_playbackQueueInsertionPosition = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 4))
  {
    -[_NMRCommandOptionsProtobuf setContentItemID:](self, "setContentItemID:");
    unint64_t v4 = v8;
  }
  if ((v4[72] & 0x20) != 0)
  {
    self->_uint64_t queueEndAction = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x20u;
  }
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

- (unsigned)sendOptions
{
  return self->_sendOptions;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAppPlaybackQueueData, 0);
  objc_storeStrong((id *)&self->_stationURL, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_radioStationHash, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_destinationAppDisplayID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);

  objc_storeStrong((id *)&self->_contentItemID, 0);
}

@end