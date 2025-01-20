@interface AWDCoreRoutineLocationTypeItem
- (BOOL)hasLocationType;
- (BOOL)hasPercentage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)locationType;
- (int)percentage;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasPercentage:(BOOL)a3;
- (void)setLocationType:(int)a3;
- (void)setPercentage:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLocationTypeItem

- (void)setLocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPercentage:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_percentage = a3;
}

- (void)setHasPercentage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPercentage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationTypeItem;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLocationTypeItem description](&v3, sel_description), -[AWDCoreRoutineLocationTypeItem dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_locationType] forKey:@"locationType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_percentage] forKey:@"percentage"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationTypeItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
LABEL_5:
    *((_DWORD *)a3 + 3) = self->_percentage;
    *((unsigned char *)a3 + 16) |= 2u;
    return;
  }
  *((_DWORD *)a3 + 2) = self->_locationType;
  *((unsigned char *)a3 + 16) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_locationType;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_percentage;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 16) & 1) == 0 || self->_locationType != *((_DWORD *)a3 + 2)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 16))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 16) & 2) == 0 || self->_percentage != *((_DWORD *)a3 + 3)) {
        goto LABEL_11;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_locationType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_percentage;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 16) & 1) == 0)
  {
    if ((*((unsigned char *)a3 + 16) & 2) == 0) {
      return;
    }
LABEL_5:
    self->_percentage = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
  self->_locationType = *((_DWORD *)a3 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 16) & 2) != 0) {
    goto LABEL_5;
  }
}

- (int)locationType
{
  return self->_locationType;
}

- (int)percentage
{
  return self->_percentage;
}

@end