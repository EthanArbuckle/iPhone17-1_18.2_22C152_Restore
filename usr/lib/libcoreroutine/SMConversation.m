@interface SMConversation
@end

@implementation SMConversation

void __70__SMConversation_RTCoreDataTransformable__createWithSMConversationMO___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v3 = [*(id *)(a1 + 32) receiverHandles];
  v4 = [v2 initWithCapacity:[v3 count]];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [*(id *)(a1 + 32) receiverHandles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [MEMORY[0x1E4F99888] createWithManagedObject:*(void *)(*((void *)&v18 + 1) + 8 * v9)];
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc(MEMORY[0x1E4F99838]);
  v12 = (void *)[v4 copy];
  v13 = [*(id *)(a1 + 32) identifier];
  v14 = [*(id *)(a1 + 32) displayName];
  uint64_t v15 = [v11 initWithReceiverHandles:v12 identifier:v13 displayName:v14];
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

@end