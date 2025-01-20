@interface PREAMResponseItem
- (BOOL)hasAgeGroup;
- (BOOL)hasExperimentId;
- (BOOL)hasHostProcess;
- (BOOL)hasIsApricotDevice;
- (BOOL)hasIsCustomResponse;
- (BOOL)hasIsRobotResponse;
- (BOOL)hasLang;
- (BOOL)hasLocale;
- (BOOL)hasModelId;
- (BOOL)hasPosition;
- (BOOL)hasReplyTextId;
- (BOOL)hasResponseClassId;
- (BOOL)hasTreatmentId;
- (BOOL)hasTreatmentModelName;
- (BOOL)isApricotDevice;
- (BOOL)isCustomResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRobotResponse;
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
- (int)StringAsAgeGroup:(id)a3;
- (int)ageGroup;
- (unint64_t)hash;
- (unsigned)modelId;
- (unsigned)position;
- (unsigned)replyTextId;
- (unsigned)responseClassId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgeGroup:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasAgeGroup:(BOOL)a3;
- (void)setHasIsApricotDevice:(BOOL)a3;
- (void)setHasIsCustomResponse:(BOOL)a3;
- (void)setHasIsRobotResponse:(BOOL)a3;
- (void)setHasModelId:(BOOL)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasReplyTextId:(BOOL)a3;
- (void)setHasResponseClassId:(BOOL)a3;
- (void)setHostProcess:(id)a3;
- (void)setIsApricotDevice:(BOOL)a3;
- (void)setIsCustomResponse:(BOOL)a3;
- (void)setIsRobotResponse:(BOOL)a3;
- (void)setLang:(id)a3;
- (void)setLocale:(id)a3;
- (void)setModelId:(unsigned int)a3;
- (void)setPosition:(unsigned int)a3;
- (void)setReplyTextId:(unsigned int)a3;
- (void)setResponseClassId:(unsigned int)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTreatmentModelName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PREAMResponseItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentModelName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_hostProcess, 0);

  objc_storeStrong((id *)&self->_experimentId, 0);
}

- (BOOL)isRobotResponse
{
  return self->_isRobotResponse;
}

- (BOOL)isCustomResponse
{
  return self->_isCustomResponse;
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

- (unsigned)position
{
  return self->_position;
}

- (unsigned)replyTextId
{
  return self->_replyTextId;
}

- (unsigned)responseClassId
{
  return self->_responseClassId;
}

- (unsigned)modelId
{
  return self->_modelId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 84);
  if ((v5 & 2) != 0)
  {
    self->_modelId = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 84);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_responseClassId = *((_DWORD *)v4 + 15);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 84);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  self->_replyTextId = *((_DWORD *)v4 + 14);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
LABEL_5:
    self->_position = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
  id v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[PREAMResponseItem setExperimentId:](self, "setExperimentId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 8))
  {
    -[PREAMResponseItem setTreatmentId:](self, "setTreatmentId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[PREAMResponseItem setTreatmentModelName:](self, "setTreatmentModelName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[PREAMResponseItem setHostProcess:](self, "setHostProcess:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[PREAMResponseItem setLocale:](self, "setLocale:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[PREAMResponseItem setLang:](self, "setLang:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 84);
  if ((v6 & 0x20) != 0)
  {
    self->_isApricotDevice = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v4 + 84);
    if ((v6 & 1) == 0)
    {
LABEL_20:
      if ((v6 & 0x40) == 0) {
        goto LABEL_21;
      }
LABEL_31:
      self->_isCustomResponse = *((unsigned char *)v4 + 81);
      *(unsigned char *)&self->_has |= 0x40u;
      if ((*((unsigned char *)v4 + 84) & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 1) == 0)
  {
    goto LABEL_20;
  }
  self->_ageGroup = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v6 = *((unsigned char *)v4 + 84);
  if ((v6 & 0x40) != 0) {
    goto LABEL_31;
  }
LABEL_21:
  if ((v6 & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_32:
  self->_isRobotResponse = *((unsigned char *)v4 + 82);
  *(unsigned char *)&self->_has |= 0x80u;
LABEL_22:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_modelId;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_responseClassId;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_replyTextId;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v17 = 2654435761 * self->_position;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v17 = 0;
LABEL_10:
  NSUInteger v6 = [(NSString *)self->_experimentId hash];
  NSUInteger v7 = [(NSString *)self->_treatmentId hash];
  NSUInteger v8 = [(NSString *)self->_treatmentModelName hash];
  NSUInteger v9 = [(NSString *)self->_hostProcess hash];
  NSUInteger v10 = [(NSString *)self->_locale hash];
  NSUInteger v11 = [(NSString *)self->_lang hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v12 = 2654435761 * self->_isApricotDevice;
  }
  else {
    uint64_t v12 = 0;
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v17 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
  uint64_t v13 = 2654435761 * self->_ageGroup;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v14 = 2654435761 * self->_isCustomResponse;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v15 = 2654435761 * self->_isRobotResponse;
  return v4 ^ v3 ^ v5 ^ v17 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[84] & 2) == 0 || self->_modelId != *((_DWORD *)v4 + 12)) {
      goto LABEL_58;
    }
  }
  else if ((v4[84] & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[84] & 0x10) == 0 || self->_responseClassId != *((_DWORD *)v4 + 15)) {
      goto LABEL_58;
    }
  }
  else if ((v4[84] & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[84] & 8) == 0 || self->_replyTextId != *((_DWORD *)v4 + 14)) {
      goto LABEL_58;
    }
  }
  else if ((v4[84] & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[84] & 4) == 0 || self->_position != *((_DWORD *)v4 + 13)) {
      goto LABEL_58;
    }
  }
  else if ((v4[84] & 4) != 0)
  {
    goto LABEL_58;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 2)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_58;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_58;
    }
  }
  treatmentModelName = self->_treatmentModelName;
  if ((unint64_t)treatmentModelName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentModelName, "isEqual:")) {
      goto LABEL_58;
    }
  }
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:")) {
      goto LABEL_58;
    }
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_58;
    }
  }
  lang = self->_lang;
  if ((unint64_t)lang | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](lang, "isEqual:")) {
      goto LABEL_58;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[84] & 0x20) == 0) {
      goto LABEL_58;
    }
    if (self->_isApricotDevice)
    {
      if (!v4[80]) {
        goto LABEL_58;
      }
    }
    else if (v4[80])
    {
      goto LABEL_58;
    }
  }
  else if ((v4[84] & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[84] & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2)) {
      goto LABEL_58;
    }
  }
  else if (v4[84])
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[84] & 0x40) == 0) {
      goto LABEL_58;
    }
    if (self->_isCustomResponse)
    {
      if (!v4[81]) {
        goto LABEL_58;
      }
    }
    else if (v4[81])
    {
      goto LABEL_58;
    }
  }
  else if ((v4[84] & 0x40) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if (v4[84] < 0)
    {
      if (self->_isRobotResponse)
      {
        if (!v4[82]) {
          goto LABEL_58;
        }
      }
      else if (v4[82])
      {
        goto LABEL_58;
      }
      BOOL v11 = 1;
      goto LABEL_59;
    }
LABEL_58:
    BOOL v11 = 0;
    goto LABEL_59;
  }
  BOOL v11 = v4[84] >= 0;
LABEL_59:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_modelId;
    *(unsigned char *)(v5 + 84) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 60) = self->_responseClassId;
  *(unsigned char *)(v5 + 84) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *(_DWORD *)(v5 + 56) = self->_replyTextId;
  *(unsigned char *)(v5 + 84) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 52) = self->_position;
    *(unsigned char *)(v5 + 84) |= 4u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_experimentId copyWithZone:a3];
  NSUInteger v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_treatmentId copyWithZone:a3];
  BOOL v11 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v10;

  uint64_t v12 = [(NSString *)self->_treatmentModelName copyWithZone:a3];
  uint64_t v13 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_hostProcess copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v14;

  uint64_t v16 = [(NSString *)self->_locale copyWithZone:a3];
  uint64_t v17 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v16;

  uint64_t v18 = [(NSString *)self->_lang copyWithZone:a3];
  v19 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v18;

  char v20 = (char)self->_has;
  if ((v20 & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 80) = self->_isApricotDevice;
    *(unsigned char *)(v6 + 84) |= 0x20u;
    char v20 = (char)self->_has;
    if ((v20 & 1) == 0)
    {
LABEL_8:
      if ((v20 & 0x40) == 0) {
        goto LABEL_9;
      }
LABEL_17:
      *(unsigned char *)(v6 + 81) = self->_isCustomResponse;
      *(unsigned char *)(v6 + 84) |= 0x40u;
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        return (id)v6;
      }
LABEL_18:
      *(unsigned char *)(v6 + 82) = self->_isRobotResponse;
      *(unsigned char *)(v6 + 84) |= 0x80u;
      return (id)v6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 8) = self->_ageGroup;
  *(unsigned char *)(v6 + 84) |= 1u;
  char v20 = (char)self->_has;
  if ((v20 & 0x40) != 0) {
    goto LABEL_17;
  }
LABEL_9:
  if (v20 < 0) {
    goto LABEL_18;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  uint64_t v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[12] = self->_modelId;
    *((unsigned char *)v4 + 84) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[15] = self->_responseClassId;
  *((unsigned char *)v4 + 84) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  v4[14] = self->_replyTextId;
  *((unsigned char *)v4 + 84) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v4[13] = self->_position;
    *((unsigned char *)v4 + 84) |= 4u;
  }
LABEL_6:
  NSUInteger v7 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    uint64_t v4 = v7;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v7, "setTreatmentId:");
    uint64_t v4 = v7;
  }
  if (self->_treatmentModelName)
  {
    objc_msgSend(v7, "setTreatmentModelName:");
    uint64_t v4 = v7;
  }
  if (self->_hostProcess)
  {
    objc_msgSend(v7, "setHostProcess:");
    uint64_t v4 = v7;
  }
  if (self->_locale)
  {
    objc_msgSend(v7, "setLocale:");
    uint64_t v4 = v7;
  }
  if (self->_lang)
  {
    objc_msgSend(v7, "setLang:");
    uint64_t v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((unsigned char *)v4 + 80) = self->_isApricotDevice;
    *((unsigned char *)v4 + 84) |= 0x20u;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_20:
      if ((v6 & 0x40) == 0) {
        goto LABEL_21;
      }
LABEL_31:
      *((unsigned char *)v4 + 81) = self->_isCustomResponse;
      *((unsigned char *)v4 + 84) |= 0x40u;
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_20;
  }
  v4[2] = self->_ageGroup;
  *((unsigned char *)v4 + 84) |= 1u;
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0) {
    goto LABEL_31;
  }
LABEL_21:
  if ((v6 & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_32:
  *((unsigned char *)v4 + 82) = self->_isRobotResponse;
  *((unsigned char *)v4 + 84) |= 0x80u;
LABEL_22:
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
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
    if ((v5 & 1) == 0)
    {
LABEL_20:
      if ((v5 & 0x40) == 0) {
        goto LABEL_21;
      }
LABEL_31:
      PBDataWriterWriteBOOLField();
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteInt32Field();
  char v5 = (char)self->_has;
  if ((v5 & 0x40) != 0) {
    goto LABEL_31;
  }
LABEL_21:
  if ((v5 & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
LABEL_22:
}

- (BOOL)readFrom:(id)a3
{
  return PREAMResponseItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInt:self->_modelId];
    [v3 setObject:v14 forKey:@"model_id"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v15 = [NSNumber numberWithUnsignedInt:self->_responseClassId];
  [v3 setObject:v15 forKey:@"response_class_id"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  uint64_t v16 = [NSNumber numberWithUnsignedInt:self->_replyTextId];
  [v3 setObject:v16 forKey:@"reply_text_id"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    char v5 = [NSNumber numberWithUnsignedInt:self->_position];
    [v3 setObject:v5 forKey:@"position"];
  }
LABEL_6:
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
    uint64_t v17 = [NSNumber numberWithBool:self->_isApricotDevice];
    [v3 setObject:v17 forKey:@"is_apricot_device"];

    char v12 = (char)self->_has;
    if ((v12 & 1) == 0)
    {
LABEL_20:
      if ((v12 & 0x40) == 0) {
        goto LABEL_21;
      }
LABEL_34:
      char v20 = [NSNumber numberWithBool:self->_isCustomResponse];
      [v3 setObject:v20 forKey:@"is_custom_response"];

      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_20;
  }
  uint64_t ageGroup = self->_ageGroup;
  if (ageGroup >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ageGroup);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E65B1BF0[ageGroup];
  }
  [v3 setObject:v19 forKey:@"age_group"];

  char v12 = (char)self->_has;
  if ((v12 & 0x40) != 0) {
    goto LABEL_34;
  }
LABEL_21:
  if ((v12 & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_35:
  v21 = [NSNumber numberWithBool:self->_isRobotResponse];
  [v3 setObject:v21 forKey:@"is_robot_response"];

LABEL_22:

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PREAMResponseItem;
  uint64_t v4 = [(PREAMResponseItem *)&v8 description];
  char v5 = [(PREAMResponseItem *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsRobotResponse
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasIsRobotResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (void)setIsRobotResponse:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isRobotResponse = a3;
}

- (BOOL)hasIsCustomResponse
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasIsCustomResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setIsCustomResponse:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isCustomResponse = a3;
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
    id v3 = off_1E65B1BF0[a3];
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

- (BOOL)hasPosition
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPosition:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setPosition:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_position = a3;
}

- (BOOL)hasReplyTextId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasReplyTextId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setReplyTextId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_replyTextId = a3;
}

- (BOOL)hasResponseClassId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasResponseClassId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setResponseClassId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_responseClassId = a3;
}

- (BOOL)hasModelId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasModelId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setModelId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_modelId = a3;
}

@end