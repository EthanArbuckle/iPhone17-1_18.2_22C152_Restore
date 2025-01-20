@interface BitVector
- (BOOL)testAtIndex:(unint64_t)a3;
- (BitVector)initWithNumberOfBits:(unint64_t)a3;
- (NSData)bvData;
- (id)description;
- (int64_t)numberOfBits;
- (unint64_t)numberOfBytes;
- (void)loadData:(id)a3;
- (void)setAtIndex:(unint64_t)a3;
@end

@implementation BitVector

- (void).cxx_destruct
{
}

- (NSData)bvData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)numberOfBytes
{
  return self->_numberOfBytes;
}

- (int64_t)numberOfBits
{
  return self->_numberOfBits;
}

- (BOOL)testAtIndex:(unint64_t)a3
{
  return (*(unsigned __int8 *)([(NSData *)self->_bvData bytes] + (a3 >> self->_bitShift)) >> (a3 % self->_bitsPerBlock)) & 1;
}

- (void)setAtIndex:(unint64_t)a3
{
  v5 = [(NSData *)self->_bvData bytes];
  v5[a3 >> self->_bitShift] |= 1 << (a3 % self->_bitsPerBlock);
}

- (void)loadData:(id)a3
{
  self->_bvData = (NSData *)[a3 mutableCopy];

  MEMORY[0x270F9A758]();
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"numBits %lu, dataLen %lu", self->_numberOfBits, -[NSData length](self->_bvData, "length")];
}

- (BitVector)initWithNumberOfBits:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BitVector;
  v4 = [(BitVector *)&v9 init];
  v5 = (BitVector *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = xmmword_21C940E00;
    *((void *)v4 + 4) = a3;
    *((void *)v4 + 5) = vcvtps_u32_f32((float)a3 * 0.125);
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:");
    bvData = v5->_bvData;
    v5->_bvData = (NSData *)v6;
  }
  return v5;
}

@end