@interface NPKIDVRemoteDeviceProtoNotificationRequest
- (BOOL)hasIssuerName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)issuerName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)documentTypeAsString:(int)a3;
- (id)notificationTypeAsString:(int)a3;
- (int)StringAsDocumentType:(id)a3;
- (int)StringAsNotificationType:(id)a3;
- (int)documentType;
- (int)notificationType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDocumentType:(int)a3;
- (void)setIssuerName:(id)a3;
- (void)setNotificationType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoNotificationRequest

- (id)notificationTypeAsString:(int)a3
{
  if ((a3 + 1) >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2644D2EC8[a3 + 1];
  }
  return v3;
}

- (int)StringAsNotificationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"ActionRequired"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VerificationCodeRequired"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ProvisioningRejected"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UnableToAddCredential"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FollowVerificationInstructionRequired"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TryAgainVerificationCodeRequired"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"VerificationETA"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LivenessStepUpRequired"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ProofingExpired"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (id)documentTypeAsString:(int)a3
{
  if ((a3 + 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_2644D2F18[a3 + 1];
  }
  return v3;
}

- (int)StringAsDocumentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"DriverLicense"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"StateID"])
  {
    int v4 = 1;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (BOOL)hasIssuerName
{
  return self->_issuerName != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoNotificationRequest;
  int v4 = [(NPKIDVRemoteDeviceProtoNotificationRequest *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoNotificationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  unsigned int v4 = self->_notificationType + 1;
  if (v4 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_notificationType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_2644D2EC8[v4];
  }
  [v3 setObject:v5 forKey:@"notificationType"];

  unsigned int v6 = self->_documentType + 1;
  if (v6 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_documentType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_2644D2F18[v6];
  }
  [v3 setObject:v7 forKey:@"DocumentType"];

  issuerName = self->_issuerName;
  if (issuerName) {
    [v3 setObject:issuerName forKey:@"issuerName"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoNotificationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (self->_issuerName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 6) = self->_notificationType;
  *((_DWORD *)a3 + 2) = self->_documentType;
  issuerName = self->_issuerName;
  if (issuerName) {
    [a3 setIssuerName:issuerName];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_notificationType;
  *(_DWORD *)(v5 + 8) = self->_documentType;
  uint64_t v6 = [(NSString *)self->_issuerName copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_notificationType == *((_DWORD *)v4 + 6)
    && self->_documentType == *((_DWORD *)v4 + 2))
  {
    issuerName = self->_issuerName;
    if ((unint64_t)issuerName | v4[2]) {
      char v6 = -[NSString isEqual:](issuerName, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = (2654435761 * self->_documentType) ^ (2654435761 * self->_notificationType);
  return v2 ^ [(NSString *)self->_issuerName hash];
}

- (void)mergeFrom:(id)a3
{
  self->_notificationType = *((_DWORD *)a3 + 6);
  self->_documentType = *((_DWORD *)a3 + 2);
  if (*((void *)a3 + 2)) {
    -[NPKIDVRemoteDeviceProtoNotificationRequest setIssuerName:](self, "setIssuerName:");
  }
}

- (int)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(int)a3
{
  self->_notificationType = a3;
}

- (int)documentType
{
  return self->_documentType;
}

- (void)setDocumentType:(int)a3
{
  self->_documentType = a3;
}

- (NSString)issuerName
{
  return self->_issuerName;
}

- (void)setIssuerName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end