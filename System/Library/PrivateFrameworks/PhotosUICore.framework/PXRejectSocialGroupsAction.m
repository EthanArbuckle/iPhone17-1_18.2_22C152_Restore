@interface PXRejectSocialGroupsAction
- (PXRejectSocialGroupsAction)initWithSocialGroups:(id)a3;
- (id)actionIdentifier;
- (id)collections;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXRejectSocialGroupsAction

- (void).cxx_destruct
{
}

- (id)collections
{
  return self->_collections;
}

- (void)performUndo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PXRejectSocialGroupsAction_performUndo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __42__PXRejectSocialGroupsAction_performUndo___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = [MEMORY[0x1E4F39308] changeRequestForSocialGroup:*(void *)(*((void *)&v7 + 1) + 8 * v5) userAction:1];
        [v6 unrejectSocialGroup];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)performAction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PXRejectSocialGroupsAction_performAction___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __44__PXRejectSocialGroupsAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = [MEMORY[0x1E4F39308] changeRequestForSocialGroup:*(void *)(*((void *)&v7 + 1) + 8 * v5) userAction:1];
        [v6 rejectSocialGroup];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (id)actionIdentifier
{
  return @"RejectSocialGroups";
}

- (PXRejectSocialGroupsAction)initWithSocialGroups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 firstObject];
  v6 = v5;
  if (v5)
  {
    long long v7 = [v5 photoLibrary];
    v13.receiver = self;
    v13.super_class = (Class)PXRejectSocialGroupsAction;
    long long v8 = [(PXPhotosAction *)&v13 initWithPhotoLibrary:v7];

    if (v8)
    {
      uint64_t v9 = [v4 copy];
      collections = v8->_collections;
      v8->_collections = (PXFastEnumeration *)v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end