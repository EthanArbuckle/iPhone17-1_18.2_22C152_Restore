@interface _NMRNowPlayingInfoProtobuf
- (BOOL)hasAlbum;
- (BOOL)hasArtist;
- (BOOL)hasArtworkDataDigest;
- (BOOL)hasArtworkURL;
- (BOOL)hasCollectionInfoData;
- (BOOL)hasDuration;
- (BOOL)hasElapsedTime;
- (BOOL)hasIsAdvertisement;
- (BOOL)hasIsAlwaysLive;
- (BOOL)hasIsExplicitTrack;
- (BOOL)hasIsMusicApp;
- (BOOL)hasMediaType;
- (BOOL)hasPlaybackRate;
- (BOOL)hasPreferredPlaybackRate;
- (BOOL)hasRadioStationHash;
- (BOOL)hasRadioStationIdentifier;
- (BOOL)hasRadioStationName;
- (BOOL)hasRepeatMode;
- (BOOL)hasShuffleMode;
- (BOOL)hasStoreAdamID;
- (BOOL)hasStoreSubscriptionAdamID;
- (BOOL)hasTimestamp;
- (BOOL)hasTitle;
- (BOOL)hasUniqueIdentifier;
- (BOOL)hasUserInfoData;
- (BOOL)isAdvertisement;
- (BOOL)isAlwaysLive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitTrack;
- (BOOL)isMusicApp;
- (BOOL)readFrom:(id)a3;
- (BOOL)validateUniqueIdentifier:(id *)a3 error:(id *)a4;
- (NSData)artworkDataDigest;
- (NSData)collectionInfoData;
- (NSData)userInfoData;
- (NSString)album;
- (NSString)artist;
- (NSString)artworkURL;
- (NSString)mediaType;
- (NSString)radioStationHash;
- (NSString)radioStationName;
- (NSString)title;
- (double)duration;
- (double)elapsedTime;
- (double)timestamp;
- (float)playbackRate;
- (float)preferredPlaybackRate;
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
- (int64_t)storeAdamID;
- (int64_t)storeSubscriptionAdamID;
- (unint64_t)hash;
- (unint64_t)uniqueIdentifier;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtworkDataDigest:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setCollectionInfoData:(id)a3;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasElapsedTime:(BOOL)a3;
- (void)setHasIsAdvertisement:(BOOL)a3;
- (void)setHasIsAlwaysLive:(BOOL)a3;
- (void)setHasIsExplicitTrack:(BOOL)a3;
- (void)setHasIsMusicApp:(BOOL)a3;
- (void)setHasPlaybackRate:(BOOL)a3;
- (void)setHasPreferredPlaybackRate:(BOOL)a3;
- (void)setHasRadioStationIdentifier:(BOOL)a3;
- (void)setHasRepeatMode:(BOOL)a3;
- (void)setHasShuffleMode:(BOOL)a3;
- (void)setHasStoreAdamID:(BOOL)a3;
- (void)setHasStoreSubscriptionAdamID:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUniqueIdentifier:(BOOL)a3;
- (void)setIsAdvertisement:(BOOL)a3;
- (void)setIsAlwaysLive:(BOOL)a3;
- (void)setIsExplicitTrack:(BOOL)a3;
- (void)setIsMusicApp:(BOOL)a3;
- (void)setMediaType:(id)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPreferredPlaybackRate:(float)a3;
- (void)setRadioStationHash:(id)a3;
- (void)setRadioStationIdentifier:(int64_t)a3;
- (void)setRadioStationName:(id)a3;
- (void)setRepeatMode:(int)a3;
- (void)setShuffleMode:(int)a3;
- (void)setStoreAdamID:(int64_t)a3;
- (void)setStoreSubscriptionAdamID:(int64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueIdentifier:(unint64_t)a3;
- (void)setUserInfoData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRNowPlayingInfoProtobuf

- (BOOL)validateUniqueIdentifier:(id *)a3 error:(id *)a4
{
  return objc_opt_respondsToSelector() & 1;
}

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
  *(_WORD *)&self->_has |= 0x80u;
  self->_playbackRate = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPlaybackRate
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)repeatMode
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_repeatMode;
  }
  else {
    return 0;
  }
}

- (void)setRepeatMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRepeatMode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_100045340[a3];
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
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_shuffleMode;
  }
  else {
    return 0;
  }
}

- (void)setShuffleMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasShuffleMode
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_100045360[a3];
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
  *(_WORD *)&self->_has |= 0x20u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setUniqueIdentifier:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_uniqueIdentifier = a3;
}

- (void)setHasUniqueIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasUniqueIdentifier
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsExplicitTrack:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isExplicitTrack = a3;
}

- (void)setHasIsExplicitTrack:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsExplicitTrack
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setIsMusicApp:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isMusicApp = a3;
}

- (void)setHasIsMusicApp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasIsMusicApp
{
  return (*(_WORD *)&self->_has >> 14) & 1;
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
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isAlwaysLive = a3;
}

- (void)setHasIsAlwaysLive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsAlwaysLive
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setIsAdvertisement:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isAdvertisement = a3;
}

- (void)setHasIsAdvertisement:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsAdvertisement
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_storeSubscriptionAdamID = a3;
}

- (void)setHasStoreSubscriptionAdamID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasStoreSubscriptionAdamID
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPreferredPlaybackRate:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_preferredPlaybackRate = a3;
}

- (void)setHasPreferredPlaybackRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPreferredPlaybackRate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasMediaType
{
  return self->_mediaType != 0;
}

- (BOOL)hasCollectionInfoData
{
  return self->_collectionInfoData != 0;
}

- (BOOL)hasArtworkURL
{
  return self->_artworkURL != 0;
}

- (void)setStoreAdamID:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_storeAdamID = a3;
}

- (void)setHasStoreAdamID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasStoreAdamID
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasUserInfoData
{
  return self->_userInfoData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRNowPlayingInfoProtobuf;
  __int16 v3 = [(_NMRNowPlayingInfoProtobuf *)&v7 description];
  int v4 = [(_NMRNowPlayingInfoProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
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
    v24 = +[NSNumber numberWithDouble:self->_duration];
    [v5 setObject:v24 forKey:@"duration"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_45;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  v25 = +[NSNumber numberWithDouble:self->_elapsedTime];
  [v5 setObject:v25 forKey:@"elapsedTime"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(float *)&double v4 = self->_playbackRate;
  v26 = +[NSNumber numberWithFloat:v4];
  [v5 setObject:v26 forKey:@"playbackRate"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_58;
  }
LABEL_46:
  uint64_t repeatMode = self->_repeatMode;
  if (repeatMode >= 4)
  {
    v28 = +[NSString stringWithFormat:@"(unknown: %i)", self->_repeatMode];
  }
  else
  {
    v28 = off_100045340[repeatMode];
  }
  [v5 setObject:v28 forKey:@"repeatMode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_58:
  uint64_t shuffleMode = self->_shuffleMode;
  if (shuffleMode >= 4)
  {
    v36 = +[NSString stringWithFormat:@"(unknown: %i)", self->_shuffleMode];
  }
  else
  {
    v36 = off_100045360[shuffleMode];
  }
  [v5 setObject:v36 forKey:@"shuffleMode"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    v9 = +[NSNumber numberWithDouble:self->_timestamp];
    [v5 setObject:v9 forKey:@"timestamp"];
  }
LABEL_12:
  title = self->_title;
  if (title) {
    [v5 setObject:title forKey:@"title"];
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    v29 = +[NSNumber numberWithUnsignedLongLong:self->_uniqueIdentifier];
    [v5 setObject:v29 forKey:@"uniqueIdentifier"];

    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x2000) == 0)
    {
LABEL_16:
      if ((v11 & 0x4000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_16;
  }
  v30 = +[NSNumber numberWithBool:self->_isExplicitTrack];
  [v5 setObject:v30 forKey:@"isExplicitTrack"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x4000) == 0)
  {
LABEL_17:
    if ((v11 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_50:
  v31 = +[NSNumber numberWithBool:self->_isMusicApp];
  [v5 setObject:v31 forKey:@"isMusicApp"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    v12 = +[NSNumber numberWithLongLong:self->_radioStationIdentifier];
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
  if ((v16 & 0x1000) != 0)
  {
    v32 = +[NSNumber numberWithBool:self->_isAlwaysLive];
    [v5 setObject:v32 forKey:@"isAlwaysLive"];

    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x800) == 0)
    {
LABEL_27:
      if ((v16 & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_27;
  }
  v33 = +[NSNumber numberWithBool:self->_isAdvertisement];
  [v5 setObject:v33 forKey:@"isAdvertisement"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x10) == 0)
  {
LABEL_28:
    if ((v16 & 0x100) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_54:
  v34 = +[NSNumber numberWithLongLong:self->_storeSubscriptionAdamID];
  [v5 setObject:v34 forKey:@"storeSubscriptionAdamID"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_29:
    *(float *)&double v4 = self->_preferredPlaybackRate;
    v17 = +[NSNumber numberWithFloat:v4];
    [v5 setObject:v17 forKey:@"preferredPlaybackRate"];
  }
LABEL_30:
  mediaType = self->_mediaType;
  if (mediaType) {
    [v5 setObject:mediaType forKey:@"mediaType"];
  }
  collectionInfoData = self->_collectionInfoData;
  if (collectionInfoData) {
    [v5 setObject:collectionInfoData forKey:@"collectionInfoData"];
  }
  artworkURL = self->_artworkURL;
  if (artworkURL) {
    [v5 setObject:artworkURL forKey:@"artworkURL"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v21 = +[NSNumber numberWithLongLong:self->_storeAdamID];
    [v5 setObject:v21 forKey:@"storeAdamID"];
  }
  userInfoData = self->_userInfoData;
  if (userInfoData) {
    [v5 setObject:userInfoData forKey:@"userInfoData"];
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001FDB8((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_45;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteFloatField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
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
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x2000) == 0)
    {
LABEL_16:
      if ((v6 & 0x4000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_51:
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
  if ((v7 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_27:
      if ((v7 & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
LABEL_28:
    if ((v7 & 0x100) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_55:
  PBDataWriterWriteInt64Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_29:
    PBDataWriterWriteFloatField();
    id v4 = v8;
  }
LABEL_30:
  if (self->_mediaType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_collectionInfoData)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if (self->_artworkURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
  if (self->_userInfoData)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_album)
  {
    [v4 setAlbum:];
    id v4 = v8;
  }
  if (self->_artist)
  {
    [v8 setArtist:];
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_duration;
    *((_WORD *)v4 + 82) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_45;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = *(void *)&self->_elapsedTime;
  *((_WORD *)v4 + 82) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 28) = LODWORD(self->_playbackRate);
  *((_WORD *)v4 + 82) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 34) = self->_repeatMode;
  *((_WORD *)v4 + 82) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_47:
  *((_DWORD *)v4 + 35) = self->_shuffleMode;
  *((_WORD *)v4 + 82) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    *((void *)v4 + 6) = *(void *)&self->_timestamp;
    *((_WORD *)v4 + 82) |= 0x20u;
  }
LABEL_12:
  if (self->_title)
  {
    [v8 setTitle:];
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((void *)v4 + 7) = self->_uniqueIdentifier;
    *((_WORD *)v4 + 82) |= 0x40u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x2000) == 0)
    {
LABEL_16:
      if ((v6 & 0x4000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_16;
  }
  *((unsigned char *)v4 + 162) = self->_isExplicitTrack;
  *((_WORD *)v4 + 82) |= 0x2000u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_51:
  *((unsigned char *)v4 + 163) = self->_isMusicApp;
  *((_WORD *)v4 + 82) |= 0x4000u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    *((void *)v4 + 3) = self->_radioStationIdentifier;
    *((_WORD *)v4 + 82) |= 4u;
  }
LABEL_19:
  if (self->_radioStationHash)
  {
    [v8 setRadioStationHash:];
    id v4 = v8;
  }
  if (self->_radioStationName)
  {
    [v8 setRadioStationName:];
    id v4 = v8;
  }
  if (self->_artworkDataDigest)
  {
    [v8 setArtworkDataDigest:];
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x1000) != 0)
  {
    *((unsigned char *)v4 + 161) = self->_isAlwaysLive;
    *((_WORD *)v4 + 82) |= 0x1000u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_27:
      if ((v7 & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_27;
  }
  *((unsigned char *)v4 + 160) = self->_isAdvertisement;
  *((_WORD *)v4 + 82) |= 0x800u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
LABEL_28:
    if ((v7 & 0x100) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_55:
  *((void *)v4 + 5) = self->_storeSubscriptionAdamID;
  *((_WORD *)v4 + 82) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_29:
    *((_DWORD *)v4 + 29) = LODWORD(self->_preferredPlaybackRate);
    *((_WORD *)v4 + 82) |= 0x100u;
  }
LABEL_30:
  if (self->_mediaType)
  {
    [v8 setMediaType:];
    id v4 = v8;
  }
  if (self->_collectionInfoData)
  {
    [v8 setCollectionInfoData:];
    id v4 = v8;
  }
  if (self->_artworkURL)
  {
    [v8 setArtworkURL:];
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_storeAdamID;
    *((_WORD *)v4 + 82) |= 8u;
  }
  if (self->_userInfoData)
  {
    [v8 setUserInfoData:];
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_album copyWithZone:a3];
  __int16 v7 = (void *)v5[8];
  v5[8] = v6;

  id v8 = [(NSString *)self->_artist copyWithZone:a3];
  v9 = (void *)v5[9];
  v5[9] = v8;

  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = *(void *)&self->_duration;
    *((_WORD *)v5 + 82) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = *(void *)&self->_elapsedTime;
  *((_WORD *)v5 + 82) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 28) = LODWORD(self->_playbackRate);
  *((_WORD *)v5 + 82) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 34) = self->_repeatMode;
  *((_WORD *)v5 + 82) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_25:
  *((_DWORD *)v5 + 35) = self->_shuffleMode;
  *((_WORD *)v5 + 82) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v5[6] = *(void *)&self->_timestamp;
    *((_WORD *)v5 + 82) |= 0x20u;
  }
LABEL_8:
  id v11 = [(NSString *)self->_title copyWithZone:a3];
  v12 = (void *)v5[18];
  v5[18] = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x40) != 0)
  {
    v5[7] = self->_uniqueIdentifier;
    *((_WORD *)v5 + 82) |= 0x40u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x2000) == 0)
    {
LABEL_10:
      if ((v13 & 0x4000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_10;
  }
  *((unsigned char *)v5 + 162) = self->_isExplicitTrack;
  *((_WORD *)v5 + 82) |= 0x2000u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x4000) == 0)
  {
LABEL_11:
    if ((v13 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_29:
  *((unsigned char *)v5 + 163) = self->_isMusicApp;
  *((_WORD *)v5 + 82) |= 0x4000u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    v5[3] = self->_radioStationIdentifier;
    *((_WORD *)v5 + 82) |= 4u;
  }
LABEL_13:
  id v14 = [(NSString *)self->_radioStationHash copyWithZone:a3];
  v15 = (void *)v5[15];
  v5[15] = v14;

  id v16 = [(NSString *)self->_radioStationName copyWithZone:a3];
  v17 = (void *)v5[16];
  v5[16] = v16;

  id v18 = [(NSData *)self->_artworkDataDigest copyWithZone:a3];
  v19 = (void *)v5[10];
  v5[10] = v18;

  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x1000) != 0)
  {
    *((unsigned char *)v5 + 161) = self->_isAlwaysLive;
    *((_WORD *)v5 + 82) |= 0x1000u;
    __int16 v20 = (__int16)self->_has;
    if ((v20 & 0x800) == 0)
    {
LABEL_15:
      if ((v20 & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_15;
  }
  *((unsigned char *)v5 + 160) = self->_isAdvertisement;
  *((_WORD *)v5 + 82) |= 0x800u;
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x10) == 0)
  {
LABEL_16:
    if ((v20 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_33:
  v5[5] = self->_storeSubscriptionAdamID;
  *((_WORD *)v5 + 82) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_17:
    *((_DWORD *)v5 + 29) = LODWORD(self->_preferredPlaybackRate);
    *((_WORD *)v5 + 82) |= 0x100u;
  }
LABEL_18:
  id v21 = [(NSString *)self->_mediaType copyWithZone:a3];
  v22 = (void *)v5[13];
  v5[13] = v21;

  id v23 = [(NSData *)self->_collectionInfoData copyWithZone:a3];
  v24 = (void *)v5[12];
  v5[12] = v23;

  id v25 = [(NSString *)self->_artworkURL copyWithZone:a3];
  v26 = (void *)v5[11];
  v5[11] = v25;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v5[4] = self->_storeAdamID;
    *((_WORD *)v5 + 82) |= 8u;
  }
  id v27 = [(NSData *)self->_userInfoData copyWithZone:a3];
  v28 = (void *)v5[19];
  v5[19] = v27;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_110;
  }
  album = self->_album;
  if ((unint64_t)album | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](album, "isEqual:")) {
      goto LABEL_110;
    }
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](artist, "isEqual:")) {
      goto LABEL_110;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 82);
  if (has)
  {
    if ((v8 & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_110;
    }
  }
  else if (v8)
  {
    goto LABEL_110;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_elapsedTime != *((double *)v4 + 2)) {
      goto LABEL_110;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_110;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_playbackRate != *((float *)v4 + 28)) {
      goto LABEL_110;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x200) == 0 || self->_repeatMode != *((_DWORD *)v4 + 34)) {
      goto LABEL_110;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x200) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x400) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 35)) {
      goto LABEL_110;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x400) != 0)
  {
    goto LABEL_110;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_timestamp != *((double *)v4 + 6)) {
      goto LABEL_110;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_110;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_110;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v10 = *((_WORD *)v4 + 82);
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_uniqueIdentifier != *((void *)v4 + 7)) {
      goto LABEL_110;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_110;
  }
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x2000) == 0) {
      goto LABEL_110;
    }
    if (self->_isExplicitTrack)
    {
      if (!*((unsigned char *)v4 + 162)) {
        goto LABEL_110;
      }
    }
    else if (*((unsigned char *)v4 + 162))
    {
      goto LABEL_110;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x2000) != 0)
  {
    goto LABEL_110;
  }
  if ((has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x4000) == 0) {
      goto LABEL_110;
    }
    if (self->_isMusicApp)
    {
      if (!*((unsigned char *)v4 + 163)) {
        goto LABEL_110;
      }
    }
    else if (*((unsigned char *)v4 + 163))
    {
      goto LABEL_110;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x4000) != 0)
  {
    goto LABEL_110;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_radioStationIdentifier != *((void *)v4 + 3)) {
      goto LABEL_110;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_110;
  }
  radioStationHash = self->_radioStationHash;
  if ((unint64_t)radioStationHash | *((void *)v4 + 15)
    && !-[NSString isEqual:](radioStationHash, "isEqual:"))
  {
    goto LABEL_110;
  }
  radioStationName = self->_radioStationName;
  if ((unint64_t)radioStationName | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](radioStationName, "isEqual:")) {
      goto LABEL_110;
    }
  }
  artworkDataDigest = self->_artworkDataDigest;
  if ((unint64_t)artworkDataDigest | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](artworkDataDigest, "isEqual:")) {
      goto LABEL_110;
    }
  }
  __int16 v14 = (__int16)self->_has;
  __int16 v15 = *((_WORD *)v4 + 82);
  if ((v14 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x1000) == 0) {
      goto LABEL_110;
    }
    if (self->_isAlwaysLive)
    {
      if (!*((unsigned char *)v4 + 161)) {
        goto LABEL_110;
      }
    }
    else if (*((unsigned char *)v4 + 161))
    {
      goto LABEL_110;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x1000) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x800) != 0)
    {
      if (self->_isAdvertisement)
      {
        if (!*((unsigned char *)v4 + 160)) {
          goto LABEL_110;
        }
        goto LABEL_87;
      }
      if (!*((unsigned char *)v4 + 160)) {
        goto LABEL_87;
      }
    }
LABEL_110:
    unsigned __int8 v21 = 0;
    goto LABEL_111;
  }
  if ((*((_WORD *)v4 + 82) & 0x800) != 0) {
    goto LABEL_110;
  }
LABEL_87:
  if ((v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_storeSubscriptionAdamID != *((void *)v4 + 5)) {
      goto LABEL_110;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_110;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x100) == 0 || self->_preferredPlaybackRate != *((float *)v4 + 29)) {
      goto LABEL_110;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x100) != 0)
  {
    goto LABEL_110;
  }
  mediaType = self->_mediaType;
  if ((unint64_t)mediaType | *((void *)v4 + 13) && !-[NSString isEqual:](mediaType, "isEqual:")) {
    goto LABEL_110;
  }
  collectionInfoData = self->_collectionInfoData;
  if ((unint64_t)collectionInfoData | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](collectionInfoData, "isEqual:")) {
      goto LABEL_110;
    }
  }
  artworkURL = self->_artworkURL;
  if ((unint64_t)artworkURL | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](artworkURL, "isEqual:")) {
      goto LABEL_110;
    }
  }
  __int16 v19 = *((_WORD *)v4 + 82);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v19 & 8) == 0 || self->_storeAdamID != *((void *)v4 + 4)) {
      goto LABEL_110;
    }
  }
  else if ((v19 & 8) != 0)
  {
    goto LABEL_110;
  }
  userInfoData = self->_userInfoData;
  if ((unint64_t)userInfoData | *((void *)v4 + 19)) {
    unsigned __int8 v21 = -[NSData isEqual:](userInfoData, "isEqual:");
  }
  else {
    unsigned __int8 v21 = 1;
  }
LABEL_111:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v52 = [(NSString *)self->_album hash];
  NSUInteger v51 = [(NSString *)self->_artist hash];
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
  if ((has & 0x80) != 0)
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
  if ((has & 0x200) != 0)
  {
    uint64_t v49 = 2654435761 * self->_repeatMode;
    if ((has & 0x400) != 0) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v49 = 0;
    if ((has & 0x400) != 0)
    {
LABEL_27:
      uint64_t v48 = 2654435761 * self->_shuffleMode;
      goto LABEL_30;
    }
  }
  uint64_t v48 = 0;
LABEL_30:
  unint64_t v50 = v14;
  if ((has & 0x20) != 0)
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
  unint64_t v47 = v19;
  NSUInteger v46 = [(NSString *)self->_title hash];
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x40) != 0)
  {
    unint64_t v45 = 2654435761u * self->_uniqueIdentifier;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_40:
      uint64_t v44 = 2654435761 * self->_isExplicitTrack;
      if ((*(_WORD *)&self->_has & 0x4000) != 0) {
        goto LABEL_41;
      }
LABEL_45:
      uint64_t v43 = 0;
      if ((v24 & 4) != 0) {
        goto LABEL_42;
      }
      goto LABEL_46;
    }
  }
  else
  {
    unint64_t v45 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_40;
    }
  }
  uint64_t v44 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) == 0) {
    goto LABEL_45;
  }
LABEL_41:
  uint64_t v43 = 2654435761 * self->_isMusicApp;
  if ((v24 & 4) != 0)
  {
LABEL_42:
    uint64_t v42 = 2654435761 * self->_radioStationIdentifier;
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v42 = 0;
LABEL_47:
  NSUInteger v41 = [(NSString *)self->_radioStationHash hash];
  NSUInteger v40 = [(NSString *)self->_radioStationName hash];
  unint64_t v39 = (unint64_t)[(NSData *)self->_artworkDataDigest hash];
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x1000) != 0)
  {
    uint64_t v38 = 2654435761 * self->_isAlwaysLive;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_49:
      uint64_t v26 = 2654435761 * self->_isAdvertisement;
      if ((v25 & 0x10) != 0) {
        goto LABEL_50;
      }
LABEL_57:
      uint64_t v27 = 0;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_51;
      }
LABEL_58:
      unint64_t v32 = 0;
      goto LABEL_61;
    }
  }
  else
  {
    uint64_t v38 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_49;
    }
  }
  uint64_t v26 = 0;
  if ((v25 & 0x10) == 0) {
    goto LABEL_57;
  }
LABEL_50:
  uint64_t v27 = 2654435761 * self->_storeSubscriptionAdamID;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_58;
  }
LABEL_51:
  float preferredPlaybackRate = self->_preferredPlaybackRate;
  float v29 = -preferredPlaybackRate;
  if (preferredPlaybackRate >= 0.0) {
    float v29 = self->_preferredPlaybackRate;
  }
  float v30 = floorf(v29 + 0.5);
  float v31 = (float)(v29 - v30) * 1.8447e19;
  unint64_t v32 = 2654435761u * (unint64_t)fmodf(v30, 1.8447e19);
  if (v31 >= 0.0)
  {
    if (v31 > 0.0) {
      v32 += (unint64_t)v31;
    }
  }
  else
  {
    v32 -= (unint64_t)fabsf(v31);
  }
LABEL_61:
  NSUInteger v33 = [(NSString *)self->_mediaType hash];
  unint64_t v34 = (unint64_t)[(NSData *)self->_collectionInfoData hash];
  NSUInteger v35 = [(NSString *)self->_artworkURL hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v36 = 2654435761 * self->_storeAdamID;
  }
  else {
    uint64_t v36 = 0;
  }
  return v51 ^ v52 ^ v4 ^ v9 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v26 ^ v27 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ (unint64_t)[(NSData *)self->_userInfoData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 8))
  {
    -[_NMRNowPlayingInfoProtobuf setAlbum:](self, "setAlbum:");
    id v4 = v8;
  }
  if (*((void *)v4 + 9))
  {
    -[_NMRNowPlayingInfoProtobuf setArtist:](self, "setArtist:");
    id v4 = v8;
  }
  __int16 v5 = *((_WORD *)v4 + 82);
  if (v5)
  {
    self->_double duration = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 82);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_45;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_double elapsedTime = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_float playbackRate = *((float *)v4 + 28);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_uint64_t repeatMode = *((_DWORD *)v4 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_47:
  self->_uint64_t shuffleMode = *((_DWORD *)v4 + 35);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 82) & 0x20) != 0)
  {
LABEL_11:
    self->_double timestamp = *((double *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_12:
  if (*((void *)v4 + 18))
  {
    -[_NMRNowPlayingInfoProtobuf setTitle:](self, "setTitle:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 82);
  if ((v6 & 0x40) != 0)
  {
    self->_uniqueIdentifier = *((void *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v6 = *((_WORD *)v4 + 82);
    if ((v6 & 0x2000) == 0)
    {
LABEL_16:
      if ((v6 & 0x4000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_51;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x2000) == 0)
  {
    goto LABEL_16;
  }
  self->_isExplicitTrack = *((unsigned char *)v4 + 162);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v6 = *((_WORD *)v4 + 82);
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_51:
  self->_isMusicApp = *((unsigned char *)v4 + 163);
  *(_WORD *)&self->_has |= 0x4000u;
  if ((*((_WORD *)v4 + 82) & 4) != 0)
  {
LABEL_18:
    self->_radioStationIdentifier = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_19:
  if (*((void *)v4 + 15))
  {
    -[_NMRNowPlayingInfoProtobuf setRadioStationHash:](self, "setRadioStationHash:");
    id v4 = v8;
  }
  if (*((void *)v4 + 16))
  {
    -[_NMRNowPlayingInfoProtobuf setRadioStationName:](self, "setRadioStationName:");
    id v4 = v8;
  }
  if (*((void *)v4 + 10))
  {
    -[_NMRNowPlayingInfoProtobuf setArtworkDataDigest:](self, "setArtworkDataDigest:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 82);
  if ((v7 & 0x1000) != 0)
  {
    self->_isAlwaysLive = *((unsigned char *)v4 + 161);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v7 = *((_WORD *)v4 + 82);
    if ((v7 & 0x800) == 0)
    {
LABEL_27:
      if ((v7 & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_55;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x800) == 0)
  {
    goto LABEL_27;
  }
  self->_isAdvertisement = *((unsigned char *)v4 + 160);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v7 = *((_WORD *)v4 + 82);
  if ((v7 & 0x10) == 0)
  {
LABEL_28:
    if ((v7 & 0x100) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_55:
  self->_storeSubscriptionAdamID = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 82) & 0x100) != 0)
  {
LABEL_29:
    self->_float preferredPlaybackRate = *((float *)v4 + 29);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_30:
  if (*((void *)v4 + 13))
  {
    -[_NMRNowPlayingInfoProtobuf setMediaType:](self, "setMediaType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 12))
  {
    -[_NMRNowPlayingInfoProtobuf setCollectionInfoData:](self, "setCollectionInfoData:");
    id v4 = v8;
  }
  if (*((void *)v4 + 11))
  {
    -[_NMRNowPlayingInfoProtobuf setArtworkURL:](self, "setArtworkURL:");
    id v4 = v8;
  }
  if ((*((_WORD *)v4 + 82) & 8) != 0)
  {
    self->_storeAdamID = *((void *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 19))
  {
    -[_NMRNowPlayingInfoProtobuf setUserInfoData:](self, "setUserInfoData:");
    id v4 = v8;
  }
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

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (float)preferredPlaybackRate
{
  return self->_preferredPlaybackRate;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (NSData)collectionInfoData
{
  return self->_collectionInfoData;
}

- (void)setCollectionInfoData:(id)a3
{
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (int64_t)storeAdamID
{
  return self->_storeAdamID;
}

- (NSData)userInfoData
{
  return self->_userInfoData;
}

- (void)setUserInfoData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_radioStationName, 0);
  objc_storeStrong((id *)&self->_radioStationHash, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_collectionInfoData, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_artworkDataDigest, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_album, 0);
}

@end