@interface CSSPUTrustedAudioResult
- (CSSPUTrustedAudioResult)initWithEpochTimestamp:(unint64_t)a3 planarResult:(CSSPUAudioCrashResult_Struct *)a4 rolloverResult:(CSSPUAudioCrashResult_Struct *)a5 historicalLoudness:(CSSPUHistoricalLoudness_Struct)a6 maxRMS:(float)a7 numShortAudio:(unsigned int)a8 numPointsInEpoch:(unsigned int)a9 epochMinTimestamp:(unint64_t)a10 epochMaxTimestamp:(unint64_t)a11 dramMinTimestamp:(unint64_t)a12 dramMaxTimestamp:(unint64_t)a13 calculationTimestamp:(unint64_t)a14 dramDuration:(unsigned int)a15;
- (CSSPUTrustedAudioResult)initWithSPUPacketStruct:(const CMSafetyAudioResult *)a3;
- (CSSPUTrustedAudioResult_Struct)c_struct;
- (id).cxx_construct;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation CSSPUTrustedAudioResult

- (CSSPUTrustedAudioResult)initWithEpochTimestamp:(unint64_t)a3 planarResult:(CSSPUAudioCrashResult_Struct *)a4 rolloverResult:(CSSPUAudioCrashResult_Struct *)a5 historicalLoudness:(CSSPUHistoricalLoudness_Struct)a6 maxRMS:(float)a7 numShortAudio:(unsigned int)a8 numPointsInEpoch:(unsigned int)a9 epochMinTimestamp:(unint64_t)a10 epochMaxTimestamp:(unint64_t)a11 dramMinTimestamp:(unint64_t)a12 dramMaxTimestamp:(unint64_t)a13 calculationTimestamp:(unint64_t)a14 dramDuration:(unsigned int)a15
{
  float soundEnvelopeCount = a6.soundEnvelopeCount;
  float soundMeanCurrentWindow = a6.soundMeanCurrentWindow;
  float soundMeanLast15s = a6.soundMeanLast15s;
  float soundMaxMeanOverArmSession = a6.soundMaxMeanOverArmSession;
  v33.receiver = self;
  v33.super_class = (Class)CSSPUTrustedAudioResult;
  result = [(CSSPUTrustedAudioResult *)&v33 init];
  if (result)
  {
    result->_c_struct.timestamp = a3;
    *(_OWORD *)&result->_c_struct.planarResult.maxEnergy = *(_OWORD *)&a4->maxEnergy;
    long long v27 = *(_OWORD *)&a4->chaosAtMaxEnergy;
    long long v28 = *(_OWORD *)&a4->timestampAtMaxChaos;
    long long v29 = *(_OWORD *)&a4->maxSaturation;
    *(_OWORD *)((char *)&result->_c_struct.planarResult.timestampAtMaxSaturation + 1) = *(_OWORD *)((char *)&a4->timestampAtMaxSaturation
                                                                                                  + 1);
    *(_OWORD *)&result->_c_struct.planarResult.timestampAtMaxChaos = v28;
    *(_OWORD *)&result->_c_struct.planarResult.maxSaturation = v29;
    *(_OWORD *)&result->_c_struct.planarResult.chaosAtMaxEnergy = v27;
    long long v30 = *(_OWORD *)&a5->chaosAtMaxEnergy;
    long long v31 = *(_OWORD *)&a5->timestampAtMaxChaos;
    long long v32 = *(_OWORD *)&a5->maxSaturation;
    *(_OWORD *)((char *)&result->_c_struct.rolloverResult.timestampAtMaxSaturation + 1) = *(_OWORD *)((char *)&a5->timestampAtMaxSaturation + 1);
    *(_OWORD *)&result->_c_struct.rolloverResult.timestampAtMaxChaos = v31;
    *(_OWORD *)&result->_c_struct.rolloverResult.maxSaturation = v32;
    *(_OWORD *)&result->_c_struct.rolloverResult.chaosAtMaxEnergy = v30;
    *(_OWORD *)&result->_c_struct.rolloverResult.maxEnergy = *(_OWORD *)&a5->maxEnergy;
    result->_c_struct.historicalLoudness.float soundMaxMeanOverArmSession = soundMaxMeanOverArmSession;
    result->_c_struct.historicalLoudness.float soundMeanLast15s = soundMeanLast15s;
    result->_c_struct.historicalLoudness.float soundMeanCurrentWindow = soundMeanCurrentWindow;
    result->_c_struct.historicalLoudness.float soundEnvelopeCount = soundEnvelopeCount;
    result->_c_struct.maxRMS = a7;
    result->_c_struct.numShortAudio = a8;
    result->_c_struct.numPointsInEpoch = a9;
    result->_c_struct.epochMinTimestamp = a10;
    result->_c_struct.epochMaxTimestamp = a11;
    result->_c_struct.dramMinTimestamp = a12;
    result->_c_struct.dramMaxTimestamp = a13;
    result->_c_struct.calculationTimestamp = a14;
    result->_c_struct.dramDuration = a15;
  }
  return result;
}

- (CSSPUTrustedAudioResult)initWithSPUPacketStruct:(const CMSafetyAudioResult *)a3
{
  unint64_t var1 = a3->var1.var1;
  float var4 = a3->var1.var4;
  unint64_t var5 = a3->var1.var5;
  float v10 = a3->var1.var8;
  unint64_t var9 = a3->var1.var9;
  BOOL var12 = a3->var1.var12;
  float var0 = a3->var2.var0;
  unint64_t v14 = a3->var2.var1;
  float v15 = a3->var2.var4;
  unint64_t v16 = a3->var2.var5;
  float v17 = a3->var2.var8;
  unint64_t v18 = a3->var2.var9;
  BOOL v19 = a3->var2.var12;
  LOWORD(_D0) = *(_WORD *)&a3->var13;
  __asm { FCVT            S0, H0 }
  LOWORD(_D1) = *((_WORD *)&a3->var13 + 1);
  __asm { FCVT            S1, H1 }
  LOWORD(_D2) = a3[1].var0;
  __asm { FCVT            S2, H2 }
  LOWORD(_D3) = WORD1(a3[1].var0);
  __asm { FCVT            S3, H3 }
  unint64_t v24 = a3->var0;
  float v38 = a3->var1.var0;
  unint64_t v39 = var1;
  uint64_t v40 = *(void *)&a3->var1.var2;
  float v41 = var4;
  unint64_t v42 = var5;
  uint64_t v43 = *(void *)&a3->var1.var6;
  float v44 = v10;
  unint64_t v45 = var9;
  uint64_t v46 = *(void *)&a3->var1.var10;
  BOOL v47 = var12;
  float v28 = var0;
  unint64_t v29 = v14;
  uint64_t v30 = *(void *)&a3->var2.var2;
  float v31 = v15;
  unint64_t v32 = v16;
  uint64_t v33 = *(void *)&a3->var2.var6;
  float v34 = v17;
  unint64_t v35 = v18;
  uint64_t v36 = *(void *)&a3->var2.var10;
  HIDWORD(v25) = HIDWORD(v36);
  BOOL v37 = v19;
  *(float *)&double v25 = a3->var3;
  LODWORD(v27) = a3->var12;
  return -[CSSPUTrustedAudioResult initWithEpochTimestamp:planarResult:rolloverResult:historicalLoudness:maxRMS:numShortAudio:numPointsInEpoch:epochMinTimestamp:epochMaxTimestamp:dramMinTimestamp:dramMaxTimestamp:calculationTimestamp:dramDuration:](self, "initWithEpochTimestamp:planarResult:rolloverResult:historicalLoudness:maxRMS:numShortAudio:numPointsInEpoch:epochMinTimestamp:epochMaxTimestamp:dramMinTimestamp:dramMaxTimestamp:calculationTimestamp:dramDuration:", v24, &v38, &v28, a3->var4, a3->var5, a3->var6, _D0, _D1, _D2, _D3, v25, a3->var7, a3->var8, a3->var9, a3->var10, v27);
}

- (unint64_t)timestamp
{
  return self->_c_struct.timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_c_struct.timestamp = a3;
}

- (CSSPUTrustedAudioResult_Struct)c_struct
{
  return &self->_c_struct;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((_DWORD *)self + 4) = 0;
  *((_DWORD *)self + 24) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((_DWORD *)self + 16) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((unsigned char *)self + 88) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((_DWORD *)self + 30) = 0;
  *((_DWORD *)self + 36) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((unsigned char *)self + 168) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((_DWORD *)self + 50) = 0;
  *((void *)self + 22) = 0;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *(_OWORD *)((char *)self + 236) = 0u;
  return self;
}

@end