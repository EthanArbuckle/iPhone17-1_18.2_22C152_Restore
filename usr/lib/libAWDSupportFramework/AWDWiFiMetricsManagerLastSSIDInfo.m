@interface AWDWiFiMetricsManagerLastSSIDInfo
- (BOOL)hasLastSSIDAttempted;
- (BOOL)hasLastSSIDConnectedTo;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)lastSSIDAttempted;
- (NSData)lastSSIDConnectedTo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLastSSIDAttempted:(id)a3;
- (void)setLastSSIDConnectedTo:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerLastSSIDInfo

- (void)dealloc
{
  [(AWDWiFiMetricsManagerLastSSIDInfo *)self setLastSSIDAttempted:0];
  [(AWDWiFiMetricsManagerLastSSIDInfo *)self setLastSSIDConnectedTo:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerLastSSIDInfo;
  [(AWDWiFiMetricsManagerLastSSIDInfo *)&v3 dealloc];
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

- (BOOL)hasLastSSIDAttempted
{
  return self->_lastSSIDAttempted != 0;
}

- (BOOL)hasLastSSIDConnectedTo
{
  return self->_lastSSIDConnectedTo != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerLastSSIDInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerLastSSIDInfo description](&v3, sel_description), -[AWDWiFiMetricsManagerLastSSIDInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  lastSSIDAttempted = self->_lastSSIDAttempted;
  if (lastSSIDAttempted) {
    [v3 setObject:lastSSIDAttempted forKey:@"lastSSIDAttempted"];
  }
  lastSSIDConnectedTo = self->_lastSSIDConnectedTo;
  if (lastSSIDConnectedTo) {
    [v3 setObject:lastSSIDConnectedTo forKey:@"lastSSIDConnectedTo"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerLastSSIDInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_lastSSIDAttempted) {
    PBDataWriterWriteDataField();
  }
  if (self->_lastSSIDConnectedTo)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if (self->_lastSSIDAttempted) {
    [a3 setLastSSIDAttempted:];
  }
  if (self->_lastSSIDConnectedTo)
  {
    [a3 setLastSSIDConnectedTo:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSData *)self->_lastSSIDAttempted copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSData *)self->_lastSSIDConnectedTo copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    lastSSIDAttempted = self->_lastSSIDAttempted;
    if (!((unint64_t)lastSSIDAttempted | *((void *)a3 + 2))
      || (int v5 = -[NSData isEqual:](lastSSIDAttempted, "isEqual:")) != 0)
    {
      lastSSIDConnectedTo = self->_lastSSIDConnectedTo;
      if ((unint64_t)lastSSIDConnectedTo | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSData isEqual:](lastSSIDConnectedTo, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
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
  uint64_t v4 = [(NSData *)self->_lastSSIDAttempted hash] ^ v3;
  return v4 ^ [(NSData *)self->_lastSSIDConnectedTo hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDWiFiMetricsManagerLastSSIDInfo setLastSSIDAttempted:](self, "setLastSSIDAttempted:");
  }
  if (*((void *)a3 + 3))
  {
    -[AWDWiFiMetricsManagerLastSSIDInfo setLastSSIDConnectedTo:](self, "setLastSSIDConnectedTo:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)lastSSIDAttempted
{
  return self->_lastSSIDAttempted;
}

- (void)setLastSSIDAttempted:(id)a3
{
}

- (NSData)lastSSIDConnectedTo
{
  return self->_lastSSIDConnectedTo;
}

- (void)setLastSSIDConnectedTo:(id)a3
{
}

@end