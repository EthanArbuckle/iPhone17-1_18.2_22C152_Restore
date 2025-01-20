@interface TUConversationMediaController
- (NSHashTable)delegates;
- (TUConversationManagerDataSource)dataSource;
- (TUConversationMediaController)initWithConversationDataSource:(id)a3;
- (TUConversationMediaControllerDelegate)delegate;
- (void)addDelegate:(id)a3;
- (void)mediaPrioritiesChangeForConversation:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegates:(id)a3;
- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4;
@end

@implementation TUConversationMediaController

- (TUConversationMediaController)initWithConversationDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUConversationMediaController;
  v6 = [(TUConversationMediaController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    [(TUConversationManagerDataSource *)v7->_dataSource setMediaDelegate:v7];
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v8;
  }
  return v7;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(TUConversationMediaController *)self delegates];
  [v5 addObject:v4];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(TUConversationMediaController *)self delegates];
  [v5 removeObject:v4];
}

- (TUConversationMediaControllerDelegate)delegate
{
  v2 = [(TUConversationMediaController *)self delegates];
  v3 = [v2 anyObject];

  return (TUConversationMediaControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationMediaController *)self delegates];
  [v5 removeAllObjects];

  id v6 = [(TUConversationMediaController *)self delegates];
  [v6 addObject:v4];
}

- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Updating participants presentation contexts: %@ for conversation UUID: %@", (uint8_t *)&v10, 0x16u);
  }

  v9 = [(TUConversationMediaController *)self dataSource];
  [v9 updateConversationWithUUID:v6 participantPresentationContexts:v7];
}

- (void)mediaPrioritiesChangeForConversation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__TUConversationMediaController_mediaPrioritiesChangeForConversation___block_invoke;
  v6[3] = &unk_1E58E5C08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __70__TUConversationMediaController_mediaPrioritiesChangeForConversation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 mediaController:*(void *)(a1 + 32) participantMediaPrioritiesChangedForConversation:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (TUConversationManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end