@interface NPKProtoRegistrationDataResponse
- (BOOL)hasPending;
- (BOOL)hasPushToken;
- (BOOL)hasRegistrationDataBytes;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)registrationDataBytes;
- (NSString)pushToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setPushToken:(id)a3;
- (void)setRegistrationDataBytes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRegistrationDataResponse

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

- (BOOL)hasRegistrationDataBytes
{
  return self->_registrationDataBytes != 0;
}

- (BOOL)hasPushToken
{
  return self->_pushToken != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRegistrationDataResponse;
  v4 = [(NPKProtoRegistrationDataResponse *)&v8 description];
  v5 = [(NPKProtoRegistrationDataResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v4 forKey:@"pending"];
  }
  registrationDataBytes = self->_registrationDataBytes;
  if (registrationDataBytes) {
    [v3 setObject:registrationDataBytes forKey:@"registrationDataBytes"];
  }
  pushToken = self->_pushToken;
  if (pushToken) {
    [v3 setObject:pushToken forKey:@"pushToken"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRegistrationDataResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_registrationDataBytes)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_pushToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_pending;
    v4[28] |= 1u;
  }
  id v5 = v4;
  if (self->_registrationDataBytes)
  {
    objc_msgSend(v4, "setRegistrationDataBytes:");
    id v4 = v5;
  }
  if (self->_pushToken)
  {
    objc_msgSend(v5, "setPushToken:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_pending;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_registrationDataBytes copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_pushToken copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_pending)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    char v7 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_14;
  }
LABEL_10:
  registrationDataBytes = self->_registrationDataBytes;
  if ((unint64_t)registrationDataBytes | *((void *)v4 + 2)
    && !-[NSData isEqual:](registrationDataBytes, "isEqual:"))
  {
    goto LABEL_14;
  }
  pushToken = self->_pushToken;
  if ((unint64_t)pushToken | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](pushToken, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_registrationDataBytes hash] ^ v3;
  return v4 ^ [(NSString *)self->_pushToken hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[28])
  {
    self->_pending = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoRegistrationDataResponse setRegistrationDataBytes:](self, "setRegistrationDataBytes:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoRegistrationDataResponse setPushToken:](self, "setPushToken:");
    uint64_t v4 = v5;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (NSData)registrationDataBytes
{
  return self->_registrationDataBytes;
}

- (void)setRegistrationDataBytes:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationDataBytes, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end