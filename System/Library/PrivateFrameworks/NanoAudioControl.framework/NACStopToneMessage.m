@interface NACStopToneMessage
- (BOOL)hasFadeOutDuration;
- (BOOL)hasShouldWaitUntilEndOfCurrentRepetition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldWaitUntilEndOfCurrentRepetition;
- (double)fadeOutDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setHasFadeOutDuration:(BOOL)a3;
- (void)setHasShouldWaitUntilEndOfCurrentRepetition:(BOOL)a3;
- (void)setShouldWaitUntilEndOfCurrentRepetition:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NACStopToneMessage

- (void)setFadeOutDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fadeOutDuration = a3;
}

- (void)setHasFadeOutDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFadeOutDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShouldWaitUntilEndOfCurrentRepetition:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldWaitUntilEndOfCurrentRepetition = a3;
}

- (void)setHasShouldWaitUntilEndOfCurrentRepetition:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldWaitUntilEndOfCurrentRepetition
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NACStopToneMessage;
  v4 = [(NACStopToneMessage *)&v8 description];
  v5 = [(NACStopToneMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithDouble:self->_fadeOutDuration];
    [v3 setObject:v5 forKey:@"fadeOutDuration"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_shouldWaitUntilEndOfCurrentRepetition];
    [v3 setObject:v6 forKey:@"shouldWaitUntilEndOfCurrentRepetition"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NACStopToneMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_fadeOutDuration;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 16) = self->_shouldWaitUntilEndOfCurrentRepetition;
    *((unsigned char *)v4 + 20) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = *(void *)&self->_fadeOutDuration;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 16) = self->_shouldWaitUntilEndOfCurrentRepetition;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_fadeOutDuration != *((double *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_9;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0)
    {
LABEL_9:
      BOOL v5 = 0;
      goto LABEL_10;
    }
    if (self->_shouldWaitUntilEndOfCurrentRepetition)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_9;
    }
    BOOL v5 = 1;
  }
LABEL_10:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double fadeOutDuration = self->_fadeOutDuration;
    double v6 = -fadeOutDuration;
    if (fadeOutDuration >= 0.0) {
      double v6 = self->_fadeOutDuration;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_shouldWaitUntilEndOfCurrentRepetition;
  }
  else {
    uint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_double fadeOutDuration = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if ((v5 & 2) != 0)
  {
    self->_shouldWaitUntilEndOfCurrentRepetition = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (BOOL)shouldWaitUntilEndOfCurrentRepetition
{
  return self->_shouldWaitUntilEndOfCurrentRepetition;
}

@end