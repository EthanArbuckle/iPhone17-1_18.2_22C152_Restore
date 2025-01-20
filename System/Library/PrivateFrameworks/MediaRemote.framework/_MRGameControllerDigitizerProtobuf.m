@interface _MRGameControllerDigitizerProtobuf
- (BOOL)hasTimestamp;
- (BOOL)hasTouchDown;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)touchDown;
- (double)x;
- (double)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTouchDown:(BOOL)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTouchDown:(BOOL)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGameControllerDigitizerProtobuf

- (void)setX:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasX
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setY:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasY
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTouchDown:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_touchDown = a3;
}

- (void)setHasTouchDown:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTouchDown
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGameControllerDigitizerProtobuf;
  v4 = [(_MRGameControllerDigitizerProtobuf *)&v8 description];
  v5 = [(_MRGameControllerDigitizerProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_x];
    [v3 setObject:v7 forKey:@"x"];

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
  objc_super v8 = [NSNumber numberWithDouble:self->_y];
  [v3 setObject:v8 forKey:@"y"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = [NSNumber numberWithBool:self->_touchDown];
  [v3 setObject:v9 forKey:@"touchDown"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerDigitizerProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
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
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteUint64Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_x;
    *((unsigned char *)v4 + 36) |= 2u;
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
  v4[3] = *(void *)&self->_y;
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((unsigned char *)v4 + 32) = self->_touchDown;
  *((unsigned char *)v4 + 36) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 36) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_x;
    *((unsigned char *)result + 36) |= 2u;
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
  *((void *)result + 3) = *(void *)&self->_y;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((unsigned char *)result + 32) = self->_touchDown;
  *((unsigned char *)result + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 1) = self->_timestamp;
  *((unsigned char *)result + 36) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_x != *((double *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_y != *((double *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) != 0)
    {
      if (self->_touchDown)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_24;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_20;
      }
    }
LABEL_24:
    BOOL v5 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 36) & 8) != 0) {
    goto LABEL_24;
  }
LABEL_20:
  BOOL v5 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
    BOOL v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double x = self->_x;
    double v6 = -x;
    if (x >= 0.0) {
      double v6 = self->_x;
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
  if ((has & 4) != 0)
  {
    double y = self->_y;
    double v11 = -y;
    if (y >= 0.0) {
      double v11 = self->_y;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 8) != 0)
  {
    uint64_t v14 = 2654435761 * self->_touchDown;
    if (has) {
      goto LABEL_19;
    }
LABEL_21:
    unint64_t v15 = 0;
    return v9 ^ v4 ^ v14 ^ v15;
  }
  uint64_t v14 = 0;
  if ((has & 1) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  unint64_t v15 = 2654435761u * self->_timestamp;
  return v9 ^ v4 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_double x = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double y = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_touchDown = *((unsigned char *)v4 + 32);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_5:
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

- (BOOL)touchDown
{
  return self->_touchDown;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end