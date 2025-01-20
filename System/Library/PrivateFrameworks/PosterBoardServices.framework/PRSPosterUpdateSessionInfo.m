@interface PRSPosterUpdateSessionInfo
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (NSDictionary)userInfo;
- (NSString)identifier;
- (PRSPosterUpdateSessionInfo)init;
- (PRSPosterUpdateSessionInfo)initWithBSXPCCoder:(id)a3;
- (PRSPosterUpdateSessionInfo)initWithCoder:(id)a3;
- (WFWallpaperConfiguration)shortcutsWallpaperConfiguration;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setShortcutsWallpaperConfiguration:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PRSPosterUpdateSessionInfo

- (PRSPosterUpdateSessionInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRSPosterUpdateSessionInfo;
  result = [(PRSPosterUpdateSessionInfo *)&v3 init];
  if (result) {
    result->_shortcutsWallpaperConfigurationSandboxHandle = -1;
  }
  return result;
}

- (BOOL)isEmpty
{
  return !self->_identifier && !self->_shortcutsWallpaperConfiguration && self->_userInfo == 0;
}

- (void)dealloc
{
  if (self->_shortcutsWallpaperConfigurationSandboxHandle != -1)
  {
    sandbox_extension_release();
    self->_shortcutsWallpaperConfigurationSandboxHandle = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)PRSPosterUpdateSessionInfo;
  [(PRSPosterUpdateSessionInfo *)&v3 dealloc];
}

- (void)setUserInfo:(id)a3
{
  id v6 = a3;
  if (!-[NSDictionary isEqualToDictionary:](self->_userInfo, "isEqualToDictionary:"))
  {
    _validateUserInfo(v6);
    v4 = (NSDictionary *)[v6 copy];
    userInfo = self->_userInfo;
    self->_userInfo = v4;
  }
}

- (void)setShortcutsWallpaperConfiguration:(id)a3
{
  id v13 = a3;
  if ((-[WFWallpaperConfiguration isEqual:](self->_shortcutsWallpaperConfiguration, "isEqual:") & 1) == 0)
  {
    shortcutsWallpaperConfigurationSandboxToken = self->_shortcutsWallpaperConfigurationSandboxToken;
    self->_shortcutsWallpaperConfigurationSandboxToken = 0;

    objc_storeStrong((id *)&self->_shortcutsWallpaperConfiguration, a3);
    id v6 = [v13 assetURL];

    if (v6)
    {
      v7 = [v13 assetURL];
      [v7 startAccessingSecurityScopedResource];

      id v8 = [v13 assetURL];
      [v8 fileSystemRepresentation];
      v9 = (char *)sandbox_extension_issue_file();

      if (v9)
      {
        v10 = (OS_xpc_object *)xpc_string_create(v9);
        v11 = self->_shortcutsWallpaperConfigurationSandboxToken;
        self->_shortcutsWallpaperConfigurationSandboxToken = v10;

        free(v9);
      }
      v12 = [v13 assetURL];
      [v12 stopAccessingSecurityScopedResource];
    }
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeObject:self->_identifier forKey:@"i"];
  [v7 encodeObject:self->_shortcutsWallpaperConfiguration forKey:@"wc"];
  shortcutsWallpaperConfigurationSandboxToken = self->_shortcutsWallpaperConfigurationSandboxToken;
  if (shortcutsWallpaperConfigurationSandboxToken) {
    [v7 encodeXPCObject:shortcutsWallpaperConfigurationSandboxToken forKey:@"wcse"];
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    id v6 = PRSXPCDictionaryFromDictionary(userInfo);
    [v7 encodeXPCObject:v6 forKey:@"ui"];
  }
}

- (PRSPosterUpdateSessionInfo)initWithBSXPCCoder:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PRSPosterUpdateSessionInfo;
  v5 = [(PRSPosterUpdateSessionInfo *)&v28 init];
  if (v5)
  {
    id v6 = [v4 decodeStringForKey:@"i"];
    uint64_t v7 = [v6 mutableCopy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"wc"];
    shortcutsWallpaperConfiguration = v5->_shortcutsWallpaperConfiguration;
    v5->_shortcutsWallpaperConfiguration = (WFWallpaperConfiguration *)v10;

    uint64_t v12 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145F0] forKey:@"wcse"];
    shortcutsWallpaperConfigurationSandboxToken = v5->_shortcutsWallpaperConfigurationSandboxToken;
    v5->_shortcutsWallpaperConfigurationSandboxToken = (OS_xpc_object *)v12;

    v5->_shortcutsWallpaperConfigurationSandboxHandle = -1;
    if (v5->_shortcutsWallpaperConfiguration)
    {
      v14 = v5->_shortcutsWallpaperConfigurationSandboxToken;
      if (v14)
      {
        xpc_string_get_string_ptr(v14);
        uint64_t v15 = sandbox_extension_consume();
        v5->_shortcutsWallpaperConfigurationSandboxHandle = v15;
        if (v15 == -1)
        {
          v16 = __error();
          strerror_r(*v16, __strerrbuf, 0x100uLL);
          v17 = PRSLogPosterContents();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v23 = v5->_shortcutsWallpaperConfigurationSandboxToken;
            int v24 = *__error();
            v25 = (objc_class *)objc_opt_class();
            v26 = NSStringFromClass(v25);
            v27 = [(WFWallpaperConfiguration *)v5->_shortcutsWallpaperConfiguration assetURL];
            *(_DWORD *)buf = 138413314;
            v30 = v23;
            __int16 v31 = 1024;
            int v32 = v24;
            __int16 v33 = 2082;
            v34 = __strerrbuf;
            __int16 v35 = 2114;
            v36 = v26;
            __int16 v37 = 2114;
            v38 = v27;
            _os_log_error_impl(&dword_1A78AC000, v17, OS_LOG_TYPE_ERROR, "failed to consume sandboxToken %@ from bsxpc with errno=%i (%{public}s) : <%{public}@ path=%{public}@>", buf, 0x30u);
          }
        }
      }
    }
    v18 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"ui"];
    v19 = v18;
    if (v18)
    {
      uint64_t v20 = PRSDictionaryFromXPCObject(v18);
      userInfo = v5->_userInfo;
      v5->_userInfo = (NSDictionary *)v20;

      _validateUserInfo(v5->_userInfo);
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_identifier forKey:@"i"];
  [v6 encodeObject:self->_shortcutsWallpaperConfiguration forKey:@"wc"];
  shortcutsWallpaperConfigurationSandboxToken = self->_shortcutsWallpaperConfigurationSandboxToken;
  if (shortcutsWallpaperConfigurationSandboxToken)
  {
    v5 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(shortcutsWallpaperConfigurationSandboxToken)];
    [v6 encodeObject:v5 forKey:@"wcse"];
  }
  [v6 encodeObject:self->_userInfo forKey:@"ui"];
}

- (PRSPosterUpdateSessionInfo)initWithCoder:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PRSPosterUpdateSessionInfo;
  v5 = [(PRSPosterUpdateSessionInfo *)&v32 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    uint64_t v7 = [v6 mutableCopy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"wc"];
    shortcutsWallpaperConfiguration = v5->_shortcutsWallpaperConfiguration;
    v5->_shortcutsWallpaperConfiguration = (WFWallpaperConfiguration *)v10;

    v5->_shortcutsWallpaperConfigurationSandboxHandle = -1;
    uint64_t v12 = self;
    id v13 = [v4 decodeObjectOfClass:v12 forKey:@"wcse"];

    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = (OS_xpc_object *)xpc_string_create((const char *)[v14 UTF8String]);
      shortcutsWallpaperConfigurationSandboxToken = v5->_shortcutsWallpaperConfigurationSandboxToken;
      v5->_shortcutsWallpaperConfigurationSandboxToken = v15;

      [v14 UTF8String];
      uint64_t v17 = sandbox_extension_consume();
      v5->_shortcutsWallpaperConfigurationSandboxHandle = v17;
      if (v17 == -1)
      {
        v18 = __error();
        strerror_r(*v18, __strerrbuf, 0x100uLL);
        v19 = PRSLogPosterContents();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v27 = v5->_shortcutsWallpaperConfigurationSandboxToken;
          int v28 = *__error();
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          __int16 v31 = [(WFWallpaperConfiguration *)v5->_shortcutsWallpaperConfiguration assetURL];
          *(_DWORD *)buf = 138413314;
          v34 = v27;
          __int16 v35 = 1024;
          int v36 = v28;
          __int16 v37 = 2082;
          v38 = __strerrbuf;
          __int16 v39 = 2114;
          uint64_t v40 = v30;
          __int16 v41 = 2114;
          v42 = v31;
          _os_log_error_impl(&dword_1A78AC000, v19, OS_LOG_TYPE_ERROR, "failed to consume sandboxToken %@ from bsxpc with errno=%i (%{public}s) : <%{public}@ path=%{public}@>", buf, 0x30u);
        }
      }
    }
    uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = [v4 decodeObjectOfClasses:v22 forKey:@"ui"];
    uint64_t v24 = [v23 copy];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v24;

    _validateUserInfo(v5->_userInfo);
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (WFWallpaperConfiguration)shortcutsWallpaperConfiguration
{
  return self->_shortcutsWallpaperConfiguration;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_shortcutsWallpaperConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_shortcutsWallpaperConfigurationSandboxToken, 0);
}

@end