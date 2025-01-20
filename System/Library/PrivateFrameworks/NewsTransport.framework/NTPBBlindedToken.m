@interface NTPBBlindedToken
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)token;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)keyId;
- (void)mergeFrom:(id)a3;
- (void)setKeyId:(unsigned int)a3;
- (void)setToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBBlindedToken

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBBlindedToken;
  v4 = [(NTPBBlindedToken *)&v8 description];
  v5 = [(NTPBBlindedToken *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  v6 = [NSNumber numberWithUnsignedInt:self->_keyId];
  [v4 setObject:v6 forKey:@"key_id"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBlindedTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDataField();
  PBDataWriterWriteUint32Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_token copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_keyId;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((token = self->_token, !((unint64_t)token | *((void *)v4 + 2)))
     || -[NSData isEqual:](token, "isEqual:"))
    && self->_keyId == *((_DWORD *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_keyId) ^ [(NSData *)self->_token hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unsigned int *)a3;
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[NTPBBlindedToken setToken:](self, "setToken:");
    id v4 = v5;
  }
  self->_keyId = v4[2];
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (unsigned)keyId
{
  return self->_keyId;
}

- (void)setKeyId:(unsigned int)a3
{
  self->_keyId = a3;
}

- (void).cxx_destruct
{
}

@end