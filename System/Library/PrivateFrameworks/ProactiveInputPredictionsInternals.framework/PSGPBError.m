@interface PSGPBError
- (BOOL)hasBundleIdentifier;
- (BOOL)hasContextBeforeInput;
- (BOOL)hasErrorType;
- (BOOL)hasExperimentId;
- (BOOL)hasHasContextBeforeInput;
- (BOOL)hasHasRecipientNames;
- (BOOL)hasHasResponseContext;
- (BOOL)hasInitiatingProcess;
- (BOOL)hasIsDocumentEmpty;
- (BOOL)hasIsResponseContextBlacklisted;
- (BOOL)hasLocaleIdentifier;
- (BOOL)hasMaxPredictionItems;
- (BOOL)hasMaxStructuredInfoItems;
- (BOOL)hasMaxTextualResponseItems;
- (BOOL)hasRecipientNames;
- (BOOL)hasResponseContext;
- (BOOL)hasTextContentType;
- (BOOL)hasTreatmentId;
- (BOOL)hasTreatmentName;
- (BOOL)hasTriggerAttributeField;
- (BOOL)hasTriggerAttributeSubtype;
- (BOOL)hasTriggerAttributeType;
- (BOOL)hasTriggerCategory;
- (BOOL)hasTriggerSourceType;
- (BOOL)isDocumentEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResponseContextBlacklisted;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)experimentId;
- (NSString)initiatingProcess;
- (NSString)localeIdentifier;
- (NSString)textContentType;
- (NSString)treatmentId;
- (NSString)treatmentName;
- (NSString)triggerAttributeField;
- (NSString)triggerAttributeSubtype;
- (NSString)triggerAttributeType;
- (NSString)triggerCategory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorTypeAsString:(int)a3;
- (id)triggerSourceTypeAsString:(int)a3;
- (int)StringAsErrorType:(id)a3;
- (int)StringAsTriggerSourceType:(id)a3;
- (int)errorType;
- (int)triggerSourceType;
- (unint64_t)hash;
- (unsigned)maxPredictionItems;
- (unsigned)maxStructuredInfoItems;
- (unsigned)maxTextualResponseItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setErrorType:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasContextBeforeInput:(BOOL)a3;
- (void)setHasErrorType:(BOOL)a3;
- (void)setHasHasContextBeforeInput:(BOOL)a3;
- (void)setHasHasRecipientNames:(BOOL)a3;
- (void)setHasHasResponseContext:(BOOL)a3;
- (void)setHasIsDocumentEmpty:(BOOL)a3;
- (void)setHasIsResponseContextBlacklisted:(BOOL)a3;
- (void)setHasMaxPredictionItems:(BOOL)a3;
- (void)setHasMaxStructuredInfoItems:(BOOL)a3;
- (void)setHasMaxTextualResponseItems:(BOOL)a3;
- (void)setHasRecipientNames:(BOOL)a3;
- (void)setHasResponseContext:(BOOL)a3;
- (void)setHasTriggerSourceType:(BOOL)a3;
- (void)setInitiatingProcess:(id)a3;
- (void)setIsDocumentEmpty:(BOOL)a3;
- (void)setIsResponseContextBlacklisted:(BOOL)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setMaxPredictionItems:(unsigned int)a3;
- (void)setMaxStructuredInfoItems:(unsigned int)a3;
- (void)setMaxTextualResponseItems:(unsigned int)a3;
- (void)setTextContentType:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTreatmentName:(id)a3;
- (void)setTriggerAttributeField:(id)a3;
- (void)setTriggerAttributeSubtype:(id)a3;
- (void)setTriggerAttributeType:(id)a3;
- (void)setTriggerCategory:(id)a3;
- (void)setTriggerSourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSGPBError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerCategory, 0);
  objc_storeStrong((id *)&self->_triggerAttributeType, 0);
  objc_storeStrong((id *)&self->_triggerAttributeSubtype, 0);
  objc_storeStrong((id *)&self->_triggerAttributeField, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_initiatingProcess, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setTriggerAttributeField:(id)a3
{
}

- (void)setTriggerAttributeSubtype:(id)a3
{
}

- (void)setTriggerAttributeType:(id)a3
{
}

- (NSString)triggerAttributeType
{
  return self->_triggerAttributeType;
}

- (void)setTriggerCategory:(id)a3
{
}

- (NSString)triggerCategory
{
  return self->_triggerCategory;
}

- (void)setInitiatingProcess:(id)a3
{
}

- (NSString)initiatingProcess
{
  return self->_initiatingProcess;
}

- (unsigned)maxPredictionItems
{
  return self->_maxPredictionItems;
}

- (unsigned)maxStructuredInfoItems
{
  return self->_maxStructuredInfoItems;
}

- (unsigned)maxTextualResponseItems
{
  return self->_maxTextualResponseItems;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (BOOL)hasRecipientNames
{
  return self->_hasRecipientNames;
}

- (BOOL)hasContextBeforeInput
{
  return self->_hasContextBeforeInput;
}

- (void)setTextContentType:(id)a3
{
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (BOOL)isDocumentEmpty
{
  return self->_isDocumentEmpty;
}

- (BOOL)isResponseContextBlacklisted
{
  return self->_isResponseContextBlacklisted;
}

- (BOOL)hasResponseContext
{
  return self->_hasResponseContext;
}

- (void)setTreatmentName:(id)a3
{
}

- (NSString)treatmentName
{
  return self->_treatmentName;
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

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((_WORD *)v4 + 66))
  {
    self->_errorType = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
  id v8 = v4;
  if (*((void *)v4 + 3))
  {
    -[PSGPBError setExperimentId:](self, "setExperimentId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 9))
  {
    -[PSGPBError setTreatmentId:](self, "setTreatmentId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 10))
  {
    -[PSGPBError setTreatmentName:](self, "setTreatmentName:");
    id v4 = v8;
  }
  __int16 v5 = *((_WORD *)v4 + 66);
  if ((v5 & 0x80) != 0)
  {
    self->_hasResponseContext = *((unsigned char *)v4 + 126);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v5 = *((_WORD *)v4 + 66);
    if ((v5 & 0x200) == 0)
    {
LABEL_11:
      if ((v5 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) == 0)
  {
    goto LABEL_11;
  }
  self->_isResponseContextBlacklisted = *((unsigned char *)v4 + 128);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
LABEL_12:
    self->_isDocumentEmpty = *((unsigned char *)v4 + 127);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_13:
  if (*((void *)v4 + 8))
  {
    -[PSGPBError setTextContentType:](self, "setTextContentType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 5))
  {
    -[PSGPBError setLocaleIdentifier:](self, "setLocaleIdentifier:");
    id v4 = v8;
  }
  if (*((void *)v4 + 1))
  {
    -[PSGPBError setBundleIdentifier:](self, "setBundleIdentifier:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 8) != 0)
  {
    self->_maxTextualResponseItems = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 66);
  }
  if ((v6 & 4) != 0)
  {
    self->_maxStructuredInfoItems = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4))
  {
    -[PSGPBError setInitiatingProcess:](self, "setInitiatingProcess:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 66);
  if ((v7 & 0x20) != 0)
  {
    self->_hasContextBeforeInput = *((unsigned char *)v4 + 124);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v7 = *((_WORD *)v4 + 66);
    if ((v7 & 2) == 0)
    {
LABEL_27:
      if ((v7 & 0x40) == 0) {
        goto LABEL_28;
      }
      goto LABEL_46;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_27;
  }
  self->_maxPredictionItems = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 2u;
  __int16 v7 = *((_WORD *)v4 + 66);
  if ((v7 & 0x40) == 0)
  {
LABEL_28:
    if ((v7 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_46:
  self->_hasRecipientNames = *((unsigned char *)v4 + 125);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 66) & 0x10) != 0)
  {
LABEL_29:
    self->_triggerSourceType = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_30:
  if (*((void *)v4 + 14))
  {
    -[PSGPBError setTriggerCategory:](self, "setTriggerCategory:");
    id v4 = v8;
  }
  if (*((void *)v4 + 13))
  {
    -[PSGPBError setTriggerAttributeType:](self, "setTriggerAttributeType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 12))
  {
    -[PSGPBError setTriggerAttributeSubtype:](self, "setTriggerAttributeSubtype:");
    id v4 = v8;
  }
  if (*((void *)v4 + 11))
  {
    -[PSGPBError setTriggerAttributeField:](self, "setTriggerAttributeField:");
    id v4 = v8;
  }
}

- (unint64_t)hash
{
  if (*(_WORD *)&self->_has) {
    uint64_t v26 = 2654435761 * self->_errorType;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v25 = [(NSString *)self->_experimentId hash];
  NSUInteger v24 = [(NSString *)self->_treatmentId hash];
  NSUInteger v23 = [(NSString *)self->_treatmentName hash];
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
    uint64_t v22 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v22 = 2654435761 * self->_hasResponseContext;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v3 = 2654435761 * self->_isResponseContextBlacklisted;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_isDocumentEmpty;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
LABEL_11:
  NSUInteger v5 = [(NSString *)self->_textContentType hash];
  NSUInteger v6 = [(NSString *)self->_localeIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_bundleIdentifier hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v9 = 2654435761 * self->_maxTextualResponseItems;
    if ((has & 4) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((has & 4) != 0)
    {
LABEL_13:
      uint64_t v10 = 2654435761 * self->_maxStructuredInfoItems;
      goto LABEL_16;
    }
  }
  uint64_t v10 = 0;
LABEL_16:
  NSUInteger v11 = [(NSString *)self->_initiatingProcess hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x20) != 0)
  {
    uint64_t v13 = 2654435761 * self->_hasContextBeforeInput;
    if ((v12 & 2) != 0)
    {
LABEL_18:
      uint64_t v14 = 2654435761 * self->_maxPredictionItems;
      if ((v12 & 0x40) != 0) {
        goto LABEL_19;
      }
LABEL_23:
      uint64_t v15 = 0;
      if ((v12 & 0x10) != 0) {
        goto LABEL_20;
      }
LABEL_24:
      uint64_t v16 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((v12 & 2) != 0) {
      goto LABEL_18;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 0x40) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v15 = 2654435761 * self->_hasRecipientNames;
  if ((v12 & 0x10) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v16 = 2654435761 * self->_triggerSourceType;
LABEL_25:
  NSUInteger v17 = v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11;
  NSUInteger v18 = v13 ^ v14 ^ v15 ^ v16 ^ [(NSString *)self->_triggerCategory hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_triggerAttributeType hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_triggerAttributeSubtype hash];
  return v17 ^ v20 ^ [(NSString *)self->_triggerAttributeField hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_90;
  }
  __int16 v5 = *((_WORD *)v4 + 66);
  if (*(_WORD *)&self->_has)
  {
    if ((v5 & 1) == 0 || self->_errorType != *((_DWORD *)v4 + 4)) {
      goto LABEL_90;
    }
  }
  else if (v5)
  {
    goto LABEL_90;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 3)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_90;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_90;
    }
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:")) {
      goto LABEL_90;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0) {
      goto LABEL_90;
    }
    if (self->_hasResponseContext)
    {
      if (!*((unsigned char *)v4 + 126)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 126))
    {
      goto LABEL_90;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x200) == 0) {
      goto LABEL_90;
    }
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 128))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x100) == 0) {
      goto LABEL_90;
    }
    if (self->_isDocumentEmpty)
    {
      if (!*((unsigned char *)v4 + 127)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 127))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
    goto LABEL_90;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((void *)v4 + 8)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_90;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_90;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_90;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 66);
  if ((has & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 14)) {
      goto LABEL_90;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 13)) {
      goto LABEL_90;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_90;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](initiatingProcess, "isEqual:")) {
      goto LABEL_90;
    }
    __int16 has = (__int16)self->_has;
    __int16 v14 = *((_WORD *)v4 + 66);
  }
  if ((has & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0) {
      goto LABEL_90;
    }
    if (self->_hasContextBeforeInput)
    {
      if (!*((unsigned char *)v4 + 124)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 124))
    {
      goto LABEL_90;
    }
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 12)) {
      goto LABEL_90;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x40) != 0)
  {
    if ((v14 & 0x40) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((unsigned char *)v4 + 125)) {
          goto LABEL_90;
        }
        goto LABEL_77;
      }
      if (!*((unsigned char *)v4 + 125)) {
        goto LABEL_77;
      }
    }
LABEL_90:
    char v20 = 0;
    goto LABEL_91;
  }
  if ((v14 & 0x40) != 0) {
    goto LABEL_90;
  }
LABEL_77:
  if ((has & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_triggerSourceType != *((_DWORD *)v4 + 30)) {
      goto LABEL_90;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_90;
  }
  triggerCategory = self->_triggerCategory;
  if ((unint64_t)triggerCategory | *((void *)v4 + 14)
    && !-[NSString isEqual:](triggerCategory, "isEqual:"))
  {
    goto LABEL_90;
  }
  triggerAttributeType = self->_triggerAttributeType;
  if ((unint64_t)triggerAttributeType | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](triggerAttributeType, "isEqual:")) {
      goto LABEL_90;
    }
  }
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if ((unint64_t)triggerAttributeSubtype | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](triggerAttributeSubtype, "isEqual:")) {
      goto LABEL_90;
    }
  }
  triggerAttributeField = self->_triggerAttributeField;
  if ((unint64_t)triggerAttributeField | *((void *)v4 + 11)) {
    char v20 = -[NSString isEqual:](triggerAttributeField, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_91:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(_WORD *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_errorType;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_experimentId copyWithZone:a3];
  id v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_treatmentId copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v9;

  uint64_t v11 = [(NSString *)self->_treatmentName copyWithZone:a3];
  __int16 v12 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v11;

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *(unsigned char *)(v6 + 126) = self->_hasResponseContext;
    *(_WORD *)(v6 + 132) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 128) = self->_isResponseContextBlacklisted;
  *(_WORD *)(v6 + 132) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    *(unsigned char *)(v6 + 127) = self->_isDocumentEmpty;
    *(_WORD *)(v6 + 132) |= 0x100u;
  }
LABEL_7:
  uint64_t v14 = [(NSString *)self->_textContentType copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  NSUInteger v17 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v16;

  uint64_t v18 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  NSUInteger v19 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v18;

  __int16 v20 = (__int16)self->_has;
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_maxTextualResponseItems;
    *(_WORD *)(v6 + 132) |= 8u;
    __int16 v20 = (__int16)self->_has;
  }
  if ((v20 & 4) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_maxStructuredInfoItems;
    *(_WORD *)(v6 + 132) |= 4u;
  }
  uint64_t v21 = [(NSString *)self->_initiatingProcess copyWithZone:a3];
  uint64_t v22 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v21;

  __int16 v23 = (__int16)self->_has;
  if ((v23 & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 124) = self->_hasContextBeforeInput;
    *(_WORD *)(v6 + 132) |= 0x20u;
    __int16 v23 = (__int16)self->_has;
    if ((v23 & 2) == 0)
    {
LABEL_13:
      if ((v23 & 0x40) == 0) {
        goto LABEL_14;
      }
LABEL_22:
      *(unsigned char *)(v6 + 125) = self->_hasRecipientNames;
      *(_WORD *)(v6 + 132) |= 0x40u;
      if ((*(_WORD *)&self->_has & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v23 & 2) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 48) = self->_maxPredictionItems;
  *(_WORD *)(v6 + 132) |= 2u;
  __int16 v23 = (__int16)self->_has;
  if ((v23 & 0x40) != 0) {
    goto LABEL_22;
  }
LABEL_14:
  if ((v23 & 0x10) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 120) = self->_triggerSourceType;
    *(_WORD *)(v6 + 132) |= 0x10u;
  }
LABEL_16:
  uint64_t v24 = [(NSString *)self->_triggerCategory copyWithZone:a3];
  NSUInteger v25 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v24;

  uint64_t v26 = [(NSString *)self->_triggerAttributeType copyWithZone:a3];
  v27 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v26;

  uint64_t v28 = [(NSString *)self->_triggerAttributeSubtype copyWithZone:a3];
  v29 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v28;

  uint64_t v30 = [(NSString *)self->_triggerAttributeField copyWithZone:a3];
  v31 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v30;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(_WORD *)&self->_has)
  {
    v4[4] = self->_errorType;
    *((_WORD *)v4 + 66) |= 1u;
  }
  id v8 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    id v4 = v8;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v8, "setTreatmentId:");
    id v4 = v8;
  }
  if (self->_treatmentName)
  {
    objc_msgSend(v8, "setTreatmentName:");
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((unsigned char *)v4 + 126) = self->_hasResponseContext;
    *((_WORD *)v4 + 66) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_11:
      if ((has & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v4 + 128) = self->_isResponseContextBlacklisted;
  *((_WORD *)v4 + 66) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    *((unsigned char *)v4 + 127) = self->_isDocumentEmpty;
    *((_WORD *)v4 + 66) |= 0x100u;
  }
LABEL_13:
  if (self->_textContentType)
  {
    objc_msgSend(v8, "setTextContentType:");
    id v4 = v8;
  }
  if (self->_localeIdentifier)
  {
    objc_msgSend(v8, "setLocaleIdentifier:");
    id v4 = v8;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v8, "setBundleIdentifier:");
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[14] = self->_maxTextualResponseItems;
    *((_WORD *)v4 + 66) |= 8u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[13] = self->_maxStructuredInfoItems;
    *((_WORD *)v4 + 66) |= 4u;
  }
  if (self->_initiatingProcess)
  {
    objc_msgSend(v8, "setInitiatingProcess:");
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    *((unsigned char *)v4 + 124) = self->_hasContextBeforeInput;
    *((_WORD *)v4 + 66) |= 0x20u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 2) == 0)
    {
LABEL_27:
      if ((v7 & 0x40) == 0) {
        goto LABEL_28;
      }
      goto LABEL_46;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_27;
  }
  v4[12] = self->_maxPredictionItems;
  *((_WORD *)v4 + 66) |= 2u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) == 0)
  {
LABEL_28:
    if ((v7 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_46:
  *((unsigned char *)v4 + 125) = self->_hasRecipientNames;
  *((_WORD *)v4 + 66) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_29:
    v4[30] = self->_triggerSourceType;
    *((_WORD *)v4 + 66) |= 0x10u;
  }
LABEL_30:
  if (self->_triggerCategory)
  {
    objc_msgSend(v8, "setTriggerCategory:");
    id v4 = v8;
  }
  if (self->_triggerAttributeType)
  {
    objc_msgSend(v8, "setTriggerAttributeType:");
    id v4 = v8;
  }
  if (self->_triggerAttributeSubtype)
  {
    objc_msgSend(v8, "setTriggerAttributeSubtype:");
    id v4 = v8;
  }
  if (self->_triggerAttributeField)
  {
    objc_msgSend(v8, "setTriggerAttributeField:");
    id v4 = v8;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*(_WORD *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_experimentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_treatmentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_treatmentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_11:
      if ((has & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
LABEL_13:
  if (self->_textContentType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
  if (self->_initiatingProcess)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 2) == 0)
    {
LABEL_27:
      if ((v7 & 0x40) == 0) {
        goto LABEL_28;
      }
      goto LABEL_46;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) == 0)
  {
LABEL_28:
    if ((v7 & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_29:
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
LABEL_30:
  if (self->_triggerCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_triggerAttributeType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_triggerAttributeSubtype)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_triggerAttributeField)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  experimentId = self->_experimentId;
  if (experimentId) {
    [v3 setObject:experimentId forKey:@"experiment_id"];
  }
  treatmentId = self->_treatmentId;
  if (treatmentId) {
    [v4 setObject:treatmentId forKey:@"treatment_id"];
  }
  treatmentName = self->_treatmentName;
  if (treatmentName) {
    [v4 setObject:treatmentName forKey:@"treatment_name"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    uint64_t v21 = [NSNumber numberWithBool:self->_hasResponseContext];
    [v4 setObject:v21 forKey:@"has_response_context"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_9:
      if ((has & 0x100) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v22 = [NSNumber numberWithBool:self->_isResponseContextBlacklisted];
  [v4 setObject:v22 forKey:@"is_response_context_blacklisted"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v9 = [NSNumber numberWithBool:self->_isDocumentEmpty];
    [v4 setObject:v9 forKey:@"is_document_empty"];
  }
LABEL_11:
  textContentType = self->_textContentType;
  if (textContentType) {
    [v4 setObject:textContentType forKey:@"text_content_type"];
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x20) != 0)
  {
    __int16 v12 = [NSNumber numberWithBool:self->_hasContextBeforeInput];
    [v4 setObject:v12 forKey:@"has_context_before_input"];

    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x40) != 0)
  {
    uint64_t v13 = [NSNumber numberWithBool:self->_hasRecipientNames];
    [v4 setObject:v13 forKey:@"has_recipient_names"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v4 setObject:localeIdentifier forKey:@"locale_identifier"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundle_identifier"];
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 8) != 0)
  {
    __int16 v23 = [NSNumber numberWithUnsignedInt:self->_maxTextualResponseItems];
    [v4 setObject:v23 forKey:@"max_textual_response_items"];

    __int16 v16 = (__int16)self->_has;
    if ((v16 & 4) == 0)
    {
LABEL_23:
      if ((v16 & 2) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((v16 & 4) == 0)
  {
    goto LABEL_23;
  }
  uint64_t v24 = [NSNumber numberWithUnsignedInt:self->_maxStructuredInfoItems];
  [v4 setObject:v24 forKey:@"max_structured_info_items"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_24:
    NSUInteger v17 = [NSNumber numberWithUnsignedInt:self->_maxPredictionItems];
    [v4 setObject:v17 forKey:@"max_prediction_items"];
  }
LABEL_25:
  initiatingProcess = self->_initiatingProcess;
  if (initiatingProcess) {
    [v4 setObject:initiatingProcess forKey:@"initiating_process"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    uint64_t triggerSourceType = self->_triggerSourceType;
    if (triggerSourceType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_triggerSourceType);
      __int16 v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v20 = off_265038038[triggerSourceType];
    }
    [v4 setObject:v20 forKey:@"trigger_source_type"];
  }
  triggerCategory = self->_triggerCategory;
  if (triggerCategory) {
    [v4 setObject:triggerCategory forKey:@"trigger_category"];
  }
  triggerAttributeType = self->_triggerAttributeType;
  if (triggerAttributeType) {
    [v4 setObject:triggerAttributeType forKey:@"trigger_attribute_type"];
  }
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if (triggerAttributeSubtype) {
    [v4 setObject:triggerAttributeSubtype forKey:@"trigger_attribute_subtype"];
  }
  triggerAttributeField = self->_triggerAttributeField;
  if (triggerAttributeField) {
    [v4 setObject:triggerAttributeField forKey:@"trigger_attribute_field"];
  }
  if (*(_WORD *)&self->_has)
  {
    uint64_t errorType = self->_errorType;
    if (errorType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_errorType);
      uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v30 = off_265038070[errorType];
    }
    [v4 setObject:v30 forKey:@"error_type"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PSGPBError;
  id v4 = [(PSGPBError *)&v8 description];
  uint64_t v5 = [(PSGPBError *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsErrorType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ErrorType_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ErrorType_TIMEOUT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ErrorType_WORD_BOUNDARY_XPC_TIMEOUT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ErrorType_ZKW_XPC_TIMEOUT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ErrorType_PORTRAIT_XPC_TIMEOUT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)errorTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_265038070[a3];
  }
  return v3;
}

- (BOOL)hasErrorType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasErrorType:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setErrorType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_uint64_t errorType = a3;
}

- (int)errorType
{
  if (*(_WORD *)&self->_has) {
    return self->_errorType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasTriggerAttributeField
{
  return self->_triggerAttributeField != 0;
}

- (NSString)triggerAttributeField
{
  if (self->_triggerAttributeField) {
    return self->_triggerAttributeField;
  }
  else {
    return (NSString *)@"null";
  }
}

- (BOOL)hasTriggerAttributeSubtype
{
  return self->_triggerAttributeSubtype != 0;
}

- (NSString)triggerAttributeSubtype
{
  if (self->_triggerAttributeSubtype) {
    return self->_triggerAttributeSubtype;
  }
  else {
    return (NSString *)@"null";
  }
}

- (BOOL)hasTriggerAttributeType
{
  return self->_triggerAttributeType != 0;
}

- (BOOL)hasTriggerCategory
{
  return self->_triggerCategory != 0;
}

- (int)StringAsTriggerSourceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TriggerSourceType_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TriggerSourceType_LMTriggerPhrase"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TriggerSourceType_ResponseKit"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TriggerSourceType_TaggedTextField"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TriggerSourceType_MLDeclarative"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TriggerSourceType_MLInterrogative"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TriggerSourceType_NameMentions"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)triggerSourceTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_265038038[a3];
  }
  return v3;
}

- (BOOL)hasTriggerSourceType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasTriggerSourceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setTriggerSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_uint64_t triggerSourceType = a3;
}

- (int)triggerSourceType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_triggerSourceType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasInitiatingProcess
{
  return self->_initiatingProcess != 0;
}

- (BOOL)hasMaxPredictionItems
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasMaxPredictionItems:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setMaxPredictionItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_maxPredictionItems = a3;
}

- (BOOL)hasMaxStructuredInfoItems
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasMaxStructuredInfoItems:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setMaxStructuredInfoItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_maxStructuredInfoItems = a3;
}

- (BOOL)hasMaxTextualResponseItems
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasMaxTextualResponseItems:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setMaxTextualResponseItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_maxTextualResponseItems = a3;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (BOOL)hasHasRecipientNames
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hasRecipientNames = a3;
}

- (BOOL)hasHasContextBeforeInput
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hasContextBeforeInput = a3;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (BOOL)hasIsDocumentEmpty
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isDocumentEmpty = a3;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isResponseContextBlacklisted = a3;
}

- (BOOL)hasHasResponseContext
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setHasResponseContext:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hasResponseContext = a3;
}

- (BOOL)hasTreatmentName
{
  return self->_treatmentName != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

@end