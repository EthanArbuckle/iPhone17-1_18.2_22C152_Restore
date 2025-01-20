@interface PICaptureDebugUtilities
+ (id)captureDebugDirectoryForComposition:(id)a3;
@end

@implementation PICaptureDebugUtilities

+ (id)captureDebugDirectoryForComposition:(id)a3
{
  id v3 = a3;
  if (NUIsAppleInternal())
  {
    v4 = [v3 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 definition];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v5 image];

        v5 = (void *)v6;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [v5 sourceDefinitions];
        v8 = [v7 firstObject];
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    v10 = [v8 url];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 lastPathComponent];
      v13 = [v12 stringByDeletingPathExtension];

      v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/mobile/Media/PhotoData/CaptureDebug/"];
      v9 = v14;
      if (v13)
      {
        uint64_t v15 = [v14 URLByAppendingPathComponent:v13 isDirectory:1];

        v9 = (void *)v15;
      }
      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v16 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:0];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end