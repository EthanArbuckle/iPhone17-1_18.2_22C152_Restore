@interface PREAMResponseListGenerated
- (BOOL)hasAgeGroup;
- (BOOL)hasExperimentId;
- (BOOL)hasGenerationStatus;
- (BOOL)hasHostProcess;
- (BOOL)hasIsApricotDevice;
- (BOOL)hasIsCached;
- (BOOL)hasLang;
- (BOOL)hasLocale;
- (BOOL)hasNumberOfCustomResponses;
- (BOOL)hasNumberOfResponsesGenerated;
- (BOOL)hasNumberOfRobotResponses;
- (BOOL)hasTreatmentId;
- (BOOL)hasTreatmentModelName;
- (BOOL)isApricotDevice;
- (BOOL)isCached;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)experimentId;
- (NSString)hostProcess;
- (NSString)lang;
- (NSString)locale;
- (NSString)treatmentId;
- (NSString)treatmentModelName;
- (id)ageGroupAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)generationStatusAsString:(int)a3;
- (int)StringAsAgeGroup:(id)a3;
- (int)StringAsGenerationStatus:(id)a3;
- (int)ageGroup;
- (int)generationStatus;
- (unint64_t)hash;
- (unsigned)numberOfCustomResponses;
- (unsigned)numberOfResponsesGenerated;
- (unsigned)numberOfRobotResponses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgeGroup:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setGenerationStatus:(int)a3;
- (void)setHasAgeGroup:(BOOL)a3;
- (void)setHasGenerationStatus:(BOOL)a3;
- (void)setHasIsApricotDevice:(BOOL)a3;
- (void)setHasIsCached:(BOOL)a3;
- (void)setHasNumberOfCustomResponses:(BOOL)a3;
- (void)setHasNumberOfResponsesGenerated:(BOOL)a3;
- (void)setHasNumberOfRobotResponses:(BOOL)a3;
- (void)setHostProcess:(id)a3;
- (void)setIsApricotDevice:(BOOL)a3;
- (void)setIsCached:(BOOL)a3;
- (void)setLang:(id)a3;
- (void)setLocale:(id)a3;
- (void)setNumberOfCustomResponses:(unsigned int)a3;
- (void)setNumberOfResponsesGenerated:(unsigned int)a3;
- (void)setNumberOfRobotResponses:(unsigned int)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTreatmentModelName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PREAMResponseListGenerated

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentModelName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_hostProcess, 0);

  objc_storeStrong((id *)&self->_experimentId, 0);
}

- (BOOL)isApricotDevice
{
  return self->_isApricotDevice;
}

- (void)setLang:(id)a3
{
}

- (NSString)lang
{
  return self->_lang;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setHostProcess:(id)a3
{
}

- (NSString)hostProcess
{
  return self->_hostProcess;
}

- (void)setTreatmentModelName:(id)a3
{
}

- (NSString)treatmentModelName
{
  return self->_treatmentModelName;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (unsigned)numberOfRobotResponses
{
  return self->_numberOfRobotResponses;
}

- (unsigned)numberOfCustomResponses
{
  return self->_numberOfCustomResponses;
}

- (unsigned)numberOfResponsesGenerated
{
  return self->_numberOfResponsesGenerated;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 92);
  if ((v5 & 0x40) != 0)
  {
    self->_isCached = *((unsigned char *)v4 + 89);
    *(unsigned char *)&self->_has |= 0x40u;
    char v5 = *((unsigned char *)v4 + 92);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_generationStatus = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 92);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_numberOfResponsesGenerated = *((_DWORD *)v4 + 15);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 92);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_29:
  self->_numberOfCustomResponses = *((_DWORD *)v4 + 14);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 92) & 0x10) != 0)
  {
LABEL_6:
    self->_numberOfRobotResponses = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
  id v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[PREAMResponseListGenerated setExperimentId:](self, "setExperimentId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[PREAMResponseListGenerated setTreatmentId:](self, "setTreatmentId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 10))
  {
    -[PREAMResponseListGenerated setTreatmentModelName:](self, "setTreatmentModelName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[PREAMResponseListGenerated setHostProcess:](self, "setHostProcess:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[PREAMResponseListGenerated setLocale:](self, "setLocale:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[PREAMResponseListGenerated setLang:](self, "setLang:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 92);
  if ((v6 & 0x20) != 0)
  {
    self->_isApricotDevice = *((unsigned char *)v4 + 88);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v4 + 92);
  }
  if (v6)
  {
    self->_ageGroup = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v17 = 2654435761 * self->_isCached;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v15 = 2654435761 * self->_generationStatus;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v3 = 2654435761 * self->_numberOfResponsesGenerated;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v4 = 2654435761 * self->_numberOfCustomResponses;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_numberOfRobotResponses;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
LABEL_12:
  NSUInteger v6 = [(NSString *)self->_experimentId hash];
  NSUInteger v7 = [(NSString *)self->_treatmentId hash];
  NSUInteger v8 = [(NSString *)self->_treatmentModelName hash];
  NSUInteger v9 = [(NSString *)self->_hostProcess hash];
  NSUInteger v10 = [(NSString *)self->_locale hash];
  NSUInteger v11 = [(NSString *)self->_lang hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v12 = 2654435761 * self->_isApricotDevice;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_14;
    }
LABEL_16:
    uint64_t v13 = 0;
    return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  uint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v13 = 2654435761 * self->_ageGroup;
  return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x40) == 0) {
      goto LABEL_54;
    }
    if (self->_isCached)
    {
      if (!*((unsigned char *)v4 + 89)) {
        goto LABEL_54;
      }
    }
    else if (*((unsigned char *)v4 + 89))
    {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 0x40) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0 || self->_generationStatus != *((_DWORD *)v4 + 6)) {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 8) == 0 || self->_numberOfResponsesGenerated != *((_DWORD *)v4 + 15)) {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 8) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0 || self->_numberOfCustomResponses != *((_DWORD *)v4 + 14)) {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x10) == 0 || self->_numberOfRobotResponses != *((_DWORD *)v4 + 16)) {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 0x10) != 0)
  {
    goto LABEL_54;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 2)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_54;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_54;
    }
  }
  treatmentModelName = self->_treatmentModelName;
  if ((unint64_t)treatmentModelName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](treatmentModelName, "isEqual:")) {
      goto LABEL_54;
    }
  }
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:")) {
      goto LABEL_54;
    }
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_54;
    }
  }
  lang = self->_lang;
  if ((unint64_t)lang | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](lang, "isEqual:")) {
      goto LABEL_54;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x20) != 0)
    {
      if (self->_isApricotDevice)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_54;
        }
        goto LABEL_50;
      }
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_50;
      }
    }
LABEL_54:
    BOOL v11 = 0;
    goto LABEL_55;
  }
  if ((*((unsigned char *)v4 + 92) & 0x20) != 0) {
    goto LABEL_54;
  }
LABEL_50:
  BOOL v11 = (*((unsigned char *)v4 + 92) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2)) {
      goto LABEL_54;
    }
    BOOL v11 = 1;
  }
LABEL_55:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 89) = self->_isCached;
    *(unsigned char *)(v5 + 92) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_generationStatus;
  *(unsigned char *)(v5 + 92) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 60) = self->_numberOfResponsesGenerated;
  *(unsigned char *)(v5 + 92) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  *(_DWORD *)(v5 + 56) = self->_numberOfCustomResponses;
  *(unsigned char *)(v5 + 92) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 64) = self->_numberOfRobotResponses;
    *(unsigned char *)(v5 + 92) |= 0x10u;
  }
LABEL_7:
  uint64_t v8 = [(NSString *)self->_experimentId copyWithZone:a3];
  NSUInteger v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_treatmentId copyWithZone:a3];
  BOOL v11 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v10;

  uint64_t v12 = [(NSString *)self->_treatmentModelName copyWithZone:a3];
  uint64_t v13 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v12;

  uint64_t v14 = [(NSString *)self->_hostProcess copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v14;

  uint64_t v16 = [(NSString *)self->_locale copyWithZone:a3];
  uint64_t v17 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v16;

  uint64_t v18 = [(NSString *)self->_lang copyWithZone:a3];
  v19 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v18;

  char v20 = (char)self->_has;
  if ((v20 & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 88) = self->_isApricotDevice;
    *(unsigned char *)(v6 + 92) |= 0x20u;
    char v20 = (char)self->_has;
  }
  if (v20)
  {
    *(_DWORD *)(v6 + 8) = self->_ageGroup;
    *(unsigned char *)(v6 + 92) |= 1u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[89] = self->_isCached;
    v4[92] |= 0x40u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_generationStatus;
  v4[92] |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 15) = self->_numberOfResponsesGenerated;
  v4[92] |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_29:
  *((_DWORD *)v4 + 14) = self->_numberOfCustomResponses;
  v4[92] |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 16) = self->_numberOfRobotResponses;
    v4[92] |= 0x10u;
  }
LABEL_7:
  NSUInteger v7 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    id v4 = v7;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v7, "setTreatmentId:");
    id v4 = v7;
  }
  if (self->_treatmentModelName)
  {
    objc_msgSend(v7, "setTreatmentModelName:");
    id v4 = v7;
  }
  if (self->_hostProcess)
  {
    objc_msgSend(v7, "setHostProcess:");
    id v4 = v7;
  }
  if (self->_locale)
  {
    objc_msgSend(v7, "setLocale:");
    id v4 = v7;
  }
  if (self->_lang)
  {
    objc_msgSend(v7, "setLang:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    v4[88] = self->_isApricotDevice;
    v4[92] |= 0x20u;
    char v6 = (char)self->_has;
  }
  if (v6)
  {
    *((_DWORD *)v4 + 2) = self->_ageGroup;
    v4[92] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_experimentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentModelName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hostProcess) {
    PBDataWriterWriteStringField();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  if (self->_lang) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
  }
  if (v5) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PREAMResponseListGeneratedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v16 = [NSNumber numberWithBool:self->_isCached];
    [v3 setObject:v16 forKey:@"is_cached"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t generationStatus = self->_generationStatus;
  if (generationStatus >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_generationStatus);
    uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v18 = off_1E65B1A20[generationStatus];
  }
  [v3 setObject:v18 forKey:@"generation_status"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  char v20 = [NSNumber numberWithUnsignedInt:self->_numberOfResponsesGenerated];
  [v3 setObject:v20 forKey:@"number_of_responses_generated"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_35:
  v21 = [NSNumber numberWithUnsignedInt:self->_numberOfCustomResponses];
  [v3 setObject:v21 forKey:@"number_of_custom_responses"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    char v5 = [NSNumber numberWithUnsignedInt:self->_numberOfRobotResponses];
    [v3 setObject:v5 forKey:@"number_of_robot_responses"];
  }
LABEL_7:
  experimentId = self->_experimentId;
  if (experimentId) {
    [v3 setObject:experimentId forKey:@"experiment_id"];
  }
  treatmentId = self->_treatmentId;
  if (treatmentId) {
    [v3 setObject:treatmentId forKey:@"treatment_id"];
  }
  treatmentModelName = self->_treatmentModelName;
  if (treatmentModelName) {
    [v3 setObject:treatmentModelName forKey:@"treatment_model_name"];
  }
  hostProcess = self->_hostProcess;
  if (hostProcess) {
    [v3 setObject:hostProcess forKey:@"host_process"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  lang = self->_lang;
  if (lang) {
    [v3 setObject:lang forKey:@"lang"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 0x20) != 0)
  {
    uint64_t v13 = [NSNumber numberWithBool:self->_isApricotDevice];
    [v3 setObject:v13 forKey:@"is_apricot_device"];

    char v12 = (char)self->_has;
  }
  if (v12)
  {
    uint64_t ageGroup = self->_ageGroup;
    if (ageGroup >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ageGroup);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = off_1E65B1A50[ageGroup];
    }
    [v3 setObject:v15 forKey:@"age_group"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PREAMResponseListGenerated;
  id v4 = [(PREAMResponseListGenerated *)&v8 description];
  char v5 = [(PREAMResponseListGenerated *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsAgeGroup:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GROUP_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GROUP_0TO18"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GROUP_19TO30"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GROUP_31TO50"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GROUP_51TO65"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GROUP_66TO75"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GROUP_76UP"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)ageGroupAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B1A50[a3];
  }

  return v3;
}

- (BOOL)hasAgeGroup
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAgeGroup:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAgeGroup:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t ageGroup = a3;
}

- (int)ageGroup
{
  if (*(unsigned char *)&self->_has) {
    return self->_ageGroup;
  }
  else {
    return 0;
  }
}

- (BOOL)hasIsApricotDevice
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasIsApricotDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setIsApricotDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isApricotDevice = a3;
}

- (BOOL)hasLang
{
  return self->_lang != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasHostProcess
{
  return self->_hostProcess != 0;
}

- (BOOL)hasTreatmentModelName
{
  return self->_treatmentModelName != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasNumberOfRobotResponses
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasNumberOfRobotResponses:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setNumberOfRobotResponses:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numberOfRobotResponses = a3;
}

- (BOOL)hasNumberOfCustomResponses
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNumberOfCustomResponses:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNumberOfCustomResponses:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numberOfCustomResponses = a3;
}

- (BOOL)hasNumberOfResponsesGenerated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNumberOfResponsesGenerated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setNumberOfResponsesGenerated:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numberOfResponsesGenerated = a3;
}

- (int)StringAsGenerationStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NORMAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CACHED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FALLBACK_TO_RK_NIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FALLBACK_TO_RK_ERROR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ONLY_CANNED_QR_EMPTY_ARRAY"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)generationStatusAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B1A20[a3];
  }

  return v3;
}

- (BOOL)hasGenerationStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasGenerationStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setGenerationStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t generationStatus = a3;
}

- (int)generationStatus
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_generationStatus;
  }
  else {
    return 0;
  }
}

- (BOOL)hasIsCached
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasIsCached:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setIsCached:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isCached = a3;
}

@end