@interface NSPNetworkStatusStats
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)cellStatusActiveCount;
- (unint64_t)cellStatusBlockedCount;
- (unint64_t)cellStatusDisabledCount;
- (unint64_t)wifiStatusActiveCount;
- (unint64_t)wifiStatusBlockedCount;
- (unint64_t)wifiStatusDisabledCount;
- (unint64_t)wiredStatusActiveCount;
- (unint64_t)wiredStatusBlockedCount;
- (unint64_t)wiredStatusDisabledCount;
- (void)setCellStatusActiveCount:(unint64_t)a3;
- (void)setCellStatusBlockedCount:(unint64_t)a3;
- (void)setCellStatusDisabledCount:(unint64_t)a3;
- (void)setTierType:(id)a3;
- (void)setWifiStatusActiveCount:(unint64_t)a3;
- (void)setWifiStatusBlockedCount:(unint64_t)a3;
- (void)setWifiStatusDisabledCount:(unint64_t)a3;
- (void)setWiredStatusActiveCount:(unint64_t)a3;
- (void)setWiredStatusBlockedCount:(unint64_t)a3;
- (void)setWiredStatusDisabledCount:(unint64_t)a3;
@end

@implementation NSPNetworkStatusStats

- (id)eventName
{
  return @"com.apple.nsp.networkStatusStats";
}

- (id)analyticsDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(NSPNetworkStatusStats *)self tierType];
  [v3 setObject:v4 forKeyedSubscript:@"TierType"];

  v5 = +[NSNumber numberWithUnsignedInteger:[(NSPNetworkStatusStats *)self wifiStatusBlockedCount]];
  [v3 setObject:v5 forKeyedSubscript:@"NetworkStatusStatsWiFiBlockedCount"];

  v6 = +[NSNumber numberWithUnsignedInteger:[(NSPNetworkStatusStats *)self wifiStatusDisabledCount]];
  [v3 setObject:v6 forKeyedSubscript:@"NetworkStatusStatsWiFiDisabledCount"];

  v7 = +[NSNumber numberWithUnsignedInteger:[(NSPNetworkStatusStats *)self wifiStatusActiveCount]];
  [v3 setObject:v7 forKeyedSubscript:@"NetworkStatusStatsWiFiActiveCount"];

  v8 = +[NSNumber numberWithUnsignedInteger:[(NSPNetworkStatusStats *)self cellStatusBlockedCount]];
  [v3 setObject:v8 forKeyedSubscript:@"NetworkStatusStatsCellBlockedCount"];

  v9 = +[NSNumber numberWithUnsignedInteger:[(NSPNetworkStatusStats *)self cellStatusDisabledCount]];
  [v3 setObject:v9 forKeyedSubscript:@"NetworkStatusStatsCellDisabledCount"];

  v10 = +[NSNumber numberWithUnsignedInteger:[(NSPNetworkStatusStats *)self cellStatusActiveCount]];
  [v3 setObject:v10 forKeyedSubscript:@"NetworkStatusStatsCellActiveCount"];

  v11 = +[NSNumber numberWithUnsignedInteger:[(NSPNetworkStatusStats *)self wiredStatusBlockedCount]];
  [v3 setObject:v11 forKeyedSubscript:@"NetworkStatusStatsWiredBlockedCount"];

  v12 = +[NSNumber numberWithUnsignedInteger:[(NSPNetworkStatusStats *)self wiredStatusDisabledCount]];
  [v3 setObject:v12 forKeyedSubscript:@"NetworkStatusStatsWiredDisabledCount"];

  v13 = +[NSNumber numberWithUnsignedInteger:[(NSPNetworkStatusStats *)self wiredStatusActiveCount]];
  [v3 setObject:v13 forKeyedSubscript:@"NetworkStatusStatsWiredActiveCount"];

  return v3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (unint64_t)wifiStatusBlockedCount
{
  return self->_wifiStatusBlockedCount;
}

- (void)setWifiStatusBlockedCount:(unint64_t)a3
{
  self->_wifiStatusBlockedCount = a3;
}

- (unint64_t)wifiStatusDisabledCount
{
  return self->_wifiStatusDisabledCount;
}

- (void)setWifiStatusDisabledCount:(unint64_t)a3
{
  self->_wifiStatusDisabledCount = a3;
}

- (unint64_t)wifiStatusActiveCount
{
  return self->_wifiStatusActiveCount;
}

- (void)setWifiStatusActiveCount:(unint64_t)a3
{
  self->_wifiStatusActiveCount = a3;
}

- (unint64_t)cellStatusBlockedCount
{
  return self->_cellStatusBlockedCount;
}

- (void)setCellStatusBlockedCount:(unint64_t)a3
{
  self->_cellStatusBlockedCount = a3;
}

- (unint64_t)cellStatusDisabledCount
{
  return self->_cellStatusDisabledCount;
}

- (void)setCellStatusDisabledCount:(unint64_t)a3
{
  self->_cellStatusDisabledCount = a3;
}

- (unint64_t)cellStatusActiveCount
{
  return self->_cellStatusActiveCount;
}

- (void)setCellStatusActiveCount:(unint64_t)a3
{
  self->_cellStatusActiveCount = a3;
}

- (unint64_t)wiredStatusBlockedCount
{
  return self->_wiredStatusBlockedCount;
}

- (void)setWiredStatusBlockedCount:(unint64_t)a3
{
  self->_wiredStatusBlockedCount = a3;
}

- (unint64_t)wiredStatusDisabledCount
{
  return self->_wiredStatusDisabledCount;
}

- (void)setWiredStatusDisabledCount:(unint64_t)a3
{
  self->_wiredStatusDisabledCount = a3;
}

- (unint64_t)wiredStatusActiveCount
{
  return self->_wiredStatusActiveCount;
}

- (void)setWiredStatusActiveCount:(unint64_t)a3
{
  self->_wiredStatusActiveCount = a3;
}

- (void).cxx_destruct
{
}

@end