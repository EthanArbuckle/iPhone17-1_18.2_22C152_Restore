@interface TUMomentsMediaRecordRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMediaRecordRequest:(id)a3;
- (NSString)localCaptionsFileName;
- (NSString)localeIdentifier;
- (NSString)remoteCaptionsFileName;
- (NSUUID)callUUID;
- (TUMediaTokens)mediaTokens;
- (TUMomentsMediaRecordRequest)initWithCall:(id)a3 URL:(id)a4;
- (TUMomentsMediaRecordRequest)initWithCallUUID:(id)a3 URL:(id)a4 mediaTokens:(id)a5;
- (TUMomentsMediaRecordRequest)initWithCoder:(id)a3;
- (TUSandboxExtendedURL)sandboxURL;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalCaptionsFileName:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setRemoteCaptionsFileName:(id)a3;
@end

@implementation TUMomentsMediaRecordRequest

- (TUMomentsMediaRecordRequest)initWithCallUUID:(id)a3 URL:(id)a4 mediaTokens:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUMomentsMediaRecordRequest;
  v12 = [(TUMomentsMediaRecordRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_callUUID, a3);
    objc_storeStrong((id *)&v13->_sandboxURL, a4);
    objc_storeStrong((id *)&v13->_mediaTokens, a5);
  }

  return v13;
}

- (TUMomentsMediaRecordRequest)initWithCall:(id)a3 URL:(id)a4
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F29128];
  id v8 = a4;
  id v9 = [v7 alloc];
  id v10 = [v6 callUUID];
  id v11 = (void *)[v9 initWithUUIDString:v10];
  v12 = [v6 tokens];
  v13 = [(TUMomentsMediaRecordRequest *)self initWithCallUUID:v11 URL:v8 mediaTokens:v12];

  if (v13)
  {
    v14 = [v6 handle];
    uint64_t v15 = [v14 normalizedValue];
    remoteCaptionsFileName = v13->_remoteCaptionsFileName;
    v13->_remoteCaptionsFileName = (NSString *)v15;

    v17 = [v6 localMemberHandleValue];
    if (v17)
    {
      uint64_t v18 = [v6 localMemberHandleValue];
      localCaptionsFileName = v13->_localCaptionsFileName;
      v13->_localCaptionsFileName = (NSString *)v18;
    }
    else
    {
      localCaptionsFileName = [v6 localSenderIdentity];
      v20 = [localCaptionsFileName handle];
      uint64_t v21 = [v20 normalizedValue];
      v22 = v13->_localCaptionsFileName;
      v13->_localCaptionsFileName = (NSString *)v21;
    }
  }

  return v13;
}

- (TUMomentsMediaRecordRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_callUUID);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_sandboxURL);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_mediaTokens);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  uint64_t v14 = objc_opt_class();
  uint64_t v15 = NSStringFromSelector(sel_localeIdentifier);
  v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

  uint64_t v17 = objc_opt_class();
  uint64_t v18 = NSStringFromSelector(sel_localCaptionsFileName);
  v19 = [v4 decodeObjectOfClass:v17 forKey:v18];

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = NSStringFromSelector(sel_remoteCaptionsFileName);
  v22 = [v4 decodeObjectOfClass:v20 forKey:v21];

  v23 = 0;
  if (v7 && v10 && v13)
  {
    self = [(TUMomentsMediaRecordRequest *)self initWithCallUUID:v7 URL:v10 mediaTokens:v13];
    [(TUMomentsMediaRecordRequest *)self setLocaleIdentifier:v16];
    [(TUMomentsMediaRecordRequest *)self setLocalCaptionsFileName:v19];
    [(TUMomentsMediaRecordRequest *)self setRemoteCaptionsFileName:v22];
    v23 = self;
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUMomentsMediaRecordRequest *)self callUUID];
  id v6 = NSStringFromSelector(sel_callUUID);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(TUMomentsMediaRecordRequest *)self sandboxURL];
  uint64_t v8 = NSStringFromSelector(sel_sandboxURL);
  [v4 encodeObject:v7 forKey:v8];

  id v9 = [(TUMomentsMediaRecordRequest *)self mediaTokens];
  id v10 = NSStringFromSelector(sel_mediaTokens);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(TUMomentsMediaRecordRequest *)self localeIdentifier];
  v12 = NSStringFromSelector(sel_localeIdentifier);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(TUMomentsMediaRecordRequest *)self localCaptionsFileName];
  uint64_t v14 = NSStringFromSelector(sel_localCaptionsFileName);
  [v4 encodeObject:v13 forKey:v14];

  id v16 = [(TUMomentsMediaRecordRequest *)self remoteCaptionsFileName];
  uint64_t v15 = NSStringFromSelector(sel_remoteCaptionsFileName);
  [v4 encodeObject:v16 forKey:v15];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)localCaptionsFileName
{
  if (![(NSString *)self->_localCaptionsFileName length])
  {
    localCaptionsFileName = self->_localCaptionsFileName;
    self->_localCaptionsFileName = (NSString *)@"LOCAL";
  }
  id v4 = self->_localCaptionsFileName;

  return v4;
}

- (NSString)remoteCaptionsFileName
{
  if (![(NSString *)self->_remoteCaptionsFileName length])
  {
    remoteCaptionsFileName = self->_remoteCaptionsFileName;
    self->_remoteCaptionsFileName = (NSString *)@"REMOTE";
  }
  id v4 = self->_remoteCaptionsFileName;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TUMomentsMediaRecordRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUMomentsMediaRecordRequest *)self isEqualToMediaRecordRequest:v4];
  }

  return v5;
}

- (BOOL)isEqualToMediaRecordRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUMomentsMediaRecordRequest *)self mediaTokens];
  id v6 = [v4 mediaTokens];
  if ([v5 isEqual:v6])
  {
    v7 = [(TUMomentsMediaRecordRequest *)self localeIdentifier];
    uint64_t v8 = [v4 localeIdentifier];
    if ([v7 isEqual:v8])
    {
      id v9 = [(TUMomentsMediaRecordRequest *)self callUUID];
      id v10 = [v4 callUUID];
      if ([v9 isEqual:v10])
      {
        uint64_t v11 = [(TUMomentsMediaRecordRequest *)self localCaptionsFileName];
        v12 = [v4 localCaptionsFileName];
        if ([v11 isEqual:v12])
        {
          uint64_t v21 = v11;
          uint64_t v13 = [(TUMomentsMediaRecordRequest *)self remoteCaptionsFileName];
          uint64_t v14 = [v4 remoteCaptionsFileName];
          v22 = (void *)v13;
          uint64_t v15 = (void *)v13;
          id v16 = (void *)v14;
          if ([v15 isEqual:v14])
          {
            uint64_t v20 = [(TUMomentsMediaRecordRequest *)self sandboxURL];
            v19 = [v4 sandboxURL];
            char v17 = [v20 isEqual:v19];
          }
          else
          {
            char v17 = 0;
          }

          uint64_t v11 = v21;
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (TUSandboxExtendedURL)sandboxURL
{
  return self->_sandboxURL;
}

- (TUMediaTokens)mediaTokens
{
  return self->_mediaTokens;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (void)setLocalCaptionsFileName:(id)a3
{
}

- (void)setRemoteCaptionsFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCaptionsFileName, 0);
  objc_storeStrong((id *)&self->_localCaptionsFileName, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaTokens, 0);
  objc_storeStrong((id *)&self->_sandboxURL, 0);

  objc_storeStrong((id *)&self->_callUUID, 0);
}

@end