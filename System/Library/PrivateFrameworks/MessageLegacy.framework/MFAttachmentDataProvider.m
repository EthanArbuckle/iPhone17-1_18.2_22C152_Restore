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
- (void)dealloc;
- (void)setUrl:(id)a3;
@end

@implementation MFAttachmentDataProvider

+ (id)dataProviderWithURL:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithURL:a3];
  return v3;
}

+ (id)dataProviderWithPath:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(objc_alloc((Class)a1), "initWithURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:"));
    return v3;
  }
  else
  {
    v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CFCFE000, v5, OS_LOG_TYPE_INFO, "#Attachments nil path detected in initializer", v6, 2u);
    }
    return 0;
  }
}

- (MFAttachmentDataProvider)initWithURL:(id)a3
{
  v4 = [(MFAttachmentDataProvider *)self init];
  if (v4) {
    v4->_url = (NSURL *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentDataProvider;
  [(MFAttachmentDataProvider *)&v3 dealloc];
}

- (id)errorWithMessage:(id)a3 code:(int64_t)a4
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = a3;
  return (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"MFAttachmentDataProviderErrorDomain", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
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
  int v3 = [(MFAttachmentDataProvider *)self _isFileURL];
  if (v3)
  {
    v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    id v5 = [(MFAttachmentDataProvider *)self _path];
    LOBYTE(v3) = [v4 fileExistsAtPath:v5];
  }
  return v3;
}

- (id)_fileAttributes:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  if (a3)
  {
    unint64_t v5 = strtoul((const char *)objc_msgSend(a3, "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v5)
    {
      uint64_t v6 = [NSNumber numberWithUnsignedLong:v5];
      [v4 setObject:v6 forKey:*MEMORY[0x1E4F28330]];
    }
  }
  return v4;
}

- (BOOL)save:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend(-[MFAttachmentDataProvider _path](self, "_path"), "copy");
  uint64_t v6 = [v5 stringByDeletingLastPathComponent];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v13 = 0;
    if ([v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v13])
    {
      v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[MFAttachmentDataProvider _fileAttributes:](self, "_fileAttributes:", 0));
      [v9 setObject:*MEMORY[0x1E4F28348] forKey:*MEMORY[0x1E4F28370]];
      if (([v8 createFileAtPath:v5 contents:a3 attributes:v9] & 1) == 0)
      {
        v10 = MFLogGeneral();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v15 = (uint64_t)v5;
          __int16 v16 = 2112;
          uint64_t v17 = v13;
          v11 = "#Attachments Failed to create file for attachment %@: %@";
LABEL_8:
          _os_log_impl(&dword_1CFCFE000, v10, OS_LOG_TYPE_INFO, v11, buf, 0x16u);
        }
      }
    }
    else
    {
      v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v15 = v7;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        v11 = "#Attachments Failed to create directory for attachment %@: %@";
        goto LABEL_8;
      }
    }
  }

  return 0;
}

- (id)data
{
  v2 = (void *)MEMORY[0x1E4F734C0];
  id v3 = [(MFAttachmentDataProvider *)self _path];
  return (id)[v2 dataWithContentsOfFile:v3];
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrl:(id)a3
{
}

@end