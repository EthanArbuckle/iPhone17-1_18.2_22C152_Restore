@interface _PASLPReaderBinaryPlist
- (_PASLPReaderBinaryPlist)initWithData:(id)a3 sourcedFromPath:(id)a4 needsValidation:(BOOL)a5 error:(id *)a6;
- (char)_decodeOffset:(id *)a3 decodedObject:(void *)a4 ifEqualToReferenceObject:(int)a5 validationDepth:(void *)a6 unlazyCopyCache:;
- (id)_unlazyCopyForArrayWithCount:(uint64_t)a3 storage:(void *)a4 unlazyCopyCache:;
- (id)_unlazyCopyForDictionaryWithCount:(uint64_t)a3 storage:(void *)a4 unlazyCopyCache:;
- (id)keyAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4;
- (id)objectAtIndex:(unint64_t)a3 usingArrayContext:(id)a4;
- (id)objectAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4;
- (id)objectForKey:(id)a3 usingDictionaryContext:(id)a4;
- (id)rootObjectWithErrMsg:(id *)a3;
- (id)unlazyCopyForArrayWithContext:(id)a3;
- (id)unlazyCopyForDictionaryWithContext:(id)a3;
- (uint64_t)_decodeUnsignedIntegerValue:(void *)a3 usingCursor:;
- (uint64_t)_offsetForRecord:(uint64_t)result;
- (uint64_t)_validateCollectionMembers:(int)a3 validationDepth:(uint64_t)a4 count:;
- (void)dealloc;
@end

@implementation _PASLPReaderBinaryPlist

- (id)rootObjectWithErrMsg:(id *)a3
{
  uint64_t v4 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, self->_topObjectRecord);
  if (v4 == -1) {
    __assert_rtn("-[_PASLPReaderBinaryPlist rootObjectWithErrMsg:]", "_PASLPReaderBinaryPlist.m", 323, "offset != UINT64_MAX");
  }
  id v8 = 0;
  if (-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v4, &v8, 0, -1, 0))
  {
    BOOL v5 = v8 == 0;
  }
  else
  {
    BOOL v5 = 1;
  }
  if (v5) {
    __assert_rtn("-[_PASLPReaderBinaryPlist rootObjectWithErrMsg:]", "_PASLPReaderBinaryPlist.m", 330, "success && decoded");
  }
  id v6 = v8;

  return v6;
}

- (_PASLPReaderBinaryPlist)initWithData:(id)a3 sourcedFromPath:(id)a4 needsValidation:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"_PASLPReaderBinaryPlist.m", 182, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v54 = [MEMORY[0x1E4F28B00] currentHandler];
  [v54 handleFailureInMethod:a2, self, @"_PASLPReaderBinaryPlist.m", 183, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

LABEL_3:
  v57.receiver = self;
  v57.super_class = (Class)_PASLPReaderBinaryPlist;
  v15 = [(_PASLPReaderBinaryPlist *)&v57 init];
  uint64_t v16 = (uint64_t)v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_backingData, a3);
    uint64_t v17 = [*(id *)(v16 + 8) bytes];
    uint64_t v18 = [*(id *)(v16 + 8) length];
    *(void *)(v16 + 16) = v17;
    *(void *)(v16 + 24) = v18;
    context.version = 0;
    context.info = v12;
    memset(&context.retain, 0, 24);
    context.allocate = (CFAllocatorAllocateCallBack)cfAllocateAlwaysFailing;
    context.reallocate = 0;
    context.deallocate = (CFAllocatorDeallocateCallBack)cfDeallocateReleaseInfo;
    context.preferredSize = 0;
    CFAllocatorRef v19 = CFAllocatorCreate(0, &context);
    *(void *)(v16 + 64) = v19;
    if (!v19)
    {
      v56 = [MEMORY[0x1E4F28B00] currentHandler];
      [v56 handleFailureInMethod:a2 object:v16 file:@"_PASLPReaderBinaryPlist.m" lineNumber:205 description:@"Failed to create _releaseReaderDeallocator"];
    }
    id v20 = v14;
    unint64_t v21 = *(void *)(v16 + 24);
    if (v21 <= 7)
    {
      v22 = (void *)[[NSString alloc] initWithFormat:@"file \"%@\" not long enough for bplist header", v20];
LABEL_11:
      id v24 = v22;
      corruptionError(v20, v22);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if (v21 <= 0x1F)
    {
      v22 = (void *)[[NSString alloc] initWithFormat:@"file \"%@\" not long enough for bplist trailer", v20];
      goto LABEL_11;
    }
    uint64_t v26 = *(void *)(v16 + 16);
    if (*(_DWORD *)v26 != 1768714338 || *(_WORD *)(v26 + 4) != 29811)
    {
      id v24 = (id)[[NSString alloc] initWithFormat:@"file \"%@\" is missing \"bplist\" magic", v20];
      id v28 = v20;
      v29 = objc_opt_new();
      v30 = v29;
      if (v24)
      {
        v31 = (void *)[[NSString alloc] initWithFormat:@"The file is not a bplist archive: %@", v24];
        [v30 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }
      else
      {
        [v29 setObject:@"The file is not a bplist archive." forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }
      [v30 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28588]];

      [v30 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F28328]];
      id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
      v45 = (void *)[v30 copy];
      v46 = v44;
      uint64_t v47 = 8;
LABEL_29:
      id v25 = (id)[v46 initWithDomain:@"_PASLazyPlistErrorDomain" code:v47 userInfo:v45];

      goto LABEL_30;
    }
    if (*(unsigned char *)(v26 + 6) != 48 || (*(unsigned char *)(v26 + 7) & 0xFE) != 0x30)
    {
      id v24 = (id)[[NSString alloc] initWithFormat:@"rejecting file \"%@\" because header has unexpected version \"bplist%c%c\"", v20, *(unsigned __int8 *)(v26 + 6), *(unsigned __int8 *)(v26 + 7)];
      v42 = objc_opt_new();
      v30 = v42;
      if (v24)
      {
        v43 = (void *)[[NSString alloc] initWithFormat:@"Unsupported format version: %@", v24];
        [v30 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }
      else
      {
        [v42 setObject:@"Unsupported format version." forKeyedSubscript:*MEMORY[0x1E4F28568]];
      }
      [v30 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28588]];

      id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
      v45 = (void *)[v30 copy];
      v46 = v48;
      uint64_t v47 = 3;
      goto LABEL_29;
    }
    unint64_t v32 = *(unsigned __int8 *)(v21 + v26 - 26);
    char v33 = *(unsigned char *)(v21 + v26 - 25);
    unint64_t v35 = *(void *)(v21 + v26 - 24);
    unint64_t v34 = *(void *)(v21 + v26 - 16);
    unint64_t v36 = *(void *)(v21 + v26 - 8);
    *(unsigned char *)(v16 + 48) = v32;
    *(unsigned char *)(v16 + 49) = v33;
    unint64_t v37 = bswap64(v35);
    *(void *)(v16 + 40) = v37;
    unint64_t v38 = bswap64(v36);
    BOOL v39 = __CFADD__(v26, v38);
    uint64_t v40 = v26 + v38;
    if (v39)
    {
      v41 = @"mmapBase + indicated offsets table location overflows address space";
    }
    else if (is_mul_ok(v32, v37))
    {
      unint64_t v50 = v32 * v37;
      BOOL v39 = __CFADD__(v40, v50);
      uint64_t v51 = v40 + v50;
      if (v39)
      {
        v41 = @"purported last byte of offsets list exceeds address space";
      }
      else if (v51 - v26 <= v21)
      {
        *(void *)(v16 + 56) = v40;
        unint64_t v52 = bswap64(v34);
        *(void *)(v16 + 32) = v52;
        if (v52 <= v37)
        {
          if (v7)
          {
            uint64_t v55 = -[_PASLPReaderBinaryPlist _offsetForRecord:](v16, v52);
            if (v55 == -1)
            {
              v41 = @"purported offset of serialized top-level record starts past end of buffer";
              goto LABEL_44;
            }
            if (!-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:](v16, v55, 0, 0, 128, 0))
            {
              v41 = @"A disqualifying issue was found while performing a validation traversal of the bplist's object tree";
              goto LABEL_44;
            }
          }

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            LODWORD(context.version) = 138412290;
            *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v20;
            _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASLazyPlist: Loaded \"%@\"", (uint8_t *)&context, 0xCu);
          }
          v23 = (_PASLPReaderBinaryPlist *)(id)v16;
          id v25 = 0;
          goto LABEL_33;
        }
        v41 = @"offsets table is not large enough to contain the record number of the top-level object";
      }
      else
      {
        v41 = @"purported last byte of offsets list exceeds size of backing store";
      }
    }
    else
    {
      v41 = @"(size of offset table entry) * (number of offset table entries) overflows UINT64_MAX";
    }
LABEL_44:
    corruptionError(v20, v41);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = 0;
LABEL_30:

    if (a6)
    {
      id v25 = v25;
      v23 = 0;
      *a6 = v25;
    }
    else
    {
      v23 = 0;
    }
LABEL_33:

    goto LABEL_34;
  }
  v23 = 0;
LABEL_34:

  return v23;
}

- (uint64_t)_validateCollectionMembers:(int)a3 validationDepth:(uint64_t)a4 count:
{
  if (!a3) {
    return 0;
  }
  if (!a4) {
    return 1;
  }
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 49);
    if (*(unsigned char *)(a1 + 49))
    {
      unint64_t v9 = 0;
      v10 = (unsigned __int8 *)(a2 + v7 * v8);
      do
      {
        unsigned int v11 = *v10++;
        unint64_t v9 = v11 | (v9 << 8);
        --v8;
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (*(void *)(a1 + 40) <= v9) {
      break;
    }
    uint64_t v12 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned char *)(a1 + 48))
    {
      unint64_t v13 = 0;
      v14 = (unsigned __int8 *)(*(void *)(a1 + 56) + v9 * v12);
      do
      {
        unsigned int v15 = *v14++;
        unint64_t v13 = v15 | (v13 << 8);
        --v12;
      }
      while (v12);
    }
    else
    {
      unint64_t v13 = 0;
    }
    if (v13 >= *(void *)(a1 + 24)) {
      break;
    }
    uint64_t result = -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:](a1);
    if (!result) {
      return result;
    }
    if (++v7 == a4) {
      return 1;
    }
  }
  return 0;
}

- (char)_decodeOffset:(id *)a3 decodedObject:(void *)a4 ifEqualToReferenceObject:(int)a5 validationDepth:(void *)a6 unlazyCopyCache:
{
  v94[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  unint64_t v13 = v12;
  if (!a1
    || (v14 = *(void *)(a1 + 16), v86 = a2, unsigned int v15 = (unsigned char *)(v14 + a2), __CFADD__(v14, a2))
    || ((unint64_t v16 = *(void *)(a1 + 24) + v14, (unint64_t)v15 < v16) ? (v17 = v14 == 0) : (v17 = 1),
        v17 || (uint64_t v18 = (unint64_t *)(v15 + 1), (unint64_t)(v15 + 1) >= v16) || (v94[0] = v15 + 1, !v15)))
  {
LABEL_152:
    CFAllocatorRef v19 = 0;
    goto LABEL_226;
  }
  CFAllocatorRef v19 = 0;
  unsigned int v20 = *v15;
  int v21 = 0;
  switch(v20 >> 4)
  {
    case 0u:
      if (v20 == 9)
      {
        v64 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
      }
      else
      {
        if (v20 != 8)
        {
          if (*v15) {
            goto LABEL_152;
          }
          id v22 = (id)*MEMORY[0x1E4F1D260];
          if (v11)
          {
            if (v22 != v11) {
              goto LABEL_152;
            }
          }
          if (a3)
          {
            id v23 = *a3;
            *a3 = v22;

            unsigned int v15 = (unsigned char *)(*(void *)(a1 + 16) + v86);
          }
          CFAllocatorRef v19 = (char *)((char *)v18 - v15);
          goto LABEL_226;
        }
        v64 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
      }
      CFTypeRef v65 = *v64;
      if (v11 && !CFEqual(*v64, v11)) {
        goto LABEL_152;
      }
      if (a3)
      {
        id v66 = *a3;
        *a3 = (id)v65;
      }
      CFAllocatorRef v19 = (char *)v18 - *(void *)(a1 + 16) - v86;
      goto LABEL_226;
    case 1u:
      unsigned int v28 = v20 & 0xF;
      if (v28 > 4) {
        goto LABEL_152;
      }
      CFAllocatorRef v19 = 0;
      uint64_t v29 = 1 << v28;
      id v25 = (char *)v18 + (1 << v28);
      BOOL v30 = __CFADD__(v18, 1 << v28);
      if ((unint64_t)v25 < v16 && !v30)
      {
        if (!((unint64_t)a3 | (unint64_t)v11)) {
          goto LABEL_94;
        }
        if (v28 >= 4)
        {
          CFNumberRef v33 = [NSNumber numberWithUnsignedLongLong:bswap64(*v18)];
        }
        else
        {
          unint64_t v31 = 0;
          do
          {
            unsigned int v32 = *(unsigned __int8 *)v18;
            uint64_t v18 = (unint64_t *)((char *)v18 + 1);
            unint64_t v31 = v32 | (v31 << 8);
            --v29;
          }
          while (v29);
          unint64_t valuePtr = v31;
          CFNumberRef v33 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
        }
        CFNumberRef v34 = v33;
        if (v11 && !CFEqual(v33, v11))
        {
          CFAllocatorRef v19 = 0;
        }
        else
        {
          if (a3)
          {
            if (!v34) {
              __assert_rtn("-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]", "_PASLPReaderBinaryPlist.m", 541, "decoded != nil");
            }
            objc_storeStrong(a3, v34);
          }
          CFAllocatorRef v19 = &v25[-v86 - *(void *)(a1 + 16)];
        }
        goto LABEL_165;
      }
      goto LABEL_226;
    case 2u:
      int v24 = v20 & 0xF;
      if ((v24 - 4) < 0xFFFFFFFE) {
        goto LABEL_152;
      }
      CFAllocatorRef v19 = 0;
      id v25 = (char *)v18 + (1 << v24);
      BOOL v26 = __CFADD__(v18, 1 << v24);
      if ((unint64_t)v25 < v16 && !v26)
      {
        if (!((unint64_t)a3 | (unint64_t)v11)) {
          goto LABEL_94;
        }
        if (v24 == 2)
        {
          LODWORD(valuePtr) = bswap32(*(_DWORD *)v18);
          CFNumberRef v27 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
        }
        else
        {
          unint64_t valuePtr = 0;
          __memcpy_chk();
          unint64_t v93 = bswap64(0);
          CFNumberRef v27 = CFNumberCreate(0, kCFNumberFloat64Type, &v93);
        }
        CFNumberRef v34 = v27;
        if (!v27) {
          __assert_rtn("-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]", "_PASLPReaderBinaryPlist.m", 572, "decoded != nil");
        }
        if (v11 && !CFEqual(v27, v11))
        {
          CFAllocatorRef v19 = 0;
        }
        else
        {
          if (a3) {
            objc_storeStrong(a3, v34);
          }
          CFAllocatorRef v19 = &v25[-*(void *)(a1 + 16) - v86];
        }
LABEL_165:
      }
      goto LABEL_226;
    case 3u:
      if (v20 != 51) {
        goto LABEL_152;
      }
      CFAllocatorRef v19 = 0;
      id v25 = v15 + 9;
      if ((unint64_t)(v15 + 9) < v16 && (unint64_t)v15 < 0xFFFFFFFFFFFFFFF7)
      {
        if ((unint64_t)a3 | (unint64_t)v11)
        {
          CFDateRef v50 = CFDateCreate(0, COERCE_CFABSOLUTETIME(bswap64(*v18)));
          if (!v50) {
            __assert_rtn("-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]", "_PASLPReaderBinaryPlist.m", 600, "decoded");
          }
          CFDateRef v51 = v50;
          if (v11 && !CFEqual(v50, v11))
          {
            CFAllocatorRef v19 = 0;
          }
          else
          {
            if (a3) {
              objc_storeStrong(a3, v51);
            }
            CFAllocatorRef v19 = &v25[-*(void *)(a1 + 16) - v86];
          }
        }
        else
        {
LABEL_94:
          CFAllocatorRef v19 = (char *)(v25 - v15);
        }
      }
      goto LABEL_226;
    case 4u:
      CFIndex v52 = v20 & 0xF;
      unint64_t v93 = v52;
      id v85 = v12;
      if ((v20 & 0xF) == 0xF)
      {
        if (!-[_PASLPReaderBinaryPlist _decodeUnsignedIntegerValue:usingCursor:](a1, &v93, v94)) {
          goto LABEL_141;
        }
        CFIndex v52 = v93;
        uint64_t v18 = (unint64_t *)v94[0];
      }
      CFAllocatorRef v19 = 0;
      v53 = (char *)v18 + v52;
      BOOL v54 = __CFADD__(v18, v52);
      if ((unint64_t)v53 >= v16 || v54) {
        goto LABEL_225;
      }
      v94[0] = (char *)v18 + v52;
      if (!v18) {
        goto LABEL_141;
      }
      if (!((unint64_t)a3 | (unint64_t)v11))
      {
        CFAllocatorRef v19 = (char *)(v53 - v15);
        goto LABEL_225;
      }
      if (!v11)
      {
        if (!v52)
        {
          CFDataRef v67 = (CFDataRef)&unk_1EC36FFC0;
          id v70 = &unk_1EC36FFC0;
          goto LABEL_177;
        }
LABEL_161:
        CFRetain(*(CFTypeRef *)(a1 + 8));
        CFDataRef v67 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v18, v52, *(CFAllocatorRef *)(a1 + 64));
        if (!v67)
        {
          CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 64), v18);
          if (a3) {
            __assert_rtn("-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]", "_PASLPReaderBinaryPlist.m", 665, "decoded");
          }
          CFDataRef v67 = 0;
LABEL_179:
          uint64_t v71 = *(void *)(a1 + 16);

          CFAllocatorRef v19 = &v53[-v71 - v86];
          goto LABEL_225;
        }
LABEL_177:
        if (a3) {
          objc_storeStrong(a3, v67);
        }
        goto LABEL_179;
      }
      CFTypeID v55 = CFGetTypeID(v11);
      if (v55 != CFDataGetTypeID()) {
        goto LABEL_141;
      }
      id v56 = v11;
      if (CFDataGetLength((CFDataRef)v56) == v52)
      {
        if (v52)
        {
          unint64_t valuePtr = 0;
          p_unint64_t valuePtr = &valuePtr;
          uint64_t v91 = 0x2020000000;
          char v92 = 1;
          v88[0] = MEMORY[0x1E4F143A8];
          v88[1] = 3221225472;
          v88[2] = __112___PASLPReaderBinaryPlist__decodeOffset_decodedObject_ifEqualToReferenceObject_validationDepth_unlazyCopyCache___block_invoke;
          v88[3] = &unk_1E5AEA5D8;
          v88[4] = &valuePtr;
          v88[5] = v18;
          [v56 enumerateByteRangesUsingBlock:v88];
          CFAllocatorRef v19 = 0;
          BOOL v57 = *((unsigned char *)p_valuePtr + 24) == 0;
          if (!a3 && *((unsigned char *)p_valuePtr + 24))
          {
            CFAllocatorRef v19 = &v53[-*(void *)(a1 + 16) - v86];
            BOOL v57 = 1;
          }
          _Block_object_dispose(&valuePtr, 8);

          if (!v57) {
            goto LABEL_161;
          }
          goto LABEL_225;
        }
        if (a3) {
          objc_storeStrong(a3, &unk_1EC36FFC0);
        }
        CFAllocatorRef v19 = &v53[-*(void *)(a1 + 16) - v86];
      }
      else
      {
        CFAllocatorRef v19 = 0;
      }

      goto LABEL_225;
    case 5u:
      int v21 = 1;
      goto LABEL_45;
    case 6u:
LABEL_45:
      unint64_t v35 = v20 & 0xF;
      unint64_t v93 = v35;
      id v85 = v12;
      if ((v20 & 0xF) != 0xF) {
        goto LABEL_48;
      }
      if (!-[_PASLPReaderBinaryPlist _decodeUnsignedIntegerValue:usingCursor:](a1, &v93, v94)) {
        goto LABEL_141;
      }
      unint64_t v35 = v93;
      uint64_t v18 = (unint64_t *)v94[0];
LABEL_48:
      CFAllocatorRef v19 = 0;
      unint64_t v36 = v35 << (v21 ^ 1u);
      unint64_t v37 = (char *)v18 + v36;
      BOOL v38 = __CFADD__(v18, v36);
      if ((unint64_t)v37 >= v16 || v38) {
        goto LABEL_225;
      }
      if (!v18)
      {
LABEL_141:
        CFAllocatorRef v19 = 0;
        goto LABEL_225;
      }
      if (!((unint64_t)a3 | (unint64_t)v11))
      {
        CFAllocatorRef v19 = (char *)(v37 - v15);
        goto LABEL_225;
      }
      v84 = v37;
      if (!v11) {
        goto LABEL_211;
      }
      CFTypeID v39 = CFGetTypeID(v11);
      if (v39 != CFStringGetTypeID())
      {
        uint64_t v40 = 0;
        goto LABEL_144;
      }
      uint64_t v40 = (__CFString *)v11;
      Length = (const void *)CFStringGetLength(v40);
      if (Length != (const void *)v35) {
        goto LABEL_144;
      }
      if (v35)
      {
        if (v21)
        {
          Length = (const void *)[(__CFString *)v40 _fastCStringContents:0];
          if (Length)
          {
            int v42 = memcmp(Length, v18, v35);
            if (a3 || v42)
            {
              if (!v42)
              {
                if (!a3) {
                  goto LABEL_223;
                }
                goto LABEL_213;
              }
LABEL_144:
              CFAllocatorRef v19 = 0;
              goto LABEL_224;
            }
LABEL_182:
            CFAllocatorRef v19 = &v84[-*(void *)(a1 + 16) - v86];
LABEL_224:

LABEL_225:
            unint64_t v13 = v85;
            goto LABEL_226;
          }
          uint64_t v73 = 1;
        }
        else
        {
          uint64_t v73 = 2415919360;
        }
        uint64_t v83 = v73;
        MEMORY[0x1F4188790](Length);
        bzero(v82, 0x1000uLL);
        unint64_t valuePtr = 0;
        p_unint64_t valuePtr = (unint64_t *)v35;
        unint64_t v76 = v35;
        do
        {
          unint64_t v77 = valuePtr;
          size_t v87 = 0;
          if (valuePtr) {
            uint64_t v78 = 4096;
          }
          else {
            uint64_t v78 = 64;
          }
          if ((-[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v40, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v82, v78, &v87, v83, 0, valuePtr, v76, &valuePtr) & 1) == 0|| memcmp((char *)v18 + (v77 << (v21 ^ 1u)), v82, v87))
          {
            goto LABEL_144;
          }
          unint64_t v76 = (unint64_t)p_valuePtr;
        }
        while (p_valuePtr);
LABEL_211:
        if (!a3) {
          goto LABEL_223;
        }
        if (!v21)
        {
          if (v35 > 0x1F) {
            v79 = (__CFString *)-[_PASBigEndianUTF16String initWithLength:buffer:backingObject:]((id *)[_PASBigEndianUTF16String alloc], (void *)v35, v18, (void *)a1);
          }
          else {
            v79 = (__CFString *)[[NSString alloc] initWithBytes:v18 length:2 * v35 encoding:2415919360];
          }
          goto LABEL_221;
        }
LABEL_213:
        if (v35 > 0x1E)
        {
          CFRetain(*(CFTypeRef *)(a1 + 8));
          v79 = (__CFString *)CFStringCreateWithBytesNoCopy(0, (const UInt8 *)v18, v35, 0x600u, 0, *(CFAllocatorRef *)(a1 + 64));
          if (v79)
          {
LABEL_222:
            id v80 = *a3;
            *a3 = v79;

LABEL_223:
            CFAllocatorRef v19 = &v84[-*(void *)(a1 + 16) - v86];
            uint64_t v40 = (__CFString *)v11;
            goto LABEL_224;
          }
          CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 64), v18);
LABEL_219:
          v79 = &stru_1EF678A50;
          goto LABEL_222;
        }
        v79 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)v18, v35, 0x600u, 0);
LABEL_221:
        if (v79) {
          goto LABEL_222;
        }
        goto LABEL_219;
      }
      if (a3)
      {
        id v72 = *a3;
        *a3 = &stru_1EF678A50;
      }
      goto LABEL_182;
    case 0xAu:
      uint64_t v43 = v20 & 0xF;
      unint64_t valuePtr = v43;
      if ((v20 & 0xF) != 0xF) {
        goto LABEL_69;
      }
      if (!-[_PASLPReaderBinaryPlist _decodeUnsignedIntegerValue:usingCursor:](a1, &valuePtr, v94)) {
        goto LABEL_152;
      }
      uint64_t v43 = valuePtr;
      uint64_t v18 = (unint64_t *)v94[0];
LABEL_69:
      CFAllocatorRef v19 = 0;
      uint64_t v44 = v43 * *(unsigned __int8 *)(a1 + 49);
      v45 = (char *)v18 + v44;
      BOOL v46 = __CFADD__(v18, v44);
      if ((unint64_t)v45 >= v16 || v46) {
        goto LABEL_226;
      }
      if (!v18
        || (a5 & 0x80000000) == 0
        && !-[_PASLPReaderBinaryPlist _validateCollectionMembers:validationDepth:count:](a1, (uint64_t)v18, (unsigned __int16)a5, v43))
      {
        goto LABEL_152;
      }
      if (!((unint64_t)a3 | (unint64_t)v11)) {
        goto LABEL_139;
      }
      if (v11)
      {
        CFTypeID v47 = CFGetTypeID(v11);
        if (v47 != CFArrayGetTypeID() || CFArrayGetCount((CFArrayRef)v11) != v43) {
          goto LABEL_152;
        }
        if (!v43)
        {
          if (!a3) {
            goto LABEL_139;
          }
          id v48 = *a3;
          v49 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_138;
        }
      }
      else if (!v43)
      {
        v68 = v13;
        v69 = (_PASLPArray *)MEMORY[0x1E4F1CBF0];
        goto LABEL_189;
      }
      if (v13)
      {
        v68 = v13;
        -[_PASLPReaderBinaryPlist _unlazyCopyForArrayWithCount:storage:unlazyCopyCache:](a1, v43, (uint64_t)v18, v13);
        v69 = (_PASLPArray *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v68 = 0;
        v74 = [[_PASLPArrayContext alloc] initWithStorage:v18 count:v43];
        v69 = [[_PASLPArray alloc] initWithLazyPlistReader:a1 context:v74];
      }
      if (v11 && ![(_PASLPArray *)v69 isEqualToArray:v11]) {
        goto LABEL_198;
      }
LABEL_189:
      if (!a3) {
        goto LABEL_196;
      }
      goto LABEL_195;
    case 0xDu:
      uint64_t v58 = v20 & 0xF;
      unint64_t valuePtr = v58;
      if ((v20 & 0xF) != 0xF) {
        goto LABEL_117;
      }
      if (!-[_PASLPReaderBinaryPlist _decodeUnsignedIntegerValue:usingCursor:](a1, &valuePtr, v94)) {
        goto LABEL_152;
      }
      uint64_t v58 = valuePtr;
      uint64_t v18 = (unint64_t *)v94[0];
LABEL_117:
      CFAllocatorRef v19 = 0;
      uint64_t v59 = v58 * *(unsigned __int8 *)(a1 + 49);
      v60 = (char *)v18 + v59;
      BOOL v61 = __CFADD__(v18, v59);
      if ((unint64_t)v60 >= v16 || v61) {
        goto LABEL_226;
      }
      if (!v18) {
        goto LABEL_152;
      }
      CFAllocatorRef v19 = 0;
      v45 = &v60[v59];
      BOOL v62 = __CFADD__(v60, v59);
      if ((unint64_t)v45 >= v16 || v62 || !v60) {
        goto LABEL_226;
      }
      if ((a5 & 0x80000000) == 0
        && !-[_PASLPReaderBinaryPlist _validateCollectionMembers:validationDepth:count:](a1, (uint64_t)v18, (unsigned __int16)a5, 2 * v58))
      {
        goto LABEL_152;
      }
      if (!((unint64_t)a3 | (unint64_t)v11)) {
        goto LABEL_139;
      }
      if (!v11)
      {
        if (!v58)
        {
          v68 = v13;
          v69 = (_PASLPArray *)MEMORY[0x1E4F1CC08];
          goto LABEL_194;
        }
LABEL_173:
        if (v13)
        {
          v68 = v13;
          -[_PASLPReaderBinaryPlist _unlazyCopyForDictionaryWithCount:storage:unlazyCopyCache:](a1, v58, (uint64_t)v18, v13);
          v69 = (_PASLPArray *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v68 = 0;
          v75 = [[_PASLPDictionaryContext alloc] initWithStorage:v18 count:v58];
          v69 = [[_PASLPDictionary alloc] initWithLazyPlistReader:a1 context:v75];
        }
        if (v11 && !CFEqual(v69, v11))
        {
LABEL_198:
          CFAllocatorRef v19 = 0;
LABEL_197:

          unint64_t v13 = v68;
          goto LABEL_226;
        }
LABEL_194:
        if (a3) {
LABEL_195:
        }
          objc_storeStrong(a3, v69);
LABEL_196:
        CFAllocatorRef v19 = &v45[-*(void *)(a1 + 16) - v86];
        goto LABEL_197;
      }
      CFTypeID v63 = CFGetTypeID(v11);
      if (v63 != CFDictionaryGetTypeID() || CFDictionaryGetCount((CFDictionaryRef)v11) != v58) {
        goto LABEL_152;
      }
      if (v58) {
        goto LABEL_173;
      }
      if (a3)
      {
        id v48 = *a3;
        v49 = (void *)MEMORY[0x1E4F1CC08];
LABEL_138:
        *a3 = v49;
      }
LABEL_139:
      CFAllocatorRef v19 = &v45[-*(void *)(a1 + 16) - v86];
LABEL_226:

      return v19;
    default:
      goto LABEL_226;
  }
}

- (uint64_t)_decodeUnsignedIntegerValue:(void *)a3 usingCursor:
{
  v3 = (unsigned char *)*a3;
  uint64_t v4 = (unint64_t *)(*a3 + 1);
  if ((*(unsigned char *)*a3 & 0xF0) != 0x10) {
    return 0;
  }
  unsigned int v5 = *(unsigned char *)*a3 & 0xF;
  if (v5 > 4) {
    return 0;
  }
  uint64_t result = 0;
  unint64_t v8 = *(void *)(a1 + 24) + *(void *)(a1 + 16);
  uint64_t v9 = 1 << v5;
  v10 = (char *)v4 + (1 << v5);
  BOOL v11 = __CFADD__(v4, 1 << v5);
  if ((unint64_t)v10 < v8 && !v11)
  {
    if (*a3 == -1) {
      return 0;
    }
    if (v5 > 3)
    {
      unint64_t v12 = bswap64(*v4);
    }
    else
    {
      unint64_t v12 = 0;
      do
      {
        unsigned int v13 = *(unsigned __int8 *)v4;
        uint64_t v4 = (unint64_t *)((char *)v4 + 1);
        unint64_t v12 = v13 | (v12 << 8);
        --v9;
      }
      while (v9);
      if (v5 == 3 && (v12 & 0x8000000000000000) != 0) {
        return 0;
      }
    }
    *a2 = v12;
    *a3 = v10;
    return v10 - v3;
  }
  return result;
}

- (uint64_t)_offsetForRecord:(uint64_t)result
{
  if (result)
  {
    if (*(void *)(result + 40) <= a2)
    {
      return -1;
    }
    else
    {
      uint64_t v2 = *(unsigned __int8 *)(result + 48);
      if (*(unsigned char *)(result + 48))
      {
        unint64_t v3 = 0;
        uint64_t v4 = (unsigned __int8 *)(*(void *)(result + 56) + v2 * a2);
        do
        {
          unsigned int v5 = *v4++;
          unint64_t v3 = v5 | (v3 << 8);
          --v2;
        }
        while (v2);
      }
      else
      {
        unint64_t v3 = 0;
      }
      if (v3 >= *(void *)(result + 24)) {
        return -1;
      }
      else {
        return v3;
      }
    }
  }
  return result;
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
  v4.super_class = (Class)_PASLPReaderBinaryPlist;
  [(_PASLPReaderBinaryPlist *)&v4 dealloc];
}

- (id)unlazyCopyForArrayWithContext:(id)a3
{
  objc_super v4 = a3;
  if (v4)
  {
    uint64_t v6 = v4[1];
    uint64_t v5 = v4[2];
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }

  return -[_PASLPReaderBinaryPlist _unlazyCopyForArrayWithCount:storage:unlazyCopyCache:]((uint64_t)self, v5, v6, 0);
}

- (id)_unlazyCopyForArrayWithCount:(uint64_t)a3 storage:(void *)a4 unlazyCopyCache:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unint64_t v8 = v7;
  if (!a1)
  {
    id v22 = 0;
    goto LABEL_30;
  }
  if (!v7)
  {
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:0];
    id v7 = (id)[v8 setCount:*(void *)(a1 + 40)];
  }
  unint64_t v9 = (8 * a2) | 7;
  memptr = 0;
  uint64_t v27 = 0;
  if (v9 > 0x80)
  {
    int v21 = malloc_type_posix_memalign(&memptr, 8uLL, 8 * a2, 0x80040B8603338uLL);
    LOBYTE(v27) = 0;
    if (v21)
    {
      id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v24);
    }
    v10 = (char *)memptr;
    if (!a2) {
      goto LABEL_28;
    }
    goto LABEL_6;
  }
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, (8 * a2) | 7);
  if (a2)
  {
LABEL_6:
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = *(unsigned __int8 *)(a1 + 49);
      if (*(unsigned char *)(a1 + 49))
      {
        unint64_t v13 = 0;
        uint64_t v14 = (unsigned __int8 *)(a3 + v11 * v12);
        do
        {
          unsigned int v15 = *v14++;
          unint64_t v13 = v15 | (v13 << 8);
          --v12;
        }
        while (v12);
      }
      else
      {
        unint64_t v13 = 0;
      }
      unint64_t v16 = [v8 pointerAtIndex:v13];
      memptr = v16;
      if (!v16)
      {
        if (*(void *)(a1 + 40) <= v13) {
          goto LABEL_25;
        }
        uint64_t v17 = *(unsigned __int8 *)(a1 + 48);
        if (*(unsigned char *)(a1 + 48))
        {
          unint64_t v18 = 0;
          CFAllocatorRef v19 = (unsigned __int8 *)(*(void *)(a1 + 56) + v13 * v17);
          do
          {
            unsigned int v20 = *v19++;
            unint64_t v18 = v20 | (v18 << 8);
            --v17;
          }
          while (v17);
        }
        else
        {
          unint64_t v18 = 0;
        }
        if (v18 >= *(void *)(a1 + 24))
        {
LABEL_25:
          id v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:sel__unlazyCopyForArrayWithCount_storage_unlazyCopyCache_, a1, @"_PASLPReaderBinaryPlist.m", 1067, @"_unlazyCopyForArray error loading array member, this should have been caught during validation" object file lineNumber description];
        }
        -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:](a1);
        if (!memptr)
        {
          id v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:sel__unlazyCopyForArrayWithCount_storage_unlazyCopyCache_, a1, @"_PASLPReaderBinaryPlist.m", 1073, @"Invalid parameter not satisfying: %@", @"member" object file lineNumber description];
        }
        objc_msgSend(v8, "replacePointerAtIndex:withPointer:", v13);
        unint64_t v16 = memptr;
      }
      *(void *)&v10[8 * v11] = v16;

      ++v11;
    }
    while (v11 != a2);
  }
LABEL_28:
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v10 count:a2];
  if (v9 > 0x80) {
    free(v10);
  }
LABEL_30:

  return v22;
}

- (id)_unlazyCopyForDictionaryWithCount:(uint64_t)a3 storage:(void *)a4 unlazyCopyCache:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unint64_t v8 = v7;
  if (a1)
  {
    if (!v7)
    {
      unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:0];
      id v7 = (id)[v8 setCount:*(void *)(a1 + 40)];
    }
    unint64_t v9 = (16 * a2) | 7;
    memptr = 0;
    uint64_t v28 = 0;
    if (v9 > 0x80)
    {
      int v24 = malloc_type_posix_memalign(&memptr, 8uLL, 16 * a2, 0x80040B8603338uLL);
      LOBYTE(v28) = 0;
      if (v24)
      {
        id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v25);
      }
      v10 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1F4188790](v7);
      v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v10, (16 * a2) | 7);
    }
    if (2 * a2)
    {
      uint64_t v11 = 0;
      do
      {
        uint64_t v12 = *(unsigned __int8 *)(a1 + 49);
        if (*(unsigned char *)(a1 + 49))
        {
          unint64_t v13 = 0;
          uint64_t v14 = (unsigned __int8 *)(a3 + v11 * v12);
          do
          {
            unsigned int v15 = *v14++;
            unint64_t v13 = v15 | (v13 << 8);
            --v12;
          }
          while (v12);
        }
        else
        {
          unint64_t v13 = 0;
        }
        unint64_t v16 = [v8 pointerAtIndex:v13];
        memptr = v16;
        if (!v16)
        {
          if (*(void *)(a1 + 40) <= v13) {
            goto LABEL_25;
          }
          uint64_t v17 = *(unsigned __int8 *)(a1 + 48);
          if (*(unsigned char *)(a1 + 48))
          {
            unint64_t v18 = 0;
            CFAllocatorRef v19 = (unsigned __int8 *)(*(void *)(a1 + 56) + v13 * v17);
            do
            {
              unsigned int v20 = *v19++;
              unint64_t v18 = v20 | (v18 << 8);
              --v17;
            }
            while (v17);
          }
          else
          {
            unint64_t v18 = 0;
          }
          if (v18 >= *(void *)(a1 + 24))
          {
LABEL_25:
            id v26 = [MEMORY[0x1E4F28B00] currentHandler];
            [v26 handleFailureInMethod:sel__unlazyCopyForDictionaryWithCount_storage_unlazyCopyCache_, a1, @"_PASLPReaderBinaryPlist.m", 1009, @"_unlazyCopyForDictionary error loading dictionary member, this should have been caught during validation" object file lineNumber description];
          }
          -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:](a1);
          [v8 replacePointerAtIndex:v13 withPointer:memptr];
          unint64_t v16 = memptr;
          if (!memptr)
          {
            int v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:sel__unlazyCopyForDictionaryWithCount_storage_unlazyCopyCache_, a1, @"_PASLPReaderBinaryPlist.m", 1017, @"Invalid parameter not satisfying: %@", @"materializedDictionaryMember" object file lineNumber description];

            unint64_t v16 = memptr;
          }
        }
        *(void *)&v10[8 * v11] = v16;

        ++v11;
      }
      while (v11 != 2 * a2);
    }
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:&v10[8 * a2] forKeys:v10 count:a2];
    if (v9 > 0x80) {
      free(v10);
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)objectAtIndex:(unint64_t)a3 usingArrayContext:(id)a4
{
  if (self && (!a4 ? (uint64_t v7 = 0) : (uint64_t v7 = *((void *)a4 + 1)), (objectRefSize = self->_objectRefSize) != 0))
  {
    unint64_t v9 = 0;
    v10 = (unsigned __int8 *)(v7 + objectRefSize * a3);
    do
    {
      unsigned int v11 = *v10++;
      unint64_t v9 = v11 | (v9 << 8);
      --objectRefSize;
    }
    while (objectRefSize);
  }
  else
  {
    unint64_t v9 = 0;
  }
  uint64_t v12 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, v9);
  uint64_t v13 = v12;
  if (v12 == -1)
  {
    unint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_PASLPReaderBinaryPlist.m", 1042, @"Invalid parameter not satisfying: %@", @"offset != UINT64_MAX" object file lineNumber description];

    uint64_t v14 = -1;
  }
  else
  {
    uint64_t v14 = v12;
  }
  id v20 = 0;
  -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v14, &v20, 0, -1, 0);
  id v15 = v20;
  if (!v20)
  {
    CFAllocatorRef v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_PASLPReaderBinaryPlist.m", 1046, @"Unexpected validation failure (index=%tu, offset=%llu)", a3, v13 object file lineNumber description];

    id v15 = v20;
  }
  id v16 = v15;

  return v16;
}

- (id)unlazyCopyForDictionaryWithContext:(id)a3
{
  objc_super v4 = a3;
  if (v4)
  {
    uint64_t v6 = v4[1];
    uint64_t v5 = v4[2];
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }

  return -[_PASLPReaderBinaryPlist _unlazyCopyForDictionaryWithCount:storage:unlazyCopyCache:]((uint64_t)self, v5, v6, 0);
}

- (id)objectAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4
{
  id v7 = a4;
  unint64_t v8 = v7;
  if (self
    && (!v7 ? (uint64_t v9 = 0, v10 = 0) : (v10 = *((void *)v7 + 1), uint64_t v9 = *((void *)v7 + 2)),
        (uint64_t objectRefSize = self->_objectRefSize) != 0))
  {
    unint64_t v12 = 0;
    uint64_t v13 = (unsigned __int8 *)(v10 + (v9 + a3) * objectRefSize);
    do
    {
      unsigned int v14 = *v13++;
      unint64_t v12 = v14 | (v12 << 8);
      --objectRefSize;
    }
    while (objectRefSize);
  }
  else
  {
    unint64_t v12 = 0;
  }
  uint64_t v15 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, v12);
  uint64_t v16 = v15;
  if (v15 == -1)
  {
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_PASLPReaderBinaryPlist.m", 983, @"Invalid parameter not satisfying: %@", @"offset != UINT64_MAX" object file lineNumber description];

    uint64_t v17 = -1;
  }
  else
  {
    uint64_t v17 = v15;
  }
  id v23 = 0;
  -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v17, &v23, 0, -1, 0);
  id v18 = v23;
  if (!v23)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_PASLPReaderBinaryPlist.m", 987, @"Unexpected validation failure (index=%tu, offset=%llu)", a3, v16 object file lineNumber description];

    id v18 = v23;
  }
  id v19 = v18;

  return v19;
}

- (id)keyAtIndex:(unint64_t)a3 usingDictionaryContext:(id)a4
{
  if (self && (!a4 ? (uint64_t v7 = 0) : (uint64_t v7 = *((void *)a4 + 1)), (objectRefSize = self->_objectRefSize) != 0))
  {
    unint64_t v9 = 0;
    uint64_t v10 = (unsigned __int8 *)(v7 + objectRefSize * a3);
    do
    {
      unsigned int v11 = *v10++;
      unint64_t v9 = v11 | (v9 << 8);
      --objectRefSize;
    }
    while (objectRefSize);
  }
  else
  {
    unint64_t v9 = 0;
  }
  uint64_t v12 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, v9);
  uint64_t v13 = v12;
  if (v12 == -1)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_PASLPReaderBinaryPlist.m", 970, @"Invalid parameter not satisfying: %@", @"offset != UINT64_MAX" object file lineNumber description];

    uint64_t v14 = -1;
  }
  else
  {
    uint64_t v14 = v12;
  }
  id v20 = 0;
  -[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v14, &v20, 0, -1, 0);
  id v15 = v20;
  if (!v20)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_PASLPReaderBinaryPlist.m", 974, @"Unexpected validation failure (index=%tu, offset=%llu)", a3, v13 object file lineNumber description];

    id v15 = v20;
  }
  id v16 = v15;

  return v16;
}

- (id)objectForKey:(id)a3 usingDictionaryContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = v8;
  if (v8 && (uint64_t v10 = *((void *)v8 + 2)) != 0)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *((void *)v8 + 1);
    while (1)
    {
      if (self && (uint64_t objectRefSize = self->_objectRefSize) != 0)
      {
        unint64_t v14 = 0;
        id v15 = (unsigned __int8 *)(v12 + v11 * objectRefSize);
        do
        {
          unsigned int v16 = *v15++;
          unint64_t v14 = v16 | (v14 << 8);
          --objectRefSize;
        }
        while (objectRefSize);
      }
      else
      {
        unint64_t v14 = 0;
      }
      uint64_t v17 = -[_PASLPReaderBinaryPlist _offsetForRecord:]((uint64_t)self, v14);
      if (v17 == -1)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"_PASLPReaderBinaryPlist.m", 953, @"objectForKey error loading key record, this should have been caught during validation" object file lineNumber description];

        uint64_t v17 = -1;
      }
      if (-[_PASLPReaderBinaryPlist _decodeOffset:decodedObject:ifEqualToReferenceObject:validationDepth:unlazyCopyCache:]((uint64_t)self, v17, 0, v7, -1, 0))
      {
        break;
      }
      if (++v11 == v10) {
        goto LABEL_14;
      }
    }
    id v18 = [(_PASLPReaderBinaryPlist *)self objectAtIndex:v11 usingDictionaryContext:v9];
  }
  else
  {
LABEL_14:
    id v18 = 0;
  }

  return v18;
}

@end