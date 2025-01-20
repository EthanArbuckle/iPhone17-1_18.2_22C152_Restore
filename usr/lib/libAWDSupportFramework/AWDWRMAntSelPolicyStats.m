@interface AWDWRMAntSelPolicyStats
- (BOOL)hasAntConstraint;
- (BOOL)hasHasAntConstraint;
- (BOOL)hasIsCoexBand;
- (BOOL)hasIssueBand;
- (BOOL)hasIssueType;
- (BOOL)hasTimestamp;
- (BOOL)isCoexBand;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)issueBand;
- (unsigned)issueType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasAntConstraint:(BOOL)a3;
- (void)setHasHasAntConstraint:(BOOL)a3;
- (void)setHasIsCoexBand:(BOOL)a3;
- (void)setHasIssueBand:(BOOL)a3;
- (void)setHasIssueType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsCoexBand:(BOOL)a3;
- (void)setIssueBand:(unsigned int)a3;
- (void)setIssueType:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWRMAntSelPolicyStats

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

- (void)setIssueBand:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_issueBand = a3;
}

- (void)setHasIssueBand:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIssueBand
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIssueType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_issueType = a3;
}

- (void)setHasIssueType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIssueType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsCoexBand:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isCoexBand = a3;
}

- (void)setHasIsCoexBand:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsCoexBand
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasAntConstraint:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_hasAntConstraint = a3;
}

- (void)setHasHasAntConstraint:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasAntConstraint
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMAntSelPolicyStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWRMAntSelPolicyStats description](&v3, sel_description), -[AWDWRMAntSelPolicyStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_issueBand] forKey:@"IssueBand"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithBool:self->_isCoexBand] forKey:@"IsCoexBand"];
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_issueType] forKey:@"IssueType"];
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 8) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_hasAntConstraint] forKey:@"hasAntConstraint"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMAntSelPolicyStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 8) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_issueBand;
  *((unsigned char *)a3 + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 5) = self->_issueType;
  *((unsigned char *)a3 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return;
    }
LABEL_11:
    *((unsigned char *)a3 + 24) = self->_hasAntConstraint;
    *((unsigned char *)a3 + 28) |= 8u;
    return;
  }
LABEL_10:
  *((unsigned char *)a3 + 25) = self->_isCoexBand;
  *((unsigned char *)a3 + 28) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_issueBand;
  *((unsigned char *)result + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 5) = self->_issueType;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 25) = self->_isCoexBand;
  *((unsigned char *)result + 28) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 24) = self->_hasAntConstraint;
  *((unsigned char *)result + 28) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)a3 + 28))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_issueBand != *((_DWORD *)a3 + 4)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_issueType != *((_DWORD *)a3 + 5)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 0x10) != 0)
    {
      if (self->_isCoexBand)
      {
        if (!*((unsigned char *)a3 + 25)) {
          goto LABEL_27;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)a3 + 25)) {
        goto LABEL_25;
      }
    }
LABEL_27:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 28) & 0x10) != 0) {
    goto LABEL_27;
  }
LABEL_25:
  LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_hasAntConstraint)
    {
      if (!*((unsigned char *)a3 + 24)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
      goto LABEL_27;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_issueBand;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_issueType;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_isCoexBand;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_hasAntConstraint;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_issueBand = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_issueType = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_11:
    self->_hasAntConstraint = *((unsigned char *)a3 + 24);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
LABEL_10:
  self->_isCoexBand = *((unsigned char *)a3 + 25);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 28) & 8) != 0) {
    goto LABEL_11;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)issueBand
{
  return self->_issueBand;
}

- (unsigned)issueType
{
  return self->_issueType;
}

- (BOOL)isCoexBand
{
  return self->_isCoexBand;
}

- (BOOL)hasAntConstraint
{
  return self->_hasAntConstraint;
}

@end