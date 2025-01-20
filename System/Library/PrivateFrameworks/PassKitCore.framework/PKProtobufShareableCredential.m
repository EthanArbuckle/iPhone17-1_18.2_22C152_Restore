@interface PKProtobufShareableCredential
- (BOOL)hasCardConfigurationIdentifier;
- (BOOL)hasCredentialIdentifier;
- (BOOL)hasCredentialIdentifierHash;
- (BOOL)hasEncryptedPushProvisioningTarget;
- (BOOL)hasNonce;
- (BOOL)hasOwnerDisplayName;
- (BOOL)hasSharingInstanceIdentifier;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cardConfigurationIdentifier;
- (NSString)credentialIdentifier;
- (NSString)credentialIdentifierHash;
- (NSString)encryptedPushProvisioningTarget;
- (NSString)nonce;
- (NSString)ownerDisplayName;
- (NSString)sharingInstanceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCardConfigurationIdentifier:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setCredentialIdentifierHash:(id)a3;
- (void)setEncryptedPushProvisioningTarget:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setNonce:(id)a3;
- (void)setOwnerDisplayName:(id)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufShareableCredential

- (BOOL)hasEncryptedPushProvisioningTarget
{
  return self->_encryptedPushProvisioningTarget != 0;
}

- (int)status
{
  if (*(unsigned char *)&self->_has) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E56E58E0[a3];
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONSUMED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REVOKED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EXPIRED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCredentialIdentifierHash
{
  return self->_credentialIdentifierHash != 0;
}

- (BOOL)hasOwnerDisplayName
{
  return self->_ownerDisplayName != 0;
}

- (BOOL)hasCredentialIdentifier
{
  return self->_credentialIdentifier != 0;
}

- (BOOL)hasCardConfigurationIdentifier
{
  return self->_cardConfigurationIdentifier != 0;
}

- (BOOL)hasSharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier != 0;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufShareableCredential;
  int v4 = [(PKProtobufShareableCredential *)&v8 description];
  v5 = [(PKProtobufShareableCredential *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  encryptedPushProvisioningTarget = self->_encryptedPushProvisioningTarget;
  if (encryptedPushProvisioningTarget) {
    [v3 setObject:encryptedPushProvisioningTarget forKey:@"encryptedPushProvisioningTarget"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t status = self->_status;
    if (status >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E56E58E0[status];
    }
    [v4 setObject:v7 forKey:@"status"];
  }
  credentialIdentifierHash = self->_credentialIdentifierHash;
  if (credentialIdentifierHash) {
    [v4 setObject:credentialIdentifierHash forKey:@"credentialIdentifierHash"];
  }
  ownerDisplayName = self->_ownerDisplayName;
  if (ownerDisplayName) {
    [v4 setObject:ownerDisplayName forKey:@"ownerDisplayName"];
  }
  credentialIdentifier = self->_credentialIdentifier;
  if (credentialIdentifier) {
    [v4 setObject:credentialIdentifier forKey:@"credentialIdentifier"];
  }
  cardConfigurationIdentifier = self->_cardConfigurationIdentifier;
  if (cardConfigurationIdentifier) {
    [v4 setObject:cardConfigurationIdentifier forKey:@"cardConfigurationIdentifier"];
  }
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  if (sharingInstanceIdentifier) {
    [v4 setObject:sharingInstanceIdentifier forKey:@"sharingInstanceIdentifier"];
  }
  nonce = self->_nonce;
  if (nonce) {
    [v4 setObject:nonce forKey:@"nonce"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufShareableCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptedPushProvisioningTarget)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_credentialIdentifierHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_ownerDisplayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_credentialIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_cardConfigurationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sharingInstanceIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nonce)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptedPushProvisioningTarget)
  {
    objc_msgSend(v4, "setEncryptedPushProvisioningTarget:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 16) = self->_status;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  if (self->_credentialIdentifierHash)
  {
    objc_msgSend(v5, "setCredentialIdentifierHash:");
    id v4 = v5;
  }
  if (self->_ownerDisplayName)
  {
    objc_msgSend(v5, "setOwnerDisplayName:");
    id v4 = v5;
  }
  if (self->_credentialIdentifier)
  {
    objc_msgSend(v5, "setCredentialIdentifier:");
    id v4 = v5;
  }
  if (self->_cardConfigurationIdentifier)
  {
    objc_msgSend(v5, "setCardConfigurationIdentifier:");
    id v4 = v5;
  }
  if (self->_sharingInstanceIdentifier)
  {
    objc_msgSend(v5, "setSharingInstanceIdentifier:");
    id v4 = v5;
  }
  if (self->_nonce)
  {
    objc_msgSend(v5, "setNonce:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_encryptedPushProvisioningTarget copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 64) = self->_status;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_credentialIdentifierHash copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_ownerDisplayName copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_credentialIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  uint64_t v14 = [(NSString *)self->_cardConfigurationIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  uint64_t v16 = [(NSString *)self->_sharingInstanceIdentifier copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(NSString *)self->_nonce copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  encryptedPushProvisioningTarget = self->_encryptedPushProvisioningTarget;
  if ((unint64_t)encryptedPushProvisioningTarget | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](encryptedPushProvisioningTarget, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_status != *((_DWORD *)v4 + 16)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  credentialIdentifierHash = self->_credentialIdentifierHash;
  if ((unint64_t)credentialIdentifierHash | *((void *)v4 + 3)
    && !-[NSString isEqual:](credentialIdentifierHash, "isEqual:"))
  {
    goto LABEL_21;
  }
  ownerDisplayName = self->_ownerDisplayName;
  if ((unint64_t)ownerDisplayName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](ownerDisplayName, "isEqual:")) {
      goto LABEL_21;
    }
  }
  credentialIdentifier = self->_credentialIdentifier;
  if ((unint64_t)credentialIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](credentialIdentifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  cardConfigurationIdentifier = self->_cardConfigurationIdentifier;
  if ((unint64_t)cardConfigurationIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](cardConfigurationIdentifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  if ((unint64_t)sharingInstanceIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](sharingInstanceIdentifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  nonce = self->_nonce;
  if ((unint64_t)nonce | *((void *)v4 + 5)) {
    char v12 = -[NSString isEqual:](nonce, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_encryptedPushProvisioningTarget hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_status;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_credentialIdentifierHash hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_ownerDisplayName hash];
  NSUInteger v8 = [(NSString *)self->_credentialIdentifier hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_cardConfigurationIdentifier hash];
  NSUInteger v10 = v7 ^ v9 ^ [(NSString *)self->_sharingInstanceIdentifier hash];
  return v10 ^ [(NSString *)self->_nonce hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[PKProtobufShareableCredential setEncryptedPushProvisioningTarget:](self, "setEncryptedPushProvisioningTarget:");
    uint64_t v4 = v5;
  }
  if (v4[17])
  {
    self->_uint64_t status = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[PKProtobufShareableCredential setCredentialIdentifierHash:](self, "setCredentialIdentifierHash:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[PKProtobufShareableCredential setOwnerDisplayName:](self, "setOwnerDisplayName:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[PKProtobufShareableCredential setCredentialIdentifier:](self, "setCredentialIdentifier:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[PKProtobufShareableCredential setCardConfigurationIdentifier:](self, "setCardConfigurationIdentifier:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[PKProtobufShareableCredential setSharingInstanceIdentifier:](self, "setSharingInstanceIdentifier:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[PKProtobufShareableCredential setNonce:](self, "setNonce:");
    uint64_t v4 = v5;
  }
}

- (NSString)encryptedPushProvisioningTarget
{
  return self->_encryptedPushProvisioningTarget;
}

- (void)setEncryptedPushProvisioningTarget:(id)a3
{
}

- (NSString)credentialIdentifierHash
{
  return self->_credentialIdentifierHash;
}

- (void)setCredentialIdentifierHash:(id)a3
{
}

- (NSString)ownerDisplayName
{
  return self->_ownerDisplayName;
}

- (void)setOwnerDisplayName:(id)a3
{
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (NSString)cardConfigurationIdentifier
{
  return self->_cardConfigurationIdentifier;
}

- (void)setCardConfigurationIdentifier:(id)a3
{
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerDisplayName, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_encryptedPushProvisioningTarget, 0);
  objc_storeStrong((id *)&self->_credentialIdentifierHash, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, 0);
}

@end