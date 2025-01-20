@interface PKProtobufRemoteRegistrationRequestResult
- (BOOL)hasResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)result;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setResult:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufRemoteRegistrationRequestResult

- (void)setResult:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResult
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufRemoteRegistrationRequestResult;
  v4 = [(PKProtobufRemoteRegistrationRequestResult *)&v8 description];
  v5 = [(PKProtobufRemoteRegistrationRequestResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  if (*(unsigned char *)&self->_has)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_result];
    [v3 setObject:v5 forKey:@"result"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRemoteRegistrationRequestResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = self->_version;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_result;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = self->_version;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_result;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_version != *((_DWORD *)v4 + 3)) {
    goto LABEL_7;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_result == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_result;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 ^ (2654435761 * self->_version);
}

- (void)mergeFrom:(id)a3
{
  self->_version = *((_DWORD *)a3 + 3);
  if (*((unsigned char *)a3 + 16))
  {
    self->_id result = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)result
{
  return self->_result;
}

@end