@interface VIBloomFilter
- (BOOL)containsItem:(id)a3;
- (VIBloomFilter)initWithData:(id)a3 numberOfHashes:(unsigned int)a4 numberOfBits:(unsigned int)a5 seed:(unsigned int)a6 error:(id *)a7;
- (VIBloomFilter)initWithNumberOfHashes:(unsigned int)a3 numberOfBits:(unint64_t)a4 seed:(unsigned int)a5;
- (id)data;
- (id)description;
- (unint64_t)numberOfBits;
- (unsigned)numberOfAddedItems;
- (unsigned)numberOfHashes;
- (unsigned)seed;
- (void)addItem:(id)a3;
@end

@implementation VIBloomFilter

- (VIBloomFilter)initWithNumberOfHashes:(unsigned int)a3 numberOfBits:(unint64_t)a4 seed:(unsigned int)a5
{
  v13.receiver = self;
  v13.super_class = (Class)VIBloomFilter;
  v8 = [(VIBloomFilter *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_numberOfBits = a4;
    v8->_seed = a5;
    v8->_numberOfHashes = a3;
    v8->_numberOfAddedItems = 0;
    v10 = [[VIBitVector alloc] initWithNumberOfBits:v8->_numberOfBits];
    bits = v9->_bits;
    v9->_bits = v10;
  }
  return v9;
}

- (VIBloomFilter)initWithData:(id)a3 numberOfHashes:(unsigned int)a4 numberOfBits:(unsigned int)a5 seed:(unsigned int)a6 error:(id *)a7
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VIBloomFilter;
  objc_super v13 = [(VIBloomFilter *)&v21 init];
  v14 = v13;
  if (!v13) {
    goto LABEL_5;
  }
  v13->_unint64_t numberOfBits = a5;
  v13->_seed = a6;
  v13->_numberOfHashes = a4;
  v13->_numberOfAddedItems = 0;
  v15 = [[VIBitVector alloc] initWithData:v12];
  bits = v14->_bits;
  v14->_bits = v15;

  unint64_t numberOfBits = v14->_numberOfBits;
  if (numberOfBits > [(VIBitVector *)v14->_bits numberOfBits])
  {
    if (a7)
    {
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Incompatible data with bits: %lu and number of bits %lu", -[VIBitVector numberOfBits](v14->_bits, "numberOfBits"), v14->_numberOfBits);
      v23[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

      *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.argos.bloom_filter.error_domain" code:1 userInfo:v19];

      a7 = 0;
    }
  }
  else
  {
LABEL_5:
    a7 = v14;
  }

  return (VIBloomFilter *)a7;
}

- (void)addItem:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  _HashItem(a3, v7);
  if (self->_numberOfHashes)
  {
    int v4 = 0;
    uint64_t v5 = v7[0];
    uint64_t v6 = v7[1];
    do
      [(VIBitVector *)self->_bits setAtIndex:(v5 + v6 * (unint64_t)v4++) % self->_numberOfBits];
    while (self->_numberOfHashes > v4);
  }
  ++self->_numberOfAddedItems;
}

- (BOOL)containsItem:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  _HashItem(a3, v8);
  if (!self->_numberOfHashes) {
    return 1;
  }
  unsigned __int8 v4 = 0;
  uint64_t v5 = v8[0];
  uint64_t v6 = v8[1];
  do
  {
    BOOL result = [(VIBitVector *)self->_bits checkAtIndex:(v5 + v6 * (unint64_t)v4) % self->_numberOfBits];
    if (!result) {
      break;
    }
    ++v4;
  }
  while (self->_numberOfHashes > v4);
  return result;
}

- (id)data
{
  return [(VIBitVector *)self->_bits data];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"numberOfBits: %ld, numberOfHashes: %d, seed: %d", self->_numberOfBits, self->_numberOfHashes, self->_seed];
}

- (unsigned)seed
{
  return self->_seed;
}

- (unint64_t)numberOfBits
{
  return self->_numberOfBits;
}

- (unsigned)numberOfHashes
{
  return self->_numberOfHashes;
}

- (unsigned)numberOfAddedItems
{
  return self->_numberOfAddedItems;
}

- (void).cxx_destruct
{
}

@end