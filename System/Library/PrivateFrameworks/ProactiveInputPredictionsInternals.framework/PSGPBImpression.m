@interface PSGPBImpression
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

@implementation PSGPBImpression

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
  id v9 = v4;
  if (*((void *)v4 + 3))
  {
    -[PSGPBImpression setExperimentId:](self, "setExperimentId:");
    id v4 = v9;
  }
  if (*((void *)v4 + 11))
  {
    -[PSGPBImpression setTreatmentId:](self, "setTreatmentId:");
    id v4 = v9;
  }
  if (*((void *)v4 + 12))
  {
    -[PSGPBImpression setTreatmentName:](self, "setTreatmentName:");
    id v4 = v9;
  }
  __int16 v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x200) != 0)
  {
    self->_hasResponseContext = *((unsigned char *)v4 + 142);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v5 = *((_WORD *)v4 + 74);
    if ((v5 & 0x800) == 0)
    {
LABEL_9:
      if ((v5 & 0x400) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x800) == 0)
  {
    goto LABEL_9;
  }
  self->_isResponseContextBlacklisted = *((unsigned char *)v4 + 144);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 74) & 0x400) != 0)
  {
LABEL_10:
    self->_isDocumentEmpty = *((unsigned char *)v4 + 143);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_11:
  if (*((void *)v4 + 9))
  {
    -[PSGPBImpression setTextContentType:](self, "setTextContentType:");
    id v4 = v9;
  }
  if (*((void *)v4 + 5))
  {
    -[PSGPBImpression setLocaleIdentifier:](self, "setLocaleIdentifier:");
    id v4 = v9;
  }
  if (*((void *)v4 + 1))
  {
    -[PSGPBImpression setBundleIdentifier:](self, "setBundleIdentifier:");
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
    -[PSGPBImpression setInitiatingProcess:](self, "setInitiatingProcess:");
    id v4 = v9;
  }
  if ((*((_WORD *)v4 + 74) & 0x20) != 0)
  {
    self->_numTextualResponseItems = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 10))
  {
    -[PSGPBImpression setTextualResponseCategory:](self, "setTextualResponseCategory:");
    id v4 = v9;
  }
  __int16 v7 = *((_WORD *)v4 + 74);
  if ((v7 & 0x10) != 0)
  {
    self->_numStructuredInfoItems = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v7 = *((_WORD *)v4 + 74);
  }
  if ((v7 & 0x40) != 0)
  {
    self->_triggerSourceType = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 16))
  {
    -[PSGPBImpression setTriggerCategory:](self, "setTriggerCategory:");
    id v4 = v9;
  }
  if (*((void *)v4 + 15))
  {
    -[PSGPBImpression setTriggerAttributeType:](self, "setTriggerAttributeType:");
    id v4 = v9;
  }
  if (*((void *)v4 + 14))
  {
    -[PSGPBImpression setTriggerAttributeSubtype:](self, "setTriggerAttributeSubtype:");
    id v4 = v9;
  }
  if (*((void *)v4 + 13))
  {
    -[PSGPBImpression setTriggerAttributeField:](self, "setTriggerAttributeField:");
    id v4 = v9;
  }
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x80) != 0)
  {
    self->_hasContextBeforeInput = *((unsigned char *)v4 + 140);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v8 = *((_WORD *)v4 + 74);
    if ((v8 & 2) == 0)
    {
LABEL_41:
      if ((v8 & 0x100) == 0) {
        goto LABEL_42;
      }
      goto LABEL_52;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_41;
  }
  self->_maxPredictionItems = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 2u;
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x100) == 0)
  {
LABEL_42:
    if ((v8 & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_52:
  self->_hasRecipientNames = *((unsigned char *)v4 + 141);
  *(_WORD *)&self->_has |= 0x100u;
  if (*((_WORD *)v4 + 74))
  {
LABEL_43:
    self->_dataSourceType = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_44:
}

- (unint64_t)hash
{
  NSUInteger v31 = [(NSString *)self->_experimentId hash];
  NSUInteger v30 = [(NSString *)self->_treatmentId hash];
  NSUInteger v29 = [(NSString *)self->_treatmentName hash];
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    uint64_t v28 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v27 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v28 = 2654435761 * self->_hasResponseContext;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v27 = 2654435761 * self->_isResponseContextBlacklisted;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    uint64_t v26 = 2654435761 * self->_isDocumentEmpty;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v26 = 0;
LABEL_8:
  NSUInteger v25 = [(NSString *)self->_textContentType hash];
  NSUInteger v24 = [(NSString *)self->_localeIdentifier hash];
  NSUInteger v23 = [(NSString *)self->_bundleIdentifier hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v22 = 2654435761 * self->_maxTextualResponseItems;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((has & 4) != 0)
    {
LABEL_10:
      uint64_t v21 = 2654435761 * self->_maxStructuredInfoItems;
      goto LABEL_13;
    }
  }
  uint64_t v21 = 0;
LABEL_13:
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
    if ((v6 & 0x40) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((v6 & 0x40) != 0)
    {
LABEL_18:
      uint64_t v8 = 2654435761 * self->_triggerSourceType;
      goto LABEL_21;
    }
  }
  uint64_t v8 = 0;
LABEL_21:
  NSUInteger v9 = [(NSString *)self->_triggerCategory hash];
  NSUInteger v10 = [(NSString *)self->_triggerAttributeType hash];
  NSUInteger v11 = [(NSString *)self->_triggerAttributeSubtype hash];
  NSUInteger v12 = [(NSString *)self->_triggerAttributeField hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    uint64_t v14 = 2654435761 * self->_hasContextBeforeInput;
    if ((v13 & 2) != 0)
    {
LABEL_23:
      uint64_t v15 = 2654435761 * self->_maxPredictionItems;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_24;
      }
LABEL_28:
      uint64_t v16 = 0;
      if (v13) {
        goto LABEL_25;
      }
LABEL_29:
      uint64_t v17 = 0;
      return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((v13 & 2) != 0) {
      goto LABEL_23;
    }
  }
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_28;
  }
LABEL_24:
  uint64_t v16 = 2654435761 * self->_hasRecipientNames;
  if ((v13 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_25:
  uint64_t v17 = 2654435761 * self->_dataSourceType;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_103;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:")) {
      goto LABEL_103;
    }
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_103;
    }
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:")) {
      goto LABEL_103;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x200) == 0) {
      goto LABEL_103;
    }
    if (self->_hasResponseContext)
    {
      if (!*((unsigned char *)v4 + 142)) {
        goto LABEL_103;
      }
    }
    else if (*((unsigned char *)v4 + 142))
    {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x200) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x800) == 0) {
      goto LABEL_103;
    }
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_103;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x800) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x400) == 0) {
      goto LABEL_103;
    }
    if (self->_isDocumentEmpty)
    {
      if (!*((unsigned char *)v4 + 143)) {
        goto LABEL_103;
      }
    }
    else if (*((unsigned char *)v4 + 143))
    {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x400) != 0)
  {
    goto LABEL_103;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((void *)v4 + 9)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_103;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_103;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_103;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v12 = *((_WORD *)v4 + 74);
  if ((has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 14)) {
      goto LABEL_103;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 13)) {
      goto LABEL_103;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_103;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](initiatingProcess, "isEqual:")) {
      goto LABEL_103;
    }
    __int16 has = (__int16)self->_has;
    __int16 v12 = *((_WORD *)v4 + 74);
  }
  if ((has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_numTextualResponseItems != *((_DWORD *)v4 + 16)) {
      goto LABEL_103;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_103;
  }
  textualResponseCategory = self->_textualResponseCategory;
  if ((unint64_t)textualResponseCategory | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](textualResponseCategory, "isEqual:")) {
      goto LABEL_103;
    }
    __int16 has = (__int16)self->_has;
    __int16 v12 = *((_WORD *)v4 + 74);
  }
  if ((has & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_numStructuredInfoItems != *((_DWORD *)v4 + 15)) {
      goto LABEL_103;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_triggerSourceType != *((_DWORD *)v4 + 34)) {
      goto LABEL_103;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_103;
  }
  triggerCategory = self->_triggerCategory;
  if ((unint64_t)triggerCategory | *((void *)v4 + 16)
    && !-[NSString isEqual:](triggerCategory, "isEqual:"))
  {
    goto LABEL_103;
  }
  triggerAttributeType = self->_triggerAttributeType;
  if ((unint64_t)triggerAttributeType | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](triggerAttributeType, "isEqual:")) {
      goto LABEL_103;
    }
  }
  triggerAttributeSubtype = self->_triggerAttributeSubtype;
  if ((unint64_t)triggerAttributeSubtype | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](triggerAttributeSubtype, "isEqual:")) {
      goto LABEL_103;
    }
  }
  triggerAttributeField = self->_triggerAttributeField;
  if ((unint64_t)triggerAttributeField | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](triggerAttributeField, "isEqual:")) {
      goto LABEL_103;
    }
  }
  __int16 v19 = (__int16)self->_has;
  __int16 v20 = *((_WORD *)v4 + 74);
  if ((v19 & 0x80) != 0)
  {
    if ((v20 & 0x80) == 0) {
      goto LABEL_103;
    }
    if (self->_hasContextBeforeInput)
    {
      if (!*((unsigned char *)v4 + 140)) {
        goto LABEL_103;
      }
    }
    else if (*((unsigned char *)v4 + 140))
    {
      goto LABEL_103;
    }
  }
  else if ((v20 & 0x80) != 0)
  {
    goto LABEL_103;
  }
  if ((v19 & 2) != 0)
  {
    if ((v20 & 2) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 12)) {
      goto LABEL_103;
    }
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x100) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((unsigned char *)v4 + 141)) {
          goto LABEL_103;
        }
        goto LABEL_98;
      }
      if (!*((unsigned char *)v4 + 141)) {
        goto LABEL_98;
      }
    }
LABEL_103:
    BOOL v21 = 0;
    goto LABEL_104;
  }
  if ((*((_WORD *)v4 + 74) & 0x100) != 0) {
    goto LABEL_103;
  }
LABEL_98:
  if (v19)
  {
    if ((v20 & 1) == 0 || self->_dataSourceType != *((_DWORD *)v4 + 4)) {
      goto LABEL_103;
    }
    BOOL v21 = 1;
  }
  else
  {
    BOOL v21 = (v20 & 1) == 0;
  }
LABEL_104:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_experimentId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_treatmentId copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v8;

  uint64_t v10 = [(NSString *)self->_treatmentName copyWithZone:a3];
  NSUInteger v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 142) = self->_hasResponseContext;
    *(_WORD *)(v5 + 148) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 144) = self->_isResponseContextBlacklisted;
  *(_WORD *)(v5 + 148) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 143) = self->_isDocumentEmpty;
    *(_WORD *)(v5 + 148) |= 0x400u;
  }
LABEL_5:
  uint64_t v13 = [(NSString *)self->_textContentType copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  uint64_t v15 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  uint64_t v17 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v18 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v17;

  __int16 v19 = (__int16)self->_has;
  if ((v19 & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_maxTextualResponseItems;
    *(_WORD *)(v5 + 148) |= 8u;
    __int16 v19 = (__int16)self->_has;
  }
  if ((v19 & 4) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_maxStructuredInfoItems;
    *(_WORD *)(v5 + 148) |= 4u;
  }
  uint64_t v20 = [(NSString *)self->_initiatingProcess copyWithZone:a3];
  BOOL v21 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v20;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_numTextualResponseItems;
    *(_WORD *)(v5 + 148) |= 0x20u;
  }
  uint64_t v22 = [(NSString *)self->_textualResponseCategory copyWithZone:a3];
  NSUInteger v23 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v22;

  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_numStructuredInfoItems;
    *(_WORD *)(v5 + 148) |= 0x10u;
    __int16 v24 = (__int16)self->_has;
  }
  if ((v24 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_triggerSourceType;
    *(_WORD *)(v5 + 148) |= 0x40u;
  }
  uint64_t v25 = [(NSString *)self->_triggerCategory copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v25;

  uint64_t v27 = [(NSString *)self->_triggerAttributeType copyWithZone:a3];
  uint64_t v28 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v27;

  uint64_t v29 = [(NSString *)self->_triggerAttributeSubtype copyWithZone:a3];
  NSUInteger v30 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v29;

  uint64_t v31 = [(NSString *)self->_triggerAttributeField copyWithZone:a3];
  v32 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v31;

  __int16 v33 = (__int16)self->_has;
  if ((v33 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 140) = self->_hasContextBeforeInput;
    *(_WORD *)(v5 + 148) |= 0x80u;
    __int16 v33 = (__int16)self->_has;
    if ((v33 & 2) == 0)
    {
LABEL_17:
      if ((v33 & 0x100) == 0) {
        goto LABEL_18;
      }
LABEL_26:
      *(unsigned char *)(v5 + 141) = self->_hasRecipientNames;
      *(_WORD *)(v5 + 148) |= 0x100u;
      if ((*(_WORD *)&self->_has & 1) == 0) {
        return (id)v5;
      }
      goto LABEL_19;
    }
  }
  else if ((v33 & 2) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 48) = self->_maxPredictionItems;
  *(_WORD *)(v5 + 148) |= 2u;
  __int16 v33 = (__int16)self->_has;
  if ((v33 & 0x100) != 0) {
    goto LABEL_26;
  }
LABEL_18:
  if (v33)
  {
LABEL_19:
    *(_DWORD *)(v5 + 16) = self->_dataSourceType;
    *(_WORD *)(v5 + 148) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
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
  if ((has & 0x200) != 0)
  {
    *((unsigned char *)v4 + 142) = self->_hasResponseContext;
    *((_WORD *)v4 + 74) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x400) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v4 + 144) = self->_isResponseContextBlacklisted;
  *((_WORD *)v4 + 74) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    *((unsigned char *)v4 + 143) = self->_isDocumentEmpty;
    *((_WORD *)v4 + 74) |= 0x400u;
  }
LABEL_11:
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
    *((_DWORD *)v4 + 14) = self->_maxTextualResponseItems;
    *((_WORD *)v4 + 74) |= 8u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_maxStructuredInfoItems;
    *((_WORD *)v4 + 74) |= 4u;
  }
  if (self->_initiatingProcess)
  {
    objc_msgSend(v9, "setInitiatingProcess:");
    id v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_numTextualResponseItems;
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
    *((_DWORD *)v4 + 15) = self->_numStructuredInfoItems;
    *((_WORD *)v4 + 74) |= 0x10u;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 34) = self->_triggerSourceType;
    *((_WORD *)v4 + 74) |= 0x40u;
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
  if ((v8 & 0x80) != 0)
  {
    *((unsigned char *)v4 + 140) = self->_hasContextBeforeInput;
    *((_WORD *)v4 + 74) |= 0x80u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_41:
      if ((v8 & 0x100) == 0) {
        goto LABEL_42;
      }
      goto LABEL_52;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_41;
  }
  *((_DWORD *)v4 + 12) = self->_maxPredictionItems;
  *((_WORD *)v4 + 74) |= 2u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_42:
    if ((v8 & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_52:
  *((unsigned char *)v4 + 141) = self->_hasRecipientNames;
  *((_WORD *)v4 + 74) |= 0x100u;
  if (*(_WORD *)&self->_has)
  {
LABEL_43:
    *((_DWORD *)v4 + 4) = self->_dataSourceType;
    *((_WORD *)v4 + 74) |= 1u;
  }
LABEL_44:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_experimentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_treatmentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_treatmentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v9;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x400) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    PBDataWriterWriteBOOLField();
    id v4 = v9;
  }
LABEL_11:
  if (self->_textContentType)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v9;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
  if (self->_initiatingProcess)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
  if (self->_textualResponseCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v9;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
  if (self->_triggerCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_triggerAttributeType)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_triggerAttributeSubtype)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_triggerAttributeField)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v9;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_41:
      if ((v8 & 0x100) == 0) {
        goto LABEL_42;
      }
      goto LABEL_52;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_42:
    if ((v8 & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  if (*(_WORD *)&self->_has)
  {
LABEL_43:
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
LABEL_44:
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBImpressionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x200) != 0)
  {
    uint64_t v22 = [NSNumber numberWithBool:self->_hasResponseContext];
    [v4 setObject:v22 forKey:@"has_response_context"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x400) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  NSUInteger v23 = [NSNumber numberWithBool:self->_isResponseContextBlacklisted];
  [v4 setObject:v23 forKey:@"is_response_context_blacklisted"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    id v9 = [NSNumber numberWithBool:self->_isDocumentEmpty];
    [v4 setObject:v9 forKey:@"is_document_empty"];
  }
LABEL_11:
  textContentType = self->_textContentType;
  if (textContentType) {
    [v4 setObject:textContentType forKey:@"text_content_type"];
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x80) != 0)
  {
    __int16 v12 = [NSNumber numberWithBool:self->_hasContextBeforeInput];
    [v4 setObject:v12 forKey:@"has_context_before_input"];

    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x100) != 0)
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
    __int16 v24 = [NSNumber numberWithUnsignedInt:self->_maxTextualResponseItems];
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
  uint64_t v25 = [NSNumber numberWithUnsignedInt:self->_maxStructuredInfoItems];
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
    __int16 v19 = [NSNumber numberWithUnsignedInt:self->_numTextualResponseItems];
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
      if ((v21 & 0x40) == 0) {
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
    uint64_t v28 = off_265037D38[dataSourceType];
  }
  [v4 setObject:v28 forKey:@"data_source_type"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_46:
    uint64_t triggerSourceType = self->_triggerSourceType;
    if (triggerSourceType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_triggerSourceType);
      NSUInteger v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSUInteger v30 = off_265037D90[triggerSourceType];
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
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PSGPBImpression;
  id v4 = [(PSGPBImpression *)&v8 description];
  uint64_t v5 = [(PSGPBImpression *)self dictionaryRepresentation];
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
    id v3 = off_265037D90[a3];
  }
  return v3;
}

- (BOOL)hasTriggerSourceType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasTriggerSourceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setTriggerSourceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_uint64_t triggerSourceType = a3;
}

- (int)triggerSourceType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
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
    id v3 = off_265037D38[a3];
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
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_hasRecipientNames = a3;
}

- (BOOL)hasHasContextBeforeInput
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hasContextBeforeInput = a3;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (BOOL)hasIsDocumentEmpty
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isDocumentEmpty = a3;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isResponseContextBlacklisted = a3;
}

- (BOOL)hasHasResponseContext
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setHasResponseContext:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
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