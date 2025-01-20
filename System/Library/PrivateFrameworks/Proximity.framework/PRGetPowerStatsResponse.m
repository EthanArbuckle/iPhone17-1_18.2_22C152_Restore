@interface PRGetPowerStatsResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PRGetPowerStatsResponse)initWithCoder:(id)a3;
- (PRGetPowerStatsResponse)initWithGetPowerStatsResponse:(const PowerStatsResponse *)a3;
- (PRGetPowerStatsResponse)initWithSleepDuration:(unsigned int)a3 wakeDuration:(unsigned int)a4 singleAntennaSearchDuration:(unsigned int)a5 dualAntennaSearchDuration:(unsigned int)a6 singleChainRxPacketDuration:(unsigned int)a7 dualChainRxPacketDuration:(unsigned int)a8 tripleChainRxPacketDuration:(unsigned int)a9 dspProcessingDuration:(unsigned int)a10 txDuration:(unsigned int)a11 numPacketsReceived:(unsigned __int16)a12 numPacketsTransmitted:(unsigned __int16)a13 sleepCount:(unsigned int)a14 wakeCount:(unsigned int)a15 pmgrSleepCount:(unsigned int)a16 pmgrDeepSleepCount:(unsigned int)a17 deepSleepDuration:(unsigned int)a18;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)deepSleepDuration;
- (unsigned)dspProcessingDuration;
- (unsigned)dualAntennaSearchDuration;
- (unsigned)dualChainRxPacketDuration;
- (unsigned)numPacketsReceived;
- (unsigned)numPacketsTransmitted;
- (unsigned)pmgrDeepSleepCount;
- (unsigned)pmgrSleepCount;
- (unsigned)singleAntennaSearchDuration;
- (unsigned)singleChainRxPacketDuration;
- (unsigned)sleepCount;
- (unsigned)sleepDuration;
- (unsigned)tripleChainRxPacketDuration;
- (unsigned)txDuration;
- (unsigned)wakeCount;
- (unsigned)wakeDuration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRGetPowerStatsResponse

- (PRGetPowerStatsResponse)initWithSleepDuration:(unsigned int)a3 wakeDuration:(unsigned int)a4 singleAntennaSearchDuration:(unsigned int)a5 dualAntennaSearchDuration:(unsigned int)a6 singleChainRxPacketDuration:(unsigned int)a7 dualChainRxPacketDuration:(unsigned int)a8 tripleChainRxPacketDuration:(unsigned int)a9 dspProcessingDuration:(unsigned int)a10 txDuration:(unsigned int)a11 numPacketsReceived:(unsigned __int16)a12 numPacketsTransmitted:(unsigned __int16)a13 sleepCount:(unsigned int)a14 wakeCount:(unsigned int)a15 pmgrSleepCount:(unsigned int)a16 pmgrDeepSleepCount:(unsigned int)a17 deepSleepDuration:(unsigned int)a18
{
  v25.receiver = self;
  v25.super_class = (Class)PRGetPowerStatsResponse;
  result = [(PRGetPowerStatsResponse *)&v25 init];
  if (result)
  {
    result->_sleepDuration = a3;
    result->_wakeDuration = a4;
    result->_singleAntennaSearchDuration = a5;
    result->_dualAntennaSearchDuration = a6;
    result->_singleChainRxPacketDuration = a7;
    result->_dualChainRxPacketDuration = a8;
    result->_tripleChainRxPacketDuration = a9;
    result->_dspProcessingDuration = a10;
    result->_numPacketsReceived = a12;
    result->_numPacketsTransmitted = a13;
    result->_txDuration = a11;
    result->_sleepCount = a14;
    result->_wakeCount = a15;
    result->_pmgrSleepCount = a16;
    result->_pmgrDeepSleepCount = a17;
    result->_deepSleepDuration = a18;
  }
  return result;
}

- (PRGetPowerStatsResponse)initWithGetPowerStatsResponse:(const PowerStatsResponse *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PRGetPowerStatsResponse;
  result = [(PRGetPowerStatsResponse *)&v5 init];
  if (result)
  {
    result->_sleepDuration = a3->var0;
    result->_wakeDuration = a3->var1;
    result->_singleAntennaSearchDuration = a3->var2;
    result->_dualAntennaSearchDuration = a3->var3;
    result->_singleChainRxPacketDuration = a3->var4;
    result->_dualChainRxPacketDuration = a3->var5;
    result->_tripleChainRxPacketDuration = a3->var6;
    result->_dspProcessingDuration = a3->var7;
    result->_txDuration = a3->var8;
    result->_numPacketsReceived = a3->var9;
    result->_numPacketsTransmitted = a3->var10;
    result->_sleepCount = a3->var11;
    result->_wakeCount = a3->var12;
    result->_pmgrSleepCount = a3->var13;
    result->_pmgrDeepSleepCount = a3->var14;
    result->_deepSleepDuration = a3->var15;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRGetPowerStatsResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  unsigned int v22 = [v3 decodeInt32ForKey:@"SleepDuration"];
  unsigned int v21 = [v3 decodeInt32ForKey:@"WakeDuration"];
  unsigned int v20 = [v3 decodeInt32ForKey:@"SingleAntennaSearchDuration"];
  unsigned int v19 = [v3 decodeInt32ForKey:@"DualAntennaSearchDuration"];
  unsigned int v18 = [v3 decodeInt32ForKey:@"SingleChainRxPacketDuration"];
  unsigned int v17 = [v3 decodeInt32ForKey:@"DualChainRxPacketDuration"];
  unsigned int v4 = [v3 decodeInt32ForKey:@"TripleChainRxPacketDuration"];
  unsigned int v5 = [v3 decodeInt32ForKey:@"DSPProcessingDuration"];
  int v6 = [v3 decodeInt32ForKey:@"TxDuration"];
  __int16 v7 = [v3 decodeInt32ForKey:@"NumPacketsReceived"];
  __int16 v8 = [v3 decodeInt32ForKey:@"NumPacketsTransmitted"];
  unsigned int v9 = [v3 decodeInt32ForKey:@"SleepCount"];
  unsigned int v10 = [v3 decodeInt32ForKey:@"WakeCount"];
  unsigned int v11 = [v3 decodeInt32ForKey:@"PMGRSleepCount"];
  unsigned int v12 = [v3 decodeInt32ForKey:@"PMGRDeepSleepCount"];
  LODWORD(v16) = [v3 decodeInt32ForKey:@"DeepSleepDuration"];
  HIWORD(v15) = v8;
  WORD2(v15) = v7;
  LODWORD(v15) = v6;
  v13 = -[PRGetPowerStatsResponse initWithSleepDuration:wakeDuration:singleAntennaSearchDuration:dualAntennaSearchDuration:singleChainRxPacketDuration:dualChainRxPacketDuration:tripleChainRxPacketDuration:dspProcessingDuration:txDuration:numPacketsReceived:numPacketsTransmitted:sleepCount:wakeCount:pmgrSleepCount:pmgrDeepSleepCount:deepSleepDuration:](self, "initWithSleepDuration:wakeDuration:singleAntennaSearchDuration:dualAntennaSearchDuration:singleChainRxPacketDuration:dualChainRxPacketDuration:tripleChainRxPacketDuration:dspProcessingDuration:txDuration:numPacketsReceived:numPacketsTransmitted:sleepCount:wakeCount:pmgrSleepCount:pmgrDeepSleepCount:deepSleepDuration:", v22, v21, v20, v19, v18, v17, __PAIR64__(v5, v4), v15, __PAIR64__(v10, v9), __PAIR64__(v12, v11), v16);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:self->_sleepDuration forKey:@"SleepDuration"];
  [v4 encodeInt32:self->_wakeDuration forKey:@"WakeDuration"];
  [v4 encodeInt32:self->_singleAntennaSearchDuration forKey:@"SingleAntennaSearchDuration"];
  [v4 encodeInt32:self->_dualAntennaSearchDuration forKey:@"DualAntennaSearchDuration"];
  [v4 encodeInt32:self->_singleChainRxPacketDuration forKey:@"SingleChainRxPacketDuration"];
  [v4 encodeInt32:self->_dualChainRxPacketDuration forKey:@"DualChainRxPacketDuration"];
  [v4 encodeInt32:self->_tripleChainRxPacketDuration forKey:@"TripleChainRxPacketDuration"];
  [v4 encodeInt32:self->_dspProcessingDuration forKey:@"DSPProcessingDuration"];
  [v4 encodeInt32:self->_txDuration forKey:@"TxDuration"];
  [v4 encodeInt32:self->_numPacketsReceived forKey:@"NumPacketsReceived"];
  [v4 encodeInt32:self->_numPacketsTransmitted forKey:@"NumPacketsTransmitted"];
  [v4 encodeInt32:self->_sleepCount forKey:@"SleepCount"];
  [v4 encodeInt32:self->_wakeCount forKey:@"WakeCount"];
  [v4 encodeInt32:self->_pmgrSleepCount forKey:@"PMGRSleepCount"];
  [v4 encodeInt32:self->_pmgrDeepSleepCount forKey:@"PMGRDeepSleepCount"];
  [v4 encodeInt32:self->_deepSleepDuration forKey:@"DeepSleepDuration"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRGetPowerStatsResponse alloc];
  LODWORD(v7) = self->_deepSleepDuration;
  LODWORD(v6) = self->_txDuration;
  HIDWORD(v6) = *(_DWORD *)&self->_numPacketsReceived;
  return -[PRGetPowerStatsResponse initWithSleepDuration:wakeDuration:singleAntennaSearchDuration:dualAntennaSearchDuration:singleChainRxPacketDuration:dualChainRxPacketDuration:tripleChainRxPacketDuration:dspProcessingDuration:txDuration:numPacketsReceived:numPacketsTransmitted:sleepCount:wakeCount:pmgrSleepCount:pmgrDeepSleepCount:deepSleepDuration:](v4, "initWithSleepDuration:wakeDuration:singleAntennaSearchDuration:dualAntennaSearchDuration:singleChainRxPacketDuration:dualChainRxPacketDuration:tripleChainRxPacketDuration:dspProcessingDuration:txDuration:numPacketsReceived:numPacketsTransmitted:sleepCount:wakeCount:pmgrSleepCount:pmgrDeepSleepCount:deepSleepDuration:", self->_sleepDuration, self->_wakeDuration, self->_singleAntennaSearchDuration, self->_dualAntennaSearchDuration, self->_singleChainRxPacketDuration, self->_dualChainRxPacketDuration, *(void *)&self->_tripleChainRxPacketDuration, v6, *(void *)&self->_sleepCount, *(void *)&self->_pmgrSleepCount, v7);
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Power Stats: \n Sleep Duration: %d  Wake Duration: %d \n Single Antenna Search Duration: %d Dual Antenna Search Duration: %d \n Single Chain Rx Packet Duration: %d Dual Chain Rx Packet Duration: %d Triple Chain Rx Duration: %d \n DSP Processing Duration: %d Tx Duration: %d \n Number of Packets Received: %d Number of Packets Transmitted: %d \n Sleep Count: %d Wake Count: %d \n PMGR Sleep Count: %d PMGR Deep Sleep Count: %d \n Deep Sleep Duration: %d", self->_sleepDuration, self->_wakeDuration, self->_singleAntennaSearchDuration, self->_dualAntennaSearchDuration, self->_singleChainRxPacketDuration, self->_dualChainRxPacketDuration, self->_tripleChainRxPacketDuration, self->_dspProcessingDuration, self->_txDuration, self->_numPacketsReceived, self->_numPacketsTransmitted, self->_sleepCount, self->_wakeCount, self->_pmgrSleepCount, self->_pmgrDeepSleepCount, self->_deepSleepDuration);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 sleepDuration];
    if (v6 != [(PRGetPowerStatsResponse *)self sleepDuration]) {
      goto LABEL_19;
    }
    int v7 = [v5 wakeDuration];
    if (v7 != [(PRGetPowerStatsResponse *)self wakeDuration]) {
      goto LABEL_19;
    }
    int v8 = [v5 singleAntennaSearchDuration];
    if (v8 != [(PRGetPowerStatsResponse *)self singleAntennaSearchDuration]) {
      goto LABEL_19;
    }
    int v9 = [v5 dualAntennaSearchDuration];
    if (v9 != [(PRGetPowerStatsResponse *)self dualAntennaSearchDuration]) {
      goto LABEL_19;
    }
    int v10 = [v5 singleChainRxPacketDuration];
    if (v10 != [(PRGetPowerStatsResponse *)self singleChainRxPacketDuration]) {
      goto LABEL_19;
    }
    int v11 = [v5 dualChainRxPacketDuration];
    if (v11 != [(PRGetPowerStatsResponse *)self dualChainRxPacketDuration]) {
      goto LABEL_19;
    }
    int v12 = [v5 tripleChainRxPacketDuration];
    if (v12 != [(PRGetPowerStatsResponse *)self tripleChainRxPacketDuration]) {
      goto LABEL_19;
    }
    int v13 = [v5 dspProcessingDuration];
    if (v13 != [(PRGetPowerStatsResponse *)self dspProcessingDuration]) {
      goto LABEL_19;
    }
    int v14 = [v5 txDuration];
    if (v14 == [(PRGetPowerStatsResponse *)self txDuration]
      && (int v15 = [v5 numPacketsReceived],
          v15 == [(PRGetPowerStatsResponse *)self numPacketsReceived])
      && (int v16 = [v5 numPacketsTransmitted],
          v16 == [(PRGetPowerStatsResponse *)self numPacketsTransmitted])
      && (int v17 = [v5 sleepCount], v17 == -[PRGetPowerStatsResponse sleepCount](self, "sleepCount"))
      && (int v18 = [v5 wakeCount], v18 == -[PRGetPowerStatsResponse wakeCount](self, "wakeCount"))
      && (int v19 = [v5 pmgrSleepCount],
          v19 == [(PRGetPowerStatsResponse *)self pmgrSleepCount])
      && (int v20 = [v5 pmgrDeepSleepCount],
          v20 == [(PRGetPowerStatsResponse *)self pmgrDeepSleepCount]))
    {
      int v21 = [v5 deepSleepDuration];
      BOOL v22 = v21 == [(PRGetPowerStatsResponse *)self deepSleepDuration];
    }
    else
    {
LABEL_19:
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (unsigned)sleepDuration
{
  return self->_sleepDuration;
}

- (unsigned)wakeDuration
{
  return self->_wakeDuration;
}

- (unsigned)singleAntennaSearchDuration
{
  return self->_singleAntennaSearchDuration;
}

- (unsigned)dualAntennaSearchDuration
{
  return self->_dualAntennaSearchDuration;
}

- (unsigned)singleChainRxPacketDuration
{
  return self->_singleChainRxPacketDuration;
}

- (unsigned)dualChainRxPacketDuration
{
  return self->_dualChainRxPacketDuration;
}

- (unsigned)tripleChainRxPacketDuration
{
  return self->_tripleChainRxPacketDuration;
}

- (unsigned)dspProcessingDuration
{
  return self->_dspProcessingDuration;
}

- (unsigned)txDuration
{
  return self->_txDuration;
}

- (unsigned)numPacketsReceived
{
  return self->_numPacketsReceived;
}

- (unsigned)numPacketsTransmitted
{
  return self->_numPacketsTransmitted;
}

- (unsigned)sleepCount
{
  return self->_sleepCount;
}

- (unsigned)wakeCount
{
  return self->_wakeCount;
}

- (unsigned)pmgrSleepCount
{
  return self->_pmgrSleepCount;
}

- (unsigned)pmgrDeepSleepCount
{
  return self->_pmgrDeepSleepCount;
}

- (unsigned)deepSleepDuration
{
  return self->_deepSleepDuration;
}

@end