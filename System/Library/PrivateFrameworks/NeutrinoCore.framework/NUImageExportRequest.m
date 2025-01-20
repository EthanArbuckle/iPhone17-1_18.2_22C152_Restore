@interface NUImageExportRequest
+ (NSArray)defaultAuxiliaryImageTypes;
- (BOOL)applyOrientationAsMetadata;
- (BOOL)renderToData;
- (BOOL)renderWithIOSurface;
- (NSArray)auxiliaryImageTypes;
- (NSDictionary)auxImages;
- (NSDictionary)imageProperties;
- (NUColorSpace)colorSpace;
- (NUImageExportFormat)format;
- (NUImageExportRequest)initWithComposition:(id)a3;
- (NUImageExportRequest)initWithComposition:(id)a3 destinationURL:(id)a4;
- (NUImageExportRequest)initWithComposition:(id)a3 exportFormat:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setApplyOrientationAsMetadata:(BOOL)a3;
- (void)setAuxImages:(id)a3;
- (void)setAuxiliaryImageTypes:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setFormat:(id)a3;
- (void)setImageProperties:(id)a3;
- (void)setRenderToData:(BOOL)a3;
- (void)setRenderWithIOSurface:(BOOL)a3;
@end

@implementation NUImageExportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxImages, 0);
  objc_storeStrong((id *)&self->_auxiliaryImageTypes, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_format, 0);

  objc_storeStrong((id *)&self->_colorSpace, 0);
}

- (void)setAuxImages:(id)a3
{
}

- (NSDictionary)auxImages
{
  return self->_auxImages;
}

- (void)setAuxiliaryImageTypes:(id)a3
{
}

- (NSArray)auxiliaryImageTypes
{
  return self->_auxiliaryImageTypes;
}

- (void)setApplyOrientationAsMetadata:(BOOL)a3
{
  self->_applyOrientationAsMetadata = a3;
}

- (BOOL)applyOrientationAsMetadata
{
  return self->_applyOrientationAsMetadata;
}

- (void)setImageProperties:(id)a3
{
}

- (NSDictionary)imageProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setRenderWithIOSurface:(BOOL)a3
{
  self->_renderWithIOSurface = a3;
}

- (BOOL)renderWithIOSurface
{
  return self->_renderWithIOSurface;
}

- (void)setRenderToData:(BOOL)a3
{
  self->_renderToData = a3;
}

- (BOOL)renderToData
{
  return self->_renderToData;
}

- (void)setFormat:(id)a3
{
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

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NUImageExportRequest;
  v4 = [(NUExportRequest *)&v10 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 22, self->_colorSpace);
    v6 = [(NUImageExportRequest *)self format];
    uint64_t v7 = [v6 copy];
    id v8 = v5[23];
    v5[23] = (id)v7;

    objc_storeStrong(v5 + 24, self->_imageProperties);
    objc_storeStrong(v5 + 25, self->_auxiliaryImageTypes);
    objc_storeStrong(v5 + 26, self->_auxImages);
    *((unsigned char *)v5 + 168) = self->_renderToData;
    *((unsigned char *)v5 + 169) = self->_renderWithIOSurface;
    *((unsigned char *)v5 + 170) = self->_applyOrientationAsMetadata;
  }
  return v5;
}

- (id)newRenderJob
{
  v3 = [NUImageExportJob alloc];

  return [(NUImageExportJob *)v3 initWithImageExportRequest:self];
}

- (NUImageExportFormat)format
{
  format = self->_format;
  if (!format)
  {
    v4 = objc_alloc_init(NUImageExportFormatJPEG);
    v5 = self->_format;
    self->_format = &v4->super;

    format = self->_format;
  }

  return format;
}

- (NUImageExportRequest)initWithComposition:(id)a3 exportFormat:(id)a4
{
  v6 = (NUImageExportFormat *)a4;
  uint64_t v7 = [(NUImageExportRequest *)self initWithComposition:a3];
  format = v7->_format;
  v7->_format = v6;

  return v7;
}

- (NUImageExportRequest)initWithComposition:(id)a3 destinationURL:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUImageExportRequest;
  uint64_t v7 = [(NUExportRequest *)&v12 initWithComposition:a3 destinationURL:v6];
  if (v6)
  {
    uint64_t v8 = +[NUImageExportFormat defaultFormatForURL:v6];
    format = v7->_format;
    v7->_format = (NUImageExportFormat *)v8;
  }
  auxImages = v7->_auxImages;
  v7->_auxImages = (NSDictionary *)MEMORY[0x1E4F1CC08];

  return v7;
}

- (NUImageExportRequest)initWithComposition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUImageExportRequest;
  v3 = [(NUExportRequest *)&v8 initWithComposition:a3];
  uint64_t v4 = +[NUColorSpace sRGBColorSpace];
  colorSpace = v3->_colorSpace;
  v3->_colorSpace = (NUColorSpace *)v4;

  auxImages = v3->_auxImages;
  v3->_auxImages = (NSDictionary *)MEMORY[0x1E4F1CC08];

  [(NURenderRequest *)v3 setIsOneShot:1];
  return v3;
}

+ (NSArray)defaultAuxiliaryImageTypes
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = @"HDRGainMap";
  v6[0] = @"HDRGainMap";
  v3 = @"Disparity";
  v6[1] = @"Disparity";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

@end