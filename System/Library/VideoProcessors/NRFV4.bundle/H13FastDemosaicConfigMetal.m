@interface H13FastDemosaicConfigMetal
- (H13FastDemosaicConfigMetal)init;
- (int)getDemosaicConfigForInputFrameMetadata:(id)a3 cameraInfoByPortType:(id)a4 applyCCM:(BOOL)a5 zeroBias:(int)a6 demosaicConfig:(id *)a7;
- (int)getQDEMNoiseSuppressionLUT:(id)a3 adaptiveGradPushDLUT:(id)a4 adaptiveGradPushHVLUT:(id)a5 qdemConfig:(id *)a6;
@end

@implementation H13FastDemosaicConfigMetal

- (H13FastDemosaicConfigMetal)init
{
  v6.receiver = self;
  v6.super_class = (Class)H13FastDemosaicConfigMetal;
  v2 = [(H13FastDemosaicConfigMetal *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }
  else {
    FigDebugAssert3();
  }

  return v3;
}

- (int)getDemosaicConfigForInputFrameMetadata:(id)a3 cameraInfoByPortType:(id)a4 applyCCM:(BOOL)a5 zeroBias:(int)a6 demosaicConfig:(id *)a7
{
  unsigned __int16 v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  if (!v11
    || ([v11 valueForKey:*MEMORY[0x263F2F5C8]], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    goto LABEL_10;
  }
  v14 = (void *)v13;
  if (!a7 || !v12)
  {
    FigDebugAssert3();
    goto LABEL_13;
  }
  *(_OWORD *)&a7[4].var0 = 0u;
  *(_OWORD *)&a7[5].var5 = 0u;
  *(_OWORD *)&a7[1].var5 = 0u;
  *(_OWORD *)&a7[2].var6 = 0u;
  *(_OWORD *)&a7->var0 = 0u;
  if (!v9)
  {
    *(_DWORD *)&a7[2].var0 = 0;
    *(void *)&a7[1].var5 = 1065353216;
    a7[3].var5 = 0;
    *(void *)&a7[2].var6 = 0x3F80000000000000;
    *(_DWORD *)&a7[4].var6 = 1065353216;
    *(void *)&a7[4].var0 = 0;
    goto LABEL_9;
  }
  v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2F3F0]];
  if (!v15)
  {
LABEL_13:
    int v23 = FigSignalErrorAt();

    goto LABEL_10;
  }
  id v16 = v15;
  uint64_t v17 = [v16 bytes];
  uint64_t v18 = *(void *)v17;
  uint64_t v19 = *(void *)(v17 + 12);
  int v20 = *(_DWORD *)(v17 + 20);
  uint64_t v21 = *(void *)(v17 + 24);
  int v22 = *(_DWORD *)(v17 + 32);
  *(_DWORD *)&a7[2].var0 = *(_DWORD *)(v17 + 8);
  *(void *)&a7[1].var5 = v18;
  a7[3].var5 = v20;
  *(void *)&a7[2].var6 = v19;
  *(_DWORD *)&a7[4].var6 = v22;
  *(void *)&a7[4].var0 = v21;

LABEL_9:
  a7[5].var7 = v8;
  *(_WORD *)&a7->var1 = 0;
  a7->var3 = 0;

  int v23 = 0;
LABEL_10:

  return v23;
}

- (int)getQDEMNoiseSuppressionLUT:(id)a3 adaptiveGradPushDLUT:(id)a4 adaptiveGradPushHVLUT:(id)a5 qdemConfig:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6
    && (uint64_t v12 = [v9 contents],
        expandLUT(a6->var19.var0, (uint64_t)a6->var19.var1, v12, 0.0625, v13, v14, v15, v16))
    && (uint64_t v17 = [v10 contents],
        expandLUT(a6->var20.var0, (uint64_t)a6->var20.var1, v17, 0.00048828, v18, v19, v20, v21))
    && (uint64_t v22 = [v11 contents],
        expandLUT(a6->var21.var0, (uint64_t)a6->var21.var1, v22, 0.00048828, v23, v24, v25, v26)))
  {
    int v27 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
  }

  return v27;
}

@end