@interface AWDBltPrimaryDevicePublicationToResponseDelay
- (BOOL)hasConnectionType;
- (BOOL)hasDelayMs;
- (BOOL)hasPublicationDate;
- (BOOL)hasTimestamp;
- (BOOL)hasUniqueid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uniqueid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectionType;
- (unsigned)delayMs;
- (unsigned)publicationDate;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setDelayMs:(unsigned int)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasDelayMs:(BOOL)a3;
- (void)setHasPublicationDate:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPublicationDate:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUniqueid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBltPrimaryDevicePublicationToResponseDelay

- (void)dealloc
{
  [(AWDBltPrimaryDevicePublicationToResponseDelay *)self setUniqueid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDBltPrimaryDevicePublicationToResponseDelay;
  [(AWDBltPrimaryDevicePublicationToResponseDelay *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUniqueid
{
  return self->_uniqueid != 0;
}

- (void)setDelayMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_delayMs = a3;
}

- (void)setHasDelayMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDelayMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPublicationDate:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_publicationDate = a3;
}

- (void)setHasPublicationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPublicationDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDBltPrimaryDevicePublicationToResponseDelay;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDBltPrimaryDevicePublicationToResponseDelay description](&v3, sel_description), -[AWDBltPrimaryDevicePublicationToResponseDelay dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  uniqueid = self->_uniqueid;
  if (uniqueid) {
    [v3 setObject:uniqueid forKey:@"uniqueid"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_delayMs] forKey:@"delayMs"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((has & 8) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_publicationDate] forKey:@"publicationDate"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBltPrimaryDevicePublicationToResponseDelayReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_uniqueid) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_10:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_10;
  }
LABEL_7:
  if ((has & 8) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if (self->_uniqueid) {
    [a3 setUniqueid:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_delayMs;
    *((unsigned char *)a3 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((unsigned char *)a3 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 6) = self->_publicationDate;
  *((unsigned char *)a3 + 40) |= 8u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_uniqueid copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 16) = self->_connectionType;
    *(unsigned char *)(v6 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 20) = self->_delayMs;
  *(unsigned char *)(v6 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_publicationDate;
    *(unsigned char *)(v6 + 40) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    uniqueid = self->_uniqueid;
    if ((unint64_t)uniqueid | *((void *)a3 + 4))
    {
      int v5 = -[NSString isEqual:](uniqueid, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_delayMs != *((_DWORD *)a3 + 5)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
      goto LABEL_24;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_publicationDate != *((_DWORD *)a3 + 6)) {
        goto LABEL_24;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_uniqueid hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_delayMs;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_connectionType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_publicationDate;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDBltPrimaryDevicePublicationToResponseDelay setUniqueid:](self, "setUniqueid:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 4) != 0)
  {
    self->_delayMs = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 40) & 8) == 0) {
    return;
  }
LABEL_8:
  self->_publicationDate = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)uniqueid
{
  return self->_uniqueid;
}

- (void)setUniqueid:(id)a3
{
}

- (unsigned)delayMs
{
  return self->_delayMs;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)publicationDate
{
  return self->_publicationDate;
}

@end