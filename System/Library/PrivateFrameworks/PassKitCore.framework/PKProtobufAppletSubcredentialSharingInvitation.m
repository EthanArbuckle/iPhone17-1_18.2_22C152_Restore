@interface PKProtobufAppletSubcredentialSharingInvitation
- (BOOL)hasBrandIdentifier;
- (BOOL)hasDeviceModel;
- (BOOL)hasDeviceType;
- (BOOL)hasEntitlement;
- (BOOL)hasIdentifier;
- (BOOL)hasInvitation;
- (BOOL)hasIssuer;
- (BOOL)hasPairedReaderIdentifier;
- (BOOL)hasPartnerIdentifier;
- (BOOL)hasRecipientName;
- (BOOL)hasSharingSessionIdentifier;
- (BOOL)hasSupportedRadioTechnologies;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)invitation;
- (NSData)sharingSessionIdentifier;
- (NSString)brandIdentifier;
- (NSString)deviceModel;
- (NSString)identifier;
- (NSString)issuer;
- (NSString)pairedReaderIdentifier;
- (NSString)partnerIdentifier;
- (NSString)recipientName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDeviceType:(id)a3;
- (int)deviceType;
- (unint64_t)hash;
- (unsigned)entitlement;
- (unsigned)supportedRadioTechnologies;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBrandIdentifier:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceType:(int)a3;
- (void)setEntitlement:(unsigned int)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasEntitlement:(BOOL)a3;
- (void)setHasSupportedRadioTechnologies:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setIssuer:(id)a3;
- (void)setPairedReaderIdentifier:(id)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setRecipientName:(id)a3;
- (void)setSharingSessionIdentifier:(id)a3;
- (void)setSupportedRadioTechnologies:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufAppletSubcredentialSharingInvitation

- (BOOL)hasInvitation
{
  return self->_invitation != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasPartnerIdentifier
{
  return self->_partnerIdentifier != 0;
}

- (BOOL)hasPairedReaderIdentifier
{
  return self->_pairedReaderIdentifier != 0;
}

- (BOOL)hasRecipientName
{
  return self->_recipientName != 0;
}

- (BOOL)hasSharingSessionIdentifier
{
  return self->_sharingSessionIdentifier != 0;
}

- (void)setEntitlement:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_entitlement = a3;
}

- (void)setHasEntitlement:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntitlement
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)deviceType
{
  if (*(unsigned char *)&self->_has) {
    return self->_deviceType;
  }
  else {
    return 0;
  }
}

- (void)setDeviceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deviceType = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)deviceTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"WATCH";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"PHONE";
  }
  return v4;
}

- (int)StringAsDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHONE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"WATCH"];
  }

  return v4;
}

- (BOOL)hasIssuer
{
  return self->_issuer != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)setSupportedRadioTechnologies:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportedRadioTechnologies = a3;
}

- (void)setHasSupportedRadioTechnologies:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportedRadioTechnologies
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasBrandIdentifier
{
  return self->_brandIdentifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufAppletSubcredentialSharingInvitation;
  int v4 = [(PKProtobufAppletSubcredentialSharingInvitation *)&v8 description];
  v5 = [(PKProtobufAppletSubcredentialSharingInvitation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  invitation = self->_invitation;
  if (invitation) {
    [v3 setObject:invitation forKey:@"invitation"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  partnerIdentifier = self->_partnerIdentifier;
  if (partnerIdentifier) {
    [v3 setObject:partnerIdentifier forKey:@"partnerIdentifier"];
  }
  pairedReaderIdentifier = self->_pairedReaderIdentifier;
  if (pairedReaderIdentifier) {
    [v3 setObject:pairedReaderIdentifier forKey:@"pairedReaderIdentifier"];
  }
  recipientName = self->_recipientName;
  if (recipientName) {
    [v3 setObject:recipientName forKey:@"recipientName"];
  }
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  if (sharingSessionIdentifier) {
    [v3 setObject:sharingSessionIdentifier forKey:@"sharingSessionIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_entitlement];
    [v3 setObject:v12 forKey:@"entitlement"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int deviceType = self->_deviceType;
    if (deviceType)
    {
      if (deviceType == 1)
      {
        v14 = @"WATCH";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deviceType);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = @"PHONE";
    }
    [v3 setObject:v14 forKey:@"deviceType"];
  }
  issuer = self->_issuer;
  if (issuer) {
    [v3 setObject:issuer forKey:@"issuer"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"deviceModel"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v17 = [NSNumber numberWithUnsignedInt:self->_supportedRadioTechnologies];
    [v3 setObject:v17 forKey:@"supportedRadioTechnologies"];
  }
  brandIdentifier = self->_brandIdentifier;
  if (brandIdentifier) {
    [v3 setObject:brandIdentifier forKey:@"brandIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufAppletSubcredentialSharingInvitationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_invitation) {
    PBDataWriterWriteDataField();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  int v4 = v6;
  if (self->_partnerIdentifier)
  {
    PBDataWriterWriteStringField();
    int v4 = v6;
  }
  if (self->_pairedReaderIdentifier)
  {
    PBDataWriterWriteStringField();
    int v4 = v6;
  }
  if (self->_recipientName)
  {
    PBDataWriterWriteStringField();
    int v4 = v6;
  }
  if (self->_sharingSessionIdentifier)
  {
    PBDataWriterWriteDataField();
    int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    int v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v6;
  }
  if (self->_issuer)
  {
    PBDataWriterWriteStringField();
    int v4 = v6;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    int v4 = v6;
  }
  if (self->_brandIdentifier)
  {
    PBDataWriterWriteStringField();
    int v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  v4[23] = self->_version;
  id v6 = v4;
  if (self->_invitation)
  {
    objc_msgSend(v4, "setInvitation:");
    int v4 = v6;
  }
  if (self->_identifier)
  {
    objc_msgSend(v6, "setIdentifier:");
    int v4 = v6;
  }
  if (self->_partnerIdentifier)
  {
    objc_msgSend(v6, "setPartnerIdentifier:");
    int v4 = v6;
  }
  if (self->_pairedReaderIdentifier)
  {
    objc_msgSend(v6, "setPairedReaderIdentifier:");
    int v4 = v6;
  }
  if (self->_recipientName)
  {
    objc_msgSend(v6, "setRecipientName:");
    int v4 = v6;
  }
  if (self->_sharingSessionIdentifier)
  {
    objc_msgSend(v6, "setSharingSessionIdentifier:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[7] = self->_entitlement;
    *((unsigned char *)v4 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[6] = self->_deviceType;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  if (self->_issuer)
  {
    objc_msgSend(v6, "setIssuer:");
    int v4 = v6;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v6, "setDeviceModel:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[22] = self->_supportedRadioTechnologies;
    *((unsigned char *)v4 + 96) |= 4u;
  }
  if (self->_brandIdentifier)
  {
    objc_msgSend(v6, "setBrandIdentifier:");
    int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 92) = self->_version;
  uint64_t v6 = [(NSData *)self->_invitation copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_partnerIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  uint64_t v12 = [(NSString *)self->_pairedReaderIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSString *)self->_recipientName copyWithZone:a3];
  v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  uint64_t v16 = [(NSData *)self->_sharingSessionIdentifier copyWithZone:a3];
  v17 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v16;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_entitlement;
    *(unsigned char *)(v5 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_deviceType;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  uint64_t v19 = [(NSString *)self->_issuer copyWithZone:a3];
  v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  uint64_t v21 = [(NSString *)self->_deviceModel copyWithZone:a3];
  v22 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v21;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_supportedRadioTechnologies;
    *(unsigned char *)(v5 + 96) |= 4u;
  }
  uint64_t v23 = [(NSString *)self->_brandIdentifier copyWithZone:a3];
  v24 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v23;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if (self->_version != *((_DWORD *)v4 + 23)) {
    goto LABEL_36;
  }
  invitation = self->_invitation;
  if ((unint64_t)invitation | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](invitation, "isEqual:")) {
      goto LABEL_36;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_36;
    }
  }
  partnerIdentifier = self->_partnerIdentifier;
  if ((unint64_t)partnerIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](partnerIdentifier, "isEqual:")) {
      goto LABEL_36;
    }
  }
  pairedReaderIdentifier = self->_pairedReaderIdentifier;
  if ((unint64_t)pairedReaderIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](pairedReaderIdentifier, "isEqual:")) {
      goto LABEL_36;
    }
  }
  recipientName = self->_recipientName;
  if ((unint64_t)recipientName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](recipientName, "isEqual:")) {
      goto LABEL_36;
    }
  }
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  if ((unint64_t)sharingSessionIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](sharingSessionIdentifier, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_entitlement != *((_DWORD *)v4 + 7)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
LABEL_36:
    char v14 = 0;
    goto LABEL_37;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_deviceType != *((_DWORD *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_36;
  }
  issuer = self->_issuer;
  if ((unint64_t)issuer | *((void *)v4 + 6) && !-[NSString isEqual:](issuer, "isEqual:")) {
    goto LABEL_36;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_supportedRadioTechnologies != *((_DWORD *)v4 + 22)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    goto LABEL_36;
  }
  brandIdentifier = self->_brandIdentifier;
  if ((unint64_t)brandIdentifier | *((void *)v4 + 1)) {
    char v14 = -[NSString isEqual:](brandIdentifier, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_37:

  return v14;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  uint64_t v14 = [(NSData *)self->_invitation hash];
  NSUInteger v13 = [(NSString *)self->_identifier hash];
  NSUInteger v3 = [(NSString *)self->_partnerIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_pairedReaderIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_recipientName hash];
  uint64_t v6 = [(NSData *)self->_sharingSessionIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_entitlement;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_deviceType;
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  NSUInteger v9 = [(NSString *)self->_issuer hash];
  NSUInteger v10 = [(NSString *)self->_deviceModel hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_supportedRadioTechnologies;
  }
  else {
    uint64_t v11 = 0;
  }
  return v14 ^ v13 ^ v3 ^ v4 ^ (2654435761 * version) ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_brandIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  self->_unsigned int version = v4[23];
  uint64_t v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setInvitation:](self, "setInvitation:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setPartnerIdentifier:](self, "setPartnerIdentifier:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setPairedReaderIdentifier:](self, "setPairedReaderIdentifier:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setRecipientName:](self, "setRecipientName:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 10))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setSharingSessionIdentifier:](self, "setSharingSessionIdentifier:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 96);
  if ((v5 & 2) != 0)
  {
    self->_entitlement = v4[7];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 96);
  }
  if (v5)
  {
    self->_int deviceType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setIssuer:](self, "setIssuer:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setDeviceModel:](self, "setDeviceModel:");
    NSUInteger v4 = v6;
  }
  if ((v4[24] & 4) != 0)
  {
    self->_supportedRadioTechnologies = v4[22];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 1))
  {
    -[PKProtobufAppletSubcredentialSharingInvitation setBrandIdentifier:](self, "setBrandIdentifier:");
    NSUInteger v4 = v6;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
}

- (NSData)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
}

- (NSString)pairedReaderIdentifier
{
  return self->_pairedReaderIdentifier;
}

- (void)setPairedReaderIdentifier:(id)a3
{
}

- (NSString)recipientName
{
  return self->_recipientName;
}

- (void)setRecipientName:(id)a3
{
}

- (NSData)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void)setSharingSessionIdentifier:(id)a3
{
}

- (unsigned)entitlement
{
  return self->_entitlement;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (unsigned)supportedRadioTechnologies
{
  return self->_supportedRadioTechnologies;
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (void)setBrandIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_recipientName, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
}

@end