@interface UAFAssetSetConsistencyToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)lock:(id *)a3;
- (BOOL)locked;
- (BOOL)unlock:(id *)a3;
- (NSSet)preinstalledAssetsSummary;
- (NSString)assetSetName;
- (NSString)atomicInstance;
- (NSUUID)uuid;
- (UAFAssetSetConsistencyToken)initWithCoder:(id)a3;
- (UAFAssetSetConsistencyToken)initWithUUID:(id)a3 assetSetName:(id)a4 atomicInstance:(id)a5 experiment:(id)a6 preinstalledAssetsSummary:(id)a7;
- (UAFAssetSetExperiment)experiment;
- (id)description;
- (id)lockURL;
- (int)fd;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate:(id)a3 completion:(id)a4;
- (void)setAssetSetName:(id)a3;
- (void)setAtomicInstance:(id)a3;
- (void)setExperiment:(id)a3;
- (void)setFd:(int)a3;
- (void)setLocked:(BOOL)a3;
- (void)setPreinstalledAssetsSummary:(id)a3;
@end

@implementation UAFAssetSetConsistencyToken

- (NSString)atomicInstance
{
  return self->_atomicInstance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preinstalledAssetsSummary, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_atomicInstance, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)dealloc
{
  if (self->_locked) {
    [(UAFAssetSetConsistencyToken *)self unlock:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)UAFAssetSetConsistencyToken;
  [(UAFAssetSetConsistencyToken *)&v3 dealloc];
}

- (UAFAssetSetConsistencyToken)initWithUUID:(id)a3 assetSetName:(id)a4 atomicInstance:(id)a5 experiment:(id)a6 preinstalledAssetsSummary:(id)a7
{
  id v13 = a3;
  id v24 = a4;
  id v23 = a5;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)UAFAssetSetConsistencyToken;
  v16 = [(UAFAssetSetConsistencyToken *)&v25 init];
  v17 = v16;
  if (v16)
  {
    p_uuid = (void **)&v16->_uuid;
    objc_storeStrong((id *)&v16->_uuid, a3);
    if (!v13)
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x263F08C38], "UUID", v23, v24);
      v20 = *p_uuid;
      *p_uuid = (void *)v19;
    }
    objc_storeStrong((id *)&v17->_assetSetName, a4);
    objc_storeStrong((id *)&v17->_atomicInstance, a5);
    objc_storeStrong((id *)&v17->_experiment, a6);
    objc_storeStrong((id *)&v17->_preinstalledAssetsSummary, a7);
    v17->_fd = -1;
    v17->_locked = 0;
    v21 = v17;
  }

  return v17;
}

- (NSSet)preinstalledAssetsSummary
{
  return self->_preinstalledAssetsSummary;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:@"1.0.0" forKey:@"version"];
  [v4 encodeObject:self->_uuid forKey:@"uuid"];
  [v4 encodeObject:self->_assetSetName forKey:@"assetSetName"];
  [v4 encodeObject:self->_atomicInstance forKey:@"atomicInstance"];
  [v4 encodeObject:self->_experiment forKey:@"experiment"];
  [v4 encodeObject:self->_preinstalledAssetsSummary forKey:@"preinstalledAssetsSummary"];
}

- (UAFAssetSetConsistencyToken)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  if (([@"1.0.0" isEqualToString:v5] & 1) == 0)
  {
    v6 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[UAFAssetSetConsistencyToken initWithCoder:]";
      __int16 v21 = 2114;
      v22 = v5;
      _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, "%s Decoding of asset set consistency token failed: unsupported version %{public}@", buf, 0x16u);
    }
    goto LABEL_12;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetName"];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[UAFAssetSetConsistencyToken initWithCoder:]";
      _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Decoding of asset set consistency token failed", buf, 0xCu);
    }

LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atomicInstance"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experiment"];
  id v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v4 decodeObjectOfClasses:v15 forKey:@"preinstalledAssetsSummary"];

  self = [(UAFAssetSetConsistencyToken *)self initWithUUID:v6 assetSetName:v8 atomicInstance:v11 experiment:v12 preinstalledAssetsSummary:v16];
  v17 = self;
LABEL_13:

  return v17;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = [(UAFAssetSetConsistencyToken *)self uuid];
  v5 = [(UAFAssetSetConsistencyToken *)self assetSetName];
  v6 = [(UAFAssetSetConsistencyToken *)self atomicInstance];
  if (self->_locked) {
    uint64_t v7 = @"locked";
  }
  else {
    uint64_t v7 = @"unlocked";
  }
  v8 = [(UAFAssetSetConsistencyToken *)self experiment];
  BOOL v9 = [(UAFAssetSetConsistencyToken *)self preinstalledAssetsSummary];
  v10 = [v3 stringWithFormat:@"Asset Set Consistency Token %@ for assetSet %@ with atomic instance %@ (%@) experiment %@ preinstalledAssetsSummary %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (UAFAssetSetConsistencyToken *)a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if (self == v6)
    {
      char v13 = 1;
      goto LABEL_41;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      BOOL v9 = [(UAFAssetSetConsistencyToken *)v8 uuid];
      v10 = [(UAFAssetSetConsistencyToken *)self uuid];
      if (![v9 isEqual:v10])
      {
        char v13 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v11 = [(UAFAssetSetConsistencyToken *)v8 assetSetName];
      v12 = [(UAFAssetSetConsistencyToken *)self assetSetName];
      if (![v11 isEqualToString:v12])
      {
        char v13 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v31 = [(UAFAssetSetConsistencyToken *)v8 atomicInstance];
      if (v31
        || ([(UAFAssetSetConsistencyToken *)self atomicInstance],
            (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v4 = [(UAFAssetSetConsistencyToken *)v8 atomicInstance];
        v30 = [(UAFAssetSetConsistencyToken *)self atomicInstance];
        if (!objc_msgSend(v4, "isEqualToString:"))
        {
          char v13 = 0;
LABEL_35:

LABEL_36:
          if (!v31) {

          }
          goto LABEL_39;
        }
        int v28 = 1;
      }
      else
      {
        int v28 = 0;
      }
      uint64_t v29 = [(UAFAssetSetConsistencyToken *)v8 experiment];
      if (v29
        || ([(UAFAssetSetConsistencyToken *)self experiment],
            (v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v14 = [(UAFAssetSetConsistencyToken *)v8 experiment];
        v26 = [(UAFAssetSetConsistencyToken *)self experiment];
        v27 = v14;
        if (![v14 isEqual:v26])
        {
          char v13 = 0;
LABEL_31:

LABEL_32:
          uint64_t v19 = (void *)v29;
          if (!v29)
          {

            uint64_t v19 = 0;
          }

          if (!v28) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
        objc_super v25 = v4;
        int v24 = 1;
      }
      else
      {
        objc_super v25 = v4;
        v22 = 0;
        int v24 = 0;
      }
      id v15 = [(UAFAssetSetConsistencyToken *)v8 preinstalledAssetsSummary];
      if (v15
        || ([(UAFAssetSetConsistencyToken *)self preinstalledAssetsSummary],
            (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v23 = v3;
        v16 = [(UAFAssetSetConsistencyToken *)v8 preinstalledAssetsSummary];
        v17 = [(UAFAssetSetConsistencyToken *)self preinstalledAssetsSummary];
        char v13 = [v16 isEqualToSet:v17];

        if (v15)
        {

          if (!v24)
          {
            objc_super v3 = v23;
            id v4 = v25;
            goto LABEL_32;
          }
          objc_super v3 = v23;
          id v4 = v25;
          goto LABEL_31;
        }
        objc_super v3 = v23;
        v18 = (void *)v21;
      }
      else
      {
        v18 = 0;
        char v13 = 1;
      }

      id v4 = v25;
      if ((v24 & 1) == 0) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  char v13 = 0;
LABEL_41:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_uuid hash];
  NSUInteger v4 = [(NSString *)self->_assetSetName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_atomicInstance hash];
  unint64_t v6 = v4 ^ v5 ^ [(UAFAssetSetExperiment *)self->_experiment hash];
  return v6 ^ [(NSSet *)self->_preinstalledAssetsSummary hash];
}

- (void)invalidate:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  atomicInstance = self->_atomicInstance;
  if (atomicInstance)
  {
    assetSetName = self->_assetSetName;
    id v7 = a4;
    +[UAFAutoAssetManager invalidateAtomicInstance:atomicInstance assetSetName:assetSetName queue:a3 completion:v7];
  }
  else
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08338];
    v13[0] = @"Cannot invalidate a token without an underlying atomic instance";
    BOOL v9 = NSDictionary;
    v10 = (void (**)(id, id))a4;
    v11 = [v9 dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v7 = [v8 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v11];

    v10[2](v10, v7);
  }
}

- (id)lockURL
{
  uint64_t v3 = [NSURL fileURLWithPath:@"/private/var/MobileAsset/AssetsV2/locks" isDirectory:1];
  NSUInteger v4 = [v3 URLByAppendingPathComponent:@"com.apple.UnifiedAssetFramework"];

  NSUInteger v5 = [v4 URLByAppendingPathComponent:self->_assetSetName];

  unint64_t v6 = [v5 URLByAppendingPathComponent:@"shared_locks"];

  id v7 = [NSString stringWithFormat:@"atomic_instance_%@.locker", self->_atomicInstance];
  v8 = [v6 URLByAppendingPathComponent:v7];

  return v8;
}

- (BOOL)lock:(id *)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  NSUInteger v5 = [(UAFAssetSetConsistencyToken *)self lockURL];
  id v6 = [v5 path];
  self->_int fd = open((const char *)[v6 UTF8String], 20);

  int fd = self->_fd;
  if (fd < 0)
  {
    BOOL v9 = __error();
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", strerror(*v9));
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08338];
    v22[0] = v8;
    v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v12 = [v10 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v11];

    char v13 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[UAFAssetSetConsistencyToken lock:]";
      __int16 v17 = 2112;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_error_impl(&dword_23797A000, v13, OS_LOG_TYPE_ERROR, "%s Failed to lock %@: %@", buf, 0x20u);
    }

    if (a3) {
      *a3 = v12;
    }
  }
  else
  {
    self->_locked = 1;
    v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[UAFAssetSetConsistencyToken lock:]";
      __int16 v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Locked %@", buf, 0x16u);
    }
  }

  return fd >= 0;
}

- (BOOL)unlock:(id *)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  if (!self->_locked)
  {
    uint64_t v12 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[UAFAssetSetConsistencyToken unlock:]";
      __int16 v16 = 2112;
      __int16 v17 = self;
      _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s Can't unlock %@: already unlocked", buf, 0x16u);
    }
    goto LABEL_12;
  }
  if ((close(self->_fd) & 0x80000000) == 0) {
    goto LABEL_8;
  }
  NSUInteger v5 = __error();
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", strerror(*v5));
  id v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v20 = *MEMORY[0x263F08338];
  v21[0] = v6;
  v8 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  BOOL v9 = [v7 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v8];

  v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[UAFAssetSetConsistencyToken unlock:]";
    __int16 v16 = 2112;
    __int16 v17 = self;
    __int16 v18 = 2112;
    __int16 v19 = v9;
    _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to unlock %@: %@", buf, 0x20u);
  }

  if (a3) {
    *a3 = v9;
  }
  int v11 = *__error();

  if (v11 == 9)
  {
LABEL_8:
    self->_int fd = -1;
    self->_locked = 0;
    uint64_t v12 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[UAFAssetSetConsistencyToken unlock:]";
      __int16 v16 = 2112;
      __int16 v17 = self;
      _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s Unlocked %@", buf, 0x16u);
    }
LABEL_12:

    return 1;
  }
  return 0;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetName:(id)a3
{
}

- (void)setAtomicInstance:(id)a3
{
}

- (UAFAssetSetExperiment)experiment
{
  return self->_experiment;
}

- (void)setExperiment:(id)a3
{
}

- (void)setPreinstalledAssetsSummary:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_int fd = a3;
}

- (BOOL)locked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

@end