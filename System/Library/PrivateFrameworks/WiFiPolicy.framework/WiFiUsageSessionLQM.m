@interface WiFiUsageSessionLQM
- (NSDate)initializationTime;
- (NSDate)lastUpdatedTime;
- (WiFiUsageSessionLQM)initWithLQMSample:(id)a3 forInterface:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventDictionary:(BOOL)a3;
- (int64_t)avgBeaconPer;
- (int64_t)avgInterference;
- (int64_t)avgNoise;
- (int64_t)avgOtherCca;
- (int64_t)avgRssi;
- (int64_t)avgSelfCca;
- (int64_t)avgSnr;
- (int64_t)avgTotalCca;
- (int64_t)count_of_LQMsamples;
- (int64_t)count_of_core0Samples;
- (int64_t)count_of_core1Samples;
- (int64_t)interference40to50;
- (int64_t)interference50to60;
- (int64_t)interference60to70;
- (int64_t)interference70to75;
- (int64_t)interference75to80;
- (int64_t)interference80to85;
- (int64_t)interference85to90;
- (int64_t)interferenceGt90;
- (int64_t)interferenceLt40;
- (int64_t)lastRssi;
- (int64_t)maxBeaconPer;
- (int64_t)maxInterference;
- (int64_t)maxNoise;
- (int64_t)maxOtherCca;
- (int64_t)maxRssi;
- (int64_t)maxSelfCca;
- (int64_t)maxSnr;
- (int64_t)maxTotalCca;
- (int64_t)minBeaconPer;
- (int64_t)minInterference;
- (int64_t)minNoise;
- (int64_t)minOtherCca;
- (int64_t)minRssi;
- (int64_t)minSelfCca;
- (int64_t)minSnr;
- (int64_t)minTotalCca;
- (int64_t)otherCca40to50;
- (int64_t)otherCca50to60;
- (int64_t)otherCca60to70;
- (int64_t)otherCca70to75;
- (int64_t)otherCca75to80;
- (int64_t)otherCca80to85;
- (int64_t)otherCca85to90;
- (int64_t)otherCcaGt90;
- (int64_t)otherCcaLt40;
- (int64_t)rssi40to50;
- (int64_t)rssi50to60;
- (int64_t)rssi60to65;
- (int64_t)rssi65to70;
- (int64_t)rssi70to75;
- (int64_t)rssi75to80;
- (int64_t)rssi80to85;
- (int64_t)rssi85to90;
- (int64_t)rssiGt40;
- (int64_t)rssiLt90;
- (int64_t)selfCca40to50;
- (int64_t)selfCca50to60;
- (int64_t)selfCca60to70;
- (int64_t)selfCca70to75;
- (int64_t)selfCca75to80;
- (int64_t)selfCca80to85;
- (int64_t)selfCca85to90;
- (int64_t)selfCcaGt90;
- (int64_t)selfCcaLt40;
- (int64_t)sum_of_RSSI;
- (int64_t)sum_of_core0rssiDiff;
- (int64_t)sum_of_core1rssiDiff;
- (int64_t)totalCca40to50;
- (int64_t)totalCca50to60;
- (int64_t)totalCca60to70;
- (int64_t)totalCca70to75;
- (int64_t)totalCca75to80;
- (int64_t)totalCca80to85;
- (int64_t)totalCca85to90;
- (int64_t)totalCcaGt90;
- (int64_t)totalCcaLt40;
- (unint64_t)avgDecodingAttemptsPerSecond;
- (unint64_t)avgRxBadFcsPerSecond;
- (unint64_t)avgRxBytesOverRxFrames;
- (unint64_t)avgRxFramesPerSecond;
- (unint64_t)avgRxRate;
- (unint64_t)avgRxRetriesOverRxFrames;
- (unint64_t)avgRxStartPortion;
- (unint64_t)avgTxBytesOverTxFrames;
- (unint64_t)avgTxFailsOverTxFrames;
- (unint64_t)avgTxFramesPerSecond;
- (unint64_t)avgTxRate;
- (unint64_t)avgTxRetriesOverTxFrames;
- (unint64_t)maxDecodingAttemptsPerSecond;
- (unint64_t)maxRxBadFcsPerSecond;
- (unint64_t)maxRxBytesOverRxFrames;
- (unint64_t)maxRxFramesPerSecond;
- (unint64_t)maxRxRate;
- (unint64_t)maxRxRetriesOverRxFrames;
- (unint64_t)maxRxStartPortion;
- (unint64_t)maxTxBytesOverTxFrames;
- (unint64_t)maxTxFailsOverTxFrames;
- (unint64_t)maxTxFramesPerSecond;
- (unint64_t)maxTxRate;
- (unint64_t)maxTxRetriesOverTxFrames;
- (unint64_t)minDecodingAttemptsPerSecond;
- (unint64_t)minRxBadFcsPerSecond;
- (unint64_t)minRxBytesOverRxFrames;
- (unint64_t)minRxFramesPerSecond;
- (unint64_t)minRxRate;
- (unint64_t)minRxRetriesOverRxFrames;
- (unint64_t)minRxStartPortion;
- (unint64_t)minTxBytesOverTxFrames;
- (unint64_t)minTxFailsOverTxFrames;
- (unint64_t)minTxFramesPerSecond;
- (unint64_t)minTxRate;
- (unint64_t)minTxRetriesOverTxFrames;
- (unint64_t)totalDecodingAttempts;
- (unint64_t)totalRxBadFcs;
- (unint64_t)totalRxFrames;
- (unint64_t)totalRxStartPortion;
- (unint64_t)totalTxFrames;
- (void)reset;
- (void)setAvgBeaconPer:(int64_t)a3;
- (void)setAvgDecodingAttemptsPerSecond:(unint64_t)a3;
- (void)setAvgInterference:(int64_t)a3;
- (void)setAvgNoise:(int64_t)a3;
- (void)setAvgOtherCca:(int64_t)a3;
- (void)setAvgRssi:(int64_t)a3;
- (void)setAvgRxBadFcsPerSecond:(unint64_t)a3;
- (void)setAvgRxBytesOverRxFrames:(unint64_t)a3;
- (void)setAvgRxFramesPerSecond:(unint64_t)a3;
- (void)setAvgRxRate:(unint64_t)a3;
- (void)setAvgRxRetriesOverRxFrames:(unint64_t)a3;
- (void)setAvgRxStartPortion:(unint64_t)a3;
- (void)setAvgSelfCca:(int64_t)a3;
- (void)setAvgSnr:(int64_t)a3;
- (void)setAvgTotalCca:(int64_t)a3;
- (void)setAvgTxBytesOverTxFrames:(unint64_t)a3;
- (void)setAvgTxFailsOverTxFrames:(unint64_t)a3;
- (void)setAvgTxFramesPerSecond:(unint64_t)a3;
- (void)setAvgTxRate:(unint64_t)a3;
- (void)setAvgTxRetriesOverTxFrames:(unint64_t)a3;
- (void)setCount_of_LQMsamples:(int64_t)a3;
- (void)setCount_of_core0Samples:(int64_t)a3;
- (void)setCount_of_core1Samples:(int64_t)a3;
- (void)setInitializationTime:(id)a3;
- (void)setInterference40to50:(int64_t)a3;
- (void)setInterference50to60:(int64_t)a3;
- (void)setInterference60to70:(int64_t)a3;
- (void)setInterference70to75:(int64_t)a3;
- (void)setInterference75to80:(int64_t)a3;
- (void)setInterference80to85:(int64_t)a3;
- (void)setInterference85to90:(int64_t)a3;
- (void)setInterferenceGt90:(int64_t)a3;
- (void)setInterferenceLt40:(int64_t)a3;
- (void)setLastRssi:(int64_t)a3;
- (void)setLastUpdatedTime:(id)a3;
- (void)setMaxBeaconPer:(int64_t)a3;
- (void)setMaxDecodingAttemptsPerSecond:(unint64_t)a3;
- (void)setMaxInterference:(int64_t)a3;
- (void)setMaxNoise:(int64_t)a3;
- (void)setMaxOtherCca:(int64_t)a3;
- (void)setMaxRssi:(int64_t)a3;
- (void)setMaxRxBadFcsPerSecond:(unint64_t)a3;
- (void)setMaxRxBytesOverRxFrames:(unint64_t)a3;
- (void)setMaxRxFramesPerSecond:(unint64_t)a3;
- (void)setMaxRxRate:(unint64_t)a3;
- (void)setMaxRxRetriesOverRxFrames:(unint64_t)a3;
- (void)setMaxRxStartPortion:(unint64_t)a3;
- (void)setMaxSelfCca:(int64_t)a3;
- (void)setMaxSnr:(int64_t)a3;
- (void)setMaxTotalCca:(int64_t)a3;
- (void)setMaxTxBytesOverTxFrames:(unint64_t)a3;
- (void)setMaxTxFailsOverTxFrames:(unint64_t)a3;
- (void)setMaxTxFramesPerSecond:(unint64_t)a3;
- (void)setMaxTxRate:(unint64_t)a3;
- (void)setMaxTxRetriesOverTxFrames:(unint64_t)a3;
- (void)setMinBeaconPer:(int64_t)a3;
- (void)setMinDecodingAttemptsPerSecond:(unint64_t)a3;
- (void)setMinInterference:(int64_t)a3;
- (void)setMinNoise:(int64_t)a3;
- (void)setMinOtherCca:(int64_t)a3;
- (void)setMinRssi:(int64_t)a3;
- (void)setMinRxBadFcsPerSecond:(unint64_t)a3;
- (void)setMinRxBytesOverRxFrames:(unint64_t)a3;
- (void)setMinRxFramesPerSecond:(unint64_t)a3;
- (void)setMinRxRate:(unint64_t)a3;
- (void)setMinRxRetriesOverRxFrames:(unint64_t)a3;
- (void)setMinRxStartPortion:(unint64_t)a3;
- (void)setMinSelfCca:(int64_t)a3;
- (void)setMinSnr:(int64_t)a3;
- (void)setMinTotalCca:(int64_t)a3;
- (void)setMinTxBytesOverTxFrames:(unint64_t)a3;
- (void)setMinTxFailsOverTxFrames:(unint64_t)a3;
- (void)setMinTxFramesPerSecond:(unint64_t)a3;
- (void)setMinTxRate:(unint64_t)a3;
- (void)setMinTxRetriesOverTxFrames:(unint64_t)a3;
- (void)setOtherCca40to50:(int64_t)a3;
- (void)setOtherCca50to60:(int64_t)a3;
- (void)setOtherCca60to70:(int64_t)a3;
- (void)setOtherCca70to75:(int64_t)a3;
- (void)setOtherCca75to80:(int64_t)a3;
- (void)setOtherCca80to85:(int64_t)a3;
- (void)setOtherCca85to90:(int64_t)a3;
- (void)setOtherCcaGt90:(int64_t)a3;
- (void)setOtherCcaLt40:(int64_t)a3;
- (void)setRssi40to50:(int64_t)a3;
- (void)setRssi50to60:(int64_t)a3;
- (void)setRssi60to65:(int64_t)a3;
- (void)setRssi65to70:(int64_t)a3;
- (void)setRssi70to75:(int64_t)a3;
- (void)setRssi75to80:(int64_t)a3;
- (void)setRssi80to85:(int64_t)a3;
- (void)setRssi85to90:(int64_t)a3;
- (void)setRssiGt40:(int64_t)a3;
- (void)setRssiLt90:(int64_t)a3;
- (void)setSelfCca40to50:(int64_t)a3;
- (void)setSelfCca50to60:(int64_t)a3;
- (void)setSelfCca60to70:(int64_t)a3;
- (void)setSelfCca70to75:(int64_t)a3;
- (void)setSelfCca75to80:(int64_t)a3;
- (void)setSelfCca80to85:(int64_t)a3;
- (void)setSelfCca85to90:(int64_t)a3;
- (void)setSelfCcaGt90:(int64_t)a3;
- (void)setSelfCcaLt40:(int64_t)a3;
- (void)setSum_of_RSSI:(int64_t)a3;
- (void)setSum_of_core0rssiDiff:(int64_t)a3;
- (void)setSum_of_core1rssiDiff:(int64_t)a3;
- (void)setTotalCca40to50:(int64_t)a3;
- (void)setTotalCca50to60:(int64_t)a3;
- (void)setTotalCca60to70:(int64_t)a3;
- (void)setTotalCca70to75:(int64_t)a3;
- (void)setTotalCca75to80:(int64_t)a3;
- (void)setTotalCca80to85:(int64_t)a3;
- (void)setTotalCca85to90:(int64_t)a3;
- (void)setTotalCcaGt90:(int64_t)a3;
- (void)setTotalCcaLt40:(int64_t)a3;
- (void)setTotalDecodingAttempts:(unint64_t)a3;
- (void)setTotalRxBadFcs:(unint64_t)a3;
- (void)setTotalRxFrames:(unint64_t)a3;
- (void)setTotalRxStartPortion:(unint64_t)a3;
- (void)setTotalTxFrames:(unint64_t)a3;
- (void)updateAverageOf:(id)a3 with:(int64_t)a4 forSession:(unint64_t)a5;
- (void)updateLinkQuality:(id)a3 forSession:(unint64_t)a4;
@end

@implementation WiFiUsageSessionLQM

- (void)setAvgTxFramesPerSecond:(unint64_t)a3
{
  self->_avgTxFramesPerSecond = a3;
}

- (void)setAvgTotalCca:(int64_t)a3
{
  self->_avgTotalCca = a3;
}

- (void)setAvgSnr:(int64_t)a3
{
  self->_avgSnr = a3;
}

- (void)setAvgSelfCca:(int64_t)a3
{
  self->_avgSelfCca = a3;
}

- (void)setAvgRxFramesPerSecond:(unint64_t)a3
{
  self->_avgRxFramesPerSecond = a3;
}

- (void)setAvgRssi:(int64_t)a3
{
  self->_avgRssi = a3;
}

- (void)setAvgOtherCca:(int64_t)a3
{
  self->_avgOtherCca = a3;
}

- (void)setAvgNoise:(int64_t)a3
{
  self->_avgNoise = a3;
}

- (void)setAvgInterference:(int64_t)a3
{
  self->_avgInterference = a3;
}

- (void)setAvgBeaconPer:(int64_t)a3
{
  self->_avgBeaconPer = a3;
}

- (unint64_t)avgTxFramesPerSecond
{
  return self->_avgTxFramesPerSecond;
}

- (int64_t)avgTotalCca
{
  return self->_avgTotalCca;
}

- (int64_t)avgSnr
{
  return self->_avgSnr;
}

- (int64_t)avgSelfCca
{
  return self->_avgSelfCca;
}

- (unint64_t)avgRxFramesPerSecond
{
  return self->_avgRxFramesPerSecond;
}

- (int64_t)avgRssi
{
  return self->_avgRssi;
}

- (int64_t)avgOtherCca
{
  return self->_avgOtherCca;
}

- (int64_t)avgNoise
{
  return self->_avgNoise;
}

- (int64_t)avgInterference
{
  return self->_avgInterference;
}

- (int64_t)avgBeaconPer
{
  return self->_avgBeaconPer;
}

- (void)setAvgRxRetriesOverRxFrames:(unint64_t)a3
{
  self->_avgRxRetriesOverRxFrames = a3;
}

- (void)setAvgRxBytesOverRxFrames:(unint64_t)a3
{
  self->_avgRxBytesOverRxFrames = a3;
}

- (unint64_t)avgRxRetriesOverRxFrames
{
  return self->_avgRxRetriesOverRxFrames;
}

- (unint64_t)avgRxBytesOverRxFrames
{
  return self->_avgRxBytesOverRxFrames;
}

- (void)setAvgTxRetriesOverTxFrames:(unint64_t)a3
{
  self->_avgTxRetriesOverTxFrames = a3;
}

- (void)setAvgTxFailsOverTxFrames:(unint64_t)a3
{
  self->_avgTxFailsOverTxFrames = a3;
}

- (void)setAvgTxBytesOverTxFrames:(unint64_t)a3
{
  self->_avgTxBytesOverTxFrames = a3;
}

- (unint64_t)avgTxRetriesOverTxFrames
{
  return self->_avgTxRetriesOverTxFrames;
}

- (unint64_t)avgTxFailsOverTxFrames
{
  return self->_avgTxFailsOverTxFrames;
}

- (unint64_t)avgTxBytesOverTxFrames
{
  return self->_avgTxBytesOverTxFrames;
}

- (void)updateLinkQuality:(id)a3 forSession:(unint64_t)a4
{
  id v44 = a3;
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = v6;
  lastUpdatedTime = self->_lastUpdatedTime;
  if (!lastUpdatedTime) {
    lastUpdatedTime = self->_initializationTime;
  }
  [v6 timeIntervalSinceDate:lastUpdatedTime];
  double v10 = v9;
  if (!self->_initializationTime) {
    [(WiFiUsageSessionLQM *)self setInitializationTime:v7];
  }
  if (!self->_lastUpdatedTime || v10 >= 1.0)
  {
    [(WiFiUsageSessionLQM *)self setLastUpdatedTime:v7];
    ++self->_count_of_LQMsamples;
    unint64_t v11 = [v44 rssi];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v12 = v11;
      if ((uint64_t)v11 <= -41)
      {
        if (v11 <= 0xFFFFFFFFFFFFFFCDLL)
        {
          if (v11 <= 0xFFFFFFFFFFFFFFC3)
          {
            if (v11 <= 0xFFFFFFFFFFFFFFBELL)
            {
              if (v11 <= 0xFFFFFFFFFFFFFFB9)
              {
                if (v11 <= 0xFFFFFFFFFFFFFFB4)
                {
                  if (v11 <= 0xFFFFFFFFFFFFFFAFLL)
                  {
                    if (v11 <= 0xFFFFFFFFFFFFFFAALL)
                    {
                      uint64_t v13 = 120;
                      if (v11 > 0xFFFFFFFFFFFFFFA5) {
                        uint64_t v13 = 112;
                      }
                    }
                    else
                    {
                      uint64_t v13 = 104;
                    }
                  }
                  else
                  {
                    uint64_t v13 = 96;
                  }
                }
                else
                {
                  uint64_t v13 = 88;
                }
              }
              else
              {
                uint64_t v13 = 80;
              }
            }
            else
            {
              uint64_t v13 = 72;
            }
          }
          else
          {
            uint64_t v13 = 64;
          }
        }
        else
        {
          uint64_t v13 = 56;
        }
      }
      else
      {
        uint64_t v13 = 48;
      }
      *(Class *)((char *)&self->super.isa + v13) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v13));
      if ((int64_t)v11 > self->_maxRssi) {
        self->_maxRssi = v11;
      }
      if ((int64_t)v11 < self->_minRssi) {
        self->_minRssi = v11;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"Rssi" with:v11 forSession:a4];
      self->_lastRssi = v12;
      self->_sum_of_RSSI += v12;
      if (objc_msgSend(v44, "rssi_core0") != 0x7FFFFFFFFFFFFFFFLL)
      {
        ++self->_count_of_core0Samples;
        self->_sum_of_core0rssiDiff += v12 - objc_msgSend(v44, "rssi_core0");
      }
      if (objc_msgSend(v44, "rssi_core1") != 0x7FFFFFFFFFFFFFFFLL)
      {
        ++self->_count_of_core1Samples;
        self->_sum_of_core1rssiDiff += v12 - objc_msgSend(v44, "rssi_core1");
      }
    }
    uint64_t v14 = [v44 noise];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v14 > self->_maxNoise) {
        self->_maxNoise = v14;
      }
      if (v14 < self->_minNoise) {
        self->_minNoise = v14;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"Noise" with:v14 forSession:a4];
    }
    uint64_t v15 = [v44 snr];
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15 > self->_maxSnr) {
        self->_maxSnr = v15;
      }
      if (v15 < self->_minSnr) {
        self->_minSnr = v15;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"Snr" with:v15 forSession:a4];
    }
    uint64_t v16 = [v44 beaconPer];
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v16 > self->_maxBeaconPer) {
        self->_maxBeaconPer = v16;
      }
      if (v16 < self->_minBeaconPer) {
        self->_minBeaconPer = v16;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"BeaconPer" with:v16 forSession:a4];
    }
    unint64_t v17 = [v44 selfCca];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((uint64_t)v17 >= 40)
      {
        if (v17 >= 0x32)
        {
          if (v17 >= 0x3C)
          {
            if (v17 >= 0x46)
            {
              if (v17 >= 0x4B)
              {
                if (v17 >= 0x50)
                {
                  if (v17 >= 0x55)
                  {
                    uint64_t v18 = 376;
                    if (v17 < 0x5A) {
                      uint64_t v18 = 368;
                    }
                  }
                  else
                  {
                    uint64_t v18 = 360;
                  }
                }
                else
                {
                  uint64_t v18 = 352;
                }
              }
              else
              {
                uint64_t v18 = 344;
              }
            }
            else
            {
              uint64_t v18 = 336;
            }
          }
          else
          {
            uint64_t v18 = 328;
          }
        }
        else
        {
          uint64_t v18 = 320;
        }
      }
      else
      {
        uint64_t v18 = 312;
      }
      *(Class *)((char *)&self->super.isa + v18) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v18));
      if ((int64_t)v17 > self->_maxSelfCca) {
        self->_maxSelfCca = v17;
      }
      if ((int64_t)v17 < self->_minSelfCca) {
        self->_minSelfCca = v17;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"SelfCca" with:v17 forSession:a4];
    }
    unint64_t v19 = [v44 otherCca];
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((uint64_t)v19 >= 40)
      {
        if (v19 >= 0x32)
        {
          if (v19 >= 0x3C)
          {
            if (v19 >= 0x46)
            {
              if (v19 >= 0x4B)
              {
                if (v19 >= 0x50)
                {
                  if (v19 >= 0x55)
                  {
                    uint64_t v20 = 472;
                    if (v19 < 0x5A) {
                      uint64_t v20 = 464;
                    }
                  }
                  else
                  {
                    uint64_t v20 = 456;
                  }
                }
                else
                {
                  uint64_t v20 = 448;
                }
              }
              else
              {
                uint64_t v20 = 440;
              }
            }
            else
            {
              uint64_t v20 = 432;
            }
          }
          else
          {
            uint64_t v20 = 424;
          }
        }
        else
        {
          uint64_t v20 = 416;
        }
      }
      else
      {
        uint64_t v20 = 408;
      }
      *(Class *)((char *)&self->super.isa + v20) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v20));
      if ((int64_t)v19 > self->_maxOtherCca) {
        self->_maxOtherCca = v19;
      }
      if ((int64_t)v19 < self->_minOtherCca) {
        self->_minOtherCca = v19;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"OtherCca" with:v19 forSession:a4];
    }
    unint64_t v21 = [v44 interference];
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((uint64_t)v21 >= 40)
      {
        if (v21 >= 0x32)
        {
          if (v21 >= 0x3C)
          {
            if (v21 >= 0x46)
            {
              if (v21 >= 0x4B)
              {
                if (v21 >= 0x50)
                {
                  if (v21 >= 0x55)
                  {
                    uint64_t v22 = 568;
                    if (v21 < 0x5A) {
                      uint64_t v22 = 560;
                    }
                  }
                  else
                  {
                    uint64_t v22 = 552;
                  }
                }
                else
                {
                  uint64_t v22 = 544;
                }
              }
              else
              {
                uint64_t v22 = 536;
              }
            }
            else
            {
              uint64_t v22 = 528;
            }
          }
          else
          {
            uint64_t v22 = 520;
          }
        }
        else
        {
          uint64_t v22 = 512;
        }
      }
      else
      {
        uint64_t v22 = 504;
      }
      *(Class *)((char *)&self->super.isa + v22) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v22));
      if ((int64_t)v21 > self->_maxInterference) {
        self->_maxInterference = v21;
      }
      if ((int64_t)v21 < self->_minInterference) {
        self->_minInterference = v21;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"Interference" with:v21 forSession:a4];
    }
    unint64_t v23 = [v44 totalReportedCca];
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((uint64_t)v23 >= 40)
      {
        if (v23 >= 0x32)
        {
          if (v23 >= 0x3C)
          {
            if (v23 >= 0x46)
            {
              if (v23 >= 0x4B)
              {
                if (v23 >= 0x50)
                {
                  if (v23 >= 0x55)
                  {
                    uint64_t v24 = 664;
                    if (v23 < 0x5A) {
                      uint64_t v24 = 656;
                    }
                  }
                  else
                  {
                    uint64_t v24 = 648;
                  }
                }
                else
                {
                  uint64_t v24 = 640;
                }
              }
              else
              {
                uint64_t v24 = 632;
              }
            }
            else
            {
              uint64_t v24 = 624;
            }
          }
          else
          {
            uint64_t v24 = 616;
          }
        }
        else
        {
          uint64_t v24 = 608;
        }
      }
      else
      {
        uint64_t v24 = 600;
      }
      *(Class *)((char *)&self->super.isa + v24) = (Class)(uint64_t)(v10
                                                                  + (double)*(uint64_t *)((char *)&self->super.isa + v24));
      if ((int64_t)v23 > self->_maxTotalCca) {
        self->_maxTotalCca = v23;
      }
      if ((int64_t)v23 < self->_minTotalCca) {
        self->_minTotalCca = v23;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"TotalCca" with:v23 forSession:a4];
    }
    unint64_t v25 = [v44 txBytesOverTxFrames];
    unint64_t v26 = v25;
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v25 < self->_minTxBytesOverTxFrames) {
        self->_minTxBytesOverTxFrames = v25;
      }
      if (v25 > self->_maxTxBytesOverTxFrames) {
        self->_maxTxBytesOverTxFrames = v25;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"TxBytesOverTxFrames" with:v25 forSession:a4];
    }
    unint64_t v27 = [v44 rxBytesOverRxFrames];
    if (v27 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v27 < self->_minRxBytesOverRxFrames) {
        self->_minRxBytesOverRxFrames = v27;
      }
      if (v27 > self->_maxRxBytesOverRxFrames) {
        self->_maxRxBytesOverRxFrames = v27;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"RxBytesOverRxFrames" with:v26 forSession:a4];
    }
    unint64_t v28 = [v44 txFrames];
    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v29 = v28;
      unint64_t v30 = (unint64_t)((double)v28 / v10);
      if (self->_minTxFramesPerSecond > v30) {
        self->_minTxFramesPerSecond = v30;
      }
      if (self->_maxTxFramesPerSecond < v30) {
        self->_maxTxFramesPerSecond = v30;
      }
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", @"TxFramesPerSecond");
      self->_totalTxFrames += v29;
    }
    unint64_t v31 = [v44 rxFrames];
    if (v31 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v32 = v31;
      unint64_t v33 = (unint64_t)((double)v31 / v10);
      if (self->_minRxFramesPerSecond > v33) {
        self->_minRxFramesPerSecond = v33;
      }
      if (self->_maxRxFramesPerSecond < v33) {
        self->_maxRxFramesPerSecond = v33;
      }
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", @"RxFramesPerSecond");
      self->_totalRxFrames += v32;
    }
    unint64_t v34 = [v44 txFailsOverTxFrames];
    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v34 < self->_minTxFailsOverTxFrames) {
        self->_minTxFailsOverTxFrames = v34;
      }
      if (v34 > self->_maxTxFailsOverTxFrames) {
        self->_maxTxFailsOverTxFrames = v34;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"TxFailsOverTxFrames" with:v34 forSession:a4];
    }
    unint64_t v35 = [v44 txRetriesOverTxFrames];
    if (v35 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v35 < self->_minTxRetriesOverTxFrames) {
        self->_minTxRetriesOverTxFrames = v35;
      }
      if (v35 > self->_maxTxRetriesOverTxFrames) {
        self->_maxTxRetriesOverTxFrames = v35;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"TxRetriesOverTxFrames" with:v35 forSession:a4];
    }
    unint64_t v36 = [v44 rxRetriesOverRxFrames];
    if (v36 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v36 < self->_minRxRetriesOverRxFrames) {
        self->_minRxRetriesOverRxFrames = v36;
      }
      if (v36 > self->_maxRxRetriesOverRxFrames) {
        self->_maxRxRetriesOverRxFrames = v36;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"RxRetriesOverRxFrames" with:v36 forSession:a4];
    }
    unint64_t v37 = [v44 decodingAttempts];
    if (v37 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v38 = v37;
      unint64_t v39 = (unint64_t)((double)v37 / v10);
      if (self->_minDecodingAttemptsPerSecond > v39) {
        self->_minDecodingAttemptsPerSecond = v39;
      }
      if (self->_maxDecodingAttemptsPerSecond < v39) {
        self->_maxDecodingAttemptsPerSecond = v39;
      }
      -[WiFiUsageSessionLQM updateAverageOf:with:forSession:](self, "updateAverageOf:with:forSession:", @"DecodingAttemptsPerSecond");
      self->_totalDecodingAttempts += v38;
    }
    unint64_t v40 = [v44 rxStartOverDecodingAttemptsPercentage];
    if (v40 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v41 = v40;
      if (v40 < self->_minRxStartPortion) {
        self->_minRxStartPortion = v40;
      }
      if (v40 > self->_maxRxStartPortion) {
        self->_maxRxStartPortion = v40;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"RxStartPortion" with:v40 forSession:a4];
      self->_totalRxStartPortion += v41;
    }
    unint64_t v42 = [v44 txRate];
    if (v42 && v42 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v42 > self->_maxTxRate) {
        self->_maxTxRate = v42;
      }
      if (v42 < self->_minTxRate) {
        self->_minTxRate = v42;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"TxRate" with:v42 forSession:a4];
    }
    unint64_t v43 = [v44 rxRate];
    if (v43 && v43 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v43 > self->_maxRxRate) {
        self->_maxRxRate = v43;
      }
      if (v43 < self->_minRxRate) {
        self->_minRxRate = v43;
      }
      [(WiFiUsageSessionLQM *)self updateAverageOf:@"RxRate" with:v43 forSession:a4];
    }
  }
}

- (void)updateAverageOf:(id)a3 with:(int64_t)a4 forSession:(unint64_t)a5
{
  id v13 = [NSString stringWithFormat:@"avg%@", a3];
  v8 = -[WiFiUsageSessionLQM valueForKey:](self, "valueForKey:");
  uint64_t v9 = [v8 integerValue];

  if (v9)
  {
    int64_t count_of_LQMsamples = self->_count_of_LQMsamples;
    if (count_of_LQMsamples >= 2)
    {
      if (a5 <= 9)
      {
        if (((1 << a5) & 0x2C2) != 0)
        {
          double v11 = ((double)a4 + (double)(count_of_LQMsamples - 1) * (double)v9) / (double)count_of_LQMsamples;
LABEL_8:
          a4 = (uint64_t)v11;
          goto LABEL_9;
        }
        if (((1 << a5) & 0x38) != 0)
        {
          double v11 = (double)(v9 + a4) * 0.5;
          goto LABEL_8;
        }
      }
      NSLog(&cfstr_SUnexpectedWeD.isa, "-[WiFiUsageSessionLQM updateAverageOf:with:forSession:]", a5);
      a4 = 0;
    }
  }
LABEL_9:
  int64_t v12 = [NSNumber numberWithInteger:a4];
  [(WiFiUsageSessionLQM *)self setValue:v12 forKey:v13];
}

- (void)setLastUpdatedTime:(id)a3
{
}

- (void)reset
{
  self->_minRssi = 0x7FFFFFFFFFFFFFFFLL;
  *(_OWORD *)&self->_avgRssi = 0u;
  *(_OWORD *)&self->_rssiGt40 = 0u;
  *(_OWORD *)&self->_rssi50to60 = 0u;
  *(_OWORD *)&self->_rssi65to70 = 0u;
  *(_OWORD *)&self->_rssi75to80 = 0u;
  *(_OWORD *)&self->_rssi85to90 = 0u;
  *(_OWORD *)&self->_int64_t count_of_LQMsamples = xmmword_1D3D95B40;
  self->_sum_of_RSSI = 0;
  *(_OWORD *)&self->_sum_of_core0rssiDiff = 0u;
  *(_OWORD *)&self->_maxNoise = xmmword_1D3D95B50;
  *(_OWORD *)&self->_avgNoise = 0u;
  *(_OWORD *)&self->_minSnr = xmmword_1D3D95B60;
  *(_OWORD *)&self->_maxBeaconPer = xmmword_1D3D95B70;
  *(_OWORD *)&self->_avgBeaconPer = 0u;
  *(_OWORD *)&self->_minTxRate = xmmword_1D3D95B80;
  self->_maxRxRate = 0;
  *(_OWORD *)&self->_minRxRate = xmmword_1D3D95B80;
  *(_OWORD *)&self->_maxSelfCca = xmmword_1D3D95B70;
  *(_OWORD *)&self->_selfCca60to70 = 0u;
  *(_OWORD *)&self->_selfCca75to80 = 0u;
  *(_OWORD *)&self->_avgSelfCca = 0u;
  *(_OWORD *)&self->_selfCca40to50 = 0u;
  *(_OWORD *)&self->_selfCca85to90 = 0u;
  *(_OWORD *)&self->_maxOtherCca = xmmword_1D3D95B70;
  *(_OWORD *)&self->_otherCca60to70 = 0u;
  *(_OWORD *)&self->_otherCca75to80 = 0u;
  *(_OWORD *)&self->_avgOtherCca = 0u;
  *(_OWORD *)&self->_otherCca40to50 = 0u;
  *(_OWORD *)&self->_otherCca85to90 = 0u;
  *(_OWORD *)&self->_maxInterference = xmmword_1D3D95B70;
  *(_OWORD *)&self->_interference60to70 = 0u;
  *(_OWORD *)&self->_interference75to80 = 0u;
  *(_OWORD *)&self->_avgInterference = 0u;
  *(_OWORD *)&self->_interference40to50 = 0u;
  *(_OWORD *)&self->_interference85to90 = 0u;
  *(_OWORD *)&self->_maxTotalCca = xmmword_1D3D95B70;
  *(_OWORD *)&self->_totalCca60to70 = 0u;
  *(_OWORD *)&self->_totalCca75to80 = 0u;
  *(_OWORD *)&self->_avgTotalCca = 0u;
  *(_OWORD *)&self->_totalCca40to50 = 0u;
  *(_OWORD *)&self->_totalCca85to90 = 0u;
  *(_OWORD *)&self->_avgTxBytesOverTxFrames = xmmword_1D3D95B90;
  *(_OWORD *)&self->_maxTxBytesOverTxFrames = 0u;
  *(_OWORD *)&self->_minRxBytesOverRxFrames = xmmword_1D3D95B80;
  *(_OWORD *)&self->_totalTxFrames = 0u;
  *(_OWORD *)&self->_minTxFramesPerSecond = xmmword_1D3D95B80;
  *(_OWORD *)&self->_totalRxFrames = 0u;
  *(_OWORD *)&self->_minRxFramesPerSecond = xmmword_1D3D95B80;
  *(_OWORD *)&self->_avgTxFailsOverTxFrames = xmmword_1D3D95B90;
  *(_OWORD *)&self->_maxTxFailsOverTxFrames = 0u;
  *(_OWORD *)&self->_minTxRetriesOverTxFrames = xmmword_1D3D95B80;
  *(_OWORD *)&self->_avgRxRetriesOverRxFrames = xmmword_1D3D95B90;
  self->_maxRxRetriesOverRxFrames = 0;
  self->_minDecodingAttemptsPerSecond = -1;
  self->_maxDecodingAttemptsPerSecond = 0;
  *(_OWORD *)&self->_totalDecodingAttempts = 0u;
  self->_minRxBadFcsPerSecond = -1;
  self->_maxRxBadFcsPerSecond = 0;
  *(_OWORD *)&self->_totalRxBadFcs = 0u;
  self->_minRxStartPortion = -1;
  self->_maxRxStartPortion = 0;
  *(_OWORD *)&self->_totalRxStartPortion = 0u;
  lastUpdatedTime = self->_lastUpdatedTime;
  self->_lastUpdatedTime = 0;

  initializationTime = self->_initializationTime;
  self->_initializationTime = 0;
}

- (void)setInitializationTime:(id)a3
{
}

- (WiFiUsageSessionLQM)initWithLQMSample:(id)a3 forInterface:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    v7 = [MEMORY[0x1E4F1C9C8] date];
    v10.receiver = self;
    v10.super_class = (Class)WiFiUsageSessionLQM;
    v8 = [(WiFiUsageSessionLQM *)&v10 init];
    [(WiFiUsageSessionLQM *)v8 reset];
    [(WiFiUsageSessionLQM *)v8 setInitializationTime:v7];
    [(WiFiUsageSessionLQM *)v8 updateLinkQuality:v6 forSession:1];
    self = v8;

    a4 = self;
  }
  else
  {
    NSLog(&cfstr_SCannotCreateS.isa, "-[WiFiUsageSessionLQM initWithLQMSample:forInterface:]", 0);
  }

  return (WiFiUsageSessionLQM *)a4;
}

- (id)eventDictionary:(BOOL)a3
{
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!a3)
  {
    id v6 = +[WiFiUsagePrivacyFilter localTimestamp:self->_initializationTime];
    [v5 setObject:v6 forKeyedSubscript:@"LqmSessionStartTime"];

    v7 = +[WiFiUsagePrivacyFilter localTimestamp:self->_lastUpdatedTime];
    [v5 setObject:v7 forKeyedSubscript:@"LqmSessionLastUpdatedTime"];
  }
  [(NSDate *)self->_lastUpdatedTime timeIntervalSinceDate:self->_initializationTime];
  double v9 = v8;
  NSLog(&cfstr_STotalduration.isa, "-[WiFiUsageSessionLQM eventDictionary:]", *(void *)&v8);
  objc_super v10 = [NSNumber numberWithInteger:self->_maxRssi];
  [v5 setObject:v10 forKeyedSubscript:@"LqmRssiMax"];

  double v11 = [NSNumber numberWithInteger:self->_minRssi];
  [v5 setObject:v11 forKeyedSubscript:@"LqmRssiMin"];

  int64_t v12 = [NSNumber numberWithInteger:self->_avgRssi];
  [v5 setObject:v12 forKeyedSubscript:@"LqmRssiAvg"];

  id v13 = [NSNumber numberWithInteger:self->_lastRssi];
  [v5 setObject:v13 forKeyedSubscript:@"LqmRssiLast"];

  uint64_t v14 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssiGt40 overTotalDuration:v9];
  [v5 setObject:v14 forKeyedSubscript:@"LqmRssiGt40Duration"];

  uint64_t v15 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssi40to50 overTotalDuration:v9];
  [v5 setObject:v15 forKeyedSubscript:@"LqmRssi40to50Duration"];

  uint64_t v16 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssi50to60 overTotalDuration:v9];
  [v5 setObject:v16 forKeyedSubscript:@"LqmRssi50to60Duration"];

  unint64_t v17 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssi60to65 overTotalDuration:v9];
  [v5 setObject:v17 forKeyedSubscript:@"LqmRssi60to65Duration"];

  uint64_t v18 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssi65to70 overTotalDuration:v9];
  [v5 setObject:v18 forKeyedSubscript:@"LqmRssi65to70Duration"];

  unint64_t v19 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssi70to75 overTotalDuration:v9];
  [v5 setObject:v19 forKeyedSubscript:@"LqmRssi70to75Duration"];

  uint64_t v20 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssi75to80 overTotalDuration:v9];
  [v5 setObject:v20 forKeyedSubscript:@"LqmRssi75to80Duration"];

  unint64_t v21 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssi80to85 overTotalDuration:v9];
  [v5 setObject:v21 forKeyedSubscript:@"LqmRssi80to85Duration"];

  uint64_t v22 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssi85to90 overTotalDuration:v9];
  [v5 setObject:v22 forKeyedSubscript:@"LqmRssi85to90Duration"];

  unint64_t v23 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_rssiLt90 overTotalDuration:v9];
  [v5 setObject:v23 forKeyedSubscript:@"LqmRssiLt90Duration"];

  uint64_t v24 = [NSNumber numberWithInteger:self->_count_of_LQMsamples];
  [v5 setObject:v24 forKeyedSubscript:@"LqmCount"];

  unint64_t v25 = [NSNumber numberWithInteger:self->_sum_of_RSSI];
  [v5 setObject:v25 forKeyedSubscript:@"LqmRssi_SumOf"];

  unint64_t v26 = [NSNumber numberWithInteger:self->_count_of_core0Samples];
  [v5 setObject:v26 forKeyedSubscript:@"LqmRssiCore0Count"];

  if (self->_count_of_core0Samples >= 1)
  {
    unint64_t v27 = [NSNumber numberWithInteger:self->_sum_of_core0rssiDiff];
    [v5 setObject:v27 forKeyedSubscript:@"LqmRssiCore0Diff_SumOf"];
  }
  unint64_t v28 = [NSNumber numberWithInteger:self->_count_of_core1Samples];
  [v5 setObject:v28 forKeyedSubscript:@"LqmRssiCore1Count"];

  if (self->_count_of_core1Samples >= 1)
  {
    unint64_t v29 = [NSNumber numberWithInteger:self->_sum_of_core1rssiDiff];
    [v5 setObject:v29 forKeyedSubscript:@"LqmRssiCore1Diff_SumOf"];
  }
  unint64_t v30 = [NSNumber numberWithInteger:self->_maxNoise];
  [v5 setObject:v30 forKeyedSubscript:@"LqmNoiseMax"];

  unint64_t v31 = [NSNumber numberWithInteger:self->_minNoise];
  [v5 setObject:v31 forKeyedSubscript:@"LqmNoiseMin"];

  unint64_t v32 = [NSNumber numberWithInteger:self->_avgNoise];
  [v5 setObject:v32 forKeyedSubscript:@"LqmNoiseAvg"];

  unint64_t v33 = [NSNumber numberWithInteger:self->_maxSnr];
  [v5 setObject:v33 forKeyedSubscript:@"LqmSnrMax"];

  unint64_t v34 = [NSNumber numberWithInteger:self->_minSnr];
  [v5 setObject:v34 forKeyedSubscript:@"LqmSnrMin"];

  unint64_t v35 = [NSNumber numberWithInteger:self->_avgSnr];
  [v5 setObject:v35 forKeyedSubscript:@"LqmSnrAvg"];

  unint64_t v36 = [NSNumber numberWithInteger:self->_maxSelfCca];
  [v5 setObject:v36 forKeyedSubscript:@"LqmCcaSelfMax"];

  unint64_t v37 = [NSNumber numberWithInteger:self->_minSelfCca];
  [v5 setObject:v37 forKeyedSubscript:@"LqmCcaSelfMin"];

  unint64_t v38 = [NSNumber numberWithInteger:self->_avgSelfCca];
  [v5 setObject:v38 forKeyedSubscript:@"LqmCcaSelfAvg"];

  unint64_t v39 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_selfCcaLt40 overTotalDuration:v9];
  [v5 setObject:v39 forKeyedSubscript:@"LqmCcaSelfLt40Duration"];

  unint64_t v40 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_selfCca40to50 overTotalDuration:v9];
  [v5 setObject:v40 forKeyedSubscript:@"LqmCcaSelf40to50Duration"];

  unint64_t v41 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_selfCca50to60 overTotalDuration:v9];
  [v5 setObject:v41 forKeyedSubscript:@"LqmCcaSelf50to60Duration"];

  unint64_t v42 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_selfCca60to70 overTotalDuration:v9];
  [v5 setObject:v42 forKeyedSubscript:@"LqmCcaSelf60to70Duration"];

  unint64_t v43 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_selfCca70to75 overTotalDuration:v9];
  [v5 setObject:v43 forKeyedSubscript:@"LqmCcaSelf70to75Duration"];

  id v44 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_selfCca75to80 overTotalDuration:v9];
  [v5 setObject:v44 forKeyedSubscript:@"LqmCcaSelf75to80Duration"];

  v45 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_selfCca80to85 overTotalDuration:v9];
  [v5 setObject:v45 forKeyedSubscript:@"LqmCcaSelf80to85Duration"];

  v46 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_selfCca85to90 overTotalDuration:v9];
  [v5 setObject:v46 forKeyedSubscript:@"LqmCcaSelf85to90Duration"];

  v47 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_selfCcaGt90 overTotalDuration:v9];
  [v5 setObject:v47 forKeyedSubscript:@"LqmCcaSelfGt90Duration"];

  v48 = [NSNumber numberWithInteger:self->_maxOtherCca];
  [v5 setObject:v48 forKeyedSubscript:@"LqmCcaOtherMax"];

  v49 = [NSNumber numberWithInteger:self->_minOtherCca];
  [v5 setObject:v49 forKeyedSubscript:@"LqmCcaOtherMin"];

  v50 = [NSNumber numberWithInteger:self->_avgOtherCca];
  [v5 setObject:v50 forKeyedSubscript:@"LqmCcaOtherAvg"];

  v51 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_otherCcaLt40 overTotalDuration:v9];
  [v5 setObject:v51 forKeyedSubscript:@"LqmCcaOtherLt40Duration"];

  v52 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_otherCca40to50 overTotalDuration:v9];
  [v5 setObject:v52 forKeyedSubscript:@"LqmCcaOther40to50Duration"];

  v53 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_otherCca50to60 overTotalDuration:v9];
  [v5 setObject:v53 forKeyedSubscript:@"LqmCcaOther50to60Duration"];

  v54 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_otherCca60to70 overTotalDuration:v9];
  [v5 setObject:v54 forKeyedSubscript:@"LqmCcaOther60to70Duration"];

  v55 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_otherCca70to75 overTotalDuration:v9];
  [v5 setObject:v55 forKeyedSubscript:@"LqmCcaOther70to75Duration"];

  v56 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_otherCca75to80 overTotalDuration:v9];
  [v5 setObject:v56 forKeyedSubscript:@"LqmCcaOther75to80Duration"];

  v57 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_otherCca80to85 overTotalDuration:v9];
  [v5 setObject:v57 forKeyedSubscript:@"LqmCcaOther80to85Duration"];

  v58 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_otherCca85to90 overTotalDuration:v9];
  [v5 setObject:v58 forKeyedSubscript:@"LqmCcaOther85to90Duration"];

  v59 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_otherCcaGt90 overTotalDuration:v9];
  [v5 setObject:v59 forKeyedSubscript:@"LqmCcaOtherGt90Duration"];

  v60 = [NSNumber numberWithInteger:self->_maxInterference];
  [v5 setObject:v60 forKeyedSubscript:@"LqmInterferenceMax"];

  v61 = [NSNumber numberWithInteger:self->_minInterference];
  [v5 setObject:v61 forKeyedSubscript:@"LqmInterferenceMin"];

  v62 = [NSNumber numberWithInteger:self->_avgInterference];
  [v5 setObject:v62 forKeyedSubscript:@"LqmInterferenceAvg"];

  v63 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_interferenceLt40 overTotalDuration:v9];
  [v5 setObject:v63 forKeyedSubscript:@"LqmInterferenceLt40Duration"];

  v64 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_interference40to50 overTotalDuration:v9];
  [v5 setObject:v64 forKeyedSubscript:@"LqmInterference40to50Duration"];

  v65 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_interference50to60 overTotalDuration:v9];
  [v5 setObject:v65 forKeyedSubscript:@"LqmInterference50to60Duration"];

  v66 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_interference60to70 overTotalDuration:v9];
  [v5 setObject:v66 forKeyedSubscript:@"LqmInterference60to70Duration"];

  v67 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_interference70to75 overTotalDuration:v9];
  [v5 setObject:v67 forKeyedSubscript:@"LqmInterference70to75Duration"];

  v68 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_interference75to80 overTotalDuration:v9];
  [v5 setObject:v68 forKeyedSubscript:@"LqmInterference75to80Duration"];

  v69 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_interference80to85 overTotalDuration:v9];
  [v5 setObject:v69 forKeyedSubscript:@"LqmInterference80to85Duration"];

  v70 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_interference85to90 overTotalDuration:v9];
  [v5 setObject:v70 forKeyedSubscript:@"LqmInterference85to90Duration"];

  v71 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_interferenceGt90 overTotalDuration:v9];
  [v5 setObject:v71 forKeyedSubscript:@"LqmInterferenceGt90Duration"];

  v72 = [NSNumber numberWithInteger:self->_maxTotalCca];
  [v5 setObject:v72 forKeyedSubscript:@"LqmCcaTotalMax"];

  v73 = [NSNumber numberWithInteger:self->_minTotalCca];
  [v5 setObject:v73 forKeyedSubscript:@"LqmCcaTotalMin"];

  v74 = [NSNumber numberWithInteger:self->_avgTotalCca];
  [v5 setObject:v74 forKeyedSubscript:@"LqmCcaTotalAvg"];

  v75 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_totalCcaLt40 overTotalDuration:v9];
  [v5 setObject:v75 forKeyedSubscript:@"LqmCcaTotalLt40Duration"];

  v76 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_totalCca40to50 overTotalDuration:v9];
  [v5 setObject:v76 forKeyedSubscript:@"LqmCcaTotal40to50Duration"];

  v77 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_totalCca50to60 overTotalDuration:v9];
  [v5 setObject:v77 forKeyedSubscript:@"LqmCcaTotal50to60Duration"];

  v78 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_totalCca60to70 overTotalDuration:v9];
  [v5 setObject:v78 forKeyedSubscript:@"LqmCcaTotal60to70Duration"];

  v79 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_totalCca70to75 overTotalDuration:v9];
  [v5 setObject:v79 forKeyedSubscript:@"LqmCcaTotal70to75Duration"];

  v80 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_totalCca75to80 overTotalDuration:v9];
  [v5 setObject:v80 forKeyedSubscript:@"LqmCcaTotal75to80Duration"];

  v81 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_totalCca80to85 overTotalDuration:v9];
  [v5 setObject:v81 forKeyedSubscript:@"LqmCcaTotal80to85Duration"];

  v82 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_totalCca85to90 overTotalDuration:v9];
  [v5 setObject:v82 forKeyedSubscript:@"LqmCcaTotal85to90Duration"];

  v83 = +[WiFiUsagePrivacyFilter timePercentage:(double)self->_totalCcaGt90 overTotalDuration:v9];
  [v5 setObject:v83 forKeyedSubscript:@"LqmCcaTotalGt90Duration"];

  v84 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_avgTxBytesOverTxFrames];
  [v5 setObject:v84 forKeyedSubscript:@"LqmTxBytesOverTxFramesAvg"];

  v85 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_minTxBytesOverTxFrames];
  [v5 setObject:v85 forKeyedSubscript:@"LqmTxBytesOverTxFramesMin"];

  v86 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_maxTxBytesOverTxFrames];
  [v5 setObject:v86 forKeyedSubscript:@"LqmTxBytesOverTxFramesMax"];

  v87 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_avgRxBytesOverRxFrames];
  [v5 setObject:v87 forKeyedSubscript:@"LqmRxBytesOverRxFramesAvg"];

  v88 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_minRxBytesOverRxFrames];
  [v5 setObject:v88 forKeyedSubscript:@"LqmRxBytesOverRxFramesMin"];

  v89 = +[WiFiUsagePrivacyFilter numberWithByteCount:self->_maxRxBytesOverRxFrames];
  [v5 setObject:v89 forKeyedSubscript:@"LqmRxBytesOverRxFramesMax"];

  v90 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_totalTxFrames];
  [v5 setObject:v90 forKeyedSubscript:@"LqmTxFramesTotal"];

  v91 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_avgTxFramesPerSecond];
  [v5 setObject:v91 forKeyedSubscript:@"LqmTxFramesPerSecondAvg"];

  v92 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_minTxFramesPerSecond];
  [v5 setObject:v92 forKeyedSubscript:@"LqmTxFramesPerSecondMin"];

  v93 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_maxTxFramesPerSecond];
  [v5 setObject:v93 forKeyedSubscript:@"LqmTxFramesPerSecondMax"];

  v94 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_totalRxFrames];
  [v5 setObject:v94 forKeyedSubscript:@"LqmRxFramesTotal"];

  v95 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_avgRxFramesPerSecond];
  [v5 setObject:v95 forKeyedSubscript:@"LqmRxFramesPerSecondAvg"];

  v96 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_minRxFramesPerSecond];
  [v5 setObject:v96 forKeyedSubscript:@"LqmRxFramesPerSecondMin"];

  v97 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_maxRxFramesPerSecond];
  [v5 setObject:v97 forKeyedSubscript:@"LqmRxFramesPerSecondMax"];

  v98 = [NSNumber numberWithInteger:self->_avgTxFailsOverTxFrames];
  [v5 setObject:v98 forKeyedSubscript:@"LqmcurrentTxFailsOverTxFramesAvg"];

  v99 = [NSNumber numberWithInteger:self->_minTxFailsOverTxFrames];
  [v5 setObject:v99 forKeyedSubscript:@"LqmcurrentTxFailsOverTxFramesMin"];

  v100 = [NSNumber numberWithInteger:self->_maxTxFailsOverTxFrames];
  [v5 setObject:v100 forKeyedSubscript:@"LqmcurrentTxFailsOverTxFramesMax"];

  v101 = [NSNumber numberWithInteger:self->_avgTxRetriesOverTxFrames];
  [v5 setObject:v101 forKeyedSubscript:@"LqmcurrentTxRetriesOverTxFramesAvg"];

  v102 = [NSNumber numberWithInteger:self->_minTxRetriesOverTxFrames];
  [v5 setObject:v102 forKeyedSubscript:@"LqmcurrentTxRetriesOverTxFramesMin"];

  v103 = [NSNumber numberWithInteger:self->_maxTxRetriesOverTxFrames];
  [v5 setObject:v103 forKeyedSubscript:@"LqmcurrentTxRetriesOverTxFramesMax"];

  v104 = [NSNumber numberWithInteger:self->_avgRxRetriesOverRxFrames];
  [v5 setObject:v104 forKeyedSubscript:@"LqmRxRetriesOverRxFramesAvg"];

  v105 = [NSNumber numberWithInteger:self->_minRxRetriesOverRxFrames];
  [v5 setObject:v105 forKeyedSubscript:@"LqmRxRetriesOverRxFramesMin"];

  v106 = [NSNumber numberWithInteger:self->_maxRxRetriesOverRxFrames];
  [v5 setObject:v106 forKeyedSubscript:@"LqmRxRetriesOverRxFramesMax"];

  v107 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_totalDecodingAttempts];
  [v5 setObject:v107 forKeyedSubscript:@"LqmDecodingAttemptsTotal"];

  v108 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_avgDecodingAttemptsPerSecond];
  [v5 setObject:v108 forKeyedSubscript:@"LqmDecodingAttemptsPerSecondAvg"];

  v109 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_minDecodingAttemptsPerSecond];
  [v5 setObject:v109 forKeyedSubscript:@"LqmDecodingAttemptsPerSecondMin"];

  v110 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_maxDecodingAttemptsPerSecond];
  [v5 setObject:v110 forKeyedSubscript:@"LqmDecodingAttemptsPerSecondMax"];

  v111 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_totalRxBadFcs];
  [v5 setObject:v111 forKeyedSubscript:@"LqmRxBadFcsTotal"];

  v112 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_avgRxBadFcsPerSecond];
  [v5 setObject:v112 forKeyedSubscript:@"LqmRxBadFcsPerSecondAvg"];

  v113 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_minRxBadFcsPerSecond];
  [v5 setObject:v113 forKeyedSubscript:@"LqmRxBadFcsPerSecondMin"];

  v114 = +[WiFiUsagePrivacyFilter numberWithFrameCount:self->_maxRxBadFcsPerSecond];
  [v5 setObject:v114 forKeyedSubscript:@"LqmRxBadFcsPerSecondMax"];

  v115 = [NSNumber numberWithInteger:self->_totalRxStartPortion];
  [v5 setObject:v115 forKeyedSubscript:@"LqmRxStartPortionTotal"];

  v116 = [NSNumber numberWithInteger:self->_avgRxStartPortion];
  [v5 setObject:v116 forKeyedSubscript:@"LqmRxStartPortionAvg"];

  v117 = [NSNumber numberWithInteger:self->_minRxStartPortion];
  [v5 setObject:v117 forKeyedSubscript:@"LqmRxStartPortionMin"];

  v118 = [NSNumber numberWithInteger:self->_maxRxStartPortion];
  [v5 setObject:v118 forKeyedSubscript:@"LqmRxStartPortionMax"];

  v119 = [NSNumber numberWithInteger:self->_maxTxRate];
  [v5 setObject:v119 forKeyedSubscript:@"LqmTxRateMax"];

  v120 = [NSNumber numberWithInteger:self->_minTxRate];
  [v5 setObject:v120 forKeyedSubscript:@"LqmTxRateMin"];

  v121 = [NSNumber numberWithInteger:self->_avgTxRate];
  [v5 setObject:v121 forKeyedSubscript:@"LqmTxRateAvg"];

  v122 = [NSNumber numberWithInteger:self->_maxRxRate];
  [v5 setObject:v122 forKeyedSubscript:@"LqmRxRateMax"];

  v123 = [NSNumber numberWithInteger:self->_minRxRate];
  [v5 setObject:v123 forKeyedSubscript:@"LqmRxRateMin"];

  v124 = [NSNumber numberWithInteger:self->_avgRxRate];
  [v5 setObject:v124 forKeyedSubscript:@"LqmRxRateAvg"];

  v125 = [NSNumber numberWithInteger:self->_maxBeaconPer];
  [v5 setObject:v125 forKeyedSubscript:@"LqmBeaconPerMax"];

  v126 = [NSNumber numberWithInteger:self->_minBeaconPer];
  [v5 setObject:v126 forKeyedSubscript:@"LqmBeaconPerMin"];

  v127 = [NSNumber numberWithInteger:self->_avgBeaconPer];
  [v5 setObject:v127 forKeyedSubscript:@"LqmBeaconPerAvg"];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setInitializationTime:self->_initializationTime];
  [v4 setLastUpdatedTime:self->_lastUpdatedTime];
  [v4 setMaxRssi:self->_maxRssi];
  [v4 setMinRssi:self->_minRssi];
  [v4 setAvgRssi:self->_avgRssi];
  [v4 setLastRssi:self->_lastRssi];
  [v4 setRssiGt40:self->_rssiGt40];
  [v4 setRssi40to50:self->_rssi40to50];
  [v4 setRssi50to60:self->_rssi50to60];
  [v4 setRssi60to65:self->_rssi60to65];
  [v4 setRssi65to70:self->_rssi65to70];
  [v4 setRssi70to75:self->_rssi70to75];
  [v4 setRssi75to80:self->_rssi75to80];
  [v4 setRssi80to85:self->_rssi80to85];
  [v4 setRssi85to90:self->_rssi85to90];
  [v4 setRssiLt90:self->_rssiLt90];
  objc_msgSend(v4, "setCount_of_LQMsamples:", self->_count_of_LQMsamples);
  objc_msgSend(v4, "setCount_of_core0Samples:", self->_count_of_core0Samples);
  objc_msgSend(v4, "setCount_of_core1Samples:", self->_count_of_core1Samples);
  objc_msgSend(v4, "setSum_of_RSSI:", self->_sum_of_RSSI);
  objc_msgSend(v4, "setSum_of_core0rssiDiff:", self->_sum_of_core0rssiDiff);
  objc_msgSend(v4, "setSum_of_core1rssiDiff:", self->_sum_of_core1rssiDiff);
  [v4 setMaxNoise:self->_maxNoise];
  [v4 setMinNoise:self->_minNoise];
  [v4 setAvgNoise:self->_avgNoise];
  [v4 setMaxSnr:self->_maxSnr];
  [v4 setMinSnr:self->_minSnr];
  [v4 setAvgSnr:self->_avgSnr];
  [v4 setMaxBeaconPer:self->_maxBeaconPer];
  [v4 setMinBeaconPer:self->_minBeaconPer];
  [v4 setAvgBeaconPer:self->_avgBeaconPer];
  [v4 setMaxTxRate:self->_maxTxRate];
  [v4 setMinTxRate:self->_minTxRate];
  [v4 setAvgTxRate:self->_avgTxRate];
  [v4 setMaxRxRate:self->_maxRxRate];
  [v4 setMinRxRate:self->_minRxRate];
  [v4 setAvgRxRate:self->_avgRxRate];
  [v4 setMaxSelfCca:self->_maxSelfCca];
  [v4 setMinSelfCca:self->_minSelfCca];
  [v4 setAvgSelfCca:self->_avgSelfCca];
  [v4 setSelfCcaLt40:self->_selfCcaLt40];
  [v4 setSelfCca40to50:self->_selfCca40to50];
  [v4 setSelfCca50to60:self->_selfCca50to60];
  [v4 setSelfCca60to70:self->_selfCca60to70];
  [v4 setSelfCca70to75:self->_selfCca70to75];
  [v4 setSelfCca75to80:self->_selfCca75to80];
  [v4 setSelfCca80to85:self->_selfCca80to85];
  [v4 setSelfCca85to90:self->_selfCca85to90];
  [v4 setSelfCcaGt90:self->_selfCcaGt90];
  [v4 setMaxOtherCca:self->_maxOtherCca];
  [v4 setMinOtherCca:self->_minOtherCca];
  [v4 setAvgOtherCca:self->_avgOtherCca];
  [v4 setOtherCcaLt40:self->_otherCcaLt40];
  [v4 setOtherCca40to50:self->_otherCca40to50];
  [v4 setOtherCca50to60:self->_otherCca50to60];
  [v4 setOtherCca60to70:self->_otherCca60to70];
  [v4 setOtherCca70to75:self->_otherCca70to75];
  [v4 setOtherCca75to80:self->_otherCca75to80];
  [v4 setOtherCca80to85:self->_otherCca80to85];
  [v4 setOtherCca85to90:self->_otherCca85to90];
  [v4 setOtherCcaGt90:self->_otherCcaGt90];
  [v4 setMaxInterference:self->_maxInterference];
  [v4 setMinInterference:self->_minInterference];
  [v4 setAvgInterference:self->_avgInterference];
  [v4 setInterferenceLt40:self->_interferenceLt40];
  [v4 setInterference40to50:self->_interference40to50];
  [v4 setInterference50to60:self->_interference50to60];
  [v4 setInterference60to70:self->_interference60to70];
  [v4 setInterference70to75:self->_interference70to75];
  [v4 setInterference75to80:self->_interference75to80];
  [v4 setInterference80to85:self->_interference80to85];
  [v4 setInterference85to90:self->_interference85to90];
  [v4 setInterferenceGt90:self->_interferenceGt90];
  [v4 setMaxTotalCca:self->_maxTotalCca];
  [v4 setMinTotalCca:self->_minTotalCca];
  [v4 setAvgTotalCca:self->_avgTotalCca];
  [v4 setTotalCcaLt40:self->_totalCcaLt40];
  [v4 setTotalCca40to50:self->_totalCca40to50];
  [v4 setTotalCca50to60:self->_totalCca50to60];
  [v4 setTotalCca60to70:self->_totalCca60to70];
  [v4 setTotalCca70to75:self->_totalCca70to75];
  [v4 setTotalCca75to80:self->_totalCca75to80];
  [v4 setTotalCca80to85:self->_totalCca80to85];
  [v4 setTotalCca85to90:self->_totalCca85to90];
  [v4 setTotalCcaGt90:self->_totalCcaGt90];
  [v4 setAvgTxBytesOverTxFrames:self->_avgTxBytesOverTxFrames];
  [v4 setMinTxBytesOverTxFrames:self->_minTxBytesOverTxFrames];
  [v4 setMaxTxBytesOverTxFrames:self->_maxTxBytesOverTxFrames];
  [v4 setAvgRxBytesOverRxFrames:self->_avgRxBytesOverRxFrames];
  [v4 setMinRxBytesOverRxFrames:self->_minRxBytesOverRxFrames];
  [v4 setMaxRxBytesOverRxFrames:self->_maxRxBytesOverRxFrames];
  [v4 setTotalTxFrames:self->_totalTxFrames];
  [v4 setAvgTxFramesPerSecond:self->_avgTxFramesPerSecond];
  [v4 setMinTxFramesPerSecond:self->_minTxFramesPerSecond];
  [v4 setMaxTxFramesPerSecond:self->_maxTxFramesPerSecond];
  [v4 setTotalRxFrames:self->_totalRxFrames];
  [v4 setAvgRxFramesPerSecond:self->_avgRxFramesPerSecond];
  [v4 setMinRxFramesPerSecond:self->_minRxFramesPerSecond];
  [v4 setMaxRxFramesPerSecond:self->_maxRxFramesPerSecond];
  [v4 setAvgTxFailsOverTxFrames:self->_avgTxFailsOverTxFrames];
  [v4 setMinTxFailsOverTxFrames:self->_minTxFailsOverTxFrames];
  [v4 setMaxTxFailsOverTxFrames:self->_maxTxFailsOverTxFrames];
  [v4 setAvgTxRetriesOverTxFrames:self->_avgTxRetriesOverTxFrames];
  [v4 setMinTxRetriesOverTxFrames:self->_minTxRetriesOverTxFrames];
  [v4 setMaxTxRetriesOverTxFrames:self->_maxTxRetriesOverTxFrames];
  [v4 setAvgRxRetriesOverRxFrames:self->_avgRxRetriesOverRxFrames];
  [v4 setMinRxRetriesOverRxFrames:self->_minRxRetriesOverRxFrames];
  [v4 setMaxRxRetriesOverRxFrames:self->_maxRxRetriesOverRxFrames];
  [v4 setTotalDecodingAttempts:self->_totalDecodingAttempts];
  [v4 setAvgDecodingAttemptsPerSecond:self->_avgDecodingAttemptsPerSecond];
  [v4 setMinDecodingAttemptsPerSecond:self->_minDecodingAttemptsPerSecond];
  [v4 setMaxDecodingAttemptsPerSecond:self->_maxDecodingAttemptsPerSecond];
  [v4 setTotalRxBadFcs:self->_totalRxBadFcs];
  [v4 setAvgRxBadFcsPerSecond:self->_avgRxBadFcsPerSecond];
  [v4 setMinRxBadFcsPerSecond:self->_minRxBadFcsPerSecond];
  [v4 setMaxRxBadFcsPerSecond:self->_maxRxBadFcsPerSecond];
  [v4 setTotalRxStartPortion:self->_totalRxStartPortion];
  [v4 setAvgRxStartPortion:self->_avgRxStartPortion];
  [v4 setMinRxStartPortion:self->_minRxStartPortion];
  [v4 setMaxRxStartPortion:self->_maxRxStartPortion];
  return v4;
}

- (int64_t)count_of_LQMsamples
{
  return self->_count_of_LQMsamples;
}

- (void)setCount_of_LQMsamples:(int64_t)a3
{
  self->_int64_t count_of_LQMsamples = a3;
}

- (int64_t)maxRssi
{
  return self->_maxRssi;
}

- (void)setMaxRssi:(int64_t)a3
{
  self->_maxRssi = a3;
}

- (int64_t)minRssi
{
  return self->_minRssi;
}

- (void)setMinRssi:(int64_t)a3
{
  self->_minRssi = a3;
}

- (int64_t)lastRssi
{
  return self->_lastRssi;
}

- (void)setLastRssi:(int64_t)a3
{
  self->_lastRssi = a3;
}

- (int64_t)rssiGt40
{
  return self->_rssiGt40;
}

- (void)setRssiGt40:(int64_t)a3
{
  self->_rssiGt40 = a3;
}

- (int64_t)rssi40to50
{
  return self->_rssi40to50;
}

- (void)setRssi40to50:(int64_t)a3
{
  self->_rssi40to50 = a3;
}

- (int64_t)rssi50to60
{
  return self->_rssi50to60;
}

- (void)setRssi50to60:(int64_t)a3
{
  self->_rssi50to60 = a3;
}

- (int64_t)rssi60to65
{
  return self->_rssi60to65;
}

- (void)setRssi60to65:(int64_t)a3
{
  self->_rssi60to65 = a3;
}

- (int64_t)rssi65to70
{
  return self->_rssi65to70;
}

- (void)setRssi65to70:(int64_t)a3
{
  self->_rssi65to70 = a3;
}

- (int64_t)rssi70to75
{
  return self->_rssi70to75;
}

- (void)setRssi70to75:(int64_t)a3
{
  self->_rssi70to75 = a3;
}

- (int64_t)rssi75to80
{
  return self->_rssi75to80;
}

- (void)setRssi75to80:(int64_t)a3
{
  self->_rssi75to80 = a3;
}

- (int64_t)rssi80to85
{
  return self->_rssi80to85;
}

- (void)setRssi80to85:(int64_t)a3
{
  self->_rssi80to85 = a3;
}

- (int64_t)rssi85to90
{
  return self->_rssi85to90;
}

- (void)setRssi85to90:(int64_t)a3
{
  self->_rssi85to90 = a3;
}

- (int64_t)rssiLt90
{
  return self->_rssiLt90;
}

- (void)setRssiLt90:(int64_t)a3
{
  self->_rssiLt90 = a3;
}

- (int64_t)sum_of_RSSI
{
  return self->_sum_of_RSSI;
}

- (void)setSum_of_RSSI:(int64_t)a3
{
  self->_sum_of_RSSI = a3;
}

- (int64_t)count_of_core0Samples
{
  return self->_count_of_core0Samples;
}

- (void)setCount_of_core0Samples:(int64_t)a3
{
  self->_count_of_core0Samples = a3;
}

- (int64_t)count_of_core1Samples
{
  return self->_count_of_core1Samples;
}

- (void)setCount_of_core1Samples:(int64_t)a3
{
  self->_count_of_core1Samples = a3;
}

- (int64_t)sum_of_core0rssiDiff
{
  return self->_sum_of_core0rssiDiff;
}

- (void)setSum_of_core0rssiDiff:(int64_t)a3
{
  self->_sum_of_core0rssiDiff = a3;
}

- (int64_t)sum_of_core1rssiDiff
{
  return self->_sum_of_core1rssiDiff;
}

- (void)setSum_of_core1rssiDiff:(int64_t)a3
{
  self->_sum_of_core1rssiDiff = a3;
}

- (int64_t)maxNoise
{
  return self->_maxNoise;
}

- (void)setMaxNoise:(int64_t)a3
{
  self->_maxNoise = a3;
}

- (int64_t)minNoise
{
  return self->_minNoise;
}

- (void)setMinNoise:(int64_t)a3
{
  self->_minNoise = a3;
}

- (int64_t)maxSnr
{
  return self->_maxSnr;
}

- (void)setMaxSnr:(int64_t)a3
{
  self->_maxSnr = a3;
}

- (int64_t)minSnr
{
  return self->_minSnr;
}

- (void)setMinSnr:(int64_t)a3
{
  self->_minSnr = a3;
}

- (int64_t)maxBeaconPer
{
  return self->_maxBeaconPer;
}

- (void)setMaxBeaconPer:(int64_t)a3
{
  self->_maxBeaconPer = a3;
}

- (int64_t)minBeaconPer
{
  return self->_minBeaconPer;
}

- (void)setMinBeaconPer:(int64_t)a3
{
  self->_minBeaconPer = a3;
}

- (unint64_t)maxTxRate
{
  return self->_maxTxRate;
}

- (void)setMaxTxRate:(unint64_t)a3
{
  self->_maxTxRate = a3;
}

- (unint64_t)minTxRate
{
  return self->_minTxRate;
}

- (void)setMinTxRate:(unint64_t)a3
{
  self->_minTxRate = a3;
}

- (unint64_t)avgTxRate
{
  return self->_avgTxRate;
}

- (void)setAvgTxRate:(unint64_t)a3
{
  self->_avgTxRate = a3;
}

- (unint64_t)maxRxRate
{
  return self->_maxRxRate;
}

- (void)setMaxRxRate:(unint64_t)a3
{
  self->_maxRxRate = a3;
}

- (unint64_t)minRxRate
{
  return self->_minRxRate;
}

- (void)setMinRxRate:(unint64_t)a3
{
  self->_minRxRate = a3;
}

- (unint64_t)avgRxRate
{
  return self->_avgRxRate;
}

- (void)setAvgRxRate:(unint64_t)a3
{
  self->_avgRxRate = a3;
}

- (int64_t)maxSelfCca
{
  return self->_maxSelfCca;
}

- (void)setMaxSelfCca:(int64_t)a3
{
  self->_maxSelfCca = a3;
}

- (int64_t)minSelfCca
{
  return self->_minSelfCca;
}

- (void)setMinSelfCca:(int64_t)a3
{
  self->_minSelfCca = a3;
}

- (int64_t)selfCcaLt40
{
  return self->_selfCcaLt40;
}

- (void)setSelfCcaLt40:(int64_t)a3
{
  self->_selfCcaLt40 = a3;
}

- (int64_t)selfCca40to50
{
  return self->_selfCca40to50;
}

- (void)setSelfCca40to50:(int64_t)a3
{
  self->_selfCca40to50 = a3;
}

- (int64_t)selfCca50to60
{
  return self->_selfCca50to60;
}

- (void)setSelfCca50to60:(int64_t)a3
{
  self->_selfCca50to60 = a3;
}

- (int64_t)selfCca60to70
{
  return self->_selfCca60to70;
}

- (void)setSelfCca60to70:(int64_t)a3
{
  self->_selfCca60to70 = a3;
}

- (int64_t)selfCca70to75
{
  return self->_selfCca70to75;
}

- (void)setSelfCca70to75:(int64_t)a3
{
  self->_selfCca70to75 = a3;
}

- (int64_t)selfCca75to80
{
  return self->_selfCca75to80;
}

- (void)setSelfCca75to80:(int64_t)a3
{
  self->_selfCca75to80 = a3;
}

- (int64_t)selfCca80to85
{
  return self->_selfCca80to85;
}

- (void)setSelfCca80to85:(int64_t)a3
{
  self->_selfCca80to85 = a3;
}

- (int64_t)selfCca85to90
{
  return self->_selfCca85to90;
}

- (void)setSelfCca85to90:(int64_t)a3
{
  self->_selfCca85to90 = a3;
}

- (int64_t)selfCcaGt90
{
  return self->_selfCcaGt90;
}

- (void)setSelfCcaGt90:(int64_t)a3
{
  self->_selfCcaGt90 = a3;
}

- (int64_t)maxOtherCca
{
  return self->_maxOtherCca;
}

- (void)setMaxOtherCca:(int64_t)a3
{
  self->_maxOtherCca = a3;
}

- (int64_t)minOtherCca
{
  return self->_minOtherCca;
}

- (void)setMinOtherCca:(int64_t)a3
{
  self->_minOtherCca = a3;
}

- (int64_t)otherCcaLt40
{
  return self->_otherCcaLt40;
}

- (void)setOtherCcaLt40:(int64_t)a3
{
  self->_otherCcaLt40 = a3;
}

- (int64_t)otherCca40to50
{
  return self->_otherCca40to50;
}

- (void)setOtherCca40to50:(int64_t)a3
{
  self->_otherCca40to50 = a3;
}

- (int64_t)otherCca50to60
{
  return self->_otherCca50to60;
}

- (void)setOtherCca50to60:(int64_t)a3
{
  self->_otherCca50to60 = a3;
}

- (int64_t)otherCca60to70
{
  return self->_otherCca60to70;
}

- (void)setOtherCca60to70:(int64_t)a3
{
  self->_otherCca60to70 = a3;
}

- (int64_t)otherCca70to75
{
  return self->_otherCca70to75;
}

- (void)setOtherCca70to75:(int64_t)a3
{
  self->_otherCca70to75 = a3;
}

- (int64_t)otherCca75to80
{
  return self->_otherCca75to80;
}

- (void)setOtherCca75to80:(int64_t)a3
{
  self->_otherCca75to80 = a3;
}

- (int64_t)otherCca80to85
{
  return self->_otherCca80to85;
}

- (void)setOtherCca80to85:(int64_t)a3
{
  self->_otherCca80to85 = a3;
}

- (int64_t)otherCca85to90
{
  return self->_otherCca85to90;
}

- (void)setOtherCca85to90:(int64_t)a3
{
  self->_otherCca85to90 = a3;
}

- (int64_t)otherCcaGt90
{
  return self->_otherCcaGt90;
}

- (void)setOtherCcaGt90:(int64_t)a3
{
  self->_otherCcaGt90 = a3;
}

- (int64_t)maxInterference
{
  return self->_maxInterference;
}

- (void)setMaxInterference:(int64_t)a3
{
  self->_maxInterference = a3;
}

- (int64_t)minInterference
{
  return self->_minInterference;
}

- (void)setMinInterference:(int64_t)a3
{
  self->_minInterference = a3;
}

- (int64_t)interferenceLt40
{
  return self->_interferenceLt40;
}

- (void)setInterferenceLt40:(int64_t)a3
{
  self->_interferenceLt40 = a3;
}

- (int64_t)interference40to50
{
  return self->_interference40to50;
}

- (void)setInterference40to50:(int64_t)a3
{
  self->_interference40to50 = a3;
}

- (int64_t)interference50to60
{
  return self->_interference50to60;
}

- (void)setInterference50to60:(int64_t)a3
{
  self->_interference50to60 = a3;
}

- (int64_t)interference60to70
{
  return self->_interference60to70;
}

- (void)setInterference60to70:(int64_t)a3
{
  self->_interference60to70 = a3;
}

- (int64_t)interference70to75
{
  return self->_interference70to75;
}

- (void)setInterference70to75:(int64_t)a3
{
  self->_interference70to75 = a3;
}

- (int64_t)interference75to80
{
  return self->_interference75to80;
}

- (void)setInterference75to80:(int64_t)a3
{
  self->_interference75to80 = a3;
}

- (int64_t)interference80to85
{
  return self->_interference80to85;
}

- (void)setInterference80to85:(int64_t)a3
{
  self->_interference80to85 = a3;
}

- (int64_t)interference85to90
{
  return self->_interference85to90;
}

- (void)setInterference85to90:(int64_t)a3
{
  self->_interference85to90 = a3;
}

- (int64_t)interferenceGt90
{
  return self->_interferenceGt90;
}

- (void)setInterferenceGt90:(int64_t)a3
{
  self->_interferenceGt90 = a3;
}

- (int64_t)maxTotalCca
{
  return self->_maxTotalCca;
}

- (void)setMaxTotalCca:(int64_t)a3
{
  self->_maxTotalCca = a3;
}

- (int64_t)minTotalCca
{
  return self->_minTotalCca;
}

- (void)setMinTotalCca:(int64_t)a3
{
  self->_minTotalCca = a3;
}

- (int64_t)totalCcaLt40
{
  return self->_totalCcaLt40;
}

- (void)setTotalCcaLt40:(int64_t)a3
{
  self->_totalCcaLt40 = a3;
}

- (int64_t)totalCca40to50
{
  return self->_totalCca40to50;
}

- (void)setTotalCca40to50:(int64_t)a3
{
  self->_totalCca40to50 = a3;
}

- (int64_t)totalCca50to60
{
  return self->_totalCca50to60;
}

- (void)setTotalCca50to60:(int64_t)a3
{
  self->_totalCca50to60 = a3;
}

- (int64_t)totalCca60to70
{
  return self->_totalCca60to70;
}

- (void)setTotalCca60to70:(int64_t)a3
{
  self->_totalCca60to70 = a3;
}

- (int64_t)totalCca70to75
{
  return self->_totalCca70to75;
}

- (void)setTotalCca70to75:(int64_t)a3
{
  self->_totalCca70to75 = a3;
}

- (int64_t)totalCca75to80
{
  return self->_totalCca75to80;
}

- (void)setTotalCca75to80:(int64_t)a3
{
  self->_totalCca75to80 = a3;
}

- (int64_t)totalCca80to85
{
  return self->_totalCca80to85;
}

- (void)setTotalCca80to85:(int64_t)a3
{
  self->_totalCca80to85 = a3;
}

- (int64_t)totalCca85to90
{
  return self->_totalCca85to90;
}

- (void)setTotalCca85to90:(int64_t)a3
{
  self->_totalCca85to90 = a3;
}

- (int64_t)totalCcaGt90
{
  return self->_totalCcaGt90;
}

- (void)setTotalCcaGt90:(int64_t)a3
{
  self->_totalCcaGt90 = a3;
}

- (unint64_t)minTxBytesOverTxFrames
{
  return self->_minTxBytesOverTxFrames;
}

- (void)setMinTxBytesOverTxFrames:(unint64_t)a3
{
  self->_minTxBytesOverTxFrames = a3;
}

- (unint64_t)maxTxBytesOverTxFrames
{
  return self->_maxTxBytesOverTxFrames;
}

- (void)setMaxTxBytesOverTxFrames:(unint64_t)a3
{
  self->_maxTxBytesOverTxFrames = a3;
}

- (unint64_t)minRxBytesOverRxFrames
{
  return self->_minRxBytesOverRxFrames;
}

- (void)setMinRxBytesOverRxFrames:(unint64_t)a3
{
  self->_minRxBytesOverRxFrames = a3;
}

- (unint64_t)maxRxBytesOverRxFrames
{
  return self->_maxRxBytesOverRxFrames;
}

- (void)setMaxRxBytesOverRxFrames:(unint64_t)a3
{
  self->_maxRxBytesOverRxFrames = a3;
}

- (unint64_t)totalTxFrames
{
  return self->_totalTxFrames;
}

- (void)setTotalTxFrames:(unint64_t)a3
{
  self->_totalTxFrames = a3;
}

- (unint64_t)minTxFramesPerSecond
{
  return self->_minTxFramesPerSecond;
}

- (void)setMinTxFramesPerSecond:(unint64_t)a3
{
  self->_minTxFramesPerSecond = a3;
}

- (unint64_t)maxTxFramesPerSecond
{
  return self->_maxTxFramesPerSecond;
}

- (void)setMaxTxFramesPerSecond:(unint64_t)a3
{
  self->_maxTxFramesPerSecond = a3;
}

- (unint64_t)totalRxFrames
{
  return self->_totalRxFrames;
}

- (void)setTotalRxFrames:(unint64_t)a3
{
  self->_totalRxFrames = a3;
}

- (unint64_t)minRxFramesPerSecond
{
  return self->_minRxFramesPerSecond;
}

- (void)setMinRxFramesPerSecond:(unint64_t)a3
{
  self->_minRxFramesPerSecond = a3;
}

- (unint64_t)maxRxFramesPerSecond
{
  return self->_maxRxFramesPerSecond;
}

- (void)setMaxRxFramesPerSecond:(unint64_t)a3
{
  self->_maxRxFramesPerSecond = a3;
}

- (unint64_t)minTxFailsOverTxFrames
{
  return self->_minTxFailsOverTxFrames;
}

- (void)setMinTxFailsOverTxFrames:(unint64_t)a3
{
  self->_minTxFailsOverTxFrames = a3;
}

- (unint64_t)maxTxFailsOverTxFrames
{
  return self->_maxTxFailsOverTxFrames;
}

- (void)setMaxTxFailsOverTxFrames:(unint64_t)a3
{
  self->_maxTxFailsOverTxFrames = a3;
}

- (unint64_t)minTxRetriesOverTxFrames
{
  return self->_minTxRetriesOverTxFrames;
}

- (void)setMinTxRetriesOverTxFrames:(unint64_t)a3
{
  self->_minTxRetriesOverTxFrames = a3;
}

- (unint64_t)maxTxRetriesOverTxFrames
{
  return self->_maxTxRetriesOverTxFrames;
}

- (void)setMaxTxRetriesOverTxFrames:(unint64_t)a3
{
  self->_maxTxRetriesOverTxFrames = a3;
}

- (unint64_t)minRxRetriesOverRxFrames
{
  return self->_minRxRetriesOverRxFrames;
}

- (void)setMinRxRetriesOverRxFrames:(unint64_t)a3
{
  self->_minRxRetriesOverRxFrames = a3;
}

- (unint64_t)maxRxRetriesOverRxFrames
{
  return self->_maxRxRetriesOverRxFrames;
}

- (void)setMaxRxRetriesOverRxFrames:(unint64_t)a3
{
  self->_maxRxRetriesOverRxFrames = a3;
}

- (unint64_t)totalDecodingAttempts
{
  return self->_totalDecodingAttempts;
}

- (void)setTotalDecodingAttempts:(unint64_t)a3
{
  self->_totalDecodingAttempts = a3;
}

- (unint64_t)avgDecodingAttemptsPerSecond
{
  return self->_avgDecodingAttemptsPerSecond;
}

- (void)setAvgDecodingAttemptsPerSecond:(unint64_t)a3
{
  self->_avgDecodingAttemptsPerSecond = a3;
}

- (unint64_t)minDecodingAttemptsPerSecond
{
  return self->_minDecodingAttemptsPerSecond;
}

- (void)setMinDecodingAttemptsPerSecond:(unint64_t)a3
{
  self->_minDecodingAttemptsPerSecond = a3;
}

- (unint64_t)maxDecodingAttemptsPerSecond
{
  return self->_maxDecodingAttemptsPerSecond;
}

- (void)setMaxDecodingAttemptsPerSecond:(unint64_t)a3
{
  self->_maxDecodingAttemptsPerSecond = a3;
}

- (unint64_t)totalRxBadFcs
{
  return self->_totalRxBadFcs;
}

- (void)setTotalRxBadFcs:(unint64_t)a3
{
  self->_totalRxBadFcs = a3;
}

- (unint64_t)avgRxBadFcsPerSecond
{
  return self->_avgRxBadFcsPerSecond;
}

- (void)setAvgRxBadFcsPerSecond:(unint64_t)a3
{
  self->_avgRxBadFcsPerSecond = a3;
}

- (unint64_t)minRxBadFcsPerSecond
{
  return self->_minRxBadFcsPerSecond;
}

- (void)setMinRxBadFcsPerSecond:(unint64_t)a3
{
  self->_minRxBadFcsPerSecond = a3;
}

- (unint64_t)maxRxBadFcsPerSecond
{
  return self->_maxRxBadFcsPerSecond;
}

- (void)setMaxRxBadFcsPerSecond:(unint64_t)a3
{
  self->_maxRxBadFcsPerSecond = a3;
}

- (unint64_t)totalRxStartPortion
{
  return self->_totalRxStartPortion;
}

- (void)setTotalRxStartPortion:(unint64_t)a3
{
  self->_totalRxStartPortion = a3;
}

- (unint64_t)avgRxStartPortion
{
  return self->_avgRxStartPortion;
}

- (void)setAvgRxStartPortion:(unint64_t)a3
{
  self->_avgRxStartPortion = a3;
}

- (unint64_t)minRxStartPortion
{
  return self->_minRxStartPortion;
}

- (void)setMinRxStartPortion:(unint64_t)a3
{
  self->_minRxStartPortion = a3;
}

- (unint64_t)maxRxStartPortion
{
  return self->_maxRxStartPortion;
}

- (void)setMaxRxStartPortion:(unint64_t)a3
{
  self->_maxRxStartPortion = a3;
}

- (NSDate)initializationTime
{
  return self->_initializationTime;
}

- (NSDate)lastUpdatedTime
{
  return self->_lastUpdatedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedTime, 0);

  objc_storeStrong((id *)&self->_initializationTime, 0);
}

@end