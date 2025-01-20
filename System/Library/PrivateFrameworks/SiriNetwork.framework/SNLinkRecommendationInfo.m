@interface SNLinkRecommendationInfo
- (BOOL)btPreference;
- (BOOL)wifiPreference;
- (double)timeTaken;
- (int64_t)beaconPER;
- (int64_t)btRetransmissionRateRx;
- (int64_t)btRetransmissionRateTx;
- (int64_t)btTech;
- (int64_t)expectedThroughputVIBE;
- (int64_t)lsmRecommendationBe;
- (int64_t)nwType;
- (int64_t)packetLifetimeVIBE;
- (int64_t)packetLossRateVIBE;
- (int64_t)wifiCCA;
- (int64_t)wifiRSSI;
- (int64_t)wifiSNR;
- (unint64_t)btRSSI;
- (void)setBeaconPER:(int64_t)a3;
- (void)setBtPreference:(BOOL)a3;
- (void)setBtRSSI:(unint64_t)a3;
- (void)setBtRetransmissionRateRx:(int64_t)a3;
- (void)setBtRetransmissionRateTx:(int64_t)a3;
- (void)setBtTech:(int64_t)a3;
- (void)setExpectedThroughputVIBE:(int64_t)a3;
- (void)setLsmRecommendationBe:(int64_t)a3;
- (void)setNwType:(int64_t)a3;
- (void)setPacketLifetimeVIBE:(int64_t)a3;
- (void)setPacketLossRateVIBE:(int64_t)a3;
- (void)setTimeTaken:(double)a3;
- (void)setWifiCCA:(int64_t)a3;
- (void)setWifiPreference:(BOOL)a3;
- (void)setWifiRSSI:(int64_t)a3;
- (void)setWifiSNR:(int64_t)a3;
@end

@implementation SNLinkRecommendationInfo

- (BOOL)btPreference
{
  return self->_btPreference;
}

- (void)setBtPreference:(BOOL)a3
{
  self->_btPreference = a3;
}

- (BOOL)wifiPreference
{
  return self->_wifiPreference;
}

- (void)setWifiPreference:(BOOL)a3
{
  self->_wifiPreference = a3;
}

- (unint64_t)btRSSI
{
  return self->_btRSSI;
}

- (void)setBtRSSI:(unint64_t)a3
{
  self->_btRSSI = a3;
}

- (int64_t)wifiRSSI
{
  return self->_wifiRSSI;
}

- (void)setWifiRSSI:(int64_t)a3
{
  self->_wifiRSSI = a3;
}

- (int64_t)wifiSNR
{
  return self->_wifiSNR;
}

- (void)setWifiSNR:(int64_t)a3
{
  self->_wifiSNR = a3;
}

- (int64_t)beaconPER
{
  return self->_beaconPER;
}

- (void)setBeaconPER:(int64_t)a3
{
  self->_beaconPER = a3;
}

- (int64_t)nwType
{
  return self->_nwType;
}

- (void)setNwType:(int64_t)a3
{
  self->_nwType = a3;
}

- (int64_t)wifiCCA
{
  return self->_wifiCCA;
}

- (void)setWifiCCA:(int64_t)a3
{
  self->_wifiCCA = a3;
}

- (int64_t)lsmRecommendationBe
{
  return self->_lsmRecommendationBe;
}

- (void)setLsmRecommendationBe:(int64_t)a3
{
  self->_lsmRecommendationBe = a3;
}

- (int64_t)expectedThroughputVIBE
{
  return self->_expectedThroughputVIBE;
}

- (void)setExpectedThroughputVIBE:(int64_t)a3
{
  self->_expectedThroughputVIBE = a3;
}

- (int64_t)packetLifetimeVIBE
{
  return self->_packetLifetimeVIBE;
}

- (void)setPacketLifetimeVIBE:(int64_t)a3
{
  self->_packetLifetimeVIBE = a3;
}

- (int64_t)packetLossRateVIBE
{
  return self->_packetLossRateVIBE;
}

- (void)setPacketLossRateVIBE:(int64_t)a3
{
  self->_packetLossRateVIBE = a3;
}

- (int64_t)btRetransmissionRateTx
{
  return self->_btRetransmissionRateTx;
}

- (void)setBtRetransmissionRateTx:(int64_t)a3
{
  self->_btRetransmissionRateTx = a3;
}

- (int64_t)btRetransmissionRateRx
{
  return self->_btRetransmissionRateRx;
}

- (void)setBtRetransmissionRateRx:(int64_t)a3
{
  self->_btRetransmissionRateRx = a3;
}

- (int64_t)btTech
{
  return self->_btTech;
}

- (void)setBtTech:(int64_t)a3
{
  self->_btTech = a3;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (void)setTimeTaken:(double)a3
{
  self->_timeTaken = a3;
}

@end