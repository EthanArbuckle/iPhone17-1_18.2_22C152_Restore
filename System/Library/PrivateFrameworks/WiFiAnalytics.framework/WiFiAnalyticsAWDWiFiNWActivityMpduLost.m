@interface WiFiAnalyticsAWDWiFiNWActivityMpduLost
- (BOOL)hasBALost;
- (BOOL)hasNonBALost;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (WiFiAnalyticsAWDWiFiNWActivityMpduWME)bALost;
- (WiFiAnalyticsAWDWiFiNWActivityMpduWME)nonBALost;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBALost:(id)a3;
- (void)setNonBALost:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityMpduLost

- (void)setNonBALost:(id)a3
{
}

- (void)setBALost:(id)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bALost)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_nonBALost)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBALost, 0);
  objc_storeStrong((id *)&self->_bALost, 0);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  bALost = self->_bALost;
  if (bALost)
  {
    id v5 = [(WiFiAnalyticsAWDWiFiNWActivityMpduWME *)bALost dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"BALost"];
  }
  nonBALost = self->_nonBALost;
  if (nonBALost)
  {
    v7 = [(WiFiAnalyticsAWDWiFiNWActivityMpduWME *)nonBALost dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"nonBALost"];
  }
  return v3;
}

- (BOOL)hasBALost
{
  return self->_bALost != 0;
}

- (BOOL)hasNonBALost
{
  return self->_nonBALost != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityMpduLost;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityMpduLost *)&v8 description];
  id v5 = [(WiFiAnalyticsAWDWiFiNWActivityMpduLost *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityMpduLostReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bALost)
  {
    objc_msgSend(v4, "setBALost:");
    id v4 = v5;
  }
  if (self->_nonBALost)
  {
    objc_msgSend(v5, "setNonBALost:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(WiFiAnalyticsAWDWiFiNWActivityMpduWME *)self->_bALost copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(WiFiAnalyticsAWDWiFiNWActivityMpduWME *)self->_nonBALost copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((bALost = self->_bALost, !((unint64_t)bALost | v4[1]))
     || -[WiFiAnalyticsAWDWiFiNWActivityMpduWME isEqual:](bALost, "isEqual:")))
  {
    nonBALost = self->_nonBALost;
    if ((unint64_t)nonBALost | v4[2]) {
      char v7 = -[WiFiAnalyticsAWDWiFiNWActivityMpduWME isEqual:](nonBALost, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(WiFiAnalyticsAWDWiFiNWActivityMpduWME *)self->_bALost hash];
  return [(WiFiAnalyticsAWDWiFiNWActivityMpduWME *)self->_nonBALost hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  bALost = self->_bALost;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (bALost)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[WiFiAnalyticsAWDWiFiNWActivityMpduWME mergeFrom:](bALost, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[WiFiAnalyticsAWDWiFiNWActivityMpduLost setBALost:](self, "setBALost:");
  }
  id v4 = v9;
LABEL_7:
  nonBALost = self->_nonBALost;
  uint64_t v8 = v4[2];
  if (nonBALost)
  {
    if (v8) {
      -[WiFiAnalyticsAWDWiFiNWActivityMpduWME mergeFrom:](nonBALost, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityMpduLost setNonBALost:](self, "setNonBALost:");
  }
  MEMORY[0x270F9A758]();
}

- (WiFiAnalyticsAWDWiFiNWActivityMpduWME)bALost
{
  return self->_bALost;
}

- (WiFiAnalyticsAWDWiFiNWActivityMpduWME)nonBALost
{
  return self->_nonBALost;
}

@end