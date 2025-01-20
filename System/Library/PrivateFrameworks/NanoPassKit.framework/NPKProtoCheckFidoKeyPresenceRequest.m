@interface NPKProtoCheckFidoKeyPresenceRequest
- (BOOL)hasFidoKeyHash;
- (BOOL)hasRelyingParty;
- (BOOL)hasRelyingPartyAccountHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)fidoKeyHash;
- (NSString)relyingParty;
- (NSString)relyingPartyAccountHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFidoKeyHash:(id)a3;
- (void)setRelyingParty:(id)a3;
- (void)setRelyingPartyAccountHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCheckFidoKeyPresenceRequest

- (BOOL)hasRelyingParty
{
  return self->_relyingParty != 0;
}

- (BOOL)hasRelyingPartyAccountHash
{
  return self->_relyingPartyAccountHash != 0;
}

- (BOOL)hasFidoKeyHash
{
  return self->_fidoKeyHash != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCheckFidoKeyPresenceRequest;
  v4 = [(NPKProtoCheckFidoKeyPresenceRequest *)&v8 description];
  v5 = [(NPKProtoCheckFidoKeyPresenceRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  relyingParty = self->_relyingParty;
  if (relyingParty) {
    [v3 setObject:relyingParty forKey:@"relyingParty"];
  }
  relyingPartyAccountHash = self->_relyingPartyAccountHash;
  if (relyingPartyAccountHash) {
    [v4 setObject:relyingPartyAccountHash forKey:@"relyingPartyAccountHash"];
  }
  fidoKeyHash = self->_fidoKeyHash;
  if (fidoKeyHash) {
    [v4 setObject:fidoKeyHash forKey:@"fidoKeyHash"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCheckFidoKeyPresenceRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_relyingParty)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_relyingPartyAccountHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_fidoKeyHash)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_relyingParty)
  {
    objc_msgSend(v4, "setRelyingParty:");
    id v4 = v5;
  }
  if (self->_relyingPartyAccountHash)
  {
    objc_msgSend(v5, "setRelyingPartyAccountHash:");
    id v4 = v5;
  }
  if (self->_fidoKeyHash)
  {
    objc_msgSend(v5, "setFidoKeyHash:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_relyingParty copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_relyingPartyAccountHash copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_fidoKeyHash copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((relyingParty = self->_relyingParty, !((unint64_t)relyingParty | v4[2]))
     || -[NSString isEqual:](relyingParty, "isEqual:"))
    && ((relyingPartyAccountHash = self->_relyingPartyAccountHash, !((unint64_t)relyingPartyAccountHash | v4[3]))
     || -[NSString isEqual:](relyingPartyAccountHash, "isEqual:")))
  {
    fidoKeyHash = self->_fidoKeyHash;
    if ((unint64_t)fidoKeyHash | v4[1]) {
      char v8 = -[NSData isEqual:](fidoKeyHash, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_relyingParty hash];
  NSUInteger v4 = [(NSString *)self->_relyingPartyAccountHash hash] ^ v3;
  return v4 ^ [(NSData *)self->_fidoKeyHash hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[NPKProtoCheckFidoKeyPresenceRequest setRelyingParty:](self, "setRelyingParty:");
  }
  if (v4[3]) {
    -[NPKProtoCheckFidoKeyPresenceRequest setRelyingPartyAccountHash:](self, "setRelyingPartyAccountHash:");
  }
  if (v4[1]) {
    -[NPKProtoCheckFidoKeyPresenceRequest setFidoKeyHash:](self, "setFidoKeyHash:");
  }
}

- (NSString)relyingParty
{
  return self->_relyingParty;
}

- (void)setRelyingParty:(id)a3
{
}

- (NSString)relyingPartyAccountHash
{
  return self->_relyingPartyAccountHash;
}

- (void)setRelyingPartyAccountHash:(id)a3
{
}

- (NSData)fidoKeyHash
{
  return self->_fidoKeyHash;
}

- (void)setFidoKeyHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relyingPartyAccountHash, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
  objc_storeStrong((id *)&self->_fidoKeyHash, 0);
}

@end