@interface REMFileAttachment
+ (BOOL)supportsSecureCoding;
+ (id)cdEntityName;
+ (id)createTemporaryFileURLWithUTI:(id)a3;
+ (id)createTemporaryFileWithData:(id)a3 UTI:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporaryFileURL;
- (NSURL)fileURL;
- (REMFileAttachment)initWithCoder:(id)a3;
- (REMFileAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 UTI:(id)a6 fileSize:(unint64_t)a7 fileURL:(id)a8 data:(id)a9;
- (id)_deepCopy;
- (unint64_t)fileSize;
- (void)_deepCopy;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileURL:(id)a3;
- (void)setIsTemporaryFileURL:(BOOL)a3;
@end

@implementation REMFileAttachment

+ (id)cdEntityName
{
  return @"REMCDFileAttachment";
}

- (REMFileAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 UTI:(id)a6 fileSize:(unint64_t)a7 fileURL:(id)a8 data:(id)a9
{
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)REMFileAttachment;
  v18 = [(REMAttachment *)&v24 initWithObjectID:a3 accountID:a4 reminderID:a5 UTI:v15];
  v19 = v18;
  if (v18)
  {
    v18->_fileSize = a7;
    p_fileURL = (void **)&v18->_fileURL;
    objc_storeStrong((id *)&v18->_fileURL, a8);
    v19->_isTemporaryFileURL = 0;
    if (v17)
    {
      uint64_t v21 = +[REMFileAttachment createTemporaryFileWithData:v17 UTI:v15];
      v22 = *p_fileURL;
      *p_fileURL = (void *)v21;

      if (*p_fileURL) {
        v19->_isTemporaryFileURL = 1;
      }
    }
  }

  return v19;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Unable to remove temporary file because {error: %@}", v2, v3, v4, v5, v6);
}

+ (id)createTemporaryFileURLWithUTI:(id)a3
{
  uint64_t v3 = (__CFString *)UTTypeCopyPreferredTagWithClass((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F224F8]);
  id v12 = 0;
  uint64_t v4 = +[REMPaths createTemporaryFileDirectoryURLIfNeededWithError:&v12];
  id v5 = v12;
  if (v4)
  {
    uint8_t v6 = [MEMORY[0x1E4F28F80] processInfo];
    v7 = [v6 globallyUniqueString];

    v8 = [v4 URLByAppendingPathComponent:v7];
    v9 = v8;
    if (v3)
    {
      uint64_t v10 = [v8 URLByAppendingPathExtension:v3];

      v9 = (void *)v10;
    }
  }
  else
  {
    v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[REMFileAttachment createTemporaryFileURLWithUTI:]();
    }
    v9 = 0;
  }

  return v9;
}

+ (id)createTemporaryFileWithData:(id)a3 UTI:(id)a4
{
  id v5 = a3;
  uint8_t v6 = +[REMFileAttachment createTemporaryFileURLWithUTI:a4];
  if (v6)
  {
    id v10 = 0;
    [v5 writeToURL:v6 options:1 error:&v10];
    id v7 = v10;
    if (v7)
    {
      v8 = +[REMLogStore write];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[REMFileAttachment createTemporaryFileWithData:UTI:]();
      }

      uint8_t v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMFileAttachment;
  [(REMAttachment *)&v10 encodeWithCoder:v4];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[REMFileAttachment fileSize](self, "fileSize"));
  [v4 encodeObject:v5 forKey:@"fileSize"];
  uint8_t v6 = [(REMFileAttachment *)self fileURL];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28FF8]);
    v8 = [(REMFileAttachment *)self fileURL];
    v9 = objc_msgSend(v7, "initWithURL:readonly:", v8, -[REMFileAttachment isTemporaryFileURL](self, "isTemporaryFileURL") ^ 1);

    [v4 encodeObject:v9 forKey:@"fileURL"];
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[REMFileAttachment isTemporaryFileURL](self, "isTemporaryFileURL"), @"isTemporaryFileURL");
}

- (REMFileAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)REMFileAttachment;
  id v5 = [(REMAttachment *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint8_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileSize"];
    v5->_fileSize = [v6 unsignedLongLongValue];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 url];
      fileURL = v5->_fileURL;
      v5->_fileURL = (NSURL *)v9;
    }
    v5->_isTemporaryFileURL = [v4 decodeBoolForKey:@"isTemporaryFileURL"];
  }
  return v5;
}

- (id)_deepCopy
{
  v17.receiver = self;
  v17.super_class = (Class)REMFileAttachment;
  uint64_t v3 = [(REMAttachment *)&v17 _deepCopy];
  objc_msgSend(v3, "setFileSize:", -[REMFileAttachment fileSize](self, "fileSize"));
  if (![(REMFileAttachment *)self isTemporaryFileURL]
    || ([(REMFileAttachment *)self fileURL],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    uint8_t v6 = [(REMFileAttachment *)self fileURL];
    v13 = v3;
    v14 = v6;
LABEL_9:
    [v13 setFileURL:v14];
    goto LABEL_10;
  }
  id v5 = [(REMAttachment *)self uti];
  uint8_t v6 = +[REMFileAttachment createTemporaryFileURLWithUTI:v5];

  if (!v6)
  {
    v13 = v3;
    v14 = 0;
    goto LABEL_9;
  }
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [(REMFileAttachment *)self fileURL];
  id v16 = 0;
  [v7 linkItemAtURL:v8 toURL:v6 error:&v16];
  id v9 = v16;

  if (v9)
  {
    objc_super v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[REMFileAttachment _deepCopy]();
    }

    v11 = v3;
    objc_super v12 = 0;
  }
  else
  {
    v11 = v3;
    objc_super v12 = v6;
  }
  [v11 setFileURL:v12];

LABEL_10:
  objc_msgSend(v3, "setIsTemporaryFileURL:", -[REMFileAttachment isTemporaryFileURL](self, "isTemporaryFileURL"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)REMFileAttachment;
  if ([(REMAttachment *)&v16 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [v5 fileSize];
    if (v6 == [(REMFileAttachment *)self fileSize])
    {
      id v7 = [v5 fileURL];
      uint64_t v8 = [(REMFileAttachment *)self fileURL];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        objc_super v10 = [v5 fileURL];
        v11 = [(REMFileAttachment *)self fileURL];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      int v14 = [v5 isTemporaryFileURL];
      int v13 = v14 ^ [(REMFileAttachment *)self isTemporaryFileURL] ^ 1;
      goto LABEL_9;
    }
LABEL_5:
    LOBYTE(v13) = 0;
LABEL_9:

    goto LABEL_10;
  }
  LOBYTE(v13) = 0;
LABEL_10:

  return v13;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (BOOL)isTemporaryFileURL
{
  return self->_isTemporaryFileURL;
}

- (void)setIsTemporaryFileURL:(BOOL)a3
{
  self->_isTemporaryFileURL = a3;
}

- (void).cxx_destruct
{
}

+ (void)createTemporaryFileURLWithUTI:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Unable to create temporary directory because {error: %@}", v2, v3, v4, v5, v6);
}

+ (void)createTemporaryFileWithData:UTI:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Unable to write temporary file because {error: %@}", v2, v3, v4, v5, v6);
}

- (void)_deepCopy
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Unable to link temporary file because {error: %@}", v2, v3, v4, v5, v6);
}

@end