@interface _NMRSendCommandMessageProtobuf
- (BOOL)hasBundleID;
- (BOOL)hasCommand;
- (BOOL)hasOptions;
- (BOOL)hasOriginIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (_NMRCommandOptionsProtobuf)options;
- (double)timestamp;
- (id)commandAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCommand:(id)a3;
- (int)command;
- (int)originIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCommand:(int)a3;
- (void)setHasCommand:(BOOL)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRSendCommandMessageProtobuf

- (int)command
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_command;
  }
  else {
    return 0;
  }
}

- (void)setCommand:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_command = a3;
}

- (void)setHasCommand:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCommand
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)commandAsString:(int)a3
{
  v4 = @"Unknown";
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v4 = @"Play";
      return v4;
    case 2:
      v4 = @"Pause";
      return v4;
    case 3:
      v4 = @"TogglePlayPause";
      return v4;
    case 4:
      v4 = @"Stop";
      return v4;
    case 5:
      v4 = @"NextTrack";
      return v4;
    case 6:
      v4 = @"PreviousTrack";
      return v4;
    case 7:
      v4 = @"AdvanceShuffleMode";
      return v4;
    case 8:
      v4 = @"AdvanceRepeatMode";
      return v4;
    case 9:
      v4 = @"BeginFastForward";
      return v4;
    case 10:
      v4 = @"EndFastForward";
      return v4;
    case 11:
      v4 = @"BeginRewind";
      return v4;
    case 12:
      v4 = @"EndRewind";
      return v4;
    case 13:
      v4 = @"Rewind15Seconds";
      return v4;
    case 14:
      v4 = @"FastForward15Seconds";
      return v4;
    case 15:
      v4 = @"Rewind30Seconds";
      return v4;
    case 16:
      v4 = @"FastForward30Seconds";
      return v4;
    case 17:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 42:
    case 43:
    case 44:
      goto LABEL_9;
    case 18:
      v4 = @"SkipForward";
      return v4;
    case 19:
      v4 = @"SkipBackward";
      return v4;
    case 20:
      v4 = @"ChangePlaybackRate";
      return v4;
    case 21:
      v4 = @"RateTrack";
      return v4;
    case 22:
      v4 = @"LikeTrack";
      return v4;
    case 23:
      v4 = @"DislikeTrack";
      return v4;
    case 24:
      v4 = @"BookmarkTrack";
      return v4;
    case 25:
      v4 = @"NextChapter";
      return v4;
    case 26:
      v4 = @"PreviousChapter";
      return v4;
    case 27:
      v4 = @"NextAlbum";
      return v4;
    case 28:
      v4 = @"PreviousAlbum";
      return v4;
    case 29:
      v4 = @"NextPlaylist";
      return v4;
    case 30:
      v4 = @"PreviousPlaylist";
      return v4;
    case 31:
      v4 = @"BanTrack";
      return v4;
    case 32:
      v4 = @"AddTrackToWishList";
      return v4;
    case 33:
      v4 = @"RemoveTrackFromWishList";
      return v4;
    case 34:
      v4 = @"NextInContext";
      return v4;
    case 35:
      v4 = @"PreviousInContext";
      return v4;
    case 41:
      v4 = @"ResetPlaybackTimeout";
      return v4;
    case 45:
      v4 = @"SeekToPlaybackPosition";
      return v4;
    case 46:
      v4 = @"ChangeRepeatMode";
      return v4;
    case 47:
      v4 = @"ChangeShuffleMode";
      return v4;
    case 48:
      v4 = @"SetPlaybackQueue";
      return v4;
    case 49:
      v4 = @"AddNowPlayingItemToLibrary";
      return v4;
    case 50:
      v4 = @"CreateRadioStation";
      return v4;
    case 51:
      v4 = @"AddItemToLibrary";
      return v4;
    case 52:
      v4 = @"InsertIntoPlaybackQueue";
      return v4;
    case 53:
      v4 = @"PlayItemInPlaybackQueue";
      return v4;
    default:
      if (a3 == 135)
      {
        v4 = @"ChangeQueueEndAction";
      }
      else
      {
LABEL_9:
        v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_10:
      }
      return v4;
  }
}

- (int)StringAsCommand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Play"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Pause"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TogglePlayPause"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Stop"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NextTrack"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PreviousTrack"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AdvanceShuffleMode"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AdvanceRepeatMode"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BeginFastForward"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EndFastForward"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BeginRewind"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"EndRewind"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Rewind15Seconds"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FastForward15Seconds"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Rewind30Seconds"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"FastForward30Seconds"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SkipForward"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SkipBackward"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ChangePlaybackRate"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RateTrack"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"LikeTrack"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"DislikeTrack"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"BookmarkTrack"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"SeekToPlaybackPosition"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"ChangeRepeatMode"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"ChangeShuffleMode"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"NextChapter"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"PreviousChapter"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"NextAlbum"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"PreviousAlbum"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"NextPlaylist"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"PreviousPlaylist"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"BanTrack"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"AddTrackToWishList"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"RemoveTrackFromWishList"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NextInContext"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"PreviousInContext"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ResetPlaybackTimeout"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"SetPlaybackQueue"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"AddNowPlayingItemToLibrary"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"CreateRadioStation"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"AddItemToLibrary"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"InsertIntoPlaybackQueue"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"PlayItemInPlaybackQueue"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"ChangeQueueEndAction"])
  {
    int v4 = 135;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasOptions
{
  return self->_options != 0;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOriginIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_originIdentifier = a3;
}

- (void)setHasOriginIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOriginIdentifier
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRSendCommandMessageProtobuf;
  char v3 = [(_NMRSendCommandMessageProtobuf *)&v7 description];
  int v4 = [(_NMRSendCommandMessageProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int command = self->_command;
    v5 = @"Unknown";
    switch(command)
    {
      case 0:
        break;
      case 1:
        v5 = @"Play";
        break;
      case 2:
        v5 = @"Pause";
        break;
      case 3:
        v5 = @"TogglePlayPause";
        break;
      case 4:
        v5 = @"Stop";
        break;
      case 5:
        v5 = @"NextTrack";
        break;
      case 6:
        v5 = @"PreviousTrack";
        break;
      case 7:
        v5 = @"AdvanceShuffleMode";
        break;
      case 8:
        v5 = @"AdvanceRepeatMode";
        break;
      case 9:
        v5 = @"BeginFastForward";
        break;
      case 10:
        v5 = @"EndFastForward";
        break;
      case 11:
        v5 = @"BeginRewind";
        break;
      case 12:
        v5 = @"EndRewind";
        break;
      case 13:
        v5 = @"Rewind15Seconds";
        break;
      case 14:
        v5 = @"FastForward15Seconds";
        break;
      case 15:
        v5 = @"Rewind30Seconds";
        break;
      case 16:
        v5 = @"FastForward30Seconds";
        break;
      case 17:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 42:
      case 43:
      case 44:
        goto LABEL_6;
      case 18:
        v5 = @"SkipForward";
        break;
      case 19:
        v5 = @"SkipBackward";
        break;
      case 20:
        v5 = @"ChangePlaybackRate";
        break;
      case 21:
        v5 = @"RateTrack";
        break;
      case 22:
        v5 = @"LikeTrack";
        break;
      case 23:
        v5 = @"DislikeTrack";
        break;
      case 24:
        v5 = @"BookmarkTrack";
        break;
      case 25:
        v5 = @"NextChapter";
        break;
      case 26:
        v5 = @"PreviousChapter";
        break;
      case 27:
        v5 = @"NextAlbum";
        break;
      case 28:
        v5 = @"PreviousAlbum";
        break;
      case 29:
        v5 = @"NextPlaylist";
        break;
      case 30:
        v5 = @"PreviousPlaylist";
        break;
      case 31:
        v5 = @"BanTrack";
        break;
      case 32:
        v5 = @"AddTrackToWishList";
        break;
      case 33:
        v5 = @"RemoveTrackFromWishList";
        break;
      case 34:
        v5 = @"NextInContext";
        break;
      case 35:
        v5 = @"PreviousInContext";
        break;
      case 41:
        v5 = @"ResetPlaybackTimeout";
        break;
      case 45:
        v5 = @"SeekToPlaybackPosition";
        break;
      case 46:
        v5 = @"ChangeRepeatMode";
        break;
      case 47:
        v5 = @"ChangeShuffleMode";
        break;
      case 48:
        v5 = @"SetPlaybackQueue";
        break;
      case 49:
        v5 = @"AddNowPlayingItemToLibrary";
        break;
      case 50:
        v5 = @"CreateRadioStation";
        break;
      case 51:
        v5 = @"AddItemToLibrary";
        break;
      case 52:
        v5 = @"InsertIntoPlaybackQueue";
        break;
      case 53:
        v5 = @"PlayItemInPlaybackQueue";
        break;
      default:
        if (command == 135)
        {
          v5 = @"ChangeQueueEndAction";
        }
        else
        {
LABEL_6:
          v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_command];
        }
        break;
    }
    [v3 setObject:v5 forKey:@"command"];
  }
  options = self->_options;
  if (options)
  {
    objc_super v7 = [(_NMRCommandOptionsProtobuf *)options dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"options"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = +[NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v10 = +[NSNumber numberWithInt:self->_originIdentifier];
    [v3 setObject:v10 forKey:@"originIdentifier"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100005690((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_options)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[6] = self->_command;
    *((unsigned char *)v4 + 44) |= 2u;
  }
  id v6 = v4;
  if (self->_options)
  {
    [v4 setOptions:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[10] = self->_originIdentifier;
    *((unsigned char *)v4 + 44) |= 4u;
  }
  if (self->_bundleID)
  {
    [v6 setBundleID:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[6] = self->_command;
    *((unsigned char *)v5 + 44) |= 2u;
  }
  id v7 = [(_NMRCommandOptionsProtobuf *)self->_options copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  char has = (char)self->_has;
  if (has)
  {
    v6[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v6 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_originIdentifier;
    *((unsigned char *)v6 + 44) |= 4u;
  }
  id v10 = [(NSString *)self->_bundleID copyWithZone:a3];
  v11 = (void *)v6[2];
  v6[2] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_command != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_22;
  }
  options = self->_options;
  if ((unint64_t)options | *((void *)v4 + 4))
  {
    if (!-[_NMRCommandOptionsProtobuf isEqual:](options, "isEqual:"))
    {
LABEL_22:
      unsigned __int8 v8 = 0;
      goto LABEL_23;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_22;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 10)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 2)) {
    unsigned __int8 v8 = -[NSString isEqual:](bundleID, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_command;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_NMRCommandOptionsProtobuf *)self->_options hash];
  char has = (char)self->_has;
  if (has)
  {
    double timestamp = self->_timestamp;
    double v8 = -timestamp;
    if (timestamp >= 0.0) {
      double v8 = self->_timestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_originIdentifier;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ [(NSString *)self->_bundleID hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v5 = v4;
  if ((v4[11] & 2) != 0)
  {
    self->_int command = v4[6];
    *(unsigned char *)&self->_has |= 2u;
  }
  options = self->_options;
  uint64_t v7 = *((void *)v5 + 4);
  long double v9 = v5;
  if (options)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[_NMRCommandOptionsProtobuf mergeFrom:](options, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[_NMRSendCommandMessageProtobuf setOptions:](self, "setOptions:");
  }
  v5 = v9;
LABEL_9:
  char v8 = *((unsigned char *)v5 + 44);
  if (v8)
  {
    self->_double timestamp = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = *((unsigned char *)v5 + 44);
  }
  if ((v8 & 4) != 0)
  {
    self->_originIdentifier = v5[10];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 2)) {
    -[_NMRSendCommandMessageProtobuf setBundleID:](self, "setBundleID:");
  }

  _objc_release_x1();
}

- (_NMRCommandOptionsProtobuf)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)originIdentifier
{
  return self->_originIdentifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end