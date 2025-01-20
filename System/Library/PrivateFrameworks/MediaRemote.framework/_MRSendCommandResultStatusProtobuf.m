@interface _MRSendCommandResultStatusProtobuf
- (BOOL)hasCustomData;
- (BOOL)hasCustomDataType;
- (BOOL)hasDialog;
- (BOOL)hasError;
- (BOOL)hasStatusCode;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)customData;
- (NSString)customDataType;
- (_MRErrorProtobuf)error;
- (_MRSendCommandResultHandlerDialogProtobuf)dialog;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusCodeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)StringAsType:(id)a3;
- (int)statusCode;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCustomData:(id)a3;
- (void)setCustomDataType:(id)a3;
- (void)setDialog:(id)a3;
- (void)setError:(id)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setStatusCode:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendCommandResultStatusProtobuf

- (int)statusCode
{
  if (*(unsigned char *)&self->_has) {
    return self->_statusCode;
  }
  else {
    return 0;
  }
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatusCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if (a3 <= 400)
  {
    switch(a3)
    {
      case 'd':
        v4 = @"SkipAdProhibited";
        break;
      case 'e':
        v4 = @"QueueIsUserCurated";
        break;
      case 'f':
        v4 = @"UserModifiedQueueDisable";
        break;
      case 'g':
        v4 = @"UserQueueModificationNotSupportedForCurrentItem";
        break;
      case 'h':
        v4 = @"SubscriptionRequiredForSharedQueue";
        break;
      case 'i':
        v4 = @"InsertionPositionNotSpecified";
        break;
      case 'j':
        v4 = @"InvalidInsertionPosition";
        break;
      case 'k':
        v4 = @"RequestParametersOutOfBounds";
        break;
      case 'l':
        v4 = @"SkipLimitReached";
        break;
      case 'm':
        v4 = @"CannotModifyQueueWithPlaybackTokenItems";
        break;
      default:
        v4 = @"Success";
        switch(a3)
        {
          case 0:
            goto LABEL_32;
          case 1:
            v4 = @"NoSuchContent";
            break;
          case 2:
            v4 = @"CommandFailed";
            break;
          case 3:
            v4 = @"UIKitLegacy";
            break;
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            goto LABEL_31;
          case 10:
            v4 = @"NoActionableNowPlayingItem";
            break;
          default:
            if (a3 != 20) {
              goto LABEL_31;
            }
            v4 = @"DeviceNotFound";
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
        v4 = @"MediaServicesUnavailable";
        return v4;
      }
      if (a3 == 555)
      {
        v4 = @"Timeout";
        return v4;
      }
    }
    else
    {
      if (a3 == 401)
      {
        v4 = @"AuthenticationFailure";
        return v4;
      }
      if (a3 == 404)
      {
        v4 = @"UnsupportedCommand";
        return v4;
      }
    }
LABEL_31:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_32:
  }
  return v4;
}

- (int)StringAsStatusCode:(id)a3
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

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 > 1)
  {
    if (a3 == 2)
    {
      int v4 = @"Error";
    }
    else
    {
      if (a3 != 999)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"Custom";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 1)
      {
        int v4 = @"Dialog";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"Unknown";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Dialog"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Error"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Custom"])
  {
    int v4 = 999;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDialog
{
  return self->_dialog != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasCustomData
{
  return self->_customData != 0;
}

- (BOOL)hasCustomDataType
{
  return self->_customDataType != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendCommandResultStatusProtobuf;
  int v4 = [(_MRSendCommandResultStatusProtobuf *)&v8 description];
  v5 = [(_MRSendCommandResultStatusProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    int statusCode = self->_statusCode;
    if (statusCode <= 400)
    {
      switch(statusCode)
      {
        case 'd':
          v6 = @"SkipAdProhibited";
          break;
        case 'e':
          v6 = @"QueueIsUserCurated";
          break;
        case 'f':
          v6 = @"UserModifiedQueueDisable";
          break;
        case 'g':
          v6 = @"UserQueueModificationNotSupportedForCurrentItem";
          break;
        case 'h':
          v6 = @"SubscriptionRequiredForSharedQueue";
          break;
        case 'i':
          v6 = @"InsertionPositionNotSpecified";
          break;
        case 'j':
          v6 = @"InvalidInsertionPosition";
          break;
        case 'k':
          v6 = @"RequestParametersOutOfBounds";
          break;
        case 'l':
          v6 = @"SkipLimitReached";
          break;
        case 'm':
          v6 = @"CannotModifyQueueWithPlaybackTokenItems";
          break;
        default:
          v6 = @"Success";
          switch(statusCode)
          {
            case 0:
              goto LABEL_19;
            case 1:
              v6 = @"NoSuchContent";
              break;
            case 2:
              v6 = @"CommandFailed";
              break;
            case 3:
              v6 = @"UIKitLegacy";
              break;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
              goto LABEL_18;
            case 10:
              v6 = @"NoActionableNowPlayingItem";
              break;
            default:
              if (statusCode != 20) {
                goto LABEL_18;
              }
              v6 = @"DeviceNotFound";
              break;
          }
          break;
      }
      goto LABEL_19;
    }
    if (statusCode > 500)
    {
      if (statusCode == 501)
      {
        v6 = @"MediaServicesUnavailable";
        goto LABEL_19;
      }
      if (statusCode == 555)
      {
        v6 = @"Timeout";
        goto LABEL_19;
      }
    }
    else
    {
      if (statusCode == 401)
      {
        v6 = @"AuthenticationFailure";
        goto LABEL_19;
      }
      if (statusCode == 404)
      {
        v6 = @"UnsupportedCommand";
LABEL_19:
        [v3 setObject:v6 forKey:@"statusCode"];

        char has = (char)self->_has;
        goto LABEL_20;
      }
    }
LABEL_18:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_statusCode);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_20:
  if ((has & 2) == 0) {
    goto LABEL_32;
  }
  int type = self->_type;
  if (type > 1)
  {
    if (type == 2)
    {
      objc_super v8 = @"Error";
      goto LABEL_31;
    }
    if (type == 999)
    {
      objc_super v8 = @"Custom";
      goto LABEL_31;
    }
LABEL_30:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (!type)
  {
    objc_super v8 = @"Unknown";
    goto LABEL_31;
  }
  if (type != 1) {
    goto LABEL_30;
  }
  objc_super v8 = @"Dialog";
LABEL_31:
  [v3 setObject:v8 forKey:@"type"];

LABEL_32:
  dialog = self->_dialog;
  if (dialog)
  {
    v10 = [(_MRSendCommandResultHandlerDialogProtobuf *)dialog dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"dialog"];
  }
  error = self->_error;
  if (error)
  {
    v12 = [(_MRErrorProtobuf *)error dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"error"];
  }
  customData = self->_customData;
  if (customData) {
    [v3 setObject:customData forKey:@"customData"];
  }
  customDataType = self->_customDataType;
  if (customDataType) {
    [v3 setObject:customDataType forKey:@"customDataType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultStatusProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_dialog)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_customData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_customDataType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[10] = self->_statusCode;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[11] = self->_type;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  id v6 = v4;
  if (self->_dialog)
  {
    objc_msgSend(v4, "setDialog:");
    id v4 = v6;
  }
  if (self->_error)
  {
    objc_msgSend(v6, "setError:");
    id v4 = v6;
  }
  if (self->_customData)
  {
    objc_msgSend(v6, "setCustomData:");
    id v4 = v6;
  }
  if (self->_customDataType)
  {
    objc_msgSend(v6, "setCustomDataType:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 40) = self->_statusCode;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_type;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  id v8 = [(_MRSendCommandResultHandlerDialogProtobuf *)self->_dialog copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  id v10 = [(_MRErrorProtobuf *)self->_error copyWithZone:a3];
  v11 = (void *)v6[4];
  v6[4] = v10;

  uint64_t v12 = [(NSData *)self->_customData copyWithZone:a3];
  v13 = (void *)v6[1];
  v6[1] = v12;

  uint64_t v14 = [(NSString *)self->_customDataType copyWithZone:a3];
  v15 = (void *)v6[2];
  v6[2] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 10)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_type != *((_DWORD *)v4 + 11)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_20;
  }
  dialog = self->_dialog;
  if ((unint64_t)dialog | *((void *)v4 + 3)
    && !-[_MRSendCommandResultHandlerDialogProtobuf isEqual:](dialog, "isEqual:"))
  {
    goto LABEL_20;
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 4))
  {
    if (!-[_MRErrorProtobuf isEqual:](error, "isEqual:")) {
      goto LABEL_20;
    }
  }
  customData = self->_customData;
  if ((unint64_t)customData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](customData, "isEqual:")) {
      goto LABEL_20;
    }
  }
  customDataType = self->_customDataType;
  if ((unint64_t)customDataType | *((void *)v4 + 2)) {
    char v9 = -[NSString isEqual:](customDataType, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_statusCode;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_type;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(_MRSendCommandResultHandlerDialogProtobuf *)self->_dialog hash];
  unint64_t v6 = [(_MRErrorProtobuf *)self->_error hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSData *)self->_customData hash];
  return v7 ^ [(NSString *)self->_customDataType hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 48);
  if (v6)
  {
    self->_int statusCode = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 48);
  }
  if ((v6 & 2) != 0)
  {
    self->_int type = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 2u;
  }
  dialog = self->_dialog;
  uint64_t v8 = v5[3];
  v11 = v5;
  if (dialog)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[_MRSendCommandResultHandlerDialogProtobuf mergeFrom:](dialog, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[_MRSendCommandResultStatusProtobuf setDialog:](self, "setDialog:");
  }
  unint64_t v5 = v11;
LABEL_11:
  error = self->_error;
  uint64_t v10 = v5[4];
  if (error)
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[_MRErrorProtobuf mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[_MRSendCommandResultStatusProtobuf setError:](self, "setError:");
  }
  unint64_t v5 = v11;
LABEL_17:
  if (v5[1])
  {
    -[_MRSendCommandResultStatusProtobuf setCustomData:](self, "setCustomData:");
    unint64_t v5 = v11;
  }
  if (v5[2]) {
    -[_MRSendCommandResultStatusProtobuf setCustomDataType:](self, "setCustomDataType:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRSendCommandResultHandlerDialogProtobuf)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
}

- (_MRErrorProtobuf)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSData)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
}

- (NSString)customDataType
{
  return self->_customDataType;
}

- (void)setCustomDataType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_customDataType, 0);

  objc_storeStrong((id *)&self->_customData, 0);
}

@end