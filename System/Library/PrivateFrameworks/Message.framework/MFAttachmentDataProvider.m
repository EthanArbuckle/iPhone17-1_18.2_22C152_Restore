@interface MFAttachmentDataProvider
+ (id)dataProviderWithPath:(id)a3;
+ (id)dataProviderWithURL:(id)a3;
- (BOOL)_isFileURL;
- (BOOL)exists;
- (BOOL)save:(id)a3;
- (MFAttachmentDataProvider)initWithURL:(id)a3;
- (NSURL)url;
- (id)_fileAttributes:(id)a3;
- (id)_path;
- (id)data;
- (id)errorWithMessage:(id)a3 code:(int64_t)a4;
- (void)setUrl:(id)a3;
@end

@implementation MFAttachmentDataProvider

+ (id)dataProviderWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return v5;
}

+ (id)dataProviderWithPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    v6 = (void *)[objc_alloc((Class)a1) initWithURL:v5];
  }
  else
  {
    v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_INFO, "#Attachments nil path detected in initializer", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (MFAttachmentDataProvider)initWithURL:(id)a3
{
  id v5 = a3;
  v6 = [(MFAttachmentDataProvider *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (id)errorWithMessage:(id)a3 code:(int64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v5 errorWithDomain:@"MFAttachmentDataProviderErrorDomain" code:0 userInfo:v6];

  return v7;
}

- (id)_path
{
  return [(NSURL *)self->_url path];
}

- (BOOL)_isFileURL
{
  return [(NSURL *)self->_url isFileURL];
}

- (BOOL)exists
{
  if (![(MFAttachmentDataProvider *)self _isFileURL]) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(MFAttachmentDataProvider *)self _path];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (id)_fileAttributes:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  if (v3)
  {
    unint64_t v5 = strtoul((const char *)objc_msgSend(v3, "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v5)
    {
      v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v5];
      [v4 setObject:v6 forKey:*MEMORY[0x1E4F28330]];
    }
  }

  return v4;
}

- (BOOL)save:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(MFAttachmentDataProvider *)self _path];
  v6 = (void *)[v5 copy];

  v7 = [v6 stringByDeletingLastPathComponent];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v16 = 0;
    int v9 = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v10 = v16;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E4F1CA60];
      v12 = [(MFAttachmentDataProvider *)self _fileAttributes:0];
      v13 = [v11 dictionaryWithDictionary:v12];

      [v13 setObject:*MEMORY[0x1E4F28348] forKey:*MEMORY[0x1E4F28370]];
      if (([v8 createFileAtPath:v6 contents:v4 attributes:v13] & 1) == 0)
      {
        v14 = MFLogGeneral();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v6;
          __int16 v19 = 2112;
          id v20 = v10;
          _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_INFO, "#Attachments Failed to create file for attachment %@: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v13 = MFLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_INFO, "#Attachments Failed to create directory for attachment %@: %@", buf, 0x16u);
      }
    }
  }
  return 0;
}

- (id)data
{
  v2 = (void *)MEMORY[0x1E4F734C0];
  id v3 = [(MFAttachmentDataProvider *)self _path];
  id v4 = [v2 dataWithContentsOfFile:v3];

  return v4;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end