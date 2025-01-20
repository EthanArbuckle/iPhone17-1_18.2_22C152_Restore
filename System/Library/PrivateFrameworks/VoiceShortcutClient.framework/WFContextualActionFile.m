@interface WFContextualActionFile
+ (BOOL)supportsSecureCoding;
- (NSURL)fileURL;
- (UTType)type;
- (WFContextualActionFile)initWithCoder:(id)a3;
- (WFContextualActionFile)initWithFileURL:(id)a3 type:(id)a4;
- (id)description;
- (void)dispose;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContextualActionFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (UTType)type
{
  return self->_type;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [getFPSandboxingURLWrapperClass() wrapperWithURL:self->_fileURL readonly:0 error:0];
  [v4 encodeObject:v5 forKey:@"SecurityScopedURLWrapper"];
  [v4 encodeObject:self->_type forKey:@"type"];
}

- (WFContextualActionFile)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:getFPSandboxingURLWrapperClass() forKey:@"SecurityScopedURLWrapper"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];

  v7 = 0;
  if (v5 && v6)
  {
    v8 = [v5 url];
    self = [(WFContextualActionFile *)self initWithFileURL:v8 type:v6];

    v7 = self;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(WFContextualActionFile *)self fileURL];
  v7 = [(WFContextualActionFile *)self type];
  v8 = [v3 stringWithFormat:@"<%@ %p url=%@, type=%@>", v5, self, v6, v7];

  return v8;
}

- (void)dispose
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(WFContextualActionFile *)self fileURL];
  id v6 = 0;
  [v3 removeItemAtURL:v4 error:&v6];
  id v5 = v6;

  if (v5) {
    NSLog((NSString *)@"Error disposing contextual action file: %@", v5);
  }
}

- (WFContextualActionFile)initWithFileURL:(id)a3 type:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (([v8 isFileURL] & 1) == 0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFContextualActionFile.m", 57, @"Invalid parameter not satisfying: %@", @"fileURL.isFileURL" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)WFContextualActionFile;
  v10 = [(WFContextualActionFile *)&v31 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fileURL, a3);
    if (!v9)
    {
      type = v11->_type;
      v11->_type = 0;
LABEL_18:

      v26 = v11;
      goto LABEL_19;
    }
    id v12 = v8;
    id v13 = v9;
    if (!v12)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      v30 = objc_msgSend(NSString, "stringWithUTF8String:", "UTType * _Nonnull WFResolvedType(NSURL * _Nonnull __strong, UTType * _Nonnull __strong)");
      [v29 handleFailureInFunction:v30, @"WFContextualActionFile.m", 35, @"Invalid parameter not satisfying: %@", @"fileURL" file lineNumber description];
    }
    v14 = [v13 identifier];
    char v15 = [v14 isEqualToString:@"com.apple.icloud-file-fault"];

    if ((v15 & 1) == 0)
    {
      v25 = (UTType *)v13;
LABEL_17:

      type = v11->_type;
      v11->_type = v25;
      goto LABEL_18;
    }
    id v33 = 0;
    uint64_t v16 = *MEMORY[0x1E4F1C728];
    id v32 = 0;
    [v12 getPromisedItemResourceValue:&v33 forKey:v16 error:&v32];
    id v17 = v33;
    id v18 = v32;
    v19 = getWFVoiceShortcutClientLogObject();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "WFResolvedType";
        __int16 v36 = 2112;
        id v37 = v18;
        v21 = "%s File was made with a side fault type -- error fetching real type: %@";
        v22 = v20;
        os_log_type_t v23 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_1B3C5C000, v22, v23, v21, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "WFResolvedType";
      __int16 v36 = 2112;
      id v37 = v17;
      v21 = "%s WFContextualActionFile was made with a side fault -- deduced actual type: %@";
      v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_INFO;
      goto LABEL_15;
    }

    v25 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v17];

    goto LABEL_17;
  }
LABEL_19:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end