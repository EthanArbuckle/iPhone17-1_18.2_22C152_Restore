@interface SiriCoreNetworkQualityReport
- (int64_t)cellularHistorical;
- (int64_t)cellularInstant;
- (int64_t)wifiHistorical;
- (int64_t)wifiInstant;
- (void)setCellularHistorical:(int64_t)a3;
- (void)setCellularInstant:(int64_t)a3;
- (void)setWifiHistorical:(int64_t)a3;
- (void)setWifiInstant:(int64_t)a3;
@end

@implementation SiriCoreNetworkQualityReport

- (void)setWifiHistorical:(int64_t)a3
{
  self->_wifiHistorical = a3;
}

- (int64_t)wifiHistorical
{
  return self->_wifiHistorical;
}

- (void)setWifiInstant:(int64_t)a3
{
  self->_wifiInstant = a3;
}

- (int64_t)wifiInstant
{
  return self->_wifiInstant;
}

- (void)setCellularHistorical:(int64_t)a3
{
  self->_cellularHistorical = a3;
}

- (int64_t)cellularHistorical
{
  return self->_cellularHistorical;
}

- (void)setCellularInstant:(int64_t)a3
{
  self->_cellularInstant = a3;
}

- (int64_t)cellularInstant
{
  return self->_cellularInstant;
}

@end