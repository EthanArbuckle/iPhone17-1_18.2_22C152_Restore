@interface PIRedEye
- (CIImage)inputDestinationImage;
- (CIImage)inputImage;
- (NSArray)inputCorrectionInfo;
- (NSString)inputCameraModel;
- (id)outputImage;
- (void)setInputCameraModel:(id)a3;
- (void)setInputCorrectionInfo:(id)a3;
- (void)setInputDestinationImage:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation PIRedEye

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputCameraModel, 0);
  objc_storeStrong((id *)&self->_inputCorrectionInfo, 0);
  objc_storeStrong((id *)&self->_inputDestinationImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputCameraModel:(id)a3
{
}

- (NSString)inputCameraModel
{
  return self->_inputCameraModel;
}

- (void)setInputCorrectionInfo:(id)a3
{
}

- (NSArray)inputCorrectionInfo
{
  return self->_inputCorrectionInfo;
}

- (void)setInputDestinationImage:(id)a3
{
}

- (CIImage)inputDestinationImage
{
  return self->_inputDestinationImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (id)outputImage
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v3 = self->_inputImage;
  v4 = v3;
  inputDestinationImage = self->_inputDestinationImage;
  if (!inputDestinationImage) {
    inputDestinationImage = v3;
  }
  v6 = inputDestinationImage;
  v7 = v6;
  if (v4) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8
    && (inputCorrectionInfo = self->_inputCorrectionInfo) != 0
    && [(NSArray *)inputCorrectionInfo count])
  {
    [v4 extent];
    CGFloat v11 = v10;
    *(double *)&rect[1] = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v7 extent];
    CGFloat v19 = v18;
    *(double *)rect = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    inputCameraModel = (__CFString *)self->_inputCameraModel;
    if (!inputCameraModel) {
      inputCameraModel = &stru_1EFFD8610;
    }
    rect[2] = inputCameraModel;
    v57.origin.x = v19;
    v57.origin.y = v21;
    v57.size.width = v23;
    v57.size.height = v25;
    double Width = CGRectGetWidth(v57);
    v58.origin.x = v11;
    v58.origin.y = v13;
    v58.size.width = v15;
    v58.size.height = v17;
    double v28 = Width / CGRectGetWidth(v58);
    *(void *)&v59.origin.x = rect[0];
    v59.origin.y = v21;
    v59.size.width = v23;
    v59.size.height = v25;
    double Height = CGRectGetHeight(v59);
    *(void *)&v60.origin.x = rect[1];
    v60.origin.y = v13;
    v60.size.width = v15;
    v60.size.height = v17;
    double v30 = Height / CGRectGetHeight(v60);
    if (v28 <= v30) {
      double v31 = v30;
    }
    else {
      double v31 = v28;
    }
    *(_OWORD *)&rect[3] = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    rect[1] = self->_inputCorrectionInfo;
    uint64_t v32 = [(id)rect[1] countByEnumeratingWithState:&rect[3] objects:v54 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v47;
      do
      {
        uint64_t v35 = 0;
        v36 = v7;
        v37 = v4;
        do
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation((id)rect[1]);
          }
          uint64_t v38 = *(void *)(rect[4] + 8 * v35);
          v52[0] = @"inputCorrectionInfo";
          v52[1] = @"inputCameraModel";
          v53[0] = v38;
          v53[1] = rect[2];
          v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
          v40 = [v37 imageByApplyingFilter:@"CIRedEyeCorrection" withInputParameters:v39];

          v4 = [v40 imageByCompositingOverImage:v37];

          v50 = @"inputScale";
          v41 = [NSNumber numberWithDouble:v31];
          v51 = v41;
          v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          v43 = [v40 imageByApplyingFilter:@"CILanczosScaleTransform" withInputParameters:v42];

          v7 = [v43 imageByCompositingOverImage:v36];

          ++v35;
          v36 = v7;
          v37 = v4;
        }
        while (v33 != v35);
        uint64_t v33 = [(id)rect[1] countByEnumeratingWithState:&rect[3] objects:v54 count:16];
      }
      while (v33);
    }

    id v44 = v7;
  }
  else
  {
    id v44 = v7;
  }

  return v44;
}

@end