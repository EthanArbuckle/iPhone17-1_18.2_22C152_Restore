@interface NPKProtoCommutePlanReminderForCommutePlanAndPassResponse
- (BOOL)hasErrorData;
- (BOOL)hasPending;
- (BOOL)hasReminderInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (double)reminderInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setHasReminderInterval:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setReminderInterval:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCommutePlanReminderForCommutePlanAndPassResponse

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPending
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setReminderInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reminderInterval = a3;
}

- (void)setHasReminderInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReminderInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCommutePlanReminderForCommutePlanAndPassResponse;
  v4 = [(NPKProtoCommutePlanReminderForCommutePlanAndPassResponse *)&v8 description];
  v5 = [(NPKProtoCommutePlanReminderForCommutePlanAndPassResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v5 forKey:@"pending"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithDouble:self->_reminderInterval];
    [v3 setObject:v6 forKey:@"reminderInterval"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCommutePlanReminderForCommutePlanAndPassResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[24] = self->_pending;
    v4[28] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_reminderInterval;
    v4[28] |= 1u;
  }
  if (self->_errorData)
  {
    id v6 = v4;
    objc_msgSend(v4, "setErrorData:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_pending;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_reminderInterval;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) != 0)
    {
      if (self->_pending)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_17;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_17:
    char v6 = 0;
    goto LABEL_18;
  }
  if ((*((unsigned char *)v4 + 28) & 2) != 0) {
    goto LABEL_17;
  }
LABEL_10:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_reminderInterval != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_17;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](errorData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_18:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_pending;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ [(NSData *)self->_errorData hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double reminderInterval = self->_reminderInterval;
  double v5 = -reminderInterval;
  if (reminderInterval >= 0.0) {
    double v5 = self->_reminderInterval;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ [(NSData *)self->_errorData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_pending = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_double reminderInterval = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[NPKProtoCommutePlanReminderForCommutePlanAndPassResponse setErrorData:](self, "setErrorData:");
    id v4 = v6;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (double)reminderInterval
{
  return self->_reminderInterval;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end