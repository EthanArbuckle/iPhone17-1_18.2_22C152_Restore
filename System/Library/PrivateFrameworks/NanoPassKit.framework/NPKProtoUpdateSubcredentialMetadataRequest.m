@interface NPKProtoUpdateSubcredentialMetadataRequest
- (BOOL)hasCredentialData;
- (BOOL)hasPassData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)credentialData;
- (NSData)passData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredentialData:(id)a3;
- (void)setPassData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoUpdateSubcredentialMetadataRequest

- (BOOL)hasPassData
{
  return self->_passData != 0;
}

- (BOOL)hasCredentialData
{
  return self->_credentialData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoUpdateSubcredentialMetadataRequest;
  v4 = [(NPKProtoUpdateSubcredentialMetadataRequest *)&v8 description];
  v5 = [(NPKProtoUpdateSubcredentialMetadataRequest *)self dictionaryRepresentation];
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
  credentialData = self->_credentialData;
  if (credentialData) {
    [v4 setObject:credentialData forKey:@"credentialData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdateSubcredentialMetadataRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_credentialData)
  {
    PBDataWriterWriteDataField();
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
  if (self->_credentialData)
  {
    objc_msgSend(v5, "setCredentialData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_passData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_credentialData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((passData = self->_passData, !((unint64_t)passData | v4[2]))
     || -[NSData isEqual:](passData, "isEqual:")))
  {
    credentialData = self->_credentialData;
    if ((unint64_t)credentialData | v4[1]) {
      char v7 = -[NSData isEqual:](credentialData, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_passData hash];
  return [(NSData *)self->_credentialData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NPKProtoUpdateSubcredentialMetadataRequest setPassData:](self, "setPassData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoUpdateSubcredentialMetadataRequest setCredentialData:](self, "setCredentialData:");
    id v4 = v5;
  }
}

- (NSData)passData
{
  return self->_passData;
}

- (void)setPassData:(id)a3
{
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (void)setCredentialData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_credentialData, 0);
}

@end