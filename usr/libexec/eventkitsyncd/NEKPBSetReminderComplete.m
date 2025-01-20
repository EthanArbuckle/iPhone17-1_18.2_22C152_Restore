@interface NEKPBSetReminderComplete
- (BOOL)hasCalendarName;
- (BOOL)hasExternalIdentifier;
- (BOOL)hasIsComplete;
- (BOOL)hasReminderTitle;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)calendarName;
- (NSString)externalIdentifier;
- (NSString)reminderTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendarName:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setHasIsComplete:(BOOL)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setReminderTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBSetReminderComplete

- (void)setIsComplete:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isComplete = a3;
}

- (void)setHasIsComplete:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsComplete
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBSetReminderComplete;
  v3 = [(NEKPBSetReminderComplete *)&v7 description];
  v4 = [(NEKPBSetReminderComplete *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithBool:self->_isComplete];
    [v3 setObject:v4 forKey:@"isComplete"];
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

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100032444((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_isComplete;
    v4[36] |= 1u;
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 32) = self->_isComplete;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  id v7 = [(NSString *)self->_calendarName copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = [(NSString *)self->_reminderTitle copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(NSString *)self->_externalIdentifier copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_isComplete)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
LABEL_16:
    unsigned __int8 v8 = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)v4 + 36)) {
    goto LABEL_16;
  }
LABEL_10:
  calendarName = self->_calendarName;
  if ((unint64_t)calendarName | *((void *)v4 + 1)
    && !-[NSString isEqual:](calendarName, "isEqual:"))
  {
    goto LABEL_16;
  }
  reminderTitle = self->_reminderTitle;
  if ((unint64_t)reminderTitle | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](reminderTitle, "isEqual:")) {
      goto LABEL_16;
    }
  }
  externalIdentifier = self->_externalIdentifier;
  if ((unint64_t)externalIdentifier | *((void *)v4 + 2)) {
    unsigned __int8 v8 = -[NSString isEqual:](externalIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isComplete;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_calendarName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_reminderTitle hash];
  return v4 ^ v5 ^ [(NSString *)self->_externalIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[36])
  {
    self->_isComplete = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NEKPBSetReminderComplete setCalendarName:](self, "setCalendarName:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NEKPBSetReminderComplete setReminderTitle:](self, "setReminderTitle:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NEKPBSetReminderComplete setExternalIdentifier:](self, "setExternalIdentifier:");
    unint64_t v4 = v5;
  }
}

- (BOOL)isComplete
{
  return self->_isComplete;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderTitle, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);

  objc_storeStrong((id *)&self->_calendarName, 0);
}

@end