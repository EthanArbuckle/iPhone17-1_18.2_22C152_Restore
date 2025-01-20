@interface WiFiPerfPerAssocNearbyNetwork
- (BOOL)isEqual:(id)a3;
- (NSNumber)channel;
- (NSNumber)channelFlags;
- (NSNumber)rssi;
- (NSString)SSID;
- (NSString)bssid;
- (WiFiPerfPerAssocNearbyNetwork)init;
- (WiFiPerfPerAssocNearbyNetwork)initWithSSID:(id)a3 rssi:(id)a4 bssid:(id)a5 channel:(id)a6 channelFlags:(id)a7 andOrigin:(unint64_t)a8;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)origin;
@end

@implementation WiFiPerfPerAssocNearbyNetwork

- (WiFiPerfPerAssocNearbyNetwork)initWithSSID:(id)a3 rssi:(id)a4 bssid:(id)a5 channel:(id)a6 channelFlags:(id)a7 andOrigin:(unint64_t)a8
{
  v14 = (NSString *)a3;
  v15 = (NSNumber *)a4;
  v16 = (NSString *)a5;
  v17 = (NSNumber *)a6;
  v18 = (NSNumber *)a7;
  v30.receiver = self;
  v30.super_class = (Class)WiFiPerfPerAssocNearbyNetwork;
  v19 = [(WiFiPerfPerAssocNearbyNetwork *)&v30 init];
  SSID = v19->_SSID;
  v19->_SSID = v14;
  v21 = v14;

  rssi = v19->_rssi;
  v19->_rssi = v15;
  v23 = v15;

  bssid = v19->_bssid;
  v19->_bssid = v16;
  v25 = v16;

  channel = v19->_channel;
  v19->_channel = v17;
  v27 = v17;

  channelFlags = v19->_channelFlags;
  v19->_channelFlags = v18;
  v19->_origin = a8;

  return v19;
}

- (WiFiPerfPerAssocNearbyNetwork)init
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"WiFiPerfPerAssocNearbyNetwork is useless without values - use the exposed initWith..." userInfo:0];
  objc_exception_throw(v2);
}

- (id)dictionaryRepresentation
{
  v3 = [(WiFiPerfPerAssocNearbyNetwork *)self bssid];

  if (v3)
  {
    v4 = [(WiFiPerfPerAssocNearbyNetwork *)self rssi];
    v5 = [(WiFiPerfPerAssocNearbyNetwork *)self bssid];
    v6 = [(WiFiPerfPerAssocNearbyNetwork *)self channel];
    v7 = [(WiFiPerfPerAssocNearbyNetwork *)self channelFlags];
    v8 = +[NSNumber numberWithUnsignedInteger:[(WiFiPerfPerAssocNearbyNetwork *)self origin]];
    v9 = +[NSDictionary dictionaryWithObjectsAndKeys:v4, @"RSSI", v5, @"BSSID", v6, @"CHANNEL", v7, @"CHANNEL_FLAGS", v8, @"pppAPESSOrigin", 0];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [(WiFiPerfPerAssocNearbyNetwork *)self bssid];
  v6 = [v4 bssid];
  unsigned int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_6;
  }
  v8 = [(WiFiPerfPerAssocNearbyNetwork *)self channel];
  id v9 = [v8 unsignedIntegerValue];
  v10 = [v4 channel];
  id v11 = [v10 unsignedIntegerValue];

  if (v9 == v11) {
    BOOL v12 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v12 = 0;

  return v12;
}

- (id)description
{
  v3 = [(WiFiPerfPerAssocNearbyNetwork *)self SSID];
  id v4 = [(WiFiPerfPerAssocNearbyNetwork *)self bssid];
  v5 = [(WiFiPerfPerAssocNearbyNetwork *)self channel];
  v6 = [(WiFiPerfPerAssocNearbyNetwork *)self rssi];
  unsigned int v7 = +[NSString stringWithFormat:@"WiFiPerfPerAssocNearbyNetwork with SSID: %@ bssid: %@ channel: %@ RSSI: %@ ORIGIN: %d", v3, v4, v5, v6, [(WiFiPerfPerAssocNearbyNetwork *)self origin]];

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(WiFiPerfPerAssocNearbyNetwork *)self bssid];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (NSNumber)channelFlags
{
  return self->_channelFlags;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelFlags, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_rssi, 0);

  objc_storeStrong((id *)&self->_SSID, 0);
}

@end