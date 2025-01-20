@interface PSGPBTrigger
- (BOOL)hasBundleIdentifier;
- (BOOL)hasContextBeforeInput;
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
- (id)triggerSourceTypeAsString:(int)a3;
- (int)StringAsTriggerSourceType:(id)a3;
- (int)triggerSourceType;
- (unint64_t)hash;
- (unsigned)maxPredictionItems;
- (unsigned)maxStructuredInfoItems;
- (unsigned)maxTextualResponseItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasContextBeforeInput:(BOOL)a3;
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

@implementation PSGPBTrigger

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
  if ((*((_WORD *)v4 + 62) & 8) != 0)
  {
    self->_triggerSourceType = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 8u;
  }
  id v8 = v4;
  if (*((void *)v4 + 13))
  {
    -[PSGPBTrigger setTriggerCategory:](self, "setTriggerCategory:");
    id v4 = v8;
  }
  if (*((void *)v4 + 2))
  {
    -[PSGPBTrigger setExperimentId:](self, "setExperimentId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 8))
  {
    -[PSGPBTrigger setTreatmentId:](self, "setTreatmentId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 9))
  {
    -[PSGPBTrigger setTreatmentName:](self, "setTreatmentName:");
    id v4 = v8;
  }
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x40) != 0)
  {
    self->_hasResponseContext = *((unsigned char *)v4 + 118);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v5 = *((_WORD *)v4 + 62);
    if ((v5 & 0x100) == 0)
    {
LABEL_13:
      if ((v5 & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) == 0)
  {
    goto LABEL_13;
  }
  self->_isResponseContextBlacklisted = *((unsigned char *)v4 + 120);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 62) & 0x80) != 0)
  {
LABEL_14:
    self->_isDocumentEmpty = *((unsigned char *)v4 + 119);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_15:
  if (*((void *)v4 + 7))
  {
    -[PSGPBTrigger setTextContentType:](self, "setTextContentType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 4))
  {
    -[PSGPBTrigger setLocaleIdentifier:](self, "setLocaleIdentifier:");
    id v4 = v8;
  }
  if (*((void *)v4 + 1))
  {
    -[PSGPBTrigger setBundleIdentifier:](self, "setBundleIdentifier:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 4) != 0)
  {
    self->_maxTextualResponseItems = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
    __int16 v6 = *((_WORD *)v4 + 62);
  }
  if ((v6 & 2) != 0)
  {
    self->_maxStructuredInfoItems = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[PSGPBTrigger setInitiatingProcess:](self, "setInitiatingProcess:");
    id v4 = v8;
  }
  if (*((void *)v4 + 12))
  {
    -[PSGPBTrigger setTriggerAttributeType:](self, "setTriggerAttributeType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 11))
  {
    -[PSGPBTrigger setTriggerAttributeSubtype:](self, "setTriggerAttributeSubtype:");
    id v4 = v8;
  }
  if (*((void *)v4 + 10))
  {
    -[PSGPBTrigger setTriggerAttributeField:](self, "setTriggerAttributeField:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x10) != 0)
  {
    self->_hasContextBeforeInput = *((unsigned char *)v4 + 116);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v7 = *((_WORD *)v4 + 62);
    if ((v7 & 1) == 0)
    {
LABEL_35:
      if ((v7 & 0x20) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_35;
  }
  self->_maxPredictionItems = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 62) & 0x20) != 0)
  {
LABEL_36:
    self->_hasRecipientNames = *((unsigned char *)v4 + 117);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_37:
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v26 = 2654435761 * self->_triggerSourceType;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v25 = [(NSString *)self->_triggerCategory hash];
  NSUInteger v24 = [(NSString *)self->_experimentId hash];
  NSUInteger v23 = [(NSString *)self->_treatmentId hash];
  NSUInteger v22 = [(NSString *)self->_treatmentName hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
    uint64_t v21 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v20 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v21 = 2654435761 * self->_hasResponseContext;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v20 = 2654435761 * self->_isResponseContextBlacklisted;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v19 = 2654435761 * self->_isDocumentEmpty;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v19 = 0;
LABEL_11:
  NSUInteger v18 = [(NSString *)self->_textContentType hash];
  NSUInteger v4 = [(NSString *)self->_localeIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_bundleIdentifier hash];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    uint64_t v7 = 2654435761 * self->_maxTextualResponseItems;
    if ((v6 & 2) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((v6 & 2) != 0)
    {
LABEL_13:
      uint64_t v8 = 2654435761 * self->_maxStructuredInfoItems;
      goto LABEL_16;
    }
  }
  uint64_t v8 = 0;
LABEL_16:
  NSUInteger v9 = [(NSString *)self->_initiatingProcess hash];
  NSUInteger v10 = [(NSString *)self->_triggerAttributeType hash];
  NSUInteger v11 = [(NSString *)self->_triggerAttributeSubtype hash];
  NSUInteger v12 = [(NSString *)self->_triggerAttributeField hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) == 0)
  {
    uint64_t v14 = 0;
    if (v13) {
      goto LABEL_18;
    }
LABEL_21:
    uint64_t v15 = 0;
    if ((v13 & 0x20) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v16 = 0;
    return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
  }
  uint64_t v14 = 2654435761 * self->_hasContextBeforeInput;
  if ((v13 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v15 = 2654435761 * self->_maxPredictionItems;
  if ((v13 & 0x20) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v16 = 2654435761 * self->_hasRecipientNames;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_79;
  }
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_triggerSourceType != *((_DWORD *)v4 + 28)) {
      goto LABEL_79;
    }
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_79;
  }
  triggerCategory = self->_triggerCategory;
  if ((unint64_t)triggerCategory | *((void *)v4 + 13)
    && !-[NSString isEqual:](triggerCategory, "isEqual:"))
  {
    goto LABEL_79;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:")) {
      goto LABEL_79;
    }
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_79;
    }
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:")) {
      goto LABEL_79;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 62);
  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0) {
      goto LABEL_79;
    }
    if (self->_hasResponseContext)
    {
      if (!*((unsigned char *)v4 + 118)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 118))
    {
      goto LABEL_79;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0) {
      goto LABEL_79;
    }
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0) {
      goto LABEL_79;
    }
    if (self->_isDocumentEmpty)
    {
      if (!*((unsigned char *)v4 + 119)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 119))
    {
      goto LABEL_79;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((void *)v4 + 7)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_79;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_79;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_79;
    }
  }
  __int16 v15 = (__int16)self->_has;
  __int16 v16 = *((_WORD *)v4 + 62);
  if ((v15 & 4) != 0)
  {
    if ((v16 & 4) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 12)) {
      goto LABEL_79;
    }
  }
  else if ((v16 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((v15 & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 11)) {
      goto LABEL_79;
    }
  }
  else if ((v16 & 2) != 0)
  {
    goto LABEL_79;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((void *)v4 + 3)
    && !-[NSString isEqual:](initiatingProcess, "isEqual:"))
  {
    goto LABEL_79;
  }
  triggerAttributeType = self->_triggerAttributeType;
  if ((unint64_t)triggerAttributeType | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](triggerAttributeType, "isEqual:")) {
      goto LABEL_79;
    }
  }
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if ((unint64_t)triggerAttributeSubtype | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](triggerAttributeSubtype, "isEqual:")) {
      goto LABEL_79;
    }
  }
  triggerAttributeField = self->_triggerAttributeField;
  if ((unint64_t)triggerAttributeField | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](triggerAttributeField, "isEqual:")) {
      goto LABEL_79;
    }
  }
  __int16 v21 = (__int16)self->_has;
  __int16 v22 = *((_WORD *)v4 + 62);
  if ((v21 & 0x10) != 0)
  {
    if ((v22 & 0x10) == 0) {
      goto LABEL_79;
    }
    if (self->_hasContextBeforeInput)
    {
      if (!*((unsigned char *)v4 + 116)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 116))
    {
      goto LABEL_79;
    }
  }
  else if ((v22 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if (v21)
  {
    if ((v22 & 1) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 10)) {
      goto LABEL_79;
    }
  }
  else if (v22)
  {
    goto LABEL_79;
  }
  if ((v21 & 0x20) != 0)
  {
    if ((v22 & 0x20) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((unsigned char *)v4 + 117)) {
          goto LABEL_79;
        }
      }
      else if (*((unsigned char *)v4 + 117))
      {
        goto LABEL_79;
      }
      BOOL v23 = 1;
      goto LABEL_80;
    }
LABEL_79:
    BOOL v23 = 0;
    goto LABEL_80;
  }
  BOOL v23 = (v22 & 0x20) == 0;
LABEL_80:

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_triggerSourceType;
    *(_WORD *)(v5 + 124) |= 8u;
  }
  uint64_t v7 = [(NSString *)self->_triggerCategory copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v7;

  uint64_t v9 = [(NSString *)self->_experimentId copyWithZone:a3];
  NSUInteger v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_treatmentId copyWithZone:a3];
  NSUInteger v12 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v11;

  uint64_t v13 = [(NSString *)self->_treatmentName copyWithZone:a3];
  uint64_t v14 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v13;

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(unsigned char *)(v6 + 118) = self->_hasResponseContext;
    *(_WORD *)(v6 + 124) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 120) = self->_isResponseContextBlacklisted;
  *(_WORD *)(v6 + 124) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    *(unsigned char *)(v6 + 119) = self->_isDocumentEmpty;
    *(_WORD *)(v6 + 124) |= 0x80u;
  }
LABEL_7:
  uint64_t v16 = [(NSString *)self->_textContentType copyWithZone:a3];
  v17 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v16;

  uint64_t v18 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  uint64_t v19 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v18;

  uint64_t v20 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  __int16 v21 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v20;

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_maxTextualResponseItems;
    *(_WORD *)(v6 + 124) |= 4u;
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 2) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_maxStructuredInfoItems;
    *(_WORD *)(v6 + 124) |= 2u;
  }
  uint64_t v23 = [(NSString *)self->_initiatingProcess copyWithZone:a3];
  NSUInteger v24 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v23;

  uint64_t v25 = [(NSString *)self->_triggerAttributeType copyWithZone:a3];
  uint64_t v26 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v25;

  uint64_t v27 = [(NSString *)self->_triggerAttributeSubtype copyWithZone:a3];
  v28 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v27;

  uint64_t v29 = [(NSString *)self->_triggerAttributeField copyWithZone:a3];
  v30 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v29;

  __int16 v31 = (__int16)self->_has;
  if ((v31 & 0x10) == 0)
  {
    if ((v31 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_20:
    *(_DWORD *)(v6 + 40) = self->_maxPredictionItems;
    *(_WORD *)(v6 + 124) |= 1u;
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      return (id)v6;
    }
    goto LABEL_14;
  }
  *(unsigned char *)(v6 + 116) = self->_hasContextBeforeInput;
  *(_WORD *)(v6 + 124) |= 0x10u;
  __int16 v31 = (__int16)self->_has;
  if (v31) {
    goto LABEL_20;
  }
LABEL_13:
  if ((v31 & 0x20) != 0)
  {
LABEL_14:
    *(unsigned char *)(v6 + 117) = self->_hasRecipientNames;
    *(_WORD *)(v6 + 124) |= 0x20u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  uint64_t v7 = a3;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v7[28] = self->_triggerSourceType;
    *((_WORD *)v7 + 62) |= 8u;
  }
  if (self->_triggerCategory) {
    objc_msgSend(v7, "setTriggerCategory:");
  }
  if (self->_experimentId) {
    objc_msgSend(v7, "setExperimentId:");
  }
  if (self->_treatmentId) {
    objc_msgSend(v7, "setTreatmentId:");
  }
  if (self->_treatmentName) {
    objc_msgSend(v7, "setTreatmentName:");
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((unsigned char *)v7 + 118) = self->_hasResponseContext;
    *((_WORD *)v7 + 62) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_13:
      if ((has & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v7 + 120) = self->_isResponseContextBlacklisted;
  *((_WORD *)v7 + 62) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_14:
    *((unsigned char *)v7 + 119) = self->_isDocumentEmpty;
    *((_WORD *)v7 + 62) |= 0x80u;
  }
LABEL_15:
  if (self->_textContentType) {
    objc_msgSend(v7, "setTextContentType:");
  }
  if (self->_localeIdentifier) {
    objc_msgSend(v7, "setLocaleIdentifier:");
  }
  if (self->_bundleIdentifier) {
    objc_msgSend(v7, "setBundleIdentifier:");
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 4) != 0)
  {
    v7[12] = self->_maxTextualResponseItems;
    *((_WORD *)v7 + 62) |= 4u;
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 2) != 0)
  {
    v7[11] = self->_maxStructuredInfoItems;
    *((_WORD *)v7 + 62) |= 2u;
  }
  if (self->_initiatingProcess) {
    objc_msgSend(v7, "setInitiatingProcess:");
  }
  if (self->_triggerAttributeType) {
    objc_msgSend(v7, "setTriggerAttributeType:");
  }
  if (self->_triggerAttributeSubtype) {
    objc_msgSend(v7, "setTriggerAttributeSubtype:");
  }
  if (self->_triggerAttributeField) {
    objc_msgSend(v7, "setTriggerAttributeField:");
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((unsigned char *)v7 + 116) = self->_hasContextBeforeInput;
    *((_WORD *)v7 + 62) |= 0x10u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_35:
      if ((v6 & 0x20) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_35;
  }
  v7[10] = self->_maxPredictionItems;
  *((_WORD *)v7 + 62) |= 1u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_36:
    *((unsigned char *)v7 + 117) = self->_hasRecipientNames;
    *((_WORD *)v7 + 62) |= 0x20u;
  }
LABEL_37:
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_triggerCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_experimentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentName) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_13:
      if ((has & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_textContentType) {
    PBDataWriterWriteStringField();
  }
  if (self->_localeIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_initiatingProcess) {
    PBDataWriterWriteStringField();
  }
  if (self->_triggerAttributeType) {
    PBDataWriterWriteStringField();
  }
  if (self->_triggerAttributeSubtype) {
    PBDataWriterWriteStringField();
  }
  if (self->_triggerAttributeField) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_35:
      if ((v6 & 0x20) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_36:
  }
    PBDataWriterWriteBOOLField();
LABEL_37:
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBTriggerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
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
  if ((has & 0x40) != 0)
  {
    __int16 v21 = [NSNumber numberWithBool:self->_hasResponseContext];
    [v4 setObject:v21 forKey:@"has_response_context"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_9;
  }
  __int16 v22 = [NSNumber numberWithBool:self->_isResponseContextBlacklisted];
  [v4 setObject:v22 forKey:@"is_response_context_blacklisted"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
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
  if ((v11 & 0x10) != 0)
  {
    NSUInteger v12 = [NSNumber numberWithBool:self->_hasContextBeforeInput];
    [v4 setObject:v12 forKey:@"has_context_before_input"];

    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x20) != 0)
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
  if ((v16 & 4) != 0)
  {
    uint64_t v23 = [NSNumber numberWithUnsignedInt:self->_maxTextualResponseItems];
    [v4 setObject:v23 forKey:@"max_textual_response_items"];

    __int16 v16 = (__int16)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_23:
      if ((v16 & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_23;
  }
  NSUInteger v24 = [NSNumber numberWithUnsignedInt:self->_maxStructuredInfoItems];
  [v4 setObject:v24 forKey:@"max_structured_info_items"];

  if (*(_WORD *)&self->_has)
  {
LABEL_24:
    v17 = [NSNumber numberWithUnsignedInt:self->_maxPredictionItems];
    [v4 setObject:v17 forKey:@"max_prediction_items"];
  }
LABEL_25:
  initiatingProcess = self->_initiatingProcess;
  if (initiatingProcess) {
    [v4 setObject:initiatingProcess forKey:@"initiating_process"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    uint64_t triggerSourceType = self->_triggerSourceType;
    if (triggerSourceType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_triggerSourceType);
      uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v20 = off_2650381E0[triggerSourceType];
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
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PSGPBTrigger;
  id v4 = [(PSGPBTrigger *)&v8 description];
  __int16 v5 = [(PSGPBTrigger *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
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
    id v3 = off_2650381E0[a3];
  }
  return v3;
}

- (BOOL)hasTriggerSourceType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasTriggerSourceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setTriggerSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_uint64_t triggerSourceType = a3;
}

- (int)triggerSourceType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
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
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasMaxPredictionItems:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setMaxPredictionItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_maxPredictionItems = a3;
}

- (BOOL)hasMaxStructuredInfoItems
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasMaxStructuredInfoItems:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setMaxStructuredInfoItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_maxStructuredInfoItems = a3;
}

- (BOOL)hasMaxTextualResponseItems
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasMaxTextualResponseItems:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setMaxTextualResponseItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
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
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hasRecipientNames = a3;
}

- (BOOL)hasHasContextBeforeInput
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hasContextBeforeInput = a3;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (BOOL)hasIsDocumentEmpty
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isDocumentEmpty = a3;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isResponseContextBlacklisted = a3;
}

- (BOOL)hasHasResponseContext
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setHasResponseContext:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
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