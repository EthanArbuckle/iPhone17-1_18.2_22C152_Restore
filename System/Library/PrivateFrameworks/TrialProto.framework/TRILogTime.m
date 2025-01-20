@interface TRILogTime
+ (id)logTimeFromDate:(id)a3;
- (BOOL)hasMinutesDstOffset;
- (BOOL)hasSecondsFromUtc;
- (BOOL)hasSecondsSince1970;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)minutesDstOffset;
- (int)secondsFromUtc;
- (unint64_t)hash;
- (unint64_t)secondsSince1970;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMinutesDstOffset:(BOOL)a3;
- (void)setHasSecondsFromUtc:(BOOL)a3;
- (void)setHasSecondsSince1970:(BOOL)a3;
- (void)setMinutesDstOffset:(int)a3;
- (void)setSecondsFromUtc:(int)a3;
- (void)setSecondsSince1970:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRILogTime

- (void)setSecondsSince1970:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_secondsSince1970 = a3;
}

- (void)setHasSecondsSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecondsSince1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSecondsFromUtc:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_secondsFromUtc = a3;
}

- (void)setHasSecondsFromUtc:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecondsFromUtc
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMinutesDstOffset:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minutesDstOffset = a3;
}

- (void)setHasMinutesDstOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinutesDstOffset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRILogTime;
  v4 = [(TRILogTime *)&v8 description];
  v5 = [(TRILogTime *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_secondsSince1970];
    [v3 setObject:v7 forKey:@"seconds_since_1970"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithInt:self->_secondsFromUtc];
  [v3 setObject:v8 forKey:@"seconds_from_utc"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithInt:self->_minutesDstOffset];
    [v3 setObject:v5 forKey:@"minutes_dst_offset"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogTimeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_secondsSince1970;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_secondsFromUtc;
  *((unsigned char *)v4 + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 4) = self->_minutesDstOffset;
    *((unsigned char *)v4 + 24) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_secondsSince1970;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_secondsFromUtc;
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_minutesDstOffset;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_secondsSince1970 != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_secondsFromUtc != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_minutesDstOffset != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_secondsSince1970;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_secondsFromUtc;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_minutesDstOffset;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_secondsSince1970 = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_secondsFromUtc = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_4:
    self->_minutesDstOffset = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unint64_t)secondsSince1970
{
  return self->_secondsSince1970;
}

- (int)secondsFromUtc
{
  return self->_secondsFromUtc;
}

- (int)minutesDstOffset
{
  return self->_minutesDstOffset;
}

+ (id)logTimeFromDate:(id)a3
{
  [a3 timeIntervalSince1970];
  double v4 = v3;
  char v5 = objc_opt_new();
  [v5 setSecondsSince1970:(unint64_t)v4];
  id v6 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  objc_msgSend(v5, "setSecondsFromUtc:", objc_msgSend(v6, "secondsFromGMT"));
  [v6 daylightSavingTimeOffset];
  [v5 setMinutesDstOffset:((int)v7 / 60)];

  return v5;
}

@end