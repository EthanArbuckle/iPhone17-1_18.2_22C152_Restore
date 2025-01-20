@interface PIPhotoGrain
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputAmount;
- (NSNumber)inputLevel;
- (NSNumber)inputPhase;
- (id)outputImage;
- (void)setInputAmount:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLevel:(id)a3;
- (void)setInputPhase:(id)a3;
@end

@implementation PIPhotoGrain

+ (id)customAttributes
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v22 = *MEMORY[0x1E4F1E1C0];
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v24[0] = v13;
  v23[1] = @"inputLevel";
  uint64_t v3 = *MEMORY[0x1E4F1E0E0];
  v18[0] = *MEMORY[0x1E4F1E0E8];
  uint64_t v2 = v18[0];
  v18[1] = v3;
  v21[0] = &unk_1F000A1E8;
  v21[1] = &unk_1F000A1F8;
  uint64_t v5 = *MEMORY[0x1E4F1E0F0];
  uint64_t v19 = *MEMORY[0x1E4F1E098];
  uint64_t v4 = v19;
  uint64_t v20 = v5;
  uint64_t v6 = *MEMORY[0x1E4F1E118];
  v21[2] = &unk_1F000A1E8;
  v21[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v18 count:4];
  v24[1] = v7;
  v23[2] = @"inputAmount";
  v16[0] = v2;
  v16[1] = v3;
  v17[0] = &unk_1F000A1E8;
  v17[1] = &unk_1F000A1F8;
  uint64_t v8 = *MEMORY[0x1E4F1E0C8];
  v16[2] = v4;
  v16[3] = v8;
  v17[2] = &unk_1F000A1F8;
  v17[3] = &unk_1F000A1E8;
  v16[4] = v5;
  v17[4] = *MEMORY[0x1E4F1E158];
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  v24[2] = v9;
  v23[3] = @"inputPhase";
  v14[0] = v2;
  v14[1] = v3;
  v15[0] = &unk_1F000A1E8;
  v15[1] = &unk_1F000A1F8;
  v14[2] = v4;
  v14[3] = v5;
  v15[2] = &unk_1F000A1F8;
  v15[3] = v6;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v24[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputPhase, 0);
  objc_storeStrong((id *)&self->_inputAmount, 0);
  objc_storeStrong((id *)&self->_inputLevel, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputPhase:(id)a3
{
}

- (NSNumber)inputPhase
{
  return self->_inputPhase;
}

- (void)setInputAmount:(id)a3
{
}

- (NSNumber)inputAmount
{
  return self->_inputAmount;
}

- (void)setInputLevel:(id)a3
{
}

- (NSNumber)inputLevel
{
  return self->_inputLevel;
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
  v24[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PIPhotoGrain *)self inputLevel];
  [v3 floatValue];
  float v5 = v4;

  float v6 = exp2f((float)(v5 * 10.0) + -3.0) * 100.0;
  v7 = [(PIPhotoGrain *)self inputAmount];
  [v7 floatValue];
  int v9 = v8;

  v10 = [(PIPhotoGrain *)self inputPhase];
  [v10 floatValue];
  int v12 = v11;

  v13 = [(PIPhotoGrain *)self inputImage];
  v23[0] = @"inputISO";
  *(float *)&double v14 = v6;
  v15 = [NSNumber numberWithFloat:v14];
  v24[0] = v15;
  v23[1] = @"inputAmount";
  LODWORD(v16) = v9;
  v17 = [NSNumber numberWithFloat:v16];
  v24[1] = v17;
  v23[2] = @"inputSeed";
  LODWORD(v18) = v12;
  uint64_t v19 = [NSNumber numberWithFloat:v18];
  v24[2] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v21 = [v13 imageByApplyingFilter:@"CIPhotoGrain" withInputParameters:v20];

  return v21;
}

@end