@interface ICTableAttachmentProvider
+ (NSMapTable)mergeNotificationRegister;
+ (NSMapTable)providerMapping;
+ (id)defaultBackgroundManagedObjectContext;
+ (id)sharedProviderForAttachment:(id)a3;
+ (void)notifyProviderForRefreshToAttachment:(id)a3;
+ (void)saveAttachmentOnMainThread:(id)a3;
- (BOOL)isBeingEditedLocallyOnDevice;
- (BOOL)needsToUpdateTableFromBackgroundAttachment;
- (ICAttachment)attachment;
- (ICAttachment)backgroundAttachment;
- (ICCRTTCompatibleDocument)tableDoc;
- (ICTable)table;
- (ICTableAttachmentProviderDelegate)delegate;
- (NSManagedObjectContext)overriddenBackgroundMOC;
- (id)backgroundManagedObjectContext;
- (void)didRefreshBackgroundTableAttachment:(id)a3;
- (void)notifyDelegateTableAttachmentDidMerge;
- (void)notifyDelegateTableAttachmentWillMerge;
- (void)refreshBackgroundAttachment;
- (void)setAttachment:(id)a3;
- (void)setBackgroundAttachment:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsBeingEditedLocallyOnDevice:(BOOL)a3;
- (void)setNeedsToUpdateTableFromBackgroundAttachment:(BOOL)a3;
- (void)setOverriddenBackgroundMOC:(id)a3;
- (void)setTableFromDocument:(id)a3;
- (void)updateTableFromMOC;
@end

@implementation ICTableAttachmentProvider

+ (NSMapTable)providerMapping
{
  if (providerMapping_onceToken != -1) {
    dispatch_once(&providerMapping_onceToken, &__block_literal_global);
  }
  v2 = (void *)providerMapping_providerMapping;
  return (NSMapTable *)v2;
}

void __44__ICTableAttachmentProvider_providerMapping__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v1 = (void *)providerMapping_providerMapping;
  providerMapping_providerMapping = v0;
}

+ (NSMapTable)mergeNotificationRegister
{
  if (mergeNotificationRegister_onceToken != -1) {
    dispatch_once(&mergeNotificationRegister_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)mergeNotificationRegister_mergeNotificationRegisterMapping;
  return (NSMapTable *)v2;
}

void __54__ICTableAttachmentProvider_mergeNotificationRegister__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  v1 = (void *)mergeNotificationRegister_mergeNotificationRegisterMapping;
  mergeNotificationRegister_mergeNotificationRegisterMapping = v0;
}

+ (id)sharedProviderForAttachment:(id)a3
{
  id v3 = a3;
  v4 = +[ICTableAttachmentProvider providerMapping];
  v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    v5 = objc_alloc_init(ICTableAttachmentProvider);
    [(ICTableAttachmentProvider *)v5 setAttachment:v3];
    v6 = +[ICTableAttachmentProvider providerMapping];
    [v6 setObject:v5 forKey:v3];
  }
  return v5;
}

+ (void)notifyProviderForRefreshToAttachment:(id)a3
{
  id v3 = a3;
  v4 = +[ICTableAttachmentProvider providerMapping];
  v5 = [v4 objectForKey:v3];

  if (v5)
  {
    v6 = [v5 backgroundAttachment];
    v7 = [v6 managedObjectContext];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __66__ICTableAttachmentProvider_notifyProviderForRefreshToAttachment___block_invoke;
    v15 = &unk_1E64A4218;
    id v16 = v6;
    id v17 = v7;
    id v8 = v7;
    id v9 = v6;
    [v8 performBlock:&v12];
  }
  v10 = +[ICTableAttachmentProvider mergeNotificationRegister];
  v11 = [v10 objectForKey:v3];

  if (v11) {
    [v11 didRefreshBackgroundTableAttachment:v3];
  }
}

uint64_t __66__ICTableAttachmentProvider_notifyProviderForRefreshToAttachment___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPasswordProtected]) {
    uint64_t v2 = [*(id *)(a1 + 32) hasChanges];
  }
  else {
    uint64_t v2 = 1;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  return objc_msgSend(v3, "ic_refreshObject:mergeChanges:", v4, v2);
}

+ (void)saveAttachmentOnMainThread:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[ICTableAttachmentProvider providerMapping];
  id v6 = [v4 objectForKey:v3];

  v5 = [v6 delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 tableAttachmentSaveOnMainThread];
  }
}

- (void)setOverriddenBackgroundMOC:(id)a3
{
  objc_storeWeak((id *)&self->_overriddenBackgroundMOC, a3);
  [(ICTableAttachmentProvider *)self refreshBackgroundAttachment];
}

- (id)backgroundManagedObjectContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overriddenBackgroundMOC);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
  }
  else
  {
    id v4 = +[ICTableAttachmentProvider defaultBackgroundManagedObjectContext];
  }
  v5 = v4;

  return v5;
}

+ (id)defaultBackgroundManagedObjectContext
{
  if (defaultBackgroundManagedObjectContext_once != -1) {
    dispatch_once(&defaultBackgroundManagedObjectContext_once, &__block_literal_global_18);
  }
  uint64_t v2 = (void *)defaultBackgroundManagedObjectContext_backgroundContext;
  return v2;
}

void __66__ICTableAttachmentProvider_defaultBackgroundManagedObjectContext__block_invoke()
{
  id v2 = +[ICNoteContext sharedContext];
  uint64_t v0 = [v2 workerManagedObjectContext];
  v1 = (void *)defaultBackgroundManagedObjectContext_backgroundContext;
  defaultBackgroundManagedObjectContext_backgroundContext = v0;
}

- (ICAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);
  return (ICAttachment *)WeakRetained;
}

- (void)setAttachment:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_attachment, v5);
  objc_msgSend(v5, "ic_obtainPermanentObjectIDIfNecessary");
  if ([v5 hasChanges])
  {
    id v4 = [v5 managedObjectContext];
    objc_msgSend(v4, "ic_save");
  }
  [(ICTableAttachmentProvider *)self refreshBackgroundAttachment];
}

- (void)refreshBackgroundAttachment
{
  id v3 = [(ICTableAttachmentProvider *)self backgroundManagedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__ICTableAttachmentProvider_refreshBackgroundAttachment__block_invoke;
  v5[3] = &unk_1E64A4218;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWait:v5];
}

void __56__ICTableAttachmentProvider_refreshBackgroundAttachment__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attachment];
  id v3 = [v2 objectID];
  id v5 = +[ICAttachment ic_existingObjectWithID:v3 context:*(void *)(a1 + 40)];

  id v4 = +[ICTableAttachmentProvider mergeNotificationRegister];
  [v4 setObject:*(void *)(a1 + 32) forKey:v5];

  [*(id *)(a1 + 32) setBackgroundAttachment:v5];
}

- (void)setTableFromDocument:(id)a3
{
  objc_storeStrong((id *)&self->_tableDoc, a3);
  id v7 = a3;
  id v5 = [v7 rootObject];
  table = self->_table;
  self->_table = v5;
}

- (ICTable)table
{
  if (!self->_table)
  {
    id v3 = [(ICTableAttachmentProvider *)self attachment];
    char v4 = [v3 isPasswordProtectedAndLocked];

    if ((v4 & 1) == 0)
    {
      id v5 = [(ICTableAttachmentProvider *)self attachment];
      id v6 = [v5 currentReplicaID];
      id v7 = v6;
      if (v6)
      {
        id v8 = v6;
      }
      else
      {
        id v8 = [MEMORY[0x1E4F29128] UUID];
      }
      id v9 = v8;

      v10 = [(ICTableAttachmentProvider *)self backgroundAttachment];
      v11 = [v10 managedObjectContext];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __34__ICTableAttachmentProvider_table__block_invoke;
      v15[3] = &unk_1E64A4218;
      v15[4] = self;
      id v16 = v9;
      id v12 = v9;
      [v11 performBlockAndWait:v15];
    }
  }
  table = self->_table;
  return table;
}

void __34__ICTableAttachmentProvider_table__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundAttachment];
  id v3 = [v2 attachmentModel];
  char v4 = [v3 table];
  uint64_t v5 = [v4 copyIntoNewDocumentWithReplicaID:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 32) rootObject];
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v8;

  id v11 = [*(id *)(a1 + 32) delegate];
  [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:v11];
}

- (BOOL)isBeingEditedLocallyOnDevice
{
  id v2 = [(ICTableAttachmentProvider *)self attachment];
  char v3 = [v2 isBeingEditedLocallyOnDevice];

  return v3;
}

- (void)setIsBeingEditedLocallyOnDevice:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICTableAttachmentProvider *)self attachment];
  [v4 setIsBeingEditedLocallyOnDevice:v3];
}

- (void)didRefreshBackgroundTableAttachment:(id)a3
{
  id v4 = a3;
  [(ICTableAttachmentProvider *)self setNeedsToUpdateTableFromBackgroundAttachment:1];
  [(ICTableAttachmentProvider *)self updateTableFromMOC];
  id v5 = [(ICTableAttachmentProvider *)self backgroundAttachment];

  if (v5 != v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F836F8];
    [v6 handleFailedAssertWithCondition:"attachment == self.backgroundAttachment" functionName:"-[ICTableAttachmentProvider didRefreshBackgroundTableAttachment:]" simulateCrash:1 showAlert:0 format:@"didRefreshBackgroundTableAttachment: sent to wrong table attachment provider."];
  }
}

- (void)updateTableFromMOC
{
  if ([(ICTableAttachmentProvider *)self needsToUpdateTableFromBackgroundAttachment])
  {
    void v5[5] = MEMORY[0x1E4F143A8];
    v5[6] = 3221225472;
    v5[7] = __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke;
    v5[8] = &unk_1E64A4240;
    v5[9] = self;
    performBlockOnMainThread();
    BOOL v3 = [(ICTableAttachmentProvider *)self backgroundAttachment];
    id v4 = [v3 managedObjectContext];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke_2;
    v5[3] = &unk_1E64A4240;
    v5[4] = self;
    [v4 performBlock:v5];
  }
}

uint64_t __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateTableAttachmentWillMerge];
}

void __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundAttachment];
  char v3 = [v2 isPasswordProtectedAndLocked];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) backgroundAttachment];
    id v5 = [v4 attachmentModel];
    uint64_t v6 = [v5 table];
    id v7 = [v6 document];
    uint64_t v8 = [v7 archivedData];

    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = *(void *)(a1 + 32);
    id v9 = v8;
    performBlockOnMainThread();
    objc_msgSend(*(id *)(a1 + 32), "setNeedsToUpdateTableFromBackgroundAttachment:", 0, v10, 3221225472, __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke_3, &unk_1E64A4218, v11);
  }
}

uint64_t __47__ICTableAttachmentProvider_updateTableFromMOC__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableDoc];
  [v2 mergeWithData:*(void *)(a1 + 40)];

  char v3 = *(void **)(a1 + 32);
  return [v3 notifyDelegateTableAttachmentDidMerge];
}

- (void)notifyDelegateTableAttachmentWillMerge
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICTableAttachmentProviderWillMergeTable" object:self];
}

- (void)notifyDelegateTableAttachmentDidMerge
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICTableAttachmentProviderDidMergeTable" object:self];
}

- (ICCRTTCompatibleDocument)tableDoc
{
  return self->_tableDoc;
}

- (ICTableAttachmentProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICTableAttachmentProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICAttachment)backgroundAttachment
{
  return self->_backgroundAttachment;
}

- (void)setBackgroundAttachment:(id)a3
{
}

- (BOOL)needsToUpdateTableFromBackgroundAttachment
{
  return self->_needsToUpdateTableFromBackgroundAttachment;
}

- (void)setNeedsToUpdateTableFromBackgroundAttachment:(BOOL)a3
{
  self->_needsToUpdateTableFromBackgroundAttachment = a3;
}

- (NSManagedObjectContext)overriddenBackgroundMOC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overriddenBackgroundMOC);
  return (NSManagedObjectContext *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overriddenBackgroundMOC);
  objc_storeStrong((id *)&self->_backgroundAttachment, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableDoc, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_destroyWeak((id *)&self->_attachment);
}

@end