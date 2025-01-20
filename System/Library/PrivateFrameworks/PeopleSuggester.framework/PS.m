@interface PS
@end

@implementation PS

uint64_t __59___PS_TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __59___PS_TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke_2(void *a1, int a2, void *a3)
{
  id v11 = a3;
  if (a2)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    [v5 setObject:a1[4] forKeyedSubscript:@"signalIdentifier"];
    [v5 setObject:a1[5] forKeyedSubscript:@"sourceBundleIdentifier"];
    [v5 setObject:a1[6] forKeyedSubscript:@"context"];
    v6 = [MEMORY[0x1E4F5B6E0] keyPathWithKey:@"/discoverability/signals/dataDictionary"];
    v7 = [MEMORY[0x1E4F5B6A8] userContext];
    [v7 setObject:v5 forKeyedSubscript:v6];
  }
  uint64_t v8 = a1[7];
  if (v8)
  {
    id v9 = v11;
    if (a2) {
      id v9 = 0;
    }
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __47___PS_TPSDiscoverabilitySignal__knowledgeStore__block_invoke()
{
  _knowledgeStore_store = [MEMORY[0x1E4F5B560] knowledgeStore];

  return MEMORY[0x1F41817F8]();
}

@end