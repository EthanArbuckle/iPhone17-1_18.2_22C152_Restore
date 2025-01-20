@interface SCMLImageSanitizerRequest
- (BOOL)isChildPresent;
- (BOOL)keepGoing;
- (NSArray)embeddings;
- (SCMLImageSanitizerRequest)initWithPixelBuffer:(__CVBuffer *)a3;
- (__CVBuffer)pixelBuffer;
- (unsigned)style;
- (void)setEmbeddings:(id)a3;
- (void)setIsChildPresent:(BOOL)a3;
- (void)setKeepGoing:(BOOL)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setStyle:(unsigned int)a3;
@end

@implementation SCMLImageSanitizerRequest

- (SCMLImageSanitizerRequest)initWithPixelBuffer:(__CVBuffer *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCMLImageSanitizerRequest;
  v4 = [(SCMLImageSanitizerRequest *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_keepGoing = 0;
    embeddings = v4->_embeddings;
    v4->_pixelBuffer = a3;
    v4->_embeddings = 0;

    v5->_style = 0;
    v5->_isChildPresent = 0;
  }
  return v5;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (BOOL)keepGoing
{
  return self->_keepGoing;
}

- (void)setKeepGoing:(BOOL)a3
{
  self->_keepGoing = a3;
}

- (NSArray)embeddings
{
  return self->_embeddings;
}

- (void)setEmbeddings:(id)a3
{
}

- (unsigned)style
{
  return self->_style;
}

- (void)setStyle:(unsigned int)a3
{
  self->_style = a3;
}

- (BOOL)isChildPresent
{
  return self->_isChildPresent;
}

- (void)setIsChildPresent:(BOOL)a3
{
  self->_isChildPresent = a3;
}

- (void).cxx_destruct
{
}

@end