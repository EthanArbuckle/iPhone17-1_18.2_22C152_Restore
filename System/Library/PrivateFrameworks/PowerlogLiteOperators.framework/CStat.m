@interface CStat
- (BOOL)hasActiveDurMs;
- (BOOL)hasIdent;
- (BOOL)hasIdleDurMs;
- (BOOL)hasSleepDurMs;
- (BOOL)hasSleepEntryCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)activeDurMs;
- (unsigned)ident;
- (unsigned)idleDurMs;
- (unsigned)sleepDurMs;
- (unsigned)sleepEntryCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveDurMs:(unsigned int)a3;
- (void)setHasActiveDurMs:(BOOL)a3;
- (void)setHasIdent:(BOOL)a3;
- (void)setHasIdleDurMs:(BOOL)a3;
- (void)setHasSleepDurMs:(BOOL)a3;
- (void)setHasSleepEntryCount:(BOOL)a3;
- (void)setIdent:(unsigned int)a3;
- (void)setIdleDurMs:(unsigned int)a3;
- (void)setSleepDurMs:(unsigned int)a3;
- (void)setSleepEntryCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CStat

- (void)setIdent:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ident = a3;
}

- (void)setHasIdent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIdent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSleepDurMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sleepDurMs = a3;
}

- (void)setHasSleepDurMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSleepDurMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIdleDurMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_idleDurMs = a3;
}

- (void)setHasIdleDurMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIdleDurMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setActiveDurMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activeDurMs = a3;
}

- (void)setHasActiveDurMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActiveDurMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSleepEntryCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_sleepEntryCount = a3;
}

- (void)setHasSleepEntryCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSleepEntryCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CStat;
  v4 = [(CStat *)&v8 description];
  v5 = [(CStat *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_ident];
    [v3 setObject:v7 forKey:@"ident"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_sleepDurMs];
  [v3 setObject:v8 forKey:@"sleep_dur_ms"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithUnsignedInt:self->_idleDurMs];
  [v3 setObject:v9 forKey:@"idle_dur_ms"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithUnsignedInt:self->_activeDurMs];
  [v3 setObject:v10 forKey:@"active_dur_ms"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v5 = [NSNumber numberWithUnsignedInt:self->_sleepEntryCount];
    [v3 setObject:v5 forKey:@"sleep_entry_count"];
  }
LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CStatReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_ident;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_sleepDurMs;
  *((unsigned char *)v4 + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[4] = self->_idleDurMs;
  *((unsigned char *)v4 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[2] = self->_activeDurMs;
  *((unsigned char *)v4 + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v4[6] = self->_sleepEntryCount;
    *((unsigned char *)v4 + 28) |= 0x10u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_ident;
    *((unsigned char *)result + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_sleepDurMs;
  *((unsigned char *)result + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_idleDurMs;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 2) = self->_activeDurMs;
  *((unsigned char *)result + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 6) = self->_sleepEntryCount;
  *((unsigned char *)result + 28) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_ident != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0 || self->_sleepDurMs != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_idleDurMs != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_activeDurMs != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x10) == 0 || self->_sleepEntryCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_ident;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_sleepDurMs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_idleDurMs;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_activeDurMs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_sleepEntryCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_ident = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_sleepDurMs = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_idleDurMs = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_activeDurMs = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
  {
LABEL_6:
    self->_sleepEntryCount = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
}

- (unsigned)ident
{
  return self->_ident;
}

- (unsigned)sleepDurMs
{
  return self->_sleepDurMs;
}

- (unsigned)idleDurMs
{
  return self->_idleDurMs;
}

- (unsigned)activeDurMs
{
  return self->_activeDurMs;
}

- (unsigned)sleepEntryCount
{
  return self->_sleepEntryCount;
}

@end