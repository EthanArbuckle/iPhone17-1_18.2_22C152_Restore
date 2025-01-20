@interface QLZipArchive
- (BOOL)_reopenWithError:(id *)a3;
- (QLZipArchive)initWithData:(id)a3 error:(id *)a4;
- (QLZipArchive)initWithURL:(id)a3 error:(id *)a4;
- (id)fileWrapper;
- (id)libarchiveError;
- (id)readCurrentDataWithEntry:(archive_entry *)a3 error:(id *)a4;
- (void)dealloc;
- (void)enumerateEntriesWithHandler:(id)a3;
@end

@implementation QLZipArchive

- (id)libarchiveError
{
  v8[1] = *MEMORY[0x263EF8340];
  if (self->_archive)
  {
    uint64_t v2 = archive_error_string();
    if (v2)
    {
      uint64_t v7 = *MEMORY[0x263F08320];
      v3 = [NSString stringWithUTF8String:v2];
      v8[0] = v3;
      v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    }
    else
    {
      v4 = 0;
    }
    v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:(int)archive_errno() userInfo:v4];
  }
  else
  {
    v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:12 userInfo:0];
  }
  return v5;
}

- (QLZipArchive)initWithURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QLZipArchive;
  v8 = [(QLZipArchive *)&v12 init];
  v9 = v8;
  if (v8 && (objc_storeStrong((id *)&v8->_url, a3), ![(QLZipArchive *)v9 _reopenWithError:a4])) {
    v10 = 0;
  }
  else {
    v10 = v9;
  }

  return v10;
}

- (QLZipArchive)initWithData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QLZipArchive;
  v8 = [(QLZipArchive *)&v12 init];
  v9 = v8;
  if (v8 && (objc_storeStrong((id *)&v8->_data, a3), ![(QLZipArchive *)v9 _reopenWithError:a4])) {
    v10 = 0;
  }
  else {
    v10 = v9;
  }

  return v10;
}

- (BOOL)_reopenWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = (archive *)archive_read_new();
  self->_archive = v5;
  if (v5)
  {
    if (archive_read_support_filter_all() || archive_read_support_format_all())
    {
      v6 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v6 = _qlsLogHandle;
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      url = self->_url;
      int v17 = 138412290;
      v18 = url;
      v8 = "Could not configure archive struct to unzip %@ #Conversion";
    }
    else
    {
      v13 = self->_url;
      if (v13
        && ([(NSURL *)v13 fileSystemRepresentation],
            archive_read_open_filename()))
      {
        v6 = _qlsLogHandle;
        if (!_qlsLogHandle)
        {
          QLSInitLogging();
          v6 = _qlsLogHandle;
        }
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        v14 = self->_url;
        int v17 = 138412290;
        v18 = v14;
        v8 = "Could not unzip %@ #Conversion";
      }
      else
      {
        data = self->_data;
        if (!data) {
          return 1;
        }
        [(NSData *)data bytes];
        [(NSData *)self->_data length];
        if (!archive_read_open_memory()) {
          return 1;
        }
        v6 = _qlsLogHandle;
        if (!_qlsLogHandle)
        {
          QLSInitLogging();
          v6 = _qlsLogHandle;
        }
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        v16 = self->_url;
        int v17 = 138412290;
        v18 = v16;
        v8 = "Could not unzip %@ #Conversion";
      }
    }
    _os_log_impl(&dword_217F31000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v17, 0xCu);
LABEL_9:
    if (a3)
    {
      *a3 = [(QLZipArchive *)self libarchiveError];
    }
    archive_read_free();
    BOOL result = 0;
    self->_archive = 0;
    return result;
  }
  v10 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    v10 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_url;
    int v17 = 138412290;
    v18 = v11;
    _os_log_impl(&dword_217F31000, v10, OS_LOG_TYPE_DEFAULT, "Could not create archive struct to unzip %@ #Conversion", (uint8_t *)&v17, 0xCu);
  }
  if (!a3) {
    return 0;
  }
  id v12 = [(QLZipArchive *)self libarchiveError];
  BOOL result = 0;
  *a3 = v12;
  return result;
}

- (id)readCurrentDataWithEntry:(archive_entry *)a3 error:(id *)a4
{
  uint64_t v4 = MEMORY[0x270FA5388](self, a2, a3, a4);
  v6 = v5;
  id v7 = (void *)v4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (archive_entry_size_is_set())
  {
    uint64_t v8 = archive_entry_size();
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:v8];
    [v9 setLength:v8];
    id v10 = v9;
    [v10 mutableBytes];
    if (archive_read_data() < 1)
    {
      v14 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v14 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        int v17 = 136315138;
        uint64_t v18 = archive_error_string();
        _os_log_impl(&dword_217F31000, v15, OS_LOG_TYPE_DEFAULT, "Error reading archive: %s #Conversion", (uint8_t *)&v17, 0xCu);
      }
      if (v6)
      {
        [v7 libarchiveError];
        id v11 = 0;
        void *v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = v10;
    }
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
    uint64_t data = archive_read_data();
    if (data)
    {
      uint64_t v13 = data;
      do
      {
        [v11 appendBytes:&v17 length:v13];
        uint64_t v13 = archive_read_data();
      }
      while (v13);
    }
  }
  return v11;
}

- (void)enumerateEntriesWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, QLZipArchiveEntry *, void, unsigned __int8 *))a3;
  unsigned __int8 v13 = 0;
  if (self->_archive)
  {
LABEL_4:
    while (1)
    {
      int next_header = archive_read_next_header();
      if (next_header) {
        break;
      }
      v9 = objc_alloc_init(QLZipArchiveEntry);
      [(QLZipArchiveEntry *)v9 setArchive:self];
      [(QLZipArchiveEntry *)v9 setEntry:0];
      v4[2](v4, v9, 0, &v13);
      archive_read_data_skip();
      int v10 = v13;

      if (v10) {
        goto LABEL_9;
      }
    }
    if (next_header != 1)
    {
      id v11 = [(QLZipArchive *)self libarchiveError];
      ((void (**)(id, QLZipArchiveEntry *, void *, unsigned __int8 *))v4)[2](v4, 0, v11, &v13);
    }
LABEL_9:
    archive_read_free();
    self->_archive = 0;
  }
  else
  {
    id v12 = 0;
    BOOL v5 = [(QLZipArchive *)self _reopenWithError:&v12];
    id v6 = v12;
    id v7 = v6;
    if (v5)
    {

      goto LABEL_4;
    }
    ((void (**)(id, QLZipArchiveEntry *, id, unsigned __int8 *))v4)[2](v4, 0, v6, &v13);
  }
}

- (id)fileWrapper
{
  fileWrapper = self->_fileWrapper;
  if (fileWrapper)
  {
    v3 = fileWrapper;
  }
  else
  {
    BOOL v5 = objc_opt_new();
    id v6 = objc_alloc(MEMORY[0x263F08870]);
    id v7 = (NSFileWrapper *)[v6 initDirectoryWithFileWrappers:MEMORY[0x263EFFA78]];
    uint64_t v8 = self->_fileWrapper;
    self->_fileWrapper = v7;

    [v5 setObject:self->_fileWrapper forKey:@"/"];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __27__QLZipArchive_fileWrapper__block_invoke;
    v11[3] = &unk_2642F2538;
    v11[4] = self;
    id v12 = v5;
    id v9 = v5;
    [(QLZipArchive *)self enumerateEntriesWithHandler:v11];
    v3 = self->_fileWrapper;
  }
  return v3;
}

void __27__QLZipArchive_fileWrapper__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 url];
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_22;
  }
  id v6 = [v4 URLByDeletingLastPathComponent];
  id v7 = [v6 relativePath];
  if ([v7 isEqualToString:@"/"])
  {

    goto LABEL_5;
  }
  uint64_t v8 = [v6 relativePath];
  int v9 = [v8 isEqualToString:@"."];

  if (v9)
  {
LABEL_5:
    int v10 = [*(id *)(a1 + 32) fileWrapper];
    if (v10) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  id v11 = *(void **)(a1 + 40);
  id v12 = [v6 relativePath];
  int v10 = [v11 objectForKeyedSubscript:v12];

  if (v10) {
    goto LABEL_14;
  }
LABEL_8:
  unsigned __int8 v13 = [v6 lastPathComponent];
  id v14 = objc_alloc(MEMORY[0x263F08870]);
  int v10 = (void *)[v14 initDirectoryWithFileWrappers:MEMORY[0x263EFFA78]];
  [v10 setPreferredFilename:v13];
  v15 = *(void **)(a1 + 40);
  v16 = [v6 relativePath];
  [v15 setObject:v10 forKey:v16];

  int v17 = [v6 URLByDeletingLastPathComponent];
  uint64_t v18 = [v17 relativePath];
  if ([v18 isEqualToString:@"/"])
  {
  }
  else
  {
    uint64_t v19 = [v17 relativePath];
    int v20 = [v19 isEqualToString:@"."];

    if (!v20)
    {
      v23 = *(void **)(a1 + 40);
      v21 = [v17 relativePath];
      v24 = [v23 objectForKeyedSubscript:v21];
      id v25 = (id)[v24 addFileWrapper:v10];

      goto LABEL_13;
    }
  }
  v21 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"/"];
  id v22 = (id)[v21 addFileWrapper:v10];
LABEL_13:

LABEL_14:
  id v31 = 0;
  v26 = [v3 readDataWithError:&v31];
  id v27 = v31;
  if (v27 || ![v26 length])
  {
    v28 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v28 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v27;
      _os_log_impl(&dword_217F31000, v28, OS_LOG_TYPE_ERROR, "Error while reading data: %@ #ZIPHandling", buf, 0xCu);
    }
  }
  else
  {
    v29 = [v5 lastPathComponent];
    id v30 = (id)[v10 addRegularFileWithContents:v26 preferredFilename:v29];
  }
LABEL_22:
}

- (void)dealloc
{
  if (self->_archive) {
    archive_read_free();
  }
  v3.receiver = self;
  v3.super_class = (Class)QLZipArchive;
  [(QLZipArchive *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileWrapper, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end