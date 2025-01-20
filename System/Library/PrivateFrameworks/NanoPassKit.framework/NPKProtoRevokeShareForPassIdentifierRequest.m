@interface NPKProtoRevokeShareForPassIdentifierRequest
- (BOOL)hasShouldCascade;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldCascade;
- (NSData)shareData;
- (NSString)passIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasShouldCascade:(BOOL)a3;
- (void)setPassIdentifier:(id)a3;
- (void)setShareData:(id)a3;
- (void)setShouldCascade:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRevokeShareForPassIdentifierRequest

- (void)setShouldCascade:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldCascade = a3;
}

- (void)setHasShouldCascade:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldCascade
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRevokeShareForPassIdentifierRequest;
  v4 = [(NPKProtoRevokeShareForPassIdentifierRequest *)&v8 description];
  v5 = [(NPKProtoRevokeShareForPassIdentifierRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passIdentifier = self->_passIdentifier;
  if (passIdentifier) {
    [v3 setObject:passIdentifier forKey:@"passIdentifier"];
  }
  shareData = self->_shareData;
  if (shareData) {
    [v4 setObject:shareData forKey:@"shareData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_shouldCascade];
    [v4 setObject:v7 forKey:@"shouldCascade"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRevokeShareForPassIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_passIdentifier) {
    -[NPKProtoRevokeShareForPassIdentifierRequest writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_shareData) {
    -[NPKProtoRevokeShareForPassIdentifierRequest writeTo:]();
  }
  PBDataWriterWriteDataField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setPassIdentifier:self->_passIdentifier];
  [v4 setShareData:self->_shareData];
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_shouldCascade;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSData *)self->_shareData copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_shouldCascade;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  passIdentifier = self->_passIdentifier;
  if ((unint64_t)passIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](passIdentifier, "isEqual:")) {
      goto LABEL_8;
    }
  }
  shareData = self->_shareData;
  if ((unint64_t)shareData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](shareData, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_shouldCascade)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passIdentifier hash];
  uint64_t v4 = [(NSData *)self->_shareData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_shouldCascade;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NPKProtoRevokeShareForPassIdentifierRequest setPassIdentifier:](self, "setPassIdentifier:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoRevokeShareForPassIdentifierRequest setShareData:](self, "setShareData:");
    uint64_t v4 = v5;
  }
  if (v4[28])
  {
    self->_shouldCascade = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void)setPassIdentifier:(id)a3
{
}

- (NSData)shareData
{
  return self->_shareData;
}

- (void)setShareData:(id)a3
{
}

- (BOOL)shouldCascade
{
  return self->_shouldCascade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareData, 0);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRevokeShareForPassIdentifierRequest writeTo:]", "NPKProtoRevokeShareForPassIdentifierRequest.m", 107, "nil != self->_passIdentifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoRevokeShareForPassIdentifierRequest writeTo:]", "NPKProtoRevokeShareForPassIdentifierRequest.m", 112, "nil != self->_shareData");
}

@end