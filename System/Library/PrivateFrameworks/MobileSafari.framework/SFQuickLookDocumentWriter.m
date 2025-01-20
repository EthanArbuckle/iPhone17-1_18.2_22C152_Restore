@interface SFQuickLookDocumentWriter
- (BOOL)hasFinishedWriting;
- (NSString)filePathAccessedOnDispatchQueue;
- (SFQuickLookDocument)quickLookDocument;
- (SFQuickLookDocumentWriter)initWithFileName:(id)a3 uti:(id)a4;
- (void)setFilePathAccessedOnDispatchQueue:(id)a3;
- (void)writeDataAndClose:(id)a3 completionHandler:(id)a4;
@end

@implementation SFQuickLookDocumentWriter

- (void)setFilePathAccessedOnDispatchQueue:(id)a3
{
  v4 = (NSString *)[a3 copy];
  filePathAccessedOnDispatchQueue = self->_filePathAccessedOnDispatchQueue;
  self->_filePathAccessedOnDispatchQueue = v4;
}

- (NSString)filePathAccessedOnDispatchQueue
{
  return self->_filePathAccessedOnDispatchQueue;
}

- (SFQuickLookDocumentWriter)initWithFileName:(id)a3 uti:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v33.receiver = self;
  v33.super_class = (Class)SFQuickLookDocumentWriter;
  v8 = [(SFQuickLookDocumentWriter *)&v33 init];
  if (v8)
  {
    v9 = objc_msgSend(v6, "safari_lastPathComponentWithoutZipExtension");
    v10 = [v9 pathExtension];
    v11 = v7;
    v12 = v10;
    CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F22590];
    if (UTTypeConformsTo(v11, (CFStringRef)*MEMORY[0x1E4F22590]))
    {
      v7 = v11;
      v14 = v12;
    }
    else
    {
      uint64_t v15 = [(__CFString *)v12 length];
      v16 = (CFStringRef *)MEMORY[0x1E4F224F8];
      v14 = v12;
      if (!v15)
      {
        v14 = (__CFString *)UTTypeCopyPreferredTagWithClass(v11, (CFStringRef)*MEMORY[0x1E4F224F8]);
      }
      if ([(__CFString *)v14 length])
      {
        CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(*v16, v14, v13);
        v18 = (__CFString *)PreferredIdentifierForTag;
        v19 = v11;
        if (PreferredIdentifierForTag)
        {
          if (UTTypeIsDynamic(PreferredIdentifierForTag)) {
            v19 = v11;
          }
          else {
            v19 = v18;
          }
        }
        v7 = v19;
      }
      else
      {
        v7 = v11;
      }
    }

    v8->_hasFinishedWriting = 0;
    v20 = [SFQuickLookDocument alloc];
    v21 = objc_msgSend(v6, "safari_lastPathComponentWithoutZipExtension");
    uint64_t v22 = [(SFQuickLookDocument *)v20 initWithFileName:v21 mimeType:0 uti:v7 needsQuickLookDocumentView:0];
    quickLookDocument = v8->_quickLookDocument;
    v8->_quickLookDocument = (SFQuickLookDocument *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.mobilesafari.QuickLookDocumentWriterQueue", 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v24;

    v26 = v8->_dispatchQueue;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__SFQuickLookDocumentWriter_initWithFileName_uti___block_invoke;
    v30[3] = &unk_1E54E9A60;
    v27 = v8;
    v31 = v27;
    id v32 = v6;
    dispatch_async(v26, v30);
    v28 = v27;
  }
  return v8;
}

void __50__SFQuickLookDocumentWriter_initWithFileName_uti___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28CB8], "_web_createTemporaryFileForQuickLook:", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setFilePathAccessedOnDispatchQueue:v2];
}

- (void)writeDataAndClose:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SFQuickLookDocumentWriter_writeDataAndClose_completionHandler___block_invoke;
  block[3] = &unk_1E54E9A88;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __65__SFQuickLookDocumentWriter_writeDataAndClose_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) filePathAccessedOnDispatchQueue];
  v3 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v2];
  [v3 writeData:*(void *)(a1 + 40)];
  [v3 closeFile];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SFQuickLookDocumentWriter_writeDataAndClose_completionHandler___block_invoke_2;
  block[3] = &unk_1E54E9A88;
  block[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v7 = *(id *)(a1 + 48);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__SFQuickLookDocumentWriter_writeDataAndClose_completionHandler___block_invoke_2(void *a1)
{
  *(unsigned char *)(a1[4] + 24) = 1;
  [*(id *)(a1[4] + 32) setSavedPath:a1[5] shouldDelete:0];
  uint64_t result = a1[6];
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (SFQuickLookDocument)quickLookDocument
{
  return self->_quickLookDocument;
}

- (BOOL)hasFinishedWriting
{
  return self->_hasFinishedWriting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_storeStrong((id *)&self->_filePathAccessedOnDispatchQueue, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end