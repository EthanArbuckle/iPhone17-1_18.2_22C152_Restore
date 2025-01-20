@interface AWDCoreRoutineLMPResponseInstance
- (BOOL)hasEventId;
- (BOOL)hasInteraction;
- (BOOL)hasSelected;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)selected;
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
- (void)setHasSelected:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInteraction:(int)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLMPResponseInstance

- (void)dealloc
{
  [(AWDCoreRoutineLMPResponseInstance *)self setEventId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPResponseInstance;
  [(AWDCoreRoutineLMPResponseInstance *)&v3 dealloc];
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

- (void)setSelected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_selected = a3;
}

- (void)setHasSelected:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSelected
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
  v3.super_class = (Class)AWDCoreRoutineLMPResponseInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLMPResponseInstance description](&v3, sel_description), -[AWDCoreRoutineLMPResponseInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_selected] forKey:@"selected"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_interaction] forKey:@"interaction"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPResponseInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_eventId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if (self->_eventId) {
    [a3 setEventId:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)a3 + 28) = self->_selected;
    *((unsigned char *)a3 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_interaction;
    *((unsigned char *)a3 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_eventId copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v6 + 28) = self->_selected;
    *(unsigned char *)(v6 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_interaction;
    *(unsigned char *)(v6 + 32) |= 2u;
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
  if (has)
  {
    if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)a3 + 32))
  {
    goto LABEL_22;
  }
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((void *)a3 + 2))
  {
    int v5 = -[NSString isEqual:](eventId, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) == 0)
  {
    if ((*((unsigned char *)a3 + 32) & 4) != 0) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if ((*((unsigned char *)a3 + 32) & 4) == 0) {
    goto LABEL_22;
  }
  if (self->_selected)
  {
    if (!*((unsigned char *)a3 + 28)) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if (*((unsigned char *)a3 + 28))
  {
LABEL_22:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_interaction != *((_DWORD *)a3 + 6)) {
      goto LABEL_22;
    }
    LOBYTE(v5) = 1;
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
  NSUInteger v4 = [(NSString *)self->_eventId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_selected;
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
  uint64_t v6 = 2654435761 * self->_interaction;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDCoreRoutineLMPResponseInstance setEventId:](self, "setEventId:");
  }
  char v5 = *((unsigned char *)a3 + 32);
  if ((v5 & 4) != 0)
  {
    self->_selected = *((unsigned char *)a3 + 28);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_interaction = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
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

- (BOOL)selected
{
  return self->_selected;
}

- (int)interaction
{
  return self->_interaction;
}

@end