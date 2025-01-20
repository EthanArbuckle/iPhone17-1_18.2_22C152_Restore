@interface NPKIDVRemoteDeviceProtoCreateCredentialRequest
- (BOOL)hasCredentialOptionsData;
- (BOOL)hasPartitionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)credentialOptionsData;
- (NSString)partitionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredentialOptionsData:(id)a3;
- (void)setPartitionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoCreateCredentialRequest

- (BOOL)hasPartitionIdentifier
{
  return self->_partitionIdentifier != 0;
}

- (BOOL)hasCredentialOptionsData
{
  return self->_credentialOptionsData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoCreateCredentialRequest;
  v4 = [(NPKIDVRemoteDeviceProtoCreateCredentialRequest *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoCreateCredentialRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  partitionIdentifier = self->_partitionIdentifier;
  if (partitionIdentifier) {
    [v3 setObject:partitionIdentifier forKey:@"partitionIdentifier"];
  }
  credentialOptionsData = self->_credentialOptionsData;
  if (credentialOptionsData) {
    [v4 setObject:credentialOptionsData forKey:@"credentialOptionsData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoCreateCredentialRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_partitionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_credentialOptionsData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_partitionIdentifier)
  {
    objc_msgSend(v4, "setPartitionIdentifier:");
    id v4 = v5;
  }
  if (self->_credentialOptionsData)
  {
    objc_msgSend(v5, "setCredentialOptionsData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_partitionIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_credentialOptionsData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((partitionIdentifier = self->_partitionIdentifier, !((unint64_t)partitionIdentifier | v4[2]))
     || -[NSString isEqual:](partitionIdentifier, "isEqual:")))
  {
    credentialOptionsData = self->_credentialOptionsData;
    if ((unint64_t)credentialOptionsData | v4[1]) {
      char v7 = -[NSData isEqual:](credentialOptionsData, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_partitionIdentifier hash];
  return [(NSData *)self->_credentialOptionsData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKIDVRemoteDeviceProtoCreateCredentialRequest setPartitionIdentifier:](self, "setPartitionIdentifier:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKIDVRemoteDeviceProtoCreateCredentialRequest setCredentialOptionsData:](self, "setCredentialOptionsData:");
    id v4 = v5;
  }
}

- (NSString)partitionIdentifier
{
  return self->_partitionIdentifier;
}

- (void)setPartitionIdentifier:(id)a3
{
}

- (NSData)credentialOptionsData
{
  return self->_credentialOptionsData;
}

- (void)setCredentialOptionsData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partitionIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialOptionsData, 0);
}

@end