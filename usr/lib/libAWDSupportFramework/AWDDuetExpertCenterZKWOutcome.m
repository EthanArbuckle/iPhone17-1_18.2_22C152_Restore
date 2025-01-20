@interface AWDDuetExpertCenterZKWOutcome
- (BOOL)engaged;
- (BOOL)hasEgress;
- (BOOL)hasEngaged;
- (BOOL)hasExpert;
- (BOOL)hasItemSelected;
- (BOOL)hasItemsShown;
- (BOOL)hasSameCategorySelected;
- (BOOL)hasTimestamp;
- (BOOL)hasTypedQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)itemSelected;
- (BOOL)readFrom:(id)a3;
- (BOOL)sameCategorySelected;
- (BOOL)typedQuery;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)egress;
- (unint64_t)expert;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)itemsShown;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEgress:(unint64_t)a3;
- (void)setEngaged:(BOOL)a3;
- (void)setExpert:(unint64_t)a3;
- (void)setHasEgress:(BOOL)a3;
- (void)setHasEngaged:(BOOL)a3;
- (void)setHasExpert:(BOOL)a3;
- (void)setHasItemSelected:(BOOL)a3;
- (void)setHasItemsShown:(BOOL)a3;
- (void)setHasSameCategorySelected:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTypedQuery:(BOOL)a3;
- (void)setItemSelected:(BOOL)a3;
- (void)setItemsShown:(unsigned int)a3;
- (void)setSameCategorySelected:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTypedQuery:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDDuetExpertCenterZKWOutcome

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setExpert:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_expert = a3;
}

- (void)setHasExpert:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpert
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEngaged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_engaged = a3;
}

- (void)setHasEngaged:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEngaged
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setItemsShown:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_itemsShown = a3;
}

- (void)setHasItemsShown:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasItemsShown
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTypedQuery:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_typedQuery = a3;
}

- (void)setHasTypedQuery:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTypedQuery
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setItemSelected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_itemSelected = a3;
}

- (void)setHasItemSelected:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasItemSelected
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEgress:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_egress = a3;
}

- (void)setHasEgress:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEgress
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSameCategorySelected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_sameCategorySelected = a3;
}

- (void)setHasSameCategorySelected:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSameCategorySelected
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDDuetExpertCenterZKWOutcome;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDDuetExpertCenterZKWOutcome description](&v3, sel_description), -[AWDDuetExpertCenterZKWOutcome dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_expert] forKey:@"expert"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithBool:self->_engaged] forKey:@"engaged"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_itemsShown] forKey:@"itemsShown"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithBool:self->_typedQuery] forKey:@"typedQuery"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_egress] forKey:@"egress"];
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithBool:self->_itemSelected] forKey:@"itemSelected"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 0x40) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_sameCategorySelected] forKey:@"sameCategorySelected"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDuetExpertCenterZKWOutcomeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_16;
  }
LABEL_8:
  if ((has & 0x40) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_expert;
  *((unsigned char *)a3 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)a3 + 36) = self->_engaged;
  *((unsigned char *)a3 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 8) = self->_itemsShown;
  *((unsigned char *)a3 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)a3 + 39) = self->_typedQuery;
  *((unsigned char *)a3 + 40) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)a3 + 37) = self->_itemSelected;
  *((unsigned char *)a3 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      return;
    }
LABEL_17:
    *((unsigned char *)a3 + 38) = self->_sameCategorySelected;
    *((unsigned char *)a3 + 40) |= 0x40u;
    return;
  }
LABEL_16:
  *((void *)a3 + 1) = self->_egress;
  *((unsigned char *)a3 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_timestamp;
    *((unsigned char *)result + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_expert;
  *((unsigned char *)result + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 36) = self->_engaged;
  *((unsigned char *)result + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 8) = self->_itemsShown;
  *((unsigned char *)result + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)result + 39) = self->_typedQuery;
  *((unsigned char *)result + 40) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)result + 37) = self->_itemSelected;
  *((unsigned char *)result + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((void *)result + 1) = self->_egress;
  *((unsigned char *)result + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_9:
  *((unsigned char *)result + 38) = self->_sameCategorySelected;
  *((unsigned char *)result + 40) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_expert != *((void *)a3 + 2)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 0x10) == 0) {
      goto LABEL_48;
    }
    if (self->_engaged)
    {
      if (!*((unsigned char *)a3 + 36)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_itemsShown != *((_DWORD *)a3 + 8)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 0x80) == 0) {
      goto LABEL_48;
    }
    if (self->_typedQuery)
    {
      if (!*((unsigned char *)a3 + 39)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)a3 + 39))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 0x80) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 0x20) != 0)
    {
      if (self->_itemSelected)
      {
        if (!*((unsigned char *)a3 + 37)) {
          goto LABEL_48;
        }
        goto LABEL_41;
      }
      if (!*((unsigned char *)a3 + 37)) {
        goto LABEL_41;
      }
    }
LABEL_48:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 40) & 0x20) != 0) {
    goto LABEL_48;
  }
LABEL_41:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_egress != *((void *)a3 + 1)) {
      goto LABEL_48;
    }
  }
  else if (*((unsigned char *)a3 + 40))
  {
    goto LABEL_48;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 0x40) == 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)a3 + 40) & 0x40) == 0) {
      goto LABEL_48;
    }
    if (self->_sameCategorySelected)
    {
      if (!*((unsigned char *)a3 + 38)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)a3 + 38))
    {
      goto LABEL_48;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_expert;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_engaged;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_itemsShown;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_typedQuery;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_itemSelected;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_16:
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_egress;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_sameCategorySelected;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 40);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_expert = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_engaged = *((unsigned char *)a3 + 36);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_itemsShown = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_typedQuery = *((unsigned char *)a3 + 39);
  *(unsigned char *)&self->_has |= 0x80u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_itemSelected = *((unsigned char *)a3 + 37);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 1) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0) {
      return;
    }
LABEL_17:
    self->_sameCategorySelected = *((unsigned char *)a3 + 38);
    *(unsigned char *)&self->_has |= 0x40u;
    return;
  }
LABEL_16:
  self->_egress = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 40) & 0x40) != 0) {
    goto LABEL_17;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)expert
{
  return self->_expert;
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (unsigned)itemsShown
{
  return self->_itemsShown;
}

- (BOOL)typedQuery
{
  return self->_typedQuery;
}

- (BOOL)itemSelected
{
  return self->_itemSelected;
}

- (unint64_t)egress
{
  return self->_egress;
}

- (BOOL)sameCategorySelected
{
  return self->_sameCategorySelected;
}

@end