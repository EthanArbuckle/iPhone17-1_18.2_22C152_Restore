@interface BloomFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)contains:(id)a3;
- (BloomFilter)initWithCoder:(id)a3;
- (BloomFilter)initWithExpectedNumberOfItems:(unint64_t)a3 falsePositiveRate:(double)a4 seed:(unsigned int)a5;
- (double)falsePositiveRate;
- (unint64_t)expectedNumberOfItems;
- (unsigned)seed;
- (void)_loadBitVectorData:(id)a3;
- (void)add:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BloomFilter

- (void).cxx_destruct
{
}

- (double)falsePositiveRate
{
  return self->_falsePositiveRate;
}

- (unint64_t)expectedNumberOfItems
{
  return self->_expectedNumberOfItems;
}

- (unsigned)seed
{
  return self->_seed;
}

- (void)encodeWithCoder:(id)a3
{
  bitVector = self->_bitVector;
  id v7 = a3;
  v5 = [(BitVector *)bitVector bvData];
  [v7 encodeObject:v5 forKey:@"SSRBitVector-Data"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_expectedNumberOfItems];
  [v7 encodeObject:v6 forKey:@"SSRBloomFilter-NumItems"];

  [v7 encodeDouble:@"SSRBloomFilter-FalsePositiveRate" forKey:self->_falsePositiveRate];
  [v7 encodeInt32:self->_seed forKey:@"SSRBloomFilter-Seed"];
}

- (BloomFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSRBitVector-Data"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"SSRBloomFilter-Seed"];
  [v4 decodeDoubleForKey:@"SSRBloomFilter-FalsePositiveRate"];
  double v8 = v7;
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSRBloomFilter-NumItems"];

  uint64_t v10 = [v9 unsignedIntegerValue] - v6;
  v11 = [(BloomFilter *)self initWithExpectedNumberOfItems:v10 falsePositiveRate:v6 seed:v8];
  [(BloomFilter *)v11 _loadBitVectorData:v5];

  return v11;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MurmurHasher hash128WithKey:length:seed:](MurmurHasher, "hash128WithKey:length:seed:", [v4 bytes], objc_msgSend(v4, "length"), self->_seed);
  if (self->_numberHashes)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = 0;
    int v10 = 0;
    do
    {
      BOOL v11 = [(BitVector *)self->_bitVector testAtIndex:(v7 + v9 * v8) % self->_numberOfBits];
      if (!v11) {
        break;
      }
      uint64_t v9 = ++v10;
    }
    while (self->_numberHashes > v10);
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)add:(id)a3
{
  id v10 = a3;
  uint64_t v4 = +[MurmurHasher hash128WithKey:length:seed:](MurmurHasher, "hash128WithKey:length:seed:", [v10 bytes], objc_msgSend(v10, "length"), self->_seed);
  if (self->_numberHashes)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    uint64_t v8 = 0;
    int v9 = 0;
    do
    {
      [(BitVector *)self->_bitVector setAtIndex:(v6 + v8 * v7) % self->_numberOfBits];
      uint64_t v8 = ++v9;
    }
    while (self->_numberHashes > v9);
  }
}

- (void)_loadBitVectorData:(id)a3
{
}

- (BloomFilter)initWithExpectedNumberOfItems:(unint64_t)a3 falsePositiveRate:(double)a4 seed:(unsigned int)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)BloomFilter;
  uint64_t v8 = [(BloomFilter *)&v23 init];
  if (v8)
  {
    SSRLogInitIfNeeded();
    v8->_seed = a5;
    unint64_t v9 = a3 + a5;
    v8->_unint64_t expectedNumberOfItems = v9;
    v8->_double falsePositiveRate = a4;
    unint64_t v10 = vcvtpd_u64_f64(log(a4) * (double)v9 / -0.480453014);
    v8->_unint64_t numberOfBits = v10;
    v8->_unint64_t numberHashes = vcvtpd_u64_f64((double)(v10 / v9) * 0.693147181);
    BOOL v11 = [[BitVector alloc] initWithNumberOfBits:v8->_numberOfBits];
    bitVector = v8->_bitVector;
    v8->_bitVector = v11;

    v13 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = a5;
      unint64_t expectedNumberOfItems = v8->_expectedNumberOfItems;
      double falsePositiveRate = v8->_falsePositiveRate;
      unint64_t numberOfBits = v8->_numberOfBits;
      unint64_t numberHashes = v8->_numberHashes;
      v19 = v8->_bitVector;
      v20 = v13;
      v21 = [(BitVector *)v19 description];
      *(_DWORD *)buf = 136316674;
      v25 = "-[BloomFilter initWithExpectedNumberOfItems:falsePositiveRate:seed:]";
      __int16 v26 = 2048;
      unint64_t v27 = expectedNumberOfItems;
      __int16 v28 = 2048;
      double v29 = falsePositiveRate;
      __int16 v30 = 2048;
      unint64_t v31 = numberOfBits;
      __int16 v32 = 2048;
      unint64_t v33 = numberHashes;
      __int16 v34 = 2048;
      uint64_t v35 = v14;
      __int16 v36 = 2112;
      v37 = v21;
      _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_INFO, "%s _expectedNumberOfItems: %lu\n _falsePositiveRate: %f\n _numberOfBits: %lu\n _numberHashes: %lu\n seed: %lu\n BitVector: %@\n", buf, 0x48u);
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end