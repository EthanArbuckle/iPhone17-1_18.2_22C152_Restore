@interface NRFPrepareDescriptor
- (BOOL)allowModifyingInputBuffers;
- (BOOL)cmiResourceEnabled;
- (BOOL)isQuadra;
- (NRFPrepareDescriptor)init;
- (NSString)sensorID;
- (id)description;
- (int)height;
- (int)width;
- (unint64_t)memoryPoolId;
- (unsigned)pixelFormat;
- (void)setAllowModifyingInputBuffers:(BOOL)a3;
- (void)setCmiResourceEnabled:(BOOL)a3;
- (void)setHeight:(int)a3;
- (void)setIsQuadra:(BOOL)a3;
- (void)setMemoryPoolId:(unint64_t)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setSensorID:(id)a3;
- (void)setWidth:(int)a3;
@end

@implementation NRFPrepareDescriptor

- (NRFPrepareDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)NRFPrepareDescriptor;
  return [(NRFPrepareDescriptor *)&v3 init];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p> width=%d, height=%d, pixelFormat=%c%c%c%c, allowModifyingInputBuffers=%d", v6, v4, self, self->_width, self->_height, HIBYTE(self->_pixelFormat), BYTE2(self->_pixelFormat), BYTE1(self->_pixelFormat), self->_pixelFormat, self->_allowModifyingInputBuffers);
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (BOOL)allowModifyingInputBuffers
{
  return self->_allowModifyingInputBuffers;
}

- (void)setAllowModifyingInputBuffers:(BOOL)a3
{
  self->_allowModifyingInputBuffers = a3;
}

- (unint64_t)memoryPoolId
{
  return self->_memoryPoolId;
}

- (void)setMemoryPoolId:(unint64_t)a3
{
  self->_memoryPoolId = a3;
}

- (BOOL)cmiResourceEnabled
{
  return self->_cmiResourceEnabled;
}

- (void)setCmiResourceEnabled:(BOOL)a3
{
  self->_cmiResourceEnabled = a3;
}

- (BOOL)isQuadra
{
  return self->_isQuadra;
}

- (void)setIsQuadra:(BOOL)a3
{
  self->_isQuadra = a3;
}

- (NSString)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end