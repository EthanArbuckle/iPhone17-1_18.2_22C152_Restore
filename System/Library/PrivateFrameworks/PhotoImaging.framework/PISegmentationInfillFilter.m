@interface PISegmentationInfillFilter
+ (BOOL)isMLInpaintingAvailable;
+ (id)blackInfillImage:(id)a3 matte:(id)a4;
+ (id)fastInfillImage:(id)a3 matte:(id)a4;
+ (id)inpaintingInfillImage:(id)a3 matte:(id)a4;
+ (id)watchInfillImage:(id)a3 matte:(id)a4;
- (CIImage)inputImage;
- (CIImage)inputMatteImage;
- (id)outputImage;
- (int64_t)infillAlgorithm;
- (void)setInfillAlgorithm:(int64_t)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMatteImage:(id)a3;
@end

@implementation PISegmentationInfillFilter

+ (id)inpaintingInfillImage:(id)a3 matte:(id)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[PISegmentationHelper invertImage:a4];
  v7 = (void *)MEMORY[0x1E4F1E040];
  uint64_t v8 = *MEMORY[0x1E4F1E498];
  v13[0] = *MEMORY[0x1E4F1E480];
  v13[1] = v8;
  v14[0] = v5;
  v14[1] = v6;
  v13[2] = @"inputInpaintingMode";
  v14[2] = &unk_1F0009740;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v10 = [v7 filterWithName:@"CIInpaintingFilter" withInputParameters:v9];

  v11 = [v10 outputImage];

  return v11;
}

+ (id)watchInfillImage:(id)a3 matte:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1E018];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 context];
  memset(&v31, 0, sizeof(v31));
  [v7 extent];
  CGFloat v10 = 1024.0 / v9;
  [v7 extent];
  CGAffineTransformMakeScale(&v31, v10, 1024.0 / v11);
  memset(&v30, 0, sizeof(v30));
  [v7 extent];
  CGFloat v13 = v12 * 0.0009765625;
  [v7 extent];
  CGAffineTransformMakeScale(&v30, v13, v14 * 0.0009765625);
  memset(&v29, 0, sizeof(v29));
  [v6 extent];
  CGFloat v16 = 1024.0 / v15;
  [v6 extent];
  CGAffineTransformMakeScale(&v29, v16, 1024.0 / v17);
  CGAffineTransform v28 = v31;
  v18 = [v7 imageByApplyingTransform:&v28 highQualityDownsample:1];
  CGAffineTransform v28 = v29;
  v19 = [v6 imageByApplyingTransform:&v28 highQualityDownsample:1];
  [v18 extent];
  v20 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v18);
  [v19 extent];
  v21 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v19);
  v22 = +[PIRepairUtilities newWatchInfillFromImage:v20 mask:v21];
  v23 = [MEMORY[0x1E4F1E050] imageWithCGImage:v22];
  CGImageRelease(v20);
  CGImageRelease(v21);
  CGImageRelease(v22);
  CGAffineTransform v28 = v30;
  v24 = [v23 imageByApplyingTransform:&v28 highQualityDownsample:1];
  v25 = +[PISegmentationHelper foregroundForImage:v24 matte:v6];

  v26 = [v25 imageByCompositingOverImage:v7];

  return v26;
}

+ (id)fastInfillImage:(id)a3 matte:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1E040];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 blendWithRedMaskFilter];
  [v8 setBackgroundImage:0];
  [v8 setInputImage:v7];
  double v9 = +[PISegmentationHelper invertImage:v6];

  [v8 setMaskImage:v9];
  CGFloat v10 = [v8 outputImage];
  [v7 extent];
  double v11 = objc_msgSend(v10, "imageByCroppingToRect:");

  [v7 extent];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v23[0] = v11;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v21 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PISegmentationInwardFillProcessor, "applyWithExtent:inputs:arguments:error:", v20, MEMORY[0x1E4F1CC08], 0, v13, v15, v17, v19);

  return v21;
}

+ (id)blackInfillImage:(id)a3 matte:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1E040];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 blendWithMaskFilter];
  double v9 = (void *)MEMORY[0x1E4F1E050];
  CGFloat v10 = [MEMORY[0x1E4F1E008] blackColor];
  double v11 = [v9 imageWithColor:v10];
  [v8 setBackgroundImage:v11];

  [v8 setInputImage:v7];
  double v12 = +[PISegmentationHelper invertImage:v6];

  [v8 setMaskImage:v12];
  double v13 = [v8 outputImage];
  [v7 extent];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  v22 = objc_msgSend(v13, "imageByCroppingToRect:", v15, v17, v19, v21);

  return v22;
}

+ (BOOL)isMLInpaintingAvailable
{
  if (isMLInpaintingAvailable_once != -1) {
    dispatch_once(&isMLInpaintingAvailable_once, &__block_literal_global_1151);
  }
  return isMLInpaintingAvailable_canUseMLInfill;
}

void __53__PISegmentationInfillFilter_isMLInpaintingAvailable__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  isMLInpaintingAvailable_canUseMLInfill = [v0 fileExistsAtPath:@"/System/Library/Frameworks/CoreImage.framework/inp_gen_eds2_00_q16.espresso.weights"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMatteImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputMatteImage:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return self->_inputMatteImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInfillAlgorithm:(int64_t)a3
{
  self->_infillAlgorithm = a3;
}

- (int64_t)infillAlgorithm
{
  return self->_infillAlgorithm;
}

- (id)outputImage
{
  v3 = [(PISegmentationInfillFilter *)self inputImage];
  uint64_t v4 = [(PISegmentationInfillFilter *)self inputMatteImage];
  id v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    int64_t v7 = [(PISegmentationInfillFilter *)self infillAlgorithm];
    uint64_t v8 = 5;
    if (v7) {
      uint64_t v8 = v7;
    }
    switch(v8)
    {
      case 2:
        id v9 = [(id)objc_opt_class() watchInfillImage:v3 matte:v5];
        break;
      case 3:
        id v9 = [(id)objc_opt_class() inpaintingInfillImage:v3 matte:v5];
        break;
      case 4:
        id v9 = [(id)objc_opt_class() fastInfillImage:v3 matte:v5];
        break;
      case 5:
        id v9 = v3;
        break;
      default:
        id v9 = [(id)objc_opt_class() blackInfillImage:v3 matte:v5];
        break;
    }
    id v6 = v9;
  }

  return v6;
}

@end