@interface NUHDRApplyToneMapFilter
- (CIImage)inputImage;
- (NSNumber)inputSourceHeadroom;
- (NSNumber)inputTargetHeadroom;
- (NUColorSpace)inputColorSpace;
- (id)outputImage;
- (void)setInputColorSpace:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSourceHeadroom:(id)a3;
- (void)setInputTargetHeadroom:(id)a3;
@end

@implementation NUHDRApplyToneMapFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputColorSpace, 0);
  objc_storeStrong((id *)&self->_inputTargetHeadroom, 0);
  objc_storeStrong((id *)&self->_inputSourceHeadroom, 0);

  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputColorSpace:(id)a3
{
}

- (NUColorSpace)inputColorSpace
{
  return self->_inputColorSpace;
}

- (void)setInputTargetHeadroom:(id)a3
{
}

- (NSNumber)inputTargetHeadroom
{
  return self->_inputTargetHeadroom;
}

- (void)setInputSourceHeadroom:(id)a3
{
}

- (NSNumber)inputSourceHeadroom
{
  return self->_inputSourceHeadroom;
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
  v3 = [(NUHDRApplyToneMapFilter *)self inputImage];
  v4 = [(NUHDRApplyToneMapFilter *)self inputColorSpace];
  uint64_t v5 = [v4 CGColorSpace];

  if (v5)
  {
    uint64_t v6 = [v3 imageByTaggingWithColorSpace:v5];

    v3 = (void *)v6;
  }
  if (v3)
  {
    v7 = [(NUHDRApplyToneMapFilter *)self inputSourceHeadroom];
    [v7 floatValue];
    float v9 = v8;

    v10 = [(NUHDRApplyToneMapFilter *)self inputTargetHeadroom];
    [v10 floatValue];
    float v12 = v11;

    if (v9 == 0.0
      && ([(NUHDRApplyToneMapFilter *)self inputColorSpace],
          v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 isExtended],
          v13,
          v14))
    {
      id v15 = v3;
    }
    else
    {
      v16 = [MEMORY[0x1E4F1E040] filterWithName:@"CIToneMapHeadroom"];
      [v16 setValue:v3 forKey:*MEMORY[0x1E4F1E480]];
      *(float *)&double v17 = v9;
      v18 = [NSNumber numberWithFloat:v17];
      [v16 setValue:v18 forKey:@"inputSourceHeadroom"];

      LODWORD(v19) = fminf(v12, v9);
      v20 = [NSNumber numberWithFloat:v19];
      [v16 setValue:v20 forKey:@"inputTargetHeadroom"];

      id v15 = [v16 outputImage];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

@end