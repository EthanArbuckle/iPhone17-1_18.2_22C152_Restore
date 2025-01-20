@interface SDOFHighlightRecovery
- (CIImage)inputImage;
- (MTLComputePipelineState)inputCopyBackKernel;
- (MTLComputePipelineState)inputCopyKernel;
- (MTLComputePipelineState)inputDiffuseKernel;
- (MTLComputePipelineState)inputScanKernel;
- (NSData)inputDynamicParams;
- (NSDictionary)inputConstants;
- (NSNumber)inputIterations;
- (NSNumber)inputScale;
- (NSNumber)inputTileSize;
- (id)outputImage;
- (void)setInputConstants:(id)a3;
- (void)setInputCopyBackKernel:(id)a3;
- (void)setInputCopyKernel:(id)a3;
- (void)setInputDiffuseKernel:(id)a3;
- (void)setInputDynamicParams:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIterations:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputScanKernel:(id)a3;
- (void)setInputTileSize:(id)a3;
@end

@implementation SDOFHighlightRecovery

- (id)outputImage
{
  v83[8] = *MEMORY[0x263EF8340];
  if (!self->inputImage)
  {
    objc_msgSend_emptyImage(MEMORY[0x263F00650], a2, v2);
    v7 = (CIImage *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  float v4 = 1.0;
  if (!self->inputScale)
  {
    objc_msgSend_floatValue(0, a2, v2);
    float v4 = v5;
  }
  if (roundf(v4 * (float)(int)objc_msgSend_intValue(self->inputIterations, a2, v2)) == 0.0)
  {
    v7 = self->inputImage;
LABEL_7:
    v8 = v7;
    goto LABEL_13;
  }
  inputIterations = self->inputIterations;
  v82[0] = @"iterations";
  v82[1] = @"dynamicParams";
  inputDynamicParams = self->inputDynamicParams;
  v83[0] = inputIterations;
  v83[1] = inputDynamicParams;
  inputTileSize = self->inputTileSize;
  v82[2] = @"tileSize";
  v82[3] = @"scanKernel";
  inputScanKernel = self->inputScanKernel;
  v83[2] = inputTileSize;
  v83[3] = inputScanKernel;
  inputDiffuseKernel = self->inputDiffuseKernel;
  v82[4] = @"diffuseKernel";
  v82[5] = @"copyBackKernel";
  inputCopyBackKernel = self->inputCopyBackKernel;
  v83[4] = inputDiffuseKernel;
  v83[5] = inputCopyBackKernel;
  inputCopyKernel = self->inputCopyKernel;
  v82[6] = @"copyKernel";
  v82[7] = @"constants";
  inputConstants = self->inputConstants;
  v83[6] = inputCopyKernel;
  v83[7] = inputConstants;
  v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v83, v82, 8);
  v18 = self->inputImage;
  objc_msgSend_extent(v18, v19, v20);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  memset(&v80, 0, sizeof(v80));
  CGAffineTransformMakeScale(&v80, 1.0 / v4, 1.0 / v4);
  CGAffineTransform v79 = v80;
  v85.origin.x = v22;
  v85.origin.y = v24;
  v85.size.double width = v26;
  v85.size.double height = v28;
  CGRect v86 = CGRectApplyAffineTransform(v85, &v79);
  CGRect v87 = CGRectIntegral(v86);
  double width = v87.size.width;
  double height = v87.size.height;
  objc_msgSend_extent(v18, v31, v32, v87.origin.x, v87.origin.y);
  CGFloat v34 = width / v33;
  objc_msgSend_extent(v18, v35, v36);
  CGAffineTransformMakeScale(&v79, v34, height / v37);
  CGAffineTransform v80 = v79;
  if (v4 != 1.0)
  {
    v40 = objc_msgSend_imageByClampingToExtent(v18, v38, v39);

    CGAffineTransform v79 = v80;
    objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v40, v41, (uint64_t)&v79, 1);
    v18 = (CIImage *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v42, (uint64_t)v17);
    objc_msgSend_setObject_forKeyedSubscript_(v43, v44, (uint64_t)&unk_270E1F170, @"scale");
    v45 = NSNumber;
    objc_msgSend_floatValue(self->inputIterations, v46, v47);
    *(float *)&double v49 = v48 / v4;
    v52 = objc_msgSend_numberWithFloat_(v45, v50, v51, v49);
    objc_msgSend_setObject_forKeyedSubscript_(v43, v53, (uint64_t)v52, @"iterations");

    v17 = v43;
  }
  v54 = objc_msgSend_clearImage(MEMORY[0x263F00650], v38, v39);
  v56 = objc_msgSend_imageByInsertingIntermediate_(v54, v55, 0);

  objc_msgSend_extent(v18, v57, v58);
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  v81[0] = v18;
  v81[1] = v56;
  v68 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v67, (uint64_t)v81, 2);
  v70 = objc_msgSend_applyWithExtent_inputs_arguments_error_(HighlightRecoveryProcessor, v69, (uint64_t)v68, v17, 0, v60, v62, v64, v66);

  if (v4 != 1.0)
  {
    CGAffineTransformMakeScale(&v78, v4, v4);
    uint64_t v74 = objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v70, v73, (uint64_t)&v78, 1);

    v70 = (void *)v74;
  }
  objc_msgSend_extent(self->inputImage, v71, v72);
  v8 = objc_msgSend_imageByCroppingToRect_(v70, v75, v76);

LABEL_13:

  return v8;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputIterations
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputIterations:(id)a3
{
}

- (NSNumber)inputTileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputTileSize:(id)a3
{
}

- (NSData)inputDynamicParams
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputDynamicParams:(id)a3
{
}

- (MTLComputePipelineState)inputScanKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputScanKernel:(id)a3
{
}

- (MTLComputePipelineState)inputDiffuseKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputDiffuseKernel:(id)a3
{
}

- (MTLComputePipelineState)inputCopyBackKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputCopyBackKernel:(id)a3
{
}

- (MTLComputePipelineState)inputCopyKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputCopyKernel:(id)a3
{
}

- (NSDictionary)inputConstants
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputConstants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputConstants, 0);
  objc_storeStrong((id *)&self->inputCopyKernel, 0);
  objc_storeStrong((id *)&self->inputCopyBackKernel, 0);
  objc_storeStrong((id *)&self->inputDiffuseKernel, 0);
  objc_storeStrong((id *)&self->inputScanKernel, 0);
  objc_storeStrong((id *)&self->inputDynamicParams, 0);
  objc_storeStrong((id *)&self->inputTileSize, 0);
  objc_storeStrong((id *)&self->inputIterations, 0);
  objc_storeStrong((id *)&self->inputScale, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end