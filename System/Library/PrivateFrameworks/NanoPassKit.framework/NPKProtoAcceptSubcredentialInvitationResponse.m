@interface NPKProtoAcceptSubcredentialInvitationResponse
- (BOOL)hasErrorData;
- (BOOL)hasPassForInvitation;
- (BOOL)hasPending;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NPKProtoPass)passForInvitation;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPassForInvitation:(id)a3;
- (void)setPending:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoAcceptSubcredentialInvitationResponse

- (BOOL)hasPassForInvitation
{
  return self->_passForInvitation != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAcceptSubcredentialInvitationResponse;
  v4 = [(NPKProtoAcceptSubcredentialInvitationResponse *)&v8 description];
  v5 = [(NPKProtoAcceptSubcredentialInvitationResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  passForInvitation = self->_passForInvitation;
  if (passForInvitation)
  {
    v5 = [(NPKProtoPass *)passForInvitation dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"passForInvitation"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v7 forKey:@"pending"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAcceptSubcredentialInvitationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_passForInvitation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_passForInvitation)
  {
    objc_msgSend(v4, "setPassForInvitation:");
    id v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_pending;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoPass *)self->_passForInvitation copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_pending;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  passForInvitation = self->_passForInvitation;
  if ((unint64_t)passForInvitation | *((void *)v4 + 2))
  {
    if (!-[NPKProtoPass isEqual:](passForInvitation, "isEqual:")) {
      goto LABEL_8;
    }
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](errorData, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoPass *)self->_passForInvitation hash];
  uint64_t v4 = [(NSData *)self->_errorData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  passForInvitation = self->_passForInvitation;
  uint64_t v6 = *((void *)v4 + 2);
  id v7 = v4;
  if (passForInvitation)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoPass mergeFrom:](passForInvitation, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoAcceptSubcredentialInvitationResponse setPassForInvitation:](self, "setPassForInvitation:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 1))
  {
    -[NPKProtoAcceptSubcredentialInvitationResponse setErrorData:](self, "setErrorData:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_pending = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NPKProtoPass)passForInvitation
{
  return self->_passForInvitation;
}

- (void)setPassForInvitation:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (BOOL)pending
{
  return self->_pending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passForInvitation, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end