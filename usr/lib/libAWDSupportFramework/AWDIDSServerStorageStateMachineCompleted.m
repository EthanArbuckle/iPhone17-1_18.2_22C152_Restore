@interface AWDIDSServerStorageStateMachineCompleted
- (BOOL)hasLinkType;
- (BOOL)hasServiceIdentifier;
- (BOOL)hasTimeTaken;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalMessages;
- (BOOL)hasWasPrimary;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasPrimary;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)linkType;
- (unint64_t)timeTaken;
- (unint64_t)timestamp;
- (unint64_t)totalMessages;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasLinkType:(BOOL)a3;
- (void)setHasTimeTaken:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalMessages:(BOOL)a3;
- (void)setHasWasPrimary:(BOOL)a3;
- (void)setLinkType:(unint64_t)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setTimeTaken:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalMessages:(unint64_t)a3;
- (void)setWasPrimary:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSServerStorageStateMachineCompleted

- (void)dealloc
{
  [(AWDIDSServerStorageStateMachineCompleted *)self setServiceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSServerStorageStateMachineCompleted;
  [(AWDIDSServerStorageStateMachineCompleted *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWasPrimary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_wasPrimary = a3;
}

- (void)setHasWasPrimary:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWasPrimary
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)setTimeTaken:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timeTaken = a3;
}

- (void)setHasTimeTaken:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimeTaken
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalMessages:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_totalMessages = a3;
}

- (void)setHasTotalMessages:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalMessages
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLinkType:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLinkType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSServerStorageStateMachineCompleted;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSServerStorageStateMachineCompleted description](&v3, sel_description), -[AWDIDSServerStorageStateMachineCompleted dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_wasPrimary] forKey:@"wasPrimary"];
  }
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v3 setObject:serviceIdentifier forKey:@"serviceIdentifier"];
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalMessages] forKey:@"totalMessages"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_10;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeTaken] forKey:@"timeTaken"];
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if (v6) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_linkType] forKey:@"linkType"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSServerStorageStateMachineCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_serviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_13;
  }
  PBDataWriterWriteUint64Field();
  char v5 = (char)self->_has;
  if ((v5 & 8) != 0) {
    goto LABEL_12;
  }
LABEL_9:
  if ((v5 & 1) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)a3 + 48) = self->_wasPrimary;
    *((unsigned char *)a3 + 52) |= 0x10u;
  }
  if (self->_serviceIdentifier) {
    [a3 setServiceIdentifier:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timeTaken;
    *((unsigned char *)a3 + 52) |= 2u;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 1) == 0) {
        return;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((void *)a3 + 4) = self->_totalMessages;
  *((unsigned char *)a3 + 52) |= 8u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return;
  }
LABEL_10:
  *((void *)a3 + 1) = self->_linkType;
  *((unsigned char *)a3 + 52) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 48) = self->_wasPrimary;
    *(unsigned char *)(v5 + 52) |= 0x10u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(void *)(v6 + 32) = self->_totalMessages;
    *(unsigned char *)(v6 + 52) |= 8u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
  *(void *)(v6 + 16) = self->_timeTaken;
  *(unsigned char *)(v6 + 52) |= 2u;
  char v8 = (char)self->_has;
  if ((v8 & 8) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if (v8)
  {
LABEL_8:
    *(void *)(v6 + 8) = self->_linkType;
    *(unsigned char *)(v6 + 52) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)a3 + 52) & 0x10) != 0) {
      goto LABEL_32;
    }
    goto LABEL_15;
  }
  if ((*((unsigned char *)a3 + 52) & 0x10) == 0) {
    goto LABEL_32;
  }
  if (self->_wasPrimary)
  {
    if (!*((unsigned char *)a3 + 48)) {
      goto LABEL_32;
    }
    goto LABEL_15;
  }
  if (*((unsigned char *)a3 + 48))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  serviceIdentifier = self->_serviceIdentifier;
  if ((unint64_t)serviceIdentifier | *((void *)a3 + 5))
  {
    int v5 = -[NSString isEqual:](serviceIdentifier, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_timeTaken != *((void *)a3 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_totalMessages != *((void *)a3 + 4)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 8) != 0)
  {
    goto LABEL_32;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_linkType != *((void *)a3 + 1)) {
      goto LABEL_32;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_wasPrimary;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_serviceIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    unint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
LABEL_12:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  }
  unint64_t v6 = 2654435761u * self->_timeTaken;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  unint64_t v7 = 2654435761u * self->_totalMessages;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  unint64_t v8 = 2654435761u * self->_linkType;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 52);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_wasPrimary = *((unsigned char *)a3 + 48);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDIDSServerStorageStateMachineCompleted setServiceIdentifier:](self, "setServiceIdentifier:");
  }
  char v6 = *((unsigned char *)a3 + 52);
  if ((v6 & 2) != 0)
  {
    self->_timeTaken = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)a3 + 52);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 1) == 0) {
        return;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_totalMessages = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 52) & 1) == 0) {
    return;
  }
LABEL_10:
  self->_linkType = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)wasPrimary
{
  return self->_wasPrimary;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (unint64_t)timeTaken
{
  return self->_timeTaken;
}

- (unint64_t)totalMessages
{
  return self->_totalMessages;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

@end