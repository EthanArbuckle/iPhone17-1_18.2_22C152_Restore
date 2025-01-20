@interface AWDCoreRoutineLMPAutofillSelectedInstance
- (BOOL)hasEventId;
- (BOOL)hasInteraction;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)eventId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)interaction;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEventId:(id)a3;
- (void)setHasInteraction:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInteraction:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLMPAutofillSelectedInstance

- (void)dealloc
{
  [(AWDCoreRoutineLMPAutofillSelectedInstance *)self setEventId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPAutofillSelectedInstance;
  [(AWDCoreRoutineLMPAutofillSelectedInstance *)&v3 dealloc];
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

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (void)setInteraction:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_interaction = a3;
}

- (void)setHasInteraction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInteraction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPAutofillSelectedInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLMPAutofillSelectedInstance description](&v3, sel_description), -[AWDCoreRoutineLMPAutofillSelectedInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  eventId = self->_eventId;
  if (eventId) {
    [v3 setObject:eventId forKey:@"eventId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_interaction] forKey:@"interaction"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPAutofillSelectedInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_eventId)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_interaction;
    *((unsigned char *)a3 + 28) |= 2u;
  }
  eventId = self->_eventId;
  if (eventId) {
    [a3 setEventId:eventId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_interaction;
    *(unsigned char *)(v5 + 28) |= 2u;
  }

  v6[2] = [(NSString *)self->_eventId copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_interaction != *((_DWORD *)a3 + 6)) {
        goto LABEL_14;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_14;
    }
    eventId = self->_eventId;
    if ((unint64_t)eventId | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSString isEqual:](eventId, "isEqual:");
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
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_eventId hash];
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_interaction;
  return v3 ^ v2 ^ [(NSString *)self->_eventId hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
  }
  if ((v3 & 2) != 0)
  {
    self->_interaction = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDCoreRoutineLMPAutofillSelectedInstance setEventId:](self, "setEventId:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
}

- (int)interaction
{
  return self->_interaction;
}

@end