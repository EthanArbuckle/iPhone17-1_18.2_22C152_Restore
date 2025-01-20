@interface NEKPBDeleteEvent
- (BOOL)hasCalendarIdentifier;
- (BOOL)hasCalendarTitle;
- (BOOL)hasEventIdentifier;
- (BOOL)hasEventStart;
- (BOOL)hasEventTitle;
- (BOOL)hasSpan;
- (BOOL)hasStoreIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)calendarIdentifier;
- (NSString)calendarTitle;
- (NSString)eventIdentifier;
- (NSString)eventTitle;
- (NSString)storeIdentifier;
- (double)eventStart;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)span;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendarIdentifier:(id)a3;
- (void)setCalendarTitle:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setEventStart:(double)a3;
- (void)setEventTitle:(id)a3;
- (void)setHasEventStart:(BOOL)a3;
- (void)setHasSpan:(BOOL)a3;
- (void)setSpan:(unsigned int)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBDeleteEvent

- (BOOL)hasEventIdentifier
{
  return self->_eventIdentifier != 0;
}

- (BOOL)hasEventTitle
{
  return self->_eventTitle != 0;
}

- (void)setEventStart:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventStart = a3;
}

- (void)setHasEventStart:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventStart
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCalendarIdentifier
{
  return self->_calendarIdentifier != 0;
}

- (BOOL)hasCalendarTitle
{
  return self->_calendarTitle != 0;
}

- (BOOL)hasStoreIdentifier
{
  return self->_storeIdentifier != 0;
}

- (void)setSpan:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_span = a3;
}

- (void)setHasSpan:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSpan
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBDeleteEvent;
  char v3 = [(NEKPBDeleteEvent *)&v7 description];
  v4 = [(NEKPBDeleteEvent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  eventIdentifier = self->_eventIdentifier;
  if (eventIdentifier) {
    [v3 setObject:eventIdentifier forKey:@"eventIdentifier"];
  }
  eventTitle = self->_eventTitle;
  if (eventTitle) {
    [v4 setObject:eventTitle forKey:@"eventTitle"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithDouble:self->_eventStart];
    [v4 setObject:v7 forKey:@"eventStart"];
  }
  calendarIdentifier = self->_calendarIdentifier;
  if (calendarIdentifier) {
    [v4 setObject:calendarIdentifier forKey:@"calendarIdentifier"];
  }
  calendarTitle = self->_calendarTitle;
  if (calendarTitle) {
    [v4 setObject:calendarTitle forKey:@"calendarTitle"];
  }
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier) {
    [v4 setObject:storeIdentifier forKey:@"storeIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v11 = +[NSNumber numberWithUnsignedInt:self->_span];
    [v4 setObject:v11 forKey:@"span"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000670EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_eventTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_calendarIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_calendarTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_storeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventIdentifier)
  {
    [v4 setEventIdentifier:];
    id v4 = v5;
  }
  if (self->_eventTitle)
  {
    [v5 setEventTitle:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_eventStart;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_calendarIdentifier)
  {
    [v5 setCalendarIdentifier:];
    id v4 = v5;
  }
  if (self->_calendarTitle)
  {
    [v5 setCalendarTitle:];
    id v4 = v5;
  }
  if (self->_storeIdentifier)
  {
    [v5 setStoreIdentifier:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_span;
    *((unsigned char *)v4 + 64) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_eventIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_eventTitle copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_eventStart;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  id v10 = [(NSString *)self->_calendarIdentifier copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(NSString *)self->_calendarTitle copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(NSString *)self->_storeIdentifier copyWithZone:a3];
  v15 = (void *)v5[7];
  v5[7] = v14;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 12) = self->_span;
    *((unsigned char *)v5 + 64) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  eventIdentifier = self->_eventIdentifier;
  if ((unint64_t)eventIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](eventIdentifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  eventTitle = self->_eventTitle;
  if ((unint64_t)eventTitle | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](eventTitle, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_eventStart != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_21:
    BOOL v10 = 0;
    goto LABEL_22;
  }
  calendarIdentifier = self->_calendarIdentifier;
  if ((unint64_t)calendarIdentifier | *((void *)v4 + 2)
    && !-[NSString isEqual:](calendarIdentifier, "isEqual:"))
  {
    goto LABEL_21;
  }
  calendarTitle = self->_calendarTitle;
  if ((unint64_t)calendarTitle | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](calendarTitle, "isEqual:")) {
      goto LABEL_21;
    }
  }
  storeIdentifier = self->_storeIdentifier;
  if ((unint64_t)storeIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](storeIdentifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 64) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_span != *((_DWORD *)v4 + 12)) {
      goto LABEL_21;
    }
    BOOL v10 = 1;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_eventIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_eventTitle hash];
  if (*(unsigned char *)&self->_has)
  {
    double eventStart = self->_eventStart;
    double v7 = -eventStart;
    if (eventStart >= 0.0) {
      double v7 = self->_eventStart;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_calendarIdentifier hash];
  NSUInteger v11 = [(NSString *)self->_calendarTitle hash];
  NSUInteger v12 = [(NSString *)self->_storeIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_span;
  }
  else {
    uint64_t v13 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[NEKPBDeleteEvent setEventIdentifier:](self, "setEventIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NEKPBDeleteEvent setEventTitle:](self, "setEventTitle:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_double eventStart = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[NEKPBDeleteEvent setCalendarIdentifier:](self, "setCalendarIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NEKPBDeleteEvent setCalendarTitle:](self, "setCalendarTitle:");
    id v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[NEKPBDeleteEvent setStoreIdentifier:](self, "setStoreIdentifier:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    self->_span = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
}

- (NSString)eventTitle
{
  return self->_eventTitle;
}

- (void)setEventTitle:(id)a3
{
}

- (double)eventStart
{
  return self->_eventStart;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSString)calendarTitle
{
  return self->_calendarTitle;
}

- (void)setCalendarTitle:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (unsigned)span
{
  return self->_span;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_eventTitle, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_calendarTitle, 0);

  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end