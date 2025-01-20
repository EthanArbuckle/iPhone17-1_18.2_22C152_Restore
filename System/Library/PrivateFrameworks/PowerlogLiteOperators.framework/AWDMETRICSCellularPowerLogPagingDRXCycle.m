@interface AWDMETRICSCellularPowerLogPagingDRXCycle
- (BOOL)hasFr;
- (BOOL)hasPagingDrxCycle;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)frAsString:(int)a3;
- (int)StringAsFr:(id)a3;
- (int)fr;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)pagingDrxCycle;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFr:(int)a3;
- (void)setHasFr:(BOOL)a3;
- (void)setHasPagingDrxCycle:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPagingDrxCycle:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSCellularPowerLogPagingDRXCycle

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPagingDrxCycle:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_pagingDrxCycle = a3;
}

- (void)setHasPagingDrxCycle:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPagingDrxCycle
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)fr
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_fr;
  }
  else {
    return 0;
  }
}

- (void)setFr:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fr = a3;
}

- (void)setHasFr:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFr
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)frAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6930CE8[a3];
  }
  return v3;
}

- (int)StringAsFr:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUB6"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MMWAVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INVALID"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularPowerLogPagingDRXCycle;
  int v4 = [(AWDMETRICSCellularPowerLogPagingDRXCycle *)&v8 description];
  v5 = [(AWDMETRICSCellularPowerLogPagingDRXCycle *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      v7 = [NSNumber numberWithUnsignedInt:self->_subsId];
      [v3 setObject:v7 forKey:@"subs_id"];

      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_13;
      }
LABEL_9:
      uint64_t fr = self->_fr;
      if (fr >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fr);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E6930CE8[fr];
      }
      [v3 setObject:v9 forKey:@"fr"];

      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithUnsignedInt:self->_pagingDrxCycle];
  [v3 setObject:v6 forKey:@"paging_drx_cycle"];

  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_13:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogPagingDRXCycleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_pagingDrxCycle;
  *((unsigned char *)v4 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v4 + 6) = self->_subsId;
  *((unsigned char *)v4 + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 4) = self->_fr;
    *((unsigned char *)v4 + 28) |= 2u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_pagingDrxCycle;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_subsId;
  *((unsigned char *)result + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 4) = self->_fr;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_pagingDrxCycle != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0 || self->_subsId != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_fr != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_pagingDrxCycle;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_subsId;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_fr;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_pagingDrxCycle = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_subsId = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_5:
    self->_uint64_t fr = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)pagingDrxCycle
{
  return self->_pagingDrxCycle;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end