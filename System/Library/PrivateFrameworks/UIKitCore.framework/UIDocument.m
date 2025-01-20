@interface UIDocument
+ (BOOL)_url:(id)a3 matchesURL:(id)a4;
+ (id)_customizationOfError:(id)a3 withDescription:(id)a4 recoverySuggestion:(id)a5 recoveryAttempter:(id)a6;
+ (id)_documentWithContentsOfFileURL:(id)a3 error:(id *)a4;
+ (id)_fileModificationDateForURL:(id)a3;
+ (id)_typeForContentsOfURL:(id)a3 error:(id *)a4;
+ (void)_autosavingTimerDidFireSoContinue:(id)a3;
+ (void)_finishWritingToURL:(id)a3 withTemporaryDirectoryURL:(id)a4 newContentsURL:(id)a5 afterSuccess:(BOOL)a6;
- (BOOL)_coordinateWritingItemAtURL:(id)a3 error:(id *)a4 byAccessor:(id)a5;
- (BOOL)_hasSavingError;
- (BOOL)_hasUnsavedChanges;
- (BOOL)_isEditingDisabledDueToPermissions;
- (BOOL)_isEditingTemporarilyDisabled;
- (BOOL)_isInConflict;
- (BOOL)_isInOpen;
- (BOOL)_isOpen;
- (BOOL)_isUbiquitous;
- (BOOL)_shouldAllowWritingInResponseToPresenterMessage;
- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError *)outError;
- (BOOL)readFromURL:(NSURL *)url error:(NSError *)outError;
- (BOOL)writeContents:(id)contents andAttributes:(NSDictionary *)additionalFileAttributes safelyToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation error:(NSError *)outError;
- (BOOL)writeContents:(id)contents toURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation originalContentsURL:(NSURL *)originalContentsURL error:(NSError *)outError;
- (NSDate)fileModificationDate;
- (NSDictionary)fileAttributesToWriteToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation error:(NSError *)outError;
- (NSDocumentDifferenceSize)differenceDueToRecentChanges;
- (NSDocumentDifferenceSize)differenceSincePreservingPreviousVersion;
- (NSDocumentDifferenceSize)differenceSinceSaving;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSProgress)progress;
- (NSString)description;
- (NSString)fileNameExtensionForType:(NSString *)typeName saveOperation:(UIDocumentSaveOperation)saveOperation;
- (NSString)fileType;
- (NSString)localizedName;
- (NSURL)fileURL;
- (NSUndoManager)undoManager;
- (NSUserActivity)userActivity;
- (UIDocument)init;
- (UIDocument)initWithFileURL:(NSURL *)url;
- (UIDocumentState)documentState;
- (double)_autosavingDelay;
- (id)_defaultUserActivityForActivityType:(id)a3;
- (id)_defaultUserActivityType;
- (id)_fileOpeningQueue;
- (id)_presentableFileNameForSaveOperation:(int64_t)a3 url:(id)a4;
- (id)_readingProgressForURL:(id)a3;
- (id)_userActivity;
- (id)_writingProgressForURL:(id)a3 indeterminate:(BOOL)a4;
- (id)changeCountTokenForSaveOperation:(UIDocumentSaveOperation)saveOperation;
- (id)contentsForType:(NSString *)typeName error:(NSError *)outError;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_autosaveWithCompletionHandler:(id)a3;
- (void)_autosavingCompletedSuccessfully:(BOOL)a3;
- (void)_changeWasDone:(id)a3;
- (void)_changeWasRedone:(id)a3;
- (void)_changeWasUndone:(id)a3;
- (void)_finishSavingToURL:(id)a3 forSaveOperation:(int64_t)a4 changeCount:(id)a5;
- (void)_generatePDFInWindowScene:(void *)a3 completionHandler:;
- (void)_lockFileAccessQueueAndPerformBlock:(id)a3;
- (void)_performBlock:(id)a3 synchronouslyOnQueue:(id)a4;
- (void)_performBlockOnMainThread:(id)a3;
- (void)_performBlockSynchronouslyOnMainThread:(id)a3;
- (void)_progressPublished:(id)a3;
- (void)_progressUnpublished:(id)a3;
- (void)_registerAsFilePresenterIfNecessary;
- (void)_releaseUndoManager;
- (void)_rescheduleAutosaving;
- (void)_saveUnsavedChangesWithCompletionHandler:(id)a3;
- (void)_scheduleAutosaving;
- (void)_scheduleAutosavingAfterDelay:(double)a3 reset:(BOOL)a4;
- (void)_sendStateChangedNotification;
- (void)_setEditingDisabledDueToPermissions:(BOOL)a3;
- (void)_setEditingTemporarilyDisabled:(BOOL)a3;
- (void)_setFileURL:(id)a3;
- (void)_setHasSavingError:(BOOL)a3;
- (void)_setInConflict:(BOOL)a3;
- (void)_setInOpen:(BOOL)a3;
- (void)_setOpen:(BOOL)a3;
- (void)_setUserActivity:(id)a3;
- (void)_unlockFileAccessQueue;
- (void)_unregisterAsFilePresenterIfNecessary;
- (void)_updateConflictState;
- (void)_updateDefaultUserActivityBecomingCurrent:(BOOL)a3;
- (void)_updateLastUsedDate;
- (void)_updateLocalizedName;
- (void)_updatePermissionsState:(BOOL)a3;
- (void)_updateUserActivityState:(id)a3;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4;
- (void)closeWithCompletionHandler:(void *)completionHandler;
- (void)dealloc;
- (void)finishedHandlingError:(NSError *)error recovered:(BOOL)recovered;
- (void)handleError:(NSError *)error userInteractionPermitted:(BOOL)userInteractionPermitted;
- (void)openWithCompletionHandler:(void *)completionHandler;
- (void)performAsynchronousFileAccessUsingBlock:(void *)block;
- (void)presentedItemDidChange;
- (void)presentedItemDidGainVersion:(id)a3;
- (void)presentedItemDidLoseVersion:(id)a3;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)presentedItemDidResolveConflictVersion:(id)a3;
- (void)presentedItemHasUnsavedChangesWithCompletionHandler:(id)a3;
- (void)presentedSubitemAtURL:(id)a3 didGainVersion:(id)a4;
- (void)presentedSubitemAtURL:(id)a3 didLoseVersion:(id)a4;
- (void)presentedSubitemAtURL:(id)a3 didMoveToURL:(id)a4;
- (void)presentedSubitemAtURL:(id)a3 didResolveConflictVersion:(id)a4;
- (void)presentedSubitemDidAppearAtURL:(id)a3;
- (void)presentedSubitemDidChangeAtURL:(id)a3;
- (void)relinquishPresentedItemToReader:(id)a3;
- (void)relinquishPresentedItemToWriter:(id)a3;
- (void)revertToContentsOfURL:(NSURL *)url completionHandler:(void *)completionHandler;
- (void)savePresentedItemChangesWithCompletionHandler:(id)a3;
- (void)saveToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation completionHandler:(void *)completionHandler;
- (void)setFileModificationDate:(NSDate *)fileModificationDate;
- (void)setFileType:(id)a3;
- (void)setUndoManager:(NSUndoManager *)undoManager;
- (void)setUserActivity:(NSUserActivity *)userActivity;
- (void)updateChangeCount:(UIDocumentChangeKind)change;
- (void)updateChangeCountWithToken:(id)changeCountToken forSaveOperation:(UIDocumentSaveOperation)saveOperation;
- (void)userInteractionNoLongerPermittedForError:(NSError *)error;
@end

@implementation UIDocument

void __74__UIDocument_UIPDFGeneration___getPrintPageRendererWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v2 = (void *)qword_1EB260008;
  uint64_t v21 = qword_1EB260008;
  if (!qword_1EB260008)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getQLItemClass_block_invoke;
    v16 = &unk_1E52D9900;
    v17 = &v18;
    __getQLItemClass_block_invoke((uint64_t)&v13);
    v2 = (void *)v19[3];
  }
  v3 = v2;
  _Block_object_dispose(&v18, 8);
  v4 = (void *)[[v3 alloc] initWithURL:*(void *)(a1 + 32)];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v5 = (void *)qword_1EB260010;
  uint64_t v21 = qword_1EB260010;
  if (!qword_1EB260010)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getQLPreviewControllerClass_block_invoke;
    v16 = &unk_1E52D9900;
    v17 = &v18;
    __getQLPreviewControllerClass_block_invoke((uint64_t)&v13);
    v5 = (void *)v19[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v18, 8);
  v7 = [v6 printPageRendererForItem:v4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__UIDocument_UIPDFGeneration___getPrintPageRendererWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E52DB330;
  id v8 = *(id *)(a1 + 40);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __74__UIDocument_UIPDFGeneration___getPrintPageRendererWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_generatePDFInWindowScene:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_8;
  }
  if (pthread_main_np() != 1)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel__generatePDFInWindowScene_completionHandler_ object:a1 file:@"UIDocument_PDFGeneration.m" lineNumber:45 description:@"Call must be made on main thread"];

    if (v6) {
      goto LABEL_4;
    }
LABEL_10:
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__generatePDFInWindowScene_completionHandler_, a1, @"UIDocument_PDFGeneration.m", 46, @"Invalid parameter not satisfying: %@", @"completionHandler != NULL" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v6) {
    goto LABEL_10;
  }
LABEL_4:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  uint64_t v13 = __75__UIDocument_UIPDFGeneration___generatePDFInWindowScene_completionHandler___block_invoke;
  uint64_t v14 = &unk_1E52E8198;
  id v16 = v6;
  id v15 = v5;
  v7 = v12;
  id v8 = [a1 fileURL];
  if (v8)
  {
    id v9 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__UIDocument_UIPDFGeneration___getPrintPageRendererWithCompletionHandler___block_invoke;
    block[3] = &unk_1E52DA160;
    id v18 = v8;
    v19 = v7;
    dispatch_async(v9, block);
  }
  else
  {
    v13((uint64_t)v7, 0);
  }

LABEL_8:
}

void __75__UIDocument_UIPDFGeneration___generatePDFInWindowScene_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v4 = (void *)qword_1EB260018;
    uint64_t v32 = qword_1EB260018;
    if (!qword_1EB260018)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __getUIPrintInteractionControllerClass_block_invoke;
      v27 = &unk_1E52D9900;
      v28 = &v29;
      __getUIPrintInteractionControllerClass_block_invoke((uint64_t)buf);
      v4 = (void *)v30[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v29, 8);
    id v6 = objc_alloc_init(v5);
    v7 = v6;
    if (v6)
    {
      [v6 setPrintPageRenderer:v3];
      id v8 = NSString;
      id v9 = [MEMORY[0x1E4F29128] UUID];
      v10 = [v9 UUIDString];
      id v11 = [v8 stringWithFormat:@"Document-%@.pdf", v10];

      id v12 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v13 = NSTemporaryDirectory();
      uint64_t v14 = [v12 fileURLWithPath:v13];
      id v15 = [v14 URLByAppendingPathComponent:v11 isDirectory:0];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __75__UIDocument_UIPDFGeneration___generatePDFInWindowScene_completionHandler___block_invoke_19;
      v21[3] = &unk_1E52E8170;
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = *(id *)(a1 + 40);
      id v22 = v15;
      id v23 = v17;
      id v18 = v15;
      [v7 savePDFToURL:v18 showProgress:0 hostingScene:v16 completionHandler:v21];
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v20 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Unable to obtain UIPrintInteractionController", buf, 2u);
        }
      }
      else
      {
        v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1006) + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Unable to obtain UIPrintInteractionController", buf, 2u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __75__UIDocument_UIPDFGeneration___generatePDFInWindowScene_completionHandler___block_invoke_19(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 40);
  if (a4 || !a3) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 16))(v5, 0, a4);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(a1 + 32), 0);
  }
}

+ (id)_typeForContentsOfURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v24 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C728];
  id v23 = 0;
  int v7 = [v5 getResourceValue:&v24 forKey:v6 error:&v23];
  id v8 = v24;
  id v9 = v23;
  id v10 = v9;
  if (v7) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL v12 = !v11 || v8 == 0;
  if (v12 || ![v8 length])
  {
    uint64_t v13 = [v5 absoluteString];
    uint64_t v14 = [v13 pathExtension];

    if ([v14 length])
    {
      id v15 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v14];
      uint64_t v16 = [v15 identifier];

      if (v16)
      {

        id v10 = 0;
      }

      if (a4 && v10)
      {
        id v10 = v10;
        *a4 = v10;
      }
      id v8 = (id)v16;
    }
    else
    {
      int v17 = [v5 hasDirectoryPath];
      id v18 = (id *)MEMORY[0x1E4F443C8];
      if (!v17) {
        id v18 = (id *)MEMORY[0x1E4F44378];
      }
      uint64_t v19 = [*v18 identifier];

      id v10 = 0;
      id v8 = (id)v19;
    }
  }
  else
  {
    id v10 = 0;
  }
  if ([v8 length]) {
    uint64_t v20 = v8;
  }
  else {
    uint64_t v20 = 0;
  }
  id v21 = v20;

  return v21;
}

- (UIDocument)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIDocument.m" lineNumber:352 description:@"do not call -[UIDocument init] - the designated initializer is -[UIDocument initWithFileURL:]"];

  return 0;
}

- (UIDocument)initWithFileURL:(NSURL *)url
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = url;
  id v5 = [(NSURL *)v4 absoluteString];
  if (![v5 length])
  {

    goto LABEL_9;
  }
  BOOL v6 = [(NSURL *)v4 isFileURL];

  if (!v6)
  {
LABEL_9:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must pass a valid file URL to -[UIDocument initWithFileURL:]"];
    v27 = 0;
    goto LABEL_10;
  }
  v29.receiver = self;
  v29.super_class = (Class)UIDocument;
  int v7 = [(UIDocument *)&v29 init];
  id v8 = v7;
  if (v7)
  {
    [(UIDocument *)v7 _setFileURL:v4];
    v8->_lastPreservationTime = CFAbsoluteTimeGetCurrent();
    dispatch_queue_t v9 = dispatch_queue_create("UIDocument File Access", 0);
    fileAccessQueue = v8->_fileAccessQueue;
    v8->_fileAccessQueue = (OS_dispatch_queue *)v9;

    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    fileAccessSemaphore = v8->_fileAccessSemaphore;
    v8->_fileAccessSemaphore = (OS_dispatch_semaphore *)v11;

    uint64_t v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    filePresenterQueue = v8->_filePresenterQueue;
    v8->_filePresenterQueue = v13;

    [(NSOperationQueue *)v8->_filePresenterQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v8->_filePresenterQueue setName:@"UIDocument File Presenting"];
    id v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    activityContinuationLock = v8->_activityContinuationLock;
    v8->_activityContinuationLock = v15;

    int v17 = objc_alloc_init(NSDocumentDifferenceSize);
    id differenceDueToRecentChanges = v8->_differenceDueToRecentChanges;
    v8->_id differenceDueToRecentChanges = v17;

    uint64_t v19 = objc_alloc_init(NSDocumentDifferenceSize);
    id differenceSincePreservingPreviousVersion = v8->_differenceSincePreservingPreviousVersion;
    v8->_id differenceSincePreservingPreviousVersion = v19;

    id v21 = objc_alloc_init(NSDocumentDifferenceSize);
    id differenceSinceSaving = v8->_differenceSinceSaving;
    v8->_id differenceSinceSaving = v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
    progresses = v8->_progresses;
    v8->_progresses = (NSMutableSet *)v23;

    uint64_t v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v8 selector:sel__applicationWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];
    [v25 addObserver:v8 selector:sel__applicationDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
    v26 = _UIDocumentLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v8;
      _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_DEFAULT, "initialized document instance: %@", buf, 0xCu);
    }
  }
  self = v8;
  v27 = self;
LABEL_10:

  return v27;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = _UIDocumentLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "deallocing document instance: %@", buf, 0xCu);
  }

  if (os_variant_has_internal_diagnostics())
  {
    if ((*(_WORD *)&self->_docFlags & 0x200) != 0)
    {
      dispatch_semaphore_t v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = self;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Document %@ is deallocating even though it is currently registered as a file presenter.", buf, 0xCu);
      }
    }
  }
  else if ((*(_WORD *)&self->_docFlags & 0x200) != 0)
  {
    BOOL v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dealloc___s_category_6) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = self;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Document %@ is deallocating even though it is currently registered as a file presenter.", buf, 0xCu);
    }
  }
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v14[0] = @"UIApplicationWillResignActiveNotification";
  v14[1] = @"UIApplicationDidBecomeActiveNotification";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  [(UIDocument *)self _releaseUndoManager];
  autosavingTimer = self->_autosavingTimer;
  if (autosavingTimer) {
    [(NSTimer *)autosavingTimer invalidate];
  }
  if (self->_progressSubscriber) {
    objc_msgSend(MEMORY[0x1E4F28F90], "_removeSubscriber:");
  }
  if ((*(_WORD *)&self->_docFlags & 0x2000) != 0) {
    [(NSURL *)self->_fileURL stopAccessingSecurityScopedResource];
  }
  currentUserActivity = self->_currentUserActivity;
  if (currentUserActivity)
  {
    id v8 = (void *)UIApp;
    dispatch_queue_t v9 = currentUserActivity;
    [v8 _removeDocument:self forUserActivity:v9];
    id v10 = self->_currentUserActivity;
    self->_currentUserActivity = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)UIDocument;
  [(UIDocument *)&v13 dealloc];
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v18.receiver = self;
  v18.super_class = (Class)UIDocument;
  v4 = [(UIDocument *)&v18 description];
  id v5 = [v3 stringWithString:v4];

  [v5 appendFormat:@" fileURL: %@ documentState: [", self->_fileURL];
  UIDocumentState v6 = [(UIDocument *)self documentState];
  if (!v6)
  {
    dispatch_queue_t v9 = @"Normal]";
    goto LABEL_34;
  }
  char v7 = v6;
  int v8 = v6 & 1;
  if (v6)
  {
    [v5 appendString:@"Closed"];
    if ((v7 & 8) == 0)
    {
LABEL_4:
      if ((v7 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_18;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_4;
  }
  if (v7) {
    id v10 = @" | EditingDisabled";
  }
  else {
    id v10 = @"EditingDisabled";
  }
  [v5 appendString:v10];
  __int16 docFlags = (__int16)self->_docFlags;
  if ((docFlags & 0x100) != 0)
  {
    [v5 appendString:@"(Permissions)"];
    __int16 docFlags = (__int16)self->_docFlags;
  }
  if ((docFlags & 0x80) != 0) {
    [v5 appendString:@"(Activity)"];
  }
  int v8 = 1;
  if ((v7 & 2) == 0)
  {
LABEL_5:
    if ((v7 & 4) == 0) {
      goto LABEL_6;
    }
LABEL_22:
    if (v8) {
      objc_super v13 = @" | SavingError";
    }
    else {
      objc_super v13 = @"SavingError";
    }
    [v5 appendString:v13];
    if ((v7 & 0x10) == 0) {
      goto LABEL_33;
    }
    goto LABEL_26;
  }
LABEL_18:
  if (v8) {
    BOOL v12 = @" | InConflict";
  }
  else {
    BOOL v12 = @"InConflict";
  }
  [v5 appendString:v12];
  int v8 = 1;
  if ((v7 & 4) != 0) {
    goto LABEL_22;
  }
LABEL_6:
  if ((v7 & 0x10) != 0)
  {
LABEL_26:
    if (v8) {
      uint64_t v14 = @" | Progress";
    }
    else {
      uint64_t v14 = @"Progress";
    }
    [v5 appendString:v14];
    id v15 = [(UIDocument *)self progress];
    if ([v15 isIndeterminate])
    {
      [v5 appendString:@" (indet)"];
    }
    else
    {
      [v15 fractionCompleted];
      objc_msgSend(v5, "appendFormat:", @" (%.0g)", v16);
    }
  }
LABEL_33:
  dispatch_queue_t v9 = @"]";
LABEL_34:
  [v5 appendString:v9];
  return (NSString *)v5;
}

- (void)_registerAsFilePresenterIfNecessary
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = _UIDocumentLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    UIDocumentState v6 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "document will register as file presenter if necessary on main thread: %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__UIDocument__registerAsFilePresenterIfNecessary__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(UIDocument *)self _performBlockSynchronouslyOnMainThread:v4];
}

void __49__UIDocument__registerAsFilePresenterIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document running file presenter registration block on main thread: %@", (uint8_t *)&v6, 0xCu);
  }

  if ((*(_WORD *)(*(void *)(a1 + 32) + 192) & 0x200) == 0)
  {
    v4 = _UIDocumentLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "registering document as file presenter: %@", (uint8_t *)&v6, 0xCu);
    }

    [MEMORY[0x1E4F28CA0] addFilePresenter:*(void *)(a1 + 32)];
    *(_WORD *)(*(void *)(a1 + 32) + 192) |= 0x200u;
  }
}

- (void)_unregisterAsFilePresenterIfNecessary
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _UIDocumentLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v6 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "document will unregister as file presenter if necessary on main thread: %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__UIDocument__unregisterAsFilePresenterIfNecessary__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(UIDocument *)self _performBlockSynchronouslyOnMainThread:v4];
}

void __51__UIDocument__unregisterAsFilePresenterIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document running file presenter de-registration block on main thread: %@", (uint8_t *)&v6, 0xCu);
  }

  if ((*(_WORD *)(*(void *)(a1 + 32) + 192) & 0x200) != 0)
  {
    v4 = _UIDocumentLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "unregistering document as file presenter: %@", (uint8_t *)&v6, 0xCu);
    }

    [MEMORY[0x1E4F28CA0] removeFilePresenter:*(void *)(a1 + 32)];
    *(_WORD *)(*(void *)(a1 + 32) + 192) &= ~0x200u;
  }
}

- (BOOL)_isUbiquitous
{
  uint64_t v3 = [(UIDocument *)self fileURL];

  if (!v3) {
    return 0;
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v4 ubiquityIdentityToken];

  if (v5)
  {
    int v6 = [(UIDocument *)self fileURL];
    char v7 = [v4 isUbiquitousItemAtURL:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_defaultUserActivityType
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(UIDocument *)self _isUbiquitous])
  {
    v2 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v2 infoDictionary];

    v4 = [v3 objectForKeyedSubscript:@"CFBundleDocumentTypes"];
    uint64_t v5 = "-[UIDocument _defaultUserActivityType]";
    if (_UIStateRestorationDebugLogEnabled())
    {
      int v6 = [(UIDocument *)self fileType];
      NSLog(&cfstr_SCheckingForDo.isa, "-[UIDocument _defaultUserActivityType]", v6, v4);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SCfbundledocum.isa, "-[UIDocument _defaultUserActivityType]");
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v7 = v4;
      uint64_t v31 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v31)
      {
        v26 = v4;
        v27 = v3;
        uint64_t v8 = 0;
        uint64_t v30 = *(void *)v40;
        unint64_t v9 = 0x1E4F29000uLL;
        id v28 = v7;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v40 != v30) {
              objc_enumerationMutation(v7);
            }
            uint64_t v32 = v10;
            dispatch_semaphore_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
            if (_UIStateRestorationDebugLogEnabled()) {
              NSLog(&cfstr_SCheckingDocum.isa, v5, v11);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (_UIStateRestorationDebugLogEnabled()) {
                NSLog(&cfstr_SDocumentTypeD.isa, v5);
              }
              uint64_t v12 = [v11 objectForKeyedSubscript:@"NSUbiquitousDocumentUserActivityType"];

              if (_UIStateRestorationDebugLogEnabled()) {
                NSLog(&cfstr_SActivityTypeI.isa, v5, v12);
              }
              if (v12)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_super v13 = [v11 objectForKeyedSubscript:@"LSItemContentTypes"];
                  if (_UIStateRestorationDebugLogEnabled()) {
                    NSLog(&cfstr_SCheckingConte.isa, v5, v13);
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_super v29 = (void *)v12;
                    if (_UIStateRestorationDebugLogEnabled()) {
                      NSLog(&cfstr_SContenttypesI.isa, v5);
                    }
                    long long v37 = 0u;
                    long long v38 = 0u;
                    long long v35 = 0u;
                    long long v36 = 0u;
                    id obj = v13;
                    uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
                    if (v14)
                    {
                      uint64_t v15 = v14;
                      uint64_t v16 = *(void *)v36;
                      while (2)
                      {
                        for (uint64_t i = 0; i != v15; ++i)
                        {
                          if (*(void *)v36 != v16) {
                            objc_enumerationMutation(obj);
                          }
                          uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                          if (_UIStateRestorationDebugLogEnabled()) {
                            NSLog(&cfstr_SCheckingConte_0.isa, v5, v18);
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            if (_UIStateRestorationDebugLogEnabled()) {
                              NSLog(&cfstr_SContenttypeIs.isa, v5);
                            }
                            uint64_t v19 = [(UIDocument *)self fileType];
                            if (v19)
                            {
                              unint64_t v20 = v9;
                              id v21 = v5;
                              id v22 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v19 allowUndeclared:1];
                              uint64_t v23 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v18 allowUndeclared:1];
                              if ([v22 conformsToType:v23])
                              {
                                if (_UIStateRestorationDebugLogEnabled()) {
                                  NSLog(&cfstr_SDocumentFilet.isa, v21, v19, v18, v29);
                                }
                                uint64_t v8 = v29;

                                id v24 = v8;
                                v4 = v26;
                                uint64_t v3 = v27;
                                id v7 = v28;
                                goto LABEL_56;
                              }

                              uint64_t v5 = v21;
                              unint64_t v9 = v20;
                            }
                          }
                        }
                        uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
                        if (v15) {
                          continue;
                        }
                        break;
                      }
                    }

                    id v7 = v28;
                    uint64_t v12 = (uint64_t)v29;
                  }
                }
                uint64_t v8 = (__CFString *)v12;
              }
              else
              {
                uint64_t v8 = 0;
              }
            }
            uint64_t v10 = v32 + 1;
          }
          while (v32 + 1 != v31);
          uint64_t v31 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v31);
        v4 = v26;
        uint64_t v3 = v27;
      }
      else
      {
        uint64_t v8 = 0;
      }
      id v24 = @"com.apple.uikit.document";
LABEL_56:
    }
    else
    {
      uint64_t v8 = 0;
      id v24 = @"com.apple.uikit.document";
    }
  }
  else
  {
    id v24 = @"com.apple.uikit.document";
  }
  return v24;
}

- (id)_defaultUserActivityForActivityType:(id)a3
{
  v4 = (__CFString *)a3;
  uint64_t v5 = v4;
  if ((*(_WORD *)&self->_docFlags & 0x4000) != 0 || ![(__CFString *)v4 length])
  {
    int v6 = 0;
  }
  else
  {
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F29230]) initWithActivityType:v5];
    [(UIDocument *)self _updateUserActivityState:v6];
    if (v5 == @"com.apple.uikit.document")
    {
      [v6 setSupportsContinuationStreams:0];
      [v6 setEligibleForHandoff:0];
      [v6 setEligibleForSearch:0];
      [v6 setEligibleForPublicIndexing:0];
      [v6 setEligibleForPrediction:0];
    }
  }

  return v6;
}

- (void)_updateDefaultUserActivityBecomingCurrent:(BOOL)a3
{
  if ((*(_WORD *)&self->_docFlags & 0x4000) == 0)
  {
    BOOL v3 = a3;
    id v10 = [(UIDocument *)self _userActivity];
    uint64_t v5 = [(UIDocument *)self _defaultUserActivityType];
    if (v10
      && ([v10 activityType],
          int v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 isEqualToString:v5],
          v6,
          (v7 & 1) != 0))
    {
      [v10 setNeedsSave:1];
      uint64_t v8 = v10;
    }
    else
    {
      uint64_t v9 = [(UIDocument *)self _defaultUserActivityForActivityType:v5];

      [(UIDocument *)self _setUserActivity:v9];
      uint64_t v8 = (void *)v9;
    }
    id v11 = v8;
    if (v3) {
      [v8 becomeCurrent];
    }
  }
}

- (void)_setUserActivity:(id)a3
{
  char v7 = (NSUserActivity *)a3;
  [(NSLock *)self->_activityContinuationLock lock];
  uint64_t v5 = self->_currentUserActivity;
  if (self->_currentUserActivity != v7) {
    objc_storeStrong((id *)&self->_currentUserActivity, a3);
  }
  [(NSLock *)self->_activityContinuationLock unlock];
  int v6 = v7;
  if (v5 != v7)
  {
    if (v5)
    {
      [(id)UIApp _removeDocument:self forUserActivity:v5];
      int v6 = v7;
    }
    if (v6) {
      [(id)UIApp _addDocument:self forUserActivity:v7];
    }
  }
}

- (void)setUserActivity:(NSUserActivity *)userActivity
{
  v4 = userActivity;
  *(_WORD *)&self->_docFlags |= 0x4000u;
  if (pthread_main_np() == 1)
  {
    [(UIDocument *)self _setUserActivity:v4];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __30__UIDocument_setUserActivity___block_invoke;
    v5[3] = &unk_1E52D9F98;
    v5[4] = self;
    int v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __30__UIDocument_setUserActivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUserActivity:*(void *)(a1 + 40)];
}

- (NSUserActivity)userActivity
{
  BOOL v3 = [(UIDocument *)self _userActivity];
  if (!v3)
  {
    v4 = [(UIDocument *)self _defaultUserActivityType];
    uint64_t v5 = [(UIDocument *)self _defaultUserActivityForActivityType:v4];
    BOOL v3 = v5;
    if (v5) {
      [(UIDocument *)self _setUserActivity:v5];
    }
  }
  return (NSUserActivity *)v3;
}

- (id)_userActivity
{
  [(NSLock *)self->_activityContinuationLock lock];
  BOOL v3 = self->_currentUserActivity;
  [(NSLock *)self->_activityContinuationLock unlock];
  return v3;
}

- (void)_updateUserActivityState:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIDocument *)self localizedName];
  if ([v5 length])
  {
    id v6 = v5;
  }
  else
  {
    _UILocalizedString(@"com.apple.documents.userActivityTitle", @"The default title of a document user activity.", @"Document");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v7 = v6;
  [v4 setTitle:v6];
  uint64_t v8 = [(UIDocument *)self fileURL];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    id v11 = @"NSUserActivityDocumentURL";
    v12[0] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v4 addUserInfoEntriesFromDictionary:v10];
  }
}

- (void)openWithCompletionHandler:(void *)completionHandler
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = completionHandler;
  if ([(UIDocument *)self _isInOpen])
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = [(UIDocument *)self fileURL];
    [v14 handleFailureInMethod:a2, self, @"UIDocument.m", 689, @"attempt to open or a revert document that already has an open or revert operation in flight: %@", v15 object file lineNumber description];
  }
  id v6 = _UIDocumentLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = self;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "opening document: %@", buf, 0xCu);
  }

  [(UIDocument *)self _setInOpen:1];
  char v7 = [(UIDocument *)self fileURL];
  dispatch_get_current_queue();
  uint64_t v8 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  if (v8 == self->_fileAccessQueue)
  {
    uint64_t v9 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];

    uint64_t v8 = v9;
  }
  [(UIDocument *)self _registerAsFilePresenterIfNecessary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__UIDocument_openWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E52DC7E8;
  v16[4] = self;
  uint64_t v17 = v8;
  id v18 = v7;
  id v19 = v5;
  id v11 = v5;
  id v12 = v7;
  objc_super v13 = v8;
  [(UIDocument *)self performAsynchronousFileAccessUsingBlock:v16];
}

void __40__UIDocument_openWithCompletionHandler___block_invoke(id *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)a1[4] + 10, a1[5]);
  uint64_t v35 = 0;
  long long v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy__69;
  long long v39 = __Block_byref_object_dispose__69;
  id v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v42 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "attempting coordinated reading for document: %@", buf, 0xCu);
  }

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:a1[4]];
  id v5 = a1[6];
  id v30 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __40__UIDocument_openWithCompletionHandler___block_invoke_265;
  v29[3] = &unk_1E52EB7C8;
  v29[4] = a1[4];
  v29[5] = &v31;
  v29[6] = &v35;
  [v4 coordinateReadingItemAtURL:v5 options:0 error:&v30 byAccessor:v29];
  id v6 = v30;
  id v7 = v30;
  if (v7) {
    objc_storeStrong(v36 + 5, v6);
  }
  if (*((unsigned char *)v32 + 24))
  {
    uint64_t v8 = _UIDocumentLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = a1[4];
      *(_DWORD *)buf = 138412290;
      id v42 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "document will update file modification date on main thread: %@", buf, 0xCu);
    }

    id v10 = a1[4];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __40__UIDocument_openWithCompletionHandler___block_invoke_267;
    v27[3] = &unk_1E52D9F98;
    v27[4] = v10;
    id v28 = a1[6];
    [v10 _performBlockSynchronouslyOnMainThread:v27];
  }
  else if (!v36[5])
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
    id v12 = v36[5];
    v36[5] = (id)v11;
  }
  [a1[4] _setInOpen:0];
  [a1[4] _setOpen:*((unsigned __int8 *)v32 + 24)];
  if (*((unsigned char *)v32 + 24))
  {
    id v13 = a1[4];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __40__UIDocument_openWithCompletionHandler___block_invoke_269;
    v26[3] = &unk_1E52D9F70;
    v26[4] = v13;
    [v13 _performBlockOnMainThread:v26];
    uint64_t v14 = a1[4];
    if ((v14[96] & 8) == 0) {
      [v14 _updateLastUsedDate];
    }
  }
  else
  {
    uint64_t v15 = _UIDocumentLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = a1[4];
      id v17 = v36[5];
      *(_DWORD *)buf = 138412546;
      id v42 = v16;
      __int16 v43 = 2112;
      id v44 = v17;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "document: %@ failed with error: %@", buf, 0x16u);
    }

    [a1[4] handleError:v36[5] userInteractionPermitted:1];
    [a1[4] _unregisterAsFilePresenterIfNecessary];
  }
  if (a1[7])
  {
    id v18 = _UIDocumentLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = a1[4];
      *(_DWORD *)buf = 138412290;
      id v42 = v19;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "document will perform opening completion handler on calling queue: %@", buf, 0xCu);
    }

    id v20 = a1[4];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __40__UIDocument_openWithCompletionHandler___block_invoke_270;
    v23[3] = &unk_1E52EB7F0;
    v23[4] = v20;
    id v24 = a1[7];
    uint64_t v25 = &v31;
    [v20 _performBlock:v23 synchronouslyOnQueue:a1[5]];
  }
  id v21 = a1[4];
  uint64_t v22 = (void *)v21[10];
  v21[10] = 0;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

void __40__UIDocument_openWithCompletionHandler___block_invoke_265(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "file coordination lock received, now reading document: %@", buf, 0xCu);
  }

  id v6 = (void *)a1[4];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v6 readFromURL:v3 error:&obj];

  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v8;
}

uint64_t __40__UIDocument_openWithCompletionHandler___block_invoke_267(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document is updating file modification date on main thread: %@", (uint8_t *)&v7, 0xCu);
  }

  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 136) = CFAbsoluteTimeGetCurrent();
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [(id)objc_opt_class() _fileModificationDateForURL:*(void *)(a1 + 40)];
  [v4 setFileModificationDate:v5];

  return [*(id *)(a1 + 32) _updateLocalizedName];
}

uint64_t __40__UIDocument_openWithCompletionHandler___block_invoke_269(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDefaultUserActivityBecomingCurrent:1];
}

uint64_t __40__UIDocument_openWithCompletionHandler___block_invoke_270(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document is performing completion handler on calling queue: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_setFileURL:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "ui_URLByResolvingSymlinksAndCopyingSecurityScope");
  uint64_t v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  p_fileURL = (id *)&v5->_fileURL;
  if (v6 != v5->_fileURL)
  {
    if (v5->_progressSubscriber) {
      objc_msgSend(MEMORY[0x1E4F28F90], "_removeSubscriber:");
    }
    if ((*(_WORD *)&v5->_docFlags & 0x2000) != 0) {
      [*p_fileURL stopAccessingSecurityScopedResource];
    }
    objc_storeStrong((id *)&v5->_fileURL, v6);
    if (dyld_program_sdk_at_least())
    {
      if ([*p_fileURL startAccessingSecurityScopedResource]) {
        __int16 v8 = 0x2000;
      }
      else {
        __int16 v8 = 0;
      }
      *(_WORD *)&v5->___int16 docFlags = *(_WORD *)&v5->_docFlags & 0xDFFF | v8;
    }
    objc_initWeak(&location, v5);
    uint64_t v9 = (void *)MEMORY[0x1E4F28F90];
    fileURL = v5->_fileURL;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __26__UIDocument__setFileURL___block_invoke;
    v13[3] = &unk_1E52EB818;
    objc_copyWeak(&v14, &location);
    uint64_t v11 = [v9 _addSubscriberForFileURL:fileURL withPublishingHandler:v13];
    id progressSubscriber = v5->_progressSubscriber;
    v5->_id progressSubscriber = (id)v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v5);
  [(UIDocument *)v5 _updateConflictState];
}

id __26__UIDocument__setFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _progressPublished:v3];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __26__UIDocument__setFileURL___block_invoke_2;
  v9[3] = &unk_1E52D9960;
  objc_copyWeak(&v11, v4);
  id v6 = v3;
  id v10 = v6;
  uint64_t v7 = (void *)[v9 copy];

  objc_destroyWeak(&v11);
  return v7;
}

void __26__UIDocument__setFileURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _progressUnpublished:*(void *)(a1 + 32)];
}

- (NSURL)fileURL
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_fileURL;
  objc_sync_exit(v2);

  return v3;
}

- (void)setFileType:(id)a3
{
  uint64_t v7 = (NSString *)a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_fileType != v7)
  {
    uint64_t v5 = [(NSString *)v7 copy];
    fileType = v4->_fileType;
    v4->_fileType = (NSString *)v5;
  }
  objc_sync_exit(v4);
}

- (NSString)fileType
{
  v2 = self;
  objc_sync_enter(v2);
  fileType = v2->_fileType;
  if (fileType)
  {
    id v4 = fileType;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(UIDocument *)v2 fileURL];
    uint64_t v8 = 0;
    id v4 = [v5 _typeForContentsOfURL:v6 error:&v8];
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)setFileModificationDate:(NSDate *)fileModificationDate
{
  uint64_t v7 = fileModificationDate;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_fileModificationDate != v7)
  {
    uint64_t v5 = [(NSDate *)v7 copy];
    id v6 = v4->_fileModificationDate;
    v4->_fileModificationDate = (NSDate *)v5;
  }
  objc_sync_exit(v4);
}

- (NSDate)fileModificationDate
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_fileModificationDate;
  objc_sync_exit(v2);

  return v3;
}

- (void)_updateLastUsedDate
{
  if (FileProviderLibraryCore())
  {
    id v3 = [(UIDocument *)self fileURL];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__UIDocument__updateLastUsedDate__block_invoke;
    v10[3] = &unk_1E52EB840;
    v10[4] = self;
    id v4 = v10;
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v5 = (void (*)(void *, void *))getFPUpdateLastUsedDateSymbolLoc_ptr;
    uint64_t v15 = getFPUpdateLastUsedDateSymbolLoc_ptr;
    if (!getFPUpdateLastUsedDateSymbolLoc_ptr)
    {
      v10[5] = MEMORY[0x1E4F143A8];
      v10[6] = 3221225472;
      v10[7] = __getFPUpdateLastUsedDateSymbolLoc_block_invoke;
      v10[8] = &unk_1E52D9900;
      id v11 = &v12;
      id v6 = FileProviderLibrary_0();
      uint64_t v7 = dlsym(v6, "FPUpdateLastUsedDate");
      *(void *)(v11[1] + 24) = v7;
      getFPUpdateLastUsedDateSymbolLoc_ptr = *(_UNKNOWN **)(v11[1] + 24);
      uint64_t v5 = (void (*)(void *, void *))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (v5)
    {
      v5(v3, v4);
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void _FPUpdateLastUsedDate(CFURLRef, void (^__strong)(CFErrorRef))");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"UIDocument.m", 55, @"%s", dlerror());

      __break(1u);
    }
  }
}

void __33__UIDocument__updateLastUsedDate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = _UIDocumentLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = a2;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "error %@ while updating the last used date on document %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_setEditingTemporarilyDisabled:(BOOL)a3
{
}

- (BOOL)_isEditingTemporarilyDisabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*(_WORD *)&v2->_docFlags >> 7) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setEditingDisabledDueToPermissions:(BOOL)a3
{
}

- (BOOL)_isEditingDisabledDueToPermissions
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = HIBYTE(*(_WORD *)&v2->_docFlags) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setOpen:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(UIDocument *)self fileURL];
  uint64_t v5 = self;
  objc_sync_enter(v5);
  __int16 docFlags = (__int16)v5->_docFlags;
  unsigned int v7 = ((docFlags & 2) == 0) ^ v3;
  if ((v7 & 1) == 0)
  {
    if (v3) {
      __int16 v8 = 2;
    }
    else {
      __int16 v8 = 0;
    }
    __int16 docFlags = docFlags & 0xFFFD | v8;
    *(_WORD *)&v5->___int16 docFlags = docFlags;
  }
  int v9 = v7 ^ 1;
  if (v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28CE8] unresolvedConflictVersionsOfItemAtURL:v11];
    *(_WORD *)&v5->___int16 docFlags = *(_WORD *)&v5->_docFlags & 0xEFFF | (([v10 count] != 0) << 12);

    v9 |= (unsigned __int16)((*(_WORD *)&v5->_docFlags ^ docFlags) & 0x1000) >> 12;
  }
  objc_sync_exit(v5);

  [(UIDocument *)v5 _updatePermissionsState:v3];
  if (v9) {
    [(UIDocument *)v5 _sendStateChangedNotification];
  }
}

- (BOOL)_isOpen
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*(_WORD *)&v2->_docFlags >> 1) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setInOpen:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (v3) {
    __int16 v4 = 4;
  }
  else {
    __int16 v4 = 0;
  }
  *(_WORD *)&obj->___int16 docFlags = *(_WORD *)&obj->_docFlags & 0xFFFB | v4;
  objc_sync_exit(obj);
}

- (BOOL)_isInOpen
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*(_WORD *)&v2->_docFlags >> 2) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setHasSavingError:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  __int16 docFlags = (__int16)obj->_docFlags;
  if ((((docFlags & 0x800) == 0) ^ v3))
  {
    objc_sync_exit(obj);
  }
  else
  {
    if (v3) {
      __int16 v5 = 2048;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&obj->___int16 docFlags = docFlags & 0xF7FF | v5;
    objc_sync_exit(obj);

    [(UIDocument *)obj _sendStateChangedNotification];
  }
}

- (BOOL)_hasSavingError
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*(_WORD *)&v2->_docFlags >> 11) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setInConflict:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  __int16 docFlags = (__int16)obj->_docFlags;
  if ((((docFlags & 0x1000) == 0) ^ v3))
  {
    objc_sync_exit(obj);
  }
  else
  {
    if (v3) {
      __int16 v5 = 4096;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&obj->___int16 docFlags = docFlags & 0xEFFF | v5;
    objc_sync_exit(obj);

    [(UIDocument *)obj _sendStateChangedNotification];
  }
}

- (BOOL)_isInConflict
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*(_WORD *)&v2->_docFlags >> 12) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_sendStateChangedNotification
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _UIDocumentLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v6 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "document will send state changed notification on main thread: %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__UIDocument__sendStateChangedNotification__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(UIDocument *)self _performBlockSynchronouslyOnMainThread:v4];
}

void __43__UIDocument__sendStateChangedNotification__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document is sending state changed notification on main thread: %@", (uint8_t *)&v5, 0xCu);
  }

  __int16 v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"UIDocumentStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (UIDocumentState)documentState
{
  v2 = self;
  objc_sync_enter(v2);
  __docFlags docFlags = v2->_docFlags;
  uint64_t v4 = [(NSMutableSet *)v2->_progresses count];
  uint64_t v5 = (*(unsigned char *)&docFlags & 2) == 0;
  if ((*(_WORD *)&docFlags & 0x180) != 0) {
    v5 |= 8uLL;
  }
  UIDocumentState v6 = v5 | (*(unsigned int *)&docFlags >> 11) & 2 | (*(unsigned int *)&docFlags >> 9) & 4;
  if (v4) {
    UIDocumentState v7 = v6 | 0x10;
  }
  else {
    UIDocumentState v7 = v6;
  }
  objc_sync_exit(v2);

  return v7;
}

- (void)performAsynchronousFileAccessUsingBlock:(void *)block
{
  if (block)
  {
    fileAccessQueue = self->_fileAccessQueue;
    dispatch_async(fileAccessQueue, block);
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    NSStringFromSelector(a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 raise:v5, @"must pass a non-nil block to %@", v6 format];
  }
}

- (void)_lockFileAccessQueueAndPerformBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(void))a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  dispatch_get_current_queue();
  UIDocumentState v7 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  fileAccessQueue = self->_fileAccessQueue;

  if (has_internal_diagnostics)
  {
    if (v7 == fileAccessQueue) {
      goto LABEL_4;
    }
    int v9 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    uint64_t v10 = NSStringFromSelector(a2);
    int v14 = 138412290;
    uint64_t v15 = v10;
    _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "%@ must be called on the fileAccessQueue", (uint8_t *)&v14, 0xCu);
LABEL_12:

LABEL_13:
    goto LABEL_4;
  }
  if (v7 != fileAccessQueue)
  {
    uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_lockFileAccessQueueAndPerformBlock____s_category) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v9 = v12;
      uint64_t v10 = NSStringFromSelector(a2);
      int v14 = 138412290;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%@ must be called on the fileAccessQueue", (uint8_t *)&v14, 0xCu);
      goto LABEL_12;
    }
  }
LABEL_4:
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UIDocument.m" lineNumber:1051 description:@"UIDocument bug: file access queue is being locked without an unlock handler"];
  }
  v5[2](v5);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_fileAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_unlockFileAccessQueue
{
}

- (void)_progressPublished:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__UIDocument__progressPublished___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIDocument *)self _performBlockSynchronouslyOnMainThread:v6];
}

void __33__UIDocument__progressPublished___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 32) progress];
  [*(id *)(*(void *)(a1 + 32) + 184) addObject:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) progress];

  objc_sync_exit(v2);
  if (v3 != v4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 _sendStateChangedNotification];
  }
}

- (void)_progressUnpublished:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__UIDocument__progressUnpublished___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIDocument *)self _performBlockSynchronouslyOnMainThread:v6];
}

void __35__UIDocument__progressUnpublished___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 184) count];
  [*(id *)(*(void *)(a1 + 32) + 184) removeObject:*(void *)(a1 + 40)];
  LOBYTE(v3) = (v3 == 0) ^ ([*(id *)(*(void *)(a1 + 32) + 184) count] != 0);
  objc_sync_exit(v2);

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _sendStateChangedNotification];
  }
}

- (NSProgress)progress
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSMutableSet *)v2->_progresses allObjects];
  objc_sync_exit(v2);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__UIDocument_progress__block_invoke_2;
  v7[3] = &unk_1E52EB888;
  id v8 = &__block_literal_global_282_0;
  id v4 = [v3 sortedArrayUsingComparator:v7];
  id v5 = [v4 firstObject];

  return (NSProgress *)v5;
}

uint64_t __22__UIDocument_progress__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 kind];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F28898]];

  if (v4)
  {
    id v5 = [v2 userInfo];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28868]];

    if ([v6 isEqualToString:*MEMORY[0x1E4F28850]])
    {
      if ([v2 isIndeterminate]) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = 2;
      }
    }
    else if ([v6 isEqualToString:*MEMORY[0x1E4F28858]])
    {
      uint64_t v4 = 3;
    }
    else if ([v6 isEqualToString:*MEMORY[0x1E4F28880]])
    {
      uint64_t v4 = 4;
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  return v4;
}

uint64_t __22__UIDocument_progress__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  int v8 = v6(v5, a2);
  int v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  if (v8 < v9) {
    return -1;
  }
  else {
    return v9 < v8;
  }
}

+ (id)_customizationOfError:(id)a3 withDescription:(id)a4 recoverySuggestion:(id)a5 recoveryAttempter:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v9 userInfo];
  id v14 = (id)[v13 mutableCopy];

  if (!v14) {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [v14 setObject:v9 forKey:*MEMORY[0x1E4F28A50]];
  if (v10)
  {
    id v15 = v10;
  }
  else
  {
    id v15 = [v9 localizedDescription];
    if (!v15) {
      goto LABEL_7;
    }
  }
  [v14 setObject:v15 forKey:*MEMORY[0x1E4F28568]];

LABEL_7:
  uint64_t v16 = [v9 localizedFailureReason];
  if (v16) {
    [v14 setObject:v16 forKey:*MEMORY[0x1E4F28588]];
  }
  if (v11)
  {
    id v17 = v11;
  }
  else
  {
    id v17 = [v9 localizedRecoverySuggestion];
    if (!v17) {
      goto LABEL_13;
    }
  }
  [v14 setObject:v17 forKey:*MEMORY[0x1E4F285A0]];

LABEL_13:
  id v18 = [v9 localizedRecoveryOptions];
  if (v18) {
    [v14 setObject:v18 forKey:*MEMORY[0x1E4F28590]];
  }
  if (v12)
  {
    id v19 = v12;
  }
  else
  {
    id v19 = [v9 recoveryAttempter];
    if (!v19) {
      goto LABEL_19;
    }
  }
  [v14 setObject:v19 forKey:*MEMORY[0x1E4F288B8]];

LABEL_19:
  id v20 = (void *)MEMORY[0x1E4F28C58];
  id v21 = [v9 domain];
  uint64_t v22 = objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, objc_msgSend(v9, "code"), v14);

  return v22;
}

- (void)revertToContentsOfURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = url;
  int v8 = completionHandler;
  if (![(UIDocument *)self _isOpen])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [(UIDocument *)self fileURL];
    [v11 handleFailureInMethod:a2, self, @"UIDocument.m", 1176, @"attempt to revert document at URL (%@) to URL (%@) that is not yet open", v12, v7 object file lineNumber description];
  }
  id v9 = _UIDocumentLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "document: %@ reverting to contents of URL: %@", buf, 0x16u);
  }

  [(UIDocument *)self _setFileURL:v7];
  [(UIDocument *)self _setEditingTemporarilyDisabled:1];
  *(_WORD *)&self->_docFlags |= 8u;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__UIDocument_revertToContentsOfURL_completionHandler___block_invoke;
  v13[3] = &unk_1E52E45A0;
  void v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  [(UIDocument *)self openWithCompletionHandler:v13];
}

uint64_t __54__UIDocument_revertToContentsOfURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v5 = @"YES";
    }
    int v12 = 138412546;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document: %@ reverted successfully: %@", (uint8_t *)&v12, 0x16u);
  }

  *(_WORD *)(*(void *)(a1 + 32) + 192) &= ~8u;
  if (a2)
  {
    [*(id *)(a1 + 32) setFileType:0];
    [*(id *)(a1 + 32) updateChangeCount:3];
    id v7 = [*(id *)(a1 + 32) undoManager];
    char v8 = [v7 isUndoRegistrationEnabled];

    id v9 = [*(id *)(a1 + 32) undoManager];
    [v9 removeAllActions];

    if ((v8 & 1) == 0)
    {
      id v10 = [*(id *)(a1 + 32) undoManager];
      [v10 disableUndoRegistration];
    }
    [*(id *)(a1 + 32) _setEditingTemporarilyDisabled:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (BOOL)readFromURL:(NSURL *)url error:(NSError *)outError
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = url;
  id v7 = _UIDocumentLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "document performing readFromURL: %@", (uint8_t *)&buf, 0xCu);
  }

  if (outError) {
    *outError = 0;
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if (![(NSURL *)v6 isFileURL])
  {
    __int16 v14 = (void *)MEMORY[0x1E4F1CA00];
    NSStringFromSelector(sel_readFromURL_error_);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_loadFromContents_ofType_error_);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v14 raise:*MEMORY[0x1E4F1C3B8], @"you must override %@ or %@ to support reading files", v8, v9 format];
LABEL_20:

    goto LABEL_21;
  }
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v6 options:1 error:outError];
  if (v8)
  {
    id v9 = [(id)objc_opt_class() _typeForContentsOfURL:v6 error:outError];
    if (v9)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v27 = 0x3032000000;
      id v28 = __Block_byref_object_copy__69;
      objc_super v29 = __Block_byref_object_dispose__69;
      id v30 = 0;
      id v10 = [(UIDocument *)self _readingProgressForURL:v6];
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(v10, "becomeCurrentWithPendingUnitCount:", objc_msgSend(v10, "totalUnitCount"));
        [(UIDocument *)self _progressPublished:v10];
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __32__UIDocument_readFromURL_error___block_invoke;
      v17[3] = &unk_1E52EB8B0;
      id v20 = &v22;
      v17[4] = self;
      id v8 = v8;
      id v18 = v8;
      id v9 = v9;
      id v19 = v9;
      p_long long buf = &buf;
      openingQueue = self->_openingQueue;
      int v12 = openingQueue;
      if (!openingQueue)
      {
        int v12 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
        id v13 = MEMORY[0x1E4F14428];
      }
      [(UIDocument *)self _performBlock:v17 synchronouslyOnQueue:v12];
      if (!openingQueue) {

      }
      if (dyld_program_sdk_at_least())
      {
        [(UIDocument *)self _progressUnpublished:v10];
        [v10 resignCurrent];
      }
      if (outError) {
        *outError = (NSError *)*(id *)(*((void *)&buf + 1) + 40);
      }

      _Block_object_dispose(&buf, 8);
    }
    goto LABEL_20;
  }
LABEL_21:

  BOOL v15 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __32__UIDocument_readFromURL_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) isRegularFile];
  uint64_t v4 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) regularFileContents];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v6 + 40);
  char v7 = [v2 loadFromContents:v4 ofType:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
  if (v3) {
}
  }

- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError *)outError
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  char v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"%@ is a subclass responsibility but has not been overridden.", v7 format];

  return 0;
}

+ (void)_finishWritingToURL:(id)a3 withTemporaryDirectoryURL:(id)a4 newContentsURL:(id)a5 afterSuccess:(BOOL)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (v9 && !a6)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v14 = 0;
    char v11 = [v10 removeItemAtURL:v9 error:&v14];
    id v12 = v14;
    if ((v11 & 1) == 0)
    {
      id v13 = _UIDocumentLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v16 = v9;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "UIDocument could not delete the temporary item at %@. Here's the error:\n%@", buf, 0x16u);
      }
    }
  }
  [MEMORY[0x1E4F28CF0] _removeTemporaryDirectoryAtURL:v8];
}

- (id)_presentableFileNameForSaveOperation:(int64_t)a3 url:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 != 1
    || (id v11 = 0,
        [v5 getResourceValue:&v11 forKey:*MEMORY[0x1E4F1C6C8] error:0],
        (id v7 = v11) == 0))
  {
    id v8 = [v6 lastPathComponent];
    id v9 = [v8 stringByReplacingOccurrencesOfString:@":" withString:@"/"];
    id v7 = [v9 stringByDeletingPathExtension];
  }
  return v7;
}

- (id)_readingProgressForURL:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)MEMORY[0x1E4F28F90];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [MEMORY[0x1E4F28F90] currentProgress];
  uint64_t v7 = *MEMORY[0x1E4F28868];
  v12[0] = *MEMORY[0x1E4F28890];
  v12[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F28870];
  v13[0] = v4;
  v13[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v10 = (void *)[v5 initWithParent:v6 userInfo:v9];
  [v10 setKind:*MEMORY[0x1E4F28898]];
  [v10 setTotalUnitCount:1];
  return v10;
}

- (id)_writingProgressForURL:(id)a3 indeterminate:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F28F90];
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v8 = [MEMORY[0x1E4F28F90] currentProgress];
  uint64_t v9 = *MEMORY[0x1E4F28868];
  v15[0] = *MEMORY[0x1E4F28890];
  v15[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F28850];
  v16[0] = v6;
  v16[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v12 = (void *)[v7 initWithParent:v8 userInfo:v11];
  [v12 setKind:*MEMORY[0x1E4F28898]];
  if (v4) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 1;
  }
  [v12 setTotalUnitCount:v13];
  return v12;
}

- (BOOL)writeContents:(id)contents andAttributes:(NSDictionary *)additionalFileAttributes safelyToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation error:(NSError *)outError
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = contents;
  uint64_t v13 = additionalFileAttributes;
  id v14 = url;
  BOOL v15 = _UIDocumentLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v35 = self;
    _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "document performing writeContents:andAttributes:safelyToURL: %@", buf, 0xCu);
  }

  uint64_t v16 = objc_opt_class();
  __int16 v17 = [MEMORY[0x1E4F28CF0] _temporaryDirectoryURLForWritingToURL:v14 error:outError];
  id v18 = v17;
  if (v17)
  {
    uint64_t v32 = (void *)v16;
    uint64_t v33 = v13;
    uint64_t v19 = (void *)MEMORY[0x1E4F1CB10];
    id v20 = [v17 path];
    id v21 = [(NSURL *)v14 lastPathComponent];
    [v20 stringByAppendingPathComponent:v21];
    UIDocumentSaveOperation v22 = saveOperation;
    v24 = id v23 = v12;
    char v25 = [v19 fileURLWithPath:v24 isDirectory:0];

    id v12 = v23;
    UIDocumentSaveOperation v26 = v22;

    uint64_t v27 = [(UIDocument *)self fileURL];
    if ([(UIDocument *)self writeContents:v12 toURL:v25 forSaveOperation:v22 originalContentsURL:v27 error:outError])
    {
      id v28 = v32;
      uint64_t v13 = v33;
      if (v33)
      {
        if (v26 == UIDocumentSaveForOverwriting) {
          uint64_t v29 = [MEMORY[0x1E4F28CF0] _finishWritingToURL:v14 byTakingContentsFromItemAtURL:v25 addingAttributes:v33 usingTemporaryDirectoryAtURL:v18 backupFileName:0 error:outError];
        }
        else {
          uint64_t v29 = [MEMORY[0x1E4F28CF0] _finishWritingToURL:v14 byMovingItemAtURL:v25 addingAttributes:v33 error:outError];
        }
        BOOL v30 = v29;
      }
      else
      {
        BOOL v30 = 0;
      }
    }
    else
    {

      BOOL v30 = 0;
      char v25 = 0;
      id v28 = v32;
      uint64_t v13 = v33;
    }
    [v28 _finishWritingToURL:v14 withTemporaryDirectoryURL:v18 newContentsURL:v25 afterSuccess:v30];
  }
  else
  {
    LOBYTE(v30) = 0;
  }

  return v30;
}

- (BOOL)writeContents:(id)contents toURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation originalContentsURL:(NSURL *)originalContentsURL error:(NSError *)outError
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = contents;
  id v14 = url;
  BOOL v15 = originalContentsURL;
  uint64_t v16 = _UIDocumentLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    UIDocumentSaveOperation v26 = self;
    _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "document performing writeContents:toURL: %@", buf, 0xCu);
  }

  if (![(NSURL *)v14 isFileURL])
  {
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3B8];
    id v18 = NSStringFromSelector(a2);
    [v21 raise:v22, @"%@ must be overridden for your application to support non-'file:' URLs.", v18 format];
    BOOL v23 = 0;
    goto LABEL_18;
  }
  __int16 v17 = [(UIDocument *)self fileURL];
  id v18 = [(UIDocument *)self _writingProgressForURL:v17 indeterminate:1];

  if (dyld_program_sdk_at_least())
  {
    [v18 becomeCurrentWithPendingUnitCount:-1];
    [(UIDocument *)self _progressPublished:v18];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (saveOperation == UIDocumentSaveForOverwriting) {
      uint64_t v19 = v15;
    }
    else {
      uint64_t v19 = 0;
    }
    char v20 = [v13 writeToURL:v14 options:2 * (saveOperation == UIDocumentSaveForOverwriting) originalContentsURL:v19 error:outError];
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v20 = [v13 writeToURL:v14 atomically:0];
LABEL_14:
    BOOL v23 = v20;
    goto LABEL_16;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The default implementation of -[UIDocument writeContents:toURL:forSaveOperation:originalContentsURL:error: only understands contents of type NSFileWrapper or NSData, not %@. You must override one of the write methods to support custom content types", objc_opt_class() format];
  BOOL v23 = 0;
LABEL_16:
  if (dyld_program_sdk_at_least())
  {
    [(UIDocument *)self _progressUnpublished:v18];
    [v18 resignCurrent];
  }
LABEL_18:

  if (outError && !v23)
  {
    *outError = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:0];
  }

  return v23;
}

- (NSDictionary)fileAttributesToWriteToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation error:(NSError *)outError
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", url, saveOperation, outError);
  if (saveOperation != UIDocumentSaveForOverwriting)
  {
    id v7 = [NSNumber numberWithBool:1];
    [v6 setObject:v7 forKey:*MEMORY[0x1E4F282D0]];
  }
  return (NSDictionary *)v6;
}

+ (BOOL)_url:(id)a3 matchesURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 isEqual:v5];
  char v8 = v7;
  if (v6 && v5 && !v7)
  {
    id v14 = 0;
    uint64_t v9 = *MEMORY[0x1E4F1C5A0];
    int v10 = [v5 getResourceValue:&v14 forKey:*MEMORY[0x1E4F1C5A0] error:0];
    id v11 = v14;
    if (v10)
    {
      uint64_t v13 = 0;
      if ([v6 getResourceValue:&v13 forKey:v9 error:0]) {
        char v8 = [v11 isEqual:v13];
      }
    }
  }
  return v8;
}

- (BOOL)_coordinateWritingItemAtURL:(id)a3 error:(id *)a4 byAccessor:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  id v11 = [(UIDocument *)self fileURL];
  LOBYTE(v10) = [(id)v10 _url:v11 matchesURL:v8];

  if ((v10 & 1) == 0) {
    *(_WORD *)&self->_docFlags |= 0x400u;
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  __int16 docFlags = (__int16)self->_docFlags;
  id v14 = _UIDocumentLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((docFlags & 0x400) != 0)
  {
    if (v15)
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v33 = self;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "document: %@ attempting coordinated writing for moving to new URL: %@", buf, 0x16u);
    }

    id v18 = [(UIDocument *)self fileURL];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__UIDocument__coordinateWritingItemAtURL_error_byAccessor___block_invoke;
    v25[3] = &unk_1E52EB8D8;
    v25[4] = self;
    v27[1] = &v28;
    v27[0] = v9;
    id v26 = v12;
    [v26 coordinateWritingItemAtURL:v18 options:2 writingItemAtURL:v8 options:8 error:a4 byAccessor:v25];

    uint64_t v16 = (id *)v27;
    __int16 v17 = &v26;
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v33 = self;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "document attempting coordinated writing: %@", buf, 0xCu);
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__UIDocument__coordinateWritingItemAtURL_error_byAccessor___block_invoke_322;
    v22[3] = &unk_1E52EB900;
    v22[4] = self;
    v24[1] = &v28;
    v24[0] = v9;
    id v23 = v12;
    [v23 coordinateWritingItemAtURL:v8 options:0 error:a4 byAccessor:v22];
    uint64_t v16 = (id *)v24;
    __int16 v17 = &v23;
  }

  if (*((unsigned char *)v29 + 24))
  {
    BOOL v19 = 1;
  }
  else
  {
    char v20 = _UIDocumentLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v33 = self;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "document failed to start coordinated writing: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    BOOL v19 = *((unsigned char *)v29 + 24) != 0;
  }
  _Block_object_dispose(&v28, 8);

  return v19;
}

void __59__UIDocument__coordinateWritingItemAtURL_error_byAccessor___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document got coordinated writing lock, now writing: %@", (uint8_t *)&v7, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  (*(void (**)(void))(a1[6] + 16))();
}

void __59__UIDocument__coordinateWritingItemAtURL_error_byAccessor___block_invoke_322(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document got coordinated writing lock, now writing: %@", (uint8_t *)&v6, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)contentsForType:(NSString *)typeName error:(NSError *)outError
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document invoked default implementation of contentsForType:error: which only returns nil: %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)saveToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation completionHandler:(void *)completionHandler
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = url;
  uint64_t v9 = completionHandler;
  uint64_t v10 = [(UIDocument *)self savingFileType];
  id v11 = [(UIDocument *)self fileType];
  id v12 = v10;
  id v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_7;
  }
  id v14 = v13;
  if (v12 && v13)
  {
    int v15 = [v12 isEqual:v13];

    if (!v15) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v16 = v8;
    goto LABEL_10;
  }

LABEL_9:
  __int16 v17 = [(UIDocument *)self fileNameExtensionForType:v12 saveOperation:saveOperation];
  id v18 = [(NSURL *)v8 URLByDeletingPathExtension];
  uint64_t v16 = [v18 URLByAppendingPathExtension:v17];

LABEL_10:
  BOOL v19 = _UIDocumentLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413058;
    id v42 = self;
    __int16 v43 = 2112;
    id v44 = v8;
    __int16 v45 = 2112;
    id v46 = v12;
    __int16 v47 = 2112;
    v48 = v16;
    _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "document: %@ saving to URL: %@ with file type: %@, using final URL: %@", buf, 0x2Au);
  }
  uint64_t v30 = v8;

  id v40 = 0;
  char v20 = [(UIDocument *)self contentsForType:v12 error:&v40];
  id v21 = (NSURL *)v40;
  dispatch_get_current_queue();
  uint64_t v22 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  if (v22 == self->_fileAccessQueue)
  {
    char v25 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v26 = MEMORY[0x1E4F14428];

    uint64_t v22 = v25;
    if (v21) {
      goto LABEL_14;
    }
LABEL_21:
    [(UIDocument *)self _registerAsFilePresenterIfNecessary];
    uint64_t v27 = [(UIDocument *)self undoManager];
    [v27 _processEndOfEventNotification:0];

    uint64_t v28 = [(UIDocument *)self changeCountTokenForSaveOperation:saveOperation];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_323;
    v31[3] = &unk_1E52EB9A0;
    v31[4] = self;
    uint64_t v32 = v16;
    UIDocumentSaveOperation v37 = saveOperation;
    id v33 = v20;
    id v34 = v28;
    id v36 = v9;
    id v35 = v22;
    id v29 = v28;
    [(UIDocument *)self performAsynchronousFileAccessUsingBlock:v31];

    goto LABEL_22;
  }
  if (!v21) {
    goto LABEL_21;
  }
LABEL_14:
  id v23 = _UIDocumentLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v42 = self;
    __int16 v43 = 2112;
    id v44 = v21;
    _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "document: %@ got error from contentsForType:error: %@", buf, 0x16u);
  }

  [(UIDocument *)self handleError:v21 userInteractionPermitted:1];
  if (v9)
  {
    uint64_t v24 = _UIDocumentLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v42 = self;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "document will perform saving completion handler on completion handler queue: %@", buf, 0xCu);
    }

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke;
    v38[3] = &unk_1E52DA160;
    v38[4] = self;
    id v39 = v9;
    [(UIDocument *)self _performBlock:v38 synchronouslyOnQueue:v22];
  }
LABEL_22:
}

uint64_t __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document is performing saving completion handler on completion handler queue: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_323(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = (void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) fileURL];
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__69;
  char v31 = __Block_byref_object_dispose__69;
  id v32 = 0;
  id v4 = *v2;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_2;
  v18[3] = &unk_1E52EB978;
  uint64_t v5 = *(void *)(a1 + 80);
  v18[4] = v4;
  uint64_t v25 = v5;
  id v26 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 56);
  id v7 = v3;
  id v21 = v7;
  id v22 = *(id *)(a1 + 40);
  id v23 = &v33;
  uint64_t v24 = &v27;
  [v4 _coordinateWritingItemAtURL:v6 error:&v26 byAccessor:v18];
  id v8 = v26;
  if (v8)
  {
    [*(id *)(a1 + 32) handleError:v8 userInteractionPermitted:1];
  }
  else if (*((unsigned char *)v34 + 24))
  {
    [*(id *)(a1 + 32) _setOpen:1];
    [*(id *)(a1 + 32) _updateLastUsedDate];
  }
  else
  {
    uint64_t v9 = _UIDocumentLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = v28[5];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v38 = v10;
      __int16 v39 = 2112;
      uint64_t v40 = v11;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "document: %@ hit writing error: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) handleError:v28[5] userInteractionPermitted:1];
  }
  if (*(void *)(a1 + 72))
  {
    id v12 = _UIDocumentLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v38 = v13;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "document will perform saving completion handler on completion handler queue: %@", buf, 0xCu);
    }

    id v14 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_328;
    v15[3] = &unk_1E52EB7F0;
    v15[4] = v14;
    id v16 = *(id *)(a1 + 72);
    __int16 v17 = &v33;
    [v14 _performBlock:v15 synchronouslyOnQueue:*(void *)(a1 + 64)];
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
}

void __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_3;
    aBlock[3] = &unk_1E52EB928;
    aBlock[4] = *(void *)(a1 + 32);
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 88);
    id v25 = v8;
    uint64_t v27 = v9;
    id v26 = *(id *)(a1 + 40);
    uint64_t v10 = (uint64_t (**)(void *, id *))_Block_copy(aBlock);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_4;
    v17[3] = &unk_1E52EB950;
    v17[4] = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = *(void *)(a1 + 88);
    id v18 = v11;
    uint64_t v23 = v12;
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    id v22 = v5;
    uint64_t v13 = _Block_copy(v17);
    uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v14 + 40);
    char v15 = v10[2](v10, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v15;
    (*((void (**)(void *, void, void))v13 + 2))(v13, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  }
}

uint64_t __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 fileURL];
  id v6 = [v4 _writingProgressForURL:v5 indeterminate:0];

  if (dyld_program_sdk_at_least())
  {
    [v6 becomeCurrentWithPendingUnitCount:1];
    [*(id *)(a1 + 32) _progressPublished:v6];
  }
  id v7 = [*(id *)(a1 + 32) fileAttributesToWriteToURL:*(void *)(a1 + 40) forSaveOperation:*(void *)(a1 + 56) error:a2];
  uint64_t v8 = [*(id *)(a1 + 32) writeContents:*(void *)(a1 + 48) andAttributes:v7 safelyToURL:*(void *)(a1 + 40) forSaveOperation:*(void *)(a1 + 56) error:a2];
  if (dyld_program_sdk_at_least())
  {
    [*(id *)(a1 + 32) _progressUnpublished:v6];
    [v6 resignCurrent];
  }

  return v8;
}

void __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned int v3 = *(unsigned __int16 *)(v2 + 192);
  *(_WORD *)(v2 + 192) = v3 & 0xFBFF;
  if (a2)
  {
    int v5 = v3 & 0x400;
    int v6 = (v3 >> 10) & 1;
    id v7 = _UIDocumentLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "document will finish saving on main thread: %@", buf, 0xCu);
    }

    uint64_t v9 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_325;
    void v16[3] = &unk_1E52E7F00;
    v16[4] = v9;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 80);
    id v17 = v10;
    uint64_t v19 = v11;
    id v18 = *(id *)(a1 + 48);
    char v20 = v6;
    [v9 _performBlockSynchronouslyOnMainThread:v16];
    if (v5)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      [v12 removeItemAtURL:*(void *)(a1 + 56) error:0];
      uint64_t v13 = _UIDocumentLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 64);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v22 = v14;
        __int16 v23 = 2112;
        uint64_t v24 = v15;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "document: %@ did move to URL: %@", buf, 0x16u);
      }

      [*(id *)(a1 + 72) itemAtURL:*(void *)(a1 + 56) didMoveToURL:*(void *)(a1 + 64)];
    }
  }
}

void __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_325(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document is finishing saving on main thread: %@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) _finishSavingToURL:*(void *)(a1 + 40) forSaveOperation:*(void *)(a1 + 56) changeCount:*(void *)(a1 + 48)];
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 136) = CFAbsoluteTimeGetCurrent();
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) _updateDefaultUserActivityBecomingCurrent:1];
  }
}

uint64_t __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_328(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document is performing saving completion handler on completion handler queue: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_finishSavingToURL:(id)a3 forSaveOperation:(int64_t)a4 changeCount:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F1C530], *MEMORY[0x1E4F1C6C8], 0);
  id v10 = (id)[v14 resourceValuesForKeys:v9 error:0];

  uint64_t v11 = objc_opt_class();
  if ((unint64_t)a4 <= 1)
  {
    id v12 = (void *)v11;
    [(UIDocument *)self _setFileURL:v14];
    [(UIDocument *)self setFileType:0];
    uint64_t v13 = [v12 _fileModificationDateForURL:v14];
    [(UIDocument *)self setFileModificationDate:v13];

    [(UIDocument *)self _updateLocalizedName];
    [(UIDocument *)self updateChangeCountWithToken:v8 forSaveOperation:a4];
  }
}

- (double)_autosavingDelay
{
  return 15.0;
}

+ (void)_autosavingTimerDidFireSoContinue:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  v3[2]();
}

- (void)_autosavingCompletedSuccessfully:(BOOL)a3
{
  *(_WORD *)&self->_docFlags &= ~0x10u;
  if (a3)
  {
    if ([(UIDocument *)self hasUnsavedChanges]) {
      [(UIDocument *)self _scheduleAutosaving];
    }
    [(UIDocument *)self _updateLastUsedDate];
  }
}

- (void)_rescheduleAutosaving
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _UIDocumentLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "document is rescheduling autosaving: %@", (uint8_t *)&v9, 0xCu);
  }

  if ((*(_WORD *)&self->_docFlags & 0x10) == 0 && [(UIDocument *)self hasUnsavedChanges])
  {
    double v4 = self->_lastSaveTime - CFAbsoluteTimeGetCurrent() + 300.0;
    if (v4 <= 0.0)
    {
      *(_WORD *)&self->_docFlags |= 0x10u;
      [(UIDocument *)self _autosaveWithCompletionHandler:0];
    }
    else
    {
      double v5 = v4 / 300.0;
      if (v4 / 300.0 >= 0.5)
      {
        [(UIDocument *)self _autosavingDelay];
      }
      else if (v5 >= 0.25)
      {
        [(UIDocument *)self _autosavingDelay];
        double v7 = v8 * 0.5;
      }
      else
      {
        [(UIDocument *)self _autosavingDelay];
        double v7 = v6 * 0.125;
        if (v5 < 0.125 && v7 >= v4) {
          double v7 = v4;
        }
      }
      [(UIDocument *)self _scheduleAutosavingAfterDelay:1 reset:v7];
    }
  }
}

- (void)_scheduleAutosavingAfterDelay:(double)a3 reset:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_docFlags & 0x10) != 0
    || ((BOOL v5 = a4, v7 = [(UIDocument *)self hasUnsavedChanges], a3 < 1.79769313e308)
      ? (BOOL v8 = !v7)
      : (BOOL v8 = 1),
        v8))
  {
    if (self->_autosavingTimer)
    {
      int v9 = _UIDocumentLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v21 = self;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "document is unscheduling autosaving: %@", buf, 0xCu);
      }

      [(NSTimer *)self->_autosavingTimer invalidate];
      autosavingTimer = self->_autosavingTimer;
      self->_autosavingTimer = 0;
    }
  }
  else
  {
    uint64_t v11 = self->_autosavingTimer;
    if (!v11) {
      goto LABEL_16;
    }
    if (v5)
    {
      [(NSTimer *)v11 invalidate];
      id v12 = self->_autosavingTimer;
      self->_autosavingTimer = 0;
    }
    else
    {
      [(UIDocument *)self _rescheduleAutosaving];
    }
    if (!self->_autosavingTimer)
    {
LABEL_16:
      uint64_t v13 = _UIDocumentLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v21 = self;
        __int16 v22 = 2048;
        double v23 = a3;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "document: %@ scheduling autosaving with delay: %f", buf, 0x16u);
      }

      id v14 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v15 = objc_opt_class();
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __50__UIDocument__scheduleAutosavingAfterDelay_reset___block_invoke;
      v19[3] = &unk_1E52D9F70;
      v19[4] = self;
      id v16 = (void *)[v19 copy];
      id v17 = [v14 scheduledTimerWithTimeInterval:v15 target:sel__autosavingTimerDidFireSoContinue_ selector:v16 userInfo:0 repeats:a3];
      id v18 = self->_autosavingTimer;
      self->_autosavingTimer = v17;
    }
  }
}

uint64_t __50__UIDocument__scheduleAutosavingAfterDelay_reset___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0;

  *(_WORD *)(*(void *)(a1 + 32) + 192) |= 0x10u;
  double v4 = *(void **)(a1 + 32);
  return [v4 _autosaveWithCompletionHandler:0];
}

- (void)_scheduleAutosaving
{
  [(UIDocument *)self _autosavingDelay];
  -[UIDocument _scheduleAutosavingAfterDelay:reset:](self, "_scheduleAutosavingAfterDelay:reset:", 0);
}

- (void)_saveUnsavedChangesWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v15 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document will save if necessary: %@", buf, 0xCu);
  }

  dispatch_get_current_queue();
  double v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  if (v6 == self->_fileAccessQueue)
  {
    BOOL v7 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];

    double v6 = v7;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E52E3298;
  v11[4] = self;
  id v12 = v6;
  id v13 = v4;
  id v9 = v4;
  id v10 = v6;
  [(UIDocument *)self performAsynchronousFileAccessUsingBlock:v11];
}

void __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) hasUnsavedChanges];
  uint64_t v3 = _UIDocumentLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "document has unsaved changes and will now save: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_332;
    block[3] = &unk_1E52DA160;
    double v6 = *(NSObject **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    dispatch_async(v6, block);
    BOOL v7 = v14;
    goto LABEL_9;
  }
  if (v4)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "document is skipping saving because there are no unsaved changes: %@", buf, 0xCu);
  }

  id v9 = *(void **)(a1 + 48);
  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_333;
    v11[3] = &unk_1E52DA040;
    id v12 = v9;
    [v10 _performBlock:v11 synchronouslyOnQueue:*(void *)(a1 + 40)];
    BOOL v7 = v12;
LABEL_9:
  }
}

void __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_332(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 fileURL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E52E45A0;
  BOOL v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 saveToURL:v3 forSaveOperation:1 completionHandler:v5];
}

uint64_t __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E52D9FC0;
  v6[4] = v4;
  char v7 = a2;
  [v4 _performBlockSynchronouslyOnMainThread:v6];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _autosavingCompletedSuccessfully:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_333(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_autosaveWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v10 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document is invoking autosaving and waiting for completion handler: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__UIDocument__autosaveWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E52E45A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(UIDocument *)self autosaveWithCompletionHandler:v7];
}

uint64_t __45__UIDocument__autosaveWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document autosaving has completed and completion handler is now invoked: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)closeWithCompletionHandler:(void *)completionHandler
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = completionHandler;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  __int16 docFlags = (__int16)v5->_docFlags;
  if ((docFlags & 3) == 2)
  {
    *(_WORD *)&v5->___int16 docFlags = docFlags | 1;
    int v7 = _UIDocumentLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "document now closing: %@", buf, 0xCu);
    }

    autosavingTimer = v5->_autosavingTimer;
    if (autosavingTimer)
    {
      [(NSTimer *)autosavingTimer invalidate];
      uint64_t v9 = v5->_autosavingTimer;
      v5->_autosavingTimer = 0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__UIDocument_closeWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E52E45A0;
    v10[4] = v5;
    id v11 = v4;
    [(UIDocument *)v5 _saveUnsavedChangesWithCompletionHandler:v10];
  }
  objc_sync_exit(v5);
}

uint64_t __41__UIDocument_closeWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _unregisterAsFilePresenterIfNecessary];
  [*(id *)(a1 + 32) _setOpen:0];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(_WORD *)(*(void *)(a1 + 32) + 192) &= ~1u;
  objc_sync_exit(v2);

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)_hasUnsavedChanges
{
  uint64_t v3 = [(UIDocument *)self differenceSinceSaving];
  if ([v3 generationCount])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(UIDocument *)self differenceSinceSaving];
    BOOL v4 = [v5 changeCount] != 0;
  }
  return v4;
}

- (void)updateChangeCount:(UIDocumentChangeKind)change
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412546;
    uint64_t v29 = self;
    __int16 v30 = 2048;
    UIDocumentChangeKind v31 = change;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document: %@ updating change count with change type: %ld", (uint8_t *)&v28, 0x16u);
  }

  switch(change)
  {
    case UIDocumentChangeDone:
      if (![(UIDocument *)self _hasUnsavedChanges]) {
        self->_lastSaveTime = CFAbsoluteTimeGetCurrent();
      }
      id v6 = [(UIDocument *)self differenceSinceSaving];
      uint64_t v7 = [v6 changeCount];

      if (v7 < 0)
      {
        uint64_t v8 = [(UIDocument *)self differenceSinceSaving];
        objc_msgSend(v8, "setGenerationCount:", objc_msgSend(v8, "generationCount") + 1);
      }
      uint64_t v9 = [(UIDocument *)self differenceSinceSaving];
      objc_msgSend(v9, "setChangeCount:", objc_msgSend(v9, "changeCount") + 1);

      id v10 = [(UIDocument *)self differenceDueToRecentChanges];
      uint64_t v11 = [v10 changeCount];

      if (v11 < 0)
      {
        id v12 = [(UIDocument *)self differenceDueToRecentChanges];
        objc_msgSend(v12, "setGenerationCount:", objc_msgSend(v12, "generationCount") + 1);
      }
      id v13 = [(UIDocument *)self differenceDueToRecentChanges];
      objc_msgSend(v13, "setChangeCount:", objc_msgSend(v13, "changeCount") + 1);

      uint64_t v14 = [(UIDocument *)self differenceSincePreservingPreviousVersion];
      uint64_t v15 = [v14 changeCount];

      if (v15 < 0)
      {
        uint64_t v16 = [(UIDocument *)self differenceSincePreservingPreviousVersion];
        objc_msgSend(v16, "setGenerationCount:", objc_msgSend(v16, "generationCount") + 1);
      }
      uint64_t v17 = [(UIDocument *)self differenceSincePreservingPreviousVersion];
      goto LABEL_15;
    case UIDocumentChangeUndone:
      id v18 = [(UIDocument *)self differenceDueToRecentChanges];
      objc_msgSend(v18, "setChangeCount:", objc_msgSend(v18, "changeCount") - 1);

      uint64_t v19 = [(UIDocument *)self differenceSincePreservingPreviousVersion];
      objc_msgSend(v19, "setChangeCount:", objc_msgSend(v19, "changeCount") - 1);

      char v20 = [(UIDocument *)self differenceSinceSaving];
      uint64_t v21 = [v20 changeCount] - 1;
      goto LABEL_16;
    case UIDocumentChangeRedone:
      __int16 v22 = [(UIDocument *)self differenceDueToRecentChanges];
      objc_msgSend(v22, "setChangeCount:", objc_msgSend(v22, "changeCount") + 1);

      double v23 = [(UIDocument *)self differenceSincePreservingPreviousVersion];
      objc_msgSend(v23, "setChangeCount:", objc_msgSend(v23, "changeCount") + 1);

      uint64_t v17 = [(UIDocument *)self differenceSinceSaving];
LABEL_15:
      char v20 = v17;
      uint64_t v21 = [v17 changeCount] + 1;
LABEL_16:
      uint64_t v24 = v20;
      goto LABEL_18;
    case UIDocumentChangeCleared:
      uint64_t v25 = [(UIDocument *)self differenceSinceSaving];
      [v25 setGenerationCount:0];

      id v26 = [(UIDocument *)self differenceSinceSaving];
      [v26 setChangeCount:0];

      uint64_t v27 = [(UIDocument *)self differenceDueToRecentChanges];
      [v27 setGenerationCount:0];

      uint64_t v24 = [(UIDocument *)self differenceDueToRecentChanges];
      char v20 = v24;
      uint64_t v21 = 0;
LABEL_18:
      [v24 setChangeCount:v21];

      break;
    default:
      break;
  }
  [(UIDocument *)self _scheduleAutosaving];
}

- (id)changeCountTokenForSaveOperation:(UIDocumentSaveOperation)saveOperation
{
  uint64_t v5 = objc_alloc_init(NSDocumentDifferenceSizeTriple);
  id v6 = [(UIDocument *)self differenceDueToRecentChanges];
  uint64_t v7 = [v6 generationCount];
  uint64_t v8 = [(NSDocumentDifferenceSizeTriple *)v5 dueToRecentChangesBeforeSaving];
  [v8 setGenerationCount:v7];

  uint64_t v9 = [(UIDocument *)self differenceDueToRecentChanges];
  uint64_t v10 = [v9 changeCount];
  uint64_t v11 = [(NSDocumentDifferenceSizeTriple *)v5 dueToRecentChangesBeforeSaving];
  [v11 setChangeCount:v10];

  id v12 = [(UIDocument *)self differenceSincePreservingPreviousVersion];
  uint64_t v13 = [v12 generationCount];
  uint64_t v14 = [(NSDocumentDifferenceSizeTriple *)v5 betweenPreservingPreviousVersionAndSaving];
  [v14 setGenerationCount:v13];

  uint64_t v15 = [(UIDocument *)self differenceSincePreservingPreviousVersion];
  uint64_t v16 = [v15 changeCount];
  uint64_t v17 = [(NSDocumentDifferenceSizeTriple *)v5 betweenPreservingPreviousVersionAndSaving];
  [v17 setChangeCount:v16];

  if ((unint64_t)saveOperation > UIDocumentSaveForOverwriting)
  {
    uint64_t v24 = [(NSDocumentDifferenceSizeTriple *)v5 betweenPreviousSavingAndSaving];
    [v24 setGenerationCount:0];

    uint64_t v21 = [(NSDocumentDifferenceSizeTriple *)v5 betweenPreviousSavingAndSaving];
    [v21 setChangeCount:0];
  }
  else
  {
    id v18 = [(UIDocument *)self differenceSinceSaving];
    uint64_t v19 = [v18 generationCount];
    char v20 = [(NSDocumentDifferenceSizeTriple *)v5 betweenPreviousSavingAndSaving];
    [v20 setGenerationCount:v19];

    uint64_t v21 = [(UIDocument *)self differenceSinceSaving];
    uint64_t v22 = [v21 changeCount];
    double v23 = [(NSDocumentDifferenceSizeTriple *)v5 betweenPreviousSavingAndSaving];
    [v23 setChangeCount:v22];
  }
  return v5;
}

- (void)updateChangeCountWithToken:(id)changeCountToken forSaveOperation:(UIDocumentSaveOperation)saveOperation
{
  if ((unint64_t)saveOperation <= UIDocumentSaveForOverwriting)
  {
    id v5 = changeCountToken;
    id v6 = [(UIDocument *)self differenceSinceSaving];
    uint64_t v7 = [v5 betweenPreviousSavingAndSaving];
    objc_msgSend(v6, "setGenerationCount:", objc_msgSend(v6, "generationCount") - objc_msgSend(v7, "generationCount"));

    uint64_t v8 = [(UIDocument *)self differenceSinceSaving];
    uint64_t v9 = [v5 betweenPreviousSavingAndSaving];
    objc_msgSend(v8, "setChangeCount:", objc_msgSend(v8, "changeCount") - objc_msgSend(v9, "changeCount"));

    uint64_t v10 = [(UIDocument *)self differenceDueToRecentChanges];
    uint64_t v11 = [v5 dueToRecentChangesBeforeSaving];
    objc_msgSend(v10, "setGenerationCount:", objc_msgSend(v10, "generationCount") - objc_msgSend(v11, "generationCount"));

    id v12 = [(UIDocument *)self differenceDueToRecentChanges];
    uint64_t v13 = [v5 dueToRecentChangesBeforeSaving];
    objc_msgSend(v12, "setChangeCount:", objc_msgSend(v12, "changeCount") - objc_msgSend(v13, "changeCount"));

    uint64_t v14 = [(UIDocument *)self differenceSincePreservingPreviousVersion];
    uint64_t v15 = [v5 betweenPreservingPreviousVersionAndSaving];
    objc_msgSend(v14, "setGenerationCount:", objc_msgSend(v14, "generationCount") - objc_msgSend(v15, "generationCount"));

    uint64_t v16 = [(UIDocument *)self differenceSincePreservingPreviousVersion];
    uint64_t v17 = [v5 dueToRecentChangesBeforeSaving];

    objc_msgSend(v16, "setChangeCount:", objc_msgSend(v16, "changeCount") - objc_msgSend(v17, "changeCount"));
  }
  [(UIDocument *)self _scheduleAutosaving];
}

- (void)_changeWasDone:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document undoManager change was done: %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = [v4 object];
  uint64_t v7 = [v6 groupingLevel];

  if (v7 <= 1)
  {
    uint64_t v8 = [v4 userInfo];
    uint64_t v9 = [v8 objectForKey:@"NSUndoManagerGroupIsEmpty"];
    char v10 = [v9 BOOLValue];

    if ((v10 & 1) == 0) {
      [(UIDocument *)self updateChangeCount:0];
    }
  }
}

- (void)_changeWasUndone:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document undoManager change was undone: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((*(_WORD *)&self->_docFlags & 0x40) == 0) {
    [(UIDocument *)self updateChangeCount:1];
  }
}

- (void)_changeWasRedone:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document undoManager change was redone: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((*(_WORD *)&self->_docFlags & 0x40) == 0) {
    [(UIDocument *)self updateChangeCount:2];
  }
}

- (void)_releaseUndoManager
{
  if (self->_undoManager)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F28A80] object:self->_undoManager];
    [v4 removeObserver:self name:*MEMORY[0x1E4F28A78] object:self->_undoManager];
    [v4 removeObserver:self name:*MEMORY[0x1E4F28A88] object:self->_undoManager];
    [v4 removeObserver:self name:*MEMORY[0x1E4F28A70] object:self->_undoManager];
    undoManager = self->_undoManager;
    self->_undoManager = 0;
  }
}

- (void)setUndoManager:(NSUndoManager *)undoManager
{
  int v5 = undoManager;
  id v6 = self->_undoManager;
  uint64_t v8 = v5;
  if (v6 != v5)
  {
    if (v6) {
      [(UIDocument *)self _releaseUndoManager];
    }
    objc_storeStrong((id *)&self->_undoManager, undoManager);
    if (self->_undoManager)
    {
      uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:self selector:sel__changeWasUndone_ name:*MEMORY[0x1E4F28A80] object:self->_undoManager];
      [v7 addObserver:self selector:sel__changeWasRedone_ name:*MEMORY[0x1E4F28A78] object:self->_undoManager];
      [v7 addObserver:self selector:sel__changeWasDone_ name:*MEMORY[0x1E4F28A88] object:self->_undoManager];
    }
  }
}

- (NSUndoManager)undoManager
{
  undoManager = self->_undoManager;
  if (undoManager)
  {
    uint64_t v3 = undoManager;
  }
  else
  {
    uint64_t v3 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E4F29140]);
    [(UIDocument *)self setUndoManager:v3];
  }
  return v3;
}

- (void)handleError:(NSError *)error userInteractionPermitted:(BOOL)userInteractionPermitted
{
  BOOL v4 = userInteractionPermitted;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = error;
  uint64_t v7 = _UIDocumentLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    double v23 = v6;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "document: %@ handling error: %@", buf, 0x16u);
  }

  uint64_t v8 = [(NSError *)v6 recoveryAttempter];
  uint64_t v9 = (void *)v8;
  if (v4 && v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ![v9 attemptSilentRecoveryFromError:v6 error:0])
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__UIDocument_handleError_userInteractionPermitted___block_invoke;
      v18[3] = &unk_1E52DA660;
      v18[4] = self;
      uint64_t v19 = v6;
      id v16 = +[UIDocumentAlertPresenter _presentAlertWithError:v19 completionHandler:v18];
      id alertPresenter = self->_alertPresenter;
      self->_id alertPresenter = v16;

      goto LABEL_13;
    }
    char v10 = self;
    int v11 = v6;
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v13 = _UIDocumentLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(NSError *)v6 localizedDescription];
      uint64_t v15 = [(NSError *)v6 localizedFailureReason];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      double v23 = v15;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "UIDocument unrecoverable error with description: %@ reason: %@", buf, 0x16u);
    }
    char v10 = self;
    int v11 = v6;
    uint64_t v12 = 0;
  }
  [(UIDocument *)v10 finishedHandlingError:v11 recovered:v12];
LABEL_13:
}

uint64_t __51__UIDocument_handleError_userInteractionPermitted___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 168);
  *(void *)(v4 + 168) = 0;

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  return [v6 finishedHandlingError:v7 recovered:a2];
}

- (void)finishedHandlingError:(NSError *)error recovered:(BOOL)recovered
{
  BOOL v4 = recovered;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = error;
  if (!v4)
  {
    uint64_t v7 = _UIDocumentLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(NSError *)v6 localizedDescription];
      uint64_t v9 = [(NSError *)v6 localizedFailureReason];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Failed to recover from error with description: %@ reason: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(UIDocument *)self _setHasSavingError:!v4];
}

- (void)userInteractionNoLongerPermittedForError:(NSError *)error
{
}

- (void)_updateLocalizedName
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v4 = [(NSURL *)v2->_fileURL path];
  int v5 = [v3 displayNameAtPath:v4];
  uint64_t v6 = [v5 stringByDeletingPathExtension];
  localizedName = v2->_localizedName;
  v2->_localizedName = (NSString *)v6;

  objc_sync_exit(v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__UIDocument__updateLocalizedName__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __34__UIDocument__updateLocalizedName__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"UIDocumentLocalizedNameChangedNotification" object:*(void *)(a1 + 32)];
}

- (NSString)localizedName
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_localizedName;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)fileNameExtensionForType:(NSString *)typeName saveOperation:(UIDocumentSaveOperation)saveOperation
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", typeName, saveOperation);
  int v5 = [v4 preferredFilenameExtension];

  return (NSString *)v5;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_filePresenterQueue;
}

- (void)relinquishPresentedItemToReader:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void))a3;
  int v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document relinquishing to reader: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4) {
    v4[2](v4, 0);
  }
}

- (BOOL)_shouldAllowWritingInResponseToPresenterMessage
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (*(_WORD *)&v2->_docFlags & 6) == 2;
  objc_sync_exit(v2);

  return v3;
}

- (void)_updatePermissionsState:(BOOL)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (a3 && dyld_program_sdk_at_least())
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
    int v5 = [(UIDocument *)self fileURL];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__UIDocument__updatePermissionsState___block_invoke;
    v6[3] = &unk_1E52EB9C8;
    v6[4] = self;
    void v6[5] = &v7;
    [v4 coordinateReadingItemAtURL:v5 options:4 error:0 byAccessor:v6];
  }
  [(UIDocument *)self _setEditingDisabledDueToPermissions:*((unsigned __int8 *)v8 + 24)];
  _Block_object_dispose(&v7, 8);
}

void __38__UIDocument__updatePermissionsState___block_invoke(uint64_t a1)
{
  id v4 = (id)objc_opt_new();
  id v2 = [*(id *)(a1 + 32) fileURL];
  BOOL v3 = [v2 path];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v4 isWritableFileAtPath:v3] ^ 1;
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document relinquishing to writer: %@", buf, 0xCu);
  }

  if ([(UIDocument *)self _shouldAllowWritingInResponseToPresenterMessage])
  {
    if (v4)
    {
      BOOL v6 = [(UIDocument *)self _isEditingTemporarilyDisabled];
      [(UIDocument *)self _setEditingTemporarilyDisabled:1];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [(UIDocument *)self fileURL];
      if (v8)
      {
        uint64_t v9 = [v7 _fileModificationDateForURL:v8];
      }
      else
      {
        uint64_t v9 = 0;
      }
      char v10 = _UIDocumentLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v18 = self;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "document waiting for writer to finish and invoke reacquirer: %@", buf, 0xCu);
      }

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __46__UIDocument_relinquishPresentedItemToWriter___block_invoke;
      void v13[3] = &unk_1E52EB9F0;
      BOOL v16 = v6;
      void v13[4] = self;
      id v14 = v9;
      uint64_t v15 = v7;
      int v11 = (void (*)(void *, void *))v4[2];
      id v12 = v9;
      v11(v4, v13);
    }
  }
  else if (v4)
  {
    ((void (*)(void *, void))v4[2])(v4, 0);
  }
}

void __46__UIDocument_relinquishPresentedItemToWriter___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document finished waiting for writer and the reacquirer is now invoked: %@", buf, 0xCu);
  }

  id v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document will respond to writer on main thread: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) _updatePermissionsState:1];
  BOOL v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__UIDocument_relinquishPresentedItemToWriter___block_invoke_346;
  v9[3] = &unk_1E52EB9F0;
  void v9[4] = v6;
  char v12 = *(unsigned char *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 _performBlockSynchronouslyOnMainThread:v9];
}

void __46__UIDocument_relinquishPresentedItemToWriter___block_invoke_346(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v19 = 138412290;
    uint64_t v20 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document is responding to writer on main thread: %@", (uint8_t *)&v19, 0xCu);
  }

  if ([*(id *)(a1 + 32) _shouldAllowWritingInResponseToPresenterMessage])
  {
    id v4 = [*(id *)(a1 + 32) fileURL];
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v6 = [v4 path];
    char v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
      if (v4 && *(void *)(a1 + 40))
      {
        uint64_t v8 = [*(id *)(a1 + 48) _fileModificationDateForURL:v4];
        uint64_t v9 = v8;
        if (v8 && ([v8 isEqual:*(void *)(a1 + 40)] & 1) == 0)
        {
          [*(id *)(a1 + 32) revertToContentsOfURL:v4 completionHandler:0];

          goto LABEL_22;
        }
        id v10 = _UIDocumentLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 40);
          int v19 = 138412802;
          uint64_t v20 = v11;
          __int16 v21 = 2112;
          __int16 v22 = v9;
          __int16 v23 = 2112;
          uint64_t v24 = v12;
          _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "document: %@ skipping revert with newModifcationDate: %@ and oldModificationDate: %@", (uint8_t *)&v19, 0x20u);
        }
      }
      else
      {
        uint64_t v9 = _UIDocumentLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          uint64_t v18 = *(void *)(a1 + 40);
          int v19 = 138412802;
          uint64_t v20 = v17;
          __int16 v21 = 2112;
          __int16 v22 = v4;
          __int16 v23 = 2112;
          uint64_t v24 = v18;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "document: %@ skipping revert because fileURL: %@ or oldModificationDate: %@ is nil", (uint8_t *)&v19, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v15 = _UIDocumentLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v19 = 138412290;
        uint64_t v20 = v16;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "document deleted by writer, so initiating save: %@", (uint8_t *)&v19, 0xCu);
      }

      [*(id *)(a1 + 32) saveToURL:v4 forSaveOperation:0 completionHandler:0];
    }
    [*(id *)(a1 + 32) _setEditingTemporarilyDisabled:*(unsigned __int8 *)(a1 + 56)];
LABEL_22:

    return;
  }
  uint64_t v13 = _UIDocumentLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v19 = 138412290;
    uint64_t v20 = v14;
    _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "document was moved from open to closed while handling writer, stopping processing: %@", (uint8_t *)&v19, 0xCu);
  }

  [*(id *)(a1 + 32) _setEditingTemporarilyDisabled:*(unsigned __int8 *)(a1 + 56)];
}

- (void)savePresentedItemChangesWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v10 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document saving presented item changes: %@", buf, 0xCu);
  }

  if ([(UIDocument *)self _shouldAllowWritingInResponseToPresenterMessage])
  {
    BOOL v6 = _UIDocumentLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = self;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "document will save changes on main thread: %@", buf, 0xCu);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__UIDocument_savePresentedItemChangesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E52DA160;
    void v7[4] = self;
    id v8 = v4;
    [(UIDocument *)self _performBlockSynchronouslyOnMainThread:v7];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __60__UIDocument_savePresentedItemChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "document is saving changes on main thread: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__UIDocument_savePresentedItemChangesWithCompletionHandler___block_invoke_348;
  v5[3] = &unk_1E52D9FE8;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 _saveUnsavedChangesWithCompletionHandler:v5];
}

uint64_t __60__UIDocument_savePresentedItemChangesWithCompletionHandler___block_invoke_348(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_applicationWillResignActive:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document is handling application resigning active: %@", (uint8_t *)&buf, 0xCu);
  }

  if ([(UIDocument *)self _isOpen])
  {
    id v6 = [MEMORY[0x1E4F96478] currentProcess];
    char v7 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.uikit" name:@"SaveDocument"];
    id v8 = objc_alloc(MEMORY[0x1E4F96318]);
    UIDocumentChangeKind v31 = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    id v10 = (void *)[v8 initWithExplanation:@"UIDocument resigning as file presenter" target:v6 attributes:v9];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __43__UIDocument__applicationWillResignActive___block_invoke;
    v26[3] = &unk_1E52EBA18;
    v26[4] = self;
    [v10 acquireWithInvalidationHandler:v26];
    uint64_t v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __43__UIDocument__applicationWillResignActive___block_invoke_362;
    v24[3] = &unk_1E52DA660;
    v24[4] = self;
    uint64_t v12 = v11;
    uint64_t v25 = v12;
    [(UIDocument *)self _saveUnsavedChangesWithCompletionHandler:v24];
    if (FileProviderLibraryCore())
    {
      uint64_t v13 = [(UIDocument *)self fileURL];
      uint64_t v27 = 0;
      int v28 = &v27;
      uint64_t v29 = 0x2020000000;
      uint64_t v14 = (void (*)(void *, void))getFPCreateBookmarkableStringFromDocumentURLSymbolLoc_ptr;
      __int16 v30 = getFPCreateBookmarkableStringFromDocumentURLSymbolLoc_ptr;
      if (!getFPCreateBookmarkableStringFromDocumentURLSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v33 = __getFPCreateBookmarkableStringFromDocumentURLSymbolLoc_block_invoke;
        id v34 = &unk_1E52D9900;
        uint64_t v35 = &v27;
        uint64_t v15 = FileProviderLibrary_0();
        uint64_t v16 = dlsym(v15, "FPCreateBookmarkableStringFromDocumentURL");
        *(void *)(v35[1] + 24) = v16;
        getFPCreateBookmarkableStringFromDocumentURLSymbolLoc_ptr = *(_UNKNOWN **)(v35[1] + 24);
        uint64_t v14 = (void (*)(void *, void))v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (!v14)
      {
        uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
        __int16 v21 = objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef _FPCreateBookmarkableStringFromDocumentURL(CFURLRef, CFErrorRef *)");
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"UIDocument.m", 56, @"%s", dlerror());

        __break(1u);
      }
      v14(v13, 0);
      uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      fileBookmark = self->_fileBookmark;
      self->_fileBookmark = v17;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__UIDocument__applicationWillResignActive___block_invoke_363;
    block[3] = &unk_1E52D9F70;
    id v23 = v10;
    id v19 = v10;
    dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);
  }
}

void __43__UIDocument__applicationWillResignActive___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "document saving on resign active expired with error %@: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __43__UIDocument__applicationWillResignActive___block_invoke_362(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _unregisterAsFilePresenterIfNecessary];
  id v2 = _UIDocumentLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_INFO, "document saving on resign active finished: %@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __43__UIDocument__applicationWillResignActive___block_invoke_363(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    int v7 = self;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document is handling application becoming active: %@", buf, 0xCu);
  }

  if ([(UIDocument *)self _isOpen])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__UIDocument__applicationDidBecomeActive___block_invoke;
    v5[3] = &unk_1E52D9F70;
    void v5[4] = self;
    [(UIDocument *)self performAsynchronousFileAccessUsingBlock:v5];
  }
}

void __42__UIDocument__applicationDidBecomeActive___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _registerAsFilePresenterIfNecessary];
  id v2 = *(void **)(a1 + 32);
  if (!v2[4]) {
    goto LABEL_17;
  }
  uint64_t v3 = FileProviderLibraryCore();
  id v2 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_17;
  }
  int v4 = [v2 fileURL];
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v6 = (void (*)(uint64_t, void **))getFPCreateDocumentURLFromBookmarkableStringSymbolLoc_ptr;
  UIDocumentSaveOperation v37 = getFPCreateDocumentURLFromBookmarkableStringSymbolLoc_ptr;
  if (!getFPCreateDocumentURLFromBookmarkableStringSymbolLoc_ptr)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = __getFPCreateDocumentURLFromBookmarkableStringSymbolLoc_block_invoke;
    uint64_t v40 = &unk_1E52D9900;
    uint64_t v41 = &v34;
    int v7 = FileProviderLibrary_0();
    uint64_t v8 = dlsym(v7, "FPCreateDocumentURLFromBookmarkableString");
    *(void *)(v41[1] + 24) = v8;
    getFPCreateDocumentURLFromBookmarkableStringSymbolLoc_ptr = *(_UNKNOWN **)(v41[1] + 24);
    uint64_t v6 = (void (*)(uint64_t, void **))v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v6)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v30 = objc_msgSend(NSString, "stringWithUTF8String:", "CFURLRef _FPCreateDocumentURLFromBookmarkableString(CFStringRef, CFErrorRef *)");
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"UIDocument.m", 57, @"%s", dlerror());

    __break(1u);
  }
  __int16 v9 = v6(v5, &v33);
  uint64_t v10 = v9;
  if (v9)
  {
    if (([v9 isEqual:v4] & 1) == 0)
    {
      uint64_t v11 = _UIDocumentLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void **)(a1 + 32);
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v40 = v12;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "document moved from %@ to %@: %@", buf, 0x20u);
      }

      uint64_t v13 = (void *)MEMORY[0x1E4F28B48];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __42__UIDocument__applicationDidBecomeActive___block_invoke_365;
      v31[3] = &unk_1E52D9F98;
      v31[4] = *(void *)(a1 + 32);
      id v32 = v10;
      uint64_t v14 = [v13 blockOperationWithBlock:v31];
      uint64_t v15 = [*(id *)(a1 + 32) presentedItemOperationQueue];
      uint64_t v38 = v14;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      [v15 addOperations:v16 waitUntilFinished:1];
    }
LABEL_16:

    id v2 = *(void **)(a1 + 32);
LABEL_17:
    __int16 v21 = [v2 fileURL];
    __int16 v22 = +[UIDocument _fileModificationDateForURL:v21];
    id v23 = [*(id *)(a1 + 32) fileModificationDate];
    int v24 = [v22 isEqualToDate:v23];

    uint64_t v25 = *(void **)(a1 + 32);
    if (v24)
    {
      [v25 _updateConflictState];
    }
    else
    {
      id v26 = [v25 fileURL];
      [v25 revertToContentsOfURL:v26 completionHandler:0];
    }
    return;
  }
  uint64_t v17 = v33;
  int v18 = [v4 checkPromisedItemIsReachableAndReturnError:0];
  id v19 = _UIDocumentLog();
  uint64_t v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_error_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "document is unable to resolve document bookmark, but file still exists: %@", buf, 0xCu);
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v27;
    _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "document is unable to resolve document bookmark and original is gone, forcing re-save: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) saveToURL:v4 forSaveOperation:0 completionHandler:0];
}

uint64_t __42__UIDocument__applicationDidBecomeActive___block_invoke_365(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentedItemDidMoveToURL:*(void *)(a1 + 40)];
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void))a3;
  uint64_t v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document presented item will be deleted: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4) {
    v4[2](v4, 0);
  }
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document: %@ did move to new URL: %@", buf, 0x16u);
  }

  [(UIDocument *)self _setFileURL:v4];
  [(UIDocument *)self _updateLocalizedName];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__UIDocument_presentedItemDidMoveToURL___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  [(UIDocument *)self _performBlockOnMainThread:v6];
}

uint64_t __40__UIDocument_presentedItemDidMoveToURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDefaultUserActivityBecomingCurrent:0];
}

- (void)presentedItemDidChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _UIDocumentLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "document presented item did change: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_updateConflictState
{
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__UIDocument__updateConflictState__block_invoke;
  block[3] = &unk_1E52D9F70;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __34__UIDocument__updateConflictState__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28CE8];
  id v4 = [*(id *)(a1 + 32) fileURL];
  uint64_t v3 = [v2 unresolvedConflictVersionsOfItemAtURL:v4];
  objc_msgSend(*(id *)(a1 + 32), "_setInConflict:", objc_msgSend(v3, "count") != 0);
}

- (void)presentedItemDidGainVersion:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document did gain version: %@", (uint8_t *)&v5, 0xCu);
  }

  [(UIDocument *)self _updateConflictState];
}

- (void)presentedItemDidLoseVersion:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document did lose version: %@", (uint8_t *)&v5, 0xCu);
  }

  [(UIDocument *)self _updateConflictState];
}

- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v8 = _UIDocumentLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "document: %@ subitem will be deleted at URL: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7) {
    v7[2](v7, 0);
  }
}

- (void)presentedSubitemDidAppearAtURL:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document: %@ subitem did appear at URL: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)presentedSubitemDidChangeAtURL:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _UIDocumentLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "document: %@ subitem did change at URL: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)presentedSubitemAtURL:(id)a3 didMoveToURL:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = _UIDocumentLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "document: %@ subitem at URL: %@ did move to URL: %@", (uint8_t *)&v9, 0x20u);
  }

  [(UIDocument *)self _updateConflictState];
}

- (void)presentedSubitemAtURL:(id)a3 didGainVersion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _UIDocumentLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    __int16 v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "document: %@ subitem did gain version at URL: %@", (uint8_t *)&v7, 0x16u);
  }

  [(UIDocument *)self _updateConflictState];
}

- (void)presentedSubitemAtURL:(id)a3 didLoseVersion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _UIDocumentLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    __int16 v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "document: %@ subitem did lose version at URL: %@", (uint8_t *)&v7, 0x16u);
  }

  [(UIDocument *)self _updateConflictState];
}

- (void)presentedItemDidResolveConflictVersion:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _UIDocumentLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "document: %@ did resolve conflict version", (uint8_t *)&v5, 0xCu);
  }

  [(UIDocument *)self _updateConflictState];
}

- (void)presentedSubitemAtURL:(id)a3 didResolveConflictVersion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _UIDocumentLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    __int16 v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "document: %@ did resolve conflict at URL: %@", (uint8_t *)&v7, 0x16u);
  }

  [(UIDocument *)self _updateConflictState];
}

- (void)presentedItemHasUnsavedChangesWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, BOOL))a3;
  BOOL v5 = [(UIDocument *)self hasUnsavedChanges];
  if (v4) {
    v4[2](v4, v5);
  }
  id v6 = _UIDocumentLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    if (v5) {
      int v7 = @"YES";
    }
    int v8 = 138412546;
    __int16 v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "document: %@ did report %@ for unsaved changes", (uint8_t *)&v8, 0x16u);
  }
}

- (NSDocumentDifferenceSize)differenceDueToRecentChanges
{
  return (NSDocumentDifferenceSize *)self->_differenceDueToRecentChanges;
}

- (NSDocumentDifferenceSize)differenceSincePreservingPreviousVersion
{
  return (NSDocumentDifferenceSize *)self->_differenceSincePreservingPreviousVersion;
}

- (NSDocumentDifferenceSize)differenceSinceSaving
{
  return (NSDocumentDifferenceSize *)self->_differenceSinceSaving;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progresses, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong(&self->_alertPresenter, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong(&self->_versionWithoutRecentChanges, 0);
  objc_storeStrong((id *)&self->_autosavingTimer, 0);
  objc_storeStrong(&self->_differenceSinceSaving, 0);
  objc_storeStrong(&self->_differenceSincePreservingPreviousVersion, 0);
  objc_storeStrong(&self->_differenceDueToRecentChanges, 0);
  objc_storeStrong((id *)&self->_filePresenterQueue, 0);
  objc_storeStrong((id *)&self->_fileAccessSemaphore, 0);
  objc_storeStrong((id *)&self->_openingQueue, 0);
  objc_storeStrong((id *)&self->_fileAccessQueue, 0);
  objc_storeStrong((id *)&self->_fileModificationDate, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_fileBookmark, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_activityContinuationLock, 0);
  objc_storeStrong((id *)&self->_currentUserActivity, 0);
}

+ (id)_documentWithContentsOfFileURL:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[_UIApplicationInfoParser mainBundleInfoParser];
  int v7 = [v6 utTypeToDocumentClassMap];

  int v8 = [v5 startAccessingSecurityScopedResource];
  id v38 = 0;
  uint64_t v9 = *MEMORY[0x1E4F1C538];
  id v37 = 0;
  LODWORD(v6) = [v5 getResourceValue:&v38 forKey:v9 error:&v37];
  id v10 = v38;
  id v11 = v37;
  uint64_t v12 = v11;
  if (!v6)
  {
    id v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDocument", &qword_1EB2602E8) + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v40 = v5;
      __int16 v41 = 2112;
      uint64_t v42 = v12;
      _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "Unable to create document from file at URL <%@>: %@", buf, 0x16u);
    }
    int v24 = 0;
    if (v8) {
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  int v31 = v8;
  id v32 = v11;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  __int16 v13 = [v7 allKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v29 = a4;
    id v30 = v5;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToType:", v20, v29)
          && (!v17 || [v17 isSupertypeOfType:v20]))
        {
          uint64_t v21 = [v7 objectForKey:v20];
          if (v21)
          {
            __int16 v22 = (objc_class *)v21;
            id v23 = v20;

            uint64_t v16 = v22;
            uint64_t v17 = v23;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v15);

    if (v16)
    {
      id v5 = v30;
      int v24 = (void *)[[v16 alloc] initWithFileURL:v30];
      a4 = v29;
      int v25 = v31;
      goto LABEL_25;
    }
    a4 = v29;
    id v5 = v30;
  }
  else
  {

    uint64_t v17 = 0;
  }
  int v25 = v31;
  uint64_t v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDocument", &qword_1EB2602E0) + 8);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v40 = v5;
    _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Unable to create document from file at URL <%@>: no document class found. Define the correct UIDocument subclass with the key UIDocumentClass in the info.plist's CFBundleDocumentTypes dictionary.", buf, 0xCu);
  }
  int v24 = 0;
LABEL_25:

  uint64_t v12 = v32;
  if (v25) {
LABEL_26:
  }
    [v5 stopAccessingSecurityScopedResource];
LABEL_27:
  if (a4 && v12) {
    *a4 = v12;
  }

  return v24;
}

- (id)_fileOpeningQueue
{
  return self->_openingQueue;
}

+ (id)_fileModificationDateForURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v12 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C530];
  id v11 = 0;
  char v5 = [v3 getResourceValue:&v12 forKey:v4 error:&v11];
  id v6 = v12;
  id v7 = v11;
  if ((v5 & 1) == 0)
  {
    int v8 = _UIDocumentLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v7 localizedDescription];
      *(_DWORD *)long long buf = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "failed to get modification date for URL: %@ with error: %@", buf, 0x16u);
    }
  }

  return v6;
}

- (void)_performBlock:(id)a3 synchronouslyOnQueue:(id)a4
{
  queue = a4;
  char v5 = dispatch_get_current_queue();
  id v6 = (void (**)(void))a3;

  if (v5 == queue) {
    v6[2](v6);
  }
  else {
    dispatch_sync(queue, v6);
  }
}

- (void)_performBlockOnMainThread:(id)a3
{
  block = (void (**)(void))a3;
  if (pthread_main_np() == 1) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_performBlockSynchronouslyOnMainThread:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if (pthread_main_np() == 1) {
    v4[2]();
  }
  else {
    [(UIDocument *)self _performBlock:v4 synchronouslyOnQueue:MEMORY[0x1E4F14428]];
  }
}

@end