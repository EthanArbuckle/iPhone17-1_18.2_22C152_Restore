@interface PLResourceXPCMakeAvailableRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isTransient;
- (PLResourceIdentity)resourceIdentity;
- (PLResourceXPCMakeAvailableRequest)initWithCoder:(id)a3;
- (PLResourceXPCMakeAvailableRequest)initWithTaskIdentifier:(id)a3 assetObjectID:(id)a4 resource:(id)a5;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setTransient:(BOOL)a3;
@end

@implementation PLResourceXPCMakeAvailableRequest

- (void).cxx_destruct
{
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (PLResourceIdentity)resourceIdentity
{
  return self->_resourceIdentity;
}

- (PLResourceXPCMakeAvailableRequest)initWithCoder:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLResourceXPCMakeAvailableRequest;
  v5 = [(PLResourceXPCRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    v5->_transient = [v4 decodeBoolForKey:@"transient"];
    v5->_networkAccessAllowed = [v4 decodeBoolForKey:@"networkAccessAllowed"];
    v6 = +[PLResourceIdentityXPC possibleClassesInDictionaryRepresentation];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"resourceIdentity"];

    v8 = [[PLResourceIdentityXPC alloc] initWithDictionary:v7];
    resourceIdentity = v5->_resourceIdentity;
    v5->_resourceIdentity = (PLResourceIdentity *)v8;

    if (!v5->_resourceIdentity)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F8C500];
      uint64_t v16 = *MEMORY[0x1E4F28228];
      v17[0] = @"resource identity is required";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      v13 = [v10 errorWithDomain:v11 code:46309 userInfo:v12];
      [v4 failWithError:v13];
    }
    v5->_downloadIntent = [v4 decodeIntegerForKey:@"downloadIntent"];
    v5->_downloadPriority = [v4 decodeIntegerForKey:@"downloadPriority"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLResourceXPCMakeAvailableRequest;
  [(PLResourceXPCRequest *)&v11 encodeWithCoder:v4];
  [v4 encodeBool:self->_transient forKey:@"transient"];
  [v4 encodeBool:self->_networkAccessAllowed forKey:@"networkAccessAllowed"];
  v5 = +[PLResourceIdentityXPC dictionaryRepresentationFromResourceIdentity:self->_resourceIdentity];
  if (v5)
  {
    [v4 encodeObject:v5 forKey:@"resourceIdentity"];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F8C500];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v8 = [NSString stringWithFormat:@"unable to encode resource identity %@", self->_resourceIdentity];
    v13[0] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v10 = [v6 errorWithDomain:v7 code:46309 userInfo:v9];
    [v4 failWithError:v10];
  }
  [v4 encodeInteger:self->_downloadIntent forKey:@"downloadIntent"];
  [v4 encodeInteger:self->_downloadPriority forKey:@"downloadPriority"];
}

- (PLResourceXPCMakeAvailableRequest)initWithTaskIdentifier:(id)a3 assetObjectID:(id)a4 resource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLResourceXPCMakeAvailableRequest.m", 25, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PLResourceXPCMakeAvailableRequest;
  uint64_t v12 = [(PLResourceXPCRequest *)&v16 initWithTaskIdentifier:v9 assetObjectID:v10];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_resourceIdentity, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end