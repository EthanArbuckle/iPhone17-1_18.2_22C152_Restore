@interface _PIDynamicLocalLightMapPrepare
+ (id)customAttributes;
- (id)outputImage;
@end

@implementation _PIDynamicLocalLightMapPrepare

+ (id)customAttributes
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1B8];
  v23[0] = *MEMORY[0x1E4F1E188];
  v23[1] = v2;
  v23[2] = *MEMORY[0x1E4F1E170];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v25[0] = v3;
  v24[1] = @"inputLightMapWidth";
  uint64_t v5 = *MEMORY[0x1E4F1E098];
  v19[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v4 = v19[0];
  v19[1] = v5;
  v22[0] = &unk_1F000A4F8;
  v22[1] = &unk_1F000A4F8;
  uint64_t v7 = *MEMORY[0x1E4F1E118];
  uint64_t v8 = *MEMORY[0x1E4F1E090];
  uint64_t v20 = *MEMORY[0x1E4F1E0F0];
  uint64_t v6 = v20;
  uint64_t v21 = v8;
  v22[2] = v7;
  v22[3] = @"NSNumber";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v19 count:4];
  v25[1] = v9;
  v24[2] = @"inputLightMapHeight";
  v17[0] = v4;
  v17[1] = v5;
  v18[0] = &unk_1F000A4F8;
  v18[1] = &unk_1F000A4F8;
  v17[2] = v6;
  v17[3] = v8;
  v18[2] = v7;
  v18[3] = @"NSNumber";
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  v25[2] = v10;
  v24[3] = @"inputGuidedFilterEpsilon";
  v15[0] = v4;
  v15[1] = v5;
  v16[0] = &unk_1F000A4F8;
  v16[1] = &unk_1F000A508;
  uint64_t v11 = *MEMORY[0x1E4F1E158];
  v15[2] = v6;
  v15[3] = v8;
  v16[2] = v11;
  v16[3] = @"NSNumber";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v25[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputGuidedFilterEpsilon, 0);
  objc_storeStrong((id *)&self->inputGuideImage, 0);
  objc_storeStrong((id *)&self->inputLightMapHeight, 0);
  objc_storeStrong((id *)&self->inputLightMapWidth, 0);
  objc_storeStrong((id *)&self->inputLightMap, 0);
}

- (id)outputImage
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  inputLightMap = self->inputLightMap;
  if (inputLightMap)
  {
    inputLightMapWidth = self->inputLightMapWidth;
    inputLightMapHeight = self->inputLightMapHeight;
    uint64_t v6 = inputLightMap;
    uint64_t v7 = inputLightMapWidth;
    uint64_t v8 = inputLightMapHeight;
    v9 = [(NSData *)v6 length];
    if (v9)
    {
      uint64_t v10 = [(NSNumber *)v7 unsignedLongValue];
      uint64_t v11 = [(NSNumber *)v8 unsignedLongValue];
      if (v10) {
        BOOL v12 = v11 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        uint64_t v10 = vcvtmd_u64_f64(sqrt((double)(unint64_t)v9 * 0.5));
        uint64_t v13 = v10;
      }
      else
      {
        uint64_t v13 = v11;
      }
      if (v9 == (void *)(2 * v10 * v13))
      {
        v14 = (NSNumber *)*MEMORY[0x1E4F1E3D8];
        v65 = (void *)*MEMORY[0x1E4F1E3D0];
        v66 = v14;
        v67 = v6;
        v68 = @"CILocalLight";
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v65 count:2];
        id v16 = objc_alloc(MEMORY[0x1E4F1E050]);
        id v56 = (id)MEMORY[0x1E4F143A8];
        uint64_t v57 = 3221225472;
        v58 = ___lightMapImageFromData_block_invoke;
        v59 = &unk_1E5D80820;
        uint64_t v61 = v10;
        uint64_t v62 = v13;
        v60 = v6;
        v63 = v9;
        v9 = (void *)[v16 initWithImageProvider:&v56 width:v10 height:v13 format:*MEMORY[0x1E4F1E2D0] colorSpace:0 options:v15];
      }
      else
      {
        v9 = 0;
      }
    }

    inputGuideImage = self->inputGuideImage;
    if (inputGuideImage)
    {
      CGAffineTransformMakeScale(&v55, 0.5, 0.5);
      v18 = [(CIImage *)inputGuideImage imageByApplyingTransform:&v55];
      inputGuidedFilterEpsilon = self->inputGuidedFilterEpsilon;
      id v20 = v9;
      id v21 = v18;
      v22 = inputGuidedFilterEpsilon;
      id v23 = 0;
      if (v20 && v21)
      {
        [v20 extent];
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        [v21 extent];
        v73.origin.x = v32;
        v73.origin.y = v33;
        v73.size.width = v34;
        v73.size.height = v35;
        v71.origin.x = v25;
        v71.origin.y = v27;
        v71.size.width = v29;
        v71.size.height = v31;
        if (CGRectEqualToRect(v71, v73))
        {
          id v23 = v20;
        }
        else
        {
          [v20 extent];
          v74.origin.x = 0.0;
          v74.origin.y = 0.0;
          v74.size.width = 1.0;
          v74.size.height = 1.0;
          if (CGRectEqualToRect(v72, v74))
          {
            v36 = [v20 imageByClampingToExtent];
            [v21 extent];
            objc_msgSend(v36, "imageByCroppingToRect:");
            id v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v56 = v20;
            uint64_t v57 = (uint64_t)v21;
            v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:2];
            v37 = (void *)MEMORY[0x1E4F1E080];
            v38 = [v36 objectAtIndexedSubscript:0];
            [v38 extent];
            objc_msgSend(v37, "vectorWithCGRect:");
            v39 = (NSData *)objc_claimAutoreleasedReturnValue();
            v67 = v39;
            v40 = (void *)MEMORY[0x1E4F1E080];
            v41 = [v36 objectAtIndexedSubscript:1];
            [v41 extent];
            objc_msgSend(v40, "vectorWithCGRect:");
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v68 = v42;
            v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:2];

            [v21 extent];
            double v45 = v44;
            double v47 = v46;
            double v49 = v48;
            double v51 = v50;
            v64[0] = @"imageExtents";
            v64[1] = @"guidedFilterEpsilon";
            v65 = v43;
            v66 = v22;
            v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:v64 count:2];
            +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](_PIDynamicGuidedProcessorKernel, "applyWithExtent:inputs:arguments:error:", v36, v52, 0, v45, v47, v49, v51);
            id v23 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }

      CGAffineTransformMakeScale(&v54, 2.0, 2.0);
      v9 = [v23 imageByApplyingTransform:&v54];
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end