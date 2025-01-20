@interface SearchUIWatchListState
- (BOOL)isWatchListed;
- (NSString)watchListIdentifier;
- (SearchUIWatchListState)initWithContainerResponse:(id)a3;
- (SearchUIWatchListState)initWithIdentifier:(id)a3 watchListed:(BOOL)a4;
- (SearchUIWatchListState)initWithResponse:(id)a3;
- (void)setIsWatchListed:(BOOL)a3;
- (void)setWatchListIdentifier:(id)a3;
- (void)toggleStateWithCompletion:(id)a3;
@end

@implementation SearchUIWatchListState

- (SearchUIWatchListState)initWithIdentifier:(id)a3 watchListed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIWatchListState;
  v7 = [(SearchUIWatchListState *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(SearchUIWatchListState *)v7 setWatchListIdentifier:v6];
    [(SearchUIWatchListState *)v8 setIsWatchListed:v4];
  }

  return v8;
}

- (SearchUIWatchListState)initWithResponse:(id)a3
{
  id v4 = a3;
  v5 = [SearchUIWatchListState alloc];
  id v6 = [v4 canonicalID];
  uint64_t v7 = [v4 isWatchListed];

  v8 = [(SearchUIWatchListState *)v5 initWithIdentifier:v6 watchListed:v7];
  return v8;
}

- (SearchUIWatchListState)initWithContainerResponse:(id)a3
{
  id v4 = a3;
  v5 = [SearchUIWatchListState alloc];
  id v6 = [v4 canonicalID];
  uint64_t v7 = [v4 isWatchListed];

  v8 = [(SearchUIWatchListState *)v5 initWithIdentifier:v6 watchListed:v7];
  return v8;
}

- (void)toggleStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SearchUIWatchListState *)self isWatchListed] ^ 1;
  id v6 = [(SearchUIWatchListState *)self watchListIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SearchUIWatchListState_toggleStateWithCompletion___block_invoke;
  v8[3] = &unk_1E6E73298;
  char v10 = v5;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[SearchUIWatchListUtilities updateStatusIsInWatchList:v5 watchListItemWithIdentifier:v6 completion:v8];
}

void __52__SearchUIWatchListState_toggleStateWithCompletion___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SearchUIWatchListState_toggleStateWithCompletion___block_invoke_2;
  v3[3] = &unk_1E6E73270;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 48);
  char v6 = a2;
  id v4 = v2;
  +[SearchUIUtilities dispatchMainIfNecessary:v3];
}

uint64_t __52__SearchUIWatchListState_toggleStateWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsWatchListed:*(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a1 + 49)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (BOOL)isWatchListed
{
  return self->_isWatchListed;
}

- (void)setIsWatchListed:(BOOL)a3
{
  self->_isWatchListed = a3;
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (void)setWatchListIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end