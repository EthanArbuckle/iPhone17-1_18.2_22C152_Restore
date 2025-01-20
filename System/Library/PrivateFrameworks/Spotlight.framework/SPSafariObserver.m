@interface SPSafariObserver
- (SPSafariObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SPSafariObserver

- (SPSafariObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)SPSafariObserver;
  v2 = [(SPSafariObserver *)&v5 init];
  if (v2)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v3 = [MEMORY[0x263F169B0] sharedInstance];
      [v3 reloadSearchEngines];
    }
    else
    {
      dispatch_sync(MEMORY[0x263EF83A0], &__block_literal_global_7);
    }
  }
  return v2;
}

void __24__SPSafariObserver_init__block_invoke()
{
  id v0 = [MEMORY[0x263F169B0] sharedInstance];
  [v0 reloadSearchEngines];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6 = *MEMORY[0x263F081C8];
  id v7 = a5;
  uint64_t v9 = [v7 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

  if (v9 | v8 && ([(id)v9 isEqual:v8] & 1) == 0) {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_3);
  }
}

void __67__SPSafariObserver_observeValueForKeyPath_ofObject_change_context___block_invoke()
{
  id v0 = [MEMORY[0x263F169B0] sharedInstance];
  [v0 reloadSearchEngines];
}

@end