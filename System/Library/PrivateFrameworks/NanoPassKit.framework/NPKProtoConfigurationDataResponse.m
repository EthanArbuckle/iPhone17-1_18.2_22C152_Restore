@interface NPKProtoConfigurationDataResponse
- (BOOL)hasConfigurationDataBytes;
- (BOOL)hasPending;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)configurationDataBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfigurationDataBytes:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoConfigurationDataResponse

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

- (BOOL)hasConfigurationDataBytes
{
  return self->_configurationDataBytes != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoConfigurationDataResponse;
  v4 = [(NPKProtoConfigurationDataResponse *)&v8 description];
  v5 = [(NPKProtoConfigurationDataResponse *)self dictionaryRepresentation];
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
  configurationDataBytes = self->_configurationDataBytes;
  if (configurationDataBytes) {
    [v3 setObject:configurationDataBytes forKey:@"configurationDataBytes"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoConfigurationDataResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_configurationDataBytes)
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
    v4[16] = self->_pending;
    v4[20] |= 1u;
  }
  if (self->_configurationDataBytes)
  {
    id v5 = v4;
    objc_msgSend(v4, "setConfigurationDataBytes:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_pending;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_configurationDataBytes copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_pending)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  configurationDataBytes = self->_configurationDataBytes;
  if ((unint64_t)configurationDataBytes | *((void *)v4 + 1)) {
    char v5 = -[NSData isEqual:](configurationDataBytes, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_configurationDataBytes hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[20])
  {
    self->_pending = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    char v5 = v4;
    -[NPKProtoConfigurationDataResponse setConfigurationDataBytes:](self, "setConfigurationDataBytes:");
    id v4 = v5;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (NSData)configurationDataBytes
{
  return self->_configurationDataBytes;
}

- (void)setConfigurationDataBytes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end