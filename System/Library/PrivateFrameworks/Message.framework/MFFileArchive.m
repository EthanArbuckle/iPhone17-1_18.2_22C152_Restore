@interface MFFileArchive
+ (id)archive;
- (BOOL)_decompressArchive:(archive *)a3 intoArchiveDirectory:(id)a4 error:(id *)a5;
- (BOOL)_decompressContents:(id)a3 inMemoryWithError:(id *)a4 mainEntry:(BOOL)a5;
- (MFFileArchive)init;
- (NSData)inputData;
- (NSMutableData)outputData;
- (_NSRange)inputRange;
- (archive)_compressionArchive;
- (archive)_decompressionArchive;
- (archive_entry)_compressionArchiveEntryWithName:(id)a3 length:(unint64_t)a4 isDirectory:(BOOL)a5;
- (id)_compressContents:(id)a3 error:(id *)a4;
- (id)_errorForArchiveStatus:(int64_t)a3;
- (id)compressFolder:(id)a3 error:(id *)a4;
- (id)description;
- (id)readerBlock;
- (id)writerBlock;
- (int)_archiveDirectoryName:(id)a3 withArchive:(archive *)a4 error:(id *)a5;
- (int)_compressContents:(id)a3 fileName:(id)a4 withArchive:(archive *)a5 error:(id *)a6;
- (int)_compressContents:(id)a3 withArchive:(archive *)a4 error:(id *)a5;
- (int)_compressWithArchive:(archive *)a3 error:(id *)a4;
- (int)_compressionCompleteForArchive:(archive *)a3 error:(id *)a4;
- (int)_decompressionCompleteForArchive:(archive *)a3 error:(id *)a4;
- (void)compressContents:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)decompressContents:(id)a3 completion:(id)a4;
- (void)registerBlocks:(id)a3 writer:(id)a4;
- (void)setInputData:(id)a3;
- (void)setInputRange:(_NSRange)a3;
- (void)setOutputData:(id)a3;
- (void)setReaderBlock:(id)a3;
- (void)setWriterBlock:(id)a3;
- (void)unregisterBlocks;
@end

@implementation MFFileArchive

- (void)dealloc
{
  [(MFFileArchive *)self unregisterBlocks];
  v3.receiver = self;
  v3.super_class = (Class)MFFileArchive;
  [(MFFileArchive *)&v3 dealloc];
}

+ (id)archive
{
  v2 = objc_alloc_init(MFFileArchive);
  return v2;
}

- (MFFileArchive)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFFileArchive;
  v2 = [(MFFileArchive *)&v6 init];
  if (v2)
  {
    objc_super v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F73540]);
    outputData = v2->_outputData;
    v2->_outputData = v3;
  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Input range:%lu:%lu\nInput data:%lu\nOutput data:%lu", self->_inputRange.location, self->_inputRange.length, -[NSData length](self->_inputData, "length"), -[NSMutableData length](self->_outputData, "length"));
}

- (id)_errorForArchiveStatus:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3 > -11)
  {
    if (a3 > 10000)
    {
      if (a3 == 10001)
      {
        v4 = @"MFFileArchiveStatusFailedHeaderWrite";
        goto LABEL_18;
      }
      if (a3 == 10002)
      {
        v4 = @"MFFileArchiveStatusFailedDataWrite";
        goto LABEL_18;
      }
    }
    else
    {
      if (a3 == -10)
      {
        v4 = @"MFFileArchiveStatusRetry";
        goto LABEL_18;
      }
      if (!a3)
      {
        v4 = @"MFFileArchiveStatusOK";
        goto LABEL_18;
      }
    }
    goto LABEL_16;
  }
  if (a3 == -30)
  {
    v4 = @"MFFileArchiveStatusFatal";
    goto LABEL_18;
  }
  if (a3 != -25)
  {
    if (a3 == -20)
    {
      v4 = @"MFFileArchiveStatusWarn";
      goto LABEL_18;
    }
LABEL_16:
    v4 = @"MFFileArchiveStatusUnknown";
    goto LABEL_18;
  }
  v4 = @"MFFileArchiveStatusFailed";
LABEL_18:
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v5 errorWithDomain:@"MFFileArchiveDomain" code:a3 userInfo:v6];

  return v7;
}

- (void)registerBlocks:(id)a3 writer:(id)a4
{
  id v6 = a4;
  v7 = _Block_copy(a3);
  id readerBlock = self->_readerBlock;
  self->_id readerBlock = v7;

  uint64_t v9 = _Block_copy(v6);
  id writerBlock = self->_writerBlock;
  self->_id writerBlock = v9;
}

- (void)unregisterBlocks
{
  id readerBlock = self->_readerBlock;
  self->_id readerBlock = 0;

  id writerBlock = self->_writerBlock;
  self->_id writerBlock = 0;
}

- (id)_compressContents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MFFileArchive *)self _compressionArchive];
  int v8 = archive_write_open();
  if (v8
    || (int v8 = [(MFFileArchive *)self _compressContents:v6 withArchive:v7 error:a4]) != 0)
  {
    if (a4)
    {
      [(MFFileArchive *)self _errorForArchiveStatus:v8];
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = self->_outputData;
  }

  return v9;
}

- (void)compressContents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MFFileArchive_compressContents_completion___block_invoke;
  block[3] = &unk_1E5D3E700;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__MFFileArchive_compressContents_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v6 = 0;
  v4 = [v2 _compressContents:v3 error:&v6];
  id v5 = v6;
  [(id)a1[5] setContents:v4];
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)compressFolder:(id)a3 error:(id *)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v35 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v45 = -86;
  id v6 = [v34 path];
  v32 = self;
  v33 = a4;
  char v7 = [v35 fileExistsAtPath:v6 isDirectory:&v45];
  if (v45) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }

  if (v8)
  {
    id v9 = [v34 path];
    uint64_t v10 = [v9 length];

    uint64_t v11 = +[MFFileArchiveDirectory archiveDirectory];
    uint64_t v38 = *MEMORY[0x1E4F1C628];
    v49[0] = *MEMORY[0x1E4F1C628];
    v36 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    id v13 = [v35 enumeratorAtURL:v34 includingPropertiesForKeys:v12 options:0 errorHandler:0];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v13;
    id v14 = 0;
    uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (!v15) {
      goto LABEL_20;
    }
    uint64_t v16 = v10 + 1;
    uint64_t v17 = *(void *)v42;
    while (1)
    {
      uint64_t v18 = 0;
      v19 = v14;
      do
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v41 + 1) + 8 * v18);
        uint64_t v21 = [v20 path];
        v22 = [(id)v21 substringFromIndex:v16];

        id v39 = 0;
        id v40 = 0;
        LOBYTE(v21) = [v20 getResourceValue:&v40 forKey:v38 error:&v39];
        id v23 = v40;
        id v14 = v39;

        if (v21)
        {
          if ([v23 BOOLValue])
          {
            v24 = [v35 contentsOfDirectoryAtURL:v20 includingPropertiesForKeys:0 options:0 error:0];
            BOOL v25 = [v24 count] == 0;

            if (!v25) {
              goto LABEL_18;
            }
            v26 = [[MFFileArchiveEntry alloc] initWithDirectoryPath:v22];
            [v36 setArchiveEntry:v26];
          }
          else
          {
            v26 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v20 options:3 error:0];
            v28 = [[MFFileArchiveEntry alloc] initWithContents:v26 path:v22];
            [v36 setArchiveEntry:v28];
          }
        }
        else
        {
          MFLogGeneral();
          v26 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR))
          {
            v27 = objc_msgSend(v14, "ef_publicDescription");
            [(MFFileArchive *)v27 compressFolder:&v47 error:&v26->super];
          }
        }

LABEL_18:
        ++v18;
        v19 = v14;
      }
      while (v15 != v18);
      uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (!v15)
      {
LABEL_20:

        v29 = [(MFFileArchive *)v32 _compressContents:v36 error:v33];

        v30 = v36;
        goto LABEL_25;
      }
    }
  }
  v30 = MFLogGeneral();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[MFFileArchive compressFolder:error:](v30);
  }
  v29 = 0;
LABEL_25:

  return v29;
}

- (archive)_compressionArchive
{
  v2 = (archive *)archive_write_new();
  archive_write_set_format_zip();
  archive_write_set_options();
  return v2;
}

- (int)_compressContents:(id)a3 withArchive:(archive *)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v8 = objc_msgSend(a3, "archiveEntries", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      if ([v12 isDirectory])
      {
        id v13 = [v12 path];
        int v14 = [(MFFileArchive *)self _archiveDirectoryName:v13 withArchive:a4 error:a5];
      }
      else
      {
        id v13 = [v12 contents];
        uint64_t v15 = [v12 path];
        int v14 = [(MFFileArchive *)self _compressContents:v13 fileName:v15 withArchive:a4 error:a5];
      }
      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return [(MFFileArchive *)self _compressionCompleteForArchive:a4 error:a5];
}

- (int)_compressWithArchive:(archive *)a3 error:(id *)a4
{
  id readerBlock = (void (**)(id, SEL))self->_readerBlock;
  if (!readerBlock || !self->_writerBlock) {
    return [(MFFileArchive *)self _compressionCompleteForArchive:a3 error:a4];
  }
  char v8 = readerBlock[2](readerBlock, a2);
  -[MFFileArchive _compressionArchiveEntryWithName:length:isDirectory:](self, "_compressionArchiveEntryWithName:length:isDirectory:", 0, [v8 length], 0);
  int v9 = archive_write_header();
  if (!v9)
  {
    while (1)
    {
      if (![v8 length])
      {
        int v9 = 0;
        goto LABEL_15;
      }
      id v10 = v8;
      [v10 bytes];
      [v10 length];
      unint64_t v11 = archive_write_data();
      if (v11 == -1) {
        break;
      }
      if (v11 < [v10 length])
      {
        id v12 = MFLogGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_INFO, "#Attachments Failed to write entire data buffer", v15, 2u);
        }
      }
      char v8 = (*((void (**)(void))self->_readerBlock + 2))();
    }
    int v9 = 10002;
    char v8 = v10;
  }
LABEL_15:
  archive_entry_free();

  int v13 = [(MFFileArchive *)self _compressionCompleteForArchive:a3 error:a4];
  if (!v9) {
    return v13;
  }
  return v9;
}

- (archive_entry)_compressionArchiveEntryWithName:(id)a3 length:(unint64_t)a4 isDirectory:(BOOL)a5
{
  id v5 = a3;
  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v9.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v9, 0);
  id v6 = (archive_entry *)archive_entry_new();
  id v7 = v5;
  [v7 fileSystemRepresentation];
  archive_entry_set_pathname();
  archive_entry_set_size();
  archive_entry_set_filetype();
  archive_entry_set_perm();
  archive_entry_set_mtime();

  return v6;
}

- (int)_compressContents:(id)a3 fileName:(id)a4 withArchive:(archive *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  -[MFFileArchive _compressionArchiveEntryWithName:length:isDirectory:](self, "_compressionArchiveEntryWithName:length:isDirectory:", v10, [v9 length], 0);
  if (archive_write_header())
  {
    if (a6)
    {
      *a6 = [(MFFileArchive *)self _errorForArchiveStatus:10001];
    }
    int v11 = 10001;
  }
  else
  {
    id v12 = v9;
    [v12 bytes];
    [v12 length];
    unint64_t v13 = archive_write_data();
    if (v13 == -1)
    {
      int v11 = 10002;
    }
    else
    {
      if (v13 < [v12 length])
      {
        int v14 = MFLogGeneral();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v16 = 0;
          _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_INFO, "#Attachments Failed to write entire data buffer", v16, 2u);
        }
      }
      int v11 = 0;
    }
  }
  archive_entry_free();

  return v11;
}

- (int)_archiveDirectoryName:(id)a3 withArchive:(archive *)a4 error:(id *)a5
{
  id v7 = a3;
  [(MFFileArchive *)self _compressionArchiveEntryWithName:v7 length:0 isDirectory:1];
  if (archive_write_header())
  {
    if (a5)
    {
      *a5 = [(MFFileArchive *)self _errorForArchiveStatus:10001];
    }
    int v8 = 10001;
  }
  else
  {
    int v8 = 0;
  }
  archive_entry_free();

  return v8;
}

- (int)_compressionCompleteForArchive:(archive *)a3 error:(id *)a4
{
  int v6 = archive_write_free();
  int v7 = v6;
  if (a4 && v6)
  {
    *a4 = [(MFFileArchive *)self _errorForArchiveStatus:v6];
  }
  return v7;
}

- (BOOL)_decompressContents:(id)a3 inMemoryWithError:(id *)a4 mainEntry:(BOOL)a5
{
  id v7 = a3;
  int v8 = [(MFFileArchive *)self _decompressionArchive];
  id v9 = [v7 contents];
  [v9 bytes];
  [v9 length];
  int open_memory = archive_read_open_memory();
  if (open_memory)
  {
    if (a4)
    {
      [(MFFileArchive *)self _errorForArchiveStatus:open_memory];
      BOOL v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = [(MFFileArchive *)self _decompressArchive:v8 intoArchiveDirectory:v7 error:a4];
  }
  int v12 = [(MFFileArchive *)self _decompressionCompleteForArchive:v8 error:a4];
  if (a4 && v12)
  {
    *a4 = [(MFFileArchive *)self _errorForArchiveStatus:v12];
  }

  return v11;
}

- (void)decompressContents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MFFileArchive_decompressContents_completion___block_invoke;
  block[3] = &unk_1E5D3E700;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __47__MFFileArchive_decompressContents_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _decompressContents:*(void *)(a1 + 40) inMemoryWithError:0 mainEntry:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (archive)_decompressionArchive
{
  v2 = (archive *)archive_read_new();
  archive_read_support_filter_all();
  archive_read_support_format_all();
  return v2;
}

- (BOOL)_decompressArchive:(archive *)a3 intoArchiveDirectory:(id)a4 error:(id *)a5
{
  id v19 = a4;
  NSUInteger v7 = NSPageSize();
  char v8 = 1;
  uint64_t v9 = 1000;
  while (1)
  {
    int next_header = archive_read_next_header();
    if (next_header) {
      break;
    }
    BOOL v11 = [NSString stringWithCString:archive_entry_pathname() encoding:4];
    if (self->_readerBlock)
    {
      id writerBlock = (void (**)(id, void *, void))self->_writerBlock;
      if (writerBlock) {
        writerBlock[2](writerBlock, v11, 0);
      }
    }
    int is_set = archive_entry_size_is_set();
    uint64_t v14 = v7;
    if (is_set) {
      uint64_t v14 = archive_entry_size();
    }
    uint64_t v15 = [MEMORY[0x1E4F73540] dataWithCapacity:v14];
    while (1)
    {
      int data_block = archive_read_data_block();
      if (data_block) {
        break;
      }
      if (self->_readerBlock && self->_writerBlock)
      {
        [v15 setLength:0];
        [v15 appendBytes:0xAAAAAAAAAAAAAAAALL length:0xAAAAAAAAAAAAAAAALL];
        (*((void (**)(void))self->_writerBlock + 2))();
      }
      else
      {
        [v15 appendBytes:0xAAAAAAAAAAAAAAAALL length:0xAAAAAAAAAAAAAAAALL];
      }
    }
    if (a5 && data_block != 1)
    {
      [(MFFileArchive *)self _errorForArchiveStatus:data_block];
      char v8 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!self->_readerBlock || !self->_writerBlock)
    {
      long long v17 = [[MFFileArchiveEntry alloc] initWithContents:v15 path:v11];
      [v19 setArchiveEntry:v17];
    }
    if (!--v9) {
      goto LABEL_25;
    }
  }
  if (a5 && next_header != 1)
  {
    [(MFFileArchive *)self _errorForArchiveStatus:next_header];
    char v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_25:

  return v8 & 1;
}

- (int)_decompressionCompleteForArchive:(archive *)a3 error:(id *)a4
{
  int free = archive_read_free();
  int v7 = free;
  if (a4 && free)
  {
    *a4 = [(MFFileArchive *)self _errorForArchiveStatus:free];
  }
  return v7;
}

- (NSData)inputData
{
  return self->_inputData;
}

- (void)setInputData:(id)a3
{
}

- (_NSRange)inputRange
{
  NSUInteger length = self->_inputRange.length;
  NSUInteger location = self->_inputRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setInputRange:(_NSRange)a3
{
  self->_inputRange = a3;
}

- (NSMutableData)outputData
{
  return self->_outputData;
}

- (void)setOutputData:(id)a3
{
}

- (id)readerBlock
{
  return self->_readerBlock;
}

- (void)setReaderBlock:(id)a3
{
}

- (id)writerBlock
{
  return self->_writerBlock;
}

- (void)setWriterBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writerBlock, 0);
  objc_storeStrong(&self->_readerBlock, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
}

- (void)compressFolder:(void *)a3 error:(os_log_t)log .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#Attachments Couldn't add file to archive. Error: %{public}@", buf, 0xCu);
}

- (void)compressFolder:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#Attachments Couldn't create archive, input is not a directory.", v1, 2u);
}

@end