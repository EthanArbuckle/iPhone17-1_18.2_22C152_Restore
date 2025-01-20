@interface ICAttachment(LinkPresentation)
- (BOOL)alwaysUsesSmallSize;
- (BOOL)usesLinkPresentation;
- (id)archiveLinkmetadata:()LinkPresentation;
- (id)fallbackMapMetadata;
- (id)fallbackRemoteAttachmentMetadata;
- (id)fallbackWebMetadata;
- (id)fileMetadata;
- (id)filePreviewGenerationQueue;
- (id)loadingAttachmentsMetadata;
- (id)lpImageFromFallbackPDF;
- (id)lpImageFromPreviewImage:()LinkPresentation;
- (id)mapPreviewGenerationQueue;
- (id)plainURLMetadata;
- (id)retrieveLinkMetadata;
- (id)scannedDocumentsMetadata;
- (id)webPreviewGenerationQueue;
- (uint64_t)metadataExists;
- (void)addPreviewImageToMetadata:()LinkPresentation;
- (void)persistLinkMetadata:()LinkPresentation;
- (void)requestFileMetadataIfNecessary;
- (void)requestRemoteMetadata;
- (void)retrieveLinkMetadata;
@end

@implementation ICAttachment(LinkPresentation)

- (id)retrieveLinkMetadata
{
  objc_initWeak(&location, val);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__51;
  v26 = __Block_byref_object_dispose__51;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__51;
  v20 = __Block_byref_object_dispose__51;
  id v21 = 0;
  v2 = [val managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__ICAttachment_LinkPresentation__retrieveLinkMetadata__block_invoke;
  v14[3] = &unk_1E5FDD380;
  objc_copyWeak(&v15, &location);
  v14[4] = val;
  v14[5] = &v22;
  v14[6] = &v16;
  [v2 performBlockAndWait:v14];

  if (v23[5])
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    getLPLinkMetadataClass();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = v23[5];
    id v13 = 0;
    v6 = [v3 unarchivedObjectOfClass:v4 fromData:v5 error:&v13];
    id v7 = v13;
    if (v7)
    {
      v8 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(ICAttachment(LinkPresentation) *)(uint64_t)v7 retrieveLinkMetadata];
      }
    }
    v9 = [v6 specialization];
    getLPFileMetadataClass();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v11 = [v6 specialization];
      [v11 setName:v17[5]];
    }
  }
  else
  {
    v6 = 0;
  }
  objc_destroyWeak(&v15);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&location);
  return v6;
}

- (void)persistLinkMetadata:()LinkPresentation
{
  v2 = objc_msgSend(a1, "archiveLinkmetadata:");
  v3 = [a1 managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ICAttachment_LinkPresentation__persistLinkMetadata___block_invoke;
  v5[3] = &unk_1E5FD91D0;
  v5[4] = a1;
  id v6 = v2;
  id v4 = v2;
  [v3 performBlockAndWait:v5];
}

- (uint64_t)metadataExists
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, val);
  v2 = [val managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__ICAttachment_LinkPresentation__metadataExists__block_invoke;
  v5[3] = &unk_1E5FDAB80;
  objc_copyWeak(&v6, &location);
  v5[4] = &v8;
  [v2 performBlockAndWait:v5];

  uint64_t v3 = *((unsigned __int8 *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return v3;
}

- (BOOL)usesLinkPresentation
{
  unsigned int v2 = [a1 attachmentType];
  BOOL result = 1;
  if (v2 <= 0xF)
  {
    if (((1 << v2) & 0x362B) != 0)
    {
      return 0;
    }
    else
    {
      int v4 = 1 << v2;
      if ((v4 & 0x840) != 0) {
        return [a1 preferredViewSize] == 1;
      }
      else {
        return (v4 & 0xC000) == 0;
      }
    }
  }
  return result;
}

- (BOOL)alwaysUsesSmallSize
{
  return [a1 attachmentType] == 2 || objc_msgSend(a1, "attachmentType") == 4;
}

- (void)addPreviewImageToMetadata:()LinkPresentation
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a1, "attachmentPreviewImageWithMinSize:scale:", 192.0, 192.0, 1.0);
    if (v5)
    {
      id v6 = [a1 lpImageFromPreviewImage:v5];
      [v4 setImage:v6];
    }
  }
  else
  {
    id v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICAttachment(LinkPresentation) addPreviewImageToMetadata:](v7);
    }
  }
}

- (id)scannedDocumentsMetadata
{
  id v2 = objc_alloc_init((Class)getLPLinkMetadataClass());
  [a1 addPreviewImageToMetadata:v2];
  uint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%lu scans" value:@"%lu scans" table:0 allowSiri:1];
  objc_opt_class();
  id v4 = [a1 attachmentModel];
  uint64_t v5 = ICDynamicCast();

  if (v5)
  {
    uint64_t v6 = [v5 subAttachmentCount];
  }
  else
  {
    objc_opt_class();
    id v7 = [a1 attachmentModel];
    uint64_t v8 = ICDynamicCast();
    uint64_t v6 = [v8 paperPageCount];
  }
  v9 = [a1 title];
  [v2 setTitle:v9];

  uint64_t v10 = objc_msgSend(NSString, "localizedStringWithFormat:", v3, v6);
  [v2 setSummary:v10];

  return v2;
}

- (id)fileMetadata
{
  id v2 = objc_alloc_init((Class)getLPLinkMetadataClass());
  id v3 = objc_alloc_init((Class)getLPFileMetadataClass());
  if ([a1 hasFallbackPDF])
  {
    id v4 = [a1 lpImageFromFallbackPDF];
    [v3 setThumbnail:v4];
    uint64_t v5 = [MEMORY[0x1E4F832A0] fallbackPDFUTI];
    [v3 setType:v5];

    uint64_t v6 = [a1 fallbackPDFURL];
    id v36 = 0;
    int v7 = [v6 getResourceValue:&v36 forKey:*MEMORY[0x1E4F1C5F8] error:0];
    id v8 = v36;

    if (v7 && ([v8 floatValue], v9 != 0.0))
    {
      double v12 = v9;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1B3E9ED80]();
      char v11 = [a1 fallbackPDFData];
      double v12 = (double)(unint64_t)[v11 length];
    }
    [v3 setSize:(unint64_t)v12];
  }
  else
  {
    id v13 = [a1 previewImages];

    if (v13)
    {
      v14 = objc_msgSend(a1, "attachmentPreviewImageWithMinSize:scale:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 1.0);
      id v15 = [a1 lpImageFromPreviewImage:v14];
      [v3 setThumbnail:v15];
    }
    uint64_t v16 = [a1 typeUTI];
    [v3 setType:v16];

    objc_msgSend(v3, "setSize:", objc_msgSend(a1, "fileSize"));
  }
  v17 = [a1 title];
  [v3 setName:v17];

  uint64_t v18 = [a1 creationDate];
  [v3 setCreationDate:v18];

  [v2 setSpecialization:v3];
  if ([a1 attachmentType] == 4)
  {
    uint64_t v19 = [a1 typeUTI];
    if (v19)
    {
      v20 = (void *)v19;
      id v21 = [a1 media];
      uint64_t v22 = [v21 mediaURL];

      if (v22)
      {
        v23 = (void *)MEMORY[0x1E4F832A0];
        uint64_t v24 = [a1 typeUTI];
        v25 = [v23 mimeTypeFromUTI:v24];

        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2050000000;
        v26 = (void *)getLPAudioPropertiesClass_softClass;
        uint64_t v45 = getLPAudioPropertiesClass_softClass;
        if (!getLPAudioPropertiesClass_softClass)
        {
          uint64_t v37 = MEMORY[0x1E4F143A8];
          uint64_t v38 = 3221225472;
          v39 = __getLPAudioPropertiesClass_block_invoke;
          v40 = &unk_1E5FD95C0;
          v41 = &v42;
          __getLPAudioPropertiesClass_block_invoke((uint64_t)&v37);
          v26 = (void *)v43[3];
        }
        id v27 = v26;
        _Block_object_dispose(&v42, 8);
        id v28 = objc_alloc_init(v27);
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2050000000;
        v29 = (void *)getLPAudioClass_softClass;
        uint64_t v45 = getLPAudioClass_softClass;
        if (!getLPAudioClass_softClass)
        {
          uint64_t v37 = MEMORY[0x1E4F143A8];
          uint64_t v38 = 3221225472;
          v39 = __getLPAudioClass_block_invoke;
          v40 = &unk_1E5FD95C0;
          v41 = &v42;
          __getLPAudioClass_block_invoke((uint64_t)&v37);
          v29 = (void *)v43[3];
        }
        v30 = v29;
        _Block_object_dispose(&v42, 8);
        id v31 = [v30 alloc];
        v32 = [a1 media];
        v33 = [v32 mediaURL];
        v34 = (void *)[v31 initByReferencingFileURL:v33 MIMEType:v25 properties:v28];

        [v2 setAudio:v34];
      }
    }
  }

  return v2;
}

- (id)fallbackRemoteAttachmentMetadata
{
  if ([a1 attachmentType] == 7) {
    [a1 fallbackMapMetadata];
  }
  else {
  id v2 = [a1 fallbackWebMetadata];
  }
  return v2;
}

- (id)plainURLMetadata
{
  id v2 = objc_alloc_init((Class)getLPLinkMetadataClass());
  id v3 = [a1 URL];
  [v2 setURL:v3];

  return v2;
}

- (void)requestRemoteMetadata
{
  if ([a1 attachmentType] == 7) {
    [a1 mapPreviewGenerationQueue];
  }
  else {
  id v2 = [a1 webPreviewGenerationQueue];
  }
  objc_initWeak(&location, a1);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__ICAttachment_LinkPresentation__requestRemoteMetadata__block_invoke;
  v3[3] = &unk_1E5FDAAE0;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)loadingAttachmentsMetadata
{
  id v0 = objc_alloc_init((Class)getLPLinkMetadataClass());
  v1 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Loading…" value:@"Loading…" table:0 allowSiri:1];
  [v0 setTitle:v1];

  return v0;
}

- (void)requestFileMetadataIfNecessary
{
  if ([a1 attachmentType] != 14
    && [a1 attachmentType] != 15
    && [a1 attachmentType] != 4)
  {
    id v2 = [a1 attachmentModel];
    if ([v2 needToGeneratePreviews])
    {
      id v3 = [a1 filePreviewGenerationQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__ICAttachment_LinkPresentation__requestFileMetadataIfNecessary__block_invoke;
      block[3] = &unk_1E5FD8DF0;
      id v5 = v2;
      dispatch_async(v3, block);
    }
  }
}

- (id)lpImageFromPreviewImage:()LinkPresentation
{
  id v4 = a3;
  if (![a1 isPasswordProtected])
  {
    id v5 = [v4 previewImageURL];
    id v8 = (void *)MEMORY[0x1E4F832A0];
    float v9 = [a1 attachmentModel];
    uint64_t v10 = [v9 previewImageTypeUTI];
    uint64_t v6 = [v8 mimeTypeFromUTI:v10];

    char v11 = 0;
    if (!v5 || !v6) {
      goto LABEL_10;
    }
    uint64_t v7 = [objc_alloc((Class)getLPImageClass_0()) initByReferencingFileURL:v5 MIMEType:v6];
LABEL_9:
    char v11 = (void *)v7;
LABEL_10:

    goto LABEL_12;
  }
  if ([a1 isAuthenticated])
  {
    id v5 = [v4 decryptedImageData];
    if (!v5) {
      objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((decryptedImageData) != nil)", "-[ICAttachment(LinkPresentation) lpImageFromPreviewImage:]", 1, 0, @"Expected non-nil value for '%s'", "decryptedImageData");
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v5];
    uint64_t v7 = [objc_alloc((Class)getLPImageClass_0()) initWithPlatformImage:v6];
    goto LABEL_9;
  }
  char v11 = 0;
LABEL_12:

  return v11;
}

- (id)lpImageFromFallbackPDF
{
  id v2 = objc_alloc(MEMORY[0x1E4F38DA0]);
  id v3 = [a1 fallbackPDFData];
  id v4 = (void *)[v2 initWithData:v3];

  id v5 = [v4 pageAtIndex:0];
  [v5 boundsForBox:0];
  TSDScaleSizeWithinSize();
  id v8 = objc_msgSend(MEMORY[0x1E4F83458], "renderedImageForPage:scale:size:colorSpace:", objc_msgSend(v5, "pageRef"), TSUDeviceRGBColorSpace(), 1.0, v6, v7);
  float v9 = (void *)[objc_alloc((Class)getLPImageClass_0()) initWithPlatformImage:v8];

  return v9;
}

- (id)archiveLinkmetadata:()LinkPresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  if (v6)
  {
    double v7 = v6;
    id v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [a1 identifier];
      *(_DWORD *)buf = 138412802;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v10;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_1B08EB000, v8, OS_LOG_TYPE_ERROR, "Converting metadata %@ for attachment with identifier: %@ failed with error: %@", buf, 0x20u);
    }
    id v5 = 0;
  }
  else if (!v5)
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((archivedData) != nil)", "-[ICAttachment(LinkPresentation) archiveLinkmetadata:]", 1, 0, @"Expected non-nil value for '%s'", "archivedData");
  }

  return v5;
}

- (id)filePreviewGenerationQueue
{
  if (filePreviewGenerationQueue_onceToken != -1) {
    dispatch_once(&filePreviewGenerationQueue_onceToken, &__block_literal_global_62);
  }
  id v0 = (void *)filePreviewGenerationQueue_queue;
  return v0;
}

- (id)webPreviewGenerationQueue
{
  if (webPreviewGenerationQueue_onceToken != -1) {
    dispatch_once(&webPreviewGenerationQueue_onceToken, &__block_literal_global_41_1);
  }
  id v0 = (void *)webPreviewGenerationQueue_queue;
  return v0;
}

- (id)mapPreviewGenerationQueue
{
  if (mapPreviewGenerationQueue_onceToken != -1) {
    dispatch_once(&mapPreviewGenerationQueue_onceToken, &__block_literal_global_44);
  }
  id v0 = (void *)mapPreviewGenerationQueue_queue;
  return v0;
}

- (id)fallbackWebMetadata
{
  id v2 = objc_alloc_init((Class)getLPLinkMetadataClass());
  id v3 = [a1 URL];
  [v2 setURL:v3];

  id v4 = [a1 title];
  [v2 setTitle:v4];

  id v5 = [a1 summary];
  [v2 setSummary:v5];

  return v2;
}

- (id)fallbackMapMetadata
{
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v2 = (void *)getLPMapMetadataClass_softClass_0;
  uint64_t v14 = getLPMapMetadataClass_softClass_0;
  if (!getLPMapMetadataClass_softClass_0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getLPMapMetadataClass_block_invoke_0;
    v10[3] = &unk_1E5FD95C0;
    v10[4] = &v11;
    __getLPMapMetadataClass_block_invoke_0((uint64_t)v10);
    id v2 = (void *)v12[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v11, 8);
  id v4 = objc_alloc_init(v3);
  id v5 = [a1 title];
  [v4 setName:v5];

  id v6 = [a1 summary];
  [v4 setAddress:v6];

  id v7 = objc_alloc_init((Class)getLPLinkMetadataClass());
  [v7 setSpecialization:v4];
  id v8 = [a1 URL];
  [v7 setURL:v8];

  [v7 URL];
  return v7;
}

- (void)retrieveLinkMetadata
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "LPLinkMetadata unarchiving error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)addPreviewImageToMetadata:()LinkPresentation .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Trying to add preview images to a nil instance of LPLinkMetadata", v1, 2u);
}

@end