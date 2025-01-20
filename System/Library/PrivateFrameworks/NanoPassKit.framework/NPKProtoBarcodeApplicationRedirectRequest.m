@interface NPKProtoBarcodeApplicationRedirectRequest
- (BOOL)hasAppLaunchToken;
- (BOOL)hasPassData;
- (BOOL)hasTransactionData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)passData;
- (NSData)transactionData;
- (NSString)appLaunchToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppLaunchToken:(id)a3;
- (void)setPassData:(id)a3;
- (void)setTransactionData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoBarcodeApplicationRedirectRequest

- (BOOL)hasPassData
{
  return self->_passData != 0;
}

- (BOOL)hasTransactionData
{
  return self->_transactionData != 0;
}

- (BOOL)hasAppLaunchToken
{
  return self->_appLaunchToken != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoBarcodeApplicationRedirectRequest;
  v4 = [(NPKProtoBarcodeApplicationRedirectRequest *)&v8 description];
  v5 = [(NPKProtoBarcodeApplicationRedirectRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passData = self->_passData;
  if (passData) {
    [v3 setObject:passData forKey:@"passData"];
  }
  transactionData = self->_transactionData;
  if (transactionData) {
    [v4 setObject:transactionData forKey:@"transactionData"];
  }
  appLaunchToken = self->_appLaunchToken;
  if (appLaunchToken) {
    [v4 setObject:appLaunchToken forKey:@"appLaunchToken"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoBarcodeApplicationRedirectRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_passData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_transactionData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_appLaunchToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_passData)
  {
    objc_msgSend(v4, "setPassData:");
    id v4 = v5;
  }
  if (self->_transactionData)
  {
    objc_msgSend(v5, "setTransactionData:");
    id v4 = v5;
  }
  if (self->_appLaunchToken)
  {
    objc_msgSend(v5, "setAppLaunchToken:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_passData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_transactionData copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_appLaunchToken copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((passData = self->_passData, !((unint64_t)passData | v4[2]))
     || -[NSData isEqual:](passData, "isEqual:"))
    && ((transactionData = self->_transactionData, !((unint64_t)transactionData | v4[3]))
     || -[NSData isEqual:](transactionData, "isEqual:")))
  {
    appLaunchToken = self->_appLaunchToken;
    if ((unint64_t)appLaunchToken | v4[1]) {
      char v8 = -[NSString isEqual:](appLaunchToken, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_passData hash];
  uint64_t v4 = [(NSData *)self->_transactionData hash] ^ v3;
  return v4 ^ [(NSString *)self->_appLaunchToken hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[2]) {
    -[NPKProtoBarcodeApplicationRedirectRequest setPassData:](self, "setPassData:");
  }
  if (v4[3]) {
    -[NPKProtoBarcodeApplicationRedirectRequest setTransactionData:](self, "setTransactionData:");
  }
  if (v4[1]) {
    -[NPKProtoBarcodeApplicationRedirectRequest setAppLaunchToken:](self, "setAppLaunchToken:");
  }
}

- (NSData)passData
{
  return self->_passData;
}

- (void)setPassData:(id)a3
{
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (void)setTransactionData:(id)a3
{
}

- (NSString)appLaunchToken
{
  return self->_appLaunchToken;
}

- (void)setAppLaunchToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_appLaunchToken, 0);
}

@end