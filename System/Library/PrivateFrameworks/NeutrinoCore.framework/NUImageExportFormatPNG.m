@interface NUImageExportFormatPNG
- (BOOL)preserveAlpha;
- (NUImageExportFormatPNG)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fileType;
- (id)pixelFormat;
- (void)setPreserveAlpha:(BOOL)a3;
@end

@implementation NUImageExportFormatPNG

- (void)setPreserveAlpha:(BOOL)a3
{
  self->_preserveAlpha = a3;
}

- (BOOL)preserveAlpha
{
  return self->_preserveAlpha;
}

- (id)pixelFormat
{
  return +[NUPixelFormat RGBA8];
}

- (id)fileType
{
  return (id)[(id)*MEMORY[0x1E4F44460] identifier];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  if (result) {
    *((unsigned char *)result + 8) = self->_preserveAlpha;
  }
  return result;
}

- (NUImageExportFormatPNG)init
{
  v3.receiver = self;
  v3.super_class = (Class)NUImageExportFormatPNG;
  id result = [(NUImageExportFormatPNG *)&v3 init];
  result->_preserveAlpha = 1;
  return result;
}

@end