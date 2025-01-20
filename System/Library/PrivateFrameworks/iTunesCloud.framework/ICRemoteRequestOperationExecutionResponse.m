@interface ICRemoteRequestOperationExecutionResponse
+ (BOOL)supportsSecureCoding;
- (ICRemoteRequestOperationExecutionResponse)initWithCoder:(id)a3;
- (ICRemoteRequestOperationExecutionResponse)initWithRemoteRequestOperationResponse:(id)a3 remoteRequestOperationError:(id)a4;
- (NSError)remoteRequestOperationError;
- (NSSecureCoding)remoteRequestOperationResponse;
- (void)encodeWithCoder:(id)a3;
- (void)setRemoteRequestOperationError:(id)a3;
- (void)setRemoteRequestOperationResponse:(id)a3;
@end

@implementation ICRemoteRequestOperationExecutionResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRequestOperationError, 0);

  objc_storeStrong((id *)&self->_remoteRequestOperationResponse, 0);
}

- (void)setRemoteRequestOperationError:(id)a3
{
}

- (NSError)remoteRequestOperationError
{
  return self->_remoteRequestOperationError;
}

- (void)setRemoteRequestOperationResponse:(id)a3
{
}

- (NSSecureCoding)remoteRequestOperationResponse
{
  return self->_remoteRequestOperationResponse;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSError *)self->_remoteRequestOperationError msv_errorByRemovingUnsafeUserInfo];
  [v4 encodeObject:v5 forKey:@"remoteRequestOperationError"];

  if (self->_remoteRequestOperationResponse)
  {
    v6 = (objc_class *)objc_opt_class();
    if ([(NSSecureCoding *)self->_remoteRequestOperationResponse isNSString]) {
      v6 = (objc_class *)objc_opt_class();
    }
    v7 = NSStringFromClass(v6);
    if (_ICRemoteRequestOperationResponseIsAllowedForClassName(v7))
    {
      [v4 encodeObject:v7 forKey:@"remoteRequestOperationResponseClassName"];
      [v4 encodeObject:self->_remoteRequestOperationResponse forKey:@"remoteRequestOperationResponse"];
    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7005, @"Attempted to encode an instance of ICRemoteRequestOperationExecutionResponse with an unallowed class name for remoteRequestOperationResponse: %@.", v7);
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_msgSend(v8, "msv_description");
        *(_DWORD *)buf = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
      [v4 failWithError:v8];
    }
  }
}

- (ICRemoteRequestOperationExecutionResponse)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICRemoteRequestOperationExecutionResponse;
  v5 = [(ICRemoteRequestOperationExecutionResponse *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteRequestOperationError"];
    remoteRequestOperationError = v5->_remoteRequestOperationError;
    v5->_remoteRequestOperationError = (NSError *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteRequestOperationResponseClassName"];
    v9 = v8;
    if (v8)
    {
      if (_ICRemoteRequestOperationResponseIsAllowedForClassName(v8))
      {
        Class v10 = NSClassFromString(v9);
        if (v10)
        {
          uint64_t v11 = [v4 decodeObjectOfClass:v10 forKey:@"remoteRequestOperationResponse"];
          remoteRequestOperationResponse = v5->_remoteRequestOperationResponse;
          v5->_remoteRequestOperationResponse = (NSSecureCoding *)v11;
LABEL_12:

          goto LABEL_13;
        }
        uint64_t v13 = @"Failed to look up class of developer token provider with name: %@.";
      }
      else
      {
        uint64_t v13 = @"Attempted to decode an instance of ICRemoteRequestOperationExecutionResponse with an unallowed class name for remoteRequestOperationResponse: %@.";
      }
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7005, v13, v9);
      if (v14)
      {
        remoteRequestOperationResponse = (void *)v14;
        v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = objc_msgSend(remoteRequestOperationResponse, "msv_description");
          *(_DWORD *)buf = 138543362;
          v20 = v16;
          _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }
        [v4 failWithError:remoteRequestOperationResponse];

        v5 = 0;
        goto LABEL_12;
      }
    }
LABEL_13:
  }
  return v5;
}

- (ICRemoteRequestOperationExecutionResponse)initWithRemoteRequestOperationResponse:(id)a3 remoteRequestOperationError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICRemoteRequestOperationExecutionResponse;
  v9 = [(ICRemoteRequestOperationExecutionResponse *)&v12 init];
  Class v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoteRequestOperationResponse, a3);
    objc_storeStrong((id *)&v10->_remoteRequestOperationError, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end