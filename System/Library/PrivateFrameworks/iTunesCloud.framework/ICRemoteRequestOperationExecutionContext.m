@interface ICRemoteRequestOperationExecutionContext
+ (BOOL)supportsSecureCoding;
- (ICRemoteRequestOperation)remoteRequestOperation;
- (ICRemoteRequestOperationExecutionContext)initWithCoder:(id)a3;
- (ICRemoteRequestOperationExecutionContext)initWithRemoteRequestOperation:(id)a3;
- (int64_t)qualityOfService;
- (void)encodeWithCoder:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation ICRemoteRequestOperationExecutionContext

- (void).cxx_destruct
{
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (ICRemoteRequestOperation)remoteRequestOperation
{
  return self->_remoteRequestOperation;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t qualityOfService = self->_qualityOfService;
  id v5 = a3;
  [v5 encodeInteger:qualityOfService forKey:@"qualityOfService"];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  if (_ICRemoteRequestOperationIsAllowedForClassName(v7))
  {
    [v5 encodeObject:v7 forKey:@"remoteRequestOperationClassName"];
    [v5 encodeObject:self->_remoteRequestOperation forKey:@"remoteRequestOperation"];
    v8 = v5;
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7005, @"Attempted to encode an instance of ICRemoteRequestOperationExecutionContext with an unallowed class name for remoteRequestOperation: %@.", v7);
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(v8, "msv_description");
      *(_DWORD *)buf = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    [v5 failWithError:v8];
  }
}

- (ICRemoteRequestOperationExecutionContext)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICRemoteRequestOperationExecutionContext;
  id v5 = [(ICRemoteRequestOperationExecutionContext *)&v15 init];
  if (v5)
  {
    v5->_int64_t qualityOfService = [v4 decodeIntegerForKey:@"qualityOfService"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteRequestOperationClassName"];
    if (_ICRemoteRequestOperationIsAllowedForClassName(v6))
    {
      Class v7 = NSClassFromString(v6);
      if (v7)
      {
        uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"remoteRequestOperation"];
        remoteRequestOperation = v5->_remoteRequestOperation;
        v5->_remoteRequestOperation = (ICRemoteRequestOperation *)v8;
        goto LABEL_11;
      }
      v10 = @"Failed to look up class of developer token provider with name: %@.";
    }
    else
    {
      v10 = @"Attempted to decode an instance of ICRemoteRequestOperationExecutionContext with an unallowed class name for remoteRequestOperation: %@.";
    }
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7005, v10, v6);
    if (!v11)
    {
LABEL_12:

      goto LABEL_13;
    }
    remoteRequestOperation = (void *)v11;
    [v4 failWithError:v11];
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(remoteRequestOperation, "msv_description");
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
    id v5 = 0;
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (ICRemoteRequestOperationExecutionContext)initWithRemoteRequestOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRemoteRequestOperationExecutionContext;
  v6 = [(ICRemoteRequestOperationExecutionContext *)&v9 init];
  Class v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteRequestOperation, a3);
    v7->_int64_t qualityOfService = -1;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end