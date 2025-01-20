@interface VideoMitigation
- ($E04785D6C22F149E9B1B648872290F90)configuration;
- (VideoMitigation)initWithConfig:(id *)a3 metalToolBox:(id)a4 MetalContext:(id)a5 imageDimensions:(id)a6;
- (int64_t)mitigate:(__CVBuffer *)a3 info:(id)a4 futureFrames:(id *)a5;
- (int64_t)updateQueuesWithInputFrame:(__CVBuffer *)a3 info:(id)a4 index:(signed __int16)a5;
- (int64_t)updateQueuesWithTwoFutureFrames:(id *)a3 atBaseIndex:(signed __int16)a4;
- (signed)getFrameIndexInQueue;
- (void)_resetIntermediateVariables;
- (void)_spatialMitigate;
- (void)_temporalMitigate;
- (void)_temporalMitigateWithFuture;
- (void)cleanTwoFutureFramesInQueuesAtBaseIndex:(signed __int16)a3;
- (void)dealloc;
- (void)setConfiguration:(id *)a3;
@end

@implementation VideoMitigation

- (VideoMitigation)initWithConfig:(id *)a3 metalToolBox:(id)a4 MetalContext:(id)a5 imageDimensions:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  if (v12 && v11)
  {
    v34.receiver = self;
    v34.super_class = (Class)VideoMitigation;
    v13 = [(VideoMitigation *)&v34 init];
    self = (VideoMitigation *)v13;
    if (!v13) {
      goto LABEL_16;
    }
    long long v14 = *(_OWORD *)&a3->var0.var0;
    long long v15 = *(_OWORD *)&a3->var0.var7;
    long long v16 = *(_OWORD *)&a3->var1.var4;
    *(_OWORD *)(v13 + 296) = *(_OWORD *)&a3->var1.var0;
    *(_OWORD *)(v13 + 312) = v16;
    *(_OWORD *)(v13 + 264) = v14;
    *(_OWORD *)(v13 + 280) = v15;
    objc_storeStrong((id *)v13 + 1, a5);
    objc_storeStrong((id *)&self->_metalToolbox, a4);
    v17 = [[MitigationGPU alloc] initWithMetalToolBox:self->_metalToolbox metalContext:v12 imageDimensions:a6];
    mitigationGpu = self->_mitigationGpu;
    self->_mitigationGpu = v17;

    if (!self->_mitigationGpu) {
      goto LABEL_16;
    }
    v19 = [[MitigationCPU alloc] initWithMetalToolBox:self->_metalToolbox mitigationGPU:self->_mitigationGpu];
    mitigationCpu = self->_mitigationCpu;
    self->_mitigationCpu = v19;

    if (!self->_mitigationCpu) {
      goto LABEL_16;
    }
    v21 = [[CalcHomography alloc] initWithMetalToolBox:self->_metalToolbox];
    calcTransform = self->_calcTransform;
    self->_calcTransform = v21;

    if (!self->_calcTransform) {
      goto LABEL_16;
    }
    [(VideoMitigation *)self _resetIntermediateVariables];
    uint64_t v23 = 0;
    while (1)
    {
      v24 = [(FigMetalContext *)self->_metalContext device];
      v25 = (MTLBuffer *)[v24 newBufferWithLength:9544 options:0];
      v26 = self->_inputMetaQueue[v23];
      self->_inputMetaQueue[v23] = v25;

      if (!self->_inputMetaQueue[v23]) {
        break;
      }
      PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
      self->_trRefQueue[v23] = PixelBuffer;
      if (!PixelBuffer) {
        break;
      }
      sub_10550(PixelBuffer, self->_metalContext, 0, 0);
      v28 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      v29 = self->_trRefTexQueue[v23];
      self->_trRefTexQueue[v23] = v28;

      if (!self->_trRefTexQueue[v23]) {
        break;
      }
      if (++v23 == 4)
      {
        v30 = +[NSMutableData dataWithLength:9544];
        dummyMetaContainer = self->_dummyMetaContainer;
        self->_dummyMetaContainer = v30;

        self = self;
        v32 = self;
        goto LABEL_13;
      }
    }
    fig_log_get_emitter();
  }
  else
  {
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_16:
  v32 = 0;
LABEL_13:

  return v32;
}

- (void)_resetIntermediateVariables
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    v4 = (Class *)((char *)&self->super.isa + i * 8);
    v5 = self->_inputFrameQueue[i];
    if (v5)
    {
      CFRelease(v5);
      v4[6] = 0;
    }
    v6 = (void *)v4[10];
    v4[10] = 0;

    v7 = (void *)v4[14];
    v4[14] = 0;
  }
  self->_frameIndexInVideo = 0;
  self->_consecutiveTemporalRepairFrameCnt = 0;
}

- (void)dealloc
{
  for (uint64_t i = 176; i != 208; i += 8)
  {
    v4 = *(Class *)((char *)&self->super.isa + i);
    if (v4) {
      CFRelease(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VideoMitigation;
  [(VideoMitigation *)&v5 dealloc];
}

- (signed)getFrameIndexInQueue
{
  return self->_frameIndexInVideo & 3;
}

- (int64_t)updateQueuesWithInputFrame:(__CVBuffer *)a3 info:(id)a4 index:(signed __int16)a5
{
  int v5 = a5;
  id v9 = a4;
  v10 = &self->super.isa + v5;
  Class v11 = v10[6];
  v10[6] = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (v11) {
    CFRelease(v11);
  }
  id v12 = sub_108B0(a3, [(GGMMetalToolBox *)self->_metalToolbox cvMetalTextureCacheRef], self->_metalContext, 0, 0);
  if (!v12
    || (v13 = (id *)(&self->super.isa + v5),
        objc_storeStrong(v13 + 10, v12),
        objc_storeStrong(v13 + 14, a4),
        [v9 objectForKeyedSubscript:@"RepairMetaContainer"],
        (long long v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v15 = 0;
LABEL_12:
    int64_t v18 = 5;
    goto LABEL_10;
  }
  id v15 = v14;
  if (![v15 mutableBytes]) {
    goto LABEL_12;
  }
  id v16 = [(MTLBuffer *)self->_inputMetaQueue[v5] contents];
  if (!v16) {
    goto LABEL_12;
  }
  v17 = v16;
  id v15 = v15;
  memcpy(v17, [v15 mutableBytes], 0x2548uLL);
  int64_t v18 = 0;
LABEL_10:

  return v18;
}

- (int64_t)updateQueuesWithTwoFutureFrames:(id *)a3 atBaseIndex:(signed __int16)a4
{
  int v4 = a4;
  uint64_t v7 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v9 = i;
    v10 = (id *)((char *)a3->var0 + 16 * v7);
    id v11 = *v10;
    id v12 = v10[1];
    v13 = v12;
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      int64_t v18 = 5;
      goto LABEL_15;
    }
    __int16 v15 = (int)v7 + v4 + 1 < 4 ? v7 + v4 + 1 : (unsigned __int16)v7 + (unsigned __int16)v4 - 3;
    id v16 = +[NSMutableDictionary dictionary];
    [v16 setObject:v13 forKey:@"MetaData"];
    [v16 setObject:self->_dummyMetaContainer forKey:@"RepairMetaContainer"];
    int64_t v17 = [(VideoMitigation *)self updateQueuesWithInputFrame:v11 info:v16 index:v15];
    if (v17) {
      break;
    }

    uint64_t v7 = 1;
    if ((v9 & 1) == 0) {
      return 0;
    }
  }
  int64_t v18 = v17;
  fig_log_get_emitter();
  FigDebugAssert3();

LABEL_15:
  return v18;
}

- (void)cleanTwoFutureFramesInQueuesAtBaseIndex:(signed __int16)a3
{
  int v3 = a3;
  inputFrameQueue = self->_inputFrameQueue;
  inputFrameTextureQueue = self->_inputFrameTextureQueue;
  inputInfoQueue = self->_inputInfoQueue;
  char v7 = 1;
  int v8 = 1;
  do
  {
    char v9 = v7;
    int v10 = v8 + v3;
    __int16 v11 = v8 + v3 - 4;
    if (v10 >= 4) {
      LOWORD(v10) = v11;
    }
    uint64_t v12 = (__int16)v10;
    v13 = inputFrameQueue[(__int16)v10];
    if (v13)
    {
      CFRelease(v13);
      inputFrameQueue[v12] = 0;
    }
    BOOL v14 = inputFrameTextureQueue[v12];
    inputFrameTextureQueue[v12] = 0;

    __int16 v15 = inputInfoQueue[v12];
    inputInfoQueue[v12] = 0;

    char v7 = 0;
    int v8 = 2;
  }
  while ((v9 & 1) != 0);
}

- (int64_t)mitigate:(__CVBuffer *)a3 info:(id)a4 futureFrames:(id *)a5
{
  id v8 = a4;
  kdebug_trace();
  unint64_t frameIndexInVideo = self->_frameIndexInVideo;
  int var2 = a5->var2;
  BOOL v12 = frameIndexInVideo < 2 && var2 > 1;
  uint64_t v13 = [(VideoMitigation *)self getFrameIndexInQueue];
  if (v12)
  {
    int64_t v14 = [(VideoMitigation *)self updateQueuesWithTwoFutureFrames:a5 atBaseIndex:v13];
    if (v14)
    {
      int64_t v17 = v14;
      goto LABEL_27;
    }
  }
  int64_t v15 = [(VideoMitigation *)self updateQueuesWithInputFrame:a3 info:v8 index:v13];
  if (v15)
  {
    int64_t v17 = v15;
LABEL_27:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_28;
  }
  id v16 = (__int16 *)[(MTLBuffer *)self->_inputMetaQueue[(int)v13] contents];
  if (!v16)
  {
    int64_t v17 = 0;
LABEL_28:
    ++self->_frameIndexInVideo;
    self->_consecutiveTemporalRepairFrameCnt = 0;
    kdebug_trace();
    goto LABEL_22;
  }
  if (*v16 < 1)
  {
    self->_consecutiveTemporalRepairFrameCnt = 0;
  }
  else
  {
    if (var2 > 1 || frameIndexInVideo >= 2)
    {
      if (frameIndexInVideo < 2) {
        [(VideoMitigation *)self _temporalMitigateWithFuture];
      }
      else {
        [(VideoMitigation *)self _temporalMitigate];
      }
      ++self->_consecutiveTemporalRepairFrameCnt;
      if (!v12) {
        goto LABEL_21;
      }
    }
    else
    {
      [(VideoMitigation *)self _spatialMitigate];
      self->_consecutiveTemporalRepairFrameCnt = 0;
      if (!v12) {
        goto LABEL_21;
      }
    }
    [(VideoMitigation *)self cleanTwoFutureFramesInQueuesAtBaseIndex:v13];
  }
LABEL_21:
  ++self->_frameIndexInVideo;
  [(MitigationGPU *)self->_mitigationGpu roiClusterCnt];
  kdebug_trace();
  int64_t v17 = 0;
LABEL_22:

  return v17;
}

- (void)_temporalMitigate
{
  kdebug_trace();
  int v3 = [(VideoMitigation *)self getFrameIndexInQueue];
  int v4 = v3;
  if (v3 > 0) {
    __int16 v5 = -1;
  }
  else {
    __int16 v5 = 3;
  }
  __int16 v6 = v5 + v3;
  if (v3 < 2) {
    __int16 v7 = 2;
  }
  else {
    __int16 v7 = -2;
  }
  __int16 v8 = v7 + v3;
  unint64_t consecutiveTemporalRepairFrameCnt = self->_consecutiveTemporalRepairFrameCnt;
  mitigationCpu = self->_mitigationCpu;
  __int16 v11 = self->_inputFrameTextureQueue[v4];
  BOOL v12 = self->_inputFrameTextureQueue[v6];
  uint64_t v13 = v8;
  int64_t v14 = &self->_inputFrameTextureQueue[v8];
  int64_t v15 = *v14;
  id v16 = v12;
  if (consecutiveTemporalRepairFrameCnt >= 2) {
    id v16 = self->_trRefTexQueue[v6];
  }
  int64_t v17 = self->_inputMetaQueue[v4];
  int64_t v18 = self->_inputMetaQueue[v6];
  v19 = self->_inputMetaQueue[v13];
  if (consecutiveTemporalRepairFrameCnt <= 1) {
    v20 = v14;
  }
  else {
    v20 = &self->_trRefTexQueue[v13];
  }
  v21 = self->_inputInfoQueue[v4];
  v22 = self->_inputInfoQueue[v6];
  uint64_t v23 = self->_inputInfoQueue[v13];
  v24 = *v20;
  v25 = self->_trRefTexQueue[v4];
  long long v26 = *(_OWORD *)&self->_configuration.internalCfg.enableColorMask;
  v29[0] = *(_OWORD *)&self->_configuration.internalCfg.clipThreshold;
  v29[1] = v26;
  long long v27 = *(_OWORD *)&self->_configuration.externalCfg.frameDelay;
  v29[2] = *(_OWORD *)&self->_configuration.externalCfg.lightMode;
  v29[3] = v27;
  LOBYTE(v28) = 1;
  [(MitigationCPU *)mitigationCpu hybridMitigationYUVInplaceInput:v11 frRefTPlusOrMinus1:v12 frRefTPlusOrMinus2:v15 trRefTPlusOrMinus1:v16 trRefTPlusOrMinus2:v24 meta:v17 metaTPlusOrMinus1:v18 metaTPlusOrMinus2:v19 info:v21 infoTPlusOrMinus1:v22 infoTPlusOrMinus2:v23 config:v29 trInput:v25 usePastAsRef:v28];
  kdebug_trace();
}

- (void)_temporalMitigateWithFuture
{
  kdebug_trace();
  int v3 = [(VideoMitigation *)self getFrameIndexInQueue];
  inputFrameTextureQueue = self->_inputFrameTextureQueue;
  __int16 v5 = self->_inputFrameTextureQueue[v3];
  __int16 v6 = v3 - 3;
  if (v3 < 3) {
    __int16 v6 = v3 + 1;
  }
  __int16 v7 = inputFrameTextureQueue[v6];
  if (v3 < 2) {
    __int16 v8 = 2;
  }
  else {
    __int16 v8 = -2;
  }
  uint64_t v9 = (__int16)(v8 + v3);
  int v10 = inputFrameTextureQueue[v9];
  __int16 v11 = self->_inputMetaQueue[v3];
  BOOL v12 = self->_inputMetaQueue[v6];
  uint64_t v13 = self->_inputMetaQueue[v9];
  int64_t v14 = self->_inputInfoQueue[v3];
  int64_t v15 = self->_inputInfoQueue[v6];
  id v16 = self->_inputInfoQueue[v9];
  mitigationCpu = self->_mitigationCpu;
  int64_t v18 = self->_trRefTexQueue[v3];
  long long v19 = *(_OWORD *)&self->_configuration.internalCfg.enableColorMask;
  v22[0] = *(_OWORD *)&self->_configuration.internalCfg.clipThreshold;
  v22[1] = v19;
  long long v20 = *(_OWORD *)&self->_configuration.externalCfg.frameDelay;
  v22[2] = *(_OWORD *)&self->_configuration.externalCfg.lightMode;
  v22[3] = v20;
  LOBYTE(v21) = 0;
  [(MitigationCPU *)mitigationCpu hybridMitigationYUVInplaceInput:v5 frRefTPlusOrMinus1:v7 frRefTPlusOrMinus2:v10 trRefTPlusOrMinus1:v7 trRefTPlusOrMinus2:v10 meta:v11 metaTPlusOrMinus1:v12 metaTPlusOrMinus2:v13 info:v14 infoTPlusOrMinus1:v15 infoTPlusOrMinus2:v16 config:v22 trInput:v18 usePastAsRef:v21];
  kdebug_trace();
}

- (void)_spatialMitigate
{
  unsigned int v3 = [(VideoMitigation *)self getFrameIndexInQueue];
  mitigationCpu = self->_mitigationCpu;
  __int16 v5 = &self->super.isa + (int)v3;
  Class v6 = v5[10];
  Class v7 = v5[26];
  Class v8 = v5[18];
  Class v9 = v5[14];
  long long v10 = *(_OWORD *)&self->_configuration.internalCfg.enableColorMask;
  v13[0] = *(_OWORD *)&self->_configuration.internalCfg.clipThreshold;
  v13[1] = v10;
  long long v11 = *(_OWORD *)&self->_configuration.externalCfg.frameDelay;
  v13[2] = *(_OWORD *)&self->_configuration.externalCfg.lightMode;
  v13[3] = v11;
  LOBYTE(v12) = 0;
  -[MitigationCPU hybridMitigationYUVInplaceInput:frRefTPlusOrMinus1:frRefTPlusOrMinus2:trRefTPlusOrMinus1:trRefTPlusOrMinus2:meta:metaTPlusOrMinus1:metaTPlusOrMinus2:info:infoTPlusOrMinus1:infoTPlusOrMinus2:config:trInput:usePastAsRef:](mitigationCpu, "hybridMitigationYUVInplaceInput:frRefTPlusOrMinus1:frRefTPlusOrMinus2:trRefTPlusOrMinus1:trRefTPlusOrMinus2:meta:metaTPlusOrMinus1:metaTPlusOrMinus2:info:infoTPlusOrMinus1:infoTPlusOrMinus2:config:trInput:usePastAsRef:", v6, v6, v6, v7, v7, v8, v8, v9, v9, v9, v13, 0, v12);
}

- ($E04785D6C22F149E9B1B648872290F90)configuration
{
  long long v3 = *(_OWORD *)&self[4].var0.var10;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var0.var2;
  *(_OWORD *)&retstr->var0.var7 = v3;
  long long v4 = *(_OWORD *)&self[4].var1.var9;
  *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&self[4].var1.var2;
  *(_OWORD *)&retstr->var1.var4 = v4;
  return self;
}

- (void)setConfiguration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var7;
  long long v5 = *(_OWORD *)&a3->var1.var4;
  *(_OWORD *)&self->_configuration.externalCfg.lightMode = *(_OWORD *)&a3->var1.var0;
  *(_OWORD *)&self->_configuration.externalCfg.frameDelay = v5;
  *(_OWORD *)&self->_configuration.internalCfg.clipThreshold = v3;
  *(_OWORD *)&self->_configuration.internalCfg.enableColorMask = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dummyMetaContainer, 0);
  for (uint64_t i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_trRefTexQueue[i + 3], 0);
  for (uint64_t j = 0; j != -4; --j)
    objc_storeStrong((id *)&self->_inputMetaQueue[j + 3], 0);
  for (uint64_t k = 0; k != -4; --k)
    objc_storeStrong((id *)&self->_inputInfoQueue[k + 3], 0);
  for (uint64_t m = 0; m != -4; --m)
    objc_storeStrong((id *)&self->_inputFrameTextureQueue[m + 3], 0);
  objc_storeStrong((id *)&self->_calcTransform, 0);
  objc_storeStrong((id *)&self->_mitigationCpu, 0);
  objc_storeStrong((id *)&self->_mitigationGpu, 0);
  objc_storeStrong((id *)&self->_metalToolbox, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end