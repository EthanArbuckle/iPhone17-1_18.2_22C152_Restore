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
  id v3 = objc_alloc_init(MEMORY[0x263F386E0]);
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
  v4 = NSString;
  objc_super v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"<%@ : \n", v6];
  [v3 appendString:v7];

  v8 = NSString;
  v9 = [(MIBUNetworkInfo *)self networkName];
  v10 = [v8 stringWithFormat:@"\tNetwork Name : %@\n", v9];
  [v3 appendString:v10];

  v11 = NSString;
  v12 = [(MIBUNetworkInfo *)self BSSID];
  v13 = [v11 stringWithFormat:@"\tBSSID : %@\n", v12];
  [v3 appendString:v13];

  v14 = NSString;
  v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[MIBUNetworkInfo RSSI](self, "RSSI"));
  v16 = [v14 stringWithFormat:@"\tRSSI : %@\n", v15];
  [v3 appendString:v16];

  v17 = NSString;
  v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[MIBUNetworkInfo noise](self, "noise"));
  v19 = [v17 stringWithFormat:@"\tNoise : %@\n", v18];
  [v3 appendString:v19];

  v20 = objc_msgSend(NSString, "stringWithFormat:", @"\tPHYMode : 0x%lX\n", -[MIBUNetworkInfo PHYMode](self, "PHYMode"));
  [v3 appendString:v20];

  v21 = NSString;
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MIBUNetworkInfo numberOfSpatialStreams](self, "numberOfSpatialStreams"));
  v23 = [v21 stringWithFormat:@"\t#SpatialStreams : %@\n", v22];
  [v3 appendString:v23];

  v24 = NSString;
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MIBUNetworkInfo MCSIndex](self, "MCSIndex"));
  v26 = [v24 stringWithFormat:@"\tMCSIndex : %@\n", v25];
  [v3 appendString:v26];

  v27 = NSString;
  v28 = objc_msgSend(NSNumber, "numberWithInteger:", -[MIBUNetworkInfo channel](self, "channel"));
  v29 = [v27 stringWithFormat:@"\tChannel : %@\n", v28];
  [v3 appendString:v29];

  v30 = NSString;
  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MIBUNetworkInfo channelWidth](self, "channelWidth"));
  v32 = [v30 stringWithFormat:@"\tChannel Width: %@\n", v31];
  [v3 appendString:v32];

  v33 = NSString;
  v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MIBUNetworkInfo channelBand](self, "channelBand"));
  v35 = [v33 stringWithFormat:@"\tChannel Band: %@\n", v34];
  [v3 appendString:v35];

  v36 = NSString;
  v37 = [(MIBUNetworkInfo *)self MACAddress];
  v38 = [v36 stringWithFormat:@"\tMACAddress : %@\n", v37];
  [v3 appendString:v38];

  v39 = NSString;
  v40 = [(MIBUNetworkInfo *)self iPV4Address];
  v41 = [v39 stringWithFormat:@"\tIPv4 : %@\n", v40];
  [v3 appendString:v41];

  v42 = NSString;
  v43 = [(MIBUNetworkInfo *)self iPV6Address];
  v44 = [v42 stringWithFormat:@"\tIPv6 : %@\n", v43];
  [v3 appendString:v44];

  v45 = [NSString stringWithFormat:@">"];
  [v3 appendString:v45];

  v46 = [NSString stringWithString:v3];

  return v46;
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