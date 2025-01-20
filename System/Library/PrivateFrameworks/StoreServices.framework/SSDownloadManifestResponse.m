@interface SSDownloadManifestResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)validDownloads;
- (SSDownloadManifestResponse)initWithCoder:(id)a3;
- (SSDownloadManifestResponse)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setValidDownloads:(id)a3;
@end

@implementation SSDownloadManifestResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadManifestResponse;
  [(SSDownloadManifestResponse *)&v3 dealloc];
}

- (NSArray)validDownloads
{
  return self->_validDownloads;
}

- (void)setValidDownloads:(id)a3
{
  validDownloads = self->_validDownloads;
  if (validDownloads != a3)
  {

    self->_validDownloads = (NSArray *)a3;
  }
}

- (SSDownloadManifestResponse)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSDownloadManifestResponse.m", 41, @"Only keyed coding is supported");
  }
  v10.receiver = self;
  v10.super_class = (Class)SSDownloadManifestResponse;
  v6 = [(SSDownloadManifestResponse *)&v10 init];
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v6->_validDownloads = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"valid");
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSDownloadManifestResponse.m", 49, @"Only keyed coding is supported");
  }
  validDownloads = self->_validDownloads;
  [a3 encodeObject:validDownloads forKey:@"valid"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyXPCEncoding
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  validDownloads = self->_validDownloads;
  uint64_t v6 = [(NSArray *)validDownloads countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(validDownloads);
        }
        xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, [*(id *)(*((void *)&v11 + 1) + 8 * v9++) persistentIdentifier]);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)validDownloads countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  xpc_dictionary_set_value(v3, "valid", v4);
  xpc_release(v4);
  return v3;
}

- (SSDownloadManifestResponse)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v11.receiver = self;
    v11.super_class = (Class)SSDownloadManifestResponse;
    v5 = [(SSDownloadManifestResponse *)&v11 init];
    if (v5)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      xpc_object_t value = xpc_dictionary_get_value(a3, "valid");
      if (value)
      {
        uint64_t v9 = value;
        if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F14568])
        {
          applier[0] = MEMORY[0x1E4F143A8];
          applier[1] = 3221225472;
          applier[2] = __50__SSDownloadManifestResponse_initWithXPCEncoding___block_invoke;
          applier[3] = &unk_1E5BA86F8;
          applier[4] = v7;
          xpc_array_apply(v9, applier);
        }
      }
      v5->_validDownloads = (NSArray *)[v7 copy];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

uint64_t __50__SSDownloadManifestResponse_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (MEMORY[0x1A62689E0](a3) == MEMORY[0x1E4F145C0])
  {
    v5 = [[SSDownload alloc] initWithPersistentIdentifier:xpc_int64_get_value(a3)];
    [*(id *)(a1 + 32) addObject:v5];
  }
  return 1;
}

@end