@interface NPKProtoPrepareProvisioningTargetResponse
- (BOOL)hasEncryptedTargetData;
- (BOOL)hasErrorData;
- (BOOL)hasWasFamilyCircle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasFamilyCircle;
- (NSData)encryptedTargetData;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedTargetData:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasWasFamilyCircle:(BOOL)a3;
- (void)setWasFamilyCircle:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPrepareProvisioningTargetResponse

- (BOOL)hasEncryptedTargetData
{
  return self->_encryptedTargetData != 0;
}

- (void)setWasFamilyCircle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_wasFamilyCircle = a3;
}

- (void)setHasWasFamilyCircle:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWasFamilyCircle
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
  v8.super_class = (Class)NPKProtoPrepareProvisioningTargetResponse;
  v4 = [(NPKProtoPrepareProvisioningTargetResponse *)&v8 description];
  v5 = [(NPKProtoPrepareProvisioningTargetResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  encryptedTargetData = self->_encryptedTargetData;
  if (encryptedTargetData) {
    [v3 setObject:encryptedTargetData forKey:@"encryptedTargetData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_wasFamilyCircle];
    [v4 setObject:v6 forKey:@"wasFamilyCircle"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPrepareProvisioningTargetResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptedTargetData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
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
  id v5 = v4;
  if (self->_encryptedTargetData)
  {
    objc_msgSend(v4, "setEncryptedTargetData:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_wasFamilyCircle;
    v4[28] |= 1u;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_encryptedTargetData copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_wasFamilyCircle;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  encryptedTargetData = self->_encryptedTargetData;
  if ((unint64_t)encryptedTargetData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](encryptedTargetData, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_wasFamilyCircle)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](errorData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_encryptedTargetData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_wasFamilyCircle;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSData *)self->_errorData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NPKProtoPrepareProvisioningTargetResponse setEncryptedTargetData:](self, "setEncryptedTargetData:");
    uint64_t v4 = v5;
  }
  if (v4[28])
  {
    self->_wasFamilyCircle = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoPrepareProvisioningTargetResponse setErrorData:](self, "setErrorData:");
    uint64_t v4 = v5;
  }
}

- (NSData)encryptedTargetData
{
  return self->_encryptedTargetData;
}

- (void)setEncryptedTargetData:(id)a3
{
}

- (BOOL)wasFamilyCircle
{
  return self->_wasFamilyCircle;
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
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_encryptedTargetData, 0);
}

@end