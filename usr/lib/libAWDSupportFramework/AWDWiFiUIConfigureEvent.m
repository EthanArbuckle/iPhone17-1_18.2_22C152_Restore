@interface AWDWiFiUIConfigureEvent
- (BOOL)hasPreviousType;
- (BOOL)hasProcess;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)process;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)previousType;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasPreviousType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPreviousType:(unsigned int)a3;
- (void)setProcess:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiUIConfigureEvent

- (void)dealloc
{
  [(AWDWiFiUIConfigureEvent *)self setProcess:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIConfigureEvent;
  [(AWDWiFiUIConfigureEvent *)&v3 dealloc];
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

- (BOOL)hasProcess
{
  return self->_process != 0;
}

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPreviousType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_previousType = a3;
}

- (void)setHasPreviousType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreviousType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIConfigureEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiUIConfigureEvent description](&v3, sel_description), -[AWDWiFiUIConfigureEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  process = self->_process;
  if (process) {
    [v3 setObject:process forKey:@"process"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_type] forKey:@"type"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_previousType] forKey:@"previousType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiUIConfigureEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_process) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 1u;
  }
  if (self->_process) {
    [a3 setProcess:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_type;
    *((unsigned char *)a3 + 36) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_previousType;
    *((unsigned char *)a3 + 36) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_process copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_type;
    *(unsigned char *)(v6 + 36) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_previousType;
    *(unsigned char *)(v6 + 36) |= 2u;
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
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    process = self->_process;
    if ((unint64_t)process | *((void *)a3 + 3))
    {
      int v5 = -[NSString isEqual:](process, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_type != *((_DWORD *)a3 + 8)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_previousType != *((_DWORD *)a3 + 4)) {
        goto LABEL_19;
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
  NSUInteger v4 = [(NSString *)self->_process hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_previousType;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 36))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDWiFiUIConfigureEvent setProcess:](self, "setProcess:");
  }
  char v5 = *((unsigned char *)a3 + 36);
  if ((v5 & 4) != 0)
  {
    self->_type = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_previousType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)previousType
{
  return self->_previousType;
}

@end