@interface AWDSafariContactAutoFillDidSelectSetEvent
- (BOOL)hadPreviouslyCustomizedSet;
- (BOOL)hasHadPreviouslyCustomizedSet;
- (BOOL)hasSelectedSet;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)selectedSetAsString:(int)a3;
- (int)StringAsSelectedSet:(id)a3;
- (int)selectedSet;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHadPreviouslyCustomizedSet:(BOOL)a3;
- (void)setHasHadPreviouslyCustomizedSet:(BOOL)a3;
- (void)setHasSelectedSet:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSelectedSet:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariContactAutoFillDidSelectSetEvent

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

- (int)selectedSet
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_selectedSet;
  }
  else {
    return 0;
  }
}

- (void)setSelectedSet:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_selectedSet = a3;
}

- (void)setHasSelectedSet:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSelectedSet
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)selectedSetAsString:(int)a3
{
  if (a3 >= 6) {
    return [NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9D40[a3];
  }
}

- (int)StringAsSelectedSet:(id)a3
{
  if ([a3 isEqualToString:@"HOME_CONTACT"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"WORK_CONTACT"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"PREVIOUSLY_CUSTOMIZED_CONTACT"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NEW_CUSTOMIZED_CONTACT"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"OTHER_CONTACT"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"SINGLE_VALUE_SET"]) {
    return 5;
  }
  return 0;
}

- (void)setHadPreviouslyCustomizedSet:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_hadPreviouslyCustomizedSet = a3;
}

- (void)setHasHadPreviouslyCustomizedSet:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHadPreviouslyCustomizedSet
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariContactAutoFillDidSelectSetEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariContactAutoFillDidSelectSetEvent description](&v3, sel_description), -[AWDSafariContactAutoFillDidSelectSetEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t selectedSet = self->_selectedSet;
    if (selectedSet >= 6) {
      v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_selectedSet];
    }
    else {
      v7 = off_2641B9D40[selectedSet];
    }
    [v3 setObject:v7 forKey:@"selectedSet"];
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    return v3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_hadPreviouslyCustomizedSet] forKey:@"hadPreviouslyCustomizedSet"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariContactAutoFillDidSelectSetEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 4) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return;
      }
LABEL_7:
      *((unsigned char *)a3 + 20) = self->_hadPreviouslyCustomizedSet;
      *((unsigned char *)a3 + 24) |= 4u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_selectedSet;
  *((unsigned char *)a3 + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_selectedSet;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 20) = self->_hadPreviouslyCustomizedSet;
  *((unsigned char *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
      goto LABEL_14;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_selectedSet != *((_DWORD *)a3 + 4)) {
        goto LABEL_14;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
      goto LABEL_14;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 4) == 0)
      {
LABEL_14:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_hadPreviouslyCustomizedSet)
      {
        if (!*((unsigned char *)a3 + 20)) {
          goto LABEL_14;
        }
      }
      else if (*((unsigned char *)a3 + 20))
      {
        goto LABEL_14;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_selectedSet;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_hadPreviouslyCustomizedSet;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 24);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 24);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        return;
      }
LABEL_7:
      self->_hadPreviouslyCustomizedSet = *((unsigned char *)a3 + 20);
      *(unsigned char *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t selectedSet = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 24) & 4) != 0) {
    goto LABEL_7;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)hadPreviouslyCustomizedSet
{
  return self->_hadPreviouslyCustomizedSet;
}

@end