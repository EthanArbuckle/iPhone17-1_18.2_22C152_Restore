@interface _MRReceivedCommandProtobuf
- (BOOL)hasAppOptions;
- (BOOL)hasCommand;
- (BOOL)hasDestinationAppDisplayID;
- (BOOL)hasDestinationAppProcessID;
- (BOOL)hasOptions;
- (BOOL)hasOriginUID;
- (BOOL)hasPlayerPath;
- (BOOL)hasRemoteControlInterfaceID;
- (BOOL)hasSenderAppDisplayID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)destinationAppDisplayID;
- (NSString)remoteControlInterfaceID;
- (NSString)senderAppDisplayID;
- (_MRCommandOptionsProtobuf)options;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (_MRReceivedCommandAppOptionsProtobuf)appOptions;
- (id)commandAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCommand:(id)a3;
- (int)command;
- (int)originUID;
- (int64_t)destinationAppProcessID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppOptions:(id)a3;
- (void)setCommand:(int)a3;
- (void)setDestinationAppDisplayID:(id)a3;
- (void)setDestinationAppProcessID:(int64_t)a3;
- (void)setHasCommand:(BOOL)a3;
- (void)setHasDestinationAppProcessID:(BOOL)a3;
- (void)setHasOriginUID:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setOriginUID:(int)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRemoteControlInterfaceID:(id)a3;
- (void)setSenderAppDisplayID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRReceivedCommandProtobuf

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
      goto LABEL_51;
    case 1:
      v4 = @"Play";
      break;
    case 2:
      v4 = @"Pause";
      break;
    case 3:
      v4 = @"TogglePlayPause";
      break;
    case 4:
      v4 = @"Stop";
      break;
    case 5:
      v4 = @"NextTrack";
      break;
    case 6:
      v4 = @"PreviousTrack";
      break;
    case 7:
      v4 = @"AdvanceShuffleMode";
      break;
    case 8:
      v4 = @"AdvanceRepeatMode";
      break;
    case 9:
      v4 = @"BeginFastForward";
      break;
    case 10:
      v4 = @"EndFastForward";
      break;
    case 11:
      v4 = @"BeginRewind";
      break;
    case 12:
      v4 = @"EndRewind";
      break;
    case 13:
      v4 = @"Rewind15Seconds";
      break;
    case 14:
      v4 = @"FastForward15Seconds";
      break;
    case 15:
      v4 = @"Rewind30Seconds";
      break;
    case 16:
      v4 = @"FastForward30Seconds";
      break;
    case 18:
      v4 = @"SkipForward";
      break;
    case 19:
      v4 = @"SkipBackward";
      break;
    case 20:
      v4 = @"ChangePlaybackRate";
      break;
    case 21:
      v4 = @"RateTrack";
      break;
    case 22:
      v4 = @"LikeTrack";
      break;
    case 23:
      v4 = @"DislikeTrack";
      break;
    case 24:
      v4 = @"BookmarkTrack";
      break;
    case 25:
      v4 = @"NextChapter";
      break;
    case 26:
      v4 = @"PreviousChapter";
      break;
    case 27:
      v4 = @"NextAlbum";
      break;
    case 28:
      v4 = @"PreviousAlbum";
      break;
    case 29:
      v4 = @"NextPlaylist";
      break;
    case 30:
      v4 = @"PreviousPlaylist";
      break;
    case 31:
      v4 = @"BanTrack";
      break;
    case 32:
      v4 = @"AddTrackToWishList";
      break;
    case 33:
      v4 = @"RemoveTrackFromWishList";
      break;
    case 34:
      v4 = @"NextInContext";
      break;
    case 35:
      v4 = @"PreviousInContext";
      break;
    case 41:
      v4 = @"ResetPlaybackTimeout";
      break;
    case 45:
      v4 = @"SeekToPlaybackPosition";
      break;
    case 46:
      v4 = @"ChangeRepeatMode";
      break;
    case 47:
      v4 = @"ChangeShuffleMode";
      break;
    case 48:
      v4 = @"SetPlaybackQueue";
      break;
    case 49:
      v4 = @"AddNowPlayingItemToLibrary";
      break;
    case 50:
      v4 = @"CreateRadioStation";
      break;
    case 51:
      v4 = @"AddItemToLibrary";
      break;
    case 52:
      v4 = @"InsertIntoPlaybackQueue";
      break;
    case 53:
      v4 = @"EnableLanguageOption";
      break;
    case 54:
      v4 = @"DisableLanguageOption";
      break;
    case 55:
      v4 = @"ReorderPlaybackQueue";
      break;
    case 56:
      v4 = @"RemoveFromPlaybackQueue";
      break;
    case 57:
      v4 = @"PlayItemInPlaybackQueue";
      break;
    case 58:
      v4 = @"PrepareForSetQueue";
      break;
    case 59:
      v4 = @"SetPlaybackSession";
      break;
    case 60:
      v4 = @"PreloadPlaybackSession";
      break;
    case 61:
      v4 = @"SetPriorityForPlaybackSession";
      break;
    case 62:
      v4 = @"DiscardPlaybackSession";
      break;
    case 63:
      v4 = @"Reshuffle";
      break;
    case 64:
      v4 = @"LeaveSharedPlaybackSession";
      break;
    case 65:
      v4 = @"PostEventNotice";
      break;
    case 124:
      v4 = @"SetSleepTimer";
      break;
    case 135:
      v4 = @"ChangeQueueEndAction";
      break;
    case 142:
      v4 = @"VocalsControl";
      break;
    case 143:
      v4 = @"PrepareVocalsControl";
      break;
    case 144:
      v4 = @"ClearUpNextQueue";
      break;
    case 145:
      v4 = @"PerformDialogAction";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_51:
      break;
  }
  return v4;
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
  else if ([v3 isEqualToString:@"EnableLanguageOption"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"DisableLanguageOption"])
  {
    int v4 = 54;
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
  else if ([v3 isEqualToString:@"ReorderPlaybackQueue"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"RemoveFromPlaybackQueue"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"PlayItemInPlaybackQueue"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"PrepareForSetQueue"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"SetPlaybackSession"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"PreloadPlaybackSession"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"SetPriorityForPlaybackSession"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"DiscardPlaybackSession"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"Reshuffle"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"LeaveSharedPlaybackSession"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"PostEventNotice"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"SetSleepTimer"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"ChangeQueueEndAction"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"VocalsControl"])
  {
    int v4 = 142;
  }
  else if ([v3 isEqualToString:@"PrepareVocalsControl"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"ClearUpNextQueue"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"PerformDialogAction"])
  {
    int v4 = 145;
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

- (void)setOriginUID:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_originUID = a3;
}

- (void)setHasOriginUID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOriginUID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSenderAppDisplayID
{
  return self->_senderAppDisplayID != 0;
}

- (BOOL)hasDestinationAppDisplayID
{
  return self->_destinationAppDisplayID != 0;
}

- (void)setDestinationAppProcessID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_destinationAppProcessID = a3;
}

- (void)setHasDestinationAppProcessID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDestinationAppProcessID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRemoteControlInterfaceID
{
  return self->_remoteControlInterfaceID != 0;
}

- (BOOL)hasAppOptions
{
  return self->_appOptions != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRReceivedCommandProtobuf;
  int v4 = [(_MRReceivedCommandProtobuf *)&v8 description];
  v5 = [(_MRReceivedCommandProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v4 = @"Unknown";
    switch(self->_command)
    {
      case 0:
        break;
      case 1:
        int v4 = @"Play";
        break;
      case 2:
        int v4 = @"Pause";
        break;
      case 3:
        int v4 = @"TogglePlayPause";
        break;
      case 4:
        int v4 = @"Stop";
        break;
      case 5:
        int v4 = @"NextTrack";
        break;
      case 6:
        int v4 = @"PreviousTrack";
        break;
      case 7:
        int v4 = @"AdvanceShuffleMode";
        break;
      case 8:
        int v4 = @"AdvanceRepeatMode";
        break;
      case 9:
        int v4 = @"BeginFastForward";
        break;
      case 0xA:
        int v4 = @"EndFastForward";
        break;
      case 0xB:
        int v4 = @"BeginRewind";
        break;
      case 0xC:
        int v4 = @"EndRewind";
        break;
      case 0xD:
        int v4 = @"Rewind15Seconds";
        break;
      case 0xE:
        int v4 = @"FastForward15Seconds";
        break;
      case 0xF:
        int v4 = @"Rewind30Seconds";
        break;
      case 0x10:
        int v4 = @"FastForward30Seconds";
        break;
      case 0x12:
        int v4 = @"SkipForward";
        break;
      case 0x13:
        int v4 = @"SkipBackward";
        break;
      case 0x14:
        int v4 = @"ChangePlaybackRate";
        break;
      case 0x15:
        int v4 = @"RateTrack";
        break;
      case 0x16:
        int v4 = @"LikeTrack";
        break;
      case 0x17:
        int v4 = @"DislikeTrack";
        break;
      case 0x18:
        int v4 = @"BookmarkTrack";
        break;
      case 0x19:
        int v4 = @"NextChapter";
        break;
      case 0x1A:
        int v4 = @"PreviousChapter";
        break;
      case 0x1B:
        int v4 = @"NextAlbum";
        break;
      case 0x1C:
        int v4 = @"PreviousAlbum";
        break;
      case 0x1D:
        int v4 = @"NextPlaylist";
        break;
      case 0x1E:
        int v4 = @"PreviousPlaylist";
        break;
      case 0x1F:
        int v4 = @"BanTrack";
        break;
      case 0x20:
        int v4 = @"AddTrackToWishList";
        break;
      case 0x21:
        int v4 = @"RemoveTrackFromWishList";
        break;
      case 0x22:
        int v4 = @"NextInContext";
        break;
      case 0x23:
        int v4 = @"PreviousInContext";
        break;
      case 0x29:
        int v4 = @"ResetPlaybackTimeout";
        break;
      case 0x2D:
        int v4 = @"SeekToPlaybackPosition";
        break;
      case 0x2E:
        int v4 = @"ChangeRepeatMode";
        break;
      case 0x2F:
        int v4 = @"ChangeShuffleMode";
        break;
      case 0x30:
        int v4 = @"SetPlaybackQueue";
        break;
      case 0x31:
        int v4 = @"AddNowPlayingItemToLibrary";
        break;
      case 0x32:
        int v4 = @"CreateRadioStation";
        break;
      case 0x33:
        int v4 = @"AddItemToLibrary";
        break;
      case 0x34:
        int v4 = @"InsertIntoPlaybackQueue";
        break;
      case 0x35:
        int v4 = @"EnableLanguageOption";
        break;
      case 0x36:
        int v4 = @"DisableLanguageOption";
        break;
      case 0x37:
        int v4 = @"ReorderPlaybackQueue";
        break;
      case 0x38:
        int v4 = @"RemoveFromPlaybackQueue";
        break;
      case 0x39:
        int v4 = @"PlayItemInPlaybackQueue";
        break;
      case 0x3A:
        int v4 = @"PrepareForSetQueue";
        break;
      case 0x3B:
        int v4 = @"SetPlaybackSession";
        break;
      case 0x3C:
        int v4 = @"PreloadPlaybackSession";
        break;
      case 0x3D:
        int v4 = @"SetPriorityForPlaybackSession";
        break;
      case 0x3E:
        int v4 = @"DiscardPlaybackSession";
        break;
      case 0x3F:
        int v4 = @"Reshuffle";
        break;
      case 0x40:
        int v4 = @"LeaveSharedPlaybackSession";
        break;
      case 0x41:
        int v4 = @"PostEventNotice";
        break;
      case 0x7C:
        int v4 = @"SetSleepTimer";
        break;
      case 0x87:
        int v4 = @"ChangeQueueEndAction";
        break;
      case 0x8E:
        int v4 = @"VocalsControl";
        break;
      case 0x8F:
        int v4 = @"PrepareVocalsControl";
        break;
      case 0x90:
        int v4 = @"ClearUpNextQueue";
        break;
      case 0x91:
        int v4 = @"PerformDialogAction";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_command);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    [v3 setObject:v4 forKey:@"command"];
  }
  options = self->_options;
  if (options)
  {
    v6 = [(_MRCommandOptionsProtobuf *)options dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"options"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_originUID];
    [v3 setObject:v7 forKey:@"originUID"];
  }
  senderAppDisplayID = self->_senderAppDisplayID;
  if (senderAppDisplayID) {
    [v3 setObject:senderAppDisplayID forKey:@"senderAppDisplayID"];
  }
  destinationAppDisplayID = self->_destinationAppDisplayID;
  if (destinationAppDisplayID) {
    [v3 setObject:destinationAppDisplayID forKey:@"destinationAppDisplayID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithLongLong:self->_destinationAppProcessID];
    [v3 setObject:v10 forKey:@"destinationAppProcessID"];
  }
  remoteControlInterfaceID = self->_remoteControlInterfaceID;
  if (remoteControlInterfaceID) {
    [v3 setObject:remoteControlInterfaceID forKey:@"remoteControlInterfaceID"];
  }
  appOptions = self->_appOptions;
  if (appOptions)
  {
    v13 = [(_MRReceivedCommandAppOptionsProtobuf *)appOptions dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"appOptions"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v15 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"playerPath"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRReceivedCommandProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_options)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_senderAppDisplayID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_destinationAppDisplayID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_remoteControlInterfaceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_appOptions)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[6] = self->_command;
    *((unsigned char *)v4 + 80) |= 2u;
  }
  id v5 = v4;
  if (self->_options)
  {
    objc_msgSend(v4, "setOptions:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[12] = self->_originUID;
    *((unsigned char *)v4 + 80) |= 4u;
  }
  if (self->_senderAppDisplayID)
  {
    objc_msgSend(v5, "setSenderAppDisplayID:");
    id v4 = v5;
  }
  if (self->_destinationAppDisplayID)
  {
    objc_msgSend(v5, "setDestinationAppDisplayID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_destinationAppProcessID;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  if (self->_remoteControlInterfaceID)
  {
    objc_msgSend(v5, "setRemoteControlInterfaceID:");
    id v4 = v5;
  }
  if (self->_appOptions)
  {
    objc_msgSend(v5, "setAppOptions:");
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_command;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  id v7 = [(_MRCommandOptionsProtobuf *)self->_options copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_originUID;
    *(unsigned char *)(v6 + 80) |= 4u;
  }
  uint64_t v9 = [(NSString *)self->_senderAppDisplayID copyWithZone:a3];
  v10 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v9;

  uint64_t v11 = [(NSString *)self->_destinationAppDisplayID copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_destinationAppProcessID;
    *(unsigned char *)(v6 + 80) |= 1u;
  }
  uint64_t v13 = [(NSString *)self->_remoteControlInterfaceID copyWithZone:a3];
  v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  id v15 = [(_MRReceivedCommandAppOptionsProtobuf *)self->_appOptions copyWithZone:a3];
  v16 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v15;

  id v17 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v18 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v17;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_command != *((_DWORD *)v4 + 6)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_30;
  }
  options = self->_options;
  if ((unint64_t)options | *((void *)v4 + 5))
  {
    if (!-[_MRCommandOptionsProtobuf isEqual:](options, "isEqual:"))
    {
LABEL_30:
      char v12 = 0;
      goto LABEL_31;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_originUID != *((_DWORD *)v4 + 12)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_30;
  }
  senderAppDisplayID = self->_senderAppDisplayID;
  if ((unint64_t)senderAppDisplayID | *((void *)v4 + 9)
    && !-[NSString isEqual:](senderAppDisplayID, "isEqual:"))
  {
    goto LABEL_30;
  }
  destinationAppDisplayID = self->_destinationAppDisplayID;
  if ((unint64_t)destinationAppDisplayID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](destinationAppDisplayID, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_destinationAppProcessID != *((void *)v4 + 1)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_30;
  }
  remoteControlInterfaceID = self->_remoteControlInterfaceID;
  if ((unint64_t)remoteControlInterfaceID | *((void *)v4 + 8)
    && !-[NSString isEqual:](remoteControlInterfaceID, "isEqual:"))
  {
    goto LABEL_30;
  }
  appOptions = self->_appOptions;
  if ((unint64_t)appOptions | *((void *)v4 + 2))
  {
    if (!-[_MRReceivedCommandAppOptionsProtobuf isEqual:](appOptions, "isEqual:")) {
      goto LABEL_30;
    }
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 7)) {
    char v12 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_31:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_command;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_MRCommandOptionsProtobuf *)self->_options hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v5 = 2654435761 * self->_originUID;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_senderAppDisplayID hash];
  NSUInteger v7 = [(NSString *)self->_destinationAppDisplayID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_destinationAppProcessID;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_remoteControlInterfaceID hash];
  unint64_t v10 = [(_MRReceivedCommandAppOptionsProtobuf *)self->_appOptions hash];
  return v9 ^ v10 ^ [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if ((v4[20] & 2) != 0)
  {
    self->_command = v4[6];
    *(unsigned char *)&self->_has |= 2u;
  }
  options = self->_options;
  uint64_t v7 = *((void *)v5 + 5);
  char v12 = v5;
  if (options)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[_MRCommandOptionsProtobuf mergeFrom:](options, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[_MRReceivedCommandProtobuf setOptions:](self, "setOptions:");
  }
  uint64_t v5 = v12;
LABEL_9:
  if ((v5[20] & 4) != 0)
  {
    self->_originUID = v5[12];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 9))
  {
    -[_MRReceivedCommandProtobuf setSenderAppDisplayID:](self, "setSenderAppDisplayID:");
    uint64_t v5 = v12;
  }
  if (*((void *)v5 + 4))
  {
    -[_MRReceivedCommandProtobuf setDestinationAppDisplayID:](self, "setDestinationAppDisplayID:");
    uint64_t v5 = v12;
  }
  if (v5[20])
  {
    self->_destinationAppProcessID = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 8))
  {
    -[_MRReceivedCommandProtobuf setRemoteControlInterfaceID:](self, "setRemoteControlInterfaceID:");
    uint64_t v5 = v12;
  }
  appOptions = self->_appOptions;
  uint64_t v9 = *((void *)v5 + 2);
  if (appOptions)
  {
    if (!v9) {
      goto LABEL_25;
    }
    -[_MRReceivedCommandAppOptionsProtobuf mergeFrom:](appOptions, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_25;
    }
    -[_MRReceivedCommandProtobuf setAppOptions:](self, "setAppOptions:");
  }
  uint64_t v5 = v12;
LABEL_25:
  playerPath = self->_playerPath;
  uint64_t v11 = *((void *)v5 + 7);
  if (playerPath)
  {
    if (!v11) {
      goto LABEL_31;
    }
    playerPath = (_MRNowPlayingPlayerPathProtobuf *)-[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_31;
    }
    playerPath = (_MRNowPlayingPlayerPathProtobuf *)-[_MRReceivedCommandProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  uint64_t v5 = v12;
LABEL_31:

  MEMORY[0x1F41817F8](playerPath, v5);
}

- (_MRCommandOptionsProtobuf)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (int)originUID
{
  return self->_originUID;
}

- (NSString)senderAppDisplayID
{
  return self->_senderAppDisplayID;
}

- (void)setSenderAppDisplayID:(id)a3
{
}

- (NSString)destinationAppDisplayID
{
  return self->_destinationAppDisplayID;
}

- (void)setDestinationAppDisplayID:(id)a3
{
}

- (int64_t)destinationAppProcessID
{
  return self->_destinationAppProcessID;
}

- (NSString)remoteControlInterfaceID
{
  return self->_remoteControlInterfaceID;
}

- (void)setRemoteControlInterfaceID:(id)a3
{
}

- (_MRReceivedCommandAppOptionsProtobuf)appOptions
{
  return self->_appOptions;
}

- (void)setAppOptions:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderAppDisplayID, 0);
  objc_storeStrong((id *)&self->_remoteControlInterfaceID, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destinationAppDisplayID, 0);

  objc_storeStrong((id *)&self->_appOptions, 0);
}

@end