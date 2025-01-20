@interface NPKIDVRemoteDeviceProtoCredentialPropertiesResponse
- (BOOL)hasCredentialPropertiesData;
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)credentialPropertiesData;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredentialPropertiesData:(id)a3;
- (void)setErrorData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoCredentialPropertiesResponse

- (BOOL)hasCredentialPropertiesData
{
  return self->_credentialPropertiesData != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoCredentialPropertiesResponse;
  v4 = [(NPKIDVRemoteDeviceProtoCredentialPropertiesResponse *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoCredentialPropertiesResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  credentialPropertiesData = self->_credentialPropertiesData;
  if (credentialPropertiesData) {
    [v3 setObject:credentialPropertiesData forKey:@"credentialPropertiesData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoCredentialPropertiesResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_credentialPropertiesData)
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
  if (self->_credentialPropertiesData)
  {
    objc_msgSend(v4, "setCredentialPropertiesData:");
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
  uint64_t v6 = [(NSData *)self->_credentialPropertiesData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((credentialPropertiesData = self->_credentialPropertiesData,
         !((unint64_t)credentialPropertiesData | v4[1]))
     || -[NSData isEqual:](credentialPropertiesData, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[2]) {
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
  uint64_t v3 = [(NSData *)self->_credentialPropertiesData hash];
  return [(NSData *)self->_errorData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[NPKIDVRemoteDeviceProtoCredentialPropertiesResponse setCredentialPropertiesData:](self, "setCredentialPropertiesData:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NPKIDVRemoteDeviceProtoCredentialPropertiesResponse setErrorData:](self, "setErrorData:");
    id v4 = v5;
  }
}

- (NSData)credentialPropertiesData
{
  return self->_credentialPropertiesData;
}

- (void)setCredentialPropertiesData:(id)a3
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
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_credentialPropertiesData, 0);
}

@end