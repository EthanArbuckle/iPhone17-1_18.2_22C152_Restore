@interface NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response
- (BOOL)hasAttestationData;
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)attestationData;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttestationData:(id)a3;
- (void)setErrorData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasAttestationData
{
  return self->_attestationData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response;
  v4 = [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  attestationData = self->_attestationData;
  if (attestationData) {
    [v4 setObject:attestationData forKey:@"attestationData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2ResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_attestationData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_errorData)
  {
    objc_msgSend(v4, "setErrorData:");
    id v4 = v5;
  }
  if (self->_attestationData)
  {
    objc_msgSend(v5, "setAttestationData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_errorData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_attestationData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((errorData = self->_errorData, !((unint64_t)errorData | v4[2]))
     || -[NSData isEqual:](errorData, "isEqual:")))
  {
    attestationData = self->_attestationData;
    if ((unint64_t)attestationData | v4[1]) {
      char v7 = -[NSData isEqual:](attestationData, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_errorData hash];
  return [(NSData *)self->_attestationData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response setErrorData:](self, "setErrorData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response setAttestationData:](self, "setAttestationData:");
    id v4 = v5;
  }
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (NSData)attestationData
{
  return self->_attestationData;
}

- (void)setAttestationData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_attestationData, 0);
}

@end