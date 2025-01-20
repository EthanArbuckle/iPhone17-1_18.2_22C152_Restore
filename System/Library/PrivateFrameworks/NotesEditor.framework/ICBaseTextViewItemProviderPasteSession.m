@interface ICBaseTextViewItemProviderPasteSession
- (BOOL)isForDragAndDrop;
- (BOOL)isTypeURL;
- (BOOL)shouldFilterAttributedString;
- (BOOL)supportsAttachments;
- (ICBaseTextViewItemProviderPasteSession)initWithNoteObjectID:(id)a3;
- (ICNote)workerNote;
- (NSManagedObjectContext)workerContext;
- (NSManagedObjectID)noteObjectID;
- (NSMutableSet)mutableErrorCodes;
- (NSSet)errorCodes;
- (unint64_t)numberOfAttachmentImagesPreloaded;
- (unint64_t)numberOfAttachmentsAttemptedAdded;
- (unint64_t)numberOfTrailingNewlinesStripped;
- (void)addErrorWithCode:(int64_t)a3;
- (void)incrementNumberOfAttachmentsAttemptedAdded;
- (void)performBlockAndWait:(id)a3;
- (void)saveWorkerContext;
- (void)setIsForDragAndDrop:(BOOL)a3;
- (void)setIsTypeURL:(BOOL)a3;
- (void)setMutableErrorCodes:(id)a3;
- (void)setNoteObjectID:(id)a3;
- (void)setNumberOfAttachmentImagesPreloaded:(unint64_t)a3;
- (void)setNumberOfAttachmentsAttemptedAdded:(unint64_t)a3;
- (void)setNumberOfTrailingNewlinesStripped:(unint64_t)a3;
- (void)setShouldFilterAttributedString:(BOOL)a3;
- (void)setSupportsAttachments:(BOOL)a3;
- (void)setWorkerContext:(id)a3;
@end

@implementation ICBaseTextViewItemProviderPasteSession

- (ICBaseTextViewItemProviderPasteSession)initWithNoteObjectID:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICBaseTextViewItemProviderPasteSession;
  v6 = [(ICBaseTextViewItemProviderPasteSession *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_noteObjectID, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    mutableErrorCodes = v7->_mutableErrorCodes;
    v7->_mutableErrorCodes = (NSMutableSet *)v8;

    v10 = [MEMORY[0x263F5ACA0] sharedContext];
    uint64_t v11 = [v10 snapshotManagedObjectContext];
    workerContext = v7->_workerContext;
    v7->_workerContext = (NSManagedObjectContext *)v11;
  }
  return v7;
}

- (ICNote)workerNote
{
  v3 = (void *)MEMORY[0x263F5AC98];
  v4 = [(ICBaseTextViewItemProviderPasteSession *)self noteObjectID];
  id v5 = [(ICBaseTextViewItemProviderPasteSession *)self workerContext];
  v6 = objc_msgSend(v3, "ic_existingObjectWithID:context:", v4, v5);

  return (ICNote *)v6;
}

- (void)addErrorWithCode:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  v4 = [(ICBaseTextViewItemProviderPasteSession *)obj mutableErrorCodes];
  id v5 = [NSNumber numberWithInteger:a3];
  [v4 addObject:v5];

  objc_sync_exit(obj);
}

- (void)incrementNumberOfAttachmentsAttemptedAdded
{
  obj = self;
  objc_sync_enter(obj);
  [(ICBaseTextViewItemProviderPasteSession *)obj setNumberOfAttachmentsAttemptedAdded:[(ICBaseTextViewItemProviderPasteSession *)obj numberOfAttachmentsAttemptedAdded]+ 1];
  objc_sync_exit(obj);
}

- (unint64_t)numberOfAttachmentsAttemptedAdded
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t numberOfAttachmentsAttemptedAdded = v2->_numberOfAttachmentsAttemptedAdded;
  objc_sync_exit(v2);

  return numberOfAttachmentsAttemptedAdded;
}

- (NSSet)errorCodes
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(ICBaseTextViewItemProviderPasteSession *)v2 mutableErrorCodes];
  v4 = (void *)[v3 copy];

  objc_sync_exit(v2);

  return (NSSet *)v4;
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBaseTextViewItemProviderPasteSession *)self workerContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__ICBaseTextViewItemProviderPasteSession_performBlockAndWait___block_invoke;
  v7[3] = &unk_2640BB098;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __62__ICBaseTextViewItemProviderPasteSession_performBlockAndWait___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) workerNote];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)saveWorkerContext
{
  v3 = [(ICBaseTextViewItemProviderPasteSession *)self workerContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__ICBaseTextViewItemProviderPasteSession_saveWorkerContext__block_invoke;
  v4[3] = &unk_2640B8140;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

void __59__ICBaseTextViewItemProviderPasteSession_saveWorkerContext__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F5AA58];
  id v4 = [*(id *)(a1 + 32) noteObjectID];
  [v2 postNotificationName:v3 object:v4];

  id v5 = [*(id *)(a1 + 32) workerContext];
  objc_msgSend(v5, "ic_save");

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F5AA50];
  v7 = [*(id *)(a1 + 32) noteObjectID];
  [v8 postNotificationName:v6 object:v7];
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
}

- (BOOL)isForDragAndDrop
{
  return self->_isForDragAndDrop;
}

- (void)setIsForDragAndDrop:(BOOL)a3
{
  self->_isForDragAndDrop = a3;
}

- (BOOL)shouldFilterAttributedString
{
  return self->_shouldFilterAttributedString;
}

- (void)setShouldFilterAttributedString:(BOOL)a3
{
  self->_shouldFilterAttributedString = a3;
}

- (BOOL)supportsAttachments
{
  return self->_supportsAttachments;
}

- (void)setSupportsAttachments:(BOOL)a3
{
  self->_supportsAttachments = a3;
}

- (void)setNumberOfAttachmentsAttemptedAdded:(unint64_t)a3
{
  self->_unint64_t numberOfAttachmentsAttemptedAdded = a3;
}

- (unint64_t)numberOfAttachmentImagesPreloaded
{
  return self->_numberOfAttachmentImagesPreloaded;
}

- (void)setNumberOfAttachmentImagesPreloaded:(unint64_t)a3
{
  self->_numberOfAttachmentImagesPreloaded = a3;
}

- (unint64_t)numberOfTrailingNewlinesStripped
{
  return self->_numberOfTrailingNewlinesStripped;
}

- (void)setNumberOfTrailingNewlinesStripped:(unint64_t)a3
{
  self->_numberOfTrailingNewlinesStripped = a3;
}

- (BOOL)isTypeURL
{
  return self->_isTypeURL;
}

- (void)setIsTypeURL:(BOOL)a3
{
  self->_isTypeURL = a3;
}

- (NSManagedObjectID)noteObjectID
{
  return self->_noteObjectID;
}

- (void)setNoteObjectID:(id)a3
{
}

- (NSMutableSet)mutableErrorCodes
{
  return self->_mutableErrorCodes;
}

- (void)setMutableErrorCodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableErrorCodes, 0);
  objc_storeStrong((id *)&self->_noteObjectID, 0);

  objc_storeStrong((id *)&self->_workerContext, 0);
}

@end