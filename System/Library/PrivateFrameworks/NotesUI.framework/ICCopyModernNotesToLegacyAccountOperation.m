@interface ICCopyModernNotesToLegacyAccountOperation
- (ICCopyModernNotesToLegacyAccountOperation)init;
- (ICCopyModernNotesToLegacyAccountOperation)initWithNotes:(id)a3 toFolder:(id)a4 legacyContext:(id)a5 didCopyBlock:(id)a6;
- (ICLegacyContext)legacyContext;
- (ICLegacyFolder)destinationFolder;
- (NSArray)sourceNotes;
- (id)copyNote:(id)a3 toFolder:(id)a4;
- (id)dataForAttachment:(id)a3 outFilename:(id *)a4 outMimeType:(id *)a5;
- (id)didCopyBlock;
- (id)ensureLegacyFolderIsValid:(id)a3;
- (id)htmlAttributesForAttachment:(id)a3 legacyContentID:(id)a4 tagName:(id *)a5;
- (void)main;
- (void)setDestinationFolder:(id)a3;
- (void)setDidCopyBlock:(id)a3;
- (void)setLegacyContext:(id)a3;
- (void)setSourceNotes:(id)a3;
@end

@implementation ICCopyModernNotesToLegacyAccountOperation

- (ICCopyModernNotesToLegacyAccountOperation)init
{
  return 0;
}

- (ICCopyModernNotesToLegacyAccountOperation)initWithNotes:(id)a3 toFolder:(id)a4 legacyContext:(id)a5 didCopyBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ICCopyModernNotesToLegacyAccountOperation;
  v15 = [(ICCopyModernNotesToLegacyAccountOperation *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sourceNotes, a3);
    objc_storeStrong((id *)&v16->_destinationFolder, a4);
    objc_storeStrong((id *)&v16->_legacyContext, a5);
    v17 = _Block_copy(v14);
    id didCopyBlock = v16->_didCopyBlock;
    v16->_id didCopyBlock = v17;
  }
  return v16;
}

- (void)main
{
  v3 = [(ICCopyModernNotesToLegacyAccountOperation *)self sourceNotes];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(ICCopyModernNotesToLegacyAccountOperation *)self destinationFolder];
  if (([(ICCopyModernNotesToLegacyAccountOperation *)self isCancelled] & 1) == 0)
  {
    do
    {
      if (![v4 count]) {
        break;
      }
      v6 = [v4 lastObject];
      [v4 removeLastObject];
      id v8 = v5;
      v9 = v6;
      id v7 = v6;
      performBlockOnMainThreadAndWait();
    }
    while (![(ICCopyModernNotesToLegacyAccountOperation *)self isCancelled]);
  }
}

void __49__ICCopyModernNotesToLegacyAccountOperation_main__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) ensureLegacyFolderIsValid:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 48) managedObjectContext];
    if (v2)
    {
      v3 = (void *)v2;
      char v4 = [*(id *)(a1 + 48) markedForDeletion];

      if ((v4 & 1) == 0)
      {
        if (v8)
        {
          v5 = (void *)[*(id *)(a1 + 32) copyNote:*(void *)(a1 + 48) toFolder:v8];
          if (v5)
          {
            v6 = [*(id *)(a1 + 32) didCopyBlock];

            if (v6)
            {
              id v7 = [*(id *)(a1 + 32) didCopyBlock];
              ((void (**)(void, void, void *))v7)[2](v7, *(void *)(a1 + 48), v5);
            }
          }
        }
      }
    }
  }
}

- (id)ensureLegacyFolderIsValid:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 managedObjectContext];

  if (v5)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [v4 objectID];

    if (v7)
    {
      id v8 = [(ICCopyModernNotesToLegacyAccountOperation *)self legacyContext];
      v9 = [v8 managedObjectContext];
      v10 = [v4 objectID];
      id v6 = [v9 objectWithID:v10];
    }
    else
    {
      id v11 = os_log_create("com.apple.notes", "Move");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315138;
        id v14 = "-[ICCopyModernNotesToLegacyAccountOperation ensureLegacyFolderIsValid:]";
        _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_INFO, "%s: Couldn't get a valid legacy folder", (uint8_t *)&v13, 0xCu);
      }

      id v6 = 0;
    }
  }

  return v6;
}

- (id)dataForAttachment:(id)a3 outFilename:(id *)a4 outMimeType:(id *)a5
{
  id v7 = a3;
  if ([v7 isUnsupported] && (objc_msgSend(v7, "hasFallbackImage") & 1) != 0
    || [v7 attachmentType] == 10)
  {
    uint64_t v8 = [v7 fallbackImageData];
    v9 = [v7 fallbackImageURL];
    v10 = [v9 lastPathComponent];

    id v11 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
LABEL_7:
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  id v12 = [v7 media];

  if (v12)
  {
    int v13 = [v7 media];
    uint64_t v8 = [v13 data];
    v10 = [v13 filename];
    id v11 = [v7 typeUTI];

    goto LABEL_7;
  }
  if ([v7 attachmentType] == 13)
  {
    v19 = [MEMORY[0x1E4F83298] currentInfo];
    uint64_t v14 = [MEMORY[0x1E4F832E8] generateImageForAttachment:v7 fullResolution:1 appearanceInfo:v19];

    id v11 = 0;
    v10 = 0;
  }
  else
  {
    id v11 = 0;
    v10 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v8 = 0;
LABEL_8:
  if (!(v8 | v14))
  {
    uint64_t v15 = objc_msgSend(v7, "attachmentPreviewImageWithMinSize:scale:", 1024.0, 768.0, 1.0);
    uint64_t v14 = [v15 orientedImage];
  }
  if (v14)
  {
    uint64_t v16 = objc_msgSend((id)v14, "ic_PNGData");

    uint64_t v17 = [(id)*MEMORY[0x1E4F44460] identifier];

    id v11 = (void *)v17;
    uint64_t v8 = v16;
  }
  if (!v10 && v11)
  {
    v10 = [MEMORY[0x1E4F832A0] filenameFromUTI:v11];
  }
  if (a4 && v10) {
    *a4 = v10;
  }
  if (a5 && v11) {
    *a5 = v11;
  }

  return (id)v8;
}

- (id)htmlAttributesForAttachment:(id)a3 legacyContentID:(id)a4 tagName:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 URL];
  if (v9)
  {
    if (a5) {
      *a5 = @"a";
    }
    v10 = NSString;
    if (v8)
    {
      id v11 = [MEMORY[0x1E4F83418] htmlObjectAttributesForAttachmentWithContentID:v8];
      [v10 stringWithFormat:@" href=\"%@\"><object%@", v9, v11];
    }
    else
    {
      uint64_t v13 = [v7 title];
      id v11 = (void *)v13;
      if (v13) {
        uint64_t v14 = (void *)v13;
      }
      else {
        uint64_t v14 = v9;
      }
      [v10 stringWithFormat:@" href=\"%@\"><i>%@</i", v9, v14];
    id v12 = };
  }
  else
  {
    if (a5) {
      *a5 = @"object";
    }
    if (v8)
    {
      id v12 = [MEMORY[0x1E4F83418] htmlObjectAttributesForAttachmentWithContentID:v8];
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (id)copyNote:(id)a3 toFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F833E0];
  v9 = [(ICCopyModernNotesToLegacyAccountOperation *)self legacyContext];
  v10 = (void *)[v8 newNoteBasedOnModernNote:v6 inFolder:v7 context:v9];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __63__ICCopyModernNotesToLegacyAccountOperation_copyNote_toFolder___block_invoke;
  v22 = &unk_1E5FDC070;
  id v23 = v7;
  id v24 = v6;
  v25 = self;
  id v11 = v10;
  id v26 = v11;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = [v12 htmlStringWithAttachmentConversionHandler:&v19];
  objc_msgSend(v11, "setHtmlString:", v14, v19, v20, v21, v22);

  [v13 addNotesObject:v11];
  uint64_t v15 = [v11 managedObjectContext];
  [v15 processPendingChanges];

  uint64_t v16 = v26;
  id v17 = v11;

  return v17;
}

id __63__ICCopyModernNotesToLegacyAccountOperation_copyNote_toFolder___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (!v7
    || ([*(id *)(a1 + 32) account],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 supportsAttachments],
        v8,
        !v9))
  {
    id v17 = 0;
    goto LABEL_29;
  }
  v10 = [*(id *)(a1 + 40) attachmentWithIdentifier:v7];
  if ([v10 attachmentType] == 11)
  {
    objc_opt_class();
    id v11 = [v10 attachmentModel];
    id v12 = ICDynamicCast();

    if (v12)
    {
      v32 = [v12 blockingGeneratePDFURL];
      uint64_t v34 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v32];
      uint64_t v33 = [(id)*MEMORY[0x1E4F44450] preferredMIMEType];
      id v13 = [v12 attachment];
      uint64_t v14 = [v13 title];
      uint64_t v15 = [v12 attachment];
      uint64_t v16 = v15;
      if (v14) {
        [v15 title];
      }
      else {
      v22 = [v15 defaultTitle];
      }

      id v19 = [v22 stringByAppendingPathExtension:@"pdf"];

      id v20 = (id)v33;
      v18 = (void *)v34;
    }
    else
    {
      v18 = 0;
      id v19 = 0;
      id v20 = 0;
    }
  }
  else if ([v10 attachmentType] == 12)
  {
    v18 = 0;
    id v19 = 0;
    id v20 = 0;
  }
  else
  {
    v21 = *(void **)(a1 + 48);
    id v36 = 0;
    id v37 = 0;
    v18 = [v21 dataForAttachment:v10 outFilename:&v37 outMimeType:&v36];
    id v19 = v37;
    id v20 = v36;
  }
  if ([v10 attachmentType] != 12)
  {
    id v26 = [*(id *)(a1 + 56) createAttachmentWithName:v19];
    [v26 setMimeType:v20];
    if (v18)
    {
      id v35 = 0;
      char v27 = [v26 persistAttachmentData:v18 error:&v35];
      id v28 = v35;
      if (v27)
      {
        v29 = *(void **)(a1 + 48);
        os_log_t v30 = [v26 contentID];
        id v17 = [v29 htmlAttributesForAttachment:v10 legacyContentID:v30 tagName:a3];
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      id v28 = 0;
    }
    os_log_t v30 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      __63__ICCopyModernNotesToLegacyAccountOperation_copyNote_toFolder___block_invoke_cold_1(v26, (uint64_t)v28, v30);
    }

    id v17 = 0;
    goto LABEL_26;
  }
  id v23 = v20;
  id v24 = [v10 attachmentModel];
  int v25 = [v24 canConvertToHTMLForSharing];

  if (v25)
  {
    id v26 = [v10 attachmentModel];
    id v17 = [v26 attributesForSharingHTMLWithTagName:a3 textContent:a4];
    id v20 = v23;
LABEL_27:

    goto LABEL_28;
  }
  id v17 = 0;
  id v20 = v23;
LABEL_28:

LABEL_29:
  return v17;
}

- (NSArray)sourceNotes
{
  return self->_sourceNotes;
}

- (void)setSourceNotes:(id)a3
{
}

- (ICLegacyFolder)destinationFolder
{
  return self->_destinationFolder;
}

- (void)setDestinationFolder:(id)a3
{
}

- (ICLegacyContext)legacyContext
{
  return self->_legacyContext;
}

- (void)setLegacyContext:(id)a3
{
}

- (id)didCopyBlock
{
  return self->_didCopyBlock;
}

- (void)setDidCopyBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didCopyBlock, 0);
  objc_storeStrong((id *)&self->_legacyContext, 0);
  objc_storeStrong((id *)&self->_destinationFolder, 0);
  objc_storeStrong((id *)&self->_sourceNotes, 0);
}

void __63__ICCopyModernNotesToLegacyAccountOperation_copyNote_toFolder___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 contentID];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Couldn't persist attachment for id: %@, error: %@", (uint8_t *)&v6, 0x16u);
}

@end