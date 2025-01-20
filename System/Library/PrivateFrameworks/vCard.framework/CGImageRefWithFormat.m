@interface CGImageRefWithFormat
- (CGImage)imageRef;
- (CGImageRefWithFormat)initWithImage:(CGImage *)a3 andFormat:(__CFString *)a4;
- (__CFString)sourceImageFormatUTI;
@end

@implementation CGImageRefWithFormat

- (CGImageRefWithFormat)initWithImage:(CGImage *)a3 andFormat:(__CFString *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CGImageRefWithFormat;
  v6 = [(CGImageRefWithFormat *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_imageRef = a3;
    v6->_sourceImageFormatUTI = a4;
    v8 = v6;
  }

  return v7;
}

- (CGImage)imageRef
{
  return self->_imageRef;
}

- (__CFString)sourceImageFormatUTI
{
  return self->_sourceImageFormatUTI;
}

@end