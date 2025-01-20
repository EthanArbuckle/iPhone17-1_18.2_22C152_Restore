@interface NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse
- (BOOL)hasErrorData;
- (BOOL)hasNonceData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSData)nonceData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setNonceData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse

- (BOOL)hasNonceData
{
  return self->_nonceData != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse;
  v4 = [(NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  nonceData = self->_nonceData;
  if (nonceData) {
    [v3 setObject:nonceData forKey:@"nonceData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_nonceData)
  {
    PBDataWriterWriteDataField();
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
  if (self->_nonceData)
  {
    objc_msgSend(v4, "setNonceData:");
    id v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_nonceData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((nonceData = self->_nonceData, !((unint64_t)nonceData | v4[2]))
     || -[NSData isEqual:](nonceData, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[1]) {
      char v7 = -[NSData isEqual:](errorData, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_nonceData hash];
  return [(NSData *)self->_errorData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse setNonceData:](self, "setNonceData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse setErrorData:](self, "setErrorData:");
    id v4 = v5;
  }
}

- (NSData)nonceData
{
  return self->_nonceData;
}

- (void)setNonceData:(id)a3
{
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
  objc_storeStrong((id *)&self->_nonceData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end