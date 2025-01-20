@interface NPKProtoCarKeyAcceptInvitationResponse
- (BOOL)hasPending;
- (BOOL)hasResultData;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)resultData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setResultData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyAcceptInvitationResponse

- (BOOL)hasResultData
{
  return self->_resultData != 0;
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
  v8.super_class = (Class)NPKProtoCarKeyAcceptInvitationResponse;
  v4 = [(NPKProtoCarKeyAcceptInvitationResponse *)&v8 description];
  v5 = [(NPKProtoCarKeyAcceptInvitationResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  resultData = self->_resultData;
  if (resultData) {
    [v3 setObject:resultData forKey:@"resultData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_pending];
    [v4 setObject:v6 forKey:@"pending"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyAcceptInvitationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_resultData)
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
  if (self->_resultData)
  {
    id v5 = v4;
    objc_msgSend(v4, "setResultData:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_pending;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_resultData copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_pending;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  resultData = self->_resultData;
  if ((unint64_t)resultData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](resultData, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_resultData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NPKProtoCarKeyAcceptInvitationResponse setResultData:](self, "setResultData:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_pending = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)resultData
{
  return self->_resultData;
}

- (void)setResultData:(id)a3
{
}

- (BOOL)pending
{
  return self->_pending;
}

- (void).cxx_destruct
{
}

@end