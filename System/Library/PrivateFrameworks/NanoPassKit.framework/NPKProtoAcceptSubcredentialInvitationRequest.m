@interface NPKProtoAcceptSubcredentialInvitationRequest
- (BOOL)hasInvitationData;
- (BOOL)hasMetadataData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)invitationData;
- (NSData)metadataData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInvitationData:(id)a3;
- (void)setMetadataData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoAcceptSubcredentialInvitationRequest

- (BOOL)hasInvitationData
{
  return self->_invitationData != 0;
}

- (BOOL)hasMetadataData
{
  return self->_metadataData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAcceptSubcredentialInvitationRequest;
  v4 = [(NPKProtoAcceptSubcredentialInvitationRequest *)&v8 description];
  v5 = [(NPKProtoAcceptSubcredentialInvitationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  invitationData = self->_invitationData;
  if (invitationData) {
    [v3 setObject:invitationData forKey:@"invitationData"];
  }
  metadataData = self->_metadataData;
  if (metadataData) {
    [v4 setObject:metadataData forKey:@"metadataData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAcceptSubcredentialInvitationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_invitationData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_metadataData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_invitationData)
  {
    objc_msgSend(v4, "setInvitationData:");
    id v4 = v5;
  }
  if (self->_metadataData)
  {
    objc_msgSend(v5, "setMetadataData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_invitationData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_metadataData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((invitationData = self->_invitationData, !((unint64_t)invitationData | v4[1]))
     || -[NSData isEqual:](invitationData, "isEqual:")))
  {
    metadataData = self->_metadataData;
    if ((unint64_t)metadataData | v4[2]) {
      char v7 = -[NSData isEqual:](metadataData, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_invitationData hash];
  return [(NSData *)self->_metadataData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[NPKProtoAcceptSubcredentialInvitationRequest setInvitationData:](self, "setInvitationData:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoAcceptSubcredentialInvitationRequest setMetadataData:](self, "setMetadataData:");
    id v4 = v5;
  }
}

- (NSData)invitationData
{
  return self->_invitationData;
}

- (void)setInvitationData:(id)a3
{
}

- (NSData)metadataData
{
  return self->_metadataData;
}

- (void)setMetadataData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataData, 0);
  objc_storeStrong((id *)&self->_invitationData, 0);
}

@end