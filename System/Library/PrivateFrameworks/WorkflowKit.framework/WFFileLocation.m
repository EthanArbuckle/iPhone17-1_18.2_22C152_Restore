@interface WFFileLocation
+ (BOOL)canRepresentURL:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (Class)supportedClassForURL:(id)a3;
+ (id)locationWithSerializedRepresentation:(id)a3;
+ (id)locationWithURL:(id)a3;
+ (id)subpathFromURL:(id)a3;
- (BOOL)isSupportedOnCurrentPlatform;
- (BOOL)shouldShowUsersDuringDisplay:(id)a3;
- (NSString)description;
- (NSString)relativeSubpath;
- (WFFileLocation)initWithCoder:(id)a3;
- (WFFileLocation)initWithRelativeSubpath:(id)a3;
- (WFFileLocation)initWithURL:(id)a3;
- (id)resolveLocationWithError:(id *)a3;
- (id)serializedRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFileLocation

- (void).cxx_destruct
{
}

- (NSString)relativeSubpath
{
  return self->_relativeSubpath;
}

- (id)serializedRepresentation
{
  v3 = objc_opt_new();
  v4 = WFFileLocationClassByType();
  v5 = [v4 allKeysForObject:objc_opt_class()];
  v6 = [v5 firstObject];

  [v3 setValue:v6 forKey:@"WFFileLocationType"];
  v7 = [(WFFileLocation *)self relativeSubpath];
  [v3 setValue:v7 forKey:@"relativeSubpath"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFFileLocation *)self relativeSubpath];
  [v4 encodeObject:v5 forKey:@"relativeSubpath"];
}

- (WFFileLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFFileLocation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relativeSubpath"];
    relativeSubpath = v5->_relativeSubpath;
    v5->_relativeSubpath = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFFileLocation *)self relativeSubpath];
  v7 = [v3 stringWithFormat:@"<%@: %p, relativeSubpath: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (id)resolveLocationWithError:(id *)a3
{
  return 0;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 1;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  return 0;
}

- (WFFileLocation)initWithRelativeSubpath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFileLocation;
  uint64_t v6 = [(WFFileLocation *)&v10 init];
  if (!v6) {
    goto LABEL_6;
  }
  v7 = getWFFilesLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFFileLocation initWithRelativeSubpath:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Relative subpath %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&v6->_relativeSubpath, a3);
  if (v6->_relativeSubpath) {
    v8 = v6;
  }
  else {
LABEL_6:
  }
    v8 = 0;

  return v8;
}

- (WFFileLocation)initWithURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFFileLocation.m", 37, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)WFFileLocation;
  uint64_t v6 = [(WFFileLocation *)&v10 init];
  if (v6)
  {
    v7 = [(id)objc_opt_class() subpathFromURL:v5];
    uint64_t v6 = [(WFFileLocation *)v6 initWithRelativeSubpath:v7];
  }
  return v6;
}

+ (id)locationWithSerializedRepresentation:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 objectForKey:@"WFFileLocationType"];
    id v5 = WFFileLocationClassByType();
    uint64_t v6 = (void *)[v5 objectForKey:v4];

    v7 = [v6 locationWithSerializedRepresentation:v3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)canRepresentURL:(id)a3
{
  return 0;
}

+ (Class)supportedClassForURL:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "supportedClassForURL:", v3, (void)v14);
        if (v9)
        {
          v11 = (void *)v9;
          v12 = getWFFilesLogObject();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v19 = "+[WFFileLocation supportedClassForURL:]";
            __int16 v20 = 2112;
            v21 = v11;
            __int16 v22 = 2112;
            id v23 = v3;
            _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEBUG, "%s Found supported class: %@ for URL: %@", buf, 0x20u);
          }

          id v10 = v11;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_13:

  return (Class)v10;
}

+ (id)subpathFromURL:(id)a3
{
  return 0;
}

+ (id)locationWithURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WFFileLocation.m", 23, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  char v6 = [v5 startAccessingSecurityScopedResource];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__WFFileLocation_locationWithURL___block_invoke;
  aBlock[3] = &unk_1E6556F78;
  char v15 = v6;
  id v7 = v5;
  id v14 = v7;
  v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = (objc_class *)[(id)objc_opt_class() supportedClassForURL:v7];
  if (v9) {
    id v10 = (void *)[[v9 alloc] initWithURL:v7];
  }
  else {
    id v10 = 0;
  }
  v8[2](v8);

  return v10;
}

uint64_t __34__WFFileLocation_locationWithURL___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) stopAccessingSecurityScopedResource];
  }
  return result;
}

@end