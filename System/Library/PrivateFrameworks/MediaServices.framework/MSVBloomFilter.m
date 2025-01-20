@interface MSVBloomFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)containsObject:(id)a3;
- (MSVBloomFilter)initWithCapacity:(int64_t)a3 falsePositiveTolerance:(float)a4;
- (MSVBloomFilter)initWithCapacity:(int64_t)a3 falsePositiveTolerance:(float)a4 murmurSeed:(unint64_t)a5;
- (MSVBloomFilter)initWithCoder:(id)a3;
- (float)falsePositiveProbability;
- (float)falsePositiveTolerance;
- (id)_vectorIndexSetForObject:(id)a3;
- (id)description;
- (int64_t)capacity;
- (int64_t)estimatedCount;
- (unint64_t)_fnvHashObject:(id)a3;
- (unint64_t)_murmur2HashObject:(id)a3;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSVBloomFilter

void __28__MSVBloomFilter_addObject___block_invoke(uint64_t a1, CFIndex a2)
{
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  v5 = [(MSVBloomFilter *)self _vectorIndexSetForObject:v4];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__MSVBloomFilter_containsObject___block_invoke;
  v7[3] = &unk_1E5ADA770;
  v7[4] = self;
  v7[5] = &v8;
  [v5 enumerateIndexesUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

- (void)addObject:(id)a3
{
  id v4 = [(MSVBloomFilter *)self _vectorIndexSetForObject:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__MSVBloomFilter_addObject___block_invoke;
  v5[3] = &unk_1E5ADA748;
  v5[4] = self;
  [v4 enumerateIndexesUsingBlock:v5];
}

- (id)_vectorIndexSetForObject:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MSVBloomFilter *)self _fnvHashObject:v4];
  unint64_t v6 = [(MSVBloomFilter *)self _murmur2HashObject:v4];
  v7 = [MEMORY[0x1E4F28E60] indexSet];
  if (self->_hashCount >= 1)
  {
    int64_t v8 = 0;
    do
    {
      [v7 addIndex:v5 % self->_vectorCapacity];
      ++v8;
      v5 += v6;
    }
    while (v8 < self->_hashCount);
  }

  return v7;
}

- (unint64_t)_murmur2HashObject:(id)a3
{
  uint64_t v4 = [a3 hash];
  unint64_t v5 = 0xC6A4A7935BD1E995
     * (self->_murmurSeed ^ 0x35253C9ADE8F4CA8 ^ (0xC6A4A7935BD1E995
                                                  * ((0xC6A4A7935BD1E995 * v4) ^ ((0xC6A4A7935BD1E995 * v4) >> 47))));
  return (0xC6A4A7935BD1E995 * (v5 ^ (v5 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v5 ^ (v5 >> 47))) >> 47);
}

- (unint64_t)_fnvHashObject:(id)a3
{
  unint64_t v3 = [a3 hash];
  uint64_t v4 = 0;
  unint64_t v5 = 0xCBF29CE484222325;
  do
    unint64_t v5 = 0x100000001B3 * ((v3 >> v4++) & 0xF ^ v5);
  while (v4 != 8);
  return v5;
}

uint64_t __33__MSVBloomFilter_containsObject___block_invoke(uint64_t a1, CFIndex a2, unsigned char *a3)
{
  uint64_t result = CFBitVectorGetBitAtIndex(*(CFBitVectorRef *)(*(void *)(a1 + 32) + 8), a2);
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (MSVBloomFilter)initWithCapacity:(int64_t)a3 falsePositiveTolerance:(float)a4
{
  if (a3 <= 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MSVBloomFilter.m" lineNumber:23 description:@"An expected capacity must be provided."];
  }
  if (a4 >= 1.0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MSVBloomFilter.m" lineNumber:24 description:@"Tolerance must be between 0..<1 and cannot be 1"];
  }
  if (a4 <= 0.0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"MSVBloomFilter.m" lineNumber:25 description:@"Tolerance must be between 0..<1 and cannot be 0"];
  }
  v20.receiver = self;
  v20.super_class = (Class)MSVBloomFilter;
  int64_t v8 = [(MSVBloomFilter *)&v20 init];
  v9 = v8;
  if (v8)
  {
    v8->_falsePositiveTolerance = a4;
    v8->_capacity = a3;
    arc4random_buf(&v8->_murmurSeed, 8uLL);
    double v10 = -log(a4);
    unint64_t v11 = 1;
    int64_t v12 = a3;
    do
    {
      int64_t v13 = vcvtpd_s64_f64(v10 * (double)v12 / 0.480453014);
      v9->_vectorCapacity = v13;
      v9->_hashCount = vcvtpd_s64_f64((double)(v13 / v12) * 0.693147181);
      [(MSVBloomFilter *)v9 falsePositiveProbability];
      if (v11 > 0xB) {
        break;
      }
      ++v11;
      v12 += a3;
    }
    while (v14 > a4);
    Mutable = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9->_vectorCapacity);
    v9->_vector = Mutable;
    CFBitVectorSetCount(Mutable, v9->_vectorCapacity);
  }
  return v9;
}

- (float)falsePositiveProbability
{
  int64_t hashCount = self->_hashCount;
  long double v3 = pow(2.71828183, (float)((float)-(hashCount * self->_capacity) / (float)self->_vectorCapacity));
  return pow(1.0 - v3, (double)hashCount);
}

- (float)falsePositiveTolerance
{
  return self->_falsePositiveTolerance;
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (int64_t)estimatedCount
{
  v5.length = self->_vectorCapacity;
  v5.location = 0;
  CFIndex CountOfBit = CFBitVectorGetCountOfBit(self->_vector, v5, 1u);
  return vcvtpd_s64_f64(log((float)(1.0 - (float)((float)CountOfBit / (float)self->_vectorCapacity)))* (float)((float)-(float)self->_vectorCapacity / (float)self->_hashCount));
}

- (void)encodeWithCoder:(id)a3
{
  int64_t capacity = self->_capacity;
  id v5 = a3;
  [v5 encodeInteger:capacity forKey:@"capacity"];
  [v5 encodeInteger:self->_vectorCapacity forKey:@"vectorCapacity"];
  [v5 encodeInteger:(uint64_t)self->_falsePositiveTolerance forKey:@"falsePositiveTolerance"];
  [v5 encodeInteger:self->_hashCount forKey:@"hashCount"];
  [v5 encodeInt64:self->_murmurSeed forKey:@"murmurSeed"];
  unint64_t v6 = [MEMORY[0x1E4F1CA58] dataWithLength:self->_vectorCapacity / 8];
  vector = self->_vector;
  CFIndex vectorCapacity = self->_vectorCapacity;
  id v10 = v6;
  v9 = (UInt8 *)[v10 mutableBytes];
  v12.location = 0;
  v12.length = vectorCapacity;
  CFBitVectorGetBits(vector, v12, v9);
  [v5 encodeObject:v10 forKey:@"vectorData"];
}

- (MSVBloomFilter)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MSVBloomFilter;
  id v5 = [(MSVBloomFilter *)&v17 init];
  if (!v5) {
    goto LABEL_6;
  }
  v5->_int64_t capacity = [v4 decodeIntegerForKey:@"capacity"];
  v5->_uint64_t vectorCapacity = [v4 decodeIntegerForKey:@"vectorCapacity"];
  v5->_falsePositiveTolerance = (float)[v4 decodeIntegerForKey:@"falsePositiveTolerance"];
  v5->_int64_t hashCount = [v4 decodeIntegerForKey:@"hashCount"];
  v5->_murmurSeed = [v4 decodeInt64ForKey:@"murmurSeed"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vectorData"];
  v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  if ([v6 length] != v5->_vectorCapacity / 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = [v7 length];
      uint64_t vectorCapacity = v5->_vectorCapacity;
      uint64_t v16 = vectorCapacity + 7;
      if (vectorCapacity >= 0) {
        uint64_t v16 = v5->_vectorCapacity;
      }
      *(_DWORD *)buf = 134218496;
      uint64_t v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = vectorCapacity;
      __int16 v22 = 2048;
      uint64_t v23 = v16 >> 3;
      _os_log_fault_impl(&dword_1A30CD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "MSVBloomFilter encoded data length does not match vector capacity: %lld != (%lld / 8) [%lld]", buf, 0x20u);
    }
    goto LABEL_8;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v9 = v7;
  CFBitVectorRef v10 = CFBitVectorCreate(v8, (const UInt8 *)[v9 bytes], v5->_vectorCapacity);
  if (!v10)
  {
LABEL_8:

    CFRange v12 = 0;
    goto LABEL_9;
  }
  CFBitVectorRef v11 = v10;
  v5->_vector = CFBitVectorCreateMutableCopy(v8, v5->_vectorCapacity, v10);
  CFRelease(v11);

LABEL_6:
  CFRange v12 = v5;
LABEL_9:

  return v12;
}

- (id)description
{
  long double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = self->_vectorCapacity / 8;
  int64_t hashCount = self->_hashCount;
  [(MSVBloomFilter *)self falsePositiveProbability];
  return (id)[v3 stringWithFormat:@"<%@: %p size=%ld hashCount=%ld falsePositiveProbability=%0.4f>", v4, self, v5, hashCount, v7];
}

- (void)dealloc
{
  vector = self->_vector;
  if (vector) {
    CFRelease(vector);
  }
  v4.receiver = self;
  v4.super_class = (Class)MSVBloomFilter;
  [(MSVBloomFilter *)&v4 dealloc];
}

- (MSVBloomFilter)initWithCapacity:(int64_t)a3 falsePositiveTolerance:(float)a4 murmurSeed:(unint64_t)a5
{
  uint64_t result = -[MSVBloomFilter initWithCapacity:falsePositiveTolerance:](self, "initWithCapacity:falsePositiveTolerance:", a3);
  if (result) {
    result->_murmurSeed = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end