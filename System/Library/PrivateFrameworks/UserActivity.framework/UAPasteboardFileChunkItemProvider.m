@interface UAPasteboardFileChunkItemProvider
- (NSFileHandle)dataFile;
- (NSNumber)offsetInFile;
- (NSString)type;
- (NSUUID)uuid;
- (UAPasteboardFileChunkItemProvider)initWithType:(id)a3 fileHandle:(id)a4 offsetInFile:(id)a5 size:(int64_t)a6;
- (int64_t)chunkSize;
- (void)getDataWithCompletionBlock:(id)a3;
- (void)setChunkSize:(int64_t)a3;
- (void)setDataFile:(id)a3;
- (void)setOffsetInFile:(id)a3;
- (void)setType:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UAPasteboardFileChunkItemProvider

- (UAPasteboardFileChunkItemProvider)initWithType:(id)a3 fileHandle:(id)a4 offsetInFile:(id)a5 size:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UAPasteboardFileChunkItemProvider;
  v13 = [(UAPasteboardFileChunkItemProvider *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(UAPasteboardFileChunkItemProvider *)v13 setDataFile:v11];
    [(UAPasteboardFileChunkItemProvider *)v14 setOffsetInFile:v12];
    [(UAPasteboardFileChunkItemProvider *)v14 setChunkSize:a6];
    [(UAPasteboardFileChunkItemProvider *)v14 setType:v10];
    v15 = [MEMORY[0x1E4F29128] UUID];
    [(UAPasteboardFileChunkItemProvider *)v14 setUuid:v15];
  }
  return v14;
}

- (void)getDataWithCompletionBlock:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void *))a3;
  v5 = [(UAPasteboardFileChunkItemProvider *)self dataFile];

  if (v5)
  {
    v6 = +[UASharedPasteboardIRManager sharedIRManager];
    v7 = [(UAPasteboardFileChunkItemProvider *)self type];
    v8 = [v6 converterForType:v7];

    v9 = _uaGetLogForCategory(@"pasteboard-client");
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        id v11 = [(UAPasteboardFileChunkItemProvider *)self type];
        *(_DWORD *)buf = 138543618;
        v38 = v11;
        __int16 v39 = 2112;
        id v40 = (id)objc_opt_class();
        id v12 = v40;
        _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_INFO, "[Local Pasteboard] Found converter for type: %{public}@ -> %@", buf, 0x16u);
      }
      v13 = [(UAPasteboardFileChunkItemProvider *)self dataFile];
      v14 = [(UAPasteboardFileChunkItemProvider *)self offsetInFile];
      objc_msgSend(v13, "seekToFileOffset:", objc_msgSend(v14, "unsignedLongLongValue"));

      v15 = [(UAPasteboardFileChunkItemProvider *)self dataFile];
      objc_msgSend(v15, "readDataOfLength:", -[UAPasteboardFileChunkItemProvider chunkSize](self, "chunkSize"));
      v16 = (UAFileChunkInputStream *)objc_claimAutoreleasedReturnValue();

      if (v16 && [(UAFileChunkInputStream *)v16 length])
      {
        objc_super v17 = [v8 convertIRDataToPlatform:v16];
        v18 = v17;
        if (v17 && [v17 length])
        {
          v19 = [MEMORY[0x1E4F1CA10] inputStreamWithData:v18];
          v20 = 0;
LABEL_22:

          v4[2](v4, v19, v20);
          goto LABEL_23;
        }
        v28 = _uaGetLogForCategory(@"pasteboard-client");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3DF6000, v28, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Zero length data from converter", buf, 2u);
        }

        v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v34 = @"Zero length data from converter";
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v20 = [v29 errorWithDomain:@"UAContinuityErrorDomain" code:-124 userInfo:v30];
      }
      else
      {
        v22 = _uaGetLogForCategory(@"pasteboard-client");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3DF6000, v22, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Zero length data to convert", buf, 2u);
        }

        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        v36 = @"Zero length data to convert";
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        v20 = [v23 errorWithDomain:@"UAContinuityErrorDomain" code:-124 userInfo:v18];
      }
      v19 = 0;
      goto LABEL_22;
    }
    if (v10)
    {
      v24 = [(UAPasteboardFileChunkItemProvider *)self type];
      *(_DWORD *)buf = 138412290;
      v38 = v24;
      _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_INFO, "[Local Pasteboard] No converter for type, using file stream: %@", buf, 0xCu);
    }
    v25 = [UAFileChunkInputStream alloc];
    v26 = [(UAPasteboardFileChunkItemProvider *)self dataFile];
    v27 = [(UAPasteboardFileChunkItemProvider *)self offsetInFile];
    v16 = [(UAFileChunkInputStream *)v25 initWithFileHandle:v26 offsetInFile:v27 size:[(UAPasteboardFileChunkItemProvider *)self chunkSize]];

    v4[2](v4, v16, 0);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32 = @"File Provider does not have a backing file";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v16 = [v21 errorWithDomain:@"UAContinuityErrorDomain" code:-124 userInfo:v8];
    v4[2](v4, 0, v16);
  }
LABEL_23:
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataFile:(id)a3
{
}

- (NSNumber)offsetInFile
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOffsetInFile:(id)a3
{
}

- (int64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(int64_t)a3
{
  self->_chunkSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetInFile, 0);
  objc_storeStrong((id *)&self->_dataFile, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end