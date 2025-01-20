@interface PMLDataChunk
+ (id)chunkOfType:(unsigned int)a3 data:(id)a4 superdata:(id)a5;
+ (id)chunksFromData:(id)a3;
+ (id)chunksFromFileAtPath:(id)a3;
+ (id)serializeChunks:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PMLDataChunk)initWithData:(id)a3;
- (unint64_t)hash;
- (void)setSuperdata:(id)a3;
@end

@implementation PMLDataChunk

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superdata, 0);
  objc_storeStrong((id *)&self->_backingData, 0);
}

- (unint64_t)hash
{
  return [(NSData *)self->_backingData hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PMLDataChunk *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSData *)self->_backingData isEqualToData:v4->_backingData];
  }

  return v5;
}

- (void)setSuperdata:(id)a3
{
}

- (PMLDataChunk)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLDataChunk;
  v6 = [(PMLDataChunk *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingData, a3);
  }

  return v7;
}

+ (id)serializeChunks:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PMLDataChunk.m", 177, @"Invalid parameter not satisfying: %@", @"chunks" object file lineNumber description];
  }
  v6 = objc_opt_new();
  int v37 = 1563411470;
  unsigned int v38 = [v5 count];
  [v6 appendBytes:&v37 length:8];
  uint64_t v7 = v38;
  uint64_t v8 = 12 * v38;
  memptr = 0;
  uint64_t v36 = 0;
  if (v38 > 0x15)
  {
    int v28 = malloc_type_posix_memalign(&memptr, 8uLL, 12 * v38, 0x40712C42uLL);
    LOBYTE(v36) = 0;
    if (v28) {
      goto LABEL_29;
    }
    objc_super v9 = (char *)memptr;
    uint64_t v10 = v38;
  }
  else
  {
    objc_super v9 = (char *)&v31 - ((v8 + 15) & 0x1FFFFFFFF0);
    bzero(v9, 12 * v38);
    uint64_t v10 = v7;
  }
  size_t v11 = 4 * v10;
  size_t v12 = (4 * v10) | 3;
  memptr = 0;
  uint64_t v36 = 0;
  unint64_t v32 = v12;
  uint64_t v33 = v7;
  uint64_t v34 = v8;
  if (v12 <= 0x100)
  {
    v13 = (char *)&v31 - ((v12 + 15) & 0x7FFFFFFF0);
    bzero(v13, v12);
    goto LABEL_7;
  }
  int v29 = malloc_type_posix_memalign(&memptr, 8uLL, 4 * v10, 0x3136F737uLL);
  LOBYTE(v36) = 0;
  if (v29)
  {
LABEL_29:
    id v30 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v30);
  }
  v13 = (char *)memptr;
LABEL_7:
  bzero(v13, v11);
  if ([v5 count])
  {
    uint64_t v14 = 0;
    int v15 = v34 + 8;
    unsigned int v16 = 1;
    do
    {
      if ((v15 & 0x1F) != 0)
      {
        unsigned int v17 = v15 | 0xFFFFFFE0;
        v15 -= v15 | 0xFFFFFFE0;
        *(_DWORD *)&v13[4 * v14] -= v17;
      }
      v18 = &v9[12 * v14];
      *(_DWORD *)v18 = v15;
      v19 = [v5 objectAtIndexedSubscript:v14];
      *((_DWORD *)v18 + 1) = [v19[1] length];

      v20 = [v5 objectAtIndexedSubscript:v14];
      *((_DWORD *)v18 + 2) = [(id)objc_opt_class() dataChunkType];

      v15 += *((_DWORD *)v18 + 1);
      uint64_t v14 = v16;
    }
    while ([v5 count] > (unint64_t)v16++);
  }
  [v6 appendBytes:v9 length:v34];
  if ([v5 count])
  {
    uint64_t v22 = 0;
    unsigned int v23 = 0;
    do
    {
      if (*(_DWORD *)&v13[4 * v22])
      {
        unsigned int v24 = 0;
        do
        {
          [v6 appendBytes:&unk_2212E92F8 length:1];
          ++v24;
        }
        while (v24 < *(_DWORD *)&v13[4 * v22]);
      }
      v25 = [v5 objectAtIndexedSubscript:v22];
      [v6 appendData:v25[1]];

      uint64_t v22 = ++v23;
    }
    while ([v5 count] > (unint64_t)v23);
  }
  if (v33 > 0x15) {
    free(v9);
  }
  if (v32 >= 0x101) {
    free(v13);
  }

  return v6;
}

+ (id)chunksFromData:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (_DWORD *)[v3 bytes];
  unint64_t v5 = [v3 length];
  if (v5 < 8 || *v4 != 1563411470) {
    goto LABEL_5;
  }
  unsigned int v6 = v4[1];
  if (v6)
  {
    unint64_t v7 = v5;
    uint64_t v8 = 12 * v6;
    size_t v9 = v8 + 8;
    if (v8 + 8 > v5)
    {
LABEL_5:
      uint64_t v10 = 0;
      goto LABEL_6;
    }
    size_t v12 = (unsigned int *)malloc_type_malloc(v8 + 8, 0x76E18EuLL);
    memcpy(v12, v4, v9);
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v12[1]];
    if (v12[1])
    {
      unint64_t v13 = 0;
      uint64_t v14 = v12 + 2;
      while (1)
      {
        unint64_t v15 = v14[1] + (unint64_t)*v14;
        if (v15 > v7) {
          break;
        }
        unsigned int v16 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:(char *)v4 + *v14 length:v14[1] freeWhenDone:0];
        uint64_t v17 = +[PMLDataChunk chunkOfType:v14[2] data:v16 superdata:v3];
        if (!v17)
        {
          v19 = PML_LogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            int v20 = 67109120;
            LODWORD(v21) = v13;
            _os_log_error_impl(&dword_2212A0000, v19, OS_LOG_TYPE_ERROR, "Could not parse chunk %u; bailing out",
              (uint8_t *)&v20,
              8u);
          }

          goto LABEL_21;
        }
        v18 = (void *)v17;
        [v10 addObject:v17];

        ++v13;
        v14 += 3;
        if (v13 >= v12[1]) {
          goto LABEL_22;
        }
      }
      unsigned int v16 = PML_LogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v20 = 134218240;
        unint64_t v21 = v15;
        __int16 v22 = 2048;
        unint64_t v23 = v7;
        _os_log_error_impl(&dword_2212A0000, v16, OS_LOG_TYPE_ERROR, "Chunk descriptor out of bounds: ends at %llu in data of length %llu", (uint8_t *)&v20, 0x16u);
      }
LABEL_21:

      uint64_t v10 = 0;
    }
LABEL_22:
    free(v12);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_6:

  return v10;
}

+ (id)chunksFromFileAtPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v9 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v3 options:1 error:&v9];
  id v5 = v9;
  if (v4)
  {
    unsigned int v6 = +[PMLDataChunk chunksFromData:v4];
  }
  else
  {
    unint64_t v7 = PML_LogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl(&dword_2212A0000, v7, OS_LOG_TYPE_ERROR, "Could not open chunk file at %@: %@", buf, 0x16u);
    }

    unsigned int v6 = 0;
  }

  return v6;
}

+ (id)chunkOfType:(unsigned int)a3 data:(id)a4 superdata:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 > 3) {
    id v9 = 0;
  }
  else {
    id v9 = objc_alloc(*off_26459F640[a3]);
  }
  uint64_t v10 = (void *)[v9 initWithData:v7];
  [v10 setSuperdata:v8];

  return v10;
}

@end