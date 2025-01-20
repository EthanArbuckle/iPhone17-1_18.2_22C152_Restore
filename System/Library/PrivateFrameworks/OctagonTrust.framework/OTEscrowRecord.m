@interface OTEscrowRecord
- (BOOL)hasCoolOffEnd;
- (BOOL)hasCreationDate;
- (BOOL)hasEscrowInformationMetadata;
- (BOOL)hasExpectedFederationId;
- (BOOL)hasFederationId;
- (BOOL)hasLabel;
- (BOOL)hasRecordId;
- (BOOL)hasRecordStatus;
- (BOOL)hasRecordViability;
- (BOOL)hasRecoveryStatus;
- (BOOL)hasRemainingAttempts;
- (BOOL)hasSerialNumber;
- (BOOL)hasSilentAttemptAllowed;
- (BOOL)hasViabilityStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)expectedFederationId;
- (NSString)federationId;
- (NSString)label;
- (NSString)recordId;
- (NSString)serialNumber;
- (OTEscrowRecordMetadata)escrowInformationMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordStatusAsString:(int)a3;
- (id)recordViabilityAsString:(int)a3;
- (id)recoveryStatusAsString:(int)a3;
- (id)viabilityStatusAsString:(int)a3;
- (int)StringAsRecordStatus:(id)a3;
- (int)StringAsRecordViability:(id)a3;
- (int)StringAsRecoveryStatus:(id)a3;
- (int)StringAsViabilityStatus:(id)a3;
- (int)recordStatus;
- (int)recordViability;
- (int)recoveryStatus;
- (int)viabilityStatus;
- (unint64_t)coolOffEnd;
- (unint64_t)creationDate;
- (unint64_t)hash;
- (unint64_t)remainingAttempts;
- (unint64_t)silentAttemptAllowed;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoolOffEnd:(unint64_t)a3;
- (void)setCreationDate:(unint64_t)a3;
- (void)setEscrowInformationMetadata:(id)a3;
- (void)setExpectedFederationId:(id)a3;
- (void)setFederationId:(id)a3;
- (void)setHasCoolOffEnd:(BOOL)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasRecordStatus:(BOOL)a3;
- (void)setHasRecordViability:(BOOL)a3;
- (void)setHasRecoveryStatus:(BOOL)a3;
- (void)setHasRemainingAttempts:(BOOL)a3;
- (void)setHasSilentAttemptAllowed:(BOOL)a3;
- (void)setHasViabilityStatus:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setRecordId:(id)a3;
- (void)setRecordStatus:(int)a3;
- (void)setRecordViability:(int)a3;
- (void)setRecoveryStatus:(int)a3;
- (void)setRemainingAttempts:(unint64_t)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSilentAttemptAllowed:(unint64_t)a3;
- (void)setViabilityStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_federationId, 0);
  objc_storeStrong((id *)&self->_expectedFederationId, 0);
  objc_storeStrong((id *)&self->_escrowInformationMetadata, 0);
}

- (void)setExpectedFederationId:(id)a3
{
}

- (NSString)expectedFederationId
{
  return self->_expectedFederationId;
}

- (void)setFederationId:(id)a3
{
}

- (NSString)federationId
{
  return self->_federationId;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (unint64_t)coolOffEnd
{
  return self->_coolOffEnd;
}

- (void)setRecordId:(id)a3
{
}

- (NSString)recordId
{
  return self->_recordId;
}

- (unint64_t)silentAttemptAllowed
{
  return self->_silentAttemptAllowed;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setEscrowInformationMetadata:(id)a3
{
}

- (OTEscrowRecordMetadata)escrowInformationMetadata
{
  return self->_escrowInformationMetadata;
}

- (unint64_t)remainingAttempts
{
  return self->_remainingAttempts;
}

- (unint64_t)creationDate
{
  return self->_creationDate;
}

- (void)mergeFrom:(id)a3
{
  v4 = (unint64_t *)a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 108);
  if ((v6 & 2) != 0)
  {
    self->_creationDate = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 108);
  }
  if ((v6 & 4) != 0)
  {
    self->_remainingAttempts = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  escrowInformationMetadata = self->_escrowInformationMetadata;
  unint64_t v8 = v5[5];
  v12 = v5;
  if (escrowInformationMetadata)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[OTEscrowRecordMetadata mergeFrom:](escrowInformationMetadata, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[OTEscrowRecord setEscrowInformationMetadata:](self, "setEscrowInformationMetadata:");
  }
  v5 = v12;
LABEL_11:
  if (v5[8])
  {
    -[OTEscrowRecord setLabel:](self, "setLabel:");
    v5 = v12;
  }
  char v9 = *((unsigned char *)v5 + 108);
  if ((v9 & 8) != 0)
  {
    self->_silentAttemptAllowed = v5[4];
    *(unsigned char *)&self->_has |= 8u;
    char v9 = *((unsigned char *)v5 + 108);
  }
  if ((v9 & 0x10) != 0)
  {
    self->_recordStatus = *((_DWORD *)v5 + 20);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (v5[9])
  {
    -[OTEscrowRecord setRecordId:](self, "setRecordId:");
    v5 = v12;
  }
  char v10 = *((unsigned char *)v5 + 108);
  if ((v10 & 0x40) != 0)
  {
    self->_recoveryStatus = *((_DWORD *)v5 + 22);
    *(unsigned char *)&self->_has |= 0x40u;
    char v10 = *((unsigned char *)v5 + 108);
  }
  if (v10)
  {
    self->_coolOffEnd = v5[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v5[12])
  {
    -[OTEscrowRecord setSerialNumber:](self, "setSerialNumber:");
    v5 = v12;
  }
  char v11 = *((unsigned char *)v5 + 108);
  if ((v11 & 0x20) != 0)
  {
    self->_recordViability = *((_DWORD *)v5 + 21);
    *(unsigned char *)&self->_has |= 0x20u;
    char v11 = *((unsigned char *)v5 + 108);
  }
  if (v11 < 0)
  {
    self->_viabilityStatus = *((_DWORD *)v5 + 26);
    *(unsigned char *)&self->_has |= 0x80u;
  }
  if (v5[7])
  {
    -[OTEscrowRecord setFederationId:](self, "setFederationId:");
    v5 = v12;
  }
  if (v5[6]) {
    -[OTEscrowRecord setExpectedFederationId:](self, "setExpectedFederationId:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_creationDate;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v20 = v3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v4 = 2654435761u * self->_remainingAttempts;
  }
  else {
    unint64_t v4 = 0;
  }
  unint64_t v5 = [(OTEscrowRecordMetadata *)self->_escrowInformationMetadata hash];
  NSUInteger v6 = [(NSString *)self->_label hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    unint64_t v7 = 2654435761u * self->_silentAttemptAllowed;
  }
  else {
    unint64_t v7 = 0;
  }
  NSUInteger v8 = v6;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v9 = 2654435761 * self->_recordStatus;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_recordId hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v11 = 2654435761 * self->_recoveryStatus;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v10;
  if (*(unsigned char *)&self->_has) {
    unint64_t v13 = 2654435761u * self->_coolOffEnd;
  }
  else {
    unint64_t v13 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_serialNumber hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v15 = 2654435761 * self->_recordViability;
  }
  else {
    uint64_t v15 = 0;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v16 = 2654435761 * self->_viabilityStatus;
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v17 = v4 ^ v20 ^ v5 ^ v8 ^ v7 ^ v9 ^ v12 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
  NSUInteger v18 = [(NSString *)self->_federationId hash];
  return v17 ^ v18 ^ [(NSString *)self->_expectedFederationId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_creationDate != *((void *)v4 + 2)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 4) == 0 || self->_remainingAttempts != *((void *)v4 + 3)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 4) != 0)
  {
    goto LABEL_55;
  }
  escrowInformationMetadata = self->_escrowInformationMetadata;
  if ((unint64_t)escrowInformationMetadata | *((void *)v4 + 5)
    && !-[OTEscrowRecordMetadata isEqual:](escrowInformationMetadata, "isEqual:"))
  {
    goto LABEL_55;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](label, "isEqual:")) {
      goto LABEL_55;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 108);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 8) == 0 || self->_silentAttemptAllowed != *((void *)v4 + 4)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x10) == 0 || self->_recordStatus != *((_DWORD *)v4 + 20)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_55;
  }
  recordId = self->_recordId;
  if ((unint64_t)recordId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](recordId, "isEqual:")) {
      goto LABEL_55;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 108);
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_recoveryStatus != *((_DWORD *)v4 + 22)) {
      goto LABEL_55;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_55;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_coolOffEnd != *((void *)v4 + 1)) {
      goto LABEL_55;
    }
  }
  else if (v8)
  {
    goto LABEL_55;
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:")) {
      goto LABEL_55;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 108);
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_recordViability != *((_DWORD *)v4 + 21)) {
      goto LABEL_55;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x80) == 0)
  {
    if ((v8 & 0x80) == 0) {
      goto LABEL_49;
    }
LABEL_55:
    char v13 = 0;
    goto LABEL_56;
  }
  if ((v8 & 0x80) == 0 || self->_viabilityStatus != *((_DWORD *)v4 + 26)) {
    goto LABEL_55;
  }
LABEL_49:
  federationId = self->_federationId;
  if ((unint64_t)federationId | *((void *)v4 + 7)
    && !-[NSString isEqual:](federationId, "isEqual:"))
  {
    goto LABEL_55;
  }
  expectedFederationId = self->_expectedFederationId;
  if ((unint64_t)expectedFederationId | *((void *)v4 + 6)) {
    char v13 = -[NSString isEqual:](expectedFederationId, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_56:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_creationDate;
    *(unsigned char *)(v5 + 108) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_remainingAttempts;
    *(unsigned char *)(v5 + 108) |= 4u;
  }
  id v8 = [(OTEscrowRecordMetadata *)self->_escrowInformationMetadata copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_label copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v10;

  char v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    *(void *)(v6 + 32) = self->_silentAttemptAllowed;
    *(unsigned char *)(v6 + 108) |= 8u;
    char v12 = (char)self->_has;
  }
  if ((v12 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_recordStatus;
    *(unsigned char *)(v6 + 108) |= 0x10u;
  }
  uint64_t v13 = [(NSString *)self->_recordId copyWithZone:a3];
  NSUInteger v14 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v13;

  char v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_recoveryStatus;
    *(unsigned char *)(v6 + 108) |= 0x40u;
    char v15 = (char)self->_has;
  }
  if (v15)
  {
    *(void *)(v6 + 8) = self->_coolOffEnd;
    *(unsigned char *)(v6 + 108) |= 1u;
  }
  uint64_t v16 = [(NSString *)self->_serialNumber copyWithZone:a3];
  unint64_t v17 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v16;

  char v18 = (char)self->_has;
  if ((v18 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 84) = self->_recordViability;
    *(unsigned char *)(v6 + 108) |= 0x20u;
    char v18 = (char)self->_has;
  }
  if (v18 < 0)
  {
    *(_DWORD *)(v6 + 104) = self->_viabilityStatus;
    *(unsigned char *)(v6 + 108) |= 0x80u;
  }
  uint64_t v19 = [(NSString *)self->_federationId copyWithZone:a3];
  unint64_t v20 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v19;

  uint64_t v21 = [(NSString *)self->_expectedFederationId copyWithZone:a3];
  v22 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v21;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_creationDate;
    *((unsigned char *)v4 + 108) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[3] = self->_remainingAttempts;
    *((unsigned char *)v4 + 108) |= 4u;
  }
  uint64_t v9 = v4;
  if (self->_escrowInformationMetadata)
  {
    objc_msgSend(v4, "setEscrowInformationMetadata:");
    id v4 = v9;
  }
  if (self->_label)
  {
    objc_msgSend(v9, "setLabel:");
    id v4 = v9;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[4] = self->_silentAttemptAllowed;
    *((unsigned char *)v4 + 108) |= 8u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_recordStatus;
    *((unsigned char *)v4 + 108) |= 0x10u;
  }
  if (self->_recordId)
  {
    objc_msgSend(v9, "setRecordId:");
    id v4 = v9;
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_recoveryStatus;
    *((unsigned char *)v4 + 108) |= 0x40u;
    char v7 = (char)self->_has;
  }
  if (v7)
  {
    v4[1] = self->_coolOffEnd;
    *((unsigned char *)v4 + 108) |= 1u;
  }
  if (self->_serialNumber)
  {
    objc_msgSend(v9, "setSerialNumber:");
    id v4 = v9;
  }
  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_recordViability;
    *((unsigned char *)v4 + 108) |= 0x20u;
    char v8 = (char)self->_has;
  }
  if (v8 < 0)
  {
    *((_DWORD *)v4 + 26) = self->_viabilityStatus;
    *((unsigned char *)v4 + 108) |= 0x80u;
  }
  if (self->_federationId)
  {
    objc_msgSend(v9, "setFederationId:");
    id v4 = v9;
  }
  if (self->_expectedFederationId)
  {
    objc_msgSend(v9, "setExpectedFederationId:");
    id v4 = v9;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v9 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
  }
  if (self->_escrowInformationMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
  if (self->_recordId)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    char v7 = (char)self->_has;
  }
  if (v7)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
  }
  if (self->_serialNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    char v8 = (char)self->_has;
  }
  if (v8 < 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
  if (self->_federationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_expectedFederationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_creationDate];
    [v3 setObject:v5 forKey:@"creation_date"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    char v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_remainingAttempts];
    [v3 setObject:v6 forKey:@"remaining_attempts"];
  }
  escrowInformationMetadata = self->_escrowInformationMetadata;
  if (escrowInformationMetadata)
  {
    char v8 = [(OTEscrowRecordMetadata *)escrowInformationMetadata dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"escrow_information_metadata"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  char v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_silentAttemptAllowed];
    [v3 setObject:v11 forKey:@"silent_attempt_allowed"];

    char v10 = (char)self->_has;
  }
  if ((v10 & 0x10) != 0)
  {
    int recordStatus = self->_recordStatus;
    if (recordStatus)
    {
      if (recordStatus == 1)
      {
        uint64_t v13 = @"RECORD_STATUS_INVALID";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_recordStatus);
        uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v13 = @"RECORD_STATUS_VALID";
    }
    [v3 setObject:v13 forKey:@"record_status"];
  }
  recordId = self->_recordId;
  if (recordId) {
    [v3 setObject:recordId forKey:@"record_id"];
  }
  char v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    uint64_t recoveryStatus = self->_recoveryStatus;
    if (recoveryStatus >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_recoveryStatus);
      unint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v17 = off_1E58FE420[recoveryStatus];
    }
    [v3 setObject:v17 forKey:@"recovery_status"];

    char v15 = (char)self->_has;
  }
  if (v15)
  {
    char v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_coolOffEnd];
    [v3 setObject:v18 forKey:@"cool_off_end"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v3 setObject:serialNumber forKey:@"serial_number"];
  }
  char v20 = (char)self->_has;
  if ((v20 & 0x20) != 0)
  {
    uint64_t recordViability = self->_recordViability;
    if (recordViability >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_recordViability);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E58FE438[recordViability];
    }
    [v3 setObject:v22 forKey:@"record_viability"];

    char v20 = (char)self->_has;
  }
  if (v20 < 0)
  {
    uint64_t viabilityStatus = self->_viabilityStatus;
    if (viabilityStatus >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_viabilityStatus);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E58FE450[viabilityStatus];
    }
    [v3 setObject:v24 forKey:@"viability_status"];
  }
  federationId = self->_federationId;
  if (federationId) {
    [v3 setObject:federationId forKey:@"federation_id"];
  }
  expectedFederationId = self->_expectedFederationId;
  if (expectedFederationId) {
    [v3 setObject:expectedFederationId forKey:@"expected_federation_id"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTEscrowRecord;
  id v4 = [(OTEscrowRecord *)&v8 description];
  uint64_t v5 = [(OTEscrowRecord *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasExpectedFederationId
{
  return self->_expectedFederationId != 0;
}

- (BOOL)hasFederationId
{
  return self->_federationId != 0;
}

- (int)StringAsViabilityStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SOS_VIABLE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SOS_VIABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SOS_NOT_VIABLE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)viabilityStatusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E58FE450[a3];
  }
  return v3;
}

- (BOOL)hasViabilityStatus
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasViabilityStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (void)setViabilityStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_uint64_t viabilityStatus = a3;
}

- (int)viabilityStatus
{
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    return self->_viabilityStatus;
  }
  else {
    return 0;
  }
}

- (int)StringAsRecordViability:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RECORD_VIABILITY_FULLY_VIABLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RECORD_VIABILITY_PARTIALLY_VIABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RECORD_VIABILITY_LEGACY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)recordViabilityAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E58FE438[a3];
  }
  return v3;
}

- (BOOL)hasRecordViability
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasRecordViability:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setRecordViability:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_uint64_t recordViability = a3;
}

- (int)recordViability
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_recordViability;
  }
  else {
    return 0;
  }
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasCoolOffEnd
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCoolOffEnd:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCoolOffEnd:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_coolOffEnd = a3;
}

- (int)StringAsRecoveryStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RECOVERY_STATUS_VALID"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RECOVERY_STATUS_SOFT_LIMIT_REACHED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RECOVERY_STATUS_HARD_LIMIT_REACHED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)recoveryStatusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E58FE420[a3];
  }
  return v3;
}

- (BOOL)hasRecoveryStatus
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasRecoveryStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setRecoveryStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_uint64_t recoveryStatus = a3;
}

- (int)recoveryStatus
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_recoveryStatus;
  }
  else {
    return 0;
  }
}

- (BOOL)hasRecordId
{
  return self->_recordId != 0;
}

- (int)StringAsRecordStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RECORD_STATUS_VALID"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"RECORD_STATUS_INVALID"];
  }

  return v4;
}

- (id)recordStatusAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"RECORD_STATUS_INVALID";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"RECORD_STATUS_VALID";
  }
  return v4;
}

- (BOOL)hasRecordStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasRecordStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setRecordStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int recordStatus = a3;
}

- (int)recordStatus
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_recordStatus;
  }
  else {
    return 0;
  }
}

- (BOOL)hasSilentAttemptAllowed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSilentAttemptAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setSilentAttemptAllowed:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_silentAttemptAllowed = a3;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasEscrowInformationMetadata
{
  return self->_escrowInformationMetadata != 0;
}

- (BOOL)hasRemainingAttempts
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasRemainingAttempts:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setRemainingAttempts:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_remainingAttempts = a3;
}

- (BOOL)hasCreationDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCreationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCreationDate:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_creationDate = a3;
}

@end