@interface AWDSpringBoardClawGesture
- (BOOL)didPressLock;
- (BOOL)didPressVolumeDown;
- (BOOL)didPressVolumeUp;
- (BOOL)didTriggerSOS;
- (BOOL)hasDidPressLock;
- (BOOL)hasDidPressVolumeDown;
- (BOOL)hasDidPressVolumeUp;
- (BOOL)hasDidTriggerSOS;
- (BOOL)hasDuration;
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
- (void)mergeFrom:(id)a3;
- (void)setDidPressLock:(BOOL)a3;
- (void)setDidPressVolumeDown:(BOOL)a3;
- (void)setDidPressVolumeUp:(BOOL)a3;
- (void)setDidTriggerSOS:(BOOL)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDidPressLock:(BOOL)a3;
- (void)setHasDidPressVolumeDown:(BOOL)a3;
- (void)setHasDidPressVolumeUp:(BOOL)a3;
- (void)setHasDidTriggerSOS:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardClawGesture

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

- (void)setDidPressLock:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_didPressLock = a3;
}

- (void)setHasDidPressLock:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDidPressLock
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDidPressVolumeUp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_didPressVolumeUp = a3;
}

- (void)setHasDidPressVolumeUp:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDidPressVolumeUp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDidPressVolumeDown:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_didPressVolumeDown = a3;
}

- (void)setHasDidPressVolumeDown:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDidPressVolumeDown
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDidTriggerSOS:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_didTriggerSOS = a3;
}

- (void)setHasDidTriggerSOS:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDidTriggerSOS
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardClawGesture;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardClawGesture description](&v3, sel_description), -[AWDSpringBoardClawGesture dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_didPressLock] forKey:@"didPressLock"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithBool:self->_didPressVolumeUp] forKey:@"didPressVolumeUp"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithBool:self->_didTriggerSOS] forKey:@"didTriggerSOS"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithBool:self->_didPressVolumeDown] forKey:@"didPressVolumeDown"];
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if (has) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardClawGestureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((has & 1) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 24) = self->_didPressLock;
  *((unsigned char *)a3 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)a3 + 26) = self->_didPressVolumeUp;
  *((unsigned char *)a3 + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)a3 + 25) = self->_didPressVolumeDown;
  *((unsigned char *)a3 + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      return;
    }
LABEL_13:
    *((void *)a3 + 1) = self->_duration;
    *((unsigned char *)a3 + 28) |= 1u;
    return;
  }
LABEL_12:
  *((unsigned char *)a3 + 27) = self->_didTriggerSOS;
  *((unsigned char *)a3 + 28) |= 0x20u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((unsigned char *)result + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 24) = self->_didPressLock;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 26) = self->_didPressVolumeUp;
  *((unsigned char *)result + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 25) = self->_didPressVolumeDown;
  *((unsigned char *)result + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)result + 27) = self->_didTriggerSOS;
  *((unsigned char *)result + 28) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_7:
  *((void *)result + 1) = self->_duration;
  *((unsigned char *)result + 28) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 4) == 0) {
      goto LABEL_43;
    }
    if (self->_didPressLock)
    {
      if (!*((unsigned char *)a3 + 24)) {
        goto LABEL_43;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 0x10) == 0) {
      goto LABEL_43;
    }
    if (self->_didPressVolumeUp)
    {
      if (!*((unsigned char *)a3 + 26)) {
        goto LABEL_43;
      }
    }
    else if (*((unsigned char *)a3 + 26))
    {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 8) == 0) {
      goto LABEL_43;
    }
    if (self->_didPressVolumeDown)
    {
      if (!*((unsigned char *)a3 + 25)) {
        goto LABEL_43;
      }
    }
    else if (*((unsigned char *)a3 + 25))
    {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 8) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    if ((*((unsigned char *)a3 + 28) & 0x20) != 0) {
      goto LABEL_43;
    }
    goto LABEL_39;
  }
  if ((*((unsigned char *)a3 + 28) & 0x20) == 0) {
    goto LABEL_43;
  }
  if (self->_didTriggerSOS)
  {
    if (!*((unsigned char *)a3 + 27)) {
      goto LABEL_43;
    }
    goto LABEL_39;
  }
  if (*((unsigned char *)a3 + 27))
  {
LABEL_43:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_39:
  LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
      goto LABEL_43;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_didPressLock;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
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
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_didPressVolumeUp;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_didPressVolumeDown;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_didTriggerSOS;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_duration;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_didPressLock = *((unsigned char *)a3 + 24);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  self->_didPressVolumeUp = *((unsigned char *)a3 + 26);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_didPressVolumeDown = *((unsigned char *)a3 + 25);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_13:
    self->_duration = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
LABEL_12:
  self->_didTriggerSOS = *((unsigned char *)a3 + 27);
  *(unsigned char *)&self->_has |= 0x20u;
  if (*((unsigned char *)a3 + 28)) {
    goto LABEL_13;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)didPressLock
{
  return self->_didPressLock;
}

- (BOOL)didPressVolumeUp
{
  return self->_didPressVolumeUp;
}

- (BOOL)didPressVolumeDown
{
  return self->_didPressVolumeDown;
}

- (BOOL)didTriggerSOS
{
  return self->_didTriggerSOS;
}

- (unint64_t)duration
{
  return self->_duration;
}

@end