@interface AWDCoreRoutineLocationAwarenessLocationTimeHistograms
- (AWDCoreRoutineLocationAwarenessBasicHistogram)anyPositiveHistogram;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan10mHistogram;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan200mHistogram;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan20mHistogram;
- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan55mHistogram;
- (BOOL)hasAnyPositiveHistogram;
- (BOOL)hasDuration;
- (BOOL)hasLessThan10mHistogram;
- (BOOL)hasLessThan200mHistogram;
- (BOOL)hasLessThan20mHistogram;
- (BOOL)hasLessThan55mHistogram;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAnyPositiveHistogram:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLessThan10mHistogram:(id)a3;
- (void)setLessThan200mHistogram:(id)a3;
- (void)setLessThan20mHistogram:(id)a3;
- (void)setLessThan55mHistogram:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLocationAwarenessLocationTimeHistograms

- (void)dealloc
{
  [(AWDCoreRoutineLocationAwarenessLocationTimeHistograms *)self setLessThan10mHistogram:0];
  [(AWDCoreRoutineLocationAwarenessLocationTimeHistograms *)self setLessThan20mHistogram:0];
  [(AWDCoreRoutineLocationAwarenessLocationTimeHistograms *)self setLessThan55mHistogram:0];
  [(AWDCoreRoutineLocationAwarenessLocationTimeHistograms *)self setLessThan200mHistogram:0];
  [(AWDCoreRoutineLocationAwarenessLocationTimeHistograms *)self setAnyPositiveHistogram:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessLocationTimeHistograms;
  [(AWDCoreRoutineLocationAwarenessLocationTimeHistograms *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
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

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLessThan10mHistogram
{
  return self->_lessThan10mHistogram != 0;
}

- (BOOL)hasLessThan20mHistogram
{
  return self->_lessThan20mHistogram != 0;
}

- (BOOL)hasLessThan55mHistogram
{
  return self->_lessThan55mHistogram != 0;
}

- (BOOL)hasLessThan200mHistogram
{
  return self->_lessThan200mHistogram != 0;
}

- (BOOL)hasAnyPositiveHistogram
{
  return self->_anyPositiveHistogram != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessLocationTimeHistograms;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
  }
  lessThan10mHistogram = self->_lessThan10mHistogram;
  if (lessThan10mHistogram) {
    [v3 setObject:[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](lessThan10mHistogram, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"LessThan10mHistogram"];
  }
  lessThan20mHistogram = self->_lessThan20mHistogram;
  if (lessThan20mHistogram) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](lessThan20mHistogram, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"LessThan20mHistogram"];
  }
  lessThan55mHistogram = self->_lessThan55mHistogram;
  if (lessThan55mHistogram) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](lessThan55mHistogram, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"LessThan55mHistogram"];
  }
  lessThan200mHistogram = self->_lessThan200mHistogram;
  if (lessThan200mHistogram) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](lessThan200mHistogram, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"LessThan200mHistogram"];
  }
  anyPositiveHistogram = self->_anyPositiveHistogram;
  if (anyPositiveHistogram) {
    [v3 setObject:[[-[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](anyPositiveHistogram, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"AnyPositiveHistogram"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessLocationTimeHistogramsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_lessThan10mHistogram) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lessThan20mHistogram) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lessThan55mHistogram) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lessThan200mHistogram) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_anyPositiveHistogram)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_duration;
    *((unsigned char *)a3 + 64) |= 1u;
  }
  if (self->_lessThan10mHistogram) {
    [a3 setLessThan10mHistogram:];
  }
  if (self->_lessThan20mHistogram) {
    [a3 setLessThan20mHistogram:];
  }
  if (self->_lessThan55mHistogram) {
    [a3 setLessThan55mHistogram:];
  }
  if (self->_lessThan200mHistogram) {
    [a3 setLessThan200mHistogram:];
  }
  if (self->_anyPositiveHistogram)
  {
    [a3 setAnyPositiveHistogram:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 64) |= 1u;
  }

  *(void *)(v6 + 32) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_lessThan10mHistogram copyWithZone:a3];
  *(void *)(v6 + 48) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_lessThan20mHistogram copyWithZone:a3];

  *(void *)(v6 + 56) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_lessThan55mHistogram copyWithZone:a3];
  *(void *)(v6 + 40) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_lessThan200mHistogram copyWithZone:a3];

  *(void *)(v6 + 24) = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_anyPositiveHistogram copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_22;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 2) != 0)
    {
LABEL_22:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
      goto LABEL_22;
    }
    lessThan10mHistogram = self->_lessThan10mHistogram;
    if (!((unint64_t)lessThan10mHistogram | *((void *)a3 + 4))
      || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](lessThan10mHistogram, "isEqual:")) != 0)
    {
      lessThan20mHistogram = self->_lessThan20mHistogram;
      if (!((unint64_t)lessThan20mHistogram | *((void *)a3 + 6))
        || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](lessThan20mHistogram, "isEqual:")) != 0)
      {
        lessThan55mHistogram = self->_lessThan55mHistogram;
        if (!((unint64_t)lessThan55mHistogram | *((void *)a3 + 7))
          || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](lessThan55mHistogram, "isEqual:")) != 0)
        {
          lessThan200mHistogram = self->_lessThan200mHistogram;
          if (!((unint64_t)lessThan200mHistogram | *((void *)a3 + 5))
            || (int v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](lessThan200mHistogram, "isEqual:")) != 0)
          {
            anyPositiveHistogram = self->_anyPositiveHistogram;
            if ((unint64_t)anyPositiveHistogram | *((void *)a3 + 3))
            {
              LOBYTE(v5) = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](anyPositiveHistogram, "isEqual:");
            }
            else
            {
              LOBYTE(v5) = 1;
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v4 = 0;
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_duration;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_lessThan10mHistogram hash];
  unint64_t v6 = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_lessThan20mHistogram hash];
  unint64_t v7 = v5 ^ v6 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_lessThan55mHistogram hash];
  unint64_t v8 = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_lessThan200mHistogram hash];
  return v7 ^ v8 ^ [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self->_anyPositiveHistogram hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 64);
  }
  if (v5)
  {
    self->_duration = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  lessThan10mHistogram = self->_lessThan10mHistogram;
  uint64_t v7 = *((void *)a3 + 4);
  if (lessThan10mHistogram)
  {
    if (v7) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](lessThan10mHistogram, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan10mHistogram:](self, "setLessThan10mHistogram:");
  }
  lessThan20mHistogram = self->_lessThan20mHistogram;
  uint64_t v9 = *((void *)a3 + 6);
  if (lessThan20mHistogram)
  {
    if (v9) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](lessThan20mHistogram, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan20mHistogram:](self, "setLessThan20mHistogram:");
  }
  lessThan55mHistogram = self->_lessThan55mHistogram;
  uint64_t v11 = *((void *)a3 + 7);
  if (lessThan55mHistogram)
  {
    if (v11) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](lessThan55mHistogram, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan55mHistogram:](self, "setLessThan55mHistogram:");
  }
  lessThan200mHistogram = self->_lessThan200mHistogram;
  uint64_t v13 = *((void *)a3 + 5);
  if (lessThan200mHistogram)
  {
    if (v13) {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](lessThan200mHistogram, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan200mHistogram:](self, "setLessThan200mHistogram:");
  }
  anyPositiveHistogram = self->_anyPositiveHistogram;
  uint64_t v15 = *((void *)a3 + 3);
  if (anyPositiveHistogram)
  {
    if (v15)
    {
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](anyPositiveHistogram, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setAnyPositiveHistogram:](self, "setAnyPositiveHistogram:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan10mHistogram
{
  return self->_lessThan10mHistogram;
}

- (void)setLessThan10mHistogram:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan20mHistogram
{
  return self->_lessThan20mHistogram;
}

- (void)setLessThan20mHistogram:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan55mHistogram
{
  return self->_lessThan55mHistogram;
}

- (void)setLessThan55mHistogram:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan200mHistogram
{
  return self->_lessThan200mHistogram;
}

- (void)setLessThan200mHistogram:(id)a3
{
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)anyPositiveHistogram
{
  return self->_anyPositiveHistogram;
}

- (void)setAnyPositiveHistogram:(id)a3
{
}

@end