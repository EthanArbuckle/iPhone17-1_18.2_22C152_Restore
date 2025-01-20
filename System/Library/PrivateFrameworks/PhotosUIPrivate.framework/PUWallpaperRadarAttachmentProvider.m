@interface PUWallpaperRadarAttachmentProvider
+ (id)generateDebugDescriptionForSuggestion:(id)a3;
+ (id)radarConfigurationForAsset:(id)a3 suggestion:(id)a4 compoundLayerStack:(id)a5 segmentationItem:(id)a6 posterDescriptor:(id)a7 posterConfiguration:(id)a8 component:(int64_t)a9 completionHandler:(id)a10;
- (PHAsset)asset;
- (PHSuggestion)suggestion;
- (PUWallpaperRadarAttachmentProvider)initWithSuggestion:(id)a3 asset:(id)a4;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)setAsset:(id)a3;
- (void)setSuggestion:(id)a3;
@end

@implementation PUWallpaperRadarAttachmentProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setSuggestion:(id)a3
{
}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [(PUWallpaperRadarAttachmentProvider *)self suggestion];
  id v7 = [v5 generateDebugDescriptionForSuggestion:v6];

  [v4 addAttachment:v7];
}

- (PUWallpaperRadarAttachmentProvider)initWithSuggestion:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUWallpaperRadarAttachmentProvider;
  v9 = [(PUWallpaperRadarAttachmentProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
  }

  return v10;
}

+ (id)radarConfigurationForAsset:(id)a3 suggestion:(id)a4 compoundLayerStack:(id)a5 segmentationItem:(id)a6 posterDescriptor:(id)a7 posterConfiguration:(id)a8 component:(int64_t)a9 completionHandler:(id)a10
{
  v16 = (objc_class *)MEMORY[0x1E4F905F0];
  id v17 = a10;
  id v28 = a8;
  id v27 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = objc_alloc_init(v16);
  [v22 setComponent:a9];
  [v22 setClassification:7];
  [v22 setWantsPhotosDiagnostics:1];
  [v22 setTitle:@"[Maglev] This wallpaper could be better"];
  [v22 setDescription:@"Please describe how the wallpaper could be better:"];
  [v22 setCompletionHandler:v17];

  v23 = [[PUParallaxLayerStackRadarController alloc] initWithAsset:v21 compoundLayerStack:v19 segmentationItem:v18 posterDescriptor:v27 posterConfiguration:v28];
  [v22 addDiagnosticProvider:v23];
  v24 = [[PUWallpaperRadarAttachmentProvider alloc] initWithSuggestion:v20 asset:v21];
  [v22 addDiagnosticProvider:v24];
  v25 = [[PUWallpaperVisualDiagnosticsProvider alloc] initWithSuggestion:v20 asset:v21];

  [v22 addDiagnosticProvider:v25];
  return v22;
}

+ (id)generateDebugDescriptionForSuggestion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 uuid];
  v5 = NSTemporaryDirectory();
  v6 = [NSString stringWithFormat:@"Suggestion-%@", v4];
  id v7 = [v5 stringByAppendingPathComponent:v6];

  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:1];
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  char v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v11 = v20;

  if (v10)
  {
    objc_super v12 = [v3 debugDescription];
    v13 = [v7 stringByAppendingPathComponent:@"suggestion_debug_information.txt"];
    v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
    id v19 = 0;
    char v15 = [v12 writeToURL:v14 atomically:1 encoding:4 error:&v19];
    id v16 = v19;
    if ((v15 & 1) == 0)
    {
      id v17 = PLUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = v4;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_ERROR, "Failed saving Suggestion<%@> description. Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    objc_super v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v11;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Failed creating temp directory for Suggestion TTR. Error: %@", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

@end