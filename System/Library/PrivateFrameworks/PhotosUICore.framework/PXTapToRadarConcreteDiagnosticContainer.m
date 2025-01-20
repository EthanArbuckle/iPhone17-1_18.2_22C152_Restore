@interface PXTapToRadarConcreteDiagnosticContainer
- (NSArray)attachments;
- (NSArray)subproviders;
- (NSDictionary)dictionary;
- (NSString)name;
- (PXTapToRadarConcreteDiagnosticContainer)init;
- (PXTapToRadarConcreteDiagnosticContainer)initWithName:(id)a3;
- (id)beginCollectionOperationWithName:(id)a3 timeout:(double)a4;
- (id)objectForKeyedSubscript:(id)a3;
- (void)addAttachment:(id)a3;
- (void)addAttachmentWithData:(id)a3 name:(id)a4;
- (void)addAttachmentWithDictionary:(id)a3 name:(id)a4;
- (void)addAttachmentWithObjectiveCCode:(id)a3 name:(id)a4;
- (void)addAttachmentWithSwiftCode:(id)a3 name:(id)a4;
- (void)addAttachmentWithText:(id)a3 name:(id)a4;
- (void)addAttachmentWithText:(id)a3 name:(id)a4 extension:(id)a5;
- (void)addSubprovider:(id)a3;
- (void)addSubproviders:(id)a3;
- (void)finalizeWithCompletionHandler:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation PXTapToRadarConcreteDiagnosticContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_collectionOperations, 0);
  objc_storeStrong((id *)&self->_subproviders, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = v3;
  id v5 = v6;
  PXIterateAsynchronously();
}

void __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  objc_sync_exit(v3);

  id v5 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        dispatch_group_enter(v5);
        v10 = [v9 name];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_2;
        v17[3] = &unk_1E5DD1CD8;
        id v18 = *(id *)(a1 + 40);
        id v19 = v10;
        v20 = v5;
        id v11 = v10;
        [v9 installCompletionHandler:v17];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5DD32A8;
  block[4] = *(void *)(a1 + 32);
  id v16 = v13;
  id v12 = v13;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
}

void __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    if ([*(id *)(a1 + 32) count] == 1)
    {
      v2 = [*(id *)(a1 + 32) firstObject];
    }
    else
    {
      id v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v4 = *(void *)off_1E5DAAF28;
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v7 = *MEMORY[0x1E4F28750];
      v8[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      v2 = [v3 errorWithDomain:v4 code:-1 userInfo:v6];
    }
  }
  else
  {
    v2 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v7 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"unknown error for %@", *(void *)(a1 + 40));
      [v5 addObject:v6];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __73__PXTapToRadarConcreteDiagnosticContainer_finalizeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  objc_sync_exit(v2);

  uint64_t v4 = *(void **)(a1 + 40);
  if (v3)
  {
    return [v4 next];
  }
  else
  {
    return [v4 stop];
  }
}

- (id)beginCollectionOperationWithName:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  id v7 = [[_PXTapToRadarDiagnosticCollectionOperation alloc] initWithName:v6 timeout:a4];
  uint64_t v8 = self;
  objc_sync_enter(v8);
  [(NSMutableArray *)v8->_collectionOperations addObject:v7];
  objc_sync_exit(v8);

  return v7;
}

- (void)addSubproviders:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    [(NSMutableArray *)v5->_subproviders addObjectsFromArray:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)addSubprovider:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    [(NSMutableArray *)v5->_subproviders addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)addAttachmentWithData:(id)a3 name:(id)a4
{
  uint64_t v5 = PXFeedbackTapToRadarUtilitiesWriteDataToFile(a3, a4);
  if (v5)
  {
    id v6 = v5;
    [(PXTapToRadarConcreteDiagnosticContainer *)self addAttachment:v5];
    uint64_t v5 = v6;
  }
}

- (void)addAttachmentWithSwiftCode:(id)a3 name:(id)a4
{
}

- (void)addAttachmentWithObjectiveCCode:(id)a3 name:(id)a4
{
}

- (void)addAttachmentWithText:(id)a3 name:(id)a4 extension:(id)a5
{
  id v6 = PXFeedbackTapToRadarUtilitiesWriteStringToFileWithExtension(a3, a4, a5);
  if (v6)
  {
    id v7 = v6;
    [(PXTapToRadarConcreteDiagnosticContainer *)self addAttachment:v6];
    id v6 = v7;
  }
}

- (void)addAttachmentWithText:(id)a3 name:(id)a4
{
}

- (void)addAttachmentWithDictionary:(id)a3 name:(id)a4
{
  uint64_t v5 = PXFeedbackTapToRadarUtilitiesWriteDictionaryToPlistFile(a3, a4);
  if (v5)
  {
    id v6 = v5;
    [(PXTapToRadarConcreteDiagnosticContainer *)self addAttachment:v5];
    uint64_t v5 = v6;
  }
}

- (void)addAttachment:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    [(NSMutableArray *)v5->_attachments addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    [(NSMutableDictionary *)v7->_dictionary setObject:v8 forKeyedSubscript:v6];
    objc_sync_exit(v7);
  }
}

- (NSArray)subproviders
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableArray *)v2->_subproviders copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)attachments
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableArray *)v2->_attachments copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_dictionary objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (NSDictionary)dictionary
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableDictionary *)v2->_dictionary copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (PXTapToRadarConcreteDiagnosticContainer)initWithName:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXTapToRadarConcreteDiagnosticContainer;
  uint64_t v5 = [(PXTapToRadarConcreteDiagnosticContainer *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionary = v5->_dictionary;
    v5->_dictionary = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    attachments = v5->_attachments;
    v5->_attachments = v10;

    id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subproviders = v5->_subproviders;
    v5->_subproviders = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    collectionOperations = v5->_collectionOperations;
    v5->_collectionOperations = v14;
  }
  return v5;
}

- (PXTapToRadarConcreteDiagnosticContainer)init
{
  return [(PXTapToRadarConcreteDiagnosticContainer *)self initWithName:@"Untitled"];
}

@end