@interface NPKProtoCreateFidoKeyRequest
- (BOOL)hasChallenge;
- (BOOL)hasExternalizedAuth;
- (BOOL)hasRelyingParty;
- (BOOL)hasRelyingPartyAccountHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)challenge;
- (NSData)externalizedAuth;
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
- (void)setRelyingParty:(id)a3;
- (void)setRelyingPartyAccountHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCreateFidoKeyRequest

- (BOOL)hasRelyingParty
{
  return self->_relyingParty != 0;
}

- (BOOL)hasRelyingPartyAccountHash
{
  return self->_relyingPartyAccountHash != 0;
}

- (BOOL)hasChallenge
{
  return self->_challenge != 0;
}

- (BOOL)hasExternalizedAuth
{
  return self->_externalizedAuth != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCreateFidoKeyRequest;
  v4 = [(NPKProtoCreateFidoKeyRequest *)&v8 description];
  v5 = [(NPKProtoCreateFidoKeyRequest *)self dictionaryRepresentation];
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
  challenge = self->_challenge;
  if (challenge) {
    [v4 setObject:challenge forKey:@"challenge"];
  }
  externalizedAuth = self->_externalizedAuth;
  if (externalizedAuth) {
    [v4 setObject:externalizedAuth forKey:@"externalizedAuth"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCreateFidoKeyRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_challenge)
  {
    PBDataWriterWriteDataField();
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
  if (self->_challenge)
  {
    objc_msgSend(v5, "setChallenge:");
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
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_relyingPartyAccountHash copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSData *)self->_challenge copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSData *)self->_externalizedAuth copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((relyingParty = self->_relyingParty, !((unint64_t)relyingParty | v4[3]))
     || -[NSString isEqual:](relyingParty, "isEqual:"))
    && ((relyingPartyAccountHash = self->_relyingPartyAccountHash, !((unint64_t)relyingPartyAccountHash | v4[4]))
     || -[NSString isEqual:](relyingPartyAccountHash, "isEqual:"))
    && ((challenge = self->_challenge, !((unint64_t)challenge | v4[1]))
     || -[NSData isEqual:](challenge, "isEqual:")))
  {
    externalizedAuth = self->_externalizedAuth;
    if ((unint64_t)externalizedAuth | v4[2]) {
      char v9 = -[NSData isEqual:](externalizedAuth, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_relyingParty hash];
  NSUInteger v4 = [(NSString *)self->_relyingPartyAccountHash hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_challenge hash];
  return v4 ^ v5 ^ [(NSData *)self->_externalizedAuth hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[NPKProtoCreateFidoKeyRequest setRelyingParty:](self, "setRelyingParty:");
  }
  if (v4[4]) {
    -[NPKProtoCreateFidoKeyRequest setRelyingPartyAccountHash:](self, "setRelyingPartyAccountHash:");
  }
  if (v4[1]) {
    -[NPKProtoCreateFidoKeyRequest setChallenge:](self, "setChallenge:");
  }
  if (v4[2]) {
    -[NPKProtoCreateFidoKeyRequest setExternalizedAuth:](self, "setExternalizedAuth:");
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

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
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
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end