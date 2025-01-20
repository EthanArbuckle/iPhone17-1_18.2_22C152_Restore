@interface MSVSegmentedDecoder
+ (id)decodedObjectOfClass:(Class)a3 fromPackage:(id)a4 error:(id *)a5;
+ (id)decodedObjectOfClass:(Class)a3 fromPackage:(id)a4 userInfo:(id)a5 error:(id *)a6;
+ (id)decodedObjectOfClasses:(id)a3 fromPackage:(id)a4 error:(id *)a5;
+ (id)decodedObjectOfClasses:(id)a3 fromPackage:(id)a4 userInfo:(id)a5 error:(id *)a6;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (Class)rootClass;
- (MSVSegmentedCodingPackage)package;
- (MSVSegmentedDecoder)initWithCodingPackage:(id)a3 error:(id *)a4;
- (MSVSegmentedDecoder)initWithCodingPackage:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (NSArray)subcoders;
- (NSDictionary)userInfo;
- (NSError)decodeError;
- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)_coderForKey:(id)a3;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (id)decodeRootObjectOfClass:(Class)a3 error:(id *)a4;
- (id)decodeRootObjectOfClasses:(id)a3 error:(id *)a4;
- (id)error;
- (id)msv_userInfo;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodingFailurePolicy;
- (void)msv_setUserInfo:(id)a3;
- (void)setDecodeError:(id)a3;
- (void)setPackage:(id)a3;
- (void)setRootClass:(Class)a3;
- (void)setSubcoders:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MSVSegmentedDecoder

- (id)decodeRootObjectOfClasses:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (([v7 containsObject:self->_rootClass] & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"MSVSegmentedEncoder.m", 223, @"Attempt to decode package of archived class: %@", self->_rootClass object file lineNumber description];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v8 = self->_subcoders;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) beginDecodingPartialTopLevelObjectOfClasses:v7];
      }
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  v12 = (void *)[objc_alloc(self->_rootClass) initWithCoder:self];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v13 = self->_subcoders;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * j) finishDecodingPartialTopLevelObject];
      }
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v14);
  }

  v17 = [(MSVSegmentedCodingPackage *)self->_package allVersions];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__MSVSegmentedDecoder_decodeRootObjectOfClasses_error___block_invoke;
  v23[3] = &unk_1E5AD9780;
  id v18 = v12;
  id v24 = v18;
  [v17 enumerateKeysAndObjectsUsingBlock:v23];

  v19 = [(MSVSegmentedDecoder *)self error];
  if (v19)
  {

    if (a4) {
      *a4 = v19;
    }
    [(MSVSegmentedDecoder *)self __setError:0];
    id v18 = 0;
  }
  else if (a4 && !v18)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E4F281F8], 4865, @"failed to decode root object");
    id v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v20 = v18;

  return v20;
}

- (id)error
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_subcoders;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "error", (void)v11);
        if (v8)
        {
          uint64_t v9 = (void *)v8;

          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = [(MSVSegmentedDecoder *)self decodeError];
LABEL_11:
  return v9;
}

- (NSError)decodeError
{
  return self->_decodeError;
}

- (double)decodeDoubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSVSegmentedDecoder *)self _coderForKey:v4];
  [v5 decodeDoubleForKey:v4];
  double v7 = v6;

  return v7;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSVSegmentedDecoder *)self _coderForKey:v4];
  int64_t v6 = [v5 decodeInt64ForKey:v4];

  return v6;
}

- (BOOL)containsValueForKey:(id)a3
{
  v3 = [(MSVSegmentedDecoder *)self _coderForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_coderForKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_subcoders;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsValueForKey:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (MSVSegmentedDecoder)initWithCodingPackage:(id)a3 error:(id *)a4
{
  return [(MSVSegmentedDecoder *)self initWithCodingPackage:a3 userInfo:0 error:a4];
}

- (MSVSegmentedDecoder)initWithCodingPackage:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MSVSegmentedDecoder;
  long long v11 = [(MSVSegmentedDecoder *)&v34 init];
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = [v10 copy];
  long long v13 = (void *)v12;
  id v14 = (id)MEMORY[0x1E4F1CC08];
  if (v12) {
    uint64_t v15 = (void *)v12;
  }
  else {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CC08];
  }
  objc_storeStrong((id *)&v11->_userInfo, v15);

  objc_storeStrong((id *)&v11->_package, a3);
  uint64_t v16 = [(MSVSegmentedCodingPackage *)v11->_package archivedClass];
  Class rootClass = v11->_rootClass;
  v11->_Class rootClass = (Class)v16;

  package = v11->_package;
  id v33 = 0;
  uint64_t v19 = [(MSVSegmentedCodingPackage *)package decodersWithError:&v33];
  id v20 = v33;
  subcoders = v11->_subcoders;
  v11->_subcoders = (NSArray *)v19;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v22 = v11->_subcoders;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    if (v10) {
      id v14 = v10;
    }
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "msv_setUserInfo:", v14, (void)v29);
      }
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v24);
  }

  if (v20)
  {
    if (a5) {
      *a5 = v20;
    }

    long long v27 = 0;
  }
  else
  {
LABEL_17:
    long long v27 = v11;
  }

  return v27;
}

void __55__MSVSegmentedDecoder_decodeRootObjectOfClasses_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v4, "didRestoreVersion:forSegment:", objc_msgSend(a3, "integerValue"), v5);
}

- (id)decodeRootObjectOfClass:(Class)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  uint64_t v7 = [(MSVSegmentedDecoder *)self decodeRootObjectOfClasses:v6 error:a4];

  return v7;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_subcoders;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "decodeObjectOfClasses:forKey:", v6, v7, (void)v16);
        if (v13)
        {
          id v14 = (void *)v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodeError, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_subcoders, 0);
  objc_storeStrong((id *)&self->_rootClass, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

- (void)setDecodeError:(id)a3
{
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setSubcoders:(id)a3
{
}

- (NSArray)subcoders
{
  return self->_subcoders;
}

- (void)setRootClass:(Class)a3
{
}

- (Class)rootClass
{
  return self->_rootClass;
}

- (void)setPackage:(id)a3
{
}

- (MSVSegmentedCodingPackage)package
{
  return self->_package;
}

- (void)msv_setUserInfo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSDictionary *)[v4 copy];
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = self->_subcoders;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "msv_setUserInfo:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)msv_userInfo
{
  if (self->_userInfo) {
    return self->_userInfo;
  }
  else {
    return MEMORY[0x1E4F1CC08];
  }
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_subcoders;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v16 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v12, "decodeBytesForKey:returnedLength:", v6, a4, (void)v16);
        if (v13)
        {
          long long v14 = (const char *)v13;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  long long v14 = 0;
LABEL_11:

  return v14;
}

- (float)decodeFloatForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(MSVSegmentedDecoder *)self _coderForKey:v4];
  [v5 decodeFloatForKey:v4];
  float v7 = v6;

  return v7;
}

- (int)decodeInt32ForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(MSVSegmentedDecoder *)self _coderForKey:v4];
  int v6 = [v5 decodeInt32ForKey:v4];

  return v6;
}

- (int)decodeIntForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(MSVSegmentedDecoder *)self _coderForKey:v4];
  int v6 = [v5 decodeIntForKey:v4];

  return v6;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(MSVSegmentedDecoder *)self _coderForKey:v4];
  char v6 = [v5 decodeBoolForKey:v4];

  return v6;
}

- (int64_t)decodingFailurePolicy
{
  return 1;
}

+ (id)decodedObjectOfClasses:(id)a3 fromPackage:(id)a4 userInfo:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v19 = 0;
  id v12 = [[MSVSegmentedDecoder alloc] initWithCodingPackage:v11 userInfo:v10 error:&v19];

  id v13 = v19;
  if (v13)
  {
    id v14 = v13;
    id v15 = 0;
  }
  else
  {
    id v18 = 0;
    id v15 = [(MSVSegmentedDecoder *)v12 decodeRootObjectOfClasses:v9 error:&v18];
    id v14 = v18;
    if (!v14)
    {
      id v15 = v15;
      long long v16 = v15;
      goto LABEL_8;
    }
  }
  if (a6)
  {
    id v14 = v14;
    long long v16 = 0;
    *a6 = v14;
  }
  else
  {
    long long v16 = 0;
  }
LABEL_8:

  return v16;
}

+ (id)decodedObjectOfClasses:(id)a3 fromPackage:(id)a4 error:(id *)a5
{
  return (id)[a1 decodedObjectOfClasses:a3 fromPackage:a4 userInfo:0 error:a5];
}

+ (id)decodedObjectOfClass:(Class)a3 fromPackage:(id)a4 userInfo:(id)a5 error:(id *)a6
{
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 setWithObject:a3];
  id v14 = [a1 decodedObjectOfClasses:v13 fromPackage:v12 userInfo:v11 error:a6];

  return v14;
}

+ (id)decodedObjectOfClass:(Class)a3 fromPackage:(id)a4 error:(id *)a5
{
  return (id)[a1 decodedObjectOfClass:a3 fromPackage:a4 userInfo:0 error:a5];
}

@end