@interface MSVArtworkServiceRequest
+ (BOOL)canConnectToMediaArtworkService;
+ (BOOL)hasWriteAccessToPath:(id)a3;
+ (BOOL)supportsSecureCoding;
- (Class)operationClass;
- (MSVArtworkServiceRequest)init;
- (MSVArtworkServiceRequest)initWithCoder:(id)a3;
- (int64_t)operationPriority;
- (void)addSandboxExtensionIfNeededForURL:(id)a3;
- (void)consumeSandboxExtensions;
- (void)encodeWithCoder:(id)a3;
- (void)releaseSandboxExtensions;
@end

@implementation MSVArtworkServiceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxHandles, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
}

- (int64_t)operationPriority
{
  return 0;
}

- (Class)operationClass
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MSVArtworkServiceRequest.m" lineNumber:99 description:@"Subclass must implement!"];

  return 0;
}

- (void)releaseSandboxExtensions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_sandboxHandles;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "longLongValue", (void)v7);
        sandbox_extension_release();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)consumeSandboxExtensions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_sandboxExtensions allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v7) UTF8String];
        uint64_t v8 = sandbox_extension_consume();
        sandboxHandles = self->_sandboxHandles;
        long long v10 = [NSNumber numberWithLongLong:v8];
        [(NSMutableArray *)sandboxHandles addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)addSandboxExtensionIfNeededForURL:(id)a3
{
  id v11 = a3;
  uint64_t v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sandboxExtensions, "objectForKeyedSubscript:");
  if (v4)
  {
  }
  else
  {
    getpid();
    id v5 = [v11 path];
    uint64_t v10 = [v5 UTF8String];
    int v6 = sandbox_check();

    if (!v6)
    {
      objc_msgSend(v11, "path", v10);
      id v7 = objc_claimAutoreleasedReturnValue();
      [v7 fileSystemRepresentation];
      uint64_t v8 = (void *)sandbox_extension_issue_file();

      if (v8)
      {
        long long v9 = [NSString stringWithUTF8String:v8];
        [(NSMutableDictionary *)self->_sandboxExtensions setObject:v9 forKeyedSubscript:v11];

        free(v8);
      }
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  sandboxExtensions = self->_sandboxExtensions;
  id v5 = a3;
  [v5 encodeObject:sandboxExtensions forKey:@"MSVArtworkServiceRequestSandboxExtensions"];
  [v5 encodeObject:self->_sandboxHandles forKey:@"MSVArtworkServiceRequestSandboxHandles"];
}

- (MSVArtworkServiceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MSVArtworkServiceRequest *)self init];
  if (v5)
  {
    int v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    long long v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"MSVArtworkServiceRequestSandboxExtensions"];
    sandboxExtensions = v5->_sandboxExtensions;
    v5->_sandboxExtensions = (NSMutableDictionary *)v10;

    long long v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    long long v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"MSVArtworkServiceRequestSandboxHandles"];
    sandboxHandles = v5->_sandboxHandles;
    v5->_sandboxHandles = (NSMutableArray *)v15;
  }
  return v5;
}

- (MSVArtworkServiceRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSVArtworkServiceRequest;
  v2 = [(MSVArtworkServiceRequest *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    sandboxExtensions = v2->_sandboxExtensions;
    v2->_sandboxExtensions = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    sandboxHandles = v2->_sandboxHandles;
    v2->_sandboxHandles = (NSMutableArray *)v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)hasWriteAccessToPath:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 path];
  [v3 fileSystemRepresentation];

  getpid();
  return sandbox_check() == 0;
}

+ (BOOL)canConnectToMediaArtworkService
{
  return sandbox_check() == 0;
}

@end