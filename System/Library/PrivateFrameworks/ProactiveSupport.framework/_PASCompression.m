@interface _PASCompression
+ (id)_compress:(id)a3 fast:(BOOL)a4 lowMemory:(BOOL)a5;
+ (id)compress:(id)a3 fast:(BOOL)a4;
+ (id)compress:(id)a3 lowMemory:(BOOL)a4;
+ (id)decompress:(id)a3;
+ (id)decompress:(id)a3 maxLength:(int64_t)a4;
+ (id)fastCompress:(id)a3;
@end

@implementation _PASCompression

+ (id)decompress:(id)a3 maxLength:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSString stringWithUTF8String:"+[_PASCompression decompress:maxLength:]"];
    [v18 handleFailureInFunction:v19, @"_PASCompression.m", 93, @"Invalid parameter not satisfying: %@", @"data" file lineNumber description];
  }
  if ((unint64_t)[v5 length] < 8) {
    goto LABEL_20;
  }
  id v6 = v5;
  v7 = (uint64_t *)[v6 bytes];
  v8 = v7 + 1;
  uint64_t v9 = *v7;
  uint64_t v10 = [v6 length];
  if ((a4 & 0x8000000000000000) == 0 && v9 >> 2 > (unint64_t)a4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v23 = v9 >> 2;
      __int16 v24 = 2048;
      int64_t v25 = a4;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Decompressed data size %u greater than limit %li", buf, 0x12u);
    }
    goto LABEL_20;
  }
  size_t v11 = v10 - 8;
  if (HIDWORD(v9) == adler32(0xFFFFFFFFFFFFFFFFLL, (const Bytef *)v8, (int)v10 - 8))
  {
    size_t v12 = v9 >> 2;
    v13 = (uint8_t *)malloc_type_malloc(v12, 0xBEAF573DuLL);
    if (v13)
    {
      v14 = v13;
      if ((v9 & 1) == 0)
      {
        if (v11 != v12)
        {
          v20 = [MEMORY[0x1E4F28B00] currentHandler];
          v21 = [NSString stringWithUTF8String:"+[_PASCompression decompress:maxLength:]"];
          [v20 handleFailureInFunction:v21, @"_PASCompression.m", 122, @"Invalid parameter not satisfying: %@", @"compressedLen == hdr.length" file lineNumber description];
        }
        memcpy(v14, v8, v11);
        goto LABEL_18;
      }
      if ((v9 & 2) != 0) {
        compression_algorithm v15 = COMPRESSION_LZ4;
      }
      else {
        compression_algorithm v15 = COMPRESSION_LZFSE;
      }
      if (compression_decode_buffer(v13, v9 >> 2, (const uint8_t *)v8, v11, 0, v15) == v12)
      {
LABEL_18:
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v14 length:v12 freeWhenDone:1];
        goto LABEL_21;
      }
      free(v14);
    }
  }
LABEL_20:
  v16 = 0;
LABEL_21:

  return v16;
}

+ (id)decompress:(id)a3
{
  return (id)[a1 decompress:a3 maxLength:-1];
}

+ (id)_compress:(id)a3 fast:(BOOL)a4 lowMemory:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if (!v7)
  {
    unsigned int v23 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v24 = [NSString stringWithUTF8String:"+[_PASCompression _compress:fast:lowMemory:]"];
    [v23 handleFailureInFunction:v24, @"_PASCompression.m", 48, @"Invalid parameter not satisfying: %@", @"data" file lineNumber description];
  }
  unint64_t v8 = [v7 length];
  if (v8 >= 0x3FFFFFFF)
  {
    int64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v26 = [NSString stringWithUTF8String:"+[_PASCompression _compress:fast:lowMemory:]"];
    [v25 handleFailureInFunction:v26, @"_PASCompression.m", 50, @"Invalid parameter not satisfying: %@", @"uncompressedLen < 0x3fffffff" file lineNumber description];
  }
  unint64_t v9 = v8 + 8;
  uint64_t v10 = (Bytef *)malloc_type_malloc(v8 + 8, 0xD04F404EuLL);
  if (!v10) {
    goto LABEL_17;
  }
  size_t v11 = v10;
  if (v5) {
    int v12 = 2050;
  }
  else {
    int v12 = 2049;
  }
  uint64_t v13 = 3;
  if (!v6) {
    uint64_t v13 = 1;
  }
  unint64_t v14 = (4 * v8) | (unint64_t)v13;
  if (v6) {
    compression_algorithm v15 = COMPRESSION_LZ4;
  }
  else {
    compression_algorithm v15 = v12;
  }
  v16 = v10 + 8;
  id v17 = v7;
  size_t v18 = compression_encode_buffer(v16, v8, (const uint8_t *)[v17 bytes], v8, 0, v15);
  if (!v18)
  {
    unint64_t v14 = v14 & 0xFFFFFFFE;
    memcpy(v16, (const void *)[v17 bytes], v8);
    goto LABEL_19;
  }
  int v19 = v18;
  unint64_t v9 = v18 + 8;
  v20 = (Bytef *)reallocf(v11, v18 + 8);
  if (!v20)
  {
LABEL_17:
    v21 = 0;
    goto LABEL_20;
  }
  size_t v11 = v20;
  LODWORD(v8) = v19;
LABEL_19:
  *(void *)size_t v11 = v14 | (adler32(0xFFFFFFFFFFFFFFFFLL, v11 + 8, v8) << 32);
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v11 length:v9 freeWhenDone:1];
LABEL_20:

  return v21;
}

+ (id)fastCompress:(id)a3
{
  return (id)[a1 _compress:a3 fast:1 lowMemory:1];
}

+ (id)compress:(id)a3 lowMemory:(BOOL)a4
{
  return (id)[a1 _compress:a3 fast:0 lowMemory:a4];
}

+ (id)compress:(id)a3 fast:(BOOL)a4
{
  return (id)[a1 _compress:a3 fast:a4 lowMemory:0];
}

@end