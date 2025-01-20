@interface SBSDisplayIdentifiersCache
@end

@implementation SBSDisplayIdentifiersCache

uint64_t __45___SBSDisplayIdentifiersCache_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

void __35___SBSDisplayIdentifiersCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _queue_noteChanged];
}

void __49___SBSDisplayIdentifiersCache_displayIdentifiers__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v11 = 0;
    unsigned int v10 = 0;
    uint64_t v3 = SBSSpringBoardBackgroundServerPort();
    SBGetDisplayIdentifiers(v3, &v11, &v10);
    if (v10)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v5 = (void *)[v4 initWithBytesNoCopy:v11 length:v10 freeWhenDone:0];
      v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
    }
    else
    {
      v6 = 0;
    }
    if (v11) {
      MEMORY[0x192FC0FE0](*MEMORY[0x1E4F14960], v11, v10);
    }
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

uint64_t __52___SBSDisplayIdentifiersCache_registerChangedBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x1F41817F8]();
}

uint64_t __49___SBSDisplayIdentifiersCache__queue_noteChanged__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end