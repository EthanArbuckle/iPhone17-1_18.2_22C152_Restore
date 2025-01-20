@interface WiFiAnalyticsAWDWiFiDPSCountersSample
- (BOOL)hasControllerStats;
- (BOOL)hasPeerStats;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (WiFiAnalyticsAWDWiFiNWActivityControllerStats)controllerStats;
- (WiFiAnalyticsAWDWiFiNWActivityPeerStats)peerStats;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setControllerStats:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPeerStats:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiDPSCountersSample

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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSCountersSample;
  v4 = [(WiFiAnalyticsAWDWiFiDPSCountersSample *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiDPSCountersSample *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  controllerStats = self->_controllerStats;
  if (controllerStats)
  {
    v6 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)controllerStats dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"controllerStats"];
  }
  peerStats = self->_peerStats;
  if (peerStats)
  {
    objc_super v8 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)peerStats dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"peerStats"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSCountersSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_controllerStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_peerStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_controllerStats)
  {
    objc_msgSend(v4, "setControllerStats:");
    id v4 = v5;
  }
  if (self->_peerStats)
  {
    objc_msgSend(v5, "setPeerStats:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self->_controllerStats copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self->_peerStats copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  controllerStats = self->_controllerStats;
  if ((unint64_t)controllerStats | *((void *)v4 + 2)
    && !-[WiFiAnalyticsAWDWiFiNWActivityControllerStats isEqual:](controllerStats, "isEqual:"))
  {
    goto LABEL_11;
  }
  peerStats = self->_peerStats;
  if ((unint64_t)peerStats | *((void *)v4 + 3)) {
    char v7 = -[WiFiAnalyticsAWDWiFiNWActivityPeerStats isEqual:](peerStats, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self->_controllerStats hash] ^ v3;
  return v4 ^ [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self->_peerStats hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[4])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  controllerStats = self->_controllerStats;
  uint64_t v7 = v5[2];
  v10 = v5;
  if (controllerStats)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats mergeFrom:](controllerStats, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[WiFiAnalyticsAWDWiFiDPSCountersSample setControllerStats:](self, "setControllerStats:");
  }
  uint64_t v5 = v10;
LABEL_9:
  peerStats = self->_peerStats;
  uint64_t v9 = v5[3];
  if (peerStats)
  {
    if (v9) {
      -[WiFiAnalyticsAWDWiFiNWActivityPeerStats mergeFrom:](peerStats, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[WiFiAnalyticsAWDWiFiDPSCountersSample setPeerStats:](self, "setPeerStats:");
  }
  MEMORY[0x270F9A758]();
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (WiFiAnalyticsAWDWiFiNWActivityControllerStats)controllerStats
{
  return self->_controllerStats;
}

- (void)setControllerStats:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiNWActivityPeerStats)peerStats
{
  return self->_peerStats;
}

- (void)setPeerStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerStats, 0);
  objc_storeStrong((id *)&self->_controllerStats, 0);
}

@end