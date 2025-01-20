@interface AWDSafariSelectedFavoritesGridItemEvent
- (BOOL)hasDisplayContext;
- (BOOL)hasItemsPerRow;
- (BOOL)hasRow;
- (BOOL)hasSection;
- (BOOL)hasSectionIndex;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayContextAsString:(int)a3;
- (id)sectionAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsDisplayContext:(id)a3;
- (int)StringAsSection:(id)a3;
- (int)StringAsType:(id)a3;
- (int)displayContext;
- (int)section;
- (int)type;
- (unint64_t)hash;
- (unint64_t)itemsPerRow;
- (unint64_t)row;
- (unint64_t)sectionIndex;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayContext:(int)a3;
- (void)setHasDisplayContext:(BOOL)a3;
- (void)setHasItemsPerRow:(BOOL)a3;
- (void)setHasRow:(BOOL)a3;
- (void)setHasSection:(BOOL)a3;
- (void)setHasSectionIndex:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setItemsPerRow:(unint64_t)a3;
- (void)setRow:(unint64_t)a3;
- (void)setSection:(int)a3;
- (void)setSectionIndex:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariSelectedFavoritesGridItemEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRow:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_row = a3;
}

- (void)setHasRow:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRow
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setItemsPerRow:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_itemsPerRow = a3;
}

- (void)setHasItemsPerRow:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasItemsPerRow
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSectionIndex:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sectionIndex = a3;
}

- (void)setHasSectionIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSectionIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9E38[a3];
  }
}

- (int)StringAsType:(id)a3
{
  if ([a3 isEqualToString:@"UNKNOWN_TYPE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"BOOKMARK"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"FOLDER"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"BOOKMARKLET"]) {
    return 3;
  }
  return 0;
}

- (int)displayContext
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_displayContext;
  }
  else {
    return 0;
  }
}

- (void)setDisplayContext:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_displayContext = a3;
}

- (void)setHasDisplayContext:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDisplayContext
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)displayContextAsString:(int)a3
{
  if (!a3) {
    return @"NEW_TAB_PAGE";
  }
  if (a3 == 1) {
    return @"FOCUSED_URL_FIELD";
  }
  return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsDisplayContext:(id)a3
{
  if ([a3 isEqualToString:@"NEW_TAB_PAGE"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"FOCUSED_URL_FIELD"];
  }
}

- (int)section
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_section;
  }
  else {
    return 0;
  }
}

- (void)setSection:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_section = a3;
}

- (void)setHasSection:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSection
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)sectionAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9E58[a3];
  }
}

- (int)StringAsSection:(id)a3
{
  if ([a3 isEqualToString:@"FAVORITES"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"FREQUENTLY_VISITED"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"OTHER_SECTION"]) {
    return 2;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariSelectedFavoritesGridItemEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariSelectedFavoritesGridItemEvent description](&v3, sel_description), -[AWDSafariSelectedFavoritesGridItemEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_row] forKey:@"row"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_itemsPerRow] forKey:@"itemsPerRow"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sectionIndex] forKey:@"sectionIndex"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_13:
  uint64_t type = self->_type;
  if (type >= 4) {
    v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_type];
  }
  else {
    v6 = off_2641B9E38[type];
  }
  [v3 setObject:v6 forKey:@"type"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_23;
  }
LABEL_17:
  int displayContext = self->_displayContext;
  if (displayContext)
  {
    if (displayContext == 1) {
      v8 = @"FOCUSED_URL_FIELD";
    }
    else {
      v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_displayContext];
    }
  }
  else
  {
    v8 = @"NEW_TAB_PAGE";
  }
  [v3 setObject:v8 forKey:@"displayContext"];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_23:
    uint64_t section = self->_section;
    if (section >= 3) {
      v10 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_section];
    }
    else {
      v10 = off_2641B9E58[section];
    }
    [v3 setObject:v10 forKey:@"section"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariSelectedFavoritesGridItemEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_row;
  *((unsigned char *)a3 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((void *)a3 + 1) = self->_itemsPerRow;
  *((unsigned char *)a3 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 3) = self->_sectionIndex;
  *((unsigned char *)a3 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 12) = self->_type;
  *((unsigned char *)a3 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      return;
    }
LABEL_15:
    *((_DWORD *)a3 + 11) = self->_section;
    *((unsigned char *)a3 + 52) |= 0x20u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 10) = self->_displayContext;
  *((unsigned char *)a3 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    goto LABEL_15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)result + 4) = self->_timestamp;
    *((unsigned char *)result + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_row;
  *((unsigned char *)result + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 1) = self->_itemsPerRow;
  *((unsigned char *)result + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 3) = self->_sectionIndex;
  *((unsigned char *)result + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 12) = self->_type;
  *((unsigned char *)result + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_displayContext;
  *((unsigned char *)result + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 11) = self->_section;
  *((unsigned char *)result + 52) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 8) != 0)
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_row != *((void *)a3 + 2)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 2) != 0)
    {
      goto LABEL_36;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_itemsPerRow != *((void *)a3 + 1)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)a3 + 52))
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_sectionIndex != *((void *)a3 + 3)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 4) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x40) == 0 || self->_type != *((_DWORD *)a3 + 12)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x10) == 0 || self->_displayContext != *((_DWORD *)a3 + 10)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x10) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 0x20) == 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x20) == 0 || self->_section != *((_DWORD *)a3 + 11)) {
        goto LABEL_36;
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
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_row;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_itemsPerRow;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_sectionIndex;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_displayContext;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_section;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v3 = *((unsigned char *)a3 + 52);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_row = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_itemsPerRow = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_sectionIndex = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 0x40) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_uint64_t type = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      return;
    }
LABEL_15:
    self->_uint64_t section = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 0x20u;
    return;
  }
LABEL_14:
  self->_int displayContext = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 52) & 0x20) != 0) {
    goto LABEL_15;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)row
{
  return self->_row;
}

- (unint64_t)itemsPerRow
{
  return self->_itemsPerRow;
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

@end