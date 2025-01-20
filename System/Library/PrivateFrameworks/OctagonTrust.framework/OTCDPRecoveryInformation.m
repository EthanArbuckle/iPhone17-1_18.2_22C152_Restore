@interface OTCDPRecoveryInformation
- (BOOL)containsIcdpData;
- (BOOL)hasContainsIcdpData;
- (BOOL)hasNonViableRepair;
- (BOOL)hasRecoveryKey;
- (BOOL)hasRecoverySecret;
- (BOOL)hasSilentRecoveryAttempt;
- (BOOL)hasUseCachedSecret;
- (BOOL)hasUsePreviouslyCachedRecoveryKey;
- (BOOL)hasUsesMultipleIcsc;
- (BOOL)isEqual:(id)a3;
- (BOOL)nonViableRepair;
- (BOOL)readFrom:(id)a3;
- (BOOL)silentRecoveryAttempt;
- (BOOL)useCachedSecret;
- (BOOL)usePreviouslyCachedRecoveryKey;
- (BOOL)usesMultipleIcsc;
- (NSString)recoveryKey;
- (NSString)recoverySecret;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainsIcdpData:(BOOL)a3;
- (void)setHasContainsIcdpData:(BOOL)a3;
- (void)setHasNonViableRepair:(BOOL)a3;
- (void)setHasSilentRecoveryAttempt:(BOOL)a3;
- (void)setHasUseCachedSecret:(BOOL)a3;
- (void)setHasUsePreviouslyCachedRecoveryKey:(BOOL)a3;
- (void)setHasUsesMultipleIcsc:(BOOL)a3;
- (void)setNonViableRepair:(BOOL)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setRecoverySecret:(id)a3;
- (void)setSilentRecoveryAttempt:(BOOL)a3;
- (void)setUseCachedSecret:(BOOL)a3;
- (void)setUsePreviouslyCachedRecoveryKey:(BOOL)a3;
- (void)setUsesMultipleIcsc:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTCDPRecoveryInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoverySecret, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
}

- (BOOL)nonViableRepair
{
  return self->_nonViableRepair;
}

- (BOOL)usesMultipleIcsc
{
  return self->_usesMultipleIcsc;
}

- (BOOL)containsIcdpData
{
  return self->_containsIcdpData;
}

- (BOOL)silentRecoveryAttempt
{
  return self->_silentRecoveryAttempt;
}

- (BOOL)usePreviouslyCachedRecoveryKey
{
  return self->_usePreviouslyCachedRecoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (BOOL)useCachedSecret
{
  return self->_useCachedSecret;
}

- (void)setRecoverySecret:(id)a3
{
}

- (NSString)recoverySecret
{
  return self->_recoverySecret;
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[OTCDPRecoveryInformation setRecoverySecret:](self, "setRecoverySecret:");
    v4 = v6;
  }
  if ((v4[32] & 8) != 0)
  {
    self->_useCachedSecret = v4[27];
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 1))
  {
    -[OTCDPRecoveryInformation setRecoveryKey:](self, "setRecoveryKey:");
    v4 = v6;
  }
  BOOL v5 = v4[32];
  if ((v5 & 0x10) != 0)
  {
    self->_usePreviouslyCachedRecoveryKey = v4[28];
    *(unsigned char *)&self->_has |= 0x10u;
    BOOL v5 = v4[32];
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if (!v5) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((v4[32] & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_silentRecoveryAttempt = v4[26];
  *(unsigned char *)&self->_has |= 4u;
  BOOL v5 = v4[32];
  if (!v5)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_containsIcdpData = v4[24];
  *(unsigned char *)&self->_has |= 1u;
  BOOL v5 = v4[32];
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_19:
  self->_usesMultipleIcsc = v4[29];
  *(unsigned char *)&self->_has |= 0x20u;
  if ((v4[32] & 2) != 0)
  {
LABEL_12:
    self->_nonViableRepair = v4[25];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_13:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_recoverySecret hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v4 = 2654435761 * self->_useCachedSecret;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_recoveryKey hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v6 = 2654435761 * self->_usePreviouslyCachedRecoveryKey;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_silentRecoveryAttempt;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_containsIcdpData;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_12:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_usesMultipleIcsc;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_nonViableRepair;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  recoverySecret = self->_recoverySecret;
  if ((unint64_t)recoverySecret | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](recoverySecret, "isEqual:")) {
      goto LABEL_49;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 32);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0) {
      goto LABEL_49;
    }
    if (self->_useCachedSecret)
    {
      if (!*((unsigned char *)v4 + 27)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 27))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_49;
  }
  recoveryKey = self->_recoveryKey;
  if ((unint64_t)recoveryKey | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](recoveryKey, "isEqual:")) {
      goto LABEL_49;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 32);
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0) {
      goto LABEL_49;
    }
    if (self->_usePreviouslyCachedRecoveryKey)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0) {
      goto LABEL_49;
    }
    if (self->_silentRecoveryAttempt)
    {
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 26))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_49;
  }
  if (has)
  {
    if ((v7 & 1) == 0) {
      goto LABEL_49;
    }
    if (self->_containsIcdpData)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_49;
    }
  }
  else if (v7)
  {
    goto LABEL_49;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_49;
    }
    if (self->_usesMultipleIcsc)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  BOOL v9 = (v7 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v7 & 2) != 0)
    {
      if (self->_nonViableRepair)
      {
        if (!*((unsigned char *)v4 + 25)) {
          goto LABEL_49;
        }
      }
      else if (*((unsigned char *)v4 + 25))
      {
        goto LABEL_49;
      }
      BOOL v9 = 1;
      goto LABEL_50;
    }
LABEL_49:
    BOOL v9 = 0;
  }
LABEL_50:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_recoverySecret copyWithZone:a3];
  char v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 27) = self->_useCachedSecret;
    *(unsigned char *)(v5 + 32) |= 8u;
  }
  uint64_t v8 = [(NSString *)self->_recoveryKey copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 28) = self->_usePreviouslyCachedRecoveryKey;
    *(unsigned char *)(v5 + 32) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v5 + 26) = self->_silentRecoveryAttempt;
  *(unsigned char *)(v5 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(unsigned char *)(v5 + 29) = self->_usesMultipleIcsc;
    *(unsigned char *)(v5 + 32) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(unsigned char *)(v5 + 24) = self->_containsIcdpData;
  *(unsigned char *)(v5 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 25) = self->_nonViableRepair;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v6 = v4;
  if (self->_recoverySecret)
  {
    objc_msgSend(v4, "setRecoverySecret:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[27] = self->_useCachedSecret;
    v4[32] |= 8u;
  }
  if (self->_recoveryKey)
  {
    objc_msgSend(v6, "setRecoveryKey:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[28] = self->_usePreviouslyCachedRecoveryKey;
    v4[32] |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v4[26] = self->_silentRecoveryAttempt;
  v4[32] |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[24] = self->_containsIcdpData;
  v4[32] |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_19:
  v4[29] = self->_usesMultipleIcsc;
  v4[32] |= 0x20u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    v4[25] = self->_nonViableRepair;
    v4[32] |= 2u;
  }
LABEL_13:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_recoverySecret)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_recoveryKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_13:
}

- (BOOL)readFrom:(id)a3
{
  return OTCDPRecoveryInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  recoverySecret = self->_recoverySecret;
  if (recoverySecret) {
    [v3 setObject:recoverySecret forKey:@"recovery_secret"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_useCachedSecret];
    [v4 setObject:v6 forKey:@"use_cached_secret"];
  }
  recoveryKey = self->_recoveryKey;
  if (recoveryKey) {
    [v4 setObject:recoveryKey forKey:@"recovery_key"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_usePreviouslyCachedRecoveryKey];
    [v4 setObject:v11 forKey:@"use_previously_cached_recovery_key"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_silentRecoveryAttempt];
  [v4 setObject:v12 forKey:@"silent_recovery_attempt"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_containsIcdpData];
  [v4 setObject:v13 forKey:@"contains_icdp_data"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_19:
  v14 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_usesMultipleIcsc];
  [v4 setObject:v14 forKey:@"uses_multiple_icsc"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    BOOL v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_nonViableRepair];
    [v4 setObject:v9 forKey:@"non_viable_repair"];
  }
LABEL_13:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTCDPRecoveryInformation;
  id v4 = [(OTCDPRecoveryInformation *)&v8 description];
  uint64_t v5 = [(OTCDPRecoveryInformation *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNonViableRepair
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNonViableRepair:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNonViableRepair:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_nonViableRepair = a3;
}

- (BOOL)hasUsesMultipleIcsc
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasUsesMultipleIcsc:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setUsesMultipleIcsc:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_usesMultipleIcsc = a3;
}

- (BOOL)hasContainsIcdpData
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasContainsIcdpData:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setContainsIcdpData:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_containsIcdpData = a3;
}

- (BOOL)hasSilentRecoveryAttempt
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSilentRecoveryAttempt:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setSilentRecoveryAttempt:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_silentRecoveryAttempt = a3;
}

- (BOOL)hasUsePreviouslyCachedRecoveryKey
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasUsePreviouslyCachedRecoveryKey:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setUsePreviouslyCachedRecoveryKey:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_usePreviouslyCachedRecoveryKey = a3;
}

- (BOOL)hasRecoveryKey
{
  return self->_recoveryKey != 0;
}

- (BOOL)hasUseCachedSecret
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasUseCachedSecret:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setUseCachedSecret:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_useCachedSecret = a3;
}

- (BOOL)hasRecoverySecret
{
  return self->_recoverySecret != 0;
}

@end