@interface NUImageExportFormatTIFF
- (BOOL)preserveAlpha;
- (NUImageExportFormatTIFF)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fileType;
- (id)pixelFormat;
- (int)depth;
- (int64_t)compression;
- (int64_t)pixelType;
- (void)addImageDestinationOptionsToImageProperties:(id)a3;
- (void)setCompression:(int64_t)a3;
- (void)setPixelType:(int64_t)a3;
- (void)setPreserveAlpha:(BOOL)a3;
@end

@implementation NUImageExportFormatTIFF

- (void)setPreserveAlpha:(BOOL)a3
{
  self->_preserveAlpha = a3;
}

- (BOOL)preserveAlpha
{
  return self->_preserveAlpha;
}

- (void)setCompression:(int64_t)a3
{
  self->_compression = a3;
}

- (int64_t)compression
{
  return self->_compression;
}

- (void)setPixelType:(int64_t)a3
{
  self->_pixelType = a3;
}

- (int64_t)pixelType
{
  return self->_pixelType;
}

- (void)addImageDestinationOptionsToImageProperties:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initWithCapacity:1];
  v6 = [NSNumber numberWithInteger:self->_compression];
  [v9 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2FD28]];

  v7 = (void *)[v9 copy];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2FD40]];

  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[NUImageExportFormatTIFF depth](self, "depth"));
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2F6B8]];
}

- (int)depth
{
  return 8;
}

- (id)pixelFormat
{
  if (!self->_pixelType)
  {
    self = +[NUPixelFormat RGBA8];
  }

  return self;
}

- (id)fileType
{
  return (id)[(id)*MEMORY[0x1E4F444E0] identifier];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  if (result)
  {
    *((void *)result + 2) = self->_pixelType;
    *((void *)result + 3) = self->_compression;
    *((unsigned char *)result + 8) = self->_preserveAlpha;
  }
  return result;
}

- (NUImageExportFormatTIFF)init
{
  v3.receiver = self;
  v3.super_class = (Class)NUImageExportFormatTIFF;
  id result = [(NUImageExportFormatTIFF *)&v3 init];
  result->_preserveAlpha = 1;
  result->_pixelType = 0;
  result->_compression = 1;
  return result;
}

@end