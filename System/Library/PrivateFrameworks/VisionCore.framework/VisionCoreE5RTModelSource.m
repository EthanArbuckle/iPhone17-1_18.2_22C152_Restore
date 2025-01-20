@interface VisionCoreE5RTModelSource
+ (BOOL)isModelSourceURL:(id)a3;
+ (Class)_classForModelAtURL:(id)a3 error:(id *)a4;
+ (id)modelSourceFromURL:(id)a3 error:(id *)a4;
- (NSURL)URL;
- (VisionCoreE5RTModelSource)initWithURL:(id)a3;
@end

@implementation VisionCoreE5RTModelSource

- (void).cxx_destruct
{
}

- (NSURL)URL
{
  return self->_url;
}

- (VisionCoreE5RTModelSource)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VisionCoreE5RTModelSource;
  v6 = [(VisionCoreE5RTModelSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

+ (id)modelSourceFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (objc_class *)[a1 _classForModelAtURL:v6 error:a4];
  if (v7) {
    v8 = (void *)[[v7 alloc] initWithURL:v6];
  }
  else {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isModelSourceURL:(id)a3
{
  return [a1 _classForModelAtURL:a3 error:0] != 0;
}

+ (Class)_classForModelAtURL:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_classForModelAtURL_error__onceToken != -1) {
    dispatch_once(&_classForModelAtURL_error__onceToken, &__block_literal_global_828);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)_classForModelAtURL_error__modelSourceClasses;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 isModelSourceURL:v5])
        {
          a4 = v11;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    id v12 = [NSString alloc];
    v13 = [v5 lastPathComponent];
    id v6 = (id)[v12 initWithFormat:@"%@ is not a supported model file", v13];

    uint64_t v14 = *MEMORY[0x263F08590];
    v21[0] = *MEMORY[0x263F08320];
    v21[1] = v14;
    v22[0] = v6;
    v22[1] = v5;
    v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorWithCode:6 userInfo:v15];

    a4 = 0;
LABEL_14:
  }
  return (Class)a4;
}

void __55__VisionCoreE5RTModelSource__classForModelAtURL_error___block_invoke()
{
  id v2 = +[VisionCoreRuntimeUtilities leafSubclassesOfClass:objc_opt_class() excludingRootClass:1];
  uint64_t v0 = [v2 copy];
  v1 = (void *)_classForModelAtURL_error__modelSourceClasses;
  _classForModelAtURL_error__modelSourceClasses = v0;
}

@end