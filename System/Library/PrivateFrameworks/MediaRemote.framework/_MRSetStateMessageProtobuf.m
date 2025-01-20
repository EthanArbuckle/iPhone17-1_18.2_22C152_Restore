@interface _MRSetStateMessageProtobuf
- (BOOL)hasDisplayID;
- (BOOL)hasDisplayName;
- (BOOL)hasNowPlayingInfo;
- (BOOL)hasPlaybackQueue;
- (BOOL)hasPlaybackQueueCapabilities;
- (BOOL)hasPlaybackState;
- (BOOL)hasPlaybackStateTimestamp;
- (BOOL)hasPlayerPath;
- (BOOL)hasRequest;
- (BOOL)hasSupportedCommands;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)displayID;
- (NSString)displayName;
- (_MRNowPlayingInfoProtobuf)nowPlayingInfo;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (_MRPlaybackQueueCapabilitiesProtobuf)playbackQueueCapabilities;
- (_MRPlaybackQueueProtobuf)playbackQueue;
- (_MRPlaybackQueueRequestProtobuf)request;
- (_MRSupportedCommandsProtobuf)supportedCommands;
- (double)playbackStateTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)playbackStateAsString:(int)a3;
- (int)StringAsPlaybackState:(id)a3;
- (int)playbackState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasPlaybackState:(BOOL)a3;
- (void)setHasPlaybackStateTimestamp:(BOOL)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackQueueCapabilities:(id)a3;
- (void)setPlaybackState:(int)a3;
- (void)setPlaybackStateTimestamp:(double)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSupportedCommands:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSetStateMessageProtobuf

- (BOOL)hasNowPlayingInfo
{
  return self->_nowPlayingInfo != 0;
}

- (BOOL)hasSupportedCommands
{
  return self->_supportedCommands != 0;
}

- (BOOL)hasPlaybackQueue
{
  return self->_playbackQueue != 0;
}

- (BOOL)hasDisplayID
{
  return self->_displayID != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (int)playbackState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_playbackState;
  }
  else {
    return 0;
  }
}

- (void)setPlaybackState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_playbackState = a3;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlaybackState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)playbackStateAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E57D1910[a3];
  }

  return v3;
}

- (int)StringAsPlaybackState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Playing"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Paused"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Stopped"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Interrupted"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Seeking"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPlaybackQueueCapabilities
{
  return self->_playbackQueueCapabilities != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (void)setPlaybackStateTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_playbackStateTimestamp = a3;
}

- (void)setHasPlaybackStateTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaybackStateTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSetStateMessageProtobuf;
  int v4 = [(_MRSetStateMessageProtobuf *)&v8 description];
  v5 = [(_MRSetStateMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  nowPlayingInfo = self->_nowPlayingInfo;
  if (nowPlayingInfo)
  {
    v5 = [(_MRNowPlayingInfoProtobuf *)nowPlayingInfo dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"nowPlayingInfo"];
  }
  supportedCommands = self->_supportedCommands;
  if (supportedCommands)
  {
    v7 = [(_MRSupportedCommandsProtobuf *)supportedCommands dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"supportedCommands"];
  }
  playbackQueue = self->_playbackQueue;
  if (playbackQueue)
  {
    v9 = [(_MRPlaybackQueueProtobuf *)playbackQueue dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"playbackQueue"];
  }
  displayID = self->_displayID;
  if (displayID) {
    [v3 setObject:displayID forKey:@"displayID"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t playbackState = self->_playbackState;
    if (playbackState >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_playbackState);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E57D1910[playbackState];
    }
    [v3 setObject:v13 forKey:@"playbackState"];
  }
  playbackQueueCapabilities = self->_playbackQueueCapabilities;
  if (playbackQueueCapabilities)
  {
    v15 = [(_MRPlaybackQueueCapabilitiesProtobuf *)playbackQueueCapabilities dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"playbackQueueCapabilities"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v17 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"playerPath"];
  }
  request = self->_request;
  if (request)
  {
    v19 = [(_MRPlaybackQueueRequestProtobuf *)request dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"request"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v20 = [NSNumber numberWithDouble:self->_playbackStateTimestamp];
    [v3 setObject:v20 forKey:@"playbackStateTimestamp"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSetStateMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_nowPlayingInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_supportedCommands)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playbackQueue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_displayID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_playbackQueueCapabilities)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_nowPlayingInfo)
  {
    objc_msgSend(v4, "setNowPlayingInfo:");
    id v4 = v5;
  }
  if (self->_supportedCommands)
  {
    objc_msgSend(v5, "setSupportedCommands:");
    id v4 = v5;
  }
  if (self->_playbackQueue)
  {
    objc_msgSend(v5, "setPlaybackQueue:");
    id v4 = v5;
  }
  if (self->_displayID)
  {
    objc_msgSend(v5, "setDisplayID:");
    id v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_playbackState;
    *((unsigned char *)v4 + 88) |= 2u;
  }
  if (self->_playbackQueueCapabilities)
  {
    objc_msgSend(v5, "setPlaybackQueueCapabilities:");
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    id v4 = v5;
  }
  if (self->_request)
  {
    objc_msgSend(v5, "setRequest:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_playbackStateTimestamp;
    *((unsigned char *)v4 + 88) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRNowPlayingInfoProtobuf *)self->_nowPlayingInfo copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(_MRSupportedCommandsProtobuf *)self->_supportedCommands copyWithZone:a3];
  v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  id v10 = [(_MRPlaybackQueueProtobuf *)self->_playbackQueue copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_displayID copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  uint64_t v14 = [(NSString *)self->_displayName copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_playbackState;
    *(unsigned char *)(v5 + 88) |= 2u;
  }
  id v16 = [(_MRPlaybackQueueCapabilitiesProtobuf *)self->_playbackQueueCapabilities copyWithZone:a3];
  v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  id v18 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  id v20 = [(_MRPlaybackQueueRequestProtobuf *)self->_request copyWithZone:a3];
  v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_playbackStateTimestamp;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  nowPlayingInfo = self->_nowPlayingInfo;
  if ((unint64_t)nowPlayingInfo | *((void *)v4 + 4))
  {
    if (!-[_MRNowPlayingInfoProtobuf isEqual:](nowPlayingInfo, "isEqual:")) {
      goto LABEL_27;
    }
  }
  supportedCommands = self->_supportedCommands;
  if ((unint64_t)supportedCommands | *((void *)v4 + 10))
  {
    if (!-[_MRSupportedCommandsProtobuf isEqual:](supportedCommands, "isEqual:")) {
      goto LABEL_27;
    }
  }
  playbackQueue = self->_playbackQueue;
  if ((unint64_t)playbackQueue | *((void *)v4 + 5))
  {
    if (!-[_MRPlaybackQueueProtobuf isEqual:](playbackQueue, "isEqual:")) {
      goto LABEL_27;
    }
  }
  displayID = self->_displayID;
  if ((unint64_t)displayID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayID, "isEqual:")) {
      goto LABEL_27;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_playbackState != *((_DWORD *)v4 + 14)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
LABEL_27:
    BOOL v13 = 0;
    goto LABEL_28;
  }
  playbackQueueCapabilities = self->_playbackQueueCapabilities;
  if ((unint64_t)playbackQueueCapabilities | *((void *)v4 + 6)
    && !-[_MRPlaybackQueueCapabilitiesProtobuf isEqual:](playbackQueueCapabilities, "isEqual:"))
  {
    goto LABEL_27;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 8))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")) {
      goto LABEL_27;
    }
  }
  request = self->_request;
  if ((unint64_t)request | *((void *)v4 + 9))
  {
    if (!-[_MRPlaybackQueueRequestProtobuf isEqual:](request, "isEqual:")) {
      goto LABEL_27;
    }
  }
  BOOL v13 = (*((unsigned char *)v4 + 88) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_playbackStateTimestamp != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
    BOOL v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v17 = [(_MRNowPlayingInfoProtobuf *)self->_nowPlayingInfo hash];
  unint64_t v16 = [(_MRSupportedCommandsProtobuf *)self->_supportedCommands hash];
  unint64_t v3 = [(_MRPlaybackQueueProtobuf *)self->_playbackQueue hash];
  NSUInteger v4 = [(NSString *)self->_displayID hash];
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_playbackState;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_MRPlaybackQueueCapabilitiesProtobuf *)self->_playbackQueueCapabilities hash];
  unint64_t v8 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
  unint64_t v9 = [(_MRPlaybackQueueRequestProtobuf *)self->_request hash];
  if (*(unsigned char *)&self->_has)
  {
    double playbackStateTimestamp = self->_playbackStateTimestamp;
    double v12 = -playbackStateTimestamp;
    if (playbackStateTimestamp >= 0.0) {
      double v12 = self->_playbackStateTimestamp;
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
  return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  nowPlayingInfo = self->_nowPlayingInfo;
  uint64_t v6 = *((void *)v4 + 4);
  id v17 = v4;
  if (nowPlayingInfo)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRNowPlayingInfoProtobuf mergeFrom:](nowPlayingInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRSetStateMessageProtobuf setNowPlayingInfo:](self, "setNowPlayingInfo:");
  }
  id v4 = v17;
LABEL_7:
  supportedCommands = self->_supportedCommands;
  uint64_t v8 = *((void *)v4 + 10);
  if (supportedCommands)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRSupportedCommandsProtobuf mergeFrom:](supportedCommands, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRSetStateMessageProtobuf setSupportedCommands:](self, "setSupportedCommands:");
  }
  id v4 = v17;
LABEL_13:
  playbackQueue = self->_playbackQueue;
  uint64_t v10 = *((void *)v4 + 5);
  if (playbackQueue)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[_MRPlaybackQueueProtobuf mergeFrom:](playbackQueue, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[_MRSetStateMessageProtobuf setPlaybackQueue:](self, "setPlaybackQueue:");
  }
  id v4 = v17;
LABEL_19:
  if (*((void *)v4 + 2))
  {
    -[_MRSetStateMessageProtobuf setDisplayID:](self, "setDisplayID:");
    id v4 = v17;
  }
  if (*((void *)v4 + 3))
  {
    -[_MRSetStateMessageProtobuf setDisplayName:](self, "setDisplayName:");
    id v4 = v17;
  }
  if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    self->_uint64_t playbackState = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 2u;
  }
  playbackQueueCapabilities = self->_playbackQueueCapabilities;
  uint64_t v12 = *((void *)v4 + 6);
  if (playbackQueueCapabilities)
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[_MRPlaybackQueueCapabilitiesProtobuf mergeFrom:](playbackQueueCapabilities, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[_MRSetStateMessageProtobuf setPlaybackQueueCapabilities:](self, "setPlaybackQueueCapabilities:");
  }
  id v4 = v17;
LABEL_31:
  playerPath = self->_playerPath;
  uint64_t v14 = *((void *)v4 + 8);
  if (playerPath)
  {
    if (!v14) {
      goto LABEL_37;
    }
    -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_37;
    }
    -[_MRSetStateMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  id v4 = v17;
LABEL_37:
  request = self->_request;
  uint64_t v16 = *((void *)v4 + 9);
  if (request)
  {
    if (!v16) {
      goto LABEL_43;
    }
    -[_MRPlaybackQueueRequestProtobuf mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_43;
    }
    -[_MRSetStateMessageProtobuf setRequest:](self, "setRequest:");
  }
  id v4 = v17;
LABEL_43:
  if (*((unsigned char *)v4 + 88))
  {
    self->_double playbackStateTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8]();
}

- (_MRNowPlayingInfoProtobuf)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
{
}

- (_MRSupportedCommandsProtobuf)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
}

- (_MRPlaybackQueueProtobuf)playbackQueue
{
  return self->_playbackQueue;
}

- (void)setPlaybackQueue:(id)a3
{
}

- (NSString)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (_MRPlaybackQueueCapabilitiesProtobuf)playbackQueueCapabilities
{
  return self->_playbackQueueCapabilities;
}

- (void)setPlaybackQueueCapabilities:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (_MRPlaybackQueueRequestProtobuf)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (double)playbackStateTimestamp
{
  return self->_playbackStateTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_playbackQueueCapabilities, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_displayID, 0);
}

@end