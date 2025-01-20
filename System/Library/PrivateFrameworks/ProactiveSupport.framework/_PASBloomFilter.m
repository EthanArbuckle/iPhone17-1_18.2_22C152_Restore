@interface _PASBloomFilter
+ (id)bloomFilterWithData:(id)a3;
+ (id)bloomFilterWithPathToFile:(id)a3;
- (BOOL)getWithHashes:(id)a3;
- (_PASBloomFilter)initWithData:(id)a3 numBits:(unsigned int)a4 hashFunctionCode:(unsigned int)a5 numHashFunctions:(int)a6;
- (id)_computeHashesWithSeed:(int)a3 bytes:(const void *)a4 length:(unint64_t)a5 reuse:(id)a6;
- (id)combineHashesWithSeed:(int)a3 hashA:(id)a4 hashB:(id)a5 reuse:(id)a6;
- (id)computeHashesForString:(id)a3 reuse:(id)a4;
- (id)computeHashesWithSeed:(int)a3 forData:(id)a4 reuse:(id)a5;
- (id)initDummy;
- (id)newHashesArray;
- (int)numHashes;
@end

@implementation _PASBloomFilter

- (void).cxx_destruct
{
}

- (id)combineHashesWithSeed:(int)a3 hashA:(id)a4 hashB:(id)a5 reuse:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v12) {
    id v12 = [(_PASBloomFilter *)self newHashesArray];
  }
  id v13 = v12;
  uint64_t v14 = [v13 hashes];
  id v15 = v10;
  uint64_t v16 = [v15 hashes];
  id v17 = v11;
  uint64_t v18 = [v17 hashes];
  if (self->_numHashFunctions >= 1)
  {
    uint64_t v19 = 0;
    do
    {
      unint64_t v20 = 715827883 * ((int)v19 * (int)v19 - 1) * (int)v19;
      *(_DWORD *)(v14 + 4 * v19) = *(_DWORD *)(v16 + 4 * v19)
                                 + HIDWORD(v20)
                                 + (v20 >> 63)
                                 + *(_DWORD *)(v18 + 4 * v19) * (a3 + v19);
      ++v19;
    }
    while (v19 < self->_numHashFunctions);
  }

  return v13;
}

- (BOOL)getWithHashes:(id)a3
{
  uint64_t v4 = [a3 hashes];
  char v13 = 0;
  BOOL v5 = 1;
  if (self->_numHashFunctions >= 1)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = *(_DWORD *)(v6 + 4 * v7);
      if (v8 < 0) {
        int v8 = -v8;
      }
      unsigned int v9 = v8 % self->_numBits;
      int v10 = 1 << (v9 & 7);
      -[NSData getBytes:range:](self->_data, "getBytes:range:", &v13, (v9 >> 3) + 16, 1);
      int v11 = (v13 & v10);
      v13 &= v10;
      if (!v11) {
        break;
      }
      if (++v7 >= self->_numHashFunctions) {
        return 1;
      }
    }
    return 0;
  }
  return v5;
}

- (id)_computeHashesWithSeed:(int)a3 bytes:(const void *)a4 length:(unint64_t)a5 reuse:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v11 = a6;
  if (!v11)
  {
    id v11 = [(_PASBloomFilter *)self newHashesArray];
    if (!v11)
    {
      char v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"_PASBloomFilter.m" lineNumber:266 description:@"newHashesArray unexpectedly returned nil"];

      id v11 = 0;
    }
  }
  if (self->_numHashFunctions) {
    ((void (*)(uint64_t, void, uint64_t, const void *, unint64_t))self->_computeHashes)([v11 hashes], self->_numHashFunctions, v8, a4, a5);
  }

  return v11;
}

- (id)computeHashesWithSeed:(int)a3 forData:(id)a4 reuse:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  uint64_t v12 = [v10 length];

  char v13 = [(_PASBloomFilter *)self _computeHashesWithSeed:v6 bytes:v11 length:v12 reuse:v9];

  return v13;
}

- (id)computeHashesForString:(id)a3 reuse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1A62450A0]();
  __int16 v14 = 255;
  _PASRepairString(v6);
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 UTF8String];
  if (v10) {
    uint64_t v11 = (const char *)v10;
  }
  else {
    uint64_t v11 = (const char *)&v14;
  }

  uint64_t v12 = [(_PASBloomFilter *)self _computeHashesWithSeed:1 bytes:v11 length:strlen(v11) reuse:v7];

  return v12;
}

- (int)numHashes
{
  return self->_numHashFunctions;
}

- (id)newHashesArray
{
  v3 = [_PASBloomFilterHashArray alloc];
  uint64_t hashArrayLength = self->_hashArrayLength;

  return [(_PASBloomFilterHashArray *)v3 initWithCapacity:hashArrayLength];
}

- (id)initDummy
{
  v6.receiver = self;
  v6.super_class = (Class)_PASBloomFilter;
  v2 = [(_PASBloomFilter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    data = v2->_data;
    v2->_data = 0;

    *(void *)&v3->_numBits = 0;
    v3->_uint64_t hashArrayLength = 0;
    v3->_computeHashes = computeHashes_NOOP;
  }
  return v3;
}

- (_PASBloomFilter)initWithData:(id)a3 numBits:(unsigned int)a4 hashFunctionCode:(unsigned int)a5 numHashFunctions:(int)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_PASBloomFilter;
  uint64_t v12 = [(_PASBloomFilter *)&v18 init];
  char v13 = v12;
  if (!v12)
  {
LABEL_10:
    uint64_t v16 = v13;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v12->_data, a3);
  v13->_numBits = a4;
  v13->_numHashFunctions = a6;
  if (a6 <= 4) {
    int v14 = 4;
  }
  else {
    int v14 = a6;
  }
  v13->_uint64_t hashArrayLength = v14;
  id v15 = computeHashes_MURMUR3_X86_32;
  if (a5 == 1)
  {
LABEL_8:
    v13->_computeHashes = v15;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v20 = a5;
      _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Hash function code: %i", buf, 8u);
    }
    goto LABEL_10;
  }
  if (a5 == 2)
  {
    id v15 = computeHashes_MURMUR3_X64_128;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v20 = a5;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unsupported hash function code: %i", buf, 8u);
  }
  uint64_t v16 = 0;
LABEL_14:

  return v16;
}

+ (id)bloomFilterWithPathToFile:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"_PASBloomFilter.m", 207, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASBloomFilter: loading bloom filter from path '%@'", buf, 0xCu);
  }
  id v14 = 0;
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:8 error:&v14];
  id v7 = v14;
  id v8 = v7;
  if (v6)
  {
    id v9 = +[_PASBloomFilter bloomFilterWithData:v6];
  }
  else
  {
    if ([v7 code] == 2
      && ([v8 domain],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isEqualToString:*MEMORY[0x1E4F28798]],
          v10,
          v11))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "No bloom filter file at path '%@'", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v5;
      __int16 v17 = 2112;
      objc_super v18 = v8;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not load bloom filter at path '%@'. Error: %@", buf, 0x16u);
    }
    id v9 = 0;
  }

  return v9;
}

+ (id)bloomFilterWithData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"_PASBloomFilter.m", 160, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  long long v17 = 0uLL;
  objc_msgSend(v5, "getBytes:range:", &v17, 0, 16);
  int v6 = v17;
  if (v17 == 390004919)
  {
    LODWORD(v17) = -1224720617;
    *(int8x8_t *)((char *)&v17 + 4) = vrev32_s8(*(int8x8_t *)((char *)&v17 + 4));
    HIDWORD(v17) = bswap32(HIDWORD(v17));
    int v7 = DWORD1(v17);
  }
  else
  {
    if (v17 != -1224720617)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        int v19 = v6;
        __int16 v20 = 1024;
        int v21 = -1224720617;
        uint64_t v10 = MEMORY[0x1E4F14500];
        int v11 = "Bad header, %i vs. %i.";
        uint32_t v12 = 14;
LABEL_19:
        _os_log_error_impl(&dword_1A32C4000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    int v7 = DWORD1(v17);
  }
  if ((v7 - 1) >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = v7;
      uint64_t v10 = MEMORY[0x1E4F14500];
      int v11 = "Unsupported hash function code: %i.";
      goto LABEL_18;
    }
LABEL_20:
    char v13 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = DWORD2(v17);
  if ([v5 length] - 16 != v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = DWORD2(v17);
      uint64_t v10 = MEMORY[0x1E4F14500];
      int v11 = "Unexpected capacity: %i.";
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  int v9 = HIDWORD(v17);
  if ((HIDWORD(v17) - 65) <= 0xFFFFFFBF)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = v9;
      uint64_t v10 = MEMORY[0x1E4F14500];
      int v11 = "Unexpected number of hash functions: %i.";
LABEL_18:
      uint32_t v12 = 8;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  id v15 = [_PASBloomFilter alloc];
  char v13 = [(_PASBloomFilter *)v15 initWithData:v5 numBits:(8 * DWORD2(v17)) hashFunctionCode:DWORD1(v17) numHashFunctions:HIDWORD(v17)];
LABEL_21:

  return v13;
}

@end