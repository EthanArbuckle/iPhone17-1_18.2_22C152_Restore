@interface VMUIOSurfaceDebugDescription
- (NSString)name;
- (NSString)pixelFormatString;
- (VMUIOSurfaceDebugDescription)initWithVirtualAddress:(unint64_t)a3 allocationSize:(unint64_t)a4 surfaceID:(unsigned int)a5 pixelFormat:(unsigned int)a6 pixelFormatString:(id)a7 width:(unint64_t)a8 height:(unint64_t)a9 dirtySize:(unint64_t)a10 residentSize:(unint64_t)a11 name:(id)a12;
- (unint64_t)allocationSize;
- (unint64_t)dirtySize;
- (unint64_t)height;
- (unint64_t)residentSize;
- (unint64_t)virtualAddress;
- (unint64_t)width;
- (unsigned)pixelFormat;
- (unsigned)surfaceID;
@end

@implementation VMUIOSurfaceDebugDescription

- (VMUIOSurfaceDebugDescription)initWithVirtualAddress:(unint64_t)a3 allocationSize:(unint64_t)a4 surfaceID:(unsigned int)a5 pixelFormat:(unsigned int)a6 pixelFormatString:(id)a7 width:(unint64_t)a8 height:(unint64_t)a9 dirtySize:(unint64_t)a10 residentSize:(unint64_t)a11 name:(id)a12
{
  id v19 = a7;
  id v20 = a12;
  v24.receiver = self;
  v24.super_class = (Class)VMUIOSurfaceDebugDescription;
  v21 = [(VMUIOSurfaceDebugDescription *)&v24 init];
  v22 = v21;
  if (v21)
  {
    v21->_virtualAddress = a3;
    v21->_allocationSize = a4;
    v21->_surfaceID = a5;
    v21->_pixelFormat = a6;
    objc_storeStrong((id *)&v21->_pixelFormatString, a7);
    v22->_width = a8;
    v22->_height = a9;
    v22->_dirtySize = a10;
    v22->_residentSize = a11;
    objc_storeStrong((id *)&v22->_name, a12);
  }

  return v22;
}

- (unint64_t)virtualAddress
{
  return self->_virtualAddress;
}

- (unint64_t)allocationSize
{
  return self->_allocationSize;
}

- (unsigned)surfaceID
{
  return self->_surfaceID;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (NSString)pixelFormatString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)dirtySize
{
  return self->_dirtySize;
}

- (unint64_t)residentSize
{
  return self->_residentSize;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_pixelFormatString, 0);
}

@end