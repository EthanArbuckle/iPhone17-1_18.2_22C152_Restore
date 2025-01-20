@interface StreamingUnzipState
+ (id)unzipStateWithPath:(id)a3 options:(id)a4 error:(id *)a5;
- ($0D3C1E37657F372F14ECFE6037DF0E3C)hashContext;
- ($28C85FEACD5EC75055F594F8EA6B105C)currentLFRecord;
- ($3D4EAA8493105C00966F4ACD86F8204A)dataDescriptor;
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

- ($3D4EAA8493105C00966F4ACD86F8204A)dataDescriptor
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

- ($28C85FEACD5EC75055F594F8EA6B105C)currentLFRecord
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

- ($0D3C1E37657F372F14ECFE6037DF0E3C)hashContext
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
    unsigned int var0 = a3->var4.var0;
    uint64_t v9 = a3->var5.var0;
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
    uint64_t v9 = 0xFFFFFFFFLL;
    unsigned int var0 = -1;
  }
  v11 = [(StreamingUnzipState *)self overrideUID];
  uint64_t v12 = [(StreamingUnzipState *)self overrideGID];
  v13 = (void *)v12;
  if (v11)
  {
    unsigned int var0 = [v11 unsignedIntValue];
    if (!v13) {
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v9 = (uint64_t)[v13 unsignedIntValue];
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
      uint64_t v17 = +[NSNumber numberWithUnsignedInt:v9];
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
    long long v4 = sub_100003788();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Finishing an incomplete stream! This stream will not be resumable.", (uint8_t *)&v8, 2u);
    }

    uint64_t v3 = sub_100004A7C((uint64_t)"-[StreamingUnzipState finishStream]", 568, @"SZExtractorErrorDomain", 3, 0, 0, @"Finishing an incomplete stream! This stream will not be resumable.", v5, v8);
    goto LABEL_7;
  }
  if (self->_bytesHashedInChunk)
  {
    uint64_t v3 = sub_1000136DC((uint64_t)self, self->_currentOffset);
LABEL_7:
    long long v6 = (void *)v3;
    goto LABEL_8;
  }
  long long v6 = 0;
LABEL_8:
  [(StreamingUnzipState *)self setStreamState:7];

  return v6;
}

- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5
{
  return [(StreamingUnzipState *)self updateHashFromOffset:a3 withBytes:a4 length:a5 onlyFinishCurrentChunk:0];
}

- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5 onlyFinishCurrentChunk:(BOOL)a6
{
  id hashes = self->_hashes;
  if (hashes)
  {
    id hashes = [hashes count];
    if (hashes)
    {
      if (self->_hashedChunkSize || [(NSArray *)self->_hashes count] < 2)
      {
        if (a5)
        {
          while (1)
          {
            unint64_t hashedChunkSize = self->_hashedChunkSize;
            unint64_t v15 = a5;
            if (hashedChunkSize
              && ((unint64_t bytesHashedInChunk = self->_bytesHashedInChunk, a5 >= hashedChunkSize - bytesHashedInChunk)
                ? (unint64_t v15 = hashedChunkSize - bytesHashedInChunk)
                : (unint64_t v15 = a5),
                  !v15))
            {
              self->_unint64_t bytesHashedInChunk = bytesHashedInChunk;
            }
            else
            {
              unint64_t v17 = v15;
              do
              {
                if (v17 >= 0xFFFFFFFF) {
                  uint64_t v18 = 0xFFFFFFFFLL;
                }
                else {
                  uint64_t v18 = v17;
                }
                switch(self->_hashContext.hashType)
                {
                  case 0:
                    CC_MD5_Update(&self->_hashContext.context.md5, a4, v18);
                    break;
                  case 1:
                    CC_SHA1_Update((CC_SHA1_CTX *)&self->_hashContext.context, a4, v18);
                    break;
                  case 4:
                    CC_SHA224_Update((CC_SHA256_CTX *)&self->_hashContext.context, a4, v18);
                    break;
                  case 5:
                    CC_SHA256_Update((CC_SHA256_CTX *)&self->_hashContext.context, a4, v18);
                    break;
                  case 6:
                    CC_SHA384_Update((CC_SHA512_CTX *)&self->_hashContext.context, a4, v18);
                    break;
                  case 7:
                    CC_SHA512_Update((CC_SHA512_CTX *)&self->_hashContext.context, a4, v18);
                    break;
                  default:
                    break;
                }
                v17 -= v18;
              }
              while (v17);
              unint64_t hashedChunkSize = self->_hashedChunkSize;
              unint64_t bytesHashedInChunk = self->_bytesHashedInChunk + v15;
              self->_unint64_t bytesHashedInChunk = bytesHashedInChunk;
              if (!hashedChunkSize) {
                break;
              }
              a4 = (char *)a4 + v15;
              a5 -= v15;
              a3 += v15;
            }
            if (bytesHashedInChunk > hashedChunkSize) {
              __assert_rtn("-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]", "StreamingUnzipState.m", 534, "_bytesHashedInChunk <= _hashedChunkSize");
            }
            if (bytesHashedInChunk == hashedChunkSize)
            {
              sub_1000136DC((uint64_t)self, a3 - hashedChunkSize);
              id hashes = (id)objc_claimAutoreleasedReturnValue();
              if (hashes) {
                goto LABEL_37;
              }
              sub_100003B10((uint64_t)&self->_hashContext, self->_hashContext.hashType);
              id hashes = 0;
              self->_unint64_t bytesHashedInChunk = 0;
              if (a6 || !a5) {
                goto LABEL_37;
              }
            }
            else if (!a5)
            {
              break;
            }
          }
        }
        id hashes = 0;
      }
      else
      {
        v11 = sub_100003788();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          unint64_t v20 = self->_hashedChunkSize;
          NSUInteger v21 = [(NSArray *)self->_hashes count];
          *(_DWORD *)buf = 134218240;
          unint64_t v24 = v20;
          __int16 v25 = 2048;
          NSUInteger v26 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes", buf, 0x16u);
        }

        unint64_t v12 = self->_hashedChunkSize;
        [(NSArray *)self->_hashes count];
        sub_100004A7C((uint64_t)"-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]", 508, @"SZExtractorErrorDomain", 4, 0, 0, @"Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes", v13, v12);
        id hashes = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
LABEL_37:

  return hashes;
}

- (id)checkLastChunkPartialHash
{
  uint64_t v3 = qword_10001DB98[self->_hashContext.hashType];
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
  sub_100003BD0((unsigned __int8 *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v20);
  int v10 = sub_10000F59C((unsigned __int8 *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  id v11 = [v10 caseInsensitiveCompare:self->_lastChunkPartialHash];
  unint64_t v12 = sub_100003788();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      lastChunkPartialHash = self->_lastChunkPartialHash;
      *(_DWORD *)buf = 138412546;
      __int16 v25 = lastChunkPartialHash;
      __int16 v26 = 2112;
      v27 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Hash mismatch for last partial chunk: expected %@, got %@", buf, 0x16u);
    }

    CFStringRef v22 = @"SZExtractorFileOffsetErrorKey";
    id v14 = +[NSNumber numberWithUnsignedLongLong:self->_currentOffset];
    v23 = v14;
    unint64_t v15 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    unint64_t v17 = sub_100004A7C((uint64_t)"-[StreamingUnzipState checkLastChunkPartialHash]", 491, @"SZExtractorErrorDomain", 2, 0, v15, @"Hash mismatch for last partial chunk: expected %@, got %@", v16, (uint64_t)self->_lastChunkPartialHash);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v25 = (NSString *)v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Verified that last chunk partial hash matches: %@", buf, 0xCu);
    }

    unint64_t v17 = 0;
    self->_unint64_t bytesHashedInChunk = 0;
  }

  return v17;
}

- (id)serializeState
{
  if (!self->_currentOffset) {
    goto LABEL_48;
  }
  fileWriter = self->_fileWriter;
  if (fileWriter)
  {
    id v65 = 0;
    unsigned int v5 = [(StreamingFileWriter *)fileWriter suspendWithError:&v65];
    id v6 = v65;
    v2 = v6;
    if (!v5) {
      goto LABEL_54;
    }
  }
  if (self->_streamState != 5)
  {
    id v9 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v9 setOutputFormat:200];
    [v9 encodeInt:8 forKey:@"SerializationVersion"];
    id hashes = self->_hashes;
    if (hashes && [(NSArray *)hashes count]) {
      [v9 encodeBytes:&self->_hashContext.context length:qword_10001DB58[self->_hashContext.hashType] forKey:@"HashContext"];
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
    unint64_t v17 = +[NSNumber numberWithUnsignedLongLong:self->_thisStageBytesComplete];
    [v9 encodeObject:v17 forKey:@"StageBytesComplete"];

    uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:self->_currentOffset];
    [v9 encodeObject:v18 forKey:@"CurrentOffset"];

    unsigned int v19 = self->_fileWriter;
    if (v19)
    {
      id v64 = 0;
      id v20 = [(StreamingFileWriter *)v19 currentOffsetWithError:&v64];
      id v21 = v64;
      CFStringRef v22 = v21;
      if (v20 == (id)-1)
      {
        v47 = sub_100003788();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Unable to get current output offset from current output file", buf, 2u);
        }

        NSErrorUserInfoKey v72 = NSFilePathErrorKey;
        v48 = sub_10000EEE0(self->_currentLFRecord->var0);
        v73 = v48;
        v50 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        v51 = @"Unable to get current output offset from current output file";
        uint64_t v52 = 395;
      }
      else
      {
        if (v20 == self->_uncompressedBytesOutput)
        {

          goto LABEL_24;
        }
        v54 = sub_100003788();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          unint64_t uncompressedBytesOutput = self->_uncompressedBytesOutput;
          *(_DWORD *)buf = 134218240;
          v77 = (const char *)uncompressedBytesOutput;
          __int16 v78 = 2048;
          unint64_t v79 = (unint64_t)v20;
          _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)", buf, 0x16u);
        }

        NSErrorUserInfoKey v70 = NSFilePathErrorKey;
        v48 = sub_10000EEE0(self->_currentLFRecord->var0);
        v71 = v48;
        v50 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
        unint64_t v62 = self->_uncompressedBytesOutput;
        v51 = @"Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)";
        uint64_t v52 = 397;
      }
      v2 = sub_100004A7C((uint64_t)"-[StreamingUnzipState serializeState]", v52, @"SZExtractorErrorDomain", 1, v22, v50, v51, v49, v62);

      goto LABEL_53;
    }
LABEL_24:
    v23 = +[NSNumber numberWithUnsignedLongLong:self->_uncompressedBytesOutput];
    [v9 encodeObject:v23 forKey:@"CurrentOutputFileOffset"];

    unint64_t v24 = +[NSNumber numberWithUnsignedLongLong:self->_totalFileSizeWritten];
    [v9 encodeObject:v24 forKey:@"TotalFileSizeWritten"];

    __int16 v25 = +[NSNumber numberWithUnsignedLong:self->_currentCRC32];
    [v9 encodeObject:v25 forKey:@"CurrentCRC32"];

    state = self->_cmpState.state;
    if (state)
    {
      v27 = +[NSData dataWithBytesNoCopy:state length:compression_stream_get_state_size() freeWhenDone:0];
      [v9 encodeObject:v27 forKey:@"SerializedCompressionState"];
    }
    [v9 encodeBool:self->_fileWriter != 0 forKey:@"OpenCurrentOutputFile"];
    v28 = +[NSNumber numberWithUnsignedLongLong:self->_recordsProcessed];
    [v9 encodeObject:v28 forKey:@"RecordsProcessed"];

    v29 = +[NSNumber numberWithUnsignedShort:self->_currentLFMode];
    [v9 encodeObject:v29 forKey:@"LocalFileMode"];

    v30 = +[NSNumber numberWithUnsignedChar:self->_streamState];
    [v9 encodeObject:v30 forKey:@"StreamState"];

    [v9 encodeBool:self->_storeCurrentFileInMemory forKey:@"StoreCurrentFileInMemory"];
    v31 = [v9 encodedData];
    v32 = [(NSString *)self->_unzipPath stringByAppendingPathComponent:@"com.apple.StreamingUnzipResumptionData"];
    v33 = sub_100003788();
    v34 = v33;
    if (v31)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v59 = (const char *)[v31 length];
        unint64_t currentOffset = self->_currentOffset;
        *(_DWORD *)buf = 134218240;
        v77 = v59;
        __int16 v78 = 2048;
        unint64_t v79 = currentOffset;
        _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Serializing %lu bytes of resumption data for offset %llu", buf, 0x16u);
      }

      id v63 = 0;
      int v35 = 1;
      unsigned __int8 v36 = [v31 writeToFile:v32 options:1 error:&v63];
      id v37 = v63;
      if (v36)
      {
LABEL_47:

        if (!v35) {
          goto LABEL_54;
        }
        goto LABEL_48;
      }
      v38 = sub_100003788();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v77 = (const char *)v32;
        __int16 v78 = 2112;
        unint64_t v79 = (unint64_t)v37;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to save resumption data to path %@: %@", buf, 0x16u);
      }

      NSErrorUserInfoKey v66 = NSFilePathErrorKey;
      v67 = v32;
      v39 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      v2 = sub_100004A7C((uint64_t)"-[StreamingUnzipState serializeState]", 431, @"SZExtractorErrorDomain", 1, v37, v39, @"Failed to save resumption data to path %@: %@", v40, (uint64_t)v32);
    }
    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v77 = (const char *)v32;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to create archive for resumption data to path %@", buf, 0xCu);
      }

      NSErrorUserInfoKey v68 = NSFilePathErrorKey;
      v69 = v32;
      id v37 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      v2 = sub_100004A7C((uint64_t)"-[StreamingUnzipState serializeState]", 424, @"SZExtractorErrorDomain", 1, 0, v37, @"Failed to create archive for resumption data to path %@", v53, (uint64_t)v32);
    }
    int v35 = 0;
    goto LABEL_47;
  }
  long long v7 = self->_hashes;
  if (!v7 || ![(NSArray *)v7 count])
  {
    id v9 = (id)objc_opt_new();
    if (!v9) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
  id v8 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v8 setOutputFormat:200];
  [v8 encodeInt:8 forKey:@"SerializationVersion"];
  [v8 encodeBytes:&self->_hashContext.context length:qword_10001DB58[self->_hashContext.hashType] forKey:@"HashContext"];
  id v9 = [v8 encodedData];

  if (v9)
  {
LABEL_34:
    v41 = [(NSString *)self->_unzipPath fileSystemRepresentation];
    id v42 = v9;
    if (setxattr(v41, "com.apple.StreamingPassthroughResumptionData", [v42 bytes], (size_t)objc_msgSend(v42, "length"), 0, 1))
    {
      uint64_t v43 = *__error();
      v44 = sub_100003788();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        unzipPath = self->_unzipPath;
        v57 = strerror(v43);
        *(_DWORD *)buf = 136315650;
        v77 = "com.apple.StreamingPassthroughResumptionData";
        __int16 v78 = 2112;
        unint64_t v79 = (unint64_t)unzipPath;
        __int16 v80 = 2080;
        v81 = v57;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to set passthrough EA %s on path %@: %s", buf, 0x20u);
      }

      v45 = self->_unzipPath;
      NSErrorUserInfoKey v74 = NSFilePathErrorKey;
      v75 = v45;
      unint64_t v12 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      strerror(v43);
      sub_100004A7C((uint64_t)"-[StreamingUnzipState serializeState]", 367, NSPOSIXErrorDomain, v43, 0, v12, @"Failed to set passthrough EA %s on path %@: %s", v46, (uint64_t)"com.apple.StreamingPassthroughResumptionData");
      goto LABEL_38;
    }

LABEL_48:
    v2 = 0;
    goto LABEL_54;
  }
LABEL_9:
  int v10 = sub_100003788();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v58 = self->_unzipPath;
    *(_DWORD *)buf = 138412290;
    v77 = (const char *)v58;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create archive for passthrough EA on path %@", buf, 0xCu);
  }

  id v11 = self->_unzipPath;
  NSErrorUserInfoKey v82 = NSFilePathErrorKey;
  v83 = v11;
  unint64_t v12 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
  sub_100004A7C((uint64_t)"-[StreamingUnzipState serializeState]", 362, @"SZExtractorErrorDomain", 1, 0, v12, @"Failed to create archive for passthrough EA on path %@", v13, (uint64_t)self->_unzipPath);
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
  self->_thisStageBytesComplete = 0;
  stat v5 = sub_100003788();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t streamState = self->_streamState;
    if (streamState > 8) {
      CFStringRef v18 = @"Unknown";
    }
    else {
      CFStringRef v18 = off_100028B70[streamState];
    }
    if (v3 > 8) {
      CFStringRef v19 = @"Unknown";
    }
    else {
      CFStringRef v19 = off_100028B70[v3];
    }
    int v20 = 138412546;
    CFStringRef v21 = v18;
    __int16 v22 = 2112;
    CFStringRef v23 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Updating stream state from %@ to %@", (uint8_t *)&v20, 0x16u);
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
        id v9 = self->_fileWriter;
        self->_fileWriter = 0;
      }
      dataDescriptor = self->_dataDescriptor;
      if (dataDescriptor)
      {
        *(void *)dataDescriptor->unsigned int var0 = 0;
        *(void *)&dataDescriptor->var1.var0.var0.unsigned int var0 = 0;
        dataDescriptor->var1.var0.var1.unsigned int var0 = 0;
      }
      currentLFRecord = self->_currentLFRecord;
      *(void *)currentLFRecord->unsigned int var0 = 0;
      *(void *)&currentLFRecord->var3.unsigned int var0 = 0;
      *(void *)((char *)&currentLFRecord->var6.var0 + 2) = 0;
      *(void *)&currentLFRecord->var5.unsigned int var0 = 0;
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
      unint64_t v12 = self->_fileWriter;
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
  id v9 = sub_10001505C([StreamingUnzipState alloc], v7, v8, 0);
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    id v15 = 0;
    int v11 = sub_100017334(v7, &v15);
    id v10 = v15;
    if (v11)
    {
      id v14 = v10;
      id v9 = sub_10001505C([StreamingUnzipState alloc], v7, v8, &v14);
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

@end