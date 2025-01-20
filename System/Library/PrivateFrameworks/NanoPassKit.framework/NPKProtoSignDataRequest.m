@interface NPKProtoSignDataRequest
- (BOOL)hasAid;
- (BOOL)hasDataToSign;
- (BOOL)hasDigestToSign;
- (BOOL)hasEntanglementMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataToSign;
- (NSData)digestToSign;
- (NSString)aid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entanglementModeAsString:(int)a3;
- (int)StringAsEntanglementMode:(id)a3;
- (int)entanglementMode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAid:(id)a3;
- (void)setDataToSign:(id)a3;
- (void)setDigestToSign:(id)a3;
- (void)setEntanglementMode:(int)a3;
- (void)setHasEntanglementMode:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSignDataRequest

- (BOOL)hasDataToSign
{
  return self->_dataToSign != 0;
}

- (BOOL)hasDigestToSign
{
  return self->_digestToSign != 0;
}

- (int)entanglementMode
{
  if (*(unsigned char *)&self->_has) {
    return self->_entanglementMode;
  }
  else {
    return 0;
  }
}

- (void)setEntanglementMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_entanglementMode = a3;
}

- (void)setHasEntanglementMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntanglementMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)entanglementModeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"JCOPInfo";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"PlatformIdentifier";
  }
  return v4;
}

- (int)StringAsEntanglementMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PlatformIdentifier"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"JCOPInfo"];
  }

  return v4;
}

- (BOOL)hasAid
{
  return self->_aid != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSignDataRequest;
  int v4 = [(NPKProtoSignDataRequest *)&v8 description];
  v5 = [(NPKProtoSignDataRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  dataToSign = self->_dataToSign;
  if (dataToSign) {
    [v3 setObject:dataToSign forKey:@"dataToSign"];
  }
  digestToSign = self->_digestToSign;
  if (digestToSign) {
    [v4 setObject:digestToSign forKey:@"digestToSign"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int entanglementMode = self->_entanglementMode;
    if (entanglementMode)
    {
      if (entanglementMode == 1)
      {
        objc_super v8 = @"JCOPInfo";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_entanglementMode);
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_super v8 = @"PlatformIdentifier";
    }
    [v4 setObject:v8 forKey:@"entanglementMode"];
  }
  aid = self->_aid;
  if (aid) {
    [v4 setObject:aid forKey:@"aid"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSignDataRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dataToSign)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_digestToSign)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_aid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dataToSign)
  {
    objc_msgSend(v4, "setDataToSign:");
    id v4 = v5;
  }
  if (self->_digestToSign)
  {
    objc_msgSend(v5, "setDigestToSign:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_entanglementMode;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_aid)
  {
    objc_msgSend(v5, "setAid:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_dataToSign copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSData *)self->_digestToSign copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_entanglementMode;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_aid copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  dataToSign = self->_dataToSign;
  if ((unint64_t)dataToSign | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](dataToSign, "isEqual:")) {
      goto LABEL_13;
    }
  }
  digestToSign = self->_digestToSign;
  if ((unint64_t)digestToSign | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](digestToSign, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_entanglementMode != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  aid = self->_aid;
  if ((unint64_t)aid | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](aid, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_dataToSign hash];
  uint64_t v4 = [(NSData *)self->_digestToSign hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_entanglementMode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_aid hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoSignDataRequest setDataToSign:](self, "setDataToSign:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoSignDataRequest setDigestToSign:](self, "setDigestToSign:");
    uint64_t v4 = v5;
  }
  if (v4[9])
  {
    self->_int entanglementMode = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoSignDataRequest setAid:](self, "setAid:");
    uint64_t v4 = v5;
  }
}

- (NSData)dataToSign
{
  return self->_dataToSign;
}

- (void)setDataToSign:(id)a3
{
}

- (NSData)digestToSign
{
  return self->_digestToSign;
}

- (void)setDigestToSign:(id)a3
{
}

- (NSString)aid
{
  return self->_aid;
}

- (void)setAid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestToSign, 0);
  objc_storeStrong((id *)&self->_dataToSign, 0);
  objc_storeStrong((id *)&self->_aid, 0);
}

@end