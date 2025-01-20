@interface NPKProtoCarKeyStartShareAcceptanceFlowRequest
- (BOOL)hasInvitationData;
- (BOOL)hasTransportationIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)invitationData;
- (NSString)transportationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInvitationData:(id)a3;
- (void)setTransportationIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyStartShareAcceptanceFlowRequest

- (BOOL)hasInvitationData
{
  return self->_invitationData != 0;
}

- (BOOL)hasTransportationIdentifier
{
  return self->_transportationIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyStartShareAcceptanceFlowRequest;
  v4 = [(NPKProtoCarKeyStartShareAcceptanceFlowRequest *)&v8 description];
  v5 = [(NPKProtoCarKeyStartShareAcceptanceFlowRequest *)self dictionaryRepresentation];
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
  transportationIdentifier = self->_transportationIdentifier;
  if (transportationIdentifier) {
    [v4 setObject:transportationIdentifier forKey:@"transportationIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyStartShareAcceptanceFlowRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_transportationIdentifier)
  {
    PBDataWriterWriteStringField();
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
  if (self->_transportationIdentifier)
  {
    objc_msgSend(v5, "setTransportationIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_invitationData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_transportationIdentifier copyWithZone:a3];
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
    transportationIdentifier = self->_transportationIdentifier;
    if ((unint64_t)transportationIdentifier | v4[2]) {
      char v7 = -[NSString isEqual:](transportationIdentifier, "isEqual:");
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
  return [(NSString *)self->_transportationIdentifier hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[NPKProtoCarKeyStartShareAcceptanceFlowRequest setInvitationData:](self, "setInvitationData:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoCarKeyStartShareAcceptanceFlowRequest setTransportationIdentifier:](self, "setTransportationIdentifier:");
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

- (NSString)transportationIdentifier
{
  return self->_transportationIdentifier;
}

- (void)setTransportationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportationIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationData, 0);
}

@end