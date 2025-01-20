@interface IntelligentDistortionCorrection_Utilities
- (CGAffineTransform)getTransformFromRect:(SEL)a3 toRect:(CGRect)a4;
- (IntelligentDistortionCorrection_Utilities)initWithMetalContext:(id)a3;
- (id)textureFromBuffer:(id)a3 bufferOffset:(unint64_t)a4 textureDescriptor:(id *)a5;
- (int)compileShaders:(BOOL)a3;
- (int)computeMeshROI:(id *)a3 invertedMeshTexture:(id)a4 roiTracker:(id)a5;
- (int)determineWorkingBufferRequirements:(id *)a3;
- (int)dilateSegmentationMask:(id)a3 to:(id)a4 radius:(int)a5 commandEncoder:(id)a6;
- (int)erodeSegmentationMask:(id)a3 to:(id)a4 radius:(int)a5 commandEncoder:(id)a6;
- (int)extractBundleConfigurationParameters:(id *)a3 cameraInfo:(id)a4 tuningParameters:(id)a5 imageInfo:(id)a6;
- (int)extractFloat:(id)a3 name:(id)a4 value:(float *)a5 mandatory:(BOOL)a6 cumulativeError:(int *)a7;
- (int)extractImageOptions:(id *)a3 imageInfo:(id)a4 portType:(id *)a5 cumulativeError:(int *)a6;
- (int)gatherGatingStatistics:(id)a3 area:(id *)a4 center:(float)a5 radiusFromCenter:(id)a6 sharedMetalBuffer:(unint64_t)a7 sharedMetalBufferoffset:(unsigned int *)a8 activePixelCount:(unsigned int *)a9 centerPixelCount:;
- (int)lumaCropAndDownscale4to1:(id)a3 outputLumaTexture:(id)a4 region:(id *)a5;
- (int)setSharedMetalBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5;
- (int)testArrayObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5;
- (int)testDataObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5;
- (int)testDictionaryObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5;
- (int)testGenericObject:(id)a3 withName:(id)a4 classType:(Class)a5 className:(id)a6 cumulativeError:(int *)a7;
- (int)testNumberObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5;
- (int)testStringObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5;
- (int)undistortBGRATexture:(id *)a3 inputBGRATexture:(id)a4 intoOutputBGRA:(id)a5 encoder:(id)a6 crop:(id *)a7;
- (int)undistortSingleChannelTexture:(id *)a3 inputTexture:(id)a4 outputTexture:(id)a5;
- (int)warpAndOrUndistortPrimaryAsset:(id *)a3 inputImageTexture:(id)a4 inputMeshTexture:(id)a5 outputImageTexture:(id)a6 roiTracker:(id)a7 inputImageMetadataDictionary:(id)a8;
- (int)warpAndOrUndistortSecondaryAsset:(id *)a3 inputImageTexture:(id)a4 inputMeshTexture:(id)a5 normalizedInputCrop:(CGRect)a6 primaryImageDimensions:(id)a7 inputHorizontalSecondaryToPrimaryScaleFactor:(float)a8 inputVerticalSecondaryToPrimaryScaleFactor:(float)a9 inputHorizontalSecondaryToPrimaryShift:(float)a10 inputVerticalSecondaryToPrimaryShift:(float)a11 outputImageTexture:(id)a12 outputHorizontalAdditionalScaleFactor:(float)a13 outputVerticalAdditionalScaleFactor:(float)a14 roiTracker:(id)a15 isDepthData:(BOOL)a16 commandBuffer:(id)a17 sensorInputCropRect:(id *)a18;
- (int)zeroMetalBuffer:(id)a3 range:(_NSRange)a4 commandEncoder:(id)a5;
- (void)buildParameters:(id *)a3 bundleConfiguration:(id *)a4;
- (void)computeTextureStrideForBufferAllocation:(id *)a3;
- (void)dealloc;
- (void)extractCameraDictionaryOptions:(id *)a3 topEntry:(id)a4 cumulativeError:(int *)a5;
- (void)extractClassifierOptions:(id *)a3 parentEntry:(id)a4 cumulativeError:(int *)a5;
- (void)extractContentPreservingWarpingOptions:(id *)a3 parentEntry:(id)a4 cumulativeError:(int *)a5;
- (void)extractDistortionOptions:(id *)a3 parentEntry:(id)a4 cumulativeError:(int *)a5;
- (void)extractLineDetectorOptions:(id *)a3 parentEntry:(id)a4 cumulativeError:(int *)a5;
- (void)extractUint:(id)a3 name:(id)a4 value:(unsigned int *)a5 mandatory:(BOOL)a6 cumulativeError:(int *)a7;
- (void)setBoundingRect:(id *)a3 x0:(int)a4 y0:(int)a5 width:(int)a6 height:(int)a7;
@end

@implementation IntelligentDistortionCorrection_Utilities

- (IntelligentDistortionCorrection_Utilities)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();

    self = 0;
    goto LABEL_4;
  }
  v11.receiver = self;
  v11.super_class = (Class)IntelligentDistortionCorrection_Utilities;
  v6 = [(IntelligentDistortionCorrection_Utilities *)&v11 init];
  self = v6;
  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v7 = [(FigMetalContext *)self->_metalContext device];
  v8 = (MTLComputePipelineState *)[v7 newBufferWithLength:16 options:0];
  warpAndOrUndistortSecondaryAsset_RG8Unorm = self[2]._kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm;
  self[2]._kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm = v8;

  if (!self[2]._kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm)
  {
    fig_log_get_emitter();
    goto LABEL_8;
  }
LABEL_4:

  return self;
}

- (int)compileShaders:(BOOL)a3
{
  v4 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::lumaCropAndDownscale4to1" constants:0];
  lumaCropAndDownscale4to1 = self->_kernels.lumaCropAndDownscale4to1;
  self->_kernels.lumaCropAndDownscale4to1 = v4;

  if (self->_kernels.lumaCropAndDownscale4to1)
  {
    v6 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::zeroBuffer1" constants:0];
    zeroBuffer1 = self->_kernels.zeroBuffer1;
    self->_kernels.zeroBuffer1 = v6;

    if (self->_kernels.zeroBuffer1)
    {
      v8 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::zeroBuffer16" constants:0];
      zeroBuffer16 = self->_kernels.zeroBuffer16;
      self->_kernels.zeroBuffer16 = v8;

      if (self->_kernels.zeroBuffer16)
      {
        v10 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::warpAndOrUndistortPrimaryAsset2_YCbCr420" constants:0];
        warpAndOrUndistortPrimaryAsset2_YCbCr420 = self->_kernels.warpAndOrUndistortPrimaryAsset2_YCbCr420;
        self->_kernels.warpAndOrUndistortPrimaryAsset2_YCbCr420 = v10;

        if (self->_kernels.warpAndOrUndistortPrimaryAsset2_YCbCr420)
        {
          v12 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::warpAndOrUndistortSecondaryAsset_R8Unorm" constants:0];
          warpAndOrUndistortSecondaryAsset_R8Unorm = self->_kernels.warpAndOrUndistortSecondaryAsset_R8Unorm;
          self->_kernels.warpAndOrUndistortSecondaryAsset_R8Unorm = v12;

          if (self->_kernels.warpAndOrUndistortSecondaryAsset_R8Unorm)
          {
            v14 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::warpAndOrUndistortSecondaryAsset_RG8Unorm" constants:0];
            warpAndOrUndistortSecondaryAsset_RG8Unorm = self->_kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm;
            self->_kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm = v14;

            if (self->_kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm)
            {
              v16 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::undistortSingleChannel" constants:0];
              undistortSingleChannel = self->_kernels.undistortSingleChannel;
              self->_kernels.undistortSingleChannel = v16;

              if (self->_kernels.undistortSingleChannel)
              {
                v18 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::undistortBGRA" constants:0];
                undistortBGRA = self->_kernels.undistortBGRA;
                self->_kernels.undistortBGRA = v18;

                if (self->_kernels.undistortBGRA)
                {
                  v20 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::warpLinesAndMeasureDistance" constants:0];
                  warpLinesAndMeasureDistance = self->_kernels.warpLinesAndMeasureDistance;
                  self->_kernels.warpLinesAndMeasureDistance = v20;

                  if (self->_kernels.warpLinesAndMeasureDistance)
                  {
                    v22 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::gatherGatingStatistics" constants:0];
                    gatherGatingStatistics = self->_kernels.gatherGatingStatistics;
                    self->_kernels.gatherGatingStatistics = v22;

                    if (self->_kernels.gatherGatingStatistics)
                    {
                      v24 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::erodeSegmentationMask" constants:0];
                      erodeSegmentationMask = self->_kernels.erodeSegmentationMask;
                      self->_kernels.erodeSegmentationMask = v24;

                      if (self->_kernels.erodeSegmentationMask)
                      {
                        v26 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::dilateSegmentationMask" constants:0];
                        dilateSegmentationMask = self->_kernels.dilateSegmentationMask;
                        self->_kernels.dilateSegmentationMask = v26;

                        if (self->_kernels.dilateSegmentationMask)
                        {
                          v28 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::computeMeshROI" constants:0];
                          computeMeshROI = self->_kernels.computeMeshROI;
                          self->_kernels.computeMeshROI = v28;

                          if (self->_kernels.computeMeshROI)
                          {
                            v30 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::adjustROI" constants:0];
                            adjustROI = self->_kernels.adjustROI;
                            self->_kernels.adjustROI = v30;

                            if (self->_kernels.adjustROI)
                            {
                              v32 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::fillROICollectionRecord" constants:0];
                              fillROICollectionRecord = self->_kernels.fillROICollectionRecord;
                              self->_kernels.fillROICollectionRecord = v32;

                              if (self->_kernels.fillROICollectionRecord)
                              {
                                v34 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"idc_utilitiesKernels::fillRoiData" constants:0];
                                fillRoiData = self->_kernels.fillRoiData;
                                self->_kernels.fillRoiData = v34;

                                if (self->_kernels.fillRoiData) {
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
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12786;
}

- (void)dealloc
{
  [(IntelligentDistortionCorrection_Utilities *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)IntelligentDistortionCorrection_Utilities;
  [(IntelligentDistortionCorrection_Utilities *)&v3 dealloc];
}

- (int)determineWorkingBufferRequirements:(id *)a3
{
  if (a3)
  {
    int result = 0;
    a3->var0 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  return result;
}

- (int)setSharedMetalBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5
{
  id v9 = a3;
  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedMetalBuffer.buffer, a3);
    int v10 = 0;
    self->_sharedMetalBuffer.offset = a4;
    self->_sharedMetalBuffer.size = a5;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v10 = -12780;
  }

  return v10;
}

- (int)lumaCropAndDownscale4to1:(id)a3 outputLumaTexture:(id)a4 region:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(MTLComputePipelineState *)self->_kernels.lumaCropAndDownscale4to1 threadExecutionWidth];
  unint64_t v11 = [(MTLComputePipelineState *)self->_kernels.lumaCropAndDownscale4to1 maxTotalThreadsPerThreadgroup];
  v12 = [(FigMetalContext *)self->_metalContext commandQueue];
  v13 = [v12 commandBuffer];

  if (v13 && ([v13 computeCommandEncoder], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = v14;
    [v14 setComputePipelineState:self->_kernels.lumaCropAndDownscale4to1];
    [v15 setTexture:v8 atIndex:0];
    [v15 setTexture:v9 atIndex:1];
    int32x2_t v16 = vmovn_s64(*(int64x2_t *)&a5->var0.var0);
    v21[1] = v16.i16[2];
    v21[0] = v16.i16[0];
    [v15 setBytes:v21 length:4 atIndex:0];
    v20[0] = [v9 width];
    v20[1] = [v9 height];
    v20[2] = 1;
    v19[0] = v10;
    v19[1] = v11 / v10;
    v19[2] = 1;
    [v15 dispatchThreads:v20 threadsPerThreadgroup:v19];
    [v15 endEncoding];
    [v13 commit];

    int v17 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v17 = -12786;
  }

  return v17;
}

- (id)textureFromBuffer:(id)a3 bufferOffset:(unint64_t)a4 textureDescriptor:(id *)a5
{
  id v7 = a3;
  id v8 = v7;
  if (v7 && a5 && (unint64_t v9 = a4 + a5->var1 * a5->var4, v9 <= [v7 length]))
  {
    unint64_t v10 = objc_opt_new();
    unint64_t v11 = v10;
    if (v10)
    {
      [v10 setWidth:a5->var0];
      [v11 setHeight:a5->var1];
      [v11 setPixelFormat:a5->var2];
      [v11 setUsage:a5->var3];
      objc_msgSend(v11, "setResourceOptions:", objc_msgSend(v8, "resourceOptions"));
      v12 = (void *)[v8 newLinearTextureWithDescriptor:v11 offset:a4 bytesPerRow:a5->var4 bytesPerImage:a5->var1 * a5->var4];
      if (!v12)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v12 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
    unint64_t v11 = 0;
  }

  return v12;
}

- (void)computeTextureStrideForBufferAllocation:(id *)a3
{
  id v5 = [(FigMetalContext *)self->_metalContext device];
  unint64_t v6 = [v5 deviceLinearTextureAlignmentBytes];

  unint64_t v7 = (v6
      + a3->var0 * [(FigMetalContext *)self->_metalContext getPixelSizeInBytes:a3->var2]
      - 1)
     / v6
     * v6;
  unint64_t v8 = v7 * a3->var1;
  a3->var4 = v7;
  a3->var5 = v8;
}

- (int)zeroMetalBuffer:(id)a3 range:(_NSRange)a4 commandEncoder:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  unint64_t v11 = v10;
  if (v9 && v10)
  {
    if ((location & 0xF) == 0 && length > 0x20) {
      goto LABEL_9;
    }
    uint64_t v12 = length >= 0x21 ? 16 - (location & 0xF) : length;
    [v10 setComputePipelineState:self->_kernels.zeroBuffer1];
    [v11 setBuffer:v9 offset:location atIndex:0];
    uint64_t v26 = v12;
    int64x2_t v27 = vdupq_n_s64(1uLL);
    uint64_t v24 = v12;
    int64x2_t v25 = v27;
    [v11 dispatchThreads:&v26 threadsPerThreadgroup:&v24];
    length -= v12;
    location += v12;
    if (length >= 0x10)
    {
LABEL_9:
      uint64_t v13 = length >> 4;
      if ([(MTLComputePipelineState *)self->_kernels.zeroBuffer16 maxTotalThreadsPerThreadgroup] < length >> 4)uint64_t v13 = [(MTLComputePipelineState *)self->_kernels.zeroBuffer16 maxTotalThreadsPerThreadgroup]; {
      [v11 setComputePipelineState:self->_kernels.zeroBuffer16];
      }
      [v11 setBuffer:v9 offset:location atIndex:0];
      NSUInteger v22 = length >> 4;
      int64x2_t v23 = vdupq_n_s64(1uLL);
      uint64_t v20 = v13;
      int64x2_t v21 = v23;
      [v11 dispatchThreads:&v22 threadsPerThreadgroup:&v20];
      unint64_t v14 = length & 0xFFFFFFFFFFFFFFF0;
      length &= 0xFu;
      location += v14;
    }
    if (length)
    {
      [v11 setComputePipelineState:self->_kernels.zeroBuffer1];
      [v11 setBuffer:v9 offset:location atIndex:0];
      NSUInteger v18 = length;
      int64x2_t v19 = vdupq_n_s64(1uLL);
      NSUInteger v16 = length;
      int64x2_t v17 = v19;
      [v11 dispatchThreads:&v18 threadsPerThreadgroup:&v16];
      LODWORD(length) = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    LODWORD(length) = -12780;
  }

  return length;
}

- (void)setBoundingRect:(id *)a3 x0:(int)a4 y0:(int)a5 width:(int)a6 height:(int)a7
{
  a3->var0 = a4;
  a3->var1 = a5;
  a3->var2 = a6 - 1;
  a3->var3 = a7 - 1;
  a3->var4 = a6;
  a3->var5 = a7;
}

- (int)testGenericObject:(id)a3 withName:(id)a4 classType:(Class)a5 className:(id)a6 cumulativeError:(int *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10)
  {
    int v13 = -12780;
    if (!a7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v13 = -12784;
    if (!a7) {
      goto LABEL_8;
    }
LABEL_7:
    *a7 = v13;
    goto LABEL_8;
  }
  int v13 = 0;
LABEL_8:

  return v13;
}

- (int)testDictionaryObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5
{
  id v8 = a4;
  id v9 = a3;
  LODWORD(a5) = [(IntelligentDistortionCorrection_Utilities *)self testGenericObject:v9 withName:v8 classType:objc_opt_class() className:@"NSDictionary" cumulativeError:a5];

  return (int)a5;
}

- (int)testArrayObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5
{
  id v8 = a4;
  id v9 = a3;
  LODWORD(a5) = [(IntelligentDistortionCorrection_Utilities *)self testGenericObject:v9 withName:v8 classType:objc_opt_class() className:@"NSArray" cumulativeError:a5];

  return (int)a5;
}

- (int)testStringObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5
{
  id v8 = a4;
  id v9 = a3;
  LODWORD(a5) = [(IntelligentDistortionCorrection_Utilities *)self testGenericObject:v9 withName:v8 classType:objc_opt_class() className:@"NSString" cumulativeError:a5];

  return (int)a5;
}

- (int)testNumberObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5
{
  id v8 = a4;
  id v9 = a3;
  LODWORD(a5) = [(IntelligentDistortionCorrection_Utilities *)self testGenericObject:v9 withName:v8 classType:objc_opt_class() className:@"NSNumber" cumulativeError:a5];

  return (int)a5;
}

- (int)testDataObject:(id)a3 withName:(id)a4 cumulativeError:(int *)a5
{
  id v8 = a4;
  id v9 = a3;
  LODWORD(a5) = [(IntelligentDistortionCorrection_Utilities *)self testGenericObject:v9 withName:v8 classType:objc_opt_class() className:@"NSData" cumulativeError:a5];

  return (int)a5;
}

- (int)extractBundleConfigurationParameters:(id *)a3 cameraInfo:(id)a4 tuningParameters:(id)a5 imageInfo:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v25 = 0;
  a3->var4 = 981668463;
  if (!BYTE2(a3->var14.var1.var0))
  {
    *(void *)&a3->var5.var1 = 0;
    *(_OWORD *)&a3->var5.var5 = 0u;
    *(_OWORD *)&a3->var6.var1 = 0u;
    *(_OWORD *)&a3->var6.var5 = 0u;
    *(_OWORD *)&a3->var12.var0 = 0u;
  }
  LOBYTE(a3->var12.var4) = 1;
  LOBYTE(a3->var21[2].var0[3]) = 1;
  *(_OWORD *)&a3->var14.var1.var1 = xmmword_262F346F0;
  *(void *)&a3->var14.var1.var5 = 0x323F266666;
  a3->var21[2].var0[4] = 0.0;
  *(_DWORD *)&a3->var23[6].var0 = 0;
  *(void *)&a3[1].var6.var4 = 0x43AF000043B68000;
  int v13 = [(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v10 withName:@"cameraInfo" cumulativeError:&v25];
  if (v25 | v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v15 = 0;
LABEL_21:
    id v18 = 0;
LABEL_23:
    int v22 = -12784;
    goto LABEL_18;
  }
  id v24 = 0;
  int v14 = [(IntelligentDistortionCorrection_Utilities *)self extractImageOptions:a3 imageInfo:v12 portType:&v24 cumulativeError:&v25];
  id v15 = v24;
  if (v25 | v14
    || ([v10 objectForKeyedSubscript:v15],
        NSUInteger v16 = objc_claimAutoreleasedReturnValue(),
        [(IntelligentDistortionCorrection_Utilities *)self extractCameraDictionaryOptions:a3 topEntry:v16 cumulativeError:&v25], v16, v25)|| (int v17 = [(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v11 withName:@"tuningParameters" cumulativeError:&v25], v25 | v17))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_21;
  }
  id v18 = [v11 objectForKeyedSubscript:v15];
  int v19 = [(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v18 withName:@"cameraOptionsDictionary" cumulativeError:&v25];
  if (v25 | v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_23;
  }
  int v20 = v19;
  id v18 = v18;
  [(IntelligentDistortionCorrection_Utilities *)self extractDistortionOptions:a3 parentEntry:v18 cumulativeError:&v25];
  if (v25
    || ([(IntelligentDistortionCorrection_Utilities *)self extractLineDetectorOptions:a3 parentEntry:v18 cumulativeError:&v25], v25)|| ([(IntelligentDistortionCorrection_Utilities *)self extractClassifierOptions:a3 parentEntry:v18 cumulativeError:&v25], v25)|| ([(IntelligentDistortionCorrection_Utilities *)self extractContentPreservingWarpingOptions:a3 parentEntry:v18 cumulativeError:&v25],
        v25))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  if (v25) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v20 == 0;
  }
  if (v21) {
    int v22 = v25;
  }
  else {
    int v22 = -12780;
  }
LABEL_18:

  return v22;
}

- (void)extractCameraDictionaryOptions:(id *)a3 topEntry:(id)a4 cumulativeError:(int *)a5
{
  id v8 = a4;
  if (*a5 | [(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v8 withName:@"cameraDictionary" cumulativeError:a5])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v17 = 0;
    id v18 = 0;
    id v9 = 0;
LABEL_21:
    id v11 = 0;
LABEL_24:
    *a5 = -12784;
    goto LABEL_18;
  }
  id v9 = v8;
  float v22 = 0.0;
  if (*a5 | [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"PixelSize" value:&v22 mandatory:1 cumulativeError:a5])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v17 = 0;
    id v18 = 0;
    goto LABEL_21;
  }
  *(float *)&a3->var4 = (float)(v22 * (float)LODWORD(a3->var5.var4)) / 1000.0;
  if (BYTE2(a3->var14.var1.var0))
  {
    id v17 = 0;
    id v18 = 0;
    id v11 = 0;
    goto LABEL_18;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2C0F0]];
  if (v10)
  {
    id v11 = (void *)v10;
    id v12 = @"OpticalCenterOffsetInPhysicalSensorDimensions";
  }
  else
  {
    id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2C0E8]];
    id v12 = @"OpticalCenterOffset";
  }
  if (*a5 | [(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v11 withName:v12 cumulativeError:a5])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v17 = 0;
    id v18 = 0;
    goto LABEL_24;
  }
  int v13 = [v11 objectForKeyedSubscript:@"X"];
  if (*a5 | [(IntelligentDistortionCorrection_Utilities *)self testNumberObject:v13 withName:@"X" cumulativeError:a5])goto LABEL_27; {
  [v13 floatValue];
  }
  a3->var5.var1 = v14;
  id v15 = [v11 objectForKeyedSubscript:@"Y"];

  if (*a5 | [(IntelligentDistortionCorrection_Utilities *)self testNumberObject:v15 withName:@"Y" cumulativeError:a5])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    *a5 = -12784;

    id v17 = 0;
    goto LABEL_29;
  }
  [v15 floatValue];
  a3->var5.var2 = v16;
  int v13 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2C0E0]];

  if (*a5 | [(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v13 withName:@"GeometricDistortionCoefficients" cumulativeError:a5])
  {
LABEL_27:
    fig_log_get_emitter();
    FigDebugAssert3();
    *a5 = -12784;

    id v17 = 0;
    id v18 = 0;
    id v11 = v13;
    goto LABEL_18;
  }
  id v15 = v13;

  id v17 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2CA90]];
  if (!(*a5 | -[IntelligentDistortionCorrection_Utilities testDataObject:withName:cumulativeError:](self, "testDataObject:withName:cumulativeError:", v17, @"BasePolynomial", a5))&& [v17 length] == 64)
  {
    id v18 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2CA98]];
    if (*a5 | -[IntelligentDistortionCorrection_Utilities testDataObject:withName:cumulativeError:](self, "testDataObject:withName:cumulativeError:", v18, @"DynamicPolynomial", a5)|| [v18 length] != 64)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      *a5 = -12784;
    }
    else
    {
      float var3 = a3->var5.var3;
      id v17 = v17;
      int v20 = (float *)[v17 bytes];
      id v18 = v18;
      BOOL v21 = (float *)[v18 bytes];
      a3->var5.var5 = *v20 + (float)(var3 * *v21);
      a3->var5.var6 = v20[1] + (float)(var3 * v21[1]);
      a3->var5.var7 = v20[2] + (float)(var3 * v21[2]);
      a3->var6.var0 = v20[3] + (float)(var3 * v21[3]);
      a3->var6.var1 = v20[4] + (float)(var3 * v21[4]);
      a3->var6.var2 = v20[5] + (float)(var3 * v21[5]);
      a3->var6.float var3 = v20[6] + (float)(var3 * v21[6]);
      a3->var6.var4 = v20[7] + (float)(var3 * v21[7]);
      a3->var6.var5 = v20[8] + (float)(var3 * v21[8]);
      a3->var6.var6 = v20[9] + (float)(var3 * v21[9]);
      a3->var6.var7 = v20[10] + (float)(var3 * v21[10]);
      *(float *)&a3->var7 = v20[11] + (float)(var3 * v21[11]);
      *(float *)&a3->var12.var0 = v20[12] + (float)(var3 * v21[12]);
      *(float *)&a3->var12.var1 = v20[13] + (float)(var3 * v21[13]);
      *(float *)&a3->var12.var2 = v20[14] + (float)(var3 * v21[14]);
      *(float *)&a3->var12.float var3 = v20[15] + (float)(var3 * v21[15]);
    }

    goto LABEL_17;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  *a5 = -12784;

LABEL_29:
  id v18 = 0;
LABEL_17:
  id v11 = v15;
LABEL_18:
}

- (void)extractDistortionOptions:(id *)a3 parentEntry:(id)a4 cumulativeError:(int *)a5
{
  id v41 = [a4 objectForKeyedSubscript:@"distortion"];
  if (*a5 | -[IntelligentDistortionCorrection_Utilities testDictionaryObject:withName:cumulativeError:](self, "testDictionaryObject:withName:cumulativeError:"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v8 = 0;
  }
  else
  {
    id v8 = v41;
    [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v8 name:@"curveFalloffMu" value:&a3[1].var6.var4 mandatory:0 cumulativeError:a5];
    if (*a5
      || ([(IntelligentDistortionCorrection_Utilities *)self extractFloat:v8 name:@"curveFalloffSigma" value:&a3[1].var6.var5 mandatory:0 cumulativeError:a5], *a5))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      id v41 = v8;
    }
    else
    {
      id v9 = [v8 objectForKeyedSubscript:@"curves"];

      if (![(IntelligentDistortionCorrection_Utilities *)self testArrayObject:v9 withName:@"curves" cumulativeError:a5])
      {
        id v10 = v9;
        unsigned int v11 = [v10 count];
        if (v11)
        {
          id v36 = v8;
          v38 = a3;
          if (v11 >= 0xB)
          {
            *a5 = -12780;
            unsigned int v11 = 10;
          }
          id v12 = 0;
          int v13 = (char *)v11;
          float v14 = &a3->var21[2].var0[5];
          id v9 = v10;
          float v39 = *(float *)&v11;
          v42 = (char *)v11;
          do
          {
            id v15 = v9;
            id v9 = [v10 objectAtIndexedSubscript:v12];

            if (![(IntelligentDistortionCorrection_Utilities *)self testArrayObject:v9 withName:@"coefficientSet" cumulativeError:a5])
            {
              id v16 = v10;
              id v17 = v9;
              if ([v17 count] == 7)
              {
                for (uint64_t i = 0; i != 7; ++i)
                {
                  int v19 = [v17 objectAtIndexedSubscript:i];
                  if (![(IntelligentDistortionCorrection_Utilities *)self testNumberObject:v19 withName:@"coefficient" cumulativeError:a5])
                  {
                    [v19 floatValue];
                    v14[i] = v20;
                  }
                }
              }
              else
              {
                *a5 = -12780;
              }

              id v10 = v16;
              int v13 = v42;
            }
            ++v12;
            v14 += 7;
          }
          while (v12 != v13);
          id v8 = v36;
          a3 = v38;
          float v21 = v39;
        }
        else
        {
          float v21 = 0.0;
          *a5 = -12780;
          id v9 = v10;
        }
        a3->var21[2].var0[4] = v21;
      }
      id v41 = [v8 objectForKeyedSubscript:@"classifications"];

      if (![(IntelligentDistortionCorrection_Utilities *)self testArrayObject:v41 withName:@"classifications" cumulativeError:a5])
      {
        id v22 = v41;
        unsigned int v23 = [v22 count];
        if (v23)
        {
          id v37 = v8;
          if (v23 >= 0xB)
          {
            *a5 = -12780;
            unsigned int v23 = 10;
          }
          uint64_t v24 = 0;
          unsigned int v35 = v23;
          uint64_t v25 = v23;
          id v40 = v22;
          uint64_t v26 = &a3->var23[7];
          int64x2_t v27 = @"classificationHandling";
          id v41 = v22;
          do
          {
            v28 = [v22 objectAtIndexedSubscript:v24];

            if ([(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v28 withName:v27 cumulativeError:a5])
            {
              id v41 = v28;
            }
            else
            {
              v29 = v27;
              v30 = [v28 objectForKeyedSubscript:@"gated"];
              if (!-[IntelligentDistortionCorrection_Utilities testNumberObject:withName:cumulativeError:](self, "testNumberObject:withName:cumulativeError:", v30, @"gated", a5))LOBYTE(v26[-1].var1) = [v30 BOOLValue]; {
              v31 = [v28 objectForKeyedSubscript:@"curveOption"];
              }

              if (![(IntelligentDistortionCorrection_Utilities *)self testNumberObject:v31 withName:@"curveOption" cumulativeError:a5])
              {
                LODWORD(v32) = [v31 intValue];
                if ((LODWORD(v32) & 0x80000000) != 0 || SLODWORD(v32) >= SLODWORD(a3->var21[2].var0[4])) {
                  *a5 = -12780;
                }
                else {
                  v26[-1].var2 = v32;
                }
              }
              id v41 = [v28 objectForKeyedSubscript:@"distortionTarget"];

              if (![(IntelligentDistortionCorrection_Utilities *)self testNumberObject:v41 withName:@"distortionTarget" cumulativeError:a5])
              {
                [v41 floatValue];
                *(_DWORD *)&v26->var0 = v33;
              }

              int64x2_t v27 = v29;
              id v22 = v40;
            }
            ++v24;
            ++v26;
          }
          while (v25 != v24);
          id v8 = v37;
          unsigned int v34 = v35;
        }
        else
        {
          unsigned int v34 = 0;
          *a5 = -12780;
          id v41 = v22;
        }
        *(_DWORD *)&a3->var23[6].var0 = v34;
      }
    }
  }
}

- (int)extractImageOptions:(id *)a3 imageInfo:(id)a4 portType:(id *)a5 cumulativeError:(int *)a6
{
  id v10 = a4;
  int v11 = [(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v10 withName:@"imageInfo" cumulativeError:a6];
  if (*a6 | v11)
  {
    int v13 = v11;
    fig_log_get_emitter();
    FigDebugAssert3();
    id v12 = 0;
LABEL_21:
    id v17 = 0;
    *a6 = -12780;
    goto LABEL_18;
  }
  id v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2DF98]];
  int v13 = [(IntelligentDistortionCorrection_Utilities *)self testStringObject:v12 withName:@"PortType" cumulativeError:a6];
  if (*a6 | v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_21;
  }
  id v14 = v12;
  *a5 = v14;
  id v15 = [v10 objectForKeyedSubscript:@"ValidBufferRect"];

  if (v15)
  {
    int v16 = [(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v15 withName:@"ValidBufferRect" cumulativeError:a6];
    if (!v16)
    {
      id v12 = v15;
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v12 name:@"X" value:&a3->var15.var0.var1 mandatory:1 cumulativeError:a6];
      if (*a6
        || (-[IntelligentDistortionCorrection_Utilities extractUint:name:value:mandatory:cumulativeError:](self, "extractUint:name:value:mandatory:cumulativeError:", v12, @"Y", &a3->var15.var0.var2, 1, a6), *a6)|| (-[IntelligentDistortionCorrection_Utilities extractUint:name:value:mandatory:cumulativeError:](self, "extractUint:name:value:mandatory:cumulativeError:", v12, @"Width", &a3->var15.var0.var5, 1, a6), *a6)|| (-[IntelligentDistortionCorrection_Utilities extractUint:name:value:mandatory:cumulativeError:](self,
              "extractUint:name:value:mandatory:cumulativeError:",
              v12,
              @"Height",
              &a3->var16,
              1,
              a6),
            (int v13 = *a6) != 0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v13 = 0;
        id v17 = v12;
        goto LABEL_18;
      }
      *(int32x2_t *)&a3->var15.var0.float var3 = vadd_s32(vadd_s32(*(int32x2_t *)&a3->var15.var0.var1, *(int32x2_t *)&a3->var15.var0.var5), (int32x2_t)-1);
      id v17 = v12;
      goto LABEL_12;
    }
    int v13 = v16;
  }
  id v17 = 0;
LABEL_12:
  [(IntelligentDistortionCorrection_Utilities *)self extractUint:v10 name:@"RawSensorWidth" value:&a3->var16.var5 mandatory:1 cumulativeError:a6];
  if (*a6) {
    goto LABEL_22;
  }
  [(IntelligentDistortionCorrection_Utilities *)self extractUint:v10 name:@"RawSensorHeight" value:&a3->var17 mandatory:1 cumulativeError:a6];
  if (*a6) {
    goto LABEL_22;
  }
  a3->var5.float var3 = 0.0;
  [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v10 name:*MEMORY[0x263F2D048] value:&a3->var5.var3 mandatory:0 cumulativeError:a6];
  if (*a6
    || (a3->float var3 = 1.0,
        [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v10 name:*MEMORY[0x263F2D020] value:&a3->var3 mandatory:0 cumulativeError:a6], *a6)|| (LODWORD(a3->var5.var4) = 1, p_var4 = &a3->var5.var4, *(p_var4 - 6) = fmaxf(*(p_var4 - 6), 1.0), [(IntelligentDistortionCorrection_Utilities *)self extractUint:v10 name:*MEMORY[0x263F2D3F0] value:p_var4 mandatory:0 cumulativeError:a6],
        *a6))
  {
LABEL_22:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  id v12 = v15;
LABEL_18:

  return v13;
}

- (void)extractLineDetectorOptions:(id *)a3 parentEntry:(id)a4 cumulativeError:(int *)a5
{
  uint64_t v8 = [a4 objectForKeyedSubscript:@"lineDetector"];
  if (v8)
  {
    id v10 = (id)v8;
    if ([(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v8 withName:@"lineDetector" cumulativeError:a5])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      id v9 = v10;
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"downscaleFactor" value:&a3->var21[0].var0[1] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"gradientNormalizationRadius" value:&a3->var21[0].var0[3] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"anchorScanInterval" value:&a3->var21[0].var0[4] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"lineFitInitialLength" value:&a3->var21[0].var0[5] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"minimumLineLength" value:&a3->var21[1].var0[2] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"gradientMagnitudeThreshold" value:&a3->var21[0].var0[2] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"lineFitErrorThreshold" value:&a3->var21[0].var0[6] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"lineMergeDeviationThreshold" value:&a3->var21[1] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"lineMergeDistanceThreshold" value:&a3->var21[1].var0[1] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"segmentationMaskDilationRadius" value:&a3->var21[1].var0[3] mandatory:0 cumulativeError:a5];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)extractClassifierOptions:(id *)a3 parentEntry:(id)a4 cumulativeError:(int *)a5
{
  uint64_t v8 = [a4 objectForKeyedSubscript:@"classifier"];
  if (v8)
  {
    id v10 = (id)v8;
    if ([(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v8 withName:@"classifier" cumulativeError:a5])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      id v9 = v10;
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"maskGatingThreshold" value:&a3->var14.var1.var1 mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"maximumFaceRectangleThreshold" value:&a3->var14.var1.var2 mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"minimumFaceRectangleThreshold" value:&a3->var14.var1.var3 mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"centerRadiusThreshold" value:&a3->var14.var1.var4 mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"centerRadiusScale" value:&a3->var14.var1.var5 mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"centerMaskThreshold" value:&a3->var14.var2 mandatory:0 cumulativeError:a5];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)extractContentPreservingWarpingOptions:(id *)a3 parentEntry:(id)a4 cumulativeError:(int *)a5
{
  uint64_t v8 = [a4 objectForKeyedSubscript:@"contentPreservingWarping"];
  if (v8)
  {
    id v10 = (id)v8;
    if ([(IntelligentDistortionCorrection_Utilities *)self testDictionaryObject:v8 withName:@"contentPreservingWarping" cumulativeError:a5])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      id v9 = v10;
      [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"esWeight1" value:&a3->var21[1].var0[4] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"esWeight2" value:&a3->var21[1].var0[5] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"edWeight" value:&a3->var21[1].var0[6] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractFloat:v9 name:@"elWeight" value:&a3->var21[2] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"pareDownConstant" value:&a3->var21[2].var0[1] mandatory:0 cumulativeError:a5];
      [(IntelligentDistortionCorrection_Utilities *)self extractUint:v9 name:@"segmentationMaskErosionRadius" value:&a3->var21[2].var0[2] mandatory:0 cumulativeError:a5];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)extractUint:(id)a3 name:(id)a4 value:(unsigned int *)a5 mandatory:(BOOL)a6 cumulativeError:(int *)a7
{
  BOOL v8 = a6;
  id v10 = [a3 objectForKeyedSubscript:a4];
  if (v10)
  {
    id v11 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *a5 = [v11 unsignedIntValue];
    }
    else {
      *a7 = -12784;
    }
    id v10 = v11;
  }
  else if (v8)
  {
    *a7 = -12784;
  }
}

- (int)extractFloat:(id)a3 name:(id)a4 value:(float *)a5 mandatory:(BOOL)a6 cumulativeError:(int *)a7
{
  BOOL v8 = a6;
  id v10 = [a3 objectForKeyedSubscript:a4];
  if (!v10)
  {
    int v11 = -12784;
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v11 = -12784;
LABEL_7:
    *a7 = -12784;
    goto LABEL_8;
  }
  [v10 floatValue];
  int v11 = 0;
  *(_DWORD *)a5 = v12;
LABEL_8:

  return v11;
}

- (int)warpAndOrUndistortPrimaryAsset:(id *)a3 inputImageTexture:(id)a4 inputMeshTexture:(id)a5 outputImageTexture:(id)a6 roiTracker:(id)a7 inputImageMetadataDictionary:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  [(IntelligentDistortionCorrection_Utilities *)self buildParameters:&self->_warpAndOrUndistortPrimaryAsset bundleConfiguration:a3];
  CGSize v19 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  v51.origin = (CGPoint)*MEMORY[0x263F001A0];
  v51.size = v19;
  v50.origin = v51.origin;
  v50.size = v19;
  FigCFDictionaryGetCGRectIfPresent();
  FigCFDictionaryGetCGRectIfPresent();
  if (!CGRectIsNull(v51) && !CGRectEqualToRect(v51, v50))
  {
    point.x = 0.0;
    point.y = 0.0;
    memset(v48, 0, sizeof(v48));
    -[IntelligentDistortionCorrection_Utilities getTransformFromRect:toRect:](self, "getTransformFromRect:toRect:", *(_OWORD *)&v50.origin, *(_OWORD *)&v50.size, *(_OWORD *)&v51.origin, *(_OWORD *)&v51.size);
    float v20 = [v18 objectForKeyedSubscript:*MEMORY[0x263F2D038]];

    CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v20, &point);
    unint64_t v21 = [v14 width];
    point.x = point.x / (float)v21;
    unint64_t v22 = [v14 height];
    point.y = point.y / (float)v22;
    CGFloat v23 = point.y * 0.0 + 0.0 * point.x + 0.0;
    float v24 = v23;
    *(float *)&self[1]._kernels.undistortBGRA = v24 * (float)(unint64_t)[v14 width];
    *(float *)&CGFloat v23 = v23;
    *((float *)&self[1]._kernels.undistortBGRA + 1) = *(float *)&v23
                                                    * (float)(unint64_t)[v14 height];
  }
  p_float var3 = &a3->var3;
  float32x2_t v26 = vld1_dup_f32(p_var3);
  *(float32x2_t *)&self->_warpAndOrUndistortPrimaryAsset.var0 = v26;
  self[1].super.isa = (Class)vcvt_f32_s32(*(int32x2_t *)&a3->var16.var1);
  if (v15)
  {
    uint64_t v27 = [v15 width];
    int var5 = a3->var16.var5;
    uint64_t v28 = [v15 height];
    v29.i64[0] = v27;
    v29.i64[1] = v28;
    v30.i64[0] = -1;
    v30.i64[1] = -1;
    v31.i32[0] = var5;
    v31.i32[1] = a3->var17.var0;
    self[1]._metalContext = (FigMetalContext *)vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v29, v30))), vcvt_f32_s32(vadd_s32(v31, (int32x2_t)-1)));
    BYTE1(self[1]._sharedMetalBuffer.offset) = 1;
  }
  self[1]._kernels.lumaCropAndDownscale4to1 = (MTLComputePipelineState *)vcvt_f32_u32(*(uint32x2_t *)&a3->var0);
  LOBYTE(self[1]._kernels.zeroBuffer1) = LOBYTE(a3->var2);
  LODWORD(self[2]._kernels.warpAndOrUndistortSecondaryAsset_R8Unorm) = [v16 width];
  HIDWORD(self[2]._kernels.warpAndOrUndistortSecondaryAsset_R8Unorm) = [v16 height];
  float v32 = [(FigMetalContext *)self->_metalContext commandQueue];
  int v33 = [v32 commandBuffer];

  if (!v33 || ([v33 computeCommandEncoder], (unsigned int v34 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v38 = -12786;
    goto LABEL_15;
  }
  unsigned int v35 = v34;
  [v34 setComputePipelineState:self->_kernels.fillRoiData];
  if (v17)
  {
    if (![v17 isCpuMaster])
    {
      id v37 = [v17 metalBuffer];
      objc_msgSend(v35, "setBuffer:offset:atIndex:", v37, objc_msgSend(v17, "metalBufferOffset"), 0);

      goto LABEL_14;
    }
    *(void *)&v48[0].x = [v17 getRoiData];
    v48[0].y = v36;
  }
  else
  {
    v48[0].x = 0.0;
    LODWORD(v48[0].y) = [v14 width] - 1;
    HIDWORD(v48[0].y) = [v14 height] - 1;
  }
  [v35 setBytes:v48 length:16 atIndex:0];
LABEL_14:
  [v35 setBuffer:self[2]._kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm offset:0 atIndex:1];
  int64x2_t v46 = vdupq_n_s64(1uLL);
  uint64_t v47 = 1;
  int64x2_t v44 = v46;
  uint64_t v45 = 1;
  [v35 dispatchThreads:&v46 threadsPerThreadgroup:&v44];
  [v35 setComputePipelineState:self->_kernels.warpAndOrUndistortPrimaryAsset2_YCbCr420];
  [v35 setImageblockWidth:32 height:32];
  [v35 setTexture:v14 atIndex:0];
  [v35 setTexture:v15 atIndex:1];
  [v35 setTexture:v16 atIndex:2];
  [v35 setBytes:&self->_warpAndOrUndistortPrimaryAsset length:240 atIndex:0];
  [v35 setBuffer:self[2]._kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm offset:0 atIndex:1];
  v43[0] = (unint64_t)[v16 width] >> 1;
  v43[1] = (unint64_t)[v16 height] >> 1;
  v43[2] = 1;
  int64x2_t v41 = vdupq_n_s64(0x10uLL);
  uint64_t v42 = 1;
  [v35 dispatchThreads:v43 threadsPerThreadgroup:&v41];
  [v35 endEncoding];
  [v33 commit];
  [v33 waitUntilCompleted];

  int v38 = 0;
LABEL_15:

  return v38;
}

- (int)warpAndOrUndistortSecondaryAsset:(id *)a3 inputImageTexture:(id)a4 inputMeshTexture:(id)a5 normalizedInputCrop:(CGRect)a6 primaryImageDimensions:(id)a7 inputHorizontalSecondaryToPrimaryScaleFactor:(float)a8 inputVerticalSecondaryToPrimaryScaleFactor:(float)a9 inputHorizontalSecondaryToPrimaryShift:(float)a10 inputVerticalSecondaryToPrimaryShift:(float)a11 outputImageTexture:(id)a12 outputHorizontalAdditionalScaleFactor:(float)a13 outputVerticalAdditionalScaleFactor:(float)a14 roiTracker:(id)a15 isDepthData:(BOOL)a16 commandBuffer:(id)a17 sensorInputCropRect:(id *)a18
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v27 = a4;
  id v48 = a5;
  id v28 = a12;
  id v29 = a17;
  if ([v27 pixelFormat] == 25
    || [v27 pixelFormat] == 10
    || [v27 pixelFormat] == 20)
  {
    uint64_t v30 = 48;
  }
  else
  {
    if ([v27 pixelFormat] != 65) {
      goto LABEL_19;
    }
    uint64_t v30 = 56;
  }
  id v31 = *(id *)((char *)&self->super.isa + v30);
  if (!v31)
  {
LABEL_19:
    fig_log_get_emitter();
    FigDebugAssert3();
    float v32 = 0;
LABEL_20:
    int v33 = 0;
LABEL_21:
    int v42 = -12786;
    goto LABEL_16;
  }
  float v32 = v31;
  if (!v29)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_20;
  }
  int v33 = [v29 computeCommandEncoder];
  if (!v33)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_21;
  }
  LOBYTE(self[1]._kernels.zeroBuffer1) = LOBYTE(a3->var2);
  float warpAndOrUndistortSecondaryAsset_R8Unorm_low = (float)LODWORD(self[2]._kernels.warpAndOrUndistortSecondaryAsset_R8Unorm);
  *(float *)&self[1]._kernels.zeroBuffer16 = warpAndOrUndistortSecondaryAsset_R8Unorm_low
                                           / (float)(unint64_t)[v28 width];
  float warpAndOrUndistortSecondaryAsset_R8Unorm_high = (float)HIDWORD(self[2]._kernels.warpAndOrUndistortSecondaryAsset_R8Unorm);
  *((float *)&self[1]._kernels.zeroBuffer16 + 1) = warpAndOrUndistortSecondaryAsset_R8Unorm_high
                                                 / (float)(unint64_t)[v28 height];
  self[1]._kernels.warpAndOrUndistortPrimaryAsset2_YCbCr420 = (MTLComputePipelineState *)__PAIR64__(LODWORD(a9), LODWORD(a8));
  self[1]._kernels.warpAndOrUndistortSecondaryAsset_R8Unorm = (MTLComputePipelineState *)__PAIR64__(LODWORD(a11), LODWORD(a10));
  if (a7.var0
    && a7.var1
    && (*(float *)&self[1]._kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm = (float)(unint64_t)[v27 width]
                                                                              / (float)a7.var0,
        *((float *)&self[1]._kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm + 1) = (float)(unint64_t)[v27 height]
                                                                                    / (float)a7.var1,
        LOBYTE(self[1]._kernels.undistortSingleChannel) = a16,
        (uint64_t v36 = [(MTLComputePipelineState *)self[2]._kernels.warpAndOrUndistortSecondaryAsset_RG8Unorm contents]) != 0))
  {
    uint64_t v37 = v36;
    lumaCropAndDownscale4to1 = self[1]._kernels.lumaCropAndDownscale4to1;
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    BOOL IsNull = CGRectIsNull(v51);
    if (!IsNull) {
      self[1]._kernels.lumaCropAndDownscale4to1 = (MTLComputePipelineState *)vcvt_f32_u32((uint32x2_t)self[2]._kernels.warpAndOrUndistortSecondaryAsset_R8Unorm);
    }
    [v33 setComputePipelineState:v32];
    [v33 setTexture:v27 atIndex:0];
    [v33 setTexture:v48 atIndex:1];
    [v33 setTexture:v28 atIndex:2];
    [v33 setBytes:&self->_warpAndOrUndistortPrimaryAsset length:240 atIndex:0];
    [v33 setBytes:v37 length:16 atIndex:1];
    unint64_t v40 = [v32 threadExecutionWidth];
    unint64_t v41 = [v32 maxTotalThreadsPerThreadgroup] / v40;
    v50[0] = (unint64_t)[v28 width] >> 1;
    v50[1] = (unint64_t)[v28 height] >> 1;
    v50[2] = 1;
    v49[0] = v40;
    v49[1] = v41;
    v49[2] = 1;
    [v33 dispatchThreads:v50 threadsPerThreadgroup:v49];
    [v33 endEncoding];
    if (IsNull)
    {
      int v42 = 0;
    }
    else
    {
      int v42 = 0;
      self[1]._kernels.lumaCropAndDownscale4to1 = lumaCropAndDownscale4to1;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
  }
LABEL_16:

  return v42;
}

- (int)undistortSingleChannelTexture:(id *)a3 inputTexture:(id)a4 outputTexture:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  memset(v28, 0, sizeof(v28));
  [(IntelligentDistortionCorrection_Utilities *)self buildParameters:v28 bundleConfiguration:a3];
  float var5 = (float)a3->var14.var3.var5;
  float v25 = var5 / (float)(unint64_t)[v8 width];
  float var0 = (float)a3->var15.var0.var0;
  unint64_t v12 = [v8 height];
  *(float *)&uint64_t v13 = v25;
  *((float *)&v13 + 1) = var0 / (float)v12;
  float32x2_t v14 = vcvt_f32_s32(*(int32x2_t *)&a3->var16.var1);
  *(void *)&v28[0] = v13;
  *((float32x2_t *)&v28[0] + 1) = v14;
  id v15 = [(FigMetalContext *)self->_metalContext commandQueue];
  id v16 = [v15 commandBuffer];

  if (v16 && ([v16 computeCommandEncoder], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v18 = (void *)v17;
    unint64_t v19 = [(MTLComputePipelineState *)self->_kernels.undistortSingleChannel threadExecutionWidth];
    unint64_t v20 = [(MTLComputePipelineState *)self->_kernels.undistortSingleChannel maxTotalThreadsPerThreadgroup];
    undistortSingleChannel = self->_kernels.undistortSingleChannel;
    unint64_t v22 = v20 / v19;
    [v18 setComputePipelineState:undistortSingleChannel];
    [v18 setTexture:v8 atIndex:0];
    [v18 setTexture:v9 atIndex:1];
    [v18 setBytes:v28 length:240 atIndex:0];
    v27[0] = (unint64_t)[v9 width] >> 1;
    v27[1] = (unint64_t)[v9 height] >> 1;
    v27[2] = 1;
    v26[0] = v19;
    v26[1] = v22;
    v26[2] = 1;
    [v18 dispatchThreads:v27 threadsPerThreadgroup:v26];
    [v18 endEncoding];
    [v16 commit];

    int v23 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v23 = -12786;
  }

  return v23;
}

- (int)undistortBGRATexture:(id *)a3 inputBGRATexture:(id)a4 intoOutputBGRA:(id)a5 encoder:(id)a6 crop:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  memset(v52, 0, sizeof(v52));
  [(IntelligentDistortionCorrection_Utilities *)self buildParameters:v52 bundleConfiguration:a3];
  float var5 = (float)a3->var14.var3.var5;
  float v49 = var5 / (float)(unint64_t)[v12 width];
  float var0 = (float)a3->var15.var0.var0;
  unint64_t v17 = [v12 height];
  *(float *)&uint64_t v18 = v49;
  *((float *)&v18 + 1) = var0 / (float)v17;
  float32x2_t v19 = vcvt_f32_s32(*(int32x2_t *)&a3->var16.var1);
  *(void *)&v52[0] = v18;
  *((float32x2_t *)&v52[0] + 1) = v19;
  unint64_t v20 = [(MTLComputePipelineState *)self->_kernels.undistortBGRA threadExecutionWidth];
  unint64_t v21 = [(MTLComputePipelineState *)self->_kernels.undistortBGRA maxTotalThreadsPerThreadgroup];
  undistortBGRA = self->_kernels.undistortBGRA;
  unint64_t v23 = v21 / v20;
  [v14 setComputePipelineState:undistortBGRA];
  [v14 setTexture:v12 atIndex:0];
  [v14 setTexture:v13 atIndex:1];
  [v14 setBytes:v52 length:240 atIndex:0];
  v51[0] = (unint64_t)[v13 width] >> 1;
  v51[1] = (unint64_t)[v13 height] >> 1;
  v51[2] = 1;
  v50[0] = v20;
  v50[1] = v23;
  v50[2] = 1;
  [v14 dispatchThreads:v51 threadsPerThreadgroup:v50];
  signed int v25 = a7->var0;
  signed int var1 = a7->var1;
  signed int var2 = a7->var2;
  signed int var3 = a7->var3;
  float32x2_t v28 = forwardDistort(a7->var0, var1, (float32x2_t *)v52);
  float v29 = fmaxf((float)v25, v28.f32[0]);
  float v30 = fmaxf((float)var1, v28.f32[1]);
  float32x2_t v31 = forwardDistort(v25, var3, (float32x2_t *)v52);
  float v32 = fmaxf(v29, v31.f32[0]);
  float v33 = fminf((float)var3, v31.f32[1]);
  float32x2_t v34 = forwardDistort(var2, var1, (float32x2_t *)v52);
  float v35 = fminf((float)var2, v34.f32[0]);
  float v36 = v34.f32[1];
  float32x2_t v37 = forwardDistort(var2, var3, (float32x2_t *)v52);
  float v38 = fminf(v35, v37.f32[0]);
  float v39 = v37.f32[1];
  unsigned int v40 = var1 + 1;
  if (var1 + 1 < var3)
  {
    do
    {
      float v32 = fmaxf(v32, forwardDistort(v25, v40, (float32x2_t *)v52).f32[0]);
      float v38 = fminf(v38, forwardDistort(var2, v40++, (float32x2_t *)v52).f32[0]);
    }
    while (var3 != v40);
  }
  float v41 = fmaxf(v30, v36);
  float v42 = fminf(v33, v39);
  signed int v43 = v25 + 1;
  if (v43 < var2)
  {
    do
    {
      float v41 = fmaxf(v41, COERCE_FLOAT(forwardDistort(v43, var1, (float32x2_t *)v52).i32[1]));
      float v42 = fminf(v42, COERCE_FLOAT(forwardDistort(v43++, var3, (float32x2_t *)v52).i32[1]));
    }
    while (var2 != v43);
  }
  int v44 = llroundf(v32);
  int v45 = llroundf(v41);
  a7->float var0 = v44;
  a7->signed int var1 = v45;
  int v46 = vcvtms_s32_f32(v38);
  int v47 = vcvtms_s32_f32(v42);
  a7->signed int var2 = v46;
  a7->signed int var3 = v47;
  a7->var4 = v46 - v44 + 1;
  a7->float var5 = v47 - v45 + 1;

  return 0;
}

- (int)computeMeshROI:(id *)a3 invertedMeshTexture:(id)a4 roiTracker:(id)a5
{
  p_signed int var1 = &a3->var16.var1;
  id v9 = a4;
  id v10 = a5;
  memset(v48, 0, sizeof(v48));
  [(IntelligentDistortionCorrection_Utilities *)self buildParameters:v48 bundleConfiguration:a3];
  int var5 = a3->var16.var5;
  uint64_t v11 = [v9 width];
  v12.i32[0] = var5;
  v12.i32[1] = a3->var17.var0;
  float32x2_t v13 = vcvt_f32_s32(vadd_s32(v12, (int32x2_t)-1));
  uint64_t v14 = [v9 height];
  v15.i64[0] = v11;
  v15.i64[1] = v14;
  v16.i64[0] = -1;
  v16.i64[1] = -1;
  *(float32x2_t *)v15.i8 = vdiv_f32(v13, vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v15, v16))));
  v16.i64[0] = *(void *)p_var1;
  *(void *)&long long v17 = *((void *)p_var1 + 1);
  float32x2_t v18 = vcvt_f32_s32(*(int32x2_t *)p_var1);
  uint64_t v44 = v16.i64[0];
  uint64_t v46 = v16.i64[0];
  v16.i64[1] = v16.i64[0];
  *(void *)&v48[0] = v15.i64[0];
  *((float32x2_t *)&v48[0] + 1) = v18;
  int32x4_t v19 = vsubq_s32(*(int32x4_t *)&a3->var15.var0.var1, (int32x4_t)v16);
  int32x4_t v20 = vsubq_s32(*(int32x4_t *)(p_var1 + 6), (int32x4_t)v16);
  v47[0] = v19;
  v47[1] = v20;
  *((void *)&v17 + 1) = v17;
  long long v45 = v17;
  unint64_t v21 = [(FigMetalContext *)self->_metalContext commandQueue];
  unint64_t v22 = [v21 commandBuffer];

  if (v22 && ([v22 computeCommandEncoder], (unint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    float v24 = v23;
    [v23 setComputePipelineState:self->_kernels.fillROICollectionRecord];
    [v24 setBytes:&v44 length:32 atIndex:0];
    signed int v25 = [v10 metalBuffer];
    objc_msgSend(v24, "setBuffer:offset:atIndex:", v25, objc_msgSend(v10, "metalBufferOffset"), 1);

    int64x2_t v33 = vdupq_n_s64(1uLL);
    int64x2_t v42 = v33;
    uint64_t v43 = 1;
    int64x2_t v40 = v33;
    uint64_t v41 = 1;
    [v24 dispatchThreads:&v42 threadsPerThreadgroup:&v40];
    unint64_t v26 = [(MTLComputePipelineState *)self->_kernels.computeMeshROI threadExecutionWidth];
    unint64_t v27 = [(MTLComputePipelineState *)self->_kernels.computeMeshROI maxTotalThreadsPerThreadgroup]/ v26;
    [v24 setComputePipelineState:self->_kernels.computeMeshROI];
    [v24 setTexture:v9 atIndex:0];
    [v24 setBytes:v48 length:240 atIndex:0];
    [v24 setBytes:v47 length:32 atIndex:1];
    float32x2_t v28 = [v10 metalBuffer];
    objc_msgSend(v24, "setBuffer:offset:atIndex:", v28, objc_msgSend(v10, "metalBufferOffset"), 2);

    v39[0] = [v9 width] - 1;
    v39[1] = [v9 height] - 1;
    v39[2] = 1;
    v38[0] = v26;
    v38[1] = v27;
    v38[2] = 1;
    [v24 dispatchThreads:v39 threadsPerThreadgroup:v38];
    [v24 setComputePipelineState:self->_kernels.adjustROI];
    [v24 setBytes:v48 length:240 atIndex:0];
    float v29 = [v10 metalBuffer];
    objc_msgSend(v24, "setBuffer:offset:atIndex:", v29, objc_msgSend(v10, "metalBufferOffset"), 1);

    int64x2_t v36 = v33;
    uint64_t v37 = 1;
    int64x2_t v34 = v33;
    uint64_t v35 = 1;
    [v24 dispatchThreads:&v36 threadsPerThreadgroup:&v34];
    [v24 endEncoding];
    [v22 commit];
    [v10 setIsCpuMaster:0];

    int v30 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v30 = -12786;
  }

  return v30;
}

- (void)buildParameters:(id *)a3 bundleConfiguration:(id *)a4
{
  float32x2_t v4 = vcvt_f32_s32(*(int32x2_t *)&a4->var16.var5);
  *(void *)&a3->var3.signed int var2 = 0;
  *(float32x2_t *)&a3->var9 = vmla_f32(*(float32x2_t *)&a4->var5.var1, (float32x2_t)0x3F0000003F000000, v4);
  a3[1].var2.float var0 = *(float *)&a4->var4 * *(float *)&a4->var4;
  *(_OWORD *)&a3[1].var3.signed int var1 = *(_OWORD *)&a4->var6.var5;
  *(_OWORD *)&a3[1].var3.int var5 = *(_OWORD *)&a4->var12.var0;
  *(_OWORD *)&a3[1].var4.signed int var1 = *(_OWORD *)&a4->var5.var5;
  *(_OWORD *)&a3[1].var4.int var5 = *(_OWORD *)&a4->var6.var1;
  LOBYTE(a3[1].var7) = LOBYTE(a4->var12.var4);
  BYTE1(a3[1].var7) = 0;
  *(float *)&a3[1].var9 = (float)SLODWORD(a4->var17.var5) / (float)SLODWORD(a4->var17.var6);
  LOBYTE(a3[2].var4.var4) = a4->var14.var1.var0;
  long long v6 = *(_OWORD *)&a4->var13[4];
  long long v5 = *(_OWORD *)&a4->var14.var0.var2;
  *(_OWORD *)&a3[2].var3.float var0 = *(_OWORD *)a4->var13;
  *(_OWORD *)&a3[2].var3.var4 = v6;
  *(_OWORD *)&a3[2].var4.float var0 = v5;
  BYTE1(a3[2].var4.var4) = BYTE1(a4->var14.var1.var0);
}

- (int)gatherGatingStatistics:(id)a3 area:(id *)a4 center:(float)a5 radiusFromCenter:(id)a6 sharedMetalBuffer:(unint64_t)a7 sharedMetalBufferoffset:(unsigned int *)a8 activePixelCount:(unsigned int *)a9 centerPixelCount:
{
  unsigned int v14 = v9;
  uint64_t v15 = *(void *)&a5;
  id v18 = a3;
  id v19 = a6;
  int32x4_t v20 = v19;
  long long v36 = 0u;
  long long v37 = 0u;
  if (!v18 || !v19 || !a8 || !a9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = -12780;
    goto LABEL_9;
  }
  *a8 = 0;
  *a9 = 0;
  long long v37 = *(_OWORD *)&a4->var0;
  *(void *)&long long v36 = v15;
  *((void *)&v36 + 1) = v14 | 0x800000000;
  unint64_t v21 = [(FigMetalContext *)self->_metalContext commandQueue];
  unint64_t v22 = [v21 commandBuffer];

  if (!v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_13:
    int v32 = -12786;
    goto LABEL_9;
  }
  uint64_t v23 = [v22 computeCommandEncoder];
  if (!v23)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_13;
  }
  float v24 = (void *)v23;
  int v25 = -[IntelligentDistortionCorrection_Utilities zeroMetalBuffer:range:commandEncoder:](self, "zeroMetalBuffer:range:commandEncoder:", v20, a7, 8, v23);
  if (v25)
  {
    int v32 = v25;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    unint64_t v26 = [(MTLComputePipelineState *)self->_kernels.gatherGatingStatistics threadExecutionWidth];
    unint64_t v27 = [(MTLComputePipelineState *)self->_kernels.gatherGatingStatistics maxTotalThreadsPerThreadgroup];
    gatherGatingStatistics = self->_kernels.gatherGatingStatistics;
    unint64_t v29 = v27 / v26;
    [v24 setComputePipelineState:gatherGatingStatistics];
    [v24 setTexture:v18 atIndex:0];
    [v24 setBuffer:v20 offset:a7 atIndex:0];
    [v24 setBytes:&v36 length:32 atIndex:1];
    int var5 = a4->var5;
    v35[0] = (uint64_t)(a4->var4 + (a4->var4 < 0 ? 7 : 0)) >> 3;
    v35[1] = (uint64_t)(var5 + (var5 < 0 ? 7 : 0)) >> 3;
    v35[2] = 1;
    v34[0] = v26;
    v34[1] = v29;
    v34[2] = 1;
    [v24 dispatchThreads:v35 threadsPerThreadgroup:v34];
    [v24 endEncoding];
    [v22 commit];
    [v22 waitUntilCompleted];
    uint64_t v31 = [v20 contents];
    *a8 = *(_DWORD *)(v31 + a7);
    *a9 = *(_DWORD *)(v31 + a7 + 4);

    int v32 = 0;
  }
LABEL_9:

  return v32;
}

- (int)erodeSegmentationMask:(id)a3 to:(id)a4 radius:(int)a5 commandEncoder:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10 && v11)
  {
    uint64_t v13 = [v10 width];
    uint64_t v14 = [v10 height];
    int v23 = a5;
    unint64_t v15 = [(MTLComputePipelineState *)self->_kernels.erodeSegmentationMask threadExecutionWidth];
    unint64_t v16 = [(MTLComputePipelineState *)self->_kernels.erodeSegmentationMask maxTotalThreadsPerThreadgroup];
    erodeSegmentationMask = self->_kernels.erodeSegmentationMask;
    unint64_t v18 = v16 / v15;
    [v12 setComputePipelineState:erodeSegmentationMask];
    [v12 setTexture:v10 atIndex:0];
    [v12 setTexture:v11 atIndex:1];
    [v12 setBytes:&v23 length:4 atIndex:0];
    v22[0] = v13;
    v22[1] = v14;
    v22[2] = 1;
    v21[0] = v15;
    v21[1] = v18;
    _WORD v21[2] = 1;
    [v12 dispatchThreads:v22 threadsPerThreadgroup:v21];
    int v19 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = -12780;
  }

  return v19;
}

- (int)dilateSegmentationMask:(id)a3 to:(id)a4 radius:(int)a5 commandEncoder:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10 && v11)
  {
    uint64_t v13 = [v10 width];
    uint64_t v14 = [v10 height];
    int v23 = a5;
    unint64_t v15 = [(MTLComputePipelineState *)self->_kernels.dilateSegmentationMask threadExecutionWidth];
    unint64_t v16 = [(MTLComputePipelineState *)self->_kernels.dilateSegmentationMask maxTotalThreadsPerThreadgroup];
    dilateSegmentationMask = self->_kernels.dilateSegmentationMask;
    unint64_t v18 = v16 / v15;
    [v12 setComputePipelineState:dilateSegmentationMask];
    [v12 setTexture:v10 atIndex:0];
    [v12 setTexture:v11 atIndex:1];
    [v12 setBytes:&v23 length:4 atIndex:0];
    v22[0] = v13;
    v22[1] = v14;
    v22[2] = 1;
    v21[0] = v15;
    v21[1] = v18;
    _WORD v21[2] = 1;
    [v12 dispatchThreads:v22 threadsPerThreadgroup:v21];
    int v19 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = -12780;
  }

  return v19;
}

- (CGAffineTransform)getTransformFromRect:(SEL)a3 toRect:(CGRect)a4
{
  *(float *)&unsigned int v6 = a4.origin.x;
  *(float *)&unsigned int v7 = a4.origin.y;
  *(float *)&unsigned int v8 = a4.size.width;
  float height = a4.size.height;
  *(float *)&unsigned int v10 = a5.origin.x;
  *(float *)&unsigned int v11 = a5.origin.y;
  float width = a5.size.width;
  float v13 = a5.size.height;
  v32.columns[0] = (simd_float3)v8;
  v32.columns[1].i32[0] = 0;
  v32.columns[1].i64[1] = 0;
  v32.columns[1].f32[1] = height;
  __asm { FMOV            V7.4S, #1.0 }
  v32.columns[2].i64[1] = _Q7.i64[1];
  v32.columns[2].i64[0] = __PAIR64__(v7, v6);
  float v19 = width;
  LODWORD(v20) = 0;
  *((float *)&v20 + 1) = v13;
  float32x4_t v25 = (float32x4_t)v20;
  _Q7.i64[0] = __PAIR64__(v11, v10);
  float32x4_t v26 = _Q7;
  float32x4_t v27 = (float32x4_t)LODWORD(v19);
  simd_float3x3 v33 = __invert_f3(v32);
  uint64_t v22 = 0;
  simd_float3x3 v28 = v33;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  do
  {
    *(long long *)((char *)&v29 + v22 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)&v28.columns[v22])), v25, *(float32x2_t *)v28.columns[v22].f32, 1), v26, (float32x4_t)v28.columns[v22], 2);
    ++v22;
  }
  while (v22 != 3);
  float32x2_t v23 = (float32x2_t)v31;
  float64x2_t v24 = vcvtq_f64_f32(*(float32x2_t *)&v30);
  *(float64x2_t *)&retstr->a = vcvtq_f64_f32(*(float32x2_t *)&v29);
  *(float64x2_t *)&retstr->c = v24;
  *(float64x2_t *)&retstr->tCGFloat x = vcvtq_f64_f32(v23);
  return result;
}

- (void).cxx_destruct
{
  sub_262F2744C((uint64_t)&self->_kernels);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end