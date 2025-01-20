@interface AWDCoreRoutineTransitionMotionType
- (BOOL)hasCoreRoutineTransitionMotionTypeAutomotive;
- (BOOL)hasCoreRoutineTransitionMotionTypeCycling;
- (BOOL)hasCoreRoutineTransitionMotionTypeRunning;
- (BOOL)hasCoreRoutineTransitionMotionTypeStationary;
- (BOOL)hasCoreRoutineTransitionMotionTypeUnknown;
- (BOOL)hasCoreRoutineTransitionMotionTypeWalking;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)coreRoutineTransitionMotionTypeAutomotive;
- (unsigned)coreRoutineTransitionMotionTypeCycling;
- (unsigned)coreRoutineTransitionMotionTypeRunning;
- (unsigned)coreRoutineTransitionMotionTypeStationary;
- (unsigned)coreRoutineTransitionMotionTypeUnknown;
- (unsigned)coreRoutineTransitionMotionTypeWalking;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoreRoutineTransitionMotionTypeAutomotive:(unsigned int)a3;
- (void)setCoreRoutineTransitionMotionTypeCycling:(unsigned int)a3;
- (void)setCoreRoutineTransitionMotionTypeRunning:(unsigned int)a3;
- (void)setCoreRoutineTransitionMotionTypeStationary:(unsigned int)a3;
- (void)setCoreRoutineTransitionMotionTypeUnknown:(unsigned int)a3;
- (void)setCoreRoutineTransitionMotionTypeWalking:(unsigned int)a3;
- (void)setHasCoreRoutineTransitionMotionTypeAutomotive:(BOOL)a3;
- (void)setHasCoreRoutineTransitionMotionTypeCycling:(BOOL)a3;
- (void)setHasCoreRoutineTransitionMotionTypeRunning:(BOOL)a3;
- (void)setHasCoreRoutineTransitionMotionTypeStationary:(BOOL)a3;
- (void)setHasCoreRoutineTransitionMotionTypeUnknown:(BOOL)a3;
- (void)setHasCoreRoutineTransitionMotionTypeWalking:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineTransitionMotionType

- (void)setCoreRoutineTransitionMotionTypeStationary:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_coreRoutineTransitionMotionTypeStationary = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeStationary:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeStationary
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCoreRoutineTransitionMotionTypeWalking:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_coreRoutineTransitionMotionTypeWalking = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeWalking:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeWalking
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCoreRoutineTransitionMotionTypeRunning:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_coreRoutineTransitionMotionTypeRunning = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeRunning:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeRunning
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCoreRoutineTransitionMotionTypeAutomotive:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_coreRoutineTransitionMotionTypeAutomotive = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeAutomotive:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeAutomotive
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCoreRoutineTransitionMotionTypeCycling:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_coreRoutineTransitionMotionTypeCycling = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeCycling:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeCycling
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCoreRoutineTransitionMotionTypeUnknown:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_coreRoutineTransitionMotionTypeUnknown = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeUnknown:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeUnknown
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineTransitionMotionType;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineTransitionMotionType description](&v3, sel_description), -[AWDCoreRoutineTransitionMotionType dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_coreRoutineTransitionMotionTypeStationary] forKey:@"CoreRoutineTransitionMotionTypeStationary"];
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_coreRoutineTransitionMotionTypeWalking] forKey:@"CoreRoutineTransitionMotionTypeWalking"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_coreRoutineTransitionMotionTypeRunning] forKey:@"CoreRoutineTransitionMotionTypeRunning"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_coreRoutineTransitionMotionTypeCycling] forKey:@"CoreRoutineTransitionMotionTypeCycling"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_coreRoutineTransitionMotionTypeAutomotive] forKey:@"CoreRoutineTransitionMotionTypeAutomotive"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 0x10) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_coreRoutineTransitionMotionTypeUnknown] forKey:@"CoreRoutineTransitionMotionTypeUnknown"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineTransitionMotionTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_coreRoutineTransitionMotionTypeStationary;
    *((unsigned char *)a3 + 32) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_coreRoutineTransitionMotionTypeWalking;
  *((unsigned char *)a3 + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)a3 + 4) = self->_coreRoutineTransitionMotionTypeRunning;
  *((unsigned char *)a3 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 2) = self->_coreRoutineTransitionMotionTypeAutomotive;
  *((unsigned char *)a3 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_13:
    *((_DWORD *)a3 + 6) = self->_coreRoutineTransitionMotionTypeUnknown;
    *((unsigned char *)a3 + 32) |= 0x10u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 3) = self->_coreRoutineTransitionMotionTypeCycling;
  *((unsigned char *)a3 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_coreRoutineTransitionMotionTypeStationary;
    *((unsigned char *)result + 32) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_coreRoutineTransitionMotionTypeWalking;
  *((unsigned char *)result + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_coreRoutineTransitionMotionTypeRunning;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 2) = self->_coreRoutineTransitionMotionTypeAutomotive;
  *((unsigned char *)result + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 3) = self->_coreRoutineTransitionMotionTypeCycling;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 6) = self->_coreRoutineTransitionMotionTypeUnknown;
  *((unsigned char *)result + 32) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 8) == 0 || self->_coreRoutineTransitionMotionTypeStationary != *((_DWORD *)a3 + 5)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 8) != 0)
    {
LABEL_31:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 0x20) == 0 || self->_coreRoutineTransitionMotionTypeWalking != *((_DWORD *)a3 + 7)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 0x20) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_coreRoutineTransitionMotionTypeRunning != *((_DWORD *)a3 + 4)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 4) != 0)
    {
      goto LABEL_31;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_coreRoutineTransitionMotionTypeAutomotive != *((_DWORD *)a3 + 2)) {
        goto LABEL_31;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_coreRoutineTransitionMotionTypeCycling != *((_DWORD *)a3 + 3)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
      goto LABEL_31;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 0x10) == 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 0x10) == 0 || self->_coreRoutineTransitionMotionTypeUnknown != *((_DWORD *)a3 + 6)) {
        goto LABEL_31;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_coreRoutineTransitionMotionTypeStationary;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_coreRoutineTransitionMotionTypeWalking;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_coreRoutineTransitionMotionTypeRunning;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_coreRoutineTransitionMotionTypeAutomotive;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_coreRoutineTransitionMotionTypeCycling;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_coreRoutineTransitionMotionTypeUnknown;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 8) != 0)
  {
    self->_coreRoutineTransitionMotionTypeStationary = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 8u;
    char v3 = *((unsigned char *)a3 + 32);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_coreRoutineTransitionMotionTypeWalking = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  self->_coreRoutineTransitionMotionTypeRunning = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_coreRoutineTransitionMotionTypeAutomotive = *((_DWORD *)a3 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_13:
    self->_coreRoutineTransitionMotionTypeUnknown = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_12:
  self->_coreRoutineTransitionMotionTypeCycling = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 32) & 0x10) != 0) {
    goto LABEL_13;
  }
}

- (unsigned)coreRoutineTransitionMotionTypeStationary
{
  return self->_coreRoutineTransitionMotionTypeStationary;
}

- (unsigned)coreRoutineTransitionMotionTypeWalking
{
  return self->_coreRoutineTransitionMotionTypeWalking;
}

- (unsigned)coreRoutineTransitionMotionTypeRunning
{
  return self->_coreRoutineTransitionMotionTypeRunning;
}

- (unsigned)coreRoutineTransitionMotionTypeAutomotive
{
  return self->_coreRoutineTransitionMotionTypeAutomotive;
}

- (unsigned)coreRoutineTransitionMotionTypeCycling
{
  return self->_coreRoutineTransitionMotionTypeCycling;
}

- (unsigned)coreRoutineTransitionMotionTypeUnknown
{
  return self->_coreRoutineTransitionMotionTypeUnknown;
}

@end