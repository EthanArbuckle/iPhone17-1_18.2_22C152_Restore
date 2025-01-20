@interface ML3Artwork
- (BOOL)isEqual:(id)a3;
- (ML3Artwork)initWithToken:(id)a3 artworkType:(int64_t)a4 musicLibrary:(id)a5;
- (ML3Artwork)initWithToken:(id)a3 relativePath:(id)a4 artworkType:(int64_t)a5 musicLibrary:(id)a6;
- (ML3MusicLibrary)musicLibrary;
- (NSDictionary)interestDictionary;
- (NSString)artworkToken;
- (NSString)relativePath;
- (NSURL)originalFileURL;
- (id)_interestDataFromInterestDictionary:(id)a3;
- (id)_interestDictionaryFromInterestData:(id)a3;
- (id)fileURLForEffect:(id)a3;
- (id)fileURLForSize:(CGSize)a3;
- (int64_t)artworkType;
- (int64_t)sourceType;
- (unint64_t)hash;
- (void)_onSerialQueue_faultInProperties;
- (void)setInterestDictionary:(id)a3;
@end

@implementation ML3Artwork

- (ML3Artwork)initWithToken:(id)a3 artworkType:(int64_t)a4 musicLibrary:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[ML3MusicLibrary artworkRelativePathFromToken:v9];
  v11 = [(ML3Artwork *)self initWithToken:v9 relativePath:v10 artworkType:a4 musicLibrary:v8];

  return v11;
}

- (ML3Artwork)initWithToken:(id)a3 relativePath:(id)a4 artworkType:(int64_t)a5 musicLibrary:(id)a6
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (!v13)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"ML3Artwork.m" lineNumber:40 description:@"Relative path cannot be nil."];
  }
  v29.receiver = self;
  v29.super_class = (Class)ML3Artwork;
  v15 = [(ML3Artwork *)&v29 init];
  if (v15)
  {
    id v16 = [NSString stringWithFormat:@"com.apple.MusicLibrary.%@", objc_opt_class()];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    serialQueue = v15->_serialQueue;
    v15->_serialQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v15->_artworkToken, a3);
    objc_storeStrong((id *)&v15->_relativePath, a4);
    v15->_artworkType = a5;
    v19 = (void *)MEMORY[0x1E4F1CB10];
    v20 = NSString;
    v21 = [v14 originalArtworkDirectory];
    relativePath = v15->_relativePath;
    v30[0] = v21;
    v30[1] = relativePath;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v24 = [v20 pathWithComponents:v23];
    uint64_t v25 = [v19 fileURLWithPath:v24 isDirectory:0];
    originalFileURL = v15->_originalFileURL;
    v15->_originalFileURL = (NSURL *)v25;

    objc_storeStrong((id *)&v15->_musicLibrary, a6);
  }

  return v15;
}

- (id)fileURLForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v16[2] = *MEMORY[0x1E4F143B8];
  v6 = [(ML3Artwork *)self originalFileURL];
  if (width != 1.79769313e308 || height != 1.79769313e308)
  {
    id v8 = NSString;
    id v9 = [(ML3Artwork *)self musicLibrary];
    v10 = objc_msgSend(v9, "artworkCacheDirectoryForSize:", width, height);
    v16[0] = v10;
    v11 = [(ML3Artwork *)self relativePath];
    v16[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v13 = [v8 pathWithComponents:v12];

    uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];

    v6 = (void *)v14;
  }

  return v6;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (NSURL)originalFileURL
{
  return self->_originalFileURL;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFileURL, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_artworkToken, 0);
  objc_storeStrong((id *)&self->_musicLibrary, 0);
  objc_storeStrong((id *)&self->_interestDictionary, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (NSString)artworkToken
{
  return self->_artworkToken;
}

- (id)_interestDataFromInterestDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v4 = 0;
    goto LABEL_10;
  }
  id v14 = 0;
  v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v14];
  id v5 = v14;
  v6 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = [(ML3Artwork *)self artworkToken];
      *(_DWORD *)buf = 138477827;
      id v16 = v8;
      id v9 = "Archived interest data for artwork_token %{private}@.";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      uint32_t v12 = 12;
LABEL_8:
      _os_log_impl(&dword_1B022D000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = [(ML3Artwork *)self artworkToken];
    *(_DWORD *)buf = 138478083;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v5;
    id v9 = "Failed to archive interest data for artwork_token %{private}@. Error=%{public}@";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_8;
  }

LABEL_10:

  return v4;
}

- (id)_interestDictionaryFromInterestData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v4 = 0;
    goto LABEL_10;
  }
  id v13 = 0;
  v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v13];
  id v5 = v13;
  v6 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = [(ML3Artwork *)self artworkToken];
      *(_DWORD *)buf = 138478083;
      v15 = v8;
      __int16 v16 = 2113;
      id v17 = v4;
      id v9 = "Unarchived interest data for artwork_token %{private}@ with resulting dict: %{private}@";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_1B022D000, v10, v11, v9, buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = [(ML3Artwork *)self artworkToken];
    *(_DWORD *)buf = 138478083;
    v15 = v8;
    __int16 v16 = 2114;
    id v17 = v5;
    id v9 = "Failed to unarchive data for artwork_token %{private}@. err=%{public}@";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }

LABEL_10:

  return v4;
}

- (void)_onSerialQueue_faultInProperties
{
  v3 = [(ML3Artwork *)self musicLibrary];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__ML3Artwork__onSerialQueue_faultInProperties__block_invoke;
  v4[3] = &unk_1E5FB8420;
  v4[4] = self;
  [v3 databaseConnectionAllowingWrites:0 withBlock:v4];
}

void __46__ML3Artwork__onSerialQueue_faultInProperties__block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 artworkToken];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7 = [v4 executeQuery:@"SELECT artwork_source_type, artwork_type, interest_data FROM artwork WHERE artwork_token = ?", v6 withParameters];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__ML3Artwork__onSerialQueue_faultInProperties__block_invoke_2;
  v8[3] = &unk_1E5FB83F8;
  v8[4] = *(void *)(a1 + 32);
  [v7 enumerateRowsWithBlock:v8];
}

void __46__ML3Artwork__onSerialQueue_faultInProperties__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  *(void *)(*(void *)(a1 + 32) + 24) = (int)[v6 intForColumnIndex:0];
  *(void *)(*(void *)(a1 + 32) + 16) = (int)[v6 intForColumnIndex:1];
  id v10 = [v6 dataForColumnIndex:2];

  uint64_t v7 = [*(id *)(a1 + 32) _interestDictionaryFromInterestData:v10];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  *a4 = 1;
}

- (void)setInterestDictionary:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__ML3Artwork_setInterestDictionary___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __36__ML3Artwork_setInterestDictionary___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = v4;
    if (!v4)
    {
      id v5 = [MEMORY[0x1E4F1CA98] null];
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v5);
    if (!v4) {

    }
    id v6 = [*(id *)(a1 + 32) artworkToken];
    uint64_t v7 = [*(id *)(a1 + 32) _interestDataFromInterestDictionary:*(void *)(a1 + 40)];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA98] null];
    }
    id v10 = v9;

    os_log_type_t v11 = os_log_create("com.apple.amp.medialibrary", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v12 = [MEMORY[0x1E4F1CA98] null];
      *(_DWORD *)buf = 138543618;
      v26 = v6;
      __int16 v27 = 1024;
      BOOL v28 = v10 != v12;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Setting intereset dict with artwork token: %{public}@, with nonnull data: %{BOOL}u", buf, 0x12u);
    }
    v23[0] = @"MLDatabaseOperationAttributeArtworkTokenKey";
    v23[1] = @"MLDatabaseOperationAttributeArtworkInterestDataKey";
    v24[0] = v6;
    v24[1] = v10;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v21[0] = @"MLDatabaseOperationOptionDatabasePathKey";
    id v14 = [*(id *)(a1 + 32) musicLibrary];
    v15 = [v14 databasePath];
    v21[1] = @"MLDatabaseOperationOptionUseLimitedQueue";
    v22[0] = v15;
    v22[1] = MEMORY[0x1E4F1CC38];
    __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

    id v17 = +[MLMediaLibraryService sharedMediaLibraryService];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __36__ML3Artwork_setInterestDictionary___block_invoke_16;
    v19[3] = &unk_1E5FB83A8;
    id v20 = v6;
    id v18 = v6;
    [v17 performDatabaseOperation:5 withAttributes:v13 options:v16 completionHandler:v19];
  }
}

void __36__ML3Artwork_setInterestDictionary___block_invoke_16(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v8;
      id v9 = "Saved interest data to database for artwork_token %{public}@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1B022D000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 2114;
    id v17 = v5;
    id v9 = "Failed to save interest data to database for artwork_token %{public}@ with error: %{public}@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (NSDictionary)interestDictionary
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__28174;
  id v10 = __Block_byref_object_dispose__28175;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__ML3Artwork_interestDictionary__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __32__ML3Artwork_interestDictionary__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)v2[4];
  if (!v3)
  {
    objc_msgSend(v2, "_onSerialQueue_faultInProperties");
    id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  }
  id v5 = [MEMORY[0x1E4F1CA98] null];
  if (v3 == v5) {
    id v4 = 0;
  }
  else {
    id v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (v3 != v5) {
}
  }

- (int64_t)sourceType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__ML3Artwork_sourceType__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__24__ML3Artwork_sourceType__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  uint64_t v3 = result[3];
  if (!v3)
  {
    result = objc_msgSend(result, "_onSerialQueue_faultInProperties");
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)artworkType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__ML3Artwork_artworkType__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__25__ML3Artwork_artworkType__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  uint64_t v3 = result[2];
  if (!v3)
  {
    result = objc_msgSend(result, "_onSerialQueue_faultInProperties");
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)fileURLForEffect:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [(ML3Artwork *)self musicLibrary];
  uint64_t v7 = [v6 artworkCacheDirectoryForEffect:v5];

  v13[0] = v7;
  uint64_t v8 = [(ML3Artwork *)self relativePath];
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v10 = [v4 pathWithComponents:v9];

  id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:0];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ML3Artwork *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 0;
      serialQueue = self->_serialQueue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __22__ML3Artwork_isEqual___block_invoke;
      v8[3] = &unk_1E5FB8338;
      id v10 = &v16;
      v8[4] = self;
      uint64_t v9 = v4;
      id v11 = &v12;
      dispatch_sync(serialQueue, v8);
      if (*((unsigned char *)v17 + 24)) {
        BOOL v6 = *((unsigned char *)v13 + 24) != 0;
      }
      else {
        BOOL v6 = 0;
      }

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

uint64_t __22__ML3Artwork_isEqual___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 48) isEqualToString:*(void *)(a1[5] + 48)];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 16) == *(void *)(a1[5] + 16);
  return result;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_artworkToken hash];
  return [(NSString *)self->_relativePath hash] ^ v3 ^ self->_artworkType;
}

@end