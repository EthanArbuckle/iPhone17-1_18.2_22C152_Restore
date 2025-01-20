@interface NPKProtoHasActiveExternallySharedPassesResponse
- (BOOL)hasActiveExternallySharedPasses;
- (BOOL)hasErrorData;
- (BOOL)hasHasActiveExternallySharedPasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasActiveExternallySharedPasses:(BOOL)a3;
- (void)setHasHasActiveExternallySharedPasses:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoHasActiveExternallySharedPassesResponse

- (void)setHasActiveExternallySharedPasses:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hasActiveExternallySharedPasses = a3;
}

- (void)setHasHasActiveExternallySharedPasses:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasActiveExternallySharedPasses
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoHasActiveExternallySharedPassesResponse;
  v4 = [(NPKProtoHasActiveExternallySharedPassesResponse *)&v8 description];
  v5 = [(NPKProtoHasActiveExternallySharedPassesResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_hasActiveExternallySharedPasses];
    [v3 setObject:v4 forKey:@"hasActiveExternallySharedPasses"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoHasActiveExternallySharedPassesResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_errorData)
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
    v4[16] = self->_hasActiveExternallySharedPasses;
    v4[20] |= 1u;
  }
  if (self->_errorData)
  {
    id v5 = v4;
    objc_msgSend(v4, "setErrorData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_hasActiveExternallySharedPasses;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_errorData copyWithZone:a3];
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
      if (self->_hasActiveExternallySharedPasses)
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
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1)) {
    char v5 = -[NSData isEqual:](errorData, "isEqual:");
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
    uint64_t v2 = 2654435761 * self->_hasActiveExternallySharedPasses;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_errorData hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[20])
  {
    self->_hasActiveExternallySharedPasses = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    char v5 = v4;
    -[NPKProtoHasActiveExternallySharedPassesResponse setErrorData:](self, "setErrorData:");
    id v4 = v5;
  }
}

- (BOOL)hasActiveExternallySharedPasses
{
  return self->_hasActiveExternallySharedPasses;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end