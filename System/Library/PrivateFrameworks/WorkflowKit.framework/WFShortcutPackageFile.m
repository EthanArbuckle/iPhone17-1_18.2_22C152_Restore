@interface WFShortcutPackageFile
- (NSData)shortcutData;
- (NSData)signedShortcutData;
- (NSFileManager)fileManager;
- (NSString)directoryName;
- (NSString)fileName;
- (NSString)sanitizedName;
- (NSString)shortcutName;
- (NSURL)signedShortcutFileURL;
- (NSURL)temporaryWorkingDirectoryURL;
- (OS_dispatch_queue)executionQueue;
- (WFShortcutPackageFile)initWithShortcutData:(id)a3 shortcutName:(id)a4;
- (WFShortcutPackageFile)initWithSignedShortcutData:(id)a3 shortcutName:(id)a4;
- (WFShortcutPackageFile)initWithSignedShortcutFileURL:(id)a3;
- (id)extractShortcutFileRepresentationWithError:(id *)a3;
- (id)extractShortcutFileRepresentationWithSigningMethod:(int64_t *)a3 error:(id *)a4;
- (id)extractShortcutFileRepresentationWithSigningMethod:(int64_t *)a3 iCloudIdentifier:(id *)a4 error:(id *)a5;
- (id)generateDirectoryStructureInDirectory:(id)a3 error:(id *)a4;
- (id)generateSignedShortcutFileRepresentationWithAccount:(id)a3 error:(id *)a4;
- (id)generateSignedShortcutFileRepresentationWithPrivateKey:(__SecKey *)a3 signingContext:(id)a4 error:(id *)a5;
- (void)commonInit;
- (void)extractShortcutFileRepresentationWithCompletion:(id)a3;
- (void)preformShortcutDataExtractionWithCompletion:(id)a3;
- (void)setShortcutData:(id)a3;
- (void)setSignedShortcutData:(id)a3;
@end

@implementation WFShortcutPackageFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_temporaryWorkingDirectoryURL, 0);
  objc_storeStrong((id *)&self->_signedShortcutFileURL, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_shortcutName, 0);
  objc_storeStrong((id *)&self->_signedShortcutData, 0);
  objc_storeStrong((id *)&self->_shortcutData, 0);
  objc_storeStrong((id *)&self->_sanitizedName, 0);
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (NSURL)temporaryWorkingDirectoryURL
{
  return self->_temporaryWorkingDirectoryURL;
}

- (NSURL)signedShortcutFileURL
{
  return self->_signedShortcutFileURL;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (NSString)shortcutName
{
  return self->_shortcutName;
}

- (void)setSignedShortcutData:(id)a3
{
}

- (NSData)signedShortcutData
{
  return self->_signedShortcutData;
}

- (void)setShortcutData:(id)a3
{
}

- (NSData)shortcutData
{
  return self->_shortcutData;
}

- (id)generateDirectoryStructureInDirectory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WFShortcutPackageFile *)self shortcutData];

  if (v7)
  {
    v8 = [(WFShortcutPackageFile *)self directoryName];
    v9 = [v6 URLByAppendingPathComponent:v8];

    v10 = [(WFShortcutPackageFile *)self fileManager];
    int v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:0 attributes:0 error:a4];

    id v12 = 0;
    if (v11)
    {
      v13 = [v9 URLByAppendingPathComponent:@"Shortcut.wflow"];
      v14 = [(WFShortcutPackageFile *)self shortcutData];
      [v14 writeToURL:v13 atomically:1];

      id v12 = v9;
    }
  }
  else if (a4)
  {
    WFShortcutPackageFileFailedToSignShortcutFileError();
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)generateSignedShortcutFileRepresentationWithAccount:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = getWFSecurityLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[WFShortcutPackageFile generateSignedShortcutFileRepresentationWithAccount:error:]";
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Generating Signed Shortcut Data with AppleID information", buf, 0xCu);
  }

  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:*MEMORY[0x1E4F3B740] forKeyedSubscript:*MEMORY[0x1E4F3B718]];
  [v8 setObject:&unk_1F23167D0 forKeyedSubscript:*MEMORY[0x1E4F3B708]];
  [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F3B6B0]];
  SecKeyRef RandomKey = SecKeyCreateRandomKey((CFDictionaryRef)v8, 0);
  v10 = +[WFShortcutSigningContext contextWithAppleIDAccount:v6 signingKey:RandomKey];

  id v16 = 0;
  int v11 = [(WFShortcutPackageFile *)self generateSignedShortcutFileRepresentationWithPrivateKey:RandomKey signingContext:v10 error:&v16];
  id v12 = v16;
  v13 = getWFSecurityLogObject();
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFShortcutPackageFile generateSignedShortcutFileRepresentationWithAccount:error:]";
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_INFO, "%s Generated Signed Shortcut Data with AppleID information Successfully", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFShortcutPackageFile generateSignedShortcutFileRepresentationWithAccount:error:]";
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to generate Signed Shortcut Data with AppleID information: %@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v12;
    }
  }

  return v11;
}

- (id)generateSignedShortcutFileRepresentationWithPrivateKey:(__SecKey *)a3 signingContext:(id)a4 error:(id *)a5
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 generateAuthData];
  if (v9)
  {
    v10 = [(WFShortcutPackageFile *)self temporaryWorkingDirectoryURL];
    int v11 = [(WFShortcutPackageFile *)self generateDirectoryStructureInDirectory:v10 error:a5];

    if (!v11) {
      goto LABEL_11;
    }
    AEAContext v12 = AEAContextCreateWithProfile(0);
    if (v12)
    {
      v13 = v12;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v12;
      v14 = (void (**)(void))_Block_copy(aBlock);
      if (AEAContextSetFieldUInt(v13, 3u, 0x801uLL))
      {
        if (a5)
        {
          WFShortcutPackageFileFailedToSignShortcutFileError();
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        goto LABEL_40;
      }
      CFErrorRef error = 0;
      CFDataRef v16 = SecKeyCopyExternalRepresentation(a3, &error);
      CFDataRef v40 = v16;
      if (!v16)
      {
        if (a5)
        {
          v18 = (void *)MEMORY[0x1E4F28C58];
          v45[0] = *MEMORY[0x1E4F28568];
          __int16 v19 = WFLocalizedString(@"Failed to sign shortcut");
          v45[1] = *MEMORY[0x1E4F28A50];
          v46[0] = v19;
          v46[1] = error;
          id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
          *a5 = [v18 errorWithDomain:@"WFWorkflowErrorDomain" code:4 userInfo:v20];
        }
        goto LABEL_20;
      }
      CFDataRef v17 = v16;
      if (AEAContextSetFieldBlob(v13, 8u, 1u, (const uint8_t *)[(__CFData *)v17 bytes], [(__CFData *)v17 length]))
      {
        if (a5)
        {
          WFShortcutPackageFileFailedToSignShortcutFileError();
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

LABEL_40:
          v14[2](v14);

          goto LABEL_41;
        }
LABEL_20:
        v15 = 0;
        goto LABEL_39;
      }
      id v21 = v9;
      AEAContextSetFieldBlob(v13, 5u, 0, (const uint8_t *)[v21 bytes], objc_msgSend(v21, "length"));
      v22 = [(WFShortcutPackageFile *)self temporaryWorkingDirectoryURL];
      v23 = [(WFShortcutPackageFile *)self fileName];
      v24 = [v22 URLByAppendingPathComponent:v23];

      id v39 = v24;
      v25 = AAFileStreamOpenWithPath((const char *)[v39 fileSystemRepresentation], 514, 0x1A4u);
      stream = AEAEncryptionOutputStreamOpen(v25, v13, 0, 0);
      AAFieldKeySet v26 = AAFieldKeySetCreateWithString("TYP,PAT,LNK,DEV,DAT,MOD,FLG,MTM,BTM,CTM,HLC,CLC");
      v27 = v26;
      if (!v26)
      {
        if (a5)
        {
          WFShortcutPackageFileFailedToSignShortcutFileError();
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        goto LABEL_38;
      }
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke_2;
      v42[3] = &__block_descriptor_40_e5_v8__0l;
      v42[4] = v26;
      v36 = (void (**)(void))_Block_copy(v42);
      id v38 = v11;
      AAPathList v28 = AAPathListCreateWithDirectoryContents((const char *)[v38 fileSystemRepresentation], 0, 0, 0, 0, 0);
      v29 = v28;
      if (!v28)
      {
        if (a5)
        {
          WFShortcutPackageFileFailedToSignShortcutFileError();
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        goto LABEL_37;
      }
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke_3;
      v41[3] = &__block_descriptor_40_e5_v8__0l;
      v41[4] = v28;
      v35 = (void (**)(void))_Block_copy(v41);
      v30 = AAEncodeArchiveOutputStreamOpen(stream, 0, 0, 0, 0);
      if (v30)
      {
        if (!AAArchiveStreamWritePathList(v30, v29, v27, (const char *)[v38 fileSystemRepresentation], 0, 0, 0, 0))
        {
          AAArchiveStreamClose(v30);
          AAByteStreamClose(stream);
          AAByteStreamClose(v25);
          v31 = (void *)MEMORY[0x1E4F5A900];
          v32 = [(WFShortcutPackageFile *)self sanitizedName];
          v15 = [v31 fileWithURL:v39 options:3 ofType:0 proposedFilename:v32];

          v33 = [(WFShortcutPackageFile *)self fileManager];
          [v33 removeItemAtURL:v39 error:0];

          goto LABEL_36;
        }
        if (a5) {
          goto LABEL_32;
        }
      }
      else if (a5)
      {
LABEL_32:
        WFShortcutPackageFileFailedToSignShortcutFileError();
        v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:
        v35[2](v35);

LABEL_37:
        v36[2](v36);

LABEL_38:
        goto LABEL_39;
      }
      v15 = 0;
      goto LABEL_36;
    }
    if (a5)
    {
      WFShortcutPackageFileFailedToSignShortcutFileError();
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_11:
      v15 = 0;
    }
LABEL_41:

    goto LABEL_42;
  }
  if (a5)
  {
    WFShortcutPackageFileInvalidShortcutFileError();
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_42:

  return v15;
}

void __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke(uint64_t a1)
{
}

void __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke_2(uint64_t a1)
{
}

void __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke_3(uint64_t a1)
{
}

- (void)preformShortcutDataExtractionWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFSecurityLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Extracting Signed Shortcut Data", buf, 0xCu);
  }

  id v6 = [(WFShortcutPackageFile *)self signedShortcutData];
  if (v6)
  {
  }
  else
  {
    v7 = [(WFShortcutPackageFile *)self signedShortcutFileURL];

    if (!v7)
    {
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
      goto LABEL_19;
    }
  }
  id v8 = [(WFShortcutPackageFile *)self signedShortcutData];

  if (v8)
  {
    id v9 = [(WFShortcutPackageFile *)self signedShortcutData];
    [v9 bytes];
    v10 = [(WFShortcutPackageFile *)self signedShortcutData];
    [v10 length];
    int v11 = (AAByteStream_impl *)AAMemoryInputStreamOpen();
  }
  else
  {
    id v9 = [(WFShortcutPackageFile *)self signedShortcutFileURL];
    int v11 = AAFileStreamOpenWithPath((const char *)[v9 fileSystemRepresentation], 0, 0x1A4u);
  }

  if (!v11 || (AEAContext v12 = AEAContextCreateWithEncryptedStream(v11)) == 0)
  {
    uint64_t v16 = WFShortcutPackageFileInvalidShortcutFileError();
LABEL_19:
    CFDataRef v17 = (void *)v16;
    (*((void (**)(id, void, void, void, uint64_t))v4 + 2))(v4, 0, 0, 0, v16);

    goto LABEL_20;
  }
  v13 = v12;
  *(void *)buf = 0;
  if (!AEAContextGetFieldBlob(v12, 5u, 0, 0, 0, (size_t *)buf) && *(void *)buf)
  {
    v14 = (uint8_t *)malloc_type_malloc(*(size_t *)buf, 0x1DD451A4uLL);
    if (!AEAContextGetFieldBlob(v13, 5u, 0, *(size_t *)buf, v14, 0))
    {
      v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v14 length:*(void *)buf];
      v18 = +[WFShortcutSigningContext contextWithAuthData:v15];
      if (v18)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke;
        v20[3] = &unk_1E654FC30;
        id v23 = v4;
        id v21 = v18;
        v22 = self;
        v24 = v13;
        v25 = v11;
        [v21 validateWithCompletion:v20];

        __int16 v19 = v23;
      }
      else
      {
        __int16 v19 = WFShortcutPackageFileInvalidShortcutFileError();
        (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v19);
      }

      goto LABEL_16;
    }
    free(v14);
  }
  v15 = WFShortcutPackageFileInvalidShortcutFileError();
  (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v15);
LABEL_16:

LABEL_20:
}

void __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a2)
  {
    uint64_t v10 = [*(id *)(a1 + 32) copyPublicKey];
    if (v10)
    {
      int v11 = (__SecKey *)v10;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke_2;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v10;
      AEAContext v12 = (void (**)(void))_Block_copy(aBlock);
      CFDataRef v13 = SecKeyCopyExternalRepresentation(v11, 0);
      v14 = *(AEAContext_impl **)(a1 + 56);
      CFDataRef v15 = v13;
      if (AEAContextSetFieldBlob(v14, 7u, 1u, (const uint8_t *)[(__CFData *)v15 bytes], [(__CFData *)v15 length]))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        WFShortcutPackageFileFailedToExtractShortcutFileError();
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void, void, void, id))(v16 + 16))(v16, 0, 0, 0, v17);
      }
      else
      {
        id v20 = [*(id *)(a1 + 40) temporaryWorkingDirectoryURL];
        uint64_t v21 = [*(id *)(a1 + 40) directoryName];
        v22 = [v20 URLByAppendingPathComponent:v21];

        id v23 = [*(id *)(a1 + 40) fileManager];
        v24 = [v22 path];
        LOBYTE(v21) = [v23 fileExistsAtPath:v24 isDirectory:0];

        if ((v21 & 1) == 0)
        {
          v25 = [*(id *)(a1 + 40) fileManager];
          [v25 createDirectoryAtURL:v22 withIntermediateDirectories:0 attributes:0 error:0];
        }
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke_3;
        v46[3] = &unk_1E6558938;
        void v46[4] = *(void *)(a1 + 40);
        id v26 = v22;
        id v47 = v26;
        v45 = (void (**)(void))_Block_copy(v46);
        id v17 = v26;
        uint64_t v27 = AAExtractArchiveOutputStreamOpen((const char *)[v17 fileSystemRepresentation], 0, 0, 1uLL, 0);
        if (v27)
        {
          s = AEADecryptionInputStreamOpen(*(AAByteStream *)(a1 + 64), *(AEAContext *)(a1 + 56), 0, 0);
          istream = AADecodeArchiveInputStreamOpen(s, 0, 0, 0, 0);
          AAPathList v28 = getWFSecurityLogObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v50 = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]_block_invoke";
            _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_INFO, "%s Extracting Signed Shortcut Data", buf, 0xCu);
          }

          ssize_t v29 = AAArchiveStreamProcess(istream, v27, 0, 0, 0, 0);
          if (v29 < 0 || AAArchiveStreamClose(v27) < 0)
          {
            v34 = getWFSecurityLogObject();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v50 = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]_block_invoke";
              __int16 v51 = 2050;
              ssize_t v52 = v29;
              _os_log_impl(&dword_1C7F0A000, v34, OS_LOG_TYPE_ERROR, "%s Failed to extract signed shortcut data with %{public}zd entries", buf, 0x16u);
            }

            uint64_t v35 = *(void *)(a1 + 48);
            v30 = WFShortcutPackageFileFailedToExtractShortcutFileError();
            (*(void (**)(uint64_t, void, void, void, void *))(v35 + 16))(v35, 0, 0, 0, v30);
          }
          else
          {
            ssize_t v40 = v29;
            v30 = [v17 URLByAppendingPathComponent:@"Shortcut.wflow"];
            v42 = (void *)MEMORY[0x1E4F5A900];
            v31 = [MEMORY[0x1E4FB4718] typeWithString:@"com.apple.shortcuts.workflow-file"];
            v32 = [*(id *)(a1 + 40) fileName];
            v43 = [v42 fileWithURL:v30 options:3 ofType:v31 proposedFilename:v32];

            if (v43)
            {
              v33 = getWFSecurityLogObject();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v50 = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]_block_invoke";
                __int16 v51 = 2048;
                ssize_t v52 = v40;
                _os_log_impl(&dword_1C7F0A000, v33, OS_LOG_TYPE_INFO, "%s Signed Shortcut Data Extracted Successfully with %zd entries", buf, 0x16u);
              }

              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
              AAArchiveStreamClose(istream);
              AAByteStreamClose(s);
            }
            else
            {
              v37 = getWFSecurityLogObject();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v50 = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]_block_invoke";
                _os_log_impl(&dword_1C7F0A000, v37, OS_LOG_TYPE_ERROR, "%s Could not find the main shortcut Shortcut.wflow file in the archive", buf, 0xCu);
              }

              uint64_t v38 = *(void *)(a1 + 48);
              id v39 = WFShortcutPackageFileInvalidShortcutFileError();
              (*(void (**)(uint64_t, void, void, void, void *))(v38 + 16))(v38, 0, 0, 0, v39);
            }
          }
        }
        else
        {
          uint64_t v36 = *(void *)(a1 + 48);
          v30 = WFShortcutPackageFileFailedToExtractShortcutFileError();
          (*(void (**)(uint64_t, void, void, void, void *))(v36 + 16))(v36, 0, 0, 0, v30);
        }

        v45[2](v45);
      }

      v12[2](v12);
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 48);
      __int16 v19 = WFShortcutPackageFileInvalidShortcutFileError();
      (*(void (**)(uint64_t, void, void, void, void *))(v18 + 16))(v18, 0, 0, 0, v19);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke_2(uint64_t a1)
{
}

void __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fileManager];
  [v2 removeItemAtURL:*(void *)(a1 + 40) error:0];
}

- (void)extractShortcutFileRepresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(WFShortcutPackageFile *)self executionQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__WFShortcutPackageFile_extractShortcutFileRepresentationWithCompletion___block_invoke;
  v7[3] = &unk_1E65572A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __73__WFShortcutPackageFile_extractShortcutFileRepresentationWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) preformShortcutDataExtractionWithCompletion:*(void *)(a1 + 40)];
}

- (id)extractShortcutFileRepresentationWithSigningMethod:(int64_t *)a3 iCloudIdentifier:(id *)a4 error:(id *)a5
{
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v39 = 0;
  ssize_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__19954;
  v43 = __Block_byref_object_dispose__19955;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__19954;
  v37 = __Block_byref_object_dispose__19955;
  id v38 = 0;
  uint64_t v27 = 0;
  AAPathList v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__19954;
  v31 = __Block_byref_object_dispose__19955;
  id v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__WFShortcutPackageFile_extractShortcutFileRepresentationWithSigningMethod_iCloudIdentifier_error___block_invoke;
  v17[3] = &unk_1E654FC08;
  __int16 v19 = &v39;
  id v20 = &v33;
  uint64_t v21 = &v23;
  v22 = &v27;
  uint64_t v10 = v9;
  uint64_t v18 = v10;
  [(WFShortcutPackageFile *)self preformShortcutDataExtractionWithCompletion:v17];
  dispatch_time_t v11 = dispatch_time(0, 30000000000);
  intptr_t v12 = dispatch_semaphore_wait(v10, v11);
  if (v40[5]) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  int v14 = !v13;
  if (a5 && v14) {
    *a5 = (id) v34[5];
  }
  if (a3) {
    *a3 = v24[3];
  }
  if (a4) {
    *a4 = (id) v28[5];
  }
  id v15 = (id)v40[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v15;
}

void __99__WFShortcutPackageFile_extractShortcutFileRepresentationWithSigningMethod_iCloudIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
  id v20 = v9;

  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v11;
  id v16 = v11;

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v10;
  id v19 = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)extractShortcutFileRepresentationWithSigningMethod:(int64_t *)a3 error:(id *)a4
{
  return [(WFShortcutPackageFile *)self extractShortcutFileRepresentationWithSigningMethod:a3 iCloudIdentifier:0 error:a4];
}

- (id)extractShortcutFileRepresentationWithError:(id *)a3
{
  return [(WFShortcutPackageFile *)self extractShortcutFileRepresentationWithSigningMethod:0 error:a3];
}

- (void)commonInit
{
  v3 = (void *)MEMORY[0x1E4F5AA28];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];
  id v6 = [v3 createTemporaryDirectoryWithFilename:v5];
  temporaryWorkingDirectoryURL = self->_temporaryWorkingDirectoryURL;
  self->_temporaryWorkingDirectoryURL = v6;

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  fileManager = self->_fileManager;
  self->_fileManager = v8;

  id v10 = [(WFShortcutPackageFile *)self fileManager];
  id v11 = [(WFShortcutPackageFile *)self temporaryWorkingDirectoryURL];
  id v15 = 0;
  [v10 createDirectoryAtURL:v11 withIntermediateDirectories:0 attributes:0 error:&v15];
  id v12 = v15;

  BOOL v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.shorcut-package-file.execution-queue", 0);
  executionQueue = self->_executionQueue;
  self->_executionQueue = v13;
}

- (WFShortcutPackageFile)initWithSignedShortcutFileURL:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutPackageFile;
  id v6 = [(WFShortcutPackageFile *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signedShortcutFileURL, a3);
    id v8 = [v5 lastPathComponent];
    uint64_t v9 = [v8 stringByDeletingPathExtension];
    shortcutName = v7->_shortcutName;
    v7->_shortcutName = (NSString *)v9;

    [(WFShortcutPackageFile *)v7 commonInit];
    id v11 = v7;
  }

  return v7;
}

- (WFShortcutPackageFile)initWithSignedShortcutData:(id)a3 shortcutName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutPackageFile;
  uint64_t v9 = [(WFShortcutPackageFile *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signedShortcutData, a3);
    objc_storeStrong((id *)&v10->_shortcutName, a4);
    [(WFShortcutPackageFile *)v10 commonInit];
    id v11 = v10;
  }

  return v10;
}

- (WFShortcutPackageFile)initWithShortcutData:(id)a3 shortcutName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutPackageFile;
  uint64_t v9 = [(WFShortcutPackageFile *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shortcutData, a3);
    objc_storeStrong((id *)&v10->_shortcutName, a4);
    [(WFShortcutPackageFile *)v10 commonInit];
    id v11 = v10;
  }

  return v10;
}

- (NSString)sanitizedName
{
  sanitizedName = self->_sanitizedName;
  if (!sanitizedName)
  {
    id v4 = [(WFShortcutPackageFile *)self shortcutName];
    if (![v4 rangeOfString:@"^[\\.](?=.*)" options:1024] && v5)
    {
      uint64_t v6 = objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:options:range:", @".", @"_", 0, 0, v5);

      id v4 = (void *)v6;
    }
    id v7 = [v4 stringByReplacingOccurrencesOfString:@":" withString:&stru_1F229A4D8];
    id v8 = [v7 stringByReplacingOccurrencesOfString:@"/" withString:@":"];
    uint64_t v9 = self->_sanitizedName;
    self->_sanitizedName = v8;

    sanitizedName = self->_sanitizedName;
  }
  return sanitizedName;
}

- (NSString)directoryName
{
  id v2 = [(WFShortcutPackageFile *)self sanitizedName];
  v3 = [v2 stringByAppendingPathExtension:@"shortcuts"];

  return (NSString *)v3;
}

- (NSString)fileName
{
  id v2 = [(WFShortcutPackageFile *)self sanitizedName];
  v3 = [v2 stringByAppendingPathExtension:@"shortcut"];

  return (NSString *)v3;
}

@end