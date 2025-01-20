@interface PIIPTHueChromaColorFilter
+ (id)filterHueKernel;
- (CIImage)inputImage;
- (NSNumber)inputChromaMin;
- (NSNumber)inputHueIsNormalized;
- (NSNumber)inputHueRange;
- (NSNumber)inputHueTarget;
- (id)outputImage;
- (void)setInputChromaMin:(id)a3;
- (void)setInputHueIsNormalized:(id)a3;
- (void)setInputHueRange:(id)a3;
- (void)setInputHueTarget:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation PIIPTHueChromaColorFilter

+ (id)filterHueKernel
{
  v2 = [a1 hueChromaKernels];
  v3 = [v2 objectForKeyedSubscript:@"ipt_hue_chroma_filter_hue"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputHueIsNormalized, 0);
  objc_storeStrong((id *)&self->_inputChromaMin, 0);
  objc_storeStrong((id *)&self->_inputHueRange, 0);
  objc_storeStrong((id *)&self->_inputHueTarget, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputHueIsNormalized:(id)a3
{
}

- (NSNumber)inputHueIsNormalized
{
  return self->_inputHueIsNormalized;
}

- (void)setInputChromaMin:(id)a3
{
}

- (NSNumber)inputChromaMin
{
  return self->_inputChromaMin;
}

- (void)setInputHueRange:(id)a3
{
}

- (NSNumber)inputHueRange
{
  return self->_inputHueRange;
}

- (void)setInputHueTarget:(id)a3
{
}

- (NSNumber)inputHueTarget
{
  return self->_inputHueTarget;
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
  v41[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PIIPTHueChromaColorFilter *)self inputImage];

  if (v3)
  {
    uint64_t v4 = [(PIIPTHueChromaColorFilter *)self inputHueTarget];
    v5 = (void *)v4;
    if (v4) {
      v6 = (void *)v4;
    }
    else {
      v6 = &unk_1F000A178;
    }
    id v7 = v6;

    uint64_t v8 = [(PIIPTHueChromaColorFilter *)self inputHueRange];
    v9 = (void *)v8;
    v10 = &unk_1F000A188;
    if (v8) {
      v10 = (void *)v8;
    }
    id v11 = v10;

    uint64_t v12 = [(PIIPTHueChromaColorFilter *)self inputChromaMin];
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = &unk_1F000A178;
    }
    id v15 = v14;

    v16 = [(PIIPTHueChromaColorFilter *)self inputHueIsNormalized];
    int v17 = [v16 BOOLValue];

    if (v17) {
      double v18 = 1.0;
    }
    else {
      double v18 = 6.28318531;
    }
    v19 = (void *)MEMORY[0x1E4F1E080];
    [v7 doubleValue];
    double v21 = v20;
    [v11 doubleValue];
    double v23 = v22;

    [v15 doubleValue];
    double v25 = v24;

    v26 = [v19 vectorWithX:v21 Y:v23 Z:v18 W:v25];
    v27 = [(id)objc_opt_class() filterHueKernel];
    v28 = [(PIIPTHueChromaColorFilter *)self inputImage];
    [v28 extent];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = [(PIIPTHueChromaColorFilter *)self inputImage];
    v41[0] = v37;
    v41[1] = v26;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    v39 = objc_msgSend(v27, "applyWithExtent:arguments:", v38, v30, v32, v34, v36);
  }
  else
  {
    v39 = 0;
  }
  return v39;
}

@end