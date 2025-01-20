@interface _MRPlaybackSessionMigrateRequestProtobuf
+ (Class)eventsType;
- (BOOL)allowFadeTransition;
- (BOOL)hasAllowFadeTransition;
- (BOOL)hasContentItem;
- (BOOL)hasDestinationTypes;
- (BOOL)hasEndpointOptions;
- (BOOL)hasInitiator;
- (BOOL)hasOriginatorType;
- (BOOL)hasPlaybackPosition;
- (BOOL)hasPlaybackRate;
- (BOOL)hasPlaybackSessionRequest;
- (BOOL)hasPlaybackState;
- (BOOL)hasPlayerOptions;
- (BOOL)hasPlayerPath;
- (BOOL)hasRequestID;
- (BOOL)hasResolvedPlayerPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)events;
- (NSString)initiator;
- (NSString)requestID;
- (_MRContentItemProtobuf)contentItem;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (_MRNowPlayingPlayerPathProtobuf)resolvedPlayerPath;
- (_MRPlaybackSessionRequestProtobuf)playbackSessionRequest;
- (double)playbackPosition;
- (double)playbackRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endpointOptionsAsString:(int)a3;
- (id)eventsAtIndex:(unint64_t)a3;
- (id)playbackStateAsString:(int)a3;
- (id)playerOptionsAsString:(int)a3;
- (int)StringAsEndpointOptions:(id)a3;
- (int)StringAsPlaybackState:(id)a3;
- (int)StringAsPlayerOptions:(id)a3;
- (int)endpointOptions;
- (int)playbackState;
- (int)playerOptions;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (unsigned)destinationTypes;
- (unsigned)originatorType;
- (void)addEvents:(id)a3;
- (void)clearEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowFadeTransition:(BOOL)a3;
- (void)setContentItem:(id)a3;
- (void)setDestinationTypes:(unsigned int)a3;
- (void)setEndpointOptions:(int)a3;
- (void)setEvents:(id)a3;
- (void)setHasAllowFadeTransition:(BOOL)a3;
- (void)setHasDestinationTypes:(BOOL)a3;
- (void)setHasEndpointOptions:(BOOL)a3;
- (void)setHasOriginatorType:(BOOL)a3;
- (void)setHasPlaybackPosition:(BOOL)a3;
- (void)setHasPlaybackRate:(BOOL)a3;
- (void)setHasPlaybackState:(BOOL)a3;
- (void)setHasPlayerOptions:(BOOL)a3;
- (void)setInitiator:(id)a3;
- (void)setOriginatorType:(unsigned int)a3;
- (void)setPlaybackPosition:(double)a3;
- (void)setPlaybackRate:(double)a3;
- (void)setPlaybackSessionRequest:(id)a3;
- (void)setPlaybackState:(int)a3;
- (void)setPlayerOptions:(int)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResolvedPlayerPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackSessionMigrateRequestProtobuf

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (int)playerOptions
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_playerOptions;
  }
  else {
    return 0;
  }
}

- (void)setPlayerOptions:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_playerOptions = a3;
}

- (void)setHasPlayerOptions:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPlayerOptions
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)playerOptionsAsString:(int)a3
{
  v4 = @"None";
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v4 = @"RestoreDestinationPlaybackState";
      return v4;
    case 2:
      v4 = @"PlayDestination";
      return v4;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_9;
    case 4:
      v4 = @"PauseSource";
      return v4;
    case 8:
      v4 = @"RestorePlaybackPosition";
      return v4;
    default:
      if (a3 == 16)
      {
        v4 = @"RestorePlaybackRate";
      }
      else
      {
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      }
      return v4;
  }
}

- (int)StringAsPlayerOptions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RestoreDestinationPlaybackState"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PlayDestination"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PauseSource"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RestorePlaybackPosition"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RestorePlaybackRate"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)endpointOptions
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_endpointOptions;
  }
  else {
    return 0;
  }
}

- (void)setEndpointOptions:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_endpointOptions = a3;
}

- (void)setHasEndpointOptions:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEndpointOptions
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)endpointOptionsAsString:(int)a3
{
  if a3 < 9 && ((0x117u >> a3))
  {
    char v3 = off_1E57D7398[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsEndpointOptions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UpdateActiveEndpoint"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FallbackToAddOutputDevices"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AllowMigrateToGroup"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AllowMigrateFromGroup"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearEvents
{
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSMutableArray *)events addObject:v4];
}

- (unint64_t)eventsCount
{
  return [(NSMutableArray *)self->_events count];
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_events objectAtIndex:a3];
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

- (void)setPlaybackPosition:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_playbackPosition = a3;
}

- (void)setHasPlaybackPosition:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaybackPosition
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasContentItem
{
  return self->_contentItem != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (int)playbackState
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_playbackState;
  }
  else {
    return 0;
  }
}

- (void)setPlaybackState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_playbackState = a3;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPlaybackState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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
    char v3 = off_1E57D73E0[a3];
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

- (void)setPlaybackRate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_playbackRate = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlaybackRate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPlaybackSessionRequest
{
  return self->_playbackSessionRequest != 0;
}

- (void)setAllowFadeTransition:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_allowFadeTransition = a3;
}

- (void)setHasAllowFadeTransition:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasAllowFadeTransition
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setOriginatorType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_originatorType = a3;
}

- (void)setHasOriginatorType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOriginatorType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDestinationTypes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_destinationTypes = a3;
}

- (void)setHasDestinationTypes:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDestinationTypes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasInitiator
{
  return self->_initiator != 0;
}

- (BOOL)hasResolvedPlayerPath
{
  return self->_resolvedPlayerPath != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackSessionMigrateRequestProtobuf;
  int v4 = [(_MRPlaybackSessionMigrateRequestProtobuf *)&v8 description];
  v5 = [(_MRPlaybackSessionMigrateRequestProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    int playerOptions = self->_playerOptions;
    objc_super v8 = @"None";
    switch(playerOptions)
    {
      case 0:
        break;
      case 1:
        objc_super v8 = @"RestoreDestinationPlaybackState";
        break;
      case 2:
        objc_super v8 = @"PlayDestination";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_8;
      case 4:
        objc_super v8 = @"PauseSource";
        break;
      case 8:
        objc_super v8 = @"RestorePlaybackPosition";
        break;
      default:
        if (playerOptions == 16)
        {
          objc_super v8 = @"RestorePlaybackRate";
        }
        else
        {
LABEL_8:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_playerOptions);
          objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    [v4 setObject:v8 forKey:@"playerOptions"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    uint64_t endpointOptions = self->_endpointOptions;
    if endpointOptions < 9 && ((0x117u >> endpointOptions))
    {
      v10 = off_1E57D7398[endpointOptions];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_endpointOptions);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v10 forKey:@"endpointOptions"];
  }
  if ([(NSMutableArray *)self->_events count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v12 = self->_events;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"events"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v18 = [NSNumber numberWithDouble:self->_playbackPosition];
    [v4 setObject:v18 forKey:@"playbackPosition"];
  }
  contentItem = self->_contentItem;
  if (contentItem)
  {
    v20 = [(_MRContentItemProtobuf *)contentItem dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"contentItem"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v22 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"playerPath"];
  }
  char v23 = (char)self->_has;
  if ((v23 & 0x20) != 0)
  {
    uint64_t playbackState = self->_playbackState;
    if (playbackState >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_playbackState);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E57D73E0[playbackState];
    }
    [v4 setObject:v25 forKey:@"playbackState"];

    char v23 = (char)self->_has;
  }
  if ((v23 & 2) != 0)
  {
    v26 = [NSNumber numberWithDouble:self->_playbackRate];
    [v4 setObject:v26 forKey:@"playbackRate"];
  }
  playbackSessionRequest = self->_playbackSessionRequest;
  if (playbackSessionRequest)
  {
    v28 = [(_MRPlaybackSessionRequestProtobuf *)playbackSessionRequest dictionaryRepresentation];
    [v4 setObject:v28 forKey:@"playbackSessionRequest"];
  }
  $2BD43C258D2BC111BAE16AB7AD328F7E v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v29 & 0x10) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  v36 = [NSNumber numberWithBool:self->_allowFadeTransition];
  [v4 setObject:v36 forKey:@"allowFadeTransition"];

  *(unsigned char *)&$2BD43C258D2BC111BAE16AB7AD328F7E v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x10) != 0)
  {
LABEL_45:
    v30 = [NSNumber numberWithUnsignedInt:self->_originatorType];
    [v4 setObject:v30 forKey:@"originatorType"];

    *(unsigned char *)&$2BD43C258D2BC111BAE16AB7AD328F7E v29 = self->_has;
  }
LABEL_46:
  if ((*(unsigned char *)&v29 & 4) != 0)
  {
    v31 = [NSNumber numberWithUnsignedInt:self->_destinationTypes];
    [v4 setObject:v31 forKey:@"destinationTypes"];
  }
  initiator = self->_initiator;
  if (initiator) {
    [v4 setObject:initiator forKey:@"initiator"];
  }
  resolvedPlayerPath = self->_resolvedPlayerPath;
  if (resolvedPlayerPath)
  {
    v34 = [(_MRNowPlayingPlayerPathProtobuf *)resolvedPlayerPath dictionaryRepresentation];
    [v4 setObject:v34 forKey:@"resolvedPlayerPath"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionMigrateRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_requestID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_events;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_contentItem) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_playerPath) {
    PBDataWriterWriteSubmessage();
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_playbackSessionRequest) {
    PBDataWriterWriteSubmessage();
  }
  $2BD43C258D2BC111BAE16AB7AD328F7E v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v12 & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  PBDataWriterWriteBOOLField();
  *(unsigned char *)&$2BD43C258D2BC111BAE16AB7AD328F7E v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
LABEL_28:
    PBDataWriterWriteUint32Field();
    *(unsigned char *)&$2BD43C258D2BC111BAE16AB7AD328F7E v12 = self->_has;
  }
LABEL_29:
  if ((*(unsigned char *)&v12 & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_initiator) {
    PBDataWriterWriteStringField();
  }
  if (self->_resolvedPlayerPath) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_requestID)
  {
    objc_msgSend(v4, "setRequestID:");
    id v4 = v13;
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_playerOptions;
    *((unsigned char *)v4 + 108) |= 0x40u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_endpointOptions;
    *((unsigned char *)v4 + 108) |= 8u;
  }
  if ([(_MRPlaybackSessionMigrateRequestProtobuf *)self eventsCount])
  {
    [v13 clearEvents];
    unint64_t v6 = [(_MRPlaybackSessionMigrateRequestProtobuf *)self eventsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(_MRPlaybackSessionMigrateRequestProtobuf *)self eventsAtIndex:i];
        [v13 addEvents:v9];
      }
    }
  }
  v10 = v13;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v13 + 1) = *(void *)&self->_playbackPosition;
    *((unsigned char *)v13 + 108) |= 1u;
  }
  if (self->_contentItem)
  {
    objc_msgSend(v13, "setContentItem:");
    v10 = v13;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v13, "setPlayerPath:");
    v10 = v13;
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    v10[18] = self->_playbackState;
    *((unsigned char *)v10 + 108) |= 0x20u;
    char v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    *((void *)v10 + 2) = *(void *)&self->_playbackRate;
    *((unsigned char *)v10 + 108) |= 2u;
  }
  if (self->_playbackSessionRequest)
  {
    objc_msgSend(v13, "setPlaybackSessionRequest:");
    v10 = v13;
  }
  $2BD43C258D2BC111BAE16AB7AD328F7E v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v12 & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  *((unsigned char *)v10 + 104) = self->_allowFadeTransition;
  *((unsigned char *)v10 + 108) |= 0x80u;
  *(unsigned char *)&$2BD43C258D2BC111BAE16AB7AD328F7E v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
LABEL_25:
    v10[14] = self->_originatorType;
    *((unsigned char *)v10 + 108) |= 0x10u;
    *(unsigned char *)&$2BD43C258D2BC111BAE16AB7AD328F7E v12 = self->_has;
  }
LABEL_26:
  if ((*(unsigned char *)&v12 & 4) != 0)
  {
    v10[8] = self->_destinationTypes;
    *((unsigned char *)v10 + 108) |= 4u;
  }
  if (self->_initiator)
  {
    objc_msgSend(v13, "setInitiator:");
    v10 = v13;
  }
  if (self->_resolvedPlayerPath)
  {
    objc_msgSend(v13, "setResolvedPlayerPath:");
    v10 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestID copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_playerOptions;
    *(unsigned char *)(v5 + 108) |= 0x40u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_endpointOptions;
    *(unsigned char *)(v5 + 108) |= 8u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = self->_events;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (void)v28);
        [(id)v5 addEvents:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_playbackPosition;
    *(unsigned char *)(v5 + 108) |= 1u;
  }
  id v15 = -[_MRContentItemProtobuf copyWithZone:](self->_contentItem, "copyWithZone:", a3, (void)v28);
  long long v16 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v15;

  id v17 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v17;

  char v19 = (char)self->_has;
  if ((v19 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_playbackState;
    *(unsigned char *)(v5 + 108) |= 0x20u;
    char v19 = (char)self->_has;
  }
  if ((v19 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_playbackRate;
    *(unsigned char *)(v5 + 108) |= 2u;
  }
  id v20 = [(_MRPlaybackSessionRequestProtobuf *)self->_playbackSessionRequest copyWithZone:a3];
  v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  $2BD43C258D2BC111BAE16AB7AD328F7E v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v22 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  *(unsigned char *)(v5 + 104) = self->_allowFadeTransition;
  *(unsigned char *)(v5 + 108) |= 0x80u;
  *(unsigned char *)&$2BD43C258D2BC111BAE16AB7AD328F7E v22 = self->_has;
  if ((*(unsigned char *)&v22 & 0x10) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 56) = self->_originatorType;
    *(unsigned char *)(v5 + 108) |= 0x10u;
    *(unsigned char *)&$2BD43C258D2BC111BAE16AB7AD328F7E v22 = self->_has;
  }
LABEL_21:
  if ((*(unsigned char *)&v22 & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_destinationTypes;
    *(unsigned char *)(v5 + 108) |= 4u;
  }
  uint64_t v23 = [(NSString *)self->_initiator copyWithZone:a3];
  v24 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v23;

  id v25 = [(_MRNowPlayingPlayerPathProtobuf *)self->_resolvedPlayerPath copyWithZone:a3];
  v26 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v25;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:")) {
      goto LABEL_60;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x40) == 0 || self->_playerOptions != *((_DWORD *)v4 + 19)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x40) != 0)
  {
    goto LABEL_60;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 8) == 0 || self->_endpointOptions != *((_DWORD *)v4 + 9)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 8) != 0)
  {
    goto LABEL_60;
  }
  events = self->_events;
  if ((unint64_t)events | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](events, "isEqual:")) {
      goto LABEL_60;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_playbackPosition != *((double *)v4 + 1)) {
      goto LABEL_60;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_60;
  }
  contentItem = self->_contentItem;
  if ((unint64_t)contentItem | *((void *)v4 + 3)
    && !-[_MRContentItemProtobuf isEqual:](contentItem, "isEqual:"))
  {
    goto LABEL_60;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 10))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")) {
      goto LABEL_60;
    }
  }
  char v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x20) == 0 || self->_playbackState != *((_DWORD *)v4 + 18)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_playbackRate != *((double *)v4 + 2)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_60;
  }
  playbackSessionRequest = self->_playbackSessionRequest;
  if ((unint64_t)playbackSessionRequest | *((void *)v4 + 8))
  {
    if (!-[_MRPlaybackSessionRequestProtobuf isEqual:](playbackSessionRequest, "isEqual:")) {
      goto LABEL_60;
    }
    char v10 = (char)self->_has;
  }
  if ((v10 & 0x80) == 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x80) == 0) {
      goto LABEL_41;
    }
LABEL_60:
    char v14 = 0;
    goto LABEL_61;
  }
  if ((*((unsigned char *)v4 + 108) & 0x80) == 0) {
    goto LABEL_60;
  }
  if (self->_allowFadeTransition)
  {
    if (!*((unsigned char *)v4 + 104)) {
      goto LABEL_60;
    }
  }
  else if (*((unsigned char *)v4 + 104))
  {
    goto LABEL_60;
  }
LABEL_41:
  if ((v10 & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x10) == 0 || self->_originatorType != *((_DWORD *)v4 + 14)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((v10 & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 4) == 0 || self->_destinationTypes != *((_DWORD *)v4 + 8)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 4) != 0)
  {
    goto LABEL_60;
  }
  initiator = self->_initiator;
  if ((unint64_t)initiator | *((void *)v4 + 6) && !-[NSString isEqual:](initiator, "isEqual:")) {
    goto LABEL_60;
  }
  resolvedPlayerPath = self->_resolvedPlayerPath;
  if ((unint64_t)resolvedPlayerPath | *((void *)v4 + 12)) {
    char v14 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](resolvedPlayerPath, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_61:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v27 = [(NSString *)self->_requestID hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v25 = 2654435761 * self->_playerOptions;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_endpointOptions;
      goto LABEL_6;
    }
  }
  uint64_t v3 = 0;
LABEL_6:
  uint64_t v4 = [(NSMutableArray *)self->_events hash];
  if (*(unsigned char *)&self->_has)
  {
    double playbackPosition = self->_playbackPosition;
    double v7 = -playbackPosition;
    if (playbackPosition >= 0.0) {
      double v7 = self->_playbackPosition;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  unint64_t v10 = [(_MRContentItemProtobuf *)self->_contentItem hash];
  unint64_t v11 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v12 = 2654435761 * self->_playbackState;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_16;
    }
LABEL_21:
    unint64_t v17 = 0;
    goto LABEL_24;
  }
  uint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_21;
  }
LABEL_16:
  double playbackRate = self->_playbackRate;
  double v14 = -playbackRate;
  if (playbackRate >= 0.0) {
    double v14 = self->_playbackRate;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_24:
  unint64_t v18 = [(_MRPlaybackSessionRequestProtobuf *)self->_playbackSessionRequest hash];
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    uint64_t v19 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_26;
    }
LABEL_29:
    uint64_t v20 = 2654435761 * self->_originatorType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_27;
    }
LABEL_30:
    uint64_t v21 = 0;
    goto LABEL_31;
  }
  uint64_t v19 = 2654435761 * self->_allowFadeTransition;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_30;
  }
LABEL_27:
  uint64_t v21 = 2654435761 * self->_destinationTypes;
LABEL_31:
  NSUInteger v22 = v26 ^ v27 ^ v3 ^ v4 ^ v5 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20;
  NSUInteger v23 = v21 ^ [(NSString *)self->_initiator hash];
  return v22 ^ v23 ^ [(_MRNowPlayingPlayerPathProtobuf *)self->_resolvedPlayerPath hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (char *)a3;
  if (*((void *)v4 + 11)) {
    -[_MRPlaybackSessionMigrateRequestProtobuf setRequestID:](self, "setRequestID:");
  }
  char v5 = v4[108];
  if ((v5 & 0x40) != 0)
  {
    self->_int playerOptions = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_has |= 0x40u;
    char v5 = v4[108];
  }
  if ((v5 & 8) != 0)
  {
    self->_uint64_t endpointOptions = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *((id *)v4 + 5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        -[_MRPlaybackSessionMigrateRequestProtobuf addEvents:](self, "addEvents:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  if (v4[108])
  {
    self->_double playbackPosition = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  contentItem = self->_contentItem;
  uint64_t v12 = *((void *)v4 + 3);
  if (contentItem)
  {
    if (v12) {
      -[_MRContentItemProtobuf mergeFrom:](contentItem, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[_MRPlaybackSessionMigrateRequestProtobuf setContentItem:](self, "setContentItem:");
  }
  playerPath = self->_playerPath;
  uint64_t v14 = *((void *)v4 + 10);
  if (playerPath)
  {
    if (v14) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[_MRPlaybackSessionMigrateRequestProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  char v15 = v4[108];
  if ((v15 & 0x20) != 0)
  {
    self->_uint64_t playbackState = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 0x20u;
    char v15 = v4[108];
  }
  if ((v15 & 2) != 0)
  {
    self->_double playbackRate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  playbackSessionRequest = self->_playbackSessionRequest;
  uint64_t v17 = *((void *)v4 + 8);
  if (playbackSessionRequest)
  {
    if (v17) {
      -[_MRPlaybackSessionRequestProtobuf mergeFrom:](playbackSessionRequest, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[_MRPlaybackSessionMigrateRequestProtobuf setPlaybackSessionRequest:](self, "setPlaybackSessionRequest:");
  }
  int v18 = v4[108];
  if ((v18 & 0x80000000) == 0)
  {
    if ((v18 & 0x10) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  self->_allowFadeTransition = v4[104];
  *(unsigned char *)&self->_has |= 0x80u;
  LOBYTE(v18) = v4[108];
  if ((v18 & 0x10) != 0)
  {
LABEL_37:
    self->_originatorType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 0x10u;
    LOBYTE(v18) = v4[108];
  }
LABEL_38:
  if ((v18 & 4) != 0)
  {
    self->_destinationTypes = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 6)) {
    -[_MRPlaybackSessionMigrateRequestProtobuf setInitiator:](self, "setInitiator:");
  }
  resolvedPlayerPath = self->_resolvedPlayerPath;
  uint64_t v20 = *((void *)v4 + 12);
  if (resolvedPlayerPath)
  {
    if (v20) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](resolvedPlayerPath, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[_MRPlaybackSessionMigrateRequestProtobuf setResolvedPlayerPath:](self, "setResolvedPlayerPath:");
  }
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (double)playbackPosition
{
  return self->_playbackPosition;
}

- (_MRContentItemProtobuf)contentItem
{
  return self->_contentItem;
}

- (void)setContentItem:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (double)playbackRate
{
  return self->_playbackRate;
}

- (_MRPlaybackSessionRequestProtobuf)playbackSessionRequest
{
  return self->_playbackSessionRequest;
}

- (void)setPlaybackSessionRequest:(id)a3
{
}

- (BOOL)allowFadeTransition
{
  return self->_allowFadeTransition;
}

- (unsigned)originatorType
{
  return self->_originatorType;
}

- (unsigned)destinationTypes
{
  return self->_destinationTypes;
}

- (NSString)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

- (void)setResolvedPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_playbackSessionRequest, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end