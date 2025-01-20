@interface PIApertureRedEyeFilter
- (id)outputImage;
@end

@implementation PIApertureRedEyeFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputSpots, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

- (id)outputImage
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v3 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC18]);
  [(CIImage *)self->inputImage extent];
  double v48 = v5;
  double v49 = v4;
  double v46 = v7;
  double v47 = v6;
  space = v3;
  v51 = self;
  v8 = [(CIImage *)self->inputImage imageByColorMatchingWorkingSpaceToColorSpace:v3];
  v9 = [v8 imageByClampingToExtent];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obj = v51->inputSpots;
  uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v10)
  {
    uint64_t v53 = *(void *)v62;
    uint64_t v11 = *MEMORY[0x1E4F1E440];
    uint64_t v12 = *MEMORY[0x1E4F1E4E0];
    while (2)
    {
      uint64_t v13 = 0;
      v14 = v9;
      do
      {
        if (*(void *)v62 != v53) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v61 + 1) + 8 * v13);
        v16 = [v15 objectForKey:v11];
        [v16 pointValue];
        double v18 = v17;
        double v20 = v19;

        v21 = [v15 objectForKey:v12];
        [v21 floatValue];
        float v23 = v22;

        v24 = [v15 objectForKey:@"inputSensitivity"];
        [v24 doubleValue];
        double v26 = v25;

        long long v59 = 0u;
        long long v60 = 0u;
        +[PIApertureRedEyeProcessorKernel ROIForCenterPoint:radius:](PIApertureRedEyeProcessorKernel, "ROIForCenterPoint:radius:", v18, v20, v23);
        v68[0] = @"ROI";
        v27 = (void *)MEMORY[0x1E4F1E080];
        long long v57 = v59;
        long long v58 = v60;
        NUPixelRectToCGRect();
        v28 = objc_msgSend(v27, "vectorWithCGRect:");
        v68[1] = @"Sensitivity";
        v69[0] = v28;
        v29 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(fmin(v26 * 0.1 + 0.5, 1.0), 0.0));
        v69[1] = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];

        long long v55 = v59;
        long long v56 = v60;
        NUPixelRectToCGRect();
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        v67 = v14;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
        id v54 = 0;
        v40 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PIApertureRedEyeProcessorKernel, "applyWithExtent:inputs:arguments:error:", v39, v30, &v54, v32, v34, v36, v38);
        id v41 = v54;

        if (!v40)
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_59);
          }
          v43 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v66 = v41;
            _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Failed to apply red eye repair. error: %{public}@", buf, 0xCu);
          }

          v42 = v51->inputImage;
          goto LABEL_15;
        }
        v9 = [v40 imageByCompositingOverImage:v14];

        ++v13;
        v14 = v9;
      }
      while (v10 != v13);
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v70 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v14 = objc_msgSend(v9, "imageByCroppingToRect:", v49, v48, v47, v46);

  v42 = [v14 imageByColorMatchingColorSpaceToWorkingSpace:space];
LABEL_15:
  v44 = v42;

  CGColorSpaceRelease(space);
  return v44;
}

@end