@interface NUImageRenderRequest
- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)tileSize;
- (NSString)description;
- (NUColorSpace)colorSpace;
- (NUExtentPolicy)extentPolicy;
- (NUImageRenderRequest)initWithComposition:(id)a3;
- (NUMutableImage)targetImage;
- (NUPixelFormat)pixelFormat;
- (NURegionPolicy)regionPolicy;
- (NUScalePolicy)scalePolicy;
- (double)currentEDRHeadroom;
- (double)maxEDRHeadroom;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)auxiliaryImageType;
- (int64_t)mediaComponentType;
- (void)setAuxiliaryImageType:(int64_t)a3;
- (void)setBorderSize:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setCurrentEDRHeadroom:(double)a3;
- (void)setExtentPolicy:(id)a3;
- (void)setMaxEDRHeadroom:(double)a3;
- (void)setPixelFormat:(id)a3;
- (void)setRegionPolicy:(id)a3;
- (void)setScalePolicy:(id)a3;
- (void)setTargetImage:(id)a3;
- (void)setTileSize:(id)a3;
@end

@implementation NUImageRenderRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetImage, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_extentPolicy, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_regionPolicy, 0);

  objc_storeStrong((id *)&self->_colorSpace, 0);
}

- (void)setTargetImage:(id)a3
{
}

- (NUMutableImage)targetImage
{
  return (NUMutableImage *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAuxiliaryImageType:(int64_t)a3
{
  self->_auxiliaryImageType = a3;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (void)setBorderSize:(id)a3
{
  self->_borderSize = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)borderSize
{
  p_borderSize = &self->_borderSize;
  int64_t width = self->_borderSize.width;
  int64_t height = p_borderSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setTileSize:(id)a3
{
  self->_tileSize = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tileSize
{
  p_tileSize = &self->_tileSize;
  int64_t width = self->_tileSize.width;
  int64_t height = p_tileSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setPixelFormat:(id)a3
{
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setExtentPolicy:(id)a3
{
}

- (NUExtentPolicy)extentPolicy
{
  return self->_extentPolicy;
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setRegionPolicy:(id)a3
{
}

- (NURegionPolicy)regionPolicy
{
  return self->_regionPolicy;
}

- (void)setCurrentEDRHeadroom:(double)a3
{
  self->_currentEDRHeadroom = a3;
}

- (double)currentEDRHeadroom
{
  return self->_currentEDRHeadroom;
}

- (void)setMaxEDRHeadroom:(double)a3
{
  self->_maxEDRHeadroom = a3;
}

- (double)maxEDRHeadroom
{
  return self->_maxEDRHeadroom;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (NSString)description
{
  v16.receiver = self;
  v16.super_class = (Class)NUImageRenderRequest;
  v3 = [(NURenderRequest *)&v16 description];
  v4 = [(NUImageRenderRequest *)self colorSpace];
  [(NUImageRenderRequest *)self currentEDRHeadroom];
  uint64_t v6 = v5;
  [(NUImageRenderRequest *)self maxEDRHeadroom];
  uint64_t v8 = v7;
  v9 = [(NUImageRenderRequest *)self scalePolicy];
  v10 = [(NUImageRenderRequest *)self regionPolicy];
  unint64_t v11 = [(NUImageRenderRequest *)self auxiliaryImageType];
  if (v11 > 0xB) {
    v12 = @"Invalid";
  }
  else {
    v12 = off_1E5D94190[v11];
  }
  v13 = v12;
  v14 = [v3 stringByAppendingFormat:@" Color Space: %@ EDR: %.1f/%.1f, Scale: %@ Region: %@, Aux: %@", v4, v6, v8, v9, v10, v13];

  return (NSString *)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUImageRenderRequest;
  v4 = [(NURenderRequest *)&v7 copyWithZone:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 19, self->_colorSpace);
    v5[20] = *(id *)&self->_maxEDRHeadroom;
    v5[21] = *(id *)&self->_currentEDRHeadroom;
    objc_storeStrong(v5 + 25, self->_pixelFormat);
    *((_OWORD *)v5 + 14) = self->_tileSize;
    *((_OWORD *)v5 + 15) = self->_borderSize;
    objc_storeStrong(v5 + 22, self->_regionPolicy);
    objc_storeStrong(v5 + 23, self->_scalePolicy);
    objc_storeStrong(v5 + 24, self->_extentPolicy);
    v5[26] = self->_auxiliaryImageType;
  }
  return v5;
}

- (NUImageRenderRequest)initWithComposition:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NUImageRenderRequest;
  v3 = [(NURenderRequest *)&v18 initWithComposition:a3];
  uint64_t v4 = +[NUColorSpace sRGBColorSpace];
  colorSpace = v3->_colorSpace;
  v3->_colorSpace = (NUColorSpace *)v4;

  v3->_maxEDRHeadroom = 1.0;
  v3->_currentEDRHeadroom = 1.0;
  uint64_t v6 = +[NUFixedScalePolicy oneToOneScalePolicy];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v6;

  uint64_t v8 = objc_alloc_init(NUFullExtentRegionPolicy);
  regionPolicy = v3->_regionPolicy;
  v3->_regionPolicy = (NURegionPolicy *)v8;

  v10 = objc_alloc_init(NUFullExtentPolicy);
  extentPolicy = v3->_extentPolicy;
  v3->_extentPolicy = (NUExtentPolicy *)v10;

  uint64_t v12 = +[NUPixelFormat BGRA8];
  pixelFormat = v3->_pixelFormat;
  v3->_pixelFormat = (NUPixelFormat *)v12;

  int64_t v14 = +[NUGlobalSettings imageTileSize];
  if (v14 < 0)
  {
    objc_super v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    [v16 handleFailureInFunction:v17, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
  }
  v3->_tileSize.int64_t width = v14;
  v3->_tileSize.int64_t height = v14;
  v3->_auxiliaryImageType = 1;
  return v3;
}

@end