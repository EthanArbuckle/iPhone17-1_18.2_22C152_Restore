@interface IMBloomFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)mightContainKey:(const void *)a3;
- (IMBloomFilter)initWithCoder:(id)a3;
- (IMBloomFilter)initWithSpecification:(id *)a3 hashProvider:(id)a4;
- (NSString)usageDescription;
- (int64_t)indexSize;
- (void)addKey:(const void *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMBloomFilter

- (IMBloomFilter)initWithSpecification:(id *)a3 hashProvider:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMBloomFilter;
  v7 = [(IMBloomFilter *)&v15 init];
  v8 = v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)&a3->var0;
    v7->_specification.numberOfHashFunctions = a3->var2;
    *(_OWORD *)&v7->_specification.expectedNumberOfInsertions = v9;
    id v10 = [v6 copy];
    id hashProvider = v8->_hashProvider;
    v8->_id hashProvider = v10;

    double v12 = v8->_specification.loadFactor * (double)v8->_specification.expectedNumberOfInsertions * 0.125;
    if (v12 < 1.0) {
      double v12 = 1.0;
    }
    size_t v13 = malloc_good_size((uint64_t)v12);
    v8->_bitVector.byteCount = v13;
    v8->_bitVector.bytes = (char *)malloc_type_calloc(1uLL, v13, 0x1D482DBCuLL);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_specification = &self->_specification;
  id v5 = a3;
  [v5 encodeBytes:p_specification length:24 forKey:@"specification"];
  [v5 encodeBytes:self->_bitVector.bytes length:self->_bitVector.byteCount forKey:@"bytes"];
}

- (IMBloomFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IMBloomFilter;
  id v5 = [(IMBloomFilter *)&v18 init];
  if (v5)
  {
    uint64_t v17 = 0;
    id v6 = v4;
    v7 = [v6 decodeBytesForKey:@"specification" returnedLength:&v17];
    int64_t v8 = v7[2];
    *(_OWORD *)&v5->_specification.expectedNumberOfInsertions = *(_OWORD *)v7;
    v5->_specification.numberOfHashFunctions = v8;
    size_t size = 0;
    id v9 = [v6 decodeBytesForKey:@"bytes" returnedLength:&size];
    size_t v10 = size;
    v5->_bitVector.byteCount = size;
    v11 = (char *)malloc_type_malloc(v10, 0xA50B004uLL);
    v5->_bitVector.bytes = v11;
    memcpy(v11, v9, v5->_bitVector.byteCount);
    double v12 = IMBloomFilterCharacterHashProvider();
    id v13 = [v12 copy];
    id hashProvider = v5->_hashProvider;
    v5->_id hashProvider = v13;
  }
  return v5;
}

- (void)dealloc
{
  bytes = self->_bitVector.bytes;
  if (bytes)
  {
    free(bytes);
    self->_bitVector.bytes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IMBloomFilter;
  [(IMBloomFilter *)&v4 dealloc];
}

- (void)addKey:(const void *)a3
{
  memset(v8, 0, sizeof(v8));
  sub_17DF58((uint64_t)v8, self);
  if (self->_specification.numberOfHashFunctions >= 1)
  {
    int64_t v4 = 0;
    id v5 = (void *)v8 + 1;
    do
    {
      int v6 = 1 << *((unsigned char *)v5 - 8);
      uint64_t v7 = *v5;
      v5 += 2;
      self->_bitVector.bytes[v7] |= v6;
      ++v4;
    }
    while (v4 < self->_specification.numberOfHashFunctions);
  }
}

- (BOOL)mightContainKey:(const void *)a3
{
  memset(v9, 0, sizeof(v9));
  sub_17DF58((uint64_t)v9, self);
  int64_t v4 = (self->_specification.numberOfHashFunctions & ~(self->_specification.numberOfHashFunctions >> 63)) + 1;
  id v5 = (void *)v9 + 1;
  do
  {
    if (!--v4) {
      break;
    }
    uint64_t v6 = *v5;
    char v7 = *((unsigned char *)v5 - 8);
    v5 += 2;
  }
  while (((self->_bitVector.bytes[v6] >> v7) & 1) != 0);
  return v4 == 0;
}

- (NSString)usageDescription
{
  unint64_t byteCount = self->_bitVector.byteCount;
  if (byteCount)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    do
    {
      int64x2_t v5 = (int64x2_t)(unint64_t)v4;
      uint32x2_t v6 = (uint32x2_t)vdup_n_s32(self->_bitVector.bytes[v3]);
      uint64_t v7 = 8;
      int32x2_t v8 = (int32x2_t)0x100000000;
      do
      {
        int64x2_t v5 = (int64x2_t)vaddw_u32((uint64x2_t)v5, (uint32x2_t)(*(void *)&vshl_u32(v6, (uint32x2_t)vneg_s32(v8)) & 0xFFFFFF01FFFFFF01));
        int32x2_t v8 = vadd_s32(v8, (int32x2_t)0x200000002);
        v7 -= 2;
      }
      while (v7);
      uint64_t v9 = vaddvq_s64(v5);
      uint64_t v4 = v9;
      ++v3;
    }
    while (v3 != byteCount);
    float v10 = (float)v9;
  }
  else
  {
    float v10 = 0.0;
  }
  return +[NSString stringWithFormat:@"%.2f%% of bits turned on.", (float)((float)(v10 / (float)(8 * byteCount)) * 100.0)];
}

- (int64_t)indexSize
{
  return self->_bitVector.byteCount;
}

- (void).cxx_destruct
{
}

@end