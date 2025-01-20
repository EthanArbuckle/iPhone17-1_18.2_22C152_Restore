@interface MSVOPACKDecoder
+ (id)decodedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5;
+ (id)decodedObjectOfClass:(Class)a3 fromData:(id)a4 userInfo:(id)a5 error:(id *)a6;
+ (id)decodedObjectOfClasses:(id)a3 fromData:(id)a4 error:(id *)a5;
+ (id)decodedObjectOfClasses:(id)a3 fromData:(id)a4 userInfo:(id)a5 error:(id *)a6;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (BOOL)requiresSecureCoding;
- (MSVOPACKDecoderDelegate)delegate;
- (NSArray)objects;
- (NSDictionary)userInfo;
- (NSError)decodeError;
- (NSMapTable)objectLookupTable;
- (NSMutableArray)allowedClassesStack;
- (NSMutableArray)wrapperStack;
- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)_decodeNumberForKey:(id)a3;
- (id)_decodeOPACKObject:(id)a3 ofClasses:(id)a4;
- (id)allowedClasses;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (id)decodeRootObjectOfClass:(Class)a3 error:(id *)a4;
- (id)decodeRootObjectOfClasses:(id)a3 error:(id *)a4;
- (id)initForReadingFromData:(id)a3 error:(id *)a4;
- (id)initForReadingFromData:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (id)msv_userInfo;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodingFailurePolicy;
- (void)_validateClass:(Class)a3 fromSupportedClasses:(id)a4;
- (void)beginDecodingPartialTopLevelObjectOfClasses:(id)a3;
- (void)finishDecodingPartialTopLevelObject;
- (void)msv_setUserInfo:(id)a3;
- (void)setDecodeError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MSVOPACKDecoder

void __48__MSVOPACKDecoder__decodeOPACKObject_ofClasses___block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v9 = [v5 _decodeOPACKObject:a2 ofClasses:v6];
  v8 = [*(id *)(a1 + 32) _decodeOPACKObject:v7 ofClasses:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v9];
}

- (void)finishDecodingPartialTopLevelObject
{
}

- (void)beginDecodingPartialTopLevelObjectOfClasses:(id)a3
{
  objects = self->_objects;
  id v6 = a3;
  id v13 = [(NSArray *)objects firstObject];
  id v7 = [v13 objectForKeyedSubscript:&unk_1EF651948];
  char v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MSVOPACKDecoder.m" lineNumber:366 description:@"Can't decode a partial object if it isn't."];
  }
  id v9 = [v13 objectForKeyedSubscript:&unk_1EF651930];
  v10 = [v9 firstObject];
  Class v11 = NSClassFromString(v10);

  [(MSVOPACKDecoder *)self _validateClass:v11 fromSupportedClasses:v6];
  [(NSMutableArray *)self->_wrapperStack addObject:v13];
}

- (NSError)decodeError
{
  return self->_decodeError;
}

- (double)decodeDoubleForKey:(id)a3
{
  v3 = [(MSVOPACKDecoder *)self _decodeNumberForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  v3 = [(MSVOPACKDecoder *)self _decodeNumberForKey:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (BOOL)containsValueForKey:(id)a3
{
  wrapperStack = self->_wrapperStack;
  id v4 = a3;
  double v5 = [(NSMutableArray *)wrapperStack lastObject];
  id v6 = [v5 objectForKeyedSubscript:&unk_1EF651918];
  id v7 = [v6 allKeys];
  char v8 = [v7 containsObject:v4];

  return v8;
}

- (id)_decodeNumberForKey:(id)a3
{
  wrapperStack = self->_wrapperStack;
  id v5 = a3;
  id v6 = [(NSMutableArray *)wrapperStack lastObject];
  id v7 = [v6 objectForKeyedSubscript:&unk_1EF651918];
  char v8 = [v7 objectForKeyedSubscript:v5];

  if (v8 && (_NSIsNSNumber() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v10 = [(MSVOPACKDecoder *)self _decodeOPACKObject:v8 ofClasses:v9];

    char v8 = (void *)v10;
  }
  return v8;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1A6242480]();
  if (![v8 isEqual:@"rootObject"])
  {
    v12 = [(NSMutableArray *)self->_wrapperStack lastObject];
    id v13 = [v12 objectForKeyedSubscript:&unk_1EF651918];
    uint64_t v10 = [v13 objectForKeyedSubscript:v8];

    goto LABEL_6;
  }
  uint64_t v10 = [(NSArray *)self->_objects firstObject];
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MSVOPACKDecoder.m" lineNumber:305 description:@"No root object"];
LABEL_6:

    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  if (v7)
  {
LABEL_4:
    [(NSMutableArray *)self->_allowedClassesStack addObject:v7];
    Class v11 = [(MSVOPACKDecoder *)self _decodeOPACKObject:v10 ofClasses:v7];
    [(NSMutableArray *)self->_allowedClassesStack removeLastObject];
    goto LABEL_8;
  }
LABEL_7:
  Class v11 = [(MSVOPACKDecoder *)self _decodeOPACKObject:v10 ofClasses:0];
LABEL_8:

  return v11;
}

- (id)_decodeOPACKObject:(id)a3 ofClasses:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_67;
  }
  if (!_NSIsNSNumber() || ([v7 unsignedLongValue] & 0x80000000) == 0)
  {
    if (_NSIsNSArray())
    {
      id v9 = v7;
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v86 objects:v93 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v87;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v87 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = [(MSVOPACKDecoder *)self _decodeOPACKObject:*(void *)(*((void *)&v86 + 1) + 8 * i) ofClasses:v8];
            [v10 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v86 objects:v93 count:16];
        }
        while (v13);
      }

      goto LABEL_13;
    }
    if (!_NSIsNSDictionary()) {
      goto LABEL_66;
    }
    id v11 = v7;
    uint64_t v17 = [v11 count];
    if ((v17 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      uint64_t v18 = [v11 objectForKeyedSubscript:&unk_1EF651918];
      if (v18)
      {
        v19 = (void *)v18;
        v20 = [v11 objectForKeyedSubscript:&unk_1EF651930];

        if (v20)
        {
          v21 = [v11 objectForKeyedSubscript:&unk_1EF651948];
          int v22 = [v21 BOOLValue];

          if (v22)
          {
            v67 = [MEMORY[0x1E4F28B00] currentHandler];
            [v67 handleFailureInMethod:a2 object:self file:@"MSVOPACKDecoder.m" lineNumber:207 description:@"Can't decode a partial object without a segmented decoder."];
          }
          id v23 = [v11 objectForKeyedSubscript:&unk_1EF651930];
          v24 = [v23 firstObject];
          v25 = [&unk_1EF651A20 objectForKeyedSubscript:v24];
          v26 = v25;
          if (v25)
          {
            id v27 = v25;

            v24 = v27;
          }
          v28 = NSClassFromString((NSString *)v24);
          [(MSVOPACKDecoder *)self _validateClass:v28 fromSupportedClasses:v8];
          [(NSMutableArray *)self->_wrapperStack addObject:v11];
          id v10 = (id)[[v28 alloc] initWithCoder:self];
          [(NSMutableArray *)self->_wrapperStack removeLastObject];
          [(MSVOPACKDecoder *)self _validateClass:objc_opt_class() fromSupportedClasses:v8];

          goto LABEL_39;
        }
      }
      goto LABEL_65;
    }
    if (v17 == 1)
    {
      v31 = [v11 objectForKeyedSubscript:&unk_1EF651960];

      if (v31)
      {
        v32 = [v11 objectForKeyedSubscript:&unk_1EF651960];
        objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v23 = v32;
        uint64_t v33 = [v23 countByEnumeratingWithState:&v82 objects:v92 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v83 != v35) {
                objc_enumerationMutation(v23);
              }
              v37 = [(MSVOPACKDecoder *)self _decodeOPACKObject:*(void *)(*((void *)&v82 + 1) + 8 * j) ofClasses:v8];
              [v10 addObject:v37];
            }
            uint64_t v34 = [v23 countByEnumeratingWithState:&v82 objects:v92 count:16];
          }
          while (v34);
        }

LABEL_38:
        [(MSVOPACKDecoder *)self _validateClass:objc_opt_class() fromSupportedClasses:v8];
LABEL_39:

        goto LABEL_14;
      }
      v38 = [v11 objectForKeyedSubscript:&unk_1EF651978];

      if (v38)
      {
        id v10 = [v11 objectForKeyedSubscript:&unk_1EF651978];
LABEL_13:
        [(MSVOPACKDecoder *)self _validateClass:objc_opt_class() fromSupportedClasses:v8];
LABEL_14:

        goto LABEL_67;
      }
      v39 = [v11 objectForKeyedSubscript:&unk_1EF651990];

      if (v39)
      {
        id v23 = [v11 objectForKeyedSubscript:&unk_1EF651990];
        v40 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __48__MSVOPACKDecoder__decodeOPACKObject_ofClasses___block_invoke;
        v79[3] = &unk_1E5ADA118;
        v79[4] = self;
        id v41 = v8;
        id v80 = v41;
        id v81 = v40;
        id v42 = v40;
        [v23 enumerateKeysAndObjectsUsingBlock:v79];
        [(MSVOPACKDecoder *)self _validateClass:objc_opt_class() fromSupportedClasses:v41];
        id v10 = (id)[v42 copy];

        goto LABEL_39;
      }
      v43 = [v11 objectForKeyedSubscript:&unk_1EF6519A8];

      if (v43)
      {
        id v23 = [v11 objectForKeyedSubscript:&unk_1EF6519A8];
        v44 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __48__MSVOPACKDecoder__decodeOPACKObject_ofClasses___block_invoke_40;
        v76[3] = &unk_1E5ADA118;
        v76[4] = self;
        id v45 = v8;
        id v77 = v45;
        id v46 = v44;
        id v78 = v46;
        [v23 enumerateKeysAndObjectsUsingBlock:v76];
        [(MSVOPACKDecoder *)self _validateClass:objc_opt_class() fromSupportedClasses:v45];
        v47 = v78;
        id v10 = v46;

        goto LABEL_39;
      }
      v48 = [v11 objectForKeyedSubscript:&unk_1EF6519C0];

      if (v48)
      {
        v49 = [v11 objectForKeyedSubscript:&unk_1EF6519C0];
        v50 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v49, "count"));
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v51 = v49;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v72 objects:v91 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v73;
          do
          {
            for (uint64_t k = 0; k != v53; ++k)
            {
              if (*(void *)v73 != v54) {
                objc_enumerationMutation(v51);
              }
              v56 = [(MSVOPACKDecoder *)self _decodeOPACKObject:*(void *)(*((void *)&v72 + 1) + 8 * k) ofClasses:v8];
              [v50 addObject:v56];
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v72 objects:v91 count:16];
          }
          while (v53);
        }

        [(MSVOPACKDecoder *)self _validateClass:objc_opt_class() fromSupportedClasses:v8];
        id v10 = (id)[v50 copy];

        goto LABEL_14;
      }
      v57 = [v11 objectForKeyedSubscript:&unk_1EF6519D8];

      if (v57)
      {
        v58 = [v11 objectForKeyedSubscript:&unk_1EF6519D8];
        objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v58, "count"));
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v23 = v58;
        uint64_t v59 = [v23 countByEnumeratingWithState:&v68 objects:v90 count:16];
        if (v59)
        {
          uint64_t v60 = v59;
          uint64_t v61 = *(void *)v69;
          do
          {
            for (uint64_t m = 0; m != v60; ++m)
            {
              if (*(void *)v69 != v61) {
                objc_enumerationMutation(v23);
              }
              v63 = -[MSVOPACKDecoder _decodeOPACKObject:ofClasses:](self, "_decodeOPACKObject:ofClasses:", *(void *)(*((void *)&v68 + 1) + 8 * m), v8, (void)v68);
              [v10 addObject:v63];
            }
            uint64_t v60 = [v23 countByEnumeratingWithState:&v68 objects:v90 count:16];
          }
          while (v60);
        }

        goto LABEL_38;
      }
      v64 = [MEMORY[0x1E4F28B00] currentHandler];
      [v64 handleFailureInMethod:a2, self, @"MSVOPACKDecoder.m", 289, @"Data key exists, but unknown object type." object file lineNumber description];
    }
LABEL_65:
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2 object:self file:@"MSVOPACKDecoder.m" lineNumber:291 description:@"Unknown encoded dictionary literal."];

LABEL_66:
    [(MSVOPACKDecoder *)self _validateClass:objc_opt_class() fromSupportedClasses:v8];
    id v10 = v7;
    goto LABEL_67;
  }
  v29 = (const void *)([v7 unsignedLongValue] ^ 0x80000000);
  NSMapGet(self->_objectLookupTable, v29);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v30 = [(NSArray *)self->_objects objectAtIndexedSubscript:v29];
    id v10 = [(MSVOPACKDecoder *)self _decodeOPACKObject:v30 ofClasses:v8];
    NSMapInsert(self->_objectLookupTable, v29, v10);
  }
  [(MSVOPACKDecoder *)self _validateClass:objc_opt_class() fromSupportedClasses:v8];
LABEL_67:

  return v10;
}

- (void)_validateClass:(Class)a3 fromSupportedClasses:(id)a4
{
  id v10 = a4;
  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(objc_class *)a3 supportsSecureCoding] & 1) == 0)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"MSVOPACKDecoder.m", 162, @"Class %@ does not support secure coding.", a3 object file lineNumber description];
    }
    Class v7 = a3;
    while (([v10 containsObject:v7] & 1) == 0)
    {
      Class v7 = (Class)[(objc_class *)v7 superclass];
      if (!v7)
      {
        id v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2, self, @"MSVOPACKDecoder.m", 170, @"Class %@ does not match supported classes: %@", a3, v10 object file lineNumber description];

        break;
      }
    }
  }
}

- (BOOL)decodeBoolForKey:(id)a3
{
  wrapperStacuint64_t k = self->_wrapperStack;
  id v4 = a3;
  id v5 = [(NSMutableArray *)wrapperStack lastObject];
  id v6 = [v5 objectForKeyedSubscript:&unk_1EF651918];
  Class v7 = [v6 objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v7 BOOLValue];
  return (char)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodeError, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_wrapperStack, 0);
  objc_storeStrong((id *)&self->_objectLookupTable, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_allowedClassesStack, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (id)initForReadingFromData:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MSVOPACKDecoder;
  id v10 = [(MSVOPACKDecoder *)&v27 init];
  if (!v10) {
    goto LABEL_6;
  }
  uint64_t v11 = [v9 copy];
  uint64_t v12 = (void *)v11;
  uint64_t v13 = (void *)(v11 ? v11 : MEMORY[0x1E4F1CC08]);
  objc_storeStrong((id *)&v10->_userInfo, v13);

  uint64_t v14 = OPACKDecodeData();
  objects = v10->_objects;
  v10->_objects = (NSArray *)v14;

  uint64_t v16 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:0];
  objectLookupTable = v10->_objectLookupTable;
  v10->_objectLookupTable = (NSMapTable *)v16;

  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  wrapperStacuint64_t k = v10->_wrapperStack;
  v10->_wrapperStacuint64_t k = (NSMutableArray *)v18;

  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  allowedClassesStacuint64_t k = v10->_allowedClassesStack;
  v10->_allowedClassesStacuint64_t k = (NSMutableArray *)v20;

  if ((_NSIsNSArray() & 1) == 0)
  {
    if (a5)
    {
      id v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = MSVOPACKDecoderErrorDomain;
      uint64_t v28 = *MEMORY[0x1E4F28228];
      v29[0] = @"Decoded OPACK data did not contain an array as the root object.";
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      *a5 = [v23 errorWithDomain:v24 code:1 userInfo:v25];
    }
    int v22 = 0;
  }
  else
  {
LABEL_6:
    int v22 = v10;
  }

  return v22;
}

- (id)initForReadingFromData:(id)a3 error:(id *)a4
{
  return [(MSVOPACKDecoder *)self initForReadingFromData:a3 userInfo:0 error:a4];
}

- (void)msv_setUserInfo:(id)a3
{
  self->_userInfo = (NSDictionary *)[a3 copy];
  MEMORY[0x1F41817F8]();
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

- (NSMutableArray)wrapperStack
{
  return self->_wrapperStack;
}

- (NSMapTable)objectLookupTable
{
  return self->_objectLookupTable;
}

- (NSArray)objects
{
  return self->_objects;
}

- (NSMutableArray)allowedClassesStack
{
  return self->_allowedClassesStack;
}

- (void)setDelegate:(id)a3
{
}

- (MSVOPACKDecoderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MSVOPACKDecoderDelegate *)WeakRetained;
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
  wrapperStacuint64_t k = self->_wrapperStack;
  id v6 = a3;
  Class v7 = [(NSMutableArray *)wrapperStack lastObject];
  id v8 = [v7 objectForKeyedSubscript:&unk_1EF651918];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (a4) {
    *a4 = [v9 length];
  }
  id v10 = v9;
  uint64_t v11 = (const char *)[v10 bytes];

  return v11;
}

- (float)decodeFloatForKey:(id)a3
{
  v3 = [(MSVOPACKDecoder *)self _decodeNumberForKey:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (int)decodeInt32ForKey:(id)a3
{
  v3 = [(MSVOPACKDecoder *)self _decodeNumberForKey:a3];
  int v4 = [v3 longValue];

  return v4;
}

- (int)decodeIntForKey:(id)a3
{
  v3 = [(MSVOPACKDecoder *)self _decodeNumberForKey:a3];
  int v4 = [v3 intValue];

  return v4;
}

void __48__MSVOPACKDecoder__decodeOPACKObject_ofClasses___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v9 = [v5 _decodeOPACKObject:a2 ofClasses:v6];
  id v8 = [*(id *)(a1 + 32) _decodeOPACKObject:v7 ofClasses:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v9];
}

- (id)decodeRootObjectOfClasses:(id)a3 error:(id *)a4
{
  return (id)[(MSVOPACKDecoder *)self decodeTopLevelObjectOfClasses:a3 forKey:@"rootObject" error:a4];
}

- (id)decodeRootObjectOfClass:(Class)a3 error:(id *)a4
{
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v7 = [(MSVOPACKDecoder *)self decodeRootObjectOfClasses:v6 error:a4];

  return v7;
}

- (int64_t)decodingFailurePolicy
{
  return 1;
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (id)allowedClasses
{
  return (id)[(NSMutableArray *)self->_allowedClassesStack lastObject];
}

+ (id)decodedObjectOfClasses:(id)a3 fromData:(id)a4 userInfo:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[MSVOPACKDecoder alloc] initForReadingFromData:v10 userInfo:v9 error:a6];

  uint64_t v13 = [v12 decodeRootObjectOfClasses:v11 error:a6];

  return v13;
}

+ (id)decodedObjectOfClasses:(id)a3 fromData:(id)a4 error:(id *)a5
{
  return (id)[a1 decodedObjectOfClasses:a3 fromData:a4 userInfo:0 error:a5];
}

+ (id)decodedObjectOfClass:(Class)a3 fromData:(id)a4 userInfo:(id)a5 error:(id *)a6
{
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [v10 setWithObject:a3];
  uint64_t v14 = [a1 decodedObjectOfClasses:v13 fromData:v12 userInfo:v11 error:a6];

  return v14;
}

+ (id)decodedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  return (id)[a1 decodedObjectOfClass:a3 fromData:a4 userInfo:0 error:a5];
}

@end