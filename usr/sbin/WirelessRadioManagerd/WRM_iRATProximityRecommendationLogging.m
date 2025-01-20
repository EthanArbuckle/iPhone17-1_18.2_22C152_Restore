@interface WRM_iRATProximityRecommendationLogging
- (NSUUID)Uuid;
- (WRM_iRATProximityRecommendationLogging)init;
- (char)nwType;
- (int)beaconPER;
- (int64_t)btRetransmissionRateRx;
- (int64_t)btRetransmissionRateTx;
- (int64_t)btTech;
- (int64_t)expectedThroughputVIBE;
- (int64_t)lsmRecommendationBe;
- (int64_t)packetLifetimeVIBE;
- (int64_t)packetLossRateVIBE;
- (int64_t)wifiCCA;
- (int64_t)wifiRSSI;
- (int64_t)wifiSNR;
- (unint64_t)btRSSI;
- (void)dealloc;
- (void)setBeaconPER:(int)a3;
- (void)setBtRSSI:(unint64_t)a3;
- (void)setBtRetransmissionRateRx:(int64_t)a3;
- (void)setBtRetransmissionRateTx:(int64_t)a3;
- (void)setBtTech:(int64_t)a3;
- (void)setExpectedThroughputVIBE:(int64_t)a3;
- (void)setLsmRecommendationBe:(int64_t)a3;
- (void)setNwType:(char)a3;
- (void)setPacketLifetimeVIBE:(int64_t)a3;
- (void)setPacketLossRateVIBE:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)setWifiCCA:(int64_t)a3;
- (void)setWifiRSSI:(int64_t)a3;
- (void)setWifiSNR:(int64_t)a3;
@end

@implementation WRM_iRATProximityRecommendationLogging

- (WRM_iRATProximityRecommendationLogging)init
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATProximityRecommendationLogging;
  v2 = [(WRM_iRATProximityRecommendationLogging *)&v4 init];
  if (v2)
  {
    [(WRM_iRATProximityRecommendationLogging *)v2 setUuid:objc_alloc_init((Class)NSUUID)];
    [(WRM_iRATProximityRecommendationLogging *)v2 setBtRSSI:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setWifiSNR:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setWifiRSSI:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setBeaconPER:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setNwType:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setWifiCCA:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setLsmRecommendationBe:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setExpectedThroughputVIBE:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setPacketLifetimeVIBE:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setPacketLossRateVIBE:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setBtRetransmissionRateRx:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setBtRetransmissionRateTx:0];
    [(WRM_iRATProximityRecommendationLogging *)v2 setBtTech:0];
  }
  return v2;
}

- (void)dealloc
{
  if ([(WRM_iRATProximityRecommendationLogging *)self Uuid])
  {

    [(WRM_iRATProximityRecommendationLogging *)self setUuid:0];
  }
  [(WRM_iRATProximityRecommendationLogging *)self setBtRSSI:0];
  [(WRM_iRATProximityRecommendationLogging *)self setWifiSNR:0];
  [(WRM_iRATProximityRecommendationLogging *)self setWifiRSSI:0];
  [(WRM_iRATProximityRecommendationLogging *)self setBeaconPER:0];
  [(WRM_iRATProximityRecommendationLogging *)self setNwType:0];
  [(WRM_iRATProximityRecommendationLogging *)self setWifiCCA:0];
  [(WRM_iRATProximityRecommendationLogging *)self setLsmRecommendationBe:0];
  [(WRM_iRATProximityRecommendationLogging *)self setExpectedThroughputVIBE:0];
  [(WRM_iRATProximityRecommendationLogging *)self setPacketLifetimeVIBE:0];
  [(WRM_iRATProximityRecommendationLogging *)self setPacketLossRateVIBE:0];
  [(WRM_iRATProximityRecommendationLogging *)self setBtRetransmissionRateRx:0];
  [(WRM_iRATProximityRecommendationLogging *)self setBtRetransmissionRateTx:0];
  [(WRM_iRATProximityRecommendationLogging *)self setBtTech:0];
  v3.receiver = self;
  v3.super_class = (Class)WRM_iRATProximityRecommendationLogging;
  [(WRM_iRATProximityRecommendationLogging *)&v3 dealloc];
}

- (NSUUID)Uuid
{
  return self->_Uuid;
}

- (void)setUuid:(id)a3
{
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

- (int)beaconPER
{
  return self->_beaconPER;
}

- (void)setBeaconPER:(int)a3
{
  self->_beaconPER = a3;
}

- (char)nwType
{
  return self->_nwType;
}

- (void)setNwType:(char)a3
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

@end