@interface AWDPushFilterChanged
- (BOOL)hasChangedReason;
- (BOOL)hasChangedTopicsCount;
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
- (unsigned)changedReason;
- (unsigned)changedTopicsCount;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChangedReason:(unsigned int)a3;
- (void)setChangedTopicsCount:(unsigned int)a3;
- (void)setGuid:(id)a3;
- (void)setHasChangedReason:(BOOL)a3;
- (void)setHasChangedTopicsCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTopic:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPushFilterChanged

- (void)dealloc
{
  [(AWDPushFilterChanged *)self setGuid:0];
  [(AWDPushFilterChanged *)self setTopic:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPushFilterChanged;
  [(AWDPushFilterChanged *)&v3 dealloc];
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

- (void)setChangedReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_changedReason = a3;
}

- (void)setHasChangedReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChangedReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setChangedTopicsCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_changedTopicsCount = a3;
}

- (void)setHasChangedTopicsCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasChangedTopicsCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPushFilterChanged;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPushFilterChanged description](&v3, sel_description), -[AWDPushFilterChanged dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_changedReason] forKey:@"changedReason"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_changedTopicsCount] forKey:@"changedTopicsCount"];
  }
  topic = self->_topic;
  if (topic) {
    [v3 setObject:topic forKey:@"topic"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushFilterChangedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_topic)
  {
    PBDataWriterWriteStringField();
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_changedReason;
    *((unsigned char *)a3 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_changedTopicsCount;
    *((unsigned char *)a3 + 40) |= 4u;
  }
  if (self->_topic)
  {
    [a3 setTopic:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_changedReason;
    *(unsigned char *)(v6 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_changedTopicsCount;
    *(unsigned char *)(v6 + 40) |= 4u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_topic copyWithZone:a3];
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
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_22:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((void *)a3 + 3))
    {
      int v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_changedReason != *((_DWORD *)a3 + 4)) {
        goto LABEL_22;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
      goto LABEL_22;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_changedTopicsCount != *((_DWORD *)a3 + 5)) {
        goto LABEL_22;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_22;
    }
    topic = self->_topic;
    if ((unint64_t)topic | *((void *)a3 + 4))
    {
      LOBYTE(v5) = -[NSString isEqual:](topic, "isEqual:");
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
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_guid hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_changedReason;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_topic hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_changedTopicsCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_topic hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDPushFilterChanged setGuid:](self, "setGuid:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_changedReason = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_changedTopicsCount = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 4))
  {
    -[AWDPushFilterChanged setTopic:](self, "setTopic:");
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

- (unsigned)changedReason
{
  return self->_changedReason;
}

- (unsigned)changedTopicsCount
{
  return self->_changedTopicsCount;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

@end