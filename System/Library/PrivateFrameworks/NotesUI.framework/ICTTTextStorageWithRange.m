@interface ICTTTextStorageWithRange
+ (NSArray)writableTypeIdentifiersForItemProvider;
- (ICNote)note;
- (ICNote)workerContextNote;
- (ICTTTextStorage)textStorage;
- (ICTTTextStorageWithRange)initWithTextStorage:(id)a3 range:(_NSRange)a4 note:(id)a5;
- (NSArray)writableTypeIdentifiersForItemProvider;
- (NSManagedObjectContext)workerContext;
- (_NSRange)range;
- (id)_loadFileRepresentationOfTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (unint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:(id)a3;
- (void)prepareTextStorage;
- (void)setNote:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setTextStorage:(id)a3;
- (void)setWorkerContext:(id)a3;
- (void)setWorkerContextNote:(id)a3;
@end

@implementation ICTTTextStorageWithRange

- (ICTTTextStorageWithRange)initWithTextStorage:(id)a3 range:(_NSRange)a4 note:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICTTTextStorageWithRange;
  v12 = [(ICTTTextStorageWithRange *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_note, a5);
    objc_storeStrong((id *)&v13->_textStorage, a3);
    v13->_range.NSUInteger location = location;
    v13->_range.NSUInteger length = length;
  }

  return v13;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F83138];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__33;
  v12 = __Block_byref_object_dispose__33;
  id v13 = 0;
  v3 = [(ICTTTextStorageWithRange *)self note];
  v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ICTTTextStorageWithRange_writableTypeIdentifiersForItemProvider__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __66__ICTTTextStorageWithRange_writableTypeIdentifiersForItemProvider__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) note];
  uint64_t v2 = [v5 writableTypeIdentifiersForNoteContent];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  if ([a3 isEqual:*MEMORY[0x1E4F83138]]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)prepareTextStorage
{
  uint64_t v3 = [(ICTTTextStorageWithRange *)self note];
  v4 = [v3 objectID];

  id v5 = [MEMORY[0x1E4F83428] sharedContext];
  v6 = [v5 workerManagedObjectContext];
  [(ICTTTextStorageWithRange *)self setWorkerContext:v6];

  v7 = [(ICTTTextStorageWithRange *)self workerContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__ICTTTextStorageWithRange_prepareTextStorage__block_invoke;
  v9[3] = &unk_1E5FD91D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

void __46__ICTTTextStorageWithRange_prepareTextStorage__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F83418];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 32) workerContext];
  id v5 = objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v4);
  [*(id *)(a1 + 32) setWorkerContextNote:v5];

  v6 = [*(id *)(a1 + 32) textStorage];
  v7 = [*(id *)(a1 + 32) note];
  id v8 = [v7 textStorage];

  if (v6 == v8)
  {
    v9 = [*(id *)(a1 + 32) workerContextNote];
    [v9 prepareForCopyingData];

    id v11 = [*(id *)(a1 + 32) workerContextNote];
    id v10 = [v11 textStorage];
    [*(id *)(a1 + 32) setTextStorage:v10];
  }
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICTTTextStorageWithRange *)self range];
  uint64_t v10 = v9;
  id v11 = [(ICTTTextStorageWithRange *)self workerContext];

  if (!v11) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.workerContext != ((void *)0)" functionName:"-[ICTTTextStorageWithRange loadDataWithTypeIdentifier:forItemProviderCompletionHandler:]" simulateCrash:1 showAlert:0 format:@"Seems like prepareTextStorage was never called"];
  }
  v12 = [(ICTTTextStorageWithRange *)self workerContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__ICTTTextStorageWithRange_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v16[3] = &unk_1E5FDB710;
  v16[4] = self;
  id v17 = v6;
  uint64_t v19 = v8;
  uint64_t v20 = v10;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  [v12 performBlock:v16];

  return 0;
}

void __88__ICTTTextStorageWithRange_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) textStorage];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) textStorage];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) workerContextNote];
    uint64_t v2 = objc_msgSend(v3, "copyDataForUTI:range:persistenceHelper:", v4, *(void *)(a1 + 56), *(void *)(a1 + 64), v5);
  }
  id v6 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [*(id *)(a1 + 32) textStorage];
    uint64_t v8 = objc_msgSend(v7, "ic_prettyLoggingDescription");
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    int v11 = 138413058;
    v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    uint64_t v18 = [v2 length];
    _os_log_debug_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEBUG, "Load provider data for textStorage: %@, range: (%lu, %lu) => data length: %lu", (uint8_t *)&v11, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (unint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:(id)a3
{
  return [MEMORY[0x1E4F28B18] _preferredRepresentationForItemProviderWritableTypeIdentifier:a3];
}

- (id)_loadFileRepresentationOfTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICTTTextStorageWithRange *)self range];
  uint64_t v10 = v9;
  int v11 = [(ICTTTextStorageWithRange *)self workerContext];

  if (!v11) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.workerContext != ((void *)0)" functionName:"-[ICTTTextStorageWithRange _loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:]" simulateCrash:1 showAlert:0 format:@"Seems like prepareTextStorage was never called"];
  }
  v12 = [(ICTTTextStorageWithRange *)self workerContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__ICTTTextStorageWithRange__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v16[3] = &unk_1E5FDB710;
  uint64_t v19 = v8;
  uint64_t v20 = v10;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  [v12 performBlock:v16];

  return 0;
}

void __101__ICTTTextStorageWithRange__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __101__ICTTTextStorageWithRange__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) textStorage];
  uint64_t v4 = objc_msgSend(v3, "filteredAttributedStringForUTI:range:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64));

  if (v4) {
    id v5 = (id)[v4 _loadFileRepresentationOfTypeIdentifier:*(void *)(a1 + 40) forItemProviderCompletionHandler:*(void *)(a1 + 48)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
}

- (ICNote)workerContextNote
{
  return self->_workerContextNote;
}

- (void)setWorkerContextNote:(id)a3
{
}

- (ICTTTextStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_workerContextNote, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

void __101__ICTTTextStorageWithRange__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) textStorage];
  id v5 = objc_msgSend(v4, "ic_prettyLoggingDescription");
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  int v8 = 138412802;
  uint64_t v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Load file representation for textStorage: %@, range: (%lu, %lu)", (uint8_t *)&v8, 0x20u);
}

@end