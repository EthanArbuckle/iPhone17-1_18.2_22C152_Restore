@interface PCSEnvelopedKeyMaterial
- (BOOL)hasEncryptedSeed;
- (BOOL)hasMasterKeyId;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedSeed;
- (NSData)masterKeyId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)versionAsString:(int)a3;
- (int)StringAsVersion:(id)a3;
- (int)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedSeed:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMasterKeyId:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PCSEnvelopedKeyMaterial

- (int)version
{
  if (*(unsigned char *)&self->_has) {
    return self->_version;
  }
  else {
    return 0;
  }
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)versionAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"HKDF_SIV_GCM_HMAC_256";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"UNKNOWN";
  }
  return v4;
}

- (int)StringAsVersion:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"HKDF_SIV_GCM_HMAC_256"];
  }

  return v4;
}

- (BOOL)hasMasterKeyId
{
  return self->_masterKeyId != 0;
}

- (BOOL)hasEncryptedSeed
{
  return self->_encryptedSeed != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PCSEnvelopedKeyMaterial;
  int v4 = [(PCSEnvelopedKeyMaterial *)&v8 description];
  v5 = [(PCSEnvelopedKeyMaterial *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int version = self->_version;
    if (version)
    {
      if (version == 1)
      {
        v5 = @"HKDF_SIV_GCM_HMAC_256";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_version);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"UNKNOWN";
    }
    [v3 setObject:v5 forKey:@"version"];
  }
  masterKeyId = self->_masterKeyId;
  if (masterKeyId) {
    [v3 setObject:masterKeyId forKey:@"masterKeyId"];
  }
  encryptedSeed = self->_encryptedSeed;
  if (encryptedSeed) {
    [v3 setObject:encryptedSeed forKey:@"encryptedSeed"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PCSEnvelopedKeyMaterialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_masterKeyId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptedSeed)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
  if (self->_masterKeyId)
  {
    objc_msgSend(v4, "setMasterKeyId:");
    id v4 = v5;
  }
  if (self->_encryptedSeed)
  {
    objc_msgSend(v5, "setEncryptedSeed:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_version;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_masterKeyId copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSData *)self->_encryptedSeed copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  masterKeyId = self->_masterKeyId;
  if ((unint64_t)masterKeyId | *((void *)v4 + 2) && !-[NSData isEqual:](masterKeyId, "isEqual:")) {
    goto LABEL_11;
  }
  encryptedSeed = self->_encryptedSeed;
  if ((unint64_t)encryptedSeed | *((void *)v4 + 1)) {
    char v7 = -[NSData isEqual:](encryptedSeed, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_masterKeyId hash] ^ v3;
  return v4 ^ [(NSData *)self->_encryptedSeed hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[7])
  {
    self->_int version = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[PCSEnvelopedKeyMaterial setMasterKeyId:](self, "setMasterKeyId:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[PCSEnvelopedKeyMaterial setEncryptedSeed:](self, "setEncryptedSeed:");
    uint64_t v4 = v5;
  }
}

- (NSData)masterKeyId
{
  return self->_masterKeyId;
}

- (void)setMasterKeyId:(id)a3
{
}

- (NSData)encryptedSeed
{
  return self->_encryptedSeed;
}

- (void)setEncryptedSeed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterKeyId, 0);
  objc_storeStrong((id *)&self->_encryptedSeed, 0);
}

@end