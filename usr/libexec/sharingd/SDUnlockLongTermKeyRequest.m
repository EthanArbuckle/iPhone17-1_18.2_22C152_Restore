@interface SDUnlockLongTermKeyRequest
- (BOOL)hasLongTermKey;
- (BOOL)hasRequestID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
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
- (void)setHasVersion:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockLongTermKeyRequest

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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockLongTermKeyRequest;
  v3 = [(SDUnlockLongTermKeyRequest *)&v7 description];
  v4 = [(SDUnlockLongTermKeyRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
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

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockLongTermKeyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_requestID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_longTermKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_version;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  id v7 = [(NSString *)self->_requestID copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(NSData *)self->_longTermKey copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((void *)v4 + 2) && !-[NSString isEqual:](requestID, "isEqual:")) {
    goto LABEL_11;
  }
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSData isEqual:](longTermKey, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

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
  unint64_t v4 = [(NSString *)self->_requestID hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_longTermKey hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[7])
  {
    self->_version = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SDUnlockLongTermKeyRequest setRequestID:](self, "setRequestID:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[SDUnlockLongTermKeyRequest setLongTermKey:](self, "setLongTermKey:");
    unint64_t v4 = v5;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_longTermKey, 0);
}

@end