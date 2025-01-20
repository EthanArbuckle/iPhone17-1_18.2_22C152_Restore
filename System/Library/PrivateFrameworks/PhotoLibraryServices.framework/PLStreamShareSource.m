@interface PLStreamShareSource
- (NSData)mediaData;
- (NSString)fileExtension;
- (NSURL)mediaURL;
- (PFVideoComplement)videoComplement;
- (PLStreamShareSource)initWithDictionary:(id)a3;
- (id)photoLibrary;
- (id)serializedDictionary;
- (int64_t)mediaType;
- (void)_cleanupIfNeededMediaAtURL:(id)a3;
- (void)cleanupResources;
- (void)setFileExtension:(id)a3;
- (void)setMediaData:(id)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setMediaURL:(id)a3;
- (void)setVideoComplement:(id)a3;
@end

@implementation PLStreamShareSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoComplement, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_sandboxedVideoComplementVideoURL, 0);
  objc_storeStrong((id *)&self->_sandboxedVideoComplementImageURL, 0);
  objc_storeStrong((id *)&self->_sandboxedMediaURL, 0);
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setVideoComplement:(id)a3
{
}

- (PFVideoComplement)videoComplement
{
  return self->_videoComplement;
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (void)setFileExtension:(id)a3
{
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setMediaData:(id)a3
{
}

- (NSData)mediaData
{
  return self->_mediaData;
}

- (id)photoLibrary
{
  return +[PLPhotoLibrary cloudSharingPhotoLibrary];
}

- (void)cleanupResources
{
}

- (void)_cleanupIfNeededMediaAtURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = [a3 path];
  v5 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  v6 = [v5 temporaryDragAndDropDirectoryCreateIfNeeded:0 error:0];
  int v7 = [v4 hasPrefix:v6];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    mediaURL = self->_mediaURL;
    id v13 = 0;
    char v10 = [v8 removeItemAtURL:mediaURL error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0)
    {
      v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v11;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Cleanup failed with error %@.", buf, 0xCu);
      }
    }
  }
}

- (void)setMediaURL:(id)a3
{
  v5 = (NSURL *)a3;
  mediaURL = self->_mediaURL;
  if (mediaURL != v5)
  {
    id v13 = v5;
    int v7 = mediaURL;
    objc_storeStrong((id *)&self->_mediaURL, a3);
    uint64_t v8 = [(NSURL *)v7 path];
    if (v8)
    {
      v9 = (void *)v8;
      char v10 = [(NSURL *)v7 path];
      id v11 = [(NSURL *)v13 path];
      char v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0) {
        [(PLStreamShareSource *)self _cleanupIfNeededMediaAtURL:v7];
      }
    }

    v5 = v13;
  }
}

- (PLStreamShareSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PLStreamShareSource;
  v5 = [(PLStreamShareSource *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"SerializedFileExtensionKey"];
    [(PLStreamShareSource *)v5 setFileExtension:v6];

    int v7 = [v4 objectForKeyedSubscript:@"SerializedDataKey"];
    [(PLStreamShareSource *)v5 setMediaData:v7];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"SerializedMediaTypeKey"];
    -[PLStreamShareSource setMediaType:](v5, "setMediaType:", [v8 integerValue]);

    v9 = [v4 objectForKeyedSubscript:@"SerializedVideoComplementKey"];
    if (v9)
    {
      char v10 = (void *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithPropertyList:v9];
      [(PLStreamShareSource *)v5 setVideoComplement:v10];
      id v11 = objc_alloc(MEMORY[0x1E4F8B9D0]);
      char v12 = [v10 imagePath];
      id v13 = [v4 objectForKeyedSubscript:@"SerializedVideoComplementImageSandboxExtensionTokenKey"];
      uint64_t v14 = [v11 initFileURLWithPath:v12 sandboxExtensionToken:v13 consume:1];
      sandboxedVideoComplementImageURL = v5->_sandboxedVideoComplementImageURL;
      v5->_sandboxedVideoComplementImageURL = (PLSandboxedURL *)v14;

      id v16 = objc_alloc(MEMORY[0x1E4F8B9D0]);
      v17 = [v10 videoPath];
      v18 = [v4 objectForKeyedSubscript:@"SerializedVideoComplementVideoSandboxExtensionTokenKey"];
      uint64_t v19 = [v16 initFileURLWithPath:v17 sandboxExtensionToken:v18 consume:1];
      sandboxedVideoComplementVideoURL = v5->_sandboxedVideoComplementVideoURL;
      v5->_sandboxedVideoComplementVideoURL = (PLSandboxedURL *)v19;
    }
    v21 = [v4 objectForKeyedSubscript:@"SerializedURLKey"];
    if (v21)
    {
      v22 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
      [(PLStreamShareSource *)v5 setMediaURL:v22];

      id v23 = objc_alloc(MEMORY[0x1E4F8B9D0]);
      v24 = [(PLStreamShareSource *)v5 mediaURL];
      v25 = [v4 objectForKeyedSubscript:@"SerializedSandboxExtensionTokenKey"];
      uint64_t v26 = [v23 initWithURL:v24 sandboxExtensionToken:v25 consume:1];
      sandboxedMediaURL = v5->_sandboxedMediaURL;
      v5->_sandboxedMediaURL = (PLSandboxedURL *)v26;
    }
    v28 = v5;
  }
  return v5;
}

- (id)serializedDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PLStreamShareSource *)self mediaData];

  if (v4)
  {
    v5 = [(PLStreamShareSource *)self mediaData];
    [v3 setObject:v5 forKey:@"SerializedDataKey"];
  }
  v6 = [(PLStreamShareSource *)self mediaURL];
  int v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 absoluteString];
    [v3 setObject:v8 forKey:@"SerializedURLKey"];

    v9 = [v7 path];
    char v10 = PLGetSandboxExtensionToken();

    if (v10) {
      [v3 setObject:v10 forKey:@"SerializedSandboxExtensionTokenKey"];
    }
  }
  id v11 = [(PLStreamShareSource *)self fileExtension];

  if (v11)
  {
    char v12 = [(PLStreamShareSource *)self fileExtension];
    [v3 setObject:v12 forKey:@"SerializedFileExtensionKey"];
  }
  id v13 = [(PLStreamShareSource *)self videoComplement];
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = [v13 propertyListRepresentation];
    [v3 setObject:v15 forKeyedSubscript:@"SerializedVideoComplementKey"];
    id v16 = [v14 imagePath];
    v17 = PLGetSandboxExtensionToken();
    [v3 setObject:v17 forKeyedSubscript:@"SerializedVideoComplementImageSandboxExtensionTokenKey"];

    v18 = [v14 videoPath];
    uint64_t v19 = PLGetSandboxExtensionToken();
    [v3 setObject:v19 forKeyedSubscript:@"SerializedVideoComplementVideoSandboxExtensionTokenKey"];
  }
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLStreamShareSource mediaType](self, "mediaType"));
  [v3 setObject:v20 forKey:@"SerializedMediaTypeKey"];

  return v3;
}

@end