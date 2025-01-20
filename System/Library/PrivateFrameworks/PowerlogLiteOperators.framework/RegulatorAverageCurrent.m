@interface RegulatorAverageCurrent
- (BOOL)hasAverageCurrentMa;
- (BOOL)hasDuration64ms;
- (BOOL)hasRegulatorId;
- (BOOL)hasSampleCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)averageCurrentMa;
- (unsigned)duration64ms;
- (unsigned)regulatorId;
- (unsigned)sampleCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAverageCurrentMa:(unsigned int)a3;
- (void)setDuration64ms:(unsigned int)a3;
- (void)setHasAverageCurrentMa:(BOOL)a3;
- (void)setHasDuration64ms:(BOOL)a3;
- (void)setHasRegulatorId:(BOOL)a3;
- (void)setHasSampleCount:(BOOL)a3;
- (void)setRegulatorId:(unsigned int)a3;
- (void)setSampleCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RegulatorAverageCurrent

- (void)setRegulatorId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_regulatorId = a3;
}

- (void)setHasRegulatorId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRegulatorId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSampleCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sampleCount = a3;
}

- (void)setHasSampleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSampleCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDuration64ms:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration64ms = a3;
}

- (void)setHasDuration64ms:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration64ms
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAverageCurrentMa:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_averageCurrentMa = a3;
}

- (void)setHasAverageCurrentMa:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAverageCurrentMa
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RegulatorAverageCurrent;
  v4 = [(RegulatorAverageCurrent *)&v8 description];
  v5 = [(RegulatorAverageCurrent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_regulatorId];
    [v3 setObject:v7 forKey:@"regulator_id"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_sampleCount];
  [v3 setObject:v8 forKey:@"sample_count"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = [NSNumber numberWithUnsignedInt:self->_duration64ms];
  [v3 setObject:v9 forKey:@"duration_6_4ms"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v5 = [NSNumber numberWithUnsignedInt:self->_averageCurrentMa];
    [v3 setObject:v5 forKey:@"average_current_ma"];
  }
LABEL_6:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RegulatorAverageCurrentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_regulatorId;
    *((unsigned char *)v4 + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_sampleCount;
  *((unsigned char *)v4 + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[3] = self->_duration64ms;
  *((unsigned char *)v4 + 24) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v4[2] = self->_averageCurrentMa;
    *((unsigned char *)v4 + 24) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_regulatorId;
    *((unsigned char *)result + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_sampleCount;
  *((unsigned char *)result + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_duration64ms;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = self->_averageCurrentMa;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_regulatorId != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_sampleCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_duration64ms != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_averageCurrentMa != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_regulatorId;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_sampleCount;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
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
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_duration64ms;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_averageCurrentMa;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_regulatorId = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_sampleCount = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_duration64ms = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 24))
  {
LABEL_5:
    self->_averageCurrentMa = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (unsigned)regulatorId
{
  return self->_regulatorId;
}

- (unsigned)sampleCount
{
  return self->_sampleCount;
}

- (unsigned)duration64ms
{
  return self->_duration64ms;
}

- (unsigned)averageCurrentMa
{
  return self->_averageCurrentMa;
}

@end