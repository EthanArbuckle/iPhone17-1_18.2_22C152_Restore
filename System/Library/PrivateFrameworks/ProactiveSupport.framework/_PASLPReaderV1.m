@interface _PASLPReaderV1
- (CFTypeRef)_stringForMappedUTF8CString:(CFTypeRef *)a1;
- (_PASLPReaderV1)initWithData:(id)a3 sourcedFromPath:(id)a4 needsValidation:(BOOL)a5 error:(id *)a6;
- (id)_objectForValue:(uint64_t)a1;
- (id)_objectForValue:(void *)a3 errMsg:;
- (id)keyAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4;
- (id)objectAtIndex:(unint64_t)a3 usingArrayContext:(id)a4;
- (id)objectAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4;
- (id)objectForKey:(id)a3 usingDictionaryContext:(id)a4;
- (id)rootObjectWithErrMsg:(id *)a3;
- (uint64_t)_decodeDictionaryKeyValue:(void *)a3 errMsg:(void *)a4 handleString:;
- (uint64_t)_decodeValue:(void *)a3 errMsg:(void *)a4 handleBoolean:(void *)a5 handleTaggedInt:(void *)a6 handleBoxedInt:(void *)a7 handleTaggedFloat:(void *)a8 handleBoxedFloat:(void *)a9 handleDate:(void *)a10 handleData:(void *)a11 handleString:(void *)a12 handleDict:(void *)a13 handleArray:;
- (uint64_t)_validateObjectGraphWithFilename:(unint64_t)a3 rootValue:(unint64_t)a4 recursionDepth:(uint64_t)a5 stats:(void *)a6 error:;
- (void)dealloc;
- (void)decodeDictionaryKeyForValue:(void *)a3 handleString:;
@end

@implementation _PASLPReaderV1

- (id)objectAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4
{
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    unint64_t v9 = v7[2];
    if (v9 > a3)
    {
LABEL_3:
      uint64_t v10 = v8[1];
      goto LABEL_4;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 1161, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 1162, @"Invalid parameter not satisfying: %@", @"index < context.count" object file lineNumber description];

  if (v8)
  {
    unint64_t v9 = v8[2];
    goto LABEL_3;
  }
  uint64_t v10 = 0;
  unint64_t v9 = 0;
LABEL_4:
  v11 = -[_PASLPReaderV1 _objectForValue:]((uint64_t)self, *(unsigned int *)(v10 + 4 * v9 + 4 * a3) | ((unint64_t)(v10+ 4 * v9+ 4 * a3- LODWORD(self->_mappedRegion.mmapBase)) << 32));

  return v11;
}

- (id)keyAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4
{
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v7[2] > a3)
    {
LABEL_3:
      uint64_t v9 = v8[1];
      goto LABEL_4;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 1123, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 1124, @"Invalid parameter not satisfying: %@", @"index < context.count" object file lineNumber description];

  if (v8) {
    goto LABEL_3;
  }
  uint64_t v9 = 0;
LABEL_4:
  uint64_t v10 = (unsigned int *)(v9 + 4 * a3);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __52___PASLPReaderV1_keyAtIndex_usingDictionaryContext___block_invoke;
  v23[3] = &unk_1E5AEA8C0;
  v23[4] = &v25;
  v23[5] = v24;
  v11 = (void *)MEMORY[0x1A6245320](v23);
  -[_PASLPReaderV1 decodeDictionaryKeyForValue:handleString:]((uint64_t)self, *v10 | ((unint64_t)(v10 - LODWORD(self->_mappedRegion.mmapBase)) << 32), v11);
  v12 = (char *)v26[3];
  if (!v12)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 1138, @"Invalid parameter not satisfying: %@", @"keyBytes" object file lineNumber description];

    v12 = (char *)v26[3];
  }
  v13 = -[_PASLPReaderV1 _stringForMappedUTF8CString:]((CFTypeRef *)&self->super.isa, v12);
  if (!v13) {
    objc_exception_throw([[_PASLazyPlistCorruptException alloc] initWithName:@"_PASLazyPlistCorruptException" reason:@"String table contains non-UTF-8 content" userInfo:0]);
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  v14 = [v8 enumerationCache];
  if (v14)
  {
    v15 = (void *)MEMORY[0x1A62450A0]();
    if (v8)
    {
      uint64_t v16 = v8[1];
      uint64_t v17 = v8[2];
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }
    v18 = [MEMORY[0x1E4F29238] valueWithPointer:v16 + 4 * v17 + 4 * a3];
    [v14 setObject:v18 forKey:v13];
  }

  return v13;
}

- (id)_objectForValue:(uint64_t)a1
{
  if (a1)
  {
    v6 = 0;
    uint64_t v2 = -[_PASLPReaderV1 _objectForValue:errMsg:](a1, a2, &v6);
    if (!v2)
    {
      v5 = [_PASLazyPlistCorruptException alloc];
      objc_exception_throw([(_PASLazyPlistCorruptException *)v5 initWithName:@"_PASLazyPlistCorruptException" reason:v6 userInfo:0]);
    }
    v3 = (void *)v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_objectForValue:(void *)a3 errMsg:
{
  if (a1)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    id v34 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    uint64_t v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    id v6 = *(id *)(a1 + 8);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke;
    v22[3] = &unk_1E5AEA780;
    v22[4] = &v29;
    v20[4] = &v29;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_2;
    v21[3] = &unk_1E5AEA7A8;
    v21[4] = &v29;
    v19[4] = &v29;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_3;
    v20[3] = &unk_1E5AEA7D0;
    v18[4] = &v29;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_4;
    v19[3] = &unk_1E5AEA7F8;
    v17[4] = &v29;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_5;
    v18[3] = &unk_1E5AEA820;
    uint64_t v16 = &v29;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_6;
    v17[3] = &unk_1E5AEA820;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_7;
    v14[3] = &unk_1E5AEB688;
    id v7 = v6;
    id v15 = v7;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_9;
    v13[3] = &unk_1E5AEA870;
    v13[4] = a1;
    v13[5] = &v29;
    v13[6] = &v23;
    v11[5] = &v29;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_10;
    v12[3] = &unk_1E5AEA898;
    v12[4] = a1;
    v12[5] = &v29;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_11;
    v11[3] = &unk_1E5AEA898;
    v11[4] = a1;
    -[_PASLPReaderV1 _decodeValue:errMsg:handleBoolean:handleTaggedInt:handleBoxedInt:handleTaggedFloat:handleBoxedFloat:handleDate:handleData:handleString:handleDict:handleArray:](a1, a2, a3, v22, v21, v20, v19, v18, v17, v14, v13, v12, v11);
    v8 = (void *)v24[5];
    if (v8) {
      objc_storeStrong(a3, v8);
    }
    id v9 = (id)v30[5];

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)objectForKey:(id)a3 usingDictionaryContext:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 1047, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_30:
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 1048, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    context = (void *)MEMORY[0x1A62450A0]();
LABEL_31:
    v13 = 0;
    goto LABEL_32;
  }
  if (!v8) {
    goto LABEL_30;
  }
LABEL_3:
  context = (void *)MEMORY[0x1A62450A0]();
  if (!v9[2]) {
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_31;
  }
  SEL v32 = a2;
  v33 = [v9 enumerationCache];
  if (v33)
  {
    uint64_t v10 = [v33 objectForKey:v7];
    v11 = v10;
    if (v10)
    {
      v12 = (unsigned int *)[v10 pointerValue];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: cache hit for object value at 0x%lx", (uint8_t *)&buf, 0xCu);
        if (v12) {
          goto LABEL_9;
        }
      }
      else if (v12)
      {
LABEL_9:
        v13 = -[_PASLPReaderV1 _objectForValue:]((uint64_t)self, *v12 | ((unint64_t)(v12 - LODWORD(self->_mappedRegion.mmapBase)) << 32));

        goto LABEL_23;
      }
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 1067, @"Invalid parameter not satisfying: %@", @"valuePtr" object file lineNumber description];

      goto LABEL_9;
    }
  }
  uint64_t v14 = [v7 UTF8String];
  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"Rejecting non-Unicode key provided to objectForKey";
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_22;
  }
  unint64_t v15 = v9[2];
  if (!v15)
  {
LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  uint64_t v16 = (const char *)v14;
  unint64_t v17 = 0;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  while (1)
  {
    unint64_t v19 = (v15 + v17) >> 1;
    v20 = (unsigned int *)(v9[1] + 4 * v19);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    unint64_t v21 = *v20 | ((unint64_t)(v20 - LODWORD(self->_mappedRegion.mmapBase)) << 32);
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __54___PASLPReaderV1_objectForKey_usingDictionaryContext___block_invoke;
    v35[3] = &unk_1E5AEA6E0;
    v35[4] = &buf;
    -[_PASLPReaderV1 decodeDictionaryKeyForValue:handleString:]((uint64_t)self, v21, v35);
    v22 = *(const char **)(*((void *)&buf + 1) + 24);
    if (!v22)
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:v32, self, @"_PASLPReaderV1.m", 1095, @"Invalid parameter not satisfying: %@", @"midCStr" object file lineNumber description];

      v22 = *(const char **)(*((void *)&buf + 1) + 24);
    }
    int v23 = strcmp(v16, v22);
    if (v23 < 0) {
      goto LABEL_18;
    }
    if (!v23) {
      break;
    }
    unint64_t v17 = v19 + 1;
    unint64_t v19 = v15;
LABEL_18:
    _Block_object_dispose(&buf, 8);
    unint64_t v15 = v19;
    if (v17 >= v19) {
      goto LABEL_22;
    }
  }
  _Block_object_dispose(&buf, 8);
  unint64_t v24 = v9[2];
  if (v19 >= v24)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:v32, self, @"_PASLPReaderV1.m", 1112, @"Invalid parameter not satisfying: %@", @"keyOfs < context.count" object file lineNumber description];

    unint64_t v24 = v9[2];
  }
  uint64_t v25 = (unsigned int *)(v9[1] + 4 * v24 + 4 * v19);
  v13 = -[_PASLPReaderV1 _objectForValue:]((uint64_t)self, *v25 | ((unint64_t)(v25 - LODWORD(self->_mappedRegion.mmapBase)) << 32));
LABEL_23:

LABEL_32:

  return v13;
}

- (void)decodeDictionaryKeyForValue:(void *)a3 handleString:
{
  id v5 = a3;
  if (a1)
  {
    id v7 = 0;
    if ((-[_PASLPReaderV1 _decodeDictionaryKeyValue:errMsg:handleString:](a1, a2, &v7, v5) & 1) == 0)
    {
      id v6 = [_PASLazyPlistCorruptException alloc];
      objc_exception_throw([(_PASLazyPlistCorruptException *)v6 initWithName:@"_PASLazyPlistCorruptException" reason:v7 userInfo:0]);
    }
  }
}

- (uint64_t)_decodeDictionaryKeyValue:(void *)a3 errMsg:(void *)a4 handleString:
{
  id v7 = a4;
  if (!a1)
  {
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64___PASLPReaderV1__decodeDictionaryKeyValue_errMsg_handleString___block_invoke;
  v12[3] = &unk_1E5AEA758;
  v12[4] = &v14;
  v12[5] = v13;
  void v12[6] = a3;
  v12[7] = a2;
  if (-[_PASLPReaderV1 _decodeValue:errMsg:handleBoolean:handleTaggedInt:handleBoxedInt:handleTaggedFloat:handleBoxedFloat:handleDate:handleData:handleString:handleDict:handleArray:](a1, a2, a3, 0, 0, 0, 0, 0, 0, 0, v12, 0, 0))
  {
    if (v15[3])
    {
      if (v7) {
        v7[2](v7);
      }
      uint64_t v8 = 1;
      goto LABEL_10;
    }
    if (!*a3)
    {
      uint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Dictionary key 0x%lx at ofs 0x%lx is not of string type", a2, HIDWORD(a2));
      uint64_t v10 = *a3;
      *a3 = (void *)v9;
    }
  }
  uint64_t v8 = 0;
LABEL_10:
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);
LABEL_11:

  return v8;
}

- (uint64_t)_decodeValue:(void *)a3 errMsg:(void *)a4 handleBoolean:(void *)a5 handleTaggedInt:(void *)a6 handleBoxedInt:(void *)a7 handleTaggedFloat:(void *)a8 handleBoxedFloat:(void *)a9 handleDate:(void *)a10 handleData:(void *)a11 handleString:(void *)a12 handleDict:(void *)a13 handleArray:
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v82 = a4;
  uint64_t v18 = a5;
  unint64_t v19 = a6;
  v20 = a7;
  unint64_t v21 = a8;
  v22 = a9;
  id v81 = a10;
  int v23 = a11;
  id v24 = a12;
  id v25 = a13;
  uint64_t v27 = v25;
  v83 = v24;
  switch(a2 >> 29)
  {
    case 1u:
      v78 = v23;
      id v44 = v25;
      if ((a2 & 0x1FFFFFFF) + 8 <= *(void *)(a1 + 24))
      {
        if (v19) {
          v19[2](v19, *(void *)(*(void *)(a1 + 16) + (a2 & 0x1FFFFFFF)));
        }
        uint64_t v43 = 1;
        uint64_t v29 = (void (**)(void, void))v82;
      }
      else
      {
        uint64_t v45 = objc_msgSend([NSString alloc], "initWithFormat:", @"Int64 pointer 0x%lx at ofs 0x%lx references address out of mmap range", a2 & 0x1FFFFFFF, HIDWORD(a2));
        v46 = *a3;
        *a3 = (void *)v45;

        uint64_t v43 = 0;
        uint64_t v29 = (void (**)(void, void))v82;
      }
      v30 = v81;
      uint64_t v27 = v44;
      int v23 = v78;
      goto LABEL_72;
    case 2u:
      SEL v32 = v19;
      if ((a2 & 0x1FFFFFFF) + 8 > *(void *)(a1 + 24))
      {
        uint64_t v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"Float64 pointer 0x%lx at ofs 0x%lx references address out of mmap range", a2 & 0x1FFFFFFF, HIDWORD(a2));
        goto LABEL_43;
      }
      if (v21)
      {
        v26.n128_u64[0] = *(void *)(*(void *)(a1 + 16) + (a2 & 0x1FFFFFFF));
        v21[2](v21, v26);
      }
      goto LABEL_30;
    case 3u:
      SEL v32 = v19;
      if ((a2 & 0x1FFFFFFF) + 8 > *(void *)(a1 + 24))
      {
        uint64_t v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"NSTimeInterval pointer 0x%lx at ofs 0x%lx references address out of mmap range", a2 & 0x1FFFFFFF, HIDWORD(a2));
        goto LABEL_43;
      }
      if (v22)
      {
        v26.n128_u64[0] = *(void *)(*(void *)(a1 + 16) + (a2 & 0x1FFFFFFF));
        v22[2](v22, v26);
      }
LABEL_30:
      uint64_t v43 = 1;
      goto LABEL_44;
    case 4u:
      v77 = v19;
      unint64_t v34 = HIDWORD(a2);
      uint64_t v35 = a2 & 0x1FFFFFFF;
      uint64_t v36 = v35 + 4;
      unint64_t v37 = *(void *)(a1 + 24);
      if (v35 + 4 > v37)
      {
        uint64_t v38 = objc_msgSend([NSString alloc], "initWithFormat:", @"Byte array pointer 0x%lx at ofs 0x%lx references address out of mmap range", v35, v34);
        goto LABEL_14;
      }
      v76 = v22;
      uint64_t v59 = *(void *)(a1 + 16);
      uint64_t v60 = *(unsigned int *)(v59 + v35);
      if (v36 + v60 > v37)
      {
        uint64_t v61 = objc_msgSend([NSString alloc], "initWithFormat:", @"Byte array pointer 0x%lx at ofs 0x%lx points to region with size 0x%lx exceeding mmap range", v35, v34, v60, v75);
LABEL_50:
        v69 = *a3;
        *a3 = (void *)v61;

        uint64_t v43 = 0;
        uint64_t v29 = (void (**)(void, void))v82;
        goto LABEL_54;
      }
      if (v60)
      {
        if ((v36 & 0x1F) != 0)
        {
          uint64_t v61 = objc_msgSend([NSString alloc], "initWithFormat:", @"Byte array pointer 0x%lx at ofs 0x%lx points to byte array at offset 0x%lx which is not %zu-byte aligned", v35, v34, v35 + 4, 32);
          goto LABEL_50;
        }
        v59 += v36;
        if ((v59 & 0x1F) != 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          v85 = @"Warning: Data region byte offset is not 32-byte aligned, because backing NSData is not 32-byte aligned.";
          _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_PASLazyPlist: %@", buf, 0xCu);
        }
      }
      v30 = v81;
      uint64_t v29 = (void (**)(void, void))v82;
      unint64_t v19 = v77;
      if (v81) {
        (*((void (**)(id, uint64_t, uint64_t))v81 + 2))(v81, v59, v60);
      }
      uint64_t v43 = 1;
      v22 = v76;
      goto LABEL_72;
    case 5u:
      SEL v32 = v19;
      unint64_t v47 = HIDWORD(a2);
      unint64_t v48 = a2 & 0x1FFFFFFF;
      unint64_t v49 = *(void *)(a1 + 24);
      size_t v50 = v49 - v48;
      if (v49 <= v48)
      {
        uint64_t v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"String pointer 0x%lx at ofs 0x%lx references address out of mmap range", v48, v47);
        goto LABEL_43;
      }
      v76 = v22;
      uint64_t v51 = *(void *)(a1 + 16);
      v52 = (char *)(v51 + v48);
      unint64_t v53 = *(unsigned int *)(v51 + 4);
      if (v48 >= v53)
      {
        unint64_t v71 = *(unsigned int *)(v51 + 8);
        BOOL v54 = v48 < v71;
        if (v48 > v53 && v48 < v71)
        {
          if (*(v52 - 1))
          {
            uint64_t v68 = objc_msgSend([NSString alloc], "initWithFormat:", @"String pointer 0x%lx at ofs 0x%lx does not correspond to the start of a string", v48, v47, v74);
            goto LABEL_68;
          }
          BOOL v54 = 1;
        }
      }
      else
      {
        BOOL v54 = 0;
      }
      v55 = memchr(v52, 0, v50);
      if (!v55)
      {
        uint64_t v68 = objc_msgSend([NSString alloc], "initWithFormat:", @"String pointer 0x%lx at ofs 0x%lx is not 0-terminated before EOF", v48, v48, v74);
        goto LABEL_68;
      }
      unint64_t v19 = v32;
      if (v23) {
        v23[2](v23, v52, v55 - v52, v54);
      }
      uint64_t v43 = 1;
      uint64_t v29 = (void (**)(void, void))v82;
      goto LABEL_70;
    case 6u:
      SEL v32 = v19;
      unint64_t v56 = HIDWORD(a2);
      uint64_t v57 = a2 & 0x1FFFFFFF;
      unint64_t v58 = *(void *)(a1 + 24);
      if (v57 + 4 > v58)
      {
        uint64_t v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"Dictionary pointer 0x%lx at ofs 0x%lx references address outside of mmap range", v57, v56);
LABEL_43:
        v65 = *a3;
        *a3 = (void *)v33;

        uint64_t v43 = 0;
LABEL_44:
        uint64_t v29 = (void (**)(void, void))v82;
        unint64_t v19 = v32;
        goto LABEL_71;
      }
      v76 = v22;
      uint64_t v66 = *(void *)(a1 + 16);
      unsigned int v67 = 2 * *(_DWORD *)(v66 + v57);
      if (v57 + 4 + 4 * (unint64_t)v67 <= v58)
      {
        if (((v57 + v66) & 3) == 0)
        {
          if (v24) {
            (*((void (**)(void))v24 + 2))();
          }
          uint64_t v43 = 1;
          goto LABEL_69;
        }
        uint64_t v68 = objc_msgSend([NSString alloc], "initWithFormat:", @"Dictionary pointer 0x%lx at ofs 0x%lx references region at byte address 0x%lx which is not quad-aligned", v57, v56, v57 + v66 + 4);
      }
      else
      {
        uint64_t v68 = objc_msgSend([NSString alloc], "initWithFormat:", @"Dictionary pointer 0x%lx at ofs 0x%lx references region with size 0x%lx exceeding mmap range", v57, v56, 4 * v67);
      }
LABEL_68:
      v72 = *a3;
      *a3 = (void *)v68;

      uint64_t v43 = 0;
LABEL_69:
      uint64_t v29 = (void (**)(void, void))v82;
      unint64_t v19 = v32;
      goto LABEL_70;
    case 7u:
      v77 = v19;
      unint64_t v39 = HIDWORD(a2);
      uint64_t v40 = a2 & 0x1FFFFFFF;
      unint64_t v41 = *(void *)(a1 + 24);
      if (v40 + 4 > v41)
      {
        uint64_t v38 = objc_msgSend([NSString alloc], "initWithFormat:", @"Array pointer 0x%lx at ofs 0x%lx references address outside of mmap range", a2 & 0x1FFFFFFF, HIDWORD(a2));
LABEL_14:
        v42 = *a3;
        *a3 = (void *)v38;

        uint64_t v43 = 0;
        uint64_t v29 = (void (**)(void, void))v82;
        unint64_t v19 = v77;
        goto LABEL_71;
      }
      v76 = v22;
      uint64_t v62 = *(void *)(a1 + 16);
      uint64_t v63 = *(unsigned int *)(v62 + v40);
      uint64_t v29 = (void (**)(void, void))v82;
      if (v40 + 4 + 4 * v63 <= v41)
      {
        if (((v40 + v62) & 3) == 0)
        {
          if (v25) {
            (*((void (**)(id, uint64_t))v25 + 2))(v25, v40 + v62 + 4);
          }
          uint64_t v43 = 1;
LABEL_54:
          unint64_t v19 = v77;
LABEL_70:
          v22 = v76;
          goto LABEL_71;
        }
        uint64_t v64 = objc_msgSend([NSString alloc], "initWithFormat:", @"Array pointer 0x%lx at ofs 0x%lx references region at byte address 0x%lx which is not quad-aligned", v40, v39, v40 + v62 + 4);
      }
      else
      {
        uint64_t v64 = objc_msgSend([NSString alloc], "initWithFormat:", @"Array pointer 0x%lx at ofs 0x%lx references region with size 0x%lx exceeding mmap range", v40, v39, 4 * v63);
      }
      v70 = *a3;
      *a3 = (void *)v64;

      uint64_t v43 = 0;
      goto LABEL_54;
    default:
      if ((a2 & 0x10000000) == 0)
      {
        int v28 = a2 & 0xFFFFFFF;
        if ((a2 & 0xFFFFFFF) == 0xFFFFFFF)
        {
          uint64_t v31 = 1;
          v30 = v81;
          uint64_t v29 = (void (**)(void, void))v82;
        }
        else
        {
          v30 = v81;
          uint64_t v29 = (void (**)(void, void))v82;
          if (v28 != 268435454)
          {
            if (v18) {
              v18[2](v18, (v28 - 0x7FFFFFF));
            }
            goto LABEL_66;
          }
          uint64_t v31 = 0;
        }
        if (v29) {
          v29[2](v29, v31);
        }
LABEL_66:
        uint64_t v43 = 1;
        goto LABEL_72;
      }
      if (v20) {
        v20[2](v20, COERCE_FLOAT(16 * a2));
      }
      uint64_t v43 = 1;
      uint64_t v29 = (void (**)(void, void))v82;
LABEL_71:
      v30 = v81;
LABEL_72:

      return v43;
  }
}

- (CFTypeRef)_stringForMappedUTF8CString:(CFTypeRef *)a1
{
  if (a1)
  {
    v4 = a1;
    CFRetain(a1[1]);
    a1 = (CFTypeRef *)CFStringCreateWithCStringNoCopy(0, a2, 0x8000100u, (CFAllocatorRef)v4[4]);
    if (!a1)
    {
      CFAllocatorDeallocate((CFAllocatorRef)v4[4], a2);
      a1 = 0;
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)_validateObjectGraphWithFilename:(unint64_t)a3 rootValue:(unint64_t)a4 recursionDepth:(uint64_t)a5 stats:(void *)a6 error:
{
  id v11 = a2;
  v12 = v11;
  if (!a1)
  {
LABEL_7:
    uint64_t v17 = 0;
    goto LABEL_15;
  }
  unint64_t v13 = *(void *)(a5 + 112);
  if (v13 <= a4) {
    unint64_t v13 = a4;
  }
  *(void *)(a5 + 112) = v13;
  if (a4 >= 0x65)
  {
    if (a6)
    {
      uint64_t v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"object graph traversal exceeded maximum recursion depth %tu", 100);
      uint64_t v15 = corruptionError(v12, v14);
      uint64_t v16 = *a6;
      *a6 = (void *)v15;
    }
    goto LABEL_7;
  }
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  unint64_t v53 = __Block_byref_object_copy_;
  BOOL v54 = __Block_byref_object_dispose_;
  v55 = 0;
  uint64_t v46 = 0;
  unint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 1;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke;
  v45[3] = &__block_descriptor_40_e8_v12__0B8l;
  v45[4] = a5;
  v43[4] = a5;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_2;
  v44[3] = &__block_descriptor_40_e8_v12__0i8l;
  v44[4] = a5;
  v42[4] = a5;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_3;
  v43[3] = &__block_descriptor_40_e8_v16__0q8l;
  v41[4] = a5;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_4;
  v42[3] = &__block_descriptor_40_e8_v12__0f8l;
  v40[4] = a5;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_5;
  v41[3] = &__block_descriptor_40_e8_v16__0d8l;
  v39[4] = a5;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_6;
  v40[3] = &__block_descriptor_40_e8_v16__0d8l;
  v38[4] = a5;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_7;
  v39[3] = &__block_descriptor_40_e13_v24__0r_v8Q16l;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_8;
  v38[3] = &__block_descriptor_40_e15_v28__0r_8Q16B24l;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_9;
  v30[3] = &unk_1E5AEA708;
  v30[4] = a1;
  uint64_t v34 = a5;
  uint64_t v35 = sel__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error_;
  SEL v32 = &v50;
  uint64_t v33 = &v46;
  id v23 = v11;
  id v31 = v11;
  unint64_t v36 = a4;
  unint64_t v37 = a6;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_11;
  v24[3] = &unk_1E5AEA730;
  __n128 v26 = &v46;
  uint64_t v27 = a5;
  void v24[4] = a1;
  id v18 = v31;
  id v25 = v18;
  unint64_t v28 = a4;
  uint64_t v29 = a6;
  unsigned int v19 = -[_PASLPReaderV1 _decodeValue:errMsg:handleBoolean:handleTaggedInt:handleBoxedInt:handleTaggedFloat:handleBoxedFloat:handleDate:handleData:handleString:handleDict:handleArray:](a1, a3, &v55, v45, v44, v43, v42, v41, v40, v39, v38, v30, v24);
  if (*((unsigned char *)v47 + 24)) {
    uint64_t v17 = v19;
  }
  else {
    uint64_t v17 = 0;
  }
  if ((v17 & 1) == 0 && !*a6)
  {
    uint64_t v20 = corruptionError(v18, (void *)v51[5]);
    unint64_t v21 = *a6;
    *a6 = (void *)v20;
  }
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  v12 = v23;
LABEL_15:

  return v17;
}

- (id)rootObjectWithErrMsg:(id *)a3
{
  return -[_PASLPReaderV1 _objectForValue:errMsg:]((uint64_t)self, *(unsigned int *)((char *)self->_mappedRegion.mmapBase + *((unsigned int *)self->_mappedRegion.mmapBase + 3)) | ((unint64_t)*((unsigned int *)self->_mappedRegion.mmapBase + 3) << 32), a3);
}

- (_PASLPReaderV1)initWithData:(id)a3 sourcedFromPath:(id)a4 needsValidation:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 470, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  uint64_t v59 = [MEMORY[0x1E4F28B00] currentHandler];
  [v59 handleFailureInMethod:a2, self, @"_PASLPReaderV1.m", 471, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

LABEL_3:
  v73.receiver = self;
  v73.super_class = (Class)_PASLPReaderV1;
  uint64_t v15 = [(_PASLPReaderV1 *)&v73 init];
  uint64_t v16 = (uint64_t)v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_backingData, a3);
    uint64_t v17 = [*(id *)(v16 + 8) bytes];
    uint64_t v18 = [*(id *)(v16 + 8) length];
    *(void *)(v16 + 16) = v17;
    *(void *)(v16 + 24) = v18;
    *(void *)&long long context = 0;
    *((void *)&context + 1) = v12;
    *(void *)&long long context_32 = 0;
    long long context_16 = 0uLL;
    *((void *)&context_32 + 1) = cfAllocateAlwaysFailing_126;
    *(void *)&long long context_48 = 0;
    *((void *)&context_48 + 1) = cfDeallocateReleaseInfo_125;
    *(void *)&long long context_64 = 0;
    CFAllocatorRef v19 = CFAllocatorCreate(0, (CFAllocatorContext *)&context);
    *(void *)(v16 + 32) = v19;
    if (!v19)
    {
      unsigned int v67 = [MEMORY[0x1E4F28B00] currentHandler];
      [v67 handleFailureInMethod:a2 object:v16 file:@"_PASLPReaderV1.m" lineNumber:493 description:@"Failed to create _releaseReaderDeallocator"];
    }
    id v72 = 0;
    if (*(void *)(v16 + 24) <= 0xFuLL)
    {
      uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"rejecting file \"%@\" because it is too small.", v14];
      unint64_t v21 = notPLPlistError(v14, v20);
      id v22 = v72;
      id v72 = v21;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(context) = 138412290;
        *(void *)((char *)&context + 4) = v72;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", (uint8_t *)&context, 0xCu);
        if (!a6) {
          goto LABEL_10;
        }
      }
      else if (!a6)
      {
LABEL_10:

        goto LABEL_11;
      }
      *a6 = v72;
      goto LABEL_10;
    }
    uint64_t v24 = *(void *)(v16 + 16);
    if (v7)
    {
      id v25 = v14;
      __n128 v26 = v25;
      if (*(_WORD *)v24 != 19536 || *(unsigned char *)(v24 + 2) != 80)
      {
        unint64_t v28 = (void *)[[NSString alloc] initWithFormat:@"rejecting file \"%@\" because header has bad magic value", v25];
        uint64_t v29 = notPLPlistError(v26, v28);
LABEL_36:
        uint64_t v43 = v72;
        id v72 = v29;
        goto LABEL_37;
      }
      if (*(unsigned char *)(v24 + 3) != 1)
      {
        unint64_t v28 = (void *)[[NSString alloc] initWithFormat:@"rejecting file \"%@\" because header has unexpected version number (exp %u, act %u)", v25, 1, *(unsigned __int8 *)(v24 + 3)];
        *(void *)long long buf = *MEMORY[0x1E4F28568];
        uint64_t v40 = (void *)[[NSString alloc] initWithFormat:@"The lazy plist file cannot be opened: %@", v28];
        uint64_t v41 = *MEMORY[0x1E4F28588];
        *(void *)&long long context = v40;
        *((void *)&context + 1) = v28;
        uint64_t v42 = *MEMORY[0x1E4F28328];
        *(void *)&buf[8] = v41;
        *(void *)&buf[16] = v42;
        *(void *)&long long context_16 = v26;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&context forKeys:buf count:3];

        id v44 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"_PASLazyPlistErrorDomain" code:3 userInfo:v43];
        id v45 = v72;
        id v72 = v44;

LABEL_37:
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        LODWORD(context) = 138412290;
        *(void *)((char *)&context + 4) = v72;
        uint64_t v48 = MEMORY[0x1E4F14500];
        p_long long context = (uint8_t *)&context;
        goto LABEL_43;
      }
      unsigned int v37 = *(_DWORD *)(v24 + 4);
      unint64_t v36 = *(unsigned int *)(v24 + 8);
      if (v37 <= 0xF && v37 != v36)
      {
        uint64_t v46 = (void *)[[NSString alloc] initWithFormat:@"rejecting file \"%@\" because header has bad string table start 0x%lx", v25, *(unsigned int *)(v24 + 4)];
LABEL_35:
        unint64_t v28 = v46;
        uint64_t v29 = corruptionError(v26, v46);
        goto LABEL_36;
      }
      if (v36 < v37 || (unint64_t v39 = *(void *)(v16 + 24), v39 < v36))
      {
        uint64_t v46 = (void *)[[NSString alloc] initWithFormat:@"rejecting file \"%@\" because header has bad string table end 0x%lx", v25, *(unsigned int *)(v24 + 8)];
        goto LABEL_35;
      }
      uint64_t v50 = *(unsigned int *)(v24 + 12);
      if ((v50 & 3) != 0 || v50 + 4 > v39)
      {
        uint64_t v46 = (void *)[[NSString alloc] initWithFormat:@"rejecting file \"%@\" because header has bad root object offset 0x%lx", v25, *(unsigned int *)(v24 + 12)];
        goto LABEL_35;
      }

      long long v86 = 0u;
      long long v87 = 0u;
      long long context_64 = 0u;
      long long v85 = 0u;
      long long context_32 = 0u;
      long long context_48 = 0u;
      long long context = 0u;
      long long context_16 = 0u;
      id v51 = v72;
      id v72 = 0;

      id v71 = v26;
      uint64_t v52 = *(void *)(v16 + 16);
      uint64_t v53 = *(unsigned int *)(v52 + 4);
      uint64_t v54 = *(unsigned int *)(v52 + 8);
      if (v54 > v53)
      {
        if (*(unsigned char *)(v52 + v54 - 1))
        {
          v55 = v71;
          unint64_t v56 = (void *)[[NSString alloc] initWithFormat:@"rejecting file \"%@\" because string table is not 0-terminated", v71];
          corruptionError(v71, v56);
          id v57 = v72;
          id v72 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v60 = 0;
          uint64_t v61 = (const char *)(v52 + v53);
          while (1)
          {
            *(void *)&long long context = context + 1;
            unint64_t v56 = (void *)[[NSString alloc] initWithUTF8String:v61];
            if (!v56)
            {
              uint64_t v68 = @"rejecting file \"%@\" because string table contains non-UTF-8 content";
              goto LABEL_91;
            }
            if (v60 && (strcmp(v60, v61) & 0x80000000) == 0) {
              break;
            }
            unint64_t v62 = (unint64_t)&v61[strlen(v61) + 1];

            uint64_t v60 = v61;
            uint64_t v61 = (const char *)v62;
            if (v62 >= *(void *)(v16 + 16) + (unint64_t)*(unsigned int *)(*(void *)(v16 + 16) + 8)) {
              goto LABEL_57;
            }
          }
          uint64_t v68 = @"rejecting file \"%@\" because string table contains non-sorted or duplicate entries";
LABEL_91:
          v55 = v71;
          id v57 = (id)objc_msgSend([NSString alloc], "initWithFormat:", v68, v71);
          v69 = corruptionError(v71, v57);
          id v70 = v72;
          id v72 = v69;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v72;
          uint64_t v48 = MEMORY[0x1E4F14500];
          goto LABEL_94;
        }
        goto LABEL_38;
      }
LABEL_57:

      id v63 = v72;
      id v72 = 0;

      if ((-[_PASLPReaderV1 _validateObjectGraphWithFilename:rootValue:recursionDepth:stats:error:](v16, v71, *(unsigned int *)(*(unsigned int *)(*(void *)(v16 + 16) + 12) + *(void *)(v16 + 16)) | ((unint64_t)*(unsigned int *)(*(void *)(v16 + 16) + 12) << 32), 0, (uint64_t)&context, &v72) & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v72;
          uint64_t v48 = MEMORY[0x1E4F14500];
LABEL_94:
          p_long long context = buf;
LABEL_43:
          _os_log_error_impl(&dword_1A32C4000, v48, OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", p_context, 0xCu);
        }
LABEL_38:
        if (a6)
        {
          id v23 = 0;
          *a6 = v72;
          goto LABEL_40;
        }
LABEL_11:
        id v23 = 0;
LABEL_40:

        goto LABEL_41;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v71;
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Successfully traversed object graph for lazy plist \"%@\".  Object statistics:", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = *((void *)&context + 1);
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boolean:        %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = context_16;
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Tagged integer: %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = *((void *)&context_16 + 1);
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed integer:  %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = context_32;
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Tagged real:    %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = *((void *)&context_32 + 1);
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed real:     %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = context_48;
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Date:           %tu", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = *((void *)&context_48 + 1);
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = context;
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: String:         %tu (%tu unique dictionary keys)", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = context_64;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = *((void *)&context_64 + 1);
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Data:           %tu (%tu total bytes)", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = v86;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = *((void *)&v86 + 1);
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Dictionary:     %tu (%tu total key/value mappings)", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = v85;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = *((void *)&v85 + 1);
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Array:          %tu (%tu total elements)", buf, 0x16u);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v87;
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Object graph maximum depth: %tu", buf, 0xCu);
      }
      uint64_t v64 = *((void *)&v87 + 1);
      if (*((void *)&v87 + 1) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = v64;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v86
                            + v85
                            + context_64
                            + *((void *)&context_48 + 1)
                            + context_48
                            + *((void *)&context_32 + 1)
                            + *((void *)&context_16 + 1);
        _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed allocations: %tu (referenced by %tu total pointers)", buf, 0x16u);
      }
      uint64_t v65 = +[_PASLazyPlist deserializationStatsHandler];
      v30 = (void *)v65;
      if (v65)
      {
        uint64_t v66 = *(void (**)(uint64_t, unsigned char *))(v65 + 16);
        long long v76 = context_64;
        long long v77 = v85;
        long long v78 = v86;
        long long v79 = v87;
        *(_OWORD *)long long buf = context;
        *(_OWORD *)&buf[16] = context_16;
        *(_OWORD *)uint64_t v75 = context_32;
        *(_OWORD *)&v75[16] = context_48;
        v66(v65, buf);
      }
    }
    else
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long context_64 = 0u;
      long long v85 = 0u;
      long long context_32 = 0u;
      long long context_48 = 0u;
      long long context = 0u;
      long long context_16 = 0u;
      v30 = 0;
      id v72 = 0;
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = *(void *)(v16 + 16);
      uint64_t v32 = *(void *)(v16 + 24);
      uint64_t v33 = *(unsigned int *)(v24 + 4);
      uint64_t v34 = *(unsigned int *)(v24 + 8);
      uint64_t v35 = *(unsigned int *)(v24 + 12);
      *(_DWORD *)long long buf = 138413570;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v32;
      *(_WORD *)uint64_t v75 = 2048;
      *(void *)&v75[2] = v33;
      *(_WORD *)&v75[10] = 2048;
      *(void *)&v75[12] = v34;
      *(_WORD *)&v75[20] = 2048;
      *(void *)&v75[22] = v35;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASLazyPlist: Loaded \"%@\" (mapping %p, size %zu, string table [0x%lx, 0x%lx), root 0x%lx)", buf, 0x3Eu);
    }
    id v23 = (_PASLPReaderV1 *)(id)v16;
    goto LABEL_40;
  }
  id v23 = 0;
LABEL_41:

  return v23;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  releaseReaderDeallocator = self->_releaseReaderDeallocator;
  if (releaseReaderDeallocator) {
    CFRelease(releaseReaderDeallocator);
  }
  v4.receiver = self;
  v4.super_class = (Class)_PASLPReaderV1;
  [(_PASLPReaderV1 *)&v4 dealloc];
}

- (id)objectAtIndex:(unint64_t)a3 usingArrayContext:(id)a4
{
  id v6 = a4;
  BOOL v7 = (void *)MEMORY[0x1A62450A0]();
  if (v6)
  {
    if (v6[2] <= a3) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Index out of range", 0);
    }
    uint64_t v8 = v6[1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Index out of range", 0);
    uint64_t v8 = 0;
  }
  uint64_t v9 = -[_PASLPReaderV1 _objectForValue:]((uint64_t)self, *(unsigned int *)(v8 + 4 * a3) | ((unint64_t)(v8+ 4 * a3- LODWORD(self->_mappedRegion.mmapBase)) << 32));

  return v9;
}

@end