@interface SFQuickLookDocument
+ (BOOL)_hasSuitableApplicationForOpeningDocument:(id)a3;
+ (id)properFilenameForOriginalFilename:(id)a3 typeIdentifier:(id)a4 mimeType:(id)a5 sourceURL:(id)a6;
- (BOOL)needsQuickLookDocumentView;
- (BOOL)shouldUnzipByUIDocumentInteractionController;
- (LSDocumentProxy)documentProxy;
- (NSString)fileName;
- (NSString)inferredUTI;
- (NSString)localizedType;
- (NSString)mimeType;
- (NSString)savedPath;
- (NSString)savedPathWithProperExtension;
- (NSString)uti;
- (NSURL)savedURLWithProperExtension;
- (NSURL)sourceURL;
- (SFQuickLookDocument)initWithFileName:(id)a3 mimeType:(id)a4 uti:(id)a5 needsQuickLookDocumentView:(BOOL)a6;
- (SFQuickLookDocumentSource)documentSource;
- (unint64_t)fileSize;
- (void)_deleteSavedPathIfNecessary;
- (void)_deleteSavedPathWithProperExtensionIfNecessary;
- (void)addQuickLookPrintSettingsToPrintInfo:(id)a3;
- (void)dealloc;
- (void)fileName;
- (void)fileSize;
- (void)saveToFileIfNeeded;
- (void)setDocumentSource:(id)a3;
- (void)setFileNameForPDFDocument:(id)a3;
- (void)setSavedPath:(id)a3 shouldDelete:(BOOL)a4;
- (void)setSavedPathWithProperExtension:(id)a3 shouldDelete:(BOOL)a4;
- (void)setSourceURL:(id)a3;
@end

@implementation SFQuickLookDocument

+ (id)properFilenameForOriginalFilename:(id)a3 typeIdentifier:(id)a4 mimeType:(id)a5 sourceURL:(id)a6
{
  id v9 = a3;
  v10 = (__CFString *)a4;
  v11 = (__CFString *)a5;
  id v12 = a6;
  v13 = [v9 pathExtension];
  uint64_t v14 = [@"zip" compare:v13 options:9];

  v15 = objc_msgSend(v9, "safari_lastPathComponentWithoutZipExtension");
  v16 = [v15 pathExtension];

  uint64_t v17 = [(__CFString *)v16 length];
  v18 = (CFStringRef *)MEMORY[0x1E4F224F8];
  if (!v17)
  {
LABEL_12:
    if (v11)
    {
      CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F22500], v11, 0);
      v25 = (__CFString *)PreferredIdentifierForTag;
      if (PreferredIdentifierForTag) {
        v20 = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, *v18);
      }
      else {
        v20 = 0;
      }

      if (!v10) {
        goto LABEL_21;
      }
    }
    else
    {
      v20 = 0;
      if (!v10) {
        goto LABEL_21;
      }
    }
    if (!v20) {
      v20 = (__CFString *)UTTypeCopyPreferredTagWithClass(v10, *v18);
    }
LABEL_21:
    if (v20)
    {
      if (([(__CFString *)v16 isEqualToString:v20] & 1) == 0)
      {
        uint64_t v26 = [@"zip" compare:v20 options:9];
        if (v14 | v26)
        {
          if (v14)
          {
            v27 = [v9 pathExtension];
            uint64_t v28 = [v27 length];

            if (v28 && !v26)
            {
              v22 = objc_msgSend(MEMORY[0x1E4F22430], "sf_documentProxyForName:type:MIMEType:sourceURL:", v9, 0, 0, v12);
              if (v22
                && +[SFQuickLookDocument _hasSuitableApplicationForOpeningDocument:v22])
              {
                goto LABEL_36;
              }
            }
            id v29 = v9;
          }
          else
          {
            id v30 = v9;
            uint64_t v31 = [v30 stringByDeletingPathExtension];

            id v29 = (id)v31;
          }
          v23 = [v29 stringByAppendingPathExtension:v20];

          if (v14)
          {
            v22 = v9;
            id v9 = v23;
LABEL_36:

            goto LABEL_37;
          }
          [(__CFString *)v23 stringByAppendingPathExtension:@"zip"];
          v22 = v9;
          id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

          goto LABEL_36;
        }
      }
    }
    goto LABEL_37;
  }
  CFStringRef v19 = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v16, 0);
  v20 = (__CFString *)v19;
  if (!v19) {
    goto LABEL_11;
  }
  if (v11)
  {
    CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F22500];
    v22 = (void *)UTTypeCopyPreferredTagWithClass(v19, (CFStringRef)*MEMORY[0x1E4F22500]);
    if (v22 && ![(__CFString *)v11 compare:v22 options:9]) {
      goto LABEL_36;
    }
    v23 = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v21, v11, 0);
    if (v23 && UTTypeConformsTo(v20, v23)) {
      goto LABEL_35;
    }
  }
  if (!v10 || !UTTypeConformsTo(v20, v10))
  {
LABEL_11:

    goto LABEL_12;
  }
LABEL_37:

  return v9;
}

+ (BOOL)_hasSuitableApplicationForOpeningDocument:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F224A8];
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F224A8]];
  v6 = [v3 applicationsAvailableForOpeningWithHandlerRanks:v5 error:0];
  v7 = [v6 objectForKeyedSubscript:v4];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (SFQuickLookDocument)initWithFileName:(id)a3 mimeType:(id)a4 uti:(id)a5 needsQuickLookDocumentView:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFQuickLookDocument;
  uint64_t v14 = [(SFQuickLookDocument *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fileName, a3);
    objc_storeStrong((id *)&v15->_mimeType, a4);
    objc_storeStrong((id *)&v15->_uti, a5);
    v15->_needsQuickLookDocumentView = a6;
    v16 = v15;
  }

  return v15;
}

- (void)dealloc
{
  [(SFQuickLookDocument *)self _deleteSavedPathIfNecessary];
  [(SFQuickLookDocument *)self _deleteSavedPathWithProperExtensionIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)SFQuickLookDocument;
  [(SFQuickLookDocument *)&v3 dealloc];
}

- (NSString)fileName
{
  fileName = self->_fileName;
  if (!fileName)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SFQuickLookDocument *)v4 fileName];
    }
    fileName = self->_fileName;
  }

  return fileName;
}

- (void)setFileNameForPDFDocument:(id)a3
{
  id v5 = a3;
  fileName = self->_fileName;
  p_fileName = &self->_fileName;
  uint64_t v6 = fileName;
  if (fileName)
  {
    if (![(NSString *)v6 isEqualToString:v5])
    {
      uint64_t v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SFQuickLookDocument setFileNameForPDFDocument:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else
  {
    objc_storeStrong((id *)p_fileName, a3);
  }
}

- (unint64_t)fileSize
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(SFQuickLookDocument *)self savedPath];
  objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  uint64_t v4 = [v3 attributesOfItemAtPath:v2 error:&v12];
  id v5 = v12;

  if (v5)
  {
    uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      [(SFQuickLookDocument *)v7 fileSize];
    }
  }
  if (v4)
  {
    uint64_t v8 = objc_msgSend(v4, "safari_numberForKey:", *MEMORY[0x1E4F28390]);
    uint64_t v9 = v8;
    if (v8) {
      unint64_t v10 = [v8 unsignedLongLongValue];
    }
    else {
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)_deleteSavedPathIfNecessary
{
  if (self->_shouldDeleteSavedPath)
  {
    id v2 = [(SFQuickLookDocument *)self savedPath];
    if (v2)
    {
      objc_super v3 = dispatch_get_global_queue(-2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__SFQuickLookDocument__deleteSavedPathIfNecessary__block_invoke;
      block[3] = &unk_1E54EB768;
      id v5 = v2;
      dispatch_async(v3, block);
    }
  }
}

void __50__SFQuickLookDocument__deleteSavedPathIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v2, "_web_removeFileOnlyAtPath:", *(void *)(a1 + 32));
}

- (void)_deleteSavedPathWithProperExtensionIfNecessary
{
  if (self->_shouldDeleteSavedPathWithProperExtension)
  {
    id v2 = [(SFQuickLookDocument *)self savedPathWithProperExtension];
    if (v2)
    {
      objc_super v3 = dispatch_get_global_queue(-2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__SFQuickLookDocument__deleteSavedPathWithProperExtensionIfNecessary__block_invoke;
      block[3] = &unk_1E54EB768;
      id v5 = v2;
      dispatch_async(v3, block);
    }
  }
}

void __69__SFQuickLookDocument__deleteSavedPathWithProperExtensionIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v2, "_web_removeFileOnlyAtPath:", *(void *)(a1 + 32));
}

- (NSString)inferredUTI
{
  uti = self->_uti;
  if (uti)
  {
    CFStringRef PreferredIdentifierForTag = uti;
  }
  else
  {
    CFStringRef PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F22500], (CFStringRef)self->_mimeType, 0);
    if (!PreferredIdentifierForTag)
    {
      id v5 = [(SFQuickLookDocument *)self savedPathWithProperExtension];
      uint64_t v6 = v5;
      if (v5)
      {
        id v7 = v5;
      }
      else
      {
        id v7 = [(SFQuickLookDocument *)self fileName];
      }
      uint64_t v8 = v7;

      uint64_t v9 = [v8 pathExtension];
      CFStringRef PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v9, 0);
    }
  }

  return (NSString *)PreferredIdentifierForTag;
}

- (NSString)localizedType
{
  CFStringRef mimeType = (const __CFString *)self->_mimeType;
  if (!mimeType
    || (CFStringRef PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F22500], mimeType, 0), v5 = (void *)UTTypeCopyDescription(PreferredIdentifierForTag), PreferredIdentifierForTag, !v5))
  {
    CFStringRef uti = (const __CFString *)self->_uti;
    if (!uti || (id v5 = (void *)UTTypeCopyDescription(uti)) == 0)
    {
      id v5 = _WBSLocalizedString();
    }
  }

  return (NSString *)v5;
}

- (LSDocumentProxy)documentProxy
{
  documentProxy = self->_documentProxy;
  if (!documentProxy)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F22430];
    id v5 = [(SFQuickLookDocument *)self fileName];
    uint64_t v6 = [(SFQuickLookDocument *)self uti];
    id v7 = [(SFQuickLookDocument *)self mimeType];
    objc_msgSend(v4, "sf_documentProxyForName:type:MIMEType:sourceURL:", v5, v6, v7, self->_sourceURL);
    uint64_t v8 = (LSDocumentProxy *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_documentProxy;
    self->_documentProxy = v8;

    documentProxy = self->_documentProxy;
  }

  return documentProxy;
}

- (NSString)savedPathWithProperExtension
{
  savedPathWithProperExtension = self->_savedPathWithProperExtension;
  if (savedPathWithProperExtension)
  {
    objc_super v3 = savedPathWithProperExtension;
  }
  else
  {
    id v5 = [(SFQuickLookDocument *)self savedPath];
    uint64_t v6 = [v5 lastPathComponent];
    if (v6)
    {
      id v7 = +[SFQuickLookDocument properFilenameForOriginalFilename:v6 typeIdentifier:self->_uti mimeType:self->_mimeType sourceURL:self->_sourceURL];
      uint64_t v8 = [v5 stringByDeletingLastPathComponent];
      uint64_t v9 = [v8 stringByAppendingPathComponent:v7];

      if ([v7 isEqualToString:v6])
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v12 = objc_msgSend(v11, "_web_pathWithUniqueFilenameForPath:", v9);
        if (v12 && ([v11 linkItemAtPath:v5 toPath:v12 error:0] & 1) != 0)
        {
          uint64_t v10 = 1;
        }
        else
        {
          id v13 = v5;

          uint64_t v10 = 0;
          uint64_t v9 = v13;
        }
      }
      [(SFQuickLookDocument *)self setSavedPathWithProperExtension:v9 shouldDelete:v10];
      objc_super v3 = self->_savedPathWithProperExtension;
    }
    else
    {
      objc_super v3 = 0;
    }
  }

  return v3;
}

- (NSURL)savedURLWithProperExtension
{
  id v2 = [(SFQuickLookDocument *)self savedPathWithProperExtension];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
  }
  else
  {
    objc_super v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)saveToFileIfNeeded
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Failed to write QuickLook file to disk: %{public}@", buf, 0xCu);
}

- (void)setSavedPath:(id)a3 shouldDelete:(BOOL)a4
{
  id v7 = a3;
  [(SFQuickLookDocument *)self _deleteSavedPathIfNecessary];
  objc_storeStrong((id *)&self->_savedPath, a3);
  self->_shouldDeleteSavedPath = a4;
  [(SFQuickLookDocument *)self setSavedPathWithProperExtension:0 shouldDelete:0];
}

- (void)setSavedPathWithProperExtension:(id)a3 shouldDelete:(BOOL)a4
{
  uint64_t v6 = (NSString *)a3;
  [(SFQuickLookDocument *)self _deleteSavedPathWithProperExtensionIfNecessary];
  savedPathWithProperExtension = self->_savedPathWithProperExtension;
  self->_savedPathWithProperExtension = v6;

  self->_shouldDeleteSavedPathWithProperExtension = a4;
}

- (void)addQuickLookPrintSettingsToPrintInfo:(id)a3
{
  id v6 = a3;
  int v4 = [getQLPreviewConverterClass() isIWorkDocumentType:self->_uti];
  if (v4) {
    [v6 setScaleUp:1];
  }
  int v5 = [getQLPreviewConverterClass() isSpreadSheetDocumentType:self->_uti];
  if (UTTypeConformsTo((CFStringRef)self->_uti, @"public.presentation") || (v4 & v5) != 0) {
    [v6 setOrientation:1];
  }
}

- (BOOL)shouldUnzipByUIDocumentInteractionController
{
  id v2 = [(SFQuickLookDocument *)self fileName];
  objc_super v3 = [v2 pathExtension];

  if ((objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", @"playground") & 1) != 0
    || (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", @"playgroundbook") & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", @"band");
  }

  return v4;
}

- (BOOL)needsQuickLookDocumentView
{
  return self->_needsQuickLookDocumentView;
}

- (NSString)savedPath
{
  return self->_savedPath;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSString)uti
{
  return self->_uti;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (SFQuickLookDocumentSource)documentSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentSource);

  return (SFQuickLookDocumentSource *)WeakRetained;
}

- (void)setDocumentSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_documentSource);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_savedPath, 0);
  objc_storeStrong((id *)&self->_savedPathWithProperExtension, 0);
  objc_storeStrong((id *)&self->_fileName, 0);

  objc_storeStrong((id *)&self->_documentProxy, 0);
}

- (void)fileName
{
}

- (void)setFileNameForPDFDocument:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)fileSize
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Error reading file attributes to calculate file size: %{public}@", buf, 0xCu);
}

@end