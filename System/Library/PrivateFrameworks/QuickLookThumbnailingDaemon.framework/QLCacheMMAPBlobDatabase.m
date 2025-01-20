@interface QLCacheMMAPBlobDatabase
- (BOOL)deleteBlobWithInfo:(id)a3;
- (BOOL)deleteBlobsWithArray:(id)a3;
- (BOOL)doesExist;
- (BOOL)isOpen;
- (BOOL)isValid;
- (QLCacheMMAPBlobDatabase)initWithPath:(id)a3 cacheSize:(int64_t)a4 cacheThread:(id)a5;
- (_QLCacheThread)cacheThread;
- (float)fragmentation;
- (id)cacheHolesOrderedByStart;
- (id)checkConsistency:(id)a3;
- (id)copyBlobWithInfo:(id)a3;
- (id)reserveBufferWithLength:(unint64_t)a3;
- (unint64_t)maxSize;
- (unint64_t)size;
- (void)bufferPointedToByBlobInfo:(id)a3;
- (void)close;
- (void)compactFragmentation;
- (void)discardReservedBufferWithBlobInfo:(id)a3;
- (void)doesExist;
- (void)isValid;
- (void)markPurgeable;
- (void)open;
- (void)reset;
- (void)save;
- (void)setCacheThread:(id)a3;
- (void)validateReservedBufferWithBlobInfo:(id)a3;
@end

@implementation QLCacheMMAPBlobDatabase

- (id)copyBlobWithInfo:(id)a3
{
  id v4 = a3;
  if (![v4 length]) {
    goto LABEL_10;
  }
  if ((unint64_t)[v4 location] <= 7)
  {
    v5 = _log_7();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:]();
    }
LABEL_9:

    goto LABEL_10;
  }
  if ((unint64_t)[v4 length] < 0x10
    || (uint64_t v6 = [v4 location],
        unint64_t v7 = v6 + [v4 length] + 8,
        v7 > [(QLCacheFragHandler *)self->_fragHandler totalLen]))
  {
    v5 = _log_7();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:]();
    }
    goto LABEL_9;
  }
  v8 = mmap(0, [v4 length], 3, 4097, 1627389952, 0);
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v10 = [v4 location];
  unint64_t v11 = v10 - 8;
  unint64_t v12 = [v4 length] + 16;
  vmFile = (unsigned __int8 *)self->_vmFile;
  uint64_t v14 = -8;
  do
  {
    if (vmFile[v10 + v14] != v12)
    {
      unint64_t v17 = 0;
      for (uint64_t i = -1; i != -9; --i)
        unint64_t v17 = vmFile[v10 + i] | (v17 << 8);
      uint64_t v19 = MEMORY[0x1E4F3A768];
      v20 = *(NSObject **)(MEMORY[0x1E4F3A768] + 56);
      if (!v20)
      {
        QLTInitLogging();
        v20 = *(NSObject **)(v19 + 56);
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.7();
      }
      v16 = _log_7();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.6();
      }
      goto LABEL_28;
    }
    v12 >>= 8;
  }
  while (!__CFADD__(v14++, 1));
  if (vm_copy(*MEMORY[0x1E4F14960], (vm_address_t)&vmFile[[v4 location]], objc_msgSend(v4, "length"), (vm_address_t)v8))
  {
    v16 = _log_7();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.5(v4);
    }
  }
  else
  {
    v21 = (char *)self->_vmFile;
    uint64_t v22 = [v4 location];
    uint64_t v23 = [v4 length];
    uint64_t v24 = 0;
    v25 = &v21[v22 + v23];
    while (v25[v24] == v11)
    {
      v11 >>= 8;
      if (++v24 == 8)
      {
        size_t v26 = [v4 length];
        v8 = dispatch_data_create(v8, v26, 0, (dispatch_block_t)*MEMORY[0x1E4F143F8]);
        goto LABEL_11;
      }
    }
    unint64_t v27 = 0;
    for (uint64_t j = 7; j != -1; --j)
      unint64_t v27 = v25[j] | (v27 << 8);
    uint64_t v29 = MEMORY[0x1E4F3A768];
    v30 = *(NSObject **)(MEMORY[0x1E4F3A768] + 56);
    if (!v30)
    {
      QLTInitLogging();
      v30 = *(NSObject **)(v29 + 56);
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.4();
    }
    v16 = _log_7();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:]();
    }
  }
LABEL_28:

  MEMORY[0x1E01C6700](*MEMORY[0x1E4F14960], v8, [v4 length]);
LABEL_10:
  v8 = 0;
LABEL_11:

  return (id)v8;
}

- (void)save
{
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_DEBUG, "save blob database", v1, 2u);
}

- (void)markPurgeable
{
  __error();
  OUTLINED_FUNCTION_8_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
}

- (QLCacheMMAPBlobDatabase)initWithPath:(id)a3 cacheSize:(int64_t)a4 cacheThread:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)QLCacheMMAPBlobDatabase;
  uint64_t v10 = [(QLCacheMMAPBlobDatabase *)&v17 init];
  unint64_t v11 = v10;
  if (v10)
  {
    v10->_file = -1;
    uint64_t v12 = [v8 copy];
    path = v11->_path;
    v11->_path = (NSString *)v12;

    v11->_maxSize = a4;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:40];
    reservedBuffers = v11->_reservedBuffers;
    v11->_reservedBuffers = (NSMutableArray *)v14;

    objc_storeWeak((id *)&v11->_cacheThread, v9);
  }

  return v11;
}

- (BOOL)deleteBlobWithInfo:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
LABEL_6:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = [v4 location];
  unint64_t v6 = v5 + [v4 length] + 8;
  fragHandler = self->_fragHandler;
  p_fragHandler = &self->_fragHandler;
  unint64_t v9 = [(QLCacheFragHandler *)fragHandler totalLen];
  uint64_t v10 = _log_7();
  unint64_t v11 = v10;
  if (v6 > v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase deleteBlobWithInfo:](v4, (id *)p_fragHandler);
    }

    goto LABEL_6;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[QLCacheMMAPBlobDatabase deleteBlobWithInfo:]();
  }

  -[QLCacheFragHandler releaseSpaceAtPos:withLen:](*p_fragHandler, "releaseSpaceAtPos:withLen:", [v4 location] - 8, objc_msgSend(v4, "length") + 16);
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (BOOL)deleteBlobsWithArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    int v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v8 &= [(QLCacheMMAPBlobDatabase *)self deleteBlobWithInfo:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (void)compactFragmentation
{
  [(QLCacheFragHandler *)self->_fragHandler compact];
  fragHandler = self->_fragHandler;
  [(QLCacheFragHandler *)fragHandler truncateUselessSpaceAtEndOfFile];
}

- (BOOL)doesExist
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(NSString *)self->_path stringByAppendingPathExtension:@"data"];
  int v5 = [v3 fileExistsAtPath:v4];

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [(NSString *)self->_path stringByAppendingPathExtension:@"fraghandler"];
  uint64_t v8 = [v6 fileExistsAtPath:v7];

  unint64_t v9 = _log_7();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if ((v5 & v8) == 1)
  {
    if (v10) {
      -[QLCacheMMAPBlobDatabase doesExist](v9);
    }
  }
  else if (v10)
  {
    [(QLCacheMMAPBlobDatabase *)v5 doesExist];
  }

  return v5 & v8;
}

- (float)fragmentation
{
  [(QLCacheFragHandler *)self->_fragHandler frag];
  return result;
}

- (id)cacheHolesOrderedByStart
{
  return [(QLCacheFragHandler *)self->_fragHandler orderedByStart];
}

- (unint64_t)size
{
  return [(QLCacheFragHandler *)self->_fragHandler totalLen];
}

- (void)open
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "open with blob location %@ with max size : %lld");
}

- (BOOL)isValid
{
  int file = self->_file;
  BOOL v4 = file != -1;
  if (file == -1)
  {
    int v5 = _log_7();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase isValid].cold.7();
    }
  }
  if (self->_vmFile == (void *)-1)
  {
    uint64_t v6 = _log_7();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase isValid].cold.6();
    }

    BOOL v4 = 0;
  }
  p_fragHandler = &self->_fragHandler;
  if (![(QLCacheFragHandler *)self->_fragHandler checkConsistency])
  {
    uint64_t v8 = _log_7();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase isValid].cold.5();
    }

    BOOL v4 = 0;
  }
  memset(&v18, 0, sizeof(v18));
  path = self->_path;
  p_path = &self->_path;
  id v11 = [(NSString *)path stringByAppendingPathExtension:@"data", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  int v12 = lstat((const char *)[v11 fileSystemRepresentation], &v18);

  if (v12)
  {
    long long v13 = _log_7();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase isValid].cold.4((id *)p_path);
    }
LABEL_23:

    goto LABEL_24;
  }
  off_t st_size = v18.st_size;
  if (st_size != [(QLCacheFragHandler *)*p_fragHandler totalLen])
  {
    long long v13 = _log_7();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(QLCacheMMAPBlobDatabase *)(uint64_t)&v18.st_size isValid];
    }
    goto LABEL_23;
  }
  if (!v4)
  {
LABEL_24:
    v15 = _log_7();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[QLCacheMMAPBlobDatabase isValid]();
    }
    BOOL v16 = 0;
    goto LABEL_27;
  }
  v15 = _log_7();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[QLCacheMMAPBlobDatabase isValid]();
  }
  BOOL v16 = 1;
LABEL_27:

  return v16;
}

- (id)checkConsistency:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 sortedArrayWithOptions:1 usingComparator:&__block_literal_global_5];
  int v5 = [QLCacheFragHandler alloc];
  uint64_t v6 = [(QLCacheMMAPBlobDatabase *)self cacheThread];
  uint64_t v7 = [(QLCacheFragHandler *)v5 initWithCacheThread:v6];

  [(QLCacheFragHandler *)self->_fragHandler compact];
  [(QLCacheFragHandler *)self->_fragHandler truncateUselessSpaceAtEndOfFile];
  [(QLCacheMMAPBlobDatabase *)self save];
  BOOL v8 = [(QLCacheFragHandler *)self->_fragHandler checkConsistency];
  if (v8)
  {
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = [MEMORY[0x1E4F28E78] string];
    [v9 appendFormat:@"inconsistent frag handler"];
  }
  memset(&v43, 0, sizeof(v43));
  unint64_t v10 = [(QLCacheFragHandler *)self->_fragHandler totalLen];
  id v11 = [(NSString *)self->_path stringByAppendingPathExtension:@"data"];
  int v12 = lstat((const char *)[v11 fileSystemRepresentation], &v43);

  if (v12)
  {
    if (v9)
    {
      if (v8)
      {
LABEL_8:
        long long v13 = @"blob file unreadable";
LABEL_15:
        objc_msgSend(v9, "appendFormat:", v13, st_size, v34);
        int v14 = 1;
        goto LABEL_16;
      }
    }
    else
    {
      unint64_t v9 = [MEMORY[0x1E4F28E78] string];
      if (v8) {
        goto LABEL_8;
      }
    }
    [v9 appendString:@" - "];
    goto LABEL_8;
  }
  if (v43.st_size < v10)
  {
    if (!v9)
    {
      unint64_t v9 = [MEMORY[0x1E4F28E78] string];
    }
    if (!v8) {
      [v9 appendString:@" - "];
    }
    off_t st_size = v43.st_size;
    unint64_t v34 = v10;
    long long v13 = @"inconsistent blob length (%llu vs. %llu)";
    goto LABEL_15;
  }
  int v14 = !v8;
  unint64_t v36 = v10;
  v37 = v7;
  [(QLCacheFragHandler *)v7 allocateSpaceForLength:v10 added:0];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v4;
  uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (!v15)
  {
    unint64_t v17 = 0;
    goto LABEL_52;
  }
  uint64_t v16 = v15;
  v35 = v4;
  unint64_t v17 = 0;
  uint64_t v18 = *(void *)v40;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v40 != v18) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      uint64_t v21 = [v20 length];
      unint64_t v22 = [v20 location];
      unint64_t v23 = v22;
      if (!v21)
      {
        if (!v22) {
          continue;
        }
        if (!v9)
        {
          unint64_t v9 = [MEMORY[0x1E4F28E78] string];
        }
        BOOL v4 = v35;
        uint64_t v7 = v37;
        if (!v8) {
          [v9 appendString:@" - "];
        }
        unint64_t v27 = @"zero length block with non zero location";
LABEL_51:
        [v9 appendFormat:v27];
        int v14 = 1;
        goto LABEL_52;
      }
      if (v22 <= 7)
      {
        if (!v9)
        {
          unint64_t v9 = [MEMORY[0x1E4F28E78] string];
        }
        BOOL v4 = v35;
        uint64_t v7 = v37;
        if (!v8) {
          [v9 appendString:@" - "];
        }
        unint64_t v27 = @"negative blob location";
        goto LABEL_51;
      }
      uint64_t v24 = [v20 length];
      unint64_t v25 = v23 - 8 - v17;
      if (v23 - 8 < v17)
      {
        if (!v9)
        {
          unint64_t v9 = [MEMORY[0x1E4F28E78] string];
        }
        BOOL v4 = v35;
        uint64_t v7 = v37;
        if (!v8) {
          objc_msgSend(v9, "appendString:", @" - ", v25);
        }
        unint64_t v27 = @"overlapping blobs";
        goto LABEL_51;
      }
      uint64_t v26 = v24;
      if (v23 - 8 > v17) {
        [(QLCacheFragHandler *)v37 releaseSpaceAtPos:v17 withLen:v25];
      }
      unint64_t v17 = v23 + v26 + 8;
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v16) {
      continue;
    }
    break;
  }
  BOOL v4 = v35;
  uint64_t v7 = v37;
  int v14 = !v8;
LABEL_52:

  if (!v9 && v36 > v17)
  {
    [(QLCacheFragHandler *)v7 releaseSpaceAtPos:v17 withLen:v36 - v17];
    goto LABEL_55;
  }
LABEL_16:
  if (!v9)
  {
LABEL_55:
    [(QLCacheFragHandler *)v7 compact];
    v28 = [(QLCacheFragHandler *)v7 orderedByStart];
    uint64_t v29 = [(QLCacheFragHandler *)self->_fragHandler orderedByStart];
    if ([v28 isEqual:v29])
    {
      unint64_t v9 = 0;
    }
    else
    {
      v30 = [MEMORY[0x1E4F28E78] string];
      unint64_t v9 = v30;
      if (v14) {
        [v30 appendString:@" - "];
      }
      [v9 appendFormat:@"desynchronized fragmentation"];
      v31 = _log_7();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[QLCacheMMAPBlobDatabase checkConsistency:](v28, v29);
      }
    }
  }

  return v9;
}

uint64_t __44__QLCacheMMAPBlobDatabase_checkConsistency___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 location];
  unint64_t v6 = [v4 location];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (BOOL)isOpen
{
  return self->_file != -1;
}

- (void)close
{
  __error();
  OUTLINED_FUNCTION_9_0(&dword_1DDC5E000, v0, v1, "can not truncate the blob file %d", v2, v3, v4, v5, 0);
}

- (void)reset
{
  id v3 = [(NSString *)self->_path stringByAppendingPathExtension:@"data"];
  unlink((const char *)[v3 fileSystemRepresentation]);

  id v4 = [(NSString *)self->_path stringByAppendingPathExtension:@"fraghandler"];
  unlink((const char *)[v4 fileSystemRepresentation]);

  uint64_t v5 = _log_7();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_INFO, "reset blob database", v6, 2u);
  }
}

- (id)reserveBufferWithLength:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(QLCacheFragHandler *)self->_fragHandler totalLen];
  if (!a3)
  {
LABEL_6:
    id v11 = 0;
    goto LABEL_21;
  }
  unint64_t v6 = v5;
  char v22 = 0;
  unint64_t v7 = a3 + 16;
  unint64_t v8 = [(QLCacheFragHandler *)self->_fragHandler allocateSpaceForLength:a3 + 16 added:&v22];
  if ([(QLCacheFragHandler *)self->_fragHandler totalLen] > self->_maxSize)
  {
    [(QLCacheFragHandler *)self->_fragHandler releaseSpaceAtPos:v8 withLen:a3 + 16];
    unint64_t v9 = _log_7();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unint64_t maxSize = self->_maxSize;
      *(_DWORD *)buf = 134218496;
      unint64_t v24 = v8;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      __int16 v27 = 2048;
      unint64_t v28 = maxSize;
      _os_log_impl(&dword_1DDC5E000, v9, OS_LOG_TYPE_INFO, "we can't write the blob, it's out of the limit location %llu length %llu limit %llu", buf, 0x20u);
    }

    goto LABEL_6;
  }
  if (v22)
  {
    int v12 = _log_7();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v24 = v7 + v8;
      _os_log_debug_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_DEBUG, "new file size %lld", buf, 0xCu);
    }

    if (ftruncate(self->_file, [(QLCacheFragHandler *)self->_fragHandler totalLen]) == -1)
    {
      uint64_t v21 = _log_7();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[QLCacheMMAPBlobDatabase reserveBufferWithLength:]();
      }

      [(QLCacheFragHandler *)self->_fragHandler releaseSpaceAtPos:v8 withLen:v7];
      goto LABEL_6;
    }
  }
  uint64_t v13 = 0;
  int v14 = (char *)self->_vmFile + v8;
  do
  {
    v14[v13] = v7;
    v7 >>= 8;
    ++v13;
  }
  while (v13 != 8);
  uint64_t v15 = 0;
  uint64_t v16 = (char *)self->_vmFile + v8 + a3 + 8;
  unint64_t v17 = v8;
  do
  {
    v16[v15] = v17;
    v17 >>= 8;
    ++v15;
  }
  while (v15 != 8);
  unint64_t v18 = v8 + 8;
  if (v6 > v8 + 8)
  {
    if (v18 + a3 >= v6) {
      size_t v19 = v6 - (v8 + 8);
    }
    else {
      size_t v19 = a3;
    }
    bzero((char *)self->_vmFile + v8 + 8, v19);
  }
  id v11 = objc_alloc_init(QLCacheBlobInfo);
  [(QLCacheBlobInfo *)v11 setLocation:v18];
  [(QLCacheBlobInfo *)v11 setLength:a3];
  [(NSMutableArray *)self->_reservedBuffers addObject:v11];
LABEL_21:
  return v11;
}

- (void)bufferPointedToByBlobInfo:(id)a3
{
  vmFile = (char *)self->_vmFile;
  return &vmFile[[a3 location]];
}

- (void)discardReservedBufferWithBlobInfo:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(NSMutableArray *)self->_reservedBuffers removeObject:v4];
    unint64_t v5 = _log_7();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[QLCacheMMAPBlobDatabase discardReservedBufferWithBlobInfo:]();
    }

    -[QLCacheFragHandler releaseSpaceAtPos:withLen:](self->_fragHandler, "releaseSpaceAtPos:withLen:", [v4 location] - 8, objc_msgSend(v4, "length") + 16);
  }
}

- (void)validateReservedBufferWithBlobInfo:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [(NSMutableArray *)self->_reservedBuffers indexOfObject:v4];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = v5;
      unint64_t v7 = _log_7();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[QLCacheMMAPBlobDatabase validateReservedBufferWithBlobInfo:]();
      }

      [(NSMutableArray *)self->_reservedBuffers removeObjectAtIndex:v6];
    }
  }
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (_QLCacheThread)cacheThread
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheThread);
  return (_QLCacheThread *)WeakRetained;
}

- (void)setCacheThread:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cacheThread);
  objc_storeStrong((id *)&self->_reservedBuffers, 0);
  objc_storeStrong((id *)&self->_fragHandler, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)copyBlobWithInfo:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  [v0 location];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_1DDC5E000, v1, v2, "problem blob location, %llu %llu", v3, v4, v5, v6, v7);
}

- (void)copyBlobWithInfo:.cold.2()
{
  OUTLINED_FUNCTION_7_0();
  [v0 location];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_1DDC5E000, v1, v2, "problem blob length, %llu %llu", v3, v4, v5, v6, v7);
}

- (void)copyBlobWithInfo:.cold.3()
{
  OUTLINED_FUNCTION_7_0();
  [v0 location];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_1DDC5E000, v1, v2, "problem blob, no suffix %llu %llu", v3, v4, v5, v6, v7);
}

- (void)copyBlobWithInfo:.cold.4()
{
  int v2 = 136316162;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_12(&dword_1DDC5E000, v0, v1, "%s marker mismatch 0x%08llx vs. 0x%08llx (%llu vs %llu)", v2, v3, v4, v5, v6);
}

- (void)copyBlobWithInfo:(void *)a1 .cold.5(void *a1)
{
  [a1 length];
  __error();
  OUTLINED_FUNCTION_0_1(&dword_1DDC5E000, v1, v2, "problem with vm_copy, length %lld, errno %d", v3, v4, v5, v6, 0);
}

- (void)copyBlobWithInfo:.cold.6()
{
  OUTLINED_FUNCTION_7_0();
  [v0 location];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_1(&dword_1DDC5E000, v1, v2, "problem blob, no prefix, %llu %llu", v3, v4, v5, v6, v7);
}

- (void)copyBlobWithInfo:.cold.7()
{
  int v2 = 136316162;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_12(&dword_1DDC5E000, v0, v1, "%s marker mismatch 0x%08llx vs. 0x%08llx (%llu vs %llu)", v2, v3, v4, v5, v6);
}

- (void)deleteBlobWithInfo:(void *)a1 .cold.1(void *a1, id *a2)
{
  [a1 location];
  [a1 length];
  [a1 location];
  [a1 length];
  [*a2 totalLen];
  OUTLINED_FUNCTION_8_1();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x2Au);
}

- (void)deleteBlobWithInfo:.cold.2()
{
  OUTLINED_FUNCTION_7_0();
  [v0 location];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_3(&dword_1DDC5E000, v1, v2, "blob deleted at %lld with size %lld", v3, v4, v5, v6, v7);
}

- (void)doesExist
{
  uint64_t v3 = @"NO";
  if (a1) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  if (a2) {
    uint64_t v3 = @"YES";
  }
  *(_DWORD *)uint64_t v5 = 138412546;
  *(void *)&v5[4] = v4;
  *(_WORD *)&v5[12] = 2112;
  *(void *)&v5[14] = v3;
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, a2, a3, "data file exists %@, frag handler file exists %@", *(void *)v5, *(void *)&v5[8], *(void *)&v5[16], *MEMORY[0x1E4F143B8]);
}

- (void)isValid
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "the blob database is not opened", v2, v3, v4, v5, v6);
}

- (void)checkConsistency:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 description];
  unint64_t v10 = [a2 description];
  OUTLINED_FUNCTION_3_3(&dword_1DDC5E000, v4, v5, "Constructed holes list:\n\t%@\nStored holes list:\n\t%@", v6, v7, v8, v9, 2u);
}

- (void)reserveBufferWithLength:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DDC5E000, v0, v1, "problem to increase the size of the file", v2, v3, v4, v5, v6);
}

- (void)discardReservedBufferWithBlobInfo:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  [v0 location];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_3(&dword_1DDC5E000, v1, v2, "discard buffer location %lld length %lld", v3, v4, v5, v6, v7);
}

- (void)validateReservedBufferWithBlobInfo:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  [v0 location];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_3(&dword_1DDC5E000, v1, v2, "validate buffer location %lld length %lld", v3, v4, v5, v6, v7);
}

@end