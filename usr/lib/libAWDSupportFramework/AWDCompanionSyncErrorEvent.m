@interface AWDCompanionSyncErrorEvent
- (BOOL)hasError;
- (BOOL)hasSequenceNumber;
- (BOOL)hasService;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorAsString:(int)a3;
- (int)StringAsError:(id)a3;
- (int)error;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setError:(int)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCompanionSyncErrorEvent

- (void)dealloc
{
  [(AWDCompanionSyncErrorEvent *)self setService:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncErrorEvent;
  [(AWDCompanionSyncErrorEvent *)&v3 dealloc];
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

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)error
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_error;
  }
  else {
    return 0;
  }
}

- (void)setError:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasError
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)errorAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B95D0[a3];
  }
}

- (int)StringAsError:(id)a3
{
  if ([a3 isEqualToString:@"None"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"Duplicate"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"OutOfSequence"]) {
    return 2;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncErrorEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCompanionSyncErrorEvent description](&v3, sel_description), -[AWDCompanionSyncErrorEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sequenceNumber] forKey:@"sequence_number"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t error = self->_error;
    if (error >= 3) {
      v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_error];
    }
    else {
      v7 = off_2641B95D0[error];
    }
    [v3 setObject:v7 forKey:@"error"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCompanionSyncErrorEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_service) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 2u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_sequenceNumber;
    *((unsigned char *)a3 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_error;
    *((unsigned char *)a3 + 40) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 2u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_service copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v6 + 8) = self->_sequenceNumber;
    *(unsigned char *)(v6 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_error;
    *(unsigned char *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 2) != 0)
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
    service = self->_service;
    if ((unint64_t)service | *((void *)a3 + 4))
    {
      int v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_sequenceNumber != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_error != *((_DWORD *)a3 + 6)) {
        goto LABEL_19;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_service hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v5 = 2654435761u * self->_sequenceNumber;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_error;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 40) & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDCompanionSyncErrorEvent setService:](self, "setService:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if (v5)
  {
    self->_sequenceNumber = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_uint64_t error = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

@end