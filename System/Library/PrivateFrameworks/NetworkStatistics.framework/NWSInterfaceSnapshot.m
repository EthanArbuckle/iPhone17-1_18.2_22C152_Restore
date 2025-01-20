@interface NWSInterfaceSnapshot
- (NSString)interfaceDescription;
- (NSString)interfaceName;
- (NWSInterfaceSnapshot)initWithCounts:(const nstat_counts *)a3 interfaceDescriptor:(nstat_ifnet_descriptor *)a4 sourceIdent:(unint64_t)a5 seqno:(unint64_t)a6;
- (id)description;
- (id)provider;
- (id)traditionalDictionary;
- (unint64_t)cellConfigBackoffTime;
- (unint64_t)cellConfigInactivityTime;
- (unint64_t)cellUlAvgQueueSize;
- (unint64_t)cellUlMaxQueueSize;
- (unint64_t)cellUlMinQueueSize;
- (unint64_t)dlEffectiveBandwidth;
- (unint64_t)dlMaxBandwidth;
- (unint64_t)linkQualityMetric;
- (unint64_t)threshold;
- (unint64_t)ulBytesLost;
- (unint64_t)ulEffectiveBandwidth;
- (unint64_t)ulEffectiveLatency;
- (unint64_t)ulMaxBandwidth;
- (unint64_t)ulMaxLatency;
- (unint64_t)ulMinLatency;
- (unint64_t)ulReTxtLevel;
- (unint64_t)wifiConfigFrequency;
- (unint64_t)wifiConfigMulticastRate;
- (unint64_t)wifiDlEffectiveLatency;
- (unint64_t)wifiDlErrorRate;
- (unint64_t)wifiDlMaxLatency;
- (unint64_t)wifiDlMinLatency;
- (unint64_t)wifiScanCount;
- (unint64_t)wifiScanDuration;
- (unint64_t)wifiUlErrorRate;
- (unsigned)interfaceIndex;
- (unsigned)interfaceType;
- (void)_handleCellExtra:(nstat_ifnet_desc_cellular_status *)a3;
- (void)_handleDescriptor:(nstat_ifnet_descriptor *)a3;
- (void)_handleWifiExtra:(nstat_ifnet_desc_wifi_status *)a3;
- (void)_invalidateAllExtraCounts;
- (void)_invalidateCellCounts;
- (void)_invalidateCommonCounts;
- (void)_invalidateWifiCounts;
- (void)setCellConfigBackoffTime:(unint64_t)a3;
- (void)setCellConfigInactivityTime:(unint64_t)a3;
- (void)setCellUlAvgQueueSize:(unint64_t)a3;
- (void)setCellUlMaxQueueSize:(unint64_t)a3;
- (void)setCellUlMinQueueSize:(unint64_t)a3;
- (void)setDlEffectiveBandwidth:(unint64_t)a3;
- (void)setDlMaxBandwidth:(unint64_t)a3;
- (void)setLinkQualityMetric:(unint64_t)a3;
- (void)setUlBytesLost:(unint64_t)a3;
- (void)setUlEffectiveBandwidth:(unint64_t)a3;
- (void)setUlEffectiveLatency:(unint64_t)a3;
- (void)setUlMaxBandwidth:(unint64_t)a3;
- (void)setUlMaxLatency:(unint64_t)a3;
- (void)setUlMinLatency:(unint64_t)a3;
- (void)setUlReTxtLevel:(unint64_t)a3;
- (void)setWifiConfigFrequency:(unint64_t)a3;
- (void)setWifiConfigMulticastRate:(unint64_t)a3;
- (void)setWifiDlEffectiveLatency:(unint64_t)a3;
- (void)setWifiDlErrorRate:(unint64_t)a3;
- (void)setWifiDlMaxLatency:(unint64_t)a3;
- (void)setWifiDlMinLatency:(unint64_t)a3;
- (void)setWifiScanCount:(unint64_t)a3;
- (void)setWifiScanDuration:(unint64_t)a3;
- (void)setWifiUlErrorRate:(unint64_t)a3;
@end

@implementation NWSInterfaceSnapshot

- (id)provider
{
  return @"Interface";
}

- (unsigned)interfaceType
{
  return self->_descriptor.type;
}

- (NSString)interfaceName
{
  interfaceName = self->_interfaceName;
  if (!interfaceName)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.16s", self->_descriptor.name);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_interfaceName;
    self->_interfaceName = v4;

    interfaceName = self->_interfaceName;
  }
  return interfaceName;
}

- (NSString)interfaceDescription
{
  interfaceDescription = self->_interfaceDescription;
  if (!interfaceDescription)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.128s", self->_descriptor.description);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_interfaceDescription;
    self->_interfaceDescription = v4;

    interfaceDescription = self->_interfaceDescription;
  }
  return interfaceDescription;
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unint64_t)threshold
{
  return self->_descriptor.threshold;
}

- (void)_invalidateCommonCounts
{
  self->_linkQualityMetric = -1;
  self->_ulMaxBandwidth = -1;
  self->_ulEffectiveBandwidth = -1;
  self->_ulBytesLost = -1;
  self->_ulMinLatency = -1;
  self->_ulEffectiveLatency = -1;
  self->_ulMaxLatency = -1;
  self->_dlMaxBandwidth = -1;
  self->_dlEffectiveBandwidth = -1;
}

- (void)_invalidateCellCounts
{
  self->_cellUlMinQueueSize = -1;
  self->_cellUlAvgQueueSize = -1;
  self->_cellUlMaxQueueSize = -1;
  self->_cellConfigInactivityTime = -1;
  self->_cellConfigBackoffTime = -1;
}

- (void)_invalidateWifiCounts
{
  self->_wifiUlErrorRate = -1;
  self->_wifiDlMinLatency = -1;
  self->_wifiDlEffectiveLatency = -1;
  self->_wifiDlMaxLatency = -1;
  self->_wifiDlErrorRate = -1;
  self->_wifiConfigFrequency = -1;
  self->_wifiConfigMulticastRate = -1;
  self->_wifiScanCount = -1;
  self->_wifiScanDuration = -1;
}

- (void)_invalidateAllExtraCounts
{
  [(NWSInterfaceSnapshot *)self _invalidateCommonCounts];
  [(NWSInterfaceSnapshot *)self _invalidateCellCounts];
  [(NWSInterfaceSnapshot *)self _invalidateWifiCounts];
}

- (id)traditionalDictionary
{
  v38.receiver = self;
  v38.super_class = (Class)NWSInterfaceSnapshot;
  v3 = [(NWSSnapshot *)&v38 _createCountsForProvider:6];
  v4 = v3;
  if (v3)
  {
    [v3 setObject:kNStatProviderInterface forKeyedSubscript:kNStatSrcKeyProvider];
    v5 = [(NWSInterfaceSnapshot *)self interfaceName];

    if (v5)
    {
      v6 = [(NWSInterfaceSnapshot *)self interfaceName];
      [v4 setObject:v6 forKeyedSubscript:kNStatSrcKeyInterfaceName];
    }
    v7 = [(NWSInterfaceSnapshot *)self interfaceDescription];

    if (v7)
    {
      v8 = [(NWSInterfaceSnapshot *)self interfaceDescription];
      [v4 setObject:v8 forKeyedSubscript:kNStatSrcKeyInterfaceDescription];
    }
    v9 = [NSNumber numberWithUnsignedInt:self->_descriptor.type];
    [v4 setObject:v9 forKeyedSubscript:kNStatSrcKeyInterfaceType];

    v10 = [NSNumber numberWithUnsignedInt:self->_descriptor.ifindex];
    [v4 setObject:v10 forKeyedSubscript:kNStatSrcKeyInterface];

    v11 = [NSNumber numberWithUnsignedLongLong:self->_descriptor.threshold];
    [v4 setObject:v11 forKeyedSubscript:kNStatSrcKeyInterfaceThreshold];

    if ([(NWSInterfaceSnapshot *)self linkQualityMetric] != -1)
    {
      v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot linkQualityMetric](self, "linkQualityMetric"));
      [v4 setValue:v12 forKey:kNStatSrcKeyInterfaceLinkQualityMetric];
    }
    if ([(NWSInterfaceSnapshot *)self ulMaxBandwidth] != -1)
    {
      v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulMaxBandwidth](self, "ulMaxBandwidth"));
      [v4 setValue:v13 forKey:kNStatSrcKeyInterfaceUlMaxBandwidth];
    }
    if ([(NWSInterfaceSnapshot *)self ulEffectiveBandwidth] != -1)
    {
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulEffectiveBandwidth](self, "ulEffectiveBandwidth"));
      [v4 setValue:v14 forKey:kNStatSrcKeyInterfaceUlCurrentBandwidth];
    }
    if ([(NWSInterfaceSnapshot *)self ulBytesLost] != -1)
    {
      v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulBytesLost](self, "ulBytesLost"));
      [v4 setValue:v15 forKey:kNStatSrcKeyInterfaceUlBytesLost];
    }
    if ([(NWSInterfaceSnapshot *)self ulMinLatency] != -1)
    {
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulMinLatency](self, "ulMinLatency"));
      [v4 setValue:v16 forKey:kNStatSrcKeyInterfaceUlMinLatency];
    }
    if ([(NWSInterfaceSnapshot *)self ulEffectiveLatency] != -1)
    {
      v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulEffectiveLatency](self, "ulEffectiveLatency"));
      [v4 setValue:v17 forKey:kNStatSrcKeyInterfaceUlEffectiveLatency];
    }
    if ([(NWSInterfaceSnapshot *)self ulMaxLatency] != -1)
    {
      v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulMaxLatency](self, "ulMaxLatency"));
      [v4 setValue:v18 forKey:kNStatSrcKeyInterfaceUlMaxLatency];
    }
    if ([(NWSInterfaceSnapshot *)self ulReTxtLevel] != -1)
    {
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot ulReTxtLevel](self, "ulReTxtLevel"));
      [v4 setValue:v19 forKey:kNStatSrcKeyInterfaceUlReTxtLevel];
    }
    if ([(NWSInterfaceSnapshot *)self dlMaxBandwidth] != -1)
    {
      v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot dlMaxBandwidth](self, "dlMaxBandwidth"));
      [v4 setValue:v20 forKey:kNStatSrcKeyInterfaceDlMaxBandwidth];
    }
    if ([(NWSInterfaceSnapshot *)self dlEffectiveBandwidth] != -1)
    {
      v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot dlEffectiveBandwidth](self, "dlEffectiveBandwidth"));
      [v4 setValue:v21 forKey:kNStatSrcKeyInterfaceDlCurrentBandwidth];
    }
    if ([(NWSInterfaceSnapshot *)self cellUlMinQueueSize] != -1)
    {
      v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellUlMinQueueSize](self, "cellUlMinQueueSize"));
      [v4 setValue:v22 forKey:kNStatSrcKeyInterfaceCellUlMinQueueSize];
    }
    if ([(NWSInterfaceSnapshot *)self cellUlAvgQueueSize] != -1)
    {
      v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellUlAvgQueueSize](self, "cellUlAvgQueueSize"));
      [v4 setValue:v23 forKey:kNStatSrcKeyInterfaceCellUlAvgQueueSize];
    }
    if ([(NWSInterfaceSnapshot *)self cellUlMaxQueueSize] != -1)
    {
      v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellUlMaxQueueSize](self, "cellUlMaxQueueSize"));
      [v4 setValue:v24 forKey:kNStatSrcKeyInterfaceCellUlMaxQueueSize];
    }
    if ([(NWSInterfaceSnapshot *)self cellConfigInactivityTime] != -1)
    {
      v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellConfigInactivityTime](self, "cellConfigInactivityTime"));
      [v4 setValue:v25 forKey:kNStatSrcKeyInterfaceCellConfigInactivityTime];
    }
    if ([(NWSInterfaceSnapshot *)self cellConfigBackoffTime] != -1)
    {
      v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot cellConfigBackoffTime](self, "cellConfigBackoffTime"));
      [v4 setValue:v26 forKey:kNStatSrcKeyInterfaceCellConfigBackoffTime];
    }
    if ([(NWSInterfaceSnapshot *)self wifiDlMinLatency] != -1)
    {
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiDlMinLatency](self, "wifiDlMinLatency"));
      [v4 setValue:v27 forKey:kNStatSrcKeyInterfaceWifiDlMinLatency];
    }
    if ([(NWSInterfaceSnapshot *)self wifiDlEffectiveLatency] != -1)
    {
      v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiDlEffectiveLatency](self, "wifiDlEffectiveLatency"));
      [v4 setValue:v28 forKey:kNStatSrcKeyInterfaceWifiDlEffectiveLatency];
    }
    if ([(NWSInterfaceSnapshot *)self wifiDlMaxLatency] != -1)
    {
      v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiDlMaxLatency](self, "wifiDlMaxLatency"));
      [v4 setValue:v29 forKey:kNStatSrcKeyInterfaceWifiDlMaxLatency];
    }
    if ([(NWSInterfaceSnapshot *)self wifiDlErrorRate] != -1)
    {
      v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiDlErrorRate](self, "wifiDlErrorRate"));
      [v4 setValue:v30 forKey:kNStatSrcKeyInterfaceWifiDlErrorRate];
    }
    if ([(NWSInterfaceSnapshot *)self wifiUlErrorRate] != -1)
    {
      v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiUlErrorRate](self, "wifiUlErrorRate"));
      [v4 setValue:v31 forKey:kNStatSrcKeyInterfaceWifiUlErrorRate];
    }
    if ([(NWSInterfaceSnapshot *)self wifiConfigFrequency] != -1)
    {
      v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiConfigFrequency](self, "wifiConfigFrequency"));
      [v4 setValue:v32 forKey:kNStatSrcKeyInterfaceWifiConfigFrequency];
    }
    if ([(NWSInterfaceSnapshot *)self wifiConfigMulticastRate] != -1)
    {
      v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiConfigMulticastRate](self, "wifiConfigMulticastRate"));
      [v4 setValue:v33 forKey:kNStatSrcKeyInterfaceWifiConfigMulticastRate];
    }
    if ([(NWSInterfaceSnapshot *)self wifiScanCount] != -1)
    {
      v34 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiScanCount](self, "wifiScanCount"));
      [v4 setValue:v34 forKey:kNStatSrcKeyInterfaceWifiScanCount];
    }
    if ([(NWSInterfaceSnapshot *)self wifiScanDuration] != -1)
    {
      v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NWSInterfaceSnapshot wifiScanDuration](self, "wifiScanDuration"));
      [v4 setValue:v35 forKey:kNStatSrcKeyInterfaceWifiScanDuration];
    }
    id v36 = v4;
  }

  return v4;
}

- (void)_handleCellExtra:(nstat_ifnet_desc_cellular_status *)a3
{
  unsigned int valid_bitmask = a3->valid_bitmask;
  [(NWSInterfaceSnapshot *)self _invalidateWifiCounts];
  if (valid_bitmask) {
    uint64_t link_quality_metric = a3->link_quality_metric;
  }
  else {
    uint64_t link_quality_metric = -1;
  }
  [(NWSInterfaceSnapshot *)self setLinkQualityMetric:link_quality_metric];
  if ((valid_bitmask & 2) != 0) {
    uint64_t ul_effective_bandwidth = a3->ul_effective_bandwidth;
  }
  else {
    uint64_t ul_effective_bandwidth = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlEffectiveBandwidth:ul_effective_bandwidth];
  if ((valid_bitmask & 4) != 0) {
    uint64_t ul_max_bandwidth = a3->ul_max_bandwidth;
  }
  else {
    uint64_t ul_max_bandwidth = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlMaxBandwidth:ul_max_bandwidth];
  if ((valid_bitmask & 8) != 0) {
    uint64_t ul_min_latency = a3->ul_min_latency;
  }
  else {
    uint64_t ul_min_latency = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlMinLatency:ul_min_latency];
  if ((valid_bitmask & 0x20) != 0)
  {
    [(NWSInterfaceSnapshot *)self setUlEffectiveLatency:a3->ul_effective_latency];
    uint64_t ul_max_latency = a3->ul_max_latency;
  }
  else
  {
    uint64_t ul_max_latency = -1;
    [(NWSInterfaceSnapshot *)self setUlEffectiveLatency:-1];
  }
  [(NWSInterfaceSnapshot *)self setUlMaxLatency:ul_max_latency];
  if ((valid_bitmask & 0x40) != 0) {
    uint64_t ul_retxt_level = a3->ul_retxt_level;
  }
  else {
    uint64_t ul_retxt_level = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlReTxtLevel:ul_retxt_level];
  if ((valid_bitmask & 0x80) != 0) {
    uint64_t ul_bytes_lost = a3->ul_bytes_lost;
  }
  else {
    uint64_t ul_bytes_lost = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlBytesLost:ul_bytes_lost];
  if ((valid_bitmask & 0x100) != 0) {
    uint64_t ul_min_queue_size = a3->ul_min_queue_size;
  }
  else {
    uint64_t ul_min_queue_size = -1;
  }
  [(NWSInterfaceSnapshot *)self setCellUlMinQueueSize:ul_min_queue_size];
  if ((valid_bitmask & 0x200) != 0) {
    uint64_t ul_avg_queue_size = a3->ul_avg_queue_size;
  }
  else {
    uint64_t ul_avg_queue_size = -1;
  }
  [(NWSInterfaceSnapshot *)self setCellUlAvgQueueSize:ul_avg_queue_size];
  if ((valid_bitmask & 0x400) != 0) {
    uint64_t ul_max_queue_size = a3->ul_max_queue_size;
  }
  else {
    uint64_t ul_max_queue_size = -1;
  }
  [(NWSInterfaceSnapshot *)self setCellUlMaxQueueSize:ul_max_queue_size];
  if ((valid_bitmask & 0x800) != 0) {
    uint64_t dl_effective_bandwidth = a3->dl_effective_bandwidth;
  }
  else {
    uint64_t dl_effective_bandwidth = -1;
  }
  [(NWSInterfaceSnapshot *)self setDlEffectiveBandwidth:dl_effective_bandwidth];
  if ((valid_bitmask & 0x1000) != 0) {
    uint64_t dl_max_bandwidth = a3->dl_max_bandwidth;
  }
  else {
    uint64_t dl_max_bandwidth = -1;
  }
  [(NWSInterfaceSnapshot *)self setDlMaxBandwidth:dl_max_bandwidth];
  if ((valid_bitmask & 0x2000) != 0) {
    uint64_t config_inactivity_time = a3->config_inactivity_time;
  }
  else {
    uint64_t config_inactivity_time = -1;
  }
  [(NWSInterfaceSnapshot *)self setCellConfigInactivityTime:config_inactivity_time];
  if ((valid_bitmask & 0x4000) != 0) {
    uint64_t config_backoff_time = a3->config_backoff_time;
  }
  else {
    uint64_t config_backoff_time = -1;
  }
  [(NWSInterfaceSnapshot *)self setCellConfigBackoffTime:config_backoff_time];
}

- (void)_handleWifiExtra:(nstat_ifnet_desc_wifi_status *)a3
{
  unsigned int valid_bitmask = a3->valid_bitmask;
  [(NWSInterfaceSnapshot *)self _invalidateCellCounts];
  if (valid_bitmask) {
    uint64_t link_quality_metric = a3->link_quality_metric;
  }
  else {
    uint64_t link_quality_metric = -1;
  }
  [(NWSInterfaceSnapshot *)self setLinkQualityMetric:link_quality_metric];
  if ((valid_bitmask & 2) != 0) {
    uint64_t ul_effective_bandwidth = a3->ul_effective_bandwidth;
  }
  else {
    uint64_t ul_effective_bandwidth = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlEffectiveBandwidth:ul_effective_bandwidth];
  if ((valid_bitmask & 4) != 0) {
    uint64_t ul_max_bandwidth = a3->ul_max_bandwidth;
  }
  else {
    uint64_t ul_max_bandwidth = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlMaxBandwidth:ul_max_bandwidth];
  if ((valid_bitmask & 8) != 0) {
    uint64_t ul_min_latency = a3->ul_min_latency;
  }
  else {
    uint64_t ul_min_latency = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlMinLatency:ul_min_latency];
  if ((valid_bitmask & 0x10) != 0) {
    uint64_t ul_effective_latency = a3->ul_effective_latency;
  }
  else {
    uint64_t ul_effective_latency = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlEffectiveLatency:ul_effective_latency];
  if ((valid_bitmask & 0x20) != 0) {
    uint64_t ul_max_latency = a3->ul_max_latency;
  }
  else {
    uint64_t ul_max_latency = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlMaxLatency:ul_max_latency];
  if ((valid_bitmask & 0x40) != 0) {
    uint64_t ul_retxt_level = a3->ul_retxt_level;
  }
  else {
    uint64_t ul_retxt_level = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlReTxtLevel:ul_retxt_level];
  if ((valid_bitmask & 0x100) != 0) {
    uint64_t ul_bytes_lost = a3->ul_bytes_lost;
  }
  else {
    uint64_t ul_bytes_lost = -1;
  }
  [(NWSInterfaceSnapshot *)self setUlBytesLost:ul_bytes_lost];
  if ((valid_bitmask & 0x4000) != 0) {
    uint64_t ul_error_rate = a3->ul_error_rate;
  }
  else {
    uint64_t ul_error_rate = -1;
  }
  [(NWSInterfaceSnapshot *)self setWifiUlErrorRate:ul_error_rate];
  if ((valid_bitmask & 0x200) != 0) {
    uint64_t dl_effective_bandwidth = a3->dl_effective_bandwidth;
  }
  else {
    uint64_t dl_effective_bandwidth = -1;
  }
  [(NWSInterfaceSnapshot *)self setDlEffectiveBandwidth:dl_effective_bandwidth];
  if ((valid_bitmask & 0x400) != 0) {
    uint64_t dl_max_bandwidth = a3->dl_max_bandwidth;
  }
  else {
    uint64_t dl_max_bandwidth = -1;
  }
  [(NWSInterfaceSnapshot *)self setDlMaxBandwidth:dl_max_bandwidth];
  if ((valid_bitmask & 0x800) != 0) {
    uint64_t dl_min_latency = a3->dl_min_latency;
  }
  else {
    uint64_t dl_min_latency = -1;
  }
  [(NWSInterfaceSnapshot *)self setWifiDlMinLatency:dl_min_latency];
  if ((valid_bitmask & 0x1000) != 0) {
    uint64_t dl_effective_latency = a3->dl_effective_latency;
  }
  else {
    uint64_t dl_effective_latency = -1;
  }
  [(NWSInterfaceSnapshot *)self setWifiDlEffectiveLatency:dl_effective_latency];
  if ((valid_bitmask & 0x2000) != 0) {
    uint64_t dl_max_latency = a3->dl_max_latency;
  }
  else {
    uint64_t dl_max_latency = -1;
  }
  [(NWSInterfaceSnapshot *)self setWifiDlMaxLatency:dl_max_latency];
  if ((valid_bitmask & 0x4000) != 0) {
    uint64_t dl_error_rate = a3->dl_error_rate;
  }
  else {
    uint64_t dl_error_rate = -1;
  }
  [(NWSInterfaceSnapshot *)self setWifiDlErrorRate:dl_error_rate];
  if ((valid_bitmask & 0x8000) != 0) {
    uint64_t config_frequency = a3->config_frequency;
  }
  else {
    uint64_t config_frequency = -1;
  }
  [(NWSInterfaceSnapshot *)self setWifiConfigFrequency:config_frequency];
  if ((valid_bitmask & 0x10000) != 0) {
    uint64_t config_multicast_rate = a3->config_multicast_rate;
  }
  else {
    uint64_t config_multicast_rate = -1;
  }
  [(NWSInterfaceSnapshot *)self setWifiConfigMulticastRate:config_multicast_rate];
  if ((valid_bitmask & 0x20000) != 0) {
    uint64_t scan_count = a3->scan_count;
  }
  else {
    uint64_t scan_count = -1;
  }
  [(NWSInterfaceSnapshot *)self setWifiScanCount:scan_count];
  if ((valid_bitmask & 0x40000) != 0) {
    uint64_t scan_duration = a3->scan_duration;
  }
  else {
    uint64_t scan_duration = -1;
  }
  [(NWSInterfaceSnapshot *)self setWifiScanDuration:scan_duration];
}

- (void)_handleDescriptor:(nstat_ifnet_descriptor *)a3
{
  long long v3 = *(_OWORD *)&a3->link_status.u.wifi.ul_bytes_lost;
  long long v5 = *(_OWORD *)&a3->threshold;
  long long v4 = *(_OWORD *)&a3->link_status.u.cellular.valid_bitmask;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.uint64_t ul_min_latency = *(_OWORD *)&a3->link_status.u.wifi.ul_min_latency;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.uint64_t ul_bytes_lost = v3;
  *(_OWORD *)&self->_descriptor.threshold = v5;
  *(_OWORD *)&self->_descriptor.link_status.u.cellular.unsigned int valid_bitmask = v4;
  long long v6 = *(_OWORD *)&a3->description[12];
  long long v8 = *(_OWORD *)&a3->link_status.u.wifi.dl_min_latency;
  long long v7 = *(_OWORD *)&a3->link_status.u.wifi.config_frequency;
  *(_OWORD *)&self->_descriptor.type = *(_OWORD *)&a3->type;
  *(_OWORD *)&self->_descriptor.description[12] = v6;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.uint64_t dl_min_latency = v8;
  *(_OWORD *)&self->_descriptor.link_status.u.wifi.uint64_t config_frequency = v7;
  long long v9 = *(_OWORD *)&a3->description[76];
  long long v11 = *(_OWORD *)&a3->description[28];
  long long v10 = *(_OWORD *)&a3->description[44];
  *(_OWORD *)&self->_descriptor.description[60] = *(_OWORD *)&a3->description[60];
  *(_OWORD *)&self->_descriptor.description[76] = v9;
  *(_OWORD *)&self->_descriptor.description[28] = v11;
  *(_OWORD *)&self->_descriptor.description[44] = v10;
  long long v13 = *(_OWORD *)&a3->description[108];
  long long v12 = *(_OWORD *)&a3->description[124];
  long long v14 = *(_OWORD *)&a3->description[92];
  *(void *)&self->_descriptor.name[12] = *(void *)&a3->name[12];
  *(_OWORD *)&self->_descriptor.description[108] = v13;
  *(_OWORD *)&self->_descriptor.description[124] = v12;
  *(_OWORD *)&self->_descriptor.description[92] = v14;
  unsigned int link_status_type = a3->link_status.link_status_type;
  if (link_status_type == 2)
  {
    [(NWSInterfaceSnapshot *)self _handleWifiExtra:&a3->link_status.u];
  }
  else if (link_status_type == 1)
  {
    [(NWSInterfaceSnapshot *)self _handleCellExtra:&a3->link_status.u];
  }
  else
  {
    [(NWSInterfaceSnapshot *)self _invalidateAllExtraCounts];
  }
}

- (id)description
{
  __ret = 0;
  long long v3 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v3, 0, "NWStatisticsInterfaceSnapshot %I", self->_descriptor.ifindex);
  if (__ret)
  {
    long long v4 = [NSString stringWithCString:__ret encoding:4];
    free(__ret);
  }
  else
  {
    long long v4 = 0;
  }
  return v4;
}

- (NWSInterfaceSnapshot)initWithCounts:(const nstat_counts *)a3 interfaceDescriptor:(nstat_ifnet_descriptor *)a4 sourceIdent:(unint64_t)a5 seqno:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)NWSInterfaceSnapshot;
  long long v7 = [(NWSSnapshot *)&v10 _initWithCounts:a3 sourceIdent:a5 seqno:a6];
  long long v8 = v7;
  if (v7) {
    [(NWSInterfaceSnapshot *)v7 _handleDescriptor:a4];
  }
  return v8;
}

- (unint64_t)linkQualityMetric
{
  return self->_linkQualityMetric;
}

- (void)setLinkQualityMetric:(unint64_t)a3
{
  self->_linkQualityMetric = a3;
}

- (unint64_t)ulMaxBandwidth
{
  return self->_ulMaxBandwidth;
}

- (void)setUlMaxBandwidth:(unint64_t)a3
{
  self->_ulMaxBandwidth = a3;
}

- (unint64_t)ulEffectiveBandwidth
{
  return self->_ulEffectiveBandwidth;
}

- (void)setUlEffectiveBandwidth:(unint64_t)a3
{
  self->_ulEffectiveBandwidth = a3;
}

- (unint64_t)ulBytesLost
{
  return self->_ulBytesLost;
}

- (void)setUlBytesLost:(unint64_t)a3
{
  self->_ulBytesLost = a3;
}

- (unint64_t)ulMinLatency
{
  return self->_ulMinLatency;
}

- (void)setUlMinLatency:(unint64_t)a3
{
  self->_ulMinLatency = a3;
}

- (unint64_t)ulEffectiveLatency
{
  return self->_ulEffectiveLatency;
}

- (void)setUlEffectiveLatency:(unint64_t)a3
{
  self->_ulEffectiveLatency = a3;
}

- (unint64_t)ulMaxLatency
{
  return self->_ulMaxLatency;
}

- (void)setUlMaxLatency:(unint64_t)a3
{
  self->_ulMaxLatency = a3;
}

- (unint64_t)ulReTxtLevel
{
  return self->_ulReTxtLevel;
}

- (void)setUlReTxtLevel:(unint64_t)a3
{
  self->_ulReTxtLevel = a3;
}

- (unint64_t)dlMaxBandwidth
{
  return self->_dlMaxBandwidth;
}

- (void)setDlMaxBandwidth:(unint64_t)a3
{
  self->_dlMaxBandwidth = a3;
}

- (unint64_t)dlEffectiveBandwidth
{
  return self->_dlEffectiveBandwidth;
}

- (void)setDlEffectiveBandwidth:(unint64_t)a3
{
  self->_dlEffectiveBandwidth = a3;
}

- (unint64_t)cellUlMinQueueSize
{
  return self->_cellUlMinQueueSize;
}

- (void)setCellUlMinQueueSize:(unint64_t)a3
{
  self->_cellUlMinQueueSize = a3;
}

- (unint64_t)cellUlAvgQueueSize
{
  return self->_cellUlAvgQueueSize;
}

- (void)setCellUlAvgQueueSize:(unint64_t)a3
{
  self->_cellUlAvgQueueSize = a3;
}

- (unint64_t)cellUlMaxQueueSize
{
  return self->_cellUlMaxQueueSize;
}

- (void)setCellUlMaxQueueSize:(unint64_t)a3
{
  self->_cellUlMaxQueueSize = a3;
}

- (unint64_t)cellConfigInactivityTime
{
  return self->_cellConfigInactivityTime;
}

- (void)setCellConfigInactivityTime:(unint64_t)a3
{
  self->_cellConfigInactivityTime = a3;
}

- (unint64_t)cellConfigBackoffTime
{
  return self->_cellConfigBackoffTime;
}

- (void)setCellConfigBackoffTime:(unint64_t)a3
{
  self->_cellConfigBackoffTime = a3;
}

- (unint64_t)wifiUlErrorRate
{
  return self->_wifiUlErrorRate;
}

- (void)setWifiUlErrorRate:(unint64_t)a3
{
  self->_wifiUlErrorRate = a3;
}

- (unint64_t)wifiDlMinLatency
{
  return self->_wifiDlMinLatency;
}

- (void)setWifiDlMinLatency:(unint64_t)a3
{
  self->_wifiDlMinLatency = a3;
}

- (unint64_t)wifiDlEffectiveLatency
{
  return self->_wifiDlEffectiveLatency;
}

- (void)setWifiDlEffectiveLatency:(unint64_t)a3
{
  self->_wifiDlEffectiveLatency = a3;
}

- (unint64_t)wifiDlMaxLatency
{
  return self->_wifiDlMaxLatency;
}

- (void)setWifiDlMaxLatency:(unint64_t)a3
{
  self->_wifiDlMaxLatency = a3;
}

- (unint64_t)wifiDlErrorRate
{
  return self->_wifiDlErrorRate;
}

- (void)setWifiDlErrorRate:(unint64_t)a3
{
  self->_wifiDlErrorRate = a3;
}

- (unint64_t)wifiConfigFrequency
{
  return self->_wifiConfigFrequency;
}

- (void)setWifiConfigFrequency:(unint64_t)a3
{
  self->_wifiConfigFrequency = a3;
}

- (unint64_t)wifiConfigMulticastRate
{
  return self->_wifiConfigMulticastRate;
}

- (void)setWifiConfigMulticastRate:(unint64_t)a3
{
  self->_wifiConfigMulticastRate = a3;
}

- (unint64_t)wifiScanCount
{
  return self->_wifiScanCount;
}

- (void)setWifiScanCount:(unint64_t)a3
{
  self->_wifiScanCount = a3;
}

- (unint64_t)wifiScanDuration
{
  return self->_wifiScanDuration;
}

- (void)setWifiScanDuration:(unint64_t)a3
{
  self->_wifiScanDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceDescription, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end