@interface PLFetchRecording
+ (BOOL)_statsForStatementAreInteresting:(PLFetchRecordingFileNormalizedStatementHeader *)a3 totalPages:(unsigned int)a4;
+ (BOOL)deleteRecording:(id)a3 error:(id *)a4;
+ (PLFetchRecordingFileNormalizedStatementHeader)_currentVersionHeaderFrom_053Header:(PLFetchRecordingFileNormalizedStatementHeader_053 *)a3;
+ (_NSRange)_indexLocked_allocateSizeToFit:(unint64_t)a3 fileHeaderSize:(unint64_t)a4 currentEOF:(int64_t)a5 buffer:(void *)a6 bufferLength:(unint64_t)a7 index:(id)a8;
+ (const)bindVariablesForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3;
+ (const)contextNameForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3;
+ (const)normalizedSQLForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3;
+ (double)meanPageCountForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3;
+ (double)stdDevPageCountForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3;
+ (double)varPageCountForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3;
+ (id)_backtrace;
+ (id)backtraceForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3;
+ (id)multiInCountsForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3;
+ (id)suggestedFilenameForCurrentProcess;
+ (void)_enumerateVariationsFromEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3 block:(id)a4;
+ (void)_indexLocked_enumerateEntryHeadersFromBuffer:(const void *)a3 bufferLength:(unint64_t)a4 fileVersion:(id)a5 fileHeaderSize:(unint64_t)a6 block:(id)a7;
+ (void)_indexLocked_populateStatementIndex:(id)a3 fromBuffer:(void *)a4 bufferLength:(unint64_t)a5 fileHeaderSize:(unint64_t)a6 fileVersion:(id)a7;
+ (void)_updateRunningStatisticsForEntry:(PLFetchRecordingFileNormalizedStatementHeader *)a3 givenPageCount:(unsigned int)a4;
+ (void)_writeInitialHeaderToBuffer:(void *)a3 bufferLen:(unint64_t)a4;
- (BOOL)_indexLocked_remapFile;
- (BOOL)_isOpen;
- (BOOL)recordStatementWithNormalizedSQL:(id)a3 bindVariablesAsString:(id)a4 multiInCounts:(id)a5 contextName:(id)a6 pagesHit:(unsigned int)a7 pagesMissed:(unsigned int)a8 rowCount:(unsigned int)a9 duration:(double)a10 QOS:(unsigned int)a11;
- (BOOL)remap;
- (NSURL)url;
- (PLFetchRecording)initWithMode:(unint64_t)a3 atFileURL:(id)a4 size:(unint64_t)a5;
- (PLFetchRecordingFileHeader)fileHeader;
- (PLFetchRecordingFileNormalizedStatementHeader)entryForNormalizedSQL:(id)a3;
- (int)fd;
- (unint64_t)mode;
- (void)_considerIfRemapIsNeeded;
- (void)_indexLocked_close;
- (void)_indexLocked_unmapFile;
- (void)_recordVariationWithEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3 timestamp:(double)a4 pagesHit:(unsigned int)a5 pagesMissed:(unsigned int)a6 rowsAffected:(unsigned int)a7 duration:(double)a8 QOS:(unsigned int)a9;
- (void)_scheduleRemapAfterDelay;
- (void)close;
- (void)dealloc;
- (void)enumerateEntryHeaders:(id)a3;
- (void)enumerateVariationsFromEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3 block:(id)a4;
@end

@implementation PLFetchRecording

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_indexLocked_indexEntriesByNormSQLHash, 0);
  objc_storeStrong((id *)&self->_remapQueue, 0);
  objc_storeStrong((id *)&self->_fileVersion, 0);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)recordStatementWithNormalizedSQL:(id)a3 bindVariablesAsString:(id)a4 multiInCounts:(id)a5 contextName:(id)a6 pagesHit:(unsigned int)a7 pagesMissed:(unsigned int)a8 rowCount:(unsigned int)a9 duration:(double)a10 QOS:(unsigned int)a11
{
  id v18 = a3;
  id v76 = a4;
  id v19 = a5;
  id v20 = a6;
  v21 = (void *)MEMORY[0x19F38D3B0]();
  v22 = self;
  uint64_t v23 = [(PLFetchRecording *)v22 fileHeader];
  if ([(PLFetchRecording *)v22 _isOpen])
  {
    if ([v18 length])
    {
      unsigned int v75 = a7;
      v24 = _hashForSQL(v18);
      if (![v24 length])
      {
        v33 = PLBackendGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v81 = 0;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEBUG, "LOFR can't hash sql", v81, 2u);
        }

        BOOL v30 = 0;
        ++*(_DWORD *)(v23 + 230);
        goto LABEL_42;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      p_indexLock = &v22->_indexLock;
      os_unfair_lock_lock(&v22->_indexLock);
      v27 = [(NSMutableDictionary *)v22->_indexLocked_indexEntriesByNormSQLHash objectForKeyedSubscript:v24];
      v28 = v27;
      unsigned int v71 = a8;
      id v72 = v19;
      if (v27)
      {
        [v27 lock];
        uint64_t v29 = objc_msgSend(v28, "entryLocked_statementEntryFomBuffer:", v22->_indexLocked_buffer);
        os_unfair_lock_unlock(&v22->_indexLock);
        id v73 = 0;
        id v74 = 0;
        BOOL v30 = 1;
        uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_23;
      }
      id v68 = v24;
      v70 = v21;
      v34 = [v19 componentsJoinedByString:@","];
      v35 = [(id)objc_opt_class() _backtrace];
      v36 = [v35 dataUsingEncoding:4];
      v37 = [v36 compressedDataUsingAlgorithm:0 error:0];

      LODWORD(v35) = [v18 length];
      LODWORD(v36) = [v76 length];
      unsigned int v38 = [v34 length];
      unsigned int v39 = [v20 length];
      id v74 = v37;
      unint64_t v40 = v35
          + (unint64_t)v36
          + v38
          + v39
          + [v37 length]
          + 269;
      id v73 = v34;
      if (v40 <= 0xA000)
      {
        uint64_t v42 = objc_msgSend((id)objc_opt_class(), "_indexLocked_allocateSizeToFit:fileHeaderSize:currentEOF:buffer:bufferLength:index:", v40, v22->_fileHeaderSize, *(unsigned int *)(v23 + 222), v22->_indexLocked_buffer, v22->_indexLocked_bufferLen, v22->_indexLocked_indexEntriesByNormSQLHash);
        if (v42 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned int v45 = v43;
          uint64_t v29 = (uint64_t)v22->_indexLocked_buffer + v42;
          *(unsigned char *)uint64_t v29 = (v43 >> 11) - 80;
          __dst = (void *)(v29 + 1);
          uint64_t v66 = v42;
          v24 = v68;
          id v46 = v68;
          memcpy((void *)(v29 + 1), (const void *)[v46 bytes], objc_msgSend(v46, "length"));
          *(double *)(v29 + 33) = Current;
          *(_WORD *)(v29 + 93) = [v18 length];
          *(_WORD *)(v29 + 95) = [v76 length];
          *(_WORD *)(v29 + 99) = [v20 length];
          *(_WORD *)(v29 + 97) = [v34 length];
          *(_WORD *)(v29 + 101) = [v74 length];
          *(_DWORD *)(v29 + 57) = 0;
          *(_DWORD *)(v23 + 222) = v66 + v45;
          BOOL v30 = 1;
          atomic_fetch_add(&v22->_numberOfAllocationsSinceLastRemap, 1u);
          [(PLFetchRecording *)v22 _considerIfRemapIsNeeded];
          v21 = v70;
          p_indexLock = &v22->_indexLock;
          v28 = 0;
          uint64_t v31 = v66;
LABEL_23:
          if (objc_msgSend(v28, "unavailable", __dst))
          {
            v47 = v28;
            v48 = PLBackendGetLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              __int16 v78 = 0;
              v49 = "LOFR Can't use this index as it was just made unavailable";
              v50 = (uint8_t *)&v78;
              v51 = v48;
              os_log_type_t v52 = OS_LOG_TYPE_DEBUG;
LABEL_38:
              _os_log_impl(&dword_19B3C7000, v51, v52, v49, v50, 2u);
            }
          }
          else
          {
            if (v29)
            {
              unsigned int v53 = v71;
              unsigned int v54 = v75;
              unsigned int v67 = v71 + v75;
              if (!v28)
              {
                id v69 = v24;
                strncpy((char *)(v29 + 105), (const char *)[v18 UTF8String], *(unsigned __int16 *)(v29 + 93) + 1);
                v55 = (char *)(v29 + *(unsigned __int16 *)(v29 + 93) + 106);
                strncpy(v55, (const char *)[v76 UTF8String], *(unsigned __int16 *)(v29 + 95) + 1);
                v56 = &v55[*(unsigned __int16 *)(v29 + 95) + 1];
                if (v73) {
                  strncpy(v56, (const char *)[v73 UTF8String], *(unsigned __int16 *)(v29 + 97) + 1);
                }
                v57 = &v56[*(unsigned __int16 *)(v29 + 97) + 1];
                strncpy(v57, (const char *)[v20 UTF8String], *(unsigned __int16 *)(v29 + 99) + 1);
                v58 = &v57[*(unsigned __int16 *)(v29 + 99) + 1];
                id v59 = v74;
                memcpy(v58, (const void *)[v59 bytes], objc_msgSend(v59, "length"));
                v24 = v69;
                v28 = 0;
                unsigned int v53 = v71;
                unsigned int v54 = v75;
              }
              *(_DWORD *)(v29 + 49) += v54;
              *(_DWORD *)(v29 + 53) += v53;
              *(double *)(v29 + 41) = Current;
              if (*(unsigned __int8 *)(v29 + 103) < 5u
                || [(id)objc_opt_class() _statsForStatementAreInteresting:v29 totalPages:v67])
              {
                [(PLFetchRecording *)v22 _recordVariationWithEntryHeader:v29 timestamp:v75 pagesHit:v71 pagesMissed:a9 rowsAffected:a11 duration:Current QOS:a10];
              }
              [(id)objc_opt_class() _updateRunningStatisticsForEntry:v29 givenPageCount:v67];
              if (v28)
              {
                [v28 unlock];
LABEL_41:
                id v19 = v72;

LABEL_42:
                goto LABEL_43;
              }
              v61 = [[PLFetchRecordingIndexEntry alloc] initWithOffset:v31];
              v62 = p_indexLock;
              v47 = 0;
              v63 = v24;
              v64 = v61;
              [(NSMutableDictionary *)v22->_indexLocked_indexEntriesByNormSQLHash setObject:v61 forKeyedSubscript:v63];
              os_unfair_lock_unlock(v62);

              v24 = v63;
LABEL_40:
              v28 = v47;
              goto LABEL_41;
            }
            v47 = v28;
            v48 = PLBackendGetLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v77 = 0;
              v49 = "LOFR Unable to create new entry.";
              v50 = v77;
              v51 = v48;
              os_log_type_t v52 = OS_LOG_TYPE_ERROR;
              goto LABEL_38;
            }
          }

          BOOL v30 = 0;
          goto LABEL_40;
        }
        v44 = PLBackendGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v79 = 0;
          _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEBUG, "LOFR failed to allocate space.", v79, 2u);
        }
      }
      else
      {
        v41 = PLBackendGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v80 = 0;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEBUG, "LOFR entry is too large to fit.", v80, 2u);
        }

        ++*(_DWORD *)(v23 + 230);
      }
      p_indexLock = &v22->_indexLock;
      os_unfair_lock_unlock(&v22->_indexLock);
      uint64_t v29 = 0;
      BOOL v30 = 0;
      uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
      v24 = v68;
      v21 = v70;
      v28 = 0;
      goto LABEL_23;
    }
    v32 = PLBackendGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "LOFR no normalized sql", buf, 2u);
    }

    BOOL v30 = 0;
    ++*(_DWORD *)(v23 + 230);
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_43:

  return v30;
}

- (void)enumerateVariationsFromEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3 block:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLFetchRecording.m", 947, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if ([(PLFetchRecording *)self _isOpen]) {
    [(id)objc_opt_class() _enumerateVariationsFromEntryHeader:a3 block:v8];
  }
}

- (void)enumerateEntryHeaders:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PLFetchRecording.m", 931, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if ([(PLFetchRecording *)self _isOpen])
  {
    os_unfair_lock_lock(&self->_indexLock);
    objc_msgSend((id)objc_opt_class(), "_indexLocked_enumerateEntryHeadersFromBuffer:bufferLength:fileVersion:fileHeaderSize:block:", self->_indexLocked_buffer, self->_indexLocked_bufferLen, self->_fileVersion, self->_fileHeaderSize, v6);
    os_unfair_lock_unlock(&self->_indexLock);
  }
}

- (PLFetchRecordingFileNormalizedStatementHeader)entryForNormalizedSQL:(id)a3
{
  v4 = _hashForSQL(a3);
  v5 = [(NSMutableDictionary *)self->_indexLocked_indexEntriesByNormSQLHash objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 lock];
    v7 = (PLFetchRecordingFileNormalizedStatementHeader *)objc_msgSend(v6, "entryLocked_statementEntryFomBuffer:", self->_indexLocked_buffer);
    [v6 unlock];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)remap
{
  v2 = self;
  p_indexLock = &self->_indexLock;
  os_unfair_lock_lock(&self->_indexLock);
  LOBYTE(v2) = [(PLFetchRecording *)v2 _indexLocked_remapFile];
  os_unfair_lock_unlock(p_indexLock);
  return (char)v2;
}

- (int)fd
{
  return self->_fd;
}

- (void)close
{
  p_indexLock = &self->_indexLock;
  os_unfair_lock_lock(&self->_indexLock);
  [(PLFetchRecording *)self _indexLocked_close];
  os_unfair_lock_unlock(p_indexLock);
}

- (PLFetchRecordingFileHeader)fileHeader
{
  return (PLFetchRecordingFileHeader *)self->_indexLocked_buffer;
}

- (void)dealloc
{
  p_indexLock = &self->_indexLock;
  os_unfair_lock_lock(&self->_indexLock);
  [(PLFetchRecording *)self _indexLocked_close];
  os_unfair_lock_unlock(p_indexLock);
  v4.receiver = self;
  v4.super_class = (Class)PLFetchRecording;
  [(PLFetchRecording *)&v4 dealloc];
}

- (PLFetchRecording)initWithMode:(unint64_t)a3 atFileURL:(id)a4 size:(unint64_t)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (v9)
  {
    if (!a3) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"PLFetchRecording.m", 688, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    if (!a3) {
      goto LABEL_5;
    }
  }
  if (a5 <= 0xEA)
  {
    unsigned int v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PLFetchRecording.m", 689, @"Invalid parameter not satisfying: %@", @"mode == PLFetchRecordingFileModeReadOnly || fileSize > sizeof(PLFetchRecordingFileHeader)" object file lineNumber description];
  }
LABEL_5:
  v44.receiver = self;
  v44.super_class = (Class)PLFetchRecording;
  v10 = [(PLFetchRecording *)&v44 init];
  v11 = v10;
  if (v10)
  {
    v10->_fd = -1;
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.photos.fetchrecorder.remapqueue", 0);
    remapQueue = v11->_remapQueue;
    v11->_remapQueue = (OS_dispatch_queue *)v12;

    id v14 = [v9 path];
    v15 = (const char *)[v14 fileSystemRepresentation];

    if (a3) {
      int v16 = open(v15, 514, 436);
    }
    else {
      int v16 = open(v15, 0, 436);
    }
    if (v16 == -1)
    {
      int v29 = *__error();
      BOOL v30 = PLBackendGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = strerror(v29);
        v45.st_dev = 136315650;
        *(void *)&v45.st_mode = v15;
        WORD2(v45.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v45.st_ino + 6) = (__darwin_ino64_t)v31;
        HIWORD(v45.st_gid) = 1024;
        v45.st_rdev = v29;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "LOFR Could not open recording file at path %s: %s (%d)", (uint8_t *)&v45, 0x1Cu);
      }

      goto LABEL_49;
    }
    int v17 = v16;
    if (a3 != 1 || (memset(&v45, 0, sizeof(v45)), fstat(v16, &v45) != -1) && v45.st_size)
    {
      int v18 = 0;
      goto LABEL_14;
    }
    if (a5 && v17 >= 1)
    {
      *(void *)&v45.st_dev = 0x300000006;
      v45.st_ino = 0;
      *(void *)&v45.st_uid = a5;
      *(void *)&v45.st_rdev = 0;
      if (fcntl(v17, 42, &v45) == -1)
      {
        v32 = PLBackendGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = __error();
          v34 = strerror(*v33);
          *(_DWORD *)buf = 67109378;
          int v47 = v17;
          __int16 v48 = 2080;
          v49 = v34;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "LOFR expand: F_PREALLOCATE of %d returned -1: error=%s", buf, 0x12u);
        }
      }
      if (ftruncate(v17, a5) != -1)
      {
        int v18 = 1;
LABEL_14:
        v11->_maxFileSize = a5;
        v11->_indexLock._os_unfair_lock_opaque = 0;
        uint64_t v19 = [v9 copy];
        url = v11->_url;
        v11->_url = (NSURL *)v19;

        v11->_mode = a3;
        v11->_fd = v17;
        atomic_store(0, (unsigned int *)&v11->_numberOfAllocationsSinceLastRemap);
        os_unfair_lock_lock(&v11->_indexLock);
        BOOL v21 = [(PLFetchRecording *)v11 _indexLocked_remapFile];
        BOOL v22 = v21;
        if ((v18 & 1) != 0 || !v21)
        {
LABEL_20:
          os_unfair_lock_unlock(&v11->_indexLock);
          if (v22)
          {
            if (v18)
            {
              [(id)objc_opt_class() _writeInitialHeaderToBuffer:v11->_indexLocked_buffer bufferLen:v11->_indexLocked_bufferLen];
              v11->_fileHeaderSize = 234;
            }
            if (a3 == 1)
            {
              os_unfair_lock_lock(&v11->_indexLock);
              uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
              objc_msgSend((id)objc_opt_class(), "_indexLocked_populateStatementIndex:fromBuffer:bufferLength:fileHeaderSize:fileVersion:", v26, v11->_indexLocked_buffer, v11->_indexLocked_bufferLen, v11->_fileHeaderSize, v11->_fileVersion);
              indexLocked_indexEntriesByNormSQLHash = v11->_indexLocked_indexEntriesByNormSQLHash;
              v11->_indexLocked_indexEntriesByNormSQLHash = (NSMutableDictionary *)v26;

              os_unfair_lock_unlock(&v11->_indexLock);
            }
            goto LABEL_25;
          }
          goto LABEL_48;
        }
        uint64_t v23 = [NSString stringWithCString:(char *)v11->_indexLocked_buffer + 2 encoding:4];
        fileVersion = v11->_fileVersion;
        v11->_fileVersion = (NSString *)v23;

        if ([(NSString *)v11->_fileVersion isEqualToString:@"0.54"]
          || [(NSString *)v11->_fileVersion isEqualToString:@"0.53"])
        {
          uint64_t v25 = 234;
LABEL_19:
          v11->_fileHeaderSize = v25;
          goto LABEL_20;
        }
        if ([(NSString *)v11->_fileVersion isEqualToString:@"0.52"])
        {
          uint64_t v25 = 228;
          goto LABEL_19;
        }
        v35 = PLBackendGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = v11->_fileVersion;
          v45.st_dev = 138412546;
          *(void *)&v45.st_mode = v36;
          WORD2(v45.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&v45.st_ino + 6) = (__darwin_ino64_t)v9;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "PLFetchRecording: reader does not recognize file version: %@ for file at url: %@", (uint8_t *)&v45, 0x16u);
        }

        [(PLFetchRecording *)v11 _indexLocked_unmapFile];
        os_unfair_lock_unlock(&v11->_indexLock);
LABEL_48:
        close(v17);
LABEL_49:
        v28 = 0;
        goto LABEL_50;
      }
      v37 = PLBackendGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        unsigned int v38 = __error();
        unsigned int v39 = strerror(*v38);
        *(_DWORD *)buf = 67109378;
        int v47 = v17;
        __int16 v48 = 2080;
        v49 = v39;
        _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "LOFR expand: F_TRUNCATE of %d returned -1: error=%s", buf, 0x12u);
      }
    }
    unint64_t v40 = PLBackendGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v45.st_dev = 134217984;
      *(void *)&v45.st_mode = a5;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "LOFR Could not expand empty file to specified size: %ld", (uint8_t *)&v45, 0xCu);
    }

    goto LABEL_48;
  }
LABEL_25:
  v28 = v11;
LABEL_50:

  return v28;
}

- (void)_considerIfRemapIsNeeded
{
  unsigned int v2 = atomic_load((unsigned int *)&self->_numberOfAllocationsSinceLastRemap);
  if (v2 >= 0x32 && (atomic_exchange(&self->_remapPending._Value, 1u) & 1) == 0)
  {
    [(PLFetchRecording *)self _scheduleRemapAfterDelay];
    atomic_store(0, (unsigned int *)&self->_numberOfAllocationsSinceLastRemap);
  }
}

- (void)_scheduleRemapAfterDelay
{
  v3 = (void *)os_transaction_create();
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  remapQueue = self->_remapQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PLFetchRecording__scheduleRemapAfterDelay__block_invoke;
  v7[3] = &unk_1E5875E18;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  dispatch_after(v4, remapQueue, v7);
}

void __44__PLFetchRecording__scheduleRemapAfterDelay__block_invoke(uint64_t a1)
{
  BOOL v2 = os_unfair_lock_trylock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_indexLocked_remapFile");
    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 12));
    dispatch_time_t v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 56);
    os_unfair_lock_unlock(v4);
  }
  else
  {
    [v3 _scheduleRemapAfterDelay];
  }
}

- (void)_recordVariationWithEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3 timestamp:(double)a4 pagesHit:(unsigned int)a5 pagesMissed:(unsigned int)a6 rowsAffected:(unsigned int)a7 duration:(double)a8 QOS:(unsigned int)a9
{
  int v16 = (char *)a3
      + 32 * LOBYTE(a3->var11)
      + *(unsigned __int16 *)((char *)&a3->var9 + 5)
      + *(unsigned __int16 *)((char *)&a3->var9 + 7)
      + (unint64_t)*(unsigned __int16 *)((char *)&a3->var10 + 1)
      + *(unsigned __int16 *)((char *)&a3->var10 + 3)
      + *(unsigned __int16 *)((char *)&a3->var10 + 5);
  [(id)objc_opt_class() _assertAddress:v16 + 109 isValidWithLength:32 buffer:self->_indexLocked_buffer bufferLength:self->_indexLocked_bufferLen];
  *(double *)(v16 + 109) = a4;
  *(_DWORD *)(v16 + 117) = a9;
  *(double *)(v16 + 121) = a8;
  *(_DWORD *)(v16 + 133) = a6;
  *(_DWORD *)(v16 + 129) = a5;
  *(_DWORD *)(v16 + 137) = a7;
  unsigned int var10_high = HIBYTE(a3->var10);
  if (var10_high <= 4) {
    HIBYTE(a3->var10) = var10_high + 1;
  }
  char var11 = a3->var11;
  if ((var11 + 1) <= 4u) {
    char v19 = var11 + 1;
  }
  else {
    char v19 = 0;
  }
  LOBYTE(a3->var11) = v19;
}

- (BOOL)_isOpen
{
  return (self->_fd & 0x80000000) == 0 && self->_indexLocked_buffer != (void *)-1 && self->_indexLocked_bufferLen != 0;
}

- (void)_indexLocked_close
{
  [(PLFetchRecording *)self _indexLocked_unmapFile];
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_int fd = -1;
  }
}

- (BOOL)_indexLocked_remapFile
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_indexLock);
  [(NSMutableDictionary *)self->_indexLocked_indexEntriesByNormSQLHash enumerateKeysAndObjectsWithOptions:0 usingBlock:&__block_literal_global_66387];
  [(PLFetchRecording *)self _indexLocked_unmapFile];
  if (self->_mode) {
    int v3 = 3;
  }
  else {
    int v3 = 1;
  }
  int fd = self->_fd;
  memset(&v13, 0, sizeof(v13));
  if (fstat(fd, &v13) == -1) {
    size_t st_size = 0;
  }
  else {
    size_t st_size = v13.st_size;
  }
  id v6 = mmap(0, st_size, v3, 1, self->_fd, 0);
  v7 = v6;
  if (v6 == (void *)-1)
  {
    int v8 = *__error();
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      url = self->_url;
      v11 = strerror(v8);
      v13.st_dev = 138412802;
      *(void *)&v13.st_mode = url;
      WORD2(v13.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v13.st_ino + 6) = (__darwin_ino64_t)v11;
      HIWORD(v13.st_gid) = 1024;
      v13.st_rdev = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "LOFR Could not remap recording file at: %@, %s (%d)", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    self->_indexLocked_buffer = v6;
    self->_indexLocked_bufferLen = st_size;
  }
  [(NSMutableDictionary *)self->_indexLocked_indexEntriesByNormSQLHash enumerateKeysAndObjectsWithOptions:0 usingBlock:&__block_literal_global_37_66389];
  return v7 != (void *)-1;
}

uint64_t __42__PLFetchRecording__indexLocked_remapFile__block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 unlock];
}

uint64_t __42__PLFetchRecording__indexLocked_remapFile__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 lock];
}

- (void)_indexLocked_unmapFile
{
  os_unfair_lock_assert_owner(&self->_indexLock);
  indexLocked_buffer = self->_indexLocked_buffer;
  if (indexLocked_buffer)
  {
    size_t indexLocked_bufferLen = self->_indexLocked_bufferLen;
    if (indexLocked_bufferLen)
    {
      munmap(indexLocked_buffer, indexLocked_bufferLen);
      self->_indexLocked_buffer = 0;
      self->_size_t indexLocked_bufferLen = 0;
    }
  }
}

+ (id)suggestedFilenameForCurrentProcess
{
  id v2 = [NSString alloc];
  int v3 = [MEMORY[0x1E4F28F80] processInfo];
  dispatch_time_t v4 = [v3 processName];
  v5 = (void *)[v2 initWithFormat:@"%@-recording-v%@.%@", v4, @"0.54", @"lofr"];

  return v5;
}

+ (BOOL)deleteRecording:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 1;
  }
  id v5 = a3;
  [v5 close];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v5 url];

  LOBYTE(a4) = [v6 removeItemAtURL:v7 error:a4];
  return (char)a4;
}

+ (double)stdDevPageCountForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  [a1 varPageCountForEntryHeader:a3];
  return sqrt(v3);
}

+ (double)varPageCountForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  unsigned int v3 = *(unsigned int *)((char *)&a3->var4 + 1);
  double result = 0.0;
  if (v3 >= 2) {
    return *(double *)((char *)&a3->var8 + 5) / (double)((v3 - 1) % 0x1F4);
  }
  return result;
}

+ (double)meanPageCountForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  if (*(unsigned int *)((char *)&a3->var4 + 1)) {
    return *(double *)((char *)&a3->var6 + 5);
  }
  else {
    return 0.0;
  }
}

+ (id)backtraceForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    dispatch_queue_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PLFetchRecording.m", 837, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];
  }
  dispatch_time_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)&a3->var13+ *(unsigned __int16 *)((char *)&a3->var9 + 5)+ *(unsigned __int16 *)((char *)&a3->var9 + 7)+ (unint64_t)*(unsigned __int16 *)((char *)&a3->var10 + 1)+ *(unsigned __int16 *)((char *)&a3->var10 + 3)+ 1 length:*(unsigned __int16 *)((char *)&a3->var10 + 5)];
  id v13 = 0;
  id v5 = [v4 decompressedDataUsingAlgorithm:0 error:&v13];
  id v6 = v13;
  if (v5)
  {
    v7 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  }
  else
  {
    int v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "LOFR can't decompress backtrace: %@", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

+ (const)contextNameForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  return (char *)&a3->var13
       + *(unsigned __int16 *)((char *)&a3->var9 + 5)
       + *(unsigned __int16 *)((char *)&a3->var9 + 7)
       + (unint64_t)*(unsigned __int16 *)((char *)&a3->var10 + 1);
}

+ (id)multiInCountsForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!*(_WORD *)((char *)&a3->var10 + 1)
    || (unsigned int v3 = &a3->var0 + *(unsigned __int16 *)((char *)&a3->var9 + 5) + *(unsigned __int16 *)((char *)&a3->var9 + 7),
        v3 == (unsigned __int8 *)-107))
  {
    id v6 = 0;
  }
  else
  {
    dispatch_time_t v4 = [NSString stringWithUTF8String:v3 + 107];
    id v5 = [v4 componentsSeparatedByString:@","];
    if ([v5 count])
    {
      id v6 = [MEMORY[0x1E4F1CA48] array];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            dispatch_queue_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "integerValue", (void)v14));
            [v6 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

+ (const)bindVariablesForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  return (char *)&a3->var12 + *(unsigned __int16 *)((char *)&a3->var9 + 5);
}

+ (const)normalizedSQLForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  return (char *)&a3->var11 + 1;
}

+ (void)_updateRunningStatisticsForEntry:(PLFetchRecordingFileNormalizedStatementHeader *)a3 givenPageCount:(unsigned int)a4
{
  int v4 = *(unsigned int *)((char *)&a3->var4 + 1);
  *(unsigned int *)((char *)&a3->var4 + 1) = v4 + 1;
  if (v4 && (unsigned int v5 = (v4 + 1) % 0x1F4u) != 0)
  {
    double v6 = *(double *)((char *)&a3->var5 + 1);
    double v7 = (double)a4 - v6;
    double v8 = v6 + v7 / (double)v5;
    *(double *)((char *)&a3->var6 + 5) = v8;
    double v9 = *(double *)((char *)&a3->var7 + 5) + v7 * ((double)a4 - v8);
    *(double *)((char *)&a3->var8 + 5) = v9;
    *(double *)((char *)&a3->var5 + 1) = v8;
    *(double *)((char *)&a3->var7 + 5) = v9;
  }
  else
  {
    *(double *)((char *)&a3->var6 + 5) = (double)a4;
    *(double *)((char *)&a3->var5 + 1) = (double)a4;
    *(double *)((char *)&a3->var8 + 5) = 0.0;
    *(double *)((char *)&a3->var7 + 5) = 0.0;
  }
}

+ (BOOL)_statsForStatementAreInteresting:(PLFetchRecordingFileNormalizedStatementHeader *)a3 totalPages:(unsigned int)a4
{
  objc_msgSend(a1, "stdDevPageCountForEntryHeader:");
  double v8 = v7;
  [a1 meanPageCountForEntryHeader:a3];
  double v10 = (double)a4 - v9;
  if (v10 < 0.0) {
    double v10 = -v10;
  }
  return v10 > v8;
}

+ (void)_enumerateVariationsFromEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3 block:(id)a4
{
  double v7 = (void (**)(id, char *, unint64_t, unsigned char *))a4;
  if (v7)
  {
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PLFetchRecording.m", 558, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    if (!a3) {
      goto LABEL_7;
    }
  }
  char v11 = 0;
  if (HIBYTE(a3->var10))
  {
    unint64_t v8 = 0;
    double v9 = (char *)&a3->var13
       + *(unsigned __int16 *)((char *)&a3->var9 + 5)
       + *(unsigned __int16 *)((char *)&a3->var9 + 7)
       + (unint64_t)*(unsigned __int16 *)((char *)&a3->var10 + 1)
       + *(unsigned __int16 *)((char *)&a3->var10 + 3)
       + *(unsigned __int16 *)((char *)&a3->var10 + 5)
       + 1;
    do
    {
      v7[2](v7, v9, v8, &v11);
      if (v11) {
        break;
      }
      ++v8;
      v9 += 32;
    }
    while (v8 < HIBYTE(a3->var10));
  }
LABEL_7:
}

+ (void)_writeInitialHeaderToBuffer:(void *)a3 bufferLen:(unint64_t)a4
{
  if (!a3)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0, a4);
    [v13 handleFailureInMethod:a2, a1, @"PLFetchRecording.m", 523, @"Invalid parameter not satisfying: %@", @"buffer" object file lineNumber description];
  }
  *(_WORD *)a3 = -257;
  strncpy((char *)a3 + 2, (const char *)[@"0.54" UTF8String], 0xDuLL);
  unsigned int v5 = [MEMORY[0x1E4F28F80] processInfo];
  double v6 = [v5 processName];

  id v14 = v6;
  strncpy((char *)a3 + 15, (const char *)[v14 UTF8String], 0x81uLL);
  double v7 = PLPhotoLibraryServicesBinaryImageUUID();
  id v8 = [v7 UUIDString];
  strncpy((char *)a3 + 144, (const char *)[v8 UTF8String], 0x25uLL);
  double v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [v9 UUIDString];
  strncpy((char *)a3 + 181, (const char *)[v10 UTF8String], 0x25uLL);
  *(_DWORD *)((char *)a3 + 218) = dyld_get_active_platform();
  *(void *)((char *)a3 + 222) = 234;
  *(_DWORD *)((char *)a3 + 230) = 0;
}

+ (id)_backtrace
{
  id v2 = [MEMORY[0x1E4F29060] callStackSymbols];
  unsigned int v3 = [v2 debugDescription];

  return v3;
}

+ (_NSRange)_indexLocked_allocateSizeToFit:(unint64_t)a3 fileHeaderSize:(unint64_t)a4 currentEOF:(int64_t)a5 buffer:(void *)a6 bufferLength:(unint64_t)a7 index:(id)a8
{
  unsigned int v10 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a8;
  unsigned int v12 = v10 >> 11;
  if ((v10 & 0x7FF) != 0) {
    ++v12;
  }
  if (v12 >= 0x14) {
    unsigned int v13 = 20;
  }
  else {
    unsigned int v13 = v12;
  }
  unint64_t v14 = *(unsigned int *)((char *)a6 + 222);
  unint64_t v30 = v14;
  unsigned int v15 = 0;
  if (v13)
  {
    unint64_t v28 = a7;
    do
    {
      uint64_t v16 = _allocationSizeForEntry((unsigned char *)a6 + v14);
      if (v16)
      {
        size_t v17 = v16;
        if (v16 == -1)
        {
          int v18 = PLBackendGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "LOFR cannot read allocation block size marker, assuming single allocation...", buf, 2u);
          }

          bzero((char *)a6 + v14, 0x800uLL);
          v14 += 2048;
          ++v15;
        }
        else
        {
          uint64_t v19 = PLBackendGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            size_t v32 = v17;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "LOFR Erasing existing entry with size: %lu...", buf, 0xCu);
          }

          id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:(char *)a6 + v14 + 1 length:32];
          BOOL v21 = [v11 objectForKeyedSubscript:v20];
          if (!v21)
          {
            uint64_t v23 = PLBackendGetLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "LOFR Can't find existing entry in index, failing allocation.", buf, 2u);
            }

            break;
          }
          BOOL v22 = v21;
          [v21 lock];
          bzero((char *)a6 + v14, v17);
          [v11 removeObjectForKey:v20];
          objc_msgSend(v22, "entryLocked_markUnavailable");
          [v22 unlock];
          v15 += v17 >> 11;
          v14 += v17;

          a7 = v28;
        }
      }
      else
      {
        ++v15;
        v14 += 2048;
      }
      if (v14 >= a7)
      {
        unsigned int v15 = 0;
        ++*(_DWORD *)((char *)a6 + 226);
        unint64_t v14 = a4;
        unint64_t v30 = a4;
      }
    }
    while (v15 < v13);
  }
  if (v15 >= v13) {
    NSUInteger v24 = v15 << 11;
  }
  else {
    NSUInteger v24 = 0;
  }
  if (v15 >= v13) {
    uint64_t v25 = v30;
  }
  else {
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v26 = v25;
  NSUInteger v27 = v24;
  result.length = v27;
  result.location = v26;
  return result;
}

+ (void)_indexLocked_enumerateEntryHeadersFromBuffer:(const void *)a3 bufferLength:(unint64_t)a4 fileVersion:(id)a5 fileHeaderSize:(unint64_t)a6 block:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  if (a4 < a6) {
    goto LABEL_19;
  }
  char v21 = 0;
  if (a6 >= a4) {
    goto LABEL_19;
  }
  unsigned int v14 = 0;
  char v15 = 0;
  do
  {
    uint64_t v16 = (char *)a3 + a6;
    if ([v12 isEqualToString:@"0.53"])
    {
      uint64_t v16 = (unsigned char *)objc_msgSend(a1, "_currentVersionHeaderFrom_053Header:", (char *)a3 + a6);
      char v15 = 1;
    }
    if (*v16)
    {
      uint64_t v17 = _allocationSizeForEntry(v16);
      if (v17 == -1)
      {
        uint64_t v19 = PLBackendGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "LOFR can't read allocation block size.", buf, 2u);
        }

        (*((void (**)(id, void, unint64_t, void, void, char *))v13 + 2))(v13, 0, a6, v14, 0, &v21);
        uint64_t v18 = 2048;
      }
      else
      {
        uint64_t v18 = v17;
        (*((void (**)(id, unsigned char *, unint64_t, void, unsigned char *, char *))v13 + 2))(v13, v16, a6, v14, v16 + 105, &v21);
      }
      ++v14;
      a6 += v18;
      if (v15)
      {
LABEL_15:
        free(v16);
        uint64_t v16 = 0;
      }
    }
    else
    {
      a6 += 2048;
      if (v15) {
        goto LABEL_15;
      }
    }
  }
  while (a6 < a4);
  if (((v16 != 0) & v15) == 1) {
    free(v16);
  }
LABEL_19:
}

+ (PLFetchRecordingFileNormalizedStatementHeader)_currentVersionHeaderFrom_053Header:(PLFetchRecordingFileNormalizedStatementHeader_053 *)a3
{
  int v4 = (char *)malloc_type_calloc(1uLL, *(unsigned __int16 *)((char *)&a3->var8 + 5)+ (unint64_t)*(unsigned __int16 *)((char *)&a3->var8 + 7)+ *(unsigned __int16 *)((char *)&a3->var9 + 1)+ (unint64_t)*(unsigned __int16 *)((char *)&a3->var9 + 3)+ *(unsigned __int16 *)((char *)&a3->var9 + 5)+ 269, 0xADC5972BuLL);
  uint64_t v5 = *(void *)&a3->var1[32];
  char *v4 = a3->var0;
  *(void *)(v4 + 33) = v5;
  *(void *)(v4 + 41) = 0;
  *(double *)(v4 + 49) = *(double *)((char *)&a3->var2 + 1);
  *(_DWORD *)(v4 + 57) = *(unsigned int *)((char *)&a3->var3 + 1);
  *(_OWORD *)(v4 + 61) = *(_OWORD *)((char *)&a3->var4 + 1);
  *(_OWORD *)(v4 + 77) = *(_OWORD *)((char *)&a3->var6 + 5);
  uint64_t v6 = *(unsigned __int16 *)((char *)&a3->var8 + 5);
  *(_WORD *)(v4 + 93) = v6;
  uint64_t v7 = *(unsigned __int16 *)((char *)&a3->var8 + 7);
  *(_WORD *)(v4 + 95) = v7;
  uint64_t v8 = *(unsigned __int16 *)((char *)&a3->var9 + 1);
  *(_WORD *)(v4 + 97) = v8;
  uint64_t v9 = *(unsigned __int16 *)((char *)&a3->var9 + 3);
  *(_WORD *)(v4 + 99) = v9;
  uint64_t v10 = *(unsigned __int16 *)((char *)&a3->var9 + 5);
  *(_WORD *)(v4 + 101) = v10;
  v4[103] = HIBYTE(a3->var9);
  v4[104] = a3->var10;
  memcpy(v4 + 105, (char *)&a3->var10 + 1, v6 + v7 + v8 + v9 + v10 + 160);
  return (PLFetchRecordingFileNormalizedStatementHeader *)v4;
}

+ (void)_indexLocked_populateStatementIndex:(id)a3 fromBuffer:(void *)a4 bufferLength:(unint64_t)a5 fileHeaderSize:(unint64_t)a6 fileVersion:(id)a7
{
  id v12 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__PLFetchRecording__indexLocked_populateStatementIndex_fromBuffer_bufferLength_fileHeaderSize_fileVersion___block_invoke;
  v14[3] = &unk_1E586D720;
  id v15 = v12;
  id v13 = v12;
  objc_msgSend(a1, "_indexLocked_enumerateEntryHeadersFromBuffer:bufferLength:fileVersion:fileHeaderSize:block:", a4, a5, a7, a6, v14);
}

void __107__PLFetchRecording__indexLocked_populateStatementIndex_fromBuffer_bufferLength_fileHeaderSize_fileVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a2 + 1 length:32];
    if (v5)
    {
      id v7 = v5;
      uint64_t v6 = [[PLFetchRecordingIndexEntry alloc] initWithOffset:a3];
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];

      uint64_t v5 = v7;
    }
  }
}

@end