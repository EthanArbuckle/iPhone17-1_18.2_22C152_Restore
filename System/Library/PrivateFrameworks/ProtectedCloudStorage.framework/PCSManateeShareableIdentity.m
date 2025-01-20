@interface PCSManateeShareableIdentity
- (BOOL)hasEncryptionPrivateKey;
- (BOOL)hasSigningPrivateKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PCSManateePrivateKey)encryptionPrivateKey;
- (PCSManateePrivateKey)signingPrivateKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptionPrivateKey:(id)a3;
- (void)setSigningPrivateKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PCSManateeShareableIdentity

- (BOOL)hasEncryptionPrivateKey
{
  return self->_encryptionPrivateKey != 0;
}

- (BOOL)hasSigningPrivateKey
{
  return self->_signingPrivateKey != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PCSManateeShareableIdentity;
  v4 = [(PCSManateeShareableIdentity *)&v8 description];
  v5 = [(PCSManateeShareableIdentity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  encryptionPrivateKey = self->_encryptionPrivateKey;
  if (encryptionPrivateKey)
  {
    v5 = [(PCSManateePrivateKey *)encryptionPrivateKey dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"encryptionPrivateKey"];
  }
  signingPrivateKey = self->_signingPrivateKey;
  if (signingPrivateKey)
  {
    v7 = [(PCSManateePrivateKey *)signingPrivateKey dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"signingPrivateKey"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PCSManateeShareableIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptionPrivateKey)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_signingPrivateKey)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptionPrivateKey)
  {
    objc_msgSend(v4, "setEncryptionPrivateKey:");
    id v4 = v5;
  }
  if (self->_signingPrivateKey)
  {
    objc_msgSend(v5, "setSigningPrivateKey:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PCSManateePrivateKey *)self->_encryptionPrivateKey copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PCSManateePrivateKey *)self->_signingPrivateKey copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((encryptionPrivateKey = self->_encryptionPrivateKey, !((unint64_t)encryptionPrivateKey | v4[1]))
     || -[PCSManateePrivateKey isEqual:](encryptionPrivateKey, "isEqual:")))
  {
    signingPrivateKey = self->_signingPrivateKey;
    if ((unint64_t)signingPrivateKey | v4[2]) {
      char v7 = -[PCSManateePrivateKey isEqual:](signingPrivateKey, "isEqual:");
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
  unint64_t v3 = [(PCSManateePrivateKey *)self->_encryptionPrivateKey hash];
  return [(PCSManateePrivateKey *)self->_signingPrivateKey hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  encryptionPrivateKey = self->_encryptionPrivateKey;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (encryptionPrivateKey)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PCSManateePrivateKey mergeFrom:](encryptionPrivateKey, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PCSManateeShareableIdentity setEncryptionPrivateKey:](self, "setEncryptionPrivateKey:");
  }
  id v4 = v9;
LABEL_7:
  signingPrivateKey = self->_signingPrivateKey;
  uint64_t v8 = v4[2];
  if (signingPrivateKey)
  {
    if (v8) {
      -[PCSManateePrivateKey mergeFrom:](signingPrivateKey, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PCSManateeShareableIdentity setSigningPrivateKey:](self, "setSigningPrivateKey:");
  }
  MEMORY[0x1F41817F8]();
}

- (PCSManateePrivateKey)encryptionPrivateKey
{
  return self->_encryptionPrivateKey;
}

- (void)setEncryptionPrivateKey:(id)a3
{
}

- (PCSManateePrivateKey)signingPrivateKey
{
  return self->_signingPrivateKey;
}

- (void)setSigningPrivateKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingPrivateKey, 0);
  objc_storeStrong((id *)&self->_encryptionPrivateKey, 0);
}

@end