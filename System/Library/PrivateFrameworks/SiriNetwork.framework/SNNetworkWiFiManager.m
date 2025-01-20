@interface SNNetworkWiFiManager
- (BOOL)isWiFiEnabled;
- (SNNetworkWiFiManager)init;
- (SNNetworkWiFiManagerInternal)underlyingNetworkWiFiManager;
- (id)getWiFiRecord;
- (void)setUnderlyingNetworkWiFiManager:(id)a3;
@end

@implementation SNNetworkWiFiManager

- (SNNetworkWiFiManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SNNetworkWiFiManager;
  v2 = [(SNNetworkWiFiManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SNNetworkWiFiManagerInternal shared];
    underlyingNetworkWiFiManager = v2->_underlyingNetworkWiFiManager;
    v2->_underlyingNetworkWiFiManager = (SNNetworkWiFiManagerInternal *)v3;
  }
  return v2;
}

- (id)getWiFiRecord
{
  v2 = [(SNNetworkWiFiManagerInternal *)self->_underlyingNetworkWiFiManager getWiFiRecordRepresentation];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(SNWiFiRecord);
    -[SNWiFiRecord setRssi:](v3, "setRssi:", [v2 rssi]);
    -[SNWiFiRecord setSnr:](v3, "setSnr:", [v2 snr]);
    -[SNWiFiRecord setCca:](v3, "setCca:", [v2 cca]);
    v4 = [v2 channelInfo];
    [(SNWiFiRecord *)v3 setChannelInfo:v4];

    v5 = [v2 phyMode];
    [(SNWiFiRecord *)v3 setPhyMode:v5];

    -[SNWiFiRecord setIsCaptive:](v3, "setIsCaptive:", [v2 isCaptive]);
    objc_super v6 = [v2 timestamp];
    [(SNWiFiRecord *)v3 setTimestamp:v6];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)isWiFiEnabled
{
  return [(SNNetworkWiFiManagerInternal *)self->_underlyingNetworkWiFiManager isWiFiEnabled];
}

- (SNNetworkWiFiManagerInternal)underlyingNetworkWiFiManager
{
  return self->_underlyingNetworkWiFiManager;
}

- (void)setUnderlyingNetworkWiFiManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end