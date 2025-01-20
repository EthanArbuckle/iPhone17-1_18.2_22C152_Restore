@interface WCM_HPCellular_CoreAnalyticsService
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)singleton;
- (WCM_HPCellular_CoreAnalyticsService)init;
- (unint64_t)a2dpMaxDeviceCount;
- (unint64_t)btMaxDeviceCount;
- (unint64_t)escoMaxDeviceCount;
- (unint64_t)hidMaxDeviceCount;
- (unint64_t)leMaxDeviceCount;
- (unint64_t)leaMaxDeviceCount;
- (unint64_t)llaMaxDeviceCount;
- (unint64_t)scoMaxDeviceCount;
- (void)resetHPCellularCoexStatsMetrics;
- (void)submitHPCellularCoexStats;
- (void)updateHPCellularCoexStatsWithBtDeviceCount:(unint64_t)a3 a2dpDeviceCount:(unint64_t)a4 escoDeviceCount:(unint64_t)a5 scoDeviceCount:(unint64_t)a6 hidDeviceCount:(unint64_t)a7 leDeviceCount:(unint64_t)a8 leaDeviceCount:(unint64_t)a9 llaDeviceCount:(unint64_t)a10;
@end

@implementation WCM_HPCellular_CoreAnalyticsService

+ (id)singleton
{
  id result = (id)qword_10027D110;
  if (!qword_10027D110)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WCM_HPCellular_CoreAnalyticsService;
    id result = [[objc_msgSendSuper2(&v4, "allocWithZone:", 0) init];
    qword_10027D110 = (uint64_t)result;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 singleton:a3];

  return v3;
}

- (WCM_HPCellular_CoreAnalyticsService)init
{
  v3.receiver = self;
  v3.super_class = (Class)WCM_HPCellular_CoreAnalyticsService;
  return [(WCM_HPCellular_CoreAnalyticsService *)&v3 init];
}

- (void)resetHPCellularCoexStatsMetrics
{
  *(_OWORD *)&self->_leaMaxDeviceCount = 0u;
  *(_OWORD *)&self->_hidMaxDeviceCount = 0u;
  *(_OWORD *)&self->_escoMaxDeviceCount = 0u;
  *(_OWORD *)&self->_btMaxDeviceCount = 0u;
  +[WCM_Logging logLevel:4 message:@"HPCellularCA: Reset HPCellularCoexStat"];
}

- (void)updateHPCellularCoexStatsWithBtDeviceCount:(unint64_t)a3 a2dpDeviceCount:(unint64_t)a4 escoDeviceCount:(unint64_t)a5 scoDeviceCount:(unint64_t)a6 hidDeviceCount:(unint64_t)a7 leDeviceCount:(unint64_t)a8 leaDeviceCount:(unint64_t)a9 llaDeviceCount:(unint64_t)a10
{
  unint64_t leaMaxDeviceCount = a9;
  unint64_t v10 = a10;
  unint64_t btMaxDeviceCount = self->_btMaxDeviceCount;
  a2dpMaxDeviceCount = self->_a2dpMaxDeviceCount;
  if (btMaxDeviceCount <= a3) {
    unint64_t btMaxDeviceCount = a3;
  }
  if (a2dpMaxDeviceCount <= a4) {
    a2dpMaxDeviceCount = a4;
  }
  unint64_t escoMaxDeviceCount = self->_escoMaxDeviceCount;
  unint64_t scoMaxDeviceCount = self->_scoMaxDeviceCount;
  if (escoMaxDeviceCount <= a5) {
    unint64_t escoMaxDeviceCount = a5;
  }
  if (scoMaxDeviceCount <= a6) {
    unint64_t scoMaxDeviceCount = a6;
  }
  unint64_t hidMaxDeviceCount = self->_hidMaxDeviceCount;
  unint64_t leMaxDeviceCount = self->_leMaxDeviceCount;
  if (hidMaxDeviceCount <= a7) {
    unint64_t hidMaxDeviceCount = a7;
  }
  if (leMaxDeviceCount <= a8) {
    unint64_t leMaxDeviceCount = a8;
  }
  unint64_t llaMaxDeviceCount = self->_llaMaxDeviceCount;
  if (self->_leaMaxDeviceCount > a9) {
    unint64_t leaMaxDeviceCount = self->_leaMaxDeviceCount;
  }
  self->_unint64_t btMaxDeviceCount = btMaxDeviceCount;
  self->_a2dpMaxDeviceCount = a2dpMaxDeviceCount;
  self->_unint64_t escoMaxDeviceCount = escoMaxDeviceCount;
  self->_unint64_t scoMaxDeviceCount = scoMaxDeviceCount;
  self->_unint64_t hidMaxDeviceCount = hidMaxDeviceCount;
  self->_unint64_t leMaxDeviceCount = leMaxDeviceCount;
  if (llaMaxDeviceCount > a10) {
    unint64_t v10 = llaMaxDeviceCount;
  }
  self->_unint64_t leaMaxDeviceCount = leaMaxDeviceCount;
  self->_unint64_t llaMaxDeviceCount = v10;
  +[WCM_Logging logLevel:4, @"HPCellularCA (updateHPCellularCoexStatsWithBtDeviceCount): [btMaxDeviceCount = %d, a2dpMaxDeviceCount = %d, escoMaxDeviceCount = %d, scoMaxDeviceCount = %d, hidMaxDeviceCount = %d, leMaxDeviceCount = %d, unint64_t leaMaxDeviceCount = %d, llaMaxDeviceCount = %d]", btMaxDeviceCount, a2dpMaxDeviceCount, escoMaxDeviceCount, scoMaxDeviceCount, hidMaxDeviceCount, leMaxDeviceCount, leaMaxDeviceCount, v10 message];
}

- (void)submitHPCellularCoexStats
{
  +[WCM_Logging logLevel:4, @"HPCellularCA (submitHPCellularCoexStats): Send HPCellular CA event: [btMaxDeviceCount = %d, a2dpMaxDeviceCount = %d, escoMaxDeviceCount = %d, scoMaxDeviceCount = %d, hidMaxDeviceCount = %d, leMaxDeviceCount = %d, unint64_t leaMaxDeviceCount = %d, llaMaxDeviceCount = %d]", self->_btMaxDeviceCount, self->_a2dpMaxDeviceCount, self->_escoMaxDeviceCount, self->_scoMaxDeviceCount, self->_hidMaxDeviceCount, self->_leMaxDeviceCount, self->_leaMaxDeviceCount, self->_llaMaxDeviceCount message];
  AnalyticsSendEventLazy();
}

- (unint64_t)btMaxDeviceCount
{
  return self->_btMaxDeviceCount;
}

- (unint64_t)a2dpMaxDeviceCount
{
  return self->_a2dpMaxDeviceCount;
}

- (unint64_t)escoMaxDeviceCount
{
  return self->_escoMaxDeviceCount;
}

- (unint64_t)scoMaxDeviceCount
{
  return self->_scoMaxDeviceCount;
}

- (unint64_t)hidMaxDeviceCount
{
  return self->_hidMaxDeviceCount;
}

- (unint64_t)leMaxDeviceCount
{
  return self->_leMaxDeviceCount;
}

- (unint64_t)leaMaxDeviceCount
{
  return self->_leaMaxDeviceCount;
}

- (unint64_t)llaMaxDeviceCount
{
  return self->_llaMaxDeviceCount;
}

@end