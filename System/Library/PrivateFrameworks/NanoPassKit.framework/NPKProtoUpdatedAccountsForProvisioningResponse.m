@interface NPKProtoUpdatedAccountsForProvisioningResponse
- (BOOL)hasAccountsOnDeviceData;
- (BOOL)hasAccountsRequiringProvisioningData;
- (BOOL)hasPending;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)accountsOnDeviceData;
- (NSData)accountsRequiringProvisioningData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountsOnDeviceData:(id)a3;
- (void)setAccountsRequiringProvisioningData:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoUpdatedAccountsForProvisioningResponse

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

- (BOOL)hasAccountsRequiringProvisioningData
{
  return self->_accountsRequiringProvisioningData != 0;
}

- (BOOL)hasAccountsOnDeviceData
{
  return self->_accountsOnDeviceData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoUpdatedAccountsForProvisioningResponse;
  v4 = [(NPKProtoUpdatedAccountsForProvisioningResponse *)&v8 description];
  v5 = [(NPKProtoUpdatedAccountsForProvisioningResponse *)self dictionaryRepresentation];
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
  accountsRequiringProvisioningData = self->_accountsRequiringProvisioningData;
  if (accountsRequiringProvisioningData) {
    [v3 setObject:accountsRequiringProvisioningData forKey:@"accountsRequiringProvisioningData"];
  }
  accountsOnDeviceData = self->_accountsOnDeviceData;
  if (accountsOnDeviceData) {
    [v3 setObject:accountsOnDeviceData forKey:@"accountsOnDeviceData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdatedAccountsForProvisioningResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_accountsRequiringProvisioningData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_accountsOnDeviceData)
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
    v4[24] = self->_pending;
    v4[28] |= 1u;
  }
  id v5 = v4;
  if (self->_accountsRequiringProvisioningData)
  {
    objc_msgSend(v4, "setAccountsRequiringProvisioningData:");
    id v4 = v5;
  }
  if (self->_accountsOnDeviceData)
  {
    objc_msgSend(v5, "setAccountsOnDeviceData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_pending;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_accountsRequiringProvisioningData copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSData *)self->_accountsOnDeviceData copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_pending)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    char v7 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_14;
  }
LABEL_10:
  accountsRequiringProvisioningData = self->_accountsRequiringProvisioningData;
  if ((unint64_t)accountsRequiringProvisioningData | *((void *)v4 + 2)
    && !-[NSData isEqual:](accountsRequiringProvisioningData, "isEqual:"))
  {
    goto LABEL_14;
  }
  accountsOnDeviceData = self->_accountsOnDeviceData;
  if ((unint64_t)accountsOnDeviceData | *((void *)v4 + 1)) {
    char v7 = -[NSData isEqual:](accountsOnDeviceData, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_accountsRequiringProvisioningData hash] ^ v3;
  return v4 ^ [(NSData *)self->_accountsOnDeviceData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[28])
  {
    self->_pending = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoUpdatedAccountsForProvisioningResponse setAccountsRequiringProvisioningData:](self, "setAccountsRequiringProvisioningData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoUpdatedAccountsForProvisioningResponse setAccountsOnDeviceData:](self, "setAccountsOnDeviceData:");
    uint64_t v4 = v5;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (NSData)accountsRequiringProvisioningData
{
  return self->_accountsRequiringProvisioningData;
}

- (void)setAccountsRequiringProvisioningData:(id)a3
{
}

- (NSData)accountsOnDeviceData
{
  return self->_accountsOnDeviceData;
}

- (void)setAccountsOnDeviceData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsRequiringProvisioningData, 0);
  objc_storeStrong((id *)&self->_accountsOnDeviceData, 0);
}

@end