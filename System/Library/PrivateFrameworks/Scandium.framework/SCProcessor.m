@interface SCProcessor
- (BOOL)forBackground;
- (SCProcessor)initWithStartPacket:(const void *)a3 ofLength:(unint64_t)a4 delegate:(id)a5 withSignalQualityMetricsEnabled:(BOOL)a6 bypassingAlgorithms:(BOOL)a7 bootDate:(id)a8 hardwareModel:(id)a9;
- (SCProcessorDelegate)delegate;
- (double)currentTimestamp;
- (double)expectedDuration;
- (id).cxx_construct;
- (id)dictionaryForAnalytics:(const SCAnalytics *)a3 sessionDuration:(double)a4 systemInterface:(id)a5;
- (id)initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:;
- (uint64_t)initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:;
- (unint64_t)startTimestamp;
- (unsigned)expectedNumberOfPackets;
- (void)handleAbort:(unsigned __int8)a3 withAnalytics:(const void *)a4;
- (void)handleMotionStatusChange:(BOOL)a3;
- (void)handlePostureStatusChange:(BOOL)a3;
- (void)handleResult:(const Result *)a3 withAnalytics:(const void *)a4;
- (void)initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:;
- (void)processPacket:(const void *)a3 ofLength:(unint64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SCProcessor

- (SCProcessor)initWithStartPacket:(const void *)a3 ofLength:(unint64_t)a4 delegate:(id)a5 withSignalQualityMetricsEnabled:(BOOL)a6 bypassingAlgorithms:(BOOL)a7 bootDate:(id)a8 hardwareModel:(id)a9
{
  BOOL v10 = a7;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a8;
  id v16 = a9;
  v36.receiver = self;
  v36.super_class = (Class)SCProcessor;
  v17 = [(SCProcessor *)&v36 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v14);
    if (a4 == 112 || a4 == 115)
    {
      v18->_bypassAlgorithms = v10;
      if (v10)
      {
        v19 = sc_get_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_25BA34000, v19, OS_LOG_TYPE_DEFAULT, "note that the algorithms are being bypassed", buf, 2u);
        }
      }
      objc_initWeak(&location, v18);
      objc_copyWeak(&to, &location);
      objc_copyWeak(&v33, &location);
      objc_copyWeak(&v32, &location);
      objc_copyWeak(&v31, &location);
      LOWORD(v30) = 0;
      BYTE2(v30) = 0;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      memset(v49, 0, 21);
      LOWORD(v29) = 0;
      BYTE2(v29) = 0;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v20 = (long long *)((char *)a3 + 11);
      uint64_t v43 = 0;
      if (a4 == 112)
      {
        LOWORD(v30) = *(_WORD *)a3;
        BYTE2(v30) = *((unsigned char *)a3 + 2);
        long long v21 = *(_OWORD *)((char *)a3 + 91);
        long long v48 = *(_OWORD *)((char *)a3 + 75);
        v49[0] = v21;
        *(void *)((char *)v49 + 13) = *((void *)a3 + 13);
        long long v22 = *(_OWORD *)((char *)a3 + 27);
        long long v44 = *v20;
        long long v45 = v22;
        long long v23 = *(_OWORD *)((char *)a3 + 59);
        long long v46 = *(_OWORD *)((char *)a3 + 43);
        long long v47 = v23;
        objc_msgSend(v16, "UTF8String", v29, v30);
        operator new();
      }
      LOWORD(v29) = *(_WORD *)a3;
      BYTE2(v29) = *((unsigned char *)a3 + 2);
      long long v25 = *(_OWORD *)((char *)a3 + 91);
      long long v41 = *(_OWORD *)((char *)a3 + 75);
      long long v42 = v25;
      uint64_t v43 = *(void *)((char *)a3 + 107);
      long long v26 = *(_OWORD *)((char *)a3 + 27);
      long long v37 = *v20;
      long long v38 = v26;
      long long v27 = *(_OWORD *)((char *)a3 + 59);
      long long v39 = *(_OWORD *)((char *)a3 + 43);
      long long v40 = v27;
      objc_msgSend(v16, "UTF8String", v29, v30);
      operator new();
    }
    v24 = sc_get_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[SCProcessor initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:](a4, v24);
    }
  }
  return 0;
}

- (void)handleResult:(const Result *)a3 withAnalytics:(const void *)a4
{
  Result v6 = *a3;
  p_var1 = &a3->var1;
  double v7 = *(double *)&v6;
  Result v11 = v6;
  if (v6.var0 < 70.0) {
    *(float *)&double v7 = 1.0;
  }
  int v10 = LODWORD(v7);
  scandium::convert_analytics_to_objc((uint64_t)a4, 0, p_var1, &v10, 1, (uint64_t *)&v9, v7);
  v8 = [(SCProcessor *)self delegate];
  [(SCProcessor *)self currentTimestamp];
  objc_msgSend(v8, "handleResult:withAnalytics:atTimestamp:", &v11, &v9);

  self->_expended = 1;
  SCAnalytics::~SCAnalytics(&v9);
}

- (void)handleAbort:(unsigned __int8)a3 withAnalytics:(const void *)a4
{
  if ((a3 - 1) >= 0xA) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = a3;
  }
  scandium::convert_analytics_to_objc((uint64_t)a4, v6 | 0x100, 0, 0, 0, (uint64_t *)&v8, v4);
  double v7 = [(SCProcessor *)self delegate];
  [(SCProcessor *)self currentTimestamp];
  objc_msgSend(v7, "handleAbort:withAnalytics:atTimestamp:", v6, &v8);

  self->_expended = 1;
  SCAnalytics::~SCAnalytics(&v8);
}

- (void)handleMotionStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SCProcessor *)self forBackground])
  {
    v5 = sc_get_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[SCProcessor handleMotionStatusChange:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    id v13 = [(SCProcessor *)self delegate];
    [(SCProcessor *)self currentTimestamp];
    objc_msgSend(v13, "handleMotionStatusChange:atTimestamp:", v3);
  }
}

- (void)handlePostureStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SCProcessor *)self forBackground])
  {
    v5 = sc_get_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[SCProcessor handlePostureStatusChange:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    id v13 = [(SCProcessor *)self delegate];
    [(SCProcessor *)self currentTimestamp];
    objc_msgSend(v13, "handlePostureStatusChange:atTimestamp:", v3);
  }
}

- (double)currentTimestamp
{
  return (double)self->_frameCount * 0.015625;
}

- (void)processPacket:(const void *)a3 ofLength:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a4 == 247)
  {
    p_processor = (id *****)&self->_processor;
    value = self->_processor.__ptr_.__value_;
    if (value)
    {
      long long v7 = *((_OWORD *)a3 + 13);
      v22[12] = *((_OWORD *)a3 + 12);
      v22[13] = v7;
      v23[0] = *((_OWORD *)a3 + 14);
      *(void *)((char *)v23 + 15) = *(void *)((char *)a3 + 239);
      long long v8 = *((_OWORD *)a3 + 9);
      v22[8] = *((_OWORD *)a3 + 8);
      v22[9] = v8;
      long long v9 = *((_OWORD *)a3 + 11);
      v22[10] = *((_OWORD *)a3 + 10);
      v22[11] = v9;
      long long v10 = *((_OWORD *)a3 + 5);
      v22[4] = *((_OWORD *)a3 + 4);
      v22[5] = v10;
      long long v11 = *((_OWORD *)a3 + 7);
      v22[6] = *((_OWORD *)a3 + 6);
      v22[7] = v11;
      long long v12 = *((_OWORD *)a3 + 1);
      v22[0] = *(_OWORD *)a3;
      v22[1] = v12;
      long long v13 = *((_OWORD *)a3 + 3);
      v22[2] = *((_OWORD *)a3 + 2);
      v22[3] = v13;
      if (self->_bypassAlgorithms)
      {
        int frameCount = self->_frameCount;
        if (frameCount == scandium::Processor::max_packet_count((scandium::Processor *)value) - 1)
        {
          uint64_t v21 = 0x4270000042C80000;
          bzero(&buf, 0x3F8uLL);
          id v15 = [(SCProcessor *)self delegate];
          [(SCProcessor *)self currentTimestamp];
          objc_msgSend(v15, "handleResult:withAnalytics:atTimestamp:", &v21, &buf);

          self->_expended = 1;
          SCAnalytics::~SCAnalytics(&buf);
        }
      }
      else
      {
        scandium::Processor::process((uint64_t)value, (uint64_t)v22);
        int v18 = self->_frameCount;
        if (v18 == scandium::Processor::max_packet_count((scandium::Processor *)self->_processor.__ptr_.__value_)
                  - 1
          && !self->_expended)
        {
          v19 = sc_get_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            [[(SCProcessor *)self forBackground] processPacket:(uint8_t *)&buf ofLength:v19];
          }

          v20 = [(SCProcessor *)self delegate];
          [(SCProcessor *)self currentTimestamp];
          objc_msgSend(v20, "handleAbort:withAnalytics:atTimestamp:", 8, 0);

          self->_expended = 1;
        }
      }
      ++self->_frameCount;
      if (self->_expended) {
        std::unique_ptr<scandium::Processor>::reset[abi:ne180100](p_processor, 0);
      }
    }
  }
  else
  {
    v17 = sc_get_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SCProcessor processPacket:ofLength:](a4, v17);
    }
  }
}

- (id)dictionaryForAnalytics:(const SCAnalytics *)a3 sessionDuration:(double)a4 systemInterface:(id)a5
{
  uint64_t v342 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if ([(SCProcessor *)self forBackground])
  {
    long long v223 = *(_OWORD *)&a3->var12;
    v222[0] = @"agcOpcDuration";
    v222[1] = @"agcOpcGreenSampleRate";
    v222[2] = @"agcOpcNumConverged";
    v222[3] = @"agcOpcNumRetries";
    id var14 = a3->var14;
    id var15 = a3->var15;
    id v225 = var14;
    v222[4] = @"bailoutPoint";
    v222[5] = @"droppedSessionWindowCpmsTotalLength";
    id var46 = a3->var46;
    id var47 = a3->var47;
    id var19 = a3->var19;
    id var18 = a3->var18;
    id v227 = var46;
    v222[6] = @"droppedSessionWindowCpmsMaxSegmentLength";
    v222[7] = @"droppedSessionWindowSaturationMaxSegmentLength";
    id var48 = a3->var48;
    id var49 = a3->var49;
    id v228 = var47;
    id v229 = var49;
    v222[8] = @"droppedSessionWindowDownTotalLength";
    v222[9] = @"droppedSessionWindowSaturationTotalLength";
    id var57 = a3->var57;
    id var56 = a3->var56;
    id v231 = var48;
    v222[10] = @"droppedWindow0CpmsTotalLength";
    v222[11] = @"droppedWindow0SaturationTotalLength";
    id var51 = a3->var51;
    id var50 = a3->var50;
    id v233 = var51;
    v222[12] = @"droppedWindow1CpmsTotalLength";
    v222[13] = @"droppedWindow1SaturationTotalLength";
    id var53 = a3->var53;
    id var52 = a3->var52;
    id v235 = var53;
    v222[14] = @"droppedWindow2CpmsTotalLength";
    v222[15] = @"droppedWindow2SaturationTotalLength";
    id var55 = a3->var55;
    id var54 = a3->var54;
    id v237 = var55;
    v222[16] = @"earlyBailout";
    v222[17] = @"highFrequencyWindow";
    id v238 = var19;
    id v239 = var57;
    id var58 = a3->var58;
    v222[18] = @"highFrequencyWindowLength";
    v222[19] = @"iledGreen";
    id var121 = a3->var121;
    id v240 = var58;
    id v241 = var121;
    id var119 = a3->var119;
    v222[20] = @"iledIr";
    v222[21] = @"iledRed";
    id v22 = a3->var120;
    id v242 = var119;
    id v243 = v22;
    v222[22] = @"incompleteReason";
    long long v23 = numberOrNsNull((NSNumber *)a3->var25);
    v244 = v23;
    v222[23] = @"internalTemperature";
    v24 = numberOrNsNull((NSNumber *)a3->var20);
    id var33 = a3->var33;
    v245 = v24;
    id v246 = var33;
    v222[24] = @"irWavelength";
    v222[25] = @"mavMax1s";
    id var123 = a3->var123;
    long long v254 = *(_OWORD *)&a3->var35;
    long long v27 = *(_OWORD *)&a3->var124;
    v222[26] = @"mavMean1s";
    v222[27] = @"mavMedian1s";
    id var122 = a3->var122;
    id v247 = var123;
    id v249 = var122;
    v222[28] = @"mavMin1s";
    v222[29] = @"mavStd1s";
    id var83 = a3->var83;
    id var126 = a3->var126;
    id v251 = var83;
    v222[30] = @"maxChannelConfidenceLong";
    v222[31] = @"maxChannelConfidenceShortIR";
    id var82 = a3->var82;
    id var81 = a3->var81;
    id v253 = var82;
    v222[32] = @"maxChannelConfidenceShortRed";
    v222[33] = @"meanAccelX";
    v222[34] = @"meanAccelY";
    v222[35] = @"meanAccelZ";
    id var45 = a3->var45;
    id var38 = a3->var38;
    id var37 = a3->var37;
    id v256 = var45;
    v222[36] = @"meanPerfusionIndexGreenShort";
    v222[37] = @"meanPerfusionIndexIrLong";
    id var42 = a3->var42;
    id var41 = a3->var41;
    id v258 = var42;
    v222[38] = @"meanPerfusionIndexIrShort";
    v222[39] = @"meanPerfusionIndexRedLong";
    id var44 = a3->var44;
    id var43 = a3->var43;
    id v260 = var44;
    v222[40] = @"meanPerfusionIndexRedShort";
    v222[41] = @"meanSpO2Long";
    id var39 = a3->var39;
    id var40 = a3->var40;
    id v262 = var38;
    long long v248 = v27;
    v222[42] = @"meanSpO2ShortIR";
    v222[43] = @"meanSpO2ShortRed";
    id var80 = a3->var80;
    id v263 = var39;
    id v264 = var80;
    v222[44] = @"medianChannelConfidenceLong";
    v222[45] = @"medianChannelConfidenceShortIR";
    id var79 = a3->var79;
    id v265 = a3->var78;
    id v266 = var79;
    v222[46] = @"medianChannelConfidenceShortRed";
    v222[47] = @"medianGIRPIR";
    id var84 = a3->var84;
    id var86 = a3->var86;
    id v268 = var84;
    v222[48] = @"medianMeasurementConfidence";
    v222[49] = @"medianWeightedStdDev";
    id var77 = a3->var77;
    id var85 = a3->var85;
    id v270 = var77;
    v222[50] = @"minChannelConfidenceLong";
    v222[51] = @"minChannelConfidenceShortIR";
    id var76 = a3->var76;
    id var75 = a3->var75;
    id v272 = var76;
    v222[52] = @"minChannelConfidenceShortRed";
    v222[53] = @"numChannelsPassingGIRPIRMax";
    id var9 = a3->var9;
    id var8 = a3->var8;
    id v274 = var9;
    v222[54] = @"numChannelsPassingGIRPIRMin";
    v222[55] = @"numChannelsPassingSNRMax";
    id var60 = a3->var60;
    id var59 = a3->var59;
    id v276 = var60;
    v222[56] = @"numChannelsPassingSNRMaxLong";
    v222[57] = @"numChannelsPassingSNRMaxShortIR";
    id var62 = a3->var62;
    id var61 = a3->var61;
    id v278 = var62;
    v222[58] = @"numChannelsPassingSNRMaxShortRed";
    v222[59] = @"numChannelsPassingSNRMin";
    id var64 = a3->var64;
    id var63 = a3->var63;
    id v280 = var64;
    v222[60] = @"numChannelsPassingSNRMinLong";
    v222[61] = @"numChannelsPassingSNRMinShortIR";
    id var66 = a3->var66;
    id var65 = a3->var65;
    id v282 = var66;
    v222[62] = @"numChannelsPassingSNRMinShortRed";
    v222[63] = @"numFailedWinAggGIRPIR";
    v222[64] = @"numFailedWinStd";
    id var29 = a3->var29;
    id var28 = a3->var28;
    id v284 = var29;
    v222[65] = @"numHighConfidenceChannelsMax";
    id var67 = a3->var67;
    v222[66] = @"numHighConfidenceChannelsMaxLong";
    id var73 = a3->var73;
    v222[67] = @"numHighConfidenceChannelsMaxShortIR";
    id var69 = a3->var69;
    v222[68] = @"numHighConfidenceChannelsMaxShortRed";
    id var71 = a3->var71;
    v222[69] = @"numHighConfidenceChannelsMin";
    id var68 = a3->var68;
    v222[70] = @"numHighConfidenceChannelsMinLong";
    id var74 = a3->var74;
    v222[71] = @"numHighConfidenceChannelsMinShortIR";
    id v291 = a3->var70;
    v222[72] = @"numHighConfidenceChannelsMinShortRed";
    id var72 = a3->var72;
    v222[73] = @"numSuccessfulWindows";
    id var16 = a3->var16;
    v222[74] = @"numValidChannelsMax";
    id var11 = a3->var11;
    id var10 = a3->var10;
    v222[75] = @"numValidChannelsMin";
    id v295 = var11;
    v222[76] = @"postedHeartRate";
    long long v48 = numberOrNsNull((NSNumber *)a3->var21);
    v296 = v48;
    v222[77] = @"postedHeartRateRounded";
    v49 = numberOrNsNull((NSNumber *)a3->var21);
    v297 = v49;
    v222[78] = @"postedSpO2Rounded";
    v50 = numberOrNsNull((NSNumber *)a3->var22);
    v222[79] = @"ppgAcPeakToPeakBlank";
    id var94 = a3->var94;
    v222[80] = @"ppgAcPeakToPeakGreen";
    id var93 = a3->var93;
    v222[81] = @"ppgAcPeakToPeakIrLong";
    id var87 = a3->var87;
    v222[82] = @"ppgAcPeakToPeakIrShortIr";
    v222[83] = @"ppgAcPeakToPeakIrShortRed";
    v222[84] = @"ppgAcPeakToPeakRedLong";
    id v303 = a3->var90;
    v222[85] = @"ppgAcPeakToPeakRedShortIr";
    long long v304 = *(_OWORD *)&a3->var91;
    v222[86] = @"ppgAcPeakToPeakRedShortRed";
    v222[87] = @"ppgAcStdBlank";
    id var102 = a3->var102;
    v222[88] = @"ppgAcStdGreen";
    id var101 = a3->var101;
    v222[89] = @"ppgAcStdIrLong";
    id var95 = a3->var95;
    v222[90] = @"ppgAcStdIrShortIr";
    id var96 = a3->var96;
    v222[91] = @"ppgAcStdIrShortRed";
    id var97 = a3->var97;
    v222[92] = @"ppgAcStdRedLong";
    id v310 = a3->var98;
    v222[93] = @"ppgAcStdRedShortIr";
    id var99 = a3->var99;
    v222[94] = @"ppgAcStdRedShortRed";
    id v312 = a3->var100;
    v222[95] = @"ppgMeanBlank";
    id v313 = a3->var110;
    v222[96] = @"ppgMeanGreen";
    id var109 = a3->var109;
    v222[97] = @"ppgMeanIrLong";
    id var103 = a3->var103;
    v222[98] = @"ppgMeanIrShortIr";
    id var104 = a3->var104;
    v222[99] = @"ppgMeanIrShortRed";
    id var105 = a3->var105;
    v222[100] = @"ppgMeanRedLong";
    id var106 = a3->var106;
    v222[101] = @"ppgMeanRedShortIr";
    id var107 = a3->var107;
    v222[102] = @"ppgMeanRedShortRed";
    id v320 = a3->var108;
    v222[103] = @"rawSpO2";
    id var1 = a3->var1;
    id var0 = a3->var0;
    v222[104] = @"rawSpO2NoConfidenceGate";
    id var5 = a3->var5;
    id var4 = a3->var4;
    v222[105] = @"rawSpO2NoConfidenceGateWindow0";
    id v323 = var5;
    v222[106] = @"rawSpO2NoConfidenceGateWindow1";
    id var7 = a3->var7;
    id var6 = a3->var6;
    v222[107] = @"rawSpO2NoConfidenceGateWindow2";
    v298 = v50;
    long long v54 = *(_OWORD *)&a3->var88;
    id v325 = var7;
    v222[108] = @"rawSpO2Window0";
    id v326 = var1;
    v222[109] = @"rawSpO2Window1";
    id var3 = a3->var3;
    id var2 = a3->var2;
    long long v302 = v54;
    v222[110] = @"rawSpO2Window2";
    id v328 = var3;
    v222[111] = @"redWavelength";
    id var34 = a3->var34;
    v222[112] = @"sessionCompleted";
    id var26 = a3->var26;
    v222[113] = @"sessionDuration";
    v56 = [NSNumber numberWithDouble:a4];
    v222[114] = @"sessionSampleCount";
    id var17 = a3->var17;
    v222[115] = @"sessionSuccessful";
    id var27 = a3->var27;
    v222[116] = @"systemInstanceString";
    v222[117] = @"tiaGainBlank";
    id var118 = a3->var118;
    v222[118] = @"tiaGainGreen";
    id var117 = a3->var117;
    v331 = v56;
    v222[119] = @"tiaGainIrLong";
    id var111 = a3->var111;
    id v334 = v8;
    v222[120] = @"tiaGainIrShortIr";
    id var112 = a3->var112;
    v222[121] = @"tiaGainIrShortRed";
    id var113 = a3->var113;
    v222[122] = @"tiaGainRedLong";
    long long v340 = *(_OWORD *)&a3->var114;
    v222[123] = @"tiaGainRedShortIr";
    v222[124] = @"tiaGainRedShortRed";
    id var116 = a3->var116;
    v57 = [NSDictionary dictionaryWithObjects:&v223 forKeys:v222 count:125];
  }
  else
  {
    long long v113 = *(_OWORD *)&a3->var12;
    v112[0] = @"agcOpcDuration";
    v112[1] = @"agcOpcGreenSampleRate";
    v112[2] = @"agcOpcNumConverged";
    v112[3] = @"agcOpcNumRetries";
    id v58 = a3->var14;
    id v114 = a3->var15;
    id v115 = v58;
    v112[4] = @"droppedSessionWindowCpmsMaxSegmentLength";
    v112[5] = @"droppedSessionWindowCpmsTotalLength";
    id v59 = a3->var46;
    id v116 = a3->var47;
    id v117 = v59;
    id v60 = a3->var56;
    v112[6] = @"droppedSessionWindowDownTotalLength";
    v112[7] = @"droppedSessionWindowSaturationMaxSegmentLength";
    id v62 = a3->var48;
    id v61 = a3->var49;
    id v118 = v60;
    id v119 = v61;
    v112[8] = @"droppedSessionWindowSaturationTotalLength";
    v112[9] = @"highFrequencyWindow";
    long long v121 = *(_OWORD *)&a3->var57;
    v112[10] = @"highFrequencyWindowLength";
    v112[11] = @"iledGreen";
    id v63 = a3->var121;
    id v120 = v62;
    id v122 = v63;
    id v64 = a3->var119;
    v112[12] = @"iledIr";
    v112[13] = @"iledRed";
    id var120 = a3->var120;
    id v123 = v64;
    id v124 = var120;
    v112[14] = @"incompleteReason";
    long long v23 = numberOrNsNull((NSNumber *)a3->var25);
    v125 = v23;
    v112[15] = @"internalTemperature";
    v24 = numberOrNsNull((NSNumber *)a3->var20);
    id v66 = a3->var33;
    v126 = v24;
    id v127 = v66;
    v112[16] = @"irWavelength";
    v112[17] = @"mavMax1s";
    id v128 = a3->var123;
    long long v129 = *(_OWORD *)&a3->var124;
    v112[18] = @"mavMean1s";
    v112[19] = @"mavMedian1s";
    id v67 = a3->var122;
    v112[20] = @"mavMin1s";
    v112[21] = @"mavStd1s";
    id v68 = a3->var126;
    id v130 = v67;
    id v131 = v68;
    id v69 = a3->var83;
    v112[22] = @"maxChannelConfidenceLong";
    v112[23] = @"maxChannelConfidenceShortIR";
    id v70 = a3->var81;
    id v132 = v69;
    id v133 = v70;
    id v71 = a3->var82;
    v112[24] = @"maxChannelConfidenceShortRed";
    v112[25] = @"meanAccelX";
    long long v135 = *(_OWORD *)&a3->var35;
    v112[26] = @"meanAccelY";
    v112[27] = @"meanAccelZ";
    id v72 = a3->var37;
    id v73 = a3->var38;
    id v134 = v71;
    id v136 = v72;
    id v74 = a3->var45;
    v112[28] = @"meanPerfusionIndexGreenShort";
    v112[29] = @"meanPerfusionIndexIrLong";
    id v75 = a3->var41;
    id v76 = a3->var42;
    id v137 = v74;
    id v138 = v75;
    v112[30] = @"meanPerfusionIndexIrShort";
    v112[31] = @"meanPerfusionIndexRedLong";
    id v77 = a3->var43;
    id v78 = a3->var44;
    id v139 = v76;
    id v140 = v77;
    v112[32] = @"meanPerfusionIndexRedShort";
    v112[33] = @"meanSpO2Long";
    id v80 = a3->var39;
    id v79 = a3->var40;
    id v141 = v78;
    id v142 = v79;
    v112[34] = @"meanSpO2ShortIR";
    v112[35] = @"meanSpO2ShortRed";
    id v143 = v73;
    id v144 = v80;
    id v81 = a3->var80;
    v112[36] = @"medianChannelConfidenceLong";
    v112[37] = @"medianChannelConfidenceShortIR";
    id var78 = a3->var78;
    id v145 = v81;
    id v146 = var78;
    id v83 = a3->var79;
    v112[38] = @"medianChannelConfidenceShortRed";
    v112[39] = @"medianGIRPIR";
    id v84 = a3->var86;
    id v147 = v83;
    id v148 = v84;
    id v85 = a3->var84;
    v112[40] = @"medianMeasurementConfidence";
    v112[41] = @"medianWeightedStdDev";
    id v86 = a3->var85;
    id v149 = v85;
    id v150 = v86;
    id v87 = a3->var77;
    v112[42] = @"minChannelConfidenceLong";
    v112[43] = @"minChannelConfidenceShortIR";
    id v88 = a3->var75;
    id v151 = v87;
    id v152 = v88;
    id v89 = a3->var76;
    v112[44] = @"minChannelConfidenceShortRed";
    v112[45] = @"numChannelsPassingGIRPIR";
    id v90 = a3->var8;
    id v153 = v89;
    id v154 = v90;
    v112[46] = @"numChannelsPassingSNRMax";
    v112[47] = @"numChannelsPassingSNRMaxLong";
    id v91 = a3->var60;
    id v155 = a3->var59;
    id v156 = v91;
    v112[48] = @"numChannelsPassingSNRMaxShortIR";
    v112[49] = @"numChannelsPassingSNRMaxShortRed";
    id v92 = a3->var62;
    id v157 = a3->var61;
    id v158 = v92;
    v112[50] = @"numChannelsPassingSNRMin";
    v112[51] = @"numChannelsPassingSNRMinLong";
    id v93 = a3->var64;
    id v159 = a3->var63;
    id v160 = v93;
    id v94 = a3->var65;
    v112[52] = @"numChannelsPassingSNRMinShortIR";
    v112[53] = @"numChannelsPassingSNRMinShortRed";
    id v95 = a3->var66;
    id v161 = v94;
    id v162 = v95;
    v112[54] = @"numFailedWinAggGIRPIR";
    v112[55] = @"numFailedWinStd";
    id v96 = a3->var29;
    id v163 = a3->var28;
    id v164 = v96;
    id v97 = a3->var67;
    v112[56] = @"numHighConfidenceChannelsMax";
    v112[57] = @"numHighConfidenceChannelsMaxLong";
    id v98 = a3->var73;
    id v165 = v97;
    id v166 = v98;
    id v99 = a3->var69;
    v112[58] = @"numHighConfidenceChannelsMaxShortIR";
    v112[59] = @"numHighConfidenceChannelsMaxShortRed";
    id v100 = a3->var71;
    id v167 = v99;
    id v168 = v100;
    id v101 = a3->var68;
    v112[60] = @"numHighConfidenceChannelsMin";
    v112[61] = @"numHighConfidenceChannelsMinLong";
    id v102 = a3->var74;
    id v169 = v101;
    id v170 = v102;
    id v103 = a3->var70;
    v112[62] = @"numHighConfidenceChannelsMinShortIR";
    v112[63] = @"numHighConfidenceChannelsMinShortRed";
    id v104 = a3->var72;
    id v171 = v103;
    id v172 = v104;
    v112[64] = @"numMotionPrompts";
    id var24 = a3->var24;
    id var23 = a3->var23;
    v112[65] = @"numPosturePrompts";
    id v174 = var24;
    v112[66] = @"numValidChannels";
    long long v48 = numberOrNsNull((NSNumber *)a3->var10);
    v175 = v48;
    v112[67] = @"postedHeartRate";
    v49 = numberOrNsNull((NSNumber *)a3->var21);
    v176 = v49;
    v112[68] = @"postedHeartRateRounded";
    v50 = numberOrNsNull((NSNumber *)a3->var21);
    v177 = v50;
    v112[69] = @"postedSpO2Rounded";
    v56 = numberOrNsNull((NSNumber *)a3->var22);
    v112[70] = @"ppgAcPeakToPeakBlank";
    id v179 = a3->var94;
    v112[71] = @"ppgAcPeakToPeakGreen";
    id v180 = a3->var93;
    v112[72] = @"ppgAcPeakToPeakIrLong";
    id v181 = a3->var87;
    v112[73] = @"ppgAcPeakToPeakIrShortIr";
    long long v182 = *(_OWORD *)&a3->var88;
    v112[74] = @"ppgAcPeakToPeakIrShortRed";
    v112[75] = @"ppgAcPeakToPeakRedLong";
    id var90 = a3->var90;
    v112[76] = @"ppgAcPeakToPeakRedShortIr";
    long long v106 = *(_OWORD *)&a3->var91;
    v112[77] = @"ppgAcPeakToPeakRedShortRed";
    v112[78] = @"ppgAcStdBlank";
    id v185 = a3->var102;
    v112[79] = @"ppgAcStdGreen";
    id v186 = a3->var101;
    v112[80] = @"ppgAcStdIrLong";
    id v187 = a3->var95;
    v112[81] = @"ppgAcStdIrShortIr";
    id v188 = a3->var96;
    v112[82] = @"ppgAcStdIrShortRed";
    id v189 = a3->var97;
    v112[83] = @"ppgAcStdRedLong";
    id var98 = a3->var98;
    v112[84] = @"ppgAcStdRedShortIr";
    id v191 = a3->var99;
    v112[85] = @"ppgAcStdRedShortRed";
    id v192 = a3->var100;
    v112[86] = @"ppgMeanBlank";
    id v193 = a3->var110;
    v112[87] = @"ppgMeanGreen";
    id v194 = a3->var109;
    v112[88] = @"ppgMeanIrLong";
    id v195 = a3->var103;
    v112[89] = @"ppgMeanIrShortIr";
    id v196 = a3->var104;
    v112[90] = @"ppgMeanIrShortRed";
    id v197 = a3->var105;
    v112[91] = @"ppgMeanRedLong";
    id v198 = a3->var106;
    v112[92] = @"ppgMeanRedShortIr";
    id v199 = a3->var107;
    v112[93] = @"ppgMeanRedShortRed";
    id var108 = a3->var108;
    v112[94] = @"rawSpO2";
    id v201 = a3->var0;
    v112[95] = @"rawSpO2NoConfidenceGate";
    id v107 = a3->var5;
    id v202 = a3->var4;
    v112[96] = @"rawSpO2NoConfidenceGateWindow0";
    id v203 = v107;
    v112[97] = @"rawSpO2NoConfidenceGateWindow1";
    id v108 = a3->var7;
    id v204 = a3->var6;
    v112[98] = @"rawSpO2NoConfidenceGateWindow2";
    id v205 = v108;
    v112[99] = @"realTimeMaxMAV";
    id var30 = a3->var30;
    id var31 = a3->var31;
    v112[100] = @"realTimeMedianMAV";
    id var32 = a3->var32;
    v112[101] = @"realTimeMinMAV";
    v178 = v56;
    long long v184 = v106;
    id v208 = var30;
    v112[102] = @"redWavelength";
    id v209 = a3->var34;
    v112[103] = @"sessionCompleted";
    id v210 = a3->var26;
    v112[104] = @"sessionDuration";
    objc_msgSend(NSNumber, "numberWithDouble:", a4, @"agcOpcDuration", @"agcOpcGreenSampleRate", @"agcOpcNumConverged", @"agcOpcNumRetries", @"droppedSessionWindowCpmsMaxSegmentLength", @"droppedSessionWindowCpmsTotalLength", @"droppedSessionWindowDownTotalLength", @"droppedSessionWindowSaturationMaxSegmentLength", @"droppedSessionWindowSaturationTotalLength", @"highFrequencyWindow", @"highFrequencyWindowLength", @"iledGreen", @"iledIr", @"iledRed", @"incompleteReason", @"internalTemperature",
      @"irWavelength",
      @"mavMax1s",
      @"mavMean1s",
      @"mavMedian1s",
      @"mavMin1s",
      @"mavStd1s",
      @"maxChannelConfidenceLong",
      @"maxChannelConfidenceShortIR",
      @"maxChannelConfidenceShortRed",
      @"meanAccelX",
      @"meanAccelY",
      @"meanAccelZ",
      @"meanPerfusionIndexGreenShort",
      @"meanPerfusionIndexIrLong",
      @"meanPerfusionIndexIrShort",
      @"meanPerfusionIndexRedLong",
      @"meanPerfusionIndexRedShort",
      @"meanSpO2Long",
      @"meanSpO2ShortIR",
      @"meanSpO2ShortRed",
      @"medianChannelConfidenceLong",
      @"medianChannelConfidenceShortIR",
      @"medianChannelConfidenceShortRed",
      @"medianGIRPIR",
      @"medianMeasurementConfidence",
      @"medianWeightedStdDev",
      @"minChannelConfidenceLong",
      @"minChannelConfidenceShortIR",
      @"minChannelConfidenceShortRed",
      @"numChannelsPassingGIRPIR",
      @"numChannelsPassingSNRMax",
      @"numChannelsPassingSNRMaxLong",
      @"numChannelsPassingSNRMaxShortIR",
      @"numChannelsPassingSNRMaxShortRed",
      @"numChannelsPassingSNRMin",
      @"numChannelsPassingSNRMinLong",
      @"numChannelsPassingSNRMinShortIR",
      @"numChannelsPassingSNRMinShortRed",
      @"numFailedWinAggGIRPIR",
      @"numFailedWinStd",
      @"numHighConfidenceChannelsMax",
      @"numHighConfidenceChannelsMaxLong",
      @"numHighConfidenceChannelsMaxShortIR",
    v110 = @"numHighConfidenceChannelsMaxShortRed");
    v112[105] = @"sessionSampleCount";
    id v212 = a3->var17;
    v112[106] = @"sessionSuccessful";
    id v213 = a3->var27;
    v112[107] = @"systemInstanceString";
    v112[108] = @"tiaGainBlank";
    id v215 = a3->var118;
    v211 = v110;
    v112[109] = @"tiaGainGreen";
    id v216 = a3->var117;
    id v214 = v8;
    v112[110] = @"tiaGainIrLong";
    id v217 = a3->var111;
    v112[111] = @"tiaGainIrShortIr";
    id v218 = a3->var112;
    v112[112] = @"tiaGainIrShortRed";
    id v219 = a3->var113;
    v112[113] = @"tiaGainRedLong";
    long long v220 = *(_OWORD *)&a3->var114;
    v112[114] = @"tiaGainRedShortIr";
    v112[115] = @"tiaGainRedShortRed";
    id v221 = a3->var116;
    v57 = [NSDictionary dictionaryWithObjects:&v113 forKeys:v112 count:116];
  }
  return v57;
}

- (BOOL)forBackground
{
  return self->_forBackground;
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (unsigned)expectedNumberOfPackets
{
  return self->_expectedNumberOfPackets;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (SCProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  std::unique_ptr<scandium::Processor>::reset[abi:ne180100]((id *****)&self->_processor, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (uint64_t)initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:
{
}

- (id)initWithStartPacket:ofLength:delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:
{
  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_2709335D8;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (void)initWithStartPacket:(uint64_t)a1 ofLength:(NSObject *)a2 delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 134218496;
  uint64_t v3 = 112;
  __int16 v4 = 2048;
  uint64_t v5 = 115;
  __int16 v6 = 2048;
  uint64_t v7 = a1;
  _os_log_fault_impl(&dword_25BA34000, a2, OS_LOG_TYPE_FAULT, "invalid start packet length: expected %zu or %zu, got %zu", (uint8_t *)&v2, 0x20u);
}

- (void)initWithStartPacket:(uint64_t)a1 ofLength:(NSObject *)a2 delegate:withSignalQualityMetricsEnabled:bypassingAlgorithms:bootDate:hardwareModel:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_25BA34000, a2, OS_LOG_TYPE_FAULT, "failed to construct algs Processor: %s", (uint8_t *)&v4, 0xCu);
}

- (void)initWithStartPacket:(uint64_t)a3 ofLength:(uint64_t)a4 delegate:(uint64_t)a5 withSignalQualityMetricsEnabled:(uint64_t)a6 bypassingAlgorithms:(uint64_t)a7 bootDate:(uint64_t)a8 hardwareModel:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleMotionStatusChange:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handlePostureStatusChange:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)processPacket:(uint8_t *)buf ofLength:(os_log_t)log .cold.1(char a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4 = "foreground";
  int v5 = *a2;
  if (a1) {
    int v4 = "background";
  }
  *(_DWORD *)SCAnalytics buf = 136446466;
  *(void *)(buf + 4) = v4;
  *((_WORD *)buf + 6) = 1026;
  *(_DWORD *)(buf + 14) = v5 + 1;
  _os_log_fault_impl(&dword_25BA34000, log, OS_LOG_TYPE_FAULT, "the algorithms layer failed to produce a %{public}s result after %{public}d packets were processed", buf, 0x12u);
}

- (void)processPacket:(uint64_t)a1 ofLength:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218240;
  uint64_t v3 = 247;
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_25BA34000, a2, OS_LOG_TYPE_ERROR, "invalid input packet length: expected %zu, got %zu", (uint8_t *)&v2, 0x16u);
}

@end