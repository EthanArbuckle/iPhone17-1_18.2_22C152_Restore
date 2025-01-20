@interface PETMetadata
- (BOOL)hasBuild;
- (BOOL)hasConfigVersion;
- (BOOL)hasCountry;
- (BOOL)hasDevice;
- (BOOL)hasIsConfigEnabled;
- (BOOL)hasIsGm;
- (BOOL)hasIsInternal;
- (BOOL)hasIsInternalCarry;
- (BOOL)hasIsSeed;
- (BOOL)hasIsTestingData;
- (BOOL)hasIsTrialUpload;
- (BOOL)hasLanguage;
- (BOOL)hasMessageGroup;
- (BOOL)hasPlatform;
- (BOOL)hasPseudoDeviceId;
- (BOOL)hasUploadIdentifier;
- (BOOL)hasUploadService;
- (BOOL)hasUploadTime;
- (BOOL)isConfigEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGm;
- (BOOL)isInternal;
- (BOOL)isInternalCarry;
- (BOOL)isSeed;
- (BOOL)isTestingData;
- (BOOL)isTrialUpload;
- (BOOL)readFrom:(id)a3;
- (NSString)build;
- (NSString)country;
- (NSString)device;
- (NSString)language;
- (NSString)messageGroup;
- (NSString)platform;
- (NSString)pseudoDeviceId;
- (NSString)uploadIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)uploadServiceAsString:(int)a3;
- (int)StringAsUploadService:(id)a3;
- (int)uploadService;
- (unint64_t)hash;
- (unint64_t)uploadTime;
- (unsigned)configVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setConfigVersion:(unsigned int)a3;
- (void)setCountry:(id)a3;
- (void)setDevice:(id)a3;
- (void)setHasConfigVersion:(BOOL)a3;
- (void)setHasIsConfigEnabled:(BOOL)a3;
- (void)setHasIsGm:(BOOL)a3;
- (void)setHasIsInternal:(BOOL)a3;
- (void)setHasIsInternalCarry:(BOOL)a3;
- (void)setHasIsSeed:(BOOL)a3;
- (void)setHasIsTestingData:(BOOL)a3;
- (void)setHasIsTrialUpload:(BOOL)a3;
- (void)setHasUploadService:(BOOL)a3;
- (void)setHasUploadTime:(BOOL)a3;
- (void)setIsConfigEnabled:(BOOL)a3;
- (void)setIsGm:(BOOL)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setIsInternalCarry:(BOOL)a3;
- (void)setIsSeed:(BOOL)a3;
- (void)setIsTestingData:(BOOL)a3;
- (void)setIsTrialUpload:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setMessageGroup:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setPseudoDeviceId:(id)a3;
- (void)setUploadIdentifier:(id)a3;
- (void)setUploadService:(int)a3;
- (void)setUploadTime:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadIdentifier, 0);
  objc_storeStrong((id *)&self->_pseudoDeviceId, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_messageGroup, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_country, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

- (BOOL)isTrialUpload
{
  return self->_isTrialUpload;
}

- (BOOL)isTestingData
{
  return self->_isTestingData;
}

- (void)setUploadIdentifier:(id)a3
{
}

- (NSString)uploadIdentifier
{
  return self->_uploadIdentifier;
}

- (void)setMessageGroup:(id)a3
{
}

- (NSString)messageGroup
{
  return self->_messageGroup;
}

- (BOOL)isConfigEnabled
{
  return self->_isConfigEnabled;
}

- (BOOL)isInternalCarry
{
  return self->_isInternalCarry;
}

- (void)setPseudoDeviceId:(id)a3
{
}

- (NSString)pseudoDeviceId
{
  return self->_pseudoDeviceId;
}

- (unsigned)configVersion
{
  return self->_configVersion;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setCountry:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (BOOL)isGm
{
  return self->_isGm;
}

- (BOOL)isSeed
{
  return self->_isSeed;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setBuild:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setDevice:(id)a3
{
}

- (NSString)device
{
  return self->_device;
}

- (void)setPlatform:(id)a3
{
}

- (NSString)platform
{
  return self->_platform;
}

- (unint64_t)uploadTime
{
  return self->_uploadTime;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((_WORD *)v4 + 50))
  {
    self->_uploadTime = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  id v8 = v4;
  if (*((void *)v4 + 8))
  {
    -[PETMetadata setPlatform:](self, "setPlatform:");
    id v4 = v8;
  }
  if (*((void *)v4 + 5))
  {
    -[PETMetadata setDevice:](self, "setDevice:");
    id v4 = v8;
  }
  if (*((void *)v4 + 2))
  {
    -[PETMetadata setBuild:](self, "setBuild:");
    id v4 = v8;
  }
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x20) != 0)
  {
    self->_isInternal = *((unsigned char *)v4 + 94);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v5 = *((_WORD *)v4 + 50);
    if ((v5 & 0x80) == 0)
    {
LABEL_11:
      if ((v5 & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_11;
  }
  self->_isSeed = *((unsigned char *)v4 + 96);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 50) & 0x10) != 0)
  {
LABEL_12:
    self->_isGm = *((unsigned char *)v4 + 93);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_13:
  if (*((void *)v4 + 4))
  {
    -[PETMetadata setCountry:](self, "setCountry:");
    id v4 = v8;
  }
  if (*((void *)v4 + 6))
  {
    -[PETMetadata setLanguage:](self, "setLanguage:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 50);
  if ((v6 & 2) != 0)
  {
    self->_configVersion = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 2u;
    __int16 v6 = *((_WORD *)v4 + 50);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_isTestingData = *((unsigned char *)v4 + 97);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 9))
  {
    -[PETMetadata setPseudoDeviceId:](self, "setPseudoDeviceId:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 50);
  if ((v7 & 0x200) != 0)
  {
    self->_isTrialUpload = *((unsigned char *)v4 + 98);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v7 = *((_WORD *)v4 + 50);
    if ((v7 & 0x40) == 0)
    {
LABEL_25:
      if ((v7 & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_25;
  }
  self->_isInternalCarry = *((unsigned char *)v4 + 95);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 50) & 8) != 0)
  {
LABEL_26:
    self->_isConfigEnabled = *((unsigned char *)v4 + 92);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_27:
  if (*((void *)v4 + 7))
  {
    -[PETMetadata setMessageGroup:](self, "setMessageGroup:");
    id v4 = v8;
  }
  if ((*((_WORD *)v4 + 50) & 4) != 0)
  {
    self->_uploadService = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 10))
  {
    -[PETMetadata setUploadIdentifier:](self, "setUploadIdentifier:");
    id v4 = v8;
  }
}

- (unint64_t)hash
{
  if (*(_WORD *)&self->_has) {
    unint64_t v22 = 2654435761u * self->_uploadTime;
  }
  else {
    unint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_platform hash];
  NSUInteger v20 = [(NSString *)self->_device hash];
  NSUInteger v19 = [(NSString *)self->_build hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
    uint64_t v18 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v17 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v18 = 2654435761 * self->_isInternal;
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v17 = 2654435761 * self->_isSeed;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v16 = 2654435761 * self->_isGm;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v16 = 0;
LABEL_11:
  NSUInteger v15 = [(NSString *)self->_country hash];
  NSUInteger v4 = [(NSString *)self->_language hash];
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_configVersion;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_13:
      uint64_t v6 = 2654435761 * self->_isTestingData;
      goto LABEL_16;
    }
  }
  uint64_t v6 = 0;
LABEL_16:
  NSUInteger v7 = [(NSString *)self->_pseudoDeviceId hash];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
    uint64_t v9 = 0;
    if ((v8 & 0x40) != 0) {
      goto LABEL_18;
    }
LABEL_21:
    uint64_t v10 = 0;
    if ((v8 & 8) != 0) {
      goto LABEL_19;
    }
    goto LABEL_22;
  }
  uint64_t v9 = 2654435761 * self->_isTrialUpload;
  if ((v8 & 0x40) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v10 = 2654435761 * self->_isInternalCarry;
  if ((v8 & 8) != 0)
  {
LABEL_19:
    uint64_t v11 = 2654435761 * self->_isConfigEnabled;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = 0;
LABEL_23:
  NSUInteger v12 = [(NSString *)self->_messageGroup hash];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v13 = 2654435761 * self->_uploadService;
  }
  else {
    uint64_t v13 = 0;
  }
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSString *)self->_uploadIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_91;
  }
  __int16 v5 = *((_WORD *)v4 + 50);
  if (*(_WORD *)&self->_has)
  {
    if ((v5 & 1) == 0 || self->_uploadTime != *((void *)v4 + 1)) {
      goto LABEL_91;
    }
  }
  else if (v5)
  {
    goto LABEL_91;
  }
  platform = self->_platform;
  if ((unint64_t)platform | *((void *)v4 + 8) && !-[NSString isEqual:](platform, "isEqual:")) {
    goto LABEL_91;
  }
  device = self->_device;
  if ((unint64_t)device | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](device, "isEqual:")) {
      goto LABEL_91;
    }
  }
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](build, "isEqual:")) {
      goto LABEL_91;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 50);
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0) {
      goto LABEL_91;
    }
    if (self->_isInternal)
    {
      if (!*((unsigned char *)v4 + 94)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 94))
    {
      goto LABEL_91;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0) {
      goto LABEL_91;
    }
    if (self->_isSeed)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_91;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0) {
      goto LABEL_91;
    }
    if (self->_isGm)
    {
      if (!*((unsigned char *)v4 + 93)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 93))
    {
      goto LABEL_91;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  country = self->_country;
  if ((unint64_t)country | *((void *)v4 + 4) && !-[NSString isEqual:](country, "isEqual:")) {
    goto LABEL_91;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_91;
    }
  }
  __int16 v13 = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 50);
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_configVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x100) == 0) {
      goto LABEL_91;
    }
    if (self->_isTestingData)
    {
      if (!*((unsigned char *)v4 + 97)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 97))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x100) != 0)
  {
    goto LABEL_91;
  }
  pseudoDeviceId = self->_pseudoDeviceId;
  if ((unint64_t)pseudoDeviceId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](pseudoDeviceId, "isEqual:")) {
      goto LABEL_91;
    }
    __int16 v13 = (__int16)self->_has;
    __int16 v14 = *((_WORD *)v4 + 50);
  }
  if ((v13 & 0x200) != 0)
  {
    if ((v14 & 0x200) == 0) {
      goto LABEL_91;
    }
    if (self->_isTrialUpload)
    {
      if (!*((unsigned char *)v4 + 98)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 98))
    {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0) {
      goto LABEL_91;
    }
    if (self->_isInternalCarry)
    {
      if (!*((unsigned char *)v4 + 95)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 95))
    {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0) {
      goto LABEL_91;
    }
    if (self->_isConfigEnabled)
    {
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 92))
    {
      goto LABEL_91;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_91;
  }
  messageGroup = self->_messageGroup;
  if (!((unint64_t)messageGroup | *((void *)v4 + 7))) {
    goto LABEL_84;
  }
  if (!-[NSString isEqual:](messageGroup, "isEqual:"))
  {
LABEL_91:
    char v18 = 0;
    goto LABEL_92;
  }
  __int16 v13 = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 50);
LABEL_84:
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_uploadService != *((_DWORD *)v4 + 22)) {
      goto LABEL_91;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_91;
  }
  uploadIdentifier = self->_uploadIdentifier;
  if ((unint64_t)uploadIdentifier | *((void *)v4 + 10)) {
    char v18 = -[NSString isEqual:](uploadIdentifier, "isEqual:");
  }
  else {
    char v18 = 1;
  }
LABEL_92:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(_WORD *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_uploadTime;
    *(_WORD *)(v5 + 100) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_platform copyWithZone:a3];
  __int16 v8 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v7;

  uint64_t v9 = [(NSString *)self->_device copyWithZone:a3];
  __int16 v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_build copyWithZone:a3];
  NSUInteger v12 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v11;

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 94) = self->_isInternal;
    *(_WORD *)(v6 + 100) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 96) = self->_isSeed;
  *(_WORD *)(v6 + 100) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(unsigned char *)(v6 + 93) = self->_isGm;
    *(_WORD *)(v6 + 100) |= 0x10u;
  }
LABEL_7:
  uint64_t v14 = [(NSString *)self->_country copyWithZone:a3];
  NSUInteger v15 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v14;

  uint64_t v16 = [(NSString *)self->_language copyWithZone:a3];
  uint64_t v17 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v16;

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_configVersion;
    *(_WORD *)(v6 + 100) |= 2u;
    __int16 v18 = (__int16)self->_has;
  }
  if ((v18 & 0x100) != 0)
  {
    *(unsigned char *)(v6 + 97) = self->_isTestingData;
    *(_WORD *)(v6 + 100) |= 0x100u;
  }
  uint64_t v19 = [(NSString *)self->_pseudoDeviceId copyWithZone:a3];
  NSUInteger v20 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v19;

  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x200) != 0)
  {
    *(unsigned char *)(v6 + 98) = self->_isTrialUpload;
    *(_WORD *)(v6 + 100) |= 0x200u;
    __int16 v21 = (__int16)self->_has;
    if ((v21 & 0x40) == 0)
    {
LABEL_13:
      if ((v21 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v21 & 0x40) == 0)
  {
    goto LABEL_13;
  }
  *(unsigned char *)(v6 + 95) = self->_isInternalCarry;
  *(_WORD *)(v6 + 100) |= 0x40u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_14:
    *(unsigned char *)(v6 + 92) = self->_isConfigEnabled;
    *(_WORD *)(v6 + 100) |= 8u;
  }
LABEL_15:
  uint64_t v22 = [(NSString *)self->_messageGroup copyWithZone:a3];
  v23 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v22;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_uploadService;
    *(_WORD *)(v6 + 100) |= 4u;
  }
  uint64_t v24 = [(NSString *)self->_uploadIdentifier copyWithZone:a3];
  v25 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v24;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(_WORD *)&self->_has)
  {
    v4[1] = self->_uploadTime;
    *((_WORD *)v4 + 50) |= 1u;
  }
  __int16 v8 = v4;
  if (self->_platform)
  {
    objc_msgSend(v4, "setPlatform:");
    id v4 = v8;
  }
  if (self->_device)
  {
    objc_msgSend(v8, "setDevice:");
    id v4 = v8;
  }
  if (self->_build)
  {
    objc_msgSend(v8, "setBuild:");
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 94) = self->_isInternal;
    *((_WORD *)v4 + 50) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v4 + 96) = self->_isSeed;
  *((_WORD *)v4 + 50) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    *((unsigned char *)v4 + 93) = self->_isGm;
    *((_WORD *)v4 + 50) |= 0x10u;
  }
LABEL_13:
  if (self->_country)
  {
    objc_msgSend(v8, "setCountry:");
    id v4 = v8;
  }
  if (self->_language)
  {
    objc_msgSend(v8, "setLanguage:");
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_configVersion;
    *((_WORD *)v4 + 50) |= 2u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    *((unsigned char *)v4 + 97) = self->_isTestingData;
    *((_WORD *)v4 + 50) |= 0x100u;
  }
  if (self->_pseudoDeviceId)
  {
    objc_msgSend(v8, "setPseudoDeviceId:");
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 98) = self->_isTrialUpload;
    *((_WORD *)v4 + 50) |= 0x200u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x40) == 0)
    {
LABEL_25:
      if ((v7 & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_25;
  }
  *((unsigned char *)v4 + 95) = self->_isInternalCarry;
  *((_WORD *)v4 + 50) |= 0x40u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_26:
    *((unsigned char *)v4 + 92) = self->_isConfigEnabled;
    *((_WORD *)v4 + 50) |= 8u;
  }
LABEL_27:
  if (self->_messageGroup)
  {
    objc_msgSend(v8, "setMessageGroup:");
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_uploadService;
    *((_WORD *)v4 + 50) |= 4u;
  }
  if (self->_uploadIdentifier)
  {
    objc_msgSend(v8, "setUploadIdentifier:");
    id v4 = v8;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*(_WORD *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
  }
  if (self->_platform)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_device)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
LABEL_13:
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_pseudoDeviceId)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x40) == 0)
    {
LABEL_25:
      if ((v7 & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_26:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
LABEL_27:
  if (self->_messageGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_uploadIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(_WORD *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_uploadTime];
    [v3 setObject:v4 forKey:@"upload_time"];
  }
  platform = self->_platform;
  if (platform) {
    [v3 setObject:platform forKey:@"platform"];
  }
  device = self->_device;
  if (device) {
    [v3 setObject:device forKey:@"device"];
  }
  build = self->_build;
  if (build) {
    [v3 setObject:build forKey:@"build"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    NSUInteger v20 = [NSNumber numberWithBool:self->_isInternal];
    [v3 setObject:v20 forKey:@"is_internal"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_11;
  }
  __int16 v21 = [NSNumber numberWithBool:self->_isSeed];
  [v3 setObject:v21 forKey:@"is_seed"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    uint64_t v9 = [NSNumber numberWithBool:self->_isGm];
    [v3 setObject:v9 forKey:@"is_gm"];
  }
LABEL_13:
  country = self->_country;
  if (country) {
    [v3 setObject:country forKey:@"country"];
  }
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    NSUInteger v12 = [NSNumber numberWithUnsignedInt:self->_configVersion];
    [v3 setObject:v12 forKey:@"config_version"];
  }
  pseudoDeviceId = self->_pseudoDeviceId;
  if (pseudoDeviceId) {
    [v3 setObject:pseudoDeviceId forKey:@"pseudo_device_id"];
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x40) != 0)
  {
    NSUInteger v15 = [NSNumber numberWithBool:self->_isInternalCarry];
    [v3 setObject:v15 forKey:@"is_internal_carry"];

    __int16 v14 = (__int16)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    uint64_t v16 = [NSNumber numberWithBool:self->_isConfigEnabled];
    [v3 setObject:v16 forKey:@"is_config_enabled"];
  }
  messageGroup = self->_messageGroup;
  if (messageGroup) {
    [v3 setObject:messageGroup forKey:@"message_group"];
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    uint64_t uploadService = self->_uploadService;
    if (uploadService >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_uploadService);
      uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v19 = off_1E56C3FA8[uploadService];
    }
    [v3 setObject:v19 forKey:@"upload_service"];
  }
  uploadIdentifier = self->_uploadIdentifier;
  if (uploadIdentifier) {
    [v3 setObject:uploadIdentifier forKey:@"upload_identifier"];
  }
  __int16 v23 = (__int16)self->_has;
  if ((v23 & 0x100) != 0)
  {
    uint64_t v24 = [NSNumber numberWithBool:self->_isTestingData];
    [v3 setObject:v24 forKey:@"is_testing_data"];

    __int16 v23 = (__int16)self->_has;
  }
  if ((v23 & 0x200) != 0)
  {
    v25 = [NSNumber numberWithBool:self->_isTrialUpload];
    [v3 setObject:v25 forKey:@"is_trial_upload"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PETMetadata;
  id v4 = [(PETMetadata *)&v8 description];
  uint64_t v5 = [(PETMetadata *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsTrialUpload
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasIsTrialUpload:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setIsTrialUpload:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isTrialUpload = a3;
}

- (BOOL)hasIsTestingData
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIsTestingData:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setIsTestingData:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isTestingData = a3;
}

- (BOOL)hasUploadIdentifier
{
  return self->_uploadIdentifier != 0;
}

- (int)StringAsUploadService:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PARSEC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LDCP"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)uploadServiceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E56C3FA8[a3];
  }

  return v3;
}

- (BOOL)hasUploadService
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasUploadService:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setUploadService:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uint64_t uploadService = a3;
}

- (int)uploadService
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_uploadService;
  }
  else {
    return 0;
  }
}

- (BOOL)hasMessageGroup
{
  return self->_messageGroup != 0;
}

- (BOOL)hasIsConfigEnabled
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasIsConfigEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setIsConfigEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isConfigEnabled = a3;
}

- (BOOL)hasIsInternalCarry
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsInternalCarry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setIsInternalCarry:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isInternalCarry = a3;
}

- (BOOL)hasPseudoDeviceId
{
  return self->_pseudoDeviceId != 0;
}

- (BOOL)hasConfigVersion
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasConfigVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setConfigVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_configVersion = a3;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (BOOL)hasIsGm
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasIsGm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setIsGm:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isGm = a3;
}

- (BOOL)hasIsSeed
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsSeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setIsSeed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isSeed = a3;
}

- (BOOL)hasIsInternal
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasIsInternal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setIsInternal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isInternal = a3;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasDevice
{
  return self->_device != 0;
}

- (BOOL)hasPlatform
{
  return self->_platform != 0;
}

- (BOOL)hasUploadTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasUploadTime:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setUploadTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_uploadTime = a3;
}

@end