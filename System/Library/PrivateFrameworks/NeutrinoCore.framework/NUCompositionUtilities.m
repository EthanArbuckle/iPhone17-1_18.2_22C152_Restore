@interface NUCompositionUtilities
+ (BOOL)dumpComposition:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)dumpComposition:(id)a3 withName:(id)a4;
+ (BOOL)isHDRComposition:(id)a3;
+ (id)debugDiagnosticNameForComposition:(id)a3;
@end

@implementation NUCompositionUtilities

+ (id)debugDiagnosticNameForComposition:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 definition];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 image];

      v4 = (void *)v5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v4 sourceDefinitions];
      v7 = [v6 firstObject];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = [v7 url];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 lastPathComponent];
    v11 = [v10 stringByDeletingPathExtension];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)dumpComposition:(id)a3 withName:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a4;
  id v7 = a3;
  v8 = NSTemporaryDirectory();
  v9 = [v5 fileURLWithPath:v8 isDirectory:1];
  v10 = [v9 URLByAppendingPathComponent:v6];

  v11 = [v10 URLByAppendingPathExtension:@"plist"];

  id v19 = 0;
  BOOL v12 = +[NUCompositionUtilities dumpComposition:v7 toURL:v11 error:&v19];

  id v13 = v19;
  if (v12)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26852);
    }
    v14 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      v16 = [v11 path];
      *(_DWORD *)buf = 138412290;
      id v21 = v16;
      _os_log_impl(&dword_1A9892000, v15, OS_LOG_TYPE_INFO, "Successfully dumped the composition to file %@", buf, 0xCu);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_26852);
    }
    v17 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_1A9892000, v17, OS_LOG_TYPE_INFO, "Failed to dump the composition: %@", buf, 0xCu);
    }
  }

  return v12;
}

+ (BOOL)dumpComposition:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = +[NUAdjustmentSerialization propertyListFromComposition:a3 error:a5];
  v9 = v8;
  if (v8) {
    char v10 = [v8 writeToURL:v7 error:a5];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)isHDRComposition:(id)a3
{
  id v3 = a3;
  if (!v3 || !+[NUGlobalSettings enableHDRSupport])
  {
    char v4 = 0;
    goto LABEL_6;
  }
  if (!+[NUGlobalSettings allAssetsCanUseHDRPipeline])
  {
    if ([v3 mediaType] == 2)
    {
      id v6 = [(NURenderRequest *)[NUVideoPropertiesRequest alloc] initWithComposition:v3];
      [(NURenderRequest *)v6 setName:@"NUCompositionUtilities-isHDRComposition-videoProperties"];
      uint64_t v12 = 0;
      id v7 = [(NUVideoPropertiesRequest *)v6 submitSynchronous:&v12];
      v8 = [v7 properties];

      if (v8)
      {
        char v4 = [v8 isHDR];
LABEL_12:

LABEL_14:
        goto LABEL_6;
      }
    }
    else
    {
      id v6 = [(NURenderRequest *)[NUImagePropertiesRequest alloc] initWithComposition:v3];
      [(NURenderRequest *)v6 setName:@"NUCompositionUtilities-isHDRComposition-imageProperties"];
      uint64_t v11 = 0;
      v9 = [(NUVideoPropertiesRequest *)v6 submitSynchronous:&v11];
      v8 = [v9 properties];

      if (v8)
      {
        char v10 = [v8 colorSpace];
        char v4 = [v10 isHDR];

        goto LABEL_12;
      }
    }
    char v4 = 0;
    goto LABEL_14;
  }
  char v4 = 1;
LABEL_6:

  return v4;
}

@end