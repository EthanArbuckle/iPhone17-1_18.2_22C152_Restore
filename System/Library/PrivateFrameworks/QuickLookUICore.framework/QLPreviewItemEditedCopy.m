@interface QLPreviewItemEditedCopy
+ (BOOL)supportsSecureCoding;
- (BOOL)containerStillExists;
- (BOOL)isEqual:(id)a3;
- (BOOL)temporaryDirectoryWasCreatedInHost;
- (FPSandboxingURLWrapper)directoryURLWrapper;
- (FPSandboxingURLWrapper)editedCopyURLWrapper;
- (NSString)outputURLContentType;
- (NSURL)containerURL;
- (NSURL)editedCopyURL;
- (NSURL)hostTemporaryContainerURL;
- (NSURL)url;
- (NSUUID)uuid;
- (QLPreviewItemEditedCopy)initWithCoder:(id)a3;
- (QLPreviewItemEditedCopy)initWithEditedCopyURL:(id)a3;
- (QLPreviewItemEditedCopy)initWithEditedCopyURL:(id)a3 containerTemporaryURL:(id)a4 temporaryDirectoryCreatedInHost:(BOOL)a5;
- (QLPreviewItemEditedCopy)initWithEditedCopyURL:(id)a3 temporaryDirectoryCreatedInHost:(BOOL)a4;
- (id)description;
- (unint64_t)version;
- (void)bumpVersion;
- (void)encodeWithCoder:(id)a3;
- (void)markAsPurgeable;
- (void)removeFromDisk:(BOOL)a3;
- (void)setDirectoryURLWrapper:(id)a3;
- (void)setEditedCopyURL:(id)a3;
- (void)setEditedCopyURLWrapper:(id)a3;
- (void)setHostTemporaryContainerURL:(id)a3;
- (void)setTemporaryDirectoryWasCreatedInHost:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation QLPreviewItemEditedCopy

- (QLPreviewItemEditedCopy)initWithEditedCopyURL:(id)a3
{
  return [(QLPreviewItemEditedCopy *)self initWithEditedCopyURL:a3 temporaryDirectoryCreatedInHost:0];
}

- (QLPreviewItemEditedCopy)initWithEditedCopyURL:(id)a3 temporaryDirectoryCreatedInHost:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)QLPreviewItemEditedCopy;
  v8 = [(QLPreviewItemEditedCopy *)&v21 init];
  v9 = v8;
  if (v8)
  {
    if (v4)
    {
      objc_storeStrong((id *)&v8->_editedCopyURL, a3);
      editedCopyURLWrapper = v9->_editedCopyURLWrapper;
      v9->_editedCopyURLWrapper = 0;
    }
    else
    {
      id v20 = 0;
      uint64_t v12 = [MEMORY[0x1E4F25D78] wrapperWithURL:v7 readonly:0 error:&v20];
      id v11 = v20;
      v13 = v9->_editedCopyURLWrapper;
      v9->_editedCopyURLWrapper = (FPSandboxingURLWrapper *)v12;

      editedCopyURL = v9->_editedCopyURL;
      v9->_editedCopyURL = 0;

      if (v11 || !v9->_editedCopyURLWrapper)
      {
        v15 = *MEMORY[0x1E4F945F0];
        if (!*MEMORY[0x1E4F945F0])
        {
          v19 = (NSObject **)MEMORY[0x1E4F945F0];
          QLSInitLogging();
          v15 = *v19;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v11;
          _os_log_impl(&dword_1E2805000, v15, OS_LOG_TYPE_ERROR, "Could not create sandbox wrapper. Error: %@ #Generic", buf, 0xCu);
        }
        goto LABEL_10;
      }
    }
    id v11 = 0;
LABEL_10:
    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v16;

    v9->_version = 1;
    v9->_temporaryDirectoryWasCreatedInHost = v4;
  }
  return v9;
}

- (QLPreviewItemEditedCopy)initWithEditedCopyURL:(id)a3 containerTemporaryURL:(id)a4 temporaryDirectoryCreatedInHost:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v10 = [(QLPreviewItemEditedCopy *)self initWithEditedCopyURL:a3 temporaryDirectoryCreatedInHost:v5];
  id v11 = v10;
  if (v10)
  {
    v10->_temporaryDirectoryWasCreatedInHost = v5;
    if (v5)
    {
      objc_storeStrong((id *)&v10->_hostTemporaryContainerURL, a4);
      directoryURLWrapper = v11->_directoryURLWrapper;
      v11->_directoryURLWrapper = 0;
    }
    else
    {
      id v20 = 0;
      uint64_t v13 = [MEMORY[0x1E4F25D78] wrapperWithURL:v9 readonly:0 error:&v20];
      id v14 = v20;
      v15 = v11->_directoryURLWrapper;
      v11->_directoryURLWrapper = (FPSandboxingURLWrapper *)v13;

      hostTemporaryContainerURL = v11->_hostTemporaryContainerURL;
      v11->_hostTemporaryContainerURL = 0;

      if (v14 || !v11->_directoryURLWrapper)
      {
        v17 = (NSObject **)MEMORY[0x1E4F945F0];
        v18 = *MEMORY[0x1E4F945F0];
        if (!*MEMORY[0x1E4F945F0])
        {
          QLSInitLogging();
          v18 = *v17;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v14;
          _os_log_impl(&dword_1E2805000, v18, OS_LOG_TYPE_ERROR, "Could not create sandbox wrapper. Error: %@ #Generic", buf, 0xCu);
        }
      }
    }
  }

  return v11;
}

- (void)bumpVersion
{
}

- (BOOL)containerStillExists
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v4 = [(QLPreviewItemEditedCopy *)self containerURL];
  BOOL v5 = [v4 path];
  char v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

- (void)markAsPurgeable
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 66565;
  id v3 = [(QLPreviewItemEditedCopy *)self url];
  BOOL v4 = (const char *)[v3 fileSystemRepresentation];

  int v5 = fsctl(v4, 0xC0084A44uLL, &v30, 0);
  char v6 = (NSObject **)MEMORY[0x1E4F945F0];
  id v7 = *MEMORY[0x1E4F945F0];
  if (v5)
  {
    if (!v7)
    {
      QLSInitLogging();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      id v9 = [(QLPreviewItemEditedCopy *)self url];
      int v10 = *__error();
      id v11 = __error();
      uint64_t v12 = strerror(*v11);
      *(_DWORD *)buf = 138413314;
      v32 = v9;
      __int16 v33 = 1024;
      *(_DWORD *)v34 = v10;
      *(_WORD *)&v34[4] = 2080;
      *(void *)&v34[6] = v12;
      *(_WORD *)&v34[14] = 2048;
      *(void *)&v34[16] = v30;
      __int16 v35 = 2112;
      v36 = self;
      uint64_t v13 = "Failed to mark edited file %@ as purgeable: %d (%s) (flags 0x%llx) . %@ #PreviewItem";
      id v14 = v8;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 48;
LABEL_10:
      _os_log_impl(&dword_1E2805000, v14, v15, v13, buf, v16);
    }
  }
  else
  {
    if (!v7)
    {
      QLSInitLogging();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      id v9 = [(QLPreviewItemEditedCopy *)self url];
      *(_DWORD *)buf = 138412802;
      v32 = v9;
      __int16 v33 = 2048;
      *(void *)v34 = v30;
      *(_WORD *)&v34[8] = 2112;
      *(void *)&v34[10] = self;
      uint64_t v13 = "Marked edited file %@ as purgeable (flags 0x%llx) . %@ #PreviewItem";
      id v14 = v8;
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      uint32_t v16 = 32;
      goto LABEL_10;
    }
  }
  id v17 = [(QLPreviewItemEditedCopy *)self containerURL];
  v18 = (const char *)[v17 fileSystemRepresentation];

  int v19 = fsctl(v18, 0xC0084A44uLL, &v30, 0);
  id v20 = *v6;
  if (v19)
  {
    if (!v20)
    {
      QLSInitLogging();
      id v20 = *v6;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_super v21 = v20;
      id v22 = [(QLPreviewItemEditedCopy *)self containerURL];
      int v23 = *__error();
      uint64_t v24 = __error();
      v25 = strerror(*v24);
      *(_DWORD *)buf = 138413314;
      v32 = v22;
      __int16 v33 = 1024;
      *(_DWORD *)v34 = v23;
      *(_WORD *)&v34[4] = 2080;
      *(void *)&v34[6] = v25;
      *(_WORD *)&v34[14] = 2048;
      *(void *)&v34[16] = v30;
      __int16 v35 = 2112;
      v36 = self;
      v26 = "Failed to mark container %@ as purgeable: %d (%s) (flags 0x%llx) . %@ #PreviewItem";
      v27 = v21;
      os_log_type_t v28 = OS_LOG_TYPE_ERROR;
      uint32_t v29 = 48;
LABEL_20:
      _os_log_impl(&dword_1E2805000, v27, v28, v26, buf, v29);
    }
  }
  else
  {
    if (!v20)
    {
      QLSInitLogging();
      id v20 = *v6;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_super v21 = v20;
      id v22 = [(QLPreviewItemEditedCopy *)self containerURL];
      *(_DWORD *)buf = 138412802;
      v32 = v22;
      __int16 v33 = 2048;
      *(void *)v34 = v30;
      *(_WORD *)&v34[8] = 2112;
      *(void *)&v34[10] = self;
      v26 = "Marked container %@ as purgeable (flags 0x%llx) . %@ #PreviewItem";
      v27 = v21;
      os_log_type_t v28 = OS_LOG_TYPE_INFO;
      uint32_t v29 = 32;
      goto LABEL_20;
    }
  }
}

- (void)removeFromDisk:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  os_log_type_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  int v5 = objc_opt_new();
  char v6 = [(QLPreviewItemEditedCopy *)self url];
  id v7 = [(QLPreviewItemEditedCopy *)self containerURL];
  id v13 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__QLPreviewItemEditedCopy_removeFromDisk___block_invoke;
  v11[3] = &unk_1E6DD3E80;
  v11[4] = self;
  v11[5] = &v14;
  BOOL v12 = a3;
  [v5 coordinateWritingItemAtURL:v6 options:1 writingItemAtURL:v7 options:1 error:&v13 byAccessor:v11];
  id v8 = v13;

  if (!*((unsigned char *)v15 + 24))
  {
    id v9 = (NSObject **)MEMORY[0x1E4F945F0];
    int v10 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      int v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      objc_super v21 = self;
      _os_log_impl(&dword_1E2805000, v10, OS_LOG_TYPE_ERROR, "Cannot remove edited file because coordination failed with error: %@. %@ #PreviewItem", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v14, 8);
}

void __42__QLPreviewItemEditedCopy_removeFromDisk___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v7 = [v5 path];
  id v8 = [v6 path];
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = v9;
  if (v7 && [v9 fileExistsAtPath:v7])
  {
    id v32 = 0;
    char v11 = [v10 removeItemAtURL:v5 error:&v32];
    id v12 = v32;
    id v13 = (NSObject **)MEMORY[0x1E4F945F0];
    uint64_t v14 = *MEMORY[0x1E4F945F0];
    if (v11)
    {
      if (!v14)
      {
        QLSInitLogging();
        uint64_t v14 = *v13;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      os_log_type_t v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v34 = v15;
      uint64_t v16 = "Removed edited file. %@ #PreviewItem";
      char v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
      uint32_t v19 = 12;
    }
    else
    {
      if (!v14)
      {
        QLSInitLogging();
        uint64_t v14 = *v13;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v34 = v12;
      __int16 v35 = 2112;
      uint64_t v36 = v20;
      uint64_t v16 = "Cannot remove edited file with error: %@. %@ #PreviewItem";
      char v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 22;
    }
    _os_log_impl(&dword_1E2805000, v17, v18, v16, buf, v19);
LABEL_13:
  }
  if (*(unsigned char *)(a1 + 48) && v8 && [v10 fileExistsAtPath:v8])
  {
    id v31 = 0;
    char v21 = [v10 removeItemAtURL:v6 error:&v31];
    id v22 = v31;
    int v23 = (NSObject **)MEMORY[0x1E4F945F0];
    uint64_t v24 = *MEMORY[0x1E4F945F0];
    if (v21)
    {
      if (!v24)
      {
        QLSInitLogging();
        uint64_t v24 = *v23;
      }
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_27;
      }
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v34 = v25;
      v26 = "Removed edited file directory. %@ #PreviewItem";
      v27 = v24;
      os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
      uint32_t v29 = 12;
    }
    else
    {
      if (!v24)
      {
        QLSInitLogging();
        uint64_t v24 = *v23;
      }
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      uint64_t v30 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v34 = v22;
      __int16 v35 = 2112;
      uint64_t v36 = v30;
      v26 = "Cannot remove edited file directory with error: %@. %@ #PreviewItem";
      v27 = v24;
      os_log_type_t v28 = OS_LOG_TYPE_ERROR;
      uint32_t v29 = 22;
    }
    _os_log_impl(&dword_1E2805000, v27, v28, v26, buf, v29);
LABEL_27:
  }
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (QLPreviewItemEditedCopy *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [(QLPreviewItemEditedCopy *)self uuid];
      id v9 = [(QLPreviewItemEditedCopy *)v7 uuid];
      if (v8 != v9)
      {
        id v3 = [(QLPreviewItemEditedCopy *)self uuid];
        BOOL v4 = [(QLPreviewItemEditedCopy *)v7 uuid];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_22;
        }
      }
      unint64_t v11 = [(QLPreviewItemEditedCopy *)self version];
      if (v11 != [(QLPreviewItemEditedCopy *)v7 version])
      {
        char v10 = 0;
        goto LABEL_21;
      }
      id v12 = [(QLPreviewItemEditedCopy *)self url];
      id v13 = [(QLPreviewItemEditedCopy *)v7 url];
      if (v12 == v13)
      {
        uint64_t v14 = [(QLPreviewItemEditedCopy *)self containerURL];
        uint64_t v15 = [(QLPreviewItemEditedCopy *)v7 containerURL];
        if (v14 == v15)
        {
          char v10 = 1;
          char v21 = (void *)v14;
          id v22 = (void *)v14;
LABEL_19:

LABEL_20:
LABEL_21:
          if (v8 == v9)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        char v21 = (void *)v14;
        id v22 = (void *)v15;
      }
      v25 = v12;
      uint64_t v16 = [(QLPreviewItemEditedCopy *)self url];
      char v17 = [(QLPreviewItemEditedCopy *)v7 url];
      if ([v16 isEqual:v17])
      {
        [(QLPreviewItemEditedCopy *)self containerURL];
        v18 = uint64_t v24 = v3;
        [(QLPreviewItemEditedCopy *)v7 containerURL];
        v19 = int v23 = v4;
        char v10 = [v18 isEqual:v19];

        BOOL v4 = v23;
        id v3 = v24;
      }
      else
      {

        char v10 = 0;
      }
      id v12 = v25;
      if (v25 != v13) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    char v10 = 0;
  }
LABEL_24:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(QLPreviewItemEditedCopy *)self url];
  id v6 = [(QLPreviewItemEditedCopy *)self containerURL];
  id v7 = [v3 stringWithFormat:@"<%@ %@ %@>", v4, v5, v6];

  return v7;
}

- (NSURL)url
{
  if ([(QLPreviewItemEditedCopy *)self temporaryDirectoryWasCreatedInHost])
  {
    id v3 = self->_editedCopyURL;
  }
  else
  {
    id v3 = [(FPSandboxingURLWrapper *)self->_editedCopyURLWrapper url];
  }
  return v3;
}

- (NSURL)containerURL
{
  if ([(QLPreviewItemEditedCopy *)self temporaryDirectoryWasCreatedInHost])
  {
    id v3 = self->_hostTemporaryContainerURL;
  }
  else
  {
    id v3 = [(FPSandboxingURLWrapper *)self->_directoryURLWrapper url];
  }
  return v3;
}

- (NSString)outputURLContentType
{
  v2 = (void *)MEMORY[0x1E4F3A700];
  id v3 = [(QLPreviewItemEditedCopy *)self url];
  uint64_t v4 = [v2 UTIForURL:v3];

  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uuid = self->_uuid;
  id v11 = v4;
  if (uuid)
  {
    [v4 encodeObject:uuid forKey:@"uuid"];
    id v4 = v11;
  }
  editedCopyURL = self->_editedCopyURL;
  if (editedCopyURL)
  {
    [v11 encodeObject:editedCopyURL forKey:@"editedCopyURL"];
    id v4 = v11;
  }
  editedCopyURLWrapper = self->_editedCopyURLWrapper;
  if (editedCopyURLWrapper)
  {
    [v11 encodeObject:editedCopyURLWrapper forKey:@"editedCopyURLWrapper"];
    id v4 = v11;
  }
  hostTemporaryContainerURL = self->_hostTemporaryContainerURL;
  if (hostTemporaryContainerURL)
  {
    [v11 encodeObject:hostTemporaryContainerURL forKey:@"hostTemporaryContainerURL"];
    id v4 = v11;
  }
  directoryURLWrapper = self->_directoryURLWrapper;
  if (directoryURLWrapper)
  {
    [v11 encodeObject:directoryURLWrapper forKey:@"directoryURLWrapper"];
    id v4 = v11;
  }
  unint64_t version = self->_version;
  if (version)
  {
    [v11 encodeInteger:version forKey:@"version"];
    id v4 = v11;
  }
  [v4 encodeBool:self->_temporaryDirectoryWasCreatedInHost forKey:@"temporaryDirectoryWasCreatedInHost"];
}

- (QLPreviewItemEditedCopy)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)QLPreviewItemEditedCopy;
  id v5 = [(QLPreviewItemEditedCopy *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"editedCopyURL"];
    editedCopyURL = v5->_editedCopyURL;
    v5->_editedCopyURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"editedCopyURLWrapper"];
    editedCopyURLWrapper = v5->_editedCopyURLWrapper;
    v5->_editedCopyURLWrapper = (FPSandboxingURLWrapper *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostTemporaryContainerURL"];
    hostTemporaryContainerURL = v5->_hostTemporaryContainerURL;
    v5->_hostTemporaryContainerURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"directoryURLWrapper"];
    directoryURLWrapper = v5->_directoryURLWrapper;
    v5->_directoryURLWrapper = (FPSandboxingURLWrapper *)v14;

    v5->_unint64_t version = [v4 decodeIntegerForKey:@"version"];
    v5->_temporaryDirectoryWasCreatedInHost = [v4 decodeBoolForKey:@"temporaryDirectoryWasCreatedInHost"];
    uint64_t v16 = v5;
  }

  return v5;
}

- (BOOL)temporaryDirectoryWasCreatedInHost
{
  return self->_temporaryDirectoryWasCreatedInHost;
}

- (void)setTemporaryDirectoryWasCreatedInHost:(BOOL)a3
{
  self->_temporaryDirectoryWasCreatedInHost = a3;
}

- (FPSandboxingURLWrapper)editedCopyURLWrapper
{
  return self->_editedCopyURLWrapper;
}

- (void)setEditedCopyURLWrapper:(id)a3
{
}

- (FPSandboxingURLWrapper)directoryURLWrapper
{
  return self->_directoryURLWrapper;
}

- (void)setDirectoryURLWrapper:(id)a3
{
}

- (NSURL)editedCopyURL
{
  return self->_editedCopyURL;
}

- (void)setEditedCopyURL:(id)a3
{
}

- (NSURL)hostTemporaryContainerURL
{
  return self->_hostTemporaryContainerURL;
}

- (void)setHostTemporaryContainerURL:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_unint64_t version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_hostTemporaryContainerURL, 0);
  objc_storeStrong((id *)&self->_editedCopyURL, 0);
  objc_storeStrong((id *)&self->_directoryURLWrapper, 0);
  objc_storeStrong((id *)&self->_editedCopyURLWrapper, 0);
}

@end