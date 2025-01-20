@interface GGMMetalToolBox
- ($188FA2BE40FEEB95138B376117A44A7D)generateMetaContainerArrayBufFromMetaContainerBuf:(id)a3 imageRect:(CGRect)a4;
- ($CECAC3A835FDE6A6E30A75FB7F50DCB5)metaContainer;
- ($CECAC3A835FDE6A6E30A75FB7F50DCB5)updateMetaContainerBuffer:(GGMMetalToolBox *)self WithDetectedROI:isLowLight:;
- (FigMetalContext)metalContext;
- (GGMMetalToolBox)initWithMetalContext:(id)a3;
- (GGMMetalToolBox)initWithMetalContext:(id)a3 tuningParamDict:(id)a4;
- (__CVMetalTextureCache)cvMetalTextureCacheRef;
- (id)clusterIndicesOfRois:(id *)a3 withExtendedRadius:(float)a4 roiCnt:(signed __int16)a5 imageRect:(CGRect)a6;
- (id)clusterTheGreenGhostRois:(id)a3 withExtendedRadius:(float)a4 imageRect:(CGRect)a5;
- (id)createGhostRoiFromGhostBox:(id *)a3 computeLocalMotion:(BOOL)a4;
- (id)findGhostCandidatesFromDesGenAndTinyKeypointsFromInputTexture:(double)a3 ref4LocalMotionTexture:(double)a4 inputTPlus1Texture:(int32x2_t)a5 LSList:(double)a6 desGenKeypoints:(uint64_t)a7 homography:(void *)a8 colorParams:(void *)a9 computeLocalMotion:(void *)a10 LSDilation:(void *)a11 LSReflectCenter:(uint64_t)a12 maxLightSourceCount:(unsigned int *)a13 maxDesGenKeypoints:(BOOL)a14 maxTinyKeypoints:(unsigned int)a15 metalBuffers:(int)a16 isPrevLSFeaturesAvailable:(int)a17;
- (id)getDevice;
- (id)strongTemporalRepairYUVInput:(void *)a1 frRef0:(uint64_t)a2 frRef1:(uint64_t)a3 trRef0:(uint64_t)a4 trRef1:(uint64_t)a5 hmgrphy0:(uint64_t)a6 hmgrphy1:(uint64_t)a7 metaBuf:(uint64_t)a8 ref0MetaBuf:(id)a9 ref1MetaBuf:(id)a10 strongTemporalOutput:(id)a11 temporalOutput:(id)a12 commandEncoder:(id)a13;
- (int)_compileShaders;
- (void)YCbCrToRGB:(__CVBuffer *)a3 outputImage:(__CVBuffer *)a4 waitForComplete:(BOOL)a5;
- (void)addComputeBoxDoGToCommandEncoder:(id)a3 inputTexture:(id)a4 inputlocationsBuf:(id)a5 DoGAndLumaBuf:(id)a6 inputLocationsSize:(unsigned int)a7;
- (void)addComputeBoxFeatureVectorToCommandEncoder:(id)a3 inputTexture:(id)a4 inputlocationsBuf:(id)a5 DoGAndLumaBuf:(id)a6 inputLocationsSize:(unsigned int)a7;
- (void)addFindDesGenGhostsToCommandEncoder:(__n128)a3 inputTexture:(__n128)a4 refTexture:(uint64_t)a5 homography:(void *)a6 colorParams:(void *)a7 kpCnt:(void *)a8 kpIdx:(uint64_t)a9 reflectedLsBboxList:(unsigned int)a10 lsCnt:(void *)a11 desGenKeypoints:(id)a12 desGenMappingInfo:(uint64_t)a13 ghostBoxes:(id)a14;
- (void)addFindTinyKPsToCommandEncoder:(__n128)a3 inputTexture:(__n128)a4 referenceTexture:(uint64_t)a5 inputlocationsBuf:(void *)a6 ggIdxBuf:(void *)a7 tinyGhostBoxes:(void *)a8 colorParams:(void *)a9 homography:(void *)a10 reflectedLsBboxList:(void *)a11 lsCnt:(id *)a12 inputLocationsSize:(id)a13;
- (void)backWarpYUV:(double)a3 warped:(double)a4 withHomography:(uint64_t)a5 waitForComplete:(__CVBuffer *)a6;
- (void)commitCmdBuffer:(id)a3 waitForComplete:(BOOL)a4;
- (void)computeBlendingWeightsSpatialOnlyYUVInput:(id)a3 metadataBuf:(id)a4;
- (void)computeBlendingWeightsYUVInput:(id)a3 temporalRepaired:(id)a4 metadataBuf:(id)a5 commandEncoder:(id)a6;
- (void)computeDiffForLocalMotion:(__CVBuffer *)a3 andYUVImage:(__CVBuffer *)a4 outputImage:(__CVBuffer *)a5 waitForComplete:(BOOL)a6;
- (void)computeDoGAndLumaForBoxesViaInput:(id)a3 inputLocationsSize:(unsigned int)a4 metalBuffers:(id *)a5 commandBuffer:(id)a6;
- (void)computeIntegralBinImageFromInput:(__CVBuffer *)a3 toIntegral:(__CVBuffer *)a4 waitForComplete:(BOOL)a5;
- (void)dealloc;
- (void)encodeBackWarpYUVToCommandBuffer:(__n128)a3 reference:(__n128)a4 toOutput:(uint64_t)a5 withHomography:(void *)a6;
- (void)encodeCollectClusterStats:(id)a3 clusterMetaBuf:(id)a4 metaBuf:(id)a5;
- (void)encodeComputeBlendingWeightsForRepairYUV:(id)a3 input:(id)a4 temporalRepaired:(id)a5 metadataBuf:(id)a6;
- (void)encodeComputeBlendingWeightsSpatialOnlyForRepairYUV:(id)a3 input:(id)a4 metadataBuf:(id)a5;
- (void)encodeComputeDiffForLocalMotionYUVToCommandBuffer:(id)a3 input0Texture:(id)a4 input1Texture:(id)a5 outputTexture:(id)a6;
- (void)encodeComputeIntegralBinImageToCommandBuffer:(id)a3 inputBuf:(id)a4 toIntegral:(id)a5;
- (void)encodeGetGhostMaxLumaYUV:(id)a3 input:(id)a4 metaBuf:(id)a5;
- (void)encodeGetRefTypeYUV:(__n128)a3 input:(__n128)a4 ref0:(__n128)a5 ref1:(__n128)a6 metaBuf:(__n128)a7 meta0Buf:(uint64_t)a8 meta1Buf:(void *)a9 hmgrphy0:(void *)a10 hmgrphy1:(void *)a11;
- (void)encodeStrongTemporalRepairYUVToCommandBuffer:(__n128)a3 input:(__n128)a4 frRef0:(__n128)a5 frRef1:(__n128)a6 trRef0:(__n128)a7 trRef1:(uint64_t)a8 hmgrphy0:(void *)a9 hmgrphy1:(void *)a10 strongTemporalOutput:(void *)a11 temporalOutput:(void *)a12 metaBuf:(void *)a13 ref0MetaBuf:(void *)a14 ref1MetaBuf:(id)a15;
- (void)encodeSyncMaxLuma:(id)a3 metaBuf:(id)a4;
- (void)encodeSyncRefType:(id)a3 metaBuf:(id)a4;
- (void)encodeYCbCrToRGBToCommandBuffer:(id)a3 inputTexture:(id)a4 outTexture:(id)a5;
- (void)getGhostMaxLumaYUVInput:(id)a3 metaBuf:(id)a4 commandEncoder:(id)a5;
- (void)getRefTypeYUVInput:(double)a3 ref0:(double)a4 ref1:(double)a5 metaBuf:(double)a6 meta0Buf:(double)a7 meta1Buf:(uint64_t)a8 hmgrphy0:(uint64_t)a9 hmgrphy1:(uint64_t)a10 commandEncoder:(uint64_t)a11;
- (void)setMetaContainer:(id *)a3;
- (void)setRepairTuningParams:(id *)a3 withDict:(id)a4;
@end

@implementation GGMMetalToolBox

- (GGMMetalToolBox)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)GGMMetalToolBox;
    v6 = [(GGMMetalToolBox *)&v17 init];
    self = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_metalContext, a3);
      v7 = [v5 device];
      device = self->_device;
      self->_device = v7;

      v9 = [v5 commandQueue];
      commandQueue = self->_commandQueue;
      self->_commandQueue = v9;

      if (![(GGMMetalToolBox *)self _compileShaders])
      {
        self->_forceGpuWaitForComplete = 0;
        for (uint64_t i = 168; i != 648; i += 8)
        {
          v12 = (objc_class *)[(MTLDevice *)self->_device newBufferWithLength:9544 options:0];
          v13 = *(Class *)((char *)&self->super.isa + i);
          *(Class *)((char *)&self->super.isa + i) = v12;

          if (!*(Class *)((char *)&self->super.isa + i))
          {
            fig_log_get_emitter();
            goto LABEL_11;
          }
        }
        CFStringRef v18 = kCVMetalTextureCacheMaximumTextureAgeKey;
        v19 = &off_3D3A0;
        v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        if (!CVMetalTextureCacheCreate(kCFAllocatorDefault, (CFDictionaryRef)v14, self->_device, 0, &self->_cvMetalTextureCacheRef))
        {

          self = self;
          v15 = self;
          goto LABEL_9;
        }
        FigSignalErrorAt();
      }
    }
  }
  else
  {
    fig_log_get_emitter();
LABEL_11:
    FigDebugAssert3();
  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (GGMMetalToolBox)initWithMetalContext:(id)a3 tuningParamDict:(id)a4
{
  id v6 = a4;
  v7 = [(GGMMetalToolBox *)self initWithMetalContext:a3];
  v8 = v7;
  if (v7)
  {
    [(GGMMetalToolBox *)v7 setRepairTuningParams:&v7->_tuningParams withDict:v6];
    v9 = v8;
  }

  return v8;
}

- (id)getDevice
{
  return [(FigMetalContext *)self->_metalContext device];
}

- (void)dealloc
{
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
  {
    CVMetalTextureCacheFlush(cvMetalTextureCacheRef, 0);
    v4 = self->_cvMetalTextureCacheRef;
    if (v4) {
      CFRelease(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)GGMMetalToolBox;
  [(GGMMetalToolBox *)&v5 dealloc];
}

- (int)_compileShaders
{
  v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::backwarpWithHomographyYUV" constants:0];
  backwarpWithHomographyYUV = self->_backwarpWithHomographyYUV;
  self->_backwarpWithHomographyYUV = v3;

  if (self->_backwarpWithHomographyYUV)
  {
    objc_super v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::YCbCrToRGB" constants:0];
    YCbCrToRGB = self->_YCbCrToRGB;
    self->_YCbCrToRGB = v5;

    if (self->_YCbCrToRGB)
    {
      v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::computeDiffForLocalMotionYUV" constants:0];
      computeDiffForLocalMotionYUV = self->_computeDiffForLocalMotionYUV;
      self->_computeDiffForLocalMotionYUV = v7;

      if (self->_computeDiffForLocalMotionYUV)
      {
        v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::findTinyKPs" constants:0];
        findTinyKPs = self->_findTinyKPs;
        self->_findTinyKPs = v9;

        if (self->_findTinyKPs)
        {
          v11 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::findGhostKeypointsFromDesGen" constants:0];
          findGhostKeypointsFromDesGen = self->_findGhostKeypointsFromDesGen;
          self->_findGhostKeypointsFromDesGen = v11;

          if (self->_findGhostKeypointsFromDesGen)
          {
            v13 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::computeBoxDoG" constants:0];
            computeBoxDoG = self->_computeBoxDoG;
            self->_computeBoxDoG = v13;

            if (self->_computeBoxDoG)
            {
              v15 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::computeBoxLumaFeatureVector" constants:0];
              computeBoxLumaFeatureVector = self->_computeBoxLumaFeatureVector;
              self->_computeBoxLumaFeatureVector = v15;

              if (self->_computeBoxLumaFeatureVector)
              {
                objc_super v17 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::sumRows" constants:0];
                integralBinImageRow = self->_integralBinImageRow;
                self->_integralBinImageRow = v17;

                if (self->_integralBinImageRow)
                {
                  v19 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::sumCols" constants:0];
                  integralBinImageCol = self->_integralBinImageCol;
                  self->_integralBinImageCol = v19;

                  if (self->_integralBinImageCol)
                  {
                    v21 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::computeBlendingWeightsYUV" constants:0];
                    computeBlendingWeightsYUV = self->_computeBlendingWeightsYUV;
                    self->_computeBlendingWeightsYUV = v21;

                    if (self->_computeBlendingWeightsYUV)
                    {
                      v23 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::computeBlendingWeightsSpatialOnlyYUV" constants:0];
                      computeBlendingWeightsSpatialOnlyYUV = self->_computeBlendingWeightsSpatialOnlyYUV;
                      self->_computeBlendingWeightsSpatialOnlyYUV = v23;

                      if (self->_computeBlendingWeightsSpatialOnlyYUV)
                      {
                        v25 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::getGhostMaxLumaYUV" constants:0];
                        getGhostMaxLumaYUV = self->_getGhostMaxLumaYUV;
                        self->_getGhostMaxLumaYUV = v25;

                        if (self->_getGhostMaxLumaYUV)
                        {
                          v27 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::syncMaxLuma" constants:0];
                          syncMaxLuma = self->_syncMaxLuma;
                          self->_syncMaxLuma = v27;

                          if (self->_syncMaxLuma)
                          {
                            v29 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::getRefTypeYUV" constants:0];
                            getRefTypeYUV = self->_getRefTypeYUV;
                            self->_getRefTypeYUV = v29;

                            if (self->_getRefTypeYUV)
                            {
                              v31 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::syncRefType" constants:0];
                              syncRefType = self->_syncRefType;
                              self->_syncRefType = v31;

                              if (self->_syncRefType)
                              {
                                v33 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::strongTemporalRepairYUV" constants:0];
                                strongTemporalRepairYUV = self->_strongTemporalRepairYUV;
                                self->_strongTemporalRepairYUV = v33;

                                if (self->_strongTemporalRepairYUV)
                                {
                                  v35 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"metalToolBox::collectClusterStats" constants:0];
                                  collectClusterStats = self->_collectClusterStats;
                                  self->_collectClusterStats = v35;

                                  if (self->_collectClusterStats) {
                                    return 0;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void)commitCmdBuffer:(id)a3 waitForComplete:(BOOL)a4
{
  int v4 = self->_forceGpuWaitForComplete || a4;
  sub_17E84(a3, v4);
}

- (void)setRepairTuningParams:(id *)a3 withDict:(id)a4
{
  objc_super v5 = [a4 objectForKeyedSubscript:@"Repair"];
  if (!v5) {
    goto LABEL_9;
  }
  id v20 = v5;
  id v6 = [v5 objectForKeyedSubscript:@"repairTargetArea"];
  objc_super v5 = v20;
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v7 = [v20 objectForKeyedSubscript:@"repairTargetGhostCntLo"];
  if (!v7) {
    goto LABEL_8;
  }
  v8 = (void *)v7;
  uint64_t v9 = [v20 objectForKeyedSubscript:@"repairTargetGhostCntHi"];
  if (!v9)
  {

LABEL_8:
    objc_super v5 = v20;
    goto LABEL_9;
  }
  v10 = (void *)v9;
  v11 = [v20 objectForKeyedSubscript:@"repairTargetGhostCntHi"];
  [v11 floatValue];
  float v13 = v12;

  objc_super v5 = v20;
  if (v13 <= 60.0)
  {
    v14 = [v20 objectForKeyedSubscript:@"repairTargetArea"];
    [v14 floatValue];
    a3->var0 = v15;

    v16 = [v20 objectForKeyedSubscript:@"repairTargetGhostCntHi"];
    [v16 floatValue];
    a3->var2 = v17;

    CFStringRef v18 = [v20 objectForKeyedSubscript:@"repairTargetGhostCntLo"];
    [v18 floatValue];
    a3->var1 = v19;

    objc_super v5 = v20;
    goto LABEL_10;
  }
LABEL_9:
  a3->var2 = 60.0;
  *(void *)&a3->var0 = 0x41F0000048000000;
LABEL_10:
}

- ($CECAC3A835FDE6A6E30A75FB7F50DCB5)updateMetaContainerBuffer:(GGMMetalToolBox *)self WithDetectedROI:isLowLight:
{
  char v4 = v3;
  objc_super v5 = v1;
  id v7 = v2;
  v8 = ($CECAC3A835FDE6A6E30A75FB7F50DCB5 *)[v5 contents];
  LOBYTE(v8->var19[2]) = v4;
  if ([v7 count])
  {
    unint64_t v9 = 0;
    float v10 = 0.0;
    do
    {
      v11 = [v7 objectAtIndexedSubscript:v9];
      [v11 roi];
      double v13 = v12;
      [v11 roi];
      float v10 = v10 + v13 * v14;

      ++v9;
    }
    while (v9 < (unint64_t)[v7 count]);
    v8->var24[1] = v10;
    float v15 = 1.0;
    if (v10 != 0.0) {
      float v15 = self->_tuningParams.repairTargetArea / v10;
    }
  }
  else
  {
    v8->var24[1] = 0.0;
    float v15 = 1.0;
  }
  float v16 = fminf(v15, 1.0);
  if (v16 < 0.0) {
    float v16 = 0.0;
  }
  v8->var24[0] = v16;
  float v17 = fminf(fmaxf((float)((float)(unint64_t)[v7 count] - self->_tuningParams.repairTargetGhostCntLo)/ (float)(self->_tuningParams.repairTargetGhostCntHi - self->_tuningParams.repairTargetGhostCntLo), 0.0), 1.0)* -0.9+ 1.0;
  if (v8->var24[0] < v17) {
    float v17 = v8->var24[0];
  }
  v8->var24[0] = v17;
  v8->var24[2] = 1.0 / v17;
  LOWORD(v19) = 0;
  if ([v7 count])
  {
    uint64_t v20 = 0;
    *(int32x2_t *)&long long v18 = vdup_n_s32(0x7F7FFFFFu);
    long long v49 = v18;
    float v21 = 1.1755e-38;
    float v22 = 1.1755e-38;
    while (1)
    {
      v23 = [v7 objectAtIndexedSubscript:v20];
      [v23 roi];
      double v25 = v24;
      [v23 roi];
      if (v25 * v26 * v8->var24[0] * v8->var24[0] >= 100.0)
      {
        [v23 roi];
        float64_t v47 = v27;
        [v23 roi];
        float64_t v45 = v28;
        [v23 roi];
        float64_t v46 = v29;
        [v23 roi];
        *(float64_t *)v30.i64 = v47;
        *(float64_t *)&v30.i64[1] = v45;
        float32x2_t v31 = vcvt_f32_f64((float64x2_t)v30);
        *(float64_t *)v30.i64 = v46;
        *(float64_t *)&v30.i64[1] = v32;
        float32x2_t v48 = vadd_f32(v31, vcvt_f32_f64((float64x2_t)v30));
        *(int32x2_t *)v30.i8 = vcvt_s32_f32(v31);
        v30.i64[1] = v30.i64[0];
        *(int32x2_t *)v33.i8 = vcvt_s32_f32(v48);
        v33.i64[1] = v33.i64[0];
        v34.i64[0] = vaddq_s32(v33, v30).u64[0];
        v34.i64[1] = vsubq_s32(v33, v30).i64[1];
        v35 = (char *)v8 + 32 * (__int16)v19;
        v33.i64[0] = 0x3F0000003F000000;
        v33.i64[1] = 0x3F0000003F000000;
        *((float32x2_t *)v35 + 5) = v31;
        *((float32x2_t *)v35 + 6) = v48;
        *(float32x4_t *)(v35 + 56) = vmulq_f32(vcvtq_f32_s32(v34), (float32x4_t)v33);
        v36 = &v8->var0 + 2 * (__int16)v19;
        *((_DWORD *)v36 + 1091) = [v23 trackID];
        [v23 confidence];
        *((_DWORD *)v36 + 910) = v37;
        *((void *)&v38 + 1) = *((void *)&v49 + 1);
        int8x8_t v39 = (int8x8_t)vcgt_f32(v31, *(float32x2_t *)&v49);
        if (v21 < v48.f32[0]) {
          float v21 = v48.f32[0];
        }
        *(int8x8_t *)&long long v38 = vbsl_s8(v39, *(int8x8_t *)&v49, (int8x8_t)v31);
        long long v49 = v38;
        if (v22 < v48.f32[1]) {
          float v22 = v48.f32[1];
        }
        [v23 ROIWOriginal];
        *((_DWORD *)v36 + 970) = v40;
        [v23 ROIWSpatial];
        *((_DWORD *)v36 + 490) = v41;
        [v23 ROIWStrongRepairInSpatial];
        *((_DWORD *)v36 + 790) = v42;
        *((_DWORD *)v36 + 850) = 0;
        *((_DWORD *)v36 + 550) = 0;
        *((void *)&v8[1].var3 + (__int16)v19) = 0;
        int v19 = (__int16)(v19 + 1);
        if (v19 >= 61) {
          break;
        }
      }

      if (++v20 >= (unint64_t)[v7 count]) {
        goto LABEL_22;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    *(int32x2_t *)&long long v49 = vdup_n_s32(0x7F7FFFFFu);
    float v22 = 1.1755e-38;
    float v21 = 1.1755e-38;
  }
LABEL_22:
  v8->var0 = v19;
  LODWORD(v8->var1) = v49;
  v8->var2 = v21;
  v8->var3 = *((float *)&v49 + 1);
  v8->var4 = v22;
  v8->var5 = (float)(v21 - *(float *)&v49);
  v8->var6 = (float)(v22 - *((float *)&v49 + 1));
  int32x2_t v43 = vmovn_s64(vcvtq_s64_f64(vmaxnmq_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)&v49), (float64x2_t)vdupq_n_s64(0xC050000000000000)), (float64x2_t)0)));
  *(void *)&v8->var7[0].var1 = *(void *)&vsra_n_u32((uint32x2_t)v43, (uint32x2_t)vcltz_s32(v43), 0x1EuLL) & 0xFFFFFFFCFFFFFFFCLL;

  return v8;
}

- (id)clusterTheGreenGhostRois:(id)a3 withExtendedRadius:(float)a4 imageRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = objc_alloc_init((Class)NSMutableArray);
  int v13 = [v10 count];
  if (v13 < 1)
  {
    id v22 = v11;
  }
  else
  {
    uint64_t v14 = 0;
    double v15 = (float)-a4;
    uint64_t v16 = v13;
    do
    {
      float v17 = [v10 objectAtIndexedSubscript:v14];
      long long v18 = objc_alloc_init(boundingBoxForMerge);
      [v17 roi];
      CGRect v45 = CGRectInset(v44, v15, v15);
      v47.origin.CGFloat x = x;
      v47.origin.CGFloat y = y;
      v47.size.CGFloat width = width;
      v47.size.CGFloat height = height;
      CGRect v46 = CGRectIntersection(v45, v47);
      -[boundingBoxForMerge setExtendBBox:](v18, "setExtendBBox:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
      [(boundingBoxForMerge *)v18 setIndex2RoiArray:v14];
      [v12 addObject:v18];

      ++v14;
    }
    while (v16 != v14);
    uint64_t v19 = 0;
    uint64_t v41 = v16;
    do
    {
      id v20 = objc_alloc_init((Class)NSMutableArray);
      float v21 = [v12 objectAtIndexedSubscript:v19];
      [v20 addObject:v21];

      id v22 = objc_alloc_init((Class)NSMutableArray);
      if ([v11 count])
      {
        unint64_t v23 = 0;
        do
        {
          double v24 = [v12 objectAtIndexedSubscript:v19];
          double v25 = [v11 objectAtIndexedSubscript:v23];
          BOOL v26 = sub_23A34(v24, v25);

          double v27 = [v11 objectAtIndexedSubscript:v23];
          if (v26) {
            [v20 addObjectsFromArray:v27];
          }
          else {
            [v22 addObject:v27];
          }

          ++v23;
        }
        while ((unint64_t)[v11 count] > v23);
      }
      [v22 addObject:v20];

      ++v19;
      id v11 = v22;
    }
    while (v19 != v41);
  }
  id v40 = objc_alloc_init((Class)NSMutableArray);
  if ([v22 count])
  {
    uint64_t v28 = 0;
    do
    {
      uint64_t v42 = v28;
      double v29 = [v22 objectAtIndexedSubscript:v28];
      id v30 = objc_alloc_init((Class)NSMutableArray);
      while ([v29 count])
      {
        float32x2_t v31 = [v29 objectAtIndexedSubscript:0];
        signed int v32 = [v31 index2RoiArray];
        if ((unint64_t)[v29 count] < 2)
        {
          int v33 = 0;
        }
        else
        {
          int v33 = 0;
          unint64_t v34 = 1;
          v35 = v31;
          do
          {
            float32x2_t v31 = [v29 objectAtIndexedSubscript:v34];

            signed int v36 = [v31 index2RoiArray];
            BOOL v37 = v32 <= v36;
            if (v32 >= v36) {
              signed int v32 = v36;
            }
            if (!v37) {
              int v33 = v34;
            }
            ++v34;
            v35 = v31;
          }
          while ((unint64_t)[v29 count] > v34);
        }
        long long v38 = [v10 objectAtIndexedSubscript:v32];
        [v30 addObject:v38];

        [v29 removeObjectAtIndex:v33];
      }
      [v40 addObject:v30];

      uint64_t v28 = v42 + 1;
    }
    while ((unint64_t)[v22 count] > v42 + 1);
  }

  return v40;
}

- (id)clusterIndicesOfRois:(id *)a3 withExtendedRadius:(float)a4 roiCnt:(signed __int16)a5 imageRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  int v10 = a5;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = objc_alloc_init((Class)NSMutableArray);
  if (v10 < 1)
  {
    id v30 = v13;
  }
  else
  {
    uint64_t v15 = 0;
    p_var2 = &a3->var2;
    uint64_t v17 = v10;
    CGFloat v47 = x;
    do
    {
      float v18 = *(p_var2 - 2);
      float v19 = *(p_var2 - 1);
      CGFloat v20 = height;
      CGFloat v21 = width;
      float v22 = *p_var2;
      float v23 = p_var2[1];
      p_var2 += 8;
      double v24 = objc_alloc_init(boundingBoxForMerge);
      v50.origin.CGFloat x = (float)(v18 - a4);
      v50.origin.CGFloat y = (float)(v19 - a4);
      float v25 = v22 - v18;
      CGFloat height = v20;
      v50.size.CGFloat width = (float)(v25 + (float)(a4 * 2.0));
      float v26 = v23 - v19;
      CGFloat width = v21;
      v50.size.CGFloat height = (float)(v26 + (float)(a4 * 2.0));
      v52.origin.CGFloat x = v47;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = v21;
      v52.size.CGFloat height = v20;
      CGRect v51 = CGRectIntersection(v50, v52);
      -[boundingBoxForMerge setExtendBBox:](v24, "setExtendBBox:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
      [(boundingBoxForMerge *)v24 setIndex2RoiArray:v15];
      [v14 addObject:v24];

      ++v15;
    }
    while (v17 != v15);
    for (uint64_t i = 0; i != v17; ++i)
    {
      id v28 = objc_alloc_init((Class)NSMutableArray);
      double v29 = [v14 objectAtIndexedSubscript:i];
      [v28 addObject:v29];

      id v30 = objc_alloc_init((Class)NSMutableArray);
      if ([v13 count])
      {
        unint64_t v31 = 0;
        do
        {
          signed int v32 = [v14 objectAtIndexedSubscript:i];
          int v33 = [v13 objectAtIndexedSubscript:v31];
          BOOL v34 = sub_23A34(v32, v33);

          v35 = [v13 objectAtIndexedSubscript:v31];
          if (v34) {
            [v28 addObjectsFromArray:v35];
          }
          else {
            [v30 addObject:v35];
          }

          ++v31;
        }
        while ((unint64_t)[v13 count] > v31);
      }
      [v30 addObject:v28];

      id v13 = v30;
    }
  }
  id v48 = objc_alloc_init((Class)NSMutableArray);
  if ([v30 count])
  {
    unint64_t v36 = 0;
    CGRect v46 = v30;
    do
    {
      BOOL v37 = objc_msgSend(v30, "objectAtIndexedSubscript:", v36, v46);
      id v38 = objc_alloc_init((Class)NSMutableArray);
      id v39 = [v37 count];
      if ([v37 count])
      {
        uint64_t v40 = ((void)v39 << 32) - 0x100000000;
        uint64_t v41 = 1;
        do
        {
          uint64_t v42 = [v37 objectAtIndexedSubscript:v40 >> 32];
          int32x2_t v43 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v42 index2RoiArray]);
          [v38 addObject:v43];

          v40 -= 0x100000000;
        }
        while ((unint64_t)[v37 count] > v41++);
      }
      [v48 addObject:v38];

      ++v36;
      id v30 = v46;
    }
    while ((unint64_t)[v46 count] > v36);
  }

  return v48;
}

- ($188FA2BE40FEEB95138B376117A44A7D)generateMetaContainerArrayBufFromMetaContainerBuf:(id)a3 imageRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  int v10 = v9;
  p_metaBufArradouble y = &self->_metaBufArray;
  int32x2_t v43 = self;
  self->_metaBufArray.clusterCnt = 0;
  if (v9 && (id v11 = (__int16 *)[v9 contents]) != 0)
  {
    id v13 = v11;
    LODWORD(v12) = 1120403456;
    CGRect v44 = -[GGMMetalToolBox clusterIndicesOfRois:withExtendedRadius:roiCnt:imageRect:](self, "clusterIndicesOfRois:withExtendedRadius:roiCnt:imageRect:", v11 + 20, *v11, v12, x, y, width, height);
    int v14 = [v44 count];
    if (v14 >= 1)
    {
      uint64_t v40 = v10;
      uint64_t v15 = 0;
      if (v14 >= 60) {
        uint64_t v16 = 60;
      }
      else {
        uint64_t v16 = v14;
      }
      uint64_t v42 = v16;
      int32x2_t v17 = vdup_n_s32(0x7F7FFFFFu);
      float64x2_t v41 = (float64x2_t)vdupq_n_s64(0xC050000000000000);
      do
      {
        float v18 = [v44 objectAtIndexedSubscript:v15];
        uint64_t v46 = v15;
        float v19 = [(MTLBuffer *)p_metaBufArray->bufArray[v15] contents];
        bzero(v19, 0x2548uLL);
        *((unsigned char *)v19 + 4360) = *((unsigned char *)v13 + 4360);
        _WORD *v19 = (unsigned __int16)[v18 count];
        if ([v18 count])
        {
          uint64_t v20 = 0;
          unint64_t v21 = 0;
          float32x2_t v22 = (float32x2_t)0x80000000800000;
          uint64_t v23 = 2968;
          uint64_t v24 = 20;
          uint64_t v25 = 2302;
          float32x2_t v26 = (float32x2_t)v17;
          do
          {
            double v27 = [v18 objectAtIndex:v21];
            signed __int16 v28 = (unsigned __int16)[v27 intValue];

            double v29 = &v13[16 * v28];
            id v30 = &v19[v24];
            long long v31 = *(_OWORD *)(v29 + 28);
            *id v30 = *(_OWORD *)(v29 + 20);
            v30[1] = v31;
            signed int v32 = &v13[2 * v28];
            int v33 = &v19[v20];
            v33[1091] = *((_DWORD *)v32 + 1091);
            v33[910] = *((_DWORD *)v32 + 910);
            float32x2_t v34 = *(float32x2_t *)&v19[v24];
            float32x2_t v35 = *(float32x2_t *)&v19[2 * v20 + 24];
            v33[490] = *((_DWORD *)v32 + 490);
            float32x2_t v26 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v26), (int8x8_t)v26, (int8x8_t)v34);
            v33[970] = *((_DWORD *)v32 + 970);
            v33[790] = *((_DWORD *)v32 + 790);
            float32x2_t v22 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v35, v22), (int8x8_t)v35, (int8x8_t)v22);
            *(void *)&v19[v23] = *(void *)&v13[4 * v28 + 2968];
            v33[1664] = *((_DWORD *)v32 + 1664);
            v33[1724] = *((_DWORD *)v32 + 1724);
            v34.i32[0] = *((_DWORD *)v32 + 2084);
            v33[2204] = *((_DWORD *)v32 + 2204);
            LODWORD(v30) = *((_DWORD *)v32 + 2264);
            v33[2084] = v34.i32[0];
            v33[2264] = v30;
            LODWORD(v32) = *((_DWORD *)v32 + 2324);
            v19[v25] = v28;
            ++v21;
            v33[2324] = v32;
            ++v25;
            v24 += 16;
            v20 += 2;
            v23 += 4;
          }
          while ((unint64_t)[v18 count] > v21);
        }
        else
        {
          float32x2_t v22 = (float32x2_t)0x80000000800000;
          float32x2_t v26 = (float32x2_t)v17;
        }
        unint64_t v36 = (float *)(v19 + 2);
        float32x2_t v37 = v22;
        vst2_f32(v36, *(float32x2x2_t *)v26.f32);
        *(uint32x2_t *)(v19 + 10) = vcvt_u32_f32(vsub_f32(v22, v26));
        int32x2_t v38 = vmovn_s64(vcvtq_s64_f64(vmaxnmq_f64(vaddq_f64(vcvtq_f64_f32(v26), v41), (float64x2_t)0)));
        *((void *)v19 + 4) = *(void *)&vsra_n_u32((uint32x2_t)v38, (uint32x2_t)vcltz_s32(v38), 0x1EuLL) & 0xFFFFFFFCFFFFFFFCLL;
        *((_DWORD *)v19 + 1181) = *((_DWORD *)v13 + 1181);
        *((_DWORD *)v19 + 1183) = *((_DWORD *)v13 + 1183);
        ++v43->_metaBufArray.clusterCnt;

        uint64_t v15 = v46 + 1;
      }
      while (v46 + 1 != v42);
      int v10 = v40;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return ($188FA2BE40FEEB95138B376117A44A7D *)p_metaBufArray;
}

- (void)encodeBackWarpYUVToCommandBuffer:(__n128)a3 reference:(__n128)a4 toOutput:(uint64_t)a5 withHomography:(void *)a6
{
  v20[0] = a2;
  v20[1] = a3;
  v20[2] = a4;
  id v11 = a8;
  id v12 = a7;
  id v13 = [a6 computeCommandEncoder];
  [v13 setComputePipelineState:*(void *)(a1 + 24)];
  [v13 setTexture:v12 atIndex:0];
  [v13 setTexture:v11 atIndex:1];

  [v13 setBytes:v20 length:48 atIndex:0];
  objc_msgSend(v13, "setImageblockWidth:height:", objc_msgSend(*(id *)(a1 + 24), "threadExecutionWidth"), objc_msgSend(*(id *)(a1 + 24), "threadExecutionWidth"));
  unint64_t v14 = (unint64_t)[*(id *)(a1 + 24) threadExecutionWidth];
  unint64_t v15 = (unint64_t)[*(id *)(a1 + 24) maxTotalThreadsPerThreadgroup] / v14;
  id v16 = [v12 width];
  id v17 = [v12 height];

  v19[0] = v16;
  v19[1] = v17;
  v19[2] = 1;
  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 1;
  [v13 dispatchThreads:v19 threadsPerThreadgroup:v18];
  [v13 endEncoding];
}

- (void)backWarpYUV:(double)a3 warped:(double)a4 withHomography:(uint64_t)a5 waitForComplete:(__CVBuffer *)a6
{
  id v17 = [a1[2] commandBuffer];
  if (v17)
  {
    id v12 = sub_10550(a6, a1[85], 0, 0);
    id v13 = sub_10550(a7, a1[85], 0, 0);
    objc_msgSend(a1, "encodeBackWarpYUVToCommandBuffer:reference:toOutput:withHomography:", v17, v12, v13, a2, a3, a4);
    [a1 commitCmdBuffer:v17 waitForComplete:a8];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)encodeComputeIntegralBinImageToCommandBuffer:(id)a3 inputBuf:(id)a4 toIntegral:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 computeCommandEncoder];
  [v11 setComputePipelineState:self->_integralBinImageRow];
  [v11 setTexture:v9 atIndex:0];

  [v11 setTexture:v8 atIndex:1];
  unint64_t v12 = (unint64_t)[(MTLComputePipelineState *)self->_integralBinImageRow threadExecutionWidth];
  unint64_t v18 = ((unint64_t)[v8 height] + v12 - 1) / v12;
  int64x2_t v15 = vdupq_n_s64(1uLL);
  int64x2_t v19 = v15;
  unint64_t v16 = v12;
  int64x2_t v17 = v15;
  [v11 dispatchThreadgroups:&v18 threadsPerThreadgroup:&v16];
  [v11 endEncoding];
  id v13 = [v10 computeCommandEncoder];

  [v13 setComputePipelineState:self->_integralBinImageCol];
  [v13 setTexture:v8 atIndex:0];
  id v14 = [v8 width];

  unint64_t v18 = ((unint64_t)v14 + v12 - 1) / v12;
  int64x2_t v19 = v15;
  unint64_t v16 = v12;
  int64x2_t v17 = v15;
  [v13 dispatchThreadgroups:&v18 threadsPerThreadgroup:&v16];
  [v13 endEncoding];
}

- (void)computeIntegralBinImageFromInput:(__CVBuffer *)a3 toIntegral:(__CVBuffer *)a4 waitForComplete:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  if (v14)
  {
    id v9 = sub_FE84(a3, self->_metalContext, 0, 0);
    if (!self->_integralTexture
      || (id Width = (id)CVPixelBufferGetWidth(a4), Width != [(MTLTexture *)self->_integralTexture width])
      || (id Height = (id)CVPixelBufferGetHeight(a4), Height != [(MTLTexture *)self->_integralTexture height]))
    {
      sub_FE7C(a4, self->_metalContext, 0);
      unint64_t v12 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      integralTexture = self->_integralTexture;
      self->_integralTexture = v12;
    }
    [(GGMMetalToolBox *)self encodeComputeIntegralBinImageToCommandBuffer:v14 inputBuf:v9 toIntegral:self->_integralTexture];
    [(GGMMetalToolBox *)self commitCmdBuffer:v14 waitForComplete:v5];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)encodeComputeBlendingWeightsSpatialOnlyForRepairYUV:(id)a3 input:(id)a4 metadataBuf:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (char *)[v8 contents];
  unint64_t v12 = [v10 computeCommandEncoder];

  [v12 setComputePipelineState:self->_computeBlendingWeightsSpatialOnlyYUV];
  [v12 setTexture:v9 atIndex:0];

  [v12 setBuffer:v8 offset:0 atIndex:0];
  [v12 setImageblockWidth:32 height:32];
  uint32x2_t v13 = vshr_n_u32(vsra_n_u32((uint32x2_t)0x1F0000001FLL, (uint32x2_t)vadd_s32(*(int32x2_t *)(v11 + 20), (int32x2_t)0x4400000044), 2uLL), 5uLL);
  *(void *)&long long v14 = v13.u32[0];
  *((void *)&v14 + 1) = v13.u32[1];
  long long v17 = v14;
  uint64_t v18 = 1;
  int64x2_t v15 = vdupq_n_s64(0x20uLL);
  uint64_t v16 = 1;
  [v12 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
  [v12 endEncoding];
}

- (void)computeBlendingWeightsSpatialOnlyYUVInput:(id)a3 metadataBuf:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  if (v7)
  {
    [(GGMMetalToolBox *)self encodeComputeBlendingWeightsSpatialOnlyForRepairYUV:v7 input:v15 metadataBuf:v6];
    [(GGMMetalToolBox *)self commitCmdBuffer:v7 waitForComplete:1];
    id v8 = (unsigned __int16 *)[v6 contents];
    if ((__int16)*v8 >= 1)
    {
      uint64_t v9 = *v8;
      id v10 = (float *)(v8 + 26);
      do
      {
        *((_DWORD *)v8 + 490) = 1065353216;
        *((_DWORD *)v8 + 1184) = 1065353216;
        float v11 = *(v10 - 2);
        float v12 = *(v10 - 1) - *(v10 - 3);
        float v13 = *v10;
        v10 += 8;
        float v14 = (fminf(fmaxf((float)((float)(v12 * (float)(v13 - v11)) + -900.0) / 2700.0, 0.0), 1.0) * -0.9 + 1.0) * 0.03;
        *((float *)v8 + 790) = 1.0 - fminf(fmaxf((float)((float)*((int *)v8 + 850) / 1023.0) / v14, 0.0), 1.0);
        *((_DWORD *)v8 + 970) = 0;
        v8 += 2;
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)encodeComputeBlendingWeightsForRepairYUV:(id)a3 input:(id)a4 temporalRepaired:(id)a5 metadataBuf:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  float v14 = (char *)[v10 contents];
  [v13 setComputePipelineState:self->_computeBlendingWeightsYUV];
  [v13 setTexture:v12 atIndex:0];

  [v13 setTexture:v11 atIndex:1];
  [v13 setBuffer:v10 offset:0 atIndex:0];

  int32x2_t v15 = vcvt_s32_f32(vrndp_f32(vmul_n_f32(vcvt_f32_u32((uint32x2_t)vadd_s32(*(int32x2_t *)(v14 + 20), (int32x2_t)0x8400000084)), *((float *)v14 + 1181))));
  int32x2_t v16 = vsra_n_s32((int32x2_t)0xF0000000FLL, (int32x2_t)vsra_n_u32((uint32x2_t)v15, (uint32x2_t)vcltz_s32(v15), 0x1EuLL), 2uLL);
  v17.i64[0] = v16.i32[0];
  v17.i64[1] = v16.i32[1];
  uint64x2_t v20 = vshrq_n_u64(v17, 4uLL);
  uint64_t v21 = 1;
  int64x2_t v18 = vdupq_n_s64(0x10uLL);
  uint64_t v19 = 1;
  [v13 dispatchThreadgroups:&v20 threadsPerThreadgroup:&v18];
}

- (void)computeBlendingWeightsYUVInput:(id)a3 temporalRepaired:(id)a4 metadataBuf:(id)a5 commandEncoder:(id)a6
{
}

- (void)encodeYCbCrToRGBToCommandBuffer:(id)a3 inputTexture:(id)a4 outTexture:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_YCbCrToRGB];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  unint64_t v11 = (unint64_t)[(MTLComputePipelineState *)self->_YCbCrToRGB threadExecutionWidth];
  unint64_t v12 = (unint64_t)[(MTLComputePipelineState *)self->_YCbCrToRGB maxTotalThreadsPerThreadgroup]/ v11;
  id v13 = [v9 width];
  id v14 = [v9 height];

  v16[0] = v13;
  v16[1] = v14;
  v16[2] = 1;
  v15[0] = v11;
  v15[1] = v12;
  v15[2] = 1;
  [v10 dispatchThreads:v16 threadsPerThreadgroup:v15];
  [v10 endEncoding];
}

- (void)YCbCrToRGB:(__CVBuffer *)a3 outputImage:(__CVBuffer *)a4 waitForComplete:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  if (v11)
  {
    id v9 = sub_10550(a3, self->_metalContext, 0, 1);
    id v10 = sub_FE7C(a4, self->_metalContext, 0);
    [(GGMMetalToolBox *)self encodeYCbCrToRGBToCommandBuffer:v11 inputTexture:v9 outTexture:v10];
    [(GGMMetalToolBox *)self commitCmdBuffer:v11 waitForComplete:v5];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)encodeComputeDiffForLocalMotionYUVToCommandBuffer:(id)a3 input0Texture:(id)a4 input1Texture:(id)a5 outputTexture:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 computeCommandEncoder];
  [v13 setComputePipelineState:self->_computeDiffForLocalMotionYUV];
  [v13 setTexture:v12 atIndex:0];
  [v13 setTexture:v11 atIndex:1];

  [v13 setTexture:v10 atIndex:2];
  unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)self->_computeDiffForLocalMotionYUV threadExecutionWidth];
  unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)self->_computeDiffForLocalMotionYUV maxTotalThreadsPerThreadgroup]/ v14;
  id v16 = [v12 width];
  id v17 = [v12 height];

  v19[0] = v16;
  v19[1] = v17;
  v19[2] = 1;
  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 1;
  [v13 dispatchThreads:v19 threadsPerThreadgroup:v18];
  [v13 endEncoding];
}

- (void)computeDiffForLocalMotion:(__CVBuffer *)a3 andYUVImage:(__CVBuffer *)a4 outputImage:(__CVBuffer *)a5 waitForComplete:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  if (v14)
  {
    id v11 = sub_FE7C(a3, self->_metalContext, 0);
    id v12 = sub_FE7C(a4, self->_metalContext, 0);
    id v13 = sub_FE7C(a5, self->_metalContext, 0);
    [(GGMMetalToolBox *)self encodeComputeDiffForLocalMotionYUVToCommandBuffer:v14 input0Texture:v11 input1Texture:v12 outputTexture:v13];
    [(GGMMetalToolBox *)self commitCmdBuffer:v14 waitForComplete:v6];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (id)findGhostCandidatesFromDesGenAndTinyKeypointsFromInputTexture:(double)a3 ref4LocalMotionTexture:(double)a4 inputTPlus1Texture:(int32x2_t)a5 LSList:(double)a6 desGenKeypoints:(uint64_t)a7 homography:(void *)a8 colorParams:(void *)a9 computeLocalMotion:(void *)a10 LSDilation:(void *)a11 LSReflectCenter:(uint64_t)a12 maxLightSourceCount:(unsigned int *)a13 maxDesGenKeypoints:(BOOL)a14 maxTinyKeypoints:(unsigned int)a15 metalBuffers:(int)a16 isPrevLSFeaturesAvailable:(int)a17
{
  id v80 = a8;
  id v79 = a9;
  id v84 = a10;
  id v25 = a11;
  *a19 = 0;
  float32x2_t v26 = [a1[2] commandBuffer];
  double v27 = v26;
  if (v26)
  {
    v78 = v26;
    v73 = [v26 computeCommandEncoderWithDispatchType:1];
    id v28 = a1[1];
    IOSurface = (__IOSurface *)CVDataBufferGetIOSurface();
    IOSurfaceLock(IOSurface, 1u, 0);
    unsigned int v30 = *((_DWORD *)IOSurfaceGetBaseAddress(IOSurface) + 5);
    IOSurfaceUnlock(IOSurface, 1u, 0);
    v74 = v28;
    id v77 = [v28 newBufferWithIOSurface:IOSurface];
    if (v30 >= a16) {
      int v31 = a16;
    }
    else {
      int v31 = v30;
    }
    unsigned int v72 = v31;
    unsigned int v32 = [v25 count];
    id v76 = a18->var1;
    id v33 = a18->var0;
    if (v32 >= a15) {
      uint64_t v34 = a15;
    }
    else {
      uint64_t v34 = v32;
    }
    id v75 = v33;
    float32x2_t v35 = (int32x4_t *)[v75 contents];
    if (v34)
    {
      unint64_t v36 = v35;
      uint64_t v37 = 0;
      float32x2_t v38 = (float32x2_t)vdup_lane_s32(a5, 0);
      do
      {
        id v39 = [v25 objectAtIndex:v37];
        [v39 reflectAroundCenter:a6];
        [v39 bbox];
        float32x2_t v87 = vsub_f32(v40, v38);
        [v39 bbox];
        float32x2_t v86 = v41;
        [v39 bbox];
        *(float32x2_t *)v43.f32 = v87;
        *(float32x2_t *)&v43.u32[2] = vadd_f32(v38, vadd_f32(v86, (float32x2_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL)));
        v36[v37] = vcvtq_s32_f32(v43);
        [v39 reflectAroundCenter:a6];

        ++v37;
      }
      while (v34 != v37);
    }
    unsigned int v44 = *a13;
    unsigned int v45 = a13[1];
    unsigned int v46 = a13[2];
    unsigned int v47 = a13[3];
    unsigned int v48 = a13[4];
    unsigned int v49 = a13[5];
    unsigned int v50 = a13[6];
    unsigned int v51 = a13[7];
    *(_DWORD *)[a18->var4 contents] = 0;
    *(_DWORD *)[a18->var2 contents] = 0;
    uint64_t v52 = *(unsigned int *)[a18->var12 contents];
    uint64_t v53 = *(unsigned int *)[a18->var13 contents];
    unsigned int v54 = *(_DWORD *)[a18->var7 contents];
    if (v52)
    {
      [a1 addComputeBoxDoGToCommandEncoder:v73 inputTexture:v80 inputlocationsBuf:a18->var8 DoGAndLumaBuf:a18->var10 inputLocationsSize:v52];
      [a1 addComputeBoxFeatureVectorToCommandEncoder:v73 inputTexture:v80 inputlocationsBuf:a18->var8 DoGAndLumaBuf:a18->var10 inputLocationsSize:v52];
    }
    if (v84 && v53)
    {
      [a1 addComputeBoxDoGToCommandEncoder:v73 inputTexture:v84 inputlocationsBuf:a18->var9 DoGAndLumaBuf:a18->var11 inputLocationsSize:v53];
      [a1 addComputeBoxFeatureVectorToCommandEncoder:v73 inputTexture:v84 inputlocationsBuf:a18->var9 DoGAndLumaBuf:a18->var11 inputLocationsSize:v53];
      *a19 = 1;
    }
    double v55 = a3;
    double v56 = a4;
    double v57 = a2;
    if (v54)
    {
      id var4 = a18->var4;
      id var5 = a18->var5;
      id var6 = a18->var6;
      *(void *)&long long v99 = __PAIR64__(v45, v44);
      *((void *)&v99 + 1) = __PAIR64__(v47, v46);
      *(void *)&long long v100 = __PAIR64__(v49, v48);
      *((void *)&v100 + 1) = __PAIR64__(v51, v50);
      objc_msgSend(a1, "addFindTinyKPsToCommandEncoder:inputTexture:referenceTexture:inputlocationsBuf:ggIdxBuf:tinyGhostBoxes:colorParams:homography:reflectedLsBboxList:lsCnt:inputLocationsSize:", v73, v80, v79, var5, var4, var6, a2, a3, a4, &v99, v75, __PAIR64__(v54, v34));
      double v57 = a2;
      double v55 = a3;
      double v56 = a4;
    }
    id var2 = a18->var2;
    id var3 = a18->var3;
    *(void *)&long long v99 = __PAIR64__(v45, v44);
    *((void *)&v99 + 1) = __PAIR64__(v47, v46);
    *(void *)&long long v100 = __PAIR64__(v49, v48);
    *((void *)&v100 + 1) = __PAIR64__(v51, v50);
    LODWORD(v71) = v34;
    objc_msgSend(a1, "addFindDesGenGhostsToCommandEncoder:inputTexture:refTexture:homography:colorParams:kpCnt:kpIdx:reflectedLsBboxList:lsCnt:desGenKeypoints:desGenMappingInfo:ghostBoxes:", v73, v80, v79, &v99, v72, var2, v57, v55, v56, v75, v71, v77, v76, var3);
    [v73 endEncoding];
    [a1 commitCmdBuffer:v78 waitForComplete:1];
    v63 = (long long *)[a18->var6 contents];
    uint64_t v64 = *(unsigned int *)[a18->var4 contents];
    v65 = (long long *)[a18->var3 contents];
    uint64_t v66 = *(unsigned int *)[a18->var2 contents];
    v67 = +[NSMutableArray array];
    if ((int)v64 <= a17 && (int)v64 >= 1)
    {
      do
      {
        long long v106 = v63[7];
        long long v107 = v63[8];
        long long v108 = v63[9];
        long long v109 = v63[10];
        long long v102 = v63[3];
        long long v103 = v63[4];
        long long v104 = v63[5];
        long long v105 = v63[6];
        long long v99 = *v63;
        long long v100 = v63[1];
        long long v101 = v63[2];
        long long v96 = v107;
        long long v97 = v108;
        long long v98 = v109;
        long long v92 = v103;
        long long v93 = v104;
        long long v94 = v105;
        long long v95 = v106;
        long long v88 = v99;
        long long v89 = v100;
        long long v90 = v101;
        long long v91 = v102;
        v68 = [a1 createGhostRoiFromGhostBox:&v88 computeLocalMotion:a14];
        [v68 setKpIsFromHW:0];
        [v67 addObject:v68];

        v63 += 11;
        --v64;
      }
      while (v64);
    }
    if ((int)v66 <= a16 && (int)v66 >= 1)
    {
      do
      {
        long long v106 = v65[7];
        long long v107 = v65[8];
        long long v108 = v65[9];
        long long v109 = v65[10];
        long long v102 = v65[3];
        long long v103 = v65[4];
        long long v104 = v65[5];
        long long v105 = v65[6];
        long long v99 = *v65;
        long long v100 = v65[1];
        long long v101 = v65[2];
        long long v96 = v107;
        long long v97 = v108;
        long long v98 = v109;
        long long v92 = v103;
        long long v93 = v104;
        long long v94 = v105;
        long long v95 = v106;
        long long v88 = v99;
        long long v89 = v100;
        long long v90 = v101;
        long long v91 = v102;
        v69 = [a1 createGhostRoiFromGhostBox:&v88 computeLocalMotion:a14];
        [v69 setKpIsFromHW:1];
        [v67 addObject:v69];

        v65 += 11;
        --v66;
      }
      while (v66);
    }

    double v27 = v78;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v67 = 0;
  }

  return v67;
}

- (id)createGhostRoiFromGhostBox:(id *)a3 computeLocalMotion:(BOOL)a4
{
  BOOL v5 = a4;
  float32x2_t v7 = *(float32x2_t *)&a3->var1;
  v4.i32[0] = LODWORD(a3[1].var0.var0[4]);
  __asm { FMOV            V2.2S, #-5.0 }
  double v12 = COERCE_DOUBLE(vadd_f32(vsub_f32(v7, (float32x2_t)vdup_lane_s32(v4, 0)), _D2));
  id v13 = [[ROI alloc] initWithBbox:v12];
  id v14 = v13;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  if (v13)
  {
    [(ROI *)v13 descriptor];
  }
  else
  {
    long long v46 = 0uLL;
    long long v47 = 0uLL;
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    long long v39 = 0uLL;
  }
  *(float32x2_t *)&long long v38 = v7;
  DWORD2(v38) = LODWORD(a3[1].var0.var0[5]);
  long long v15 = *(_OWORD *)&a3->var3;
  long long v40 = v15;
  float v16 = 1.0;
  float v17 = 1.0;
  if (v5) {
    float v17 = a3[1].var0.var0[3];
  }
  uint64_t v18 = 0;
  float v19 = a3[1].var0.var0[2];
  *(float *)&long long v41 = v17;
  *((float *)&v38 + 3) = v19;
  if (v17 < 0.05 || *(float *)&v15 < 0.4 || v19 < 0.4) {
    float v16 = 0.0;
  }
  *((float *)&v41 + 1) = v16;
  long long v22 = 0uLL;
  long long v23 = 0uLL;
  long long v24 = 0uLL;
  long long v25 = 0uLL;
  do
  {
    float v26 = a3->var0.var0[v18];
    long long v32 = v22;
    long long v33 = v23;
    long long v34 = v24;
    long long v35 = v25;
    *((_WORD *)&v32 + (v18 & 0x1F)) = (int)v26;
    long long v24 = v34;
    long long v25 = v35;
    long long v22 = v32;
    long long v23 = v33;
    ++v18;
  }
  while (v18 != 32);
  v36[0] = v32;
  v36[1] = v33;
  v36[2] = v34;
  v36[3] = v35;
  long long v30 = v33;
  long long v31 = v32;
  long long v28 = v35;
  long long v29 = v34;
  [(ROI *)v14 setLumaFeatureVector:v36];
  long long v44 = v29;
  long long v45 = v28;
  long long v42 = v31;
  long long v43 = v30;
  LODWORD(v46) = 32;
  [(ROI *)v14 setDifferenceOfGaussianAndLumaFeature:*(double *)&a3->var0.var1];
  v37[6] = v44;
  v37[7] = v45;
  v37[8] = v46;
  v37[9] = v47;
  v37[2] = v40;
  v37[3] = v41;
  v37[4] = v42;
  v37[5] = v43;
  v37[0] = v38;
  v37[1] = v39;
  [(ROI *)v14 setDescriptor:v37];

  return v14;
}

- (void)addFindDesGenGhostsToCommandEncoder:(__n128)a3 inputTexture:(__n128)a4 refTexture:(uint64_t)a5 homography:(void *)a6 colorParams:(void *)a7 kpCnt:(void *)a8 kpIdx:(uint64_t)a9 reflectedLsBboxList:(unsigned int)a10 lsCnt:(void *)a11 desGenKeypoints:(id)a12 desGenMappingInfo:(uint64_t)a13 ghostBoxes:(id)a14
{
  id v22 = a14;
  id v21 = a15;
  v37[0] = a2;
  v37[1] = a3;
  v37[2] = a4;
  unsigned int v36 = a10;
  uint64_t v23 = *(void *)(a1 + 56);
  id v31 = a16;
  id v24 = v21;
  id v25 = v22;
  id v26 = a12;
  id v27 = a11;
  id v28 = a8;
  id v29 = a7;
  id v30 = a6;
  [v30 setComputePipelineState:v23];
  [v30 setTexture:v29 atIndex:0];

  [v30 setTexture:v28 atIndex:1];
  [v30 setBytes:a9 length:32 atIndex:0];
  [v30 setBytes:v37 length:48 atIndex:1];
  [v30 setBytes:&v36 length:4 atIndex:2];
  [v30 setBuffer:v27 offset:0 atIndex:3];

  [v30 setBuffer:v26 offset:0 atIndex:4];
  [v30 setBytes:&a13 length:4 atIndex:5];
  [v30 setBuffer:v25 offset:0 atIndex:6];

  [v30 setBuffer:v24 offset:0 atIndex:7];
  [v30 setBuffer:v31 offset:0 atIndex:8];

  unint64_t v34 = ((unint64_t)v36 + 31) >> 5;
  int64x2_t v35 = vdupq_n_s64(1uLL);
  uint64_t v32 = 32;
  long long v33 = xmmword_2E2D0;
  [v30 dispatchThreadgroups:&v34 threadsPerThreadgroup:&v32];
}

- (void)addFindTinyKPsToCommandEncoder:(__n128)a3 inputTexture:(__n128)a4 referenceTexture:(uint64_t)a5 inputlocationsBuf:(void *)a6 ggIdxBuf:(void *)a7 tinyGhostBoxes:(void *)a8 colorParams:(void *)a9 homography:(void *)a10 reflectedLsBboxList:(void *)a11 lsCnt:(id *)a12 inputLocationsSize:(id)a13
{
  v32[0] = a2;
  v32[1] = a3;
  v32[2] = a4;
  uint64_t v20 = *(void *)(a1 + 48);
  id v21 = a13;
  id v22 = a11;
  id v23 = a10;
  id v24 = a9;
  id v25 = a8;
  id v26 = a7;
  id v27 = a6;
  [v27 setComputePipelineState:v20];
  [v27 setTexture:v26 atIndex:0];

  [v27 setTexture:v25 atIndex:1];
  [v27 setBuffer:v24 offset:0 atIndex:0];

  [v27 setBytes:(char *)&a14 + 4 length:4 atIndex:1];
  [v27 setBuffer:v23 offset:0 atIndex:2];

  [v27 setBuffer:v22 offset:0 atIndex:3];
  [v27 setBytes:a12 length:32 atIndex:4];
  [v27 setBytes:v32 length:48 atIndex:5];
  [v27 setBuffer:v21 offset:0 atIndex:6];

  [v27 setBytes:&a14 length:4 atIndex:7];
  unint64_t v30 = ((unint64_t)HIDWORD(a14) + 31) >> 5;
  int64x2_t v31 = vdupq_n_s64(1uLL);
  uint64_t v28 = 32;
  long long v29 = xmmword_2E2D0;
  [v27 dispatchThreadgroups:&v30 threadsPerThreadgroup:&v28];
}

- (void)encodeGetGhostMaxLumaYUV:(id)a3 input:(id)a4 metaBuf:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (char *)[v8 contents];
  [v10 setComputePipelineState:self->_getGhostMaxLumaYUV];
  [v10 setTexture:v9 atIndex:0];

  [v10 setBuffer:v8 offset:0 atIndex:0];
  int32x2_t v12 = vadd_s32(*(int32x2_t *)(v11 + 20), (int32x2_t)0x8400000084);
  int32x2_t v13 = vsra_n_s32((int32x2_t)0x1F0000001FLL, (int32x2_t)vsra_n_u32((uint32x2_t)v12, (uint32x2_t)vcltz_s32(v12), 0x1EuLL), 2uLL);
  v14.i64[0] = v13.i32[0];
  v14.i64[1] = v13.i32[1];
  uint64x2_t v17 = vshrq_n_u64(v14, 5uLL);
  uint64_t v18 = 1;
  int64x2_t v15 = vdupq_n_s64(0x20uLL);
  uint64_t v16 = 1;
  [v10 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
}

- (void)encodeSyncMaxLuma:(id)a3 metaBuf:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (unsigned __int16 *)[v7 contents];
  if (*v8 - 61 >= 0xFFFFFFC4)
  {
    id v9 = (__int16 *)v8;
    [v6 setComputePipelineState:self->_syncMaxLuma];
    [v6 setBuffer:v7 offset:0 atIndex:0];
    unint64_t v12 = (unint64_t)(*v9 + 31) >> 5;
    int64x2_t v13 = vdupq_n_s64(1uLL);
    uint64_t v10 = 32;
    long long v11 = xmmword_2E2D0;
    [v6 dispatchThreadgroups:&v12 threadsPerThreadgroup:&v10];
  }
}

- (void)getGhostMaxLumaYUVInput:(id)a3 metaBuf:(id)a4 commandEncoder:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(GGMMetalToolBox *)self encodeGetGhostMaxLumaYUV:v8 input:a3 metaBuf:v9];
  [(GGMMetalToolBox *)self encodeSyncMaxLuma:v8 metaBuf:v9];
}

- (void)encodeGetRefTypeYUV:(__n128)a3 input:(__n128)a4 ref0:(__n128)a5 ref1:(__n128)a6 metaBuf:(__n128)a7 meta0Buf:(uint64_t)a8 meta1Buf:(void *)a9 hmgrphy0:(void *)a10 hmgrphy1:(void *)a11
{
  v38[0] = a2;
  v38[1] = a3;
  v38[2] = a4;
  v37[0] = a5;
  v37[1] = a6;
  v37[2] = a7;
  id v21 = a13;
  id v22 = a15;
  id v23 = a14;
  id v24 = v21;
  id v25 = a12;
  id v26 = a11;
  id v27 = a10;
  id v28 = a9;
  long long v29 = (char *)[v24 contents];
  [v28 setComputePipelineState:*(void *)(a1 + 80)];
  [v28 setTexture:v27 atIndex:0];

  [v28 setTexture:v26 atIndex:1];
  [v28 setTexture:v25 atIndex:2];

  [v28 setBuffer:v24 offset:0 atIndex:0];
  [v28 setBuffer:v23 offset:0 atIndex:1];

  [v28 setBuffer:v22 offset:0 atIndex:2];
  [v28 setBytes:v38 length:48 atIndex:3];
  [v28 setBytes:v37 length:48 atIndex:4];
  int32x2_t v30 = vadd_s32(*(int32x2_t *)(v29 + 20), (int32x2_t)0x8400000084);
  int32x2_t v31 = vsra_n_s32((int32x2_t)0x1F0000001FLL, (int32x2_t)vsra_n_u32((uint32x2_t)v30, (uint32x2_t)vcltz_s32(v30), 0x1EuLL), 2uLL);
  v32.i64[0] = v31.i32[0];
  v32.i64[1] = v31.i32[1];
  uint64x2_t v35 = vshrq_n_u64(v32, 5uLL);
  uint64_t v36 = 1;
  int64x2_t v33 = vdupq_n_s64(0x20uLL);
  uint64_t v34 = 1;
  [v28 dispatchThreadgroups:&v35 threadsPerThreadgroup:&v33];
}

- (void)encodeSyncRefType:(id)a3 metaBuf:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (unsigned __int16 *)[v7 contents];
  if (*v8 - 61 >= 0xFFFFFFC4)
  {
    id v9 = (__int16 *)v8;
    [v6 setComputePipelineState:self->_syncRefType];
    [v6 setBuffer:v7 offset:0 atIndex:0];
    unint64_t v12 = (unint64_t)(*v9 + 31) >> 5;
    int64x2_t v13 = vdupq_n_s64(1uLL);
    uint64_t v10 = 32;
    long long v11 = xmmword_2E2D0;
    [v6 dispatchThreadgroups:&v12 threadsPerThreadgroup:&v10];
  }
}

- (void)getRefTypeYUVInput:(double)a3 ref0:(double)a4 ref1:(double)a5 metaBuf:(double)a6 meta0Buf:(double)a7 meta1Buf:(uint64_t)a8 hmgrphy0:(uint64_t)a9 hmgrphy1:(uint64_t)a10 commandEncoder:(uint64_t)a11
{
  id v22 = a15;
  id v29 = a12;
  objc_msgSend(a1, "encodeGetRefTypeYUV:input:ref0:ref1:metaBuf:meta0Buf:meta1Buf:hmgrphy0:hmgrphy1:", v22, a9, a10, a11, v29, a13, a2, a3, a4, a5, a6, a7, a14);
  [a1 encodeSyncRefType:v22 metaBuf:v29];
}

- (void)encodeStrongTemporalRepairYUVToCommandBuffer:(__n128)a3 input:(__n128)a4 frRef0:(__n128)a5 frRef1:(__n128)a6 trRef0:(__n128)a7 trRef1:(uint64_t)a8 hmgrphy0:(void *)a9 hmgrphy1:(void *)a10 strongTemporalOutput:(void *)a11 temporalOutput:(void *)a12 metaBuf:(void *)a13 ref0MetaBuf:(void *)a14 ref1MetaBuf:(id)a15
{
  v44[0] = a2;
  v44[1] = a3;
  v44[2] = a4;
  v43[0] = a5;
  v43[1] = a6;
  v43[2] = a7;
  uint64_t v24 = *(void *)(a1 + 104);
  id v38 = a19;
  id v37 = a18;
  id v36 = a17;
  id v25 = a16;
  id v26 = a15;
  id v27 = a14;
  id v28 = a13;
  id v29 = a12;
  id v30 = a11;
  id v31 = a10;
  id v32 = a9;
  [v32 setComputePipelineState:v24];
  [v32 setTexture:v31 atIndex:0];

  [v32 setTexture:v30 atIndex:1];
  [v32 setTexture:v29 atIndex:2];

  [v32 setTexture:v28 atIndex:3];
  [v32 setTexture:v27 atIndex:4];

  [v32 setTexture:v26 atIndex:5];
  [v32 setTexture:v25 atIndex:6];

  [v32 setBuffer:v36 offset:0 atIndex:0];
  [v32 setBuffer:v37 offset:0 atIndex:1];

  [v32 setBuffer:v38 offset:0 atIndex:2];
  [v32 setBytes:v44 length:48 atIndex:3];
  [v32 setBytes:v43 length:48 atIndex:4];
  [v32 setImageblockWidth:32 height:32];
  id v33 = v36;
  uint64_t v34 = (char *)[v33 contents];

  uint64x2_t v41 = vshrq_n_u64((uint64x2_t)vaddw_s32(vdupq_n_s64(0x1FuLL), vadd_s32(*(int32x2_t *)(v34 + 20), (int32x2_t)0x8400000084)), 5uLL);
  uint64_t v42 = 1;
  int64x2_t v39 = vdupq_n_s64(0x20uLL);
  uint64_t v40 = 1;
  [v32 dispatchThreadgroups:&v41 threadsPerThreadgroup:&v39];
}

- (id)strongTemporalRepairYUVInput:(void *)a1 frRef0:(uint64_t)a2 frRef1:(uint64_t)a3 trRef0:(uint64_t)a4 trRef1:(uint64_t)a5 hmgrphy0:(uint64_t)a6 hmgrphy1:(uint64_t)a7 metaBuf:(uint64_t)a8 ref0MetaBuf:(id)a9 ref1MetaBuf:(id)a10 strongTemporalOutput:(id)a11 temporalOutput:(id)a12 commandEncoder:(id)a13
{
  return objc_msgSend(a1, "encodeStrongTemporalRepairYUVToCommandBuffer:input:frRef0:frRef1:trRef0:trRef1:hmgrphy0:hmgrphy1:strongTemporalOutput:temporalOutput:metaBuf:ref0MetaBuf:ref1MetaBuf:", a13, a3, a4, a5, a6, a7);
}

- (void)computeDoGAndLumaForBoxesViaInput:(id)a3 inputLocationsSize:(unsigned int)a4 metalBuffers:(id *)a5 commandBuffer:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id var9 = a5->var9;
  id v11 = a5->var11;
  id v15 = var9;
  id v12 = a6;
  id v13 = a3;
  uint64x2_t v14 = [v12 computeCommandEncoderWithDispatchType:1];
  [(GGMMetalToolBox *)self addComputeBoxDoGToCommandEncoder:v14 inputTexture:v13 inputlocationsBuf:v15 DoGAndLumaBuf:v11 inputLocationsSize:v7];
  [(GGMMetalToolBox *)self addComputeBoxFeatureVectorToCommandEncoder:v14 inputTexture:v13 inputlocationsBuf:v15 DoGAndLumaBuf:v11 inputLocationsSize:v7];

  [v14 endEncoding];
  [v12 commit];
}

- (void)addComputeBoxDoGToCommandEncoder:(id)a3 inputTexture:(id)a4 inputlocationsBuf:(id)a5 DoGAndLumaBuf:(id)a6 inputLocationsSize:(unsigned int)a7
{
  unsigned int v19 = a7;
  computeBoxDoG = self->_computeBoxDoG;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [v14 setComputePipelineState:computeBoxDoG];
  [v14 setTexture:v13 atIndex:0];

  [v14 setBuffer:v12 offset:0 atIndex:0];
  [v14 setBuffer:v11 offset:0 atIndex:1];

  [v14 setBytes:&v19 length:4 atIndex:2];
  unint64_t v17 = ((unint64_t)v19 + 31) >> 5;
  int64x2_t v18 = vdupq_n_s64(1uLL);
  uint64_t v15 = 32;
  long long v16 = xmmword_2E2D0;
  [v14 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
}

- (void)addComputeBoxFeatureVectorToCommandEncoder:(id)a3 inputTexture:(id)a4 inputlocationsBuf:(id)a5 DoGAndLumaBuf:(id)a6 inputLocationsSize:(unsigned int)a7
{
  unsigned int v19 = a7;
  computeBoxLumaFeatureVector = self->_computeBoxLumaFeatureVector;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [v14 setComputePipelineState:computeBoxLumaFeatureVector];
  [v14 setTexture:v13 atIndex:0];

  [v14 setBuffer:v12 offset:0 atIndex:0];
  [v14 setBuffer:v11 offset:0 atIndex:1];

  [v14 setBytes:&v19 length:4 atIndex:2];
  unint64_t v17 = ((unint64_t)v19 + 31) >> 5;
  int64x2_t v18 = vdupq_n_s64(1uLL);
  uint64_t v15 = 32;
  long long v16 = xmmword_2E2D0;
  [v14 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
}

- (void)encodeCollectClusterStats:(id)a3 clusterMetaBuf:(id)a4 metaBuf:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  id v12 = (unsigned __int16 *)[v11 contents];
  id v13 = v10;
  id v14 = (unsigned __int16 *)[v13 contents];
  if (*v12 - 61 >= 0xFFFFFFC4 && *v14 - 61 >= 0xFFFFFFC4)
  {
    [v8 setComputePipelineState:self->_collectClusterStats];
    [v8 setBuffer:v11 offset:0 atIndex:0];
    [v8 setBuffer:v13 offset:0 atIndex:1];
    unint64_t v17 = (unint64_t)((__int16)*v12 + 31) >> 5;
    int64x2_t v18 = vdupq_n_s64(1uLL);
    uint64_t v15 = 32;
    long long v16 = xmmword_2E2D0;
    [v8 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
  }
}

- ($CECAC3A835FDE6A6E30A75FB7F50DCB5)metaContainer
{
  return self->_metaContainer;
}

- (void)setMetaContainer:(id *)a3
{
  self->_metaContainer = a3;
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (__CVMetalTextureCache)cvMetalTextureCacheRef
{
  return self->_cvMetalTextureCacheRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  for (uint64_t i = 0; i != 60; ++i)

  objc_storeStrong((id *)&self->_computeBlendingWeightsSpatialOnlyYUV, 0);
  objc_storeStrong((id *)&self->_computeBlendingWeightsYUV, 0);
  objc_storeStrong((id *)&self->_integralTexture, 0);
  objc_storeStrong((id *)&self->_integralBinImageCol, 0);
  objc_storeStrong((id *)&self->_integralBinImageRow, 0);
  objc_storeStrong((id *)&self->_computeBoxLumaFeatureVector, 0);
  objc_storeStrong((id *)&self->_computeBoxDoG, 0);
  objc_storeStrong((id *)&self->_strongTemporalRepairYUV, 0);
  objc_storeStrong((id *)&self->_collectClusterStats, 0);
  objc_storeStrong((id *)&self->_syncRefType, 0);
  objc_storeStrong((id *)&self->_getRefTypeYUV, 0);
  objc_storeStrong((id *)&self->_syncMaxLuma, 0);
  objc_storeStrong((id *)&self->_getGhostMaxLumaYUV, 0);
  objc_storeStrong((id *)&self->_findGhostKeypointsFromDesGen, 0);
  objc_storeStrong((id *)&self->_findTinyKPs, 0);
  objc_storeStrong((id *)&self->_computeDiffForLocalMotionYUV, 0);
  objc_storeStrong((id *)&self->_YCbCrToRGB, 0);
  objc_storeStrong((id *)&self->_backwarpWithHomographyYUV, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end