@interface NRAutoLinkUpgradeMonitor
- (BOOL)cancelled;
- (BOOL)hasActiveNonDefaultAdvice;
- (BOOL)hasReportedHonoredStatusToSymptoms;
- (BOOL)hasReportedUpgradeStatusToSymptoms;
- (BOOL)started;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)aggregateStatsTimerSource;
- (OS_dispatch_source)wifiAdviceMonitorTimerSource;
- (double)totalDurationForBTClassicAdvice;
- (double)totalDurationForWiFiAdvice;
- (double)totalIntervalForNonDefaultAdvice;
- (id)description;
- (id)updateBlock;
- (unint64_t)identifier;
- (unint64_t)lastAdvisoryTime;
- (unint64_t)lastNonDefaultAdvisoryTime;
- (unint64_t)lastReceivedAdvice;
- (unint64_t)lastReceivedReason;
- (unint64_t)timeOfBTClassicAdvice;
- (unint64_t)timeOfWiFiAdvice;
- (unint64_t)totalCountForBTClassicAdvice;
- (unint64_t)totalCountForNonDefaultAdvice;
- (unint64_t)totalCountForWiFiAdvice;
- (unint64_t)totalReceivedUpdates;
- (void)armAggregateStatsTimerSource;
- (void)armWiFiAdviceMonitorTimerSource;
- (void)dealloc;
- (void)invalidateAggregateStatsTimerSource;
- (void)invalidateWiFiAdviceMonitorTimerSource;
- (void)reportEvent:(unsigned int)a3;
- (void)reportEvent:(unsigned int)a3 details:(id)a4;
- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4;
- (void)setAggregateStatsTimerSource:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setHasActiveNonDefaultAdvice:(BOOL)a3;
- (void)setHasReportedHonoredStatusToSymptoms:(BOOL)a3;
- (void)setHasReportedUpgradeStatusToSymptoms:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setLastAdvisoryTime:(unint64_t)a3;
- (void)setLastNonDefaultAdvisoryTime:(unint64_t)a3;
- (void)setLastReceivedAdvice:(unint64_t)a3;
- (void)setLastReceivedAdviceID:(id)a3;
- (void)setLastReceivedReason:(unint64_t)a3;
- (void)setNrUUID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setTimeOfBTClassicAdvice:(unint64_t)a3;
- (void)setTimeOfWiFiAdvice:(unint64_t)a3;
- (void)setTotalCountForBTClassicAdvice:(unint64_t)a3;
- (void)setTotalCountForNonDefaultAdvice:(unint64_t)a3;
- (void)setTotalCountForWiFiAdvice:(unint64_t)a3;
- (void)setTotalDurationForBTClassicAdvice:(double)a3;
- (void)setTotalDurationForWiFiAdvice:(double)a3;
- (void)setTotalIntervalForNonDefaultAdvice:(double)a3;
- (void)setTotalReceivedUpdates:(unint64_t)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setWifiAdviceMonitorTimerSource:(id)a3;
@end

@implementation NRAutoLinkUpgradeMonitor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_wifiAdviceMonitorTimerSource, 0);
  objc_storeStrong((id *)&self->_aggregateStatsTimerSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastReceivedAdviceID, 0);

  objc_storeStrong((id *)&self->_nrUUID, 0);
}

- (void)setTimeOfBTClassicAdvice:(unint64_t)a3
{
  self->_timeOfBTClassicAdvice = a3;
}

- (unint64_t)timeOfBTClassicAdvice
{
  return self->_timeOfBTClassicAdvice;
}

- (void)setTotalCountForBTClassicAdvice:(unint64_t)a3
{
  self->_totalCountForBTClassicAdvice = a3;
}

- (unint64_t)totalCountForBTClassicAdvice
{
  return self->_totalCountForBTClassicAdvice;
}

- (void)setTotalDurationForBTClassicAdvice:(double)a3
{
  self->_totalDurationForBTClassicAdvice = a3;
}

- (double)totalDurationForBTClassicAdvice
{
  return self->_totalDurationForBTClassicAdvice;
}

- (void)setTimeOfWiFiAdvice:(unint64_t)a3
{
  self->_timeOfWiFiAdvice = a3;
}

- (unint64_t)timeOfWiFiAdvice
{
  return self->_timeOfWiFiAdvice;
}

- (void)setTotalCountForWiFiAdvice:(unint64_t)a3
{
  self->_totalCountForWiFiAdvice = a3;
}

- (unint64_t)totalCountForWiFiAdvice
{
  return self->_totalCountForWiFiAdvice;
}

- (void)setTotalDurationForWiFiAdvice:(double)a3
{
  self->_totalDurationForWiFiAdvice = a3;
}

- (double)totalDurationForWiFiAdvice
{
  return self->_totalDurationForWiFiAdvice;
}

- (void)setLastNonDefaultAdvisoryTime:(unint64_t)a3
{
  self->_lastNonDefaultAdvisoryTime = a3;
}

- (unint64_t)lastNonDefaultAdvisoryTime
{
  return self->_lastNonDefaultAdvisoryTime;
}

- (void)setTotalCountForNonDefaultAdvice:(unint64_t)a3
{
  self->_totalCountForNonDefaultAdvice = a3;
}

- (unint64_t)totalCountForNonDefaultAdvice
{
  return self->_totalCountForNonDefaultAdvice;
}

- (void)setTotalIntervalForNonDefaultAdvice:(double)a3
{
  self->_totalIntervalForNonDefaultAdvice = a3;
}

- (double)totalIntervalForNonDefaultAdvice
{
  return self->_totalIntervalForNonDefaultAdvice;
}

- (void)setHasReportedHonoredStatusToSymptoms:(BOOL)a3
{
  self->_hasReportedHonoredStatusToSymptoms = a3;
}

- (BOOL)hasReportedHonoredStatusToSymptoms
{
  return self->_hasReportedHonoredStatusToSymptoms;
}

- (void)setHasReportedUpgradeStatusToSymptoms:(BOOL)a3
{
  self->_hasReportedUpgradeStatusToSymptoms = a3;
}

- (BOOL)hasReportedUpgradeStatusToSymptoms
{
  return self->_hasReportedUpgradeStatusToSymptoms;
}

- (void)setHasActiveNonDefaultAdvice:(BOOL)a3
{
  self->_hasActiveNonDefaultAdvice = a3;
}

- (BOOL)hasActiveNonDefaultAdvice
{
  return self->_hasActiveNonDefaultAdvice;
}

- (void)setUpdateBlock:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setWifiAdviceMonitorTimerSource:(id)a3
{
}

- (OS_dispatch_source)wifiAdviceMonitorTimerSource
{
  return self->_wifiAdviceMonitorTimerSource;
}

- (void)setAggregateStatsTimerSource:(id)a3
{
}

- (OS_dispatch_source)aggregateStatsTimerSource
{
  return self->_aggregateStatsTimerSource;
}

- (void)setTotalReceivedUpdates:(unint64_t)a3
{
  self->_totalReceivedUpdates = a3;
}

- (unint64_t)totalReceivedUpdates
{
  return self->_totalReceivedUpdates;
}

- (void)setLastAdvisoryTime:(unint64_t)a3
{
  self->_lastAdvisoryTime = a3;
}

- (unint64_t)lastAdvisoryTime
{
  return self->_lastAdvisoryTime;
}

- (void)setLastReceivedReason:(unint64_t)a3
{
  self->_lastReceivedReason = a3;
}

- (unint64_t)lastReceivedReason
{
  return self->_lastReceivedReason;
}

- (void)setLastReceivedAdvice:(unint64_t)a3
{
  self->_lastReceivedAdvice = a3;
}

- (unint64_t)lastReceivedAdvice
{
  return self->_lastReceivedAdvice;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setLastReceivedAdviceID:(id)a3
{
}

- (void)setNrUUID:(id)a3
{
}

- (void)reportEvent:(unsigned int)a3
{
}

- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v8];

  [(NRAutoLinkUpgradeMonitor *)self reportEvent:v4 details:v7];
}

- (void)reportEvent:(unsigned int)a3 details:(id)a4
{
  if (self) {
    nrUUID = self->_nrUUID;
  }
  else {
    nrUUID = 0;
  }
  uint64_t v8 = nrUUID;
  id v9 = a4;
  id v10 = [(NRAutoLinkUpgradeMonitor *)self description];
  sub_10012F648(v8, a3, v10, v9);
}

- (void)invalidateAggregateStatsTimerSource
{
  aggregateStatsTimerSource = self->_aggregateStatsTimerSource;
  if (aggregateStatsTimerSource)
  {
    dispatch_source_cancel(aggregateStatsTimerSource);
    uint64_t v4 = self->_aggregateStatsTimerSource;
    self->_aggregateStatsTimerSource = 0;
  }
}

- (void)armAggregateStatsTimerSource
{
  if (!self->_aggregateStatsTimerSource)
  {
    v3 = [(NRAutoLinkUpgradeMonitor *)self queue];
    uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);

    dispatch_source_set_timer(v4, 0x8000000000000000, 0x13A52453C000uLL, 0x12A05F200uLL);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006CCF0;
    handler[3] = &unk_1001C88B8;
    objc_copyWeak(&v10, &location);
    v5 = v4;
    id v9 = v5;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_resume(v5);
    aggregateStatsTimerSource = self->_aggregateStatsTimerSource;
    self->_aggregateStatsTimerSource = (OS_dispatch_source *)v5;
    id v7 = v5;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)invalidateWiFiAdviceMonitorTimerSource
{
  wifiAdviceMonitorTimerSource = self->_wifiAdviceMonitorTimerSource;
  if (wifiAdviceMonitorTimerSource)
  {
    dispatch_source_cancel(wifiAdviceMonitorTimerSource);
    uint64_t v4 = self->_wifiAdviceMonitorTimerSource;
    self->_wifiAdviceMonitorTimerSource = 0;
  }
}

- (void)armWiFiAdviceMonitorTimerSource
{
  if (!self->_wifiAdviceMonitorTimerSource)
  {
    v3 = [(NRAutoLinkUpgradeMonitor *)self queue];
    uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);

    dispatch_time_t v5 = dispatch_time(0, 1800000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006D0B8;
    handler[3] = &unk_1001C88B8;
    objc_copyWeak(&v11, &location);
    id v6 = v4;
    id v10 = v6;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    wifiAdviceMonitorTimerSource = self->_wifiAdviceMonitorTimerSource;
    self->_wifiAdviceMonitorTimerSource = (OS_dispatch_source *)v6;
    uint64_t v8 = v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    if (self) {
      nrUUID = self->_nrUUID;
    }
    else {
      nrUUID = 0;
    }
    id v6 = nrUUID;
    id v7 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v10 = 397;
    id v11 = self;
    uint64_t v8 = "";
    id v9 = "-[NRAutoLinkUpgradeMonitor dealloc]";
    _NRLogWithArgs();
  }
  if (self && ![(NRAutoLinkUpgradeMonitor *)self cancelled])
  {
    [(NRAutoLinkUpgradeMonitor *)self setCancelled:1];
    [(NRAutoLinkUpgradeMonitor *)self setUpdateBlock:0];
    [(NRAutoLinkUpgradeMonitor *)self invalidateAggregateStatsTimerSource];
    [(NRAutoLinkUpgradeMonitor *)self reportEvent:30003];
  }
  v12.receiver = self;
  v12.super_class = (Class)NRAutoLinkUpgradeMonitor;
  [(NRAutoLinkUpgradeMonitor *)&v12 dealloc];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  unint64_t identifier = self->_identifier;
  unsigned int v5 = [(NRAutoLinkUpgradeMonitor *)self started];
  unint64_t totalReceivedUpdates = self->_totalReceivedUpdates;
  unint64_t v7 = [(NRAutoLinkUpgradeMonitor *)self lastReceivedAdvice];
  uint64_t v8 = @"None";
  switch(v7)
  {
    case 0uLL:
      break;
    case 1uLL:
      uint64_t v8 = @"BluetoothDefault";
      break;
    case 2uLL:
      uint64_t v8 = @"BluetoothClassic";
      break;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      uint64_t v8 = @"WiFi";
      break;
    default:
      if (v7 == 128) {
        uint64_t v8 = @"NoUpgrade";
      }
      else {
LABEL_5:
      }
        uint64_t v8 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown(%llu)", v7];
      break;
  }
  id v9 = "Not-";
  if (v5) {
    id v9 = "";
  }
  id v10 = [v3 initWithFormat:@"[%llu %sMonitoring %llu %@]", identifier, v9, totalReceivedUpdates, v8];

  return v10;
}

@end