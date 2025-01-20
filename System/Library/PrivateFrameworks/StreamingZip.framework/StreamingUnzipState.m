@interface StreamingUnzipState
+ (id)unzipStateWithPath:(id)a3 options:(id)a4 error:(id *)a5;
- ($3632F29577C185DF68DCA35DB3C0928E)currentLFRecord;
- ($5C6E2A525B2F304BB512036F15118BA6)hashContext;
- ($AA9291E5398F62F4D1A894576DDA1914)dataDescriptor;
- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)cmpState;
- (BOOL)currentLFRequiresDataDescriptor;
- (BOOL)denyInvalidSymlinks;
- (BOOL)performCachedWrites;
- (BOOL)performingExtraction;
- (BOOL)resolveOwnershipWithExtraField:(id *)a3 outUID:(unsigned int *)a4 outGID:(unsigned int *)a5;
- (BOOL)storeCurrentFileInMemory;
- (NSDictionary)streamInfoDict;
- (NSMutableData)inMemoryFileData;
- (NSMutableData)unsureData;
- (NSNumber)overrideGID;
- (NSNumber)overrideUID;
- (NSSet)cachedGIDs;
- (NSString)lastChunkPartialHash;
- (NSString)unzipPath;
- (StreamingFileWriter)fileWriter;
- (StreamingUnzipState)init;
- (char)initWithPath:(void *)a3 options:(void *)a4 error:;
- (id)_checkHashForOffset:(uint64_t)a1;
- (id)checkLastChunkPartialHash;
- (id)finishStream;
- (id)serializeState;
- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5;
- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5 onlyFinishCurrentChunk:(BOOL)a6;
- (unint64_t)bytesHashedInChunk;
- (unint64_t)currentCRC32;
- (unint64_t)currentLFRecordAllocationSize;
- (unint64_t)currentOffset;
- (unint64_t)hashedChunkSize;
- (unint64_t)recordsProcessed;
- (unint64_t)thisStageBytesComplete;
- (unint64_t)totalFileSizeWritten;
- (unint64_t)totalRecordCount;
- (unint64_t)totalUncompressedBytes;
- (unint64_t)uncompressedBytesOutput;
- (unsigned)currentLFMode;
- (unsigned)streamState;
- (void)_internalSetStreamState:(unsigned __int8)a3;
- (void)clearSavedState;
- (void)dealloc;
- (void)setCurrentCRC32:(unint64_t)a3;
- (void)setCurrentLFMode:(unsigned __int16)a3;
- (void)setCurrentLFRecord:(id *)a3;
- (void)setCurrentLFRecordAllocationSize:(unint64_t)a3;
- (void)setCurrentLFRequiresDataDescriptor:(BOOL)a3;
- (void)setCurrentOffset:(unint64_t)a3;
- (void)setDataDescriptor:(id *)a3;
- (void)setDenyInvalidSymlinks:(BOOL)a3;
- (void)setFileWriter:(id)a3;
- (void)setInMemoryFileData:(id)a3;
- (void)setLastChunkPartialHash:(id)a3;
- (void)setPerformCachedWrites:(BOOL)a3;
- (void)setPerformingExtraction:(BOOL)a3;
- (void)setRecordsProcessed:(unint64_t)a3;
- (void)setStoreCurrentFileInMemory:(BOOL)a3;
- (void)setStreamInfoDict:(id)a3;
- (void)setStreamState:(unsigned __int8)a3;
- (void)setThisStageBytesComplete:(unint64_t)a3;
- (void)setTotalFileSizeWritten:(unint64_t)a3;
- (void)setTotalRecordCount:(unint64_t)a3;
- (void)setTotalUncompressedBytes:(unint64_t)a3;
- (void)setUncompressedBytesOutput:(unint64_t)a3;
- (void)setUnsureData:(id)a3;
@end

@implementation StreamingUnzipState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedGIDs, 0);
  objc_storeStrong((id *)&self->_fileWriter, 0);
  objc_storeStrong((id *)&self->_inMemoryFileData, 0);
  objc_storeStrong((id *)&self->_unsureData, 0);
  objc_storeStrong((id *)&self->_lastChunkPartialHash, 0);
  objc_storeStrong((id *)&self->_streamInfoDict, 0);
  objc_storeStrong((id *)&self->_overrideGID, 0);
  objc_storeStrong((id *)&self->_overrideUID, 0);
  objc_storeStrong((id *)&self->_hashes, 0);

  objc_storeStrong((id *)&self->_unzipPath, 0);
}

- (NSSet)cachedGIDs
{
  return self->_cachedGIDs;
}

- (void)setFileWriter:(id)a3
{
}

- (StreamingFileWriter)fileWriter
{
  return self->_fileWriter;
}

- (NSNumber)overrideGID
{
  return self->_overrideGID;
}

- (NSNumber)overrideUID
{
  return self->_overrideUID;
}

- (void)setPerformingExtraction:(BOOL)a3
{
  self->_performingExtraction = a3;
}

- (BOOL)performingExtraction
{
  return self->_performingExtraction;
}

- (void)setPerformCachedWrites:(BOOL)a3
{
  self->_performCachedWrites = a3;
}

- (BOOL)performCachedWrites
{
  return self->_performCachedWrites;
}

- (void)setDenyInvalidSymlinks:(BOOL)a3
{
  self->_denyInvalidSymlinks = a3;
}

- (BOOL)denyInvalidSymlinks
{
  return self->_denyInvalidSymlinks;
}

- (void)setDataDescriptor:(id *)a3
{
  self->_dataDescriptor = a3;
}

- ($AA9291E5398F62F4D1A894576DDA1914)dataDescriptor
{
  return self->_dataDescriptor;
}

- (void)setTotalFileSizeWritten:(unint64_t)a3
{
  self->_totalFileSizeWritten = a3;
}

- (unint64_t)totalFileSizeWritten
{
  return self->_totalFileSizeWritten;
}

- (void)setUncompressedBytesOutput:(unint64_t)a3
{
  self->_uncompressedBytesOutput = a3;
}

- (unint64_t)uncompressedBytesOutput
{
  return self->_uncompressedBytesOutput;
}

- (unint64_t)hashedChunkSize
{
  return self->_hashedChunkSize;
}

- (unint64_t)bytesHashedInChunk
{
  return self->_bytesHashedInChunk;
}

- (void)setCurrentLFRequiresDataDescriptor:(BOOL)a3
{
  self->_currentLFRequiresDataDescriptor = a3;
}

- (BOOL)currentLFRequiresDataDescriptor
{
  return self->_currentLFRequiresDataDescriptor;
}

- (void)setStoreCurrentFileInMemory:(BOOL)a3
{
  self->_storeCurrentFileInMemory = a3;
}

- (BOOL)storeCurrentFileInMemory
{
  return self->_storeCurrentFileInMemory;
}

- (unsigned)streamState
{
  return self->_streamState;
}

- (void)setCurrentLFMode:(unsigned __int16)a3
{
  self->_currentLFMode = a3;
}

- (unsigned)currentLFMode
{
  return self->_currentLFMode;
}

- (void)setTotalUncompressedBytes:(unint64_t)a3
{
  self->_totalUncompressedBytes = a3;
}

- (unint64_t)totalUncompressedBytes
{
  return self->_totalUncompressedBytes;
}

- (void)setTotalRecordCount:(unint64_t)a3
{
  self->_totalRecordCount = a3;
}

- (unint64_t)totalRecordCount
{
  return self->_totalRecordCount;
}

- (void)setRecordsProcessed:(unint64_t)a3
{
  self->_recordsProcessed = a3;
}

- (unint64_t)recordsProcessed
{
  return self->_recordsProcessed;
}

- (void)setCurrentCRC32:(unint64_t)a3
{
  self->_currentCRC32 = a3;
}

- (unint64_t)currentCRC32
{
  return self->_currentCRC32;
}

- (void)setCurrentOffset:(unint64_t)a3
{
  self->_currentOffset = a3;
}

- (unint64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setThisStageBytesComplete:(unint64_t)a3
{
  self->_thisStageBytesComplete = a3;
}

- (unint64_t)thisStageBytesComplete
{
  return self->_thisStageBytesComplete;
}

- (void)setCurrentLFRecordAllocationSize:(unint64_t)a3
{
  self->_currentLFRecordAllocationSize = a3;
}

- (unint64_t)currentLFRecordAllocationSize
{
  return self->_currentLFRecordAllocationSize;
}

- (void)setCurrentLFRecord:(id *)a3
{
  self->_currentLFRecord = a3;
}

- ($3632F29577C185DF68DCA35DB3C0928E)currentLFRecord
{
  return self->_currentLFRecord;
}

- (void)setInMemoryFileData:(id)a3
{
}

- (NSMutableData)inMemoryFileData
{
  return self->_inMemoryFileData;
}

- (void)setUnsureData:(id)a3
{
}

- (NSMutableData)unsureData
{
  return self->_unsureData;
}

- (void)setLastChunkPartialHash:(id)a3
{
}

- (NSString)lastChunkPartialHash
{
  return self->_lastChunkPartialHash;
}

- (void)setStreamInfoDict:(id)a3
{
}

- (NSDictionary)streamInfoDict
{
  return self->_streamInfoDict;
}

- ($5C6E2A525B2F304BB512036F15118BA6)hashContext
{
  long long v3 = *(_OWORD *)self[1].var1.var5.wbuf;
  *(_OWORD *)&retstr->var1.var5.wbuf[9] = *(_OWORD *)&self[1].var1.var5.hash[6];
  *(_OWORD *)&retstr->var1.var5.wbuf[11] = v3;
  *(_OWORD *)&retstr->var1.var5.wbuf[13] = *(_OWORD *)&self[1].var1.var5.wbuf[2];
  retstr->var1.var4.wbuf[15] = self[1].var1.var4.wbuf[4];
  long long v4 = *(_OWORD *)self[1].var1.var5.hash;
  *(_OWORD *)&retstr->var1.var5.wbuf[1] = *(_OWORD *)&self[1].var1.var0.A;
  *(_OWORD *)&retstr->var1.var5.wbuf[3] = v4;
  long long v5 = *(_OWORD *)&self[1].var1.var5.hash[4];
  *(_OWORD *)&retstr->var1.var5.wbuf[5] = *(_OWORD *)&self[1].var1.var5.hash[2];
  *(_OWORD *)&retstr->var1.var5.wbuf[7] = v5;
  long long v6 = *(_OWORD *)&self->var1.var5.wbuf[11];
  *(_OWORD *)&retstr->var1.var5.hash[1] = *(_OWORD *)&self->var1.var5.wbuf[9];
  *(_OWORD *)&retstr->var1.var5.hash[3] = v6;
  long long v7 = *(_OWORD *)&self->var1.var5.wbuf[15];
  *(_OWORD *)&retstr->var1.var5.hash[5] = *(_OWORD *)&self->var1.var5.wbuf[13];
  *(_OWORD *)&retstr->var1.var5.hash[7] = v7;
  long long v8 = *(_OWORD *)&self->var1.var5.wbuf[7];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var5.wbuf[5];
  *(_OWORD *)&retstr->var1.var5.count[1] = v8;
  return self;
}

- (NSString)unzipPath
{
  return self->_unzipPath;
}

- (BOOL)resolveOwnershipWithExtraField:(id *)a3 outUID:(unsigned int *)a4 outGID:(unsigned int *)a5
{
  if (a3 && a3->var1.var0 >= 0xCu)
  {
    int var0 = a3->var4.var0;
    uint64_t v9 = a3->var5.var0;
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
    uint64_t v9 = 0xFFFFFFFFLL;
    int var0 = -1;
  }
  v11 = [(StreamingUnzipState *)self overrideUID];
  uint64_t v12 = [(StreamingUnzipState *)self overrideGID];
  v13 = (void *)v12;
  if (v11)
  {
    int var0 = [v11 unsignedIntValue];
    if (!v13) {
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v9 = [v13 unsignedIntValue];
    goto LABEL_10;
  }
  if (v12) {
    goto LABEL_9;
  }
  if (!v10) {
    goto LABEL_14;
  }
LABEL_10:
  id v14 = [(StreamingUnzipState *)self cachedGIDs];
  uid_t v15 = getuid();
  if (v15)
  {
    if (var0 != -1 && v15 != var0) {
      goto LABEL_13;
    }
    if (v9 == -1)
    {
      v18 = 0;
    }
    else
    {
      uint64_t v17 = [NSNumber numberWithUnsignedInt:v9];
      v18 = (void *)v17;
      if (v14 && v17 && ![v14 containsObject:v17])
      {

LABEL_13:
LABEL_14:
        BOOL v16 = 0;
        goto LABEL_32;
      }
    }
  }
  if (a4)
  {
    if (getuid()) {
      unsigned int v19 = -1;
    }
    else {
      unsigned int v19 = var0;
    }
    *a4 = v19;
  }
  if (a5) {
    *a5 = v9;
  }
  BOOL v16 = 1;
LABEL_32:

  return v16;
}

- (id)finishStream
{
  [(StreamingUnzipState *)self clearSavedState];
  if (self->_streamState - 5 >= 3)
  {
    long long v4 = SZGetLoggingHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1DD5BF000, v4, OS_LOG_TYPE_ERROR, "Finishing an incomplete stream! This stream will not be resumable.", (uint8_t *)&v8, 2u);
    }

    uint64_t v3 = _CreateError((uint64_t)"-[StreamingUnzipState finishStream]", 568, @"SZExtractorErrorDomain", 3, 0, 0, @"Finishing an incomplete stream! This stream will not be resumable.", v5, v8);
    goto LABEL_7;
  }
  if (self->_bytesHashedInChunk)
  {
    uint64_t v3 = -[StreamingUnzipState _checkHashForOffset:]((uint64_t)self, self->_currentOffset);
LABEL_7:
    long long v6 = (void *)v3;
    goto LABEL_8;
  }
  long long v6 = 0;
LABEL_8:
  [(StreamingUnzipState *)self setStreamState:7];

  return v6;
}

- (id)_checkHashForOffset:(uint64_t)a1
{
  v32[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = a1 + 128;
    uint64_t v5 = gHashDigestSizes[*(unsigned int *)(a1 + 128)];
    GenericHashFinal(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], a1 + 128);
    long long v6 = StringFromDigest(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v5);
    unint64_t v7 = *(void *)(v4 - 72);
    if (v7) {
      unint64_t v8 = a2 / v7;
    }
    else {
      unint64_t v8 = 0;
    }
    if (v8 >= [*(id *)(a1 + 96) count])
    {
      v31[0] = @"SZExtractorFileOffsetErrorKey";
      BOOL v16 = [NSNumber numberWithUnsignedLongLong:a2];
      v32[0] = v16;
      v32[1] = v6;
      v31[1] = @"SZExtractorActualHashValueErrorKey";
      v31[2] = @"SZExtractorHashChunkIndexErrorKey";
      uint64_t v17 = [NSNumber numberWithUnsignedLongLong:v8];
      v32[2] = v17;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

      v18 = SZGetLoggingHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [*(id *)(a1 + 96) count];
        *(_DWORD *)buf = 134218240;
        unint64_t v24 = v8;
        __int16 v25 = 2048;
        unint64_t v26 = v22;
        _os_log_error_impl(&dword_1DD5BF000, v18, OS_LOG_TYPE_ERROR, "Cannot validate hash; this chunk is index %llu, but we only have %lu hashes.",
          buf,
          0x16u);
      }

      [*(id *)(a1 + 96) count];
      _CreateError((uint64_t)"-[StreamingUnzipState _checkHashForOffset:]", 457, @"SZExtractorErrorDomain", 4, 0, v9, @"Cannot validate hash; this chunk is index %llu, but we only have %lu hashes.",
        v19,
      uid_t v15 = v8);
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 96) objectAtIndex:v8];
      if ([v9 caseInsensitiveCompare:v6])
      {
        v29[0] = @"SZExtractorFileOffsetErrorKey";
        int v10 = [NSNumber numberWithUnsignedLongLong:a2];
        v30[0] = v10;
        v30[1] = v6;
        v29[1] = @"SZExtractorActualHashValueErrorKey";
        v29[2] = @"SZExtractorHashChunkIndexErrorKey";
        v11 = [NSNumber numberWithUnsignedLongLong:v8];
        v30[2] = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];

        v13 = SZGetLoggingHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          unint64_t v24 = a2;
          __int16 v25 = 2112;
          unint64_t v26 = (unint64_t)v9;
          __int16 v27 = 2112;
          v28 = v6;
          _os_log_error_impl(&dword_1DD5BF000, v13, OS_LOG_TYPE_ERROR, "Hash mismatch for chunk containing offset %llu: expected %@, got %@", buf, 0x20u);
        }

        uid_t v15 = _CreateError((uint64_t)"-[StreamingUnzipState _checkHashForOffset:]", 466, @"SZExtractorErrorDomain", 4, 0, v12, @"Hash mismatch for chunk containing offset %llu: expected %@, got %@", v14, a2);
      }
      else
      {
        v20 = SZGetLoggingHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          unint64_t v24 = a2;
          __int16 v25 = 2048;
          unint64_t v26 = v8;
          __int16 v27 = 2112;
          v28 = v9;
          _os_log_debug_impl(&dword_1DD5BF000, v20, OS_LOG_TYPE_DEBUG, "Verified that hashed data offset %llu matches index %llu: %@", buf, 0x20u);
        }

        uid_t v15 = 0;
      }
    }
  }
  else
  {
    uid_t v15 = 0;
  }

  return v15;
}

- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5
{
  return [(StreamingUnzipState *)self updateHashFromOffset:a3 withBytes:a4 length:a5 onlyFinishCurrentChunk:0];
}

- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5 onlyFinishCurrentChunk:(BOOL)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  hashes = self->_hashes;
  if (hashes)
  {
    hashes = (void *)[hashes count];
    if (hashes)
    {
      if (self->_hashedChunkSize || [(NSArray *)self->_hashes count] < 2)
      {
        if (a5)
        {
          while (1)
          {
            unint64_t hashedChunkSize = self->_hashedChunkSize;
            unint64_t v16 = a5;
            if (hashedChunkSize)
            {
              unint64_t v17 = hashedChunkSize - self->_bytesHashedInChunk;
              if (a5 >= v17) {
                unint64_t v16 = v17;
              }
              else {
                unint64_t v16 = a5;
              }
            }
            GenericHashUpdate((uint64_t)&self->_hashContext, (void *)a4, v16);
            unint64_t v18 = self->_hashedChunkSize;
            unint64_t v19 = self->_bytesHashedInChunk + v16;
            self->_bytesHashedInChunk = v19;
            if (!v18) {
              break;
            }
            a5 -= v16;
            if (v19 > v18) {
              __assert_rtn("-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]", "StreamingUnzipState.m", 534, "_bytesHashedInChunk <= _hashedChunkSize");
            }
            a4 = (char *)a4 + v16;
            a3 += v16;
            if (v19 == v18)
            {
              hashes = -[StreamingUnzipState _checkHashForOffset:]((uint64_t)self, a3 - v19);
              if (hashes) {
                goto LABEL_22;
              }
              GenericHashInit((uint64_t)&self->_hashContext, self->_hashContext.hashType);
              hashes = 0;
              self->_bytesHashedInChunk = 0;
              if (a6 || !a5) {
                goto LABEL_22;
              }
            }
            else if (!a5)
            {
              break;
            }
          }
        }
        hashes = 0;
      }
      else
      {
        uint64_t v12 = SZGetLoggingHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          unint64_t v21 = self->_hashedChunkSize;
          NSUInteger v22 = [(NSArray *)self->_hashes count];
          *(_DWORD *)buf = 134218240;
          unint64_t v24 = v21;
          __int16 v25 = 2048;
          NSUInteger v26 = v22;
          _os_log_error_impl(&dword_1DD5BF000, v12, OS_LOG_TYPE_ERROR, "Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes", buf, 0x16u);
        }

        unint64_t v13 = self->_hashedChunkSize;
        [(NSArray *)self->_hashes count];
        hashes = _CreateError((uint64_t)"-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]", 508, @"SZExtractorErrorDomain", 4, 0, 0, @"Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes", v14, v13);
      }
    }
  }
LABEL_22:

  return hashes;
}

- (id)checkLastChunkPartialHash
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = gHashDigestSizes[self->_hashContext.hashType];
  long long v4 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[11];
  v20[10] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[9];
  v20[11] = v4;
  v20[12] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[13];
  CC_LONG64 v21 = self->_hashContext.context.sha384.wbuf[15];
  long long v5 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[3];
  v20[6] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[1];
  v20[7] = v5;
  long long v6 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[7];
  v20[8] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[5];
  v20[9] = v6;
  long long v7 = *(_OWORD *)&self->_hashContext.context.sha512.hash[3];
  v20[2] = *(_OWORD *)&self->_hashContext.context.sha512.hash[1];
  v20[3] = v7;
  long long v8 = *(_OWORD *)&self->_hashContext.context.sha512.hash[7];
  v20[4] = *(_OWORD *)&self->_hashContext.context.sha512.hash[5];
  v20[5] = v8;
  long long v9 = *(_OWORD *)&self->_hashContext.context.sha512.count[1];
  v20[0] = *(_OWORD *)&self->_hashContext.hashType;
  v20[1] = v9;
  GenericHashFinal((unsigned __int8 *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v20);
  int v10 = StringFromDigest((unsigned __int8 *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  uint64_t v11 = [v10 caseInsensitiveCompare:self->_lastChunkPartialHash];
  uint64_t v12 = SZGetLoggingHandle();
  unint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      lastChunkPartialHash = self->_lastChunkPartialHash;
      *(_DWORD *)buf = 138412546;
      __int16 v25 = lastChunkPartialHash;
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      _os_log_error_impl(&dword_1DD5BF000, v13, OS_LOG_TYPE_ERROR, "Hash mismatch for last partial chunk: expected %@, got %@", buf, 0x16u);
    }

    NSUInteger v22 = @"SZExtractorFileOffsetErrorKey";
    uint64_t v14 = [NSNumber numberWithUnsignedLongLong:self->_currentOffset];
    v23 = v14;
    uid_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    unint64_t v17 = _CreateError((uint64_t)"-[StreamingUnzipState checkLastChunkPartialHash]", 491, @"SZExtractorErrorDomain", 2, 0, v15, @"Hash mismatch for last partial chunk: expected %@, got %@", v16, (uint64_t)self->_lastChunkPartialHash);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v25 = (NSString *)v10;
      _os_log_debug_impl(&dword_1DD5BF000, v13, OS_LOG_TYPE_DEBUG, "Verified that last chunk partial hash matches: %@", buf, 0xCu);
    }

    unint64_t v17 = 0;
    self->_bytesHashedInChunk = 0;
  }

  return v17;
}

- (id)serializeState
{
  v84[1] = *MEMORY[0x1E4F143B8];
  if (!self->_currentOffset) {
    goto LABEL_48;
  }
  fileWriter = self->_fileWriter;
  if (fileWriter)
  {
    id v66 = 0;
    BOOL v5 = [(StreamingFileWriter *)fileWriter suspendWithError:&v66];
    id v6 = v66;
    v2 = v6;
    if (!v5) {
      goto LABEL_54;
    }
  }
  if (self->_streamState != 5)
  {
    long long v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v9 setOutputFormat:200];
    [v9 encodeInt:8 forKey:@"SerializationVersion"];
    hashes = self->_hashes;
    if (hashes && [(NSArray *)hashes count]) {
      [v9 encodeBytes:&self->_hashContext.context length:gHashContextSizes[self->_hashContext.hashType] forKey:@"HashContext"];
    }
    [v9 encodeObject:self->_streamInfoDict forKey:@"StreamInfoDict"];
    [v9 encodeObject:self->_lastChunkPartialHash forKey:@"LastChunkPartialHash"];
    [v9 encodeObject:self->_unsureData forKey:@"UnsureData"];
    [v9 encodeObject:self->_inMemoryFileData forKey:@"InMemoryFileData"];
    currentLFRecord = self->_currentLFRecord;
    if (currentLFRecord)
    {
      if (HIWORD(currentLFRecord->var7.var0) + (unint64_t)currentLFRecord->var8.var0 + 30 >= self->_currentLFRecordAllocationSize) {
        unint64_t currentLFRecordAllocationSize = self->_currentLFRecordAllocationSize;
      }
      else {
        unint64_t currentLFRecordAllocationSize = HIWORD(currentLFRecord->var7.var0)
      }
                                      + (unint64_t)currentLFRecord->var8.var0
                                      + 30;
      [v9 encodeBytes:currentLFRecord length:currentLFRecordAllocationSize forKey:@"LocalFileRecord"];
    }
    unint64_t v17 = [NSNumber numberWithUnsignedLongLong:self->_thisStageBytesComplete];
    [v9 encodeObject:v17 forKey:@"StageBytesComplete"];

    unint64_t v18 = [NSNumber numberWithUnsignedLongLong:self->_currentOffset];
    [v9 encodeObject:v18 forKey:@"CurrentOffset"];

    unint64_t v19 = self->_fileWriter;
    if (v19)
    {
      id v65 = 0;
      uint64_t v20 = [(StreamingFileWriter *)v19 currentOffsetWithError:&v65];
      id v21 = v65;
      NSUInteger v22 = v21;
      if (v20 == -1)
      {
        v48 = SZGetLoggingHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DD5BF000, v48, OS_LOG_TYPE_ERROR, "Unable to get current output offset from current output file", buf, 2u);
        }

        uint64_t v73 = *MEMORY[0x1E4F28328];
        v49 = GetFileNameStringFromLocalFileRecord(self->_currentLFRecord->var0);
        v74 = v49;
        v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        v52 = @"Unable to get current output offset from current output file";
        uint64_t v53 = 395;
      }
      else
      {
        if (v20 == self->_uncompressedBytesOutput)
        {

          goto LABEL_24;
        }
        v55 = SZGetLoggingHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          unint64_t uncompressedBytesOutput = self->_uncompressedBytesOutput;
          *(_DWORD *)buf = 134218240;
          v78 = (const char *)uncompressedBytesOutput;
          __int16 v79 = 2048;
          unint64_t v80 = v20;
          _os_log_error_impl(&dword_1DD5BF000, v55, OS_LOG_TYPE_ERROR, "Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)", buf, 0x16u);
        }

        uint64_t v71 = *MEMORY[0x1E4F28328];
        v49 = GetFileNameStringFromLocalFileRecord(self->_currentLFRecord->var0);
        v72 = v49;
        v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        unint64_t v63 = self->_uncompressedBytesOutput;
        v52 = @"Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)";
        uint64_t v53 = 397;
      }
      v2 = _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", v53, @"SZExtractorErrorDomain", 1, v22, v51, v52, v50, v63);

      goto LABEL_53;
    }
LABEL_24:
    v23 = [NSNumber numberWithUnsignedLongLong:self->_uncompressedBytesOutput];
    [v9 encodeObject:v23 forKey:@"CurrentOutputFileOffset"];

    unint64_t v24 = [NSNumber numberWithUnsignedLongLong:self->_totalFileSizeWritten];
    [v9 encodeObject:v24 forKey:@"TotalFileSizeWritten"];

    __int16 v25 = [NSNumber numberWithUnsignedLong:self->_currentCRC32];
    [v9 encodeObject:v25 forKey:@"CurrentCRC32"];

    state = self->_cmpState.state;
    if (state)
    {
      uint64_t v27 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:state length:compression_stream_get_state_size() freeWhenDone:0];
      [v9 encodeObject:v27 forKey:@"SerializedCompressionState"];
    }
    [v9 encodeBool:self->_fileWriter != 0 forKey:@"OpenCurrentOutputFile"];
    uint64_t v28 = [NSNumber numberWithUnsignedLongLong:self->_recordsProcessed];
    [v9 encodeObject:v28 forKey:@"RecordsProcessed"];

    v29 = [NSNumber numberWithUnsignedShort:self->_currentLFMode];
    [v9 encodeObject:v29 forKey:@"LocalFileMode"];

    v30 = [NSNumber numberWithUnsignedChar:self->_streamState];
    [v9 encodeObject:v30 forKey:@"StreamState"];

    [v9 encodeBool:self->_storeCurrentFileInMemory forKey:@"StoreCurrentFileInMemory"];
    v31 = [v9 encodedData];
    v32 = [(NSString *)self->_unzipPath stringByAppendingPathComponent:@"com.apple.StreamingUnzipResumptionData"];
    v33 = SZGetLoggingHandle();
    v34 = v33;
    if (v31)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v60 = [v31 length];
        unint64_t currentOffset = self->_currentOffset;
        *(_DWORD *)buf = 134218240;
        v78 = (const char *)v60;
        __int16 v79 = 2048;
        unint64_t v80 = currentOffset;
        _os_log_debug_impl(&dword_1DD5BF000, v34, OS_LOG_TYPE_DEBUG, "Serializing %lu bytes of resumption data for offset %llu", buf, 0x16u);
      }

      id v64 = 0;
      int v35 = 1;
      char v36 = [v31 writeToFile:v32 options:1 error:&v64];
      id v37 = v64;
      if (v36)
      {
LABEL_47:

        if (!v35) {
          goto LABEL_54;
        }
        goto LABEL_48;
      }
      v38 = SZGetLoggingHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v78 = (const char *)v32;
        __int16 v79 = 2112;
        unint64_t v80 = (unint64_t)v37;
        _os_log_error_impl(&dword_1DD5BF000, v38, OS_LOG_TYPE_ERROR, "Failed to save resumption data to path %@: %@", buf, 0x16u);
      }

      uint64_t v67 = *MEMORY[0x1E4F28328];
      v68 = v32;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      v2 = _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", 431, @"SZExtractorErrorDomain", 1, v37, v39, @"Failed to save resumption data to path %@: %@", v40, (uint64_t)v32);
    }
    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v78 = (const char *)v32;
        _os_log_error_impl(&dword_1DD5BF000, v34, OS_LOG_TYPE_ERROR, "Failed to create archive for resumption data to path %@", buf, 0xCu);
      }

      uint64_t v69 = *MEMORY[0x1E4F28328];
      v70 = v32;
      id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      v2 = _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", 424, @"SZExtractorErrorDomain", 1, 0, v37, @"Failed to create archive for resumption data to path %@", v54, (uint64_t)v32);
    }
    int v35 = 0;
    goto LABEL_47;
  }
  long long v7 = self->_hashes;
  if (!v7 || ![(NSArray *)v7 count])
  {
    long long v9 = objc_opt_new();
    if (!v9) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
  long long v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v8 setOutputFormat:200];
  [v8 encodeInt:8 forKey:@"SerializationVersion"];
  [v8 encodeBytes:&self->_hashContext.context length:gHashContextSizes[self->_hashContext.hashType] forKey:@"HashContext"];
  long long v9 = [v8 encodedData];

  if (v9)
  {
LABEL_34:
    v41 = [(NSString *)self->_unzipPath fileSystemRepresentation];
    id v42 = v9;
    if (setxattr(v41, "com.apple.StreamingPassthroughResumptionData", (const void *)[v42 bytes], objc_msgSend(v42, "length"), 0, 1))
    {
      uint64_t v43 = *__error();
      v44 = SZGetLoggingHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        unzipPath = self->_unzipPath;
        v58 = strerror(v43);
        *(_DWORD *)buf = 136315650;
        v78 = "com.apple.StreamingPassthroughResumptionData";
        __int16 v79 = 2112;
        unint64_t v80 = (unint64_t)unzipPath;
        __int16 v81 = 2080;
        v82 = v58;
        _os_log_error_impl(&dword_1DD5BF000, v44, OS_LOG_TYPE_ERROR, "Failed to set passthrough EA %s on path %@: %s", buf, 0x20u);
      }

      v45 = (void *)*MEMORY[0x1E4F28798];
      v46 = self->_unzipPath;
      uint64_t v75 = *MEMORY[0x1E4F28328];
      v76 = v46;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      strerror(v43);
      _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", 367, v45, v43, 0, v12, @"Failed to set passthrough EA %s on path %@: %s", v47, (uint64_t)"com.apple.StreamingPassthroughResumptionData");
      goto LABEL_38;
    }

LABEL_48:
    v2 = 0;
    goto LABEL_54;
  }
LABEL_9:
  int v10 = SZGetLoggingHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v59 = self->_unzipPath;
    *(_DWORD *)buf = 138412290;
    v78 = (const char *)v59;
    _os_log_error_impl(&dword_1DD5BF000, v10, OS_LOG_TYPE_ERROR, "Failed to create archive for passthrough EA on path %@", buf, 0xCu);
  }

  uint64_t v11 = self->_unzipPath;
  uint64_t v83 = *MEMORY[0x1E4F28328];
  v84[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
  _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", 362, @"SZExtractorErrorDomain", 1, 0, v12, @"Failed to create archive for passthrough EA on path %@", v13, (uint64_t)self->_unzipPath);
  v2 = LABEL_38:;

LABEL_53:
LABEL_54:

  return v2;
}

- (void)clearSavedState
{
  if (!stat(-[NSString fileSystemRepresentation](self->_unzipPath, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
            0),
          &v5))
  {
    unzipPath = self->_unzipPath;
    if ((v5.st_mode & 0xF000) == 0x4000)
    {
      id v4 = [(NSString *)unzipPath stringByAppendingPathComponent:@"com.apple.StreamingUnzipResumptionData"];
      unlink((const char *)[v4 fileSystemRepresentation]);
    }
    else
    {
      removexattr([(NSString *)unzipPath fileSystemRepresentation], "com.apple.StreamingPassthroughResumptionData", 1);
    }
  }
}

- (void)setStreamState:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_thisStageBytesComplete = 0;
  stat v5 = SZGetLoggingHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t streamState = self->_streamState;
    if (streamState > 8) {
      unint64_t v18 = @"Unknown";
    }
    else {
      unint64_t v18 = off_1E6CD1DD0[streamState];
    }
    if (v3 > 8) {
      unint64_t v19 = @"Unknown";
    }
    else {
      unint64_t v19 = off_1E6CD1DD0[v3];
    }
    int v20 = 138412546;
    id v21 = v18;
    __int16 v22 = 2112;
    v23 = v19;
    _os_log_debug_impl(&dword_1DD5BF000, v5, OS_LOG_TYPE_DEBUG, "Updating stream state from %@ to %@", (uint8_t *)&v20, 0x16u);
  }

  switch(v3)
  {
    case 0u:
      int v6 = self->_streamState;
      if (v6 != 1 && v6 != 4) {
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 208, "kStreamStateCompleteLFData == _streamState || kStreamStateIncompleteLFRecord == _streamState");
      }
      self->_currentCRC32 = 0;
      self->_unint64_t uncompressedBytesOutput = 0;
      fileWriter = self->_fileWriter;
      if (fileWriter)
      {
        [(StreamingFileWriter *)fileWriter closeCurrentOutputFD];
        long long v9 = self->_fileWriter;
        self->_fileWriter = 0;
      }
      dataDescriptor = self->_dataDescriptor;
      if (dataDescriptor)
      {
        *(void *)dataDescriptor->int var0 = 0;
        *(void *)&dataDescriptor->var1.var0.var0.int var0 = 0;
        dataDescriptor->var1.var0.var1.int var0 = 0;
      }
      currentLFRecord = self->_currentLFRecord;
      *(void *)currentLFRecord->int var0 = 0;
      *(void *)&currentLFRecord->var3.int var0 = 0;
      *(void *)((char *)&currentLFRecord->var6.var0 + 2) = 0;
      *(void *)&currentLFRecord->var5.int var0 = 0;
      *(_WORD *)&self->_storeCurrentFileInMemory = 0;
      [(NSMutableData *)self->_inMemoryFileData setLength:0];
      self->_currentLFMode = 0;
      ++self->_recordsProcessed;
      break;
    case 1u:
      if (self->_streamState) {
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 233, "kStreamStateReadNextRecordSignature == _streamState");
      }
      self->_thisStageBytesComplete = 4;
      break;
    case 2u:
      if (self->_streamState != 1) {
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 238, "kStreamStateIncompleteLFRecord == _streamState");
      }
      return;
    case 3u:
      if (self->_streamState != 2) {
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 242, "kStreamStateIncompleteLFData == _streamState");
      }
      return;
    case 4u:
      if (self->_streamState - 1 >= 3) {
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 246, "kStreamStateIncompleteDataDescriptor == _streamState|| kStreamStateIncompleteLFData == _streamState || kStreamStateIncompleteLFRecord == _streamState");
      }
      return;
    case 5u:
      streamInfoDict = self->_streamInfoDict;
      self->_streamInfoDict = 0;

      unsureData = self->_unsureData;
      self->_unsureData = 0;

      inMemoryFileData = self->_inMemoryFileData;
      self->_inMemoryFileData = 0;

      free(self->_currentLFRecord);
      self->_currentLFRecord = 0;
      self->_thisStageBytesComplete = 0;
      self->_currentCRC32 = 0;
      self->_currentLFMode = 0;
      self->_recordsProcessed = 0;
      self->_totalRecordCount = 0;
      break;
    case 6u:
      goto LABEL_21;
    case 7u:
      uint64_t v12 = self->_fileWriter;
      if (v12)
      {
        [(StreamingFileWriter *)v12 closeCurrentOutputFD];
        uint64_t v13 = self->_fileWriter;
        self->_fileWriter = 0;
      }
LABEL_21:
      free(self->_currentLFRecord);
      self->_currentLFRecord = 0;
      break;
    default:
      break;
  }
  self->_unint64_t streamState = v3;
  [(StreamingUnzipState *)self markResumptionPoint];
}

- (void)_internalSetStreamState:(unsigned __int8)a3
{
  self->_unint64_t streamState = a3;
}

- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)cmpState
{
  return ($D199E5C2C3D9BBBBA45D19FC310E2D7B *)&self->_cmpState;
}

- (void)dealloc
{
  fileWriter = self->_fileWriter;
  if (fileWriter)
  {
    [(StreamingFileWriter *)fileWriter closeCurrentOutputFD];
    id v4 = self->_fileWriter;
    self->_fileWriter = 0;
  }
  free(self->_dataDescriptor);
  free(self->_currentLFRecord);
  compression_stream_destroy((compression_stream *)&self->_cmpState);
  v5.receiver = self;
  v5.super_class = (Class)StreamingUnzipState;
  [(StreamingUnzipState *)&v5 dealloc];
}

- (StreamingUnzipState)init
{
}

+ (id)unzipStateWithPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v9 = -[StreamingUnzipState initWithPath:options:error:]([StreamingUnzipState alloc], v7, v8, 0);
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    id v15 = 0;
    int v11 = _RemoveAndRecreateDirectoryAtPath(v7, &v15);
    id v10 = v15;
    if (v11)
    {
      id v14 = v10;
      long long v9 = -[StreamingUnzipState initWithPath:options:error:]([StreamingUnzipState alloc], v7, v8, &v14);
      id v12 = v14;

      id v10 = v12;
    }
    if (a5 && !v9)
    {
      id v10 = v10;
      *a5 = v10;
    }
  }

  return v9;
}

- (char)initWithPath:(void *)a3 options:(void *)a4 error:
{
  v271[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    uint64_t v47 = 0;
    goto LABEL_42;
  }
  if (a4) {
    *a4 = 0;
  }
  v254.receiver = a1;
  v254.super_class = (Class)StreamingUnzipState;
  long long v9 = (char *)objc_msgSendSuper2(&v254, sel_init);

  if (!v9)
  {
    v44 = SZGetLoggingHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD5BF000, v44, OS_LOG_TYPE_ERROR, "Failed to init", buf, 2u);
    }

    v46 = _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 856, (void *)*MEMORY[0x1E4F28798], 12, 0, 0, @"Failed to init", v45, v214);
    id v42 = v46;
    if (a4)
    {
      id v43 = v46;
      id v42 = v43;
      long long v9 = 0;
      goto LABEL_38;
    }
    long long v9 = 0;
LABEL_40:
    uint64_t v47 = 0;
    goto LABEL_41;
  }
  id v10 = v8;
  int v11 = (objc_class *)objc_opt_class();
  if (_ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsHashType", v11)
    && (id v12 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsHashesArray", v12))
    && (uint64_t v13 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsHashedChunkSize", v13))
    && (id v14 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsDenyInvalidSymlinks", v14))
    && (id v15 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsPerformCachedWrites", v15))
    && (uint64_t v16 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsQuarantineInfo", v16))
    && (unint64_t v17 = (objc_class *)objc_opt_class(),
        (_ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsOwnerUserID", v17) & 1) != 0))
  {
    unint64_t v18 = (objc_class *)objc_opt_class();
    char v19 = _ValidateDictionaryKeyValueType(v10, @"SZExtractorOptionsOwnerGroupID", v18);

    if (v19)
    {
      uint64_t v20 = objc_msgSend(v7, "SZ_stringByDeletingTrailingSlashes");
      id v21 = (void *)*((void *)v9 + 11);
      *((void *)v9 + 11) = v20;

      __int16 v22 = (void *)*((void *)v9 + 49);
      *((void *)v9 + 49) = 0;

      *((void *)v9 + 15) = 30;
      v23 = malloc_type_calloc(1uLL, 0x1EuLL, 0xD142217uLL);
      *((void *)v9 + 47) = v23;
      if (!v23)
      {
        v49 = SZGetLoggingHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DD5BF000, v49, OS_LOG_TYPE_ERROR, "Could not allocate memory for local file record", buf, 2u);
        }

        v51 = (void *)*MEMORY[0x1E4F28798];
        v52 = @"Could not allocate memory for local file record";
        uint64_t v53 = 879;
        uint64_t v54 = 12;
        goto LABEL_54;
      }
      uint64_t v24 = objc_opt_new();
      __int16 v25 = (void *)*((void *)v9 + 45);
      *((void *)v9 + 45) = v24;

      uint64_t v26 = objc_opt_new();
      uint64_t v27 = (void *)*((void *)v9 + 46);
      *((void *)v9 + 46) = v26;

      uint64_t v28 = [v10 objectForKey:@"SZExtractorOptionsHashedChunkSize"];
      *((void *)v9 + 7) = [v28 unsignedLongLongValue];

      uint64_t v29 = [v10 objectForKey:@"SZExtractorOptionsHashesArray"];
      v30 = (void *)*((void *)v9 + 12);
      *((void *)v9 + 12) = v29;

      if ((unint64_t)[*((id *)v9 + 12) count] >= 2 && !*((void *)v9 + 7))
      {
        v56 = SZGetLoggingHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DD5BF000, v56, OS_LOG_TYPE_ERROR, "Ambiguous chunk size (hashes > 1 but chunkSize == 0)", buf, 2u);
        }

        v51 = (void *)*MEMORY[0x1E4F28798];
        v52 = @"Ambiguous chunk size (hashes > 1 but chunkSize == 0)";
        uint64_t v53 = 890;
        goto LABEL_53;
      }
      if (![*((id *)v9 + 12) count] && *((void *)v9 + 7))
      {
        v55 = SZGetLoggingHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DD5BF000, v55, OS_LOG_TYPE_ERROR, "Hash chunk size given as > 0, but no hashes", buf, 2u);
        }

        v51 = (void *)*MEMORY[0x1E4F28798];
        v52 = @"Hash chunk size given as > 0, but no hashes";
        uint64_t v53 = 895;
LABEL_53:
        uint64_t v54 = 22;
LABEL_54:
        _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", v53, v51, v54, 0, 0, v52, v50, v214);
        id v42 = (id)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        id v58 = 0;
LABEL_70:
        [v58 finishDecoding];
        if (v42)
        {
          if (a4) {
            *a4 = v42;
          }

          long long v9 = 0;
        }
        long long v9 = v9;

        uint64_t v47 = v9;
        goto LABEL_41;
      }
      v31 = [v10 objectForKey:@"SZExtractorOptionsDenyInvalidSymlinks"];
      v9[453] = [v31 BOOLValue];

      v32 = [v10 objectForKey:@"SZExtractorOptionsPerformCachedWrites"];
      v9[454] = [v32 BOOLValue];

      if (v9[454])
      {
        v33 = SZGetLoggingHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v262 = v7;
          _os_log_impl(&dword_1DD5BF000, v33, OS_LOG_TYPE_DEFAULT, "Performing cached writes to extraction under %@", buf, 0xCu);
        }
      }
      id v253 = 0;
      v34 = FetchGroupIDs(&v253);
      id v228 = v253;
      if (!v34)
      {
        int v35 = SZGetLoggingHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v262 = v228;
          _os_log_impl(&dword_1DD5BF000, v35, OS_LOG_TYPE_DEFAULT, "Failed to fetch current group access list, falling back to always calling chown: %@", buf, 0xCu);
        }

        id v228 = 0;
      }
      v227 = v34;
      objc_storeStrong((id *)v9 + 57, v34);
      char v36 = [v10 objectForKeyedSubscript:@"SZExtractorOptionsOwnerUserID"];
      if (v36)
      {
        if (getuid())
        {
          id v37 = SZGetLoggingHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uid_t v38 = getuid();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v262 = v38;
            _os_log_impl(&dword_1DD5BF000, v37, OS_LOG_TYPE_DEFAULT, "Use of SZExtractorOptionsOwnerUserID requires the caller to be running as root, but it was running as uid %d; ignoring.",
              buf,
              8u);
          }
        }
        else
        {
          uint64_t v59 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v36, "unsignedIntValue"));
          id v37 = *((void *)v9 + 13);
          *((void *)v9 + 13) = v59;
        }
      }
      uint64_t v60 = [v10 objectForKeyedSubscript:@"SZExtractorOptionsOwnerGroupID"];
      if (v60)
      {
        uint64_t v61 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v60, "unsignedIntValue"));
        v62 = (void *)*((void *)v9 + 14);
        *((void *)v9 + 14) = v61;
      }
      id v63 = [v10 objectForKey:@"SZExtractorOptionsHashType"];
      id v64 = v63;
      if (!v63 || ([v63 isEqualToString:@"SZExtractorHashTypeMD5"] & 1) != 0) {
        goto LABEL_61;
      }
      if ([v64 isEqualToString:@"SZExtractorHashTypeSHA1"])
      {
        int v65 = 1;
      }
      else if ([v64 isEqualToString:@"SZExtractorHashTypeSHA224"])
      {
        int v65 = 4;
      }
      else if ([v64 isEqualToString:@"SZExtractorHashTypeSHA256"])
      {
        int v65 = 5;
      }
      else if ([v64 isEqualToString:@"SZExtractorHashTypeSHA384"])
      {
        int v65 = 6;
      }
      else
      {
        if (([v64 isEqualToString:@"SZExtractorHashTypeSHA512"] & 1) == 0)
        {
          v134 = SZGetLoggingHandle();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v262 = v64;
            _os_log_error_impl(&dword_1DD5BF000, v134, OS_LOG_TYPE_ERROR, "Unsupported hash type: %@. Defaulting to MD5", buf, 0xCu);
          }

LABEL_61:
          int v65 = 0;
          goto LABEL_62;
        }
        int v65 = 7;
      }
LABEL_62:

      GenericHashInit((uint64_t)(v9 + 128), v65);
      *((void *)v9 + 5) = 0;
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + 8) = 0u;
      memset(&v252, 0, sizeof(v252));
      id v66 = v7;
      if (stat((const char *)[v66 fileSystemRepresentation], &v252))
      {
        uint64_t v67 = (uint64_t)v66;
        uint64_t v68 = *__error();
        uint64_t v69 = SZGetLoggingHandle();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          v116 = strerror(v68);
          *(_DWORD *)buf = 138412546;
          *(void *)v262 = v67;
          *(_WORD *)&v262[8] = 2080;
          *(void *)v263 = v116;
          _os_log_error_impl(&dword_1DD5BF000, v69, OS_LOG_TYPE_ERROR, "Failed to stat path %@: %s", buf, 0x16u);
        }

        v70 = (void *)*MEMORY[0x1E4F28798];
        uint64_t v270 = *MEMORY[0x1E4F28328];
        v271[0] = v67;
        uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v271 forKeys:&v270 count:1];
        strerror(v68);
        _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 938, v70, v68, 0, v71, @"Failed to stat path %@: %s", v72, v67);
LABEL_66:
        id v42 = (id)objc_claimAutoreleasedReturnValue();

LABEL_67:
LABEL_68:
        id v58 = 0;
LABEL_69:
        v57 = v227;
        goto LABEL_70;
      }
      int v73 = v252.st_mode & 0xF000;
      if (v73 != 0x4000 && v73 != 0x8000)
      {
        v90 = SZGetLoggingHandle();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v262 = v66;
          *(_WORD *)&v262[8] = 1024;
          *(_DWORD *)v263 = v252.st_mode;
          _os_log_error_impl(&dword_1DD5BF000, v90, OS_LOG_TYPE_ERROR, "Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)", buf, 0x12u);
        }

        uint64_t v268 = *MEMORY[0x1E4F28328];
        id v269 = v66;
        v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v269 forKeys:&v268 count:1];
        _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 944, @"SZExtractorErrorDomain", 3, 0, v91, @"Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)", v92, (uint64_t)v66);
        id v42 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_67;
      }
      v217 = (unsigned int *)(v9 + 128);
      gid_t v250 = -1;
      uid_t v251 = -1;
      if ([v9 resolveOwnershipWithExtraField:0 outUID:&v251 outGID:&v250])
      {
        id v74 = v66;
        uint64_t v75 = (const char *)[v74 fileSystemRepresentation];
        if (lchown(v75, v251, v250))
        {
          id v224 = v66;
          int v76 = *__error();
          v77 = SZGetLoggingHandle();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v78 = [v74 fileSystemRepresentation];
            uid_t v218 = v251;
            gid_t v221 = v250;
            __int16 v79 = strerror(v76);
            *(_DWORD *)buf = 136316162;
            *(void *)v262 = v78;
            *(_WORD *)&v262[8] = 1024;
            *(_DWORD *)v263 = v218;
            *(_WORD *)&v263[4] = 1024;
            *(_DWORD *)&v263[6] = v221;
            LOWORD(v264) = 1024;
            *(_DWORD *)((char *)&v264 + 2) = v76;
            HIWORD(v264) = 2080;
            v265[0] = v79;
            _os_log_impl(&dword_1DD5BF000, v77, OS_LOG_TYPE_DEFAULT, "Failed to lchown %s to (%d:%d) : %d (%s)", buf, 0x28u);
          }

          id v66 = v224;
        }
      }
      if ((v252.st_mode & 0xF000) == 0x4000)
      {
        size_t __n = 0;
        v225 = v66;
        uint64_t v80 = [v66 stringByAppendingPathComponent:@"com.apple.StreamingUnzipResumptionData"];
        id v240 = 0;
        uint64_t v81 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v80 options:2 error:&v240];
        id v82 = v240;
        id v219 = v82;
        id v222 = (id)v81;
        v216 = (void *)v80;
        if (v81)
        {
          uint64_t v83 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v237 = 0;
          char v84 = [v83 removeItemAtPath:v80 error:&v237];
          id v215 = v237;

          if ((v84 & 1) == 0)
          {
            v85 = SZGetLoggingHandle();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v262 = v216;
              *(_WORD *)&v262[8] = 2112;
              *(void *)v263 = v215;
              _os_log_error_impl(&dword_1DD5BF000, v85, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
            }
          }
          id v236 = v228;
          id v58 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v222 error:&v236];
          id v42 = v236;

          [v58 setDecodingFailurePolicy:0];
          if (!v58)
          {
            v117 = SZGetLoggingHandle();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v262 = v42;
              _os_log_error_impl(&dword_1DD5BF000, v117, OS_LOG_TYPE_ERROR, "Failed to deserialize resumption data (%@); resuming from offset 0",
                buf,
                0xCu);
            }

            id v234 = v42;
            _RemoveAndRecreateDirectoryAtPath(v225, &v234);
            id v118 = v234;
            id v58 = 0;
            goto LABEL_193;
          }
          int v86 = [v58 decodeIntForKey:@"SerializationVersion"];
          if (v86 == 8)
          {
            v87 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOffset"];
            unint64_t v229 = [v87 unsignedLongLongValue];

            if (![*((id *)v9 + 12) count]) {
              goto LABEL_160;
            }
            unint64_t v88 = *((void *)v9 + 7);
            if (v88) {
              unint64_t v89 = v229 / v88;
            }
            else {
              unint64_t v89 = 0;
            }
            if (v89 < [*((id *)v9 + 12) count])
            {
              id v135 = v58;
              v136 = (const void *)[v135 decodeBytesForKey:@"HashContext" returnedLength:&__n];
              if (v136 && __n)
              {
                if (__n != gHashContextSizes[*v217])
                {
                  v184 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v208 = *v217;
                    v209 = gHashStringNames[v208];
                    v210 = (const char *)gHashContextSizes[v208];
                    *(_DWORD *)buf = 136315650;
                    *(void *)v262 = v209;
                    *(_WORD *)&v262[8] = 2048;
                    *(void *)v263 = __n;
                    *(_WORD *)&v263[8] = 2048;
                    v264 = v210;
                    _os_log_error_impl(&dword_1DD5BF000, v184, OS_LOG_TYPE_ERROR, "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                      buf,
                      0x20u);
                  }

                  id v232 = v42;
                  _RemoveAndRecreateDirectoryAtPath(v225, &v232);
                  v125 = v42;
                  id v42 = v232;
                  id v58 = v135;
                  goto LABEL_194;
                }
                memcpy(v9 + 136, v136, __n);
                unint64_t v137 = *((void *)v9 + 7);
                unint64_t v138 = v229;
                if (v137) {
                  unint64_t v138 = v229 % v137;
                }
                *((void *)v9 + 8) = v138;
              }
LABEL_160:
              uint64_t v139 = [v58 decodePropertyListForKey:@"StreamInfoDict"];
              v140 = (void *)*((void *)v9 + 43);
              *((void *)v9 + 43) = v139;

              v141 = (void *)*((void *)v9 + 43);
              if (v141)
              {
                v142 = [v141 objectForKeyedSubscript:@"RecordCount"];
                *((void *)v9 + 53) = [v142 unsignedLongLongValue];

                v143 = [*((id *)v9 + 43) objectForKeyedSubscript:@"TotalUncompressedBytes"];
                *((void *)v9 + 54) = [v143 unsignedLongLongValue];
              }
              uint64_t v144 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"LastChunkPartialHash"];
              v145 = (void *)*((void *)v9 + 44);
              *((void *)v9 + 44) = v144;

              v146 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"UnsureData"];
              uint64_t v147 = [v146 mutableCopy];
              v148 = (void *)*((void *)v9 + 45);
              *((void *)v9 + 45) = v147;

              v149 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"InMemoryFileData"];
              uint64_t v150 = [v149 mutableCopy];
              v151 = (void *)*((void *)v9 + 46);
              *((void *)v9 + 46) = v150;

              size_t __n = 0;
              id v58 = v58;
              uint64_t v152 = [v58 decodeBytesForKey:@"LocalFileRecord" returnedLength:&__n];
              if (v152)
              {
                size_t v153 = __n;
                if (__n)
                {
                  v154 = (const void *)v152;
                  v155 = (void *)*((void *)v9 + 47);
                  if (*((void *)v9 + 15) < __n)
                  {
                    v155 = reallocf(v155, __n);
                    *((void *)v9 + 47) = v155;
                    if (!v155)
                    {
                      v192 = SZGetLoggingHandle();
                      if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl(&dword_1DD5BF000, v192, OS_LOG_TYPE_ERROR, "Could not allocate memory for local file record", buf, 2u);
                      }

                      _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1160, (void *)*MEMORY[0x1E4F28798], 12, 0, 0, @"Could not allocate memory for local file record", v193, v214);
LABEL_230:
                      id v118 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_193;
                    }
                    size_t v153 = __n;
                    *((void *)v9 + 15) = __n;
                  }
                  memcpy(v155, v154, v153);
                }
              }
              v9[452] = (*(unsigned char *)(*((void *)v9 + 47) + 6) & 8) != 0;
              size_t __n = 0;
              id v58 = v58;
              if ([v58 decodeBytesForKey:@"DataDescriptorUnion" returnedLength:&__n] && __n)
              {
                *((void *)v9 + 48) = malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL);
                __memcpy_chk();
              }
              v156 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"StageBytesComplete"];
              *((void *)v9 + 50) = [v156 unsignedLongLongValue];

              *((void *)v9 + 51) = v229;
              v157 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"StreamState"];
              v9[450] = [v157 unsignedCharValue];

              v158 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentCRC32"];
              *((void *)v9 + 55) = [v158 unsignedLongValue];

              v159 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"RecordsProcessed"];
              *((void *)v9 + 52) = [v159 unsignedShortValue];

              v160 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"LocalFileMode"];
              *((_WORD *)v9 + 224) = [v160 unsignedShortValue] & 0xF1FF;

              v9[451] = [v58 decodeBoolForKey:@"StoreCurrentFileInMemory"];
              *((void *)v9 + 6) = *((void *)v9 + 51);
              if (v9[450] < 2u) {
                goto LABEL_195;
              }
              v161 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOutputFileOffset"];
              *((void *)v9 + 9) = [v161 unsignedLongLongValue];

              v162 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"TotalFileSizeWritten"];
              *((void *)v9 + 10) = [v162 unsignedLongLongValue];

              v163 = (_WORD *)*((void *)v9 + 47);
              if (v163)
              {
                uint64_t v164 = GetFileNameStringFromLocalFileRecord(v163);
                if (!v164)
                {
                  v189 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1DD5BF000, v189, OS_LOG_TYPE_ERROR, "Failed to get path from current local file record.", buf, 2u);
                  }

                  uint64_t v257 = *MEMORY[0x1E4F28328];
                  v258 = v225;
                  v190 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v258 forKeys:&v257 count:1];
                  _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1202, @"SZExtractorErrorDomain", 1, 0, v190, @"Failed to get path from current local file record.", v191, v214);
                  id v176 = (id)objc_claimAutoreleasedReturnValue();

                  v125 = v42;
                  goto LABEL_247;
                }
                v125 = (void *)v164;
                v230 = [v225 stringByAppendingPathComponent:v164];
                v165 = SZGetLoggingHandle();
                if (os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v206 = *((void *)v9 + 9);
                  *(_DWORD *)buf = 138412546;
                  *(void *)v262 = v230;
                  *(_WORD *)&v262[8] = 2048;
                  *(void *)v263 = v206;
                  _os_log_debug_impl(&dword_1DD5BF000, v165, OS_LOG_TYPE_DEBUG, "Resuming %@ at offset %lld", buf, 0x16u);
                }

                if ([v58 decodeBoolForKey:@"OpenCurrentOutputFile"])
                {
                  uint64_t v166 = v9[454];
                  id v231 = v42;
                  uint64_t v167 = +[StreamingFileWriter synchronousFileWriterForPath:v230 withOpenFlags:2 mode:0 quarantineInfo:0 performCachedWrites:v166 error:&v231];
                  id v168 = v231;

                  v169 = (void *)*((void *)v9 + 49);
                  *((void *)v9 + 49) = v167;

                  if (!*((void *)v9 + 49))
                  {
                    v201 = SZGetLoggingHandle();
                    if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v262 = v230;
                      _os_log_error_impl(&dword_1DD5BF000, v201, OS_LOG_TYPE_ERROR, "Failed to open output file at path %@", buf, 0xCu);
                    }

                    uint64_t v255 = *MEMORY[0x1E4F28328];
                    v256 = v230;
                    id v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v256 forKeys:&v255 count:1];
                    _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1213, @"SZExtractorErrorDomain", 1, v168, v42, @"Failed to open output file at path %@", v202, (uint64_t)v230);
                    goto LABEL_244;
                  }
                  id v42 = v168;
                }
                int v170 = *(unsigned __int16 *)(*((void *)v9 + 47) + 8);
                if (v170 != 8 && v170 != 99 && v170 != 14)
                {
LABEL_185:
                  if (!*((void *)v9 + 9)
                    || (v174 = (void *)*((void *)v9 + 49)) == 0
                    || (char v175 = objc_msgSend(v174, "setCurrentOffset:error:"),
                        id v176 = v42,
                        v42,
                        id v42 = v176,
                        (v175 & 1) != 0))
                  {

LABEL_194:
LABEL_195:

                    v178 = v216;
LABEL_196:

                    goto LABEL_69;
                  }
                  goto LABEL_246;
                }
                v171 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"SerializedCompressionState"];
                if (!v171)
                {
                  v195 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1DD5BF000, v195, OS_LOG_TYPE_ERROR, "Failed to get serialized compression state from save data", buf, 2u);
                  }

                  _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1222, @"SZExtractorErrorDomain", 1, 0, 0, @"Failed to get serialized compression state from save data", v196, v214);
                  id v176 = (id)objc_claimAutoreleasedReturnValue();
                  id v168 = 0;
                  goto LABEL_245;
                }
                id v168 = v171;
                size_t v172 = [v171 length];
                v173 = malloc_type_malloc(v172, 0xAB65AED1uLL);
                [v168 getBytes:v173 length:v172];
                if (compression_stream_is_state_valid())
                {
                  *((void *)v9 + 5) = v173;

                  goto LABEL_185;
                }
                v204 = SZGetLoggingHandle();
                if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1DD5BF000, v204, OS_LOG_TYPE_ERROR, "Compression save state was not valid.", buf, 2u);
                }

                _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1231, @"SZExtractorErrorDomain", 1, 0, 0, @"Compression save state was not valid.", v205, v214);
LABEL_244:
                id v176 = (id)objc_claimAutoreleasedReturnValue();
LABEL_245:

LABEL_246:
LABEL_247:
                id v42 = v176;
                goto LABEL_194;
              }
              v182 = SZGetLoggingHandle();
              if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v262 = v225;
                _os_log_error_impl(&dword_1DD5BF000, v182, OS_LOG_TYPE_ERROR, "Invalid state in resumption data at path %@", buf, 0xCu);
              }

              _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1377, @"SZExtractorErrorDomain", 1, 0, 0, @"Invalid state in resumption data at path %@", v183, (uint64_t)v225);
              goto LABEL_230;
            }
            v177 = SZGetLoggingHandle();
            if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
            {
              uint64_t v203 = [*((id *)v9 + 12) count];
              *(_DWORD *)buf = 134218240;
              *(void *)v262 = v89;
              *(_WORD *)&v262[8] = 2048;
              *(void *)v263 = v203;
              _os_log_error_impl(&dword_1DD5BF000, v177, OS_LOG_TYPE_ERROR, "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            id v233 = v42;
            _RemoveAndRecreateDirectoryAtPath(v225, &v233);
            v121 = v233;
          }
          else
          {
            int v119 = v86;
            v120 = SZGetLoggingHandle();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v262 = v119;
              *(_WORD *)&v262[4] = 1024;
              *(_DWORD *)&v262[6] = 8;
              *(_WORD *)v263 = 2112;
              *(void *)&v263[2] = v225;
              _os_log_error_impl(&dword_1DD5BF000, v120, OS_LOG_TYPE_ERROR, "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            id v235 = v42;
            _RemoveAndRecreateDirectoryAtPath(v225, &v235);
            v121 = v235;
          }
          id v118 = v121;
LABEL_193:
          v125 = v42;
          id v42 = v118;
          goto LABEL_194;
        }
        v114 = (void *)*MEMORY[0x1E4F281F8];
        v115 = [v82 domain];
        if (v114 == v115)
        {
          uint64_t v122 = [v219 code];

          if (v122 == 260)
          {
LABEL_138:
            v124 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v239 = v228;
            v125 = [v124 contentsOfDirectoryAtPath:v225 error:&v239];
            id v126 = v239;

            if (v125 && ![v125 count])
            {
              id v42 = 0;
            }
            else
            {
              id v238 = v126;
              _RemoveAndRecreateDirectoryAtPath(v225, &v238);
              id v42 = v238;
            }

            id v215 = 0;
            id v58 = 0;
            goto LABEL_194;
          }
        }
        else
        {
        }
        v123 = SZGetLoggingHandle();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v262 = v216;
          *(_WORD *)&v262[8] = 2112;
          *(void *)v263 = v219;
          _os_log_error_impl(&dword_1DD5BF000, v123, OS_LOG_TYPE_ERROR, "Failed to read resumption data from path %@: %@; starting from offset 0",
            buf,
            0x16u);
        }

        goto LABEL_138;
      }
      off_t st_size = v252.st_size;
      id v94 = v66;
      ssize_t v95 = getxattr((const char *)[v94 fileSystemRepresentation], "com.apple.StreamingPassthroughResumptionData", 0, 0, 0, 1);
      if (v95 == -1)
      {
        if (*__error() == 2 || *__error() == 93)
        {
          id v249 = v228;
          _RemoveAndRecreateDirectoryAtPath(v94, &v249);
          id v42 = v249;

          goto LABEL_68;
        }
        uint64_t v130 = *__error();
        v131 = SZGetLoggingHandle();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
        {
          v194 = strerror(v130);
          *(_DWORD *)buf = 136315650;
          *(void *)v262 = "com.apple.StreamingPassthroughResumptionData";
          *(_WORD *)&v262[8] = 2112;
          *(void *)v263 = v94;
          *(_WORD *)&v263[8] = 2080;
          v264 = v194;
          _os_log_error_impl(&dword_1DD5BF000, v131, OS_LOG_TYPE_ERROR, "Failed to get size of xattr %s from path %@: %s", buf, 0x20u);
        }

        v132 = (void *)*MEMORY[0x1E4F28798];
        uint64_t v266 = *MEMORY[0x1E4F28328];
        id v267 = v94;
        uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v267 forKeys:&v266 count:1];
        strerror(v130);
        _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 976, v132, v130, 0, v71, @"Failed to get size of xattr %s from path %@: %s", v133, (uint64_t)"com.apple.StreamingPassthroughResumptionData");
        goto LABEL_66;
      }
      size_t v96 = v95;
      if (v95 < 1 || ![*((id *)v9 + 12) count])
      {
        id v58 = 0;
        id v101 = v228;
        goto LABEL_115;
      }
      v97 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v96];
      [v97 setLength:v96];
      id v223 = v94;
      v98 = (const char *)[v223 fileSystemRepresentation];
      id v226 = v97;
      ssize_t v99 = getxattr(v98, "com.apple.StreamingPassthroughResumptionData", (void *)[v226 mutableBytes], v96, 0, 1);
      if (v99 == v96)
      {
        id v220 = v223;
        if (removexattr((const char *)[v220 fileSystemRepresentation], "com.apple.StreamingPassthroughResumptionData", 1))
        {
          v100 = SZGetLoggingHandle();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            uint64_t v198 = [v220 fileSystemRepresentation];
            v199 = __error();
            v200 = strerror(*v199);
            *(_DWORD *)buf = 136315650;
            *(void *)v262 = "com.apple.StreamingPassthroughResumptionData";
            *(_WORD *)&v262[8] = 2080;
            *(void *)v263 = v198;
            *(_WORD *)&v263[8] = 2080;
            v264 = v200;
            _os_log_error_impl(&dword_1DD5BF000, v100, OS_LOG_TYPE_ERROR, "Failed to remove EA %s from %s: %s", buf, 0x20u);
          }
        }
        id v247 = v228;
        id v58 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v226 error:&v247];
        id v101 = v247;

        [v58 setDecodingFailurePolicy:0];
        if (v58)
        {
          int v102 = [v58 decodeIntForKey:@"SerializationVersion"];
          if (v102 == 8)
          {
            unint64_t v103 = *((void *)v9 + 7);
            if (v103) {
              unint64_t v104 = (st_size - (unint64_t)(st_size > 0)) / v103;
            }
            else {
              unint64_t v104 = 0;
            }
            if (v104 < [*((id *)v9 + 12) count])
            {
              size_t __n = 0;
              id v58 = v58;
              v185 = (const void *)[v58 decodeBytesForKey:@"HashContext" returnedLength:&__n];
              if (!v185 || !__n)
              {
LABEL_217:

LABEL_115:
                v9[450] = 5;
                *((void *)v9 + 6) = st_size;
                v105 = (void *)*((void *)v9 + 45);
                *((void *)v9 + 45) = 0;

                v106 = (void *)*((void *)v9 + 46);
                *((void *)v9 + 46) = 0;

                *((void *)v9 + 51) = st_size;
                uint64_t v107 = v9[454];
                id v241 = v101;
                uint64_t v108 = +[StreamingFileWriter synchronousFileWriterForPath:v94 withOpenFlags:9 mode:0 quarantineInfo:0 performCachedWrites:v107 error:&v241];
                id v42 = v241;

                v109 = (void *)*((void *)v9 + 49);
                *((void *)v9 + 49) = v108;

                if (!*((void *)v9 + 49))
                {
                  v110 = SZGetLoggingHandle();
                  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v262 = v94;
                    _os_log_error_impl(&dword_1DD5BF000, v110, OS_LOG_TYPE_ERROR, "Failed to open output file at path %@", buf, 0xCu);
                  }

                  uint64_t v259 = *MEMORY[0x1E4F28328];
                  id v260 = v94;
                  v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v260 forKeys:&v259 count:1];
                  uint64_t v113 = _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1060, @"SZExtractorErrorDomain", 1, v42, v111, @"Failed to open output file at path %@", v112, (uint64_t)v94);

                  id v42 = (id)v113;
                }
                goto LABEL_69;
              }
              if (__n == gHashContextSizes[*v217])
              {
                memcpy(v9 + 136, v185, __n);
                unint64_t v186 = *((void *)v9 + 7);
                unint64_t v187 = st_size;
                if (v186) {
                  unint64_t v187 = st_size % v186;
                }
                *((void *)v9 + 8) = v187;
                goto LABEL_217;
              }
              v197 = SZGetLoggingHandle();
              if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
              {
                uint64_t v211 = *v217;
                v212 = gHashStringNames[v211];
                v213 = (const char *)gHashContextSizes[v211];
                *(_DWORD *)buf = 136315650;
                *(void *)v262 = v212;
                *(_WORD *)&v262[8] = 2048;
                *(void *)v263 = __n;
                *(_WORD *)&v263[8] = 2048;
                v264 = v213;
                _os_log_error_impl(&dword_1DD5BF000, v197, OS_LOG_TYPE_ERROR, "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                  buf,
                  0x20u);
              }

              id v242 = v101;
              _RemoveAndRecreateDirectoryAtPath(v220, &v242);
              id v42 = v242;

LABEL_223:
              v178 = v226;
              goto LABEL_196;
            }
            v188 = SZGetLoggingHandle();
            if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
            {
              uint64_t v207 = [*((id *)v9 + 12) count];
              *(_DWORD *)buf = 134218240;
              *(void *)v262 = v104;
              *(_WORD *)&v262[8] = 2048;
              *(void *)v263 = v207;
              _os_log_error_impl(&dword_1DD5BF000, v188, OS_LOG_TYPE_ERROR, "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            id v244 = v101;
            v129 = &v244;
          }
          else
          {
            int v180 = v102;
            v181 = SZGetLoggingHandle();
            if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v262 = v180;
              *(_WORD *)&v262[4] = 1024;
              *(_DWORD *)&v262[6] = 8;
              *(_WORD *)v263 = 2112;
              *(void *)&v263[2] = v220;
              _os_log_error_impl(&dword_1DD5BF000, v181, OS_LOG_TYPE_ERROR, "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            id v246 = v101;
            v129 = &v246;
          }
        }
        else
        {
          v179 = SZGetLoggingHandle();
          if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v262 = v101;
            _os_log_error_impl(&dword_1DD5BF000, v179, OS_LOG_TYPE_ERROR, "Unable to deserialize resumption data (%@); resuming from offset 0",
              buf,
              0xCu);
          }

          id v58 = 0;
          id v245 = v101;
          v129 = &v245;
        }
        id v228 = v101;
      }
      else
      {
        ssize_t v127 = v99;
        v128 = SZGetLoggingHandle();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218754;
          *(void *)v262 = v96;
          *(_WORD *)&v262[8] = 2048;
          *(void *)v263 = v127;
          *(_WORD *)&v263[8] = 2080;
          v264 = "com.apple.StreamingPassthroughResumptionData";
          LOWORD(v265[0]) = 2112;
          *(void *)((char *)v265 + 2) = v223;
          _os_log_error_impl(&dword_1DD5BF000, v128, OS_LOG_TYPE_ERROR, "Expected to read %ld bytes but got %ld for EA %s on %@; resuming from offset 0",
            buf,
            0x2Au);
        }

        id v58 = 0;
        id v248 = v228;
        v129 = &v248;
      }
      _RemoveAndRecreateDirectoryAtPath(v223, v129);
      id v42 = *v129;

      goto LABEL_223;
    }
  }
  else
  {
  }
  v39 = SZGetLoggingHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v262 = v10;
    _os_log_error_impl(&dword_1DD5BF000, v39, OS_LOG_TYPE_ERROR, "Options dictionary supplied has one or more options with an incorrect type: %@", buf, 0xCu);
  }

  v41 = _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 864, @"SZExtractorErrorDomain", 2, 0, 0, @"Options dictionary supplied has one or more options with an incorrect type: %@", v40, (uint64_t)v10);
  id v42 = v41;
  if (!a4) {
    goto LABEL_40;
  }
  id v43 = v41;
  id v42 = v43;
LABEL_38:
  uint64_t v47 = 0;
  *a4 = v43;
LABEL_41:

LABEL_42:
  return v47;
}

@end