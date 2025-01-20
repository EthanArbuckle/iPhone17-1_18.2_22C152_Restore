@interface PILongExposureFusion
+ (BOOL)_debugDumpIntermediateImages;
+ (BOOL)debugDumpIntermediateImages;
+ (void)initialize;
+ (void)loadFusionTuningParameters;
- (CIImage)inputImage;
- (CIImage)inputMaskImage;
- (CIImage)inputStillImage;
- (CIVector)inputAlignmentExtent;
- (CIVector)inputAlignmentTransform;
- (NSNumber)inputRenderScale;
- (NSNumber)inputVideoScale;
- (id)_computeNCCMapFromImage:(id)a3 toImage:(id)a4 scale:(double)a5;
- (id)_fuseImage:(id)a3 withGuideImage:(id)a4 weightImage:(id)a5 maskImage:(id)a6;
- (id)_refineMaskImage:(id)a3 guideImage:(id)a4 scale:(double)a5;
- (id)alignImage:(__n128)a3 transform:(double)a4 extent:(double)a5;
- (id)outputImage;
- (void)setInputAlignmentExtent:(id)a3;
- (void)setInputAlignmentTransform:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMaskImage:(id)a3;
- (void)setInputRenderScale:(id)a3;
- (void)setInputStillImage:(id)a3;
- (void)setInputVideoScale:(id)a3;
@end

@implementation PILongExposureFusion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAlignmentTransform, 0);
  objc_storeStrong((id *)&self->_inputAlignmentExtent, 0);
  objc_storeStrong((id *)&self->_inputVideoScale, 0);
  objc_storeStrong((id *)&self->_inputRenderScale, 0);
  objc_storeStrong((id *)&self->_inputMaskImage, 0);
  objc_storeStrong((id *)&self->_inputStillImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputAlignmentTransform:(id)a3
{
}

- (CIVector)inputAlignmentTransform
{
  return self->_inputAlignmentTransform;
}

- (void)setInputAlignmentExtent:(id)a3
{
}

- (CIVector)inputAlignmentExtent
{
  return self->_inputAlignmentExtent;
}

- (void)setInputVideoScale:(id)a3
{
}

- (NSNumber)inputVideoScale
{
  return self->_inputVideoScale;
}

- (void)setInputRenderScale:(id)a3
{
}

- (NSNumber)inputRenderScale
{
  return self->_inputRenderScale;
}

- (void)setInputMaskImage:(id)a3
{
}

- (CIImage)inputMaskImage
{
  return self->_inputMaskImage;
}

- (void)setInputStillImage:(id)a3
{
}

- (CIImage)inputStillImage
{
  return self->_inputStillImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (id)_fuseImage:(id)a3 withGuideImage:(id)a4 weightImage:(id)a5 maskImage:(id)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[PIAutoLoopKernels blur7x7Kernel];
  [v11 extent];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [v11 imageByClampingToExtent];
  v39[0] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  v24 = objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_60, v23, v15, v17, v19, v21);

  v25 = [MEMORY[0x1E4F1E080] vectorWithX:*(float *)&kBlendMaskThreshold0 Y:*(float *)&kBlendMaskThreshold1];
  v26 = +[PIAutoLoopKernels fusionKernel];
  [v11 extent];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v38[0] = v12;
  v38[1] = v11;
  v38[2] = v24;
  v38[3] = v10;
  v38[4] = v9;
  v38[5] = v25;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:6];

  v36 = objc_msgSend(v26, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_62, v35, v28, v30, v32, v34);

  return v36;
}

double __72__PILongExposureFusion__fuseImage_withGuideImage_weightImage_maskImage___block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -3.0, -3.0);
  return result;
}

- (id)_refineMaskImage:(id)a3 guideImage:(id)a4 scale:(double)a5
{
  v34[4] = *MEMORY[0x1E4F143B8];
  CGFloat v6 = fmin(1.0 / (a5 * 8.0), 1.0);
  v7 = (void *)MEMORY[0x1E4F1E080];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 vectorWithX:v6 * 15.0 Y:v6 * 15.0];
  float v11 = v6;
  id v12 = [MEMORY[0x1E4F1E080] vectorWithX:(float)(-0.5 / (float)((float)(v11 * 7.0) * (float)(v11 * 7.0))) Y:-0.00499999989 Z:-49.9999962];
  [v9 extent];
  NUScaleRect();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, v6, v6);
  double v21 = [v9 imageByClampingToExtent];

  CGAffineTransform v32 = v33;
  v22 = [v21 imageByApplyingTransform:&v32 highQualityDownsample:1];

  v23 = [v8 imageByClampingToExtent];

  CGAffineTransform v32 = v33;
  v24 = [v23 imageByApplyingTransform:&v32 highQualityDownsample:1];

  v25 = +[PIAutoLoopKernels dynamismMapRefineKernel];
  v34[0] = v22;
  v34[1] = v24;
  v34[2] = v10;
  v34[3] = v12;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  double v27 = objc_msgSend(v25, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_58_21158, v26, v14, v16, v18, v20);

  CGAffineTransform v31 = v33;
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformInvert(&v32, &v31);
  double v28 = [v27 imageByClampingToExtent];
  CGAffineTransform v31 = v32;
  double v29 = [v28 imageByApplyingTransform:&v31 highQualityDownsample:1];

  return v29;
}

- (id)_computeNCCMapFromImage:(id)a3 toImage:(id)a4 scale:(double)a5
{
  v41[2] = *MEMORY[0x1E4F143B8];
  CGFloat v6 = fmin(1.0 / (a5 * 8.0), 1.0);
  id v7 = a4;
  id v8 = a3;
  [v8 extent];
  NUScaleRect();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeScale(&v38, v6, v6);
  double v17 = [v8 imageByClampingToExtent];

  CGAffineTransform v37 = v38;
  double v18 = [v17 imageByApplyingTransform:&v37 highQualityDownsample:1];

  double v19 = [v7 imageByClampingToExtent];

  CGAffineTransform v37 = v38;
  double v20 = [v19 imageByApplyingTransform:&v37 highQualityDownsample:1];

  double v21 = +[PIAutoLoopKernels nccKernel];
  v41[0] = v18;
  v41[1] = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  v23 = objc_msgSend(v21, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_54, v22, v10, v12, v14, v16);

  v24 = [MEMORY[0x1E4F1E080] vectorWithX:*(float *)&kNCCEdge0 Y:*(float *)&kNCCEdge1];
  v25 = +[PIAutoLoopKernels nccCoarseKernel];
  v40[0] = v23;
  v40[1] = v24;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  double v27 = objc_msgSend(v25, "applyWithExtent:arguments:", v26, v10, v12, v14, v16);

  switch(kNCCBlurHalfSize)
  {
    case 1:
      uint64_t v28 = +[PIAutoLoopKernels blur3x3Kernel];
      goto LABEL_7;
    case 2:
      uint64_t v28 = +[PIAutoLoopKernels blur5x5Kernel];
      goto LABEL_7;
    case 3:
      uint64_t v28 = +[PIAutoLoopKernels blur7x7Kernel];
LABEL_7:
      double v29 = (void *)v28;
      goto LABEL_9;
  }
  double v29 = 0;
LABEL_9:
  double v30 = [v27 imageByClampingToExtent];
  v39 = v30;
  CGAffineTransform v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  CGAffineTransform v32 = objc_msgSend(v29, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_56_21160, v31, v10, v12, v14, v16);

  CGAffineTransform v36 = v38;
  memset(&v37, 0, sizeof(v37));
  CGAffineTransformInvert(&v37, &v36);
  CGAffineTransform v33 = [v32 imageByClampingToExtent];
  CGAffineTransform v36 = v37;
  double v34 = [v33 imageByApplyingTransform:&v36 highQualityDownsample:1];

  return v34;
}

double __62__PILongExposureFusion__computeNCCMapFromImage_toImage_scale___block_invoke_2(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, (double)-kNCCBlurHalfSize, (double)-kNCCBlurHalfSize);
  return result;
}

double __62__PILongExposureFusion__computeNCCMapFromImage_toImage_scale___block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -3.0, -3.0);
  return result;
}

- (id)alignImage:(__n128)a3 transform:(double)a4 extent:(double)a5
{
  v28[3] = *MEMORY[0x1E4F143B8];
  v27[0] = 0x3FF0000000000000;
  v27[1] = 0;
  v27[2] = 0;
  v27[3] = 0x3FF0000000000000;
  *(double *)&v27[4] = -a4;
  *(double *)&v27[5] = -a5;
  double v12 = [a10 imageByApplyingTransform:v27 highQualityDownsample:1];
  double v13 = +[PIAutoLoopKernels homographyKernel];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __52__PILongExposureFusion_alignImage_transform_extent___block_invoke;
  v23[3] = &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  __n128 v24 = a1;
  __n128 v25 = a2;
  __n128 v26 = a3;
  double v14 = [MEMORY[0x1E4F1E080] vectorWithX:a1.n128_f32[0] Y:a2.n128_f32[0] Z:a3.n128_f32[0]];
  v28[0] = v14;
  double v15 = [MEMORY[0x1E4F1E080] vectorWithX:a1.n128_f32[1] Y:a2.n128_f32[1] Z:a3.n128_f32[1]];
  v28[1] = v15;
  double v16 = [MEMORY[0x1E4F1E080] vectorWithX:a1.n128_f32[2] Y:a2.n128_f32[2] Z:a3.n128_f32[2]];
  v28[2] = v16;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  double v18 = objc_msgSend(v13, "applyWithExtent:roiCallback:inputImage:arguments:", v23, v12, v17, 0.0, 0.0, a6, a7);

  return v18;
}

void __52__PILongExposureFusion_alignImage_transform_extent___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRectGetMinX(*(CGRect *)&a1);
  v8.origin.x = a1;
  v8.origin.y = a2;
  v8.size.width = a3;
  v8.size.height = a4;
  CGRectGetMaxY(v8);
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  CGRectGetMaxX(v9);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMaxY(v10);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetMinX(v11);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  CGRectGetMinY(v12);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetMaxX(v13);
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  CGRectGetMinY(v14);
}

- (id)outputImage
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v3 = [(PILongExposureFusion *)self inputImage];
  if (v3)
  {
    v4 = [(PILongExposureFusion *)self inputMaskImage];
    if (!v4)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
      }
      v40 = *MEMORY[0x1E4F7A760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Missing inputMaskImage", buf, 2u);
      }
      double v34 = 0;
      goto LABEL_61;
    }
    v5 = [(PILongExposureFusion *)self inputStillImage];
    if (!v5)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
      }
      v41 = *MEMORY[0x1E4F7A760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Missing inputStillImage", buf, 2u);
      }
      double v34 = 0;
      goto LABEL_60;
    }
    CGFloat v6 = [(PILongExposureFusion *)self inputRenderScale];
    id v7 = v6;
    if (!v6)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
      }
      v42 = *MEMORY[0x1E4F7A760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Missing inputRenderScale", buf, 2u);
      }
      double v34 = 0;
      goto LABEL_59;
    }
    [v6 doubleValue];
    double v9 = v8;
    CGRect v10 = [(PILongExposureFusion *)self inputVideoScale];
    CGRect v11 = v10;
    if (!v10)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
      }
      v43 = *MEMORY[0x1E4F7A760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Missing inputVideoScale", buf, 2u);
      }
      double v34 = 0;
      goto LABEL_58;
    }
    [v10 doubleValue];
    double v13 = v12;
    CGRect v14 = [(PILongExposureFusion *)self inputAlignmentExtent];
    double v15 = v14;
    if (v14)
    {
      if ([v14 count] == 4)
      {
        [v15 CGRectValue];
        double v16 = [(PILongExposureFusion *)self inputAlignmentTransform];
        double v17 = v16;
        if (v16)
        {
          if ([v16 count] == 9)
          {
            v54 = v15;
            v55 = v11;
            v56 = v7;
            uint64_t v18 = 0;
            uint64_t v19 = 0;
            long long v20 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
            *(_OWORD *)buf = *MEMORY[0x1E4F14998];
            long long v61 = v20;
            long long v62 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
            do
            {
              uint64_t v21 = 0;
              uint64_t v22 = v18;
              do
              {
                [v17 valueAtIndex:v22];
                *(float *)&double v23 = v23;
                *(_DWORD *)&buf[4 * v19 + v21] = LODWORD(v23);
                v21 += 16;
                ++v22;
              }
              while (v21 != 48);
              ++v19;
              v18 += 3;
            }
            while (v19 != 3);
            NUScaleRect();
            double v25 = v24;
            *(float *)&double v24 = v9;
            uint64_t v29 = -[PILongExposureFusion alignImage:transform:extent:](self, "alignImage:transform:extent:", v5, *(double *)buf, *(double *)&v61, COERCE_DOUBLE(vmul_n_f32(*(float32x2_t *)&v62, *(float *)&v24)), v25, v26, v27, v28);
            memset(&v59, 0, sizeof(v59));
            CGAffineTransformMakeScale(&v59, v9 / v13, v9 / v13);
            double v30 = [v3 imageByClampingToExtent];
            CGAffineTransform v63 = v59;
            CGAffineTransform v31 = [v30 imageByApplyingTransform:&v63 highQualityDownsample:1];

            uint64_t v32 = [(PILongExposureFusion *)self _computeNCCMapFromImage:v31 toImage:v29 scale:v9];
            CGAffineTransform v33 = [(PILongExposureFusion *)self _refineMaskImage:v4 guideImage:v3 scale:v9];
            CGAffineTransform v63 = v59;
            [v33 imageByApplyingTransform:&v63 highQualityDownsample:1];
            v57 = (void *)v29;
            v53 = v58 = (void *)v32;
            double v34 = -[PILongExposureFusion _fuseImage:withGuideImage:weightImage:maskImage:](self, "_fuseImage:withGuideImage:weightImage:maskImage:", v31, v29, v32);
            CGRect v11 = v55;
            id v7 = v56;
            double v15 = v54;
            if (+[PILongExposureFusion debugDumpIntermediateImages])
            {
              v50 = v33;
              v51 = v31;
              v52 = [MEMORY[0x1E4F28CB8] defaultManager];
              v35 = NURenderLogger_21172();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                v49 = [v52 currentDirectoryPath];
                LODWORD(v63.a) = 138412290;
                *(void *)((char *)&v63.a + 4) = v49;
                _os_log_debug_impl(&dword_1A9680000, v35, OS_LOG_TYPE_DEBUG, "Writing intermediate long exposure fusion images to : %@", (uint8_t *)&v63, 0xCu);
              }
              [v3 writeToTIFF:@"long-exp-input-image.tiff"];
              [v4 writeToTIFF:@"long-exp-mask-image.tiff"];
              [v5 writeToTIFF:@"long-exp-still-image.tiff"];
              [v34 extent];
              CGAffineTransform v36 = objc_msgSend(v57, "imageByCroppingToRect:");
              [v36 writeToTIFF:@"long-exp-guide-image.tiff"];

              [v34 extent];
              CGAffineTransform v37 = objc_msgSend(v58, "imageByCroppingToRect:");
              [v37 writeToTIFF:@"long-exp-ncc-map-image.tiff"];

              [v4 extent];
              CGAffineTransform v33 = v50;
              CGAffineTransform v38 = objc_msgSend(v50, "imageByCroppingToRect:");
              [v38 writeToTIFF:@"long-exp-refined-mask-image.tiff"];

              [v34 writeToTIFF:@"long-exp-fusion-image.tiff"];
              CGAffineTransform v31 = v51;
            }

            goto LABEL_56;
          }
          v46 = NURenderLogger_21172();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
LABEL_55:

            double v34 = 0;
LABEL_56:

            goto LABEL_57;
          }
          *(_WORD *)buf = 0;
          v47 = "Malformed inputAlignmentTransform vector";
        }
        else
        {
          v46 = NURenderLogger_21172();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            goto LABEL_55;
          }
          *(_WORD *)buf = 0;
          v47 = "Missing inputAlignmentTransform";
        }
        _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, v47, buf, 2u);
        goto LABEL_55;
      }
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
      }
      v44 = *MEMORY[0x1E4F7A760];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_ERROR))
      {
LABEL_51:
        double v34 = 0;
LABEL_57:

LABEL_58:
LABEL_59:

LABEL_60:
LABEL_61:

        goto LABEL_62;
      }
      *(_WORD *)buf = 0;
      v45 = "Malformed inputAlignmentExtent vector";
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
      }
      v44 = *MEMORY[0x1E4F7A760];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      *(_WORD *)buf = 0;
      v45 = "Missing inputAlignmentExtent";
    }
    _os_log_error_impl(&dword_1A9680000, v44, OS_LOG_TYPE_ERROR, v45, buf, 2u);
    goto LABEL_51;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
  }
  v39 = *MEMORY[0x1E4F7A760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Missing inputImage", buf, 2u);
  }
  double v34 = 0;
LABEL_62:

  return v34;
}

+ (BOOL)_debugDumpIntermediateImages
{
  v2 = [MEMORY[0x1E4F7A4A0] globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"PI_LONG_EXPOSURE_DUMP_INTERMEDIATES" defaultValue:&__block_literal_global_24_21211];

  return v3;
}

uint64_t __52__PILongExposureFusion__debugDumpIntermediateImages__block_invoke()
{
  return 0;
}

+ (BOOL)debugDumpIntermediateImages
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PILongExposureFusion_debugDumpIntermediateImages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (debugDumpIntermediateImages_onceToken != -1) {
    dispatch_once(&debugDumpIntermediateImages_onceToken, block);
  }
  return debugDumpIntermediateImages_s_debugDumpIntermediateImages;
}

uint64_t __51__PILongExposureFusion_debugDumpIntermediateImages__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _debugDumpIntermediateImages];
  debugDumpIntermediateImages_s_debugDumpIntermediateImages = result;
  return result;
}

+ (void)loadFusionTuningParameters
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F7A4A0] globalSettings];
  char v3 = [v2 stringSettingForKey:@"PI_LONG_EXPOSURE_FUSION_PARAMS" defaultValue:&__block_literal_global_21215];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
    }
    v5 = (os_log_t *)MEMORY[0x1E4F7A760];
    CGFloat v6 = *MEMORY[0x1E4F7A760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      *(void *)double v26 = v3;
      _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_INFO, "Loading long-exposure fusion tuning parameters from file: %@", (uint8_t *)&v25, 0xCu);
    }
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v3];
    double v8 = v7;
    if (v7)
    {
      double v9 = [v7 objectForKeyedSubscript:@"kNCCBlurHalfSize"];

      if (v9)
      {
        CGRect v10 = [v8 objectForKeyedSubscript:@"kNCCBlurHalfSize"];
        kNCCBlurHalfSize = [v10 intValue];
      }
      CGRect v11 = [v8 objectForKeyedSubscript:@"kNCCEdge0"];

      if (v11)
      {
        double v12 = [v8 objectForKeyedSubscript:@"kNCCEdge0"];
        [v12 floatValue];
        kNCCEdge0 = v13;
      }
      CGRect v14 = [v8 objectForKeyedSubscript:@"kNCCEdge1"];

      if (v14)
      {
        double v15 = [v8 objectForKeyedSubscript:@"kNCCEdge1"];
        [v15 floatValue];
        kNCCEdge1 = v16;
      }
      double v17 = [v8 objectForKeyedSubscript:@"kBlendMaskThreshold0"];

      if (v17)
      {
        uint64_t v18 = [v8 objectForKeyedSubscript:@"kBlendMaskThreshold0"];
        [v18 floatValue];
        kBlendMaskThreshold0 = v19;
      }
      long long v20 = [v8 objectForKeyedSubscript:@"kBlendMaskThreshold1"];

      if (v20)
      {
        uint64_t v21 = [v8 objectForKeyedSubscript:@"kBlendMaskThreshold1"];
        [v21 floatValue];
        kBlendMaskThreshold1 = v22;
      }
    }
    else
    {
      if (*v4 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
      }
      double v23 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Failed to load fusion tuning parameters.", (uint8_t *)&v25, 2u);
      }
    }
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_118_21164);
    }
    double v24 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      int v25 = 67110144;
      *(_DWORD *)double v26 = kNCCBlurHalfSize;
      *(_WORD *)&v26[4] = 2048;
      *(double *)&v26[6] = *(float *)&kNCCEdge0;
      __int16 v27 = 2048;
      double v28 = *(float *)&kNCCEdge1;
      __int16 v29 = 2048;
      double v30 = *(float *)&kBlendMaskThreshold0;
      __int16 v31 = 2048;
      double v32 = *(float *)&kBlendMaskThreshold1;
      _os_log_impl(&dword_1A9680000, v24, OS_LOG_TYPE_INFO, "Using fusion tuning parameters: {kNCCBlurHalfSize=%d, kNCCEdge0=%f, kNCCEdge1=%f, kBlendMaskThreshold0=%f, kBlendMaskThreshold1=%f}", (uint8_t *)&v25, 0x30u);
    }
  }
}

uint64_t __50__PILongExposureFusion_loadFusionTuningParameters__block_invoke()
{
  return 0;
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PILongExposureFusion_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_21239 != -1) {
    dispatch_once(&initialize_onceToken_21239, block);
  }
}

uint64_t __34__PILongExposureFusion_initialize__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadFusionTuningParameters];
}

@end