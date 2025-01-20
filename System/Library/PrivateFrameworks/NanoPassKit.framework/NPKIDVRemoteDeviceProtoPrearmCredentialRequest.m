@interface NPKIDVRemoteDeviceProtoPrearmCredentialRequest
- (BOOL)hasAuthorizationTokenData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authorizationTokenData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizationTokenData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoPrearmCredentialRequest

- (BOOL)hasAuthorizationTokenData
{
  return self->_authorizationTokenData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoPrearmCredentialRequest;
  v4 = [(NPKIDVRemoteDeviceProtoPrearmCredentialRequest *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoPrearmCredentialRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  authorizationTokenData = self->_authorizationTokenData;
  if (authorizationTokenData) {
    [v3 setObject:authorizationTokenData forKey:@"authorizationTokenData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoPrearmCredentialRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_authorizationTokenData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  authorizationTokenData = self->_authorizationTokenData;
  if (authorizationTokenData) {
    [a3 setAuthorizationTokenData:authorizationTokenData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_authorizationTokenData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    authorizationTokenData = self->_authorizationTokenData;
    if ((unint64_t)authorizationTokenData | v4[1]) {
      char v6 = -[NSData isEqual:](authorizationTokenData, "isEqual:");
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
  return [(NSData *)self->_authorizationTokenData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKIDVRemoteDeviceProtoPrearmCredentialRequest setAuthorizationTokenData:](self, "setAuthorizationTokenData:");
  }
}

- (NSData)authorizationTokenData
{
  return self->_authorizationTokenData;
}

- (void)setAuthorizationTokenData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end