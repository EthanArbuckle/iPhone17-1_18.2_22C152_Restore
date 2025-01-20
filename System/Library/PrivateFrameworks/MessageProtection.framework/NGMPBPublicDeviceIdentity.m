@interface NGMPBPublicDeviceIdentity
- (BOOL)hasTetraVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)signingKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)tetraVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTetraVersion:(BOOL)a3;
- (void)setSigningKey:(id)a3;
- (void)setTetraVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NGMPBPublicDeviceIdentity

- (void)setTetraVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tetraVersion = a3;
}

- (void)setHasTetraVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTetraVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NGMPBPublicDeviceIdentity;
  v4 = [(NGMPBPublicDeviceIdentity *)&v8 description];
  v5 = [(NGMPBPublicDeviceIdentity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  signingKey = self->_signingKey;
  if (signingKey) {
    [v3 setObject:signingKey forKey:@"signing_key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_tetraVersion];
    [v4 setObject:v6 forKey:@"tetraVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBPublicDeviceIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_signingKey) {
    -[NGMPBPublicDeviceIdentity writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setSigningKey:self->_signingKey];
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_tetraVersion;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_signingKey copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_tetraVersion;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  signingKey = self->_signingKey;
  if ((unint64_t)signingKey | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](signingKey, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_tetraVersion == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_signingKey hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_tetraVersion;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NGMPBPublicDeviceIdentity setSigningKey:](self, "setSigningKey:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_tetraVersion = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
}

- (unsigned)tetraVersion
{
  return self->_tetraVersion;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBPublicDeviceIdentity writeTo:]", "NGMPBPublicDeviceIdentity.m", 96, "nil != self->_signingKey");
}

@end