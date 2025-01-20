@interface NPKProtoRemoteAdminPerformResponse
- (BOOL)hasHttpStatus;
- (BOOL)hasResponseDictionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)responseDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)httpStatus;
- (unint64_t)hash;
- (unsigned)resultCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHttpStatus:(BOOL)a3;
- (void)setHttpStatus:(int)a3;
- (void)setResponseDictionary:(id)a3;
- (void)setResultCode:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemoteAdminPerformResponse

- (BOOL)hasResponseDictionary
{
  return self->_responseDictionary != 0;
}

- (void)setHttpStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_httpStatus = a3;
}

- (void)setHasHttpStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHttpStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemoteAdminPerformResponse;
  v4 = [(NPKProtoRemoteAdminPerformResponse *)&v8 description];
  v5 = [(NPKProtoRemoteAdminPerformResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_resultCode];
  [v3 setObject:v4 forKey:@"resultCode"];

  responseDictionary = self->_responseDictionary;
  if (responseDictionary) {
    [v3 setObject:responseDictionary forKey:@"responseDictionary"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_httpStatus];
    [v3 setObject:v6 forKey:@"httpStatus"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemoteAdminPerformResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_responseDictionary) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[6] = self->_resultCode;
  if (self->_responseDictionary)
  {
    v5 = v4;
    objc_msgSend(v4, "setResponseDictionary:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_httpStatus;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_resultCode;
  uint64_t v6 = [(NSData *)self->_responseDictionary copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_httpStatus;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (self->_resultCode != *((_DWORD *)v4 + 6)) {
    goto LABEL_9;
  }
  responseDictionary = self->_responseDictionary;
  if ((unint64_t)responseDictionary | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](responseDictionary, "isEqual:")) {
      goto LABEL_9;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_httpStatus == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_10;
    }
LABEL_9:
    BOOL v6 = 0;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unsigned int resultCode = self->_resultCode;
  uint64_t v4 = [(NSData *)self->_responseDictionary hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_httpStatus;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v5 ^ (2654435761 * resultCode);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  self->_unsigned int resultCode = v4[6];
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[NPKProtoRemoteAdminPerformResponse setResponseDictionary:](self, "setResponseDictionary:");
    uint64_t v4 = v5;
  }
  if (v4[7])
  {
    self->_httpStatus = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(unsigned int)a3
{
  self->_unsigned int resultCode = a3;
}

- (NSData)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
}

- (int)httpStatus
{
  return self->_httpStatus;
}

- (void).cxx_destruct
{
}

@end