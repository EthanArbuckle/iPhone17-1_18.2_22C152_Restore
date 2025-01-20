@interface PASLPReaderV1
@end

@implementation PASLPReaderV1

uint64_t __64___PASLPReaderV1__decodeDictionaryKeyValue_errMsg_handleString___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  }
  else
  {
    **(void **)(result + 48) = objc_msgSend([NSString alloc], "initWithFormat:", @"Dictionary key 0x%lx at ofs 0x%lx points to byte offset outside of string table", *(unsigned int *)(result + 56), *(unsigned int *)(result + 60));
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

uint64_t __54___PASLPReaderV1_objectForKey_usingDictionaryContext___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_10(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    v4 = [[_PASLPDictionary alloc] initWithLazyPlistReader:*(void *)(a1 + 32) context:[[_PASLPDictionaryContext alloc] initWithStorage:a2 count:a3]];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_opt_new();
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __52___PASLPReaderV1_keyAtIndex_usingDictionaryContext___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_10(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_8(uint64_t result)
{
  return result;
}

void __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_9(void *a1, unsigned int *a2, unsigned int a3)
{
  v3 = (void *)a1[8];
  uint64_t v4 = v3[13] + a3;
  ++v3[12];
  v3[13] = v4;
  v3[7] += a3;
  if (a3)
  {
    unint64_t v6 = 0;
    uint64_t v7 = a3;
    uint64_t v8 = (void)a2 << 32;
    uint64_t v29 = a3;
    v9 = a2;
    do
    {
      v10 = (void *)MEMORY[0x1A62450A0]();
      uint64_t v11 = a1[4];
      unsigned int v12 = *v9++;
      unint64_t v13 = v8 - (*(void *)(v11 + 16) << 32) + v12;
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2020000000;
      uint64_t v34 = 0;
      v14 = (void **)(*(void *)(a1[6] + 8) + 40);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_10;
      v30[3] = &unk_1E5AEA6E0;
      v30[4] = &v31;
      if ((-[_PASLPReaderV1 _decodeDictionaryKeyValue:errMsg:handleString:](v11, v13, v14, v30) & 1) == 0) {
        goto LABEL_12;
      }
      unint64_t v15 = v32[3];
      if (!v15)
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a1[9], a1[4], @"_PASLPReaderV1.m", 716, @"Invalid parameter not satisfying: %@", @"next" object file lineNumber description];

        unint64_t v15 = v32[3];
      }
      if (v15 <= v6)
      {
        uint64_t v17 = a1[4];
        if (v17) {
          uint64_t v18 = (a2 - *(_DWORD *)(v17 + 16));
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v19 = [[NSString alloc] initWithFormat:@"dictionary keys in [0x%lx, 0x%lx are non-sorted or contain duplicates"], v18, v18 + 4 * v29);
        uint64_t v20 = *(void *)(a1[6] + 8);
        v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

LABEL_12:
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
        _Block_object_dispose(&v31, 8);
        return;
      }
      _Block_object_dispose(&v31, 8);
      v8 += 0x400000000;
      unint64_t v6 = v15;
      --v7;
    }
    while (v7);
    v22 = &a2[v29];
    uint64_t v23 = v29 - 1;
    uint64_t v24 = (v29 << 34) + ((void)a2 << 32);
    do
    {
      v25 = (void *)MEMORY[0x1A62450A0]();
      ++v22;
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = -[_PASLPReaderV1 _validateObjectGraphWithFilename:rootValue:recursionDepth:stats:error:]();
      int v26 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
      if (v26) {
        BOOL v27 = v23 == 0;
      }
      else {
        BOOL v27 = 1;
      }
      --v23;
      v24 += 0x400000000;
    }
    while (!v27);
  }
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_11(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(result + 56);
  uint64_t v4 = *(void *)(v3 + 88) + a3;
  ++*(void *)(v3 + 80);
  *(void *)(v3 + 88) = v4;
  if (a3)
  {
    uint64_t v5 = a2;
    uint64_t v6 = result;
    uint64_t v7 = a3 - 1;
    uint64_t v8 = a2 << 32;
    do
    {
      v5 += 4;
      result = -[_PASLPReaderV1 _validateObjectGraphWithFilename:rootValue:recursionDepth:stats:error:]();
      *(unsigned char *)(*(void *)(*(void *)(v6 + 48) + 8) + 24) = result;
      if (*(unsigned char *)(*(void *)(*(void *)(v6 + 48) + 8) + 24)) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      --v7;
      v8 += 0x400000000;
    }
    while (!v9);
  }
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_3(uint64_t result)
{
  return result;
}

uint64_t __41___PASLPReaderV1__objectForValue_errMsg___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc(NSNumber) initWithBool:a2];

  return MEMORY[0x1F41817F8]();
}

uint64_t __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_2(uint64_t a1, int a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc(NSNumber) initWithLong:a2];

  return MEMORY[0x1F41817F8]();
}

uint64_t __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc(NSNumber) initWithLongLong:a2];

  return MEMORY[0x1F41817F8]();
}

uint64_t __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_4(uint64_t a1, float a2)
{
  id v4 = objc_alloc(NSNumber);
  *(float *)&double v5 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [v4 initWithFloat:v5];

  return MEMORY[0x1F41817F8]();
}

uint64_t __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_5(uint64_t a1, double a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc(NSNumber) initWithDouble:a2];

  return MEMORY[0x1F41817F8]();
}

uint64_t __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_6(uint64_t a1, double a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a2];

  return MEMORY[0x1F41817F8]();
}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_8;
  v11[3] = &unk_1E5AEA848;
  id v12 = *(id *)(a1 + 32);
  uint64_t v7 = (void *)[v6 initWithBytesNoCopy:a2 length:a3 deallocator:v11];
  uint64_t v8 = objc_msgSend(v7, "_pas_dataWithNonnullBytes");
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_9(uint64_t a1, char *a2)
{
  uint64_t v3 = -[_PASLPReaderV1 _stringForMappedUTF8CString:](*(CFTypeRef **)(a1 + 32), a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = @"String table contains non-UTF-8 content";
  }
}

uint64_t __41___PASLPReaderV1__objectForValue_errMsg___block_invoke_11(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v4 = [[_PASLPArray alloc] initWithLazyPlistReader:*(void *)(a1 + 32) context:[[_PASLPArrayContext alloc] initWithStorage:a2 count:a3]];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_opt_new();
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke(uint64_t result)
{
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_2(uint64_t result)
{
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_4(uint64_t result)
{
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_5(uint64_t result)
{
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_6(uint64_t result)
{
  return result;
}

uint64_t __88___PASLPReaderV1__validateObjectGraphWithFilename_rootValue_recursionDepth_stats_error___block_invoke_7(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 32);
  uint64_t v4 = *(void *)(v3 + 72) + a3;
  ++*(void *)(v3 + 64);
  *(void *)(v3 + 72) = v4;
  return result;
}

@end