@interface CMIDeepZoomTransferPostProcMetalStageV2
- (CMIDeepZoomTransferPostProcMetalStageV2)initWithMetalContext:(id)a3 withTileConfiguration:(id *)a4;
- (int)processTileFrom:(id)a3 with:(id)a4 to:(id)a5 commandBuffer:(id)a6;
- (void)dealloc;
@end

@implementation CMIDeepZoomTransferPostProcMetalStageV2

- (CMIDeepZoomTransferPostProcMetalStageV2)initWithMetalContext:(id)a3 withTileConfiguration:(id *)a4
{
  id v7 = a3;
  if (a4)
  {
    if (*(_WORD *)a4) {
      BOOL v8 = *((unsigned __int16 *)a4 + 1) == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      goto LABEL_13;
    }
    v14.receiver = self;
    v14.super_class = (Class)CMIDeepZoomTransferPostProcMetalStageV2;
    v9 = [(CMIDeepZoomTransferPostProcMetalStageV2 *)&v14 init];
    self = v9;
    if (!v9) {
      goto LABEL_11;
    }
    objc_storeStrong((id *)&v9->_metalContext, a3);
    if (!self->_metalContext)
    {
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v10 andOptionalCommandQueue:0];
      metalContext = self->_metalContext;
      self->_metalContext = v11;

      if (!self->_metalContext) {
        goto LABEL_13;
      }
    }
    if (sub_105F4((uint64_t)self)
      || sub_10EEC((uint64_t)self, *(_WORD *)a4, *((unsigned __int16 *)a4 + 1)))
    {
LABEL_13:
      a4 = 0;
    }
    else
    {
LABEL_11:
      self = self;
      a4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self;
    }
  }

  return (CMIDeepZoomTransferPostProcMetalStageV2 *)a4;
}

- (int)processTileFrom:(id)a3 with:(id)a4 to:(id)a5 commandBuffer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  v15 = 0;
  int v16 = -12780;
  if (v10 && v11 && v12)
  {
    v17 = v13;
    if (!v13)
    {
      v18 = [(FigMetalContext *)self->_metalContext commandQueue];
      v17 = [v18 commandBuffer];
    }
    objc_storeStrong((id *)&self->_tileResiduals, a4);
    v19 = [v12 objectAtIndexedSubscript:0];
    tileOutputLuma = self->_tileOutputLuma;
    self->_tileOutputLuma = v19;

    v21 = [v12 objectAtIndexedSubscript:1];
    tileOutputChroma = self->_tileOutputChroma;
    self->_tileOutputChroma = v21;

    v15 = [v17 computeCommandEncoder];
    if ([v10 count] == (char *)&dword_0 + 1)
    {
      v23 = [v10 objectAtIndexedSubscript:0];
      sub_8260((uint32x2_t *)self, v23, self->_tileSourceLuma, self->_tileSourceChroma, v15);
    }
    else
    {
      sub_11BA0((uint32x2_t *)self, v10, self->_tileSourceLuma, self->_tileSourceChroma, v15);
    }
    int v24 = sub_11D30((uint64_t)self, self->_tileSourceLuma, self->_tileSourceChroma, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileResiduals, self->_tileEnhancedLuma, self->_tileEnhancedChroma, v15);
    if (v24
      || (int v24 = sub_120B8((uint32x2_t *)self, self->_tileSourceLPLuma, self->_tileSourceLPChroma, self->_tileEnhancedLuma, self->_tileEnhancedChroma, self->_tileOutputLuma, self->_tileOutputChroma, v15)) != 0)
    {
      int v16 = v24;
    }
    else
    {
      int v16 = sub_12570((uint64_t)self, self->_tileSourceLuma, self->_tileOutputLuma, v15);
      if (!v16)
      {
        [v15 endEncoding];
        if (!v14)
        {
          if (v17)
          {
            [v17 commit];
            [v17 waitUntilScheduled];
            int v16 = 0;
          }
        }
      }
    }
  }
  else
  {
    v17 = v13;
  }

  return v16;
}

- (void)dealloc
{
  sub_12C48(self);
  v3.receiver = self;
  v3.super_class = (Class)CMIDeepZoomTransferPostProcMetalStageV2;
  [(CMIDeepZoomTransferPostProcMetalStageV2 *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileResiduals, 0);
  objc_storeStrong((id *)&self->_tileOutputChroma, 0);
  objc_storeStrong((id *)&self->_tileOutputLuma, 0);
  objc_storeStrong((id *)&self->_lumaBlendMask, 0);
  objc_storeStrong((id *)&self->_lumaBlendMaskTemp2, 0);
  objc_storeStrong((id *)&self->_lumaBlendMaskTemp1, 0);
  objc_storeStrong((id *)&self->_tileChromaTemp1, 0);
  objc_storeStrong((id *)&self->_tileLumaTemp2, 0);
  objc_storeStrong((id *)&self->_tileLumaTemp1, 0);
  objc_storeStrong((id *)&self->_tileChroma1Flipped, 0);
  objc_storeStrong((id *)&self->_tileLuma1Flipped, 0);
  objc_storeStrong((id *)&self->_tileEnhancedLFChroma, 0);
  objc_storeStrong((id *)&self->_tileEnhancedLFLuma, 0);
  objc_storeStrong((id *)&self->_tileEnhancedChroma, 0);
  objc_storeStrong((id *)&self->_tileEnhancedLuma, 0);
  objc_storeStrong((id *)&self->_tileSourceChroma, 0);
  objc_storeStrong((id *)&self->_tileSourceLuma, 0);
  objc_storeStrong((id *)&self->_tileSourceLPChroma, 0);
  objc_storeStrong((id *)&self->_tileSourceLPLuma, 0);
  for (uint64_t i = 128; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end