@interface ICIAMLocalNotification
- (BOOL)hasDate;
- (BOOL)hasInterval;
- (BOOL)hasNotification;
- (BOOL)hasTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)notification;
- (double)date;
- (double)interval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)triggerAsString:(int)a3;
- (int)StringAsTrigger:(id)a3;
- (int)trigger;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(double)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasInterval:(BOOL)a3;
- (void)setHasTrigger:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setNotification:(id)a3;
- (void)setTrigger:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMLocalNotification

- (void).cxx_destruct
{
}

- (void)setNotification:(id)a3
{
}

- (NSString)notification
{
  return self->_notification;
}

- (double)interval
{
  return self->_interval;
}

- (double)date
{
  return self->_date;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_trigger = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_date = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_4:
    self->_interval = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[ICIAMLocalNotification setNotification:](self, "setNotification:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_trigger;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double date = self->_date;
  double v6 = -date;
  if (date >= 0.0) {
    double v6 = self->_date;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    double interval = self->_interval;
    double v12 = -interval;
    if (interval >= 0.0) {
      double v12 = self->_interval;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v9 ^ v4 ^ v10 ^ [(NSString *)self->_notification hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_trigger != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_interval != *((double *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  notification = self->_notification;
  if ((unint64_t)notification | *((void *)v4 + 3)) {
    char v6 = -[NSString isEqual:](notification, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 36) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_trigger;
  *(unsigned char *)(v5 + 36) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_interval;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_notification copyWithZone:a3];
  unint64_t v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[8] = self->_trigger;
    *((unsigned char *)v4 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 1) = *(void *)&self->_date;
  *((unsigned char *)v4 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((void *)v4 + 2) = *(void *)&self->_interval;
    *((unsigned char *)v4 + 36) |= 2u;
  }
LABEL_5:
  if (self->_notification)
  {
    char v6 = v4;
    objc_msgSend(v4, "setNotification:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_notification)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMLocalNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    int trigger = self->_trigger;
    if (trigger)
    {
      if (trigger == 1)
      {
        id v6 = @"TimeInterval";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_trigger);
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v6 = @"Calendar";
    }
    [v3 setObject:v6 forKey:@"trigger"];

    char has = (char)self->_has;
  }
  if (has)
  {
    long double v7 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v7 forKey:@"date"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v8 = [NSNumber numberWithDouble:self->_interval];
    [v3 setObject:v8 forKey:@"interval"];
  }
  notification = self->_notification;
  if (notification) {
    [v3 setObject:notification forKey:@"notification"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMLocalNotification;
  id v4 = [(ICIAMLocalNotification *)&v8 description];
  uint64_t v5 = [(ICIAMLocalNotification *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNotification
{
  return self->_notification != 0;
}

- (BOOL)hasInterval
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double interval = a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double date = a3;
}

- (int)StringAsTrigger:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Calendar"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"TimeInterval"];
  }

  return v4;
}

- (id)triggerAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"TimeInterval";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Calendar";
  }
  return v4;
}

- (BOOL)hasTrigger
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTrigger:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int trigger = a3;
}

- (int)trigger
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_trigger;
  }
  else {
    return 0;
  }
}

@end