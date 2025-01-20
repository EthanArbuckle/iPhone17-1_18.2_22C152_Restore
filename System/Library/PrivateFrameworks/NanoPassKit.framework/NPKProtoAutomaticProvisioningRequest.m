@interface NPKProtoAutomaticProvisioningRequest
- (BOOL)hasCardType;
- (BOOL)hasCredentialType;
- (BOOL)hasLocalizedName;
- (BOOL)hasPassTypeIdentifier;
- (BOOL)hasPrimaryAccountNumberSuffix;
- (BOOL)hasSerialNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)localizedName;
- (NSString)passTypeIdentifier;
- (NSString)primaryAccountNumberSuffix;
- (NSString)serialNumber;
- (id)cardTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCardType:(id)a3;
- (int)cardType;
- (unint64_t)credentialType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCardType:(int)a3;
- (void)setCredentialType:(unint64_t)a3;
- (void)setHasCardType:(BOOL)a3;
- (void)setHasCredentialType:(BOOL)a3;
- (void)setLocalizedName:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPrimaryAccountNumberSuffix:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoAutomaticProvisioningRequest

- (BOOL)hasPassTypeIdentifier
{
  return self->_passTypeIdentifier != 0;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (void)setCredentialType:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_credentialType = a3;
}

- (void)setHasCredentialType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCredentialType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPrimaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix != 0;
}

- (BOOL)hasLocalizedName
{
  return self->_localizedName != 0;
}

- (int)cardType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_cardType;
  }
  else {
    return 0;
  }
}

- (void)setCardType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cardType = a3;
}

- (void)setHasCardType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCardType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)cardTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_2644D3830[a3];
  }
  return v3;
}

- (int)StringAsCardType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Payment"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Transit"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Access"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAutomaticProvisioningRequest;
  int v4 = [(NPKProtoAutomaticProvisioningRequest *)&v8 description];
  v5 = [(NPKProtoAutomaticProvisioningRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier) {
    [v3 setObject:passTypeIdentifier forKey:@"passTypeIdentifier"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v4 setObject:serialNumber forKey:@"serialNumber"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_credentialType];
    [v4 setObject:v7 forKey:@"credentialType"];
  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if (primaryAccountNumberSuffix) {
    [v4 setObject:primaryAccountNumberSuffix forKey:@"primaryAccountNumberSuffix"];
  }
  localizedName = self->_localizedName;
  if (localizedName) {
    [v4 setObject:localizedName forKey:@"localizedName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t cardType = self->_cardType;
    if (cardType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cardType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_2644D3830[cardType];
    }
    [v4 setObject:v11 forKey:@"cardType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAutomaticProvisioningRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_passTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_serialNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_primaryAccountNumberSuffix)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_localizedName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_passTypeIdentifier)
  {
    objc_msgSend(v4, "setPassTypeIdentifier:");
    id v4 = v5;
  }
  if (self->_serialNumber)
  {
    objc_msgSend(v5, "setSerialNumber:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_credentialType;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (self->_primaryAccountNumberSuffix)
  {
    objc_msgSend(v5, "setPrimaryAccountNumberSuffix:");
    id v4 = v5;
  }
  if (self->_localizedName)
  {
    objc_msgSend(v5, "setLocalizedName:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_cardType;
    *((unsigned char *)v4 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passTypeIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_serialNumber copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_credentialType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_primaryAccountNumberSuffix copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_localizedName copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_cardType;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  passTypeIdentifier = self->_passTypeIdentifier;
  if ((unint64_t)passTypeIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](passTypeIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_credentialType != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if ((unint64_t)primaryAccountNumberSuffix | *((void *)v4 + 5)
    && !-[NSString isEqual:](primaryAccountNumberSuffix, "isEqual:"))
  {
    goto LABEL_19;
  }
  localizedName = self->_localizedName;
  if ((unint64_t)localizedName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](localizedName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_cardType != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passTypeIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_serialNumber hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_credentialType;
  }
  else {
    unint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_primaryAccountNumberSuffix hash];
  NSUInteger v7 = [(NSString *)self->_localizedName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_cardType;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[NPKProtoAutomaticProvisioningRequest setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[NPKProtoAutomaticProvisioningRequest setSerialNumber:](self, "setSerialNumber:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_credentialType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[NPKProtoAutomaticProvisioningRequest setPrimaryAccountNumberSuffix:](self, "setPrimaryAccountNumberSuffix:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoAutomaticProvisioningRequest setLocalizedName:](self, "setLocalizedName:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    self->_uint64_t cardType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (unint64_t)credentialType
{
  return self->_credentialType;
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end