@interface PLPositionalTable
- (BOOL)_increaseEntryCapacityIfNeededToStoreIndex:(int64_t)a3;
- (BOOL)_setEntryCapacity:(int64_t)a3;
- (BOOL)deleteEntryAtIndex:(unint64_t)a3;
- (BOOL)flushAfterWrite;
- (BOOL)isEmptyAtIndex:(unint64_t)a3;
- (BOOL)isReadOnly;
- (BOOL)readDataAtIndex:(unint64_t)a3 intoPoolNode:(tagPLPositionalTableMemoryPoolNode *)a4 bytesRead:(unint64_t *)a5;
- (BOOL)writeEntryData:(id)a3 toIndex:(unint64_t)a4;
- (Class)entriesClass;
- (NSString)path;
- (PLPositionalTable)initWithPath:(id)a3 readOnly:(BOOL)a4 entryLength:(unint64_t)a5;
- (id)fileStatistics;
- (id)readEntriesAtIndexes:(id)a3;
- (int)descriptor;
- (int64_t)entryCapacity;
- (int64_t)fileLength;
- (tagPLPositionalTableMemoryPool)pool;
- (unint64_t)entryLength;
- (void)dealloc;
- (void)flush;
- (void)setDescriptor:(int)a3;
- (void)setEntryCapacity:(int64_t)a3;
- (void)setEntryLength:(unint64_t)a3;
- (void)setFlushAfterWrite:(BOOL)a3;
- (void)setIsReadOnly:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)touchEntriesInRange:(_NSRange)a3;
@end

@implementation PLPositionalTable

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (tagPLPositionalTableMemoryPool)pool
{
  return self->_pool;
}

- (unint64_t)entryLength
{
  return self->_entryLength;
}

- (BOOL)readDataAtIndex:(unint64_t)a3 intoPoolNode:(tagPLPositionalTableMemoryPoolNode *)a4 bytesRead:(unint64_t *)a5
{
  size_t entryLength = self->_entryLength;
  ssize_t v7 = pread(self->_descriptor, a4->var0, entryLength, entryLength * a3);
  if (a5 && v7 == entryLength) {
    *a5 = entryLength;
  }
  return v7 == entryLength;
}

- (PLPositionalTable)initWithPath:(id)a3 readOnly:(BOOL)a4 entryLength:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PLPositionalTable;
  v10 = [(PLPositionalTable *)&v43 init];
  if (v10)
  {
    if (v9)
    {
      if (a5) {
        goto LABEL_4;
      }
    }
    else
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2, v10, @"PLPositionalTable.m", 224, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

      if (a5) {
        goto LABEL_4;
      }
    }
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, v10, @"PLPositionalTable.m", 225, @"Invalid parameter not satisfying: %@", @"entryLength > 0" object file lineNumber description];

LABEL_4:
    v10->_flushAfterWrite = 1;
    v10->_readOnly = v6;
    id v11 = v9;
    v12 = (const char *)[v11 fileSystemRepresentation];
    if (v6) {
      int v13 = open(v12, 0, 438);
    }
    else {
      int v13 = open(v12, 514, 438);
    }
    if (v13 != -1)
    {
      int v14 = v13;
      uint64_t v15 = [v11 copy];
      path = v10->_path;
      v10->_path = (NSString *)v15;

      v10->_int descriptor = v14;
      v10->_expansionLock._os_unfair_lock_opaque = 0;
      if (fcntl(v14, 45, 1) == -1)
      {
        v17 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int descriptor = v10->_descriptor;
          __darwin_ino64_t v19 = (__darwin_ino64_t)v10->_path;
          v20 = __error();
          v21 = strerror(*v20);
          buf.st_dev = 67109634;
          *(_DWORD *)&buf.st_mode = descriptor;
          LOWORD(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 2) = v19;
          HIWORD(buf.st_uid) = 2080;
          *(void *)&buf.st_gid = v21;
          _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_DEBUG, "Failed to issue set read ahead for file: %d at path: %@ with error=%s", (uint8_t *)&buf, 0x1Cu);
        }
      }
      v10->_unint64_t entryLength = a5;
      int v22 = v10->_descriptor;
      memset(&buf, 0, sizeof(buf));
      int v23 = fstat(v22, &buf);
      off_t st_size = buf.st_size;
      if (v23 == -1) {
        off_t st_size = 0;
      }
      v10->_entryCapacity = (int)(st_size / (int64_t)v10->_entryLength);
      pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
      unint64_t entryLength = v10->_entryLength;
      LODWORD(v26) = 2;
      if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0) {
        unint64_t v26 = 0x300000 / entryLength;
      }
      v27 = PLPositionalTableMemoryPool_Create((void *)entryLength, v26);
      if (!v27)
      {
        v28 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v29 = v10->_entryLength * v26;
          buf.st_dev = 134217984;
          *(void *)&buf.st_mode = v29;
          _os_log_impl(&dword_19BCFB000, v28, OS_LOG_TYPE_DEFAULT, "Unable to allocate requested PLPositionalTablePool at size: %ld, using standard alloc.", (uint8_t *)&buf, 0xCu);
        }
      }
      v10->_pool = (tagPLPositionalTableMemoryPool *)v27;
      goto LABEL_22;
    }
    int v31 = *__error();
    if (v6)
    {
      v32 = PLThumbnailsGetLog();
      v33 = v32;
      if (v31 == 2)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          buf.st_dev = 138412290;
          *(void *)&buf.st_mode = v11;
          v34 = "No PLPositionalImageTable file found at path %@";
          v35 = v33;
          os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
          uint32_t v37 = 12;
LABEL_32:
          _os_log_impl(&dword_19BCFB000, v35, v36, v34, (uint8_t *)&buf, v37);
        }
LABEL_33:

        v30 = 0;
        goto LABEL_34;
      }
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      v39 = strerror(v31);
      buf.st_dev = 138412802;
      *(void *)&buf.st_mode = v11;
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v39;
      HIWORD(buf.st_gid) = 1024;
      buf.st_rdev = v31;
      v34 = "Could not open PLPositionalImageTable at path %@: %s (%d)";
    }
    else
    {
      v33 = PLThumbnailsGetLog();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      v38 = strerror(v31);
      buf.st_dev = 138412802;
      *(void *)&buf.st_mode = v11;
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v38;
      HIWORD(buf.st_gid) = 1024;
      buf.st_rdev = v31;
      v34 = "Could not create PLPositionalImageTable at path %@: %s (%d)";
    }
    v35 = v33;
    os_log_type_t v36 = OS_LOG_TYPE_ERROR;
    uint32_t v37 = 28;
    goto LABEL_32;
  }
LABEL_22:
  v30 = v10;
LABEL_34:

  return v30;
}

- (void).cxx_destruct
{
}

- (void)setDescriptor:(int)a3
{
  self->_int descriptor = a3;
}

- (int)descriptor
{
  return self->_descriptor;
}

- (void)setIsReadOnly:(BOOL)a3
{
  self->_isReadOnly = a3;
}

- (void)setEntryLength:(unint64_t)a3
{
  self->_unint64_t entryLength = a3;
}

- (void)setFlushAfterWrite:(BOOL)a3
{
  self->_flushAfterWrite = a3;
}

- (BOOL)flushAfterWrite
{
  return self->_flushAfterWrite;
}

- (void)setEntryCapacity:(int64_t)a3
{
  self->_entryCapacity = a3;
}

- (int64_t)entryCapacity
{
  return self->_entryCapacity;
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)flush
{
  int descriptor = self->_descriptor;
  if (descriptor)
  {
    if (!self->_readOnly) {
      fsync(descriptor);
    }
  }
}

- (BOOL)deleteEntryAtIndex:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_readOnly) {
    goto LABEL_18;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v5 = "Unable to write thumbnail data to index NSNotFound.";
      BOOL v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 2;
LABEL_16:
      _os_log_impl(&dword_19BCFB000, v6, v7, v5, (uint8_t *)&v19, v8);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (self->_entryCapacity <= a3)
  {
    v4 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t entryCapacity = self->_entryCapacity;
      int v19 = 134218240;
      unint64_t v20 = a3;
      __int16 v21 = 2048;
      int64_t v22 = entryCapacity;
      v5 = "Unable to delete thumbnail index: %lu that is out of range of the file (capacity: %lu)";
      BOOL v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 22;
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  v10 = malloc_type_calloc(1uLL, self->_entryLength, 0x3BDE1024uLL);
  if (v10)
  {
    id v11 = v10;
    int descriptor = self->_descriptor;
    size_t entryLength = self->_entryLength;
    BOOL flushAfterWrite = self->_flushAfterWrite;
    ssize_t v15 = pwrite(descriptor, v10, entryLength, entryLength * a3);
    ssize_t v16 = v15;
    if (flushAfterWrite && v15 == entryLength) {
      fsync(descriptor);
    }
    free(v11);
    if (v16 != entryLength)
    {
      v4 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 134217984;
        unint64_t v20 = a3;
        v5 = "Unable to write empty data to index: %lu";
        BOOL v6 = v4;
        os_log_type_t v7 = OS_LOG_TYPE_DEBUG;
        uint32_t v8 = 12;
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    LOBYTE(v10) = 1;
  }
  return (char)v10;
}

- (BOOL)writeEntryData:(id)a3 toIndex:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    ssize_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLPositionalTable.m", 412, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  if ([v7 length] != self->_entryLength)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PLPositionalTable.m" lineNumber:413 description:@"Data length must equal entry length."];
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint32_t v8 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "Unable to write thumbnail data to index NSNotFound.", buf, 2u);
    }

    goto LABEL_13;
  }
  if (![(PLPositionalTable *)self _increaseEntryCapacityIfNeededToStoreIndex:a4])
  {
LABEL_13:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  int descriptor = self->_descriptor;
  size_t entryLength = self->_entryLength;
  id v11 = (const void *)[v7 bytes];
  BOOL flushAfterWrite = self->_flushAfterWrite;
  ssize_t v13 = pwrite(descriptor, v11, entryLength, entryLength * a4);
  BOOL v14 = v13 == entryLength;
  if (flushAfterWrite && v13 == entryLength)
  {
    fsync(descriptor);
    BOOL v14 = 1;
  }
LABEL_14:

  return v14;
}

- (void)touchEntriesInRange:(_NSRange)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int descriptor = self->_descriptor;
  if (descriptor)
  {
    unint64_t entryLength = self->_entryLength;
    v11[0] = entryLength * a3.location;
    v11[1] = (entryLength * LODWORD(a3.length));
    if (fcntl(descriptor, 44, v11) == -1)
    {
      BOOL v6 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v7 = self->_descriptor;
        path = self->_path;
        id v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)stat buf = 67109634;
        int v13 = v7;
        __int16 v14 = 2112;
        ssize_t v15 = path;
        __int16 v16 = 2080;
        v17 = v10;
        _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_DEBUG, "Failed to issue advisory read for file: %d at path: %@ with error=%s", buf, 0x1Cu);
      }
    }
  }
}

- (id)readEntriesAtIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rangeCount];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (v5) {
    uint64_t v5 = (uint64_t)malloc_type_calloc(1uLL, 8 * v5, 0x80040B8603338uLL);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__PLPositionalTable_readEntriesAtIndexes___block_invoke;
  v10[3] = &unk_1E58A18A8;
  id v11 = v6;
  uint64_t v12 = v5;
  v10[4] = self;
  id v7 = v6;
  [v4 enumerateRangesWithOptions:0 usingBlock:v10];
  uint32_t v8 = objc_msgSend(objc_alloc(-[PLPositionalTable entriesClass](self, "entriesClass")), "initWithBuffers:forIndexes:entryLength:", v5, v7, self->_entryLength);

  return v8;
}

void __42__PLPositionalTable_readEntriesAtIndexes___block_invoke(uint64_t a1, NSUInteger a2, size_t count)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = malloc_type_calloc(count, *(void *)(*(void *)(a1 + 32) + 48), 0xB1768F49uLL);
  if (pread(*(_DWORD *)(*(void *)(a1 + 32) + 24), v6, *(void *)(*(void *)(a1 + 32) + 48) * count, *(void *)(*(void *)(a1 + 32) + 48) * a2) == v7 * count)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    *(void *)(v8 + 8 * [*(id *)(a1 + 40) rangeCount]) = v6;
    id v9 = *(void **)(a1 + 40);
    objc_msgSend(v9, "addIndexesInRange:", a2, count);
  }
  else
  {
    v10 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v27.location = a2;
      v27.length = count;
      id v11 = NSStringFromRange(v27);
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = *(_DWORD *)(v12 + 24);
      uint64_t v14 = *(void *)(v12 + 32);
      ssize_t v15 = __error();
      __int16 v16 = strerror(*v15);
      int v17 = 138544130;
      uint64_t v18 = v11;
      __int16 v19 = 1024;
      int v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2080;
      v24 = v16;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEFAULT, "Unable to read indexes in range: %{public}@ for file: %d at path: %@ with error=%s", (uint8_t *)&v17, 0x26u);
    }
    free(v6);
  }
}

- (Class)entriesClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEmptyAtIndex:(unint64_t)a3
{
  [(PLPositionalTable *)self entryLength];
  [(PLPositionalTable *)self entryLength];
  if (self->_entryCapacity <= a3) {
    return 0;
  }
  uint64_t v5 = (const void **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)[(PLPositionalTable *)self pool], (void *)[(PLPositionalTable *)self entryLength]);
  uint64_t v8 = 0;
  BOOL v6 = [(PLPositionalTable *)self readDataAtIndex:a3 intoPoolNode:v5 bytesRead:&v8]&& !*(unsigned char *)*v5&& memcmp(*v5, (char *)*v5 + 1, v8 - 1) == 0;
  PLPositionalTableMemoryPool_Free((void **)v5);
  return v6;
}

- (id)fileStatistics
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(PLPositionalTable *)self entryCapacity];
  if (v4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
      v7 += [(PLPositionalTable *)self isEmptyAtIndex:v6++];
    while (v4 != v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  *(float *)&double v5 = (float)((float)v4 - (float)v7) / (float)v4;
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithFloat:v5];
  [v3 setObject:v8 forKeyedSubscript:@"spaceUtilization"];

  id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4];
  [v3 setObject:v9 forKeyedSubscript:@"capacity"];

  v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:v7];
  [v3 setObject:v10 forKeyedSubscript:@"countEmpty"];

  id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4 - v7];
  [v3 setObject:v11 forKeyedSubscript:@"countFilled"];

  return v3;
}

- (int64_t)fileLength
{
  int descriptor = self->_descriptor;
  memset(&v4, 0, sizeof(v4));
  if (fstat(descriptor, &v4) == -1) {
    return 0;
  }
  else {
    return v4.st_size;
  }
}

- (void)dealloc
{
  pool = (OSQueueHead *)self->_pool;
  if (pool) {
    PLPositionalTableMemoryPool_Destroy(pool);
  }
  int descriptor = self->_descriptor;
  if (descriptor) {
    close(descriptor);
  }
  v5.receiver = self;
  v5.super_class = (Class)PLPositionalTable;
  [(PLPositionalTable *)&v5 dealloc];
}

- (BOOL)_setEntryCapacity:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_expansionLock = &self->_expansionLock;
  os_unfair_lock_lock(&self->_expansionLock);
  int64_t entryCapacity = self->_entryCapacity;
  if (entryCapacity != a3)
  {
    if (entryCapacity < a3)
    {
      off_t v8 = self->_entryLength * a3;
      v21[0] = 12;
      v21[1] = 0;
      v21[2] = v8;
      v21[3] = 0;
      if (fcntl(self->_descriptor, 42, v21) == -1)
      {
        id v9 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int descriptor = self->_descriptor;
          path = self->_path;
          uint64_t v12 = __error();
          int v13 = strerror(*v12);
          *(_DWORD *)stat buf = 67109890;
          int v23 = descriptor;
          __int16 v24 = 2112;
          uint64_t v25 = path;
          __int16 v26 = 2048;
          off_t v27 = v8;
          __int16 v28 = 2080;
          unint64_t v29 = v13;
          _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEBUG, "*** ImageTable expand: F_PREALLOCATE of %d %@ to %lld returned -1: error=%s", buf, 0x26u);
        }
      }
      if (ftruncate(self->_descriptor, v8) == -1)
      {
        __int16 v16 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          int v17 = self->_descriptor;
          uint64_t v18 = self->_path;
          __int16 v19 = __error();
          int v20 = strerror(*v19);
          *(_DWORD *)stat buf = 67109890;
          int v23 = v17;
          __int16 v24 = 2112;
          uint64_t v25 = v18;
          __int16 v26 = 2048;
          off_t v27 = v8;
          __int16 v28 = 2080;
          unint64_t v29 = v20;
          _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_DEBUG, "*** ImageTable: ftruncate of %d %@ to %lld returned -1: error=%s", buf, 0x26u);
        }

        int v14 = 0;
        goto LABEL_11;
      }
      self->_int64_t entryCapacity = a3;
    }
    int v14 = 1;
LABEL_11:
    BOOL v7 = v14 != 0;
    goto LABEL_12;
  }
  BOOL v7 = 1;
LABEL_12:
  os_unfair_lock_unlock(p_expansionLock);
  return v7;
}

- (BOOL)_increaseEntryCapacityIfNeededToStoreIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 1;
  }
  unint64_t entryCapacity = self->_entryCapacity;
  uint64_t v4 = a3 - entryCapacity;
  if (a3 < entryCapacity) {
    return 1;
  }
  if (v4 <= 63) {
    uint64_t v4 = 63;
  }
  return [(PLPositionalTable *)self _setEntryCapacity:entryCapacity + v4 + 1];
}

@end