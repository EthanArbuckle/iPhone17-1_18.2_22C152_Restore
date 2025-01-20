@interface ICDrawingPencilKitConverter
+ (BOOL)canUpdateFullscreenSketchAttachment:(id)a3;
+ (BOOL)canUpdateInlineDrawingAttachment:(id)a3;
+ (id)newThrowawayConverter;
+ (id)sharedConverter;
+ (unint64_t)countOfUpdatableDrawingsInNote:(id)a3;
- (BOOL)compareDrawingAttachment:(id)a3 withConvertedDrawing:(id)a4;
- (BOOL)isThrowaway;
- (BOOL)shouldAutoConvertNote:(id)a3;
- (BOOL)shouldConvertAllDrawingsIfNeeded;
- (ICDrawingPencilKitConverter)init;
- (NSArray)failedSketches;
- (NSMapTable)lastOperationForAttachmentID;
- (NSMutableArray)mutableFailedSketches;
- (NSOperationQueue)converterQueue;
- (OS_dispatch_queue)convertDispatchQueue;
- (id)addOperationForAttachment:(id)a3 automatic:(BOOL)a4;
- (id)convertSketch:(id)a3;
- (id)convertSketchAttachment:(id)a3 toInlineDrawingAtRange:(_NSRange)a4 inNote:(id)a5;
- (id)updateInlineDrawingAttachment:(id)a3;
- (unint64_t)convertAllSketchesInNote:(id)a3;
- (unint64_t)countOfDrawingsNeedingConversionInNote:(id)a3;
- (void)canAutoUpdateDrawingsInAccount:(id)a3 completion:(id)a4;
- (void)convertAllDrawingsIfNeeded;
- (void)convertAllSketchesWithProgress:(id)a3;
- (void)convertAllSketchesWithProgress:(id)a3 completion:(id)a4;
- (void)convertDrawingsInNote:(id)a3 inWindow:(id)a4 message:(id)a5 completion:(id)a6;
- (void)convertDrawingsInNote:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)convertDrawingsInNoteIfNeeded:(id)a3;
- (void)operationComplete:(id)a3;
- (void)setConvertDispatchQueue:(id)a3;
- (void)setConverterQueue:(id)a3;
- (void)setIsThrowaway:(BOOL)a3;
- (void)setLastOperationForAttachmentID:(id)a3;
- (void)setMutableFailedSketches:(id)a3;
@end

@implementation ICDrawingPencilKitConverter

- (void)convertDrawingsInNoteIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(ICDrawingPencilKitConverter *)self shouldAutoConvertNote:v4]
    && [(ICDrawingPencilKitConverter *)self shouldConvertAllDrawingsIfNeeded]
    && [(ICDrawingPencilKitConverter *)self countOfDrawingsNeedingConversionInNote:v4])
  {
    v5 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICDrawingPencilKitConverter convertDrawingsInNoteIfNeeded:](v4, v5);
    }

    objc_initWeak(&location, self);
    v6 = +[ICDrawingPencilKitConverter sharedConverter];
    v7 = [v4 account];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke;
    v8[3] = &unk_1E5FD94A8;
    id v9 = v4;
    objc_copyWeak(&v10, &location);
    [v6 canAutoUpdateDrawingsInAccount:v7 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldConvertAllDrawingsIfNeeded
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F83880]];

  return v3 ^ 1;
}

- (BOOL)shouldAutoConvertNote:(id)a3
{
  id v3 = a3;
  if ([v3 isSharedViaICloud]) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 isEditable];
  }

  return v4;
}

- (unint64_t)countOfDrawingsNeedingConversionInNote:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F1CA80] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [v3 attachments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v22 + 1) + 8 * v9) objectID];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  v11 = [v3 managedObjectContext];
  v12 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v13 = *MEMORY[0x1E4F83068];
  v26[0] = *MEMORY[0x1E4F83050];
  v26[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v15 = [v12 predicateWithFormat:@"self IN %@ AND typeUTI IN %@ AND markedForDeletion == NO", v4, v14];

  v16 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ICAttachment"];
  [v16 setPredicate:v15];
  [v16 setIncludesSubentities:0];
  id v21 = 0;
  unint64_t v17 = [v11 countForFetchRequest:v16 error:&v21];
  id v18 = v21;
  if (v18)
  {
    v19 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICDrawingPencilKitConverter countOfDrawingsNeedingConversionInNote:]((uint64_t)v18, v19);
    }
  }
  return v17;
}

uint64_t __46__ICDrawingPencilKitConverter_sharedConverter__block_invoke()
{
  sharedConverter = objc_alloc_init(ICDrawingPencilKitConverter);
  return MEMORY[0x1F41817F8]();
}

- (ICDrawingPencilKitConverter)init
{
  v11.receiver = self;
  v11.super_class = (Class)ICDrawingPencilKitConverter;
  v2 = [(ICDrawingPencilKitConverter *)&v11 init];
  if (v2)
  {
    id v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    converterQueue = v2->_converterQueue;
    v2->_converterQueue = v3;

    [(NSOperationQueue *)v2->_converterQueue setName:@"Converter Queue"];
    [(NSOperationQueue *)v2->_converterQueue setMaxConcurrentOperationCount:1];
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    lastOperationForAttachmentID = v2->_lastOperationForAttachmentID;
    v2->_lastOperationForAttachmentID = (NSMapTable *)v5;

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.notes.drawing-converter", v7);
    convertDispatchQueue = v2->_convertDispatchQueue;
    v2->_convertDispatchQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

+ (id)sharedConverter
{
  if (sharedConverter_once != -1) {
    dispatch_once(&sharedConverter_once, &__block_literal_global_1);
  }
  v2 = (void *)sharedConverter;
  return v2;
}

+ (id)newThrowawayConverter
{
  v2 = objc_alloc_init(ICDrawingPencilKitConverter);
  [(ICDrawingPencilKitConverter *)v2 setIsThrowaway:1];
  return v2;
}

+ (BOOL)canUpdateFullscreenSketchAttachment:(id)a3
{
  id v3 = a3;
  int v4 = [v3 attachmentType];
  uint64_t v5 = [v3 note];
  int v6 = [v5 isEditable];

  if ([v3 needsToBeFetchedFromCloud]) {
    LOBYTE(v7) = 0;
  }
  else {
    int v7 = [v3 needsInitialFetchFromCloud] ^ 1;
  }
  dispatch_queue_t v8 = [v3 mergeableData];

  if (v4 == 9) {
    int v9 = v6;
  }
  else {
    int v9 = 0;
  }
  if (v8) {
    BOOL v10 = v7;
  }
  else {
    BOOL v10 = 0;
  }
  BOOL v11 = v9 == 1 && v10;

  return v11;
}

+ (BOOL)canUpdateInlineDrawingAttachment:(id)a3
{
  id v3 = a3;
  int v4 = [v3 attachmentType];
  uint64_t v5 = [v3 typeUTI];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F83068]];

  int v7 = [v3 note];
  unsigned __int8 v8 = [v7 isEditable];

  if ([v3 needsToBeFetchedFromCloud]) {
    LOBYTE(v9) = 0;
  }
  else {
    int v9 = [v3 needsInitialFetchFromCloud] ^ 1;
  }
  BOOL v10 = [v3 mergeableData];

  if (v4 == 10)
  {
    BOOL v11 = 0;
    if (((v6 ^ 1) & 1) == 0)
    {
      if (v10) {
        BOOL v12 = v9;
      }
      else {
        BOOL v12 = 0;
      }
      BOOL v11 = ((v8 ^ 1) & 1) == 0 && v12;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (unint64_t)countOfUpdatableDrawingsInNote:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ICDrawingPencilKitConverter_countOfUpdatableDrawingsInNote___block_invoke;
  v7[3] = &unk_1E5FD92B0;
  v7[4] = &v8;
  v7[5] = a1;
  [v4 enumerateAttachmentsInOrderUsingBlock:v7];
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __62__ICDrawingPencilKitConverter_countOfUpdatableDrawingsInNote___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([(id)objc_opt_class() canUpdateFullscreenSketchAttachment:v3] & 1) != 0
    || [(id)objc_opt_class() canUpdateInlineDrawingAttachment:v3])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void)canAutoUpdateDrawingsInAccount:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 accountType];
  if (v7 == 1)
  {
    uint64_t v8 = [MEMORY[0x1E4F83330] sharedController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__ICDrawingPencilKitConverter_canAutoUpdateDrawingsInAccount_completion___block_invoke;
    v9[3] = &unk_1E5FD92F8;
    id v10 = v6;
    [v8 devicesForAccount:v5 completionHandler:v9];
  }
  else if (v7 == 3 && v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

uint64_t __73__ICDrawingPencilKitConverter_canAutoUpdateDrawingsInAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ic_allSatisfy:", &__block_literal_global_33);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

BOOL __73__ICDrawingPencilKitConverter_canAutoUpdateDrawingsInAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 maximumNotesVersion] > 3;
}

- (NSMutableArray)mutableFailedSketches
{
  mutableFailedSketches = self->_mutableFailedSketches;
  if (!mutableFailedSketches)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = self->_mutableFailedSketches;
    self->_mutableFailedSketches = v4;

    mutableFailedSketches = self->_mutableFailedSketches;
  }
  return mutableFailedSketches;
}

- (NSArray)failedSketches
{
  v2 = [(ICDrawingPencilKitConverter *)self mutableFailedSketches];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)convertAllSketchesWithProgress:(id)a3
{
}

- (void)convertAllSketchesWithProgress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F83428] sharedContext];
  int v9 = [v8 workerManagedObjectContext];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke;
  v17[3] = &unk_1E5FD8FE8;
  id v10 = v9;
  id v18 = v10;
  id v11 = v6;
  id v19 = v11;
  v20 = self;
  [v10 performBlockAndWait:v17];
  if (![(ICDrawingPencilKitConverter *)self isThrowaway])
  {
    BOOL v12 = [MEMORY[0x1E4F83428] sharedContext];
    uint64_t v13 = [v12 managedObjectContext];
    objc_msgSend(v13, "ic_saveWithLogDescription:", @"saving main context after converting all sketch attachments");

    v14 = +[ICAttachmentPreviewGenerator sharedGenerator];
    [v14 generatePreviewsIfNeeded];
  }
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_46;
    v15[3] = &unk_1E5FD9320;
    id v16 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }
}

void __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v29 = [MEMORY[0x1E4F1C9C8] date];
  v2 = [MEMORY[0x1E4F83278] allActiveAccountsInContext:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) predicateForVisibleNotes];
        id v11 = objc_msgSend(MEMORY[0x1E4F83418], "ic_objectIDsMatchingPredicate:context:", v10, *(void *)(a1 + 32));
        [v3 addObjectsFromArray:v11];
        v7 += [v11 count];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  BOOL v12 = (id *)(a1 + 40);
  [*(id *)(a1 + 40) setTotalUnitCount:v7];
  [*(id *)(a1 + 40) setCompletedUnitCount:0];
  uint64_t v13 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_cold_2(v7, v13);
  }
  uint64_t v28 = v4;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * v20);
        long long v22 = (void *)MEMORY[0x1B3E9ED80]();
        long long v23 = objc_msgSend(MEMORY[0x1E4F83418], "ic_existingObjectWithID:context:", v21, *(void *)(a1 + 32));
        v17 += [*(id *)(a1 + 48) convertAllSketchesInNote:v23];
        [*(id *)(a1 + 40) setCompletedUnitCount:++v20 + v18];
      }
      while (v16 != v20);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v44 count:16];
      v18 += v20;
    }
    while (v16);
    BOOL v12 = (id *)(a1 + 40);
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }

  long long v24 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    [v29 timeIntervalSinceNow];
    *(_DWORD *)buf = 134218496;
    uint64_t v39 = v17;
    __int16 v40 = 2048;
    uint64_t v41 = v18;
    __int16 v42 = 2048;
    double v43 = -v27;
    _os_log_debug_impl(&dword_1B08EB000, v24, OS_LOG_TYPE_DEBUG, "Finished converting %lu sketches in %lu notes in %f seconds", buf, 0x20u);
  }

  uint64_t v25 = [*v12 completedUnitCount];
  if (v25 != [*v12 totalUnitCount])
  {
    v26 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_cold_1(v12, v26);
    }
  }
}

uint64_t __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_46(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)convertAllSketchesInNote:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  if (([v4 isSharedViaICloud] & 1) != 0
    || ([v4 isDeletedOrInTrash] & 1) != 0
    || ([v4 isPasswordProtected] & 1) != 0
    || ![v4 isEditable])
  {
    uint64_t v16 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [v4 shortLoggingDescription];
      if ([v4 isSharedViaICloud]) {
        uint64_t v20 = @"shared";
      }
      else {
        uint64_t v20 = @"n";
      }
      if ([v4 isDeletedOrInTrash]) {
        uint64_t v21 = @"deleted";
      }
      else {
        uint64_t v21 = @"n";
      }
      int v22 = [v4 isPasswordProtected];
      int v23 = [v4 isEditable];
      long long v24 = @"password-protected";
      *(_DWORD *)buf = 138413314;
      if (!v22) {
        long long v24 = @"n";
      }
      id v38 = v19;
      uint64_t v25 = @"not-editable";
      __int16 v39 = 2112;
      __int16 v40 = v20;
      __int16 v41 = 2112;
      if (v23) {
        uint64_t v25 = @"editable";
      }
      __int16 v42 = v21;
      __int16 v43 = 2112;
      v44 = v24;
      __int16 v45 = 2112;
      uint64_t v46 = v25;
      _os_log_debug_impl(&dword_1B08EB000, v16, OS_LOG_TYPE_DEBUG, "not converting sketches in note %@ %@ %@ %@ %@", buf, 0x34u);
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [v4 shortLoggingDescription];
      [(ICDrawingPencilKitConverter *)v6 convertAllSketchesInNote:v5];
    }

    uint64_t v7 = [v4 textStorage];
    uint64_t v8 = [v4 managedObjectContext];
    int v9 = [v4 textStorage];
    uint64_t v10 = [v9 length];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __56__ICDrawingPencilKitConverter_convertAllSketchesInNote___block_invoke;
    v29 = &unk_1E5FD9348;
    long long v30 = self;
    id v11 = v4;
    id v31 = v11;
    long long v32 = &v33;
    objc_msgSend(v7, "ic_enumerateAttachmentsInContext:range:options:usingBlock:", v8, 0, v10, 2, &v26);

    BOOL v12 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = v34[3];
      id v14 = [v11 shortLoggingDescription];
      -[ICDrawingPencilKitConverter convertAllSketchesInNote:](v14, buf, v13, v12);
    }

    if (v34[3] && ![(ICDrawingPencilKitConverter *)self isThrowaway])
    {
      uint64_t v15 = [v11 managedObjectContext];
      objc_msgSend(v15, "ic_saveWithLogDescription:", @"saving note with %lu converted sketches", v34[3], v26, v27, v28, v29, v30);
    }
  }
  unint64_t v17 = v34[3];
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __56__ICDrawingPencilKitConverter_convertAllSketchesInNote___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  if ([(id)objc_opt_class() canUpdateFullscreenSketchAttachment:v9])
  {
    uint64_t v7 = (void *)MEMORY[0x1B3E9ED80]();
    id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "convertSketchAttachment:toInlineDrawingAtRange:inNote:", v9, a3, a4, *(void *)(a1 + 40));
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (id)convertSketchAttachment:(id)a3 toInlineDrawingAtRange:(_NSRange)a4 inNote:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 drawingModel];
  BOOL v12 = [v11 drawing];

  uint64_t v13 = [(ICDrawingPencilKitConverter *)self convertSketch:v12];
  id v14 = [v13 serializeWithVersion:2];
  if (!v13
    || [(ICDrawingPencilKitConverter *)self compareDrawingAttachment:v9 withConvertedDrawing:v13])
  {
    uint64_t v15 = [(ICDrawingPencilKitConverter *)self mutableFailedSketches];
    uint64_t v16 = [v9 objectID];
    [v15 addObject:v16];
  }
  if (!v14)
  {
    unint64_t v17 = 0;
    goto LABEL_29;
  }
  unint64_t v17 = 0;
  if (![(ICDrawingPencilKitConverter *)self isThrowaway] && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v18 = objc_msgSend(v10, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(v14, "length"));
    id v19 = os_log_create("com.apple.notes", "PencilKit");
    uint64_t v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = [v9 shortLoggingDescription];
        v47 = objc_msgSend(v13, "ic_loggingDescription");
        *(_DWORD *)buf = 138412802;
        v58 = v46;
        __int16 v59 = 2112;
        v60 = v47;
        __int16 v61 = 2048;
        uint64_t v62 = [v14 length];
        _os_log_error_impl(&dword_1B08EB000, v20, OS_LOG_TYPE_ERROR, "over limit when converting: sketch %@ has pkDrawing %@ with size %lu", buf, 0x20u);
      }
      unint64_t v17 = 0;
      uint64_t v21 = v20;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v48 = [v9 shortLoggingDescription];
        v49 = [v10 shortLoggingDescription];
        v65.NSUInteger location = location;
        v65.NSUInteger length = length;
        NSStringFromRange(v65);
        v50 = NSUInteger v56 = location;
        *(_DWORD *)buf = 138412802;
        v58 = v48;
        __int16 v59 = 2112;
        v60 = v49;
        __int16 v61 = 2112;
        uint64_t v62 = (uint64_t)v50;
        _os_log_debug_impl(&dword_1B08EB000, v20, OS_LOG_TYPE_DEBUG, "converting sketch %@ in note %@ at range %@", buf, 0x20u);

        NSUInteger location = v56;
      }

      int v22 = [v10 textStorage];
      unsigned int v23 = [v22 wantsUndoCommands];

      long long v24 = [v10 textStorage];
      [v24 setWantsUndoCommands:0];

      uint64_t v25 = [v10 addInlineDrawingAttachmentWithAnalytics:0];
      if (!v25)
      {
        uint64_t v21 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[ICDrawingPencilKitConverter convertSketchAttachment:toInlineDrawingAtRange:inNote:](v21);
        }
        unint64_t v17 = 0;
        goto LABEL_28;
      }
      unint64_t v17 = v25;
      unsigned int v52 = v23;
      [v25 setMergeableData:v14];
      uint64_t v26 = [v17 metadata];
      uint64_t v27 = v26;
      if (!v26) {
        uint64_t v26 = (void *)MEMORY[0x1E4F1CC08];
      }
      uint64_t v28 = [v26 mutableCopy];

      [v28 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F83020]];
      v53 = v28;
      [v17 setMetadata:v28];
      [MEMORY[0x1E4F83368] defaultPixelSize];
      v29 = objc_msgSend(v9, "attachmentPreviewImageWithMinSize:scale:");
      uint64_t v20 = v29;
      NSUInteger v54 = length;
      NSUInteger v55 = location;
      if (v29
        && ([v29 image], (uint64_t v30 = objc_claimAutoreleasedReturnValue()) != 0)
        && (id v31 = (void *)v30,
            unsigned int v51 = [v20 version],
            unsigned int v32 = [MEMORY[0x1E4F83370] serializationVersion],
            v31,
            v32 <= v51))
      {
        uint64_t v33 = [v20 image];
        [v33 size];
        objc_msgSend(v17, "setSizeWidth:");
        [v33 size];
        [v17 setSizeHeight:v34];
        uint64_t v35 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
        uint64_t v36 = [v33 ic_imageDataWithUTType:v35];
        [v17 writeFallbackImageData:v36];
      }
      else
      {
        uint64_t v33 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[ICDrawingPencilKitConverter convertSketchAttachment:toInlineDrawingAtRange:inNote:](v33);
        }
      }

      long long v37 = [v9 userTitle];
      [v17 setUserTitle:v37];

      id v38 = [v9 title];
      [v17 setTitle:v38];

      __int16 v39 = [v9 summary];
      [v17 setSummary:v39];

      __int16 v40 = +[ICTextAttachment textAttachmentWithAttachment:v17];
      __int16 v41 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v40];
      __int16 v42 = (void *)[v41 mutableCopy];

      objc_msgSend(v42, "addAttribute:value:range:", *MEMORY[0x1E4FB06B8], v40, 0, objc_msgSend(v42, "length"));
      __int16 v43 = [v10 textStorage];
      objc_msgSend(v43, "replaceCharactersInRange:withAttributedString:", v55, v54, v42);

      [v9 markForDeletion];
      [v9 updateChangeCountWithReason:@"Converted sketch to inline drawing"];
      [v17 updateChangeCountWithReason:@"Converted sketch to inline drawing"];
      [v10 updateChangeCountWithReason:@"Converted sketch to inline drawing"];
      v44 = [v10 textStorage];
      [v44 setWantsUndoCommands:v52];

      uint64_t v21 = v53;
    }

LABEL_28:
  }
LABEL_29:

  return v17;
}

- (id)convertSketch:(id)a3
{
  id v3 = a3;
  id v4 = [v3 serializeWithPathData:1];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1;
  uint64_t v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v6 = (void *)MEMORY[0x1E4F38DF8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__ICDrawingPencilKitConverter_convertSketch___block_invoke;
  v12[3] = &unk_1E5FD9370;
  id v7 = v3;
  id v13 = v7;
  uint64_t v15 = v23;
  uint64_t v16 = &v17;
  id v8 = v5;
  id v14 = v8;
  id v9 = (id)[v6 _upgradeDrawingData:v4 queue:0 completionBlock:v12];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v23, 8);

  return v10;
}

void __45__ICDrawingPencilKitConverter_convertSketch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__ICDrawingPencilKitConverter_convertSketch___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)updateInlineDrawingAttachment:(id)a3
{
  id v3 = a3;
  id v4 = [v3 typeUTI];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F83068]];

  uint64_t v6 = [v3 rangeInNote];
  if (v5) {
    BOOL v7 = v6 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v8 = [v3 note];
    id v9 = [v8 textStorage];
    uint64_t v10 = [v9 wantsUndoCommands];

    id v11 = [v8 textStorage];
    [v11 setWantsUndoCommands:0];

    BOOL v12 = [v8 addInlineDrawingAttachmentWithAnalytics:0];
    id v13 = [v3 mergeableData];
    [v12 setMergeableData:v13];

    [v12 setTypeUTI:*MEMORY[0x1E4F83060]];
    [v3 sizeWidth];
    objc_msgSend(v12, "setSizeWidth:");
    [v3 sizeHeight];
    objc_msgSend(v12, "setSizeHeight:");
    id v14 = [v3 fallbackImageData];
    [v12 writeFallbackImageData:v14];

    uint64_t v15 = [v3 userTitle];
    [v12 setUserTitle:v15];

    uint64_t v16 = [v3 title];
    [v12 setTitle:v16];

    uint64_t v17 = [v3 summary];
    [v12 setSummary:v17];

    char v18 = +[ICTextAttachment textAttachmentWithAttachment:v12];
    uint64_t v19 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v18];
    uint64_t v20 = (void *)[v19 mutableCopy];

    uint64_t v21 = *MEMORY[0x1E4FB06B8];
    uint64_t v22 = objc_msgSend(v20, "ic_range");
    objc_msgSend(v20, "addAttribute:value:range:", v21, v18, v22, v23);
    uint64_t v24 = [v3 rangeInNote];
    uint64_t v26 = v25;
    uint64_t v27 = [v8 textStorage];
    objc_msgSend(v27, "replaceCharactersInRange:withAttributedString:", v24, v26, v20);

    [v3 markForDeletion];
    [v3 updateChangeCountWithReason:@"Updated inline drawing"];
    [v12 updateChangeCountWithReason:@"Updated inline drawing"];
    [v8 updateChangeCountWithReason:@"Updated inline drawing"];
    uint64_t v28 = [v8 textStorage];
    [v28 setWantsUndoCommands:v10];

    v29 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      [(ICDrawingPencilKitConverter *)v3 updateInlineDrawingAttachment:v29];
    }
  }
  return v12;
}

- (BOOL)compareDrawingAttachment:(id)a3 withConvertedDrawing:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x1E4F837F8] isInternalInstall];
  BOOL v8 = 0;
  if (v5 && v7)
  {
    [MEMORY[0x1E4F83368] defaultPixelSize];
    id v9 = objc_msgSend(v5, "attachmentPreviewImageWithMinSize:scale:");
    uint64_t v10 = v9;
    if (v9
      && (int v11 = [v9 version],
          [MEMORY[0x1E4F83370] serializationVersion] == v11))
    {
      BOOL v12 = [v10 image];
      if (!v12) {
        goto LABEL_16;
      }
      [MEMORY[0x1E4F38E20] compareLegacyDrawingImage:v12 toConvertedDrawing:v6];
      double v14 = v13;
      uint64_t v15 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        [v12 size];
        uint64_t v16 = NSStringFromCGSize(v30);
        uint64_t v17 = [v12 imageOrientation];
        [v6 _canvasBounds];
        char v18 = NSStringFromCGRect(v31);
        int v21 = 134218754;
        double v22 = v14;
        __int16 v23 = 2112;
        uint64_t v24 = v16;
        __int16 v25 = 2048;
        uint64_t v26 = v17;
        __int16 v27 = 2112;
        uint64_t v28 = v18;
        _os_log_impl(&dword_1B08EB000, v15, OS_LOG_TYPE_DEFAULT, "convertSketch compareError %f %@ %lu %@", (uint8_t *)&v21, 0x2Au);
      }
      if (v14 <= 5.0)
      {
LABEL_16:
        BOOL v8 = 0;
        goto LABEL_17;
      }
      uint64_t v19 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ICDrawingPencilKitConverter compareDrawingAttachment:withConvertedDrawing:](v19, v14);
      }
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v19 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ICDrawingPencilKitConverter compareDrawingAttachment:withConvertedDrawing:](v10, (uint64_t)v5, v19);
      }

      BOOL v12 = 0;
      BOOL v8 = 0;
    }

LABEL_17:
  }

  return v8;
}

- (void)convertDrawingsInNote:(id)a3 inWindow:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  BOOL v12 = [[ICLongRunningTaskController alloc] initWithWindow:v11 intervalBeforeOpeningProgressDialog:0.1];

  [(ICLongRunningTaskController *)v12 setProgressString:v10];
  [(ICLongRunningTaskController *)v12 setAllowSingleUnitProgress:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__ICDrawingPencilKitConverter_convertDrawingsInNote_inWindow_message_completion___block_invoke;
  v14[3] = &unk_1E5FD9398;
  id v15 = v9;
  uint64_t v16 = self;
  id v13 = v9;
  [(ICLongRunningTaskController *)v12 startTask:v14 completionBlock:&__block_literal_global_86];
}

void __81__ICDrawingPencilKitConverter_convertDrawingsInNote_inWindow_message_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTotalUnitCount:1];
  [v3 setCompletedUnitCount:1];

  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__ICDrawingPencilKitConverter_convertDrawingsInNote_inWindow_message_completion___block_invoke_2;
  v7[3] = &unk_1E5FD91D0;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  [v4 performBlockAndWait:v7];
}

uint64_t __81__ICDrawingPencilKitConverter_convertDrawingsInNote_inWindow_message_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) convertDrawingsInNote:*(void *)(a1 + 40) waitUntilFinished:1];
}

- (id)addOperationForAttachment:(id)a3 automatic:(BOOL)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__1;
  CGSize v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__1;
  v24[4] = __Block_byref_object_dispose__1;
  id v25 = 0;
  int v7 = [MEMORY[0x1E4F83428] sharedContext];
  int8x16_t v8 = [v7 managedObjectContext];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__ICDrawingPencilKitConverter_addOperationForAttachment_automatic___block_invoke;
  v20[3] = &unk_1E5FD93E0;
  id v9 = v6;
  id v21 = v9;
  id v10 = v8;
  id v22 = v10;
  __int16 v23 = v24;
  [v10 performBlockAndWait:v20];
  id v11 = [(ICDrawingPencilKitConverter *)self convertDispatchQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__ICDrawingPencilKitConverter_addOperationForAttachment_automatic___block_invoke_2;
  v15[3] = &unk_1E5FD9408;
  void v15[4] = self;
  id v16 = v9;
  uint64_t v17 = &v26;
  char v18 = v24;
  BOOL v19 = a4;
  id v12 = v9;
  dispatch_sync(v11, v15);

  id v13 = (id)v27[5];
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(&v26, 8);
  return v13;
}

void __67__ICDrawingPencilKitConverter_addOperationForAttachment_automatic___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F832A0];
  id v3 = [*(id *)(a1 + 32) objectID];
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, *(void *)(a1 + 40));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v4 = [v13 attachmentType] == 10;
  id v5 = v13;
  if (v4)
  {
    id v6 = [v13 note];
    uint64_t v7 = [v13 rangeInNote];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"range.location != NSNotFound" functionName:"-[ICDrawingPencilKitConverter addOperationForAttachment:automatic:]_block_invoke" simulateCrash:1 showAlert:0 format:@"ICDrawingPencilKitConverter operationComplete expected to find attachment range in note"];
    }
    objc_opt_class();
    int8x16_t v8 = [v6 textStorage];
    id v9 = [v8 attribute:*MEMORY[0x1E4FB06B8] atIndex:v7 effectiveRange:0];
    uint64_t v10 = ICDynamicCast();
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    id v5 = v13;
  }
}

void __67__ICDrawingPencilKitConverter_addOperationForAttachment_automatic___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lastOperationForAttachmentID];
  id v3 = [*(id *)(a1 + 40) objectID];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = [[ICDrawingConversionOperation alloc] initWithAttachment:*(void *)(a1 + 40) textAttachment:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) automatic:*(unsigned __int8 *)(a1 + 64)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = [*(id *)(a1 + 32) converterQueue];
    [v10 addOperation:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    id v14 = [*(id *)(a1 + 32) lastOperationForAttachmentID];
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v13 = [v11 objectID];
    [v14 setObject:v12 forKey:v13];
  }
}

- (void)convertAllDrawingsIfNeeded
{
  if ([(ICDrawingPencilKitConverter *)self shouldConvertAllDrawingsIfNeeded])
  {
    id v3 = [MEMORY[0x1E4F83428] sharedContext];
    uint64_t v4 = [v3 workerManagedObjectContext];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke;
    v6[3] = &unk_1E5FD91D0;
    id v7 = v4;
    uint64_t v8 = self;
    id v5 = v4;
    [v5 performBlock:v6];
  }
}

void __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F83278] allActiveAccountsInContext:*(void *)(a1 + 32)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * v6);
        uint64_t v8 = (void *)MEMORY[0x1B3E9ED80]();
        id v9 = *(void **)(a1 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke_2;
        v12[3] = &unk_1E5FD8FE8;
        void v12[4] = v7;
        id v10 = v9;
        uint64_t v11 = *(void *)(a1 + 40);
        id v13 = v10;
        uint64_t v14 = v11;
        [v10 performBlock:v12];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) reset];
}

void __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke_2(id *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [a1[4] predicateForVisibleNotes];
  BOOL v19 = v2 = 0x1E4F83000uLL;
  objc_msgSend(MEMORY[0x1E4F83418], "ic_objectIDsMatchingPredicate:context:");
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v32;
    uint64_t v20 = *(void *)v32;
    do
    {
      uint64_t v6 = 0;
      uint64_t v21 = v4;
      do
      {
        if (*(void *)v32 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 8 * v6);
        uint64_t v8 = (void *)MEMORY[0x1B3E9ED80]();
        id v9 = objc_msgSend(*(id *)(v2 + 1048), "ic_existingObjectWithID:context:", v7, a1[5]);
        if ([a1[6] shouldAutoConvertNote:v9])
        {
          uint64_t v24 = v8;
          uint64_t v25 = v6;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          __int16 v23 = v9;
          id v10 = [v9 attachments];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v28;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v28 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
                long long v16 = (void *)MEMORY[0x1B3E9ED80]();
                if ([v15 isVisible]
                  && (([(id)objc_opt_class() canUpdateFullscreenSketchAttachment:v15] & 1) != 0
                   || [(id)objc_opt_class() canUpdateInlineDrawingAttachment:v15]))
                {
                  id v17 = a1[6];
                  id v18 = a1[4];
                  v26[0] = MEMORY[0x1E4F143A8];
                  v26[1] = 3221225472;
                  void v26[2] = __57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke_3;
                  v26[3] = &unk_1E5FD9430;
                  v26[4] = v17;
                  v26[5] = v15;
                  [v17 canAutoUpdateDrawingsInAccount:v18 completion:v26];
                }
                objc_msgSend(a1[5], "ic_refreshObject:mergeChanges:", v15, 0);
                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v12);
          }

          unint64_t v2 = 0x1E4F83000;
          uint64_t v5 = v20;
          uint64_t v4 = v21;
          uint64_t v8 = v24;
          uint64_t v6 = v25;
          id v9 = v23;
        }
        objc_msgSend(a1[5], "ic_refreshObject:mergeChanges:", v9, 0);

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v4);
  }
}

id *__57__ICDrawingPencilKitConverter_convertAllDrawingsIfNeeded__block_invoke_3(id *result, int a2)
{
  if (a2) {
    return (id *)(id)[result[4] addOperationForAttachment:result[5] automatic:1];
  }
  return result;
}

- (void)convertDrawingsInNote:(id)a3 waitUntilFinished:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__ICDrawingPencilKitConverter_convertDrawingsInNote_waitUntilFinished___block_invoke;
  v4[3] = &unk_1E5FD9458;
  v4[4] = self;
  BOOL v5 = a4;
  [a3 enumerateAttachmentsInOrderUsingBlock:v4];
}

void __71__ICDrawingPencilKitConverter_convertDrawingsInNote_waitUntilFinished___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([(id)objc_opt_class() canUpdateFullscreenSketchAttachment:v4] & 1) != 0
    || [(id)objc_opt_class() canUpdateInlineDrawingAttachment:v4])
  {
    uint64_t v3 = [*(id *)(a1 + 32) addOperationForAttachment:v4 automatic:*(unsigned char *)(a1 + 40) == 0];
    [v3 setQueuePriority:4];
    [v3 setQualityOfService:-1];
    if (*(unsigned char *)(a1 + 40)) {
      [v3 waitUntilFinished];
    }
  }
}

void __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke_cold_1(v3);
    }

    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke_96;
    v4[3] = &unk_1E5FD9480;
    id v5 = *(id *)(a1 + 32);
    objc_copyWeak(&v6, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v6);
  }
}

void __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke_96(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  objc_msgSend(v2, "ic_saveWithLogDescription:", @"Save before converting drawings in a single opened note");

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained convertDrawingsInNote:*(void *)(a1 + 32) waitUntilFinished:0];
}

- (void)operationComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDrawingPencilKitConverter *)self convertDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ICDrawingPencilKitConverter_operationComplete___block_invoke;
  block[3] = &unk_1E5FD91D0;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = self;
  dispatch_async(v5, block);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__ICDrawingPencilKitConverter_operationComplete___block_invoke_2;
  v8[3] = &unk_1E5FD8DF0;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __49__ICDrawingPencilKitConverter_operationComplete___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) finalAttachmentID];

  if (v2)
  {
    uint64_t v3 = +[ICAttachmentPreviewGenerator sharedGenerator];
    id v4 = [*(id *)(a1 + 32) finalAttachmentID];
    [v3 generatePreviewIfNeededForAttachmentWithObjectID:v4];
  }
  id v6 = [*(id *)(a1 + 40) lastOperationForAttachmentID];
  id v5 = [*(id *)(a1 + 32) attachmentID];
  [v6 removeObjectForKey:v5];
}

void __49__ICDrawingPencilKitConverter_operationComplete___block_invoke_2(uint64_t a1)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)MEMORY[0x1E4F832A0];
  uint64_t v3 = [*(id *)(a1 + 32) attachmentID];
  id v4 = [MEMORY[0x1E4F83428] sharedContext];
  id v5 = [v4 managedObjectContext];
  id v6 = objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v5);

  if ([v6 attachmentType] == 10)
  {
    objc_opt_class();
    id v7 = [*(id *)(a1 + 32) textAttachment];
    uint64_t v8 = ICDynamicCast();

    [v8 detachView];
LABEL_5:

    goto LABEL_6;
  }
  id v9 = [*(id *)(a1 + 32) finalAttachmentID];

  if (v9)
  {
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v28[0] = @"ICDrawingPencilKitConvertedNotificationFinalAttachmentKey";
    id v10 = [*(id *)(a1 + 32) finalAttachmentID];
    v28[1] = @"ICDrawingPencilKitConvertedNotificationAutomaticKey";
    v29[0] = v10;
    id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isAutomatic"));
    v29[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    [v8 postNotificationName:@"ICDrawingPencilKitConvertedNotification" object:0 userInfo:v12];

    goto LABEL_5;
  }
LABEL_6:
  uint64_t v13 = [v6 note];
  uint64_t v14 = [v13 noteData];
  [v14 setNeedsToBeSaved:1];

  long long v15 = [v6 note];
  long long v16 = [v15 noteData];
  [v16 saveNoteDataIfNeeded];

  id v17 = [MEMORY[0x1E4F83428] sharedContext];
  id v18 = [v17 managedObjectContext];
  objc_msgSend(v18, "ic_saveWithLogDescription:", @"saving main context after converting sketch attachment operation completed");

  uint64_t v19 = [*(id *)(a1 + 32) finalAttachmentID];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    char v21 = [*(id *)(a1 + 32) isAutomatic];

    if ((v21 & 1) == 0)
    {
      id v22 = [MEMORY[0x1E4F83428] sharedContext];
      __int16 v23 = [v22 workerManagedObjectContext];

      uint64_t v24 = +[ICIndexHandwritingOperation sharedOperationQueue];
      uint64_t v25 = [ICIndexHandwritingOperation alloc];
      uint64_t v26 = [*(id *)(a1 + 32) finalAttachmentID];
      long long v27 = [(ICIndexHandwritingOperation *)v25 initWithAttachmentObjectID:v26 context:v23];

      [v24 addOperation:v27];
    }
  }
}

- (NSOperationQueue)converterQueue
{
  return self->_converterQueue;
}

- (void)setConverterQueue:(id)a3
{
}

- (NSMapTable)lastOperationForAttachmentID
{
  return self->_lastOperationForAttachmentID;
}

- (void)setLastOperationForAttachmentID:(id)a3
{
}

- (OS_dispatch_queue)convertDispatchQueue
{
  return self->_convertDispatchQueue;
}

- (void)setConvertDispatchQueue:(id)a3
{
}

- (void)setMutableFailedSketches:(id)a3
{
}

- (BOOL)isThrowaway
{
  return self->_isThrowaway;
}

- (void)setIsThrowaway:(BOOL)a3
{
  self->_isThrowaway = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableFailedSketches, 0);
  objc_storeStrong((id *)&self->_convertDispatchQueue, 0);
  objc_storeStrong((id *)&self->_lastOperationForAttachmentID, 0);
  objc_storeStrong((id *)&self->_converterQueue, 0);
}

void __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*a1 completedUnitCount];
  uint64_t v5 = [*a1 totalUnitCount];
  int v6 = 134218240;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Final completed unit count is not equal to total unit count %lld %lld", (uint8_t *)&v6, 0x16u);
}

void __73__ICDrawingPencilKitConverter_convertAllSketchesWithProgress_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Beginning to convert sketches in %lu notes", (uint8_t *)&v2, 0xCu);
}

- (void)convertAllSketchesInNote:(uint64_t)a3 .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "converted %lu sketches in note %@", buf, 0x16u);
}

- (void)convertAllSketchesInNote:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "converting all sketches in note %@", buf, 0xCu);
}

- (void)convertSketchAttachment:(os_log_t)log toInlineDrawingAtRange:inNote:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Unable to create inline drawing attachment when converting", v1, 2u);
}

- (void)convertSketchAttachment:(os_log_t)log toInlineDrawingAtRange:inNote:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Unable to find sketch's preview image to use as the fallback", v1, 2u);
}

void __45__ICDrawingPencilKitConverter_convertSketch___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Error converting drawing %@ %@", (uint8_t *)&v4, 0x16u);
}

- (void)updateInlineDrawingAttachment:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 identifier];
  __int16 v6 = [a2 identifier];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "updateInlineDrawingAttachment: updated %@ to %@", (uint8_t *)&v7, 0x16u);
}

- (void)compareDrawingAttachment:(NSObject *)a3 withConvertedDrawing:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v6 = [a1 version];
  [a1 size];
  int v7 = NSStringFromCGSize(v17);
  int v8 = 134218754;
  __int16 v9 = a1;
  __int16 v10 = 1024;
  int v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Could not find a proper preview image for drawing %p %hd %@ %@", (uint8_t *)&v8, 0x26u);
}

- (void)compareDrawingAttachment:(os_log_t)log withConvertedDrawing:(double)a2 .cold.2(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  double v3 = a2;
  __int16 v4 = 2048;
  uint64_t v5 = 0x4014000000000000;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "convertSketch compareError higher than threshold %f > %f", (uint8_t *)&v2, 0x16u);
}

- (void)convertDrawingsInNoteIfNeeded:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = [a1 identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Checking device state and attempting to automatically update any drawings in note %@", (uint8_t *)&v4, 0xCu);
}

void __61__ICDrawingPencilKitConverter_convertDrawingsInNoteIfNeeded___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Automatically updating any drawings in note after checking device state", v1, 2u);
}

- (void)countOfDrawingsNeedingConversionInNote:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "countOfDrawingsNeedingConversionInNote %@", (uint8_t *)&v2, 0xCu);
}

@end