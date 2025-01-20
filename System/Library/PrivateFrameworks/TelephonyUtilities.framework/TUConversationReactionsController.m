@interface TUConversationReactionsController
- (NSHashTable)delegates;
- (TUConversationManagerDataSource)dataSource;
- (TUConversationReactionsController)initWithConversationDataSource:(id)a3;
- (void)addDelegate:(id)a3;
- (void)conversation:(id)a3 participant:(id)a4 didReact:(id)a5;
- (void)conversation:(id)a3 participantDidStopReacting:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setDelegates:(id)a3;
@end

@implementation TUConversationReactionsController

- (TUConversationReactionsController)initWithConversationDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUConversationReactionsController;
  v6 = [(TUConversationReactionsController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    [(TUConversationManagerDataSource *)v7->_dataSource setReactionsDelegate:v7];
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
  id v5 = [(TUConversationReactionsController *)self delegates];
  [v5 addObject:v4];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(TUConversationReactionsController *)self delegates];
  [v5 removeObject:v4];
}

- (void)conversation:(id)a3 participant:(id)a4 didReact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__TUConversationReactionsController_conversation_participant_didReact___block_invoke;
  v14[3] = &unk_1E58E63D8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __71__TUConversationReactionsController_conversation_participant_didReact___block_invoke(uint64_t a1)
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
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 reactionsController:*(void *)(a1 + 32) conversation:*(void *)(a1 + 40) participant:*(void *)(a1 + 48) didReact:*(void *)(a1 + 56)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)conversation:(id)a3 participantDidStopReacting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__TUConversationReactionsController_conversation_participantDidStopReacting___block_invoke;
  block[3] = &unk_1E58E6258;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__TUConversationReactionsController_conversation_participantDidStopReacting___block_invoke(uint64_t a1)
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
          [v7 reactionsController:*(void *)(a1 + 32) conversation:*(void *)(a1 + 40) participantDidStopReacting:*(void *)(a1 + 48)];
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