@interface _PUWallpaperDebugRenderingEnvironment
- (BOOL)px_isCallServices;
- (BOOL)px_isPlayground;
- (BOOL)px_isPreview;
- (BOOL)px_isSnapshot;
- (CGRect)px_floatingObscurableBounds;
- (CGRect)px_titleBoundsForLayout:(unint64_t)a3;
- (NSURL)assetDirectory;
- (PFPosterConfiguration)posterConfiguration;
- (_PUWallpaperDebugRenderingEnvironment)initWithPosterConfiguration:(id)a3 assetDirectory:(id)a4;
- (int64_t)px_backlightLuminance;
- (int64_t)px_boundingShape;
- (int64_t)px_contentsType;
- (int64_t)px_deviceOrientation;
- (unint64_t)px_significantEventsCounter;
- (void)setPx_significantEventsCounter:(unint64_t)a3;
@end

@implementation _PUWallpaperDebugRenderingEnvironment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDirectory, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (void)setPx_significantEventsCounter:(unint64_t)a3
{
  self->_px_significantEventsCounter = a3;
}

- (unint64_t)px_significantEventsCounter
{
  return self->_px_significantEventsCounter;
}

- (BOOL)px_isPreview
{
  return self->_px_preview;
}

- (BOOL)px_isSnapshot
{
  return self->_px_snapshot;
}

- (PFPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (CGRect)px_titleBoundsForLayout:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int64_t)px_deviceOrientation
{
  return 0;
}

- (CGRect)px_floatingObscurableBounds
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)px_contentsType
{
  return 2;
}

- (int64_t)px_boundingShape
{
  return -1;
}

- (BOOL)px_isCallServices
{
  return 0;
}

- (BOOL)px_isPlayground
{
  return 1;
}

- (int64_t)px_backlightLuminance
{
  return -1;
}

- (_PUWallpaperDebugRenderingEnvironment)initWithPosterConfiguration:(id)a3 assetDirectory:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_PUWallpaperDebugRenderingEnvironment;
  v9 = [(_PUWallpaperDebugRenderingEnvironment *)&v29 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_posterConfiguration, a3);
    if (v8)
    {
      id v11 = v8;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1CB10];
      v13 = NSTemporaryDirectory();
      v14 = [v12 fileURLWithPath:v13];
      id v11 = [v14 URLByAppendingPathComponent:@"PhotosPosterRendering"];
    }
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    v16 = [v7 media];
    uint64_t v17 = [v16 firstObject];
    v18 = [(id)v17 assetUUID];
    v19 = [v11 URLByAppendingPathComponent:v18];

    v20 = [v19 path];
    LOBYTE(v17) = [v15 fileExistsAtPath:v20];

    if (v17)
    {
      id v21 = 0;
    }
    else
    {
      id v28 = 0;
      [v15 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v28];
      id v21 = v28;
    }
    id v27 = v21;
    int v22 = [v7 saveToURL:v11 error:&v27];
    id v23 = v27;

    if (v22)
    {
      v24 = (NSURL *)v11;
      p_super = &v10->_assetDirectory->super;
      v10->_assetDirectory = v24;
    }
    else
    {
      p_super = PLWallpaperGetLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v23;
        _os_log_impl(&dword_1AE9F8000, p_super, OS_LOG_TYPE_ERROR, "Failed to store playground configuration: %@", buf, 0xCu);
      }
    }
  }
  return v10;
}

@end