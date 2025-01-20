@interface PSGPBTypingSpeed
- (BOOL)hasLocaleIdentifier;
- (BOOL)hasMessageDurationMilliseconds;
- (BOOL)hasMessageLength;
- (BOOL)hasMessageWords;
- (BOOL)hasWbExperimentId;
- (BOOL)hasWbTreatmentId;
- (BOOL)hasWbTreatmentName;
- (BOOL)hasZkwExperimentId;
- (BOOL)hasZkwTreatmentId;
- (BOOL)hasZkwTreatmentName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)localeIdentifier;
- (NSString)wbExperimentId;
- (NSString)wbTreatmentId;
- (NSString)wbTreatmentName;
- (NSString)zkwExperimentId;
- (NSString)zkwTreatmentId;
- (NSString)zkwTreatmentName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)messageDurationMilliseconds;
- (int)messageLength;
- (int)messageWords;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMessageDurationMilliseconds:(BOOL)a3;
- (void)setHasMessageLength:(BOOL)a3;
- (void)setHasMessageWords:(BOOL)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setMessageDurationMilliseconds:(int)a3;
- (void)setMessageLength:(int)a3;
- (void)setMessageWords:(int)a3;
- (void)setWbExperimentId:(id)a3;
- (void)setWbTreatmentId:(id)a3;
- (void)setWbTreatmentName:(id)a3;
- (void)setZkwExperimentId:(id)a3;
- (void)setZkwTreatmentId:(id)a3;
- (void)setZkwTreatmentName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSGPBTypingSpeed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zkwTreatmentName, 0);
  objc_storeStrong((id *)&self->_zkwTreatmentId, 0);
  objc_storeStrong((id *)&self->_zkwExperimentId, 0);
  objc_storeStrong((id *)&self->_wbTreatmentName, 0);
  objc_storeStrong((id *)&self->_wbTreatmentId, 0);
  objc_storeStrong((id *)&self->_wbExperimentId, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (int)messageWords
{
  return self->_messageWords;
}

- (int)messageLength
{
  return self->_messageLength;
}

- (int)messageDurationMilliseconds
{
  return self->_messageDurationMilliseconds;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setWbTreatmentName:(id)a3
{
}

- (NSString)wbTreatmentName
{
  return self->_wbTreatmentName;
}

- (void)setWbTreatmentId:(id)a3
{
}

- (NSString)wbTreatmentId
{
  return self->_wbTreatmentId;
}

- (void)setWbExperimentId:(id)a3
{
}

- (NSString)wbExperimentId
{
  return self->_wbExperimentId;
}

- (void)setZkwTreatmentName:(id)a3
{
}

- (NSString)zkwTreatmentName
{
  return self->_zkwTreatmentName;
}

- (void)setZkwTreatmentId:(id)a3
{
}

- (NSString)zkwTreatmentId
{
  return self->_zkwTreatmentId;
}

- (void)setZkwExperimentId:(id)a3
{
}

- (NSString)zkwExperimentId
{
  return self->_zkwExperimentId;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  v6 = v4;
  if (*((void *)v4 + 7))
  {
    -[PSGPBTypingSpeed setZkwExperimentId:](self, "setZkwExperimentId:");
    v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[PSGPBTypingSpeed setZkwTreatmentId:](self, "setZkwTreatmentId:");
    v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[PSGPBTypingSpeed setZkwTreatmentName:](self, "setZkwTreatmentName:");
    v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[PSGPBTypingSpeed setWbExperimentId:](self, "setWbExperimentId:");
    v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[PSGPBTypingSpeed setWbTreatmentId:](self, "setWbTreatmentId:");
    v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[PSGPBTypingSpeed setWbTreatmentName:](self, "setWbTreatmentName:");
    v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[PSGPBTypingSpeed setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 80);
  if (v5)
  {
    self->_messageDurationMilliseconds = v4[4];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 80);
    if ((v5 & 2) == 0)
    {
LABEL_17:
      if ((v5 & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v4[20] & 2) == 0)
  {
    goto LABEL_17;
  }
  self->_messageLength = v4[5];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[20] & 4) != 0)
  {
LABEL_18:
    self->_messageWords = v4[6];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_19:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_zkwExperimentId hash];
  NSUInteger v4 = [(NSString *)self->_zkwTreatmentId hash];
  NSUInteger v5 = [(NSString *)self->_zkwTreatmentName hash];
  NSUInteger v6 = [(NSString *)self->_wbExperimentId hash];
  NSUInteger v7 = [(NSString *)self->_wbTreatmentId hash];
  NSUInteger v8 = [(NSString *)self->_wbTreatmentName hash];
  NSUInteger v9 = [(NSString *)self->_localeIdentifier hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v10 = 2654435761 * self->_messageDurationMilliseconds;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v11 = 2654435761 * self->_messageLength;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v12 = 2654435761 * self->_messageWords;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  zkwExperimentId = self->_zkwExperimentId;
  if ((unint64_t)zkwExperimentId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](zkwExperimentId, "isEqual:")) {
      goto LABEL_30;
    }
  }
  zkwTreatmentId = self->_zkwTreatmentId;
  if ((unint64_t)zkwTreatmentId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](zkwTreatmentId, "isEqual:")) {
      goto LABEL_30;
    }
  }
  zkwTreatmentName = self->_zkwTreatmentName;
  if ((unint64_t)zkwTreatmentName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](zkwTreatmentName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  wbExperimentId = self->_wbExperimentId;
  if ((unint64_t)wbExperimentId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](wbExperimentId, "isEqual:")) {
      goto LABEL_30;
    }
  }
  wbTreatmentId = self->_wbTreatmentId;
  if ((unint64_t)wbTreatmentId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](wbTreatmentId, "isEqual:")) {
      goto LABEL_30;
    }
  }
  wbTreatmentName = self->_wbTreatmentName;
  if ((unint64_t)wbTreatmentName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](wbTreatmentName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_messageDurationMilliseconds != *((_DWORD *)v4 + 4)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_30:
    BOOL v12 = 0;
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_messageLength != *((_DWORD *)v4 + 5)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_30;
  }
  BOOL v12 = (*((unsigned char *)v4 + 80) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_messageWords != *((_DWORD *)v4 + 6)) {
      goto LABEL_30;
    }
    BOOL v12 = 1;
  }
LABEL_31:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_zkwExperimentId copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_zkwTreatmentId copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  uint64_t v10 = [(NSString *)self->_zkwTreatmentName copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  uint64_t v12 = [(NSString *)self->_wbExperimentId copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_wbTreatmentId copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  uint64_t v16 = [(NSString *)self->_wbTreatmentName copyWithZone:a3];
  v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  uint64_t v18 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  v19 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v18;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_messageLength;
    *(unsigned char *)(v5 + 80) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_messageDurationMilliseconds;
  *(unsigned char *)(v5 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_messageWords;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_zkwExperimentId)
  {
    objc_msgSend(v4, "setZkwExperimentId:");
    id v4 = v6;
  }
  if (self->_zkwTreatmentId)
  {
    objc_msgSend(v6, "setZkwTreatmentId:");
    id v4 = v6;
  }
  if (self->_zkwTreatmentName)
  {
    objc_msgSend(v6, "setZkwTreatmentName:");
    id v4 = v6;
  }
  if (self->_wbExperimentId)
  {
    objc_msgSend(v6, "setWbExperimentId:");
    id v4 = v6;
  }
  if (self->_wbTreatmentId)
  {
    objc_msgSend(v6, "setWbTreatmentId:");
    id v4 = v6;
  }
  if (self->_wbTreatmentName)
  {
    objc_msgSend(v6, "setWbTreatmentName:");
    id v4 = v6;
  }
  if (self->_localeIdentifier)
  {
    objc_msgSend(v6, "setLocaleIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_messageDurationMilliseconds;
    *((unsigned char *)v4 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_17:
      if ((has & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 5) = self->_messageLength;
  *((unsigned char *)v4 + 80) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 6) = self->_messageWords;
    *((unsigned char *)v4 + 80) |= 4u;
  }
LABEL_19:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_zkwExperimentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_zkwTreatmentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_zkwTreatmentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_wbExperimentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_wbTreatmentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_wbTreatmentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_17:
      if ((has & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_18:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_19:
}

- (BOOL)readFrom:(id)a3
{
  return PSGPBTypingSpeedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  zkwExperimentId = self->_zkwExperimentId;
  if (zkwExperimentId) {
    [v3 setObject:zkwExperimentId forKey:@"zkw_experiment_id"];
  }
  zkwTreatmentId = self->_zkwTreatmentId;
  if (zkwTreatmentId) {
    [v4 setObject:zkwTreatmentId forKey:@"zkw_treatment_id"];
  }
  zkwTreatmentName = self->_zkwTreatmentName;
  if (zkwTreatmentName) {
    [v4 setObject:zkwTreatmentName forKey:@"zkw_treatment_name"];
  }
  wbExperimentId = self->_wbExperimentId;
  if (wbExperimentId) {
    [v4 setObject:wbExperimentId forKey:@"wb_experiment_id"];
  }
  wbTreatmentId = self->_wbTreatmentId;
  if (wbTreatmentId) {
    [v4 setObject:wbTreatmentId forKey:@"wb_treatment_id"];
  }
  wbTreatmentName = self->_wbTreatmentName;
  if (wbTreatmentName) {
    [v4 setObject:wbTreatmentName forKey:@"wb_treatment_name"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v4 setObject:localeIdentifier forKey:@"locale_identifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v15 = [NSNumber numberWithInt:self->_messageDurationMilliseconds];
    [v4 setObject:v15 forKey:@"message_duration_milliseconds"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_17:
      if ((has & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_17;
  }
  uint64_t v16 = [NSNumber numberWithInt:self->_messageLength];
  [v4 setObject:v16 forKey:@"message_length"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_18:
    v13 = [NSNumber numberWithInt:self->_messageWords];
    [v4 setObject:v13 forKey:@"message_words"];
  }
LABEL_19:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PSGPBTypingSpeed;
  id v4 = [(PSGPBTypingSpeed *)&v8 description];
  uint64_t v5 = [(PSGPBTypingSpeed *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMessageWords
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasMessageWords:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setMessageWords:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_messageWords = a3;
}

- (BOOL)hasMessageLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMessageLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMessageLength:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_messageLength = a3;
}

- (BOOL)hasMessageDurationMilliseconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMessageDurationMilliseconds:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMessageDurationMilliseconds:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_messageDurationMilliseconds = a3;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (BOOL)hasWbTreatmentName
{
  return self->_wbTreatmentName != 0;
}

- (BOOL)hasWbTreatmentId
{
  return self->_wbTreatmentId != 0;
}

- (BOOL)hasWbExperimentId
{
  return self->_wbExperimentId != 0;
}

- (BOOL)hasZkwTreatmentName
{
  return self->_zkwTreatmentName != 0;
}

- (BOOL)hasZkwTreatmentId
{
  return self->_zkwTreatmentId != 0;
}

- (BOOL)hasZkwExperimentId
{
  return self->_zkwExperimentId != 0;
}

@end