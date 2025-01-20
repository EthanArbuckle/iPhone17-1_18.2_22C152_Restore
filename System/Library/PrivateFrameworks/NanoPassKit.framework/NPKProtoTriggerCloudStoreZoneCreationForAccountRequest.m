@interface NPKProtoTriggerCloudStoreZoneCreationForAccountRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)accountData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoTriggerCloudStoreZoneCreationForAccountRequest

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoTriggerCloudStoreZoneCreationForAccountRequest;
  v4 = [(NPKProtoTriggerCloudStoreZoneCreationForAccountRequest *)&v8 description];
  v5 = [(NPKProtoTriggerCloudStoreZoneCreationForAccountRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  accountData = self->_accountData;
  if (accountData) {
    [v3 setObject:accountData forKey:@"accountData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoTriggerCloudStoreZoneCreationForAccountRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_accountData) {
    -[NPKProtoTriggerCloudStoreZoneCreationForAccountRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_accountData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    accountData = self->_accountData;
    if ((unint64_t)accountData | v4[1]) {
      char v6 = -[NSData isEqual:](accountData, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_accountData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoTriggerCloudStoreZoneCreationForAccountRequest setAccountData:](self, "setAccountData:");
  }
}

- (NSData)accountData
{
  return self->_accountData;
}

- (void)setAccountData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoTriggerCloudStoreZoneCreationForAccountRequest writeTo:]", "NPKProtoTriggerCloudStoreZoneCreationForAccountRequest.m", 72, "nil != self->_accountData");
}

@end