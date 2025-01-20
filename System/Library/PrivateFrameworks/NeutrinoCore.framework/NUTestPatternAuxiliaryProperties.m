@interface NUTestPatternAuxiliaryProperties
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (CGImageMetadata)auxiliaryDataInfoMetadata;
- (CGImageMetadata)compatibilityMetadata;
- (NSString)auxiliaryImageTypeCGIdentifier;
- (NUColorSpace)colorSpace;
- (NUPixelFormat)pixelFormat;
- (id)auxiliaryCoreGraphicsInfoDictionary:(id *)a3;
- (id)auxiliaryImage:(id *)a3;
- (id)auxiliaryImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)depthCameraCalibrationData;
- (void)setAuxiliaryImageTypeCGIdentifier:(id)a3;
- (void)setSize:(id)a3;
@end

@implementation NUTestPatternAuxiliaryProperties

- (void).cxx_destruct
{
}

- (void)setAuxiliaryImageTypeCGIdentifier:(id)a3
{
}

- (NSString)auxiliaryImageTypeCGIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSize:(id)a3
{
  self->_size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height = self->_size.height;
  int64_t width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NUTestPatternAuxiliaryProperties allocWithZone:a3];
  uint64_t v5 = [(NUTestPatternAuxiliaryProperties *)self size];
  -[NUTestPatternAuxiliaryProperties setSize:](v4, "setSize:", v5, v6);
  v7 = [(NUTestPatternAuxiliaryProperties *)self auxiliaryImageTypeCGIdentifier];
  [(NUTestPatternAuxiliaryProperties *)v4 setAuxiliaryImageTypeCGIdentifier:v7];

  return v4;
}

- (CGImageMetadata)compatibilityMetadata
{
  return 0;
}

- (NUPixelFormat)pixelFormat
{
  return 0;
}

- (NUColorSpace)colorSpace
{
  return 0;
}

- (CGImageMetadata)auxiliaryDataInfoMetadata
{
  return 0;
}

- (id)depthCameraCalibrationData
{
  return 0;
}

- (id)auxiliaryImage:(id *)a3
{
  return 0;
}

- (id)auxiliaryImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  return 0;
}

- (id)auxiliaryCoreGraphicsInfoDictionary:(id *)a3
{
  return 0;
}

@end