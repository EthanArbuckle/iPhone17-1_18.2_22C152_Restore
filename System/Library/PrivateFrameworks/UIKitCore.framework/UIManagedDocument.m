@interface UIManagedDocument
+ (BOOL)isPersistentStoreSynchronizedViaUbiquitousContentWithOptions:(id)a3;
+ (NSString)persistentStoreName;
+ (id)additionalContentPathComponent;
+ (void)initialize;
- (BOOL)_writeMetadataToDocumentURL:(id)a3;
- (BOOL)configurePersistentStoreCoordinatorForURL:(NSURL *)storeURL ofType:(NSString *)fileType modelConfiguration:(NSString *)configuration storeOptions:(NSDictionary *)storeOptions error:(NSError *)error;
- (BOOL)readAdditionalContentFromURL:(NSURL *)absoluteURL error:(NSError *)error;
- (BOOL)readFromURL:(id)a3 error:(id *)a4;
- (BOOL)writeAdditionalContent:(id)content toURL:(NSURL *)absoluteURL originalContentsURL:(NSURL *)absoluteOriginalContentsURL error:(NSError *)error;
- (BOOL)writeContents:(id)a3 andAttributes:(id)a4 safelyToURL:(id)a5 forSaveOperation:(int64_t)a6 error:(id *)a7;
- (BOOL)writeContents:(id)a3 toURL:(id)a4 forSaveOperation:(int64_t)a5 originalContentsURL:(id)a6 error:(id *)a7;
- (NSDictionary)persistentStoreOptions;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSString)modelConfiguration;
- (NSString)persistentStoreTypeForFileType:(NSString *)fileType;
- (UIManagedDocument)initWithFileURL:(id)a3;
- (id)_readMetadataFromDocumentURL:(id)a3;
- (id)additionalContentForURL:(NSURL *)absoluteURL error:(NSError *)error;
- (id)contentsForType:(id)a3 error:(id *)a4;
- (void)_handleRelocatingStoreContentDirectoryFromNonSyncedURL:(id)a3 toSyncedURL:(id)a4;
- (void)_handleRelocatingStoreContentDirectoryFromSyncedURL:(id)a3 toNonSyncedURL:(id)a4;
- (void)dealloc;
- (void)revertToContentsOfURL:(id)a3 completionHandler:(id)a4;
- (void)setModelConfiguration:(NSString *)modelConfiguration;
- (void)setPersistentStoreOptions:(NSDictionary *)persistentStoreOptions;
@end

@implementation UIManagedDocument

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _MergedGlobals_1_8 = (uint64_t)dlopen((const char *)[@"/System/Library/Frameworks/CoreData.framework/CoreData" UTF8String], 1);
    if (_MergedGlobals_1_8
      || (v4 = dlerror(),
          NSLog(&cfstr_Uimanageddocum.isa, @"/System/Library/Frameworks/CoreData.framework/CoreData", v4),
          _MergedGlobals_1_8)
      || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UIManagedDocument.m", 88, @"Failed to load CoreData framework"), _MergedGlobals_1_8))
    {
      qword_1EB25BD30 = (uint64_t)objc_getClass("NSIncrementalStore");
      qword_1EB25BD38 = (uint64_t)objc_getClass("NSManagedObjectContext");
      qword_1EB25BD40 = (uint64_t)objc_getClass("NSManagedObjectModel");
      qword_1EB25BD48 = (uint64_t)objc_getClass("NSPersistentStoreCoordinator");
      if (!qword_1EB25BD30) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UIManagedDocument.m", 94, @"Failed to load class NSIncrementalStore");
      }
      if (!qword_1EB25BD38) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UIManagedDocument.m", 95, @"Failed to load class NSManagedObjectContext");
      }
      if (!qword_1EB25BD40) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UIManagedDocument.m", 96, @"Failed to load class NSManagedObjectModel");
      }
      if (!qword_1EB25BD48)
      {
        v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        [v5 handleFailureInMethod:a2 object:a1 file:@"UIManagedDocument.m" lineNumber:97 description:@"Failed to load class NSPersistentStoreCoordinator"];
      }
    }
  }
}

- (UIManagedDocument)initWithFileURL:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIManagedDocument;
  v3 = [(UIDocument *)&v12 initWithFileURL:a3];
  if (v3)
  {
    v3->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc((Class)qword_1EB25BD48), "initWithManagedObjectModel:", -[UIManagedDocument managedObjectModel](v3, "managedObjectModel"));
    v4 = (void *)[objc_alloc((Class)qword_1EB25BD38) initWithConcurrencyType:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__UIManagedDocument_initWithFileURL___block_invoke;
    v11[3] = &unk_1E52EBA80;
    v11[4] = v4;
    v11[5] = v3;
    [v4 performBlockAndWait:v11];
    v5 = (NSManagedObjectContext *)[objc_alloc((Class)qword_1EB25BD38) initWithConcurrencyType:2];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__UIManagedDocument_initWithFileURL___block_invoke_2;
    v10[3] = &unk_1E52EBAA8;
    v10[4] = v5;
    v10[5] = v4;
    v10[6] = v3;
    [(NSManagedObjectContext *)v5 performBlockAndWait:v10];
    v3->_managedObjectContext = v5;
    v6 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v6, sel_writeAdditionalContent_toURL_originalContentsURL_error_);
    v8 = (objc_class *)objc_opt_class();
    if (MethodImplementation != class_getMethodImplementation(v8, sel_writeAdditionalContent_toURL_originalContentsURL_error_))*(_DWORD *)&v3->_mdocFlags |= 1u; {
  }
    }
  return v3;
}

uint64_t __37__UIManagedDocument_initWithFileURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPersistentStoreCoordinator:*(void *)(*(void *)(a1 + 40) + 208)];
}

void __37__UIManagedDocument_initWithFileURL___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setParentContext:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "setUndoManager:", objc_msgSend(*(id *)(a1 + 48), "undoManager"));
  v2 = *(void **)(a1 + 40);
}

- (void)dealloc
{
  managedObjectContext = self->_managedObjectContext;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__UIManagedDocument_dealloc__block_invoke;
  v5[3] = &unk_1E52DC580;
  v5[4] = managedObjectContext;
  [(NSManagedObjectContext *)managedObjectContext performBlock:v5];
  self->_managedObjectContext = 0;

  self->_managedObjectModel = 0;
  self->_persistentStoreCoordinator = 0;

  self->_documentMetadata = 0;
  self->persistentStoreOptions = 0;

  self->modelConfiguration = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIManagedDocument;
  [(UIDocument *)&v4 dealloc];
}

void __28__UIManagedDocument_dealloc__block_invoke(uint64_t a1)
{
}

+ (NSString)persistentStoreName
{
  return (NSString *)@"persistentStore";
}

+ (id)additionalContentPathComponent
{
  return @"AdditionalContent";
}

+ (BOOL)isPersistentStoreSynchronizedViaUbiquitousContentWithOptions:(id)a3
{
  return [a3 objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"] != 0;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (NSManagedObjectModel)managedObjectModel
{
  result = self->_managedObjectModel;
  if (!result)
  {
    result = (NSManagedObjectModel *)(id)[(id)qword_1EB25BD40 mergedModelFromBundles:0];
    self->_managedObjectModel = result;
  }
  return result;
}

- (BOOL)configurePersistentStoreCoordinatorForURL:(NSURL *)storeURL ofType:(NSString *)fileType modelConfiguration:(NSString *)configuration storeOptions:(NSDictionary *)storeOptions error:(NSError *)error
{
  objc_super v12 = [(UIManagedDocument *)self persistentStoreTypeForFileType:fileType];
  if (storeOptions)
  {
    id v13 = (id)[(NSDictionary *)storeOptions mutableCopy];
    objc_msgSend(v13, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSPersistentStoreRemoveStoreOnCleanupKey");
  }
  else
  {
    id v13 = (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSPersistentStoreRemoveStoreOnCleanupKey", 0);
  }
  [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator lock];
  BOOL v14 = [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator addPersistentStoreWithType:v12 configuration:configuration URL:storeURL options:v13 error:error] != 0;
  [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator unlock];
  return v14;
}

- (NSString)persistentStoreTypeForFileType:(NSString *)fileType
{
  return (NSString *)@"SQLite";
}

- (BOOL)readAdditionalContentFromURL:(NSURL *)absoluteURL error:(NSError *)error
{
  return 1;
}

- (id)additionalContentForURL:(NSURL *)absoluteURL error:(NSError *)error
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", absoluteURL, error);
}

- (BOOL)writeAdditionalContent:(id)content toURL:(NSURL *)absoluteURL originalContentsURL:(NSURL *)absoluteOriginalContentsURL error:(NSError *)error
{
  return 1;
}

- (void)_handleRelocatingStoreContentDirectoryFromNonSyncedURL:(id)a3 toSyncedURL:(id)a4
{
  v7 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  char v15 = 1;
  if (objc_msgSend(v7, "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v15))
  {
    if (!v15) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Invalid store content path is file", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", a3, @"path")), "raise");
    }
    uint64_t v14 = 0;
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromNonSyncedURL_toSyncedURL___block_invoke;
    v9[3] = &unk_1E52EBAD0;
    v9[4] = v7;
    v9[5] = &v10;
    [v8 coordinateWritingItemAtURL:a3 options:2 writingItemAtURL:a4 options:8 error:&v14 byAccessor:v9];
    if (!*((unsigned char *)v11 + 24)) {
      NSLog(&cfstr_FailedToCoordi.isa, v14);
    }

    _Block_object_dispose(&v10, 8);
  }
}

void __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromNonSyncedURL_toSyncedURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v6 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), 0))
  {
    NSLog(&cfstr_FailedToMoveSt_0.isa, a2, a3);
  }
  else if (([*(id *)(a1 + 32) moveItemAtURL:a2 toURL:a3 error:&v6] & 1) == 0)
  {
    NSLog(&cfstr_FailedToMoveSt.isa, a2, a3, v6);
  }
}

- (void)_handleRelocatingStoreContentDirectoryFromSyncedURL:(id)a3 toNonSyncedURL:(id)a4
{
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v20 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromSyncedURL_toNonSyncedURL___block_invoke;
  v11[3] = &unk_1E52EBAF8;
  v11[7] = &v16;
  v11[8] = &v12;
  v11[4] = v7;
  v11[5] = v8;
  void v11[6] = a4;
  [v8 coordinateReadingItemAtURL:a3 options:0 error:&v20 byAccessor:v11];
  if (*((unsigned char *)v17 + 24))
  {
    if (*((unsigned char *)v13 + 24))
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromSyncedURL_toNonSyncedURL___block_invoke_2;
      v9[3] = &unk_1E52EBAD0;
      v9[5] = &v16;
      uint64_t v10 = 0;
      v9[4] = v7;
      [v8 coordinateWritingItemAtURL:a3 options:2 writingItemAtURL:a4 options:8 error:&v10 byAccessor:v9];
      if (!*((unsigned char *)v17 + 24)) {
        NSLog(&cfstr_FailedToCoordi.isa, v10);
      }
    }
    else
    {
    }
  }
  else
  {
    NSLog(&cfstr_FailedToCoordi.isa, v20);
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromSyncedURL_toNonSyncedURL___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  unsigned __int8 v6 = 1;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:isDirectory:", objc_msgSend(a2, "path"), &v6);
  if (result)
  {
    int v4 = v6;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6;
    if (!v4)
    {
      id v5 = *(id *)(a1 + 40);
      return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Invalid store content path is file", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", *(void *)(a1 + 48), @"path")), "raise");
    }
  }
  return result;
}

void __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromSyncedURL_toNonSyncedURL___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v6 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), 0))
  {
    NSLog(&cfstr_FailedToMoveSt_0.isa, a2, a3);
  }
  else if (([*(id *)(a1 + 32) moveItemAtURL:a2 toURL:a3 error:&v6] & 1) == 0)
  {
    NSLog(&cfstr_FailedToMoveSt.isa, a2, a3, v6);
  }
}

- (id)_readMetadataFromDocumentURL:(id)a3
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__70;
  uint64_t v18 = __Block_byref_object_dispose__70;
  uint64_t v19 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
  uint64_t v9 = 0;
  uint64_t v5 = [a3 URLByAppendingPathComponent:@"DocumentMetadata.plist"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__UIManagedDocument__readMetadataFromDocumentURL___block_invoke;
  v8[3] = &unk_1E52EBB20;
  v8[4] = &v10;
  v8[5] = &v14;
  [v4 coordinateReadingItemAtURL:v5 options:0 error:&v9 byAccessor:v8];
  if (!*((unsigned char *)v11 + 24)) {
    NSLog(&cfstr_FailedToCoordi_0.isa, v5, v9);
  }

  id v6 = (id)v15[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

uint64_t __50__UIManagedDocument__readMetadataFromDocumentURL___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_writeMetadataToDocumentURL:(id)a3
{
  id v5 = [(NSDictionary *)[(UIManagedDocument *)self persistentStoreOptions] objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (v5)
  {
    id v6 = v5;
    documentMetadata = self->_documentMetadata;
    if (documentMetadata)
    {
      v8 = (void *)[(NSDictionary *)self->_documentMetadata mutableCopy];
      [v8 setObject:v6 forKey:@"NSPersistentStoreUbiquitousContentNameKey"];
      self->_documentMetadata = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v8];
    }
    else
    {
      self->_documentMetadata = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"NSPersistentStoreUbiquitousContentNameKey", 0);
    }
    uint64_t v18 = 0;
    uint64_t v14 = 0;
    char v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
    uint64_t v11 = [a3 URLByAppendingPathComponent:@"DocumentMetadata.plist"];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__UIManagedDocument__writeMetadataToDocumentURL___block_invoke;
    v13[3] = &unk_1E52EBB48;
    v13[5] = &v14;
    v13[6] = &v19;
    v13[4] = self;
    [v10 coordinateWritingItemAtURL:v11 options:8 error:&v18 byAccessor:v13];
    if (!*((unsigned char *)v15 + 24)) {
      NSLog(&cfstr_FailedToCoordi_1.isa, v11, v18);
    }

    _Block_object_dispose(&v14, 8);
    BOOL v9 = *((unsigned char *)v20 + 24) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  _Block_object_dispose(&v19, 8);
  return v9;
}

uint64_t __49__UIManagedDocument__writeMetadataToDocumentURL___block_invoke(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  uint64_t result = [*(id *)(a1[4] + 224) writeToURL:a2 atomically:0];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  if (![a3 isFileURL])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"you must override %@ to support reading of non-file URLs", NSStringFromSelector(sel_readFromURL_error_) format];
    goto LABEL_53;
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  char v78 = 1;
  char v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v78);
  if (v78) {
    char v9 = v8;
  }
  else {
    char v9 = 0;
  }
  if (v9)
  {
    uint64_t v10 = [a3 URLByAppendingPathComponent:@"StoreContent"];
    uint64_t v11 = [a3 URLByAppendingPathComponent:@"StoreContent.nosync"];
    int v12 = objc_msgSend((id)objc_opt_class(), "isPersistentStoreSynchronizedViaUbiquitousContentWithOptions:", -[UIManagedDocument persistentStoreOptions](self, "persistentStoreOptions"));
    char v13 = v12;
    uint64_t v37 = v10;
    uint64_t v38 = v11;
    if (v12) {
      uint64_t v14 = (void *)v11;
    }
    else {
      uint64_t v14 = (void *)v10;
    }
    uint64_t v41 = objc_msgSend(v14, "URLByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(), "persistentStoreName"));
    [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator lock];
    v39 = [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator persistentStoreForURL:v41];
    [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator unlock];
    if (v39) {
      *((unsigned char *)v80 + 24) = 1;
    }
    v40 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
    if (*((unsigned char *)v80 + 24))
    {
      BOOL v15 = 0;
LABEL_42:
      uint64_t v72 = 0;
      v73 = &v72;
      uint64_t v74 = 0x3052000000;
      v75 = __Block_byref_object_copy__70;
      v76 = __Block_byref_object_dispose__70;
      uint64_t v77 = 0;
      v28 = [(UIManagedDocument *)self managedObjectContext];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __39__UIManagedDocument_readFromURL_error___block_invoke_5;
      v45[3] = &unk_1E52EBC10;
      v45[4] = v28;
      v45[5] = &v72;
      [(NSManagedObjectContext *)v28 performBlockAndWait:v45];
      objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v73[5], @"parentContext", 0);
      v44.receiver = self;
      v44.super_class = (Class)UIManagedDocument;
      id v29 = [(UIDocument *)&v44 _fileOpeningQueue];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __39__UIManagedDocument_readFromURL_error___block_invoke_6;
      v43[3] = &unk_1E52EBC60;
      if (v29) {
        id v30 = v29;
      }
      else {
        id v30 = (id)MEMORY[0x1E4F14428];
      }
      v43[4] = a3;
      v43[5] = self;
      v43[6] = v40;
      v43[7] = &v79;
      v43[8] = a4;
      [(UIDocument *)self _performBlock:v43 synchronouslyOnQueue:v30];

      char v31 = !v15;
      if (*((unsigned char *)v80 + 24)) {
        char v31 = 1;
      }
      if ((v31 & 1) == 0)
      {
        v32 = [(UIManagedDocument *)self managedObjectContext];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __39__UIManagedDocument_readFromURL_error___block_invoke_8;
        v42[3] = &unk_1E52DC580;
        v42[4] = v32;
        [(NSManagedObjectContext *)v32 performBlockAndWait:v42];
        [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator lock];
        uint64_t v60 = 0;
        if ([(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator persistentStoreForURL:v41]&& ![(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator removePersistentStore:v39 error:&v60])
        {
          NSLog(&cfstr_ErrorDuringSto.isa, v60);
        }
        [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator unlock];
      }
      _Block_object_dispose(&v72, 8);
      goto LABEL_53;
    }
    v36 = [(UIDocument *)self fileType];
    v35 = [(UIManagedDocument *)self persistentStoreOptions];
    v34 = [(UIManagedDocument *)self modelConfiguration];
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x3052000000;
    v75 = __Block_byref_object_copy__70;
    v76 = __Block_byref_object_dispose__70;
    uint64_t v77 = 0;
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2020000000;
    char v71 = 0;
    id v17 = [(UIManagedDocument *)self _readMetadataFromDocumentURL:a3];
    id v18 = v17;
    if (v17)
    {
      documentMetadata = self->_documentMetadata;
      if (documentMetadata)
      {
        uint64_t v20 = (void *)[(NSDictionary *)self->_documentMetadata mutableCopy];
        [v20 addEntriesFromDictionary:v18];
        self->_documentMetadata = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v20];
      }
      else
      {
        self->_documentMetadata = (NSDictionary *)v17;
      }
      id v21 = [(NSDictionary *)[(UIManagedDocument *)self persistentStoreOptions] objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"];
      id v22 = [(NSDictionary *)self->_documentMetadata objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"];
      if (!v21 || (id v23 = v22, ([v21 isEqualToString:v22] & 1) != 0))
      {
LABEL_27:
        if ((v13 & 1) == 0)
        {
          [(UIManagedDocument *)self _handleRelocatingStoreContentDirectoryFromNonSyncedURL:v38 toSyncedURL:v37];
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __39__UIManagedDocument_readFromURL_error___block_invoke;
          v67[3] = &unk_1E52EBB70;
          v67[4] = v7;
          v67[5] = self;
          v67[6] = v36;
          v67[7] = v34;
          v67[9] = &v68;
          v67[8] = v35;
          v67[10] = &v79;
          v67[11] = a4;
          [v40 coordinateReadingItemAtURL:v41 options:0 error:a4 byAccessor:v67];
LABEL_41:
          int v27 = *((unsigned __int8 *)v80 + 24);
          _Block_object_dispose(&v68, 8);
          _Block_object_dispose(&v72, 8);
          BOOL v15 = v27 != 0;
          if (*((unsigned char *)v80 + 24)) {
            goto LABEL_42;
          }

LABEL_53:
          BOOL v16 = *((unsigned char *)v80 + 24) != 0;
          goto LABEL_54;
        }
        [(UIManagedDocument *)self _handleRelocatingStoreContentDirectoryFromSyncedURL:v37 toNonSyncedURL:v38];
        uint64_t v66 = 0;
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x3052000000;
        v63 = __Block_byref_object_copy__70;
        v64 = __Block_byref_object_dispose__70;
        uint64_t v65 = 0;
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x2020000000;
        char v59 = 0;
        v54[0] = 0;
        v54[1] = v54;
        v54[2] = 0x2020000000;
        char v55 = 0;
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x2020000000;
        char v53 = 0;
        uint64_t v46 = 0;
        v47 = &v46;
        uint64_t v48 = 0x2020000000;
        char v49 = 0;
        v45[21] = MEMORY[0x1E4F143A8];
        v45[22] = 3221225472;
        v45[23] = __39__UIManagedDocument_readFromURL_error___block_invoke_2;
        v45[24] = &unk_1E52EBBC0;
        v45[33] = &v68;
        v45[34] = v54;
        v45[25] = v7;
        v45[26] = v38;
        v45[27] = v40;
        v45[28] = v41;
        v45[35] = &v72;
        v45[36] = &v79;
        v45[29] = self;
        v45[30] = v36;
        v45[31] = v34;
        v45[32] = v35;
        v45[37] = &v60;
        v45[38] = &v50;
        objc_msgSend(v40, "coordinateReadingItemAtURL:options:error:byAccessor:");
        if (*((unsigned char *)v80 + 24)) {
          goto LABEL_40;
        }
        if (*((unsigned char *)v51 + 24))
        {
          int v24 = 0;
        }
        else
        {
          v45[6] = MEMORY[0x1E4F143A8];
          v45[7] = 3221225472;
          v45[8] = __39__UIManagedDocument_readFromURL_error___block_invoke_4;
          v45[9] = &unk_1E52EBBE8;
          v45[16] = &v56;
          v45[17] = &v79;
          v45[10] = v7;
          v45[11] = self;
          v45[12] = v36;
          v45[13] = v34;
          v45[18] = &v60;
          v45[19] = &v46;
          v45[20] = a4;
          v45[14] = v35;
          v45[15] = v38;
          objc_msgSend(v40, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:");
          int v24 = *((unsigned __int8 *)v80 + 24);
        }
        if (!a4 || v24)
        {
LABEL_40:
          _Block_object_dispose(&v46, 8);
          _Block_object_dispose(&v50, 8);
          _Block_object_dispose(v54, 8);
          _Block_object_dispose(&v56, 8);
          _Block_object_dispose(&v60, 8);
          goto LABEL_41;
        }
        if (*((unsigned char *)v51 + 24) || *((unsigned char *)v47 + 24))
        {
          v25 = v61;
        }
        else
        {
          if (*((unsigned char *)v69 + 24)) {
            goto LABEL_40;
          }
          if (!*((unsigned char *)v57 + 24))
          {
            v26 = (id *)&v66;
            goto LABEL_39;
          }
          v25 = v73;
        }
        v26 = (id *)(v25 + 5);
LABEL_39:
        *a4 = *v26;
        goto LABEL_40;
      }
      NSLog(&cfstr_UpdatingDocume.isa, v23, v21);
    }
    [(UIManagedDocument *)self _writeMetadataToDocumentURL:a3];
    goto LABEL_27;
  }
  if (!v78) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"UIManagedDocument can only read documents that are file packages", 0), "raise");
  }
  if (a4) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:0];
  }
  BOOL v16 = 0;
LABEL_54:
  _Block_object_dispose(&v79, 8);
  return v16;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) configurePersistentStoreCoordinatorForURL:a2 ofType:*(void *)(a1 + 48) modelConfiguration:*(void *)(a1 + 56) storeOptions:*(void *)(a1 + 64) error:*(void *)(a1 + 88)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = result;
  }
  else if (*(void *)(a1 + 88))
  {
    uint64_t result = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 260, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Missing store file", @"reason", 0));
    **(void **)(a1 + 88) = result;
  }
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(*(id *)(a1 + 40), "path"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
    v3 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(*(void *)(a1 + 112) + 8) + 40;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__UIManagedDocument_readFromURL_error___block_invoke_3;
    v8[3] = &unk_1E52EBB98;
    uint64_t v6 = *(void *)(a1 + 96);
    long long v7 = *(_OWORD *)(a1 + 80);
    long long v9 = *(_OWORD *)(a1 + 64);
    long long v10 = v7;
    long long v13 = *(_OWORD *)(a1 + 120);
    uint64_t v14 = *(void *)(a1 + 136);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = v6;
    return [v3 coordinateReadingItemAtURL:v4 options:0 error:v5 byAccessor:v8];
  }
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_3(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  uint64_t result = [*(id *)(a1 + 32) configurePersistentStoreCoordinatorForURL:a2 ofType:*(void *)(a1 + 40) modelConfiguration:*(void *)(a1 + 48) storeOptions:*(void *)(a1 + 56) error:*(void *)(*(void *)(a1 + 88) + 8) + 40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 64), "fileExistsAtPath:isDirectory:", objc_msgSend(a2, "path"), 0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = result;
  }
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = 0;
  char v5 = [*(id *)(a1 + 32) createDirectoryAtURL:a2 withIntermediateDirectories:0 attributes:0 error:&v8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  if ((v5 & 1) != 0 || (uint64_t result = [v8 code], result == 516))
  {
    uint64_t result = [*(id *)(a1 + 40) configurePersistentStoreCoordinatorForURL:a3 ofType:*(void *)(a1 + 48) modelConfiguration:*(void *)(a1 + 56) storeOptions:*(void *)(a1 + 64) error:*(void *)(*(void *)(a1 + 96) + 8) + 40];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                           + 24) ^ 1;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 112);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
    if (v7)
    {
      uint64_t result = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 260, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Unable to restore path to store content", @"reason", v8, *MEMORY[0x1E4F28A50], *(void *)(a1 + 72), @"path", 0));
      *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) = result;
    }
  }
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_5(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) parentContext];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __39__UIManagedDocument_readFromURL_error___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_opt_class(), "additionalContentPathComponent"), 1);
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  char v6 = 0;
  objc_msgSend(*(id *)(a1 + 48), "coordinateReadingItemAtURL:options:error:byAccessor:", v2, 0, MEMORY[0x1E4F143A8], 3221225472, __39__UIManagedDocument_readFromURL_error___block_invoke_7, &unk_1E52EBC38, *(void *)(a1 + 40), &v3, *(void *)(a1 + 56), *(void *)(a1 + 64));
  if (!*((unsigned char *)v4 + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  _Block_object_dispose(&v3, 8);
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_7(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t result = [*(id *)(a1 + 32) readAdditionalContentFromURL:a2 error:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (id)contentsForType:(id)a3 error:(id *)a4
{
  id v7 = [(UIManagedDocument *)self additionalContentForURL:[(UIDocument *)self fileURL] error:a4];
  if (!v7) {
    return 0;
  }
  id v8 = v7;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  BOOL v16 = __Block_byref_object_copy__70;
  id v17 = __Block_byref_object_dispose__70;
  uint64_t v18 = 0;
  long long v9 = [(UIManagedDocument *)self managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__UIManagedDocument_contentsForType_error___block_invoke;
  v12[3] = &unk_1E52EBCB0;
  v12[5] = &v13;
  v12[6] = a4;
  v12[4] = v9;
  [(NSManagedObjectContext *)v9 performBlockAndWait:v12];
  if (v14[5]) {
    long long v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"parentContext", v8, @"additionalContent", a3, @"fileType", 0);
  }
  else {
    long long v10 = 0;
  }
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __43__UIManagedDocument_contentsForType_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) save:*(void *)(a1 + 48)];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) parentContext];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)writeContents:(id)a3 andAttributes:(id)a4 safelyToURL:(id)a5 forSaveOperation:(int64_t)a6 error:(id *)a7
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Contents must be a dictionary", 0), "raise");
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v13 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v14 = v13;
  if (!a6
    && ([v13 createDirectoryAtURL:a5 withIntermediateDirectories:0 attributes:a4 error:a7] & 1) == 0)
  {
    BOOL v18 = 0;
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_mdocFlags & 1) == 0)
  {
    *((unsigned char *)v26 + 24) = 1;
    goto LABEL_10;
  }
  uint64_t v15 = objc_msgSend(a5, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_opt_class(), "additionalContentPathComponent"), 1);
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__UIManagedDocument_writeContents_andAttributes_safelyToURL_forSaveOperation_error___block_invoke;
  v20[3] = &unk_1E52EBC88;
  v20[8] = &v21;
  v20[9] = &v25;
  v20[4] = v15;
  v20[5] = v14;
  v20[10] = a7;
  v20[6] = self;
  v20[7] = a3;
  [v16 coordinateWritingItemAtURL:v15 options:8 error:a7 byAccessor:v20];
  if (!*((unsigned char *)v22 + 24)) {
    *((unsigned char *)v26 + 24) = 0;
  }

  _Block_object_dispose(&v21, 8);
  if (*((unsigned char *)v26 + 24))
  {
LABEL_10:
    int v17 = [(UIManagedDocument *)self writeContents:a3 toURL:a5 forSaveOperation:a6 originalContentsURL:a5 error:a7];
    *((unsigned char *)v26 + 24) = v17;
    if (!a6) {
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  int v17 = 0;
  if (!a6)
  {
LABEL_11:
    if (!v17)
    {
      uint64_t v21 = 0;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", a5, &v21) & 1) == 0) {
        NSLog(&cfstr_Uimanageddocum_2.isa, a5, v21);
      }
      int v17 = *((unsigned __int8 *)v26 + 24);
    }
  }
LABEL_15:
  BOOL v18 = v17 != 0;
LABEL_16:
  _Block_object_dispose(&v25, 8);
  return v18;
}

uint64_t __84__UIManagedDocument_writeContents_andAttributes_safelyToURL_forSaveOperation_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  uint64_t v4 = (void *)[*(id *)(a1 + 32) URLByAppendingPathExtension:@"nosync_tmp"];
  if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", objc_msgSend(v4, "path"))) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 40) removeItemAtURL:v4 error:*(void *)(a1 + 80)];
  }
  uint64_t result = [*(id *)(a1 + 40) createDirectoryAtURL:v4 withIntermediateDirectories:0 attributes:0 error:*(void *)(a1 + 80)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "writeAdditionalContent:toURL:originalContentsURL:error:", objc_msgSend(*(id *)(a1 + 56), "objectForKey:", @"additionalContent"), v4, a2, *(void *)(a1 + 80)))
    {
      id v7 = 0;
      if (([*(id *)(a1 + 40) removeItemAtURL:a2 error:&v7] & 1) != 0
        || (uint64_t result = [v7 code], result == 4))
      {
        uint64_t result = [*(id *)(a1 + 40) moveItemAtURL:v4 toURL:a2 error:*(void *)(a1 + 80)];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = result;
      }
      else
      {
        char v6 = *(void **)(a1 + 80);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        if (v6) {
          void *v6 = v7;
        }
      }
    }
    else
    {
      uint64_t result = [*(id *)(a1 + 40) removeItemAtURL:v4 error:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    }
  }
  return result;
}

- (BOOL)writeContents:(id)a3 toURL:(id)a4 forSaveOperation:(int64_t)a5 originalContentsURL:(id)a6 error:(id *)a7
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = (void *)[a3 objectForKey:@"parentContext"];
    uint64_t v12 = [a3 objectForKey:@"fileType"];
    uint64_t v13 = v12;
    if (v11 && v12) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v11 = 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Contents must be a dictionary that contains a reference to the parentContext and fileType", 0), "raise");
LABEL_7:
  uint64_t v14 = [(UIManagedDocument *)self persistentStoreOptions];
  id v15 = [(NSDictionary *)v14 objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"];
  if (v15) {
    char v16 = objc_msgSend(v15, "isEqual:", -[NSDictionary objectForKey:](self->_documentMetadata, "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey"));
  }
  else {
    char v16 = 1;
  }
  id v29 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  if (a5)
  {
    int v17 = 0;
    BOOL v18 = 0;
    uint64_t v19 = 0;
    uint64_t v30 = 0;
  }
  else
  {
    if ([(id)objc_opt_class() isPersistentStoreSynchronizedViaUbiquitousContentWithOptions:v14])char v24 = @"StoreContent.nosync"; {
    else
    }
      char v24 = @"StoreContent";
    uint64_t v19 = (void *)[a4 URLByAppendingPathComponent:v24];
    uint64_t v30 = objc_msgSend(v19, "URLByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(), "persistentStoreName"));
    int v25 = objc_msgSend((id)objc_msgSend(v19, "fileReferenceURL"), "isEqual:", objc_msgSend(a4, "fileReferenceURL"));
    if (v25)
    {
      if (!*((unsigned char *)v35 + 24)) {
        goto LABEL_43;
      }
    }
    else
    {
      char v26 = [v29 createDirectoryAtURL:v19 withIntermediateDirectories:0 attributes:0 error:a7];
      *((unsigned char *)v35 + 24) = v26;
      if ((v26 & 1) == 0) {
        goto LABEL_43;
      }
    }
    BOOL v18 = [(UIManagedDocument *)self configurePersistentStoreCoordinatorForURL:v30 ofType:v13 modelConfiguration:[(UIManagedDocument *)self modelConfiguration] storeOptions:[(UIManagedDocument *)self persistentStoreOptions] error:a7];
    int v17 = v25 ^ 1;
    int v20 = *((unsigned __int8 *)v35 + 24);
    if (!*((unsigned char *)v35 + 24)) {
      goto LABEL_17;
    }
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __84__UIManagedDocument_writeContents_toURL_forSaveOperation_originalContentsURL_error___block_invoke;
  v33[3] = &unk_1E52EBCB0;
  v33[4] = v11;
  v33[5] = &v34;
  v33[6] = a7;
  [v11 performBlockAndWait:v33];
  int v20 = *((unsigned __int8 *)v35 + 24);
  if (*((unsigned char *)v35 + 24)) {
    char v21 = v16;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0)
  {
    [(UIManagedDocument *)self _writeMetadataToDocumentURL:a4];
    int v20 = *((unsigned __int8 *)v35 + 24);
  }
LABEL_17:
  if (a5 || v20) {
    goto LABEL_43;
  }
  if (!v18) {
    goto LABEL_40;
  }
  [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator lock];
  id v32 = 0;
  id v22 = [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator persistentStoreForURL:v30];
  if (!v22) {
    goto LABEL_33;
  }
  if ([(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator removePersistentStore:v22 error:&v32])
  {
    goto LABEL_35;
  }
  if (v32) {
    uint64_t v23 = (__CFString *)[v32 description];
  }
  else {
LABEL_33:
  }
    uint64_t v23 = @"No store registered at URL";
  NSLog(&cfstr_Uimanageddocum_3.isa, v30, v23);
LABEL_35:
  [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator unlock];
  if (!v30)
  {
LABEL_40:
    if (!v17) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
  id v32 = 0;
  if (([v29 removeItemAtURL:v30 error:&v32] & 1) == 0) {
    NSLog(&cfstr_Uimanageddocum_4.isa, v30, v32);
  }
  if (v17)
  {
LABEL_41:
    id v32 = 0;
    if (([v29 removeItemAtURL:v19 error:&v32] & 1) == 0) {
      NSLog(&cfstr_Uimanageddocum_5.isa, v19, v32);
    }
  }
LABEL_43:
  char v27 = *((unsigned char *)v35 + 24);
  _Block_object_dispose(&v34, 8);
  return v27;
}

uint64_t __84__UIManagedDocument_writeContents_toURL_forSaveOperation_originalContentsURL_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) save:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)revertToContentsOfURL:(id)a3 completionHandler:(id)a4
{
  id v7 = [(UIManagedDocument *)self managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke;
  v13[3] = &unk_1E52DC580;
  v13[4] = v7;
  [(NSManagedObjectContext *)v7 performBlockAndWait:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke_2;
  v12[3] = &unk_1E52DC580;
  v12[4] = v7;
  [(NSManagedObjectContext *)v7 performBlockAndWait:v12];
  [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator lock];
  id v8 = [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator persistentStoreForURL:a3];
  if (v8)
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v8 = [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator persistentStoreForURL:[(UIDocument *)self fileURL]];
    uint64_t v11 = 0;
    if (!v8) {
      goto LABEL_5;
    }
  }
  if (![(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator removePersistentStore:v8 error:&v11])
  {
    [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator unlock];
    goto LABEL_7;
  }
LABEL_5:
  v10.receiver = self;
  v10.super_class = (Class)UIManagedDocument;
  [(UIDocument *)&v10 revertToContentsOfURL:a3 completionHandler:a4];
  [(NSPersistentStoreCoordinator *)self->_persistentStoreCoordinator unlock];
LABEL_7:
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke_3;
  v9[3] = &unk_1E52DC580;
  v9[4] = v7;
  [(NSManagedObjectContext *)v7 performBlockAndWait:v9];
}

uint64_t __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) lock];
}

uint64_t __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) unlock];
}

- (NSDictionary)persistentStoreOptions
{
  return self->persistentStoreOptions;
}

- (void)setPersistentStoreOptions:(NSDictionary *)persistentStoreOptions
{
}

- (NSString)modelConfiguration
{
  return self->modelConfiguration;
}

- (void)setModelConfiguration:(NSString *)modelConfiguration
{
}

@end