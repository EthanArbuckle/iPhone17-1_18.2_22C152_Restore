@interface NFMProtoPlaySoundRequest
- (BOOL)hasBehaviorOverride;
- (BOOL)hasTimeStamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timeStamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)behaviorOverride;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBehaviorOverride:(int)a3;
- (void)setHasBehaviorOverride:(BOOL)a3;
- (void)setHasTimeStamp:(BOOL)a3;
- (void)setTimeStamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NFMProtoPlaySoundRequest

- (void)setTimeStamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeStamp = a3;
}

- (void)setHasTimeStamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeStamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBehaviorOverride:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_behaviorOverride = a3;
}

- (void)setHasBehaviorOverride:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBehaviorOverride
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NFMProtoPlaySoundRequest;
  v4 = [(NFMProtoPlaySoundRequest *)&v8 description];
  v5 = [(NFMProtoPlaySoundRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithDouble:self->_timeStamp];
    [v3 setObject:v5 forKey:@"timeStamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_behaviorOverride];
    [v3 setObject:v6 forKey:@"behaviorOverride"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NFMProtoPlaySoundRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_timeStamp;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_behaviorOverride;
    *((unsigned char *)v4 + 20) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = *(void *)&self->_timeStamp;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_behaviorOverride;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_timeStamp != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_behaviorOverride != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double timeStamp = self->_timeStamp;
    double v6 = -timeStamp;
    if (timeStamp >= 0.0) {
      double v6 = self->_timeStamp;
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
    uint64_t v9 = 2654435761 * self->_behaviorOverride;
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
    self->_double timeStamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if ((v5 & 2) != 0)
  {
    self->_behaviorOverride = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (int)behaviorOverride
{
  return self->_behaviorOverride;
}

@end