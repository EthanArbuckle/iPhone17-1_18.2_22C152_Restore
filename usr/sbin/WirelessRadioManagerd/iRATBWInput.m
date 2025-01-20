@interface iRATBWInput
- (NSSet)featureNames;
- (double)cca;
- (double)isWfiCaptive;
- (double)maxOfActualLowBandwidth_d;
- (double)tcpRTTAvg;
- (double)weighted_average_phyrate_rx;
- (double)weighted_average_rssi;
- (double)weighted_average_snr;
- (double)wifChannelType;
- (double)wifiguardinterval;
- (double)wifinumberOfSpatialStreams;
- (iRATBWInput)initWithCca:(double)a3 weighted_average_phyrate_rx:(double)a4 weighted_average_rssi:(double)a5 weighted_average_snr:(double)a6 maxOfActualLowBandwidth_d:(double)a7 tcpRTTAvg:(double)a8 wifChannelType:(double)a9 wifiguardinterval:(double)a10 isWfiCaptive:(double)a11 wifinumberOfSpatialStreams:(double)a12;
- (id)featureValueForName:(id)a3;
- (void)setCca:(double)a3;
- (void)setIsWfiCaptive:(double)a3;
- (void)setMaxOfActualLowBandwidth_d:(double)a3;
- (void)setTcpRTTAvg:(double)a3;
- (void)setWeighted_average_phyrate_rx:(double)a3;
- (void)setWeighted_average_rssi:(double)a3;
- (void)setWeighted_average_snr:(double)a3;
- (void)setWifChannelType:(double)a3;
- (void)setWifiguardinterval:(double)a3;
- (void)setWifinumberOfSpatialStreams:(double)a3;
@end

@implementation iRATBWInput

- (iRATBWInput)initWithCca:(double)a3 weighted_average_phyrate_rx:(double)a4 weighted_average_rssi:(double)a5 weighted_average_snr:(double)a6 maxOfActualLowBandwidth_d:(double)a7 tcpRTTAvg:(double)a8 wifChannelType:(double)a9 wifiguardinterval:(double)a10 isWfiCaptive:(double)a11 wifinumberOfSpatialStreams:(double)a12
{
  v21.receiver = self;
  v21.super_class = (Class)iRATBWInput;
  result = [(iRATBWInput *)&v21 init];
  if (result)
  {
    result->_cca = a3;
    result->_weighted_average_phyrate_rx = a4;
    result->_weighted_average_rssi = a5;
    result->_weighted_average_snr = a6;
    result->_maxOfActualLowBandwidth_d = a7;
    result->_tcpRTTAvg = a8;
    result->_wifChannelType = a9;
    result->_wifiguardinterval = a10;
    result->_isWfiCaptive = a11;
    result->_wifinumberOfSpatialStreams = a12;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_10024E1E8];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"cca"])
  {
    uint64_t v5 = 8;
  }
  else if ([a3 isEqualToString:@"weighted_average_phyrate_rx"])
  {
    uint64_t v5 = 16;
  }
  else if ([a3 isEqualToString:@"weighted_average_rssi"])
  {
    uint64_t v5 = 24;
  }
  else if ([a3 isEqualToString:@"weighted_average_snr"])
  {
    uint64_t v5 = 32;
  }
  else if ([a3 isEqualToString:@"maxOfActualLowBandwidth_d"])
  {
    uint64_t v5 = 40;
  }
  else if ([a3 isEqualToString:@"tcpRTTAvg"])
  {
    uint64_t v5 = 48;
  }
  else if ([a3 isEqualToString:@"wifChannelType"])
  {
    uint64_t v5 = 56;
  }
  else if ([a3 isEqualToString:@"wifiguardinterval"])
  {
    uint64_t v5 = 64;
  }
  else if ([a3 isEqualToString:@"isWfiCaptive"])
  {
    uint64_t v5 = 72;
  }
  else
  {
    if (![a3 isEqualToString:@"wifinumberOfSpatialStreams"]) {
      return 0;
    }
    uint64_t v5 = 80;
  }
  v6 = (void *)sub_1000CB9C8();
  double v7 = *(double *)((char *)&self->super.isa + v5);

  return [v6 featureValueWithDouble:v7];
}

- (double)cca
{
  return self->_cca;
}

- (void)setCca:(double)a3
{
  self->_cca = a3;
}

- (double)weighted_average_phyrate_rx
{
  return self->_weighted_average_phyrate_rx;
}

- (void)setWeighted_average_phyrate_rx:(double)a3
{
  self->_weighted_average_phyrate_rx = a3;
}

- (double)weighted_average_rssi
{
  return self->_weighted_average_rssi;
}

- (void)setWeighted_average_rssi:(double)a3
{
  self->_weighted_average_rssi = a3;
}

- (double)weighted_average_snr
{
  return self->_weighted_average_snr;
}

- (void)setWeighted_average_snr:(double)a3
{
  self->_weighted_average_snr = a3;
}

- (double)maxOfActualLowBandwidth_d
{
  return self->_maxOfActualLowBandwidth_d;
}

- (void)setMaxOfActualLowBandwidth_d:(double)a3
{
  self->_maxOfActualLowBandwidth_d = a3;
}

- (double)tcpRTTAvg
{
  return self->_tcpRTTAvg;
}

- (void)setTcpRTTAvg:(double)a3
{
  self->_tcpRTTAvg = a3;
}

- (double)wifChannelType
{
  return self->_wifChannelType;
}

- (void)setWifChannelType:(double)a3
{
  self->_wifChannelType = a3;
}

- (double)wifiguardinterval
{
  return self->_wifiguardinterval;
}

- (void)setWifiguardinterval:(double)a3
{
  self->_wifiguardinterval = a3;
}

- (double)isWfiCaptive
{
  return self->_isWfiCaptive;
}

- (void)setIsWfiCaptive:(double)a3
{
  self->_isWfiCaptive = a3;
}

- (double)wifinumberOfSpatialStreams
{
  return self->_wifinumberOfSpatialStreams;
}

- (void)setWifinumberOfSpatialStreams:(double)a3
{
  self->_wifinumberOfSpatialStreams = a3;
}

@end