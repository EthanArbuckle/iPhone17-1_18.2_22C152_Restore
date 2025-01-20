@interface SearchUISafariObserver
- (SearchUISafariObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadSearchEngines;
@end

@implementation SearchUISafariObserver

- (SearchUISafariObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUISafariObserver;
  v2 = [(SearchUISafariObserver *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SearchUISafariObserver *)v2 reloadSearchEngines];
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7 = *MEMORY[0x1E4F284E0];
  id v8 = a5;
  uint64_t v10 = [v8 objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

  if (v10 | v9 && ([(id)v10 isEqual:v9] & 1) == 0) {
    [(SearchUISafariObserver *)self reloadSearchEngines];
  }
}

- (void)reloadSearchEngines
{
}

void __45__SearchUISafariObserver_reloadSearchEngines__block_invoke()
{
  id v0 = [MEMORY[0x1E4F3B060] sharedInstance];
  [v0 reloadSearchEngines];
}

@end