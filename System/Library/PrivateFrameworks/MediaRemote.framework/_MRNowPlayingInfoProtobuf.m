@interface _MRNowPlayingInfoProtobuf
- (BOOL)hasAlbum;
- (BOOL)hasArtist;
- (BOOL)hasArtworkDataDigest;
- (BOOL)hasDuration;
- (BOOL)hasElapsedTime;
- (BOOL)hasIsAdvertisement;
- (BOOL)hasIsAlwaysLive;
- (BOOL)hasIsExplicitTrack;
- (BOOL)hasIsInTransition;
- (BOOL)hasIsMusicApp;
- (BOOL)hasPlaybackRate;
- (BOOL)hasRadioStationHash;
- (BOOL)hasRadioStationIdentifier;
- (BOOL)hasRadioStationName;
- (BOOL)hasRepeatMode;
- (BOOL)hasShuffleMode;
- (BOOL)hasTimestamp;
- (BOOL)hasTitle;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isAdvertisement;
- (BOOL)isAlwaysLive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitTrack;
- (BOOL)isInTransition;
- (BOOL)isMusicApp;
- (BOOL)readFrom:(id)a3;
- (NSData)artworkDataDigest;
- (NSString)album;
- (NSString)artist;
- (NSString)radioStationHash;
- (NSString)radioStationName;
- (NSString)title;
- (double)duration;
- (double)elapsedTime;
- (double)timestamp;
- (float)playbackRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)repeatModeAsString:(int)a3;
- (id)shuffleModeAsString:(int)a3;
- (int)StringAsRepeatMode:(id)a3;
- (int)StringAsShuffleMode:(id)a3;
- (int)repeatMode;
- (int)shuffleMode;
- (int64_t)radioStationIdentifier;
- (unint64_t)hash;
- (unint64_t)uniqueIdentifier;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtworkDataDigest:(id)a3;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasElapsedTime:(BOOL)a3;
- (void)setHasIsAdvertisement:(BOOL)a3;
- (void)setHasIsAlwaysLive:(BOOL)a3;
- (void)setHasIsExplicitTrack:(BOOL)a3;
- (void)setHasIsInTransition:(BOOL)a3;
- (void)setHasIsMusicApp:(BOOL)a3;
- (void)setHasPlaybackRate:(BOOL)a3;
- (void)setHasRadioStationIdentifier:(BOOL)a3;
- (void)setHasRepeatMode:(BOOL)a3;
- (void)setHasShuffleMode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUniqueIdentifier:(BOOL)a3;
- (void)setIsAdvertisement:(BOOL)a3;
- (void)setIsAlwaysLive:(BOOL)a3;
- (void)setIsExplicitTrack:(BOOL)a3;
- (void)setIsInTransition:(BOOL)a3;
- (void)setIsMusicApp:(BOOL)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setRadioStationHash:(id)a3;
- (void)setRadioStationIdentifier:(int64_t)a3;
- (void)setRadioStationName:(id)a3;
- (void)setRepeatMode:(int)a3;
- (void)setShuffleMode:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueIdentifier:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRNowPlayingInfoProtobuf

- (BOOL)hasAlbum
{
  return self->_album != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (void)setDuration:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setElapsedTime:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_elapsedTime = a3;
}

- (void)setHasElapsedTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasElapsedTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPlaybackRate:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_playbackRate = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPlaybackRate
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)repeatMode
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_repeatMode;
  }
  else {
    return 0;
  }
}

- (void)setRepeatMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRepeatMode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E57D7568[a3];
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
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_shuffleMode;
  }
  else {
    return 0;
  }
}

- (void)setShuffleMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasShuffleMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E57D7588[a3];
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

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setUniqueIdentifier:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_uniqueIdentifier = a3;
}

- (void)setHasUniqueIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasUniqueIdentifier
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsExplicitTrack:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isExplicitTrack = a3;
}

- (void)setHasIsExplicitTrack:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsExplicitTrack
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsMusicApp:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isMusicApp = a3;
}

- (void)setHasIsMusicApp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsMusicApp
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setRadioStationIdentifier:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_radioStationIdentifier = a3;
}

- (void)setHasRadioStationIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRadioStationIdentifier
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasRadioStationHash
{
  return self->_radioStationHash != 0;
}

- (BOOL)hasRadioStationName
{
  return self->_radioStationName != 0;
}

- (BOOL)hasArtworkDataDigest
{
  return self->_artworkDataDigest != 0;
}

- (void)setIsAlwaysLive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isAlwaysLive = a3;
}

- (void)setHasIsAlwaysLive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsAlwaysLive
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsAdvertisement:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isAdvertisement = a3;
}

- (void)setHasIsAdvertisement:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsAdvertisement
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsInTransition:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isInTransition = a3;
}

- (void)setHasIsInTransition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsInTransition
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRNowPlayingInfoProtobuf;
  int v4 = [(_MRNowPlayingInfoProtobuf *)&v8 description];
  v5 = [(_MRNowPlayingInfoProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  album = self->_album;
  if (album) {
    [v3 setObject:album forKey:@"album"];
  }
  artist = self->_artist;
  if (artist) {
    [v5 setObject:artist forKey:@"artist"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v19 = [NSNumber numberWithDouble:self->_duration];
    [v5 setObject:v19 forKey:@"duration"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  v20 = [NSNumber numberWithDouble:self->_elapsedTime];
  [v5 setObject:v20 forKey:@"elapsedTime"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(float *)&double v4 = self->_playbackRate;
  v21 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v21 forKey:@"playbackRate"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_35:
  uint64_t repeatMode = self->_repeatMode;
  if (repeatMode >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_repeatMode);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_1E57D7568[repeatMode];
  }
  [v5 setObject:v23 forKey:@"repeatMode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_46:
  uint64_t shuffleMode = self->_shuffleMode;
  if (shuffleMode >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_shuffleMode);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_1E57D7588[shuffleMode];
  }
  [v5 setObject:v30 forKey:@"shuffleMode"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithDouble:self->_timestamp];
    [v5 setObject:v9 forKey:@"timestamp"];
  }
LABEL_12:
  title = self->_title;
  if (title) {
    [v5 setObject:title forKey:@"title"];
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    v24 = [NSNumber numberWithUnsignedLongLong:self->_uniqueIdentifier];
    [v5 setObject:v24 forKey:@"uniqueIdentifier"];

    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x400) == 0)
    {
LABEL_16:
      if ((v11 & 0x1000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_16;
  }
  v25 = [NSNumber numberWithBool:self->_isExplicitTrack];
  [v5 setObject:v25 forKey:@"isExplicitTrack"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x1000) == 0)
  {
LABEL_17:
    if ((v11 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_39:
  v26 = [NSNumber numberWithBool:self->_isMusicApp];
  [v5 setObject:v26 forKey:@"isMusicApp"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    v12 = [NSNumber numberWithLongLong:self->_radioStationIdentifier];
    [v5 setObject:v12 forKey:@"radioStationIdentifier"];
  }
LABEL_19:
  radioStationHash = self->_radioStationHash;
  if (radioStationHash) {
    [v5 setObject:radioStationHash forKey:@"radioStationHash"];
  }
  radioStationName = self->_radioStationName;
  if (radioStationName) {
    [v5 setObject:radioStationName forKey:@"radioStationName"];
  }
  artworkDataDigest = self->_artworkDataDigest;
  if (artworkDataDigest) {
    [v5 setObject:artworkDataDigest forKey:@"artworkDataDigest"];
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x200) != 0)
  {
    v27 = [NSNumber numberWithBool:self->_isAlwaysLive];
    [v5 setObject:v27 forKey:@"isAlwaysLive"];

    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x100) == 0)
    {
LABEL_27:
      if ((v16 & 0x800) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_27;
  }
  v28 = [NSNumber numberWithBool:self->_isAdvertisement];
  [v5 setObject:v28 forKey:@"isAdvertisement"];

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_28:
    v17 = [NSNumber numberWithBool:self->_isInTransition];
    [v5 setObject:v17 forKey:@"isInTransition"];
  }
LABEL_29:

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return _MRNowPlayingInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_album)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_artist)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteFloatField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField();
    id v4 = v8;
  }
LABEL_12:
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_16:
      if ((v6 & 0x1000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
LABEL_19:
  if (self->_radioStationHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_radioStationName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_artworkDataDigest)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x100) == 0)
    {
LABEL_27:
      if ((v7 & 0x800) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_28:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
LABEL_29:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_album)
  {
    objc_msgSend(v4, "setAlbum:");
    id v4 = v8;
  }
  if (self->_artist)
  {
    objc_msgSend(v8, "setArtist:");
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_duration;
    *((_WORD *)v4 + 60) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = *(void *)&self->_elapsedTime;
  *((_WORD *)v4 + 60) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 18) = LODWORD(self->_playbackRate);
  *((_WORD *)v4 + 60) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 24) = self->_repeatMode;
  *((_WORD *)v4 + 60) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_36:
  *((_DWORD *)v4 + 25) = self->_shuffleMode;
  *((_WORD *)v4 + 60) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((void *)v4 + 4) = *(void *)&self->_timestamp;
    *((_WORD *)v4 + 60) |= 8u;
  }
LABEL_12:
  if (self->_title)
  {
    objc_msgSend(v8, "setTitle:");
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((void *)v4 + 5) = self->_uniqueIdentifier;
    *((_WORD *)v4 + 60) |= 0x10u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_16:
      if ((v6 & 0x1000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_16;
  }
  *((unsigned char *)v4 + 114) = self->_isExplicitTrack;
  *((_WORD *)v4 + 60) |= 0x400u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_40:
  *((unsigned char *)v4 + 116) = self->_isMusicApp;
  *((_WORD *)v4 + 60) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    *((void *)v4 + 3) = self->_radioStationIdentifier;
    *((_WORD *)v4 + 60) |= 4u;
  }
LABEL_19:
  if (self->_radioStationHash)
  {
    objc_msgSend(v8, "setRadioStationHash:");
    id v4 = v8;
  }
  if (self->_radioStationName)
  {
    objc_msgSend(v8, "setRadioStationName:");
    id v4 = v8;
  }
  if (self->_artworkDataDigest)
  {
    objc_msgSend(v8, "setArtworkDataDigest:");
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 113) = self->_isAlwaysLive;
    *((_WORD *)v4 + 60) |= 0x200u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x100) == 0)
    {
LABEL_27:
      if ((v7 & 0x800) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_27;
  }
  *((unsigned char *)v4 + 112) = self->_isAdvertisement;
  *((_WORD *)v4 + 60) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_28:
    *((unsigned char *)v4 + 115) = self->_isInTransition;
    *((_WORD *)v4 + 60) |= 0x800u;
  }
LABEL_29:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_album copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_artist copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(_WORD *)(v5 + 120) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_elapsedTime;
  *(_WORD *)(v5 + 120) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(float *)(v5 + 72) = self->_playbackRate;
  *(_WORD *)(v5 + 120) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 96) = self->_repeatMode;
  *(_WORD *)(v5 + 120) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  *(_DWORD *)(v5 + 100) = self->_shuffleMode;
  *(_WORD *)(v5 + 120) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    *(double *)(v5 + 32) = self->_timestamp;
    *(_WORD *)(v5 + 120) |= 8u;
  }
LABEL_8:
  uint64_t v11 = [(NSString *)self->_title copyWithZone:a3];
  v12 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_uniqueIdentifier;
    *(_WORD *)(v5 + 120) |= 0x10u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x400) == 0)
    {
LABEL_10:
      if ((v13 & 0x1000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 114) = self->_isExplicitTrack;
  *(_WORD *)(v5 + 120) |= 0x400u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x1000) == 0)
  {
LABEL_11:
    if ((v13 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_26:
  *(unsigned char *)(v5 + 116) = self->_isMusicApp;
  *(_WORD *)(v5 + 120) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    *(void *)(v5 + 24) = self->_radioStationIdentifier;
    *(_WORD *)(v5 + 120) |= 4u;
  }
LABEL_13:
  uint64_t v14 = [(NSString *)self->_radioStationHash copyWithZone:a3];
  v15 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v14;

  uint64_t v16 = [(NSString *)self->_radioStationName copyWithZone:a3];
  v17 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v16;

  uint64_t v18 = [(NSData *)self->_artworkDataDigest copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x200) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_15;
    }
LABEL_29:
    *(unsigned char *)(v5 + 112) = self->_isAdvertisement;
    *(_WORD *)(v5 + 120) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      return (id)v5;
    }
    goto LABEL_16;
  }
  *(unsigned char *)(v5 + 113) = self->_isAlwaysLive;
  *(_WORD *)(v5 + 120) |= 0x200u;
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x100) != 0) {
    goto LABEL_29;
  }
LABEL_15:
  if ((v20 & 0x800) != 0)
  {
LABEL_16:
    *(unsigned char *)(v5 + 115) = self->_isInTransition;
    *(_WORD *)(v5 + 120) |= 0x800u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_90;
  }
  album = self->_album;
  if ((unint64_t)album | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](album, "isEqual:")) {
      goto LABEL_90;
    }
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](artist, "isEqual:")) {
      goto LABEL_90;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 60);
  if (has)
  {
    if ((v8 & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_90;
    }
  }
  else if (v8)
  {
    goto LABEL_90;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_elapsedTime != *((double *)v4 + 2)) {
      goto LABEL_90;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_playbackRate != *((float *)v4 + 18)) {
      goto LABEL_90;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_repeatMode != *((_DWORD *)v4 + 24)) {
      goto LABEL_90;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 25)) {
      goto LABEL_90;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_timestamp != *((double *)v4 + 4)) {
      goto LABEL_90;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_90;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_90;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v10 = *((_WORD *)v4 + 60);
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_uniqueIdentifier != *((void *)v4 + 5)) {
      goto LABEL_90;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x400) == 0) {
      goto LABEL_90;
    }
    if (self->_isExplicitTrack)
    {
      if (!*((unsigned char *)v4 + 114)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 114))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x400) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x1000) == 0) {
      goto LABEL_90;
    }
    if (self->_isMusicApp)
    {
      if (!*((unsigned char *)v4 + 116)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 116))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x1000) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_radioStationIdentifier != *((void *)v4 + 3)) {
      goto LABEL_90;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_90;
  }
  radioStationHash = self->_radioStationHash;
  if ((unint64_t)radioStationHash | *((void *)v4 + 10)
    && !-[NSString isEqual:](radioStationHash, "isEqual:"))
  {
    goto LABEL_90;
  }
  radioStationName = self->_radioStationName;
  if ((unint64_t)radioStationName | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](radioStationName, "isEqual:")) {
      goto LABEL_90;
    }
  }
  artworkDataDigest = self->_artworkDataDigest;
  if ((unint64_t)artworkDataDigest | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](artworkDataDigest, "isEqual:")) {
      goto LABEL_90;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x200) == 0) {
      goto LABEL_90;
    }
    if (self->_isAlwaysLive)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x200) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x100) == 0) {
      goto LABEL_90;
    }
    if (self->_isAdvertisement)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x100) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x800) != 0)
    {
      if (self->_isInTransition)
      {
        if (!*((unsigned char *)v4 + 115)) {
          goto LABEL_90;
        }
      }
      else if (*((unsigned char *)v4 + 115))
      {
        goto LABEL_90;
      }
      BOOL v14 = 1;
      goto LABEL_91;
    }
LABEL_90:
    BOOL v14 = 0;
    goto LABEL_91;
  }
  BOOL v14 = (*((_WORD *)v4 + 60) & 0x800) == 0;
LABEL_91:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v43 = [(NSString *)self->_album hash];
  NSUInteger v42 = [(NSString *)self->_artist hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    double duration = self->_duration;
    double v6 = -duration;
    if (duration >= 0.0) {
      double v6 = self->_duration;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    double elapsedTime = self->_elapsedTime;
    double v11 = -elapsedTime;
    if (elapsedTime >= 0.0) {
      double v11 = self->_elapsedTime;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x20) != 0)
  {
    float playbackRate = self->_playbackRate;
    float v16 = -playbackRate;
    if (playbackRate >= 0.0) {
      float v16 = self->_playbackRate;
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
  if ((has & 0x40) != 0)
  {
    uint64_t v39 = 2654435761 * self->_repeatMode;
    if ((has & 0x80) != 0) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((has & 0x80) != 0)
    {
LABEL_27:
      uint64_t v38 = 2654435761 * self->_shuffleMode;
      goto LABEL_30;
    }
  }
  uint64_t v38 = 0;
LABEL_30:
  unint64_t v40 = v14;
  unint64_t v41 = v4;
  if ((has & 8) != 0)
  {
    double timestamp = self->_timestamp;
    double v21 = -timestamp;
    if (timestamp >= 0.0) {
      double v21 = self->_timestamp;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  NSUInteger v37 = [(NSString *)self->_title hash];
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x10) != 0)
  {
    unint64_t v35 = 2654435761u * self->_uniqueIdentifier;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_40:
      uint64_t v25 = 2654435761 * self->_isExplicitTrack;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_41;
      }
LABEL_45:
      uint64_t v26 = 0;
      if ((v24 & 4) != 0) {
        goto LABEL_42;
      }
      goto LABEL_46;
    }
  }
  else
  {
    unint64_t v35 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_40;
    }
  }
  uint64_t v25 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_45;
  }
LABEL_41:
  uint64_t v26 = 2654435761 * self->_isMusicApp;
  if ((v24 & 4) != 0)
  {
LABEL_42:
    uint64_t v27 = 2654435761 * self->_radioStationIdentifier;
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v27 = 0;
LABEL_47:
  NSUInteger v28 = [(NSString *)self->_radioStationHash hash];
  NSUInteger v29 = [(NSString *)self->_radioStationName hash];
  uint64_t v30 = [(NSData *)self->_artworkDataDigest hash];
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    uint64_t v31 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_49;
    }
LABEL_52:
    uint64_t v32 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_50;
    }
LABEL_53:
    uint64_t v33 = 0;
    return v42 ^ v43 ^ v41 ^ v9 ^ v40 ^ v39 ^ v38 ^ v19 ^ v37 ^ v36 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33;
  }
  uint64_t v31 = 2654435761 * self->_isAlwaysLive;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_52;
  }
LABEL_49:
  uint64_t v32 = 2654435761 * self->_isAdvertisement;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_53;
  }
LABEL_50:
  uint64_t v33 = 2654435761 * self->_isInTransition;
  return v42 ^ v43 ^ v41 ^ v9 ^ v40 ^ v39 ^ v38 ^ v19 ^ v37 ^ v36 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 6))
  {
    -[_MRNowPlayingInfoProtobuf setAlbum:](self, "setAlbum:");
    id v4 = v8;
  }
  if (*((void *)v4 + 7))
  {
    -[_MRNowPlayingInfoProtobuf setArtist:](self, "setArtist:");
    id v4 = v8;
  }
  __int16 v5 = *((_WORD *)v4 + 60);
  if (v5)
  {
    self->_double duration = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 60);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_double elapsedTime = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 60);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_float playbackRate = *((float *)v4 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 60);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_uint64_t repeatMode = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 60);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_36:
  self->_uint64_t shuffleMode = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 60) & 8) != 0)
  {
LABEL_11:
    self->_double timestamp = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((void *)v4 + 13))
  {
    -[_MRNowPlayingInfoProtobuf setTitle:](self, "setTitle:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 60);
  if ((v6 & 0x10) != 0)
  {
    self->_uniqueIdentifier = *((void *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v6 = *((_WORD *)v4 + 60);
    if ((v6 & 0x400) == 0)
    {
LABEL_16:
      if ((v6 & 0x1000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_40;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x400) == 0)
  {
    goto LABEL_16;
  }
  self->_isExplicitTrack = *((unsigned char *)v4 + 114);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v6 = *((_WORD *)v4 + 60);
  if ((v6 & 0x1000) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_40:
  self->_isMusicApp = *((unsigned char *)v4 + 116);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 60) & 4) != 0)
  {
LABEL_18:
    self->_radioStationIdentifier = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_19:
  if (*((void *)v4 + 10))
  {
    -[_MRNowPlayingInfoProtobuf setRadioStationHash:](self, "setRadioStationHash:");
    id v4 = v8;
  }
  if (*((void *)v4 + 11))
  {
    -[_MRNowPlayingInfoProtobuf setRadioStationName:](self, "setRadioStationName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 8))
  {
    -[_MRNowPlayingInfoProtobuf setArtworkDataDigest:](self, "setArtworkDataDigest:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 60);
  if ((v7 & 0x200) != 0)
  {
    self->_isAlwaysLive = *((unsigned char *)v4 + 113);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v7 = *((_WORD *)v4 + 60);
    if ((v7 & 0x100) == 0)
    {
LABEL_27:
      if ((v7 & 0x800) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x100) == 0)
  {
    goto LABEL_27;
  }
  self->_isAdvertisement = *((unsigned char *)v4 + 112);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 60) & 0x800) != 0)
  {
LABEL_28:
    self->_isInTransition = *((unsigned char *)v4 + 115);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_29:
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)isExplicitTrack
{
  return self->_isExplicitTrack;
}

- (BOOL)isMusicApp
{
  return self->_isMusicApp;
}

- (int64_t)radioStationIdentifier
{
  return self->_radioStationIdentifier;
}

- (NSString)radioStationHash
{
  return self->_radioStationHash;
}

- (void)setRadioStationHash:(id)a3
{
}

- (NSString)radioStationName
{
  return self->_radioStationName;
}

- (void)setRadioStationName:(id)a3
{
}

- (NSData)artworkDataDigest
{
  return self->_artworkDataDigest;
}

- (void)setArtworkDataDigest:(id)a3
{
}

- (BOOL)isAlwaysLive
{
  return self->_isAlwaysLive;
}

- (BOOL)isAdvertisement
{
  return self->_isAdvertisement;
}

- (BOOL)isInTransition
{
  return self->_isInTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_radioStationName, 0);
  objc_storeStrong((id *)&self->_radioStationHash, 0);
  objc_storeStrong((id *)&self->_artworkDataDigest, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_album, 0);
}

@end