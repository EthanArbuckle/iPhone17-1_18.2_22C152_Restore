@interface VIBitVector
- (BOOL)checkAtIndex:(unint64_t)a3;
- (VIBitVector)initWithData:(id)a3;
- (VIBitVector)initWithNumberOfBits:(unint64_t)a3;
- (id)data;
- (unint64_t)numberOfBits;
- (void)clearAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)setAtIndex:(unint64_t)a3;
@end

@implementation VIBitVector

- (VIBitVector)initWithNumberOfBits:(unint64_t)a3
{
  size_t v4 = vcvtps_u32_f32((float)a3 * 0.125);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v4, 1uLL, 0x100004077774924uLL), v4, 1);
  v6 = [(VIBitVector *)self initWithData:v5];

  return v6;
}

- (VIBitVector)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VIBitVector;
  v5 = [(VIBitVector *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_bitShift = 3;
    unint64_t v7 = [v4 length];
    v6->_numberOfBytes = v7;
    v6->_numberOfBits = 8 * (unint64_t)(float)v7;
    v8 = (char *)malloc_type_malloc([v4 length], 0x3DA70480uLL);
    v6->_data = v8;
    objc_msgSend(v4, "getBytes:length:", v8, objc_msgSend(v4, "length"));
  }

  return v6;
}

- (void)dealloc
{
  free(self->_data);
  v3.receiver = self;
  v3.super_class = (Class)VIBitVector;
  [(VIBitVector *)&v3 dealloc];
}

- (void)setAtIndex:(unint64_t)a3
{
  self->_data[a3 >> self->_bitShift] |= 1 << (a3 & 7);
}

- (void)clearAtIndex:(unint64_t)a3
{
  self->_data[a3 >> self->_bitShift] &= ~(1 << (a3 & 7));
}

- (BOOL)checkAtIndex:(unint64_t)a3
{
  return (self->_data[a3 >> self->_bitShift] >> (a3 & 7)) & 1;
}

- (id)data
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:self->_data length:self->_numberOfBytes];
  return v2;
}

- (unint64_t)numberOfBits
{
  return self->_numberOfBits;
}

@end