@interface WFShortcutExtractor
+ (BOOL)isShortcutFileType:(id)a3;
- (BOOL)allowsOldFormatFile;
- (BOOL)skipsMaliciousScanning;
- (NSString)sourceApplication;
- (NSString)suggestedName;
- (NSURL)extractingURL;
- (WFFileRepresentation)extractingFile;
- (WFShortcutExtractor)initWithFile:(id)a3 allowsOldFormatFile:(BOOL)a4 skipsMaliciousScanning:(BOOL)a5 suggestedName:(id)a6 sourceApplication:(id)a7;
- (WFShortcutExtractor)initWithFile:(id)a3 allowsOldFormatFile:(BOOL)a4 suggestedName:(id)a5 sourceApplication:(id)a6;
- (WFShortcutExtractor)initWithFile:(id)a3 suggestedName:(id)a4 sourceApplication:(id)a5;
- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 fileAdoptionOptions:(int64_t)a5 suggestedName:(id)a6 sourceApplication:(id)a7;
- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 skipsMaliciousScanning:(BOOL)a5 fileAdoptionOptions:(int64_t)a6 suggestedName:(id)a7 sourceApplication:(id)a8;
- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 skipsMaliciousScanning:(BOOL)a5 suggestedName:(id)a6 sourceApplication:(id)a7;
- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 suggestedName:(id)a5 sourceApplication:(id)a6;
- (WFShortcutExtractor)initWithURL:(id)a3 fileAdoptionOptions:(int64_t)a4 suggestedName:(id)a5 sourceApplication:(id)a6;
- (WFShortcutExtractor)initWithURL:(id)a3 suggestedName:(id)a4 sourceApplication:(id)a5;
- (int64_t)fileAdoptionOptions;
- (void)extractRemoteShortcutFileAtURL:(id)a3 completion:(id)a4;
- (void)extractShortcutFile:(id)a3 completion:(id)a4;
- (void)extractShortcutWithCompletion:(id)a3;
- (void)extractSignedShortcutFile:(id)a3 allowsRetryIfExpired:(BOOL)a4 completion:(id)a5;
- (void)extractSignedShortcutFile:(id)a3 completion:(id)a4;
- (void)extractWorkflowFile:(id)a3 completion:(id)a4;
- (void)extractWorkflowFile:(id)a3 shortcutName:(id)a4 shortcutFileContentType:(int64_t)a5 iCloudIdentifier:(id)a6 completion:(id)a7;
@end

@implementation WFShortcutExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractingFile, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_extractingURL, 0);
}

- (WFFileRepresentation)extractingFile
{
  return self->_extractingFile;
}

- (int64_t)fileAdoptionOptions
{
  return self->_fileAdoptionOptions;
}

- (BOOL)skipsMaliciousScanning
{
  return self->_skipsMaliciousScanning;
}

- (BOOL)allowsOldFormatFile
{
  return self->_allowsOldFormatFile;
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (NSURL)extractingURL
{
  return self->_extractingURL;
}

- (void)extractWorkflowFile:(id)a3 shortcutName:(id)a4 shortcutFileContentType:(int64_t)a5 iCloudIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  v14 = (void (**)(id, void *, void))a7;
  id v15 = a4;
  v16 = [WFWorkflowFileDescriptor alloc];
  v17 = [(WFShortcutExtractor *)self sourceApplication];
  v31 = v12;
  v18 = [(WFWorkflowFileDescriptor *)v16 initWithFile:v12 name:v15 sourceAppIdentifier:v17];

  id v36 = 0;
  v19 = [[WFWorkflowFile alloc] initWithDescriptor:v18 error:&v36];
  id v20 = v36;
  id v35 = v20;
  v21 = [(WFWorkflowFile *)v19 recordRepresentationWithError:&v35];
  id v22 = v35;

  if ((unint64_t)(a5 - 1) > 2) {
    v23 = @"ShortcutSourceUnknown";
  }
  else {
    v23 = *(&off_1E6550CC0 + a5 - 1);
  }
  [v21 setSource:v23];
  if (v21)
  {
    id v30 = v22;
    v24 = [WFExtractShortcutResult alloc];
    v25 = [(WFShortcutExtractor *)self sourceApplication];
    v26 = [v31 creationDate];
    v27 = [(WFExtractShortcutResult *)v24 initWithRecord:v21 fileContentType:a5 iCloudIdentifier:v13 sourceApplicationIdentifier:v25 sharedDate:v26];

    if ([(WFShortcutExtractor *)self skipsMaliciousScanning])
    {
      v14[2](v14, v27, 0);
    }
    else
    {
      v28 = [[WFWorkflowRemoteQuarantineRequest alloc] initWithWorkflowRecord:v21];
      v29 = +[WFRemoteQuarantinePolicyEvaluator sharedEvaluator];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __108__WFShortcutExtractor_extractWorkflowFile_shortcutName_shortcutFileContentType_iCloudIdentifier_completion___block_invoke;
      v32[3] = &unk_1E6557E58;
      v34 = v14;
      v33 = v27;
      [v29 evaluatePolicyForRequest:v28 completion:v32];
    }
    id v22 = v30;
  }
  else
  {
    ((void (**)(id, void *, id))v14)[2](v14, 0, v22);
  }
}

uint64_t __108__WFShortcutExtractor_extractWorkflowFile_shortcutName_shortcutFileContentType_iCloudIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)extractWorkflowFile:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = getWFGeneralLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[WFShortcutExtractor extractWorkflowFile:completion:]";
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Extracting an old shortcut format file", (uint8_t *)&v12, 0xCu);
  }

  if (VCIsInternalBuild()
    && +[WFSharingSettings shortcutFileSharingEnabled]
    || [(WFShortcutExtractor *)self allowsOldFormatFile])
  {
    uint64_t v9 = [(WFShortcutExtractor *)self suggestedName];
    if (v9)
    {
      v10 = (void *)v9;
      [(WFShortcutExtractor *)self extractWorkflowFile:v6 shortcutName:v9 shortcutFileContentType:0 iCloudIdentifier:0 completion:v7];
    }
    else
    {
      v11 = [v6 wfName];
      [(WFShortcutExtractor *)self extractWorkflowFile:v6 shortcutName:v11 shortcutFileContentType:0 iCloudIdentifier:0 completion:v7];

      v10 = 0;
    }
  }
  else
  {
    v10 = +[WFSharingSettings shortcutFileSharingDisabledError];
    v7[2](v7, 0, v10);
  }
}

- (void)extractSignedShortcutFile:(id)a3 allowsRetryIfExpired:(BOOL)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = getWFGeneralLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[WFShortcutExtractor extractSignedShortcutFile:allowsRetryIfExpired:completion:]";
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Extracting a signed shortcut format file", buf, 0xCu);
  }

  v10 = [WFShortcutPackageFile alloc];
  v11 = [v7 fileURL];
  int v12 = [(WFShortcutPackageFile *)v10 initWithSignedShortcutFileURL:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__WFShortcutExtractor_extractSignedShortcutFile_allowsRetryIfExpired_completion___block_invoke;
  v15[3] = &unk_1E6550CA0;
  id v16 = v7;
  id v17 = v8;
  v15[4] = self;
  id v13 = v7;
  id v14 = v8;
  [(WFShortcutPackageFile *)v12 extractShortcutFileRepresentationWithCompletion:v15];
}

void __81__WFShortcutExtractor_extractSignedShortcutFile_allowsRetryIfExpired_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  int v12 = v11;
  if (a3 == 1)
  {
    if (!v9)
    {
      int IsExpiredCertificateError = WFErrorIsExpiredCertificateError(v11);
      if (!v10 || !IsExpiredCertificateError)
      {
LABEL_6:
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_18;
      }
      id v14 = getWFGeneralLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[WFShortcutExtractor extractSignedShortcutFile:allowsRetryIfExpired:completion:]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEFAULT, "%s Found an iCloud Signed Shortcut File with expired certificate. Trying to download a new one from iCloud", buf, 0xCu);
      }

      id v15 = +[WFGallerySessionManager sharedManager];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __81__WFShortcutExtractor_extractSignedShortcutFile_allowsRetryIfExpired_completion___block_invoke_238;
      v22[3] = &unk_1E6550C78;
      id v25 = *(id *)(a1 + 48);
      id v16 = v12;
      uint64_t v17 = *(void *)(a1 + 32);
      id v23 = v16;
      uint64_t v24 = v17;
      id v18 = (id)[v15 getWorkflowForIdentifier:v10 completionHandler:v22];
    }
    a3 = 1;
  }
  else
  {
    if (a3 != 3 && a3 != 2) {
      a3 = -1;
    }
    if (!v9) {
      goto LABEL_6;
    }
  }
  v19 = *(void **)(a1 + 32);
  uint64_t v20 = [v19 suggestedName];
  if (v20)
  {
    [v19 extractWorkflowFile:v9 shortcutName:v20 shortcutFileContentType:a3 iCloudIdentifier:v10 completion:*(void *)(a1 + 48)];
  }
  else
  {
    v21 = [*(id *)(a1 + 40) wfName];
    [v19 extractWorkflowFile:v9 shortcutName:v21 shortcutFileContentType:a3 iCloudIdentifier:v10 completion:*(void *)(a1 + 48)];
  }
LABEL_18:
}

void __81__WFShortcutExtractor_extractSignedShortcutFile_allowsRetryIfExpired_completion___block_invoke_238(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v5;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;
  id v9 = [v8 signedShortcutFile];

  if (v9)
  {
    id v10 = *(void **)(a1 + 40);
    id v11 = [v8 signedShortcutFile];
    [v10 extractSignedShortcutFile:v11 allowsRetryIfExpired:0 completion:*(void *)(a1 + 48)];
  }
  else
  {
    int v12 = getWFGeneralLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      id v14 = "-[WFShortcutExtractor extractSignedShortcutFile:allowsRetryIfExpired:completion:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to download a renewed iCloud Signed Shortcut File", (uint8_t *)&v13, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)extractSignedShortcutFile:(id)a3 completion:(id)a4
{
}

- (void)extractShortcutFile:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = getWFGeneralLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[WFShortcutExtractor extractShortcutFile:completion:]";
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Extracting a shortcut from file", (uint8_t *)&v16, 0xCu);
  }

  id v9 = [v6 mappedData];
  if ((unint64_t)[v9 length] > 3)
  {
    id v11 = NSString;
    int v12 = objc_msgSend(v9, "subdataWithRange:", 0, 4);
    id v10 = objc_msgSend(v11, "wf_stringWithData:", v12);

    if ([v10 isEqualToString:@"AEA1"])
    {
      [(WFShortcutExtractor *)self extractSignedShortcutFile:v6 completion:v7];
    }
    else
    {
      int v13 = [v6 wfType];
      BOOL v14 = +[WFShortcutExtractor isShortcutFileType:v13];

      if (v14)
      {
        [(WFShortcutExtractor *)self extractWorkflowFile:v6 completion:v7];
      }
      else
      {
        uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
        v7[2](v7, 0, v15);
      }
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    v7[2](v7, 0, v10);
  }
}

- (void)extractRemoteShortcutFileAtURL:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F290E0];
  id v8 = a3;
  id v9 = objc_msgSend(v7, "wf_sharedSession");
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __65__WFShortcutExtractor_extractRemoteShortcutFileAtURL_completion___block_invoke;
  int v16 = &unk_1E6550C50;
  uint64_t v17 = self;
  id v18 = v6;
  id v10 = v6;
  id v11 = [v9 downloadTaskWithURL:v8 completionHandler:&v13];

  int v12 = getWFGeneralLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[WFShortcutExtractor extractRemoteShortcutFileAtURL:completion:]";
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s Downloading a remote shortcut file", buf, 0xCu);
  }

  objc_msgSend(v11, "resume", v13, v14, v15, v16, v17);
}

void __65__WFShortcutExtractor_extractRemoteShortcutFileAtURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7
    && (id v10 = (void *)MEMORY[0x1E4F5A900],
        [v8 suggestedFilename],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v10 fileWithURL:v7 options:3 ofType:0 proposedFilename:v11],
        int v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    [*(id *)(a1 + 32) extractShortcutFile:v12 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F289A0];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v15 = WFLocalizedString(@"The shortcut could not be downloaded.");
    v18[0] = v15;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    int v12 = [v13 errorWithDomain:v14 code:-1100 userInfo:v16];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)extractShortcutWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, void *))a3;
  id v5 = getWFGeneralLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    id v18 = "-[WFShortcutExtractor extractShortcutWithCompletion:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Start extracting a shortcut from file", (uint8_t *)&v17, 0xCu);
  }

  id v6 = [(WFShortcutExtractor *)self extractingURL];
  char v7 = [v6 isFileURL];

  if (v7)
  {
    id v8 = [(WFShortcutExtractor *)self extractingFile];

    if (v8)
    {
      id v9 = getWFGeneralLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        id v18 = "-[WFShortcutExtractor extractShortcutWithCompletion:]";
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Found a shortcut file URL", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      int v12 = (void *)MEMORY[0x1E4F5A900];
      uint64_t v13 = [(WFShortcutExtractor *)self extractingURL];
      objc_msgSend(v12, "fileWithURL:options:", v13, -[WFShortcutExtractor fileAdoptionOptions](self, "fileAdoptionOptions"));
      uint64_t v14 = (WFFileRepresentation *)objc_claimAutoreleasedReturnValue();
      extractingFile = self->_extractingFile;
      self->_extractingFile = v14;

      int v16 = [(WFShortcutExtractor *)self extractingFile];

      if (!v16)
      {
        id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
        v4[2](v4, 0, v11);
        goto LABEL_13;
      }
    }
    id v11 = [(WFShortcutExtractor *)self extractingFile];
    [(WFShortcutExtractor *)self extractShortcutFile:v11 completion:v4];
  }
  else
  {
    id v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      id v18 = "-[WFShortcutExtractor extractShortcutWithCompletion:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Found a remote shortcut URL", (uint8_t *)&v17, 0xCu);
    }

    id v11 = [(WFShortcutExtractor *)self extractingURL];
    [(WFShortcutExtractor *)self extractRemoteShortcutFileAtURL:v11 completion:v4];
  }
LABEL_13:
}

- (WFShortcutExtractor)initWithFile:(id)a3 allowsOldFormatFile:(BOOL)a4 skipsMaliciousScanning:(BOOL)a5 suggestedName:(id)a6 sourceApplication:(id)a7
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if (!v14)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"WFShortcutExtractor.m", 133, @"Invalid parameter not satisfying: %@", @"extractingFile" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)WFShortcutExtractor;
  int v17 = [(WFShortcutExtractor *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v14 fileURL];
    extractingURL = v17->_extractingURL;
    v17->_extractingURL = (NSURL *)v18;

    objc_storeStrong((id *)&v17->_extractingFile, a3);
    v17->_allowsOldFormatFile = a4;
    v17->_skipsMaliciousScanning = a5;
    uint64_t v20 = [v15 copy];
    suggestedName = v17->_suggestedName;
    v17->_suggestedName = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    sourceApplication = v17->_sourceApplication;
    v17->_sourceApplication = (NSString *)v22;

    uint64_t v24 = v17;
  }

  return v17;
}

- (WFShortcutExtractor)initWithFile:(id)a3 allowsOldFormatFile:(BOOL)a4 suggestedName:(id)a5 sourceApplication:(id)a6
{
  return [(WFShortcutExtractor *)self initWithFile:a3 allowsOldFormatFile:a4 skipsMaliciousScanning:0 suggestedName:a5 sourceApplication:a6];
}

- (WFShortcutExtractor)initWithFile:(id)a3 suggestedName:(id)a4 sourceApplication:(id)a5
{
  return [(WFShortcutExtractor *)self initWithFile:a3 allowsOldFormatFile:0 suggestedName:a4 sourceApplication:a5];
}

- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 skipsMaliciousScanning:(BOOL)a5 fileAdoptionOptions:(int64_t)a6 suggestedName:(id)a7 sourceApplication:(id)a8
{
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  if (!v16)
  {
    objc_super v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"WFShortcutExtractor.m", 108, @"Invalid parameter not satisfying: %@", @"extractingURL" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)WFShortcutExtractor;
  uint64_t v19 = [(WFShortcutExtractor *)&v28 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_extractingURL, a3);
    v20->_allowsOldFormatFile = a4;
    v20->_skipsMaliciousScanning = a5;
    v20->_fileAdoptionOptions = a6;
    uint64_t v21 = [v17 copy];
    suggestedName = v20->_suggestedName;
    v20->_suggestedName = (NSString *)v21;

    uint64_t v23 = [v18 copy];
    sourceApplication = v20->_sourceApplication;
    v20->_sourceApplication = (NSString *)v23;

    id v25 = v20;
  }

  return v20;
}

- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 skipsMaliciousScanning:(BOOL)a5 suggestedName:(id)a6 sourceApplication:(id)a7
{
  return [(WFShortcutExtractor *)self initWithURL:a3 allowsOldFormatFile:a4 skipsMaliciousScanning:a5 fileAdoptionOptions:0 suggestedName:a6 sourceApplication:a7];
}

- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 fileAdoptionOptions:(int64_t)a5 suggestedName:(id)a6 sourceApplication:(id)a7
{
  return [(WFShortcutExtractor *)self initWithURL:a3 allowsOldFormatFile:a4 skipsMaliciousScanning:0 fileAdoptionOptions:a5 suggestedName:a6 sourceApplication:a7];
}

- (WFShortcutExtractor)initWithURL:(id)a3 allowsOldFormatFile:(BOOL)a4 suggestedName:(id)a5 sourceApplication:(id)a6
{
  return [(WFShortcutExtractor *)self initWithURL:a3 allowsOldFormatFile:a4 skipsMaliciousScanning:0 fileAdoptionOptions:0 suggestedName:a5 sourceApplication:a6];
}

- (WFShortcutExtractor)initWithURL:(id)a3 fileAdoptionOptions:(int64_t)a4 suggestedName:(id)a5 sourceApplication:(id)a6
{
  return [(WFShortcutExtractor *)self initWithURL:a3 allowsOldFormatFile:0 fileAdoptionOptions:a4 suggestedName:a5 sourceApplication:a6];
}

- (WFShortcutExtractor)initWithURL:(id)a3 suggestedName:(id)a4 sourceApplication:(id)a5
{
  return [(WFShortcutExtractor *)self initWithURL:a3 allowsOldFormatFile:0 fileAdoptionOptions:0 suggestedName:a4 sourceApplication:a5];
}

+ (BOOL)isShortcutFileType:(id)a3
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"com.apple.shortcut";
  v8[1] = @"com.apple.shortcuts.workflow-file";
  v8[2] = @"is.workflow.my.workflow";
  v8[3] = @"is.workflow.workflow";
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:v8 count:4];
  id v6 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_25019);
  LOBYTE(v3) = [v4 conformsToUTTypes:v6];

  return (char)v3;
}

uint64_t __42__WFShortcutExtractor_isShortcutFileType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
}

@end