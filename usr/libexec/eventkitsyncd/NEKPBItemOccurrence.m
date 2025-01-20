@interface NEKPBItemOccurrence
- (BOOL)hasCalendar;
- (BOOL)hasDate;
- (BOOL)hasSummary;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)calendar;
- (NSString)summary;
- (NSString)uuid;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setDate:(double)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setSummary:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBItemOccurrence

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasSummary
{
  return self->_summary != 0;
}

- (BOOL)hasCalendar
{
  return self->_calendar != 0;
}

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBItemOccurrence;
  v3 = [(NEKPBItemOccurrence *)&v7 description];
  v4 = [(NEKPBItemOccurrence *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  summary = self->_summary;
  if (summary) {
    [v4 setObject:summary forKey:@"summary"];
  }
  calendar = self->_calendar;
  if (calendar) {
    [v4 setObject:calendar forKey:@"calendar"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = +[NSNumber numberWithDouble:self->_date];
    [v4 setObject:v8 forKey:@"date"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100060C80((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_summary)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_calendar)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuid)
  {
    [v4 setUuid:];
    id v4 = v5;
  }
  if (self->_summary)
  {
    [v5 setSummary:];
    id v4 = v5;
  }
  if (self->_calendar)
  {
    [v5 setCalendar:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_date;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_uuid copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_summary copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSString *)self->_calendar copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_date;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_12;
    }
  }
  summary = self->_summary;
  if ((unint64_t)summary | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](summary, "isEqual:")) {
      goto LABEL_12;
    }
  }
  calendar = self->_calendar;
  if ((unint64_t)calendar | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](calendar, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_date == *((double *)v4 + 1))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  NSUInteger v4 = [(NSString *)self->_summary hash];
  NSUInteger v5 = [(NSString *)self->_calendar hash];
  if (*(unsigned char *)&self->_has)
  {
    double date = self->_date;
    double v8 = -date;
    if (date >= 0.0) {
      double v8 = self->_date;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[NEKPBItemOccurrence setUuid:](self, "setUuid:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NEKPBItemOccurrence setSummary:](self, "setSummary:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NEKPBItemOccurrence setCalendar:](self, "setCalendar:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[5])
  {
    self->_double date = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSString)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (double)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end