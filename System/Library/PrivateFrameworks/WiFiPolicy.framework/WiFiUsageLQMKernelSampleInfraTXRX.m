@interface WiFiUsageLQMKernelSampleInfraTXRX
+ (id)sampleWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSampleInfraTXRX)initWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5;
- (double)duration;
- (unint64_t)decodingAttempts;
- (unint64_t)rxAnyErrOverDecodingErrors;
- (unint64_t)rxBACKOverRxCtrlFrmsPercentage;
- (unint64_t)rxBadFCSOverDecodingErrors;
- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage;
- (unint64_t)rxBeaconMbss;
- (unint64_t)rxBeaconObss;
- (unint64_t)rxBeaconOverRxStart;
- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage;
- (unint64_t)rxDecodingErrorsOverRxStart;
- (unint64_t)rxFifo0OvflOverDecodingErrors;
- (unint64_t)rxFifo1OvflOverDecodingErrors;
- (unint64_t)rxFrmTooLongOverDecodingErrors;
- (unint64_t)rxFrmTooShrtOverDecodingErrors;
- (unint64_t)rxNoDelimOverDecodingErrors;
- (unint64_t)rxResponseTimeoutOverDecodingErrors;
- (unint64_t)rxStartOverDecodingAttemptsPercentage;
- (unint64_t)rxUcastACKOverRxCtrlFrmsPercentage;
- (unint64_t)rxUcastCTSOverRxCtrlFrmsPercentage;
- (unint64_t)rxUcastCtrlPercentage;
- (unint64_t)rxUcastDataPercentage;
- (unint64_t)rxUcastMgmtPercentage;
- (unint64_t)rxUcastOverRxStart;
- (unint64_t)rxUcastRTSOverRxCtrlFrmsPercentage;
- (unint64_t)txACKOverTxCtrlFrmsPercentage;
- (unint64_t)txAMPDUOverTxAllFrmPercentage;
- (unint64_t)txAllFrm;
- (unint64_t)txBACKOverTxCtrlFrmsPercentage;
- (unint64_t)txCTSOverTxCtrlFrmsPercentage;
- (unint64_t)txCtrlFrms;
- (unint64_t)txPhyErrorOverTxAllFrmPercentage;
- (unint64_t)txRTSFailOvertxRTS;
- (unint64_t)txRTSOverTxCtrlFrmsPercentage;
- (unint64_t)txUcastOverTxAllFrmPercentage;
- (void)setDecodingAttempts:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setRxAnyErrOverDecodingErrors:(unint64_t)a3;
- (void)setRxBACKOverRxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setRxBadFCSOverDecodingErrors:(unint64_t)a3;
- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxBeaconMbss:(unint64_t)a3;
- (void)setRxBeaconObss:(unint64_t)a3;
- (void)setRxBeaconOverRxStart:(unint64_t)a3;
- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxDecodingErrorsOverRxStart:(unint64_t)a3;
- (void)setRxFifo0OvflOverDecodingErrors:(unint64_t)a3;
- (void)setRxFifo1OvflOverDecodingErrors:(unint64_t)a3;
- (void)setRxFrmTooLongOverDecodingErrors:(unint64_t)a3;
- (void)setRxFrmTooShrtOverDecodingErrors:(unint64_t)a3;
- (void)setRxNoDelimOverDecodingErrors:(unint64_t)a3;
- (void)setRxResponseTimeoutOverDecodingErrors:(unint64_t)a3;
- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3;
- (void)setRxUcastACKOverRxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setRxUcastCTSOverRxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setRxUcastCtrlPercentage:(unint64_t)a3;
- (void)setRxUcastDataPercentage:(unint64_t)a3;
- (void)setRxUcastMgmtPercentage:(unint64_t)a3;
- (void)setRxUcastOverRxStart:(unint64_t)a3;
- (void)setRxUcastRTSOverRxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTxACKOverTxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTxAMPDUOverTxAllFrmPercentage:(unint64_t)a3;
- (void)setTxAllFrm:(unint64_t)a3;
- (void)setTxBACKOverTxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTxCTSOverTxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTxCtrlFrms:(unint64_t)a3;
- (void)setTxPhyErrorOverTxAllFrmPercentage:(unint64_t)a3;
- (void)setTxRTSFailOvertxRTS:(unint64_t)a3;
- (void)setTxRTSOverTxCtrlFrmsPercentage:(unint64_t)a3;
- (void)setTxUcastOverTxAllFrmPercentage:(unint64_t)a3;
@end

@implementation WiFiUsageLQMKernelSampleInfraTXRX

+ (id)sampleWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  id v7 = a4;
  uint64_t var0 = a3->var0;
  if (var0)
  {
    NSLog(&cfstr_SUnknownVersio.isa, "+[WiFiUsageLQMKernelSampleInfraTXRX sampleWithStruct:WithReferenceDate:AsNsec:]", var0);
    v9 = 0;
  }
  else
  {
    v9 = [[WiFiUsageLQMKernelSampleInfraTXRX alloc] initWithStruct:a3 WithReferenceDate:v7 AsNsec:a5];
  }

  return v9;
}

- (WiFiUsageLQMKernelSampleInfraTXRX)initWithStruct:(apple80211_infra_band_tx_rx_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  v30.receiver = self;
  v30.super_class = (Class)WiFiUsageLQMKernelSampleInfraTXRX;
  id v7 = a4;
  v8 = [(WiFiUsageLQMKernelSampleInfraTXRX *)&v30 init];
  uint64_t v9 = +[WiFiUsageLQMTransformations dateWithMachContinuousTime:*(void *)(&a3->var0 + 1) WithRef:v7 asNS:a5];

  v10 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v9;

  long long v28 = 0u;
  long long v29 = 0u;
  +[WiFiUsageLQMTransformations decodingAttemptsWithRxCrsGlitch:a3->var7 rxBadPLCP:a3->var6 RxBphyCrsGlitch:a3->var21 rxBphyBadPLCP:a3->var22 rxStart:a3->var5];
  *((void *)v8 + 3) = v28;
  *((void *)v8 + 4) = *((void *)&v29 + 1);
  *((void *)v8 + 5) = v29;
  *((void *)v8 + 6) = *((void *)&v28 + 1);
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  +[WiFiUsageLQMTransformations rxDecodingErrorsPercentagesWithRxFrmTooLong:HIDWORD(a3->var1) rxFrmTooShrt:a3->var2 rxBadFCS:a3->var4 rxResponseTimeout:a3->var14 rxNoDelim:a3->var15 rxAnyErr:a3->var3 rxFifo0Ovfl:a3->var16 rxFifo1Ovfl:a3->var17];
  *((void *)v8 + 7) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", (void)v23, a3->var5, +[WiFiUsageLQMTransformations ratioScale]);
  *((void *)v8 + 10) = v24;
  *((void *)v8 + 11) = *((void *)&v23 + 1);
  *((void *)v8 + 12) = v27;
  *((void *)v8 + 13) = *((void *)&v24 + 1);
  *((_OWORD *)v8 + 7) = v25;
  *((_OWORD *)v8 + 8) = v26;
  long long v21 = 0u;
  long long v22 = 0u;
  +[WiFiUsageLQMTransformations rxUcastPercentagesWithRxData:a3->var8 rxMgmt:a3->var9 rxCtrl:a3->var10];
  *((void *)v8 + 8) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", (void)v21, a3->var5, +[WiFiUsageLQMTransformations ratioScale]);
  *((void *)v8 + 18) = *((void *)&v21 + 1);
  *(_OWORD *)(v8 + 152) = v22;
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  +[WiFiUsageLQMTransformations ctrlFrmsPercentagesWithRxCtrlUcast:a3->var10 RTS:a3->var11 CTS:a3->var12 BACK:a3->var13 ACK:a3->var18];
  *((void *)v8 + 21) = *((void *)&v18 + 1);
  *((void *)v8 + 22) = v19;
  *((void *)v8 + 24) = v20;
  *((void *)v8 + 23) = *((void *)&v19 + 1);
  uint64_t var19 = a3->var19;
  *((void *)v8 + 25) = var19;
  uint64_t var20 = a3->var20;
  *((void *)v8 + 26) = var20;
  *((void *)v8 + 9) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", (var20 + var19), a3->var5, +[WiFiUsageLQMTransformations ratioScale]);
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  +[WiFiUsageLQMTransformations ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:](WiFiUsageLQMTransformations, "ctrlFrmsPercentagesWithRxCtrlUcast:RTS:CTS:BACK:ACK:", a3->var25 + a3->var24 + a3->var32 + a3->var26);
  *(_OWORD *)(v8 + 248) = v15;
  *((void *)v8 + 33) = v16;
  *((void *)v8 + 35) = v17;
  *((void *)v8 + 34) = *((void *)&v16 + 1);
  *((void *)v8 + 36) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var24, a3->var30, +[WiFiUsageLQMTransformations ratioScale]);
  uint64_t var23 = a3->var23;
  *((void *)v8 + 27) = var23;
  *((void *)v8 + 28) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var29, var23, +[WiFiUsageLQMTransformations ratioScale]);
  *((void *)v8 + 29) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var27, *((void *)v8 + 27), +[WiFiUsageLQMTransformations ratioScale]);
  *((void *)v8 + 30) = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var31, *((void *)v8 + 27), +[WiFiUsageLQMTransformations ratioScale]);
  return (WiFiUsageLQMKernelSampleInfraTXRX *)v8;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)decodingAttempts
{
  return self->_decodingAttempts;
}

- (void)setDecodingAttempts:(unint64_t)a3
{
  self->_decodingAttempts = a3;
}

- (unint64_t)rxStartOverDecodingAttemptsPercentage
{
  return self->_rxStartOverDecodingAttemptsPercentage;
}

- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxStartOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage
{
  return self->_rxBadPlcpOverDecodingAttemptsPercentage;
}

- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxBadPlcpOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage
{
  return self->_rxCrsGlitchOverDecodingAttemptsPercentage;
}

- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxCrsGlitchOverDecodingAttemptsPercentage = a3;
}

- (unint64_t)rxDecodingErrorsOverRxStart
{
  return self->_rxDecodingErrorsOverRxStart;
}

- (void)setRxDecodingErrorsOverRxStart:(unint64_t)a3
{
  self->_rxDecodingErrorsOverRxStart = a3;
}

- (unint64_t)rxUcastOverRxStart
{
  return self->_rxUcastOverRxStart;
}

- (void)setRxUcastOverRxStart:(unint64_t)a3
{
  self->_rxUcastOverRxStart = a3;
}

- (unint64_t)rxBeaconOverRxStart
{
  return self->_rxBeaconOverRxStart;
}

- (void)setRxBeaconOverRxStart:(unint64_t)a3
{
  self->_rxBeaconOverRxStart = a3;
}

- (unint64_t)rxFrmTooLongOverDecodingErrors
{
  return self->_rxFrmTooLongOverDecodingErrors;
}

- (void)setRxFrmTooLongOverDecodingErrors:(unint64_t)a3
{
  self->_rxFrmTooLongOverDecodingErrors = a3;
}

- (unint64_t)rxFrmTooShrtOverDecodingErrors
{
  return self->_rxFrmTooShrtOverDecodingErrors;
}

- (void)setRxFrmTooShrtOverDecodingErrors:(unint64_t)a3
{
  self->_rxFrmTooShrtOverDecodingErrors = a3;
}

- (unint64_t)rxAnyErrOverDecodingErrors
{
  return self->_rxAnyErrOverDecodingErrors;
}

- (void)setRxAnyErrOverDecodingErrors:(unint64_t)a3
{
  self->_rxAnyErrOverDecodingErrors = a3;
}

- (unint64_t)rxBadFCSOverDecodingErrors
{
  return self->_rxBadFCSOverDecodingErrors;
}

- (void)setRxBadFCSOverDecodingErrors:(unint64_t)a3
{
  self->_rxBadFCSOverDecodingErrors = a3;
}

- (unint64_t)rxResponseTimeoutOverDecodingErrors
{
  return self->_rxResponseTimeoutOverDecodingErrors;
}

- (void)setRxResponseTimeoutOverDecodingErrors:(unint64_t)a3
{
  self->_rxResponseTimeoutOverDecodingErrors = a3;
}

- (unint64_t)rxNoDelimOverDecodingErrors
{
  return self->_rxNoDelimOverDecodingErrors;
}

- (void)setRxNoDelimOverDecodingErrors:(unint64_t)a3
{
  self->_rxNoDelimOverDecodingErrors = a3;
}

- (unint64_t)rxFifo0OvflOverDecodingErrors
{
  return self->_rxFifo0OvflOverDecodingErrors;
}

- (void)setRxFifo0OvflOverDecodingErrors:(unint64_t)a3
{
  self->_rxFifo0OvflOverDecodingErrors = a3;
}

- (unint64_t)rxFifo1OvflOverDecodingErrors
{
  return self->_rxFifo1OvflOverDecodingErrors;
}

- (void)setRxFifo1OvflOverDecodingErrors:(unint64_t)a3
{
  self->_rxFifo1OvflOverDecodingErrors = a3;
}

- (unint64_t)rxUcastDataPercentage
{
  return self->_rxUcastDataPercentage;
}

- (void)setRxUcastDataPercentage:(unint64_t)a3
{
  self->_rxUcastDataPercentage = a3;
}

- (unint64_t)rxUcastMgmtPercentage
{
  return self->_rxUcastMgmtPercentage;
}

- (void)setRxUcastMgmtPercentage:(unint64_t)a3
{
  self->_rxUcastMgmtPercentage = a3;
}

- (unint64_t)rxUcastCtrlPercentage
{
  return self->_rxUcastCtrlPercentage;
}

- (void)setRxUcastCtrlPercentage:(unint64_t)a3
{
  self->_rxUcastCtrlPercentage = a3;
}

- (unint64_t)rxUcastRTSOverRxCtrlFrmsPercentage
{
  return self->_rxUcastRTSOverRxCtrlFrmsPercentage;
}

- (void)setRxUcastRTSOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxUcastRTSOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxUcastCTSOverRxCtrlFrmsPercentage
{
  return self->_rxUcastCTSOverRxCtrlFrmsPercentage;
}

- (void)setRxUcastCTSOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxUcastCTSOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxBACKOverRxCtrlFrmsPercentage
{
  return self->_rxBACKOverRxCtrlFrmsPercentage;
}

- (void)setRxBACKOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxBACKOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxUcastACKOverRxCtrlFrmsPercentage
{
  return self->_rxUcastACKOverRxCtrlFrmsPercentage;
}

- (void)setRxUcastACKOverRxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_rxUcastACKOverRxCtrlFrmsPercentage = a3;
}

- (unint64_t)rxBeaconMbss
{
  return self->_rxBeaconMbss;
}

- (void)setRxBeaconMbss:(unint64_t)a3
{
  self->_rxBeaconMbss = a3;
}

- (unint64_t)rxBeaconObss
{
  return self->_rxBeaconObss;
}

- (void)setRxBeaconObss:(unint64_t)a3
{
  self->_rxBeaconObss = a3;
}

- (unint64_t)txAllFrm
{
  return self->_txAllFrm;
}

- (void)setTxAllFrm:(unint64_t)a3
{
  self->_txAllFrm = a3;
}

- (unint64_t)txPhyErrorOverTxAllFrmPercentage
{
  return self->_txPhyErrorOverTxAllFrmPercentage;
}

- (void)setTxPhyErrorOverTxAllFrmPercentage:(unint64_t)a3
{
  self->_txPhyErrorOverTxAllFrmPercentage = a3;
}

- (unint64_t)txAMPDUOverTxAllFrmPercentage
{
  return self->_txAMPDUOverTxAllFrmPercentage;
}

- (void)setTxAMPDUOverTxAllFrmPercentage:(unint64_t)a3
{
  self->_txAMPDUOverTxAllFrmPercentage = a3;
}

- (unint64_t)txUcastOverTxAllFrmPercentage
{
  return self->_txUcastOverTxAllFrmPercentage;
}

- (void)setTxUcastOverTxAllFrmPercentage:(unint64_t)a3
{
  self->_txUcastOverTxAllFrmPercentage = a3;
}

- (unint64_t)txCtrlFrms
{
  return self->_txCtrlFrms;
}

- (void)setTxCtrlFrms:(unint64_t)a3
{
  self->_txCtrlFrms = a3;
}

- (unint64_t)txRTSOverTxCtrlFrmsPercentage
{
  return self->_txRTSOverTxCtrlFrmsPercentage;
}

- (void)setTxRTSOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txRTSOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txCTSOverTxCtrlFrmsPercentage
{
  return self->_txCTSOverTxCtrlFrmsPercentage;
}

- (void)setTxCTSOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txCTSOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txBACKOverTxCtrlFrmsPercentage
{
  return self->_txBACKOverTxCtrlFrmsPercentage;
}

- (void)setTxBACKOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txBACKOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txACKOverTxCtrlFrmsPercentage
{
  return self->_txACKOverTxCtrlFrmsPercentage;
}

- (void)setTxACKOverTxCtrlFrmsPercentage:(unint64_t)a3
{
  self->_txACKOverTxCtrlFrmsPercentage = a3;
}

- (unint64_t)txRTSFailOvertxRTS
{
  return self->_txRTSFailOvertxRTS;
}

- (void)setTxRTSFailOvertxRTS:(unint64_t)a3
{
  self->_txRTSFailOvertxRTS = a3;
}

- (void).cxx_destruct
{
}

@end