@interface PLResourceXPCRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)wantsProgress;
- (NSString)taskIdentifier;
- (NSURL)assetObjectIDURL;
- (PLResourceXPCRequest)initWithCoder:(id)a3;
- (PLResourceXPCRequest)initWithTaskIdentifier:(id)a3 assetObjectID:(id)a4;
- (PLResourceXPCRequest)initWithTaskIdentifier:(id)a3 assetObjectIDURL:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setWantsProgress:(BOOL)a3;
@end

@implementation PLResourceXPCRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetObjectIDURL, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (void)setWantsProgress:(BOOL)a3
{
  self->_wantsProgress = a3;
}

- (BOOL)wantsProgress
{
  return self->_wantsProgress;
}

- (NSURL)assetObjectIDURL
{
  return self->_assetObjectIDURL;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (PLResourceXPCRequest)initWithCoder:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLResourceXPCRequest;
  v5 = [(PLResourceXPCRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskIdentifier"];
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetObjectIDURL"];
    assetObjectIDURL = v5->_assetObjectIDURL;
    v5->_assetObjectIDURL = (NSURL *)v8;

    v5->_wantsProgress = [v4 decodeBoolForKey:@"wantsProgress"];
    if (!v5->_taskIdentifier || !v5->_assetObjectIDURL)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F8C500];
      uint64_t v16 = *MEMORY[0x1E4F28228];
      v17[0] = @"task identifier and asset object id url are required";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      v13 = [v10 errorWithDomain:v11 code:46309 userInfo:v12];
      [v4 failWithError:v13];

      v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  taskIdentifier = self->_taskIdentifier;
  id v5 = a3;
  [v5 encodeObject:taskIdentifier forKey:@"taskIdentifier"];
  [v5 encodeObject:self->_assetObjectIDURL forKey:@"assetObjectIDURL"];
  [v5 encodeBool:self->_wantsProgress forKey:@"wantsProgress"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p> %@, %@", v5, self, self->_taskIdentifier, self->_assetObjectIDURL];

  return v6;
}

- (PLResourceXPCRequest)initWithTaskIdentifier:(id)a3 assetObjectID:(id)a4
{
  id v6 = a3;
  v7 = [a4 URIRepresentation];
  uint64_t v8 = [(PLResourceXPCRequest *)self initWithTaskIdentifier:v6 assetObjectIDURL:v7];

  return v8;
}

- (PLResourceXPCRequest)initWithTaskIdentifier:(id)a3 assetObjectIDURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLResourceXPCRequest;
  v9 = [(PLResourceXPCRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_taskIdentifier, a3);
    objc_storeStrong((id *)&v10->_assetObjectIDURL, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end