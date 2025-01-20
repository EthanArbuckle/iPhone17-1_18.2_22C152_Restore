@interface PPPBDateComponents
- (BOOL)hasCalendarIdentifier;
- (BOOL)hasDay;
- (BOOL)hasMonth;
- (BOOL)hasTimeZoneName;
- (BOOL)hasYear;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)calendarIdentifier;
- (NSString)timeZoneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)day;
- (int)month;
- (int)year;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendarIdentifier:(id)a3;
- (void)setDay:(int)a3;
- (void)setHasDay:(BOOL)a3;
- (void)setHasMonth:(BOOL)a3;
- (void)setHasYear:(BOOL)a3;
- (void)setMonth:(int)a3;
- (void)setTimeZoneName:(id)a3;
- (void)setYear:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBDateComponents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

- (void)setTimeZoneName:(id)a3
{
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (int)year
{
  return self->_year;
}

- (int)month
{
  return self->_month;
}

- (int)day
{
  return self->_day;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_day = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_month = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_4:
    self->_year = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[PPPBDateComponents setCalendarIdentifier:](self, "setCalendarIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[PPPBDateComponents setTimeZoneName:](self, "setTimeZoneName:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_day;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_month;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_year;
LABEL_8:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_calendarIdentifier hash];
  return v6 ^ [(NSString *)self->_timeZoneName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_day != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_month != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_year != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }
  calendarIdentifier = self->_calendarIdentifier;
  if ((unint64_t)calendarIdentifier | *((void *)v4 + 1)
    && !-[NSString isEqual:](calendarIdentifier, "isEqual:"))
  {
    goto LABEL_21;
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](timeZoneName, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_month;
    *(unsigned char *)(v5 + 36) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_day;
  *(unsigned char *)(v5 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_year;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_calendarIdentifier copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  uint64_t v10 = [(NSString *)self->_timeZoneName copyWithZone:a3];
  v11 = (void *)v6[3];
  v6[3] = v10;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_day;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_month;
  *((unsigned char *)v4 + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[8] = self->_year;
    *((unsigned char *)v4 + 36) |= 4u;
  }
LABEL_5:
  NSUInteger v6 = v4;
  if (self->_calendarIdentifier)
  {
    objc_msgSend(v4, "setCalendarIdentifier:");
    id v4 = v6;
  }
  if (self->_timeZoneName)
  {
    objc_msgSend(v6, "setTimeZoneName:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_calendarIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_timeZoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBDateComponentsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithInt:self->_day];
    [v3 setObject:v9 forKey:@"day"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v10 = [NSNumber numberWithInt:self->_month];
  [v3 setObject:v10 forKey:@"month"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = [NSNumber numberWithInt:self->_year];
    [v3 setObject:v5 forKey:@"year"];
  }
LABEL_5:
  calendarIdentifier = self->_calendarIdentifier;
  if (calendarIdentifier) {
    [v3 setObject:calendarIdentifier forKey:@"calendarIdentifier"];
  }
  timeZoneName = self->_timeZoneName;
  if (timeZoneName) {
    [v3 setObject:timeZoneName forKey:@"timeZoneName"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBDateComponents;
  id v4 = [(PPPBDateComponents *)&v8 description];
  uint64_t v5 = [(PPPBDateComponents *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (BOOL)hasCalendarIdentifier
{
  return self->_calendarIdentifier != 0;
}

- (BOOL)hasYear
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasYear:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setYear:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_year = a3;
}

- (BOOL)hasMonth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMonth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMonth:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_month = a3;
}

- (BOOL)hasDay
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDay:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDay:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_day = a3;
}

@end