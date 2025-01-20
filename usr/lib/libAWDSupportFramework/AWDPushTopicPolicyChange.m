@interface AWDPushTopicPolicyChange
- (BOOL)hasChange;
- (BOOL)hasDidCauseFilterChange;
- (BOOL)hasGuid;
- (BOOL)hasTimestamp;
- (BOOL)hasTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (NSString)topic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)change;
- (unsigned)didCauseFilterChange;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChange:(unsigned int)a3;
- (void)setDidCauseFilterChange:(unsigned int)a3;
- (void)setGuid:(id)a3;
- (void)setHasChange:(BOOL)a3;
- (void)setHasDidCauseFilterChange:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTopic:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPushTopicPolicyChange

- (void)dealloc
{
  [(AWDPushTopicPolicyChange *)self setGuid:0];
  [(AWDPushTopicPolicyChange *)self setTopic:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPushTopicPolicyChange;
  [(AWDPushTopicPolicyChange *)&v3 dealloc];
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

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

- (void)setChange:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_change = a3;
}

- (void)setHasChange:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChange
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDidCauseFilterChange:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_didCauseFilterChange = a3;
}

- (void)setHasDidCauseFilterChange:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDidCauseFilterChange
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPushTopicPolicyChange;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPushTopicPolicyChange description](&v3, sel_description), -[AWDPushTopicPolicyChange dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  topic = self->_topic;
  if (topic) {
    [v3 setObject:topic forKey:@"topic"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_change] forKey:@"change"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_didCauseFilterChange] forKey:@"didCauseFilterChange"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushTopicPolicyChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  if (self->_topic) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if (self->_guid) {
    [a3 setGuid:];
  }
  if (self->_topic) {
    [a3 setTopic:];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_change;
    *((unsigned char *)a3 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_didCauseFilterChange;
    *((unsigned char *)a3 + 40) |= 4u;
  }
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

  *(void *)(v6 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  *(void *)(v6 + 32) = [(NSString *)self->_topic copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_change;
    *(unsigned char *)(v6 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_didCauseFilterChange;
    *(unsigned char *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_20;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_20:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if (!((unint64_t)guid | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      topic = self->_topic;
      if (!((unint64_t)topic | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](topic, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 2) != 0)
        {
          if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_change != *((_DWORD *)a3 + 4)) {
            goto LABEL_20;
          }
        }
        else if ((*((unsigned char *)a3 + 40) & 2) != 0)
        {
          goto LABEL_20;
        }
        LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 4) == 0;
        if ((*(unsigned char *)&self->_has & 4) != 0)
        {
          if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_didCauseFilterChange != *((_DWORD *)a3 + 5)) {
            goto LABEL_20;
          }
          LOBYTE(v5) = 1;
        }
      }
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
  NSUInteger v4 = [(NSString *)self->_guid hash];
  NSUInteger v5 = [(NSString *)self->_topic hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_change;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_didCauseFilterChange;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDPushTopicPolicyChange setGuid:](self, "setGuid:");
  }
  if (*((void *)a3 + 4)) {
    -[AWDPushTopicPolicyChange setTopic:](self, "setTopic:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_change = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_didCauseFilterChange = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (unsigned)change
{
  return self->_change;
}

- (unsigned)didCauseFilterChange
{
  return self->_didCauseFilterChange;
}

@end