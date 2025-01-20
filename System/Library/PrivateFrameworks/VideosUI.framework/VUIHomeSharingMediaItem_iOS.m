@interface VUIHomeSharingMediaItem_iOS
+ (void)initialize;
- (BOOL)_loadingCancelled:(unint64_t)a3;
- (BOOL)hasTrait:(id)a3;
- (BOOL)needsKeyBagSyncPriorToPlayback;
- (BOOL)shouldRetryPlaybackForError:(id)a3;
- (HSHomeSharingLibrary)homeSharingLibrary;
- (NSString)keyBagFilePath;
- (NSURL)mediaItemURLInternal;
- (VUIHomeSharingMediaItem_iOS)initWithMPMediaItem:(id)a3;
- (id)imageLoader;
- (id)mediaItemMetadataForProperty:(id)a3;
- (id)mediaItemURL;
- (unint64_t)loadingContext;
- (void)_fetchKeybagForDSID:(id)a3 isFamilyAccount:(BOOL)a4 completion:(id)a5;
- (void)cleanUpMediaItem;
- (void)prepareForLoadingWithCompletion:(id)a3;
- (void)setHomeSharingLibrary:(id)a3;
- (void)setKeyBagFilePath:(id)a3;
- (void)setLoadingContext:(unint64_t)a3;
- (void)setMediaItemURLInternal:(id)a3;
- (void)setNeedsKeyBagSyncPriorToPlayback:(BOOL)a3;
- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6;
- (void)updatePlayCountForElapsedTime:(double)a3 duration:(double)a4;
@end

@implementation VUIHomeSharingMediaItem_iOS

+ (void)initialize
{
  if (initialize_onceToken_5 != -1) {
    dispatch_once(&initialize_onceToken_5, &__block_literal_global_84);
  }
}

- (VUIHomeSharingMediaItem_iOS)initWithMPMediaItem:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIHomeSharingMediaItem_iOS;
  v5 = [(VUILibraryMediaItem_iOS *)&v13 initWithMPMediaItem:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vui_homeSharingLibrary");
    homeSharingLibrary = v5->_homeSharingLibrary;
    v5->_homeSharingLibrary = (HSHomeSharingLibrary *)v6;

    v8 = [(HSHomeSharingLibrary *)v5->_homeSharingLibrary uniqueIdentifier];
    v9 = HSLibraryCacheDirectoryForIdentifier();
    uint64_t v10 = [v9 stringByAppendingPathComponent:@"Tokens"];
    keyBagFilePath = v5->_keyBagFilePath;
    v5->_keyBagFilePath = (NSString *)v10;
  }
  return v5;
}

- (id)imageLoader
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = +[VUIMediaLibraryManager defaultManager];
  id v4 = [v3 homeShareMediaLibraries];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 mediaLibrary];
          v11 = [(VUILibraryMediaItem_iOS *)self mpMediaLibrary];
          int v12 = [v10 isEqual:v11];

          if (v12)
          {
            id v13 = v9;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_12:

  return v13;
}

- (id)mediaItemURL
{
  v3 = [(VUIHomeSharingMediaItem_iOS *)self mediaItemURLInternal];

  if (!v3)
  {
    id v4 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    uint64_t v5 = [v4 valueForProperty:*MEMORY[0x1E4F795B8]];

    uint64_t v6 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

    v8 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    v9 = [v8 valueForProperty:*MEMORY[0x1E4F796A0]];

    uint64_t v10 = [v9 unsignedLongLongValue];
    v11 = (void *)MEMORY[0x1E4F6A378];
    int v12 = [(VUIHomeSharingMediaItem_iOS *)self homeSharingLibrary];
    id v13 = objc_msgSend(v11, "requestWithDatabaseID:itemID:format:", objc_msgSend(v12, "databaseID"), v10, v7);

    v14 = [(VUIHomeSharingMediaItem_iOS *)self homeSharingLibrary];
    long long v15 = [v14 urlForRequest:v13];

    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v15 resolvingAgainstBaseURL:1];
    [v16 setScheme:@"home-sharing"];
    long long v17 = [v16 URL];
    [(VUIHomeSharingMediaItem_iOS *)self setMediaItemURLInternal:v17];
  }
  return [(VUIHomeSharingMediaItem_iOS *)self mediaItemURLInternal];
}

- (BOOL)hasTrait:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x1E4FAA1B8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4FAA1C0]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4FAA1A8]] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VUIHomeSharingMediaItem_iOS;
    BOOL v5 = [(VUILibraryMediaItem_iOS *)&v7 hasTrait:v4];
  }

  return v5;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9F78]])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
    uint64_t v6 = [(VUIHomeSharingMediaItem_iOS *)self keyBagFilePath];
    objc_super v7 = (void *)[v5 initFileURLWithPath:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VUIHomeSharingMediaItem_iOS;
    objc_super v7 = [(VUILibraryMediaItem_iOS *)&v9 mediaItemMetadataForProperty:v4];
  }

  return v7;
}

- (void)prepareForLoadingWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke;
  v7[3] = &unk_1E6DF68E0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)VUIHomeSharingMediaItem_iOS;
  id v5 = v4;
  [(VUILibraryMediaItem_iOS *)&v6 prepareForLoadingWithCompletion:v7];
}

- (void)cleanUpMediaItem
{
  [(VUIHomeSharingMediaItem_iOS *)self setLoadingContext:[(VUIHomeSharingMediaItem_iOS *)self loadingContext] + 1];
  [(VUIHomeSharingMediaItem_iOS *)self setMediaItemURLInternal:0];
  v3.receiver = self;
  v3.super_class = (Class)VUIHomeSharingMediaItem_iOS;
  [(VUILibraryMediaItem_iOS *)&v3 cleanUpMediaItem];
}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  objc_msgSend(MEMORY[0x1E4F1CA48], "array", a6, a3, a4, a5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [MEMORY[0x1E4F1CA48] array];
  if (a3 > 0.0)
  {
    [v11 addObject:MEMORY[0x1E4F1CC38]];
    [v8 addObject:*MEMORY[0x1E4F79670]];
  }
  objc_super v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3 * 1000.0];
  [v11 addObject:v9];

  [v8 addObject:*MEMORY[0x1E4F79490]];
  uint64_t v10 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  [v10 setValues:v11 forProperties:v8 async:1 withCompletionBlock:0];
}

- (void)updatePlayCountForElapsedTime:(double)a3 duration:(double)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FA9D90] playedThresholdTimeForDuration:a4];
  if (v6 <= a3)
  {
    objc_super v7 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    uint64_t v8 = *MEMORY[0x1E4F797C8];
    objc_super v9 = [v7 valueForProperty:*MEMORY[0x1E4F797C8]];
    uint64_t v10 = [v9 unsignedIntegerValue];

    id v11 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    int v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10 + 1];
    v16[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v15 = v8;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v11 setValues:v13 forProperties:v14 async:1 withCompletionBlock:0];
  }
}

- (BOOL)shouldRetryPlaybackForError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  if (![v5 isEqualToString:@"TVPlaybackErrorDomain"])
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v4 code];

  if (v6 != 811)
  {
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  objc_super v7 = sLogObject_11;
  if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Will retry playback and perform keybag sync", v10, 2u);
  }
  BOOL v8 = 1;
  [(VUIHomeSharingMediaItem_iOS *)self setNeedsKeyBagSyncPriorToPlayback:1];
LABEL_8:

  return v8;
}

- (void)_fetchKeybagForDSID:(id)a3 isFamilyAccount:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = sLogObject_11;
  if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (v6) {
      id v11 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v29 = v11;
    _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Starting keybag fetch.  Is family account? %@", buf, 0xCu);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke;
  aBlock[3] = &unk_1E6DF3DD0;
  id v12 = v9;
  id v27 = v12;
  id v13 = (void (**)(void))_Block_copy(aBlock);
  v14 = [(VUIHomeSharingMediaItem_iOS *)self homeSharingLibrary];
  uint64_t v15 = [v14 deviceGUID];

  if (![v15 length])
  {
    if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR)) {
      -[VUIHomeSharingMediaItem_iOS _fetchKeybagForDSID:isFamilyAccount:completion:]();
    }
    goto LABEL_12;
  }
  uint64_t v16 = [v8 unsignedLongLongValue];
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR)) {
      -[VUIHomeSharingMediaItem_iOS _fetchKeybagForDSID:isFamilyAccount:completion:]();
    }
LABEL_12:
    v13[2](v13);
    goto LABEL_13;
  }
  long long v17 = [MEMORY[0x1E4F6A368] requestWithDSID:v16 deviceGUID:v15];
  long long v18 = [(VUIHomeSharingMediaItem_iOS *)self keyBagFilePath];
  v19 = [(VUIHomeSharingMediaItem_iOS *)self homeSharingLibrary];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2;
  v21[3] = &unk_1E6DF8CD0;
  id v22 = v18;
  id v23 = v8;
  BOOL v25 = v6;
  v24 = v13;
  id v20 = v18;
  [v19 sendRequest:v17 withResponseHandler:v21];

LABEL_13:
}

- (BOOL)_loadingCancelled:(unint64_t)a3
{
  return [(VUIHomeSharingMediaItem_iOS *)self loadingContext] != a3;
}

- (HSHomeSharingLibrary)homeSharingLibrary
{
  return self->_homeSharingLibrary;
}

- (void)setHomeSharingLibrary:(id)a3
{
}

- (NSURL)mediaItemURLInternal
{
  return self->_mediaItemURLInternal;
}

- (void)setMediaItemURLInternal:(id)a3
{
}

- (NSString)keyBagFilePath
{
  return self->_keyBagFilePath;
}

- (void)setKeyBagFilePath:(id)a3
{
}

- (BOOL)needsKeyBagSyncPriorToPlayback
{
  return self->_needsKeyBagSyncPriorToPlayback;
}

- (void)setNeedsKeyBagSyncPriorToPlayback:(BOOL)a3
{
  self->_needsKeyBagSyncPriorToPlayback = a3;
}

- (unint64_t)loadingContext
{
  return self->_loadingContext;
}

- (void)setLoadingContext:(unint64_t)a3
{
  self->_loadingContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyBagFilePath, 0);
  objc_storeStrong((id *)&self->_mediaItemURLInternal, 0);
  objc_storeStrong((id *)&self->_homeSharingLibrary, 0);
}

- (void)_fetchKeybagForDSID:isFamilyAccount:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "No device GUID exists", v2, v3, v4, v5, v6);
}

- (void)_fetchKeybagForDSID:isFamilyAccount:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "DSID is 0", v2, v3, v4, v5, v6);
}

@end