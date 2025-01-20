@interface ABSPBDate
- (BOOL)hasCalendar;
- (BOOL)hasDay;
- (BOOL)hasEra;
- (BOOL)hasIsLeapMonth;
- (BOOL)hasMonth;
- (BOOL)hasYear;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLeapMonth;
- (BOOL)readFrom:(id)a3;
- (id)calendarAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCalendar:(id)a3;
- (int)calendar;
- (int)day;
- (int)era;
- (int)month;
- (int)year;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendar:(int)a3;
- (void)setDay:(int)a3;
- (void)setEra:(int)a3;
- (void)setHasCalendar:(BOOL)a3;
- (void)setHasDay:(BOOL)a3;
- (void)setHasEra:(BOOL)a3;
- (void)setHasIsLeapMonth:(BOOL)a3;
- (void)setHasMonth:(BOOL)a3;
- (void)setHasYear:(BOOL)a3;
- (void)setIsLeapMonth:(BOOL)a3;
- (void)setMonth:(int)a3;
- (void)setYear:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBDate

- (int)calendar
{
  if (*(unsigned char *)&self->_has) {
    return self->_calendar;
  }
  else {
    return 1;
  }
}

- (void)setCalendar:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_calendar = a3;
}

- (void)setHasCalendar:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCalendar
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)calendarAsString:(int)a3
{
  if ((a3 - 1) >= 0x10)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_100055750[a3 - 1];
  }

  return v3;
}

- (int)StringAsCalendar:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GREGORIAN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUDDHIST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHINESE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COPTIC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ETHIOPICAMETEMIHRET"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ETHIOPICAMETEALEM"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"HEBREW"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ISO8601"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"INDIAN"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ISLAMIC"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ISLAMICCIVIL"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"JAPANESE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"PERSIAN"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"REPUBLICOFCHINA"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ISLAMICTABULAR"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ISLAMICUMMALQURA"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setIsLeapMonth:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isLeapMonth = a3;
}

- (void)setHasIsLeapMonth:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsLeapMonth
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEra:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_era = a3;
}

- (void)setHasEra:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEra
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setYear:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_year = a3;
}

- (void)setHasYear:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasYear
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMonth:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_month = a3;
}

- (void)setHasMonth:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMonth
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDay:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_day = a3;
}

- (void)setHasDay:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDay
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBDate;
  char v3 = [(ABSPBDate *)&v7 description];
  int v4 = [(ABSPBDate *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = self->_calendar - 1;
    if (v5 >= 0x10)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_calendar];
    }
    else
    {
      v6 = off_100055750[v5];
    }
    [v3 setObject:v6 forKey:@"calendar"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_isLeapMonth];
    [v3 setObject:v9 forKey:@"isLeapMonth"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_8:
      if ((has & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_8;
  }
  v10 = +[NSNumber numberWithInt:self->_era];
  [v3 setObject:v10 forKey:@"era"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = +[NSNumber numberWithInt:self->_year];
  [v3 setObject:v11 forKey:@"year"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_18:
  v12 = +[NSNumber numberWithInt:self->_month];
  [v3 setObject:v12 forKey:@"month"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_11:
    objc_super v7 = +[NSNumber numberWithInt:self->_day];
    [v3 setObject:v7 forKey:@"day"];
  }
LABEL_12:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBDateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_calendar;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 28) = self->_isLeapMonth;
  *((unsigned char *)v4 + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v4[4] = self->_era;
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[6] = self->_year;
  *((unsigned char *)v4 + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v4[5] = self->_month;
  *((unsigned char *)v4 + 32) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    v4[3] = self->_day;
    *((unsigned char *)v4 + 32) |= 2u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_calendar;
    *((unsigned char *)result + 32) |= 1u;
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
  *((unsigned char *)result + 28) = self->_isLeapMonth;
  *((unsigned char *)result + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_era;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_year;
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 5) = self->_month;
  *((unsigned char *)result + 32) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 3) = self->_day;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_calendar != *((_DWORD *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
    {
      if (self->_isLeapMonth)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_34;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_15;
      }
    }
LABEL_34:
    BOOL v5 = 0;
    goto LABEL_35;
  }
  if ((*((unsigned char *)v4 + 32) & 0x20) != 0) {
    goto LABEL_34;
  }
LABEL_15:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_era != *((_DWORD *)v4 + 4)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_year != *((_DWORD *)v4 + 6)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_month != *((_DWORD *)v4 + 5)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_34;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_day != *((_DWORD *)v4 + 3)) {
      goto LABEL_34;
    }
    BOOL v5 = 1;
  }
LABEL_35:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_calendar;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isLeapMonth;
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
    uint64_t v4 = 2654435761 * self->_era;
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
    uint64_t v5 = 2654435761 * self->_year;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_month;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_day;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_calendar = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_isLeapMonth = *((unsigned char *)v4 + 28);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_era = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_year = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_month = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_7:
    self->_day = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_8:
}

- (BOOL)isLeapMonth
{
  return self->_isLeapMonth;
}

- (int)era
{
  return self->_era;
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

@end