@interface RTDeletionRequestRecordIDTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (BOOL)dataCompressedWithOriginalSize:(unint64_t)a3 compressedSize:(unint64_t)a4;
- (id)compressData:(id)a3 algorithm:(int)a4;
- (id)decompressData:(id)a3 algorithm:(int)a4;
- (id)deprecatedDecompressData:(id)a3 algorithm:(int)a4;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation RTDeletionRequestRecordIDTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTDeletionRequestRecordIDTransformer transformedValue:]";
      __int16 v21 = 1024;
      int v22 = 51;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Object is not of dictionary type (in %s:%d)", buf, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v8 = [v6 allKeys];
    v9 = [v7 initWithCapacity:[v8 count]];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__RTDeletionRequestRecordIDTransformer_transformedValue___block_invoke;
    v17[3] = &unk_1E6B989A8;
    id v10 = v9;
    id v18 = v10;
    [v6 enumerateKeysAndObjectsUsingBlock:v17];
    id v16 = 0;
    v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:&v16];
    v12 = (char *)v16;
    if (v12)
    {
      v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_fault_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_FAULT, "error while encoding json object, %@", buf, 0xCu);
      }
    }
    v14 = [(RTDeletionRequestRecordIDTransformer *)self compressData:v11 algorithm:2049];
  }
  else
  {
LABEL_12:
    v14 = 0;
  }

  return v14;
}

void __57__RTDeletionRequestRecordIDTransformer_transformedValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v6 count]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = [v6 allObjects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) UUIDString];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) setObject:v7 forKey:v5];
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[RTDeletionRequestRecordIDTransformer reverseTransformedValue:]";
      __int16 v24 = 1024;
      int v25 = 88;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", buf, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(RTDeletionRequestRecordIDTransformer *)self decompressData:v4 algorithm:2049];
    id v21 = 0;
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v21];
    v8 = (char *)v21;
    if (v8)
    {
      uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v8;
        _os_log_fault_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_FAULT, "error while decoding json object, %@", buf, 0xCu);
      }
    }
    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = [v7 allKeys];
    uint64_t v12 = [v10 initWithCapacity:[v11 count]];

    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __64__RTDeletionRequestRecordIDTransformer_reverseTransformedValue___block_invoke;
    uint64_t v19 = &unk_1E6B9A648;
    id v20 = v12;
    id v13 = v12;
    [v7 enumerateKeysAndObjectsUsingBlock:&v16];
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v13, v16, v17, v18, v19];
  }
  else
  {
LABEL_12:
    long long v14 = 0;
  }

  return v14;
}

void __64__RTDeletionRequestRecordIDTransformer_reverseTransformedValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:[v6 count]];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
        id v14 = objc_alloc(MEMORY[0x1E4F29128]);
        long long v15 = [v14 initWithUUIDString:v13];
        [v7 addObject:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v16 = *(void **)(a1 + 32);
  uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithSet:v7];
  [v16 setObject:v17 forKey:v5];
}

- (id)compressData:(id)a3 algorithm:(int)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    size_t v8 = [v6 length];
    uint64_t v9 = (uint8_t *)malloc_type_malloc(v8, 0xFE86D180uLL);
    size_t v10 = compression_encode_scratch_buffer_size((compression_algorithm)a4);
    uint64_t v11 = malloc_type_realloc(0, v10, 0x14E1C64DuLL);
    id v12 = v7;
    v32 = v11;
    size_t v13 = compression_encode_buffer(v9, v8, (const uint8_t *)[v12 bytes], [v12 length], v11, (compression_algorithm)a4);
    BOOL v14 = -[RTDeletionRequestRecordIDTransformer dataCompressedWithOriginalSize:compressedSize:](self, "dataCompressedWithOriginalSize:compressedSize:", [v12 length], v13);
    unsigned int v15 = [v12 length];
    unint64_t v16 = v15;
    if (v14) {
      size_t v17 = v13;
    }
    else {
      size_t v17 = 0;
    }
    if (v14) {
      size_t v18 = v13;
    }
    else {
      size_t v18 = v15;
    }
    size_t v19 = v18 + 21;
    long long v20 = (char *)malloc_type_malloc(v18 + 21, 0xE81CC4F4uLL);
    *(_DWORD *)long long v20 = -17958194;
    *(void *)(v20 + 4) = v16;
    *(void *)(v20 + 12) = v17;
    v20[20] = v14;
    long long v21 = v9;
    size_t v22 = v13;
    if (!v14)
    {
      id v23 = v12;
      long long v21 = (uint8_t *)[v23 bytes];
      size_t v22 = [v23 length];
    }
    memcpy(v20 + 21, v21, v22);
    __int16 v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:v19];
    free(v20);
    int v25 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v26)
      {
        *(_DWORD *)buf = 134218496;
        unint64_t v34 = v16;
        __int16 v35 = 2048;
        size_t v36 = v13;
        __int16 v37 = 2048;
        double v38 = (float)((float)v16 / (float)v13);
        v27 = "compressed deletion request data, original data length, %llu, compressed data length, %llu, compression ratio, %.2fx";
        v28 = v25;
        uint32_t v29 = 32;
LABEL_18:
        _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, v27, buf, v29);
      }
    }
    else if (v26)
    {
      *(_WORD *)buf = 0;
      v27 = "did not compress deletion request data";
      v28 = v25;
      uint32_t v29 = 2;
      goto LABEL_18;
    }

    if (v9) {
      free(v9);
    }
    if (v32) {
      free(v32);
    }
    goto LABEL_23;
  }
  v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataToCompress", buf, 2u);
  }

  __int16 v24 = 0;
LABEL_23:

  return v24;
}

- (BOOL)dataCompressedWithOriginalSize:(unint64_t)a3 compressedSize:(unint64_t)a4
{
  if (a4) {
    BOOL v4 = a4 >= a3;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (id)decompressData:(id)a3 algorithm:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataToDecompress", buf, 2u);
    }

    goto LABEL_7;
  }
  int v24 = 0;
  [v6 getBytes:&v24 length:4];
  if (v24 == -559038737)
  {
    id v8 = [(RTDeletionRequestRecordIDTransformer *)self deprecatedDecompressData:v7 algorithm:v4];
LABEL_10:
    size_t v10 = v8;
    goto LABEL_11;
  }
  if (v24 == 123)
  {
    id v8 = v7;
    goto LABEL_10;
  }
  if (v24 != -17958194)
  {
    size_t v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      long long v21 = (objc_class *)objc_opt_class();
      size_t v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412290;
      BOOL v26 = v22;
      _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Unhandled header version in %@", buf, 0xCu);
    }
LABEL_7:
    size_t v10 = 0;
    goto LABEL_11;
  }
  *(void *)id v23 = 0;
  *(void *)&v23[8] = 0;
  *(void *)&v23[13] = 0;
  [v7 getBytes:v23 length:21];
  if (!v23[20])
  {
    [v7 subdataWithRange:21, *(void *)&v23[4]];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  id v12 = malloc_type_malloc(*(size_t *)&v23[4], 0x24B00C88uLL);
  size_t v13 = compression_decode_scratch_buffer_size((compression_algorithm)v4);
  BOOL v14 = malloc_type_realloc(0, v13, 0x450C7083uLL);
  unsigned int v15 = [v7 subdataWithRange:21, *(void *)&v23[12]];
  size_t v16 = *(void *)&v23[4];
  id v17 = v15;
  size_t v18 = (const uint8_t *)[v17 bytes];
  if (compression_decode_buffer((uint8_t *)v12, v16, v18, *(size_t *)&v23[12], v14, (compression_algorithm)v4))
  {
    size_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:*(void *)&v23[4] freeWhenDone:1];
  }
  else
  {
    long long v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      BOOL v26 = *(void **)&v23[4];
      __int16 v27 = 2048;
      uint64_t v28 = *(void *)&v23[12];
      _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "failed to decompress deletion record data that was compresssed. original data length, %llu, compressed data length, %llu", buf, 0x16u);
    }

    if (v12) {
      free(v12);
    }
    size_t v10 = 0;
  }
  if (v14) {
    free(v14);
  }

LABEL_11:

  return v10;
}

- (id)deprecatedDecompressData:(id)a3 algorithm:(int)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    unint64_t v21 = 0;
    [v5 getBytes:&v21 range:4, 8];
    unint64_t v7 = HIDWORD(v21);
    if (HIDWORD(v21))
    {
      size_t v8 = v21;
      *(void *)buf = v21;
    }
    else
    {
      *(void *)buf = v21;
      [v6 getBytes:buf range:4, 8];
      size_t v8 = *(void *)buf;
    }
    uint64_t v11 = malloc_type_malloc(v8, 0x762A731FuLL);
    size_t v12 = compression_encode_scratch_buffer_size((compression_algorithm)a4);
    if (v12) {
      size_t v13 = malloc_type_malloc(v12, 0x5EB7E621uLL);
    }
    else {
      size_t v13 = 0;
    }
    if (v7) {
      uint64_t v14 = 8;
    }
    else {
      uint64_t v14 = 12;
    }
    unsigned int v15 = [v6 subdataWithRange:v14 length:[v6 length] - v14];
    size_t v16 = *(void *)buf;
    id v17 = v15;
    if (compression_decode_buffer((uint8_t *)v11, v16, (const uint8_t *)[v17 bytes], objc_msgSend(v17, "length"), v13, (compression_algorithm)a4))
    {
      size_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v11 length:*(void *)buf freeWhenDone:1];
      if (!v13)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      size_t v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long v20 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Failure to decompress legacy buffer that was compresssed", v20, 2u);
      }

      if (v11) {
        free(v11);
      }
      size_t v10 = 0;
      if (!v13) {
        goto LABEL_17;
      }
    }
    free(v13);
    goto LABEL_17;
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataToDecompress", buf, 2u);
  }

  size_t v10 = 0;
LABEL_18:

  return v10;
}

@end