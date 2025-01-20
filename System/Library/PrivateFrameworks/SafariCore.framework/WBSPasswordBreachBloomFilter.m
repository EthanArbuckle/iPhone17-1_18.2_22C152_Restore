@interface WBSPasswordBreachBloomFilter
- (BOOL)_getBucketAtIndex:(unsigned int)a3;
- (BOOL)containsData:(id)a3;
- (BOOL)containsLowercaseHexStringForData:(id)a3;
- (NSData)serializedRepresentation;
- (WBSPasswordBreachBloomFilter)initWithCapacity:(unsigned int)a3 errorDenominator:(unsigned int)a4 bucketData:(id)a5;
- (WBSPasswordBreachBloomFilter)initWithSerializedRepresentation:(id)a3;
- (id)description;
- (void)_enumerateBucketIndexesForData:(id)a3 withBlock:(id)a4;
- (void)_setBucketAtIndex:(unsigned int)a3 inBuffer:(char *)a4;
- (void)addData:(id)a3;
- (void)serializedRepresentation;
@end

@implementation WBSPasswordBreachBloomFilter

- (WBSPasswordBreachBloomFilter)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 0xD)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA10]);
    v7 = objc_msgSend(v4, "subdataWithRange:", 0, 12);
    v8 = (void *)[v6 initWithData:v7];

    [v8 open];
    unsigned __int16 v20 = 0;
    if (objc_msgSend(v8, "safari_readNetworkOrderUInt16:", &v20))
    {
      if (v20 == 45326)
      {
        unsigned __int16 v19 = 0;
        if (objc_msgSend(v8, "safari_readNetworkOrderUInt16:", &v19))
        {
          if (v19 == 1)
          {
            unsigned int v18 = 0;
            if (objc_msgSend(v8, "safari_readNetworkOrderUInt32:", &v18))
            {
              unsigned int v17 = 0;
              if (objc_msgSend(v8, "safari_readNetworkOrderUInt32:", &v17))
              {
                v9 = objc_msgSend(v4, "subdataWithRange:", 12, objc_msgSend(v4, "length") - 12);
                self = [(WBSPasswordBreachBloomFilter *)self initWithCapacity:v17 errorDenominator:v18 bucketData:v9];

                v5 = self;
LABEL_23:

                goto LABEL_24;
              }
              v15 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:]();
              }
            }
            else
            {
              v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:]();
              }
            }
          }
          else
          {
            v13 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:](&v19, v13);
            }
          }
        }
        else
        {
          v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:].cold.4();
          }
        }
      }
      else
      {
        v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:].cold.5(&v20, v11);
        }
      }
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachBloomFilter initWithSerializedRepresentation:].cold.6();
      }
    }
    v5 = 0;
    goto LABEL_23;
  }
  v5 = 0;
LABEL_24:

  return v5;
}

- (WBSPasswordBreachBloomFilter)initWithCapacity:(unsigned int)a3 errorDenominator:(unsigned int)a4 bucketData:(id)a5
{
  id v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)WBSPasswordBreachBloomFilter;
  v9 = [(WBSPasswordBreachBloomFilter *)&v23 init];
  v10 = v9;
  if (!v9)
  {
LABEL_15:
    unsigned __int16 v20 = 0;
    goto LABEL_16;
  }
  if (!a3)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachBloomFilter initWithCapacity:errorDenominator:bucketData:]();
    }
    goto LABEL_15;
  }
  if (a4 <= 1)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachBloomFilter initWithCapacity:errorDenominator:bucketData:]();
    }
    goto LABEL_15;
  }
  v9->_capacity = a3;
  v9->_errorDenominator = a4;
  unsigned int v13 = (log(1.0 / (double)a4) * (double)a3 / -0.480453014);
  v10->_hashCount = vcvtpd_u64_f64((double)v13 / (double)a3 * 0.693147181);
  v10->_bucketCount = v13;
  size_t v14 = vcvtpd_u64_f64((double)v13 * 0.125);
  if (v8)
  {
    if ([v8 length] != v14)
    {
      v21 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachBloomFilter initWithCapacity:errorDenominator:bucketData:]();
      }
      goto LABEL_15;
    }
    uint64_t v15 = [v8 copy];
    bucketData = v10->_bucketData;
    v10->_bucketData = (NSData *)v15;
  }
  else
  {
    unsigned int v17 = malloc_type_calloc(v14, 1uLL, 0x100004077774924uLL);
    uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:v14];
    unsigned __int16 v19 = v10->_bucketData;
    v10->_bucketData = (NSData *)v18;

    free(v17);
  }
  unsigned __int16 v20 = v10;
LABEL_16:

  return v20;
}

- (BOOL)_getBucketAtIndex:(unsigned int)a3
{
  char v3 = a3 & 7;
  unsigned __int8 v6 = 0;
  -[NSData getBytes:range:](self->_bucketData, "getBytes:range:", &v6, a3 >> 3, 1);
  return (v6 >> v3) & 1;
}

- (void)_setBucketAtIndex:(unsigned int)a3 inBuffer:(char *)a4
{
  a4[(unint64_t)a3 >> 3] |= 1 << (a3 & 7);
}

- (void)_enumerateBucketIndexesForData:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, char *))a4;
  unsigned int v8 = WBSPasswordBreachMurmur3HashWithSeed(v6, 0);
  int v9 = WBSPasswordBreachMurmur3HashWithSeed(v6, v8);
  char v12 = 0;
  if (self->_hashCount)
  {
    int v10 = v9;
    unint64_t v11 = 0;
    do
    {
      v7[2](v7, v8 % self->_bucketCount, &v12);
      if (v12) {
        break;
      }
      ++v11;
      v8 += v10;
    }
    while (v11 < self->_hashCount);
  }
}

- (void)addData:(id)a3
{
  bucketData = self->_bucketData;
  id v5 = a3;
  id v6 = (NSData *) (id) [(NSData *)bucketData mutableCopy];
  uint64_t v7 = [(NSData *)v6 mutableBytes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__WBSPasswordBreachBloomFilter_addData___block_invoke;
  v10[3] = &unk_1E615BE20;
  v10[4] = self;
  v10[5] = v7;
  [(WBSPasswordBreachBloomFilter *)self _enumerateBucketIndexesForData:v5 withBlock:v10];

  unsigned int v8 = self->_bucketData;
  self->_bucketData = v6;
  int v9 = v6;
}

uint64_t __40__WBSPasswordBreachBloomFilter_addData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setBucketAtIndex:a2 inBuffer:*(void *)(a1 + 40)];
}

- (BOOL)containsData:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__WBSPasswordBreachBloomFilter_containsData___block_invoke;
  v6[3] = &unk_1E615BE48;
  v6[4] = self;
  v6[5] = &v7;
  [(WBSPasswordBreachBloomFilter *)self _enumerateBucketIndexesForData:v4 withBlock:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

uint64_t __45__WBSPasswordBreachBloomFilter_containsData___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) _getBucketAtIndex:a2];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (BOOL)containsLowercaseHexStringForData:(id)a3
{
  id v4 = objc_msgSend(NSString, "safari_stringAsHexWithData:", a3);
  id v5 = [v4 lowercaseString];

  id v6 = [v5 dataUsingEncoding:4];
  LOBYTE(self) = [(WBSPasswordBreachBloomFilter *)self containsData:v6];

  return (char)self;
}

- (NSData)serializedRepresentation
{
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToMemory];
  [v3 open];
  if (objc_msgSend(v3, "safari_writeNetworkOrderUInt16:", 45326))
  {
    if (objc_msgSend(v3, "safari_writeNetworkOrderUInt16:", 1))
    {
      if (objc_msgSend(v3, "safari_writeNetworkOrderUInt32:", self->_errorDenominator))
      {
        if (objc_msgSend(v3, "safari_writeNetworkOrderUInt32:", self->_capacity))
        {
          NSUInteger v4 = [(NSData *)self->_bucketData length];
          if (objc_msgSend(v3, "write:maxLength:", -[NSData bytes](self->_bucketData, "bytes"), v4) == v4)
          {
            [v3 close];
            id v5 = [v3 propertyForKey:*MEMORY[0x1E4F1C4C0]];
            goto LABEL_18;
          }
          char v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[WBSPasswordBreachBloomFilter serializedRepresentation]();
          }
        }
        else
        {
          uint64_t v9 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[WBSPasswordBreachBloomFilter serializedRepresentation]();
          }
        }
      }
      else
      {
        unsigned int v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[WBSPasswordBreachBloomFilter serializedRepresentation]();
        }
      }
    }
    else
    {
      uint64_t v7 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachBloomFilter serializedRepresentation].cold.4();
      }
    }
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachBloomFilter serializedRepresentation].cold.5();
    }
  }
  id v5 = 0;
LABEL_18:

  return (NSData *)v5;
}

- (id)description
{
  char v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; capcity = %u; errorDenominator = %u, hashCount = %lu, bucketCount = %lu>",
    v5,
    self,
    self->_capacity,
    self->_errorDenominator,
    self->_hashCount,
  id v6 = self->_bucketCount);

  return v6;
}

- (void).cxx_destruct
{
}

- (void)initWithSerializedRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Failed to read capacity.", v2, v3, v4, v5, v6);
}

- (void)initWithSerializedRepresentation:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Failed to read error denominator.", v2, v3, v4, v5, v6);
}

- (void)initWithSerializedRepresentation:(unsigned __int16 *)a1 .cold.3(unsigned __int16 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67240192;
  v3[1] = v2;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Unexpected version number %{public}d.", (uint8_t *)v3, 8u);
}

- (void)initWithSerializedRepresentation:.cold.4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Failed to read version.", v2, v3, v4, v5, v6);
}

- (void)initWithSerializedRepresentation:(unsigned __int16 *)a1 .cold.5(unsigned __int16 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67240192;
  v3[1] = v2;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Invalid magic number %{public}d.", (uint8_t *)v3, 8u);
}

- (void)initWithSerializedRepresentation:.cold.6()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Failed to read magic number.", v2, v3, v4, v5, v6);
}

- (void)initWithCapacity:errorDenominator:bucketData:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Invalid bloom filter capacity.", v2, v3, v4, v5, v6);
}

- (void)initWithCapacity:errorDenominator:bucketData:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Invalid bloom filter error rate.", v2, v3, v4, v5, v6);
}

- (void)initWithCapacity:errorDenominator:bucketData:.cold.3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Bucket data is the wrong length for the specified parameters.", v2, v3, v4, v5, v6);
}

- (void)serializedRepresentation
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_1B728F000, v0, v1, "Failed to write magic number.", v2, v3, v4, v5, v6);
}

@end