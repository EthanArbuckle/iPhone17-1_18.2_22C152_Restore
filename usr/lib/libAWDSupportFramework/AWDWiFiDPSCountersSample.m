@interface AWDWiFiDPSCountersSample
- (AWDWiFiNWActivityControllerStats)controllerStats;
- (AWDWiFiNWActivityPeerStats)peerStats;
- (BOOL)hasControllerStats;
- (BOOL)hasPeerStats;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setControllerStats:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPeerStats:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiDPSCountersSample

- (void)dealloc
{
  [(AWDWiFiDPSCountersSample *)self setControllerStats:0];
  [(AWDWiFiDPSCountersSample *)self setPeerStats:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSCountersSample;
  [(AWDWiFiDPSCountersSample *)&v3 dealloc];
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

- (BOOL)hasControllerStats
{
  return self->_controllerStats != 0;
}

- (BOOL)hasPeerStats
{
  return self->_peerStats != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSCountersSample;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiDPSCountersSample description](&v3, sel_description), -[AWDWiFiDPSCountersSample dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  controllerStats = self->_controllerStats;
  if (controllerStats) {
    [v3 setObject:[[-[AWDWiFiNWActivityControllerStats dictionaryRepresentation](controllerStats, "dictionaryRepresentation")] forKey:@"controllerStats"];
  }
  peerStats = self->_peerStats;
  if (peerStats) {
    [v3 setObject:[[-[AWDWiFiNWActivityPeerStats dictionaryRepresentation](peerStats, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"peerStats"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSCountersSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_controllerStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_peerStats)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if (self->_controllerStats) {
    [a3 setControllerStats:];
  }
  if (self->_peerStats)
  {
    [a3 setPeerStats:];
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

  *(void *)(v6 + 16) = [(AWDWiFiNWActivityControllerStats *)self->_controllerStats copyWithZone:a3];
  *(void *)(v6 + 24) = [(AWDWiFiNWActivityPeerStats *)self->_peerStats copyWithZone:a3];
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
    controllerStats = self->_controllerStats;
    if (!((unint64_t)controllerStats | *((void *)a3 + 2))
      || (int v5 = -[AWDWiFiNWActivityControllerStats isEqual:](controllerStats, "isEqual:")) != 0)
    {
      peerStats = self->_peerStats;
      if ((unint64_t)peerStats | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[AWDWiFiNWActivityPeerStats isEqual:](peerStats, "isEqual:");
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
  unint64_t v4 = [(AWDWiFiNWActivityControllerStats *)self->_controllerStats hash] ^ v3;
  return v4 ^ [(AWDWiFiNWActivityPeerStats *)self->_peerStats hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  controllerStats = self->_controllerStats;
  uint64_t v6 = *((void *)a3 + 2);
  if (controllerStats)
  {
    if (v6) {
      -[AWDWiFiNWActivityControllerStats mergeFrom:](controllerStats, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDWiFiDPSCountersSample setControllerStats:](self, "setControllerStats:");
  }
  peerStats = self->_peerStats;
  uint64_t v8 = *((void *)a3 + 3);
  if (peerStats)
  {
    if (v8)
    {
      -[AWDWiFiNWActivityPeerStats mergeFrom:](peerStats, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[AWDWiFiDPSCountersSample setPeerStats:](self, "setPeerStats:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiNWActivityControllerStats)controllerStats
{
  return self->_controllerStats;
}

- (void)setControllerStats:(id)a3
{
}

- (AWDWiFiNWActivityPeerStats)peerStats
{
  return self->_peerStats;
}

- (void)setPeerStats:(id)a3
{
}

@end