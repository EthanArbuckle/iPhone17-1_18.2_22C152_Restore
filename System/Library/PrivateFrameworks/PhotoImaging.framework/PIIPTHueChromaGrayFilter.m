@interface PIIPTHueChromaGrayFilter
+ (id)filterLumaKernel;
- (CIImage)inputImage;
- (NSNumber)inputChromaMax;
- (NSNumber)inputLumaRange;
- (NSNumber)inputLumaTarget;
- (id)outputImage;
- (void)setInputChromaMax:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLumaRange:(id)a3;
- (void)setInputLumaTarget:(id)a3;
@end

@implementation PIIPTHueChromaGrayFilter

+ (id)filterLumaKernel
{
  v2 = [a1 hueChromaKernels];
  v3 = [v2 objectForKeyedSubscript:@"ipt_hue_chroma_filter_luma"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputChromaMax, 0);
  objc_storeStrong((id *)&self->_inputLumaRange, 0);
  objc_storeStrong((id *)&self->_inputLumaTarget, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputChromaMax:(id)a3
{
}

- (NSNumber)inputChromaMax
{
  return self->_inputChromaMax;
}

- (void)setInputLumaRange:(id)a3
{
}

- (NSNumber)inputLumaRange
{
  return self->_inputLumaRange;
}

- (void)setInputLumaTarget:(id)a3
{
}

- (NSNumber)inputLumaTarget
{
  return self->_inputLumaTarget;
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
  v38[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PIIPTHueChromaGrayFilter *)self inputImage];

  if (v3)
  {
    uint64_t v4 = [(PIIPTHueChromaGrayFilter *)self inputLumaTarget];
    v5 = (void *)v4;
    v6 = &unk_1F000A198;
    if (v4) {
      v6 = (void *)v4;
    }
    id v7 = v6;

    uint64_t v8 = [(PIIPTHueChromaGrayFilter *)self inputLumaRange];
    v9 = (void *)v8;
    v10 = &unk_1F000A1A8;
    if (v8) {
      v10 = (void *)v8;
    }
    id v11 = v10;

    uint64_t v12 = [(PIIPTHueChromaGrayFilter *)self inputChromaMax];
    v13 = (void *)v12;
    v14 = &unk_1F000A188;
    if (v12) {
      v14 = (void *)v12;
    }
    id v15 = v14;

    v16 = (void *)MEMORY[0x1E4F1E080];
    [v7 doubleValue];
    double v18 = v17;

    [v11 doubleValue];
    double v20 = v19;

    [v15 doubleValue];
    double v22 = v21;

    v23 = [v16 vectorWithX:v18 Y:v20 Z:v22];
    v24 = [(id)objc_opt_class() filterLumaKernel];
    v25 = [(PIIPTHueChromaGrayFilter *)self inputImage];
    [v25 extent];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    v34 = [(PIIPTHueChromaGrayFilter *)self inputImage];
    v38[0] = v34;
    v38[1] = v23;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    v36 = objc_msgSend(v24, "applyWithExtent:arguments:", v35, v27, v29, v31, v33);
  }
  else
  {
    v36 = 0;
  }
  return v36;
}

@end