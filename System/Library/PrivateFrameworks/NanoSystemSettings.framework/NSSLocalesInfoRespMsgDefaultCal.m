@interface NSSLocalesInfoRespMsgDefaultCal
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)calendar;
- (NSString)locale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSLocalesInfoRespMsgDefaultCal

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSLocalesInfoRespMsgDefaultCal;
  v4 = [(NSSLocalesInfoRespMsgDefaultCal *)&v8 description];
  v5 = [(NSSLocalesInfoRespMsgDefaultCal *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  calendar = self->_calendar;
  if (calendar) {
    [v4 setObject:calendar forKey:@"calendar"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSLocalesInfoRespMsgDefaultCalReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  locale = self->_locale;
  id v5 = a3;
  [v5 setLocale:locale];
  [v5 setCalendar:self->_calendar];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_locale copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_calendar copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((locale = self->_locale, !((unint64_t)locale | v4[2]))
     || -[NSString isEqual:](locale, "isEqual:")))
  {
    calendar = self->_calendar;
    if ((unint64_t)calendar | v4[1]) {
      char v7 = -[NSString isEqual:](calendar, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_locale hash];
  return [(NSString *)self->_calendar hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NSSLocalesInfoRespMsgDefaultCal setLocale:](self, "setLocale:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NSSLocalesInfoRespMsgDefaultCal setCalendar:](self, "setCalendar:");
    v4 = v5;
  }
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end