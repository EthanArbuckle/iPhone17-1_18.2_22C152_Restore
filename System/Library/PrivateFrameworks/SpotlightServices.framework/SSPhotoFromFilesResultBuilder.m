@interface SSPhotoFromFilesResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
- (SSPhotoFromFilesResultBuilder)initWithResult:(id)a3;
- (id)appBundleId;
- (id)buildCommand;
- (id)buildPreviewCommand;
- (id)buildThumbnail;
@end

@implementation SSPhotoFromFilesResultBuilder

+ (id)bundleId
{
  if (isMacOS()) {
    v2 = @"com.apple.spotlight.syndicatedPhotos.fileProvider";
  }
  else {
    v2 = 0;
  }
  return v2;
}

+ (BOOL)supportsResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 contentType];
  if (v4)
  {
    v5 = [v3 contentType];
    isImageOrVideoContentType((uint64_t)v5);
  }
  return 0;
}

+ (BOOL)isCoreSpotlightResult
{
  return isMacOS() ^ 1;
}

- (SSPhotoFromFilesResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSPhotoFromFilesResultBuilder;
  v5 = [(SSPhotosResultBuilder *)&v10 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22C70] withType:objc_opt_class()];
    [(SSResultBuilder *)v5 setFilePath:v6];

    v7 = [(SSResultBuilder *)v5 filePath];

    if (!v7)
    {
      v8 = SSGeneralLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SSPhotoFromFilesResultBuilder initWithResult:](v5, v8);
      }
    }
  }

  return v5;
}

- (id)appBundleId
{
  return @"com.apple.CloudDocs.MobileDocumentsFileProvider";
}

- (id)buildThumbnail
{
  id v3 = [(SSResultBuilder *)self filePath];

  if (v3)
  {
    id v4 = objc_opt_new();
    v5 = (void *)MEMORY[0x1E4F1CB10];
    v6 = [(SSResultBuilder *)self filePath];
    v7 = [v5 fileURLWithPath:v6 isDirectory:0];
    [v4 setFilePath:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSPhotoFromFilesResultBuilder;
    id v4 = [(SSPhotosResultBuilder *)&v9 buildThumbnail];
  }
  return v4;
}

- (id)buildPreviewCommand
{
  id v3 = [(SSResultBuilder *)self filePath];

  if (v3)
  {
    id v4 = objc_opt_new();
    v5 = (void *)MEMORY[0x1E4F9A2F8];
    v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [(SSResultBuilder *)self filePath];
    v8 = [v6 fileURLWithPath:v7 isDirectory:0];
    objc_super v9 = [v5 punchoutWithURL:v8];
    [v4 setPhotoFilePunchout:v9];

    objc_super v10 = [(SSPhotosResultBuilder *)self scenes];
    [v4 setMatchedScenes:v10];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SSPhotoFromFilesResultBuilder;
    id v4 = [(SSResultBuilder *)&v12 buildPreviewCommand];
  }
  return v4;
}

- (id)buildCommand
{
  id v3 = [(SSResultBuilder *)self result];
  id v4 = [v3 url];

  v5 = objc_opt_new();
  v6 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v4];
  [v5 setPhotoFilePunchout:v6];

  v7 = [(SSPhotosResultBuilder *)self scenes];
  [v5 setMatchedScenes:v7];

  return v5;
}

- (void)initWithResult:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 result];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "SSPhotoFromFilesResultBuilder: missing filePath for result:%@", (uint8_t *)&v4, 0xCu);
}

@end