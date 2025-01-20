@interface APOdmlVector
+ (BOOL)supportsSecureCoding;
- (APOdmlVector)initWithCoder:(id)a3;
- (APOdmlVector)initWithDictionary:(id)a3;
- (APOdmlVector)initWithVersion:(id)a3 andArray:(id)a4;
- (APOdmlVector)initWithVersion:(id)a3 data:(id)a4;
- (APOdmlVector)initWithVersion:(id)a3 length:(unsigned int)a4 floats:(float *)a5;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSString)version;
- (float)_createDataPtrFromArray:(id)a3;
- (float)dotProduct:(id)a3;
- (float)magnitude;
- (id)_initWithVersion:(id)a3 length:(unsigned int)a4 rawMallocedFloats:(float *)a5;
- (id)arrayOfNumbers;
- (id)cosineSimilarity:(id)a3;
- (id)dictionaryRepresentation;
- (id)scalarMultiply:(float)a3;
- (id)vectorAdd:(id)a3;
- (id)vectorSubtract:(id)a3;
- (unint64_t)hash;
- (unsigned)length;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setArrayOfNumber:(id)a3;
- (void)setDataPtr:(float *)a3;
- (void)setVersion:(id)a3;
@end

@implementation APOdmlVector

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (APOdmlVector *)a3;
  if (v4 == self)
  {
    BOOL v28 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v8 = objc_msgSend_version(self, v6, v7);
      v11 = objc_msgSend_version(v5, v9, v10);
      int isEqualToString = objc_msgSend_isEqualToString_(v8, v12, (uint64_t)v11);

      v16 = objc_msgSend_data(self, v14, v15);
      v19 = objc_msgSend_data(v5, v17, v18);
      char isEqualToData = objc_msgSend_isEqualToData_(v16, v20, (uint64_t)v19);

      int v24 = objc_msgSend_length(self, v22, v23);
      if (v24 == objc_msgSend_length(v5, v25, v26)) {
        BOOL v27 = isEqualToData;
      }
      else {
        BOOL v27 = 0;
      }
      if (isEqualToString) {
        BOOL v28 = v27;
      }
      else {
        BOOL v28 = 0;
      }
    }
    else
    {
      BOOL v28 = 0;
    }
  }

  return v28;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_version(self, a2, v2);
  uint64_t v7 = objc_msgSend_hash(v4, v5, v6);
  uint64_t v10 = objc_msgSend_length(self, v8, v9);
  v13 = objc_msgSend_data(self, v11, v12);
  unint64_t v16 = v7 ^ objc_msgSend_hash(v13, v14, v15) ^ v10;

  return v16;
}

- (APOdmlVector)initWithVersion:(id)a3 length:(unsigned int)a4 floats:(float *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APOdmlVector;
  uint64_t v10 = [(APOdmlVector *)&v17 init];
  if (!v10) {
    goto LABEL_4;
  }
  v11 = (float *)malloc_type_malloc(4 * a4, 0x6F2D36FBuLL);
  v10->_dataPtr = v11;
  if (v11)
  {
    memcpy(v11, a5, 4 * a4);
    v10->_length = a4;
    objc_storeStrong((id *)&v10->_version, a3);
LABEL_4:
    uint64_t v12 = v10;
    goto LABEL_8;
  }
  v13 = OdmlLogForCategory(2uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v19 = v14;
    __int16 v20 = 1024;
    unsigned int v21 = 4 * a4;
    id v15 = v14;
    _os_log_impl(&dword_1BBC44000, v13, OS_LOG_TYPE_ERROR, "[%@] ERROR: Could not alloc space of %ul", buf, 0x12u);
  }
  uint64_t v12 = 0;
LABEL_8:

  return v12;
}

- (APOdmlVector)initWithVersion:(id)a3 data:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)APOdmlVector;
  id v11 = [(APOdmlVector *)&v20 init];
  if (!v11) {
    goto LABEL_4;
  }
  unsigned int v12 = objc_msgSend_length(v8, v9, v10);
  v13 = malloc_type_malloc(v12, 0xEB7B0FE3uLL);
  *((void *)v11 + 1) = v13;
  if (v13)
  {
    *((_DWORD *)v11 + 4) = v12 >> 2;
    objc_storeStrong((id *)v11 + 3, a3);
    objc_msgSend_getBytes_range_(v8, v14, *((void *)v11 + 1), 0, v12);
LABEL_4:
    id v15 = (APOdmlVector *)v11;
    goto LABEL_8;
  }
  unint64_t v16 = OdmlLogForCategory(2uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    objc_super v17 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v17;
    __int16 v23 = 1024;
    unsigned int v24 = v12;
    id v18 = v17;
    _os_log_impl(&dword_1BBC44000, v16, OS_LOG_TYPE_ERROR, "[%@] ERROR: Could not alloc space of %ul", buf, 0x12u);
  }
  id v15 = 0;
LABEL_8:

  return v15;
}

- (APOdmlVector)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v7 = objc_msgSend_objectForKey_ofKindOfClass_(v4, v6, @"vector", v5);
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = objc_msgSend_objectForKey_ofKindOfClass_(v4, v9, @"version", v8);
  v13 = objc_msgSend_copy(v10, v11, v12);

  if (v7) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    unint64_t v16 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138413058;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2112;
      __int16 v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v7;
      __int16 v26 = 2112;
      id v27 = v4;
      id v17 = v21;
      _os_log_impl(&dword_1BBC44000, v16, OS_LOG_TYPE_ERROR, "[%@] ERROR: Invalid dictionary\nVersion:\t%@\nVector:\t%@\nDict:\t%@", (uint8_t *)&v20, 0x2Au);
    }
    id v18 = 0;
  }
  else
  {
    self = (APOdmlVector *)(id)objc_msgSend_initWithVersion_andArray_(self, v14, (uint64_t)v13, v7);
    id v18 = self;
  }

  return v18;
}

- (APOdmlVector)initWithVersion:(id)a3 andArray:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)APOdmlVector;
  uint64_t v8 = [(APOdmlVector *)&v23 init];
  uint64_t v10 = v8;
  if (v8
    && (v8->_dataPtr = (float *)objc_msgSend__createDataPtrFromArray_(v8, v9, (uint64_t)v7),
        v10->_length = objc_msgSend_count(v7, v11, v12),
        uint64_t v15 = objc_msgSend_copy(v6, v13, v14),
        unint64_t v16 = v10->_version,
        v10->_version = (NSString *)v15,
        v16,
        !v10->_version))
  {
    id v18 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      version = v10->_version;
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      id v27 = version;
      __int16 v28 = 2112;
      id v29 = v7;
      id v21 = v19;
      _os_log_impl(&dword_1BBC44000, v18, OS_LOG_TYPE_ERROR, "[%@] ERROR: Invalid initializer\nVersion:\t%@\nVector:\t%@", buf, 0x20u);
    }
    id v17 = 0;
  }
  else
  {
    id v17 = v10;
  }

  return v17;
}

- (APOdmlVector)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APOdmlVector;
  uint64_t v5 = [(APOdmlVector *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, @"vector");
    v5->_dataPtr = (float *)objc_msgSend__createDataPtrFromArray_(v5, v9, (uint64_t)v8);
    v5->_length = objc_msgSend_count(v8, v10, v11);
    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"version");
    objc_msgSend_setVersion_(v5, v15, (uint64_t)v14);
  }
  return v5;
}

- (id)_initWithVersion:(id)a3 length:(unsigned int)a4 rawMallocedFloats:(float *)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APOdmlVector;
  uint64_t v10 = [(APOdmlVector *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_dataPtr = a5;
    v10->_length = a4;
    objc_storeStrong((id *)&v10->_version, a3);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_arrayOfNumbers(self, v5, v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)v12, @"vector");
  uint64_t v10 = objc_msgSend_version(self, v8, v9);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v10, @"version");
}

- (void)dealloc
{
  dataPtr = self->_dataPtr;
  if (dataPtr) {
    free(dataPtr);
  }
  v4.receiver = self;
  v4.super_class = (Class)APOdmlVector;
  [(APOdmlVector *)&v4 dealloc];
}

- (void)setDataPtr:(float *)a3
{
  dataPtr = self->_dataPtr;
  if (dataPtr) {
    free(dataPtr);
  }
  self->_dataPtr = a3;
}

- (float)_createDataPtrFromArray:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v6 = v3;
  if (v3 && (size_t v7 = 4 * objc_msgSend_count(v3, v4, v5)) != 0)
  {
    uint64_t v10 = (float *)malloc_type_malloc(v7, 0x1F4B7942uLL);
    if (v10)
    {
      uint64_t v11 = objc_msgSend_count(v6, v8, v9);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v12 = v6;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, v28, 16);
      if (v14)
      {
        uint64_t v17 = v14;
        id v18 = &v10[v11];
        uint64_t v19 = *(void *)v25;
        int v20 = v10;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v12);
            }
            if (v20 < v18)
            {
              objc_msgSend_floatValue(*(void **)(*((void *)&v24 + 1) + 8 * v21), v15, v16, (void)v24);
              *(_DWORD *)v20++ = v22;
            }
            ++v21;
          }
          while (v17 != v21);
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v24, v28, 16);
        }
        while (v17);
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)arrayOfNumbers
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  size_t v7 = objc_msgSend_initWithCapacity_(v3, v4, self->_length);
  if (self->_length)
  {
    unint64_t v9 = 0;
    do
    {
      *(float *)&double v8 = self->_dataPtr[v9];
      uint64_t v10 = objc_msgSend_numberWithFloat_(NSNumber, v5, v6, v8);
      objc_msgSend_addObject_(v7, v11, (uint64_t)v10);

      ++v9;
    }
    while (v9 < self->_length);
  }
  id v12 = objc_msgSend_copy(v7, v5, v6);

  return v12;
}

- (void)setArrayOfNumber:(id)a3
{
  id v4 = a3;
  uint64_t DataPtrFromArray = objc_msgSend__createDataPtrFromArray_(self, v5, (uint64_t)v4);
  objc_msgSend_setDataPtr_(self, v7, DataPtrFromArray);
  unsigned int v10 = objc_msgSend_count(v4, v8, v9);

  self->_length = v10;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (self->_dataPtr)
  {
    size_t v7 = objc_msgSend_arrayOfNumbers(self, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"vector");
  }
  version = self->_version;
  if (version) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)version, @"version");
  }
  unsigned int v10 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)v6);

  return v10;
}

- (NSData)data
{
  uint64_t v3 = 4 * self->_length;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA58]);
  uint64_t v6 = objc_msgSend_initWithCapacity_(v4, v5, 4 * v3);
  uint64_t v9 = v6;
  if (v3)
  {
    dataPtr = self->_dataPtr;
    if (dataPtr) {
      objc_msgSend_appendBytes_length_(v6, v7, (uint64_t)dataPtr, v3);
    }
  }
  unsigned int v10 = objc_msgSend_copy(v9, v7, (uint64_t)dataPtr);

  return (NSData *)v10;
}

- (id)scalarMultiply:(float)a3
{
  float __B = a3;
  id v4 = (float *)malloc_type_malloc(4 * self->_length, 0x5E1537BFuLL);
  if (v4)
  {
    uint64_t v5 = v4;
    vDSP_vsmul(self->_dataPtr, 1, &__B, v4, 1, self->_length);
    uint64_t v6 = [APOdmlVector alloc];
    uint64_t v9 = objc_msgSend_version(self, v7, v8);
    uint64_t v11 = objc_msgSend__initWithVersion_length_rawMallocedFloats_(v6, v10, (uint64_t)v9, self->_length, v5);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (float)dotProduct:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = (const float **)a3;
  size_t v7 = objc_msgSend_version(self, v5, v6);
  unsigned int v10 = objc_msgSend_version(v4, v8, v9);
  uint64_t v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);

  float v15 = 0.0;
  if (!v12)
  {
    int v16 = objc_msgSend_length(self, v13, v14);
    if (v16 == objc_msgSend_length(v4, v17, v18))
    {
      int v27 = 0;
      vDSP_dotpr(self->_dataPtr, 1, v4[1], 1, (float *)&v27, self->_length);
      float v15 = *(float *)&v27;
    }
    else
    {
      uint64_t v19 = OdmlLogForCategory(2uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = objc_opt_class();
        id v21 = v20;
        int v27 = 138412802;
        __int16 v28 = v20;
        __int16 v29 = 2048;
        uint64_t v30 = objc_msgSend_length(self, v22, v23);
        __int16 v31 = 2048;
        uint64_t v32 = objc_msgSend_length(v4, v24, v25);
        _os_log_impl(&dword_1BBC44000, v19, OS_LOG_TYPE_ERROR, "[%@] ERROR: (Dot Product) Vectors are not of equal length:\nSelf: %lu\t Input: %lu", (uint8_t *)&v27, 0x20u);
      }
    }
  }

  return v15;
}

- (id)vectorAdd:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = (const float **)a3;
  size_t v7 = objc_msgSend_version(self, v5, v6);
  unsigned int v10 = objc_msgSend_version(v4, v8, v9);
  uint64_t v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);

  if (v12)
  {
LABEL_8:
    uint64_t v23 = self;
    goto LABEL_9;
  }
  unsigned int length = self->_length;
  if (length != objc_msgSend_length(v4, v13, v14))
  {
    long long v24 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_opt_class();
      id v26 = v25;
      int v32 = 138412802;
      uint64_t v33 = v25;
      __int16 v34 = 2048;
      uint64_t v35 = objc_msgSend_length(self, v27, v28);
      __int16 v36 = 2048;
      uint64_t v37 = objc_msgSend_length(v4, v29, v30);
      _os_log_impl(&dword_1BBC44000, v24, OS_LOG_TYPE_ERROR, "[%@] ERROR: (Vector Add) Vectors are not of equal length:\nSelf: %lu\t Input: %lu", (uint8_t *)&v32, 0x20u);
    }
    goto LABEL_8;
  }
  int v16 = (float *)malloc_type_malloc(4 * self->_length, 0xD77119D0uLL);
  if (v16)
  {
    uint64_t v17 = v16;
    vDSP_vadd(self->_dataPtr, 1, v4[1], 1, v16, 1, self->_length);
    uint64_t v18 = [APOdmlVector alloc];
    id v21 = objc_msgSend_version(self, v19, v20);
    uint64_t v23 = (APOdmlVector *)objc_msgSend__initWithVersion_length_rawMallocedFloats_(v18, v22, (uint64_t)v21, self->_length, v17);
  }
  else
  {
    uint64_t v23 = 0;
  }
LABEL_9:

  return v23;
}

- (id)vectorSubtract:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = (const float **)a3;
  size_t v7 = objc_msgSend_version(self, v5, v6);
  unsigned int v10 = objc_msgSend_version(v4, v8, v9);
  uint64_t v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);

  if (v12)
  {
LABEL_8:
    uint64_t v25 = self;
    goto LABEL_9;
  }
  int v15 = objc_msgSend_length(self, v13, v14);
  if (v15 != objc_msgSend_length(v4, v16, v17))
  {
    id v26 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = objc_opt_class();
      id v28 = v27;
      int v34 = 138412802;
      uint64_t v35 = v27;
      __int16 v36 = 2048;
      uint64_t v37 = objc_msgSend_length(self, v29, v30);
      __int16 v38 = 2048;
      uint64_t v39 = objc_msgSend_length(v4, v31, v32);
      _os_log_impl(&dword_1BBC44000, v26, OS_LOG_TYPE_ERROR, "[%@] ERROR: (Vector Subtract) Vectors are not of equal length:\nSelf: %lu\t Input: %lu", (uint8_t *)&v34, 0x20u);
    }
    goto LABEL_8;
  }
  uint64_t v18 = (float *)malloc_type_malloc(4 * self->_length, 0xC9564264uLL);
  if (v18)
  {
    uint64_t v19 = v18;
    vDSP_vsub(v4[1], 1, self->_dataPtr, 1, v18, 1, self->_length);
    uint64_t v20 = [APOdmlVector alloc];
    uint64_t v23 = objc_msgSend_version(self, v21, v22);
    uint64_t v25 = (APOdmlVector *)objc_msgSend__initWithVersion_length_rawMallocedFloats_(v20, v24, (uint64_t)v23, self->_length, v19);
  }
  else
  {
    uint64_t v25 = 0;
  }
LABEL_9:

  return v25;
}

- (float)magnitude
{
  float __C = 0.0;
  dataPtr = self->_dataPtr;
  unsigned int v4 = objc_msgSend_length(self, a2, v2);
  vDSP_svesq(dataPtr, 1, &__C, v4);
  return sqrtf(__C);
}

- (id)cosineSimilarity:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v7 = objc_msgSend_version(self, v5, v6);
  unsigned int v10 = objc_msgSend_version(v4, v8, v9);
  uint64_t v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);

  if (v12) {
    goto LABEL_17;
  }
  int v15 = objc_msgSend_length(self, v13, v14);
  if (v15 != objc_msgSend_length(v4, v16, v17))
  {
    uint64_t v32 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = objc_opt_class();
      id v38 = v37;
      int v45 = 138412802;
      id v46 = v37;
      __int16 v47 = 2048;
      *(void *)&double v48 = objc_msgSend_length(self, v39, v40);
      __int16 v49 = 2048;
      *(void *)&double v50 = objc_msgSend_length(v4, v41, v42);
      _os_log_impl(&dword_1BBC44000, v32, OS_LOG_TYPE_ERROR, "[%@] ERROR: (Cosine Similarity) Vectors are not of equal length:\nSelf: %lu\t Input: %lu", (uint8_t *)&v45, 0x20u);
    }
    goto LABEL_16;
  }
  objc_msgSend_magnitude(self, v18, v19);
  float v21 = v20;
  objc_msgSend_magnitude(v4, v22, v23);
  float v26 = v25;
  if (v21 == 0.0 || v25 == 0.0)
  {
    uint64_t v32 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v45 = 138412802;
      id v46 = (id)objc_opt_class();
      __int16 v47 = 2048;
      double v48 = v21;
      __int16 v49 = 2048;
      double v50 = v26;
      id v33 = v46;
      int v34 = "[%@] ERROR: We are going to divide by zero:\nOur Magnitude:\t%f\nVec Magnitude:\t%f";
      uint64_t v35 = v32;
      uint32_t v36 = 32;
      goto LABEL_15;
    }
LABEL_16:

LABEL_17:
    v43 = 0;
    goto LABEL_18;
  }
  objc_msgSend_dotProduct_(self, v24, (uint64_t)v4);
  float v30 = *(float *)&v29 / (float)(v21 * v26);
  if (v30 < -1.0 || v30 > 1.0)
  {
    uint64_t v32 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v45 = 138412546;
      id v46 = (id)objc_opt_class();
      __int16 v47 = 2048;
      double v48 = v30;
      id v33 = v46;
      int v34 = "[%@] ERROR: Cosine Similarity is out of bounds: %f";
      uint64_t v35 = v32;
      uint32_t v36 = 22;
LABEL_15:
      _os_log_impl(&dword_1BBC44000, v35, OS_LOG_TYPE_ERROR, v34, (uint8_t *)&v45, v36);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  *(float *)&double v29 = v30;
  v43 = objc_msgSend_numberWithFloat_(NSNumber, v27, v28, v29);
LABEL_18:

  return v43;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (unsigned)length
{
  return self->_length;
}

- (void).cxx_destruct
{
}

@end