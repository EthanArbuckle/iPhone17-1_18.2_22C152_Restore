@interface GUBWBilateralConvolution
+ (id)BWBilateralKernels;
+ (id)bilateralLoop11Kernel;
+ (id)bilateralLoop2Kernel;
+ (id)bilateralLoop5Kernel;
- (CGRect)bilateralROI:(int64_t)a3 destRect:(CGRect)a4 userInfo:(id)a5;
- (CIImage)inputImage;
- (NSArray)inputPoints;
- (NSArray)inputWeights;
- (NSNumber)inputBorder;
- (NSNumber)inputEdgeDetail;
- (id)doBilateralLoop:(id)a3 points:(id)a4 weights:(id)a5 slope:(id)a6;
- (id)outputImage;
- (void)setInputBorder:(id)a3;
- (void)setInputEdgeDetail:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputPoints:(id)a3;
- (void)setInputWeights:(id)a3;
@end

@implementation GUBWBilateralConvolution

+ (id)bilateralLoop11Kernel
{
  v2 = [a1 BWBilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralLoop11"];

  return v3;
}

+ (id)bilateralLoop5Kernel
{
  v2 = [a1 BWBilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralLoop5"];

  return v3;
}

+ (id)bilateralLoop2Kernel
{
  v2 = [a1 BWBilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralLoop2"];

  return v3;
}

+ (id)BWBilateralKernels
{
  if (BWBilateralKernels_onceToken != -1) {
    dispatch_once(&BWBilateralKernels_onceToken, &__block_literal_global_118);
  }
  v2 = (void *)BWBilateralKernels_BWBilateralKernels;
  return v2;
}

uint64_t __46__GUBWBilateralConvolution_BWBilateralKernels__block_invoke()
{
  BWBilateralKernels_BWBilateralKernels = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:&cfstr_KernelVec4Bila];
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBorder, 0);
  objc_storeStrong((id *)&self->_inputEdgeDetail, 0);
  objc_storeStrong((id *)&self->_inputWeights, 0);
  objc_storeStrong((id *)&self->_inputPoints, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputBorder:(id)a3
{
}

- (NSNumber)inputBorder
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputEdgeDetail:(id)a3
{
}

- (NSNumber)inputEdgeDetail
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputWeights:(id)a3
{
}

- (NSArray)inputWeights
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputPoints:(id)a3
{
}

- (NSArray)inputPoints
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (id)outputImage
{
  NSUInteger v3 = [(NSArray *)self->_inputPoints count];
  NSUInteger v4 = [(NSArray *)self->_inputWeights count];
  if (v3) {
    BOOL v5 = v4 == v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    [(NSNumber *)self->_inputEdgeDetail floatValue];
    v8 = [NSNumber numberWithDouble:__exp10(v7 + -3.0) * -200.0];
    v9 = [MEMORY[0x1E4F1E078] samplerWithImage:self->_inputImage];
    v6 = [(GUBWBilateralConvolution *)self doBilateralLoop:v9 points:self->_inputPoints weights:self->_inputWeights slope:v8];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)doBilateralLoop:(id)a3 points:(id)a4 weights:(id)a5 slope:(id)a6
{
  v77[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [a4 count];
  v14 = NSNumber;
  [v12 doubleValue];
  double v16 = v15;

  v17 = [v14 numberWithDouble:-v16];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __65__GUBWBilateralConvolution_doBilateralLoop_points_weights_slope___block_invoke;
  v74[3] = &unk_1E5D7F6A8;
  v74[4] = self;
  v18 = (void *)MEMORY[0x1AD0F8FE0](v74);
  switch(v13)
  {
    case 11:
      v75[0] = v10;
      v75[1] = v17;
      v73 = v17;
      v28 = (void *)MEMORY[0x1E4F1E080];
      v71 = [v11 objectAtIndex:0];
      [v71 floatValue];
      double v30 = v29;
      v70 = [v11 objectAtIndex:1];
      [v70 floatValue];
      double v32 = v31;
      v69 = [v11 objectAtIndex:2];
      [v69 floatValue];
      double v34 = v33;
      v68 = [v11 objectAtIndex:3];
      [v68 floatValue];
      v36 = [v28 vectorWithX:v30 Y:v32 Z:v34 W:v35];
      v75[2] = v36;
      v37 = (void *)MEMORY[0x1E4F1E080];
      v38 = [v11 objectAtIndex:5];
      [v38 floatValue];
      double v40 = v39;
      [v11 objectAtIndex:6];
      v41 = v72 = v18;
      [v41 floatValue];
      double v43 = v42;
      v44 = [v11 objectAtIndex:7];
      [v44 floatValue];
      double v46 = v45;
      v47 = [v11 objectAtIndex:9];
      [v47 floatValue];
      v49 = [v37 vectorWithX:v40 Y:v43 Z:v46 W:v48];
      v75[3] = v49;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:4];

      v17 = v73;
      v18 = v72;

      uint64_t v27 = [(id)objc_opt_class() bilateralLoop11Kernel];
      goto LABEL_7;
    case 5:
      v76[0] = v10;
      v76[1] = v17;
      v50 = (void *)MEMORY[0x1E4F1E080];
      v51 = [v11 objectAtIndex:0];
      [v51 floatValue];
      double v53 = v52;
      v54 = [v11 objectAtIndex:1];
      [v54 floatValue];
      double v56 = v55;
      [v11 objectAtIndex:2];
      id v57 = v10;
      v59 = v58 = v18;
      [v59 floatValue];
      double v61 = v60;
      v62 = [v11 objectAtIndex:3];
      [v62 floatValue];
      v64 = [v50 vectorWithX:v53 Y:v56 Z:v61 W:v63];
      v76[2] = v64;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:3];

      v18 = v58;
      id v10 = v57;

      uint64_t v27 = [(id)objc_opt_class() bilateralLoop5Kernel];
      goto LABEL_7;
    case 2:
      v77[0] = v10;
      v77[1] = v17;
      v19 = (void *)MEMORY[0x1E4F1E080];
      v20 = [v11 objectAtIndex:0];
      [v20 floatValue];
      double v22 = v21;
      v23 = [v11 objectAtIndex:1];
      [v23 floatValue];
      v25 = [v19 vectorWithX:v22 Y:v24];
      v77[2] = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];

      uint64_t v27 = [(id)objc_opt_class() bilateralLoop2Kernel];
LABEL_7:
      v65 = (void *)v27;
      [v10 extent];
      v66 = objc_msgSend(v65, "applyWithExtent:roiCallback:arguments:", v18, v26);

      goto LABEL_9;
  }
  v26 = 0;
  v66 = 0;
LABEL_9:

  return v66;
}

uint64_t __65__GUBWBilateralConvolution_doBilateralLoop_points_weights_slope___block_invoke(uint64_t a1, int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "bilateralROI:destRect:userInfo:", a2, 0);
}

- (CGRect)bilateralROI:(int64_t)a3 destRect:(CGRect)a4 userInfo:(id)a5
{
  return CGRectInset(a4, -4.0, -4.0);
}

@end