@interface OTSecureElementPeerIdentity
- (BOOL)hasPeerData;
- (BOOL)hasPeerIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)peerData;
- (NSData)peerIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPeerData:(id)a3;
- (void)setPeerIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTSecureElementPeerIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_peerData, 0);
}

- (void)setPeerData:(id)a3
{
}

- (NSData)peerData
{
  return self->_peerData;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (NSData)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[OTSecureElementPeerIdentity setPeerIdentifier:](self, "setPeerIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[OTSecureElementPeerIdentity setPeerData:](self, "setPeerData:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_peerIdentifier hash];
  return [(NSData *)self->_peerData hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((peerIdentifier = self->_peerIdentifier, !((unint64_t)peerIdentifier | v4[2]))
     || -[NSData isEqual:](peerIdentifier, "isEqual:")))
  {
    peerData = self->_peerData;
    if ((unint64_t)peerData | v4[1]) {
      char v7 = -[NSData isEqual:](peerData, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_peerIdentifier copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_peerData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerIdentifier)
  {
    objc_msgSend(v4, "setPeerIdentifier:");
    id v4 = v5;
  }
  if (self->_peerData)
  {
    objc_msgSend(v5, "setPeerData:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_peerData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTSecureElementPeerIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  peerIdentifier = self->_peerIdentifier;
  if (peerIdentifier) {
    [v3 setObject:peerIdentifier forKey:@"peerIdentifier"];
  }
  peerData = self->_peerData;
  if (peerData) {
    [v4 setObject:peerData forKey:@"peerData"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTSecureElementPeerIdentity;
  id v4 = [(OTSecureElementPeerIdentity *)&v8 description];
  id v5 = [(OTSecureElementPeerIdentity *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPeerData
{
  return self->_peerData != 0;
}

- (BOOL)hasPeerIdentifier
{
  return self->_peerIdentifier != 0;
}

@end