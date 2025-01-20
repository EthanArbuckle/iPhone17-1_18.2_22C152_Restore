@interface PFAuxiliaryImageRecord
- (CGSize)sourceImageSize;
- (NSDictionary)auxiliaryImageInfo;
- (NSString)identifier;
- (double)effectiveScaleFactorForDestinationImageSize:(CGSize)a3;
- (double)sourceImageSizeMaxLength;
- (unsigned)sourceImageOrientation;
- (void)setAuxiliaryImageInfo:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSourceImageOrientation:(unsigned int)a3;
- (void)setSourceImageSize:(CGSize)a3;
@end

@implementation PFAuxiliaryImageRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageInfo, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setSourceImageOrientation:(unsigned int)a3
{
  self->_sourceImageOrientation = a3;
}

- (unsigned)sourceImageOrientation
{
  return self->_sourceImageOrientation;
}

- (void)setSourceImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_sourceImageSize, &v3, 16, 1, 0);
}

- (CGSize)sourceImageSize
{
  objc_copyStruct(v4, &self->_sourceImageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setAuxiliaryImageInfo:(id)a3
{
}

- (NSDictionary)auxiliaryImageInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)effectiveScaleFactorForDestinationImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(NSDictionary *)self->_auxiliaryImageInfo objectForKeyedSubscript:*MEMORY[0x1E4F2F378]];
  uint64_t v7 = *MEMORY[0x1E4F2FDD8];
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FDD8]];
  [v8 doubleValue];
  double v10 = v9;
  uint64_t v11 = *MEMORY[0x1E4F2FB48];
  v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FB48]];
  [v12 doubleValue];
  if (v10 > v13) {
    uint64_t v14 = v7;
  }
  else {
    uint64_t v14 = v11;
  }
  v15 = [v6 objectForKeyedSubscript:v14];
  [v15 doubleValue];
  double v17 = v16;

  if (width <= height) {
    double width = height;
  }
  [(PFAuxiliaryImageRecord *)self sourceImageSizeMaxLength];
  double v19 = 1.0;
  if (width > 0.0 && v18 > 0.0)
  {
    [(PFAuxiliaryImageRecord *)self sourceImageSizeMaxLength];
    double v19 = v17 / v20 / (v17 / width);
  }

  return v19;
}

- (double)sourceImageSizeMaxLength
{
  [(PFAuxiliaryImageRecord *)self sourceImageSize];
  double v4 = v3;
  [(PFAuxiliaryImageRecord *)self sourceImageSize];
  double v6 = v5;
  [(PFAuxiliaryImageRecord *)self sourceImageSize];
  if (v4 <= v6) {
    return v8;
  }
  return result;
}

@end