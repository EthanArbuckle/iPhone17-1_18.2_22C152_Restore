@interface MIBUNetworkInfo
+ (id)queryNetworkInfo;
- (MIBUNetworkInfo)init;
- (NSString)BSSID;
- (NSString)MACAddress;
- (NSString)iPV4Address;
- (NSString)iPV6Address;
- (NSString)networkName;
- (id)description;
- (int64_t)RSSI;
- (int64_t)channel;
- (int64_t)noise;
- (unint64_t)MCSIndex;
- (unint64_t)PHYMode;
- (unint64_t)channelBand;
- (unint64_t)channelWidth;
- (unint64_t)numberOfSpatialStreams;
- (void)setBSSID:(id)a3;
- (void)setChannel:(int64_t)a3;
- (void)setChannelBand:(unint64_t)a3;
- (void)setChannelWidth:(unint64_t)a3;
- (void)setIPV4Address:(id)a3;
- (void)setIPV6Address:(id)a3;
- (void)setMACAddress:(id)a3;
- (void)setMCSIndex:(unint64_t)a3;
- (void)setNetworkName:(id)a3;
- (void)setNoise:(int64_t)a3;
- (void)setNumberOfSpatialStreams:(unint64_t)a3;
- (void)setPHYMode:(unint64_t)a3;
- (void)setRSSI:(int64_t)a3;
@end

@implementation MIBUNetworkInfo

- (MIBUNetworkInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUNetworkInfo;
  v2 = [(MIBUNetworkInfo *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUNetworkInfo *)v2 setNetworkName:0];
    [(MIBUNetworkInfo *)v3 setBSSID:0];
    [(MIBUNetworkInfo *)v3 setRSSI:0];
    [(MIBUNetworkInfo *)v3 setNoise:0];
    [(MIBUNetworkInfo *)v3 setChannel:-1];
    [(MIBUNetworkInfo *)v3 setChannelWidth:0];
    [(MIBUNetworkInfo *)v3 setChannelBand:0];
    [(MIBUNetworkInfo *)v3 setPHYMode:0];
    [(MIBUNetworkInfo *)v3 setNumberOfSpatialStreams:0];
    [(MIBUNetworkInfo *)v3 setMCSIndex:0];
    [(MIBUNetworkInfo *)v3 setIPV4Address:0];
    [(MIBUNetworkInfo *)v3 setIPV6Address:0];
  }
  return v3;
}

+ (id)queryNetworkInfo
{
  v2 = objc_alloc_init(MIBUNetworkInfo);
  id v3 = objc_alloc_init((Class)CWFInterface);
  [v3 activate];
  v4 = [v3 networkName];
  [(MIBUNetworkInfo *)v2 setNetworkName:v4];

  objc_super v5 = [v3 BSSID];
  [(MIBUNetworkInfo *)v2 setBSSID:v5];

  -[MIBUNetworkInfo setRSSI:](v2, "setRSSI:", [v3 RSSI]);
  -[MIBUNetworkInfo setNoise:](v2, "setNoise:", [v3 noise]);
  -[MIBUNetworkInfo setPHYMode:](v2, "setPHYMode:", [v3 PHYMode]);
  -[MIBUNetworkInfo setNumberOfSpatialStreams:](v2, "setNumberOfSpatialStreams:", [v3 numberOfSpatialStreams]);
  -[MIBUNetworkInfo setMCSIndex:](v2, "setMCSIndex:", [v3 MCSIndex]);
  v6 = [v3 MACAddress];
  [(MIBUNetworkInfo *)v2 setMACAddress:v6];

  v7 = [v3 IPv4Addresses];
  v8 = [v7 firstObject];
  [(MIBUNetworkInfo *)v2 setIPV4Address:v8];

  v9 = [v3 IPv6Addresses];
  v10 = [v9 firstObject];
  [(MIBUNetworkInfo *)v2 setIPV6Address:v10];

  v11 = [v3 channel];

  if (v11)
  {
    v12 = [v3 channel];
    -[MIBUNetworkInfo setChannel:](v2, "setChannel:", [v12 channel]);

    v13 = [v3 channel];
    -[MIBUNetworkInfo setChannelWidth:](v2, "setChannelWidth:", [v13 width]);

    v14 = [v3 channel];
    -[MIBUNetworkInfo setChannelBand:](v2, "setChannelBand:", [v14 band]);
  }
  [v3 invalidate];

  return v2;
}

- (id)description
{
  id v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = +[NSString stringWithFormat:@"<%@ : \n", v5];
  [v3 appendString:v6];

  v7 = [(MIBUNetworkInfo *)self networkName];
  v8 = +[NSString stringWithFormat:@"\tNetwork Name : %@\n", v7];
  [v3 appendString:v8];

  v9 = [(MIBUNetworkInfo *)self BSSID];
  v10 = +[NSString stringWithFormat:@"\tBSSID : %@\n", v9];
  [v3 appendString:v10];

  v11 = +[NSNumber numberWithInteger:[(MIBUNetworkInfo *)self RSSI]];
  v12 = +[NSString stringWithFormat:@"\tRSSI : %@\n", v11];
  [v3 appendString:v12];

  v13 = +[NSNumber numberWithInteger:[(MIBUNetworkInfo *)self noise]];
  v14 = +[NSString stringWithFormat:@"\tNoise : %@\n", v13];
  [v3 appendString:v14];

  v15 = +[NSString stringWithFormat:@"\tPHYMode : 0x%lX\n", [(MIBUNetworkInfo *)self PHYMode]];
  [v3 appendString:v15];

  v16 = +[NSNumber numberWithUnsignedInteger:[(MIBUNetworkInfo *)self numberOfSpatialStreams]];
  v17 = +[NSString stringWithFormat:@"\t#SpatialStreams : %@\n", v16];
  [v3 appendString:v17];

  v18 = +[NSNumber numberWithUnsignedInteger:[(MIBUNetworkInfo *)self MCSIndex]];
  v19 = +[NSString stringWithFormat:@"\tMCSIndex : %@\n", v18];
  [v3 appendString:v19];

  v20 = +[NSNumber numberWithInteger:[(MIBUNetworkInfo *)self channel]];
  v21 = +[NSString stringWithFormat:@"\tChannel : %@\n", v20];
  [v3 appendString:v21];

  v22 = +[NSNumber numberWithUnsignedInteger:[(MIBUNetworkInfo *)self channelWidth]];
  v23 = +[NSString stringWithFormat:@"\tChannel Width: %@\n", v22];
  [v3 appendString:v23];

  v24 = +[NSNumber numberWithUnsignedInteger:[(MIBUNetworkInfo *)self channelBand]];
  v25 = +[NSString stringWithFormat:@"\tChannel Band: %@\n", v24];
  [v3 appendString:v25];

  v26 = [(MIBUNetworkInfo *)self MACAddress];
  v27 = +[NSString stringWithFormat:@"\tMACAddress : %@\n", v26];
  [v3 appendString:v27];

  v28 = [(MIBUNetworkInfo *)self iPV4Address];
  v29 = +[NSString stringWithFormat:@"\tIPv4 : %@\n", v28];
  [v3 appendString:v29];

  v30 = [(MIBUNetworkInfo *)self iPV6Address];
  v31 = +[NSString stringWithFormat:@"\tIPv6 : %@\n", v30];
  [v3 appendString:v31];

  v32 = +[NSString stringWithFormat:@">"];
  [v3 appendString:v32];

  v33 = +[NSString stringWithString:v3];

  return v33;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_RSSI = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (unint64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unint64_t)a3
{
  self->_channelWidth = a3;
}

- (unint64_t)channelBand
{
  return self->_channelBand;
}

- (void)setChannelBand:(unint64_t)a3
{
  self->_channelBand = a3;
}

- (unint64_t)PHYMode
{
  return self->_PHYMode;
}

- (void)setPHYMode:(unint64_t)a3
{
  self->_PHYMode = a3;
}

- (unint64_t)numberOfSpatialStreams
{
  return self->_numberOfSpatialStreams;
}

- (void)setNumberOfSpatialStreams:(unint64_t)a3
{
  self->_numberOfSpatialStreams = a3;
}

- (unint64_t)MCSIndex
{
  return self->_MCSIndex;
}

- (void)setMCSIndex:(unint64_t)a3
{
  self->_MCSIndex = a3;
}

- (NSString)MACAddress
{
  return self->_MACAddress;
}

- (void)setMACAddress:(id)a3
{
}

- (NSString)iPV4Address
{
  return self->_iPV4Address;
}

- (void)setIPV4Address:(id)a3
{
}

- (NSString)iPV6Address
{
  return self->_iPV6Address;
}

- (void)setIPV6Address:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iPV6Address, 0);
  objc_storeStrong((id *)&self->_iPV4Address, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);

  objc_storeStrong((id *)&self->_networkName, 0);
}

@end