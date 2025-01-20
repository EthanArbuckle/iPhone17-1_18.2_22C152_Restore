@interface NPKProtoRemotePassUpdateRequest
- (BOOL)cancelUpdate;
- (BOOL)hasCancelUpdate;
- (BOOL)hasPass;
- (BOOL)hasRequestAuthorization;
- (BOOL)hasShouldNotifyUser;
- (BOOL)hasUpdateRequestData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestAuthorization;
- (BOOL)shouldNotifyUser;
- (NPKProtoPass)pass;
- (NSData)updateRequestData;
- (NSString)passID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCancelUpdate:(BOOL)a3;
- (void)setHasCancelUpdate:(BOOL)a3;
- (void)setHasRequestAuthorization:(BOOL)a3;
- (void)setHasShouldNotifyUser:(BOOL)a3;
- (void)setPass:(id)a3;
- (void)setPassID:(id)a3;
- (void)setRequestAuthorization:(BOOL)a3;
- (void)setShouldNotifyUser:(BOOL)a3;
- (void)setUpdateRequestData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemotePassUpdateRequest

- (BOOL)hasUpdateRequestData
{
  return self->_updateRequestData != 0;
}

- (void)setCancelUpdate:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cancelUpdate = a3;
}

- (void)setHasCancelUpdate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCancelUpdate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPass
{
  return self->_pass != 0;
}

- (void)setRequestAuthorization:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requestAuthorization = a3;
}

- (void)setHasRequestAuthorization:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestAuthorization
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShouldNotifyUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_shouldNotifyUser = a3;
}

- (void)setHasShouldNotifyUser:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasShouldNotifyUser
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemotePassUpdateRequest;
  v4 = [(NPKProtoRemotePassUpdateRequest *)&v8 description];
  v5 = [(NPKProtoRemotePassUpdateRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passID = self->_passID;
  if (passID) {
    [v3 setObject:passID forKey:@"passID"];
  }
  updateRequestData = self->_updateRequestData;
  if (updateRequestData) {
    [v4 setObject:updateRequestData forKey:@"updateRequestData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_cancelUpdate];
    [v4 setObject:v7 forKey:@"cancelUpdate"];
  }
  pass = self->_pass;
  if (pass)
  {
    v9 = [(NPKProtoPass *)pass dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"pass"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_requestAuthorization];
    [v4 setObject:v11 forKey:@"requestAuthorization"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_shouldNotifyUser];
    [v4 setObject:v12 forKey:@"shouldNotifyUser"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_passID) {
    -[NPKProtoRemotePassUpdateRequest writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteStringField();
  if (self->_updateRequestData) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v5 = v7;
  if (self->_pass)
  {
    PBDataWriterWriteSubmessage();
    v5 = v7;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v7;
  }
}

- (void)copyTo:(id)a3
{
  v6 = a3;
  [v6 setPassID:self->_passID];
  if (self->_updateRequestData) {
    objc_msgSend(v6, "setUpdateRequestData:");
  }
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
    v6[32] = self->_cancelUpdate;
    v6[36] |= 1u;
  }
  if (self->_pass)
  {
    objc_msgSend(v6, "setPass:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[33] = self->_requestAuthorization;
    v4[36] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[34] = self->_shouldNotifyUser;
    v4[36] |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passID copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSData *)self->_updateRequestData copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_cancelUpdate;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v10 = [(NPKProtoPass *)self->_pass copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 33) = self->_requestAuthorization;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 34) = self->_shouldNotifyUser;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  passID = self->_passID;
  if ((unint64_t)passID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](passID, "isEqual:")) {
      goto LABEL_27;
    }
  }
  updateRequestData = self->_updateRequestData;
  if ((unint64_t)updateRequestData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](updateRequestData, "isEqual:")) {
      goto LABEL_27;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0) {
      goto LABEL_27;
    }
    if (self->_cancelUpdate)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_27;
  }
  pass = self->_pass;
  if ((unint64_t)pass | *((void *)v4 + 1))
  {
    if (!-[NPKProtoPass isEqual:](pass, "isEqual:")) {
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_27;
    }
    if (self->_requestAuthorization)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_27;
  }
  BOOL v9 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) != 0)
    {
      if (self->_shouldNotifyUser)
      {
        if (!*((unsigned char *)v4 + 34)) {
          goto LABEL_27;
        }
      }
      else if (*((unsigned char *)v4 + 34))
      {
        goto LABEL_27;
      }
      BOOL v9 = 1;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v9 = 0;
  }
LABEL_28:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passID hash];
  uint64_t v4 = [(NSData *)self->_updateRequestData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_cancelUpdate;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(NPKProtoPass *)self->_pass hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_requestAuthorization;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_shouldNotifyUser;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v8 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoRemotePassUpdateRequest setPassID:](self, "setPassID:");
    uint64_t v4 = v8;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoRemotePassUpdateRequest setUpdateRequestData:](self, "setUpdateRequestData:");
    uint64_t v4 = v8;
  }
  if (v4[36])
  {
    self->_cancelUpdate = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
  pass = self->_pass;
  uint64_t v6 = *((void *)v4 + 1);
  if (pass)
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[NPKProtoPass mergeFrom:](pass, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[NPKProtoRemotePassUpdateRequest setPass:](self, "setPass:");
  }
  uint64_t v4 = v8;
LABEL_13:
  BOOL v7 = v4[36];
  if ((v7 & 2) != 0)
  {
    self->_requestAuthorization = v4[33];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v7 = v4[36];
  }
  if ((v7 & 4) != 0)
  {
    self->_shouldNotifyUser = v4[34];
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
}

- (NSData)updateRequestData
{
  return self->_updateRequestData;
}

- (void)setUpdateRequestData:(id)a3
{
}

- (BOOL)cancelUpdate
{
  return self->_cancelUpdate;
}

- (NPKProtoPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (BOOL)requestAuthorization
{
  return self->_requestAuthorization;
}

- (BOOL)shouldNotifyUser
{
  return self->_shouldNotifyUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateRequestData, 0);
  objc_storeStrong((id *)&self->_passID, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassUpdateRequest writeTo:]", "NPKProtoRemotePassUpdateRequest.m", 188, "nil != self->_passID");
}

@end