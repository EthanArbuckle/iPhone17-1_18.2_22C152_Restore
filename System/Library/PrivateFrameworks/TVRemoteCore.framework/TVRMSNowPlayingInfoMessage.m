@interface TVRMSNowPlayingInfoMessage
- (BOOL)canSkipNext;
- (BOOL)canSkipPrevious;
- (BOOL)canWishlist;
- (BOOL)hasAlbumName;
- (BOOL)hasArtistName;
- (BOOL)hasCanSkipNext;
- (BOOL)hasCanSkipPrevious;
- (BOOL)hasCanWishlist;
- (BOOL)hasChapterData;
- (BOOL)hasDatabaseID;
- (BOOL)hasHasChapterData;
- (BOOL)hasItemID;
- (BOOL)hasLikeable;
- (BOOL)hasLikedState;
- (BOOL)hasMediaKind;
- (BOOL)hasPlaybackState;
- (BOOL)hasRevisionNumber;
- (BOOL)hasScrubbableState;
- (BOOL)hasTimeRemaining;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalDuration;
- (BOOL)hasTrackName;
- (BOOL)isEqual:(id)a3;
- (BOOL)likeable;
- (BOOL)readFrom:(id)a3;
- (NSString)albumName;
- (NSString)artistName;
- (NSString)trackName;
- (double)timeRemaining;
- (double)timestamp;
- (double)totalDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)likedState;
- (int)mediaKind;
- (int)playbackState;
- (int)scrubbableState;
- (unint64_t)databaseID;
- (unint64_t)hash;
- (unint64_t)itemID;
- (unsigned)revisionNumber;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setCanSkipNext:(BOOL)a3;
- (void)setCanSkipPrevious:(BOOL)a3;
- (void)setCanWishlist:(BOOL)a3;
- (void)setDatabaseID:(unint64_t)a3;
- (void)setHasCanSkipNext:(BOOL)a3;
- (void)setHasCanSkipPrevious:(BOOL)a3;
- (void)setHasCanWishlist:(BOOL)a3;
- (void)setHasChapterData:(BOOL)a3;
- (void)setHasDatabaseID:(BOOL)a3;
- (void)setHasHasChapterData:(BOOL)a3;
- (void)setHasItemID:(BOOL)a3;
- (void)setHasLikeable:(BOOL)a3;
- (void)setHasLikedState:(BOOL)a3;
- (void)setHasMediaKind:(BOOL)a3;
- (void)setHasPlaybackState:(BOOL)a3;
- (void)setHasRevisionNumber:(BOOL)a3;
- (void)setHasScrubbableState:(BOOL)a3;
- (void)setHasTimeRemaining:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalDuration:(BOOL)a3;
- (void)setItemID:(unint64_t)a3;
- (void)setLikeable:(BOOL)a3;
- (void)setLikedState:(int)a3;
- (void)setMediaKind:(int)a3;
- (void)setPlaybackState:(int)a3;
- (void)setRevisionNumber:(unsigned int)a3;
- (void)setScrubbableState:(int)a3;
- (void)setTimeRemaining:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setTotalDuration:(double)a3;
- (void)setTrackName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSNowPlayingInfoMessage

- (void)setItemID:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_itemID = a3;
}

- (void)setHasItemID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasItemID
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDatabaseID:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_databaseID = a3;
}

- (void)setHasDatabaseID:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDatabaseID
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasTrackName
{
  return self->_trackName != 0;
}

- (BOOL)hasArtistName
{
  return self->_artistName != 0;
}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
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

- (void)setTimeRemaining:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timeRemaining = a3;
}

- (void)setHasTimeRemaining:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimeRemaining
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTotalDuration:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_totalDuration = a3;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTotalDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRevisionNumber:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_revisionNumber = a3;
}

- (void)setHasRevisionNumber:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRevisionNumber
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMediaKind:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mediaKind = a3;
}

- (void)setHasMediaKind:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMediaKind
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPlaybackState:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_playbackState = a3;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPlaybackState
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setLikedState:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_likedState = a3;
}

- (void)setHasLikedState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLikedState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setScrubbableState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_scrubbableState = a3;
}

- (void)setHasScrubbableState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasScrubbableState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCanSkipNext:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_canSkipNext = a3;
}

- (void)setHasCanSkipNext:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasCanSkipNext
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCanSkipPrevious:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_canSkipPrevious = a3;
}

- (void)setHasCanSkipPrevious:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasCanSkipPrevious
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setLikeable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_likeable = a3;
}

- (void)setHasLikeable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasLikeable
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setCanWishlist:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_canWishlist = a3;
}

- (void)setHasCanWishlist:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasCanWishlist
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasChapterData:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_hasChapterData = a3;
}

- (void)setHasHasChapterData:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasHasChapterData
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSNowPlayingInfoMessage;
  v4 = [(TVRMSNowPlayingInfoMessage *)&v8 description];
  v5 = [(TVRMSNowPlayingInfoMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_itemID];
    [v3 setObject:v5 forKey:@"itemID"];

    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_databaseID];
    [v3 setObject:v6 forKey:@"databaseID"];
  }
  trackName = self->_trackName;
  if (trackName) {
    [v3 setObject:trackName forKey:@"trackName"];
  }
  artistName = self->_artistName;
  if (artistName) {
    [v3 setObject:artistName forKey:@"artistName"];
  }
  albumName = self->_albumName;
  if (albumName) {
    [v3 setObject:albumName forKey:@"albumName"];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    v13 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v13 forKey:@"timestamp"];

    __int16 v10 = (__int16)self->_has;
    if ((v10 & 4) == 0)
    {
LABEL_13:
      if ((v10 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_30;
    }
  }
  else if ((v10 & 4) == 0)
  {
    goto LABEL_13;
  }
  v14 = [NSNumber numberWithDouble:self->_timeRemaining];
  [v3 setObject:v14 forKey:@"timeRemaining"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_14:
    if ((v10 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  v15 = [NSNumber numberWithDouble:self->_totalDuration];
  [v3 setObject:v15 forKey:@"totalDuration"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_15:
    if ((v10 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  v16 = [NSNumber numberWithUnsignedInt:self->_revisionNumber];
  [v3 setObject:v16 forKey:@"revisionNumber"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_16:
    if ((v10 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  v17 = [NSNumber numberWithInt:self->_mediaKind];
  [v3 setObject:v17 forKey:@"mediaKind"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x80) == 0)
  {
LABEL_17:
    if ((v10 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  v18 = [NSNumber numberWithInt:self->_playbackState];
  [v3 setObject:v18 forKey:@"playbackState"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_18:
    if ((v10 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  v19 = [NSNumber numberWithInt:self->_likedState];
  [v3 setObject:v19 forKey:@"likedState"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_19:
    if ((v10 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_35:
  v20 = [NSNumber numberWithInt:self->_scrubbableState];
  [v3 setObject:v20 forKey:@"scrubbableState"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x400) == 0)
  {
LABEL_20:
    if ((v10 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = [NSNumber numberWithBool:self->_canSkipNext];
  [v3 setObject:v21 forKey:@"canSkipNext"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x800) == 0)
  {
LABEL_21:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  v22 = [NSNumber numberWithBool:self->_canSkipPrevious];
  [v3 setObject:v22 forKey:@"canSkipPrevious"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x4000) == 0)
  {
LABEL_22:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  v23 = [NSNumber numberWithBool:self->_likeable];
  [v3 setObject:v23 forKey:@"likeable"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x1000) == 0)
  {
LABEL_23:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_39:
  v24 = [NSNumber numberWithBool:self->_canWishlist];
  [v3 setObject:v24 forKey:@"canWishlist"];

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_24:
    v11 = [NSNumber numberWithBool:self->_hasChapterData];
    [v3 setObject:v11 forKey:@"hasChapterData"];
  }
LABEL_25:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSNowPlayingInfoMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_trackName) {
    PBDataWriterWriteStringField();
  }
  if (self->_artistName) {
    PBDataWriterWriteStringField();
  }
  if (self->_albumName) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_13:
      if ((v5 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_30;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteDoubleField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x80) == 0)
  {
LABEL_17:
    if ((v5 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
LABEL_18:
    if ((v5 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x200) == 0)
  {
LABEL_19:
    if ((v5 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x400) == 0)
  {
LABEL_20:
    if ((v5 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x800) == 0)
  {
LABEL_21:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x4000) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
LABEL_24:
  }
    PBDataWriterWriteBOOLField();
LABEL_25:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_itemID;
    *((_WORD *)v4 + 52) |= 2u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    v4[1] = self->_databaseID;
    *((_WORD *)v4 + 52) |= 1u;
  }
  v7 = v4;
  if (self->_trackName)
  {
    objc_msgSend(v4, "setTrackName:");
    v4 = v7;
  }
  if (self->_artistName)
  {
    objc_msgSend(v7, "setArtistName:");
    v4 = v7;
  }
  if (self->_albumName)
  {
    objc_msgSend(v7, "setAlbumName:");
    v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[4] = *(void *)&self->_timestamp;
    *((_WORD *)v4 + 52) |= 8u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_13;
  }
  v4[3] = *(void *)&self->_timeRemaining;
  *((_WORD *)v4 + 52) |= 4u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[5] = *(void *)&self->_totalDuration;
  *((_WORD *)v4 + 52) |= 0x10u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_15:
    if ((v6 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 19) = self->_revisionNumber;
  *((_WORD *)v4 + 52) |= 0x100u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 17) = self->_mediaKind;
  *((_WORD *)v4 + 52) |= 0x40u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_17:
    if ((v6 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 18) = self->_playbackState;
  *((_WORD *)v4 + 52) |= 0x80u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_18:
    if ((v6 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 16) = self->_likedState;
  *((_WORD *)v4 + 52) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_19:
    if ((v6 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 20) = self->_scrubbableState;
  *((_WORD *)v4 + 52) |= 0x200u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_20:
    if ((v6 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)v4 + 96) = self->_canSkipNext;
  *((_WORD *)v4 + 52) |= 0x400u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_21:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((unsigned char *)v4 + 97) = self->_canSkipPrevious;
  *((_WORD *)v4 + 52) |= 0x800u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)v4 + 100) = self->_likeable;
  *((_WORD *)v4 + 52) |= 0x4000u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_23:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_39:
  *((unsigned char *)v4 + 98) = self->_canWishlist;
  *((_WORD *)v4 + 52) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_24:
    *((unsigned char *)v4 + 99) = self->_hasChapterData;
    *((_WORD *)v4 + 52) |= 0x2000u;
  }
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_itemID;
    *(_WORD *)(v5 + 104) |= 2u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_databaseID;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_trackName copyWithZone:a3];
  v9 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v8;

  uint64_t v10 = [(NSString *)self->_artistName copyWithZone:a3];
  v11 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_albumName copyWithZone:a3];
  v13 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v12;

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    *(double *)(v6 + 32) = self->_timestamp;
    *(_WORD *)(v6 + 104) |= 8u;
    __int16 v14 = (__int16)self->_has;
    if ((v14 & 4) == 0)
    {
LABEL_7:
      if ((v14 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_22;
    }
  }
  else if ((v14 & 4) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v6 + 24) = self->_timeRemaining;
  *(_WORD *)(v6 + 104) |= 4u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x10) == 0)
  {
LABEL_8:
    if ((v14 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(double *)(v6 + 40) = self->_totalDuration;
  *(_WORD *)(v6 + 104) |= 0x10u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x100) == 0)
  {
LABEL_9:
    if ((v14 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v6 + 76) = self->_revisionNumber;
  *(_WORD *)(v6 + 104) |= 0x100u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x40) == 0)
  {
LABEL_10:
    if ((v14 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v6 + 68) = self->_mediaKind;
  *(_WORD *)(v6 + 104) |= 0x40u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x80) == 0)
  {
LABEL_11:
    if ((v14 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v6 + 72) = self->_playbackState;
  *(_WORD *)(v6 + 104) |= 0x80u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x20) == 0)
  {
LABEL_12:
    if ((v14 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v6 + 64) = self->_likedState;
  *(_WORD *)(v6 + 104) |= 0x20u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x200) == 0)
  {
LABEL_13:
    if ((v14 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v6 + 80) = self->_scrubbableState;
  *(_WORD *)(v6 + 104) |= 0x200u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x400) == 0)
  {
LABEL_14:
    if ((v14 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(unsigned char *)(v6 + 96) = self->_canSkipNext;
  *(_WORD *)(v6 + 104) |= 0x400u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x800) == 0)
  {
LABEL_15:
    if ((v14 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(unsigned char *)(v6 + 97) = self->_canSkipPrevious;
  *(_WORD *)(v6 + 104) |= 0x800u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x4000) == 0)
  {
LABEL_16:
    if ((v14 & 0x1000) == 0) {
      goto LABEL_17;
    }
LABEL_31:
    *(unsigned char *)(v6 + 98) = self->_canWishlist;
    *(_WORD *)(v6 + 104) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 0x2000) == 0) {
      return (id)v6;
    }
    goto LABEL_18;
  }
LABEL_30:
  *(unsigned char *)(v6 + 100) = self->_likeable;
  *(_WORD *)(v6 + 104) |= 0x4000u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x1000) != 0) {
    goto LABEL_31;
  }
LABEL_17:
  if ((v14 & 0x2000) != 0)
  {
LABEL_18:
    *(unsigned char *)(v6 + 99) = self->_hasChapterData;
    *(_WORD *)(v6 + 104) |= 0x2000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_83;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_itemID != *((void *)v4 + 2)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 2) != 0)
  {
LABEL_83:
    BOOL v12 = 0;
    goto LABEL_84;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_databaseID != *((void *)v4 + 1)) {
      goto LABEL_83;
    }
  }
  else if (v6)
  {
    goto LABEL_83;
  }
  trackName = self->_trackName;
  if ((unint64_t)trackName | *((void *)v4 + 11) && !-[NSString isEqual:](trackName, "isEqual:")) {
    goto LABEL_83;
  }
  artistName = self->_artistName;
  if ((unint64_t)artistName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](artistName, "isEqual:")) {
      goto LABEL_83;
    }
  }
  albumName = self->_albumName;
  if ((unint64_t)albumName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](albumName, "isEqual:")) {
      goto LABEL_83;
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 52);
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_timestamp != *((double *)v4 + 4)) {
      goto LABEL_83;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_83;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_timeRemaining != *((double *)v4 + 3)) {
      goto LABEL_83;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_totalDuration != *((double *)v4 + 5)) {
      goto LABEL_83;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x100) == 0 || self->_revisionNumber != *((_DWORD *)v4 + 19)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x100) != 0)
  {
    goto LABEL_83;
  }
  if ((v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_mediaKind != *((_DWORD *)v4 + 17)) {
      goto LABEL_83;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_playbackState != *((_DWORD *)v4 + 18)) {
      goto LABEL_83;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_likedState != *((_DWORD *)v4 + 16)) {
      goto LABEL_83;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x200) == 0 || self->_scrubbableState != *((_DWORD *)v4 + 20)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x200) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x400) == 0 || self->_canSkipNext != v4[96]) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x400) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x800) == 0 || self->_canSkipPrevious != v4[97]) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x800) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x4000) == 0 || self->_likeable != v4[100]) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x4000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x1000) == 0 || self->_canWishlist != v4[98]) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 52) & 0x1000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x2000) == 0 || self->_hasChapterData != v4[99]) {
      goto LABEL_83;
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = (v11 & 0x2000) == 0;
  }
LABEL_84:

  return v12;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    unint64_t v4 = 2654435761u * self->_itemID;
    if (has) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if (has)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_databaseID;
      goto LABEL_6;
    }
  }
  unint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_trackName hash];
  NSUInteger v7 = [(NSString *)self->_artistName hash];
  NSUInteger v8 = [(NSString *)self->_albumName hash];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) != 0)
  {
    double timestamp = self->_timestamp;
    double v12 = -timestamp;
    if (timestamp >= 0.0) {
      double v12 = self->_timestamp;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((v9 & 4) != 0)
  {
    double timeRemaining = self->_timeRemaining;
    double v17 = -timeRemaining;
    if (timeRemaining >= 0.0) {
      double v17 = self->_timeRemaining;
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
  if ((v9 & 0x10) != 0)
  {
    double totalDuration = self->_totalDuration;
    double v22 = -totalDuration;
    if (totalDuration >= 0.0) {
      double v22 = self->_totalDuration;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((v9 & 0x100) != 0)
  {
    uint64_t v25 = 2654435761 * self->_revisionNumber;
    if ((v9 & 0x40) != 0)
    {
LABEL_32:
      uint64_t v26 = 2654435761 * self->_mediaKind;
      if ((v9 & 0x80) != 0) {
        goto LABEL_33;
      }
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((v9 & 0x40) != 0) {
      goto LABEL_32;
    }
  }
  uint64_t v26 = 0;
  if ((v9 & 0x80) != 0)
  {
LABEL_33:
    uint64_t v27 = 2654435761 * self->_playbackState;
    if ((v9 & 0x20) != 0) {
      goto LABEL_34;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v27 = 0;
  if ((v9 & 0x20) != 0)
  {
LABEL_34:
    uint64_t v28 = 2654435761 * self->_likedState;
    if ((v9 & 0x200) != 0) {
      goto LABEL_35;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v28 = 0;
  if ((v9 & 0x200) != 0)
  {
LABEL_35:
    uint64_t v29 = 2654435761 * self->_scrubbableState;
    if ((v9 & 0x400) != 0) {
      goto LABEL_36;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v29 = 0;
  if ((v9 & 0x400) != 0)
  {
LABEL_36:
    uint64_t v30 = 2654435761 * self->_canSkipNext;
    if ((v9 & 0x800) != 0) {
      goto LABEL_37;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v30 = 0;
  if ((v9 & 0x800) != 0)
  {
LABEL_37:
    uint64_t v31 = 2654435761 * self->_canSkipPrevious;
    if ((v9 & 0x4000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v31 = 0;
  if ((v9 & 0x4000) != 0)
  {
LABEL_38:
    uint64_t v32 = 2654435761 * self->_likeable;
    if ((v9 & 0x1000) != 0) {
      goto LABEL_39;
    }
LABEL_49:
    uint64_t v33 = 0;
    if ((v9 & 0x2000) != 0) {
      goto LABEL_40;
    }
LABEL_50:
    uint64_t v34 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
  }
LABEL_48:
  uint64_t v32 = 0;
  if ((v9 & 0x1000) == 0) {
    goto LABEL_49;
  }
LABEL_39:
  uint64_t v33 = 2654435761 * self->_canWishlist;
  if ((v9 & 0x2000) == 0) {
    goto LABEL_50;
  }
LABEL_40:
  uint64_t v34 = 2654435761 * self->_hasChapterData;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_itemID = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)v4 + 52);
  }
  if (v5)
  {
    self->_databaseID = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  id v7 = v4;
  if (*((void *)v4 + 11))
  {
    -[TVRMSNowPlayingInfoMessage setTrackName:](self, "setTrackName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[TVRMSNowPlayingInfoMessage setArtistName:](self, "setArtistName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[TVRMSNowPlayingInfoMessage setAlbumName:](self, "setAlbumName:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 8) != 0)
  {
    self->_double timestamp = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 52);
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_double timeRemaining = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double totalDuration = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x100) == 0)
  {
LABEL_15:
    if ((v6 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_revisionNumber = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_mediaKind = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x80) == 0)
  {
LABEL_17:
    if ((v6 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_playbackState = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x20) == 0)
  {
LABEL_18:
    if ((v6 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_likedState = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x200) == 0)
  {
LABEL_19:
    if ((v6 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_scrubbableState = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x400) == 0)
  {
LABEL_20:
    if ((v6 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_canSkipNext = *((unsigned char *)v4 + 96);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x800) == 0)
  {
LABEL_21:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_canSkipPrevious = *((unsigned char *)v4 + 97);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x4000) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_likeable = *((unsigned char *)v4 + 100);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x1000) == 0)
  {
LABEL_23:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_39:
  self->_canWishlist = *((unsigned char *)v4 + 98);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 52) & 0x2000) != 0)
  {
LABEL_24:
    self->_hasChapterData = *((unsigned char *)v4 + 99);
    *(_WORD *)&self->_has |= 0x2000u;
  }
LABEL_25:
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (unint64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)trackName
{
  return self->_trackName;
}

- (void)setTrackName:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (unsigned)revisionNumber
{
  return self->_revisionNumber;
}

- (int)mediaKind
{
  return self->_mediaKind;
}

- (int)playbackState
{
  return self->_playbackState;
}

- (int)likedState
{
  return self->_likedState;
}

- (int)scrubbableState
{
  return self->_scrubbableState;
}

- (BOOL)canSkipNext
{
  return self->_canSkipNext;
}

- (BOOL)canSkipPrevious
{
  return self->_canSkipPrevious;
}

- (BOOL)likeable
{
  return self->_likeable;
}

- (BOOL)canWishlist
{
  return self->_canWishlist;
}

- (BOOL)hasChapterData
{
  return self->_hasChapterData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);

  objc_storeStrong((id *)&self->_albumName, 0);
}

@end