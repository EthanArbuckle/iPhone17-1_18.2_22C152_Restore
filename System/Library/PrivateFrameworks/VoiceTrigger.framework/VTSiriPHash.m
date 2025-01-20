@interface VTSiriPHash
+ (id)sharedPhash;
+ (unint64_t)sampleSizeForSignalEstimate;
- (VTSiriPHash)init;
- (signed)signalEstimate;
- (unsigned)pHash:(float *)a3 length:(int)a4;
- (unsigned)signalFractional;
- (void)setSignalEstimate:(signed __int16)a3;
- (void)setSignalFractional:(unsigned __int8)a3;
@end

@implementation VTSiriPHash

- (void)setSignalFractional:(unsigned __int8)a3
{
  self->_signalFractional = a3;
}

- (unsigned)signalFractional
{
  return self->_signalFractional;
}

- (void)setSignalEstimate:(signed __int16)a3
{
  self->_signalEstimate = a3;
}

- (signed)signalEstimate
{
  return self->_signalEstimate;
}

- (unsigned)pHash:(float *)a3 length:(int)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  FloatArray = (float *)createFloatArray(4096, @"windowed array for signal estimation");
  vDSP_vmul(a3, 1, (const float *)snrWindow, 1, FloatArray, 1, 0x1000uLL);
  v8 = fftEnergies((OpaqueFFTSetup *)snrSetup, FloatArray, 4096);
  float __C = 0.0;
  vDSP_sve(v8 + 76, 1, &__C, 0x2B3uLL);
  double v9 = __C;
  long double v10 = log10(__C);
  int v11 = (int)(v10 * 10.0 + -50.0);
  self->_signalEstimate = v11;
  *(float *)&long double v10 = v10 * 10.0;
  unsigned int v12 = vcvts_n_s32_f32(*(float *)&v10 - (float)(int)*(float *)&v10, 8uLL);
  self->_signalFractional = v12;
  v13 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349568;
    *(double *)v40 = v9;
    *(_WORD *)&v40[8] = 1026;
    *(_DWORD *)v41 = v11;
    *(_WORD *)&v41[4] = 1026;
    unsigned int v42 = v12;
    _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_INFO, "sigsum = %{public}f sigNorm= %{public}d sigFrac= %{public}d", buf, 0x18u);
  }
  free(FloatArray);
  free(v8);
  int v14 = zeroCrossingVAD((uint64_t)a3, a4);
  v15 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v40 = v14;
    *(_WORD *)&v40[4] = 1026;
    *(_DWORD *)&v40[6] = a4;
    _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_INFO, "vad offset = %{public}d, lentotal = %{public}d", buf, 0xEu);
  }
  if (v14 < 0)
  {
    uint64_t v20 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v17 = "vad could not find a start offset returned -1";
      v18 = v20;
      uint32_t v19 = 2;
      goto LABEL_11;
    }
LABEL_12:
    LOWORD(v21) = 0;
    return v21;
  }
  if (v14 > a4 - 5120)
  {
    uint64_t v16 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)v40 = v14;
      *(_WORD *)&v40[4] = 1026;
      *(_DWORD *)&v40[6] = a4;
      *(_WORD *)v41 = 1026;
      *(_DWORD *)&v41[2] = 5120;
      v17 = "vad could not find a start offset %{public}d > %{public}d - %{public}d";
      v18 = v16;
      uint32_t v19 = 20;
LABEL_11:
      _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v22 = &a3[v14];
  v23 = (float *)createFloatArray(4, @"last energy value set");
  v24 = (float *)createFloatArray(4, @"current energy value set");
  v25 = (float *)createFloatArray(2048, @"last energy value set");
  uint64_t v26 = 0;
  int v21 = 0;
  do
  {
    vDSP_vmul(&v22[v26], 1, (const float *)hammingWindow, 1, v25, 1, 0x800uLL);
    v28 = fftEnergies((OpaqueFFTSetup *)setup, v25, 2048);
    float *v24 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v28[38] + 0.0)
                                                                                         + v28[39])
                                                                                 + v28[40])
                                                                         + v28[41])
                                                                 + v28[42])
                                                         + v28[43])
                                                 + v28[44])
                                         + v28[45])
                                 + v28[46])
                         + v28[47])
                 + v28[48])
         + v28[49];
    v24[1] = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v28[76] + 0.0)
                                                                                           + v28[77])
                                                                                   + v28[78])
                                                                           + v28[79])
                                                                   + v28[80])
                                                           + v28[81])
                                                   + v28[82])
                                           + v28[83])
                                   + v28[84])
                           + v28[85])
                   + v28[86])
           + v28[87];
    v24[2] = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v28[153] + 0.0)
                                                                                           + v28[154])
                                                                                   + v28[155])
                                                                           + v28[156])
                                                                   + v28[157])
                                                           + v28[158])
                                                   + v28[159])
                                           + v28[160])
                                   + v28[161])
                           + v28[162])
                   + v28[163])
           + v28[164];
    v24[3] = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v28[307] + 0.0)
                                                                                           + v28[308])
                                                                                   + v28[309])
                                                                           + v28[310])
                                                                   + v28[311])
                                                           + v28[312])
                                                   + v28[313])
                                           + v28[314])
                                   + v28[315])
                           + v28[316])
                   + v28[317])
           + v28[318];
    free(v28);
    if (v26 * 4)
    {
      float v29 = v23[1];
      BOOL v30 = *v23 > *v24;
      float *v23 = *v24;
      float v31 = v24[1];
      BOOL v32 = v29 > v31;
      v23[1] = v31;
      float v33 = v24[2];
      float v34 = v23[3];
      int v35 = (2 * v30) | (4 * v21) | v32;
      BOOL v36 = v23[2] > v33;
      v23[2] = v33;
      float v27 = v24[3];
      int v21 = (2 * v36) | (4 * v35) | (v34 > v27);
    }
    else
    {
      float *v23 = *v24;
      v23[1] = v24[1];
      v23[2] = v24[2];
      float v27 = v24[3];
    }
    v23[3] = v27;
    v26 += 1024;
  }
  while (v26 != 5120);
  free(v25);
  free(v23);
  free(v24);
  return v21;
}

- (VTSiriPHash)init
{
  v4.receiver = self;
  v4.super_class = (Class)VTSiriPHash;
  v2 = [(VTSiriPHash *)&v4 init];
  if (v2)
  {
    hammingWindow = (uint64_t)createFloatArray(2048, @"HammingWindow");
    vDSP_hamm_window((float *)hammingWindow, 0x800uLL, 0);
    setup = (uint64_t)vDSP_create_fftsetup(0xAuLL, 2);
    snrWindow = (uint64_t)createFloatArray(4096, @"HammingWindow");
    vDSP_hamm_window((float *)snrWindow, 0x1000uLL, 0);
    snrSetup = (uint64_t)vDSP_create_fftsetup(0xDuLL, 2);
    v2->_signalEstimate = 0;
    objc_storeStrong((id *)&_sharedPHash, v2);
  }
  return v2;
}

+ (unint64_t)sampleSizeForSignalEstimate
{
  return 4096;
}

+ (id)sharedPhash
{
  v2 = +[VTPreferences sharedPreferences];
  char v3 = [v2 corespeechDaemonEnabled];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    v5 = (void *)_sharedPHash;
    if (!_sharedPHash)
    {
      v6 = objc_alloc_init(VTSiriPHash);
      v7 = (void *)_sharedPHash;
      _sharedPHash = (uint64_t)v6;

      v5 = (void *)_sharedPHash;
    }
    id v4 = v5;
  }

  return v4;
}

@end