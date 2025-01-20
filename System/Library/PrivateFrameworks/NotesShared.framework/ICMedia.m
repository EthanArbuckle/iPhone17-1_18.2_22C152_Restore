@interface ICMedia
+ (id)allMediaInContext:(id)a3;
+ (id)containerDirectoryURLForMediaWithIdentifier:(id)a3 account:(id)a4;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)exportableContainerDirectoryURLForMediaWithIdentifier:(id)a3 account:(id)a4;
+ (id)keyPathsForValuesAffectingIsSharedViaICloud;
+ (id)keyPathsForValuesAffectingParentCloudObject;
+ (id)mediaIdentifiersForAccount:(id)a3;
+ (id)mediaWithIdentifier:(id)a3 context:(id)a4;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newMediaWithAttachment:(id)a3;
+ (id)newMediaWithAttachment:(id)a3 forData:(id)a4 filename:(id)a5 error:(id *)a6;
+ (id)newMediaWithAttachment:(id)a3 forFileWrapper:(id)a4 error:(id *)a5;
+ (id)newMediaWithAttachment:(id)a3 forURL:(id)a4 error:(id *)a5;
+ (id)newMediaWithIdentifier:(id)a3 account:(id)a4;
+ (id)newMediaWithIdentifier:(id)a3 attachment:(id)a4;
+ (void)deleteMedia:(id)a3;
+ (void)enumerateMediaInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6;
+ (void)purgeMedia:(id)a3;
+ (void)purgeMediaFilesForIdentifiers:(id)a3 account:(id)a4;
+ (void)undeleteMedia:(id)a3;
- (BOOL)hasAllMandatoryFields;
- (BOOL)hasFile;
- (BOOL)isArchivedDirectory;
- (BOOL)isInICloudAccount;
- (BOOL)isValid;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (BOOL)needsToBePushedToCloud;
- (BOOL)shouldSyncMinimumSupportedNotesVersion;
- (BOOL)supportsDeletionByTTL;
- (BOOL)supportsEncryptedValuesDictionary;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (BOOL)writeDataFromAsset:(id)a3 accountID:(id)a4 isArchivedDirectory:(BOOL)a5 error:(id *)a6;
- (BOOL)writeDataFromFileURL:(id)a3 error:(id *)a4;
- (BOOL)writeDataFromFileWrapper:(id)a3 error:(id *)a4;
- (BOOL)writeDataWithBlock:(id)a3 error:(id *)a4;
- (ICAccount)containerAccount;
- (ICAccount)placeholderAccount;
- (ICAssetGenerationManager)generationManager;
- (NSSet)urlsToConsiderForCloudBackup;
- (NSString)filename;
- (NSString)recordType;
- (id)cloudAccount;
- (id)containerDirectoryURL;
- (id)cryptoStrategyProtocol;
- (id)data;
- (id)dataWithoutImageMarkupMetadata:(BOOL)a3;
- (id)decryptedData;
- (id)encryptedMediaFallbackURL;
- (id)encryptedMediaURL;
- (id)exportableContainerDirectoryURL;
- (id)exportableMediaURL;
- (id)ic_loggingValues;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)mediaArchiveFallbackURL;
- (id)mediaArchiveURL;
- (id)mediaFallbackURL;
- (id)mediaTarArchiveURL;
- (id)mediaURL;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)parentCloudObject;
- (id)parentEncryptableObject;
- (id)prepareExportableMediaURL;
- (id)recordZoneName;
- (void)accountWillChangeToAccount:(id)a3;
- (void)applyRandomCryptoGooIfNeeded;
- (void)awakeFromFetch;
- (void)containerAccount;
- (void)deleteExportableMedia;
- (void)deleteFromLocalDatabase;
- (void)fixBrokenReferences;
- (void)hasFile;
- (void)markForDeletion;
- (void)objectWasPushedToCloudWithOperation:(id)a3 serverRecord:(id)a4;
- (void)prepareExportableMediaURL;
- (void)prepareForDeletion;
- (void)setAttachment:(id)a3;
- (void)setFilename:(id)a3;
- (void)setPlaceholderAccount:(id)a3;
- (void)unmarkForDeletion;
- (void)updateFlagToExcludeFromCloudBackup;
- (void)writeDataFromItemProvider:(id)a3 checkForMarkupData:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation ICMedia

- (id)containerDirectoryURL
{
  uint64_t v3 = [(ICMedia *)self identifier];
  if (v3
    && (v4 = (void *)v3,
        [(ICMedia *)self containerAccount],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [(ICMedia *)self identifier];
    v7 = [(ICMedia *)self containerAccount];
    v8 = +[ICMedia containerDirectoryURLForMediaWithIdentifier:v6 account:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (ICAccount)containerAccount
{
  uint64_t v3 = [(ICMedia *)self attachment];
  v4 = [v3 note];
  v5 = [v4 account];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(ICMedia *)self attachment];
    v9 = [v8 note];
    v10 = [v9 folder];
    id v7 = [v10 account];
  }
  if (!v7)
  {
    id v7 = [(ICMedia *)self placeholderAccount];
    if (!v7)
    {
      v11 = [(ICMedia *)self managedObjectContext];
      id v7 = +[ICAccount defaultAccountInContext:v11];

      v12 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        [(ICMedia *)self containerAccount];
      }
    }
  }
  [(ICMedia *)self setPlaceholderAccount:v7];
  return (ICAccount *)v7;
}

- (void)setPlaceholderAccount:(id)a3
{
}

+ (id)containerDirectoryURLForMediaWithIdentifier:(id)a3 account:(id)a4
{
  id v5 = a3;
  v6 = [a4 mediaDirectoryURL];
  id v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:1];

  return v7;
}

- (BOOL)hasFile
{
  if ([(ICMedia *)self isPasswordProtected])
  {
    uint64_t v3 = [(ICMedia *)self encryptedMediaURL];
    v4 = v3;
    uint64_t v12 = 0;
    id v5 = (id *)&v12;
    v6 = &v12;
  }
  else
  {
    uint64_t v3 = [(ICMedia *)self mediaURL];
    v4 = v3;
    uint64_t v11 = 0;
    id v5 = (id *)&v11;
    v6 = &v11;
  }
  char v7 = objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", v6, v11, v12);
  id v8 = *v5;

  if (v8 && [v8 code] != 260)
  {
    v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICMedia hasFile]();
    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationManager, 0);
  objc_destroyWeak((id *)&self->placeholderAccount);
}

- (id)mediaURL
{
  uint64_t v3 = [(ICMedia *)self filename];

  if (v3)
  {
    v4 = [(ICMedia *)self generationManager];
    id v5 = [v4 generationURL];

    if (v5)
    {
      v6 = [(ICMedia *)self generationManager];
      char v7 = [v6 generationURL];
      id v8 = [(ICMedia *)self filename];
      v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:0];
    }
    else
    {
      v9 = [(ICMedia *)self mediaFallbackURL];
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)mediaFallbackURL
{
  uint64_t v3 = [(ICMedia *)self filename];

  if (v3)
  {
    v4 = [(ICMedia *)self containerDirectoryURL];
    id v5 = [(ICMedia *)self filename];
    v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:0];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)filename
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"filename"];
}

- (ICAssetGenerationManager)generationManager
{
  uint64_t v3 = [(ICMedia *)self containerDirectoryURL];

  if (v3)
  {
    generationManager = self->_generationManager;
    if (!generationManager)
    {
      id v5 = [MEMORY[0x1E4F1CA48] array];
      v6 = [(ICMedia *)self mediaFallbackURL];
      objc_msgSend(v5, "ic_addNonNilObject:", v6);

      char v7 = [(ICMedia *)self encryptedMediaFallbackURL];
      objc_msgSend(v5, "ic_addNonNilObject:", v7);

      id v8 = [(ICMedia *)self mediaArchiveFallbackURL];
      objc_msgSend(v5, "ic_addNonNilObject:", v8);

      v9 = NSStringFromSelector(sel_generation);
      v10 = [ICAssetGenerationManager alloc];
      uint64_t v11 = [(ICMedia *)self containerDirectoryURL];
      uint64_t v12 = [(ICAssetGenerationManager *)v10 initWithObject:self generationKeyPath:v9 containerURL:v11];
      v13 = self->_generationManager;
      self->_generationManager = v12;

      v14 = (void *)[v5 copy];
      [(ICAssetGenerationManager *)self->_generationManager setFallbackURLs:v14];

      generationManager = self->_generationManager;
    }
    v15 = generationManager;
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)mediaArchiveFallbackURL
{
  v2 = [(ICMedia *)self mediaFallbackURL];
  uint64_t v3 = [v2 URLByAppendingPathExtension:@"zip"];

  return v3;
}

- (id)encryptedMediaFallbackURL
{
  uint64_t v3 = [(ICMedia *)self containerDirectoryURL];
  v4 = [(ICMedia *)self identifier];
  id v5 = [v3 URLByAppendingPathComponent:v4 isDirectory:0];

  return v5;
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)ICMedia;
  [(ICCloudSyncingObject *)&v3 awakeFromFetch];
  [(ICAssetGenerationManager *)self->_generationManager updateCurrentGeneration];
}

+ (void)purgeMediaFilesForIdentifiers:(id)a3 account:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 mediaDirectoryURL];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v20 = v6;
    id v12 = 0;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        v15 = v12;
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1C877DB80]();
        v18 = [v8 URLByAppendingPathComponent:v16 isDirectory:1];
        id v21 = v12;
        [v7 removeItemAtURL:v18 error:&v21];
        id v12 = v21;

        if (v12 && [v12 code] != 4)
        {
          v19 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v18;
            __int16 v28 = 2112;
            id v29 = v12;
            _os_log_error_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_ERROR, "failed to remove media directory at URL: %@, error: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v11);

    id v6 = v20;
  }
}

- (void)accountWillChangeToAccount:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [(ICMedia *)self containerDirectoryURL];
  id v7 = [(ICMedia *)self identifier];
  if (!v7)
  {
    uint64_t v10 = 0;
LABEL_16:
    if (!v4) {
      goto LABEL_18;
    }
LABEL_17:
    [(ICMedia *)self setPlaceholderAccount:v4];
    goto LABEL_18;
  }
  id v8 = objc_opt_class();
  id v9 = [(ICMedia *)self identifier];
  uint64_t v10 = [v8 containerDirectoryURLForMediaWithIdentifier:v9 account:v4];

  id v7 = 0;
  if (!v6 || !v10) {
    goto LABEL_16;
  }
  if (([v6 isEqual:v10] & 1) != 0
    || ([v6 path],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v5 fileExistsAtPath:v11],
        v11,
        !v12))
  {
    id v7 = 0;
    if (!v4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v13 = [v10 URLByDeletingLastPathComponent];
  id v18 = 0;
  [v5 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v18];
  id v14 = v18;

  if (v14)
  {
    v15 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ICMedia accountWillChangeToAccount:]();
    }
  }
  id v17 = v14;
  [v5 moveItemAtURL:v6 toURL:v10 error:&v17];
  id v7 = v17;

  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v16 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[ICMedia accountWillChangeToAccount:]();
  }

  if (v4) {
    goto LABEL_17;
  }
LABEL_18:
}

- (void)prepareForDeletion
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error removing media file directory: %@", v2, v3, v4, v5, v6);
}

- (void)setAttachment:(id)a3
{
  id v4 = a3;
  [(ICMedia *)self willChangeValueForKey:@"attachment"];
  [(ICMedia *)self setPrimitiveValue:v4 forKey:@"attachment"];
  [(ICMedia *)self didChangeValueForKey:@"attachment"];
  [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  uint64_t v5 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICMedia setAttachment:](v4, self);
  }
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

- (BOOL)isValid
{
  if (([(ICMedia *)self needsInitialFetchFromCloud] & 1) != 0
    || ([(ICMedia *)self needsToBeFetchedFromCloud] & 1) != 0)
  {
    return 0;
  }
  return [(ICMedia *)self hasFile];
}

- (BOOL)isArchivedDirectory
{
  if ([(ICMedia *)self hasFile])
  {
    if ([(ICMedia *)self isPasswordProtected]) {
      [(ICMedia *)self encryptedMediaURL];
    }
    else {
    id v4 = [(ICMedia *)self mediaURL];
    }
    uint64_t v16 = 0;
    uint64_t v11 = *MEMORY[0x1E4F1C628];
    id v15 = 0;
    [v4 getResourceValue:&v16 forKey:v11 error:&v15];
    int v12 = v16;
    id v13 = v15;
    char v10 = [v12 BOOLValue];

LABEL_12:
    return v10;
  }
  uint64_t v3 = [(ICMedia *)self attachment];

  if (v3)
  {
    id v4 = [(ICMedia *)self attachment];
    uint64_t v5 = [v4 typeUTI];
    if (v5)
    {
      uint8_t v6 = (void *)MEMORY[0x1E4F442D8];
      id v7 = [(ICMedia *)self attachment];
      id v8 = [v7 typeUTI];
      id v9 = [v6 typeWithIdentifier:v8];
      char v10 = [v9 conformsToType:*MEMORY[0x1E4F44390]];
    }
    else
    {
      char v10 = 0;
    }

    goto LABEL_12;
  }
  return 0;
}

- (NSSet)urlsToConsiderForCloudBackup
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICMedia *)self mediaURL];
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [(ICMedia *)self encryptedMediaURL];
  if (v5) {
    [v3 addObject:v5];
  }
  uint8_t v6 = [(ICMedia *)self mediaArchiveURL];
  if (v6) {
    [v3 addObject:v6];
  }
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = (void *)[v3 copy];
  id v9 = [v7 setWithArray:v8];

  return (NSSet *)v9;
}

- (void)updateFlagToExcludeFromCloudBackup
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICMedia *)self urlsToConsiderForCloudBackup];
  id v4 = [(ICMedia *)self attachment];
  uint64_t v5 = [v4 note];
  uint8_t v6 = [v5 account];
  int v7 = [v6 shouldExcludeFilesFromCloudBackup];

  if (v7)
  {
    if ([(ICMedia *)self needsToBePushedToCloud]) {
      BOOL v8 = [(ICCloudSyncingObject *)self shouldBeIgnoredForSync];
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "ic_updateFlagToExcludeFromBackup:", v8, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)writeDataFromFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__ICMedia_writeDataFromFileURL_error___block_invoke;
  v9[3] = &unk_1E64A5F40;
  id v10 = v6;
  uint64_t v11 = self;
  id v7 = v6;
  LOBYTE(a4) = [(ICMedia *)self writeDataWithBlock:v9 error:a4];

  return (char)a4;
}

uint64_t __38__ICMedia_writeDataFromFileURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v38 = 0;
  uint64_t v7 = *MEMORY[0x1E4F1C628];
  id v37 = 0;
  int v8 = [v6 getResourceValue:&v38 forKey:v7 error:&v37];
  id v9 = v38;
  id v10 = v37;
  if (v8) {
    int v11 = [v9 BOOLValue];
  }
  else {
    int v11 = 0;
  }
  uint64_t v12 = [*(id *)(a1 + 40) mediaArchiveURL];
  if (v11)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F836F0]);
    long long v14 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
    long long v15 = (void *)[v13 initWithDestinationURL:v12 baseURL:v14];

    [v15 setUsesCompression:0];
    v45[0] = *(void *)(a1 + 32);
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    id v36 = v10;
    [v15 writeURLs:v16 error:&v36];
    id v17 = v36;

    if (v17)
    {
      id v18 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v40 = v19;
        __int16 v41 = 2112;
        v42 = v12;
        __int16 v43 = 2112;
        id v44 = v17;
        _os_log_error_impl(&dword_1C3A61000, v18, OS_LOG_TYPE_ERROR, "Failed to write file %@ to archive %@, error %@", buf, 0x20u);
      }
LABEL_11:

      uint64_t v21 = 0;
      id v10 = v17;
      goto LABEL_18;
    }
    id v35 = 0;
    [v15 finish:&v35];
    id v20 = v35;
    if (v20)
    {
      id v17 = v20;
      id v18 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __38__ICMedia_writeDataFromFileURL_error___block_invoke_cold_2();
      }
      goto LABEL_11;
    }

    id v10 = 0;
  }
  long long v15 = [v5 URLByAppendingPathExtension:@"tempMedia"];
  long long v22 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v23 = [v22 copyItemAtURL:*(void *)(a1 + 32) toURL:v15 error:a3];

  if (v23)
  {
    long long v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v21 = [v24 moveItemAtURL:v15 toURL:v5 error:a3];

    long long v25 = [*(id *)(a1 + 40) managedObjectContext];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __38__ICMedia_writeDataFromFileURL_error___block_invoke_22;
    v34[3] = &unk_1E64A4240;
    v34[4] = *(void *)(a1 + 40);
    [v25 performBlockAndWait:v34];
  }
  else
  {
    v26 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __38__ICMedia_writeDataFromFileURL_error___block_invoke_cold_1(a3, v26, v27, v28, v29, v30, v31, v32);
    }

    uint64_t v21 = 0;
  }
LABEL_18:

  return v21;
}

void __38__ICMedia_writeDataFromFileURL_error___block_invoke_22(uint64_t a1)
{
  [*(id *)(a1 + 32) updateChangeCountWithReason:@"Wrote media data"];
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  [(id)v2 updateChangeCountWithReason:@"Wrote media data"];

  uint64_t v3 = [*(id *)(a1 + 32) attachment];
  LOBYTE(v2) = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) attachment];
    [v4 setCachedImage:0];
  }
}

- (BOOL)writeDataFromAsset:(id)a3 accountID:(id)a4 isArchivedDirectory:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(ICMedia *)self managedObjectContext];
  id v13 = +[ICAccount cloudKitAccountWithIdentifier:v11 context:v12];

  [(ICMedia *)self setPlaceholderAccount:v13];
  long long v14 = [(ICMedia *)self generationManager];
  LODWORD(v11) = [v14 beginGeneration];

  if (v11)
  {
    if (v7) {
      [(ICMedia *)self mediaArchiveURL];
    }
    else {
    long long v16 = [(ICMedia *)self mediaURL];
    }
    if ([(ICMedia *)self isPasswordProtected])
    {
      uint64_t v17 = [(ICMedia *)self encryptedMediaURL];

      long long v16 = (void *)v17;
    }
    if (!v16)
    {
      uint64_t v28 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[ICMedia writeDataFromAsset:accountID:isArchivedDirectory:error:](self, v28);
      }

      id v20 = [(ICMedia *)self generationManager];
      [v20 rollbackGeneration];
      goto LABEL_29;
    }
    id v18 = [v10 fileURL];
    char v19 = [v16 isEqual:v18];

    if (v19)
    {
      id v20 = 0;
      goto LABEL_11;
    }
    v47 = a6;
    uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v30 = [v10 fileURL];
    id v54 = 0;
    char v31 = [v29 moveItemAtURL:v30 toURL:v16 error:&v54];
    id v20 = v54;

    if (v31)
    {
      int v21 = 1;
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F28CB8] defaultManager];
      v33 = [v10 fileURL];
      id v53 = v20;
      char v34 = [v32 linkItemAtURL:v33 toURL:v16 error:&v53];
      id v35 = v53;

      if ((v34 & 1) == 0)
      {
        __int16 v41 = v35;
        v42 = os_log_create("com.apple.notes", "Media");
        a6 = v47;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          -[ICMedia writeDataFromAsset:accountID:isArchivedDirectory:error:]();
        }

        __int16 v43 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v44 = [v10 fileURL];
        id v52 = v41;
        char v46 = [v43 copyItemAtURL:v44 toURL:v16 error:&v52];
        id v20 = v52;

        if (v46)
        {
LABEL_11:
          int v21 = 1;
          if (v7) {
            goto LABEL_12;
          }
LABEL_22:
          id v36 = [(ICMedia *)self managedObjectContext];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __66__ICMedia_writeDataFromAsset_accountID_isArchivedDirectory_error___block_invoke_2;
          v48[3] = &unk_1E64A4240;
          v48[4] = self;
          [v36 performBlockAndWait:v48];

          if (!v20) {
LABEL_23:
          }
            id v37 = (id)[(ICMedia *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICMediaDidLoadNotification"];
LABEL_24:
          if (a6) {
            *a6 = v20;
          }
          id v38 = [(ICMedia *)self generationManager];
          v39 = v38;
          if (v21)
          {
            char v15 = [v38 commitGeneration];

LABEL_30:
            goto LABEL_31;
          }
          [v38 rollbackGeneration];

LABEL_29:
          char v15 = 0;
          goto LABEL_30;
        }
        v45 = os_log_create("com.apple.notes", "Media");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[ICMedia writeDataFromAsset:accountID:isArchivedDirectory:error:]();
        }

        int v21 = 0;
        if (!v7) {
          goto LABEL_22;
        }
LABEL_12:
        id v22 = objc_alloc(MEMORY[0x1E4F836E8]);
        char v23 = [v16 URLByDeletingLastPathComponent];
        long long v24 = (void *)[v22 initWithSourceURL:v16 destinationURL:v23];

        id v50 = v20;
        id v51 = 0;
        [v24 unarchiveResultURLs:&v51 error:&v50];
        id v25 = v51;
        id v26 = v50;

        uint64_t v27 = [(ICMedia *)self managedObjectContext];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __66__ICMedia_writeDataFromAsset_accountID_isArchivedDirectory_error___block_invoke;
        v49[3] = &unk_1E64A4240;
        v49[4] = self;
        [v27 performBlockAndWait:v49];

        id v20 = v26;
        if (!v26) {
          goto LABEL_23;
        }
        goto LABEL_24;
      }
      int v21 = 1;
      id v20 = v35;
    }
    a6 = v47;
    if (!v7) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  char v15 = 0;
LABEL_31:

  return v15;
}

void __66__ICMedia_writeDataFromAsset_accountID_isArchivedDirectory_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFlagToExcludeFromCloudBackup];
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) attachment];
    [v4 setCachedImage:0];
  }
}

void __66__ICMedia_writeDataFromAsset_accountID_isArchivedDirectory_error___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFlagToExcludeFromCloudBackup];
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) attachment];
    [v4 setCachedImage:0];
  }
}

- (void)writeDataFromItemProvider:(id)a3 checkForMarkupData:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke;
  aBlock[3] = &unk_1E64A5F68;
  aBlock[4] = self;
  id v10 = v9;
  id v35 = v10;
  id v11 = _Block_copy(aBlock);
  uint64_t v12 = (void *)*MEMORY[0x1E4F444F8];
  id v13 = [(id)*MEMORY[0x1E4F444F8] identifier];
  int v14 = [v8 hasItemConformingToTypeIdentifier:v13];

  if (v14)
  {
    char v15 = [v12 identifier];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_2;
    v30[3] = &unk_1E64A5FB8;
    long long v16 = &v31;
    v30[4] = self;
    id v31 = v10;
    BOOL v33 = a4;
    uint64_t v17 = &v32;
    id v32 = v11;
    id v18 = v30;
LABEL_5:
    objc_msgSend(v8, "loadItemForTypeIdentifier:options:completionHandler:", v15, 0, v18, v22, v23, v24, v25, v26);

    goto LABEL_6;
  }
  char v19 = (void *)*MEMORY[0x1E4F44378];
  id v20 = [(id)*MEMORY[0x1E4F44378] identifier];
  int v21 = [v8 hasItemConformingToTypeIdentifier:v20];

  if (v21)
  {
    char v15 = [v19 identifier];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    long long v24 = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_4;
    id v25 = &unk_1E64A5FB8;
    long long v16 = &v27;
    id v26 = self;
    id v27 = v10;
    BOOL v29 = a4;
    uint64_t v17 = &v28;
    id v28 = v11;
    id v18 = &v22;
    goto LABEL_5;
  }
LABEL_6:
}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!v7)
  {
    char v3 = [*(id *)(a1 + 32) attachment];
    id v4 = [v3 attachmentModel];
    [v4 updateFileBasedAttributes];

    [*(id *)(a1 + 32) updateChangeCountWithReason:@"Wrote media data"];
    id v5 = [*(id *)(a1 + 32) attachment];
    [v5 attachmentDidChange];

    id v6 = [*(id *)(a1 + 32) attachment];
    [v6 setPreviewUpdateDate:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_class();
  id v7 = ICDynamicCast();

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v7)
  {
    [v7 startAccessingSecurityScopedResource];
    id v8 = [*(id *)(a1 + 32) managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_3;
    v9[3] = &unk_1E64A5F90;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    char v12 = *(unsigned char *)(a1 + 56);
    id v11 = *(id *)(a1 + 48);
    [v8 performBlockAndWait:v9];
  }
}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  int v4 = [v2 writeDataFromFileURL:v3 error:&v9];
  id v5 = v9;
  if (v4 && *(unsigned char *)(a1 + 56))
  {
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:*(void *)(a1 + 40)];
    BOOL v7 = +[ICMarkupUtilities hasPrivateImageMetadata:v6];
    id v8 = [*(id *)(a1 + 32) attachment];
    [v8 setHasMarkupData:v7];
  }
  [*(id *)(a1 + 40) stopAccessingSecurityScopedResource];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_class();
  BOOL v7 = ICDynamicCast();

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v7)
  {
    id v8 = [*(id *)(a1 + 32) managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_5;
    v9[3] = &unk_1E64A5F90;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    char v12 = *(unsigned char *)(a1 + 56);
    id v11 = *(id *)(a1 + 48);
    [v8 performBlockAndWait:v9];
  }
}

void __72__ICMedia_writeDataFromItemProvider_checkForMarkupData_completionBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  int v4 = [v2 writeData:v3 error:&v8];
  id v5 = v8;
  if (v4 && *(unsigned char *)(a1 + 56))
  {
    BOOL v6 = +[ICMarkupUtilities hasPrivateImageMetadata:*(void *)(a1 + 40)];
    BOOL v7 = [*(id *)(a1 + 32) attachment];
    [v7 setHasMarkupData:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)data
{
  if ([(ICMedia *)self isArchivedDirectory])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9B8];
    int v4 = [(ICMedia *)self mediaArchiveURL];
    id v5 = [v3 dataWithContentsOfURL:v4];

    if (v5) {
      goto LABEL_8;
    }
    BOOL v6 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v7 = [(ICMedia *)self mediaTarArchiveURL];
  }
  else
  {
    if ([(ICMedia *)self isPasswordProtected])
    {
      id v5 = [(ICMedia *)self decryptedData];
      goto LABEL_8;
    }
    BOOL v6 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v7 = [(ICMedia *)self mediaURL];
  }
  id v8 = (void *)v7;
  id v5 = [v6 dataWithContentsOfURL:v7];

LABEL_8:
  return v5;
}

- (id)dataWithoutImageMarkupMetadata:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICMedia *)self data];
  if (v3)
  {
    BOOL v6 = [(ICMedia *)self attachment];
    int v7 = [v6 hasMarkupData];

    if (v7)
    {
      uint64_t v8 = +[ICMarkupUtilities cleanImageMetadataFromData:v5];

      id v5 = (void *)v8;
    }
  }
  return v5;
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __27__ICMedia_writeData_error___block_invoke;
  v9[3] = &unk_1E64A5F40;
  void v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [(ICMedia *)self writeDataWithBlock:v9 error:a4];

  return (char)a4;
}

uint64_t __27__ICMedia_writeData_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) mediaArchiveURL];
  int v7 = [*(id *)(a1 + 32) isArchivedDirectory];
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v5;
  }
  id v9 = v8;
  if (!v9)
  {
    int v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __27__ICMedia_writeData_error___block_invoke_cold_1(v14);
    }
    goto LABEL_12;
  }
  if (([*(id *)(a1 + 40) writeToURL:v9 options:1 error:a3] & 1) == 0)
  {
    int v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __27__ICMedia_writeData_error___block_invoke_cold_2(a3, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_12:

    uint64_t v13 = 0;
    goto LABEL_15;
  }
  if (v7)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F836E8]);
    id v11 = [v5 URLByDeletingLastPathComponent];
    char v12 = (void *)[v10 initWithSourceURL:v6 destinationURL:v11];

    uint64_t v24 = 0;
    uint64_t v13 = [v12 unarchiveResultURLs:&v24 error:a3];
  }
  else
  {
    uint64_t v13 = 1;
  }
  int v21 = [*(id *)(a1 + 32) managedObjectContext];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __27__ICMedia_writeData_error___block_invoke_37;
  v23[3] = &unk_1E64A4240;
  v23[4] = *(void *)(a1 + 32);
  [v21 performBlockAndWait:v23];

LABEL_15:
  return v13;
}

void __27__ICMedia_writeData_error___block_invoke_37(uint64_t a1)
{
  [*(id *)(a1 + 32) updateChangeCountWithReason:@"Wrote media data"];
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  [(id)v2 updateChangeCountWithReason:@"Wrote media data"];

  BOOL v3 = [*(id *)(a1 + 32) attachment];
  LOBYTE(v2) = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) attachment];
    [v4 setCachedImage:0];
  }
}

- (BOOL)writeDataFromFileWrapper:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ICMedia_writeDataFromFileWrapper_error___block_invoke;
  v9[3] = &unk_1E64A5F40;
  id v10 = v6;
  id v11 = self;
  id v7 = v6;
  LOBYTE(a4) = [(ICMedia *)self writeDataWithBlock:v9 error:a4];

  return (char)a4;
}

uint64_t __42__ICMedia_writeDataFromFileWrapper_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = [*(id *)(a1 + 32) isDirectory];
  id v7 = [*(id *)(a1 + 40) mediaArchiveURL];
  if (v6)
  {
    uint64_t v45 = 0;
    if (a3) {
      uint64_t v8 = (uint64_t *)a3;
    }
    else {
      uint64_t v8 = &v45;
    }
    id v9 = NSTemporaryDirectory();
    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [v10 UUIDString];
    char v12 = [v9 stringByAppendingPathComponent:v11];

    uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
    int v14 = [v5 lastPathComponent];
    uint64_t v15 = [v13 URLByAppendingPathComponent:v14 isDirectory:0];

    uint64_t v16 = [v15 URLByAppendingPathExtension:@"zip"];
    uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v17 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:v8];

    if (*v8)
    {
      uint64_t v18 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_7();
      }
      goto LABEL_23;
    }
    [*(id *)(a1 + 32) writeToURL:v15 options:1 originalContentsURL:0 error:v8];
    if (*v8)
    {
      uint64_t v18 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_6();
      }
      goto LABEL_23;
    }
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F836F0]) initWithDestinationURL:v16 baseURL:v13];
    [v18 setUsesCompression:0];
    v52[0] = v15;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    [v18 writeURLs:v28 error:v8];

    if (*v8)
    {
      BOOL v29 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *v8;
        *(_DWORD *)buf = 138412802;
        v47 = v15;
        __int16 v48 = 2112;
        v49 = v16;
        __int16 v50 = 2112;
        uint64_t v51 = v30;
        _os_log_error_impl(&dword_1C3A61000, v29, OS_LOG_TYPE_ERROR, "Failed to write file %@ to archive %@, error %@", buf, 0x20u);
      }
      goto LABEL_22;
    }
    [v18 finish:v8];
    if (*v8)
    {
      BOOL v29 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_5();
      }
      goto LABEL_22;
    }
    id v32 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v40 = [v32 moveItemAtURL:v15 toURL:v5 error:v8];

    if ((v40 & 1) != 0
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          BOOL v33 = objc_claimAutoreleasedReturnValue(),
          char v41 = [v33 copyItemAtURL:v15 toURL:v5 error:v8],
          v33,
          (v41 & 1) != 0))
    {
      char v34 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v42 = [v34 moveItemAtURL:v16 toURL:v7 error:v8];

      if (v42)
      {
LABEL_34:
        id v38 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v38 removeItemAtURL:v13 error:v8];

        if (*v8)
        {
          v39 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_1();
          }

          uint64_t *v8 = 0;
        }

        goto LABEL_9;
      }
      id v35 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v43 = [v35 copyItemAtURL:v16 toURL:v7 error:v8];

      if (v43)
      {
        id v36 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v36 removeItemAtURL:v16 error:v8];

        if (*v8)
        {
          id v37 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_2();
          }

          uint64_t *v8 = 0;
        }
        goto LABEL_34;
      }
      BOOL v29 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
    }
    else
    {
      BOOL v29 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
LABEL_40:
      }
        __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_3();
    }
LABEL_22:

LABEL_23:
LABEL_24:
    uint64_t v20 = 0;
    goto LABEL_25;
  }
  if (([*(id *)(a1 + 32) writeToURL:v5 options:1 originalContentsURL:0 error:a3] & 1) == 0)
  {
    int v21 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_8(a3, v21, v22, v23, v24, v25, v26, v27);
    }

    goto LABEL_24;
  }
LABEL_9:
  uint64_t v19 = [*(id *)(a1 + 40) managedObjectContext];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_39;
  v44[3] = &unk_1E64A4240;
  v44[4] = *(void *)(a1 + 40);
  [v19 performBlockAndWait:v44];

  uint64_t v20 = 1;
LABEL_25:

  return v20;
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_39(uint64_t a1)
{
  [*(id *)(a1 + 32) updateChangeCountWithReason:@"Wrote media data"];
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  [(id)v2 updateChangeCountWithReason:@"Wrote media data"];

  BOOL v3 = [*(id *)(a1 + 32) attachment];
  LOBYTE(v2) = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) attachment];
    [v4 setCachedImage:0];
  }
}

- (BOOL)writeDataWithBlock:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v6 = (uint64_t (**)(id, void *, id *))a3;
  [(ICMedia *)self deleteExportableMedia];
  id v7 = [(ICMedia *)self generationManager];
  int v8 = [v7 beginGeneration];

  if (!v8)
  {
    BOOL v13 = 0;
    goto LABEL_11;
  }
  id v9 = [(ICMedia *)self mediaURL];
  id v10 = [(ICMedia *)self encryptedMediaURL];
  if (!v9 || [(ICMedia *)self isPasswordProtected] && !v10)
  {
    id v11 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ICMedia writeDataWithBlock:error:](self, v11);
    }

    id v12 = 0;
    goto LABEL_8;
  }
  uint64_t v15 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    *(_DWORD *)buf = 138412546;
    id v32 = v16;
    __int16 v33 = 2112;
    char v34 = v9;
    _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_INFO, "Writing media… {mediaID: %@, url: %@}", buf, 0x16u);
  }
  id v30 = 0;
  char v17 = v6[2](v6, v9, &v30);
  id v12 = v30;
  if (v17)
  {
    if (![(ICMedia *)self isPasswordProtected])
    {
      id v20 = v12;
      goto LABEL_28;
    }
    if (![(ICCloudSyncingObject *)self encryptFileFromURL:v9 toURL:v10])
    {
      uint64_t v27 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[ICMedia writeDataWithBlock:error:](self, v27);
      }

      id v28 = [(ICMedia *)self generationManager];
      [v28 rollbackGeneration];

      goto LABEL_8;
    }
    os_log_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v29 = v12;
    char v19 = [v18 removeItemAtURL:v9 error:&v29];
    id v20 = v29;

    if ((v19 & 1) == 0)
    {
      uint64_t v21 = [v20 code];

      if (v21 == 4)
      {
LABEL_28:
        uint64_t v24 = [(ICMedia *)self generationManager];
        int v25 = [v24 commitGeneration];

        if (v25)
        {
          [(ICMedia *)self updateFlagToExcludeFromCloudBackup];
          id v26 = (id)[(ICMedia *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICMediaDidLoadNotification"];
          BOOL v13 = 1;
        }
        else
        {
          BOOL v13 = 0;
        }
        id v12 = v20;
        goto LABEL_9;
      }
      os_log_t v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ICMedia writeDataWithBlock:error:](self, v18);
      }
    }
    goto LABEL_28;
  }
  uint64_t v22 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[ICMedia writeDataWithBlock:error:].cold.4(self, (uint64_t)v12, v22);
  }

  uint64_t v23 = [(ICMedia *)self generationManager];
  [v23 rollbackGeneration];

  if (a4)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a4 = v12;
    goto LABEL_9;
  }
LABEL_8:
  BOOL v13 = 0;
LABEL_9:

LABEL_11:
  return v13;
}

- (id)encryptedMediaURL
{
  BOOL v3 = [(ICMedia *)self identifier];

  if (v3)
  {
    id v4 = [(ICMedia *)self generationManager];
    id v5 = [v4 generationURL];

    if (v5)
    {
      int v6 = [(ICMedia *)self generationManager];
      id v7 = [v6 generationURL];
      int v8 = [(ICMedia *)self identifier];
      id v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:0];
    }
    else
    {
      id v9 = [(ICMedia *)self encryptedMediaFallbackURL];
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)mediaTarArchiveURL
{
  uint64_t v2 = [(ICMedia *)self mediaURL];
  BOOL v3 = [v2 URLByAppendingPathExtension:@"tar"];

  return v3;
}

- (id)mediaArchiveURL
{
  uint64_t v2 = [(ICMedia *)self mediaURL];
  BOOL v3 = [v2 URLByAppendingPathExtension:@"zip"];

  return v3;
}

+ (id)exportableContainerDirectoryURLForMediaWithIdentifier:(id)a3 account:(id)a4
{
  id v5 = a3;
  int v6 = [a4 exportableMediaDirectoryURL];
  id v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:1];

  return v7;
}

- (id)exportableContainerDirectoryURL
{
  uint64_t v3 = [(ICMedia *)self identifier];
  if (v3
    && (id v4 = (void *)v3,
        [(ICMedia *)self containerAccount],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    int v6 = [(ICMedia *)self identifier];
    id v7 = [(ICMedia *)self containerAccount];
    int v8 = +[ICMedia exportableContainerDirectoryURLForMediaWithIdentifier:v6 account:v7];
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (id)exportableMediaURL
{
  uint64_t v3 = [(ICMedia *)self filename];

  if (v3)
  {
    id v4 = [(ICMedia *)self exportableContainerDirectoryURL];
    id v5 = [(ICMedia *)self filename];
    int v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:0];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (id)prepareExportableMediaURL
{
  uint64_t v3 = [(ICMedia *)self attachment];
  int v4 = [v3 hasMarkupData];

  if (!v4)
  {
    id v5 = [(ICMedia *)self mediaURL];
    goto LABEL_28;
  }
  if ([(ICMedia *)self isPasswordProtected])
  {
    id v5 = 0;
    goto LABEL_28;
  }
  id v5 = [(ICMedia *)self exportableMediaURL];
  if ([v5 checkResourceIsReachableAndReturnError:0])
  {
    int v6 = [(ICMedia *)self mediaURL];
    id v32 = 0;
    uint64_t v7 = *MEMORY[0x1E4F1C530];
    id v31 = 0;
    int v8 = [v6 getResourceValue:&v32 forKey:v7 error:&v31];
    id v9 = v32;
    id v10 = v31;
    if (v8)
    {
      id v29 = 0;
      id v30 = 0;
      int v11 = [v5 getResourceValue:&v30 forKey:v7 error:&v29];
      id v12 = v30;
      id v13 = v29;

      if (v11)
      {
        BOOL v14 = [v9 compare:v12] > 0;
      }
      else
      {
        uint64_t v16 = os_log_create("com.apple.notes", "Media");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[ICMedia prepareExportableMediaURL]();
        }

        BOOL v14 = 1;
      }
    }
    else
    {
      uint64_t v15 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ICMedia prepareExportableMediaURL]();
      }

      id v12 = 0;
      BOOL v14 = 0;
      id v13 = v10;
    }
  }
  else
  {
    BOOL v14 = 1;
  }
  char v17 = [(ICMedia *)self exportableContainerDirectoryURL];
  if (v17 && v14)
  {
    os_log_t v18 = [(ICMedia *)self dataWithoutImageMarkupMetadata:1];
    char v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v28 = 0;
    int v20 = [v19 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v28];
    id v21 = v28;
    uint64_t v22 = v21;
    if (v20)
    {
      id v27 = v21;
      char v23 = [v18 writeToURL:v5 options:1 error:&v27];
      id v24 = v27;

      if (v23)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {

      id v24 = v22;
    }
    int v25 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[ICMedia prepareExportableMediaURL]();
    }

    id v5 = 0;
    goto LABEL_26;
  }
LABEL_27:

LABEL_28:
  return v5;
}

- (void)deleteExportableMedia
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Unable to remove exportable media file because %@", v2, v3, v4, v5, v6);
}

- (id)ic_loggingValues
{
  v12.receiver = self;
  v12.super_class = (Class)ICMedia;
  uint64_t v3 = [(ICCloudSyncingObject *)&v12 ic_loggingValues];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(ICMedia *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__ICMedia_ic_loggingValues__block_invoke;
  v10[3] = &unk_1E64A4218;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  [v5 performBlockAndWait:v10];

  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __27__ICMedia_ic_loggingValues__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) hasFile];
  if ((v2 & 1) == 0) {
    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasFile"];
  }
  uint64_t v3 = [*(id *)(a1 + 32) attachment];
  uint64_t v4 = [v3 identifier];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) attachment];
    id v6 = [v5 identifier];
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"attachment"];
  }
  if ([*(id *)(a1 + 32) isArchivedDirectory])
  {
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:@"isArchivedDirectory"];

    if ((v2 & 1) == 0) {
      return;
    }
    id v8 = [*(id *)(a1 + 32) mediaArchiveURL];
  }
  else
  {
    if ((v2 & 1) == 0) {
      return;
    }
    int v9 = [*(id *)(a1 + 32) isPasswordProtected];
    id v10 = *(void **)(a1 + 32);
    if (v9) {
      [v10 encryptedMediaURL];
    }
    else {
    id v8 = [v10 mediaURL];
    }
  }
  id v11 = v8;
  id v16 = 0;
  [v8 getResourceValue:&v16 forKey:*MEMORY[0x1E4F1C5F8] error:0];
  id v12 = v16;
  if (v12) {
    [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:@"fileSize"];
  }
  id v13 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v14 = [*(id *)(a1 + 32) filename];
  uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "hash"));
  [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:@"filename"];
}

- (void)markForDeletion
{
  v4.receiver = self;
  v4.super_class = (Class)ICMedia;
  [(ICCloudSyncingObject *)&v4 markForDeletion];
  uint64_t v3 = [(ICMedia *)self attachment];
  [v3 markForDeletion];
}

- (void)unmarkForDeletion
{
  v4.receiver = self;
  v4.super_class = (Class)ICMedia;
  [(ICCloudSyncingObject *)&v4 unmarkForDeletion];
  uint64_t v3 = [(ICMedia *)self attachment];
  [v3 unmarkForDeletion];
}

- (id)cryptoStrategyProtocol
{
  return &unk_1F1F76570;
}

- (id)decryptedData
{
  char v2 = [(ICCloudSyncingObject *)self cryptoStrategy];
  uint64_t v3 = [v2 decryptedData];

  return v3;
}

- (id)parentEncryptableObject
{
  uint64_t v3 = [(ICMedia *)self attachment];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ICMedia *)self account];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)supportsEncryptedValuesDictionary
{
  return 1;
}

- (void)applyRandomCryptoGooIfNeeded
{
  v9.receiver = self;
  v9.super_class = (Class)ICMedia;
  [(ICCloudSyncingObject *)&v9 applyRandomCryptoGooIfNeeded];
  uint64_t v3 = [(ICMedia *)self assetCryptoTag];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", 0);
    [(ICMedia *)self setAssetCryptoTag:v5];
  }
  id v6 = [(ICMedia *)self assetCryptoInitializationVector];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_random128BitData:", 0);
    [(ICMedia *)self setAssetCryptoInitializationVector:v8];
  }
}

- (void)setFilename:(id)a3
{
  objc_msgSend(a3, "ic_sanitizedFilenameString");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 length])
  {
    id v4 = v6;
  }
  else
  {
    uint64_t v5 = [(ICMedia *)self identifier];

    id v4 = (id)v5;
  }
  id v7 = v4;
  [(ICCloudSyncingObject *)self setValue:v4 forEncryptableKey:@"filename"];
}

+ (id)keyPathsForValuesAffectingParentCloudObject
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"attachment.note"];
}

- (id)cloudAccount
{
  uint64_t v3 = [(ICMedia *)self account];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(ICMedia *)self attachment];
    id v5 = [v6 cloudAccount];
  }
  return v5;
}

- (id)parentCloudObject
{
  char v2 = [(ICMedia *)self attachment];
  uint64_t v3 = [v2 note];

  return v3;
}

+ (id)keyPathsForValuesAffectingIsSharedViaICloud
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICMedia;
  char v2 = objc_msgSendSuper2(&v5, sel_keyPathsForValuesAffectingIsSharedViaICloud);
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"self.attachment.note"];
  [v3 addObject:@"self.attachment.note.isSharedViaICloud"];
  return v3;
}

- (ICAccount)placeholderAccount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->placeholderAccount);
  return (ICAccount *)WeakRetained;
}

+ (id)newMediaWithIdentifier:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 managedObjectContext];
  objc_super v9 = (void *)[a1 newObjectWithIdentifier:v7 context:v8];

  [v9 setAccount:v6];
  id v10 = [v6 persistentStore];

  [v9 assignToPersistentStore:v10];
  return v9;
}

+ (id)newMediaWithIdentifier:(id)a3 attachment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 managedObjectContext];
  objc_super v9 = (void *)[a1 newObjectWithIdentifier:v7 context:v8];

  id v10 = [v6 account];
  id v11 = [v10 persistentStore];
  [v9 assignToPersistentStore:v11];

  id v12 = [v6 account];
  [v9 setAccount:v12];

  [v9 setAttachment:v6];
  [v6 setMedia:v9];
  uint64_t v13 = [v6 isPasswordProtected];

  [v9 setIsPasswordProtected:v13];
  if ([v9 isPasswordProtected]) {
    [v9 initializeCryptoProperties];
  }
  return v9;
}

+ (id)newMediaWithAttachment:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];
  id v7 = [v4 managedObjectContext];
  id v8 = (void *)[a1 newObjectWithIdentifier:v6 context:v7];

  if (v4)
  {
    objc_super v9 = [v4 note];
    id v10 = [v9 account];
    id v11 = [v10 persistentStore];
    [v8 assignToPersistentStore:v11];

    id v12 = [v4 account];
    [v8 setAccount:v12];

    [v8 setAttachment:v4];
    [v4 setMedia:v8];
    objc_msgSend(v8, "setIsPasswordProtected:", objc_msgSend(v4, "isPasswordProtected"));
    if ([v8 isPasswordProtected]) {
      [v8 initializeCryptoProperties];
    }
  }

  return v8;
}

+ (id)newMediaWithAttachment:(id)a3 forData:(id)a4 filename:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = (void *)[a1 newMediaWithAttachment:v10];
  if (![v11 length])
  {
    BOOL v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[ICMedia(Management) newMediaWithAttachment:forData:filename:error:](v14);
    }

    uint64_t v15 = [v13 identifier];

    id v11 = (id)v15;
  }
  id v16 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[ICMedia(Management) newMediaWithAttachment:forData:filename:error:]();
  }

  [v13 setFilename:v11];
  char v17 = [v13 writeData:v12 error:a6];

  if ((v17 & 1) == 0)
  {
    if (a6) {
      id v18 = *a6;
    }
    else {
      id v18 = 0;
    }
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICMedia(Management) newMediaWithAttachment:forData:filename:error:]", 1, 1, @"Failed to write media to disk: %@", v18 functionName simulateCrash showAlert format];
    char v19 = [v10 managedObjectContext];
    [v19 deleteObject:v13];

    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)newMediaWithAttachment:(id)a3 forFileWrapper:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[a1 newMediaWithAttachment:v8];
  id v11 = +[ICNoteContext filenameFromFileWrapper:v9];
  if (![v11 length])
  {
    id v12 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[ICMedia(Management) newMediaWithAttachment:forFileWrapper:error:]();
    }

    uint64_t v13 = [v10 identifier];

    id v11 = (void *)v13;
  }
  BOOL v14 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[ICMedia(Management) newMediaWithAttachment:forData:filename:error:]();
  }

  [v10 setFilename:v11];
  if (([v10 writeDataFromFileWrapper:v9 error:a5] & 1) == 0)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICMedia(Management) newMediaWithAttachment:forFileWrapper:error:]", 1, 1, @"Failed to write media to disk: %@", *a5 functionName simulateCrash showAlert format];
    uint64_t v15 = [v8 managedObjectContext];
    [v15 deleteObject:v10];

    id v10 = 0;
  }

  return v10;
}

+ (id)newMediaWithAttachment:(id)a3 forURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[a1 newMediaWithAttachment:v8];
  id v11 = [v9 lastPathComponent];
  [v10 setFilename:v11];

  id v12 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[ICMedia(Management) newMediaWithAttachment:forURL:error:](v10, v12);
  }

  if (([v10 writeDataFromFileURL:v9 error:a5] & 1) == 0)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICMedia(Management) newMediaWithAttachment:forURL:error:]", 1, 1, @"Failed to write media to disk: %@", *a5 functionName simulateCrash showAlert format];
    uint64_t v13 = [v8 managedObjectContext];
    [v13 deleteObject:v10];

    id v10 = 0;
  }

  return v10;
}

+ (void)deleteMedia:(id)a3
{
}

+ (void)undeleteMedia:(id)a3
{
}

+ (void)purgeMedia:(id)a3
{
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  [v4 deleteObject:v3];
}

+ (id)mediaWithIdentifier:(id)a3 context:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"identifier = %@", a3];
  id v9 = objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v8, v7);

  id v10 = [v9 firstObject];

  return v10;
}

+ (id)mediaIdentifiersForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"ICMedia"];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"attachment.note.account == %@", v3];

  [v5 setPredicate:v6];
  [v5 setResultType:2];
  [v5 setPropertiesToFetch:&unk_1F1F62BF8];
  id v12 = 0;
  id v7 = [v4 executeFetchRequest:v5 error:&v12];
  id v8 = v12;
  if (v8)
  {
    id v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ICMedia(Management) mediaIdentifiersForAccount:]();
    }
    goto LABEL_4;
  }
  id v9 = [v7 valueForKey:@"identifier"];
  if (!v9)
  {
LABEL_4:
    id v10 = 0;
    goto LABEL_7;
  }
  id v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
LABEL_7:

  return v10;
}

+ (void)enumerateMediaInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
}

+ (id)allMediaInContext:(id)a3
{
  return (id)objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", 0, a3);
}

- (id)recordZoneName
{
  return @"Notes";
}

- (NSString)recordType
{
  return (NSString *)@"Media";
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5)
  {
    id v12 = (void *)MEMORY[0x1E4F836F8];
    uint64_t v13 = [(ICMedia *)self className];
    BOOL v14 = ICStringFromSyncingApproach(a5);
    [v12 handleFailedAssertWithCondition:"__objc_no", "-[ICMedia(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v13, v14 functionName simulateCrash showAlert format];

LABEL_11:
    BOOL v24 = 0;
    goto LABEL_12;
  }
  v50.receiver = self;
  v50.super_class = (Class)ICMedia;
  if (![(ICCloudSyncingObject *)&v50 mergeCloudKitRecord:v10 accountID:v11 approach:0 mergeableFieldState:a6])goto LABEL_11; {
  uint64_t v15 = [v10 objectForKeyedSubscript:@"AssetCryptoTag"];
  }
  [(ICMedia *)self setAssetCryptoTag:v15];

  id v16 = [v10 objectForKeyedSubscript:@"AssetCryptoInitializationVector"];
  [(ICMedia *)self setAssetCryptoInitializationVector:v16];

  uint64_t v17 = [(ICMedia *)self assetCryptoTag];
  if (v17)
  {
    id v18 = (void *)v17;
    char v19 = [(ICMedia *)self assetCryptoInitializationVector];

    if (v19) {
      [(ICMedia *)self setIsPasswordProtected:1];
    }
  }
  int v20 = [v10 encryptedValues];
  id v21 = [v20 objectForKeyedSubscript:@"FilenameEncrypted"];

  if (v21 && ([(ICMedia *)self isPasswordProtected] & 1) == 0)
  {
    uint64_t v23 = objc_msgSend(v21, "ic_stringValue");
    goto LABEL_14;
  }
  uint64_t v22 = [v10 objectForKeyedSubscript:@"Filename"];

  if (v22)
  {
    uint64_t v23 = [v10 objectForKeyedSubscript:@"Filename"];
LABEL_14:
    id v26 = (void *)v23;
    [(ICMedia *)self setFilename:v23];
LABEL_15:

    goto LABEL_16;
  }
  char v40 = [v10 objectForKeyedSubscript:@"FilenameExtension"];

  if (v40)
  {
    id v26 = [v10 objectForKeyedSubscript:@"FilenameExtension"];
    char v41 = [(ICMedia *)self identifier];
    char v42 = [v41 stringByAppendingPathExtension:v26];
    [(ICMedia *)self setFilename:v42];

    char v43 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      -[ICMedia(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:](v10, v43);
    }

    [(ICCloudSyncingObject *)self updateChangeCountWithReason:@"Corrected filename"];
    goto LABEL_15;
  }
LABEL_16:
  id v27 = [v10 objectForKeyedSubscript:@"Asset"];
  uint64_t v28 = [v27 fileURL];
  if (!v28) {
    goto LABEL_21;
  }
  id v29 = (void *)v28;
  id v30 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v31 = [v27 fileURL];
  id v32 = [v31 path];
  int v33 = [v30 fileExistsAtPath:v32];

  if (v33)
  {
    char v34 = [v10 objectForKeyedSubscript:@"IsArchivedDirectory"];
    id v49 = 0;
    BOOL v35 = -[ICMedia writeDataFromAsset:accountID:isArchivedDirectory:error:](self, "writeDataFromAsset:accountID:isArchivedDirectory:error:", v27, v11, [v34 BOOLValue], &v49);
    id v36 = v49;

    if (!v35)
    {
      id v37 = (void *)MEMORY[0x1E4F836F8];
      id v38 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      [v37 handleFailedAssertWithCondition:"__objc_no", "-[ICMedia(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 1, @"Error writing data from asset for %@: %@", v38, v36 functionName simulateCrash showAlert format];
    }
  }
  else
  {
LABEL_21:
    v39 = [(ICCloudSyncingObject *)self unappliedEncryptedRecord];
    if (v39)
    {
    }
    else if (![(ICCloudSyncingObject *)self isMergingUnappliedEncryptedRecord])
    {
      [(ICCloudSyncingObject *)self setNeedsToBeFetchedFromCloud:1];
    }
  }
  int v44 = [(ICMedia *)self markedForDeletion];
  uint64_t v45 = [(ICMedia *)self attachment];
  int v46 = [v45 markedForDeletion];

  if (v44 != v46)
  {
    uint64_t v47 = [(ICMedia *)self markedForDeletion];
    __int16 v48 = [(ICMedia *)self attachment];
    [v48 setMarkedForDeletion:v47];
  }
  BOOL v24 = 1;
LABEL_12:

  return v24;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = (void *)MEMORY[0x1E4F836F8];
    id v7 = [(ICMedia *)self className];
    id v8 = ICStringFromSyncingApproach(a3);
    [v6 handleFailedAssertWithCondition:"__objc_no", "-[ICMedia(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, @"Object %@ does not support sync approach: %@", v7, v8 functionName simulateCrash showAlert format];

    id v9 = 0;
    goto LABEL_19;
  }
  v32.receiver = self;
  v32.super_class = (Class)ICMedia;
  id v9 = [(ICCloudSyncingObject *)&v32 makeCloudKitRecordForApproach:0 mergeableFieldState:a4];
  if (![(ICMedia *)self isPasswordProtected])
  {
    uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v18 = [(ICMedia *)self mediaArchiveURL];
    char v19 = [v18 path];
    int v20 = [v17 fileExistsAtPath:v19];

    if (v20)
    {
      id v21 = [(ICMedia *)self mediaArchiveURL];
      uint64_t v22 = +[ICCloudSyncingObject assetForURL:v21];

      if (v22)
      {
        [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsArchivedDirectory"];
LABEL_11:
        [v9 setObject:v22 forKeyedSubscript:@"Asset"];
      }
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      BOOL v24 = [(ICMedia *)self mediaURL];
      int v25 = [v24 path];
      int v26 = [v23 fileExistsAtPath:v25];

      if (!v26)
      {
        uint64_t v22 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = [(ICMedia *)self className];
          id v29 = [(ICMedia *)self identifier];
          *(_DWORD *)buf = 138412546;
          char v34 = v28;
          __int16 v35 = 2112;
          id v36 = v29;
          _os_log_impl(&dword_1C3A61000, v22, OS_LOG_TYPE_DEFAULT, "Trying to push an %@ with no media file: %@", buf, 0x16u);
        }
        goto LABEL_15;
      }
      id v27 = [(ICMedia *)self mediaURL];
      uint64_t v22 = +[ICCloudSyncingObject assetForURL:v27];

      if (v22) {
        goto LABEL_11;
      }
    }
LABEL_15:

    id v30 = [(ICMedia *)self filename];

    if (!v30) {
      goto LABEL_19;
    }
    uint64_t v13 = [(ICMedia *)self filename];
    BOOL v14 = [v13 dataUsingEncoding:4];
    uint64_t v15 = [v9 encryptedValues];
    [v15 setObject:v14 forKeyedSubscript:@"FilenameEncrypted"];
    goto LABEL_17;
  }
  id v10 = [(ICMedia *)self assetCryptoInitializationVector];
  [v9 setObject:v10 forKeyedSubscript:@"AssetCryptoInitializationVector"];

  id v11 = [(ICMedia *)self assetCryptoTag];
  [v9 setObject:v11 forKeyedSubscript:@"AssetCryptoTag"];

  id v12 = [(ICMedia *)self encryptedMediaURL];
  uint64_t v13 = +[ICCloudSyncingObject assetForURL:v12];

  if (v13)
  {
    [v9 setObject:v13 forKeyedSubscript:@"Asset"];
    BOOL v14 = [(ICMedia *)self identifier];
    uint64_t v15 = [v14 dataUsingEncoding:4];
    id v16 = [v9 encryptedValues];
    [v16 setObject:v15 forKeyedSubscript:@"FilenameEncrypted"];

LABEL_17:
  }

LABEL_19:
  return v9;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v6 = a5;
  id v7 = [a3 recordName];
  id v8 = +[ICMedia mediaWithIdentifier:v7 context:v6];

  return v8;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[ICAccount cloudKitAccountWithIdentifier:v7 context:a5];
  id v10 = [v8 recordID];
  id v11 = [v10 recordName];
  id v12 = +[ICMedia newMediaWithIdentifier:v11 account:v9];

  [v12 mergeCloudKitRecord:v8 accountID:v7 approach:0];
  [v12 setServerRecord:v8];

  [v12 setInCloud:1];
  [v12 clearChangeCountWithReason:@"Created object"];
  [v12 updateParentReferenceIfNecessary];

  return v12;
}

- (BOOL)needsToBePushedToCloud
{
  v7.receiver = self;
  v7.super_class = (Class)ICMedia;
  unsigned int v3 = [(ICCloudSyncingObject *)&v7 needsToBePushedToCloud];
  id v4 = [(ICMedia *)self attachment];
  if (v4 && v3)
  {
    do
    {
      objc_super v5 = v4;
      unsigned int v3 = [v4 isBeingEditedLocallyOnDevice];
      id v4 = [v4 parentAttachment];
    }
    while (v4 && !v3);
    LOBYTE(v3) = v3 ^ 1;
  }

  return v3;
}

- (void)objectWasPushedToCloudWithOperation:(id)a3 serverRecord:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICMedia;
  [(ICCloudSyncingObject *)&v7 objectWasPushedToCloudWithOperation:a3 serverRecord:a4];
  objc_super v5 = [(ICMedia *)self managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__ICMedia_CloudKit__objectWasPushedToCloudWithOperation_serverRecord___block_invoke;
  v6[3] = &unk_1E64A4240;
  v6[4] = self;
  [v5 performBlock:v6];
}

uint64_t __70__ICMedia_CloudKit__objectWasPushedToCloudWithOperation_serverRecord___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFlagToExcludeFromCloudBackup];
}

- (void)fixBrokenReferences
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICCloudSyncingObject *)self loggingDescription];
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Fixing broken references for %@", (uint8_t *)&v17, 0xCu);
  }
  objc_super v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    objc_super v7 = [(ICMedia *)self attachment];
    id v8 = [v7 loggingDescription];
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    int v20 = v8;
    _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEFAULT, "%@ attachment=%@", (uint8_t *)&v17, 0x16u);
  }
  id v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    id v11 = [(ICMedia *)self attachment];
    id v12 = [v11 note];
    uint64_t v13 = [v12 loggingDescription];
    int v17 = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    int v20 = v13;
    _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEFAULT, "%@ note=%@", (uint8_t *)&v17, 0x16u);
  }
  BOOL v14 = [(ICMedia *)self attachment];
  [v14 updateChangeCountWithReason:@"Fixed broken reference"];

  uint64_t v15 = [(ICMedia *)self attachment];
  id v16 = [v15 note];
  [v16 updateChangeCountWithReason:@"Fixed broken reference"];
}

- (BOOL)hasAllMandatoryFields
{
  if ([(ICMedia *)self isPasswordProtected])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [(ICMedia *)self filename];
    BOOL v3 = [v4 length] != 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)ICMedia;
  BOOL v5 = [(ICCloudSyncingObject *)&v7 hasAllMandatoryFields];
  if (v5) {
    LOBYTE(v5) = [(ICMedia *)self hasFile] && v3;
  }
  return v5;
}

- (BOOL)isInICloudAccount
{
  char v2 = self;
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(ICMedia *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__ICMedia_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E64A4528;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__ICMedia_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attachment];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInICloudAccount];
}

- (void)deleteFromLocalDatabase
{
}

- (id)objectsToBeDeletedBeforeThisObject
{
  v8.receiver = self;
  v8.super_class = (Class)ICMedia;
  BOOL v3 = [(ICCloudSyncingObject *)&v8 objectsToBeDeletedBeforeThisObject];
  id v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(ICMedia *)self attachment];
  objc_msgSend(v4, "ic_addNonNilObject:", v5);

  uint64_t v6 = (void *)[v4 copy];
  return v6;
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (void)accountWillChangeToAccount:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error moving media files %@", v2, v3, v4, v5, v6);
}

- (void)accountWillChangeToAccount:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error creating media directory %@", v2, v3, v4, v5, v6);
}

- (void)setAttachment:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 identifier];
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v5, v6, "Setting attachment (%@) on media (%@)", v7, v8, v9, v10, v11);
}

- (void)hasFile
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error checking if media file exists: %@", v2, v3, v4, v5, v6);
}

void __38__ICMedia_writeDataFromFileURL_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__ICMedia_writeDataFromFileURL_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Failed to finish archive %@, error %@");
}

- (void)writeDataFromAsset:(void *)a1 accountID:(NSObject *)a2 isArchivedDirectory:error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, a2, v4, "Media URL is nil for media %@", v5);
}

- (void)writeDataFromAsset:accountID:isArchivedDirectory:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error writing data from asset: %@", v2, v3, v4, v5, v6);
}

- (void)writeDataFromAsset:accountID:isArchivedDirectory:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Failed to move or link a media asset. Falling back to copy: %@", v2, v3, v4, v5, v6);
}

void __27__ICMedia_writeData_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Unable to write data for media; target URL is nil",
    v1,
    2u);
}

void __27__ICMedia_writeData_error___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Failed to remove temporary directory %@, error %@");
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Failed to remove temporary archive file %@, error %@");
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_6_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Failed to copy directory attachment to file %@, error %@");
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_6_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Failed to finish archive %@, error %@");
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_6_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Failed to write file wrapper to temporary file %@, error %@");
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_6_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Failed to create temporary directory %@, error %@");
}

void __42__ICMedia_writeDataFromFileWrapper_error___block_invoke_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeDataWithBlock:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, a2, v4, "Cannot construct media URL {mediaID: %@}", v5);
}

- (void)writeDataWithBlock:(void *)a1 error:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, a2, v4, "Cannot remove decrypted media data {mediaID: %@}", v5);
}

- (void)writeDataWithBlock:(void *)a1 error:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, a2, v4, "Cannot encrypt media data — rolling back generation… {mediaID: %@}", v5);
}

- (void)writeDataWithBlock:(NSObject *)a3 error:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_9_1();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Cannot write media data — rolling back generation… {mediaID: %@, error: %@}", v6, 0x16u);
}

- (void)containerAccount
{
  uint64_t v3 = [a1 identifier];
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v5, v6, "Couldn't find account for media %@, using default account %@ for container directory.", v7, v8, v9, v10, v11);
}

- (void)prepareExportableMediaURL
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Unable to get media modification date because %@", v2, v3, v4, v5, v6);
}

@end