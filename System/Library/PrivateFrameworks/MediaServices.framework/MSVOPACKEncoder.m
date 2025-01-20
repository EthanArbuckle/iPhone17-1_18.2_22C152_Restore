@interface MSVOPACKEncoder
+ (id)encodedDataWithRootObject:(id)a3 error:(id *)a4;
+ (id)encodedDataWithRootObject:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (BOOL)allowsKeyedCoding;
- (BOOL)finishEncodingWithError:(id *)a3;
- (BOOL)hasFinished;
- (BOOL)hasTopLevelData;
- (BOOL)requiresSecureCoding;
- (MSVOPACKEncoder)init;
- (NSData)encodedData;
- (NSDictionary)userInfo;
- (NSMapTable)objectLookupTable;
- (NSMutableArray)objects;
- (NSMutableArray)wrapperStack;
- (id)_convertNumber:(id)a3;
- (id)_convertObject:(id)a3;
- (id)encodedDataWithError:(id *)a3;
- (id)msv_userInfo;
- (void)_encodeNumber:(id)a3 forKey:(id)a4;
- (void)beginEncodingPartialTopLevelObject:(id)a3;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeRootObject:(id)a3;
- (void)finishEncoding;
- (void)finishEncodingPartialTopLevelObject;
- (void)msv_setUserInfo:(id)a3;
- (void)setHasFinished:(BOOL)a3;
@end

@implementation MSVOPACKEncoder

- (BOOL)allowsKeyedCoding
{
  return 1;
}

+ (id)encodedDataWithRootObject:(id)a3 error:(id *)a4
{
  return (id)[a1 encodedDataWithRootObject:a3 userInfo:0 error:a4];
}

- (void)finishEncodingPartialTopLevelObject
{
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(MSVOPACKEncoder *)self _encodeNumber:v8 forKey:v7];
}

+ (id)encodedDataWithRootObject:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(MSVOPACKEncoder);
  v10 = v9;
  if (v7) {
    id v11 = v7;
  }
  else {
    id v11 = (id)MEMORY[0x1E4F1CC08];
  }
  [(MSVOPACKEncoder *)v9 msv_setUserInfo:v11];

  [(MSVOPACKEncoder *)v10 encodeRootObject:v8];
  v12 = [(MSVOPACKEncoder *)v10 encodedDataWithError:a5];

  return v12;
}

- (void)msv_setUserInfo:(id)a3
{
  self->_userInfo = (NSDictionary *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (MSVOPACKEncoder)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSVOPACKEncoder;
  v2 = [(MSVOPACKEncoder *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    wrapperStack = v2->_wrapperStack;
    v2->_wrapperStack = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    objects = v2->_objects;
    v2->_objects = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] msvIndexMapTableWithCapacity:0];
    objectLookupTable = v2->_objectLookupTable;
    v2->_objectLookupTable = (NSMapTable *)v7;
  }
  return v2;
}

- (id)encodedDataWithError:(id *)a3
{
  if (![(MSVOPACKEncoder *)self hasFinished]) {
    [(MSVOPACKEncoder *)self finishEncodingWithError:a3];
  }
  encodedData = self->_encodedData;
  return encodedData;
}

- (BOOL)finishEncodingWithError:(id *)a3
{
  if ([(MSVOPACKEncoder *)self hasFinished]) {
    return 1;
  }
  int v10 = 0;
  v6 = (NSData *)MEMORY[0x1A62419A0](self->_objects, 0, &v10);
  encodedData = self->_encodedData;
  self->_encodedData = v6;

  if (a3) {
    BOOL v8 = v10 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v5 = v8;
  if (!v8)
  {
    NSErrorWithOSStatusF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(MSVOPACKEncoder *)self setHasFinished:1];
  return v5;
}

- (BOOL)hasFinished
{
  return self->_hasFinished;
}

- (void)setHasFinished:(BOOL)a3
{
  self->_hasFinished = a3;
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [(MSVOPACKEncoder *)self _encodeNumber:v8 forKey:v7];
}

- (void)_encodeNumber:(id)a3 forKey:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 unsignedLongValue] & 0x80000000) != 0)
  {
    id v8 = [(NSMutableArray *)self->_wrapperStack lastObject];
    v9 = [v8 objectForKeyedSubscript:&unk_1EF651888];
    id v11 = &unk_1EF6518D0;
    v12[0] = v6;
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v9 setObject:v10 forKeyedSubscript:v7];
  }
  else
  {
    [(MSVOPACKEncoder *)self encodeObject:v6 forKey:v7];
  }
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if ([(NSMutableArray *)self->_objects count])
  {
    if (!v14) {
      goto LABEL_8;
    }
    id v8 = [(NSMutableArray *)self->_wrapperStack lastObject];
    v9 = [v8 objectForKeyedSubscript:&unk_1EF651888];
    int v10 = [(MSVOPACKEncoder *)self _convertObject:v14];
    [v9 setObject:v10 forKeyedSubscript:v7];
  }
  else
  {
    if (([v7 isEqual:@"rootObject"] & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"MSVOPACKEncoder.m" lineNumber:105 description:@"Missing wrapper when not root object"];
    }
    objects = self->_objects;
    v12 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableArray *)objects addObject:v12];

    id v8 = [(MSVOPACKEncoder *)self _convertObject:v14];
    [(NSMutableArray *)self->_objects replaceObjectAtIndex:0 withObject:v8];
  }

LABEL_8:
}

- (id)_convertObject:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_NSIsNSArray())
  {
    id v6 = v5;
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [(MSVOPACKEncoder *)self _convertObject:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (v10);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v59 = &unk_1EF6518E8;
      v60 = v7;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    }
    else
    {
      id v14 = v7;
    }
    v21 = v14;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  if (_NSIsNSDictionary())
  {
    v15 = (void *)MEMORY[0x1E4F1CA60];
    id v16 = v5;
    v17 = objc_msgSend(v15, "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __34__MSVOPACKEncoder__convertObject___block_invoke;
    v46[3] = &unk_1E5AD9E08;
    v46[4] = self;
    id v47 = v17;
    id v18 = v17;
    [v16 enumerateKeysAndObjectsUsingBlock:v46];
    objc_opt_class();
    LOBYTE(v15) = objc_opt_isKindOfClass();

    if (v15) {
      uint64_t v19 = 4;
    }
    else {
      uint64_t v19 = 3;
    }
    v20 = [NSNumber numberWithInteger:v19];
    v57 = v20;
    id v58 = v18;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];

    goto LABEL_20;
  }
  if (_NSIsNSSet())
  {
    id v23 = v5;
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v8 = v23;
    uint64_t v24 = [v8 countByEnumeratingWithState:&v42 objects:v56 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(v8);
          }
          v28 = [(MSVOPACKEncoder *)self _convertObject:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          [v7 addObject:v28];
        }
        uint64_t v25 = [v8 countByEnumeratingWithState:&v42 objects:v56 count:16];
      }
      while (v25);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v29 = 8;
    }
    else {
      uint64_t v29 = 7;
    }
    v30 = [NSNumber numberWithInteger:v29];
    v54 = v30;
    v55 = v7;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];

    goto LABEL_18;
  }
  if ((_NSIsNSData() & 1) != 0
    || (_NSIsNSDate() & 1) != 0
    || (_NSIsNSNumber() & 1) != 0
    || (_NSIsNSString() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (_NSIsNSNumber())
    {
      id v31 = [(MSVOPACKEncoder *)self _convertNumber:v5];
    }
    else
    {
      id v31 = v5;
    }
    v21 = v31;
    goto LABEL_20;
  }
  v32 = NSMapGet(self->_objectLookupTable, v5);
  if (v32)
  {
    unint64_t v33 = (unint64_t)v32 - 1;
  }
  else
  {
    v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    v35 = (void *)[v5 classForCoder];
    do
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        break;
      }
      if (![v35 supportsSecureCoding]) {
        break;
      }
      v36 = NSStringFromClass((Class)v35);
      [v34 addObject:v36];

      v35 = (void *)[v35 superclass];
    }
    while (v35);
    v52[0] = &unk_1EF6518A0;
    v52[1] = &unk_1EF651888;
    v53[0] = v34;
    v37 = [MEMORY[0x1E4F1CA60] dictionary];
    v53[1] = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];

    unint64_t v33 = [(NSMutableArray *)self->_objects count];
    NSMapInsert(self->_objectLookupTable, v5, (const void *)(v33 + 1));
    [(NSMutableArray *)self->_objects addObject:v38];
    if (![v5 conformsToProtocol:&unk_1EF6529E8]
      || (objc_msgSend((id)objc_msgSend(v5, "classForCoder"), "supportsSecureCoding") & 1) == 0)
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2, self, @"MSVOPACKEncoder.m", 275, @"Objects must support secure coding: %@", objc_msgSend(v5, "classForCoder") object file lineNumber description];
    }
    [(NSMutableArray *)self->_wrapperStack addObject:v38];
    [v5 encodeWithCoder:self];
    [(NSMutableArray *)self->_wrapperStack removeLastObject];
  }
  if (v33 >= [(NSMutableArray *)self->_objects count])
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"MSVOPACKEncoder.m" lineNumber:280 description:@"index out of bounds"];
  }
  v21 = [NSNumber numberWithUnsignedInt:v33 | 0x80000000];
  unint64_t v39 = [v21 unsignedLongValue] ^ 0x80000000;
  if (v39 >= [(NSMutableArray *)self->_objects count])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSVOPACKEncoder.m" lineNumber:282 description:@"index out of bounds"];
    goto LABEL_19;
  }
LABEL_20:

  return v21;
}

- (id)_convertNumber:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 unsignedLongValue] & 0x80000000) != 0)
  {
    id v7 = &unk_1EF6518D0;
    v8[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (void)encodeRootObject:(id)a3
{
}

- (BOOL)hasTopLevelData
{
  v2 = [(NSMutableArray *)self->_objects firstObject];
  id v3 = [v2 objectForKeyedSubscript:&unk_1EF651888];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (NSData)encodedData
{
  return (NSData *)[(MSVOPACKEncoder *)self encodedDataWithError:0];
}

- (void)beginEncodingPartialTopLevelObject:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  id v6 = (void *)[v4 classForCoder];
  do
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      break;
    }
    if (![v6 supportsSecureCoding]) {
      break;
    }
    id v7 = NSStringFromClass((Class)v6);
    [v5 addObject:v7];

    id v6 = (void *)[v6 superclass];
  }
  while (v6);
  v11[0] = v5;
  v10[0] = &unk_1EF6518A0;
  v10[1] = &unk_1EF651888;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v10[2] = &unk_1EF6518B8;
  v11[1] = v8;
  v11[2] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  [(NSMutableArray *)self->_wrapperStack addObject:v9];
  [(NSMutableArray *)self->_objects addObject:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_wrapperStack, 0);
  objc_storeStrong((id *)&self->_objectLookupTable, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_encodedData, 0);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSMutableArray)wrapperStack
{
  return self->_wrapperStack;
}

- (NSMapTable)objectLookupTable
{
  return self->_objectLookupTable;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

void __34__MSVOPACKEncoder__convertObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = [v5 _convertObject:a2];
  id v7 = [*(id *)(a1 + 32) _convertObject:v6];

  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
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

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1C9B8];
  id v9 = a5;
  id v10 = [v8 dataWithBytes:a3 length:a4];
  [(MSVOPACKEncoder *)self encodeObject:v10 forKey:v9];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v9 = [v6 numberWithFloat:v8];
  [(MSVOPACKEncoder *)self _encodeNumber:v9 forKey:v7];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(MSVOPACKEncoder *)self _encodeNumber:v8 forKey:v7];
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(MSVOPACKEncoder *)self _encodeNumber:v8 forKey:v7];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(MSVOPACKEncoder *)self encodeObject:v8 forKey:v7];
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (void)finishEncoding
{
}

@end