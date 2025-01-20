@interface PLFileSystemCapabilities
+ (PLFileSystemCapabilities)capabilitiesWithURL:(id)a3;
+ (unint64_t)minimumAvailableBytesRequiredForLibraryOpen;
- (BOOL)determineCapabilitiesWithURL:(id)a3 error:(id *)a4;
- (BOOL)isCentralizedCacheDeleteCapable;
- (BOOL)isCloneCapable;
- (BOOL)isGenCountCapable;
- (BOOL)isInternalVolume;
- (BOOL)isLocalVolume;
- (BOOL)isNetworkVolume;
- (BOOL)isReadOnly;
- (BOOL)isRootFileSystemVolume;
- (BOOL)isValid;
- (BOOL)isWholeFileLockCapable;
- (BOOL)supportsDataProtection;
- (NSError)error;
- (NSString)fileSystemTypeName;
- (id)description;
@end

@implementation PLFileSystemCapabilities

- (void).cxx_destruct
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (BOOL)supportsDataProtection
{
  return self->_supportsDataProtection;
}

- (BOOL)isRootFileSystemVolume
{
  return self->_isRootFileSystemVolume;
}

- (BOOL)isInternalVolume
{
  return self->_isInternalVolume;
}

- (BOOL)isLocalVolume
{
  return self->_isLocalVolume;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (id)description
{
  BOOL v3 = [(PLFileSystemCapabilities *)self isValid];
  v4 = NSString;
  if (v3)
  {
    v5 = [(PLFileSystemCapabilities *)self fileSystemTypeName];
    [v4 stringWithFormat:@"type:%@ readOnly:%d clone:%d flock:%d genCount:%d seclude:%d local:%d internal:%d", v5, -[PLFileSystemCapabilities isReadOnly](self, "isReadOnly"), -[PLFileSystemCapabilities isCloneCapable](self, "isCloneCapable"), -[PLFileSystemCapabilities isWholeFileLockCapable](self, "isWholeFileLockCapable"), -[PLFileSystemCapabilities isGenCountCapable](self, "isGenCountCapable"), -[PLFileSystemCapabilities isSecludeRenameCapable](self, "isSecludeRenameCapable"), -[PLFileSystemCapabilities isLocalVolume](self, "isLocalVolume"), -[PLFileSystemCapabilities isInternalVolume](self, "isInternalVolume")];
    v7 = LABEL_5:;

    goto LABEL_7;
  }
  error = self->_error;
  if (error)
  {
    v5 = [(NSError *)error localizedDescription];
    [v4 stringWithFormat:@"invalid: %@", v5, v9, v10, v11, v12, v13, v14, v15];
    goto LABEL_5;
  }
  v7 = [NSString stringWithFormat:@"invalid: %@", @"uninitialized"];
LABEL_7:
  return v7;
}

- (BOOL)determineCapabilitiesWithURL:(id)a3 error:(id *)a4
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4) {
    v8 = a4;
  }
  else {
    v8 = (id *)&v58;
  }
  if (!v6)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28798];
    uint64_t v24 = *MEMORY[0x1E4F28588];
    v65[0] = *MEMORY[0x1E4F28228];
    v65[1] = v24;
    v66[0] = @"nil URL";
    id v10 = [NSString stringWithUTF8String:strerror(22)];
    v66[1] = v10;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
    v26 = [v22 errorWithDomain:v23 code:22 userInfo:v25];
    error = self->_error;
    self->_error = v26;

    id *v8 = v26;
    goto LABEL_8;
  }
  uint64_t v9 = [v6 URLByDeletingLastPathComponent];
  memset(&v64, 0, 512);
  id v10 = v9;
  if (!statfs((const char *)[v10 fileSystemRepresentation], &v64))
  {
    long long v56 = 0u;
    memset(v57, 0, sizeof(v57));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = xmmword_19BDC73F0;
    uint64_t v53 = 0;
    if (getattrlist(v64.f_mntonname, &v52, &v54, 0x4CuLL, 0))
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28798];
      uint64_t v31 = *__error();
      uint64_t v32 = *MEMORY[0x1E4F28228];
      v61[0] = @"error finding volume attributes";
      uint64_t v33 = *MEMORY[0x1E4F28588];
      v60[0] = v32;
      v60[1] = v33;
      v34 = NSString;
      v35 = __error();
      id v36 = [v34 stringWithUTF8String:strerror(*v35)];
      v60[2] = *MEMORY[0x1E4F289D0];
      v61[1] = v36;
      v61[2] = v7;
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
      v38 = [v29 errorWithDomain:v30 code:v31 userInfo:v37];
      v39 = self->_error;
      self->_error = v38;

      v40 = v38;
    }
    else
    {
      uint64_t v41 = *MEMORY[0x1E4F1C858];
      uint64_t v42 = *MEMORY[0x1E4F1C848];
      v59[0] = *MEMORY[0x1E4F1C858];
      v59[1] = v42;
      uint64_t v50 = *MEMORY[0x1E4F1C870];
      v59[2] = *MEMORY[0x1E4F1C870];
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
      id v51 = 0;
      v37 = [v10 resourceValuesForKeys:v43 error:&v51];
      id v44 = v51;
      id v36 = v51;

      if (v37)
      {
        strlcpy(self->_fstypename, v64.f_fstypename, 0x10uLL);
        self->_isReadOnly = v64.f_flags & 1;
        unsigned int v45 = v57[2];
        self->_interfacesCapabilities = DWORD2(v54) & DWORD2(v55);
        self->_nativeCommonAttributes = v45;
        v46 = [v37 objectForKeyedSubscript:v41];
        self->_isLocalVolume = [v46 BOOLValue];

        v47 = [v37 objectForKeyedSubscript:v42];
        self->_isInternalVolume = [v47 BOOLValue];

        v48 = [v37 objectForKeyedSubscript:v50];
        self->_isRootFileSystemVolume = [v48 BOOLValue];

        self->_supportsDataProtection = (v64.f_flags & 0x80) != 0;
        BOOL v28 = 1;
        self->_isValid = 1;
        goto LABEL_14;
      }
      objc_storeStrong((id *)&self->_error, v44);
      v40 = (NSError *)v36;
      id v36 = v40;
    }
    BOOL v28 = 0;
    id *v8 = v40;
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28798];
  uint64_t v13 = *__error();
  uint64_t v14 = *MEMORY[0x1E4F28228];
  v63[0] = @"error finding filesystem information";
  uint64_t v15 = *MEMORY[0x1E4F28588];
  v62[0] = v14;
  v62[1] = v15;
  v16 = NSString;
  v17 = __error();
  v18 = [v16 stringWithUTF8String:strerror(*v17)];
  v62[2] = *MEMORY[0x1E4F289D0];
  v63[1] = v18;
  v63[2] = v7;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
  v20 = [v11 errorWithDomain:v12 code:v13 userInfo:v19];
  v21 = self->_error;
  self->_error = v20;

  id *v8 = v20;
LABEL_8:
  BOOL v28 = 0;
LABEL_15:

  return v28;
}

- (BOOL)isCentralizedCacheDeleteCapable
{
  if (isCentralizedCacheDeleteCapable_onceToken != -1) {
    dispatch_once(&isCentralizedCacheDeleteCapable_onceToken, &__block_literal_global_8503);
  }
  if (!isCentralizedCacheDeleteCapable_supportsCCDDefault) {
    return 0;
  }
  return [(PLFileSystemCapabilities *)self isValid];
}

uint64_t __59__PLFileSystemCapabilities_isCentralizedCacheDeleteCapable__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v0 objectForKey:@"PLSupportsCCD"];

  if (v3) {
    char v1 = [v3 BOOLValue];
  }
  else {
    char v1 = 1;
  }
  isCentralizedCacheDeleteCapable_supportsCCDDefault = v1;
  return MEMORY[0x1F41817F8]();
}

- (BOOL)isNetworkVolume
{
  return self->_isValid && !self->_isLocalVolume;
}

- (NSString)fileSystemTypeName
{
  return (NSString *)[NSString stringWithUTF8String:self->_fstypename];
}

- (BOOL)isGenCountCapable
{
  return (BYTE2(self->_nativeCommonAttributes) >> 3) & 1;
}

- (BOOL)isWholeFileLockCapable
{
  return (self->_interfacesCapabilities & 0x1200) != 0;
}

- (BOOL)isCloneCapable
{
  return BYTE2(self->_interfacesCapabilities) & 1;
}

+ (unint64_t)minimumAvailableBytesRequiredForLibraryOpen
{
  return 52428800;
}

+ (PLFileSystemCapabilities)capabilitiesWithURL:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PLFileSystemCapabilities);
  [(PLFileSystemCapabilities *)v4 determineCapabilitiesWithURL:v3 error:0];

  return v4;
}

@end