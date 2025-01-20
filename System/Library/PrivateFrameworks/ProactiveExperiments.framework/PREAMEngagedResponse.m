@interface PREAMEngagedResponse
- (BOOL)hasAgeGroup;
- (BOOL)hasExperimentId;
- (BOOL)hasGenerationStatus;
- (BOOL)hasHasQuestionMark;
- (BOOL)hasHostProcess;
- (BOOL)hasInputMethod;
- (BOOL)hasIsApricotDevice;
- (BOOL)hasIsCustomResponse;
- (BOOL)hasIsRobotResponse;
- (BOOL)hasLang;
- (BOOL)hasLocale;
- (BOOL)hasModelId;
- (BOOL)hasNumberOfCustomResponses;
- (BOOL)hasNumberOfResponsesGenerated;
- (BOOL)hasNumberOfRobotResponses;
- (BOOL)hasPosition;
- (BOOL)hasQuestionMark;
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
- (id)generationStatusAsString:(int)a3;
- (id)inputMethodAsString:(int)a3;
- (int)StringAsAgeGroup:(id)a3;
- (int)StringAsGenerationStatus:(id)a3;
- (int)StringAsInputMethod:(id)a3;
- (int)ageGroup;
- (int)generationStatus;
- (int)inputMethod;
- (unint64_t)hash;
- (unsigned)modelId;
- (unsigned)numberOfCustomResponses;
- (unsigned)numberOfResponsesGenerated;
- (unsigned)numberOfRobotResponses;
- (unsigned)position;
- (unsigned)replyTextId;
- (unsigned)responseClassId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgeGroup:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setGenerationStatus:(int)a3;
- (void)setHasAgeGroup:(BOOL)a3;
- (void)setHasGenerationStatus:(BOOL)a3;
- (void)setHasHasQuestionMark:(BOOL)a3;
- (void)setHasInputMethod:(BOOL)a3;
- (void)setHasIsApricotDevice:(BOOL)a3;
- (void)setHasIsCustomResponse:(BOOL)a3;
- (void)setHasIsRobotResponse:(BOOL)a3;
- (void)setHasModelId:(BOOL)a3;
- (void)setHasNumberOfCustomResponses:(BOOL)a3;
- (void)setHasNumberOfResponsesGenerated:(BOOL)a3;
- (void)setHasNumberOfRobotResponses:(BOOL)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasQuestionMark:(BOOL)a3;
- (void)setHasReplyTextId:(BOOL)a3;
- (void)setHasResponseClassId:(BOOL)a3;
- (void)setHostProcess:(id)a3;
- (void)setInputMethod:(int)a3;
- (void)setIsApricotDevice:(BOOL)a3;
- (void)setIsCustomResponse:(BOOL)a3;
- (void)setIsRobotResponse:(BOOL)a3;
- (void)setLang:(id)a3;
- (void)setLocale:(id)a3;
- (void)setModelId:(unsigned int)a3;
- (void)setNumberOfCustomResponses:(unsigned int)a3;
- (void)setNumberOfResponsesGenerated:(unsigned int)a3;
- (void)setNumberOfRobotResponses:(unsigned int)a3;
- (void)setPosition:(unsigned int)a3;
- (void)setReplyTextId:(unsigned int)a3;
- (void)setResponseClassId:(unsigned int)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTreatmentModelName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PREAMEngagedResponse

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

- (BOOL)hasQuestionMark
{
  return self->_hasQuestionMark;
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
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 8) != 0)
  {
    self->_modelId = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)v4 + 58);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_responseClassId = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_replyTextId = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_position = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_inputMethod = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_generationStatus = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_numberOfResponsesGenerated = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_39:
  self->_numberOfCustomResponses = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 58) & 0x40) != 0)
  {
LABEL_10:
    self->_numberOfRobotResponses = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_11:
  id v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[PREAMEngagedResponse setExperimentId:](self, "setExperimentId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 12))
  {
    -[PREAMEngagedResponse setTreatmentId:](self, "setTreatmentId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 13))
  {
    -[PREAMEngagedResponse setTreatmentModelName:](self, "setTreatmentModelName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[PREAMEngagedResponse setHostProcess:](self, "setHostProcess:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[PREAMEngagedResponse setLocale:](self, "setLocale:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[PREAMEngagedResponse setLang:](self, "setLang:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x800) != 0)
  {
    self->_isApricotDevice = *((unsigned char *)v4 + 113);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v6 = *((_WORD *)v4 + 58);
    if ((v6 & 1) == 0)
    {
LABEL_25:
      if ((v6 & 0x400) == 0) {
        goto LABEL_26;
      }
      goto LABEL_43;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_25;
  }
  self->_ageGroup = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x400) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_hasQuestionMark = *((unsigned char *)v4 + 112);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x1000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_44:
  self->_isCustomResponse = *((unsigned char *)v4 + 114);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 58) & 0x2000) != 0)
  {
LABEL_28:
    self->_isRobotResponse = *((unsigned char *)v4 + 115);
    *(_WORD *)&self->_has |= 0x2000u;
  }
LABEL_29:
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v25 = 2654435761 * self->_modelId;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v24 = 2654435761 * self->_responseClassId;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v23 = 2654435761 * self->_replyTextId;
    if ((has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v23 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v22 = 2654435761 * self->_position;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v22 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    uint64_t v21 = 2654435761 * self->_inputMethod;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v21 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    uint64_t v20 = 2654435761 * self->_generationStatus;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v20 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v19 = 2654435761 * self->_numberOfResponsesGenerated;
    if ((has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v4 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v19 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v4 = 2654435761 * self->_numberOfCustomResponses;
  if ((has & 0x40) != 0)
  {
LABEL_10:
    uint64_t v5 = 2654435761 * self->_numberOfRobotResponses;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v5 = 0;
LABEL_20:
  NSUInteger v6 = [(NSString *)self->_experimentId hash];
  NSUInteger v7 = [(NSString *)self->_treatmentId hash];
  NSUInteger v8 = [(NSString *)self->_treatmentModelName hash];
  NSUInteger v9 = [(NSString *)self->_hostProcess hash];
  NSUInteger v10 = [(NSString *)self->_locale hash];
  NSUInteger v11 = [(NSString *)self->_lang hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x800) != 0)
  {
    uint64_t v13 = 2654435761 * self->_isApricotDevice;
    if (v12)
    {
LABEL_22:
      uint64_t v14 = 2654435761 * self->_ageGroup;
      if ((*(_WORD *)&self->_has & 0x400) != 0) {
        goto LABEL_23;
      }
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (v12) {
      goto LABEL_22;
    }
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_23:
    uint64_t v15 = 2654435761 * self->_hasQuestionMark;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_24;
    }
LABEL_29:
    uint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_25;
    }
LABEL_30:
    uint64_t v17 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_28:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_29;
  }
LABEL_24:
  uint64_t v16 = 2654435761 * self->_isCustomResponse;
  if ((*(_WORD *)&self->_has & 0x2000) == 0) {
    goto LABEL_30;
  }
LABEL_25:
  uint64_t v17 = 2654435761 * self->_isRobotResponse;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_91;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_modelId != *((_DWORD *)v4 + 16)) {
      goto LABEL_91;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0 || self->_responseClassId != *((_DWORD *)v4 + 22)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_replyTextId != *((_DWORD *)v4 + 21)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_position != *((_DWORD *)v4 + 20)) {
      goto LABEL_91;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_inputMethod != *((_DWORD *)v4 + 10)) {
      goto LABEL_91;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_generationStatus != *((_DWORD *)v4 + 6)) {
      goto LABEL_91;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numberOfResponsesGenerated != *((_DWORD *)v4 + 18)) {
      goto LABEL_91;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numberOfCustomResponses != *((_DWORD *)v4 + 17)) {
      goto LABEL_91;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_numberOfRobotResponses != *((_DWORD *)v4 + 19)) {
      goto LABEL_91;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 2)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_91;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_91;
    }
  }
  treatmentModelName = self->_treatmentModelName;
  if ((unint64_t)treatmentModelName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](treatmentModelName, "isEqual:")) {
      goto LABEL_91;
    }
  }
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:")) {
      goto LABEL_91;
    }
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_91;
    }
  }
  lang = self->_lang;
  if ((unint64_t)lang | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](lang, "isEqual:")) {
      goto LABEL_91;
    }
  }
  __int16 v13 = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 58);
  if ((v13 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x800) == 0) {
      goto LABEL_91;
    }
    if (self->_isApricotDevice)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x800) != 0)
  {
    goto LABEL_91;
  }
  if (v13)
  {
    if ((v14 & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2)) {
      goto LABEL_91;
    }
  }
  else if (v14)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x400) == 0) {
      goto LABEL_91;
    }
    if (self->_hasQuestionMark)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x1000) == 0) {
      goto LABEL_91;
    }
    if (self->_isCustomResponse)
    {
      if (!*((unsigned char *)v4 + 114)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 114))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x1000) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x2000) != 0)
    {
      if (self->_isRobotResponse)
      {
        if (!*((unsigned char *)v4 + 115)) {
          goto LABEL_91;
        }
      }
      else if (*((unsigned char *)v4 + 115))
      {
        goto LABEL_91;
      }
      BOOL v15 = 1;
      goto LABEL_92;
    }
LABEL_91:
    BOOL v15 = 0;
    goto LABEL_92;
  }
  BOOL v15 = (v14 & 0x2000) == 0;
LABEL_92:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_modelId;
    *(_WORD *)(v5 + 116) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 88) = self->_responseClassId;
  *(_WORD *)(v5 + 116) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 84) = self->_replyTextId;
  *(_WORD *)(v5 + 116) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 80) = self->_position;
  *(_WORD *)(v5 + 116) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 40) = self->_inputMethod;
  *(_WORD *)(v5 + 116) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 24) = self->_generationStatus;
  *(_WORD *)(v5 + 116) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 72) = self->_numberOfResponsesGenerated;
  *(_WORD *)(v5 + 116) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  *(_DWORD *)(v5 + 68) = self->_numberOfCustomResponses;
  *(_WORD *)(v5 + 116) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 76) = self->_numberOfRobotResponses;
    *(_WORD *)(v5 + 116) |= 0x40u;
  }
LABEL_11:
  uint64_t v8 = [(NSString *)self->_experimentId copyWithZone:a3];
  NSUInteger v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_treatmentId copyWithZone:a3];
  NSUInteger v11 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v10;

  uint64_t v12 = [(NSString *)self->_treatmentModelName copyWithZone:a3];
  __int16 v13 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v12;

  uint64_t v14 = [(NSString *)self->_hostProcess copyWithZone:a3];
  BOOL v15 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v14;

  uint64_t v16 = [(NSString *)self->_locale copyWithZone:a3];
  uint64_t v17 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v16;

  uint64_t v18 = [(NSString *)self->_lang copyWithZone:a3];
  uint64_t v19 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v18;

  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x800) != 0)
  {
    *(unsigned char *)(v6 + 113) = self->_isApricotDevice;
    *(_WORD *)(v6 + 116) |= 0x800u;
    __int16 v20 = (__int16)self->_has;
    if ((v20 & 1) == 0)
    {
LABEL_13:
      if ((v20 & 0x400) == 0) {
        goto LABEL_14;
      }
      goto LABEL_29;
    }
  }
  else if ((v20 & 1) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 8) = self->_ageGroup;
  *(_WORD *)(v6 + 116) |= 1u;
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x400) == 0)
  {
LABEL_14:
    if ((v20 & 0x1000) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    *(unsigned char *)(v6 + 114) = self->_isCustomResponse;
    *(_WORD *)(v6 + 116) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 0x2000) == 0) {
      return (id)v6;
    }
    goto LABEL_16;
  }
LABEL_29:
  *(unsigned char *)(v6 + 112) = self->_hasQuestionMark;
  *(_WORD *)(v6 + 116) |= 0x400u;
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x1000) != 0) {
    goto LABEL_30;
  }
LABEL_15:
  if ((v20 & 0x2000) != 0)
  {
LABEL_16:
    *(unsigned char *)(v6 + 115) = self->_isRobotResponse;
    *(_WORD *)(v6 + 116) |= 0x2000u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[16] = self->_modelId;
    *((_WORD *)v4 + 58) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v4[22] = self->_responseClassId;
  *((_WORD *)v4 + 58) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[21] = self->_replyTextId;
  *((_WORD *)v4 + 58) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[20] = self->_position;
  *((_WORD *)v4 + 58) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[10] = self->_inputMethod;
  *((_WORD *)v4 + 58) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[6] = self->_generationStatus;
  *((_WORD *)v4 + 58) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[18] = self->_numberOfResponsesGenerated;
  *((_WORD *)v4 + 58) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_39:
  v4[17] = self->_numberOfCustomResponses;
  *((_WORD *)v4 + 58) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    v4[19] = self->_numberOfRobotResponses;
    *((_WORD *)v4 + 58) |= 0x40u;
  }
LABEL_11:
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
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    *((unsigned char *)v4 + 113) = self->_isApricotDevice;
    *((_WORD *)v4 + 58) |= 0x800u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_25:
      if ((v6 & 0x400) == 0) {
        goto LABEL_26;
      }
      goto LABEL_43;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_25;
  }
  v4[2] = self->_ageGroup;
  *((_WORD *)v4 + 58) |= 1u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)v4 + 112) = self->_hasQuestionMark;
  *((_WORD *)v4 + 58) |= 0x400u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_44:
  *((unsigned char *)v4 + 114) = self->_isCustomResponse;
  *((_WORD *)v4 + 58) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_28:
    *((unsigned char *)v4 + 115) = self->_isRobotResponse;
    *((_WORD *)v4 + 58) |= 0x2000u;
  }
LABEL_29:
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
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
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 1) == 0)
    {
LABEL_25:
      if ((v5 & 0x400) == 0) {
        goto LABEL_26;
      }
      goto LABEL_43;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x400) == 0)
  {
LABEL_26:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x1000) == 0)
  {
LABEL_27:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
LABEL_28:
  }
    PBDataWriterWriteBOOLField();
LABEL_29:
}

- (BOOL)readFrom:(id)a3
{
  return PREAMEngagedResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    BOOL v15 = [NSNumber numberWithUnsignedInt:self->_modelId];
    [v3 setObject:v15 forKey:@"model_id"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v16 = [NSNumber numberWithUnsignedInt:self->_responseClassId];
  [v3 setObject:v16 forKey:@"response_class_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v17 = [NSNumber numberWithUnsignedInt:self->_replyTextId];
  [v3 setObject:v17 forKey:@"reply_text_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v18 = [NSNumber numberWithUnsignedInt:self->_position];
  [v3 setObject:v18 forKey:@"position"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_36:
  uint64_t inputMethod = self->_inputMethod;
  if (inputMethod >= 6)
  {
    __int16 v20 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_inputMethod);
  }
  else
  {
    __int16 v20 = *(&off_1E65B18E0 + inputMethod);
  }
  [v3 setObject:v20 forKey:@"input_method"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_52;
  }
LABEL_43:
  uint64_t generationStatus = self->_generationStatus;
  if (generationStatus >= 6)
  {
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_generationStatus);
  }
  else
  {
    uint64_t v25 = *(&off_1E65B1910 + generationStatus);
  }
  [v3 setObject:v25 forKey:@"generation_status"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_53;
  }
LABEL_52:
  v28 = [NSNumber numberWithUnsignedInt:self->_numberOfResponsesGenerated];
  [v3 setObject:v28 forKey:@"number_of_responses_generated"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_53:
  v29 = [NSNumber numberWithUnsignedInt:self->_numberOfCustomResponses];
  [v3 setObject:v29 forKey:@"number_of_custom_responses"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    __int16 v5 = [NSNumber numberWithUnsignedInt:self->_numberOfRobotResponses];
    [v3 setObject:v5 forKey:@"number_of_robot_responses"];
  }
LABEL_11:
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
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x800) != 0)
  {
    uint64_t v21 = [NSNumber numberWithBool:self->_isApricotDevice];
    [v3 setObject:v21 forKey:@"is_apricot_device"];

    __int16 v12 = (__int16)self->_has;
    if ((v12 & 1) == 0)
    {
LABEL_25:
      if ((v12 & 0x400) == 0) {
        goto LABEL_26;
      }
      goto LABEL_47;
    }
  }
  else if ((v12 & 1) == 0)
  {
    goto LABEL_25;
  }
  uint64_t ageGroup = self->_ageGroup;
  if (ageGroup >= 7)
  {
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ageGroup);
  }
  else
  {
    uint64_t v23 = *(&off_1E65B1940 + ageGroup);
  }
  [v3 setObject:v23 forKey:@"age_group"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x400) == 0)
  {
LABEL_26:
    if ((v12 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_48;
  }
LABEL_47:
  v26 = [NSNumber numberWithBool:self->_hasQuestionMark];
  [v3 setObject:v26 forKey:@"has_question_mark"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x1000) == 0)
  {
LABEL_27:
    if ((v12 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_48:
  v27 = [NSNumber numberWithBool:self->_isCustomResponse];
  [v3 setObject:v27 forKey:@"is_custom_response"];

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_28:
    __int16 v13 = [NSNumber numberWithBool:self->_isRobotResponse];
    [v3 setObject:v13 forKey:@"is_robot_response"];
  }
LABEL_29:

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PREAMEngagedResponse;
  id v4 = [(PREAMEngagedResponse *)&v8 description];
  __int16 v5 = [(PREAMEngagedResponse *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsRobotResponse
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasIsRobotResponse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)setIsRobotResponse:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isRobotResponse = a3;
}

- (BOOL)hasIsCustomResponse
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasIsCustomResponse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setIsCustomResponse:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isCustomResponse = a3;
}

- (BOOL)hasHasQuestionMark
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasHasQuestionMark:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setHasQuestionMark:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_hasQuestionMark = a3;
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
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E65B1940 + a3);
  }

  return v3;
}

- (BOOL)hasAgeGroup
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasAgeGroup:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setAgeGroup:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_uint64_t ageGroup = a3;
}

- (int)ageGroup
{
  if (*(_WORD *)&self->_has) {
    return self->_ageGroup;
  }
  else {
    return 0;
  }
}

- (BOOL)hasIsApricotDevice
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasIsApricotDevice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setIsApricotDevice:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
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
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumberOfRobotResponses:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setNumberOfRobotResponses:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numberOfRobotResponses = a3;
}

- (BOOL)hasNumberOfCustomResponses
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumberOfCustomResponses:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setNumberOfCustomResponses:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numberOfCustomResponses = a3;
}

- (BOOL)hasNumberOfResponsesGenerated
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumberOfResponsesGenerated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setNumberOfResponsesGenerated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
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
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E65B1910 + a3);
  }

  return v3;
}

- (BOOL)hasGenerationStatus
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasGenerationStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setGenerationStatus:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_uint64_t generationStatus = a3;
}

- (int)generationStatus
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_generationStatus;
  }
  else {
    return 0;
  }
}

- (int)StringAsInputMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"METHOD_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CANNED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCRIBBLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DICTATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EMOJI"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HEART"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)inputMethodAsString:(int)a3
{
  if (a3 >= 6)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E65B18E0 + a3);
  }

  return v3;
}

- (BOOL)hasInputMethod
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasInputMethod:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setInputMethod:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uint64_t inputMethod = a3;
}

- (int)inputMethod
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_inputMethod;
  }
  else {
    return 0;
  }
}

- (BOOL)hasPosition
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setPosition:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_position = a3;
}

- (BOOL)hasReplyTextId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasReplyTextId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setReplyTextId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_replyTextId = a3;
}

- (BOOL)hasResponseClassId
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasResponseClassId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setResponseClassId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_responseClassId = a3;
}

- (BOOL)hasModelId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasModelId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setModelId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_modelId = a3;
}

@end