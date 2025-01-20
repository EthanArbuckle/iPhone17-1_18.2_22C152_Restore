@interface AWDWiFiMetricsHealthUIEvent
- (BOOL)hasEventType;
- (BOOL)hasHashCode;
- (BOOL)hasHealthIssues;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)hashCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)healthIssues;
- (unint64_t)timestamp;
- (unsigned)eventType;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEventType:(unsigned int)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasHealthIssues:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHashCode:(id)a3;
- (void)setHealthIssues:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsHealthUIEvent

- (void)dealloc
{
  [(AWDWiFiMetricsHealthUIEvent *)self setHashCode:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsHealthUIEvent;
  [(AWDWiFiMetricsHealthUIEvent *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEventType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHealthIssues:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_healthIssues = a3;
}

- (void)setHasHealthIssues:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHealthIssues
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasHashCode
{
  return self->_hashCode != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsHealthUIEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsHealthUIEvent description](&v3, sel_description), -[AWDWiFiMetricsHealthUIEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_eventType] forKey:@"eventType"];
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_healthIssues] forKey:@"healthIssues"];
LABEL_5:
  hashCode = self->_hashCode;
  if (hashCode) {
    [v3 setObject:hashCode forKey:@"hashCode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsHealthUIEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_hashCode)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_eventType;
  *((unsigned char *)a3 + 40) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)a3 + 1) = self->_healthIssues;
    *((unsigned char *)a3 + 40) |= 1u;
  }
LABEL_5:
  hashCode = self->_hashCode;
  if (hashCode) {
    [a3 setHashCode:hashCode];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 24) = self->_eventType;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_timestamp;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_healthIssues;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
LABEL_5:

  v6[4] = [(NSString *)self->_hashCode copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_eventType != *((_DWORD *)a3 + 6)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_19;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_healthIssues != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_19;
    }
    hashCode = self->_hashCode;
    if ((unint64_t)hashCode | *((void *)a3 + 4))
    {
      LOBYTE(v5) = -[NSString isEqual:](hashCode, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_hashCode hash];
  }
  unint64_t v2 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_eventType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_healthIssues;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_hashCode hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 40);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_eventType = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)a3 + 40))
  {
LABEL_4:
    self->_healthIssues = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)a3 + 4)) {
    -[AWDWiFiMetricsHealthUIEvent setHashCode:](self, "setHashCode:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (unint64_t)healthIssues
{
  return self->_healthIssues;
}

- (NSString)hashCode
{
  return self->_hashCode;
}

- (void)setHashCode:(id)a3
{
}

@end