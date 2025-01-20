@interface _MRSendCommandResultMessageProtobuf
+ (Class)handlerReturnStatusDataType;
- (BOOL)hasCommandID;
- (BOOL)hasCommandResult;
- (BOOL)hasPlayerPath;
- (BOOL)hasSendError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)handlerReturnStatusDatas;
- (NSString)commandID;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (_MRSendCommandResultProtobuf)commandResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)handlerReturnStatusAsString:(int)a3;
- (id)handlerReturnStatusDataAtIndex:(unint64_t)a3;
- (id)sendErrorAsString:(int)a3;
- (int)StringAsHandlerReturnStatus:(id)a3;
- (int)StringAsSendError:(id)a3;
- (int)handlerReturnStatus;
- (int)handlerReturnStatusAtIndex:(unint64_t)a3;
- (int)sendError;
- (unint64_t)handlerReturnStatusCount;
- (unint64_t)handlerReturnStatusDatasCount;
- (unint64_t)hash;
- (void)addHandlerReturnStatus:(int)a3;
- (void)addHandlerReturnStatusData:(id)a3;
- (void)clearHandlerReturnStatus;
- (void)clearHandlerReturnStatusDatas;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCommandID:(id)a3;
- (void)setCommandResult:(id)a3;
- (void)setHandlerReturnStatus:(int *)a3 count:(unint64_t)a4;
- (void)setHandlerReturnStatusDatas:(id)a3;
- (void)setHasSendError:(BOOL)a3;
- (void)setPlayerPath:(id)a3;
- (void)setSendError:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendCommandResultMessageProtobuf

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRSendCommandResultMessageProtobuf;
  [(_MRSendCommandResultMessageProtobuf *)&v3 dealloc];
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
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E57D9908[a3];
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

- (unint64_t)handlerReturnStatusCount
{
  return self->_handlerReturnStatus.count;
}

- (int)handlerReturnStatus
{
  return self->_handlerReturnStatus.list;
}

- (void)clearHandlerReturnStatus
{
}

- (void)addHandlerReturnStatus:(int)a3
{
}

- (int)handlerReturnStatusAtIndex:(unint64_t)a3
{
  p_handlerReturnStatus = &self->_handlerReturnStatus;
  unint64_t count = self->_handlerReturnStatus.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_handlerReturnStatus->list[a3];
}

- (void)setHandlerReturnStatus:(int *)a3 count:(unint64_t)a4
{
}

- (id)handlerReturnStatusAsString:(int)a3
{
  if (a3 <= 400)
  {
    switch(a3)
    {
      case 'd':
        int v4 = @"SkipAdProhibited";
        break;
      case 'e':
        int v4 = @"QueueIsUserCurated";
        break;
      case 'f':
        int v4 = @"UserModifiedQueueDisable";
        break;
      case 'g':
        int v4 = @"UserQueueModificationNotSupportedForCurrentItem";
        break;
      case 'h':
        int v4 = @"SubscriptionRequiredForSharedQueue";
        break;
      case 'i':
        int v4 = @"InsertionPositionNotSpecified";
        break;
      case 'j':
        int v4 = @"InvalidInsertionPosition";
        break;
      case 'k':
        int v4 = @"RequestParametersOutOfBounds";
        break;
      case 'l':
        int v4 = @"SkipLimitReached";
        break;
      case 'm':
        int v4 = @"CannotModifyQueueWithPlaybackTokenItems";
        break;
      default:
        int v4 = @"Success";
        switch(a3)
        {
          case 0:
            goto LABEL_32;
          case 1:
            int v4 = @"NoSuchContent";
            break;
          case 2:
            int v4 = @"CommandFailed";
            break;
          case 3:
            int v4 = @"UIKitLegacy";
            break;
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            goto LABEL_31;
          case 10:
            int v4 = @"NoActionableNowPlayingItem";
            break;
          default:
            if (a3 != 20) {
              goto LABEL_31;
            }
            int v4 = @"DeviceNotFound";
            break;
        }
        break;
    }
  }
  else
  {
    if (a3 > 500)
    {
      if (a3 == 501)
      {
        int v4 = @"MediaServicesUnavailable";
        return v4;
      }
      if (a3 == 555)
      {
        int v4 = @"Timeout";
        return v4;
      }
    }
    else
    {
      if (a3 == 401)
      {
        int v4 = @"AuthenticationFailure";
        return v4;
      }
      if (a3 == 404)
      {
        int v4 = @"UnsupportedCommand";
        return v4;
      }
    }
LABEL_31:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_32:
  }
  return v4;
}

- (int)StringAsHandlerReturnStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Success"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NoSuchContent"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CommandFailed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NoActionableNowPlayingItem"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"DeviceNotFound"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"UIKitLegacy"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SkipAdProhibited"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"QueueIsUserCurated"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"UserModifiedQueueDisable"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"UserQueueModificationNotSupportedForCurrentItem"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"SubscriptionRequiredForSharedQueue"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"InsertionPositionNotSpecified"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"InvalidInsertionPosition"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"RequestParametersOutOfBounds"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"SkipLimitReached"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"CannotModifyQueueWithPlaybackTokenItems"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"AuthenticationFailure"])
  {
    int v4 = 401;
  }
  else if ([v3 isEqualToString:@"MediaServicesUnavailable"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"Timeout"])
  {
    int v4 = 555;
  }
  else if ([v3 isEqualToString:@"UnsupportedCommand"])
  {
    int v4 = 404;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearHandlerReturnStatusDatas
{
}

- (void)addHandlerReturnStatusData:(id)a3
{
  id v4 = a3;
  handlerReturnStatusDatas = self->_handlerReturnStatusDatas;
  id v8 = v4;
  if (!handlerReturnStatusDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_handlerReturnStatusDatas;
    self->_handlerReturnStatusDatas = v6;

    id v4 = v8;
    handlerReturnStatusDatas = self->_handlerReturnStatusDatas;
  }
  [(NSMutableArray *)handlerReturnStatusDatas addObject:v4];
}

- (unint64_t)handlerReturnStatusDatasCount
{
  return [(NSMutableArray *)self->_handlerReturnStatusDatas count];
}

- (id)handlerReturnStatusDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_handlerReturnStatusDatas objectAtIndex:a3];
}

+ (Class)handlerReturnStatusDataType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCommandID
{
  return self->_commandID != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (BOOL)hasCommandResult
{
  return self->_commandResult != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendCommandResultMessageProtobuf;
  id v4 = [(_MRSendCommandResultMessageProtobuf *)&v8 description];
  v5 = [(_MRSendCommandResultMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t sendError = self->_sendError;
    if (sendError >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sendError);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E57D9908[sendError];
    }
    [v3 setObject:v5 forKey:@"sendError"];
  }
  p_handlerReturnStatus = &self->_handlerReturnStatus;
  if (self->_handlerReturnStatus.count)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_handlerReturnStatus.count)
    {
      for (unint64_t i = 0; i < self->_handlerReturnStatus.count; ++i)
      {
        int v9 = p_handlerReturnStatus->list[i];
        if (v9 <= 400)
        {
          switch(v9)
          {
            case 'd':
              v10 = @"SkipAdProhibited";
              break;
            case 'e':
              v10 = @"QueueIsUserCurated";
              break;
            case 'f':
              v10 = @"UserModifiedQueueDisable";
              break;
            case 'g':
              v10 = @"UserQueueModificationNotSupportedForCurrentItem";
              break;
            case 'h':
              v10 = @"SubscriptionRequiredForSharedQueue";
              break;
            case 'i':
              v10 = @"InsertionPositionNotSpecified";
              break;
            case 'j':
              v10 = @"InvalidInsertionPosition";
              break;
            case 'k':
              v10 = @"RequestParametersOutOfBounds";
              break;
            case 'l':
              v10 = @"SkipLimitReached";
              break;
            case 'm':
              v10 = @"CannotModifyQueueWithPlaybackTokenItems";
              break;
            default:
              v10 = @"Success";
              switch(v9)
              {
                case 0:
                  goto LABEL_26;
                case 1:
                  v10 = @"NoSuchContent";
                  break;
                case 2:
                  v10 = @"CommandFailed";
                  break;
                case 3:
                  v10 = @"UIKitLegacy";
                  break;
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                  goto LABEL_25;
                case 10:
                  v10 = @"NoActionableNowPlayingItem";
                  break;
                default:
                  if (v9 != 20) {
                    goto LABEL_25;
                  }
                  v10 = @"DeviceNotFound";
                  break;
              }
              break;
          }
          goto LABEL_26;
        }
        if (v9 > 500)
        {
          if (v9 == 501)
          {
            v10 = @"MediaServicesUnavailable";
          }
          else
          {
            if (v9 != 555)
            {
LABEL_25:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_handlerReturnStatus->list[i]);
              v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_26;
            }
            v10 = @"Timeout";
          }
        }
        else if (v9 == 401)
        {
          v10 = @"AuthenticationFailure";
        }
        else
        {
          if (v9 != 404) {
            goto LABEL_25;
          }
          v10 = @"UnsupportedCommand";
        }
LABEL_26:
        [v7 addObject:v10];
      }
    }
    [v3 setObject:v7 forKey:@"handlerReturnStatus"];
  }
  handlerReturnStatusDatas = self->_handlerReturnStatusDatas;
  if (handlerReturnStatusDatas) {
    [v3 setObject:handlerReturnStatusDatas forKey:@"handlerReturnStatusData"];
  }
  commandID = self->_commandID;
  if (commandID) {
    [v3 setObject:commandID forKey:@"commandID"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v14 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"playerPath"];
  }
  commandResult = self->_commandResult;
  if (commandResult)
  {
    v16 = [(_MRSendCommandResultProtobuf *)commandResult dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"commandResult"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_handlerReturnStatus.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_handlerReturnStatus.count);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_handlerReturnStatusDatas;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_commandID) {
    PBDataWriterWriteStringField();
  }
  if (self->_playerPath) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_commandResult) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_sendError;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  id v13 = v4;
  if ([(_MRSendCommandResultMessageProtobuf *)self handlerReturnStatusCount])
  {
    [v13 clearHandlerReturnStatus];
    unint64_t v5 = [(_MRSendCommandResultMessageProtobuf *)self handlerReturnStatusCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v13, "addHandlerReturnStatus:", -[_MRSendCommandResultMessageProtobuf handlerReturnStatusAtIndex:](self, "handlerReturnStatusAtIndex:", i));
    }
  }
  if ([(_MRSendCommandResultMessageProtobuf *)self handlerReturnStatusDatasCount])
  {
    [v13 clearHandlerReturnStatusDatas];
    unint64_t v8 = [(_MRSendCommandResultMessageProtobuf *)self handlerReturnStatusDatasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        long long v11 = [(_MRSendCommandResultMessageProtobuf *)self handlerReturnStatusDataAtIndex:j];
        [v13 addHandlerReturnStatusData:v11];
      }
    }
  }
  if (self->_commandID) {
    objc_msgSend(v13, "setCommandID:");
  }
  long long v12 = v13;
  if (self->_playerPath)
  {
    objc_msgSend(v13, "setPlayerPath:");
    long long v12 = v13;
  }
  if (self->_commandResult)
  {
    objc_msgSend(v13, "setCommandResult:");
    long long v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 64) = self->_sendError;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  PBRepeatedInt32Copy();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = self->_handlerReturnStatusDatas;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "copyWithZone:", a3, (void)v20);
        [v6 addHandlerReturnStatusData:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_commandID copyWithZone:a3];
  long long v14 = (void *)v6[4];
  v6[4] = v13;

  id v15 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  uint64_t v16 = (void *)v6[7];
  v6[7] = v15;

  id v17 = [(_MRSendCommandResultProtobuf *)self->_commandResult copyWithZone:a3];
  v18 = (void *)v6[5];
  v6[5] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_sendError != *((_DWORD *)v4 + 16)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_16:
    char v9 = 0;
    goto LABEL_17;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_16;
  }
  handlerReturnStatusDatas = self->_handlerReturnStatusDatas;
  if ((unint64_t)handlerReturnStatusDatas | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](handlerReturnStatusDatas, "isEqual:")) {
      goto LABEL_16;
    }
  }
  commandID = self->_commandID;
  if ((unint64_t)commandID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](commandID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 7))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")) {
      goto LABEL_16;
    }
  }
  commandResult = self->_commandResult;
  if ((unint64_t)commandResult | *((void *)v4 + 5)) {
    char v9 = -[_MRSendCommandResultProtobuf isEqual:](commandResult, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_sendError;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash() ^ v3;
  uint64_t v5 = v4 ^ [(NSMutableArray *)self->_handlerReturnStatusDatas hash];
  NSUInteger v6 = [(NSString *)self->_commandID hash];
  unint64_t v7 = v5 ^ v6 ^ [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
  return v7 ^ [(_MRSendCommandResultProtobuf *)self->_commandResult hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 68))
  {
    self->_uint64_t sendError = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v6 = [v4 handlerReturnStatusCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[_MRSendCommandResultMessageProtobuf addHandlerReturnStatus:](self, "addHandlerReturnStatus:", [v5 handlerReturnStatusAtIndex:i]);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v5[6];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        -[_MRSendCommandResultMessageProtobuf addHandlerReturnStatusData:](self, "addHandlerReturnStatusData:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  if (v5[4]) {
    -[_MRSendCommandResultMessageProtobuf setCommandID:](self, "setCommandID:");
  }
  playerPath = self->_playerPath;
  id v15 = v5[7];
  if (playerPath)
  {
    if (v15) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[_MRSendCommandResultMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  commandResult = self->_commandResult;
  id v17 = v5[5];
  if (commandResult)
  {
    if (v17) {
      -[_MRSendCommandResultProtobuf mergeFrom:](commandResult, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[_MRSendCommandResultMessageProtobuf setCommandResult:](self, "setCommandResult:");
  }
}

- (NSMutableArray)handlerReturnStatusDatas
{
  return self->_handlerReturnStatusDatas;
}

- (void)setHandlerReturnStatusDatas:(id)a3
{
}

- (NSString)commandID
{
  return self->_commandID;
}

- (void)setCommandID:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (_MRSendCommandResultProtobuf)commandResult
{
  return self->_commandResult;
}

- (void)setCommandResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_handlerReturnStatusDatas, 0);
  objc_storeStrong((id *)&self->_commandResult, 0);

  objc_storeStrong((id *)&self->_commandID, 0);
}

@end