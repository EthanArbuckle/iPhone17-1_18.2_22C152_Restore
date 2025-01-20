@interface PFClientSideEncryptionManager
- (BOOL)archiveFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (BOOL)createKeychainEntryReturningKeyData:(id *)a3 keyInfo:(id *)a4;
- (BOOL)findExistingKeychainEntryReturningKeyData:(id *)a3 keyInfo:(id *)a4;
- (BOOL)unarchiveDirectoryAtURL:(id)a3 error:(id *)a4;
- (BOOL)unarchiveFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (PFClientSideEncryptionManager)initWithProfile:(id)a3;
- (id)_getKeyData;
- (id)configurationForProfile:(id)a3;
- (void)archiveDirectoryAtURL:(id)a3 toOutputURL:(id)a4 dataType:(int64_t)a5 options:(id)a6 entryPredicate:(id)a7 completionHandler:(id)a8;
- (void)shutdownWithCompletionHandler:(id)a3;
- (void)start;
@end

@implementation PFClientSideEncryptionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_keyMetadata, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_keychainViewHint, 0);
  objc_storeStrong((id *)&self->_keychainApplicationLabel, 0);

  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
}

- (BOOL)unarchiveFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  os_unfair_lock_unlock(&self->_lock);
  if (state == 4)
  {
    v11 = [(PFAppleArchiveStream *)[PFAppleArchive alloc] initWithArchiveURL:v8];
    [(PFAppleArchiveStream *)v11 setEncryptionKey:self->_keyData];
    BOOL v12 = [(PFAppleArchive *)v11 openForReading:a5];
    v13 = [(NSDictionary *)self->_keyMetadata objectForKeyedSubscript:@"key-creation-date"];
    v14 = [(PFAppleArchiveStream *)v11 encryptedArchiveMetadata];
    v15 = [v14 objectForKeyedSubscript:@"com.apple.photos.backend.client-side-encryption.key-creation-date"];
    uint64_t v16 = [v14 objectForKeyedSubscript:@"com.apple.photos.backend.client-side-encryption.version"];
    v17 = (void *)v16;
    if (!v12)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        id v30 = *a5;
        *(_DWORD *)buf = 138544130;
        *(void *)v45 = v17;
        *(_WORD *)&v45[8] = 2114;
        *(void *)v46 = v13;
        *(_WORD *)&v46[8] = 2114;
        *(void *)v47 = v15;
        *(_WORD *)&v47[8] = 2112;
        *(void *)v48 = v30;
        _os_log_error_impl(&dword_1A41FE000, logHandle, OS_LOG_TYPE_ERROR, "Failed to open single file encrypted archive, version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@, error: %@", buf, 0x2Au);
      }
      BOOL v24 = 0;
      goto LABEL_23;
    }
    v33 = v15;
    id v34 = v9;
    v32 = (void *)v16;
    uint64_t v35 = MEMORY[0x1A6259880]();
    id v42 = 0;
    id v43 = 0;
    id v41 = 0;
    BOOL v18 = [(PFAppleArchive *)v11 decodeData:&v43 filename:&v42 error:&v41];
    id v38 = v43;
    id v36 = v42;
    id v19 = v41;
    id v40 = v19;
    BOOL v20 = [(PFAppleArchive *)v11 close:&v40];
    id v21 = v40;

    BOOL v31 = v18;
    if (v18 && v20)
    {
      id v39 = v21;
      id v9 = v34;
      int v22 = [v38 writeToURL:v34 options:1 error:&v39];
      id v37 = v39;

      if (v22)
      {
        v23 = self->_logHandle;
        v17 = v32;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          *(void *)v45 = v36;
          *(_WORD *)&v45[8] = 2114;
          *(void *)v46 = v32;
          *(_WORD *)&v46[8] = 2114;
          *(void *)v47 = v13;
          *(_WORD *)&v47[8] = 2114;
          v15 = v33;
          *(void *)v48 = v33;
          _os_log_debug_impl(&dword_1A41FE000, v23, OS_LOG_TYPE_DEBUG, "Successfully unarchived single file encrypted archive, filename=%@, version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@", buf, 0x2Au);
          BOOL v24 = 1;
        }
        else
        {
          BOOL v24 = 1;
          v15 = v33;
        }
        v25 = (void *)v35;
LABEL_19:

        if (a5 && !v24) {
          *a5 = v37;
        }

LABEL_23:
        goto LABEL_24;
      }
      v17 = v32;
    }
    else
    {
      id v37 = v21;
      v17 = v32;
      id v9 = v34;
    }
    v28 = self->_logHandle;
    v25 = (void *)v35;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v45 = v31;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v20;
      *(_WORD *)v46 = 2114;
      *(void *)&v46[2] = v17;
      *(_WORD *)v47 = 2114;
      *(void *)&v47[2] = v13;
      *(_WORD *)v48 = 2114;
      v15 = v33;
      *(void *)&v48[2] = v33;
      __int16 v49 = 2112;
      id v50 = v37;
      _os_log_error_impl(&dword_1A41FE000, v28, OS_LOG_TYPE_ERROR, "Failed to unarchive single file encrypted archive (didDecode=%d, didClose=%d), version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@, error: %@", buf, 0x36u);
      BOOL v24 = 0;
    }
    else
    {
      BOOL v24 = 0;
      v15 = v33;
    }
    goto LABEL_19;
  }
  if (a5)
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28228];
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid state %tu", self->_state);
    v11 = (PFAppleArchive *)objc_claimAutoreleasedReturnValue();
    v52[0] = v11;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    [v26 errorWithDomain:@"com.apple.PhotosFormats" code:500101 userInfo:v13];
    BOOL v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  BOOL v24 = 0;
LABEL_25:

  return v24;
}

- (BOOL)archiveFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  os_unfair_lock_unlock(&self->_lock);
  if (state == 4)
  {
    v11 = [(PFAppleArchiveStream *)[PFAppleArchive alloc] initWithArchiveURL:v9];
    [(PFAppleArchiveStream *)v11 setEncryptionKey:self->_keyData];
    v33[0] = @"com.apple.photos.backend.client-side-encryption.key-creation-date";
    BOOL v12 = [(NSDictionary *)self->_keyMetadata objectForKeyedSubscript:@"key-creation-date"];
    v13 = [v12 description];
    v33[1] = @"com.apple.photos.backend.client-side-encryption.version";
    v34[0] = v13;
    v14 = [&unk_1EF7CA910 stringValue];
    v34[1] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    [(PFAppleArchiveStream *)v11 setEncryptedArchiveMetadata:v15];

    if ([(PFAppleArchive *)v11 openForWriting:a5])
    {
      uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8 options:1 error:a5];
      if (v16)
      {
        v17 = [v8 lastPathComponent];
        BOOL v18 = [(PFAppleArchive *)v11 encodeData:v16 filename:v17 error:a5];

        if (v18 && [(PFAppleArchive *)v11 close:a5])
        {
          LOBYTE(a5) = 1;
LABEL_16:

          goto LABEL_17;
        }
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          id v23 = *a5;
          *(_DWORD *)buf = 67109378;
          LODWORD(v32[0]) = v18;
          WORD2(v32[0]) = 2112;
          *(void *)((char *)v32 + 6) = v23;
          BOOL v24 = "Error archiving single file content (didEncode=%d). Error: %@";
          v25 = logHandle;
          uint32_t v26 = 18;
LABEL_20:
          _os_log_error_impl(&dword_1A41FE000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
        }
      }
      else
      {
        v27 = self->_logHandle;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v30 = *a5;
          *(_DWORD *)buf = 138412290;
          v32[0] = v30;
          BOOL v24 = "Unable to read single-file encrypted archive input data: %@";
          v25 = v27;
          uint32_t v26 = 12;
          goto LABEL_20;
        }
      }
      LOBYTE(a5) = 0;
      goto LABEL_16;
    }
    id v21 = self->_logHandle;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v29 = *a5;
      *(_DWORD *)buf = 138412290;
      v32[0] = v29;
      _os_log_error_impl(&dword_1A41FE000, v21, OS_LOG_TYPE_ERROR, "Error opening archive for single file writing: %@", buf, 0xCu);
    }
LABEL_11:
    LOBYTE(a5) = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (a5)
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28228];
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid state %tu", self->_state);
    v11 = (PFAppleArchive *)objc_claimAutoreleasedReturnValue();
    v36[0] = v11;
    BOOL v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    *a5 = [v19 errorWithDomain:@"com.apple.PhotosFormats" code:500101 userInfo:v20];

    goto LABEL_11;
  }
LABEL_18:

  return (char)a5;
}

- (BOOL)unarchiveDirectoryAtURL:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  os_unfair_lock_unlock(&self->_lock);
  if (state == 4)
  {
    id v8 = [(PFAppleArchiveStream *)[PFAppleArchive alloc] initWithArchiveURL:v6];
    [(PFAppleArchiveStream *)v8 setEncryptionKey:self->_keyData];
    id v31 = 0;
    BOOL v9 = [(PFAppleArchive *)v8 openForReading:&v31];
    id v10 = v31;
    v28 = [(NSDictionary *)self->_keyMetadata objectForKeyedSubscript:@"key-creation-date"];
    v11 = [(PFAppleArchiveStream *)v8 encryptedArchiveMetadata];
    BOOL v12 = [v11 objectForKeyedSubscript:@"com.apple.photos.backend.client-side-encryption.key-creation-date"];
    v13 = [v11 objectForKeyedSubscript:@"com.apple.photos.backend.client-side-encryption.version"];
    if (v9)
    {
      id v30 = v10;
      BOOL v27 = [(PFAppleArchive *)v8 decodeContentOfDirectoryWithError:&v30];
      id v14 = v30;

      id v29 = 0;
      BOOL v15 = [(PFAppleArchive *)v8 close:&v29];
      id v16 = v29;
      v17 = v16;
      if (v15)
      {
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          v33 = v13;
          __int16 v34 = 2114;
          uint64_t v35 = v28;
          __int16 v36 = 2114;
          id v37 = v12;
          _os_log_impl(&dword_1A41FE000, logHandle, OS_LOG_TYPE_INFO, "Successfully unarchived directory encrypted archive, version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@", buf, 0x20u);
        }

        if (v27)
        {
          BOOL v19 = 1;
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        if (v14) {
          id v23 = v14;
        }
        else {
          id v23 = v16;
        }
        id v24 = v23;

        id v14 = v24;
      }
    }
    else
    {
      id v14 = v10;
    }
    v25 = self->_logHandle;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v33 = v13;
      __int16 v34 = 2114;
      uint64_t v35 = v28;
      __int16 v36 = 2114;
      id v37 = v12;
      __int16 v38 = 2112;
      id v39 = v14;
      _os_log_error_impl(&dword_1A41FE000, v25, OS_LOG_TYPE_ERROR, "Failed to unarchive the directory encrypted archive, version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@, error: %@", buf, 0x2Au);
      if (a4) {
        goto LABEL_18;
      }
    }
    else if (a4)
    {
LABEL_18:
      id v14 = v14;
      BOOL v19 = 0;
      *a4 = v14;
      goto LABEL_21;
    }
    BOOL v19 = 0;
    goto LABEL_21;
  }
  BOOL v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v40 = *MEMORY[0x1E4F28228];
  id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid state %tu", self->_state);
  v41[0] = v21;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  id v14 = [v20 errorWithDomain:@"com.apple.PhotosFormats" code:500101 userInfo:v22];

  if (a4)
  {
    id v14 = v14;
    BOOL v19 = 0;
    *a4 = v14;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_22:

  return v19;
}

- (void)archiveDirectoryAtURL:(id)a3 toOutputURL:(id)a4 dataType:(int64_t)a5 options:(id)a6 entryPredicate:(id)a7 completionHandler:(id)a8
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  BOOL v15 = (void (**)(id, uint64_t, id))a8;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  os_unfair_lock_unlock(&self->_lock);
  if (state == 4)
  {
    v17 = [(PFAppleArchiveStream *)[PFAppleArchive alloc] initWithArchiveURL:v13];
    [(PFAppleArchiveStream *)v17 setEncryptionKey:self->_keyData];
    v38[0] = @"com.apple.photos.backend.client-side-encryption.key-creation-date";
    BOOL v18 = [(NSDictionary *)self->_keyMetadata objectForKeyedSubscript:@"key-creation-date"];
    BOOL v19 = [v18 description];
    v38[1] = @"com.apple.photos.backend.client-side-encryption.version";
    v39[0] = v19;
    BOOL v20 = [&unk_1EF7CA910 stringValue];
    v39[1] = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    [(PFAppleArchiveStream *)v17 setEncryptedArchiveMetadata:v21];

    id v35 = 0;
    LODWORD(v19) = [(PFAppleArchive *)v17 openForWriting:&v35];
    id v22 = v35;
    id v23 = v22;
    if (v19)
    {
      id v34 = v22;
      BOOL v24 = [(PFAppleArchive *)v17 encodeContentOfDirectoryAtURL:v12 entryPredicate:v14 error:&v34];
      id v25 = v34;

      if (v24)
      {
        id v33 = v25;
        BOOL v26 = [(PFAppleArchive *)v17 close:&v33];
        id v23 = v33;

        if (v26)
        {
          uint64_t v27 = 1;
LABEL_12:
          v15[2](v15, v27, v23);

          goto LABEL_13;
        }
      }
      else
      {
        id v23 = v25;
      }
      logHandle = self->_logHandle;
      if (!os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        uint64_t v27 = 0;
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      id v37 = v23;
      v32 = "Error archiving the directory content. Error: %@";
    }
    else
    {
      logHandle = self->_logHandle;
      if (!os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412290;
      id v37 = v23;
      v32 = "Error opening archive for directory writing: %@";
    }
    _os_log_error_impl(&dword_1A41FE000, logHandle, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
    goto LABEL_11;
  }
  v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v40 = *MEMORY[0x1E4F28228];
  id v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid state %tu", self->_state);
  v41[0] = v29;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  id v23 = [v28 errorWithDomain:@"com.apple.PhotosFormats" code:500101 userInfo:v30];

  v15[2](v15, 0, v23);
LABEL_13:
}

- (void)shutdownWithCompletionHandler:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t state = 5;
  os_unfair_lock_unlock(&self->_lock);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (BOOL)createKeychainEntryReturningKeyData:(id *)a3 keyInfo:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v7 = SecRandomCopyBytes(0, 0x20uLL, bytes);
  if (v7)
  {
    int v8 = v7;
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v37) = v8;
      _os_log_error_impl(&dword_1A41FE000, logHandle, OS_LOG_TYPE_ERROR, "Unable to generate random bytes for client side encryption manager key: %d", buf, 8u);
    }
    return 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes length:32];
    uint64_t v12 = *MEMORY[0x1E4F3B9A0];
    uint64_t v13 = *MEMORY[0x1E4F3B5D0];
    v38[0] = *MEMORY[0x1E4F3B978];
    v38[1] = v13;
    keychainAccessGroup = self->_keychainAccessGroup;
    keychainApplicationLabel = self->_keychainApplicationLabel;
    v39[0] = v12;
    v39[1] = keychainApplicationLabel;
    uint64_t v16 = *MEMORY[0x1E4F3B558];
    void v38[2] = *MEMORY[0x1E4F3B550];
    v38[3] = v16;
    uint64_t v17 = *MEMORY[0x1E4F3B570];
    void v39[2] = keychainAccessGroup;
    v39[3] = v17;
    uint64_t v18 = MEMORY[0x1E4F1CC38];
    uint64_t v19 = *MEMORY[0x1E4F3B6D8];
    v38[4] = *MEMORY[0x1E4F3B878];
    v38[5] = v19;
    uint64_t v20 = *MEMORY[0x1E4F3B700];
    v39[4] = MEMORY[0x1E4F1CC38];
    v39[5] = v20;
    v38[6] = *MEMORY[0x1E4F3B708];
    id v21 = [NSNumber numberWithInt:256];
    uint64_t v22 = *MEMORY[0x1E4F3BC68];
    v39[6] = v21;
    v39[7] = v18;
    uint64_t v23 = *MEMORY[0x1E4F3BD38];
    v38[7] = v22;
    v38[8] = v23;
    v38[9] = *MEMORY[0x1E4F3B870];
    keychainViewHint = self->_keychainViewHint;
    v39[8] = v11;
    v39[9] = keychainViewHint;
    CFDictionaryRef v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:10];

    CFTypeRef result = 0;
    OSStatus v26 = SecItemAdd(v25, &result);
    BOOL v10 = v26 == 0;
    if (v26)
    {
      OSStatus v27 = v26;
      v28 = self->_logHandle;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v37) = v27;
        _os_log_error_impl(&dword_1A41FE000, v28, OS_LOG_TYPE_ERROR, "Unable to add keychain item: %d", buf, 8u);
      }
      id v29 = 0;
    }
    else
    {
      id v30 = (void *)result;
      id v29 = [(id)result objectForKeyedSubscript:*MEMORY[0x1E4F3B668]];
      id v31 = self->_logHandle;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v37 = v29;
        _os_log_impl(&dword_1A41FE000, v31, OS_LOG_TYPE_DEFAULT, "Created client side encryption manager key with creation date %{public}@", buf, 0xCu);
      }

      if (a3) {
        *a3 = v11;
      }
      if (a4)
      {
        id v34 = @"key-creation-date";
        id v35 = v29;
        *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      }
    }
  }
  return v10;
}

- (BOOL)findExistingKeychainEntryReturningKeyData:(id *)a3 keyInfo:(id *)a4
{
  v30[7] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F3B9A0];
  uint64_t v8 = *MEMORY[0x1E4F3B5D0];
  v29[0] = *MEMORY[0x1E4F3B978];
  v29[1] = v8;
  keychainAccessGroup = self->_keychainAccessGroup;
  keychainApplicationLabel = self->_keychainApplicationLabel;
  v30[0] = v7;
  v30[1] = keychainApplicationLabel;
  uint64_t v11 = *MEMORY[0x1E4F3B878];
  v29[2] = *MEMORY[0x1E4F3B550];
  v29[3] = v11;
  v30[2] = keychainAccessGroup;
  v30[3] = MEMORY[0x1E4F1CC38];
  uint64_t v12 = *MEMORY[0x1E4F3BC68];
  v29[4] = *MEMORY[0x1E4F3BC70];
  v29[5] = v12;
  v30[4] = MEMORY[0x1E4F1CC38];
  v30[5] = MEMORY[0x1E4F1CC38];
  v29[6] = *MEMORY[0x1E4F3B870];
  v30[6] = self->_keychainViewHint;
  CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:7];
  CFTypeRef result = 0;
  OSStatus v14 = SecItemCopyMatching(v13, &result);
  BOOL v15 = (void *)result;
  if (v14 || !result)
  {
    logHandle = self->_logHandle;
    if (v14 == -25300)
    {
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A41FE000, logHandle, OS_LOG_TYPE_INFO, "No existing client side encryption manager keychain item exists", buf, 2u);
      }
    }
    else if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      LODWORD(v28[0]) = v14;
      WORD2(v28[0]) = 2048;
      *(void *)((char *)v28 + 6) = v15;
      _os_log_error_impl(&dword_1A41FE000, logHandle, OS_LOG_TYPE_ERROR, "Error querying for existing client side encryption manager keychain item: %d, %p", buf, 0x12u);
    }
    BOOL v20 = 0;
  }
  else
  {
    uint64_t v16 = [(id)result objectForKeyedSubscript:*MEMORY[0x1E4F3B668]];
    uint64_t v17 = self->_logHandle;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v28[0] = v16;
      _os_log_impl(&dword_1A41FE000, v17, OS_LOG_TYPE_INFO, "Found existing client side encryption manager keychain item with creation date %{public}@", buf, 0xCu);
    }
    uint64_t v18 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    uint64_t v19 = v18;
    BOOL v20 = v18 != 0;
    if (v18)
    {
      if (a3) {
        *a3 = v18;
      }
      if (a4)
      {
        CFDictionaryRef v25 = @"key-creation-date";
        OSStatus v26 = v16;
        *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      }
    }
    else
    {
      uint64_t v22 = self->_logHandle;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28[0] = v16;
        _os_log_error_impl(&dword_1A41FE000, v22, OS_LOG_TYPE_ERROR, "Unexpected missing key data in existing keychain item with creation date %{public}@", buf, 0xCu);
      }
    }
  }
  return v20;
}

- (id)_getKeyData
{
  return self->_keyData;
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v16 = 0;
  id v17 = 0;
  BOOL v4 = [(PFClientSideEncryptionManager *)self findExistingKeychainEntryReturningKeyData:&v17 keyInfo:&v16];
  id v5 = v17;
  id v6 = v16;
  uint64_t v7 = v6;
  if (v4)
  {
    id v8 = v6;
    id v9 = v5;
LABEL_5:
    objc_storeStrong((id *)&self->_keyData, v5);
    objc_storeStrong((id *)&self->_keyMetadata, v7);
    unint64_t v11 = 4;
    goto LABEL_9;
  }
  id v14 = v6;
  id v15 = v5;
  BOOL v10 = [(PFClientSideEncryptionManager *)self createKeychainEntryReturningKeyData:&v15 keyInfo:&v14];
  id v9 = v15;

  id v8 = v14;
  if (v10)
  {
    uint64_t v7 = v8;
    id v5 = v9;
    goto LABEL_5;
  }
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)CFDictionaryRef v13 = 0;
    _os_log_error_impl(&dword_1A41FE000, logHandle, OS_LOG_TYPE_ERROR, "Unable to find or create client side encryption manager key", v13, 2u);
  }
  unint64_t v11 = 1;
LABEL_9:
  self->_unint64_t state = v11;
  os_unfair_lock_unlock(p_lock);
}

- (id)configurationForProfile:(id)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v21[0] = @"Photos";
  v19[0] = @"keychainAccessGroup";
  v19[1] = @"keychainViewHint";
  uint64_t v3 = *MEMORY[0x1E4F3B900];
  v20[0] = @"com.apple.photos.client-side-encryption-manager";
  v20[1] = v3;
  v19[2] = @"applicationLabel";
  v20[2] = @"com.apple.photos.client-side-encryption-manager";
  BOOL v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v6;
  v21[1] = @"PhotosUnitTest";
  v17[0] = @"keychainAccessGroup";
  v17[1] = @"keychainViewHint";
  v18[0] = @"com.apple.photos.client-side-encryption-manager.unit-test";
  v18[1] = v3;
  v17[2] = @"applicationLabel";
  v18[2] = @"com.apple.photos.client-side-encryption-manager.unit-test";
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v22[1] = v7;
  v21[2] = @"PhotosCloudPhotoD";
  v15[0] = @"keychainAccessGroup";
  v15[1] = @"keychainViewHint";
  v16[0] = @"com.apple.photos.client-side-encryption-manager";
  v16[1] = v3;
  v15[2] = @"applicationLabel";
  v16[2] = @"com.apple.photos.client-side-encryption-manager.cloudphotod";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v22[2] = v8;
  v21[3] = @"MediaAnalysis";
  v13[0] = @"keychainAccessGroup";
  v13[1] = @"keychainViewHint";
  v14[0] = @"com.apple.mediaanalysisd.client-side-encryption-manager";
  v14[1] = v3;
  v13[2] = @"applicationLabel";
  v14[2] = @"com.apple.mediaanalysisd.client-side-encryption-manager";
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v22[3] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

  unint64_t v11 = [v10 objectForKeyedSubscript:v5];

  return v11;
}

- (PFClientSideEncryptionManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PFClientSideEncryptionManager;
  id v5 = [(PFClientSideEncryptionManager *)&v17 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(PFClientSideEncryptionManager *)v5 configurationForProfile:v4];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"keychainAccessGroup"];
    keychainAccessGroup = v6->_keychainAccessGroup;
    v6->_keychainAccessGroup = (NSString *)v8;

    uint64_t v10 = [v7 objectForKeyedSubscript:@"applicationLabel"];
    keychainApplicationLabel = v6->_keychainApplicationLabel;
    v6->_keychainApplicationLabel = (NSString *)v10;

    uint64_t v12 = [v7 objectForKeyedSubscript:@"keychainViewHint"];
    keychainViewHint = v6->_keychainViewHint;
    v6->_keychainViewHint = (NSString *)v12;

    v6->_unint64_t state = 0;
    v6->_lock._os_unfair_lock_opaque = 0;
    os_log_t v14 = os_log_create("com.apple.photos.backend", "ClientSideEncryptionManager");
    logHandle = v6->_logHandle;
    v6->_logHandle = (OS_os_log *)v14;
  }
  return v6;
}

@end