@interface ICBundleChangeFilePresenter
- (ICBundleChangeFilePresenter)initWithObjectID:(id)a3 url:(id)a4 managedObjectContext:(id)a5;
- (ICSelectorDelayer)applyChangesSelectorDelayer;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectID)objectID;
- (NSOperationQueue)operationQueue;
- (NSURL)url;
- (id)presentedItemDidApplyChanges;
- (void)applyChanges;
- (void)presentedItemDidChange;
- (void)setApplyChangesSelectorDelayer:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPresentedItemDidApplyChanges:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation ICBundleChangeFilePresenter

- (ICBundleChangeFilePresenter)initWithObjectID:(id)a3 url:(id)a4 managedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ICBundleChangeFilePresenter;
  v11 = [(ICBundleChangeFilePresenter *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    objectID = v11->_objectID;
    v11->_objectID = (NSManagedObjectID *)v12;

    uint64_t v14 = [v9 copy];
    url = v11->_url;
    v11->_url = (NSURL *)v14;

    objc_storeStrong((id *)&v11->_managedObjectContext, a5);
    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v11->_operationQueue;
    v11->_operationQueue = v16;

    [(NSOperationQueue *)v11->_operationQueue setName:@"com.apple.notes.bundle-change-file-presenter"];
    [(NSOperationQueue *)v11->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v11->_operationQueue setQualityOfService:17];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:v11 selector:sel_applyChanges delay:1 waitToFireUntilRequestsStop:0 callOnMainThread:2.0];
    applyChangesSelectorDelayer = v11->_applyChangesSelectorDelayer;
    v11->_applyChangesSelectorDelayer = (ICSelectorDelayer *)v18;
  }
  return v11;
}

- (void)presentedItemDidChange
{
  id v2 = [(ICBundleChangeFilePresenter *)self applyChangesSelectorDelayer];
  [v2 requestFire];
}

- (void)applyChanges
{
  v3 = [(ICBundleChangeFilePresenter *)self managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__ICBundleChangeFilePresenter_applyChanges__block_invoke;
  v4[3] = &unk_1E64A4240;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __43__ICBundleChangeFilePresenter_applyChanges__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3 = [*(id *)(a1 + 32) objectID];
  v4 = objc_msgSend(v2, "ic_existingObjectWithID:", v3);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v5 = ICDynamicCast();
    if ([v5 attachmentType] == 13) {
      [v5 setPreviewUpdateDate:0];
    }
  }
  [v4 updateChangeCountWithReason:@"Applied changes from bundle"];
  v6 = [*(id *)(a1 + 32) managedObjectContext];
  objc_msgSend(v6, "ic_save");

  performBlockOnMainThread();
}

void __43__ICBundleChangeFilePresenter_applyChanges__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentedItemDidApplyChanges];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) presentedItemDidApplyChanges];
    v3[2](v3, 1);
  }
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (id)presentedItemDidApplyChanges
{
  return self->_presentedItemDidApplyChanges;
}

- (void)setPresentedItemDidApplyChanges:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (ICSelectorDelayer)applyChangesSelectorDelayer
{
  return self->_applyChangesSelectorDelayer;
}

- (void)setApplyChangesSelectorDelayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyChangesSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_presentedItemDidApplyChanges, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end