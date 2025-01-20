@interface SRUIFConversationStore
- (NSMutableDictionary)_conversationsByIdentifier;
- (OS_dispatch_queue)queue;
- (SRUIFConversationStore)init;
- (void)_registerConversation:(id)a3 withIdentifier:(id)a4;
- (void)fetchConversationWithIdentifier:(id)a3 completionBlock:(id)a4;
- (void)removeConversationWithIdentifier:(id)a3 completionBlock:(id)a4;
- (void)saveConversation:(id)a3 withIdentifier:(id)a4 completionBlock:(id)a5;
- (void)setQueue:(id)a3;
@end

@implementation SRUIFConversationStore

- (SRUIFConversationStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)SRUIFConversationStore;
  v2 = [(SRUIFConversationStore *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    conversationsByIdentifier = v2->_conversationsByIdentifier;
    v2->_conversationsByIdentifier = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("SRUIFConversationStore", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)_registerConversation:(id)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SRUIFConversationStore *)self _conversationsByIdentifier];
  [v8 setObject:v7 forKey:v6];
}

- (void)saveConversation:(id)a3 withIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__SRUIFConversationStore_saveConversation_withIdentifier_completionBlock___block_invoke;
  v15[3] = &unk_2647865F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __74__SRUIFConversationStore_saveConversation_withIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _registerConversation:*(void *)(a1 + 40) withIdentifier:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 40) propertyListRepresentation];
  id v15 = 0;
  uint64_t v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:v2 format:200 options:0 error:&v15];
  id v4 = v15;
  if (v3)
  {
    dispatch_queue_t v5 = SRUIFFileURLForConversationWithIdentifier(*(void **)(a1 + 48));
    id v14 = v4;
    uint64_t v6 = [v3 writeToURL:v5 options:805306369 error:&v14];
    id v7 = v14;

    if (v6)
    {
      uint64_t v8 = *MEMORY[0x263EFF6B0];
      id v13 = v7;
      char v9 = [v5 setResourceValue:MEMORY[0x263EFFA88] forKey:v8 error:&v13];
      id v4 = v13;

      if (v9)
      {
        uint64_t v6 = 1;
      }
      else
      {
        id v10 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
          __74__SRUIFConversationStore_saveConversation_withIdentifier_completionBlock___block_invoke_cold_1((uint64_t)v5, v10);
        }
        v11 = [MEMORY[0x263F08850] defaultManager];
        [v11 removeItemAtURL:v5 error:0];

        uint64_t v6 = 0;
      }
    }
    else
    {
      id v4 = v7;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v6, v4);
  }
}

- (void)fetchConversationWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__SRUIFConversationStore_fetchConversationWithIdentifier_completionBlock___block_invoke;
  block[3] = &unk_264786108;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __74__SRUIFConversationStore_fetchConversationWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _conversationsByIdentifier];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    dispatch_queue_t v5 = SRUIFFileURLForConversationWithIdentifier(*(void **)(a1 + 40));
    id v16 = 0;
    id v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v5 options:1 error:&v16];
    id v4 = v16;
    if (v6)
    {
      [*(id *)(a1 + 32) removeConversationWithIdentifier:*(void *)(a1 + 40) completionBlock:0];
      id v15 = 0;
      id v7 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v15];
      id v8 = v15;

      if (v7)
      {
        id v9 = [[SRUIFConversation alloc] initWithPropertyListRepresentation:v7];
        uint64_t v3 = v9;
        if (v9)
        {
          id v10 = [(SRUIFConversation *)v9 lastItem];
          [v3 _setLastRestoredItem:v10];

          [*(id *)(a1 + 32) saveConversation:v3 withIdentifier:*(void *)(a1 + 40) completionBlock:0];
          [*(id *)(a1 + 32) _registerConversation:v3 withIdentifier:*(void *)(a1 + 40)];
        }
        else
        {
          uint64_t v11 = +[SRUIFConversationError errorWithCode:100 localizedFailureReason:@"Unable to decode conversation from property list"];

          id v8 = (id)v11;
        }
      }
      else
      {
        uint64_t v3 = 0;
      }

      id v4 = v8;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  int found = AFIsFileNotFoundError();
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    if (found) {
      id v14 = 0;
    }
    else {
      id v14 = v4;
    }
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v3, v14);
  }
}

- (void)removeConversationWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SRUIFConversationStore_removeConversationWithIdentifier_completionBlock___block_invoke;
  block[3] = &unk_264786108;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __75__SRUIFConversationStore_removeConversationWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _conversationsByIdentifier];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = SRUIFFileURLForConversationWithIdentifier(*(void **)(a1 + 40));
  id v4 = objc_alloc_init(MEMORY[0x263F08850]);
  id v8 = 0;
  uint64_t v5 = [v4 removeItemAtURL:v3 error:&v8];
  id v6 = v8;

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);
  }
}

- (NSMutableDictionary)_conversationsByIdentifier
{
  return self->_conversationsByIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_conversationsByIdentifier, 0);
}

void __74__SRUIFConversationStore_saveConversation_withIdentifier_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SRUIFConversationStore saveConversation:withIdentifier:completionBlock:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225FBA000, a2, OS_LOG_TYPE_ERROR, "%s Unable to exclude %@ from backup; deleting.",
    (uint8_t *)&v2,
    0x16u);
}

@end