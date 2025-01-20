@interface TPPBCustodianRecoveryKey
- (BOOL)hasEncryptionPublicKey;
- (BOOL)hasKind;
- (BOOL)hasSigningPublicKey;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionPublicKey;
- (NSData)signingPublicKey;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)kindAsString:(int)a3;
- (int)StringAsKind:(id)a3;
- (int)kind;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptionPublicKey:(id)a3;
- (void)setHasKind:(BOOL)a3;
- (void)setKind:(int)a3;
- (void)setSigningPublicKey:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBCustodianRecoveryKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_signingPublicKey, 0);
  objc_storeStrong((id *)&self->_encryptionPublicKey, 0);
}

- (void)setEncryptionPublicKey:(id)a3
{
}

- (NSData)encryptionPublicKey
{
  return self->_encryptionPublicKey;
}

- (void)setSigningPublicKey:(id)a3
{
}

- (NSData)signingPublicKey
{
  return self->_signingPublicKey;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[TPPBCustodianRecoveryKey setUuid:](self, "setUuid:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[TPPBCustodianRecoveryKey setSigningPublicKey:](self, "setSigningPublicKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[TPPBCustodianRecoveryKey setEncryptionPublicKey:](self, "setEncryptionPublicKey:");
    v4 = v5;
  }
  if (v4[10])
  {
    self->_kind = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  uint64_t v4 = [(NSData *)self->_signingPublicKey hash];
  uint64_t v5 = [(NSData *)self->_encryptionPublicKey hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_kind;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_12;
    }
  }
  signingPublicKey = self->_signingPublicKey;
  if ((unint64_t)signingPublicKey | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](signingPublicKey, "isEqual:")) {
      goto LABEL_12;
    }
  }
  encryptionPublicKey = self->_encryptionPublicKey;
  if ((unint64_t)encryptionPublicKey | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](encryptionPublicKey, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_kind == *((_DWORD *)v4 + 4))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_signingPublicKey copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSData *)self->_encryptionPublicKey copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_kind;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v5;
  }
  if (self->_signingPublicKey)
  {
    objc_msgSend(v5, "setSigningPublicKey:");
    id v4 = v5;
  }
  if (self->_encryptionPublicKey)
  {
    objc_msgSend(v5, "setEncryptionPublicKey:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_kind;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_signingPublicKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptionPublicKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBCustodianRecoveryKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  signingPublicKey = self->_signingPublicKey;
  if (signingPublicKey) {
    [v4 setObject:signingPublicKey forKey:@"signing_public_key"];
  }
  encryptionPublicKey = self->_encryptionPublicKey;
  if (encryptionPublicKey) {
    [v4 setObject:encryptionPublicKey forKey:@"encryption_public_key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t kind = self->_kind;
    if (kind >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_kind);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_2640EC9E8[kind];
    }
    [v4 setObject:v9 forKey:@"kind"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBCustodianRecoveryKey;
  id v4 = [(TPPBCustodianRecoveryKey *)&v8 description];
  id v5 = [(TPPBCustodianRecoveryKey *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsKind:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RECOVERY_KEY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INHERITANCE_KEY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)kindAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_2640EC9E8[a3];
  }
  return v3;
}

- (BOOL)hasKind
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasKind:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setKind:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t kind = a3;
}

- (int)kind
{
  if (*(unsigned char *)&self->_has) {
    return self->_kind;
  }
  else {
    return 0;
  }
}

- (BOOL)hasEncryptionPublicKey
{
  return self->_encryptionPublicKey != 0;
}

- (BOOL)hasSigningPublicKey
{
  return self->_signingPublicKey != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

@end