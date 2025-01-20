@interface VisionCoreE5RTProgramLibrary
+ (BOOL)isProgramLibraryAtURL:(id)a3;
+ (id)compileFromURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)compileModelSource:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)programLibraryForURL:(id)a3 error:(id *)a4;
- (NSArray)functionNames;
- (NSDictionary)buildInfo;
- (NSDictionary)segmentationAnalytics;
- (NSString)name;
- (NSURL)URL;
- (e5rt_program_library)programLibraryHandle;
- (id)_initWithURL:(id)a3 compilationOptions:(id)a4 ownedProgramLibraryHandle:(e5rt_program_library *)a5;
- (id)functionNamed:(id)a3 error:(id *)a4;
- (id)metadataForFunctionNamed:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation VisionCoreE5RTProgramLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyName, 0);
  objc_storeStrong((id *)&self->_lazyFunctionNames, 0);
  objc_storeStrong((id *)&self->_compilationOptions, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

- (NSURL)URL
{
  return self->_modelURL;
}

- (e5rt_program_library)programLibraryHandle
{
  return self->_programLibraryHandle;
}

- (id)functionNamed:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  id v6 = a3;
  [v6 UTF8String];
  uint64_t v7 = e5rt_program_library_retain_program_function();
  if (v7)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v7];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v9 = [[VisionCoreE5RTFunction alloc] initWithProgramLibrary:self name:v6 ownedFunctionHandle:&v12];
    v8 = v9;
    if (v9)
    {
      v10 = v9;
    }
    else if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:@"could not create program function"];
    }

    if (v12) {
      e5rt_program_function_release();
    }
  }

  return v8;
}

- (id)metadataForFunctionNamed:(id)a3 error:(id *)a4
{
  [a3 UTF8String];
  uint64_t function_metadata = e5rt_program_library_get_function_metadata();
  if (function_metadata && a4)
  {
    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:function_metadata];
  }
  return 0;
}

- (NSArray)functionNames
{
  lazyFunctionNames = self->_lazyFunctionNames;
  if (!lazyFunctionNames)
  {
    v4 = +[VisionCoreE5RTUtils stringsForHandle:self->_programLibraryHandle fromCountProc:MEMORY[0x263F3B848] stringsProc:MEMORY[0x263F3B840] error:0];
    v5 = (NSArray *)[v4 copy];
    id v6 = self->_lazyFunctionNames;
    self->_lazyFunctionNames = v5;

    lazyFunctionNames = self->_lazyFunctionNames;
  }
  return lazyFunctionNames;
}

- (NSDictionary)segmentationAnalytics
{
  e5rt_program_library_get_segmentation_analytics();
  return (NSDictionary *)0;
}

- (NSDictionary)buildInfo
{
  e5rt_program_library_get_build_info();
  return (NSDictionary *)0;
}

- (NSString)name
{
  lazyName = self->_lazyName;
  if (!lazyName)
  {
    v4 = [(VisionCoreE5RTProgramLibrary *)self URL];
    v5 = [v4 lastPathComponent];

    uint64_t v6 = [v5 pathExtension];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      do
      {
        v8 = v5;
        if (([v7 isEqualToString:@"bundle"] & 1) == 0
          && ([v7 isEqualToString:@"net"] & 1) == 0
          && ![v7 isEqualToString:@"espresso"])
        {
          break;
        }
        v5 = [v5 stringByDeletingPathExtension];

        uint64_t v7 = [v5 pathExtension];
      }
      while (v7);
    }
    v9 = (NSString *)[v5 copy];
    v10 = self->_lazyName;
    self->_lazyName = v9;

    lazyName = self->_lazyName;
  }
  return lazyName;
}

- (void)dealloc
{
  if (self->_programLibraryHandle) {
    e5rt_program_library_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreE5RTProgramLibrary;
  [(VisionCoreE5RTProgramLibrary *)&v3 dealloc];
}

- (id)_initWithURL:(id)a3 compilationOptions:(id)a4 ownedProgramLibraryHandle:(e5rt_program_library *)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VisionCoreE5RTProgramLibrary;
  v11 = [(VisionCoreE5RTProgramLibrary *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_modelURL, a3);
    uint64_t v13 = [v10 copy];
    compilationOptions = v12->_compilationOptions;
    v12->_compilationOptions = (VisionCoreE5RTProgramLibraryCompilationOptions *)v13;

    v12->_programLibraryHandle = *a5;
    *a5 = 0;
  }

  return v12;
}

+ (id)compileModelSource:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 E5ModelFileURL];
  if (![v10 VisionCoreE5RTPathAndReturnError:a5])
  {
LABEL_5:
    uint64_t v12 = 0;
    goto LABEL_20;
  }
  v18[1] = 0;
  uint64_t v11 = e5rt_e5_compiler_create();
  if (v11)
  {
    if (a5)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v11];
      uint64_t v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_5;
  }
  v18[0] = 0;
  if ([v9 createE5RTCompilerOptions:v18 error:a5])
  {
    uint64_t v17 = 0;
    uint64_t v13 = e5rt_e5_compiler_compile();
    if (v13)
    {
      if (a5)
      {
        [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v13];
        uint64_t v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      v14 = (void *)[objc_alloc((Class)a1) _initWithURL:v10 compilationOptions:v9 ownedProgramLibraryHandle:&v17];
      uint64_t v12 = v14;
      if (v14)
      {
        id v15 = v14;
      }
      else if (a5)
      {
        *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:@"could not create program library"];
      }

      if (v17) {
        e5rt_program_library_release();
      }
    }
    e5rt_e5_compiler_options_release();
  }
  else
  {
    uint64_t v12 = 0;
  }
  e5rt_e5_compiler_release();
LABEL_20:

  return v12;
}

+ (id)compileFromURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[VisionCoreE5RTModelSource modelSourceFromURL:a3 error:a5];
  if (v9)
  {
    id v10 = [a1 compileModelSource:v9 options:v8 error:a5];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)programLibraryForURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 VisionCoreE5RTPathAndReturnError:a4])
  {
LABEL_5:
    id v8 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = 0;
  uint64_t v7 = e5rt_program_library_create();
  if (v7)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForE5RTLastErrorMessageAndCode:v7];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    goto LABEL_5;
  }
  id v9 = (void *)[objc_alloc((Class)a1) _initWithURL:v6 compilationOptions:0 ownedProgramLibraryHandle:&v12];
  id v8 = v9;
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:@"could not create program library"];
  }

  if (v12) {
    e5rt_program_library_release();
  }
LABEL_12:

  return v8;
}

+ (BOOL)isProgramLibraryAtURL:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x230F41A40]();
  if ([v3 VisionCoreE5RTPathAndReturnError:0] && !e5rt_program_library_create())
  {
    e5rt_program_library_release();
    int v5 = 0;
  }
  else
  {
    int v5 = 1;
  }

  return v5 == 0;
}

@end