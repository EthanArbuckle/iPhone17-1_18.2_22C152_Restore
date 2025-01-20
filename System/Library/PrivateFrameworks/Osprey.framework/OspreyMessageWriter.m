@interface OspreyMessageWriter
- (void)writeMessageData:(id)a3 toStream:(id)a4 compressionEnabled:(BOOL)a5 error:(id *)a6;
@end

@implementation OspreyMessageWriter

- (void)writeMessageData:(id)a3 toStream:(id)a4 compressionEnabled:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v7)
  {
    v11 = [[OspreyZlibDataCompressor alloc] initWithOptions:31];
    v12 = (void *)[v9 _createDispatchData];
    id v23 = 0;
    v13 = [(OspreyZlibDataCompressor *)v11 compressedDataForData:v12 error:&v23];
    id v14 = v23;

    if (v13)
    {
      v15 = LengthPrefixedMessageFromData(v13, 1);

      if (!v15) {
        goto LABEL_18;
      }
      goto LABEL_6;
    }
    OspreyLoggingInit();
    v22 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
    {
      -[OspreyMessageWriter writeMessageData:toStream:compressionEnabled:error:](v22, v14);
      if (!a6) {
        goto LABEL_16;
      }
    }
    else if (!a6)
    {
LABEL_16:

LABEL_17:
      goto LABEL_18;
    }
    *a6 = v14;
    goto LABEL_16;
  }
  v15 = LengthPrefixedMessageFromData(v9, 0);
  if (v15)
  {
LABEL_6:
    id v14 = v15;
    if (objc_msgSend(v10, "write:maxLength:", objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length")) == -1
      && ([v10 streamError], v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
    {
      uint64_t v24 = *MEMORY[0x1E4F28A50];
      v18 = [v10 streamError];
      v25[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

      v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OspreyMessageWriterErrorDomain" code:1 userInfo:v19];
      v21 = v20;
      if (a6) {
        *a6 = v20;
      }
    }
    else
    {
      OspreyLoggingInit();
      v16 = (void *)OspreyLogContextGRPC;
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
        -[OspreyMessageWriter writeMessageData:toStream:compressionEnabled:error:](v16, v14, v7);
      }
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (void)writeMessageData:(void *)a1 toStream:(void *)a2 compressionEnabled:error:.cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = [a2 localizedDescription];
  int v5 = 136315394;
  v6 = "-[OspreyMessageWriter writeMessageData:toStream:compressionEnabled:error:]";
  __int16 v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_ERROR, "%s Error compressing data! Error: %@", (uint8_t *)&v5, 0x16u);
}

- (void)writeMessageData:(char)a3 toStream:compressionEnabled:error:.cold.2(void *a1, void *a2, char a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = a1;
  int v6 = 136315650;
  __int16 v7 = "-[OspreyMessageWriter writeMessageData:toStream:compressionEnabled:error:]";
  __int16 v8 = 2048;
  uint64_t v9 = [a2 length];
  __int16 v10 = 1024;
  int v11 = a3 & 1;
  _os_log_debug_impl(&dword_1BEDB4000, v5, OS_LOG_TYPE_DEBUG, "%s Wrote data of size: %lu, compressed: %d", (uint8_t *)&v6, 0x1Cu);
}

@end