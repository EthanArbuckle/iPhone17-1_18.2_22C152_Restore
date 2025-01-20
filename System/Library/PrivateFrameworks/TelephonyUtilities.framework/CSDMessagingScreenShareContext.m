@interface CSDMessagingScreenShareContext
- (BOOL)hasOriginType;
- (BOOL)hasScreenShareUUID;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)screenShareUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)incomingScreenShareRequestFromParticipant:(id)a3 handleEligibilityBlock:(id)a4 error:(id *)a5;
- (id)initOutgoingRequestWithScreenSharingRequest:(id)a3;
- (id)originTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsOriginType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)originType;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOriginType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setOriginType:(int)a3;
- (void)setScreenShareUUID:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingScreenShareContext

- (BOOL)hasScreenShareUUID
{
  return self->_screenShareUUID != 0;
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
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100505C90 + a3);
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ShareScreen"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ViewScreen"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Cancel"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Deny"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)originType
{
  if (*(unsigned char *)&self->_has) {
    return self->_originType;
  }
  else {
    return 0;
  }
}

- (void)setOriginType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_originType = a3;
}

- (void)setHasOriginType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)originTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"AskToShare";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"JoinRequest";
  }
  return v4;
}

- (int)StringAsOriginType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"JoinRequest"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"AskToShare"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingScreenShareContext;
  id v3 = [(CSDMessagingScreenShareContext *)&v7 description];
  int v4 = [(CSDMessagingScreenShareContext *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  screenShareUUID = self->_screenShareUUID;
  if (screenShareUUID) {
    [v3 setObject:screenShareUUID forKey:@"screenShareUUID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v8 = *(&off_100505C90 + type);
    }
    [v4 setObject:v8 forKey:@"type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int originType = self->_originType;
    if (originType)
    {
      if (originType == 1)
      {
        v10 = @"AskToShare";
      }
      else
      {
        v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_originType];
      }
    }
    else
    {
      v10 = @"JoinRequest";
    }
    [v4 setObject:v10 forKey:@"originType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006DF20((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_screenShareUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_screenShareUUID)
  {
    id v6 = v4;
    objc_msgSend(v4, "setScreenShareUUID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_originType;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_screenShareUUID copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((unsigned char *)v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_originType;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  screenShareUUID = self->_screenShareUUID;
  if ((unint64_t)screenShareUUID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](screenShareUUID, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_originType != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_screenShareUUID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_originType;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    BOOL v6 = v4;
    -[CSDMessagingScreenShareContext setScreenShareUUID:](self, "setScreenShareUUID:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t type = v4[6];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_int originType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)screenShareUUID
{
  return self->_screenShareUUID;
}

- (void)setScreenShareUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)initOutgoingRequestWithScreenSharingRequest:(id)a3
{
  id v4 = a3;
  char v5 = [(CSDMessagingScreenShareContext *)self init];
  if (!v5) {
    goto LABEL_17;
  }
  BOOL v6 = [v4 UUID];
  objc_super v7 = [v6 UUIDString];
  [(CSDMessagingScreenShareContext *)v5 setScreenShareUUID:v7];

  id v8 = [v4 type];
  if (v8 == (id)4)
  {
    v9 = v5;
    uint64_t v10 = 3;
  }
  else if (v8 == (id)2)
  {
    v9 = v5;
    uint64_t v10 = 1;
  }
  else
  {
    if (v8 != (id)1)
    {
      v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1003ACFB4();
      }

      char v5 = 0;
      goto LABEL_12;
    }
    v9 = v5;
    uint64_t v10 = 0;
  }
  [(CSDMessagingScreenShareContext *)v9 setType:v10];
LABEL_12:
  id v12 = [v4 originType];
  if (v12 == (id)1)
  {
    uint64_t v13 = 0;
    goto LABEL_16;
  }
  if (v12 == (id)2)
  {
    uint64_t v13 = 1;
LABEL_16:
    [(CSDMessagingScreenShareContext *)v5 setOriginType:v13];
  }
LABEL_17:

  return v5;
}

- (id)incomingScreenShareRequestFromParticipant:(id)a3 handleEligibilityBlock:(id)a4 error:(id *)a5
{
  id v8 = (uint64_t (**)(id, void *))a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)NSUUID);
  v11 = [(CSDMessagingScreenShareContext *)self screenShareUUID];
  id v12 = [v10 initWithUUIDString:v11];

  uint64_t v13 = [v9 handle];
  id v14 = [v9 identifier];

  unsigned int v15 = [(CSDMessagingScreenShareContext *)self type];
  if (v15)
  {
    if (v15 != 1)
    {
      v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1003AD01C();
      }

      if (!a5) {
        goto LABEL_22;
      }
      uint64_t v21 = TUScreenSharingRequestErrorDomain;
      uint64_t v22 = 1;
      goto LABEL_27;
    }
    uint64_t v16 = 3;
  }
  else
  {
    uint64_t v16 = 4;
  }
  unsigned int v17 = [(CSDMessagingScreenShareContext *)self originType];
  if (v17)
  {
    if (v17 != 1)
    {
      v24 = sub_100008DCC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1003AD084();
      }

      goto LABEL_22;
    }
    uint64_t v18 = 2;
    if (v12) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v18 = 1;
    if (v12)
    {
LABEL_8:
      if (v8[2](v8, v13))
      {
        id v19 = [objc_alloc((Class)TUScreenSharingRequest) initWithHandle:v13 type:v16 originType:v18 UUID:v12 participantIdentifier:v14];
        goto LABEL_28;
      }
      v25 = sub_100008DCC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1003AD154();
      }

      if (a5)
      {
        uint64_t v21 = TUScreenSharingRequestErrorDomain;
        uint64_t v22 = 3;
        goto LABEL_27;
      }
LABEL_22:
      id v19 = 0;
      goto LABEL_28;
    }
  }
  v23 = sub_100008DCC();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_1003AD0EC();
  }

  if (!a5) {
    goto LABEL_22;
  }
  uint64_t v21 = TUScreenSharingRequestErrorDomain;
  uint64_t v22 = 2;
LABEL_27:
  +[NSError errorWithDomain:v21 code:v22 userInfo:0];
  id v19 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v19;
}

@end