@interface WiFiUsageLQMTransformations
+ ($06626BA963112C91E7E52BBD3AECAE4D)ctrlFrmsPercentagesWithRxCtrlUcast:(SEL)a3 RTS:(unint64_t)a4 CTS:(unint64_t)a5 BACK:(unint64_t)a6 ACK:(unint64_t)a7;
+ ($3CC19D079FD0B010EE84973AA846B91B)decodingAttemptsWithRxCrsGlitch:(SEL)a3 rxBadPLCP:(unint64_t)a4 RxBphyCrsGlitch:(unint64_t)a5 rxBphyBadPLCP:(unint64_t)a6 rxStart:(unint64_t)a7;
+ ($3CC19D079FD0B010EE84973AA846B91B)rxUcastPercentagesWithRxData:(SEL)a3 rxMgmt:(unint64_t)a4 rxCtrl:(unint64_t)a5;
+ ($50828A08DC8D0425568E958C1030530A)ratePercentagesWithTxRate:(SEL)a3 rxRate:(unint64_t)a4 txFallbackRate:(unint64_t)a5 txFrames:(unint64_t)a6 rxFrames:(unint64_t)a7 nss:(unint64_t)a8 bw:(unint64_t)a9 phyMode:(unint64_t)a10 band:(int)a11 deviceMaxRate:(int)a12;
+ ($9D2DAF67E984336BD89D1161AD44CF98)txErrorsPercentagesWithtxSuccess:(SEL)a3 txDropped:(unint64_t)a4 txNoBuff:(unint64_t)a5 txNoRes:(unint64_t)a6 txNoAck:(unint64_t)a7 txChipModeErr:(unint64_t)a8 txExpired:(unint64_t)a9 txFail:(unint64_t)a10 txFwFree:(unint64_t)a11 txMaxRetries:(unint64_t)a12 txForceExpire:(unint64_t)a13;
+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)rxDecodingErrorsPercentagesWithRxFrmTooLong:(SEL)a3 rxFrmTooShrt:(unint64_t)a4 rxBadFCS:(unint64_t)a5 rxResponseTimeout:(unint64_t)a6 rxNoDelim:(unint64_t)a7 rxAnyErr:(unint64_t)a8 rxFifo0Ovfl:(unint64_t)a9 rxFifo1Ovfl:(unint64_t)a10;
+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)ccaStatsWithDuration:(SEL)a3 ccaSelf:(unint64_t)a4 ccaOther:(unint64_t)a5 interference:(unint64_t)a6;
+ (id)dateWithMachContinuousTime:(unint64_t)a3 WithRef:(id)a4 asNS:(unint64_t)a5;
+ (id)getBinBytesPerFrame:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinBytesPerPacket:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinDecodingAttempts:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinDesense:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinEvery10thOverRatioScale:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinForDouble:(double)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6;
+ (id)getBinForRoamingLatency:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinFrames:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinMpduDensity:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinNetworkQualityResponsiveness:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinNoise:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinQueuedAmpdu:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinRTT:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinRetries:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinRssi:(int64_t)a3 As:(unint64_t)a4;
+ (id)getBinScannedChannels:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinSnr:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinThroughput:(unint64_t)a3 As:(unint64_t)a4;
+ (id)getBinTimeIntervalUpTo12h:(double)a3 As:(unint64_t)a4;
+ (id)getBinTimeIntervalUpTo60s:(double)a3 As:(unint64_t)a4;
+ (id)getLabelPingPongStats:(id)a3;
+ (id)getLabelTrafficState:(unint64_t)a3;
+ (id)numberForKeyPath:(id)a3 ofObject:(id)a4;
+ (id)ofdmDesenseReason:(unint64_t)a3;
+ (id)scanClient:(unint64_t)a3;
+ (int)maxPhyModeFrom:(int)a3;
+ (unint64_t)byteScale;
+ (unint64_t)getMaxPhyrateWithNss:(unint64_t)a3 Bw:(unint64_t)a4 Phy:(int)a5;
+ (unint64_t)mpduDensityScale;
+ (unint64_t)rateFromRatePercentage:(int64_t)a3 linkMaxRate:(unint64_t)a4;
+ (unint64_t)ratioScale;
+ (unint64_t)ratioWithValue:(unint64_t)a3 Over:(unint64_t)a4 WithScale:(unint64_t)a5;
+ (unint64_t)validateRate:(unint64_t)a3 frames:(unint64_t)a4;
+ (void)initialize;
+ (void)updateConfig;
@end

@implementation WiFiUsageLQMTransformations

+ (unint64_t)byteScale
{
  return _byteScale;
}

+ (unint64_t)ratioWithValue:(unint64_t)a3 Over:(unint64_t)a4 WithScale:(unint64_t)a5
{
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 && a4 != 0x7FFFFFFFFFFFFFFFLL) {
    return a5 * a3 / a4;
  }
  return result;
}

+ (unint64_t)ratioScale
{
  return _ratioScale;
}

+ (unint64_t)validateRate:(unint64_t)a3 frames:(unint64_t)a4
{
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (_minFramesForRates <= a4) {
      return a3;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

+ ($50828A08DC8D0425568E958C1030530A)ratePercentagesWithTxRate:(SEL)a3 rxRate:(unint64_t)a4 txFallbackRate:(unint64_t)a5 txFrames:(unint64_t)a6 rxFrames:(unint64_t)a7 nss:(unint64_t)a8 bw:(unint64_t)a9 phyMode:(unint64_t)a10 band:(int)a11 deviceMaxRate:(int)a12
{
  if (a12) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = a11 == 256;
  }
  if (v19) {
    int v20 = 128;
  }
  else {
    int v20 = a11;
  }
  int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(int64x2_t *)&retstr->var0 = v21;
  *(int64x2_t *)&retstr->var2 = v21;
  *(int64x2_t *)&retstr->var4 = v21;
  if (a9 != 0x7FFFFFFFFFFFFFFFLL && a10 != 0x7FFFFFFFFFFFFFFFLL && v20 != 0)
  {
    unint64_t result = +[WiFiUsageLQMTransformations getMaxPhyrateWithNss:Bw:Phy:](WiFiUsageLQMTransformations, "getMaxPhyrateWithNss:Bw:Phy:", a9);
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (result && result != ($50828A08DC8D0425568E958C1030530A *)0x7FFFFFFFFFFFFFFFLL)
    {
      if ((unint64_t)result >= a13) {
        unint64_t v25 = a13;
      }
      else {
        unint64_t v25 = (unint64_t)result;
      }
      if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v23 = _ratioScale * a4 / v25;
      }
      retstr->var0 = v23;
      unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      if (a5 != 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v26 = _ratioScale * a5 / v25;
      }
      retstr->var1 = v26;
      if (_minFramesForRates <= a7) {
        unint64_t v27 = _ratioScale * a6 / v25;
      }
      else {
        unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
      }
      retstr->var4 = v27;
      retstr->var5 = v25;
    }
  }
  if (a13) {
    BOOL v28 = a13 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v28 = 1;
  }
  if (!v28)
  {
    unint64_t v29 = _minFramesForRates;
    unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && _minFramesForRates <= a7) {
      unint64_t v31 = _ratioScale * a4 / a13;
    }
    retstr->var2 = v31;
    if (a5 != 0x7FFFFFFFFFFFFFFFLL && v29 <= a8) {
      unint64_t v30 = _ratioScale * a5 / a13;
    }
    retstr->var3 = v30;
  }
  return result;
}

+ (unint64_t)getMaxPhyrateWithNss:(unint64_t)a3 Bw:(unint64_t)a4 Phy:(int)a5
{
  if (!a5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = *(void *)&a5;
  int v8 = [a1 maxPhyModeFrom:*(void *)&a5];
  if (v8 == 512) {
    int v9 = 256;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = (v9 - 2);
  if (v10 <= 0x3E)
  {
    if (((1 << (v9 - 2)) & 0x4000000040000041) != 0) {
      return 54000;
    }
    if (v10 == 2) {
      return 11000;
    }
    if (v10 == 14)
    {
      uint64_t v12 = 0;
      goto LABEL_17;
    }
  }
  if (v9 == 128)
  {
    uint64_t v12 = 1;
LABEL_17:
    if ((uint64_t)a4 > 79)
    {
      if (a4 == 80)
      {
        uint64_t v13 = 2;
      }
      else
      {
        if (a4 != 160) {
          goto LABEL_28;
        }
        uint64_t v13 = 3;
      }
    }
    else
    {
      if (a4 != 20)
      {
        if (a4 == 40)
        {
          uint64_t v13 = 1;
          goto LABEL_26;
        }
LABEL_28:
        unint64_t v14 = a3 - 1;
        uint64_t v13 = 4;
LABEL_29:
        v15 = +[WiFiUsagePrivacyFilter getLabelForPhyModes:v5];
        NSLog(&cfstr_SInvalidParame.isa, "+[WiFiUsageLQMTransformations getMaxPhyrateWithNss:Bw:Phy:]", a3, v14, a4, v13, v15, v5, v12);

        return 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v13 = 0;
    }
LABEL_26:
    unint64_t v14 = a3 - 1;
    if (a3 - 1 < 3) {
      return qword_1D3D95BE8[12 * v14 + 3 * v13 + v12];
    }
    goto LABEL_29;
  }
  if (v9 == 256)
  {
    uint64_t v12 = 2;
    goto LABEL_17;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (int)maxPhyModeFrom:(int)a3
{
  int v3 = a3 & 4;
  if ((a3 & 0x22) != 0) {
    int v3 = 2;
  }
  if ((a3 & 0x48) != 0) {
    int v4 = 8;
  }
  else {
    int v4 = v3;
  }
  if ((a3 & 0x10) != 0) {
    int v5 = 16;
  }
  else {
    int v5 = v4;
  }
  if ((a3 & 0x80) != 0) {
    int v6 = 128;
  }
  else {
    int v6 = v5;
  }
  if ((a3 & 0x100) != 0) {
    int v7 = 256;
  }
  else {
    int v7 = v6;
  }
  if ((a3 & 0x200) != 0) {
    return 512;
  }
  else {
    return v7;
  }
}

+ ($3CC19D079FD0B010EE84973AA846B91B)decodingAttemptsWithRxCrsGlitch:(SEL)a3 rxBadPLCP:(unint64_t)a4 RxBphyCrsGlitch:(unint64_t)a5 rxBphyBadPLCP:(unint64_t)a6 rxStart:(unint64_t)a7
{
  unint64_t v8 = a6 + a4 + a5 + a7 + a8;
  unint64_t v9 = (unint64_t)((double)(_ratioScale * (a6 + a4)) / (double)v8);
  unint64_t v10 = (unint64_t)((double)(_ratioScale * (a7 + a5)) / (double)v8);
  double v11 = (double)(_ratioScale * a8);
  retstr->var0 = v8;
  retstr->var1 = v9;
  retstr->var2 = v10;
  retstr->var3 = (unint64_t)(v11 / (double)v8);
  return result;
}

+ (void)initialize
{
  _ratioScale = 100;
  _byteScale = 1;
  _decimalsScale = 10;
  _minFramesForRates = 20;
  _minDurationCCAms = 100;
  NSLog(&cfstr_SRatioscaleSet.isa, a2, "+[WiFiUsageLQMTransformations initialize]", 100, 10, 20, 100);
}

+ (void)updateConfig
{
  id v6 = +[WiFiUsageLQMConfiguration getConfigForKey:@"LQMTransformation"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2 = [v6 objectForKey:@"ratioScale"];
      if (v2)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          _ratioScale = [v2 unsignedLongValue];
        }
      }
      int v3 = [v6 objectForKey:@"decimalsScale"];

      if (v3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          _decimalsScale = [v3 unsignedLongValue];
        }
      }
      int v4 = [v6 objectForKey:@"minFramesForRates"];

      if (v4)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          _minFramesForRates = [v4 unsignedLongValue];
        }
      }
      int v5 = [v6 objectForKey:@"minDurationForCCAms"];

      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          _minDurationCCAms = [v5 unsignedLongValue];
        }
      }
    }
  }
  NSLog(&cfstr_SRatioscaleSet_0.isa, "+[WiFiUsageLQMTransformations updateConfig]", _ratioScale, _minFramesForRates, _minDurationCCAms);
}

+ (unint64_t)mpduDensityScale
{
  return _decimalsScale;
}

+ (id)numberForKeyPath:(id)a3 ofObject:(id)a4
{
  int v4 = [a4 valueForKeyPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 unsignedLongValue] == 0x7FFFFFFFFFFFFFFFLL) {
      id v6 = 0;
    }
    else {
      id v6 = v5;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (unint64_t)rateFromRatePercentage:(int64_t)a3 linkMaxRate:(unint64_t)a4
{
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL) {
    return (unint64_t)((double)a3 / (double)(unint64_t)_ratioScale * (double)a4);
  }
  return result;
}

+ ($06626BA963112C91E7E52BBD3AECAE4D)ctrlFrmsPercentagesWithRxCtrlUcast:(SEL)a3 RTS:(unint64_t)a4 CTS:(unint64_t)a5 BACK:(unint64_t)a6 ACK:(unint64_t)a7
{
  retstr->var0 = a4;
  if (a4)
  {
    unint64_t v8 = _ratioScale * a5 / a4;
    unint64_t v9 = _ratioScale * a6 / a4;
    unint64_t v10 = _ratioScale * a7 / a4;
    unint64_t v11 = _ratioScale * a8 / a4;
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->var1 = v8;
  retstr->var2 = v9;
  retstr->var3 = v10;
  retstr->var4 = v11;
  return result;
}

+ ($3CC19D079FD0B010EE84973AA846B91B)rxUcastPercentagesWithRxData:(SEL)a3 rxMgmt:(unint64_t)a4 rxCtrl:(unint64_t)a5
{
  unint64_t v6 = a5 + a4 + a6;
  retstr->var0 = v6;
  if (v6)
  {
    unint64_t v7 = _ratioScale * a4 / v6;
    unint64_t v8 = _ratioScale * a5 / v6;
    unint64_t v9 = _ratioScale * a6 / v6;
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->var1 = v7;
  retstr->var2 = v8;
  retstr->var3 = v9;
  return result;
}

+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)rxDecodingErrorsPercentagesWithRxFrmTooLong:(SEL)a3 rxFrmTooShrt:(unint64_t)a4 rxBadFCS:(unint64_t)a5 rxResponseTimeout:(unint64_t)a6 rxNoDelim:(unint64_t)a7 rxAnyErr:(unint64_t)a8 rxFifo0Ovfl:(unint64_t)a9 rxFifo1Ovfl:(unint64_t)a10
{
  unint64_t v11 = a5 + a4 + a6 + a7 + a8 + a9 + a10 + a11;
  retstr->var0 = v11;
  if (v11)
  {
    unint64_t result = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)_ratioScale;
    unint64_t v12 = _ratioScale * a4 / v11;
    unint64_t v13 = _ratioScale * a5 / v11;
    unint64_t v14 = _ratioScale * a6 / v11;
    unint64_t v15 = _ratioScale * a7 / v11;
    unint64_t v16 = _ratioScale * a8 / v11;
    unint64_t v17 = _ratioScale * a9 / v11;
    unint64_t v18 = _ratioScale * a10 / v11;
    unint64_t v19 = _ratioScale * a11 / v11;
  }
  else
  {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->var1 = v12;
  retstr->var2 = v13;
  retstr->var3 = v14;
  retstr->var4 = v15;
  retstr->var5 = v16;
  retstr->var6 = v18;
  retstr->var7 = v19;
  retstr->var8 = v17;
  return result;
}

+ (id)dateWithMachContinuousTime:(unint64_t)a3 WithRef:(id)a4 asNS:(unint64_t)a5
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeInterval:a4 sinceDate:(double)(a5 - a3) / -1000000000.0];
}

+ ($9D2DAF67E984336BD89D1161AD44CF98)txErrorsPercentagesWithtxSuccess:(SEL)a3 txDropped:(unint64_t)a4 txNoBuff:(unint64_t)a5 txNoRes:(unint64_t)a6 txNoAck:(unint64_t)a7 txChipModeErr:(unint64_t)a8 txExpired:(unint64_t)a9 txFail:(unint64_t)a10 txFwFree:(unint64_t)a11 txMaxRetries:(unint64_t)a12 txForceExpire:(unint64_t)a13
{
  retstr->var7 = 0;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  unint64_t v14 = a5 + a4 + a6 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14;
  retstr->var0 = v14;
  if (v14)
  {
    unint64_t result = ($9D2DAF67E984336BD89D1161AD44CF98 *)_ratioScale;
    unint64_t v15 = _ratioScale * (a6 + a5 + a7 + a8 + a9 + a10 + a11 + a12 + a13 + a14) / v14;
    retstr->var1 = _ratioScale * a4 / v14;
    retstr->var2 = v15;
    retstr->var3 = (unint64_t)result * a5 / v14;
    retstr->var4 = (unint64_t)result * a6 / v14;
    retstr->var5 = (unint64_t)result * a7 / v14;
    retstr->var6 = (unint64_t)result * a8 / v14;
    retstr->var7 = (unint64_t)result * a9 / v14;
    unint64_t v16 = (unint64_t)result * a10 / v14;
    unint64_t v17 = (unint64_t)result * a11 / v14;
    unint64_t v18 = (unint64_t)result * a12 / v14;
    unint64_t v19 = (unint64_t)result * a13 / v14;
    unint64_t v20 = (unint64_t)result * a14 / v14;
  }
  else
  {
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    int64x2_t v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&retstr->var1 = v21;
    *(int64x2_t *)&retstr->var3 = v21;
    *(int64x2_t *)&retstr->var5 = v21;
    retstr->var7 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  retstr->var8 = v16;
  retstr->var9 = v17;
  retstr->var10 = v18;
  retstr->var11 = v19;
  retstr->var12 = v20;
  return result;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)ccaStatsWithDuration:(SEL)a3 ccaSelf:(unint64_t)a4 ccaOther:(unint64_t)a5 interference:(unint64_t)a6
{
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (_minDurationCCAms <= a4) {
    unint64_t v8 = a5;
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (_minDurationCCAms <= a4) {
    unint64_t v9 = a6;
  }
  else {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (_minDurationCCAms <= a4) {
    unint64_t v7 = a7;
  }
  retstr->var0 = v8;
  retstr->var1 = v9;
  retstr->var2 = v7;
  return result;
}

+ (id)ofdmDesenseReason:(unint64_t)a3
{
  v24[8] = *MEMORY[0x1E4F143B8];
  v23[0] = &unk_1F2B942A0;
  v23[1] = &unk_1F2B942B8;
  v24[0] = @"GDB(bPhy)";
  v24[1] = @"GDB(ofdm)";
  v23[2] = &unk_1F2B942D0;
  v23[3] = &unk_1F2B942E8;
  v24[2] = @"BTCoex(bPhy)";
  v24[3] = @"BTCoex(ofdm)";
  v23[4] = &unk_1F2B94300;
  v23[5] = &unk_1F2B94318;
  v24[4] = @"LTECoex(bPhy)";
  v24[5] = @"LTECoex(ofdm)";
  v23[6] = &unk_1F2B94330;
  v23[7] = &unk_1F2B94348;
  v24[6] = @"InitGainOrCRS(bPhy)";
  v24[7] = @"initGainOrCRS(ofdm)";
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  id v5 = objc_opt_new();
  if (a3)
  {
    unint64_t v9 = [NSNumber numberWithUnsignedLong:a3];
    unint64_t v10 = [v4 objectForKeyedSubscript:v9];
    [v5 appendFormat:@"%@&", v10];

    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  unint64_t v11 = [NSNumber numberWithUnsignedLong:a3];
  unint64_t v12 = [v4 objectForKeyedSubscript:v11];
  [v5 appendFormat:@"%@&", v12];

  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v13 = [NSNumber numberWithUnsignedLong:a3];
  unint64_t v14 = [v4 objectForKeyedSubscript:v13];
  [v5 appendFormat:@"%@&", v14];

  if ((a3 & 8) == 0)
  {
LABEL_5:
    if ((a3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v15 = [NSNumber numberWithUnsignedLong:a3];
  unint64_t v16 = [v4 objectForKeyedSubscript:v15];
  [v5 appendFormat:@"%@&", v16];

  if ((a3 & 0x10) == 0)
  {
LABEL_6:
    if ((a3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v17 = [NSNumber numberWithUnsignedLong:a3];
  unint64_t v18 = [v4 objectForKeyedSubscript:v17];
  [v5 appendFormat:@"%@&", v18];

  if ((a3 & 0x20) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v19 = [NSNumber numberWithUnsignedLong:a3];
  unint64_t v20 = [v4 objectForKeyedSubscript:v19];
  [v5 appendFormat:@"%@&", v20];

  if ((a3 & 0x40) == 0)
  {
LABEL_8:
    if ((a3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  int64x2_t v21 = [NSNumber numberWithUnsignedLong:a3];
  v22 = [v4 objectForKeyedSubscript:v21];
  [v5 appendFormat:@"%@&", v22];

  if ((a3 & 0x80) != 0)
  {
LABEL_9:
    unint64_t v6 = [NSNumber numberWithUnsignedLong:a3];
    unint64_t v7 = [v4 objectForKeyedSubscript:v6];
    [v5 appendFormat:@"%@&", v7];
  }
LABEL_10:

  return v5;
}

+ (id)scanClient:(unint64_t)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1F2B94360;
  v8[1] = &unk_1F2B942A0;
  v9[0] = @"AWDL";
  v9[1] = @"NAN";
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v5 = [NSNumber numberWithUnsignedLong:a3];
  unint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

+ (id)getBinForDouble:(double)a3 In:(id)a4 WithLowestEdge:(id)a5 As:(unint64_t)a6
{
  id v9 = a4;
  unint64_t v10 = (__CFString *)a5;
  if ([v9 count])
  {
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    while (1)
    {
      unint64_t v13 = [v9 objectAtIndexedSubscript:v11];
      [v13 doubleValue];
      double v15 = v14;

      if (v15 >= a3) {
        break;
      }
      unint64_t v16 = [v9 objectAtIndexedSubscript:v11];

      ++v11;
      unint64_t v12 = v16;
      if ([v9 count] <= v11) {
        goto LABEL_8;
      }
    }
    unint64_t v16 = v12;
  }
  else
  {
    unint64_t v16 = 0;
    unint64_t v11 = 0;
  }
LABEL_8:
  unint64_t v17 = v16;
  unint64_t v18 = v17;
  if ([v9 count] > v11)
  {
    unint64_t v19 = [v9 objectAtIndexedSubscript:v11];
    [v19 doubleValue];
    double v21 = v20;

    unint64_t v18 = v17;
    if (v21 >= a3)
    {
      unint64_t v18 = [v9 objectAtIndexedSubscript:v11];
    }
  }
  if ([v9 count] == v11)
  {
    [(__CFString *)v18 doubleValue];
    if (v22 < a3)
    {

      unint64_t v18 = 0;
    }
  }
  if (a6 == 2)
  {
    unint64_t v25 = v18;
LABEL_23:
    unint64_t v26 = v25;
    goto LABEL_25;
  }
  if (!a6)
  {
    if (v17) {
      unint64_t v23 = v17;
    }
    else {
      unint64_t v23 = v10;
    }
    v24 = @"+inf";
    if (v18) {
      v24 = v18;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(%@:%@]"), v23, v24;
    unint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  unint64_t v26 = 0;
LABEL_25:

  return v26;
}

+ (id)getBinEvery10thOverRatioScale:(unint64_t)a3 As:(unint64_t)a4
{
  v19[11] = *MEMORY[0x1E4F143B8];
  v19[0] = &unk_1F2B94360;
  unint64_t v16 = [NSNumber numberWithDouble:(double)(unint64_t)_ratioScale * 0.1];
  v19[1] = v16;
  int v4 = [NSNumber numberWithDouble:(double)(unint64_t)_ratioScale * 0.2];
  v19[2] = v4;
  id v5 = [NSNumber numberWithDouble:(double)(unint64_t)_ratioScale * 0.3];
  v19[3] = v5;
  unint64_t v6 = [NSNumber numberWithDouble:(double)(unint64_t)_ratioScale * 0.4];
  v19[4] = v6;
  unint64_t v7 = [NSNumber numberWithDouble:(double)(unint64_t)_ratioScale * 0.5];
  v19[5] = v7;
  unint64_t v8 = [NSNumber numberWithDouble:(double)(unint64_t)_ratioScale * 0.6];
  v19[6] = v8;
  id v9 = [NSNumber numberWithDouble:(double)(unint64_t)_ratioScale * 0.7];
  v19[7] = v9;
  unint64_t v10 = [NSNumber numberWithDouble:(double)(unint64_t)_ratioScale * 0.8];
  v19[8] = v10;
  unint64_t v11 = [NSNumber numberWithDouble:(double)(unint64_t)_ratioScale * 0.9];
  v19[9] = v11;
  unint64_t v12 = [NSNumber numberWithUnsignedInteger:_ratioScale];
  v19[10] = v12;
  unint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:11];

  double v14 = +[WiFiUsagePrivacyFilter getBinFor:a3 In:v13 WithLowestEdge:@"0" As:a4];

  return v14;
}

+ (id)getBinRssi:(int64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B95398 WithLowestEdge:@"-inf" As:a4];
}

+ (id)getBinNoise:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B953B0 WithLowestEdge:@"-inf" As:a4];
}

+ (id)getBinSnr:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B953C8 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinDecodingAttempts:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B953E0 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinRetries:(unint64_t)a3 As:(unint64_t)a4
{
  return @"TODO: Find a valid range for RetriesPerFrames and define bins";
}

+ (id)getBinBytesPerFrame:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B953F8 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinBytesPerPacket:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B95410 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinMpduDensity:(unint64_t)a3 As:(unint64_t)a4
{
  return (id)[a1 getBinForDouble:&unk_1F2B95428 In:@"0" WithLowestEdge:a4 As:(double)a3 / (double)(unint64_t)_decimalsScale];
}

+ (id)getBinFrames:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B95440 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinForRoamingLatency:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B95458 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinTimeIntervalUpTo12h:(double)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:(unint64_t)a3 In:&unk_1F2B95470 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinTimeIntervalUpTo60s:(double)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:(unint64_t)a3 In:&unk_1F2B95488 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinQueuedAmpdu:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B954A0 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinNetworkQualityResponsiveness:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B954B8 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinThroughput:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B954D0 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinRTT:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B954E8 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinScannedChannels:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B95500 WithLowestEdge:@"0" As:a4];
}

+ (id)getBinDesense:(unint64_t)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:a3 In:&unk_1F2B95518 WithLowestEdge:@"0" As:a4];
}

+ (id)getLabelTrafficState:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    unint64_t v7 = @"VO|";
    unint64_t v8 = &stru_1F2B5AC50;
    if ((a3 & 8) == 0) {
      unint64_t v7 = &stru_1F2B5AC50;
    }
    id v9 = @"VI|";
    if ((a3 & 4) == 0) {
      id v9 = &stru_1F2B5AC50;
    }
    unint64_t v10 = @"BE|";
    if ((a3 & 1) == 0) {
      unint64_t v10 = &stru_1F2B5AC50;
    }
    if ((a3 & 2) != 0) {
      unint64_t v8 = @"BK";
    }
    id v5 = [NSString stringWithFormat:@"%@%@%@%@", v7, v9, v10, v8, v3];
  }
  return v5;
}

+ (id)getLabelPingPongStats:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [v3 sequence];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 appendFormat:@"%@|", *(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if ([v4 isEqualToString:&stru_1F2B5AC50])
    {
      unint64_t v10 = 0;
    }
    else
    {
      unint64_t v10 = [NSString stringWithString:v4];
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

@end