@interface NPKProtoSignWithFidoKeyRequest
- (BOOL)hasChallenge;
- (BOOL)hasExternalizedAuth;
- (BOOL)hasFidoKeyHash;
- (BOOL)hasPublicKeyIdentifier;
- (BOOL)hasRelyingParty;
- (BOOL)hasRelyingPartyAccountHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)challenge;
- (NSData)externalizedAuth;
- (NSData)fidoKeyHash;
- (NSString)publicKeyIdentifier;
- (NSString)relyingParty;
- (NSString)relyingPartyAccountHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setExternalizedAuth:(id)a3;
- (void)setFidoKeyHash:(id)a3;
- (void)setPublicKeyIdentifier:(id)a3;
- (void)setRelyingParty:(id)a3;
- (void)setRelyingPartyAccountHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSignWithFidoKeyRequest

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

- (BOOL)hasChallenge
{
  return self->_challenge != 0;
}

- (BOOL)hasPublicKeyIdentifier
{
  return self->_publicKeyIdentifier != 0;
}

- (BOOL)hasExternalizedAuth
{
  return self->_externalizedAuth != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSignWithFidoKeyRequest;
  v4 = [(NPKProtoSignWithFidoKeyRequest *)&v8 description];
  v5 = [(NPKProtoSignWithFidoKeyRequest *)self dictionaryRepresentation];
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
  challenge = self->_challenge;
  if (challenge) {
    [v4 setObject:challenge forKey:@"challenge"];
  }
  publicKeyIdentifier = self->_publicKeyIdentifier;
  if (publicKeyIdentifier) {
    [v4 setObject:publicKeyIdentifier forKey:@"publicKeyIdentifier"];
  }
  externalizedAuth = self->_externalizedAuth;
  if (externalizedAuth) {
    [v4 setObject:externalizedAuth forKey:@"externalizedAuth"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSignWithFidoKeyRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_challenge)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_publicKeyIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_externalizedAuth)
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
  if (self->_challenge)
  {
    objc_msgSend(v5, "setChallenge:");
    id v4 = v5;
  }
  if (self->_publicKeyIdentifier)
  {
    objc_msgSend(v5, "setPublicKeyIdentifier:");
    id v4 = v5;
  }
  if (self->_externalizedAuth)
  {
    objc_msgSend(v5, "setExternalizedAuth:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_relyingParty copyWithZone:a3];
  v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_relyingPartyAccountHash copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  uint64_t v10 = [(NSData *)self->_fidoKeyHash copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSData *)self->_challenge copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  uint64_t v14 = [(NSString *)self->_publicKeyIdentifier copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  uint64_t v16 = [(NSData *)self->_externalizedAuth copyWithZone:a3];
  v17 = (void *)v5[2];
  v5[2] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((relyingParty = self->_relyingParty, !((unint64_t)relyingParty | v4[5]))
     || -[NSString isEqual:](relyingParty, "isEqual:"))
    && ((relyingPartyAccountHash = self->_relyingPartyAccountHash, !((unint64_t)relyingPartyAccountHash | v4[6]))
     || -[NSString isEqual:](relyingPartyAccountHash, "isEqual:"))
    && ((fidoKeyHash = self->_fidoKeyHash, !((unint64_t)fidoKeyHash | v4[3]))
     || -[NSData isEqual:](fidoKeyHash, "isEqual:"))
    && ((challenge = self->_challenge, !((unint64_t)challenge | v4[1]))
     || -[NSData isEqual:](challenge, "isEqual:"))
    && ((publicKeyIdentifier = self->_publicKeyIdentifier, !((unint64_t)publicKeyIdentifier | v4[4]))
     || -[NSString isEqual:](publicKeyIdentifier, "isEqual:")))
  {
    externalizedAuth = self->_externalizedAuth;
    if ((unint64_t)externalizedAuth | v4[2]) {
      char v11 = -[NSData isEqual:](externalizedAuth, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_relyingParty hash];
  NSUInteger v4 = [(NSString *)self->_relyingPartyAccountHash hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_fidoKeyHash hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_challenge hash];
  NSUInteger v7 = [(NSString *)self->_publicKeyIdentifier hash];
  return v6 ^ v7 ^ [(NSData *)self->_externalizedAuth hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[5]) {
    -[NPKProtoSignWithFidoKeyRequest setRelyingParty:](self, "setRelyingParty:");
  }
  if (v4[6]) {
    -[NPKProtoSignWithFidoKeyRequest setRelyingPartyAccountHash:](self, "setRelyingPartyAccountHash:");
  }
  if (v4[3]) {
    -[NPKProtoSignWithFidoKeyRequest setFidoKeyHash:](self, "setFidoKeyHash:");
  }
  if (v4[1]) {
    -[NPKProtoSignWithFidoKeyRequest setChallenge:](self, "setChallenge:");
  }
  if (v4[4]) {
    -[NPKProtoSignWithFidoKeyRequest setPublicKeyIdentifier:](self, "setPublicKeyIdentifier:");
  }
  if (v4[2]) {
    -[NPKProtoSignWithFidoKeyRequest setExternalizedAuth:](self, "setExternalizedAuth:");
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

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSString)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (void)setPublicKeyIdentifier:(id)a3
{
}

- (NSData)externalizedAuth
{
  return self->_externalizedAuth;
}

- (void)setExternalizedAuth:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relyingPartyAccountHash, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_fidoKeyHash, 0);
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end