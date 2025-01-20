@interface NEKPBSetAlarmSnooze
- (BOOL)hasAlarmIdentifier;
- (BOOL)hasCalendarName;
- (BOOL)hasExternalIdentifier;
- (BOOL)hasItemIdentifier;
- (BOOL)hasReminderTitle;
- (BOOL)hasSnoozeAmount;
- (BOOL)hasStoreIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)alarmIdentifier;
- (NSString)calendarName;
- (NSString)externalIdentifier;
- (NSString)itemIdentifier;
- (NSString)reminderTitle;
- (NSString)storeIdentifier;
- (double)snoozeAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlarmIdentifier:(id)a3;
- (void)setCalendarName:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setHasSnoozeAmount:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setReminderTitle:(id)a3;
- (void)setSnoozeAmount:(double)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBSetAlarmSnooze

- (void)setSnoozeAmount:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_snoozeAmount = a3;
}

- (void)setHasSnoozeAmount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSnoozeAmount
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCalendarName
{
  return self->_calendarName != 0;
}

- (BOOL)hasReminderTitle
{
  return self->_reminderTitle != 0;
}

- (BOOL)hasExternalIdentifier
{
  return self->_externalIdentifier != 0;
}

- (BOOL)hasAlarmIdentifier
{
  return self->_alarmIdentifier != 0;
}

- (BOOL)hasItemIdentifier
{
  return self->_itemIdentifier != 0;
}

- (BOOL)hasStoreIdentifier
{
  return self->_storeIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBSetAlarmSnooze;
  v3 = [(NEKPBSetAlarmSnooze *)&v7 description];
  v4 = [(NEKPBSetAlarmSnooze *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithDouble:self->_snoozeAmount];
    [v3 setObject:v4 forKey:@"snoozeAmount"];
  }
  calendarName = self->_calendarName;
  if (calendarName) {
    [v3 setObject:calendarName forKey:@"calendarName"];
  }
  reminderTitle = self->_reminderTitle;
  if (reminderTitle) {
    [v3 setObject:reminderTitle forKey:@"reminderTitle"];
  }
  externalIdentifier = self->_externalIdentifier;
  if (externalIdentifier) {
    [v3 setObject:externalIdentifier forKey:@"externalIdentifier"];
  }
  alarmIdentifier = self->_alarmIdentifier;
  if (alarmIdentifier) {
    [v3 setObject:alarmIdentifier forKey:@"alarmIdentifier"];
  }
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier) {
    [v3 setObject:itemIdentifier forKey:@"itemIdentifier"];
  }
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier) {
    [v3 setObject:storeIdentifier forKey:@"storeIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100052214((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_calendarName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_reminderTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_externalIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_alarmIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_itemIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_storeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_snoozeAmount;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  id v5 = v4;
  if (self->_calendarName)
  {
    [v4 setCalendarName:];
    id v4 = v5;
  }
  if (self->_reminderTitle)
  {
    [v5 setReminderTitle:];
    id v4 = v5;
  }
  if (self->_externalIdentifier)
  {
    [v5 setExternalIdentifier:];
    id v4 = v5;
  }
  if (self->_alarmIdentifier)
  {
    [v5 setAlarmIdentifier:];
    id v4 = v5;
  }
  if (self->_itemIdentifier)
  {
    [v5 setItemIdentifier:];
    id v4 = v5;
  }
  if (self->_storeIdentifier)
  {
    [v5 setStoreIdentifier:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_snoozeAmount;
    *((unsigned char *)v5 + 64) |= 1u;
  }
  id v7 = [(NSString *)self->_calendarName copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(NSString *)self->_reminderTitle copyWithZone:a3];
  v10 = (void *)v6[6];
  v6[6] = v9;

  id v11 = [(NSString *)self->_externalIdentifier copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  id v13 = [(NSString *)self->_alarmIdentifier copyWithZone:a3];
  v14 = (void *)v6[2];
  v6[2] = v13;

  id v15 = [(NSString *)self->_itemIdentifier copyWithZone:a3];
  v16 = (void *)v6[5];
  v6[5] = v15;

  id v17 = [(NSString *)self->_storeIdentifier copyWithZone:a3];
  v18 = (void *)v6[7];
  v6[7] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_snoozeAmount != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    unsigned __int8 v11 = 0;
    goto LABEL_20;
  }
  calendarName = self->_calendarName;
  if ((unint64_t)calendarName | *((void *)v4 + 3)
    && !-[NSString isEqual:](calendarName, "isEqual:"))
  {
    goto LABEL_19;
  }
  reminderTitle = self->_reminderTitle;
  if ((unint64_t)reminderTitle | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](reminderTitle, "isEqual:")) {
      goto LABEL_19;
    }
  }
  externalIdentifier = self->_externalIdentifier;
  if ((unint64_t)externalIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](externalIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  alarmIdentifier = self->_alarmIdentifier;
  if ((unint64_t)alarmIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](alarmIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  itemIdentifier = self->_itemIdentifier;
  if ((unint64_t)itemIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](itemIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  storeIdentifier = self->_storeIdentifier;
  if ((unint64_t)storeIdentifier | *((void *)v4 + 7)) {
    unsigned __int8 v11 = -[NSString isEqual:](storeIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double snoozeAmount = self->_snoozeAmount;
    double v5 = -snoozeAmount;
    if (snoozeAmount >= 0.0) {
      double v5 = self->_snoozeAmount;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(NSString *)self->_calendarName hash] ^ v3;
  NSUInteger v9 = [(NSString *)self->_reminderTitle hash];
  unint64_t v10 = v8 ^ v9 ^ [(NSString *)self->_externalIdentifier hash];
  NSUInteger v11 = [(NSString *)self->_alarmIdentifier hash];
  unint64_t v12 = v11 ^ [(NSString *)self->_itemIdentifier hash];
  return v10 ^ v12 ^ [(NSString *)self->_storeIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if ((_BYTE)v4[8])
  {
    self->_double snoozeAmount = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  double v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NEKPBSetAlarmSnooze setCalendarName:](self, "setCalendarName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[NEKPBSetAlarmSnooze setReminderTitle:](self, "setReminderTitle:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NEKPBSetAlarmSnooze setExternalIdentifier:](self, "setExternalIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NEKPBSetAlarmSnooze setAlarmIdentifier:](self, "setAlarmIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NEKPBSetAlarmSnooze setItemIdentifier:](self, "setItemIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[NEKPBSetAlarmSnooze setStoreIdentifier:](self, "setStoreIdentifier:");
    id v4 = v5;
  }
}

- (double)snoozeAmount
{
  return self->_snoozeAmount;
}

- (NSString)calendarName
{
  return self->_calendarName;
}

- (void)setCalendarName:(id)a3
{
}

- (NSString)reminderTitle
{
  return self->_reminderTitle;
}

- (void)setReminderTitle:(id)a3
{
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSString)alarmIdentifier
{
  return self->_alarmIdentifier;
}

- (void)setAlarmIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_reminderTitle, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_calendarName, 0);

  objc_storeStrong((id *)&self->_alarmIdentifier, 0);
}

@end