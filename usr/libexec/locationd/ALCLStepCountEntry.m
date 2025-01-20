@interface ALCLStepCountEntry
- (BOOL)hasPace;
- (BOOL)hasRecordId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)regularEntry;
- (double)distance;
- (double)pace;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)recordId;
- (unint64_t)hash;
- (unsigned)count;
- (unsigned)floorsAscended;
- (unsigned)floorsDescended;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setDistance:(double)a3;
- (void)setFloorsAscended:(unsigned int)a3;
- (void)setFloorsDescended:(unsigned int)a3;
- (void)setHasPace:(BOOL)a3;
- (void)setHasRecordId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPace:(double)a3;
- (void)setRecordId:(int)a3;
- (void)setRegularEntry:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLStepCountEntry

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPace:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pace = a3;
}

- (void)setHasPace:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPace
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRecordId:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecordId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLStepCountEntry;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLStepCountEntry *)&v3 description], [(ALCLStepCountEntry *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp)] forKey:@"timestamp"];
  }
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_count)] forKey:@"count"];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_distance)] forKey:@"distance"];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_floorsAscended)] forKey:@"floorsAscended"];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_floorsDescended)] forKey:@"floorsDescended"];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_pace)] forKey:@"pace"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_recordId] forKey:@"recordId"];
  }
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry)] forKey:@"regularEntry"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100464F08((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 3) = *(void *)&self->_timestamp;
    *((unsigned char *)a3 + 52) |= 2u;
  }
  *((_DWORD *)a3 + 8) = self->_count;
  *((void *)a3 + 1) = *(void *)&self->_distance;
  *((_DWORD *)a3 + 9) = self->_floorsAscended;
  *((_DWORD *)a3 + 10) = self->_floorsDescended;
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 2) = *(void *)&self->_pace;
    *((unsigned char *)a3 + 52) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_recordId;
    *((unsigned char *)a3 + 52) |= 4u;
  }
  *((unsigned char *)a3 + 48) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_timestamp;
    *((unsigned char *)result + 52) |= 2u;
  }
  *((_DWORD *)result + 8) = self->_count;
  *((void *)result + 1) = *(void *)&self->_distance;
  *((_DWORD *)result + 9) = self->_floorsAscended;
  *((_DWORD *)result + 10) = self->_floorsDescended;
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 2) = *(void *)&self->_pace;
    *((unsigned char *)result + 52) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 11) = self->_recordId;
    *((unsigned char *)result + 52) |= 4u;
  }
  *((unsigned char *)result + 48) = self->_regularEntry;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_timestamp != *((double *)a3 + 3)) {
        goto LABEL_23;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 2) != 0)
    {
LABEL_23:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (self->_count != *((_DWORD *)a3 + 8)
      || self->_distance != *((double *)a3 + 1)
      || self->_floorsAscended != *((_DWORD *)a3 + 9)
      || self->_floorsDescended != *((_DWORD *)a3 + 10))
    {
      goto LABEL_23;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_pace != *((double *)a3 + 2)) {
        goto LABEL_23;
      }
    }
    else if (*((unsigned char *)a3 + 52))
    {
      goto LABEL_23;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_recordId != *((_DWORD *)a3 + 11)) {
        goto LABEL_23;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 4) != 0)
    {
      goto LABEL_23;
    }
    int v6 = *((unsigned __int8 *)a3 + 48);
    if (self->_regularEntry) {
      LOBYTE(v5) = v6 != 0;
    }
    else {
      LOBYTE(v5) = v6 == 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    double v9 = fmod(v7, 1.84467441e19);
    unint64_t v10 = 2654435761u * (unint64_t)v9;
    unint64_t v11 = v10 + (unint64_t)v8;
    if (v8 <= 0.0) {
      unint64_t v11 = 2654435761u * (unint64_t)v9;
    }
    unint64_t v12 = v10 - (unint64_t)fabs(v8);
    if (v8 < 0.0) {
      unint64_t v4 = v12;
    }
    else {
      unint64_t v4 = v11;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unsigned int count = self->_count;
  double distance = self->_distance;
  double v15 = -distance;
  if (distance >= 0.0) {
    double v15 = self->_distance;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  unint64_t v19 = v18 + (unint64_t)v17;
  double v20 = fabs(v17);
  if (v17 <= 0.0) {
    unint64_t v19 = v18;
  }
  unint64_t v21 = v18 - (unint64_t)v20;
  if (v17 < 0.0) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = v19;
  }
  unsigned int floorsAscended = self->_floorsAscended;
  unsigned int floorsDescended = self->_floorsDescended;
  if (has)
  {
    double pace = self->_pace;
    double v27 = -pace;
    if (pace >= 0.0) {
      double v27 = self->_pace;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
      if ((has & 4) == 0) {
        goto LABEL_28;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
      if ((has & 4) == 0)
      {
LABEL_28:
        uint64_t v30 = 0;
        return (2654435761 * count) ^ (2654435761 * floorsAscended) ^ (2654435761 * floorsDescended) ^ v25 ^ v30 ^ (2654435761 * self->_regularEntry) ^ v4 ^ v22;
      }
    }
  }
  else
  {
    unint64_t v25 = 0;
    if ((has & 4) == 0) {
      goto LABEL_28;
    }
  }
  uint64_t v30 = 2654435761 * self->_recordId;
  return (2654435761 * count) ^ (2654435761 * floorsAscended) ^ (2654435761 * floorsDescended) ^ v25 ^ v30 ^ (2654435761 * self->_regularEntry) ^ v4 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 52) & 2) != 0)
  {
    self->_double timestamp = *((double *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
  self->_unsigned int count = *((_DWORD *)a3 + 8);
  self->_double distance = *((double *)a3 + 1);
  self->_unsigned int floorsAscended = *((_DWORD *)a3 + 9);
  self->_unsigned int floorsDescended = *((_DWORD *)a3 + 10);
  char v3 = *((unsigned char *)a3 + 52);
  if (v3)
  {
    self->_double pace = *((double *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 52);
  }
  if ((v3 & 4) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 4u;
  }
  self->_regularEntry = *((unsigned char *)a3 + 48);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  self->_unsigned int count = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_double distance = a3;
}

- (unsigned)floorsAscended
{
  return self->_floorsAscended;
}

- (void)setFloorsAscended:(unsigned int)a3
{
  self->_unsigned int floorsAscended = a3;
}

- (unsigned)floorsDescended
{
  return self->_floorsDescended;
}

- (void)setFloorsDescended:(unsigned int)a3
{
  self->_unsigned int floorsDescended = a3;
}

- (double)pace
{
  return self->_pace;
}

- (int)recordId
{
  return self->_recordId;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_regularEntry = a3;
}

@end