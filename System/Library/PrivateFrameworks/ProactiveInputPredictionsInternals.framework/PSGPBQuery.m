@interface PSGPBQuery
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
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
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
- (void)writeTo:(id)a3;
@end

@implementation PSGPBQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_initiatingProcess, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
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
  char v5 = *((unsigned char *)v4 + 88);
  if ((v5 & 0x20) != 0)
  {
    self->_hasResponseContext = *((unsigned char *)v4 + 82);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)v4 + 88);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_isResponseContextBlacklisted = *((unsigned char *)v4 + 84);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)v4 + 88) & 0x40) != 0)
  {
LABEL_4:
    self->_isDocumentEmpty = *((unsigned char *)v4 + 83);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_5:
  id v8 = v4;
  if (*((void *)v4 + 7))
  {
    -[PSGPBQuery setTextContentType:](self, "setTextContentType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 4))
  {
    -[PSGPBQuery setLocaleIdentifier:](self, "setLocaleIdentifier:");
    id v4 = v8;
  }
  if (*((void *)v4 + 1))
  {
    -[PSGPBQuery setBundleIdentifier:](self, "setBundleIdentifier:");
    id v4 = v8;
  }
  char v6 = *((unsigned char *)v4 + 88);
  if ((v6 & 4) != 0)
  {
    self->_maxTextualResponseItems = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 88);
  }
  if ((v6 & 2) != 0)
  {
    self->_maxStructuredInfoItems = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[PSGPBQuery setInitiatingProcess:](self, "setInitiatingProcess:");
    id v4 = v8;
  }
  if (*((void *)v4 + 2))
  {
    -[PSGPBQuery setExperimentId:](self, "setExperimentId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 8))
  {
    -[PSGPBQuery setTreatmentId:](self, "setTreatmentId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 9))
  {
    -[PSGPBQuery setTreatmentName:](self, "setTreatmentName:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 88);
  if ((v7 & 8) != 0)
  {
    self->_hasContextBeforeInput = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 8u;
    char v7 = *((unsigned char *)v4 + 88);
    if ((v7 & 1) == 0)
    {
LABEL_25:
      if ((v7 & 0x10) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 1) == 0)
  {
    goto LABEL_25;
  }
  self->_maxPredictionItems = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
  {
LABEL_26:
    self->_hasRecipientNames = *((unsigned char *)v4 + 81);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_27:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v3 = 2654435761 * self->_hasResponseContext;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isResponseContextBlacklisted;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v21 = v4;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v5 = 2654435761 * self->_isDocumentEmpty;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_textContentType hash];
  NSUInteger v19 = [(NSString *)self->_localeIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_bundleIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_maxTextualResponseItems;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v20 = v6;
  NSUInteger v9 = v7;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_maxStructuredInfoItems;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_initiatingProcess hash];
  NSUInteger v12 = [(NSString *)self->_experimentId hash];
  NSUInteger v13 = [(NSString *)self->_treatmentId hash];
  NSUInteger v14 = [(NSString *)self->_treatmentName hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v15 = 2654435761 * self->_hasContextBeforeInput;
  }
  else {
    uint64_t v15 = 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v16 = 2654435761 * self->_maxPredictionItems;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_20;
    }
LABEL_22:
    uint64_t v17 = 0;
    return v21 ^ v3 ^ v5 ^ v20 ^ v19 ^ v9 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
  uint64_t v16 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v17 = 2654435761 * self->_hasRecipientNames;
  return v21 ^ v3 ^ v5 ^ v20 ^ v19 ^ v9 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x20) == 0) {
      goto LABEL_66;
    }
    if (self->_hasResponseContext)
    {
      if (!*((unsigned char *)v4 + 82)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 82))
    {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x80) == 0) {
      goto LABEL_66;
    }
    if (self->_isResponseContextBlacklisted)
    {
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 84))
    {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x80) != 0)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x40) == 0) {
      goto LABEL_66;
    }
    if (self->_isDocumentEmpty)
    {
      if (!*((unsigned char *)v4 + 83)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 83))
    {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x40) != 0)
  {
    goto LABEL_66;
  }
  textContentType = self->_textContentType;
  if ((unint64_t)textContentType | *((void *)v4 + 7)
    && !-[NSString isEqual:](textContentType, "isEqual:"))
  {
    goto LABEL_66;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_66;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_66;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0 || self->_maxTextualResponseItems != *((_DWORD *)v4 + 12)) {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_maxStructuredInfoItems != *((_DWORD *)v4 + 11)) {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_66;
  }
  initiatingProcess = self->_initiatingProcess;
  if ((unint64_t)initiatingProcess | *((void *)v4 + 3)
    && !-[NSString isEqual:](initiatingProcess, "isEqual:"))
  {
    goto LABEL_66;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:")) {
      goto LABEL_66;
    }
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_66;
    }
  }
  treatmentName = self->_treatmentName;
  if ((unint64_t)treatmentName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](treatmentName, "isEqual:")) {
      goto LABEL_66;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 8) == 0) {
      goto LABEL_66;
    }
    if (self->_hasContextBeforeInput)
    {
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 80))
    {
      goto LABEL_66;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 8) != 0)
  {
    goto LABEL_66;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_maxPredictionItems != *((_DWORD *)v4 + 10)) {
      goto LABEL_66;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
    {
      if (self->_hasRecipientNames)
      {
        if (!*((unsigned char *)v4 + 81)) {
          goto LABEL_66;
        }
      }
      else if (*((unsigned char *)v4 + 81))
      {
        goto LABEL_66;
      }
      BOOL v12 = 1;
      goto LABEL_67;
    }
LABEL_66:
    BOOL v12 = 0;
    goto LABEL_67;
  }
  BOOL v12 = (*((unsigned char *)v4 + 88) & 0x10) == 0;
LABEL_67:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v5[82] = self->_hasResponseContext;
    v5[88] |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v5[84] = self->_isResponseContextBlacklisted;
  v5[88] |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    v5[83] = self->_isDocumentEmpty;
    v5[88] |= 0x40u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_textContentType copyWithZone:a3];
  NSUInteger v9 = (void *)*((void *)v6 + 7);
  *((void *)v6 + 7) = v8;

  uint64_t v10 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  NSUInteger v11 = (void *)*((void *)v6 + 4);
  *((void *)v6 + 4) = v10;

  uint64_t v12 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  NSUInteger v13 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v12;

  char v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_maxTextualResponseItems;
    v6[88] |= 4u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_maxStructuredInfoItems;
    v6[88] |= 2u;
  }
  uint64_t v15 = [(NSString *)self->_initiatingProcess copyWithZone:a3];
  uint64_t v16 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v15;

  uint64_t v17 = [(NSString *)self->_experimentId copyWithZone:a3];
  v18 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v17;

  uint64_t v19 = [(NSString *)self->_treatmentId copyWithZone:a3];
  NSUInteger v20 = (void *)*((void *)v6 + 8);
  *((void *)v6 + 8) = v19;

  uint64_t v21 = [(NSString *)self->_treatmentName copyWithZone:a3];
  v22 = (void *)*((void *)v6 + 9);
  *((void *)v6 + 9) = v21;

  char v23 = (char)self->_has;
  if ((v23 & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
LABEL_18:
    *((_DWORD *)v6 + 10) = self->_maxPredictionItems;
    v6[88] |= 1u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v6;
    }
    goto LABEL_12;
  }
  v6[80] = self->_hasContextBeforeInput;
  v6[88] |= 8u;
  char v23 = (char)self->_has;
  if (v23) {
    goto LABEL_18;
  }
LABEL_11:
  if ((v23 & 0x10) != 0)
  {
LABEL_12:
    v6[81] = self->_hasRecipientNames;
    v6[88] |= 0x10u;
  }
  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[82] = self->_hasResponseContext;
    v4[88] |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v4[84] = self->_isResponseContextBlacklisted;
  v4[88] |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    v4[83] = self->_isDocumentEmpty;
    v4[88] |= 0x40u;
  }
LABEL_5:
  uint64_t v8 = v4;
  if (self->_textContentType)
  {
    objc_msgSend(v4, "setTextContentType:");
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
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_maxTextualResponseItems;
    v4[88] |= 4u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_maxStructuredInfoItems;
    v4[88] |= 2u;
  }
  if (self->_initiatingProcess)
  {
    objc_msgSend(v8, "setInitiatingProcess:");
    id v4 = v8;
  }
  if (self->_experimentId)
  {
    objc_msgSend(v8, "setExperimentId:");
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
  char v7 = (char)self->_has;
  if ((v7 & 8) != 0)
  {
    v4[80] = self->_hasContextBeforeInput;
    v4[88] |= 8u;
    char v7 = (char)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_25:
      if ((v7 & 0x10) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v4 + 10) = self->_maxPredictionItems;
  v4[88] |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_26:
    v4[81] = self->_hasRecipientNames;
    v4[88] |= 0x10u;
  }
LABEL_27:
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  if (self->_textContentType) {
    PBDataWriterWriteStringField();
  }
  if (self->_localeIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_initiatingProcess) {
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
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_25:
      if ((v6 & 0x10) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_26:
  }
    PBDataWriterWriteBOOLField();
LABEL_27:
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBQueryReadFrom((uint64_t)self, (uint64_t)a3);
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
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    NSUInteger v20 = [NSNumber numberWithBool:self->_hasResponseContext];
    [v4 setObject:v20 forKey:@"has_response_context"];

    char has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v21 = [NSNumber numberWithBool:self->_isResponseContextBlacklisted];
  [v4 setObject:v21 forKey:@"is_response_context_blacklisted"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    NSUInteger v9 = [NSNumber numberWithBool:self->_isDocumentEmpty];
    [v4 setObject:v9 forKey:@"is_document_empty"];
  }
LABEL_11:
  textContentType = self->_textContentType;
  if (textContentType) {
    [v4 setObject:textContentType forKey:@"text_content_type"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    uint64_t v12 = [NSNumber numberWithBool:self->_hasContextBeforeInput];
    [v4 setObject:v12 forKey:@"has_context_before_input"];

    char v11 = (char)self->_has;
  }
  if ((v11 & 0x10) != 0)
  {
    NSUInteger v13 = [NSNumber numberWithBool:self->_hasRecipientNames];
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
  char v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    v22 = [NSNumber numberWithUnsignedInt:self->_maxTextualResponseItems];
    [v4 setObject:v22 forKey:@"max_textual_response_items"];

    char v16 = (char)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_23:
      if ((v16 & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_23;
  }
  char v23 = [NSNumber numberWithUnsignedInt:self->_maxStructuredInfoItems];
  [v4 setObject:v23 forKey:@"max_structured_info_items"];

  if (*(unsigned char *)&self->_has)
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
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PSGPBQuery;
  id v4 = [(PSGPBQuery *)&v8 description];
  char v5 = [(PSGPBQuery *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasInitiatingProcess
{
  return self->_initiatingProcess != 0;
}

- (BOOL)hasMaxPredictionItems
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMaxPredictionItems:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMaxPredictionItems:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxPredictionItems = a3;
}

- (BOOL)hasMaxStructuredInfoItems
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMaxStructuredInfoItems:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMaxStructuredInfoItems:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxStructuredInfoItems = a3;
}

- (BOOL)hasMaxTextualResponseItems
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasMaxTextualResponseItems:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setMaxTextualResponseItems:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
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
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasHasRecipientNames:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setHasRecipientNames:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_hasRecipientNames = a3;
}

- (BOOL)hasHasContextBeforeInput
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasHasContextBeforeInput:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setHasContextBeforeInput:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_hasContextBeforeInput = a3;
}

- (BOOL)hasTextContentType
{
  return self->_textContentType != 0;
}

- (BOOL)hasIsDocumentEmpty
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasIsDocumentEmpty:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setIsDocumentEmpty:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isDocumentEmpty = a3;
}

- (BOOL)hasIsResponseContextBlacklisted
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasIsResponseContextBlacklisted:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (void)setIsResponseContextBlacklisted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isResponseContextBlacklisted = a3;
}

- (BOOL)hasHasResponseContext
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasHasResponseContext:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setHasResponseContext:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
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