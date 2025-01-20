@interface NTPBLocalNotificationReturn
- (BOOL)hasLocalNoticationNumberReceived;
- (BOOL)hasLocalNotificationDirectOpen;
- (BOOL)hasLocalNotificationDirectOpenNumber;
- (BOOL)hasLocalNotificationSentTimestamp;
- (BOOL)hasLocalNotificationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)localNotificationDirectOpen;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)localNoticationNumberReceived;
- (int)localNotificationDirectOpenNumber;
- (int)localNotificationType;
- (int64_t)localNotificationSentTimestamp;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasLocalNoticationNumberReceived:(BOOL)a3;
- (void)setHasLocalNotificationDirectOpen:(BOOL)a3;
- (void)setHasLocalNotificationDirectOpenNumber:(BOOL)a3;
- (void)setHasLocalNotificationSentTimestamp:(BOOL)a3;
- (void)setHasLocalNotificationType:(BOOL)a3;
- (void)setLocalNoticationNumberReceived:(int)a3;
- (void)setLocalNotificationDirectOpen:(BOOL)a3;
- (void)setLocalNotificationDirectOpenNumber:(int)a3;
- (void)setLocalNotificationSentTimestamp:(int64_t)a3;
- (void)setLocalNotificationType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBLocalNotificationReturn

- (void)setLocalNotificationDirectOpen:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_localNotificationDirectOpen = a3;
}

- (void)setHasLocalNotificationDirectOpen:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocalNotificationDirectOpen
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLocalNoticationNumberReceived:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_localNoticationNumberReceived = a3;
}

- (void)setHasLocalNoticationNumberReceived:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocalNoticationNumberReceived
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)localNotificationType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_localNotificationType;
  }
  else {
    return 0;
  }
}

- (void)setLocalNotificationType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_localNotificationType = a3;
}

- (void)setHasLocalNotificationType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocalNotificationType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLocalNotificationSentTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_localNotificationSentTimestamp = a3;
}

- (void)setHasLocalNotificationSentTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocalNotificationSentTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLocalNotificationDirectOpenNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_localNotificationDirectOpenNumber = a3;
}

- (void)setHasLocalNotificationDirectOpenNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLocalNotificationDirectOpenNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBLocalNotificationReturn;
  v4 = [(NTPBLocalNotificationReturn *)&v8 description];
  v5 = [(NTPBLocalNotificationReturn *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_localNotificationDirectOpen];
    [v3 setObject:v7 forKey:@"local_notification_direct_open"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithInt:self->_localNoticationNumberReceived];
  [v3 setObject:v8 forKey:@"local_notication_number_received"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithInt:self->_localNotificationType];
  [v3 setObject:v9 forKey:@"local_notification_type"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithLongLong:self->_localNotificationSentTimestamp];
  [v3 setObject:v10 forKey:@"local_notification_sent_timestamp"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v5 = [NSNumber numberWithInt:self->_localNotificationDirectOpenNumber];
    [v3 setObject:v5 forKey:@"local_notification_direct_open_number"];
  }
LABEL_7:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLocalNotificationReturnReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)result + 28) = self->_localNotificationDirectOpen;
    *((unsigned char *)result + 32) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_localNoticationNumberReceived;
  *((unsigned char *)result + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 6) = self->_localNotificationType;
  *((unsigned char *)result + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 1) = self->_localNotificationSentTimestamp;
  *((unsigned char *)result + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 5) = self->_localNotificationDirectOpenNumber;
  *((unsigned char *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
    {
      if (self->_localNotificationDirectOpen)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_29;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_10;
      }
    }
LABEL_29:
    BOOL v5 = 0;
    goto LABEL_30;
  }
  if ((*((unsigned char *)v4 + 32) & 0x10) != 0) {
    goto LABEL_29;
  }
LABEL_10:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_localNoticationNumberReceived != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_localNotificationType != *((_DWORD *)v4 + 6)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_localNotificationSentTimestamp != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_29;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_localNotificationDirectOpenNumber != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
    BOOL v5 = 1;
  }
LABEL_30:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v2 = 2654435761 * self->_localNotificationDirectOpen;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_localNoticationNumberReceived;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_localNotificationType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_localNotificationSentTimestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_localNotificationDirectOpenNumber;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x10) != 0)
  {
    self->_localNotificationDirectOpen = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_localNoticationNumberReceived = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_localNotificationType = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_localNotificationSentTimestamp = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_6:
    self->_localNotificationDirectOpenNumber = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
}

- (BOOL)localNotificationDirectOpen
{
  return self->_localNotificationDirectOpen;
}

- (int)localNoticationNumberReceived
{
  return self->_localNoticationNumberReceived;
}

- (int64_t)localNotificationSentTimestamp
{
  return self->_localNotificationSentTimestamp;
}

- (int)localNotificationDirectOpenNumber
{
  return self->_localNotificationDirectOpenNumber;
}

@end