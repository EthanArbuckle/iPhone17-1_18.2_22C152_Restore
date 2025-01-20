@interface ConstraintsGenerator
- (ConstraintsGenerator)initWithMetalContext:(id)a3;
- (int)encodeToCommandBuffer:(id)a3 segmentationTexture:(id)a4 constraintsTexture:(id)a5 config:(id *)a6;
- (int)prepareForConfiguration:(id *)a3;
- (unint64_t)preallocatedSize;
@end

@implementation ConstraintsGenerator

- (ConstraintsGenerator)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ConstraintsGenerator;
  v6 = [(ConstraintsGenerator *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    uint64_t v10 = objc_msgSend_device(v5, v8, v9);
    device = v7->_device;
    v7->_device = (MTLDevice *)v10;

    uint64_t v13 = objc_msgSend_computePipelineStateFor_constants_(v7->_metalContext, v12, @"assembleConstraints", 0);
    assembleConstraintsKernel = v7->_assembleConstraintsKernel;
    v7->_assembleConstraintsKernel = (MTLComputePipelineState *)v13;

    v15 = v7;
    if (!v7->_assembleConstraintsKernel)
    {
      FigDebugAssert3();
      v15 = 0;
    }
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int)encodeToCommandBuffer:(id)a3 segmentationTexture:(id)a4 constraintsTexture:(id)a5 config:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  $59A3B6B04E0981876919D5DFF5962A90 v53 = *a6;
  int v14 = objc_msgSend_prepareForConfiguration_(self, v13, (uint64_t)&v53);
  if (v14)
  {
    int v49 = v14;
    FigDebugAssert3();
  }
  else
  {
    uint64_t v17 = objc_msgSend_width(v12, v15, v16);
    if (v17 == objc_msgSend_width(v11, v18, v19)
      && (uint64_t v22 = objc_msgSend_height(v12, v20, v21), v22 == objc_msgSend_height(v11, v23, v24)))
    {
      objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(self->_fgThresholdFilter, v25, (uint64_t)v10, v11, self->_tmpSegmentation);
      objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(self->_erosionFilter, v26, (uint64_t)v10, self->_tmpSegmentation, self->_fgErodedSegmentation);
      objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(self->_bgThresholdFilter, v27, (uint64_t)v10, v11, self->_tmpSegmentation);
      objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(self->_erosionFilter, v28, (uint64_t)v10, self->_tmpSegmentation, self->_bgErodedSegmentation);
      v31 = objc_msgSend_computeCommandEncoder(v10, v29, v30);
      objc_msgSend_setComputePipelineState_(v31, v32, (uint64_t)self->_assembleConstraintsKernel);
      objc_msgSend_setTexture_atIndex_(v31, v33, (uint64_t)self->_fgErodedSegmentation, 0);
      objc_msgSend_setTexture_atIndex_(v31, v34, (uint64_t)self->_bgErodedSegmentation, 1);
      objc_msgSend_setTexture_atIndex_(v31, v35, (uint64_t)v12, 2);
      unint64_t v38 = objc_msgSend_threadExecutionWidth(self->_assembleConstraintsKernel, v36, v37);
      unint64_t v41 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_assembleConstraintsKernel, v39, v40) / v38;
      v52[0] = objc_msgSend_width(v12, v42, v43);
      v52[1] = objc_msgSend_height(v12, v44, v45);
      v52[2] = 1;
      v51[0] = v38;
      v51[1] = v41;
      v51[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v31, v46, (uint64_t)v52, v51);
      objc_msgSend_endEncoding(v31, v47, v48);

      int v49 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v49 = -12780;
    }
  }

  return v49;
}

- (int)prepareForConfiguration:(id *)a3
{
  id v5 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, 10, a3->var0, a3->var1, 0);
  objc_msgSend_setUsage_(v5, v6, 3);
  fgErodedSegmentation = self->_fgErodedSegmentation;
  if (!fgErodedSegmentation
    || objc_msgSend_width(fgErodedSegmentation, v7, v8) != a3->var0
    || objc_msgSend_height(self->_fgErodedSegmentation, v7, v10) != a3->var1)
  {
    id v12 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(self->_device, v7, (uint64_t)v5);
    uint64_t v13 = self->_fgErodedSegmentation;
    self->_fgErodedSegmentation = v12;
  }
  if (!self->_fgErodedSegmentation) {
    goto LABEL_31;
  }
  bgErodedSegmentation = self->_bgErodedSegmentation;
  if (!bgErodedSegmentation
    || objc_msgSend_width(bgErodedSegmentation, v7, v11) != a3->var0
    || objc_msgSend_height(self->_bgErodedSegmentation, v7, v15) != a3->var1)
  {
    uint64_t v17 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(self->_device, v7, (uint64_t)v5);
    objc_super v18 = self->_bgErodedSegmentation;
    self->_bgErodedSegmentation = v17;
  }
  if (!self->_bgErodedSegmentation) {
    goto LABEL_31;
  }
  tmpSegmentation = self->_tmpSegmentation;
  if (!tmpSegmentation
    || objc_msgSend_width(tmpSegmentation, v7, v16) != a3->var0
    || objc_msgSend_height(self->_tmpSegmentation, v7, v20) != a3->var1)
  {
    uint64_t v22 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(self->_device, v7, (uint64_t)v5);
    v23 = self->_tmpSegmentation;
    self->_tmpSegmentation = v22;
  }
  if (!self->_tmpSegmentation) {
    goto LABEL_31;
  }
  fgThresholdFilter = self->_fgThresholdFilter;
  if (!fgThresholdFilter || (objc_msgSend_thresholdValue(fgThresholdFilter, v7, v21), v27 != a3->var2))
  {
    id v28 = objc_alloc(MEMORY[0x263F132F0]);
    *(float *)&double v29 = a3->var2;
    LODWORD(v30) = 1.0;
    v32 = (MPSImageThresholdBinary *)objc_msgSend_initWithDevice_thresholdValue_maximumValue_linearGrayColorTransform_(v28, v31, (uint64_t)self->_device, 0, v29, v30);
    v33 = self->_fgThresholdFilter;
    self->_fgThresholdFilter = v32;
  }
  if (!self->_fgThresholdFilter) {
    goto LABEL_31;
  }
  bgThresholdFilter = self->_bgThresholdFilter;
  if (!bgThresholdFilter || (objc_msgSend_thresholdValue(bgThresholdFilter, v25, v26), v37 != a3->var3))
  {
    id v38 = objc_alloc(MEMORY[0x263F132F8]);
    *(float *)&double v39 = a3->var3;
    LODWORD(v40) = 1.0;
    v42 = (MPSImageThresholdBinaryInverse *)objc_msgSend_initWithDevice_thresholdValue_maximumValue_linearGrayColorTransform_(v38, v41, (uint64_t)self->_device, 0, v39, v40);
    uint64_t v43 = self->_bgThresholdFilter;
    self->_bgThresholdFilter = v42;
  }
  if (!self->_bgThresholdFilter) {
    goto LABEL_31;
  }
  erosionFilter = self->_erosionFilter;
  if (!erosionFilter
    || objc_msgSend_kernelWidth(erosionFilter, v35, v36) != a3->var4
    || objc_msgSend_kernelHeight(self->_erosionFilter, v45, v46) != a3->var4)
  {
    id v49 = objc_alloc(MEMORY[0x263F13238]);
    v51 = (MPSImageAreaMin *)objc_msgSend_initWithDevice_kernelWidth_kernelHeight_(v49, v50, (uint64_t)self->_device, a3->var4, a3->var4);
    v52 = self->_erosionFilter;
    self->_erosionFilter = v51;

    objc_msgSend_setEdgeMode_(self->_erosionFilter, v53, 0);
  }
  if (self->_erosionFilter)
  {
    uint64_t v54 = objc_msgSend_allocatedSize(self->_fgErodedSegmentation, v47, v48);
    uint64_t v57 = objc_msgSend_allocatedSize(self->_bgErodedSegmentation, v55, v56) + v54;
    int v60 = 0;
    self->_preallocatedSize = v57 + objc_msgSend_allocatedSize(self->_tmpSegmentation, v58, v59);
  }
  else
  {
LABEL_31:
    FigDebugAssert3();
    int v60 = -12786;
  }

  return v60;
}

- (unint64_t)preallocatedSize
{
  return self->_preallocatedSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_assembleConstraintsKernel, 0);
  objc_storeStrong((id *)&self->_erosionFilter, 0);
  objc_storeStrong((id *)&self->_bgThresholdFilter, 0);
  objc_storeStrong((id *)&self->_fgThresholdFilter, 0);
  objc_storeStrong((id *)&self->_bgErodedSegmentation, 0);
  objc_storeStrong((id *)&self->_fgErodedSegmentation, 0);
  objc_storeStrong((id *)&self->_tmpSegmentation, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end