@interface PSGPBEngagement
- (BOOL)hasBundleIdentifier;
- (BOOL)hasContextBeforeInput;
- (BOOL)hasDataSourceType;
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
- (BOOL)hasNumStructuredInfoItems;
- (BOOL)hasNumTextualResponseItems;
- (BOOL)hasPosition;
- (BOOL)hasRecipientNames;
- (BOOL)hasResponseContext;
- (BOOL)hasTextContentType;
- (BOOL)hasTextualResponseCategory;
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
- (NSString)textualResponseCategory;
- (NSString)treatmentId;
- (NSString)treatmentName;
- (NSString)triggerAttributeField;
- (NSString)triggerAttributeSubtype;
- (NSString)triggerAttributeType;
- (NSString)triggerCategory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataSourceTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)triggerSourceTypeAsString:(int)a3;
- (int)StringAsDataSourceType:(id)a3;
- (int)StringAsTriggerSourceType:(id)a3;
- (int)dataSourceType;
- (int)triggerSourceType;
- (unint64_t)hash;
- (unsigned)maxPredictionItems;
- (unsigned)maxStructuredInfoItems;
- (unsigned)maxTextualResponseItems;
- (unsigned)numStructuredInfoItems;
- (unsigned)numTextualResponseItems;
- (unsigned)position;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDataSourceType:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasContextBeforeInput:(BOOL)a3;
- (void)setHasDataSourceType:(BOOL)a3;
- (void)setHasHasContextBeforeInput:(BOOL)a3;
- (void)setHasHasRecipientNames:(BOOL)a3;
- (void)setHasHasResponseContext:(BOOL)a3;
- (void)setHasIsDocumentEmpty:(BOOL)a3;
- (void)setHasIsResponseContextBlacklisted:(BOOL)a3;
- (void)setHasMaxPredictionItems:(BOOL)a3;
- (void)setHasMaxStructuredInfoItems:(BOOL)a3;
- (void)setHasMaxTextualResponseItems:(BOOL)a3;
- (void)setHasNumStructuredInfoItems:(BOOL)a3;
- (void)setHasNumTextualResponseItems:(BOOL)a3;
- (void)setHasPosition:(BOOL)a3;
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
- (void)setNumStructuredInfoItems:(unsigned int)a3;
- (void)setNumTextualResponseItems:(unsigned int)a3;
- (void)setPosition:(unsigned int)a3;
- (void)setTextContentType:(id)a3;
- (void)setTextualResponseCategory:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTreatmentName:(id)a3;
- (void)setTriggerAttributeField:(id)a3;
- (void)setTriggerAttributeSubtype:(id)a3;
- (void)setTriggerAttributeType:(id)a3;
- (void)setTriggerCategory:(id)a3;
- (void)setTriggerSourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSGPBEngagement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerCategory, 0);
  objc_storeStrong((id *)&self->_triggerAttributeType, 0);
  objc_storeStrong((id *)&self->_triggerAttributeSubtype, 0);
  objc_storeStrong((id *)&self->_triggerAttributeField, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_textualResponseCategory, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_initiatingProcess, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (unsigned)position
{
  return self->_position;
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

- (unsigned)numStructuredInfoItems
{
  return self->_numStructuredInfoItems;
}

- (void)setTextualResponseCategory:(id)a3
{
}

- (NSString)textualResponseCategory
{
  return self->_textualResponseCategory;
}

- (unsigned)numTextualResponseItems
{
  return self->_numTextualResponseItems;
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
  if ((*((_WORD *)v4 + 74) & 0x40) != 0)
  {
    self->_position = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x40u;
  }
  id v9 = v4;
  if (*((void *)v4 + 3))
  {
    -[PSGPBEngagement setExperimentId:](self, "setExperimentId:");
    id v4 = v9;
  }
  if (*((void *)v4 + 11))
  {
    -[PSGPBEngagement setTreatmentId:](self, "setTreatmentId:");
    id v4 = v9;
  }
  if (*((void *)v4 + 12))
  {
    -[PSGPBEngagement setTreatmentName:](self, "setTreatmentName:");
    id v4 = v9;
  }
  __int16 v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x400) != 0)
  {
    self->_hasResponseContext = *((unsigned char *)v4 + 142);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)v4 + 74);
    if ((v5 & 0x1000) == 0)
    {
LABEL_11:
      if ((v5 & 0x800) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  self->_isResponseContextBlacklisted = *((unsigned char *)v4 + 144);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 74) & 0x800) != 0)
  {
LABEL_12:
    self->_isDocumentEmpty = *((unsigned char *)v4 + 143);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_13:
  if (*((void *)v4 + 9))
  {
    -[PSGPBEngagement setTextContentType:](self, "setTextContentType:");
    id v4 = v9;
  }
  if (*((void *)v4 + 5))
  {
    -[PSGPBEngagement setLocaleIdentifier:](self, "setLocaleIdentifier:");
    id v4 = v9;
  }
  if (*((void *)v4 + 1))
  {
    -[PSGPBEngagement setBundleIdentifier:](self, "setBundleIdentifier:");
    id v4 = v9;
  }
  __int16 v6 = *((_WORD *)v4 + 74);
  if ((v6 & 8) != 0)
  {
    self->_maxTextualResponseItems = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 74);
  }
  if ((v6 & 4) != 0)
  {
    self->_maxStructuredInfoItems = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4))
  {
    -[PSGPBEngagement setInitiatingProcess:](self, "setInitiatingProcess:");
    id v4 = v9;
  }
  if ((*((_WORD *)v4 + 74) & 0x20) != 0)
  {
    self->_numTextualResponseItems = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 10))
  {
    -[PSGPBEngagement setTextualResponseCategory:](self, "setTextualResponseCategory:");
    id v4 = v9;
  }
  __int16 v7 = *((_WORD *)v4 + 74);
  if ((v7 & 0x10) != 0)
  {
    self->_numStructuredInfoItems = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v7 = *((_WORD *)v4 + 74);
  }
  if ((v7 & 0x80) != 0)
  {
    self->_triggerSourceType = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 16))
  {
    -[PSGPBEngagement setTriggerCategory:](self, "setTriggerCategory:");
    id v4 = v9;
  }
  if (*((void *)v4 + 15))
  {
    -[PSGPBEngagement setTriggerAttributeType:](self, "setTriggerAttributeType:");
    id v4 = v9;
  }
  if (*((void *)v4 + 14))
  {
    -[PSGPBEngagement setTriggerAttributeSubtype:](self, "setTriggerAttributeSubtype:");
    id v4 = v9;
  }
  if (*((void *)v4 + 13))
  {
    -[PSGPBEngagement setTriggerAttributeField:](self, "setTriggerAttributeField:");
    id v4 = v9;
  }
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x100) != 0)
  {
    self->_hasContextBeforeInput = *((unsigned char *)v4 + 140);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v8 = *((_WORD *)v4 + 74);
    if ((v8 & 2) == 0)
    {
LABEL_43:
      if ((v8 & 0x200) == 0) {
        goto LABEL_44;
      }
      goto LABEL_54;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_43;
  }
  self->_maxPredictionItems = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 2u;
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x200) == 0)
  {
LABEL_44:
    if ((v8 & 1) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_54:
  self->_hasRecipientNames = *((unsigned char *)v4 + 141);
  *(_WORD *)&self->_has |= 0x200u;
  if (*((_WORD *)v4 + 74))
  {
LABEL_45:
    self->_dataSourceType = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_46:
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v31 = 2654435761 * self->_position;
  }
  else {
    uint64_t v31 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_experimentId hash];
  NSUInteger v29 = [(NSString *)self->_treatmentId hash];
  NSUInteger v28 = [(NSString *)self->_treatmentName hash];
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    uint64_t v27 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v26 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v27 = 2654435761 * self->_hasResponseContext;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v26 = 2654435761 * self->_isResponseContextBlacklisted;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    uint64_t v25 = 2654435761 * self->_isDocumentEmpty;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v25 = 0;
LABEL_11:
  NSUInteger v24 = [(NSString *)self->_textContentType hash];
  NSUInteger v23 = [(NSString *)self->_localeIdentifier hash];
  NSUInteger v22 = [(NSString *)self->_bundleIdentifier hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v21 = 2654435761 * self->_maxTextualResponseItems;
    if ((has & 4) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((has & 4) != 0)
    {
LABEL_13:
      uint64_t v20 = 2654435761 * self->_maxStructuredInfoItems;
      goto LABEL_16;
    }
  }
  uint64_t v20 = 0;
LABEL_16:
  NSUInteger v19 = [(NSString *)self->_initiatingProcess hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v4 = 2654435761 * self->_numTextualResponseItems;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_textualResponseCategory hash];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    uint64_t v7 = 2654435761 * self->_numStructuredInfoItems;
    if ((v6 & 0x80) != 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((v6 & 0x80) != 0)
    {
LABEL_21:
      uint64_t v8 = 2654435761 * self->_triggerSourceType;
      goto LABEL_24;
    }
  }
  uint64_t v8 = 0;
LABEL_24:
  NSUInteger v9 = [(NSString *)self->_triggerCategory hash];
  NSUInteger v10 = [(NSString *)self->_triggerAttributeType hash];
  NSUInteger v11 = [(NSString *)self->_triggerAttributeSubtype hash];
  NSUInteger v12 = [(NSString *)self->_triggerAttributeField hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
  {
    uint64_t v14 = 2654435761 * self->_hasContextBeforeInput;
    if ((v13 & 2) != 0)
    {
LABEL_26:
      uint64_t v15 = 2654435761 * self->_maxPredictionItems;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_27;
      }
LABEL_31:
      uint64_t v16 = 0;
      if (v13) {
        goto LABEL_28;
      }
LABEL_32:
      uint64_t v17 = 0;
      return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((v13 & 2) != 0) {
      goto LABEL_26;
    }
  }
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  uint64_t v16 = 2654435761 * self->_hasRecipientNames;
  if ((v13 & 1) == 0) {
    goto LABEL_32;
  }
LABEL_28:
  uint64_t v17 = 2654435761 * self->_dataSourceType;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_108;
  }
  __int16 v5 = *((_WORD *)v4 + 74);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v5 & 0x40) == 0 || self->_position != *((_DWORD *)v4 + 17)) {
      goto LABEL_108;
    }
  }
  else if ((v5 & 0x40) != 0)
  {
    goto LABEL_108;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 3)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_108;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_108;
    }
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:")) {
      goto LABEL_108;
    }
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x400) == 0) {
      goto LABEL_108;
    }
    if (self->_hasResponseContext)
    {
      if (!*((unsigned char *)v4 + 142)) {
        goto LABEL_108;
      }
    }
    else if (*((unsigned char *)v4 + 142))
    {
      goto LABEL_108;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x400) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x1000) == 0) {
      goto LABEL_108;
    }
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_108;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_108;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x1000) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x800) == 0) {
      goto LABEL_108;
    }
    if (self->_isDocumentEmpty)
    {
      if (!*((unsigned char *)v4 + 143)) {
        goto LABEL_108;
      }
    }
    else if (*((unsigned char *)v4 + 143))
    {
      goto LABEL_108;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x800) != 0)
  {
    goto LABEL_108;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((void *)v4 + 9)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_108;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_108;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_108;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v13 = *((_WORD *)v4 + 74);
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 14)) {
      goto LABEL_108;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_108;
  }
  if ((has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 13)) {
      goto LABEL_108;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_108;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](initiatingProcess, "isEqual:")) {
      goto LABEL_108;
    }
    __int16 has = (__int16)self->_has;
    __int16 v13 = *((_WORD *)v4 + 74);
  }
  if ((has & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_numTextualResponseItems != *((_DWORD *)v4 + 16)) {
      goto LABEL_108;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_108;
  }
  textualResponseCategory = self->_textualResponseCategory;
  if ((unint64_t)textualResponseCategory | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](textualResponseCategory, "isEqual:")) {
      goto LABEL_108;
    }
    __int16 has = (__int16)self->_has;
    __int16 v13 = *((_WORD *)v4 + 74);
  }
  if ((has & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_numStructuredInfoItems != *((_DWORD *)v4 + 15)) {
      goto LABEL_108;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_108;
  }
  if ((has & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_triggerSourceType != *((_DWORD *)v4 + 34)) {
      goto LABEL_108;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_108;
  }
  triggerCategory = self->_triggerCategory;
  if ((unint64_t)triggerCategory | *((void *)v4 + 16)
    && !-[NSString isEqual:](triggerCategory, "isEqual:"))
  {
    goto LABEL_108;
  }
  triggerAttributeType = self->_triggerAttributeType;
  if ((unint64_t)triggerAttributeType | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](triggerAttributeType, "isEqual:")) {
      goto LABEL_108;
    }
  }
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if ((unint64_t)triggerAttributeSubtype | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](triggerAttributeSubtype, "isEqual:")) {
      goto LABEL_108;
    }
  }
  triggerAttributeField = self->_triggerAttributeField;
  if ((unint64_t)triggerAttributeField | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](triggerAttributeField, "isEqual:")) {
      goto LABEL_108;
    }
  }
  __int16 v20 = (__int16)self->_has;
  __int16 v21 = *((_WORD *)v4 + 74);
  if ((v20 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x100) == 0) {
      goto LABEL_108;
    }
    if (self->_hasContextBeforeInput)
    {
      if (!*((unsigned char *)v4 + 140)) {
        goto LABEL_108;
      }
    }
    else if (*((unsigned char *)v4 + 140))
    {
      goto LABEL_108;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x100) != 0)
  {
    goto LABEL_108;
  }
  if ((v20 & 2) != 0)
  {
    if ((v21 & 2) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 12)) {
      goto LABEL_108;
    }
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x200) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((unsigned char *)v4 + 141)) {
          goto LABEL_108;
        }
        goto LABEL_103;
      }
      if (!*((unsigned char *)v4 + 141)) {
        goto LABEL_103;
      }
    }
LABEL_108:
    BOOL v22 = 0;
    goto LABEL_109;
  }
  if ((*((_WORD *)v4 + 74) & 0x200) != 0) {
    goto LABEL_108;
  }
LABEL_103:
  if (v20)
  {
    if ((v21 & 1) == 0 || self->_dataSourceType != *((_DWORD *)v4 + 4)) {
      goto LABEL_108;
    }
    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = (v21 & 1) == 0;
  }
LABEL_109:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_position;
    *(_WORD *)(v5 + 148) |= 0x40u;
  }
  uint64_t v7 = [(NSString *)self->_experimentId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_treatmentId copyWithZone:a3];
  NSUInteger v10 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v9;

  uint64_t v11 = [(NSString *)self->_treatmentName copyWithZone:a3];
  NSUInteger v12 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v11;

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(unsigned char *)(v6 + 142) = self->_hasResponseContext;
    *(_WORD *)(v6 + 148) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 144) = self->_isResponseContextBlacklisted;
  *(_WORD *)(v6 + 148) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    *(unsigned char *)(v6 + 143) = self->_isDocumentEmpty;
    *(_WORD *)(v6 + 148) |= 0x800u;
  }
LABEL_7:
  uint64_t v14 = [(NSString *)self->_textContentType copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v14;

  uint64_t v16 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  uint64_t v17 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v16;

  uint64_t v18 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  NSUInteger v19 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v18;

  __int16 v20 = (__int16)self->_has;
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_maxTextualResponseItems;
    *(_WORD *)(v6 + 148) |= 8u;
    __int16 v20 = (__int16)self->_has;
  }
  if ((v20 & 4) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_maxStructuredInfoItems;
    *(_WORD *)(v6 + 148) |= 4u;
  }
  uint64_t v21 = [(NSString *)self->_initiatingProcess copyWithZone:a3];
  BOOL v22 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v21;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_numTextualResponseItems;
    *(_WORD *)(v6 + 148) |= 0x20u;
  }
  uint64_t v23 = [(NSString *)self->_textualResponseCategory copyWithZone:a3];
  NSUInteger v24 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v23;

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_numStructuredInfoItems;
    *(_WORD *)(v6 + 148) |= 0x10u;
    __int16 v25 = (__int16)self->_has;
  }
  if ((v25 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_triggerSourceType;
    *(_WORD *)(v6 + 148) |= 0x80u;
  }
  uint64_t v26 = [(NSString *)self->_triggerCategory copyWithZone:a3];
  uint64_t v27 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v26;

  uint64_t v28 = [(NSString *)self->_triggerAttributeType copyWithZone:a3];
  NSUInteger v29 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v28;

  uint64_t v30 = [(NSString *)self->_triggerAttributeSubtype copyWithZone:a3];
  uint64_t v31 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v30;

  uint64_t v32 = [(NSString *)self->_triggerAttributeField copyWithZone:a3];
  v33 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v32;

  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x100) != 0)
  {
    *(unsigned char *)(v6 + 140) = self->_hasContextBeforeInput;
    *(_WORD *)(v6 + 148) |= 0x100u;
    __int16 v34 = (__int16)self->_has;
    if ((v34 & 2) == 0)
    {
LABEL_19:
      if ((v34 & 0x200) == 0) {
        goto LABEL_20;
      }
LABEL_28:
      *(unsigned char *)(v6 + 141) = self->_hasRecipientNames;
      *(_WORD *)(v6 + 148) |= 0x200u;
      if ((*(_WORD *)&self->_has & 1) == 0) {
        return (id)v6;
      }
      goto LABEL_21;
    }
  }
  else if ((v34 & 2) == 0)
  {
    goto LABEL_19;
  }
  *(_DWORD *)(v6 + 48) = self->_maxPredictionItems;
  *(_WORD *)(v6 + 148) |= 2u;
  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x200) != 0) {
    goto LABEL_28;
  }
LABEL_20:
  if (v34)
  {
LABEL_21:
    *(_DWORD *)(v6 + 16) = self->_dataSourceType;
    *(_WORD *)(v6 + 148) |= 1u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v4[17] = self->_position;
    *((_WORD *)v4 + 74) |= 0x40u;
  }
  uint64_t v9 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    id v4 = v9;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v9, "setTreatmentId:");
    id v4 = v9;
  }
  if (self->_treatmentName)
  {
    objc_msgSend(v9, "setTreatmentName:");
    id v4 = v9;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((unsigned char *)v4 + 142) = self->_hasResponseContext;
    *((_WORD *)v4 + 74) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_11:
      if ((has & 0x800) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v4 + 144) = self->_isResponseContextBlacklisted;
  *((_WORD *)v4 + 74) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_12:
    *((unsigned char *)v4 + 143) = self->_isDocumentEmpty;
    *((_WORD *)v4 + 74) |= 0x800u;
  }
LABEL_13:
  if (self->_textContentType)
  {
    objc_msgSend(v9, "setTextContentType:");
    id v4 = v9;
  }
  if (self->_localeIdentifier)
  {
    objc_msgSend(v9, "setLocaleIdentifier:");
    id v4 = v9;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v9, "setBundleIdentifier:");
    id v4 = v9;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[14] = self->_maxTextualResponseItems;
    *((_WORD *)v4 + 74) |= 8u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[13] = self->_maxStructuredInfoItems;
    *((_WORD *)v4 + 74) |= 4u;
  }
  if (self->_initiatingProcess)
  {
    objc_msgSend(v9, "setInitiatingProcess:");
    id v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v4[16] = self->_numTextualResponseItems;
    *((_WORD *)v4 + 74) |= 0x20u;
  }
  if (self->_textualResponseCategory)
  {
    objc_msgSend(v9, "setTextualResponseCategory:");
    id v4 = v9;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    v4[15] = self->_numStructuredInfoItems;
    *((_WORD *)v4 + 74) |= 0x10u;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x80) != 0)
  {
    v4[34] = self->_triggerSourceType;
    *((_WORD *)v4 + 74) |= 0x80u;
  }
  if (self->_triggerCategory)
  {
    objc_msgSend(v9, "setTriggerCategory:");
    id v4 = v9;
  }
  if (self->_triggerAttributeType)
  {
    objc_msgSend(v9, "setTriggerAttributeType:");
    id v4 = v9;
  }
  if (self->_triggerAttributeSubtype)
  {
    objc_msgSend(v9, "setTriggerAttributeSubtype:");
    id v4 = v9;
  }
  if (self->_triggerAttributeField)
  {
    objc_msgSend(v9, "setTriggerAttributeField:");
    id v4 = v9;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0)
  {
    *((unsigned char *)v4 + 140) = self->_hasContextBeforeInput;
    *((_WORD *)v4 + 74) |= 0x100u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_43:
      if ((v8 & 0x200) == 0) {
        goto LABEL_44;
      }
      goto LABEL_54;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_43;
  }
  v4[12] = self->_maxPredictionItems;
  *((_WORD *)v4 + 74) |= 2u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_44:
    if ((v8 & 1) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_54:
  *((unsigned char *)v4 + 141) = self->_hasRecipientNames;
  *((_WORD *)v4 + 74) |= 0x200u;
  if (*(_WORD *)&self->_has)
  {
LABEL_45:
    v4[4] = self->_dataSourceType;
    *((_WORD *)v4 + 74) |= 1u;
  }
LABEL_46:
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
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
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_11:
      if ((has & 0x800) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
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
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_initiatingProcess) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_textualResponseCategory) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_triggerCategory) {
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
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 2) == 0)
    {
LABEL_43:
      if ((v7 & 0x200) == 0) {
        goto LABEL_44;
      }
      goto LABEL_54;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteUint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_44:
    if ((v7 & 1) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  if (*(_WORD *)&self->_has) {
LABEL_45:
  }
    PBDataWriterWriteInt32Field();
LABEL_46:
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBEngagementReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x400) != 0)
  {
    BOOL v22 = [NSNumber numberWithBool:self->_hasResponseContext];
    [v4 setObject:v22 forKey:@"has_response_context"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_9:
      if ((has & 0x800) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v23 = [NSNumber numberWithBool:self->_isResponseContextBlacklisted];
  [v4 setObject:v23 forKey:@"is_response_context_blacklisted"];

  if ((*(_WORD *)&self->_has & 0x800) != 0)
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
  if ((v11 & 0x100) != 0)
  {
    NSUInteger v12 = [NSNumber numberWithBool:self->_hasContextBeforeInput];
    [v4 setObject:v12 forKey:@"has_context_before_input"];

    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x200) != 0)
  {
    __int16 v13 = [NSNumber numberWithBool:self->_hasRecipientNames];
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
    NSUInteger v24 = [NSNumber numberWithUnsignedInt:self->_maxTextualResponseItems];
    [v4 setObject:v24 forKey:@"max_textual_response_items"];

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
  __int16 v25 = [NSNumber numberWithUnsignedInt:self->_maxStructuredInfoItems];
  [v4 setObject:v25 forKey:@"max_structured_info_items"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_24:
    uint64_t v17 = [NSNumber numberWithUnsignedInt:self->_maxPredictionItems];
    [v4 setObject:v17 forKey:@"max_prediction_items"];
  }
LABEL_25:
  initiatingProcess = self->_initiatingProcess;
  if (initiatingProcess) {
    [v4 setObject:initiatingProcess forKey:@"initiating_process"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    NSUInteger v19 = [NSNumber numberWithUnsignedInt:self->_numTextualResponseItems];
    [v4 setObject:v19 forKey:@"num_textual_response_items"];
  }
  textualResponseCategory = self->_textualResponseCategory;
  if (textualResponseCategory) {
    [v4 setObject:textualResponseCategory forKey:@"textual_response_category"];
  }
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x10) != 0)
  {
    uint64_t v26 = [NSNumber numberWithUnsignedInt:self->_numStructuredInfoItems];
    [v4 setObject:v26 forKey:@"num_structured_info_items"];

    __int16 v21 = (__int16)self->_has;
    if ((v21 & 1) == 0)
    {
LABEL_33:
      if ((v21 & 0x80) == 0) {
        goto LABEL_50;
      }
      goto LABEL_46;
    }
  }
  else if ((v21 & 1) == 0)
  {
    goto LABEL_33;
  }
  uint64_t dataSourceType = self->_dataSourceType;
  if (dataSourceType >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_dataSourceType);
    uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v28 = off_265038098[dataSourceType];
  }
  [v4 setObject:v28 forKey:@"data_source_type"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_46:
    uint64_t triggerSourceType = self->_triggerSourceType;
    if (triggerSourceType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_triggerSourceType);
      uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v30 = off_2650380F0[triggerSourceType];
    }
    [v4 setObject:v30 forKey:@"trigger_source_type"];
  }
LABEL_50:
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
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v35 = [NSNumber numberWithUnsignedInt:self->_position];
    [v4 setObject:v35 forKey:@"position"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PSGPBEngagement;
  id v4 = [(PSGPBEngagement *)&v8 description];
  __int16 v5 = [(PSGPBEngagement *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPosition
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setPosition:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_position = a3;
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
    id v3 = off_2650380F0[a3];
  }
  return v3;
}

- (BOOL)hasTriggerSourceType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasTriggerSourceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setTriggerSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_uint64_t triggerSourceType = a3;
}

- (int)triggerSourceType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_triggerSourceType;
  }
  else {
    return 0;
  }
}

- (int)StringAsDataSourceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PredictionDataSourceType_Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_Contacts"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_FoundInApps"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_Events"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_Navigation"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_AppDonation"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_SchemaOrg"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_Pasteboard"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_Siri"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_PersonalizationPortrait"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PredictionDataSourceType_FaceTime"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dataSourceTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_265038098[a3];
  }
  return v3;
}

- (BOOL)hasDataSourceType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasDataSourceType:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setDataSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_uint64_t dataSourceType = a3;
}

- (int)dataSourceType
{
  if (*(_WORD *)&self->_has) {
    return self->_dataSourceType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasNumStructuredInfoItems
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumStructuredInfoItems:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setNumStructuredInfoItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numStructuredInfoItems = a3;
}

- (BOOL)hasTextualResponseCategory
{
  return self->_textualResponseCategory != 0;
}

- (BOOL)hasNumTextualResponseItems
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumTextualResponseItems:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setNumTextualResponseItems:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numTextualResponseItems = a3;
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
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_hasRecipientNames = a3;
}

- (BOOL)hasHasContextBeforeInput
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_hasContextBeforeInput = a3;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (BOOL)hasIsDocumentEmpty
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isDocumentEmpty = a3;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isResponseContextBlacklisted = a3;
}

- (BOOL)hasHasResponseContext
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setHasResponseContext:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
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