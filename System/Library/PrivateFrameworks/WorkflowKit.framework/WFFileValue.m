@interface WFFileValue
+ (id)createBookmarkWithFileURL:(id)a3 workflowID:(id)a4;
+ (id)defaultValueWithWorkflowID:(id)a3;
- (BOOL)isSupportedOnCurrentDevice;
- (NSData)bookmarkData;
- (NSString)cachedDisplayName;
- (NSString)displayName;
- (NSString)filename;
- (NSURL)URL;
- (WFFileLocation)fileLocation;
- (WFFileValue)initWithBookmarkData:(id)a3 filename:(id)a4 displayName:(id)a5;
- (WFFileValue)initWithFileLocation:(id)a3 filename:(id)a4 displayName:(id)a5;
- (WFFileValue)initWithFileLocation:(id)a3 filename:(id)a4 displayName:(id)a5 reloadDisplayName:(BOOL)a6;
- (WFFileValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFFileValue)initWithURL:(id)a3;
- (WFFileValue)initWithURL:(id)a3 workflowID:(id)a4;
- (WFPropertyListObject)serializedRepresentation;
- (id)resolveURLWithWorkflowID:(id)a3 error:(id *)a4;
@end

@implementation WFFileValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDisplayName, 0);
  objc_storeStrong((id *)&self->_fileLocation, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
}

- (NSString)cachedDisplayName
{
  return self->_cachedDisplayName;
}

- (WFFileLocation)fileLocation
{
  return self->_fileLocation;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSData)bookmarkData
{
  return self->_bookmarkData;
}

- (id)resolveURLWithWorkflowID:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = getWFFilesLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEBUG, "%s Resolving URL", buf, 0xCu);
  }

  v8 = [(WFFileValue *)self URL];

  if (v8)
  {
    v9 = [(WFFileValue *)self URL];
    goto LABEL_43;
  }
  v10 = [(WFFileValue *)self fileLocation];

  if (v6 && v10)
  {
    v11 = [(WFFileValue *)self fileLocation];
    id v46 = 0;
    id v12 = [v11 resolveLocationWithError:&v46];
    id v13 = v46;

    v14 = getWFFilesLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(WFFileValue *)self fileLocation];
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 136315650;
      v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
      __int16 v49 = 2112;
      id v50 = v12;
      __int16 v51 = 2112;
      id v52 = v17;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEFAULT, "%s Attemping to create wrapper from url: %@ file location type: %@", buf, 0x20u);
    }
    if (!v12)
    {
      v35 = getWFFilesLogObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
        __int16 v49 = 2112;
        id v50 = v13;
        _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_ERROR, "%s Could not resolve file location with error: %@", buf, 0x16u);
      }

      if (v13)
      {
        id v21 = v13;
        v9 = 0;
        *a4 = v21;
        goto LABEL_42;
      }
      id v40 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
      *a4 = v40;

      id v21 = 0;
LABEL_41:
      v9 = 0;
      goto LABEL_42;
    }
    v18 = [MEMORY[0x1E4FB4540] standardClient];
    v19 = [v12 path];
    id v45 = v13;
    v20 = [v18 resolveFilePath:v19 workflowID:v6 error:&v45];
    id v21 = v45;

    if (v20)
    {
      v22 = [v20 url];
      URL = self->_URL;
      self->_URL = v22;

      goto LABEL_24;
    }
    v38 = getWFFilesLogObject();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = [v12 path];
      *(_DWORD *)buf = 136315650;
      v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
      __int16 v49 = 2112;
      id v50 = v39;
      __int16 v51 = 2114;
      id v52 = v21;
      _os_log_impl(&dword_1C7F0A000, v38, OS_LOG_TYPE_ERROR, "%s Failed to look up file path: %@: %{public}@", buf, 0x20u);
    }
    id v37 = v21;
    id v21 = v37;
    goto LABEL_37;
  }
  v24 = [(WFFileValue *)self bookmarkData];

  if (v24)
  {
    v25 = [MEMORY[0x1E4FB4540] standardClient];
    v26 = [(WFFileValue *)self bookmarkData];
    id v43 = 0;
    id v44 = 0;
    v27 = [v25 resolveBookmarkData:v26 updatedData:&v44 error:&v43];
    id v12 = v44;
    id v21 = v43;

    if (v27)
    {
      v28 = [v27 url];
      v29 = self->_URL;
      self->_URL = v28;

      goto LABEL_24;
    }
    v36 = getWFFilesLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
      __int16 v49 = 2112;
      id v50 = v21;
      _os_log_impl(&dword_1C7F0A000, v36, OS_LOG_TYPE_ERROR, "%s Failed to resolve bookmark data error: %@", buf, 0x16u);
    }

    if (!a4) {
      goto LABEL_38;
    }
    id v37 = v21;
LABEL_37:
    *a4 = v37;
LABEL_38:

    goto LABEL_41;
  }
  v30 = [(WFFileValue *)self fileLocation];

  if (!v30)
  {
    id v21 = 0;
    goto LABEL_25;
  }
  v31 = getWFFilesLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
    _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_DEFAULT, "%s No workflowID given but a file location found. Falling back to non security scoped URL.", buf, 0xCu);
  }

  v32 = [(WFFileValue *)self fileLocation];
  id v42 = 0;
  v33 = [v32 resolveLocationWithError:&v42];
  id v21 = v42;

  if (!v33)
  {
    v34 = getWFFilesLogObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[WFFileValue resolveURLWithWorkflowID:error:]";
      __int16 v49 = 2114;
      id v50 = v21;
      _os_log_impl(&dword_1C7F0A000, v34, OS_LOG_TYPE_ERROR, "%s Could not create file from file location %{public}@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v21;
    }
  }
  id v12 = self->_URL;
  self->_URL = v33;
LABEL_24:

LABEL_25:
  v9 = [(WFFileValue *)self URL];
LABEL_42:

LABEL_43:
  return v9;
}

- (NSString)displayName
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  displayName = self->_displayName;
  if (displayName) {
    goto LABEL_9;
  }
  uint64_t v4 = [(WFFileValue *)self URL];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = 0;
    goto LABEL_6;
  }
  v7 = [(WFFileValue *)self fileLocation];

  if (v7)
  {
    v8 = [(WFFileValue *)self fileLocation];
    id v15 = 0;
    v5 = [v8 resolveLocationWithError:&v15];
    id v6 = v15;

    if (v5) {
      goto LABEL_6;
    }
LABEL_14:
    v11 = self->_cachedDisplayName;

    goto LABEL_10;
  }
  id v14 = 0;
  v5 = [(WFFileValue *)self resolveURLWithWorkflowID:0 error:&v14];
  id v6 = v14;
  if (!v5) {
    goto LABEL_14;
  }
LABEL_6:
  objc_msgSend(v5, "wf_localizedDisplayName");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v9 || (v9 = self->_cachedDisplayName) != 0)
  {
    v10 = self->_displayName;
    self->_displayName = v9;

    displayName = self->_displayName;
LABEL_9:
    v11 = displayName;
    goto LABEL_10;
  }
  id v13 = getWFFilesLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[WFFileValue displayName]";
    __int16 v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Could not get displayName for URL: %@ falling back to last path component", buf, 0x16u);
  }

  v11 = [v5 lastPathComponent];

LABEL_10:
  return v11;
}

- (NSString)filename
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  filename = self->_filename;
  if (filename)
  {
    v3 = filename;
    goto LABEL_10;
  }
  v5 = [(WFFileValue *)self fileLocation];

  if (!v5)
  {
    id v12 = 0;
    v7 = [(WFFileValue *)self resolveURLWithWorkflowID:0 error:&v12];
    id v8 = v12;
    if (v7) {
      goto LABEL_5;
    }
LABEL_7:
    v10 = getWFFilesLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[WFFileValue filename]";
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Could not resolve url with error: %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  id v6 = [(WFFileValue *)self fileLocation];
  id v13 = 0;
  v7 = [v6 resolveLocationWithError:&v13];
  id v8 = v13;

  if (!v7) {
    goto LABEL_7;
  }
LABEL_5:
  v9 = [v7 lastPathComponent];
  v10 = self->_filename;
  self->_filename = v9;
LABEL_9:

  v3 = self->_filename;
LABEL_10:
  return v3;
}

- (BOOL)isSupportedOnCurrentDevice
{
  return 1;
}

- (WFPropertyListObject)serializedRepresentation
{
  v3 = objc_opt_new();
  uint64_t v4 = [(WFFileValue *)self fileLocation];
  v5 = [v4 serializedRepresentation];

  [v3 setValue:v5 forKey:@"fileLocation"];
  id v6 = [(WFFileValue *)self bookmarkData];
  [v3 setValue:v6 forKey:@"bookmarkData"];

  v7 = [(WFFileValue *)self filename];
  [v3 setValue:v7 forKey:@"filename"];

  id v8 = [(WFFileValue *)self displayName];
  [v3 setValue:v8 forKey:@"displayName"];

  return (WFPropertyListObject *)v3;
}

- (WFFileValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  v10 = WFEnforceClass(v8, v9);

  if (v10)
  {
    v11 = [v10 objectForKey:@"fileLocation"];
    id v12 = [v10 objectForKey:@"bookmarkData"];
    uint64_t v13 = objc_opt_class();
    id v14 = WFEnforceClass(v12, v13);

    id v15 = [v10 objectForKey:@"filename"];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v16 = v15;
      }
      else {
        __int16 v16 = 0;
      }
    }
    else
    {
      __int16 v16 = 0;
    }
    id v18 = v16;

    v19 = [v10 objectForKey:@"displayName"];
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    id v21 = v20;

    v22 = +[WFFileLocation locationWithSerializedRepresentation:v11];
    if (v22)
    {
      self = [(WFFileValue *)self initWithFileLocation:v22 filename:v18 displayName:v21];
      id v17 = self;
LABEL_37:

      goto LABEL_38;
    }
    if (!v14)
    {
      id v17 = 0;
      goto LABEL_37;
    }
    id v23 = v7;
    id v43 = v14;
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
    }
    id v25 = v24;

    v26 = [v25 workflow];
    v27 = [v26 workflowID];

    id v42 = v25;
    if (v27)
    {
      v28 = getWFFilesLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFFileValue initWithSerializedRepresentation:variableProvider:parameter:]";
        _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_DEFAULT, "%s Attempting to convert bookmark based file value into file location based value", buf, 0xCu);
      }

      v29 = [MEMORY[0x1E4FB4540] standardClient];
      id v44 = 0;
      id v45 = 0;
      id v14 = v43;
      v30 = [v29 resolveBookmarkData:v43 updatedData:&v45 error:&v44];
      id v40 = v45;
      id v41 = v44;

      v39 = v30;
      if (v30)
      {
        v38 = [WFFileValue alloc];
        id v37 = [v30 url];
        v31 = [v42 workflow];
        v32 = [v31 workflowID];
        id v17 = [(WFFileValue *)v38 initWithURL:v37 workflowID:v32];

        if (v17)
        {
          v33 = v17;
          int v34 = 1;
        }
        else
        {
          int v34 = 0;
        }

        id v14 = v43;
      }
      else
      {
        v35 = getWFFilesLogObject();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v47 = "-[WFFileValue initWithSerializedRepresentation:variableProvider:parameter:]";
          __int16 v48 = 2112;
          id v49 = v41;
          _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_ERROR, "%s Failed to resolve bookmark data error: %@", buf, 0x16u);
        }

        self = [(WFFileValue *)self initWithBookmarkData:v43 filename:v18 displayName:v21];
        int v34 = 1;
        id v17 = self;
      }

      if (v34) {
        goto LABEL_36;
      }
    }
    else
    {
      id v14 = v43;
    }
    self = [(WFFileValue *)self initWithBookmarkData:v14 filename:v18 displayName:v21];
    id v17 = self;
LABEL_36:

    goto LABEL_37;
  }
  id v17 = 0;
LABEL_38:

  return v17;
}

- (WFFileValue)initWithFileLocation:(id)a3 filename:(id)a4 displayName:(id)a5 reloadDisplayName:(BOOL)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFFileValue.m", 132, @"Invalid parameter not satisfying: %@", @"fileLocation" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)WFFileValue;
  id v15 = [(WFFileValue *)&v24 init];
  __int16 v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fileLocation, a3);
    objc_storeStrong((id *)&v16->_filename, a4);
    uint64_t v17 = [v14 copy];
    cachedDisplayName = v16->_cachedDisplayName;
    v16->_cachedDisplayName = (NSString *)v17;

    if (!a6)
    {
      uint64_t v19 = [v14 copy];
      displayName = v16->_displayName;
      v16->_displayName = (NSString *)v19;
    }
    id v21 = v16;
  }

  return v16;
}

- (WFFileValue)initWithFileLocation:(id)a3 filename:(id)a4 displayName:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFFileValue.m", 119, @"Invalid parameter not satisfying: %@", @"fileLocation" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFFileValue;
  id v13 = [(WFFileValue *)&v20 init];
  if (v13)
  {
    id v14 = v13;
    objc_storeStrong((id *)&v13->_fileLocation, a3);
    objc_storeStrong((id *)&v14->_filename, a4);
    uint64_t v15 = [v12 copy];
    cachedDisplayName = v14->_cachedDisplayName;
    v14->_cachedDisplayName = (NSString *)v15;

    uint64_t v17 = [(WFFileValue *)v14 initWithFileLocation:v10 filename:v11 displayName:v12 reloadDisplayName:1];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (WFFileValue)initWithURL:(id)a3 workflowID:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFFileValue.m", 78, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFFileValue;
  id v10 = [(WFFileValue *)&v20 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_URL, a3);
    uint64_t v12 = +[WFFileLocation locationWithURL:v8];
    fileLocation = v11->_fileLocation;
    v11->_fileLocation = (WFFileLocation *)v12;

    uint64_t v14 = [v8 lastPathComponent];
    filename = v11->_filename;
    v11->_filename = (NSString *)v14;

    if (v9) {
      id v16 = (id)[(id)objc_opt_class() createBookmarkWithFileURL:v8 workflowID:v9];
    }
    uint64_t v17 = v11;
  }

  return v11;
}

- (WFFileValue)initWithBookmarkData:(id)a3 filename:(id)a4 displayName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WFFileValue;
  uint64_t v12 = [(WFFileValue *)&v16 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmarkData, a3);
    objc_storeStrong((id *)&v13->_filename, a4);
    objc_storeStrong((id *)&v13->_cachedDisplayName, a5);
    uint64_t v14 = v13;
  }

  return v13;
}

- (WFFileValue)initWithURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFFileValue.m", 45, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)WFFileValue;
  id v7 = [(WFFileValue *)&v19 init];
  if (v7)
  {
    id v8 = [(id)objc_opt_class() createBookmarkWithFileURL:v6 workflowID:0];
    if (!v8)
    {
      id v9 = getWFFilesLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v21 = "-[WFFileValue initWithURL:]";
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Could not create bookmark (%@) for data backed file value falling back to URL backing", buf, 0x16u);
      }

      objc_storeStrong((id *)&v7->_URL, a3);
      uint64_t v10 = +[WFFileLocation locationWithURL:v6];
      fileLocation = v7->_fileLocation;
      v7->_fileLocation = (WFFileLocation *)v10;
    }
    uint64_t v12 = objc_msgSend(v6, "wf_localizedDisplayName");
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v6 lastPathComponent];
    }
    uint64_t v15 = v14;

    objc_super v16 = [v6 lastPathComponent];
    id v7 = [(WFFileValue *)v7 initWithBookmarkData:v8 filename:v16 displayName:v15];
  }
  return v7;
}

+ (id)defaultValueWithWorkflowID:(id)a3
{
  uint64_t v4 = +[WFShortcutsFileLocation locationAtRootDirectory];
  id v5 = objc_alloc((Class)a1);
  id v6 = WFLocalizedStringWithKey(@"Shortcuts iCloud Folder", @"Shortcuts");
  id v7 = (void *)[v5 initWithFileLocation:v4 filename:@"Documents" displayName:v6 reloadDisplayName:0];

  return v7;
}

+ (id)createBookmarkWithFileURL:(id)a3 workflowID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_msgSend(v5, "wf_fileIsWritable");
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v8 = (void *)getFPSandboxingURLWrapperClass_softClass;
  uint64_t v25 = getFPSandboxingURLWrapperClass_softClass;
  if (!getFPSandboxingURLWrapperClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getFPSandboxingURLWrapperClass_block_invoke;
    v27 = &unk_1E6558B78;
    v28 = &v22;
    __getFPSandboxingURLWrapperClass_block_invoke((uint64_t)buf);
    id v8 = (void *)v23[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v22, 8);
  id v21 = 0;
  uint64_t v10 = [v9 wrapperWithURL:v5 readonly:v7 ^ 1u error:&v21];
  id v11 = v21;
  uint64_t v12 = [MEMORY[0x1E4FB4510] accessSpecifierForCurrentProcess];
  id v13 = [v12 bundleIdentifier];
  char v14 = [v13 isEqualToString:*MEMORY[0x1E4FB4AC0]];

  if (v14)
  {
    id v15 = v11;
LABEL_8:
    id v18 = getWFFilesLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "+[WFFileValue createBookmarkWithFileURL:workflowID:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      v27 = v15;
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_ERROR, "%s Could not create bookmark at URL: %@ with error: %@", buf, 0x20u);
    }
    uint64_t v17 = 0;
    goto LABEL_11;
  }
  objc_super v16 = [MEMORY[0x1E4FB4540] standardClient];
  id v20 = v11;
  uint64_t v17 = [v16 createBookmarkWithURL:v10 workflowID:v6 error:&v20];
  id v15 = v20;

  if (!v17) {
    goto LABEL_8;
  }
  id v18 = getWFFilesLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "+[WFFileValue createBookmarkWithFileURL:workflowID:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    v27 = v6;
    _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_DEBUG, "%s Created bookmark at URL: %@ for workflowID: %@", buf, 0x20u);
  }
LABEL_11:

  return v17;
}

@end