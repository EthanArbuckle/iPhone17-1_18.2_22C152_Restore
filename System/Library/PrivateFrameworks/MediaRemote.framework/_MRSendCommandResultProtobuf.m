@interface _MRSendCommandResultProtobuf
+ (Class)statusesType;
- (BOOL)hasPlayerPath;
- (BOOL)hasSendError;
- (BOOL)hasSendErrorDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)statuses;
- (NSString)sendErrorDescription;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sendErrorAsString:(int)a3;
- (id)statusesAtIndex:(unint64_t)a3;
- (int)StringAsSendError:(id)a3;
- (int)sendError;
- (unint64_t)hash;
- (unint64_t)statusesCount;
- (void)addStatuses:(id)a3;
- (void)clearStatuses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSendError:(BOOL)a3;
- (void)setPlayerPath:(id)a3;
- (void)setSendError:(int)a3;
- (void)setSendErrorDescription:(id)a3;
- (void)setStatuses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendCommandResultProtobuf

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (int)sendError
{
  if (*(unsigned char *)&self->_has) {
    return self->_sendError;
  }
  else {
    return 0;
  }
}

- (void)setSendError:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sendError = a3;
}

- (void)setHasSendError:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSendError
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)sendErrorAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D2BF0[a3];
  }

  return v3;
}

- (int)StringAsSendError:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ApplicationNotFound"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConnectionFailed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Ignored"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CouldNotLaunchApplication"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TimedOut"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OriginDoesNotExist"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"InvalidOptions"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"NoCommandHandlers"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ApplicationNotInstalled"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"NotSupported"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearStatuses
{
}

- (void)addStatuses:(id)a3
{
  id v4 = a3;
  statuses = self->_statuses;
  id v8 = v4;
  if (!statuses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_statuses;
    self->_statuses = v6;

    id v4 = v8;
    statuses = self->_statuses;
  }
  [(NSMutableArray *)statuses addObject:v4];
}

- (unint64_t)statusesCount
{
  return [(NSMutableArray *)self->_statuses count];
}

- (id)statusesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_statuses objectAtIndex:a3];
}

+ (Class)statusesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSendErrorDescription
{
  return self->_sendErrorDescription != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendCommandResultProtobuf;
  id v4 = [(_MRSendCommandResultProtobuf *)&v8 description];
  v5 = [(_MRSendCommandResultProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v5 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"playerPath"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t sendError = self->_sendError;
    if (sendError >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sendError);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E57D2BF0[sendError];
    }
    [v3 setObject:v7 forKey:@"sendError"];
  }
  if ([(NSMutableArray *)self->_statuses count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_statuses, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = self->_statuses;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"statuses"];
  }
  sendErrorDescription = self->_sendErrorDescription;
  if (sendErrorDescription) {
    [v3 setObject:sendErrorDescription forKey:@"sendErrorDescription"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_playerPath) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_statuses;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_sendErrorDescription) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_playerPath)
  {
    objc_msgSend(v4, "setPlayerPath:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_sendError;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if ([(_MRSendCommandResultProtobuf *)self statusesCount])
  {
    [v9 clearStatuses];
    unint64_t v5 = [(_MRSendCommandResultProtobuf *)self statusesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(_MRSendCommandResultProtobuf *)self statusesAtIndex:i];
        [v9 addStatuses:v8];
      }
    }
  }
  if (self->_sendErrorDescription) {
    objc_msgSend(v9, "setSendErrorDescription:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_sendError;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_statuses;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [(id)v5 addStatuses:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_sendErrorDescription copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 1))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_sendError != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  statuses = self->_statuses;
  if ((unint64_t)statuses | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](statuses, "isEqual:"))
  {
    goto LABEL_13;
  }
  sendErrorDescription = self->_sendErrorDescription;
  if ((unint64_t)sendErrorDescription | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](sendErrorDescription, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_sendError;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSMutableArray *)self->_statuses hash];
  return v5 ^ v6 ^ [(NSString *)self->_sendErrorDescription hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  playerPath = self->_playerPath;
  uint64_t v6 = *((void *)v4 + 1);
  if (playerPath)
  {
    if (v6) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRSendCommandResultProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_uint64_t sendError = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[_MRSendCommandResultProtobuf addStatuses:](self, "addStatuses:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 3)) {
    -[_MRSendCommandResultProtobuf setSendErrorDescription:](self, "setSendErrorDescription:");
  }
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (NSMutableArray)statuses
{
  return self->_statuses;
}

- (void)setStatuses:(id)a3
{
}

- (NSString)sendErrorDescription
{
  return self->_sendErrorDescription;
}

- (void)setSendErrorDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_sendErrorDescription, 0);

  objc_storeStrong((id *)&self->_playerPath, 0);
}

@end