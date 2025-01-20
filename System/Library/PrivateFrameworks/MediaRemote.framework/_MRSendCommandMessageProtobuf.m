@interface _MRSendCommandMessageProtobuf
- (BOOL)hasCommand;
- (BOOL)hasOptions;
- (BOOL)hasPlayerPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRCommandOptionsProtobuf)options;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (id)commandAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCommand:(id)a3;
- (int)command;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCommand:(int)a3;
- (void)setHasCommand:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendCommandMessageProtobuf

- (int)command
{
  if (*(unsigned char *)&self->_has) {
    return self->_command;
  }
  else {
    return 0;
  }
}

- (void)setCommand:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_command = a3;
}

- (void)setHasCommand:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommand
{
  return *(unsigned char *)&self->_has & 1;
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

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendCommandMessageProtobuf;
  int v4 = [(_MRSendCommandMessageProtobuf *)&v8 description];
  v5 = [(_MRSendCommandMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
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
  playerPath = self->_playerPath;
  if (playerPath)
  {
    objc_super v8 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"playerPath"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_options)
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
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_command;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_options)
  {
    objc_msgSend(v4, "setOptions:");
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
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_command;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(_MRCommandOptionsProtobuf *)self->_options copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_command != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  options = self->_options;
  if ((unint64_t)options | *((void *)v4 + 2) && !-[_MRCommandOptionsProtobuf isEqual:](options, "isEqual:")) {
    goto LABEL_11;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 3)) {
    char v7 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_command;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_MRCommandOptionsProtobuf *)self->_options hash] ^ v3;
  return v4 ^ [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[8])
  {
    self->_command = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  options = self->_options;
  uint64_t v7 = *((void *)v5 + 2);
  v10 = v5;
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
    -[_MRSendCommandMessageProtobuf setOptions:](self, "setOptions:");
  }
  uint64_t v5 = v10;
LABEL_9:
  playerPath = self->_playerPath;
  uint64_t v9 = *((void *)v5 + 3);
  if (playerPath)
  {
    if (!v9) {
      goto LABEL_15;
    }
    playerPath = (_MRNowPlayingPlayerPathProtobuf *)-[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    playerPath = (_MRNowPlayingPlayerPathProtobuf *)-[_MRSendCommandMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  uint64_t v5 = v10;
LABEL_15:

  MEMORY[0x1F41817F8](playerPath, v5);
}

- (_MRCommandOptionsProtobuf)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
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
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end