@interface ISOPBSubscriptionLabelMessage
- (BOOL)hasLabel;
- (BOOL)hasMinsUntilICloudNotificationOpened;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)labelAsString:(int)a3;
- (int)StringAsLabel:(id)a3;
- (int)label;
- (int64_t)minsUntilICloudNotificationOpened;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setHasMinsUntilICloudNotificationOpened:(BOOL)a3;
- (void)setLabel:(int)a3;
- (void)setMinsUntilICloudNotificationOpened:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ISOPBSubscriptionLabelMessage

- (void)setMinsUntilICloudNotificationOpened:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minsUntilICloudNotificationOpened = a3;
}

- (void)setHasMinsUntilICloudNotificationOpened:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinsUntilICloudNotificationOpened
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)label
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_label;
  }
  else {
    return 0;
  }
}

- (void)setLabel:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_label = a3;
}

- (void)setHasLabel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLabel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)labelAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264CCCAC0[a3];
  }
  return v3;
}

- (int)StringAsLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LABEL_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CLICK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CLEAR"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ISOPBSubscriptionLabelMessage;
  int v4 = [(ISOPBSubscriptionLabelMessage *)&v8 description];
  v5 = [(ISOPBSubscriptionLabelMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithLongLong:self->_minsUntilICloudNotificationOpened];
    [v3 setObject:v5 forKey:@"minsUntilICloudNotificationOpened"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t label = self->_label;
    if (label >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_label);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_264CCCAC0[label];
    }
    [v3 setObject:v7 forKey:@"label"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ISOPBSubscriptionLabelMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_minsUntilICloudNotificationOpened;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_label;
    *((unsigned char *)v4 + 20) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_minsUntilICloudNotificationOpened;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_label;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_minsUntilICloudNotificationOpened != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_label != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_minsUntilICloudNotificationOpened;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_label;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_minsUntilICloudNotificationOpened = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if ((v5 & 2) != 0)
  {
    self->_uint64_t label = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int64_t)minsUntilICloudNotificationOpened
{
  return self->_minsUntilICloudNotificationOpened;
}

@end