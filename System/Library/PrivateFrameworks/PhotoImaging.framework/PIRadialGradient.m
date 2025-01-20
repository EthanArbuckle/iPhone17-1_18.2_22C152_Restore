@interface PIRadialGradient
+ (id)customAttributes;
- (CIColor)inputColor0;
- (CIColor)inputColor1;
- (CIVector)inputCenter;
- (CIVector)inputPoint0;
- (CIVector)inputPoint1;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputColor0:(id)a3;
- (void)setInputColor1:(id)a3;
- (void)setInputPoint0:(id)a3;
- (void)setInputPoint1:(id)a3;
@end

@implementation PIRadialGradient

+ (id)customAttributes
{
  v32[6] = *MEMORY[0x1E4F143B8];
  v31[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1C8];
  v30[0] = *MEMORY[0x1E4F1E1A0];
  v30[1] = v2;
  v30[2] = *MEMORY[0x1E4F1E1B8];
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v32[0] = v19;
  v31[1] = *MEMORY[0x1E4F1E440];
  uint64_t v4 = *MEMORY[0x1E4F1E140];
  uint64_t v5 = *MEMORY[0x1E4F1E098];
  v28[0] = *MEMORY[0x1E4F1E0F0];
  uint64_t v3 = v28[0];
  v28[1] = v5;
  v29[0] = v4;
  v18 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0];
  v29[1] = v18;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  v32[1] = v17;
  v31[2] = @"inputPoint0";
  v26[1] = v5;
  v27[0] = v4;
  v26[0] = v3;
  v16 = [MEMORY[0x1E4F1E080] vectorWithX:50.0 Y:50.0];
  v27[1] = v16;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  v32[2] = v6;
  v31[3] = @"inputPoint1";
  v24[1] = v5;
  v25[0] = v4;
  v24[0] = v3;
  v7 = [MEMORY[0x1E4F1E080] vectorWithX:250.0 Y:250.0];
  v25[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v32[3] = v8;
  v31[4] = @"inputColor0";
  uint64_t v9 = *MEMORY[0x1E4F1E108];
  v22[1] = v5;
  v23[0] = v9;
  v22[0] = v3;
  v10 = [MEMORY[0x1E4F1E008] whiteColor];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v32[4] = v11;
  v31[5] = @"inputColor1";
  v20[1] = v5;
  v21[0] = v9;
  v20[0] = v3;
  v12 = [MEMORY[0x1E4F1E008] blackColor];
  v21[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v32[5] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:6];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputColor1, 0);
  objc_storeStrong((id *)&self->_inputColor0, 0);
  objc_storeStrong((id *)&self->_inputPoint1, 0);
  objc_storeStrong((id *)&self->_inputPoint0, 0);
  objc_storeStrong((id *)&self->_inputCenter, 0);
}

- (void)setInputColor1:(id)a3
{
}

- (CIColor)inputColor1
{
  return self->_inputColor1;
}

- (void)setInputColor0:(id)a3
{
}

- (CIColor)inputColor0
{
  return self->_inputColor0;
}

- (void)setInputPoint1:(id)a3
{
}

- (CIVector)inputPoint1
{
  return self->_inputPoint1;
}

- (void)setInputPoint0:(id)a3
{
}

- (CIVector)inputPoint0
{
  return self->_inputPoint0;
}

- (void)setInputCenter:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->_inputCenter;
}

- (id)outputImage
{
  v49[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PIRadialGradient *)self inputColor0];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1E008] whiteColor];
  }
  v6 = v5;

  v7 = [(PIRadialGradient *)self inputColor1];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1E008] blackColor];
  }
  v10 = v9;

  v11 = [(PIRadialGradient *)self inputCenter];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0];
  }
  v14 = v13;

  v15 = [(PIRadialGradient *)self inputPoint0];
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1E080] vectorWithX:50.0 Y:50.0];
  }
  v18 = v17;

  v19 = [(PIRadialGradient *)self inputPoint1];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [MEMORY[0x1E4F1E080] vectorWithX:250.0 Y:250.0];
  }
  v22 = v21;

  [v14 X];
  float64_t v46 = v23;
  [v14 Y];
  v24.f64[0] = v46;
  v24.f64[1] = v25;
  float64x2_t v47 = v24;
  [v18 X];
  float64_t v44 = v26;
  [v18 Y];
  v27.f64[0] = v44;
  v27.f64[1] = v28;
  float64x2_t v45 = v27;
  [v22 X];
  float64_t v43 = v29;
  [v22 Y];
  v30.f64[0] = v43;
  v30.f64[1] = v31;
  float64x2_t v32 = vsubq_f64(v45, v47);
  float64x2_t v33 = vsubq_f64(v30, v47);
  double v34 = sqrt(vaddvq_f64(vmulq_f64(v33, v33)));
  v35 = (void *)MEMORY[0x1E4F1E040];
  uint64_t v36 = *MEMORY[0x1E4F1E440];
  v49[0] = v14;
  v48[0] = v36;
  v48[1] = @"inputRadius0";
  v37 = objc_msgSend(NSNumber, "numberWithDouble:", sqrt(vaddvq_f64(vmulq_f64(v32, v32))));
  v49[1] = v37;
  v48[2] = @"inputRadius1";
  v38 = [NSNumber numberWithDouble:v34];
  v49[2] = v38;
  v49[3] = v6;
  v48[3] = @"inputColor0";
  v48[4] = @"inputColor1";
  v49[4] = v10;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:5];
  v40 = [v35 filterWithName:@"CIRadialGradient" withInputParameters:v39];

  v41 = [v40 outputImage];

  return v41;
}

@end