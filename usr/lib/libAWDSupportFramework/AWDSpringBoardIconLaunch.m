@interface AWDSpringBoardIconLaunch
- (BOOL)hasIconIsFolder;
- (BOOL)hasIconIsFromDock;
- (BOOL)hasIconIsFromFolder;
- (BOOL)hasIconPageInFolder;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalIconPagesInFolder;
- (BOOL)iconIsFolder;
- (BOOL)iconIsFromDock;
- (BOOL)iconIsFromFolder;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)iconPageInFolder;
- (unint64_t)timestamp;
- (unint64_t)totalIconPagesInFolder;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIconIsFolder:(BOOL)a3;
- (void)setHasIconIsFromDock:(BOOL)a3;
- (void)setHasIconIsFromFolder:(BOOL)a3;
- (void)setHasIconPageInFolder:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalIconPagesInFolder:(BOOL)a3;
- (void)setIconIsFolder:(BOOL)a3;
- (void)setIconIsFromDock:(BOOL)a3;
- (void)setIconIsFromFolder:(BOOL)a3;
- (void)setIconPageInFolder:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalIconPagesInFolder:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardIconLaunch

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

- (void)setIconIsFolder:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_iconIsFolder = a3;
}

- (void)setHasIconIsFolder:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIconIsFolder
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIconIsFromFolder:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_iconIsFromFolder = a3;
}

- (void)setHasIconIsFromFolder:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIconIsFromFolder
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIconIsFromDock:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_iconIsFromDock = a3;
}

- (void)setHasIconIsFromDock:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIconIsFromDock
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIconPageInFolder:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_iconPageInFolder = a3;
}

- (void)setHasIconPageInFolder:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIconPageInFolder
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTotalIconPagesInFolder:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalIconPagesInFolder = a3;
}

- (void)setHasTotalIconPagesInFolder:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalIconPagesInFolder
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardIconLaunch;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardIconLaunch description](&v3, sel_description), -[AWDSpringBoardIconLaunch dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_iconIsFolder] forKey:@"iconIsFolder"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithBool:self->_iconIsFromFolder] forKey:@"iconIsFromFolder"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_iconPageInFolder] forKey:@"iconPageInFolder"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithBool:self->_iconIsFromDock] forKey:@"iconIsFromDock"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 4) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalIconPagesInFolder] forKey:@"totalIconPagesInFolder"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardIconLaunchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_12;
  }
LABEL_6:
  if ((has & 4) == 0) {
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
    *((unsigned char *)a3 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 32) = self->_iconIsFolder;
  *((unsigned char *)a3 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)a3 + 34) = self->_iconIsFromFolder;
  *((unsigned char *)a3 + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)a3 + 33) = self->_iconIsFromDock;
  *((unsigned char *)a3 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      return;
    }
LABEL_13:
    *((void *)a3 + 3) = self->_totalIconPagesInFolder;
    *((unsigned char *)a3 + 36) |= 4u;
    return;
  }
LABEL_12:
  *((void *)a3 + 1) = self->_iconPageInFolder;
  *((unsigned char *)a3 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((unsigned char *)result + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 32) = self->_iconIsFolder;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 34) = self->_iconIsFromFolder;
  *((unsigned char *)result + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 33) = self->_iconIsFromDock;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)result + 1) = self->_iconPageInFolder;
  *((unsigned char *)result + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_7:
  *((void *)result + 3) = self->_totalIconPagesInFolder;
  *((unsigned char *)result + 36) |= 4u;
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
    if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 36) & 8) == 0) {
      goto LABEL_40;
    }
    if (self->_iconIsFolder)
    {
      if (!*((unsigned char *)a3 + 32)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 36) & 0x20) == 0) {
      goto LABEL_40;
    }
    if (self->_iconIsFromFolder)
    {
      if (!*((unsigned char *)a3 + 34)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)a3 + 34))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)a3 + 36) & 0x10) != 0) {
      goto LABEL_40;
    }
    goto LABEL_31;
  }
  if ((*((unsigned char *)a3 + 36) & 0x10) == 0) {
    goto LABEL_40;
  }
  if (self->_iconIsFromDock)
  {
    if (!*((unsigned char *)a3 + 33)) {
      goto LABEL_40;
    }
    goto LABEL_31;
  }
  if (*((unsigned char *)a3 + 33))
  {
LABEL_40:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_31:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_iconPageInFolder != *((void *)a3 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)a3 + 36))
  {
    goto LABEL_40;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_totalIconPagesInFolder != *((void *)a3 + 3)) {
      goto LABEL_40;
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
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_iconIsFolder;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_iconIsFromFolder;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_iconIsFromDock;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_12:
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_iconPageInFolder;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_totalIconPagesInFolder;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_iconIsFolder = *((unsigned char *)a3 + 32);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  self->_iconIsFromFolder = *((unsigned char *)a3 + 34);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_iconIsFromDock = *((unsigned char *)a3 + 33);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_13:
    self->_totalIconPagesInFolder = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    return;
  }
LABEL_12:
  self->_iconPageInFolder = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 36) & 4) != 0) {
    goto LABEL_13;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)iconIsFolder
{
  return self->_iconIsFolder;
}

- (BOOL)iconIsFromFolder
{
  return self->_iconIsFromFolder;
}

- (BOOL)iconIsFromDock
{
  return self->_iconIsFromDock;
}

- (unint64_t)iconPageInFolder
{
  return self->_iconPageInFolder;
}

- (unint64_t)totalIconPagesInFolder
{
  return self->_totalIconPagesInFolder;
}

@end