@interface VGMLImageIOData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VGMLImageIOData)initWithCVPixelBufferRef:(__CVBuffer *)a3;
- (VGMLImageIOData)initWithCoder:(id)a3;
- (__CVBuffer)cvPixelBufferRef;
- (__CVBuffer)resizeToWidth:(unint64_t)a3 height:(unint64_t)a4;
- (id)debugQuickLookObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VGMLImageIOData

- (VGMLImageIOData)initWithCVPixelBufferRef:(__CVBuffer *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VGMLImageIOData;
  v4 = [(VGMLImageIOData *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_pixelBuffer = a3;
    CVPixelBufferRetain(a3);
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VGMLImageIOData;
  [(VGMLImageIOData *)&v3 dealloc];
}

- (__CVBuffer)cvPixelBufferRef
{
  return self->_pixelBuffer;
}

- (__CVBuffer)resizeToWidth:(unint64_t)a3 height:(unint64_t)a4
{
  return resizeCVPixelBuffer(self->_pixelBuffer, a4, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (VGMLImageIOData)initWithCoder:(id)a3
{
  v4 = +[VGCoderUtilities decodePixelBufferForKey:@"pixelBuffer" decoder:a3];
  v5 = [(VGMLImageIOData *)self initWithCVPixelBufferRef:v4];
  CVPixelBufferRelease(v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = checkEqualPixelBuffers(-[VGMLImageIOData cvPixelBufferRef](self, "cvPixelBufferRef"), (__CVBuffer *)[v5 cvPixelBufferRef]);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)debugQuickLookObject
{
  return (id)[MEMORY[0x263F00650] imageWithCVPixelBuffer:self->_pixelBuffer];
}

@end