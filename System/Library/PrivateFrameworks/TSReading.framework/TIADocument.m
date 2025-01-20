@interface TIADocument
- (BOOL)_shouldPreventFileProtectionUpgradeToLevel:(id)a3;
- (BOOL)documentNeedsDownloadOnRevert;
- (BOOL)documentRevertWasAbandoned;
- (BOOL)hasPersistenceErrors;
- (BOOL)hasUnsavedChanges;
- (BOOL)isClosed;
- (BOOL)isClosingWithoutSaving;
- (BOOL)isPasswordProtected;
- (BOOL)isReadOnly;
- (BOOL)isShowingConflictResolutionSheet;
- (BOOL)passwordEntryWasAbandoned;
- (BOOL)shouldAbandonDocumentRevert;
- (BOOL)validatePassphrase:(id)a3;
- (NSString)documentCachePath;
- (NSString)documentPasswordHint;
- (NSString)name;
- (NSString)sourcePathForNondestructiveImport;
- (NSURL)templateURL;
- (SFUCryptoKey)encryptionKey;
- (TIADocument)initWithTemporaryFileURL:(id)a3;
- (TIADocumentInfo)documentInfo;
- (TIADocumentPassphraseDelegate)passphraseDelegate;
- (TSADocumentRoot)documentRoot;
- (TSPObjectContext)context;
- (TSPObjectContext)contextForRevert;
- (id)additionalDocumentPropertiesForWrite;
- (id)contentsForType:(id)a3 error:(id *)a4;
- (id)documentUUID;
- (id)newExporterForType:(id)a3 options:(id)a4 preferredType:(id *)a5;
- (id)packageDataForWrite;
- (id)persistenceWarningsForData:(id)a3 isReadable:(BOOL)a4 isExternal:(BOOL)a5;
- (void)closeWithCompletionHandler:(id)a3;
- (void)context:(id)a3 didDownloadDocumentResources:(id)a4 failedOrCancelledDocumentResources:(id)a5 error:(id)a6;
- (void)coordinatedReadUsingAccessor:(id)a3;
- (void)dealloc;
- (void)documentDidLoad;
- (void)p_performSynchronousBlockOnMainThread:(id)a3;
- (void)passwordStateDidChange;
- (void)setContext:(id)a3;
- (void)setContextForRevert:(id)a3;
- (void)setDocumentFileProtectionTo:(id)a3;
- (void)setDocumentInfo:(id)a3;
- (void)setDocumentPasswordHint:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setEncryptionKeyWithPassphrase:(id)a3;
- (void)setFileProtectionTo:(id)a3 atPath:(id)a4;
- (void)setIsClosingWithoutSaving:(BOOL)a3;
- (void)setIsReadOnly:(BOOL)a3;
- (void)setPassphraseDelegate:(id)a3;
- (void)setSourcePathForNondestructiveImport:(id)a3;
- (void)setTemplateURL:(id)a3;
@end

@implementation TIADocument

- (TIADocument)initWithTemporaryFileURL:(id)a3
{
  v3 = [(UIDocument *)self initWithFileURL:a3];
  if (v3)
  {
    [(TIADocument *)v3 setContext:[[TSPObjectContext alloc] initWithDelegate:v3]];
    id v4 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(+[TSAApplicationDelegate sharedDelegate](TSAApplicationDelegate, "sharedDelegate"), "documentRootClass")), "initDocumentObjectWithContext:", -[TIADocument context](v3, "context"));
    if (!v4)
    {
      v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TIADocument initWithTemporaryFileURL:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TIADocument.m"), 209, @"invalid nil value for '%s'", "documentRoot");
    }
    [v4 setDelegate:v3];
  }
  return v3;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self->_documentStateChangedObserver);

  [(TSADocumentRoot *)[(TIADocument *)self documentRoot] setDelegate:0];
  ioQueue = self->_ioQueue;
  if (ioQueue) {
    dispatch_release(ioQueue);
  }
  ioOperationQueue = self->_ioOperationQueue;
  if (ioOperationQueue) {
    dispatch_release(ioOperationQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)TIADocument;
  [(UIDocument *)&v5 dealloc];
}

- (TSADocumentRoot)documentRoot
{
  objc_opt_class();
  [(TSPObjectContext *)[(TIADocument *)self context] documentObject];
  return (TSADocumentRoot *)TSUDynamicCast();
}

- (BOOL)hasUnsavedChanges
{
  if ([(TIADocument *)self isReadOnly]
    || [(TIADocument *)self isClosingWithoutSaving]
    || [(TIADocument *)self isClosed]
    || self->_documentRootForDocumentDidLoad)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TIADocument;
  return [(UIDocument *)&v4 hasUnsavedChanges];
}

- (id)documentUUID
{
  return 0;
}

- (NSString)documentCachePath
{
  v2 = [(TIADocument *)self documentInfo];
  return (NSString *)[(TIADocumentInfo *)v2 documentCachePath];
}

- (BOOL)isClosed
{
  return [(UIDocument *)self documentState] & 1;
}

- (void)closeWithCompletionHandler:(id)a3
{
  BOOL v5 = [(TIADocument *)self isClosed];
  documentInfo = self->_documentInfo;
  if (v5)
  {
    if ([(TIADocumentInfo *)documentInfo isSaving])
    {
      v7 = self->_documentInfo;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __42__TIADocument_closeWithCompletionHandler___block_invoke;
      v10[3] = &unk_2646B1DC8;
      v10[4] = self;
      v10[5] = a3;
      [(TIADocumentInfo *)v7 notifySaveIsFinishedUsingQueue:MEMORY[0x263EF83A0] completion:v10];
    }
    else if (a3)
    {
      v8 = (void (*)(id, uint64_t))*((void *)a3 + 2);
      v8(a3, 1);
    }
  }
  else
  {
    [(TIADocumentInfo *)documentInfo beginSave];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__TIADocument_closeWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_2646B09D0;
    v9[4] = self;
    v9[5] = a3;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__TIADocument_closeWithCompletionHandler___block_invoke_5;
    v12[3] = &unk_2646B3DB0;
    v12[4] = v9;
    char v13 = 1;
    v11.receiver = self;
    v11.super_class = (Class)TIADocument;
    -[UIDocument closeWithCompletionHandler:](&v11, sel_closeWithCompletionHandler_, v12, MEMORY[0x263EF8330], 3221225472, __42__TIADocument_closeWithCompletionHandler___block_invoke_4, &unk_2646B3DD8, self, v9);
  }
}

uint64_t __42__TIADocument_closeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeWithCompletionHandler:*(void *)(a1 + 40)];
}

uint64_t __42__TIADocument_closeWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_super v4 = (void *)[*(id *)(a1 + 32) documentRoot];
  id v5 = (id)[v4 accessController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TIADocument_closeWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_2646AF7B8;
  v7[4] = v4;
  [v5 performRead:v7];

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "context"), "close");
  [*(id *)(*(void *)(a1 + 32) + 264) endSave];
  if ([*(id *)(*(void *)(a1 + 32) + 264) isSynced]) {
    [*(id *)(*(void *)(a1 + 32) + 264) setWillDownload:1];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t __42__TIADocument_closeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) willClose];
}

id __42__TIADocument_closeWithCompletionHandler___block_invoke_4(uint64_t a1, char a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__TIADocument_closeWithCompletionHandler___block_invoke_5;
  v5[3] = &unk_2646B3DB0;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(void *)(a1 + 40);
  char v6 = a2;
  v4.receiver = v2;
  v4.super_class = (Class)TIADocument;
  return objc_msgSendSuper2(&v4, sel_closeWithCompletionHandler_, v5);
}

uint64_t __42__TIADocument_closeWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)p_performSynchronousBlockOnMainThread:(id)a3
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    objc_super v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
  else
  {
    id v5 = MEMORY[0x263EF83A0];
    dispatch_sync(v5, a3);
  }
}

- (id)contentsForType:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

- (void)documentDidLoad
{
  v3 = [(TIADocument *)self documentRoot];
  objc_super v4 = v3;
  atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_documentRootForDocumentDidLoad, (unint64_t *)&v4, 0);
  if (v4 == v3)
  {
    [(TSADocumentRoot *)v3 documentDidLoad];
  }
}

- (BOOL)shouldAbandonDocumentRevert
{
  return 0;
}

- (BOOL)hasPersistenceErrors
{
  return self->_hasPersistenceErrors != 0;
}

- (NSString)name
{
  v2 = [(TIADocument *)self documentInfo];
  return (NSString *)[(TIADocumentInfo *)v2 displayName];
}

- (void)passwordStateDidChange
{
}

- (void)coordinatedReadUsingAccessor:(id)a3
{
  templateURL = self->_templateURL;
  if (!templateURL) {
    templateURL = [(UIDocument *)self fileURL];
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v8 = 0;
  char v6 = (void *)[objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:self];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__TIADocument_coordinatedReadUsingAccessor___block_invoke;
  v7[3] = &unk_2646B3E00;
  v7[4] = a3;
  void v7[5] = &v9;
  [v6 coordinateReadingItemAtURL:templateURL options:1 error:&v8 byAccessor:v7];

  if (!*((unsigned char *)v10 + 24))
  {
    TSULogErrorInFunction();
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __44__TIADocument_coordinatedReadUsingAccessor___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)packageDataForWrite
{
  v2 = [(TIADocument *)self documentRoot];
  return [(TSADocumentRoot *)v2 packageDataForWrite];
}

- (id)additionalDocumentPropertiesForWrite
{
  v2 = [(TIADocument *)self documentRoot];
  return [(TSADocumentRoot *)v2 additionalDocumentPropertiesForWrite];
}

- (id)persistenceWarningsForData:(id)a3 isReadable:(BOOL)a4 isExternal:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = objc_msgSend(+[TSABaseApplicationDelegate sharedDelegate](TSABaseApplicationDelegate, "sharedDelegate"), "documentRootClass");
  return (id)[v8 persistenceWarningsForData:a3 isReadable:v6 isExternal:v5];
}

- (void)context:(id)a3 didDownloadDocumentResources:(id)a4 failedOrCancelledDocumentResources:(id)a5 error:(id)a6
{
  objc_opt_class();
  [a3 documentObject];
  v10 = (void *)TSUDynamicCast();
  [v10 didDownloadDocumentResources:a4 failedOrCancelledDocumentResources:a5 error:a6];
}

- (BOOL)_shouldPreventFileProtectionUpgradeToLevel:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x263F08080]]
      && ([(TSKDocumentViewController *)[(TSKDocumentRoot *)[(TIADocument *)self documentRoot] viewController] isPrintingDocument] & 1) != 0;
}

- (void)setFileProtectionTo:(id)a3 atPath:(id)a4
{
  if (a4)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", a4))
    {
      uint64_t v7 = 0;
      BOOL v6 = (void *)[MEMORY[0x263F08850] defaultManager];
      objc_msgSend(v6, "changeFileProtectionAtURL:toProtection:recursively:error:", objc_msgSend(NSURL, "fileURLWithPath:", a4), a3, 1, &v7);
    }
  }
}

- (void)setDocumentFileProtectionTo:(id)a3
{
  BOOL v5 = [(NSURL *)[(UIDocument *)self fileURL] path];
  [(TIADocument *)self setFileProtectionTo:a3 atPath:v5];
}

- (BOOL)isPasswordProtected
{
  return [(TIADocument *)self encryptionKey] != 0;
}

- (void)setDocumentPasswordHint:(id)a3
{
  [(TSPObjectContext *)self->_context setDocumentPasswordHint:a3];
  [(UIDocument *)self updateChangeCount:0];
}

- (void)setEncryptionKeyWithPassphrase:(id)a3
{
  [(TIADocument *)self willChangeValueForKey:@"isPasswordProtected"];
  if (a3)
  {
    id v5 = objc_alloc(MEMORY[0x263F7C7D0]);
    id v6 = (id)[v5 initAes128KeyFromPassphrase:a3 iterationCount:*MEMORY[0x263F7C8F8]];
  }
  else
  {
    id v6 = 0;
  }
  [(TIADocument *)self setEncryptionKey:v6];
  [(TIADocument *)self didChangeValueForKey:@"isPasswordProtected"];
  [(UIDocument *)self updateChangeCount:0];
}

- (BOOL)validatePassphrase:(id)a3
{
  if (![(TIADocument *)self isPasswordProtected] || !self->_encryptionKey) {
    return 1;
  }
  id v5 = (id)[objc_alloc(MEMORY[0x263F7C7D0]) initAes128KeyFromPassphrase:a3 withIterationCountAndSaltDataFromCryptoKey:self->_encryptionKey];
  return SFUEqualCryptoKeys();
}

- (NSString)documentPasswordHint
{
  v2 = [(TIADocument *)self context];
  return [(TSPObjectContext *)v2 documentPasswordHint];
}

- (id)newExporterForType:(id)a3 options:(id)a4 preferredType:(id *)a5
{
  uint64_t v8 = [(TIADocument *)self documentRoot];
  return [(TSADocumentRoot *)v8 newExporterForType:a3 options:a4 preferredType:a5];
}

- (BOOL)passwordEntryWasAbandoned
{
  return self->_passwordEntryWasAbandoned;
}

- (TSPObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (TIADocumentInfo)documentInfo
{
  return self->_documentInfo;
}

- (void)setDocumentInfo:(id)a3
{
}

- (BOOL)isShowingConflictResolutionSheet
{
  return self->_isShowingConflictResolutionSheet;
}

- (BOOL)isClosingWithoutSaving
{
  return self->_isClosingWithoutSaving;
}

- (void)setIsClosingWithoutSaving:(BOOL)a3
{
  self->_isClosingWithoutSaving = a3;
}

- (TIADocumentPassphraseDelegate)passphraseDelegate
{
  return self->_passphraseDelegate;
}

- (void)setPassphraseDelegate:(id)a3
{
  self->_passphraseDelegate = (TIADocumentPassphraseDelegate *)a3;
}

- (SFUCryptoKey)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSString)sourcePathForNondestructiveImport
{
  return self->_sourcePathForNondestructiveImport;
}

- (void)setSourcePathForNondestructiveImport:(id)a3
{
}

- (TSPObjectContext)contextForRevert
{
  return self->_contextForRevert;
}

- (void)setContextForRevert:(id)a3
{
}

- (NSURL)templateURL
{
  return self->_templateURL;
}

- (void)setTemplateURL:(id)a3
{
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void)setIsReadOnly:(BOOL)a3
{
  self->_isReadOnly = a3;
}

- (BOOL)documentNeedsDownloadOnRevert
{
  return self->_documentNeedsDownloadOnRevert;
}

- (BOOL)documentRevertWasAbandoned
{
  return self->_documentRevertWasAbandoned;
}

@end