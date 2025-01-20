@interface WiFiUsageLQMMLOSample
- (WiFiUsageLQMMLOSample)initWith:(apple_mlo_link_lqm *)a3 andDuration:(unint64_t)a4;
- (id)asDictionaryInto:(id)a3;
- (int)band;
- (int64_t)diff_rssicore1_rssicore0;
- (int64_t)rssi_core0;
- (int64_t)rssi_core1;
- (unint64_t)channelWidth;
- (unint64_t)duration;
- (unint64_t)idlePortionOfSamplePercentage;
- (unint64_t)idleTimeMs;
- (unint64_t)rxRate;
- (unint64_t)rxUcastFrames;
- (unint64_t)txFailsOverTxFrames;
- (unint64_t)txFramesTotal;
- (unint64_t)txRate;
- (unint64_t)txRetriesExhaustedOverTxFrames;
- (unsigned)isMLOPreferredLink;
- (void)setBand:(int)a3;
- (void)setChannelWidth:(unint64_t)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setIdlePortionOfSamplePercentage:(unint64_t)a3;
- (void)setIdleTimeMs:(unint64_t)a3;
- (void)setIsMLOPreferredLink:(unsigned __int8)a3;
- (void)setRxUcastFrames:(unint64_t)a3;
- (void)setTxFailsOverTxFrames:(unint64_t)a3;
- (void)setTxFramesTotal:(unint64_t)a3;
- (void)setTxRetriesExhaustedOverTxFrames:(unint64_t)a3;
@end

@implementation WiFiUsageLQMMLOSample

- (WiFiUsageLQMMLOSample)initWith:(apple_mlo_link_lqm *)a3 andDuration:(unint64_t)a4
{
  v16.receiver = self;
  v16.super_class = (Class)WiFiUsageLQMMLOSample;
  v6 = [(WiFiUsageLQMMLOSample *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_duration = a4;
    v6->_isMLOPreferredLink = a3->var0;
    v6->_band = +[WiFiUsagePrivacyFilter bandFromAppleChannelSpec:*(unsigned __int16 *)(&a3->var0 + 1) >> 14];
    v7->_channelWidth = +[WiFiUsagePrivacyFilter channelWidthAppleChannelSpec:(*(unsigned __int16 *)(&a3->var0 + 1) >> 11) & 7];
    uint64_t v8 = (char)a3->var2.octet[1];
    if (!a3->var2.octet[1]) {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v7->_rssi_core0 = v8;
    uint64_t v9 = (char)a3->var2.octet[2];
    if (!a3->var2.octet[2]) {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v7->_rssi_core1 = v9;
    unint64_t var9 = a3->var9;
    v7->_txRate = a3->var8;
    v7->_rxRate = var9;
    unint64_t v11 = *(unsigned int *)&a3->var2.octet[4];
    v7->_idleTimeMs = v11;
    v7->_idlePortionOfSamplePercentage = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", v11, 1000 * a4, +[WiFiUsageLQMTransformations ratioScale]);
    unint64_t var4 = a3->var4;
    v7->_txFramesTotal = var4;
    uint64_t var7 = a3->var7;
    v7->_rxUcastFrames = a3->var6;
    v7->_txRetriesExhaustedOverTxFrames = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", var7, var4, +[WiFiUsageLQMTransformations ratioScale]);
    v7->_txFailsOverTxFrames = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var5, a3->var4, +[WiFiUsageLQMTransformations ratioScale]);
    v14 = v7;
  }

  return v7;
}

- (int64_t)diff_rssicore1_rssicore0
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageLQMMLOSample;
  return objc_msgSend(-[WiFiUsageLQMMLOSample class](&v3, sel_class), "subtract:From:", self->_rssi_core0, self->_rssi_core1);
}

- (id)asDictionaryInto:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA60];
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageLQMMLOSample;
  v5 = [(WiFiUsageLQMSample *)&v11 asDictionaryInto:a3];
  v6 = [v4 dictionaryWithDictionary:v5];

  v7 = +[WiFiUsagePrivacyFilter bandAsString:self->_band];
  [v6 setObject:v7 forKeyedSubscript:@"band"];

  uint64_t v8 = [(WiFiUsageLQMSample *)self numberForKeyPath:@"channelWidth"];
  uint64_t v9 = [v8 stringValue];
  [v6 setObject:v9 forKeyedSubscript:@"channelWidth"];

  return v6;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unsigned)isMLOPreferredLink
{
  return self->_isMLOPreferredLink;
}

- (void)setIsMLOPreferredLink:(unsigned __int8)a3
{
  self->_isMLOPreferredLink = a3;
}

- (int)band
{
  return self->_band;
}

- (void)setBand:(int)a3
{
  self->_band = a3;
}

- (unint64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unint64_t)a3
{
  self->_channelWidth = a3;
}

- (int64_t)rssi_core0
{
  return self->_rssi_core0;
}

- (int64_t)rssi_core1
{
  return self->_rssi_core1;
}

- (unint64_t)idleTimeMs
{
  return self->_idleTimeMs;
}

- (void)setIdleTimeMs:(unint64_t)a3
{
  self->_idleTimeMs = a3;
}

- (unint64_t)idlePortionOfSamplePercentage
{
  return self->_idlePortionOfSamplePercentage;
}

- (void)setIdlePortionOfSamplePercentage:(unint64_t)a3
{
  self->_idlePortionOfSamplePercentage = a3;
}

- (unint64_t)txFramesTotal
{
  return self->_txFramesTotal;
}

- (void)setTxFramesTotal:(unint64_t)a3
{
  self->_txFramesTotal = a3;
}

- (unint64_t)rxUcastFrames
{
  return self->_rxUcastFrames;
}

- (void)setRxUcastFrames:(unint64_t)a3
{
  self->_rxUcastFrames = a3;
}

- (unint64_t)txRetriesExhaustedOverTxFrames
{
  return self->_txRetriesExhaustedOverTxFrames;
}

- (void)setTxRetriesExhaustedOverTxFrames:(unint64_t)a3
{
  self->_txRetriesExhaustedOverTxFrames = a3;
}

- (unint64_t)txFailsOverTxFrames
{
  return self->_txFailsOverTxFrames;
}

- (void)setTxFailsOverTxFrames:(unint64_t)a3
{
  self->_txFailsOverTxFrames = a3;
}

- (unint64_t)txRate
{
  return self->_txRate;
}

- (unint64_t)rxRate
{
  return self->_rxRate;
}

@end