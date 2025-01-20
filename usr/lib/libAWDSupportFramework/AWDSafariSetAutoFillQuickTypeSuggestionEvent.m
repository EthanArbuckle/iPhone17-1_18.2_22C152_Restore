@interface AWDSafariSetAutoFillQuickTypeSuggestionEvent
- (BOOL)hasCategory;
- (BOOL)hasFormProperty;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)categoryAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formPropertyAsString:(int)a3;
- (int)StringAsCategory:(id)a3;
- (int)StringAsFormProperty:(id)a3;
- (int)category;
- (int)formProperty;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(int)a3;
- (void)setFormProperty:(int)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasFormProperty:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariSetAutoFillQuickTypeSuggestionEvent

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

- (int)category
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_category;
  }
  else {
    return 0;
  }
}

- (void)setCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCategory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)categoryAsString:(int)a3
{
  if (a3 >= 4) {
    return [NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9E70[a3];
  }
}

- (int)StringAsCategory:(id)a3
{
  if ([a3 isEqualToString:@"CREDIT_CARD"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"PASSWORD"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"CONTACT"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"UNKNOWN_CATEGORY"]) {
    return 3;
  }
  return 0;
}

- (int)formProperty
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_formProperty;
  }
  else {
    return 0;
  }
}

- (void)setFormProperty:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_formProperty = a3;
}

- (void)setHasFormProperty:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFormProperty
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)formPropertyAsString:(int)a3
{
  if (a3 >= 0xC) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9E90[a3];
  }
}

- (int)StringAsFormProperty:(id)a3
{
  if ([a3 isEqualToString:@"FIRST_NAME"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"LAST_NAME"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"FULL_NAME"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"BIRTHDAY"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"EMAIL"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"PHONE_NUMBER"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"ADDRESS"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"INSTANT_MESSAGE"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"ORGANIZATION"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"LOGIN_CREDENTIAL"]) {
    return 9;
  }
  if ([a3 isEqualToString:@"CREDIT_CARD_FORM"]) {
    return 10;
  }
  if ([a3 isEqualToString:@"UNKNOWN_PROPERTY"]) {
    return 11;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariSetAutoFillQuickTypeSuggestionEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariSetAutoFillQuickTypeSuggestionEvent description](&v3, sel_description), -[AWDSafariSetAutoFillQuickTypeSuggestionEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return v3;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t category = self->_category;
  if (category >= 4) {
    v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_category];
  }
  else {
    v6 = off_2641B9E70[category];
  }
  [v3 setObject:v6 forKey:@"category"];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    uint64_t formProperty = self->_formProperty;
    if (formProperty >= 0xC) {
      v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_formProperty];
    }
    else {
      v8 = off_2641B9E90[formProperty];
    }
    [v3 setObject:v8 forKey:@"formProperty"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariSetAutoFillQuickTypeSuggestionEventReadFrom((uint64_t)self, (uint64_t)a3);
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

  PBDataWriterWriteInt32Field();
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
      *((_DWORD *)a3 + 5) = self->_formProperty;
      *((unsigned char *)a3 + 24) |= 4u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_category;
  *((unsigned char *)a3 + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
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
  *((_DWORD *)result + 4) = self->_category;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 5) = self->_formProperty;
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
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_category != *((_DWORD *)a3 + 4)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 4) == 0 || self->_formProperty != *((_DWORD *)a3 + 5)) {
        goto LABEL_16;
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
  uint64_t v3 = 2654435761 * self->_category;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_formProperty;
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
      self->_uint64_t formProperty = *((_DWORD *)a3 + 5);
      *(unsigned char *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t category = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 24) & 4) != 0) {
    goto LABEL_7;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end