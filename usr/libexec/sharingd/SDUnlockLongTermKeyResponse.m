@interface SDUnlockLongTermKeyResponse
- (BOOL)hasKeyFailed;
- (BOOL)hasLongTermKey;
- (BOOL)hasRequestID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyFailed;
- (BOOL)readFrom:(id)a3;
- (NSData)longTermKey;
- (NSString)requestID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasKeyFailed:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setKeyFailed:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockLongTermKeyResponse

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0;
}

- (void)setKeyFailed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_keyFailed = a3;
}

- (void)setHasKeyFailed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKeyFailed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockLongTermKeyResponse;
  char v3 = [(SDUnlockLongTermKeyResponse *)&v7 description];
  v4 = [(SDUnlockLongTermKeyResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    [v3 setObject:longTermKey forKey:@"longTermKey"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_keyFailed];
    [v3 setObject:v7 forKey:@"keyFailed"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockLongTermKeyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_requestID) {
    PBDataWriterWriteStringField();
  }
  if (self->_longTermKey) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_requestID)
  {
    [v4 setRequestID:];
    id v4 = v5;
  }
  if (self->_longTermKey)
  {
    [v5 setLongTermKey:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 28) = self->_keyFailed;
    *((unsigned char *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[6] = self->_version;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v7 = [(NSString *)self->_requestID copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(NSData *)self->_longTermKey copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v6 + 28) = self->_keyFailed;
    *((unsigned char *)v6 + 32) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_13;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((void *)v4 + 2) && !-[NSString isEqual:](requestID, "isEqual:")) {
    goto LABEL_13;
  }
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](longTermKey, "isEqual:")) {
      goto LABEL_13;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0)
    {
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }
    if (self->_keyFailed)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_13;
    }
    BOOL v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_requestID hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_longTermKey hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_keyFailed;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 32))
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SDUnlockLongTermKeyResponse setRequestID:](self, "setRequestID:");
    id v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[SDUnlockLongTermKeyResponse setLongTermKey:](self, "setLongTermKey:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    self->_keyFailed = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
}

- (BOOL)keyFailed
{
  return self->_keyFailed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_longTermKey, 0);
}

@end